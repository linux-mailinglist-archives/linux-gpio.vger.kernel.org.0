Return-Path: <linux-gpio+bounces-20157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D305DAB6E2D
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 16:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1E257AD28D
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 14:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CA61ABEA5;
	Wed, 14 May 2025 14:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cg00KlEV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BF219D08F
	for <linux-gpio@vger.kernel.org>; Wed, 14 May 2025 14:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747233040; cv=none; b=OmrbA+ieTN6J0w2r0hxtVnWKeM0cOnO6EiJH24hlW2iM7cS9CVUVe6aLJWf8ZbTSjPnbCVNYZvoAORhWwxbC9eBBquBiGy6QZTNoDsg9WoAleaGuOMq7I/OgA/cKw3pj/sq+4r0ABFVs6+o4SyQCg3X7usVX2nrWCysBzQDGKzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747233040; c=relaxed/simple;
	bh=TpqI7/UstRjD1t3hPg2je7OSJ+mR5sn9M/MPI9l8Hcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KUPq5ZqJYwgb243rFOjaZBydphMQ6gnz/uai1wb2tTcdh5wY7JTl/qfi6+fVDZOPGJqpR/wiSWbLePzvmum5EB7UDZU2VTZ4hleAU2A/yUgdh/yW/bIg5FidqbVXJ82s4VTtP374P+fBpF7k/C8UzqjFmlWN5ZceRqGsNr2DjMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cg00KlEV; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-403407e998eso4947912b6e.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 May 2025 07:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747233034; x=1747837834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmvwNbNh3Td4tVXcEuUfGTCu9MlTY+8OhrY/bE97vRA=;
        b=Cg00KlEVi3hrMqfohvf+82BgG3JyNSOzl42De/qZuc7+7Wj6H8PM48cyMmPvZTTeYW
         jbSY6/+vuuY1jOTOk6YsmYraCF9KBbN2kCTs+VUgEgivfzS5PVQK5OAIYwBBhXRZDBEP
         hMTYk36Dtl4hIJ6zbTKsrOVjIHwcQiZEiCSMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747233034; x=1747837834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmvwNbNh3Td4tVXcEuUfGTCu9MlTY+8OhrY/bE97vRA=;
        b=htIZMIi3AgSkO3nUcQvNlGMOTlu1K7BofSL6qyNKKI2ZJWwJ1Fw/y2R9CF/aEP+xrE
         OwcOtqeXte51/UsgQJbnOO2aXUOY5s0USfAiykvZjzlekm98YTu2xmlP8jdb9+XW45zR
         Ka5hEJPE0kyG48PaZ/Ce2crwQ9xSR0FS/LFWFxU9WccF1P5FjU2qrU41B1N+3XQclI3C
         hfCn45bmGCBXxHJCjM3yq+uMhUN3epYgcpw1cNheZEct8VaX1cLP3tQb/fH1E/B9J1rM
         5QYd8A4Ns9J1tW0NULZ/guHmbQ0QrmPeUCzUjtkkBDOKra37Z7rTuKLBEmRIYBROJCTD
         Q2OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKSkgJv1HB1gqTCgWgvu6t1XUAD7D+YR5zqnxDjyHdP/9+PUeVIlGgvmdBTJnEJ/kG5kDfPvTelOgm@vger.kernel.org
X-Gm-Message-State: AOJu0YzCk1LSb2V+nFCx3NHbgoZ+CIKBwk+oiZ49SSh5FRSMKD1vAANB
	q/UqbHjcGIOCRMa95zC+KFpqfhSIjoUQKqxjZC045bTyGjDa+Pbj6I9/1LX0Gs8zHmEJWmIyQ14
	=
X-Gm-Gg: ASbGnctC/B1w7HhLTsow0+PUrJJcxrtG2hFFKLOiJzQPJOj9IgicDxK2R9bbAusMBpb
	3l072aOmfNaisdIVH1EvQvmcpjmiteVhxHWLxZ+dE9C8lfJ8+kW+Vog3vSAfJDAr/IaPBCko3FW
	rDe7a/7vq55WalLlHLwA4UDHEljvr+LiYvlsrGj62O/0vLIBOVmtmSfGHOjz/W3R6927AH5ivzR
	FU6fOjJxhPr42g687iUzglie1Ji/JQRcSFWQG/FWRwZ5EaUR+TryPsYsQYwq2kn7AFPL6Flbp0V
	Khi1BJhQ4V2m878xWPNQdaamPGcjh9m+Gc3dipfy4F+Dsh7h/k4gFCGwIRmrtc+dMYB8EhKdX7/
	FGXVx0XblMVdnJoV9a0IoSZkHuw==
X-Google-Smtp-Source: AGHT+IFxKfQjeCEPyqFlOd2LdcwLhTfW5ZK4+SMBbSATKUqK5hJP7BBgMLXHLCHDMHWEw96nReq7bA==
X-Received: by 2002:a05:6808:3383:b0:3f8:c486:9b27 with SMTP id 5614622812f47-404c2024dedmr2204125b6e.22.1747233033912;
        Wed, 14 May 2025 07:30:33 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-609d9b763d4sm512744eaf.3.2025.05.14.07.30.31
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 07:30:32 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7300069c447so3996480a34.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 May 2025 07:30:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAj5nh/4KwLDB1zYiy4ZvEW4av1MF4YXZJxwvTIkoCO/jO3nKvq0uSrfD8kFmbsJmvNKi3JvdZUYvo@vger.kernel.org
X-Received: by 2002:a17:902:f54d:b0:223:6254:b4ba with SMTP id
 d9443c01a7336-2319811f06bmr51131025ad.13.1747233019581; Wed, 14 May 2025
 07:30:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com> <20250513-pinctrl-msm-fix-v2-1-249999af0fc1@oss.qualcomm.com>
In-Reply-To: <20250513-pinctrl-msm-fix-v2-1-249999af0fc1@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 May 2025 07:30:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WaiqwZsWJ0JdLrmfm1tVbG9dmi_jN_7one02OdV+ecow@mail.gmail.com>
X-Gm-Features: AX0GCFvLrY-v4BVXb_MRFpcALF8nRN6RsNjsWBFIx-m74SsDyBv5AvTCKf3v9G4
Message-ID: <CAD=FV=WaiqwZsWJ0JdLrmfm1tVbG9dmi_jN_7one02OdV+ecow@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpiolib: don't crash on enabling GPIO HOG pins
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 13, 2025 at 11:39=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Qualcomm platforms if the board uses GPIO hogs msm_pinmux_request()
> calls gpiochip_line_is_valid(). After commit 8015443e24e7 ("gpio: Hide
> valid_mask from direct assignments") gpiochip_line_is_valid() uses
> gc->gpiodev, which is NULL when GPIO hog pins are being processed.
> Thus after this commit using GPIO hogs causes the following crash. In
> order to fix this, verify that gc->gpiodev is not NULL.
>
> Note: it is not possible to reorder calls (e.g. by calling
> msm_gpio_init() before pinctrl registration or by splitting
> pinctrl_register() into _and_init() and pinctrl_enable() and calling the
> latter function after msm_gpio_init()) because GPIO chip registration
> would fail with EPROBE_DEFER if pinctrl is not enabled at the time of
> registration.
>
> pc : gpiochip_line_is_valid+0x4/0x28
> lr : msm_pinmux_request+0x24/0x40
> sp : ffff8000808eb870
> x29: ffff8000808eb870 x28: 0000000000000000 x27: 0000000000000000
> x26: 0000000000000000 x25: ffff726240f9d040 x24: 0000000000000000
> x23: ffff7262438c0510 x22: 0000000000000080 x21: ffff726243ea7000
> x20: ffffab13f2c4e698 x19: 0000000000000080 x18: 00000000ffffffff
> x17: ffff726242ba6000 x16: 0000000000000100 x15: 0000000000000028
> x14: 0000000000000000 x13: 0000000000002948 x12: 0000000000000003
> x11: 0000000000000078 x10: 0000000000002948 x9 : ffffab13f50eb5e8
> x8 : 0000000003ecb21b x7 : 000000000000002d x6 : 0000000000000b68
> x5 : 0000007fffffffff x4 : ffffab13f52f84a8 x3 : ffff8000808eb804
> x2 : ffffab13f1de8190 x1 : 0000000000000080 x0 : 0000000000000000
> Call trace:
>  gpiochip_line_is_valid+0x4/0x28 (P)
>  pin_request+0x208/0x2c0
>  pinmux_enable_setting+0xa0/0x2e0
>  pinctrl_commit_state+0x150/0x26c
>  pinctrl_enable+0x6c/0x2a4
>  pinctrl_register+0x3c/0xb0
>  devm_pinctrl_register+0x58/0xa0
>  msm_pinctrl_probe+0x2a8/0x584
>  sdm845_pinctrl_probe+0x20/0x88
>  platform_probe+0x68/0xc0
>  really_probe+0xbc/0x298
>  __driver_probe_device+0x78/0x12c
>  driver_probe_device+0x3c/0x160
>  __device_attach_driver+0xb8/0x138
>  bus_for_each_drv+0x84/0xe0
>  __device_attach+0x9c/0x188
>  device_initial_probe+0x14/0x20
>  bus_probe_device+0xac/0xb0
>  deferred_probe_work_func+0x8c/0xc8
>  process_one_work+0x208/0x5e8
>  worker_thread+0x1b4/0x35c
>  kthread+0x144/0x220
>  ret_from_fork+0x10/0x20
> Code: b5fffba0 17fffff2 9432ec27 f9400400 (f9428800)
>
> Fixes: 8015443e24e7 ("gpio: Hide valid_mask from direct assignments")
> Reported-by: Doug Anderson <dianders@chromium.org>
> Closes: https://lore.kernel.org/r/CAD=3DFV=3DVg8_ZOLgLoC4WhFPzhVsxXFC19Nr=
F38W6cW_W_3nFjbw@mail.gmail.com
> Tested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpio/gpiolib.c | 6 ++++++
>  1 file changed, 6 insertions(+)

FWIW since it's changed slightly from the last version, I re-tested
just to be sure. Still works for me. Thanks!

-Doug

