Return-Path: <linux-gpio+bounces-18928-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7927EA8B430
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 10:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 097333AFDFB
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 08:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FAD230981;
	Wed, 16 Apr 2025 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pgVsDHZs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AAF22E3E6
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 08:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793074; cv=none; b=fpB7uNZD2tv+27HkfFEb7/HJFAGbriecxCLiPqUXmEwAF6Ih6HShn5uvGEY+wTO9pbb860cmB3g2SSdWh+ERLUKUAqt6MSeX2uJEc+65w0vtkLCB89TpBkVv1MTh0jhCyo+MYEN0aczGInSGsloLWnd9QsroUFHdGNi8IFlQ2yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793074; c=relaxed/simple;
	bh=FcxBn5vOvH6LTMNix8siy9uaMgg1aQmowQ6KuwJ+Dak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRxMjIM1RwejKE+GYSZkI9iuQWW/2X0q0rOZmKwSXRj4azseVB7fMFjefQ2HGl7bn+EUd+fAHHUomhdEdeazhEktR5SlFGfZWhdMi3BpL93re9Zxpv0To54VMjrEHrzLsrO/7olyieYb0PoMD77b/MvbM494U2e33PbLosVq9T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pgVsDHZs; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30c461a45f8so56956471fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 01:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744793070; x=1745397870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1IYgQGQySvCTGgqkhWJANrOLKSKyieKUnDMio/le4I=;
        b=pgVsDHZsSWf04VSOVfTZVDKsqqUCGSpqhHZzvSZHPdpoqV6vnaT0bN1pE97ZSe73zT
         3RFbPOiEMIAfvQchoHxreR9dzCcy14b80SA1k5yQyRbawQLZIlYYdkeXLqdQ0f5aJiBm
         nvRlrNH8lmkrXfBh5jvTahQbvZ/Fmn8NNKWtSEWW7y3jwJzZYCkvbB1KHIlwlKyaw+WZ
         Bal2IcBhuOuTLb3riVyRyA7L47sNX2f/bsLaFpA2crK0oRZGiGbTKSM9K3YVxnI5k6Yc
         jajIlCG4oLEkopZmMU8J0rRaanTww43xKxa14I6GVfDk3hiqJ9IXOp9d6u6cU08mE9WQ
         9jgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793070; x=1745397870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1IYgQGQySvCTGgqkhWJANrOLKSKyieKUnDMio/le4I=;
        b=faCkMwV7QA5qd13neQgNZdGsPWKPKHypEQHzzijwrp1ujte5o3pGlNDlFh57lNZmj+
         wLTtk/nMUcI/vukXzk7O5flzK2uVIBpOCMzRIX0F+GFqT0Vagao2ad2tpmVvIQuunIDX
         hFgjk7akFv2TG06fUAj7b81LbjAiQkD6ogm8LnBZPgTdlX1eeRKbjfi26/fgsGAwvjB5
         c45z6Tj0ZFxtgnEkaGGP/gBFWQEZN6m7D4XYy2AHT75GAO5QVM/G9n5N2WBeDfd4Yf04
         DBik17pHs+Pfxze+SE7j1lqAHoONiAsjjy6LE3NehFNvqkEoU0o4/bN91WXiW3/OOXrW
         1tDg==
X-Forwarded-Encrypted: i=1; AJvYcCV0ZDQmvsjQHyDWOauPZoC/4AdojZAC3+A4BsaFrRLCdPJm7RIxWtl05aHJNxJJ2KVTJDnQVW1oHOYg@vger.kernel.org
X-Gm-Message-State: AOJu0YwRiFlHLsMulHJ6cdpiPDHyjqgZJyQpvrYb5SRWEFtiw3J3dFzc
	/YpZoz7I69agk9u/L/NvQLrnu9VXid5IAerQwomipz38CypxKLB/aaWP0XA+sHnOYIWxhxI8DoL
	epcCaFaH6M0poHVkLGmihc24Dv062rN5n8ulR4A==
X-Gm-Gg: ASbGncviD5wajpAhk9YO//MK1YQAauCUUFu1xMxy+xvptSQHZH6fLVxqEGbUo/tnIy1
	83WtBSTW6vDnDFJ77m/nDr9LgG7pvrKlu8OIXCcrDq/kdm63Z1MqXSsSzktCUv25UKD5eWQtt5y
	lRMJCq0nFyUQgCn+BJaK+KGw==
X-Google-Smtp-Source: AGHT+IF/KObRzQGLOGJXTieeYEIieF6fnHP4NY79IKbkR8x70xmjAMurAou1CuBnifYtmivSixCLXlbWvJqq6TV1V1o=
X-Received: by 2002:a05:651c:512:b0:307:9555:dc5e with SMTP id
 38308e7fff4ca-3107f68c28bmr2719431fa.3.1744793070015; Wed, 16 Apr 2025
 01:44:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com> <20250415111124.1539366-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250415111124.1539366-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:44:18 +0200
X-Gm-Features: ATxdqUHl0l8qpIz_CHDL8adLmAWi8nEktZAOLLdcjJV96VS7uhwiZGkXbeJSdz0
Message-ID: <CACRpkdbvnL0z1x0An2Bhv1TdQxaz4vtBpVBDXUe+LCK68FM=dA@mail.gmail.com>
Subject: Re: [PATCH v1 4/7] gpiolib: Call validate_desc() when VALIDATE_DESC()
 can't be used
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Call validate_desc() directly when VALIDATE_DESC() can't be used.
> It will print additional information useful for debugging.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

>         offset =3D gpio_chip_hwgpio(desc);
>         if (gc->to_irq) {
> -               int retirq =3D gc->to_irq(gc, offset);
> +               ret =3D gc->to_irq(gc, offset);
> +               if (ret)
> +                       return ret;
>
>                 /* Zero means NO_IRQ */
> -               if (!retirq)
> -                       return -ENXIO;
> -
> -               return retirq;
> +               return -ENXIO;

Totally unrelated change - but I'm fine with that :D

Yours,
Linus Walleij

