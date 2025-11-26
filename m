Return-Path: <linux-gpio+bounces-29099-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB26C8ABE5
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 16:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 50DB44EB5CE
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 15:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E5C33A016;
	Wed, 26 Nov 2025 15:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PEhmnWRO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F299533B6DB
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172089; cv=none; b=fUUVRejbP+RmZImI4sK2u/CIPaaJLaQA00gYDKxp7qGJFkBJTj06G6Jk10zsTIsgYYkq8p3NkgslXYbEL4jxjshAcjPmntZNwbV3C0Xh07saLEBBJAWnEeXpcQfNGaQUeofQVTZ0ZiLi/sanXVloUK1W169VM3QmoInrhlD7dvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172089; c=relaxed/simple;
	bh=S8LmYUH9KEaLTuJ7OFfoJvQ2MvHXl9U2/WgqG1bny/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjKoTK64w4zHc0BqBlqte1QrVLAbGadkm/H/Xoy02nIiHNb+TzC8/AQ+TxAG6fir3BGwopjWG64h7JZUWE29BT4URdQzsd5D/ePVc9DwonMDVQC5xVBsV/pjZzLm+LoCGobU3LA9F9SiRV9ULnL3S7RutOWNl76yzppIlb0fyQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PEhmnWRO; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5958187fa55so5378738e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 07:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764172086; x=1764776886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFuVp5mjywP+NMccfEdA1smMO0SeI/6ihvGyik/4sgc=;
        b=PEhmnWROe/ZKxaaEu3ZS342A7CTYpt5wk8eBtVxZtVDgNsFqeCLlDRD/EhT4eJQnhN
         tvtbJ1pmmK0amjF67PFKanVkAHKcqbZOBoy2j/tc3sJISGsK6wW4nTqbYL5ye2ZM4/MB
         i+vTot0lX+9AclQNQS74zk9hG4tV5X4Zy3MJRjwLcM0nAajoIfSP8GeLVupcxu3Wu+Ne
         Cd78IBbDubDFM5CbVJzkbuMAlu4pIBQLYT6Hzp1LEVOHJUptjRWdXRhSRsTvIFKldsbm
         WMs9vxd9NGTDZHo5NuSR4gNZAC8lUuxtDzckT15lpWeeimr1CbYglA7gVllI2UkcaCPg
         dnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172086; x=1764776886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dFuVp5mjywP+NMccfEdA1smMO0SeI/6ihvGyik/4sgc=;
        b=GriwUqPiA6w3cQ+hWSzbemcpdT8RpsSPaCJ5dmzTkSXhnqnhFPt5FSy1lVxxmmYVIT
         TZjb3DGc5qava1qWxfyJ1XswIQTJAClWo3cby7heLOHJ51U967jhXaYZlPTVhrMDa8vE
         s8o9h5LR8P7p2VfitVxniaG37km733po6JZQLpe7zD1WbrJWrwKMo7PcLHfTFIYX+dWY
         /gv3aFmW1N+PV+5i0rCLnJyUvAljGhRgphB+AdHO7RqAfz/p+BFH+3dRQDMaBEMj1RlQ
         Hk9paiYMT8o6qCJRGDqn4F7WzV6v72s8SkSiLEI7VDcInTDLYxaWAatetgxbM0F5waNX
         zdRg==
X-Forwarded-Encrypted: i=1; AJvYcCVLMCXbTA2fMJVdBr2K/LOgClDorprGss31BddHh53pADoMTaPoMrAgodjrr+mpkA6utzqW9pGGIPNY@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ1UkedRCIjmP9lrHGi6SK03R81HUDILci9nVc9x0uMUCgApSp
	zDUjLPFj7WIDFl4pt/IxspqHwp5rGxOGuAaZYRXvENdbwxp36G/bqXab/hxMIwn0FOiKRwSXUXd
	6b1TEl8Pxah/NonT1ekU8vOKQCAMvVoeF3JGY4FIL9A==
X-Gm-Gg: ASbGncv5/wlbxEADm3LwL7z1s5CMQev0Qx2oahyUuRW/X3t2JwRxdbOI4EmXFUgWmct
	QaB0C29J/HjM1YEq/mk1/cOJkWcrPFvNWcBarGaPsXsujsTPLEbWZOrfqRion9G2dl9Rghm4g0p
	LP94nq90QrqRM5D4e8JRASKus2MV+qY3iwAwBn65eGq5Lm+jj3XTd2yP7/flSGrPFfqlkRyEXYI
	BlvvPSrVltyWrEqRN9DZU8LSBIsUR/jzKxB3/zdjpTm0HF56911nBs/MUkZogGo9WXbVYGPaj32
	N7bA5S4bwMvbR/JzTlp90guF8gA=
X-Google-Smtp-Source: AGHT+IEhUl1jNda9/yp2GCLrKXBikNNwXFAiy8yPxeZdtimGdt9zzATr5ITlVaihFGQ0IjBdRUtALikJOU6Bmen20go=
X-Received: by 2002:a05:6512:10c2:b0:594:51ac:148 with SMTP id
 2adb3069b0e04-596b4e5618fmr2340043e87.15.1764172085977; Wed, 26 Nov 2025
 07:48:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org> <2d96e464-e17c-4ff5-9a08-b215b77da04f@gmail.com>
In-Reply-To: <2d96e464-e17c-4ff5-9a08-b215b77da04f@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 16:47:54 +0100
X-Gm-Features: AWmQ_bnK-S4TlEVeOIf3ITE7TZsWB2TJ1MXZpLcLB_4C4obVKenyvukRrMrvtB4
Message-ID: <CAMRc=Mexa9eSe+qy9dm_q=+gBKtc-EZ7M0RXsgSe6fhWj1FV4A@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO support
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 4:34=E2=80=AFPM Cosmin Tanislav <demonsingur@gmail.=
com> wrote:
>
> > +
> > +             count =3D of_count_phandle_with_args(curr, prop->name,
> > +                                                "#gpio-cells");
>
> This call causes error messages to be printed for gpio-hog entries, like
> this one from arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi:
>

Thanks for the report.

Please trim your responses to just the relevant context though, you
included the entire huge patch.

>         sdhi0-emmc-iovs-hog {
>                 gpio-hog;
>                 gpios =3D <RZT2H_GPIO(2, 6) GPIO_ACTIVE_HIGH>;
>                 output-high;
>                 line-name =3D "SD0_IOVS";
>         };
>
> For gpio-hog entries, the first element is not a phandle (gpio-hog is
> already under its parent).
>
> of_count_phandle_with_args() will however try to interpret it as a
> parent either way, causing the following error to be printed.
>
> OF: /soc/pinctrl@802c0000/sdhi0-emmc-iovs-hog: could not get #gpio-cells
> for /soc/ethernet@92010000/mdio/ethernet-phy@2
>
> RZT2H_GPIO(2, 6) expands to 22, or 0x16.
>
> Coincidentally, in the decompiled dts file we have:
>
> ethernet-phy@2 {
>         ...
>         phandle =3D <0x16>;
> };
>

Yes, because behind the scenes, a phandle really is nothing more than
an integer.

> Maybe a check for gpio-hogs should be added?
>
> Something like the following before the call to
> of_count_phandle_with_args().
>
> if (strcmp(prop->name, "gpios") =3D=3D 0 &&
>      of_property_present(curr, "gpio-hog"))
>         continue;
>

Yes, that's a good idea, thanks. Let me cook up a patch.

Bart

