Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC43E604453
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 14:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbiJSMBs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 08:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232087AbiJSMBD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 08:01:03 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D0F183E01
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 04:38:21 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so131369pji.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 04:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=00Owmv7riSW1IYG4YrC2eALtO9iSt29iM3A9tEfHuNA=;
        b=QPTpmzcNLhL57tNeGxi0t8V0u8mSkxTp9HrsbufzNFKZ1MRTGdCAOOsozSCdhynT6O
         0jHKcYmV7eo7mNv3kDIbGs2APZT4mtxi1qOHQM6MjbKp46BcRPrasmvSBmfbC5vUr0Xe
         w04++7Ob4xYyVA/OuAqSRuzzz4VBzAupeqD0QaXqN2Yp+RbXL3Xt5boZN39oW7zSToZq
         qBm2FLNNHXapIoJJIiAHsSJZwvy83VBVDFstGQz5ZXmnNe8YyB3DRXfQo5HqSYjAx3gb
         fRwi8QfxcAfPVMXxOB/tmIThGTMDV987Le8TI0kbNureXEjqmFnFwN52DzA2js5MKjrL
         O1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00Owmv7riSW1IYG4YrC2eALtO9iSt29iM3A9tEfHuNA=;
        b=G5mx9zfIXqaRb5UfqsqWLGvYP8n2fXEXEcq6ay+mK7eJw1zPKU77ImJk/49VUads4X
         UpiXVFGbNrPG5HOko2aHZI5zVZtE/2ENgIQJl73MUfCj6hGR4MjuSWKCW9rU80N+7tKd
         5KgnBoMFM1gfNBJrN/QP50NvrnoWv4bCt/AjNXi7dpXGx1JWqatFzlXVHBUYojjwhE5z
         anpt1FQgpbmGrcRzAwoiolJUQbtGPhDKxgRaHHKRiLuhQqRixaoGd42AsYi8pBUZIXtj
         n2OqqTtt/sbKYP5WLmKragOwVrMxVnLN/9iPubo/CneK0CedZLXHdzKzAlLhV7kHlFKP
         J2zQ==
X-Gm-Message-State: ACrzQf33/9rYnpSHo1NKCaIrjTt/YXm1QhmPjqGtTuP1yEDSntzixDqa
        iSK53eHrju7aAaeP1E5H2NU5ilc+1JKofA==
X-Google-Smtp-Source: AMsMyM4LAhK8pJsTDal1e3EI/Df4YjAw2rDCHaEOkFCNpQ/s5+p1W7PrReNtJ0kukVigrXRfK9nglw==
X-Received: by 2002:a17:902:b907:b0:178:2898:8084 with SMTP id bf7-20020a170902b90700b0017828988084mr7968385plb.140.1666178574516;
        Wed, 19 Oct 2022 04:22:54 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id s2-20020a17090a440200b001faf7a88138sm9785162pjg.42.2022.10.19.04.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 04:22:53 -0700 (PDT)
Date:   Wed, 19 Oct 2022 16:52:51 +0530
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
Subject: Re: [PATCH V7 1/8] libgpiod: Add libgpiod-sys rust crate
Message-ID: <20221019112251.oyfek3gjodyt67lh@vireshk-i7>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <c8ef89c343a0c31e4132cc6757fdff8dec0d1669.1665744170.git.viresh.kumar@linaro.org>
 <Y01RqjgZINnkcyIC@sol>
 <20221018112204.l36wnimrqvexnvat@vireshk-i7>
 <Y06S5GCFYeaPEW9E@sol>
 <20221019064612.p4gu33dm65rnjwl6@vireshk-i7>
 <Y0+lZ9qcNGX1Q/Of@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0+lZ9qcNGX1Q/Of@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19-10-22, 15:21, Kent Gibson wrote:
> That doesn't really work - you get a link to the files in github, not
> as a web site.  You need somewhere that will host those generated files
> as a web site.  You could do that with github-pages if you don't have other
> options.

I don't have other options for now, so it is github.

> When I've done that I would commit the docs to a separate
> branch, just for the docs, and have github-pages host that branch.

Okay.

> If you eventually publish your crate to crates.io you get documentation on
> docs.rs for free - and you can skip the documentation key in that case too
> - it defaults to the appropriate page on docs.rs.

Right, that I knew.

> I assume that would be the case long term - you just need to find
> someway to host them in the meantime.

I wonder if we should be doing this at all right now, or if required
only Bartosz should do it instead of me, once this is merged ?

Maybe we need a libgpiod username for that on github ? To make it
independent of personal usernames ? From what I saw, the website name
will be username.github.io eventually.

-- 
viresh
