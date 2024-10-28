Return-Path: <linux-gpio+bounces-12270-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 831E69B3D93
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 23:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AC601F22F76
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 22:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0EDF1EE023;
	Mon, 28 Oct 2024 22:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gjhq9Jqa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99213190665
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 22:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730153791; cv=none; b=XnvmNJD3/+t4e/mTtSDzZrLyDQ0PsN/1cOVdLr48gTm8Ndu85WrLRNnfID9Qq3DCcslNcauv/zqjIuoK4Ae8NtHU3ksYzs28XRh7V5oRZMXEruHKC3YkC32jMtGiDnWpaIhLRzi5Fq8UuC+S9sQVTdP61NyC8HqTOXYayzyIHCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730153791; c=relaxed/simple;
	bh=9N+/R+yMClr79iDqjsc7AHBZ7heiAvpqxUMbmqWtWYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2eKVVshsEAhNXPqu+i5F+jTnK10iH4u5umBibY3NMfTZwRZ0F9qMOtZYd/OTenFC89T/BQhyjT/iU4C5+JEb0ExxmMHSqddcMhzMulfaYOMdrrkED8x0baBL980Dj08i/8891zRrNZXRR7EbD2qNXxG8ulOZGvXjgdHUSRqeTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gjhq9Jqa; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb587d0436so49449971fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 15:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730153787; x=1730758587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9N+/R+yMClr79iDqjsc7AHBZ7heiAvpqxUMbmqWtWYw=;
        b=Gjhq9JqaglR5Dv0YNKzd0QzFGDBG0Jb/rfLMlCYYgPd5QXo0l0Tvp5rZknhrGL+KBB
         XMK1pbdRW9HX0tA5RKNc2FrtLDEPiHl82Ft48AUAqm1yoHvFvbTVOG7wekd6SKtEDfWp
         0Cuql2eBOF8QE6THVOfUr2Leobl2jTXdSc6gu4RyRV0ZWvlxJNv4qFMV7BePdH4JlWwy
         DvFOImJyowXz82fushA8pigPRBx9dd3bHdKqyYkklsQUOSy/9RLfcu6i28SZJpFP0fcY
         w4SbpFP83l3Jm5RLVgyYM2deUblJY0nCiXqNsylyq4yysLW5xSHQGn4OzfyafaeoU/Di
         7y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730153787; x=1730758587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9N+/R+yMClr79iDqjsc7AHBZ7heiAvpqxUMbmqWtWYw=;
        b=mOCAVMAvuyxaXsVnqpxSVETHJQswN/myVT0IbxXNs6uWP8whWjdvCfZNmor1Mqq0P7
         sepAZZK4L/D7KAu/iFKYlbPQS8AXtXfk9lAkrhwBfwRGJA/4u5g+l2Ar+RlOLT1jLXjK
         5lHkJHVrc6ZBvY+ErydxrIyB9D5lF+bQH2ejVMmCakUY9oM0SaPgqx/4q93idWJ6Y3mz
         HjK8ddysLpHPgLOErmuTwhs8evD2KxnEK/Ypu0KmkY77GC5ZP3gRVCM1Y2k6P9/sURI7
         xrQElth3dZz0IeOjzIsNukqvi4zDIrjuFfS5qz2zm/KWGSOdgcGzeKplN4tpC/oFGfFB
         00Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXCTY0oj0gCIVrSxaFa7mfMx1atvtIY9jaaABstaRCEAtK1cEwWlQTAFELGuT2g3IBgukf6ERJGwkcE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdth8SKtWkEIJmKOmPL0fpXwlHZaDOgNgEWO4qy6evEJ+napGH
	Qflwk1PhSHTXLsLcEOI2/fZDAwrDXDOpGnVr2Ub4w64PmLpM6oea59gFHjMQVLsevjhntWjYpPw
	K2XbZBq17xO8lK03oBbOxZSehdPn1rsZFioKFnw==
X-Google-Smtp-Source: AGHT+IE6DtBNue66FAZk1osaVTZDa6IytIhVHf/6SKY95NzMmkOdQ/ZCObzh1LjqdFsUEbcb6iyLGOIb1MzYzR00K8s=
X-Received: by 2002:a05:651c:211a:b0:2fa:cc12:67de with SMTP id
 38308e7fff4ca-2fcbe0669f8mr41305041fa.32.1730153786652; Mon, 28 Oct 2024
 15:16:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1730123575.git.andrea.porta@suse.com> <b189173d893f300e81b18844a1c164fe4ad5bc20.1730123575.git.andrea.porta@suse.com>
In-Reply-To: <b189173d893f300e81b18844a1c164fe4ad5bc20.1730123575.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 23:16:15 +0100
Message-ID: <CACRpkdZCbvNY=B05e9wGqNr5b4t8GrDVsr01C3xd5E-WWwPyMQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] pinctrl: rp1: Implement RaspberryPi RP1 gpio support
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 3:07=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> The RP1 is an MFD supporting a gpio controller and /pinmux/pinctrl.
> Add minimum support for the gpio only portion. The driver is in
> pinctrl folder since upcoming patches will add the pinmux/pinctrl
> support where the gpio part can be seen as an addition.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

This looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Can this patch and the GPIO/pinctrl bindings simply be applied to the pinct=
rl
tree once the bindings are finalized?

Yours,
Linus Walleij

