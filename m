Return-Path: <linux-gpio+bounces-16194-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E43AA39D00
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 14:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B06067A1E2E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 13:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA5B2673B1;
	Tue, 18 Feb 2025 13:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dtqxb1+r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F11156F4A
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739884210; cv=none; b=Nq4nQBgTKWxWaSRAquGFo5Fi7bIuRugU0Zobp4zvHBmIHm5TphYdk6gXXSCq7PwVxAiwcL4edKN9dCpkl92wUrxTWW4PfFtCMQVCKd7AlxOD39QQVKyLGEvmAmIXuyboiG2RiTYbiqUcgi6VgLbf67a1aXMLvRD8imjxCpTw7I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739884210; c=relaxed/simple;
	bh=wChb/6g3sce1C+2S6hz0f4MqiwvzQlvCTwkos7PCRgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o59f8EenB1SwZFbrsQChU+pnbGo+0cdprHSC1kN4/QtyYplxMJ1rUegp8h88sBhu+nUrw7KL9tWddabaZvHm8Dr5z7fqsyU5hyr8g6Noqv3J8uiNVPyBtIjByXhU8ujVlQx0u72gH059+25zZykabMwiESnUy+0FDZfXC2DRkgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dtqxb1+r; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5461b5281bcso2320241e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 05:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739884205; x=1740489005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2H4CFTIInDOtT3tOm3edOpwQRv60P1DUgV4VG+RFkE=;
        b=dtqxb1+rSM2DZ963SU9zTaHeOR3KsHJWnXi2IOv/fZFsl2tCgDBJsZLDZTWiomZ5gc
         OdFRSA5aucfV7WEBNL5digHsP5itroS+yfuxrcaf/4memPvtzgN2r33bh7fN1Il9dQXX
         6OU2oG2DojBUAbqR/xm//lOqJNlVG5nyQwZd31MRXVmlhP7It4aJ46uVRYr7+lshW+P1
         HVyjwMUGTkK9wx90aFiSqyXOC1DWZL/ewgZ7Yw6l4LygiPjHWAnhZmil2ZKYqv5MiFd3
         C+vfydEkwR1cTkVR7D9Pdi+X5Xe+sKd6xOiZJXEi73x+igMvsa5/LWEa00Bp5tAFTvrG
         1ulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739884205; x=1740489005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2H4CFTIInDOtT3tOm3edOpwQRv60P1DUgV4VG+RFkE=;
        b=PCmlrvMOjM/h7/VGCXkJhM6nvt+aw0A7k8q8Ce/H5uqzM2MG9XkA+Hwn4YQ7lIQmDo
         HzAAO+wibwQOpcZfvuqFSgaFkJZ3w22EjAPZwE7QqMMsRCHNOgLrVkR4CzqLsfkkVGTk
         vV5BfV8G1cu5VNaLgW7cyPrKZxpwPwCmiSYNm4N2df9dRYMdtrhiAU3GdG5CuaItcMLu
         tOm1oDD1/5DeYigoBsIWl7eVQW24kem8daazO0BcGZIi1De3JQaCl8brH+ZX9GYqg/E3
         j8SwpjnnCitUFMCb45s6oNS7Ad6/CjX50QisXriOJjv1jT0hsVg954kOwsq45xeHOWp9
         dh7w==
X-Forwarded-Encrypted: i=1; AJvYcCX2evl/gbTEDB+VJOHr2QqgSBUsRv3Sxem2h2/N141vI3YrBMLhh2gvAS4JN812da40mmyTODGjoFz2@vger.kernel.org
X-Gm-Message-State: AOJu0YzCN7yUrIrCpIdCIn3DpUGwvH4vjX80x8GJA9u9s1JWtU9gIwmB
	4QZXd2oQEKlpSPymSVpB7CP3iC4fFihdOZ1iL72QXuQtUpS5cyrljkFHGK3hXYsFc+YvvK8YvFx
	LYeGf4bwuM0dUWAzHTCDtCKhKh4BrPvOqI+CnEw==
X-Gm-Gg: ASbGncusOV7UoWcUkT5cy94H/1ihKOImS1tmQjqJoT9LmVHOUn8R4at6nfn10QQpHFF
	N9yVKZxtiUfXJgLWnt/B8i7fUlbU0R+n+qNmYu2sQNro8cuXet48zgplG6BtcvdSzQrhghw8O
X-Google-Smtp-Source: AGHT+IHdB6MXsIp6ZqlQsI40sZGvOLeSKe+AB5abn2fY1o/Am7w1jOVveK3QMy7dhDaAVzYZIDd9lE1wi3yAkqHGnxI=
X-Received: by 2002:a05:6512:3992:b0:545:2d27:5ae1 with SMTP id
 2adb3069b0e04-5452feae86fmr3466160e87.53.1739884205513; Tue, 18 Feb 2025
 05:10:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org> <20250217-03-k1-gpio-v5-2-2863ec3e7b67@gentoo.org>
In-Reply-To: <20250217-03-k1-gpio-v5-2-2863ec3e7b67@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Feb 2025 14:09:54 +0100
X-Gm-Features: AWEUYZlVwAj_YWqJ9Lyi5dg687EoTYyaneVjRfcETc4JasvXfyarUzHN15z58MI
Message-ID: <CACRpkdbxatfvPnOY_gNVAWdtoJ+xj3DbKNUqFU=9AC_UKM88sw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

On Mon, Feb 17, 2025 at 1:58=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:

> The GPIO controller of K1 support basic functions as input/output,
> all pins can be used as interrupt which route to one IRQ line,
> trigger type can be select between rising edge, failing edge, or both.
> There are four GPIO banks, each consisting of 32 pins.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
(...)

> +      gpio-ranges =3D <&pinctrl 0 0 32>,
> +                    <&pinctrl 0 32 32>,
> +                    <&pinctrl 0 64 32>,
> +                    <&pinctrl 0 96 32>;

In my core patch I assume that we encode the gpiochip instance number
also into the ranges:
<&pinctrl 0 0 0 32>, <&pinctrl 1 0 64 32> etc.

Yours,
Linus Walleij

