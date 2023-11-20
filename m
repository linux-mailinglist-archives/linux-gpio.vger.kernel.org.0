Return-Path: <linux-gpio+bounces-263-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2051C7F16B7
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 16:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2E0BB21316
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 15:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF371A279;
	Mon, 20 Nov 2023 15:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sYPcyH8F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C95493
	for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 07:06:55 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6cf65093780so2589272a34.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 07:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700492814; x=1701097614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vVhCBw4UGnbOTaPublp+dT13ul5pmR1HyKDFK4Q5L8=;
        b=sYPcyH8FC2/TI3GRqENHP2USiyIzWe5ZfI2yrsR2/DgUI6kBqoYsCfcRFRH+Zba6nK
         gAtwKNGmZPJJ6zomhngB6MnD8rpeNDe2VeIGBQZiFuNLmtf/YqNkpcB0IpIQXve1lxoW
         K3c79JPUfd0g1GZemvXRlEFLlNVS6QzVwbZk5Ig+QQ9URuvpR20k8T5AsGbKjbsoI01r
         WunVKmvbsEpnpGAw/jHpuJWprAgq9FwK7+mtjvkNRKWCSWqsZXLpU8Wy0B6PPFmNiAnN
         JBt65uB3NKy24Rg9i6aPRBx2ZEsQ8X7cGLn8/7f0sGAm1DcQLSMVBnSG9zRWmcgflk3u
         sgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700492814; x=1701097614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vVhCBw4UGnbOTaPublp+dT13ul5pmR1HyKDFK4Q5L8=;
        b=c9o8qxLSz+4yncBry98T+O8V1rqNYCYV+NMhqFLSrOqsAuDw/NT5VEiwuUl1Msn/lS
         Zjmlb0JCYbANeUEB2XdC9EOeLJds7Pud+VsIzU/sNk4OzfY2C8XqMD/ky53VY6WFiKdz
         pRaZ0hpWsSXMe7cEyDPl2BAiVfXNPkvTFpopadCo/yts+cAe567IML0XwXLGFPYohtI6
         NwIaEbB6IZC3ovMdEXFn+k0EwI22preXnNaAJCMRmXmEAs1g4mDXszCJvqSu99JIQ9e8
         5BL+pGagqpTxiNuQ5rszIJjB5QKbJoMoxtJB0j/VrZ6idNiCMdhf6PDuSv315cryDt++
         dAcg==
X-Gm-Message-State: AOJu0Yw/58kQBQvGkmZAVVLWuG09pNaJWsLots1Ji3XXEtWIhF1XsQSz
	deGBufio18kbBmTBhYyX25Xv+ykxWjmXKspA1mg4TJRZTwZkHw6q
X-Google-Smtp-Source: AGHT+IHiOw/GOhoqSglQEq4xwFJxVajS26VlN4i3Ic8j6+NDTi7W6YgdeZC24XKyFtN4IUFTWod/HG5DRe7EefXqyME=
X-Received: by 2002:a05:6358:7e14:b0:16b:c63d:5dfe with SMTP id
 o20-20020a0563587e1400b0016bc63d5dfemr7829578rwm.16.1700492814326; Mon, 20
 Nov 2023 07:06:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115165001.2932350-1-brgl@bgdev.pl> <CACRpkdbDny8X3WB_qJ4h_vbwrjno5ytAtNMgTeXg4jpegdUH2w@mail.gmail.com>
In-Reply-To: <CACRpkdbDny8X3WB_qJ4h_vbwrjno5ytAtNMgTeXg4jpegdUH2w@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 20 Nov 2023 16:06:43 +0100
Message-ID: <CAMRc=McZJzdj04Ckf_ygDhWNN2JcbTfY+yefOZSYx_nTE_Jpjg@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: don't use gpiod_to_chip()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 2:43=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Nov 15, 2023 at 5:50=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Let's start working towards removing gpiod_to_chip() from the kernel.
> > Start with pinctrl. The first patch should go through the GPIO tree
> > and become available through an immutable tag so that we can get more
> > conversions in this cycle elsewhere.
>
> Fair enough, maybe an immutable branch with all three patches?
> Probably best to merga all three into both subsystems I think.
>

Nah, I don't think I need to pollute the GPIO tree with every pinctrl
patch. It's enough to just merge the first one into GPIO and you do
the same in pinctrl.

Bart

> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

