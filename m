Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42076582016
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 08:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbiG0G0H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 02:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiG0G0G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 02:26:06 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBF51DA78
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 23:26:05 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id w185so15288954pfb.4
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 23:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aLGOqyPO/x+urXGUVpWB46qIn9W4Rib42ZRW8p8vwJU=;
        b=IHpL1UE+PFmgylT2Tfr+1vQYou69u0OIn+LzD5KKBdBCHgXAZMdmFUBB5quVxjLlJf
         NvjpN5wOof5hgqfSSxmfSM/UUDh2DNEbgY2t9j5DYKz7+tCh66LsyGahSnU6IqOM93px
         UktE9J8zQmhHOKSzYYAPfakstHHb5SGxmmG35FE2G5iaQeBl7piFBbgyGV+Fac728Egl
         +xnJQMfz6yLlHpvCPUtsoURvMEe11d1iNfsQkKtzZ90Y5qx4dRRMc4zkpozdXd8Rl+lS
         6iqrKa+SD0ZsWmer3ZGC/r/V+HIYc4XUpunY5UjHcwQuEaWsICDWJx/xpPT7h1ixdSyF
         mEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aLGOqyPO/x+urXGUVpWB46qIn9W4Rib42ZRW8p8vwJU=;
        b=2AEgCK1x4jRqqHRca24oLovOW2nClcDwSom9+DzbO664iY2uTuXOVDpbMbn0XEh2Mo
         j9dkSZKIXwRyBcWjLBT5Rgj/SlI0rjwz9cAwsEjyq5y10OBMACj9PcMH0CZQgo8Hyp0M
         eqxdcJLPNlhVGTrxH9lUdjKg8ey6X7o6AgZH9Bc37H6jwukRkqdNoArW3g48QLFc2vWN
         ZKIHhytdzuvlWQJ+jCHq66t0CzDGa6rgwY3+g7U9wgh9cThipvwkCwjzuruOCnkX5QxH
         /8Tudl7QS4XxoWT2PnJ8nvngHqxONYuIw81t1lkCmg3Re+5kVeuLNzilyzhpKlObBjeH
         BnBw==
X-Gm-Message-State: AJIora9CcnjVY9WhfzPL8MUKXAkACJ/wTCqacrCc3Yf5VrBQh7UwEG8c
        J650nP3CEeN4QiX5fx43H0w=
X-Google-Smtp-Source: AGRyM1ts2DGFDSILKSn2XD0dkpXhiXg0cvehc+B5qUE9Wz7wNgZU2uQX8Khbt06+wI0I5iogEYo3vQ==
X-Received: by 2002:a63:1e10:0:b0:41a:ee1c:290a with SMTP id e16-20020a631e10000000b0041aee1c290amr11586875pge.196.1658903164500;
        Tue, 26 Jul 2022 23:26:04 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id d17-20020a170902ced100b0016c59b38254sm5450834plg.127.2022.07.26.23.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 23:26:04 -0700 (PDT)
Date:   Wed, 27 Jul 2022 14:25:57 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 8/8] libgpiod: Integrate building of rust bindings
 with make
Message-ID: <20220727062557.GA111905@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <584910baf342bee3511361c3e486ad4f3e5437f2.1657279685.git.viresh.kumar@linaro.org>
 <20220727025903.GH88787@sol>
 <20220727061824.lune6xhtv2hpgidv@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727061824.lune6xhtv2hpgidv@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 27, 2022 at 11:48:24AM +0530, Viresh Kumar wrote:
> On 27-07-22, 10:59, Kent Gibson wrote:
> > Wouldn't build for me on a Debian bullseye VM.
> > Apparently bindgen requires clang to find the system headers [1][2],
> 
> Right.
> 
> > and
> > there is no dep check or warning about that.
> 
> Ahh, I need to add that somewhere then.
> 
> > Also not sure why the build wanted bindgen, as by default it uses the
> > pre-generated bindings?
> 
> Did you enable tests as well ? That enables "gpiosim", which enables "generate"
> and bindgen will be required.

Ahh, yeah I do --enable-tests as well.

> 
> I thought it will be better to build bindings everytime for tests.
> 

So you can't run tests on those platforms where bindgen is problematic?

> > Anyway, for reference this was the build error without clang installed:
> 
> Did it work for you after clang was installed ?
> 

Yeah, all good once clang was installed.

Cheers,
Kent.

> > 
> > ...
> >    Compiling thiserror v1.0.31
> >    Compiling libgpiod-sys v0.1.0 (/home/dev/libgpiod/bindings/rust/libgpiod-sys)
> > error: failed to run custom build command for `libgpiod-sys v0.1.0 (/home/dev/libgpiod/bindings/rust/libgpiod-sys)`
> > 
> > Caused by:
> >   process didn't exit successfully: `/home/dev/libgpiod/bindings/rust/target/release/build/libgpiod-sys-0fb8ce8170c88d8f/build-script-build` (exit status: 101)
> >   --- stdout
> >   cargo:rerun-if-changed=wrapper.h
> >   cargo:rerun-if-changed=../../../lib/chip.c
> >   cargo:rerun-if-changed=../../../lib/chip-info.c
> >   cargo:rerun-if-changed=../../../lib/edge-event.c
> >   cargo:rerun-if-changed=../../../lib/info-event.c
> >   cargo:rerun-if-changed=../../../lib/internal.c
> >   cargo:rerun-if-changed=../../../lib/line-config.c
> >   cargo:rerun-if-changed=../../../lib/line-info.c
> >   cargo:rerun-if-changed=../../../lib/line-request.c
> >   cargo:rerun-if-changed=../../../lib/misc.c
> >   cargo:rerun-if-changed=../../../lib/request-config.c
> >   cargo:rerun-if-changed=../../../tests/gpiosim/gpiosim.c
> >   cargo:rerun-if-changed=gpiosim_wrapper.h
> >   cargo:rustc-link-lib=kmod
> >   cargo:rustc-link-lib=mount
> > 
> >   --- stderr
> >   /usr/include/string.h:33:10: fatal error: 'stddef.h' file not found
> >   /usr/include/string.h:33:10: fatal error: 'stddef.h' file not found, err: true
> >   thread 'main' panicked at 'Unable to generate bindings: ()', libgpiod-sys/build.rs:42:10
> 
> -- 
> viresh
