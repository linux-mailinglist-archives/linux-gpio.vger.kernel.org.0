Return-Path: <linux-gpio+bounces-26661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D9604BA93B2
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 14:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3E40E4E13D7
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 12:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF002FFDDA;
	Mon, 29 Sep 2025 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PSfoqwfx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81B033D8
	for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759149952; cv=none; b=jYnOTTR7MOAmTi4s6J/68aFOJacm9gEy2I+gvJSN8ZgfYIINZRpEra3huDpu2H0o5NsjPHRMch5IuQFpDA3rSldkBiVm4hdG6cHWePSa3fGWjWwH8bWC34FhUAQXhfq9/4LVW8HmZajmd70Kj8zK+0vk211fsowWpPZy10rec30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759149952; c=relaxed/simple;
	bh=yIr8HBJeaWG4z2Zp1AsruyR6vvbi+g8yEhktUcR1Rzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLkx+R4MrXcVLJWtJs24Dq2QSiAQ2skMX/pccI54hOO4w5Pny1mQweFsPgvJrocDBOgtgrtxGlCgGdaPnXUj5xBRmJrpEw0zwv2oGCaM0gkmXQgmrbcj5vaN2EfKdtbU7eLybeCXHeD3ckphec8/OOKmIO1Evh38ustH8L5UHT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PSfoqwfx; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57933d3e498so5487552e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 05:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759149948; x=1759754748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7b2Xmk823kj47j/pJ6Gz4Gn2hyrizZmbnqLdt2BBnE=;
        b=PSfoqwfx1QwyutUOjXQ97dXB6oCgp8jzyzqpIuMiYEkjHRNZHK1SNH1UggEZwycPlT
         GVLryFfnigR5JICBGrsgXO0wE8kSAtg42700OY81f2D0DMdsSNMVE6bet4ohzCpq0UdQ
         9MfmIpN1nLprflLUvNEELbsynnzl5QL9iY9kQTunBRwb+NxdvqB7WkdyJ0kBC3Mto1AJ
         43xieS2obCrxKnwcP+2E9CEWp0XuRqG3R+iZ6Y3jwXPqjFMOQwFN7R4Q0msrxSGhxCgL
         PioptaxKTDuZDD4JibleKSG0yAX4EC7KGd3Yf4hE/uBh9evtUY2w93i560F8hldhrF2w
         0ueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759149948; x=1759754748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7b2Xmk823kj47j/pJ6Gz4Gn2hyrizZmbnqLdt2BBnE=;
        b=dm0FedeUwfLII5/kUjKuItUge4BKPdO1L56rAL5gANoUdjduNpz4vmj3DsQ3vP0vox
         w47sPj5yf/+m2bc5zDKSQXLGS+/mI6qlJWYfl2hHZVxMLLMM/osgOWPanmDo+AfT7ngj
         QoLmKqbI9EbHK4yEG/9Tv1aknEl33DfnqX/ddxSOGkiT3pgJWAeTpBQVj8Swl+cQW28j
         kMXwri3ibxRqXsB2sYq97yBvF3tSAjGT5kMridhj89m90ACVar+ncoeYkVeuG8DCZttk
         RyjXlqL863EUs8RlToocfc1LaCybTDRvDq9WM+BmjiQGUmbKAIe/9cwTzmQMFbQK3/uN
         RUEA==
X-Forwarded-Encrypted: i=1; AJvYcCWhcuaDvvArEvv08/hl2D9MWQFGgkhpGH3nl0bG10INX+e5hB0emIfrJNfYvN4VZv+MdSFY0JO0oGj3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2EAxomsfPEl1s743FuEN6QCAV2H7RUefieaBVB0xP1DPOilaB
	5IBHQbmJOGY4A+d+fcFj94peDnqscc4kWHKZ2K7pnkIspCgvnNGeS2sjCf7u6sFdzXTBwsYRHxS
	9fDyaI38ucXx1lH36HBaOikHUoWqk6rolsvRiO3O8Vw==
X-Gm-Gg: ASbGncueWU5CT5C0lWtPPrLVv2rXM+7WjySu7blHeNQDLZY01RPgZf55MGGHJxdGii4
	3x4wW9kxqEAuaHhq05GMtwHfog2G0YqBZu1oYgvajM0sTpjAXgatwM2/P1SbREES4IdVA1feB6e
	gIAA6iDvO4+6+jWKANwiDrhoAvxtMqMXKvtbLmWwSGYBHMtQMEpYPMSm11nOittatEHM91Z6fLZ
	EOVv1cUVPfwdqKEeoymwpblTozUYREGlLDZgo0ETC99+euBmg==
X-Google-Smtp-Source: AGHT+IF1U+ntE2SSzPWkrg1omim0UZUn9M1eJMqtMt19isbv6716FR3UDWvVglHEDHl19ADE6NeWUXyFaPZ4zdOBX88=
X-Received: by 2002:a05:6512:3b20:b0:57a:8738:4d80 with SMTP id
 2adb3069b0e04-582d0c2a62fmr4431350e87.21.1759149947738; Mon, 29 Sep 2025
 05:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929-gpio-aggregator-fix-set-config-callback-v1-1-39046e1da609@bootlin.com>
In-Reply-To: <20250929-gpio-aggregator-fix-set-config-callback-v1-1-39046e1da609@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 29 Sep 2025 14:45:35 +0200
X-Gm-Features: AS18NWDnh-XcXJZXhEqxC9wSMjePYeDhH2_VEtoj8YXr05ZwZa-yz1re_gq_0-0
Message-ID: <CAMRc=MfG8-c_+_R3meR_DgK3OMM3JEMSWu3SjfdMz-aW8c5wew@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: restore the set_config operation
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 12:03=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Restore the set_config operation, as it was lost during the refactoring o=
f
> the gpio-aggregator driver while creating the gpio forwarder library.
>
> Fixes: b31c68fd851e7 ("gpio: aggregator: handle runtime registration of g=
pio_desc in gpiochip_fwd")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202509281206.a7334ae8-lkp@intel.co=
m
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  drivers/gpio/gpio-aggregator.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregato=
r.c
> index 37600faf4a4b728ceb1937538b3f6b78ab3e90fa..416f265d09d070ee33e30bf67=
73e9d8fffc242bd 100644
> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -723,6 +723,7 @@ struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct d=
evice *dev,
>         chip->get_multiple =3D gpio_fwd_get_multiple_locked;
>         chip->set =3D gpio_fwd_set;
>         chip->set_multiple =3D gpio_fwd_set_multiple_locked;
> +       chip->set_config =3D gpio_fwd_set_config;
>         chip->to_irq =3D gpio_fwd_to_irq;
>         chip->base =3D -1;
>         chip->ngpio =3D ngpios;
>
> ---

Thanks for fixing it. I saw the report but I had already prepared my
big PR for Linus. This will still make v6.18-rc1, I will send it later
into the merge window. Please address Geert's review.

Bartosz

