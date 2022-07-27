Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95D3F581F7D
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 07:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231565AbiG0FaS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 01:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiG0FaR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 01:30:17 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34951219E
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 22:30:16 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id bf13so14995823pgb.11
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 22:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Yyq06DXaGBjbeLbSoLnqp3AVgP+WlXPrSL0XAAx7g4A=;
        b=P/Qfp9CILnPpNe8cwBjGGGWA2aMvYOkbJpqCSDo5OplqQDKdFTqcsD4VXVQRfWxdpj
         dt3kvbgHcRGfABQF4Q1+ddEcSWhvBOkQraM5c5WVCknVJM25MSyovW+MHW96S5do2VSs
         Z1ogr6Zg0pYlqhI9uqpUV8C7OEEfT/aa/p5l31b79egOdvnWIoZYsA/gMZjybN+JxroI
         WqQr3EgUD74CPQoHZymiMg12oqHqE3Lsk/8v3c/REr4uZodTros5dmAD794OJ38YTMaE
         jbJ1uTOS1dymd8MfzmNCMhCIkPL39LeO9O272K6dCFFNT+VoxvmsFxcwEDkLTeGJ6cZB
         Dtfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yyq06DXaGBjbeLbSoLnqp3AVgP+WlXPrSL0XAAx7g4A=;
        b=c+5rIpvxohqqoBrs5NoI5FDFwb3If2kdVCQ9zEQzRYgJr9XGyYsXP1L9skDocdTWS0
         Gg83SWNz4Wm2CGgZZLUbX+d5jeyCbKSk//XWiEIVEhkEo+GAo7gQpge/wZAL7Z6KG6KT
         clZjAGeN+AQopf/IOBAp5xAtnib5wSIrSQWY2fV2fWqeODSdaY0x1z0mUkXu69JaxrEe
         oOj+gLQVERi7P/AD+U0zi1rwk2jbuUmzYuLWqivV3XBdnLGOUwjRwQ7MT8WXm1DqmDjg
         HKwJk/P0GGRkX+ApzVNyawicOJX5+WB8F76kuWk3nRMDMBCc9OkLv53wCClPVGkOERW3
         cULw==
X-Gm-Message-State: AJIora/DnQAbVpMqykxvLVvWRaODZGIzfjb1AncVGM1M25KHIpLiYnjQ
        m3BmD5sif4Q8gRMpsme7jrO8Gw==
X-Google-Smtp-Source: AGRyM1tjufrHVS4Jw6pn+IS0oDLkP7gF/YE7KSCDaT7ZdWmO2ZmO20uP0TJ9GNvd6IFDFBgt2BN/YQ==
X-Received: by 2002:a65:4c0b:0:b0:415:d3a4:44d1 with SMTP id u11-20020a654c0b000000b00415d3a444d1mr17676193pgq.191.1658899815665;
        Tue, 26 Jul 2022 22:30:15 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c10d00b0016bfe9ab1f3sm12594804pli.36.2022.07.26.22.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 22:30:15 -0700 (PDT)
Date:   Wed, 27 Jul 2022 11:00:13 +0530
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
Subject: Re: [PATCH V4 3/8] libgpiod-sys: Add support to generate gpiosim
 bindings
Message-ID: <20220727053013.4jbeaokuou5qrqoa@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <9cc6890c1039f75eadb77a1c9c16bf947ec9eb9e.1657279685.git.viresh.kumar@linaro.org>
 <20220727025738.GC88787@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727025738.GC88787@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 10:57, Kent Gibson wrote:
> On Fri, Jul 08, 2022 at 05:04:56PM +0530, Viresh Kumar wrote:
> > Add support to generate gpiosim bindings.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  bindings/rust/libgpiod-sys/Cargo.toml        |  1 +
> >  bindings/rust/libgpiod-sys/build.rs          | 19 +++++++++++++++++--
> >  bindings/rust/libgpiod-sys/gpiosim_wrapper.h |  1 +
> >  3 files changed, 19 insertions(+), 2 deletions(-)
> >  create mode 100644 bindings/rust/libgpiod-sys/gpiosim_wrapper.h
> > 
> > diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
> > index 77f82719d269..73b6761d16dd 100644
> > --- a/bindings/rust/libgpiod-sys/Cargo.toml
> > +++ b/bindings/rust/libgpiod-sys/Cargo.toml
> > @@ -9,6 +9,7 @@ edition = "2018"
> >  
> >  [features]
> >  generate = [ "bindgen" ]
> > +gpiosim = [ "generate", "bindgen" ]
> >  
> 
> Should gpiosim be a feature or a separate library/crate?

It can be. I don't have any objections to that. It will add a bit more code,
i.e. a libgpiosim-sys crate in bindings/rust/ directory, but that's fine I
think.

> I would expect it to be a separate crate and for libgpiod to have a
> dev-dependency on it (it is only required for tests, right?).

Yes.

> > diff --git a/bindings/rust/libgpiod-sys/gpiosim_wrapper.h b/bindings/rust/libgpiod-sys/gpiosim_wrapper.h
> > new file mode 100644
> > index 000000000000..47dc12a87917
> > --- /dev/null
> > +++ b/bindings/rust/libgpiod-sys/gpiosim_wrapper.h
> > @@ -0,0 +1 @@
> > +#include "../../../tests/gpiosim/gpiosim.h"
> > -- 
> 
> Why bother with this wrapper - just bindgen that header directly?

Whatever we decide for wrapper.h, will be done here as well.

-- 
viresh
