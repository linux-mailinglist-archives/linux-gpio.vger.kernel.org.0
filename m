Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80F1D62D8A7
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 11:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239622AbiKQK7X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 05:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239657AbiKQK6z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 05:58:55 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E18233A9
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 02:55:37 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso1571753pjc.5
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 02:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2KcGCbAaGdiT6sEDQG/xDSsopM/ZjKY8RlnSjb3J8N8=;
        b=yh5ZoaT6Fh/m/eyzg9rvdEIKnfgv6pRInRQnxkX0SY915tRUNvRKC12kofklGqmhV4
         m2yucqd2QKJynKAjFCh0Jz7fveh9+F0IVFnCcIoobBvJcX+tLY4CGQuTKcV8Sr+3vp/o
         xo38Wd6H8XlndB+TRohXLW0Tm5nml7Ken0mjnYb3aIhYDK0+1lWMAxwmnWBb4dX9+fMr
         iBECSP2QZ5pEiLkDpe4E9GuRNDOgvIVrkzB5tczxFkO+TUqN4n19a1m/mHzmXER7BhmO
         pWpLaxntPauYMQ9OrW4qPdk2obIe6Lu1PBrkqpYE0CWywQDgu0BBqw692k7P48aJMEP1
         Rq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KcGCbAaGdiT6sEDQG/xDSsopM/ZjKY8RlnSjb3J8N8=;
        b=5i7xmzl8knxXs0pFREK6kwDjTRrOj0+dVi7sGhsnh8GYVjjWcJ9DIufbwdJM0hTDtk
         Nyug//KPUb/ANrtFGr8jKfx2ceXL8HL9qhKOran8GW6fqJ0LqCsdmtpUAps3bT7cKvD1
         KlMiTUwv0Y/arVKwn32CoEy7OZdlF9uhsKUudt8eoCkEiAfwesIbOWMRfx30XWXrdP4G
         v/l286RPmF3rdWPAuc9lIKmqhhmMwsROIQN55ZUVyFY/6jE7KyWWie//9iUpFbNstcl+
         iFhK9sq5BgH/QSRXcJI0/O9N+B3hMuhHPSv2o/KOA52FHCvSRTN5SMialQTyAnu1cMYz
         Xf+A==
X-Gm-Message-State: ANoB5pnIKnbIzaq432Xz4+LtfSAsgQB7tUMIFkcooZyHSKJFPJIK4Xwo
        Eh5IErm1OZSY0bpqRCbnLTs0Rg==
X-Google-Smtp-Source: AA0mqf5wZVVSvcyhlRMl6VRaw1BK1vBWj4R3KyVppk2crZ382m6qbg6nwxaxWSlrhh1GOawfdd4HGw==
X-Received: by 2002:a17:903:428b:b0:188:f42e:6a90 with SMTP id ju11-20020a170903428b00b00188f42e6a90mr1218333plb.127.1668682536701;
        Thu, 17 Nov 2022 02:55:36 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902bd8900b00176d347e9a7sm941725pls.233.2022.11.17.02.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 02:55:36 -0800 (PST)
Date:   Thu, 17 Nov 2022 16:25:34 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
Message-ID: <20221117105534.shhm4ib2aukj7d3e@vireshk-i7>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7>
 <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7>
 <CAMRc=MeOVWV=dp_ytxazwoWq4JW1dbr5mfEvQVYFxe-HYgKn_g@mail.gmail.com>
 <20221117104006.wvpuenedh7wqsjjj@vireshk-i7>
 <CAMRc=Me3NBDicrTenfsZ97+T28QwQL8SfZsM=ECM=i=1sqHr+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Me3NBDicrTenfsZ97+T28QwQL8SfZsM=ECM=i=1sqHr+g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-11-22, 11:48, Bartosz Golaszewski wrote:
> Let me propose a different solution. When preparing release tarballs
> with autotools, certain files are generated automatically that go into
> the tarball but are never part of the repository. This way developers
> don't have to deal with the automatically generated files polluting
> the repo while end-users get a tarball with less dependencies and
> reproducible results.
> 
> It's called the dist-local hook in automake.
> 
> Does it sound like something we could use here?

These auto-generated bindings are used only by the code present in
bindings/rust/libgpiod/src/, and are never visible to end user code.

The end user will use the new interface provided by the libgpiod Rust bindings
instead and that works over the web and will be picked from libgpiod's git tree
or crates.io (later).

Not sure how the tarball solution will work here.

-- 
viresh
