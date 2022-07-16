Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8EC4576DDF
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Jul 2022 14:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbiGPMXw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Jul 2022 08:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbiGPMXu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Jul 2022 08:23:50 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FF42649
        for <linux-gpio@vger.kernel.org>; Sat, 16 Jul 2022 05:23:49 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id g4so6671900pgc.1
        for <linux-gpio@vger.kernel.org>; Sat, 16 Jul 2022 05:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rltB3rJ26pK4zrQoe+CUrdsr4GtZgafaRvwo9e8skMc=;
        b=nuPzAkFQD+X+Mxxjg6AKQfZSjHiXQyFLdz0snpcruhY4fsGWySK/UKyHi9UVHcTRCa
         1ajg0+iHzx0gn1hVf3MdvwKplWrGyKyu0NHEe87OUgcOtWNt+WjfkHTGTIoEGej+mpfo
         2VM2mVDKB45LteE8qGKKfBRXMirsZnNCibjOy9MGQdReL2stASoCWCDzO0Z1Ci+2Q4C9
         PxPRfXzx3mGqUrduVvtbdPyRV6X3NFJS/ZUgjLymE8fvjD0mrE571YV3z+ZwtpLgyrex
         r1xtI3qxBYbStf9hb3UC3xd+0xKD87HoeNqT2UZcZxClAKw9Ho7OwFnwh38Au+m7O4BA
         oYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rltB3rJ26pK4zrQoe+CUrdsr4GtZgafaRvwo9e8skMc=;
        b=Pm6m7FdGBCd7wz7ooktW0ZmH3Pfqm9tbjhzErPeGxsmdnxe/hEh9RQAJcppD1lBidB
         eDO77o54PzbaQUEbs+inX6fvyrbtAOmkgKjk0yLlkczeHRKuw05bvDtzaDgtAjLllqAW
         ONxZZeyx7kxo8FdJwH3KneMGHTJNMhBrWt0MyeTQ4XvelixQzNBGoAp1yodVGdPGphCq
         QDFgeLnCq5PnCT4ep9WDuoVe1UoVbJMYGivtFf5lqFfwJZtgproIvAhhoC6AwMeD9EU3
         Ny5UmfIsUE+moRJdvi9LMvg1Nt+wdTyHvOLBEKzSkYZoNGkYbbr+5iszugJbLMcRafWO
         lh5Q==
X-Gm-Message-State: AJIora/TP5jMDrh3qNNTMuVfQv0poCNvSRRW+fPMEgrq79ol43KRtR56
        teNTfqL06SuXA4qirNDQtX4=
X-Google-Smtp-Source: AGRyM1uHnXEc7J+GwqGbt9kIPWumm0A+oDENsBFErAF5lTMyi+WwBtTH3U1xAcJ3qD+yX++bf68jSA==
X-Received: by 2002:a63:f58:0:b0:416:492:267d with SMTP id 24-20020a630f58000000b004160492267dmr16226656pgp.22.1657974228827;
        Sat, 16 Jul 2022 05:23:48 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id y9-20020aa79ae9000000b0052ab8525893sm5882843pfp.142.2022.07.16.05.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 05:23:47 -0700 (PDT)
Date:   Sat, 16 Jul 2022 20:23:40 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 0/8] libgpiod: Add Rust bindings
Message-ID: <20220716122340.GA106336@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <CAMRc=MdLJ_uM_Dy=L5nb-5HVhMFcixaVpD3WQvrDgp8s2bUW9w@mail.gmail.com>
 <CANiq72mZM1OYb27z63aEtzNJ+7WuzL+EwBqqoj5xBeTfd1LT9w@mail.gmail.com>
 <CANiq72=sKvuaFeOpOwfcafeq81YG7paALPv3rU6=sO__O4zycA@mail.gmail.com>
 <CANiq72=9ARaKRdszvbfC4fr3BkYQz8r6tjTYzkOr9EsN5xma-A@mail.gmail.com>
 <CAMRc=MesukZX=byZMJM-nLWXoF86O6M2KdfimPhq823G4+YeTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MesukZX=byZMJM-nLWXoF86O6M2KdfimPhq823G4+YeTQ@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 16, 2022 at 12:43:58PM +0200, Bartosz Golaszewski wrote:
> On Sat, Jul 16, 2022 at 11:43 AM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Fri, Jul 15, 2022 at 9:27 PM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > >
> > > something like `cargo --no-run` as a normal user).
> >
> > Sorry, that was intended to be `cargo test --no-run` (and the test
> > binary will be in `target/debug/deps`). Also note that is only for the
> > unit tests, though, not doctests. It can get more involved for those
> > if you want to avoid to run Cargo/rustdoc as root.
> >
> > Hope that helps!
> >
> > Cheers,
> > Miguel
> 
> This does seem to build the test-suite but there's no single
> executable in target/debug/deps.

As does providing the --enable-tests to configure, btw.

> Instead it seems that every test
> section gets its own executable. Does 'cargo test' run them
> separately? Or is there a single binary including all of them
> somewhere else?
> 

AIUI 'cargo test' builds and runs those tests individually.

As we need to run the integration tests as root, and cargo doesn't play
nice unless you install it as root, and the executables include
md5(?) hashes in their names, it is a major PITA to run the full suite
as root.  Unless you do everything as root.

Anyway to get those names from cargo?

Assuming the gpio-sim module is already loaded, is it at all possible to
run tests as a low privilege user?  e.g. udev rules can be added to chown
the /dev/gpiochips into a gpio group.  Is it possible to do something
similar for the configfs and sysfs for the gpio-sim?
Or do we need a gpiosimd that will allow a user to launch and control
sims without being root ;-).

Cheers,
Kent.
