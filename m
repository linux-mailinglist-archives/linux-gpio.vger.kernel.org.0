Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 946E67B3102
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 13:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbjI2LFJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 07:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjI2LFI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 07:05:08 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9A31A7
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 04:05:05 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5335725cf84so16580272a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 04:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695985504; x=1696590304; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hE/5aJGq7M14w3MHiClAMDxjNRXy4K1baIrj5e8KZ94=;
        b=utNvknQEIuxMXitIRO555c1kWo4y0NZdL9ZErs2/NDFTsqssRILhJ1tQoPD0JZOJ78
         WSl07eTAULrF38Dm2YeFlOHMhwHK7TcHaQBmLukTixxPrcOJ9bhIqTLYdDMe5PKXKCdk
         rJJLVxXVLZsJDSS6knwR3m1amhQP7bz5bf5sx20xIpre3q9Ej7rKhGmy5pqwiVedKate
         ynQXjrEc0UWeXBU557j+olCdjQ/M4weWUah8tU6zWeGj4Ix/dx4m13T6jAvmtc7mm7pt
         WioamAhghh3X7vMqFNflq1FsTtlu9wKysgVcDUBiWCbU8pVQnir8/pAfRFtISidHKjCO
         jPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695985504; x=1696590304;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hE/5aJGq7M14w3MHiClAMDxjNRXy4K1baIrj5e8KZ94=;
        b=rpgcUHDcL0jao5/cw8T/l1/+Wx7ZzAkh7Wq8rXGNE/4IZLkhLX285oRW1fs2TEjDGq
         UyZ1XQjawXfg/fIDSglbOehsHeGHP8ijIRCJKk70kXt5z+JbdW1mjMay69y/umjM66L+
         yEVub4nnBSAAbhpCk2116asuhwgXNW2oDEd3IKQllX5F2KpPlyrIrR+y6PfxOB66lfLw
         rI1eeWJsJMlZJ7rq5rIIF7wY8o8qFzchx26RbNQqlv1rg3iu4UiDJ+HMdGpJ8trsekVH
         8X58td0XfecEMuqHn7XL3NnGc/EOThh6PoCNndPwSK7Ts93FYRFzywd9HNo9s+9THqUW
         ilWA==
X-Gm-Message-State: AOJu0YyVfkZMI1Lf4L7vBM8ycbndYa6zUHtGNrvAXABiV3zoRXfUOGN7
        evnNS58M4faVhHmK4apGLVN5+Q==
X-Google-Smtp-Source: AGHT+IENx8IfYmbfN/gzJ2qasEKSKjQSHjtiriIzYxBPb1rqUPyD2Y5r28lmMLfhV7VjfxLj4yCLNw==
X-Received: by 2002:a05:6402:70e:b0:532:c72e:26fe with SMTP id w14-20020a056402070e00b00532c72e26femr3627774edx.10.1695985504179;
        Fri, 29 Sep 2023 04:05:04 -0700 (PDT)
Received: from localhost (i5C7438D4.versanet.de. [92.116.56.212])
        by smtp.gmail.com with ESMTPSA id c8-20020aa7c748000000b005288f0e547esm11146814eds.55.2023.09.29.04.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 04:05:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 29 Sep 2023 13:05:02 +0200
Message-Id: <CVVCOO4NN17R.3TUR5CODRZEK@ablu-work>
Subject: Re: [libgpiod][PATCH 2/3] bindings: rust: allow cloning line::Info
 -> line::OwnedInfo
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>
To:     "Viresh Kumar" <viresh.kumar@linaro.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
 <20230927-rust-line-info-soundness-v1-2-990dce6f18ab@linaro.org>
 <CVUKC1HXG1P8.13XIUCCXN95F0@ablu-work>
 <20230929105005.hssr5bgs7w5j24j6@vireshk-i7>
In-Reply-To: <20230929105005.hssr5bgs7w5j24j6@vireshk-i7>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri Sep 29, 2023 at 12:50 PM CEST, Viresh Kumar wrote:
> $subject: s/OwnedInfo/InfoOwned/

Whoops. Flipped that around at some point. Forgot to fix here... Will do
once we agreed on a naming scheme :)

>
> On 28-09-23, 14:52, Erik Schilling wrote:
> > On Wed Sep 27, 2023 at 6:29 PM CEST, Erik Schilling wrote:
> > > diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/=
libgpiod/src/line_info.rs
> > > index 32c4bb2..fe01a14 100644
> > > --- a/bindings/rust/libgpiod/src/line_info.rs
> > > +++ b/bindings/rust/libgpiod/src/line_info.rs
> > > @@ -58,6 +58,22 @@ impl Info {
> > >          self as *const _ as *mut _
> > >      }
> > > =20
> > > +    /// Clones the [gpiod::gpiod_line_info] instance to an [InfoOwne=
d]
> > > +    pub fn try_clone(&self) -> Result<InfoOwned> {
> >=20
> > Hm... I realized that we have `event_clone()` for cloning an `Event`
> > and `settings_clone()` for cloning `line::Settings`. Should better
> > stay consistent here...
> >=20
> > However, I think the name `try_clone()` sounds more suitable to me. Any
> > opinions? I could send a patch to rename the existing cloning methods
> > to `try_clone()`.
>
> IIRC, I did try to use clone() and try_clone() earlier for something and =
there
> were prototype issues, as they weren't matching with the standard library=
 and so
> had to innovate `event_clone()` and `settings_clone()`. `try_clone()` is =
anyday
> better.

ACK. I am not aware of any trait like `TryClone`, but yeah: `Clone` and
`ToOwned` do not work for the reason outlined in the commit message.

I will then add a commit to rename the other `*_clone` functions to
`try_clone` in v2.

- Erik

