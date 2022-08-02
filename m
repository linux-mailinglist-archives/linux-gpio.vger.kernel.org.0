Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BED3587953
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Aug 2022 10:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235114AbiHBIuO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Aug 2022 04:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234183AbiHBIuN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Aug 2022 04:50:13 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C865337
        for <linux-gpio@vger.kernel.org>; Tue,  2 Aug 2022 01:50:11 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id s206so11818443pgs.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Aug 2022 01:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OnX1GqgjFfFvc7hMJFPmp1cPGnoy7UoxsZ5ByOjrZhI=;
        b=lPt+pz8uF2WSASmljF0kXjXFSpu3206ZN7/48/EwFtMasVqJFPROuaCDVNoonm91qn
         DAFPoQv/wUSitLSrkdAEnsVZN7HrC4ucRcFgufK+6zynchyq9HpLTq5/34XW0qN3sv04
         A2aT/YlmUptsiBZXYIRXyRR8FhEdRz7BGb/dBU6Wz3LB0CQ6o6/sDqCk6WEGDWWTvAWH
         NxBHtNfV4ssNfegNxhOaV8ZX3SFeCm/lVVAa29YOE/nKrp7aXYz8CTPqjvQ2FFB8koRp
         G3vZLxnjAmGJCIizOuHMwgeJ/u6w49gna6N6belWGN24uhJ+i3eq/P7Z4OGuxE8DYo7b
         i6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OnX1GqgjFfFvc7hMJFPmp1cPGnoy7UoxsZ5ByOjrZhI=;
        b=j5kQW0+5+zn/zGc6s843Px+c4P9cTLHCs44J7xJER66RA8FSvClidb++HleQwOKbQF
         04gQZwG3kKr0Xw2FegNxCWR2s0Bax/JXmfs/JqZH9Wm/A3S/dx5WZe0hp6I/Nh9Sh+x2
         yCa1dw9pSc2Z/fRJ5S7WZyKhM15gTYR42LAciriXFvsUPxxlAFCMgFYMbbUj7fahU6DC
         bjmJ1MsJLWjPpoujszfgoU7bnOxMWAkvXm9MKeelcHAGvVCVOgGYshZIZeaxm9YSDHRd
         3xtmzTmal6mv+Qt7F+OKo4wahjq1+1ejeZqk8Crr5VxdNNCSan3pPDkftHc/UpCyBGLU
         4taQ==
X-Gm-Message-State: AJIora9daKoVdWv41NocACXDrsaoTLBCp/fHm4kCuuK5XY0PXcJ1Nml5
        9W+M3ns4U7z6iv5rUlDlG9nW+Q==
X-Google-Smtp-Source: AGRyM1sjvubOiUuX39s1crLjnzQxUfdcsUG66CMnIPiINhCgYkh6hCOJmOuySeis5DuKmYX1ebU8JA==
X-Received: by 2002:a05:6a00:1ac8:b0:52b:a671:2ea8 with SMTP id f8-20020a056a001ac800b0052ba6712ea8mr20558068pfv.16.1659430210825;
        Tue, 02 Aug 2022 01:50:10 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id ft18-20020a17090b0f9200b001f2f64eada6sm10219764pjb.51.2022.08.02.01.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 01:50:10 -0700 (PDT)
Date:   Tue, 2 Aug 2022 14:20:08 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 1/8] libgpiod: Add libgpiod-sys rust crate
Message-ID: <20220802085008.evxb3mipx4rply76@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <44ee8c36d58049de2f653494e16cba04b198fb35.1657279685.git.viresh.kumar@linaro.org>
 <20220727025706.GA88787@sol>
 <20220727045158.z72byax7pc7kokca@vireshk-i7>
 <20220727051743.GA108225@sol>
 <20220801121106.hc2mzippvby5ujg4@vireshk-i7>
 <20220801155615.GA84978@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801155615.GA84978@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01-08-22, 23:56, Kent Gibson wrote:
> The Rust bindings themselves should be building against the local build
> tree, so well known relative paths.

Right, when we build everything with "make" we better use the already
built library. I agree.

> For users, require they have libgpiod installed and use pkg_config to
> locate it?
> 
> Is that what you mean?

Since we need the latest APIs, we can't trust the packages provided by
distributions for now. i.e. "apt-get install libgpiod-dev" won't
install the latest stuff we need.

The only other option to get it working in environments like
rust-vmm-containers (which tests the vhost-device crate currently) is
to build / install libgpiod first. As I have understood, people don't
really like it there (Maintainers of rust-vmm-containers) as this will
have further dependencies and require more tools.

I even tried to generate the libgpiod-sys bindings on the fly first,
but it required more tooling and there were issues with Musl build
specifically. They suggested to use prebuild bindings as a solution,
which I have now.

What about we have two separate features:

- "default" one will be used with "make" and will use prebuild library.

- "generate" one will be used by user crates and we will build the
  files there like it is done now.

> Else, how do other Rust crates wrapping dynamic C libraries do it?

I think for standard libraries that are stable, the -sys crates just
contain the pre-built bindings and wrappers and expect the library to
be already installed.

-- 
viresh
