Return-Path: <linux-gpio+bounces-23872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A88EDB148D2
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 08:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7750B7A8140
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 06:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB42E262FC5;
	Tue, 29 Jul 2025 06:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f/Wfvghx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9D32609D9
	for <linux-gpio@vger.kernel.org>; Tue, 29 Jul 2025 06:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753772340; cv=none; b=IfXlflAp+gUNx2VDE5uRevDP0Il9nwpTLyhz9/vJPTWGSyvGyKULl1Zt6onaLOdu9AlSiA8VPh+tGf/yXbQUKrSMP5GSkRHE8/sziJ3Pm1eMGzjqwccjPr9rwND6rud7TCZSfjx/QjuFzcr76ldfbBflSfhXj1qFaCQAz5BREwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753772340; c=relaxed/simple;
	bh=HecQWwK2lk4Yt12acj8ntIBVFy8o7ykyEZNOkui4Hgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iP1pP9zBENUDetfPQBgmeBUk48Rd65PbgQ+Myvl+QfjmwK+V+r0BmNJoHpMlDzKQf0JbrSPV9WunpiQn+XxyxLv/bj2FKtfI3eCrgqWWfMsv/e8JEviuqBKofpUr0GyoLMEFH+cva+kN44fAvsxiqPqVqMr09F1718xMsXgyAnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f/Wfvghx; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55a25635385so5864476e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2025 23:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753772336; x=1754377136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahIXy3jx1Vd5imYAa/Lklqvxq/h0MS9MQimCSeG56MI=;
        b=f/WfvghxP1MTHai4S+4N3rjaghjvRNU+wG9Y4MdRgbeSot4KMvulv30T/8FAFjGOSc
         i5+t2aqcc1WZ71TUjp1pWhqp1K9MI18balng945XNR/9bmxQWuBmEySjU1zXeCNlQuCk
         EQEkkIxoLkQ/MD6ozNfJjVQeN9K+OI2LH96rwtpc0LXsqUfZZJXxH/3wd2yBO6poNHzU
         dCw5A1wwjV+jv9hwQKNBe+x17JxVj5TzEPWzRw8Xvc7ih1Nq0UB4JsNCdPueLc0kw+bc
         i+jGKC3IQJTfINqWKC+mGZaT0kcFOPKxP4M3LjyM5M07TSVXfYbyoOgzM6pah6V+22Vp
         Vk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753772336; x=1754377136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahIXy3jx1Vd5imYAa/Lklqvxq/h0MS9MQimCSeG56MI=;
        b=Xo9j2xyW43fesSz35pyVgcTCROS2fYQlzWkOKa12x4+2CeL9Mg//Y30WizVVgGFxuN
         KEiryiMNlmgIBxtIZaX1YnjbJ3fT1hL3c/56Rn2jyse6QEeQ/5hbILQ8T1mgILjkG8U2
         OerPOR3Ugpo5aQTSvxSVV39T0TI7KUnLMhkMV+9krn3lr1Izr5FIbdNj7+fN1RbIdUsp
         YBYbBPxGmYDFOYlV7TmEvxxyw6SnRc14CAZxpDGD1QXoGOYGIxk+iJ3I4rWPeYrUopXv
         uSBSrKYh1qZggjS/j07IYujso1nW0wyiaAd3Edv+aV1JxKDjrLI2vnlUfIsHonTewd47
         aWOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoE0Er9ykEuItwtk0rbT465yUXl9VrYcWb+CnF3lKPmX0nC4hxxe32qdFbVTlv5ZWnXBof3R/igal1@vger.kernel.org
X-Gm-Message-State: AOJu0YyLYEeIWHszr1rttZTlGbDgwd8/TOt1k5/MK9gDX5l2MY77Vkz6
	IKOQfdpWCNbZ6EdZE6bSsdqi9U4Had5YNR48pvLpfNt8gtn8oILgDwWSZ0iSIneFXsnsau1W4kk
	n4YWfHpWzSgZbCfSThtLezBKX+t9k5sKeke8mAlAP/Q==
X-Gm-Gg: ASbGncuTJA26kccDzC9Lbn9vEWMA2RCVGlVvuVI4M2QaOrTqROi/CBMVDVGXBDgJ/5x
	ertkPMvDg5f4ShU3LfeLK8x7PhcWi/U+o17VOotjZismvf5toLv7XLUg0YBvOUESr2Ums4Yg6nT
	Q+fyJ5euLbtWtNrXP0M/xTVerF29iL1MczONJp/3ZyzSSRl1FUiooJBj9xFEF4mPDO9AvfWBQda
	YhagmFvLRPOOtv/KKOGlUuA/50vTyNpbdjFyKEwR9i5Y2jf1Q==
X-Google-Smtp-Source: AGHT+IENVZ731scRx/lLYmbmtQcdUo8605prxvqB7h/pEY85JwEbG2W5RCWyvPQoFrwxMXfKgXYDqs+v3ox0eCh2a4A=
X-Received: by 2002:ac2:4e14:0:b0:55b:5c62:c7d2 with SMTP id
 2adb3069b0e04-55b5f498ccbmr3209400e87.39.1753772336369; Mon, 28 Jul 2025
 23:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728144619.29894-1-davthompson@nvidia.com>
In-Reply-To: <20250728144619.29894-1-davthompson@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 29 Jul 2025 08:58:44 +0200
X-Gm-Features: Ac12FXxWS275bOEU-c1wViyF7-V1oyzkM7lyHBoN6z--DlyIBO3HrfLxY5YRGkk
Message-ID: <CAMRc=Mc1cQL+fcFOPA1NBSHh+foVyT1mxFt+R7f73PEB=Pjuyw@mail.gmail.com>
Subject: Re: [PATCH v4] gpio-mlxbf2: use platform_get_irq_optional()
To: David Thompson <davthompson@nvidia.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linus.walleij@linaro.org, davem@davemloft.net, asmaa@nvidia.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Shravan Kumar Ramani <shravankr@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 4:46=E2=80=AFPM David Thompson <davthompson@nvidia.=
com> wrote:
>
> The gpio-mlxbf2 driver interfaces with four GPIO controllers,
> device instances 0-3. There are two IRQ resources shared between
> the four controllers, and they are found in the ACPI table for
> instances 0 and 3. The driver should not use platform_get_irq(),
> otherwise this error is logged when probing instances 1 and 2:
>   mlxbf2_gpio MLNXBF22:01: error -ENXIO: IRQ index 0 not found
>
> Fixes: 2b725265cb08 ("gpio: mlxbf2: Introduce IRQ support")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Thompson <davthompson@nvidia.com>
> Reviewed-by: Shravan Kumar Ramani <shravankr@nvidia.com>
> ---
> v4: updated logic to simply use platform_get_irq_optional()
> v3: added version history
> v2: added tag "Cc: stable@vger.kernel.org"
>
>  drivers/gpio/gpio-mlxbf2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
> index 6f3dda6b635f..390f2e74a9d8 100644
> --- a/drivers/gpio/gpio-mlxbf2.c
> +++ b/drivers/gpio/gpio-mlxbf2.c
> @@ -397,7 +397,7 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
>         gc->ngpio =3D npins;
>         gc->owner =3D THIS_MODULE;
>
> -       irq =3D platform_get_irq(pdev, 0);
> +       irq =3D platform_get_irq_optional(pdev, 0);
>         if (irq >=3D 0) {
>                 girq =3D &gs->gc.irq;
>                 gpio_irq_chip_set_chip(girq, &mlxbf2_gpio_irq_chip);
> --
> 2.43.2
>

Cc'ed Andy and Mika for review.

Bartosz

