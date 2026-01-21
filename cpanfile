requires 'perl', '5.008001';

# configure phase
on 'configure' => sub {
    requires 'ExtUtils::ParseXS', '2.21';
    requires 'Module::Install';
    requires 'Module::Install::XSUtil', '0.39';
};

# test phase
on 'test' => sub {
    requires 'Test::More',        '0.98';
    requires 'Test::Output',      '1.01';
    requires 'Test::Exception',   '0.31';
    requires 'Test::Mock::Guard', '0.08';
    requires 'Test::Flatten',     '0.11';
};

# author test phase (開発時のみ)
on 'develop' => sub {
    # xt/ 以下のテストで必要なモジュールがあればここに追加
};
