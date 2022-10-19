Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD1706039FD
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 08:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbiJSGqT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 02:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiJSGqS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 02:46:18 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DBD852FF1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 23:46:17 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id o9-20020a17090a0a0900b0020ad4e758b3so16123407pjo.4
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 23:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S8mD6mI6lI/7wpdKMErF26k+n4gC2kWtBk6D8mH6HS0=;
        b=OxDQ12/DqCn3V2UEqQ5KCZAI+ePoTpyzOepLKp9DOOTWGu3ezQI7DUDDYipY8eqBZf
         E3tF0XxdA+pg2C29YqnXc1m1oyZhiW17gWsAXmEvB/dLQ1iCJWhMgNE3ew346Rbjk3M1
         sEiC2XModDPS+rmDr8cMzoGT/ElRPLDNObvrByrhnVzq0p0jAYqa04+SN0xWiu/aFcaO
         OUyi1pJX/RU4mvg+cF+7dB26IuNUhaPnx5CbmB2NV9DYiDvJf7tsUXbYWAolMGn0Eznv
         g0d6faNG3Ghwq7uuTMihdL7C7AgJTlr25Zbu2aHfrgsBKTQPQYhWqpZenQWciDUHkmt4
         ObSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8mD6mI6lI/7wpdKMErF26k+n4gC2kWtBk6D8mH6HS0=;
        b=tJjUavnYLMIZOUeW8kBGxSEfV56yir/ElWHA1GDy6Eg6DzE80X9AemFYX6YLOT+o9S
         y/Uxrhn9bed4VymhQv2XxyabO26mdbVQ06oJUgpPuLx+6uHXcmtpLKb2ZlmM1MYDrBs2
         7XoKX/OSGsC6zvcAXHTTKD66qHZ2bhvuGnf+xn9QnHGYkx/TT5JxUa6H7g2sZG1Hbaw8
         qpnbKg8ltzSmFvg9h2LuUkDq6102zzDcS5BGBZh3uxgLQ65WqR32+kTeYQHag/6rwYA2
         5PPMBiRSkIwSEg7tegEePEcj2GKaQg6iOAi0tunbLFGattqdqoC8csbO9l0w2MAlbgM4
         P/Iw==
X-Gm-Message-State: ACrzQf2tZJcMQj8ktsve5Jwy6tXnJjb3+e75nEuZgEtiRbpiWhBAw/4J
        HFxwYZbjv8EUw/WKvZWcA3kx2w==
X-Google-Smtp-Source: AMsMyM7mecSnLJqdFMO/0Bh2ma7Ssn+nrr96BL6SCfIiTo1hwk6rpmbydl2idVZcEfPpNps9B/qd7w==
X-Received: by 2002:a17:902:7043:b0:184:40e5:b5e7 with SMTP id h3-20020a170902704300b0018440e5b5e7mr6916754plt.98.1666161976526;
        Tue, 18 Oct 2022 23:46:16 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id 65-20020a620544000000b005636326fdbfsm10479707pff.78.2022.10.18.23.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 23:46:16 -0700 (PDT)
Date:   Wed, 19 Oct 2022 12:16:12 +0530
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
Message-ID: <20221019064612.p4gu33dm65rnjwl6@vireshk-i7>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <c8ef89c343a0c31e4132cc6757fdff8dec0d1669.1665744170.git.viresh.kumar@linaro.org>
 <Y01RqjgZINnkcyIC@sol>
 <20221018112204.l36wnimrqvexnvat@vireshk-i7>
 <Y06S5GCFYeaPEW9E@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y06S5GCFYeaPEW9E@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18-10-22, 19:49, Kent Gibson wrote:
> You should add "categories" and "documentation" if you intend to publish
> to crates.io.

In order to add documentations, should I commit documentation (created
with cargo) as well in libgpiod, so I get a link to it ?

> LGPL is probably not appropriate here, as the binding code ends up
> being part of the binary - unless you plan to package it as a dynamic
> library?
> 
> The licenses of your dependencies are:
> $ cargo license
> (MIT OR Apache-2.0) AND Unicode-DFS-2016 (1): unicode-ident
> Apache-2.0 AND BSD-3-Clause (1): vmm-sys-util

This is the license used by the user crate for libgpiod, vhost-device,
I am inclined to use this then, unless someone has an objection to it.

> Apache-2.0 OR MIT (8): bitflags, cc, libc, proc-macro2, quote, syn, thiserror, thiserror-impl
> MIT (1): intmap
> N/A (3): gpiosim, libgpiod, libgpiod-sys
> 
> IANAL, but one or more of those would be more appropriate than either
> GPL or LGPL.
> You, Bart and linaro(?) will have to come to some agreement on which
> license or combination to go with - it depends.

-- 
viresh
