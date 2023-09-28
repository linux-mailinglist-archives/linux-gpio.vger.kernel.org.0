Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B67517B1CFF
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 14:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbjI1MwH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 08:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbjI1MwH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 08:52:07 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43729139
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 05:52:05 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9ae75ece209so1496074366b.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 05:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695905524; x=1696510324; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wH1jWkqQOZ+vGqi02z+SlQPfv6tGuaM+OJIz8kNh1lw=;
        b=uBBqRKlSAyyMyic8tEokKosMDmZtKcy+eHyBMFjLHqEVkeL0eXi5lrGPpSe9pZuns7
         hTyV0li9C2c5HUqFc/gwSN9Q8TBsJMlLrZLHobvZ5drTNVPr70mn3QUzGrAi5UM65XWE
         r1t/ybHMD42Zj3khg4x8rseAtYM7576aKsgwYLy/iVzGffB/EQimg0opFQejqOVlmC5U
         6oBtHoJh7u/EGI1I7uzZlLWPPY0MA3h9lXJdexIk30rDCVE4XDlgoT/9+b1g2C7DiimU
         /nR2gcKOihEXdVmDOp7eH/VeeajqXwvcahF0dWVtJxacQ8kFSzfoK/M3C4DNuvnzc8t7
         VE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695905524; x=1696510324;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wH1jWkqQOZ+vGqi02z+SlQPfv6tGuaM+OJIz8kNh1lw=;
        b=FCpvUz32bwVfv4A0DEMiT0+L0MKqwTZ9cbs7CnwwOEuZDA3aN44KENseyhpK9oS2mp
         9wk5g81wFyUAuuPdv0Yl183L6zM9HhEm50U6wY9ovCBcn7rSS/6tKvN4T+dMokGgsdpi
         N3JsSiSSC570dWIUrYSeL4CiQivhUzScS+hthMSz/4F8zjeW/l6uxVieTQSxXF3k3IUp
         ZiEMjut6C4RYa2/k5obBJ45anD/r3ohUrQ1WOU4/j5zikmySP3fRzS4eNvdMtuYq0qC8
         M2f6hnfkSkLvyFFohRCH1uUwRbK6DUqyUO+kQJOg+LxbLgd3kas8Q8oSHxBfhc8Wt8vn
         jEZA==
X-Gm-Message-State: AOJu0YwW+XVzEh0k6suJdxKvXc5Nho+dPjQuLvH6xSY8u52C8duquGwv
        D6ljP5IY8SKS5W7dsjnsHnMA6w==
X-Google-Smtp-Source: AGHT+IHHTmkuut85qjVQltwmZGZuDc8YVGNtCNfDPFpjO9CeaL+xauHWqSUnLjSPDpp+cs7/gkdp7g==
X-Received: by 2002:a17:906:5393:b0:9a1:f73b:90ce with SMTP id g19-20020a170906539300b009a1f73b90cemr1184522ejo.54.1695905523531;
        Thu, 28 Sep 2023 05:52:03 -0700 (PDT)
Received: from localhost (i5C7438D4.versanet.de. [92.116.56.212])
        by smtp.gmail.com with ESMTPSA id l25-20020a1709066b9900b0099cc36c4681sm10787223ejr.157.2023.09.28.05.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 05:52:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 28 Sep 2023 14:52:02 +0200
Message-Id: <CVUKC1HXG1P8.13XIUCCXN95F0@ablu-work>
Cc:     "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>
To:     "Erik Schilling" <erik.schilling@linaro.org>,
        "Linux-GPIO" <linux-gpio@vger.kernel.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH 2/3] bindings: rust: allow cloning line::Info
 -> line::OwnedInfo
X-Mailer: aerc 0.15.2
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
 <20230927-rust-line-info-soundness-v1-2-990dce6f18ab@linaro.org>
In-Reply-To: <20230927-rust-line-info-soundness-v1-2-990dce6f18ab@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed Sep 27, 2023 at 6:29 PM CEST, Erik Schilling wrote:
> While one would usually use the ToOwned [1] contract in rust, libgpipd's
> API only allows copying that may fail.
>
> Thus, we cannot implement the existing trait and roll our own method. I
> went with `try_clone` since that seems to be used in similar cases across
> the `std` crate [2].
>
> It also closes the gap of not having any way to clone owned instances.
> Though - again - not through the Clone trait which may not fail [3].
>
> [1] https://doc.rust-lang.org/std/borrow/trait.ToOwned.html
> [2] https://doc.rust-lang.org/std/index.html?search=3Dtry_clone
> [3] https://doc.rust-lang.org/std/clone/trait.Clone.html
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
>  bindings/rust/libgpiod/src/lib.rs         |  1 +
>  bindings/rust/libgpiod/src/line_info.rs   | 16 ++++++++++
>  bindings/rust/libgpiod/tests/line_info.rs | 53 +++++++++++++++++++++++++=
++++++
>  3 files changed, 70 insertions(+)

[...]

> diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libg=
piod/src/line_info.rs
> index 32c4bb2..fe01a14 100644
> --- a/bindings/rust/libgpiod/src/line_info.rs
> +++ b/bindings/rust/libgpiod/src/line_info.rs
> @@ -58,6 +58,22 @@ impl Info {
>          self as *const _ as *mut _
>      }
> =20
> +    /// Clones the [gpiod::gpiod_line_info] instance to an [InfoOwned]
> +    pub fn try_clone(&self) -> Result<InfoOwned> {

Hm... I realized that we have `event_clone()` for cloning an `Event`
and `settings_clone()` for cloning `line::Settings`. Should better
stay consistent here...

However, I think the name `try_clone()` sounds more suitable to me. Any
opinions? I could send a patch to rename the existing cloning methods
to `try_clone()`.

- Erik
