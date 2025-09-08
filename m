Return-Path: <linux-gpio+bounces-25771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69555B49B64
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 23:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2024E16EB10
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 21:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B7C2DCF4D;
	Mon,  8 Sep 2025 21:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BlQEe33R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60662749E4
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 21:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757365426; cv=none; b=oMGp6jZ4nyYNO/afC87ytG7pIzy446JH5ZVTqNdH6ubfdHGSeIkkR87dGIgppUsi9/shN5k3ARSMKn/VAV0mwmATOS+lxErzTA+0we/oOT4L/57xiaL5nh1MCr0xot2vovERRj9naL9kPDppLW0wFjhKikzY1EQ02QKhh0usik8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757365426; c=relaxed/simple;
	bh=qy3RayiwfBU1/zuQfXQ+IdwaYW5zap/grmBI6ndAc0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IEiM8z0orOYdK/ein2aBue/LplDibsAaSYx1LY8K4MTknb5Lb3kRncmu5TmB5THgxgbM+NjhXWYM8kt7bRB7lwAxG2ksI2nQUz3E/tXTaIw+88GAUb+RA3etYy2N1Uz7cNUWYsfFOrv9XEr2Cwami9L83n7VOD3BJVMqo/SDIb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BlQEe33R; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-336dc57f3f2so46188801fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Sep 2025 14:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757365423; x=1757970223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qy3RayiwfBU1/zuQfXQ+IdwaYW5zap/grmBI6ndAc0k=;
        b=BlQEe33RIgCtJiDnzcPdrQWY1FWMn+GP6czPsmG4gyF/MCbHQ4mtN4YtkMVYBxu3dj
         gZmCC57E0tCwmnJKd5r3e8OMgv0NlSj/ONlAN84qhYWErssml+bpykluv3lj0F6xYWOe
         QLCZmutQgbm2OQ4/SA0ULt9BwtV2f5YEu7ab+9fPNRcxwW5tU98WAwm1LDZcRBeCjI9U
         wa2Mx1H/jKUuMNdOAQODc0TJO/SGg5FOe7mc7hn9SO2L0ydnR2cZKvVR2yIKIUY2YUQy
         ZnLiwkVGyj4qJtuS2B54clhWbAE6BlB031FLanbXHzajwF/lcYE/TsxdB0wbaQ1HwxWK
         haxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757365423; x=1757970223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qy3RayiwfBU1/zuQfXQ+IdwaYW5zap/grmBI6ndAc0k=;
        b=KWhi0DB8VZblVY4mP60Y0m2swf7mI9FxeJPoYxB3+j8/Yc6ZFroLX6SYPxPugu3NRi
         d9GXCxG/EIXlHddLYwFRzk36Vx6lHFPqMZfoBHLz247p84m1FDqO1yZlQJClX+HMQTC3
         PCO9WxlxCIE7tMc1f/b4oUS/MWVdUU8X9FgChSIy+cbUG0VpJmKQe328BNq7kHq4rgYM
         TPQEGIzEyR3yi7sJsCn01Hz8fFPhQt15qFbY+MhUyREmLv0c55tROoaomM8NP9EaVHs6
         A8WNo4+fSnczy0ZECmfS/SaLx2n9VJte5Ji9vP9tbUkwsrjsn8kH+sCqvDT9Wx+GPsAZ
         4XJw==
X-Forwarded-Encrypted: i=1; AJvYcCUPBnTnqq56rmwlK4k2fGHc4CGdhvFQxHnNaIfA2IoYJTfYgGD38VswQWYu1yhv29UI1AWDXYtkNgf1@vger.kernel.org
X-Gm-Message-State: AOJu0YybSWYOJ/EPwKrFQ0kcOnQ8DRm/GzCycPahNNsSJfgphwO+oK/d
	RkVtpzJZ7zHCxc2Jtiln5DKtFeNBMAB6To17Na7bK5ifu/+I6+p97CXcqEV2UAFkeGEXce2uGm9
	8RqZwcr88ke8ZTdA9K4HEGgipmXe6IvyICCsTmE/QhQ==
X-Gm-Gg: ASbGncvI9SNwKZR1Z6zq2KG1KXPMk9Gmg29z3UdIHhz82gC6UnGywpM8QNkOf4QcRl6
	/uZ8pWwBDTQmlaE8ahjCJh/66QlcQ+/MhyDQHgIrXJlxok146PZdxX8rZ/uJyZFSXRxADtBlRnA
	gRvBfHQJdoFOTVXjT2osFIoAceksdVf25lXoQRYKIj8123Bs4/ZpRfHBaH4lgV41fVOAIGu5Fpn
	atdZZV+6fUH5IV8+Q==
X-Google-Smtp-Source: AGHT+IH8+J/vFeWhw9eoYEb1/3GvltvNA5l3205lsYcHvwWXC67kAnznt4uB6zdL3+zg2WYqt7lJoZenJW0OZDDgeRI=
X-Received: by 2002:a05:651c:4358:20b0:336:d915:cc5c with SMTP id
 38308e7fff4ca-33b4fe4da4bmr23851571fa.3.1757365422821; Mon, 08 Sep 2025
 14:03:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908113723.31559-1-ansuelsmth@gmail.com> <583981f9-b2ed-45fe-a327-4fd8218dc23e@lunn.ch>
 <68bf16e5.df0a0220.2e182c.b822@mx.google.com> <d1bc3887-5b88-4fb9-8f89-4b520427ccdc@lunn.ch>
 <68bf2b2d.050a0220.7d5a6.b11c@mx.google.com>
In-Reply-To: <68bf2b2d.050a0220.7d5a6.b11c@mx.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 23:03:31 +0200
X-Gm-Features: Ac12FXzsPzr9I2HjnC5t_HYUtDe_Oo71i-LHOVM3Q5owLY6JPkPWVDiLSF9uLf4
Message-ID: <CACRpkdYuT0x3JSFWHMF5thH0UyNF1Cse+W9joE12yQ0iAAXjuw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 9:14=E2=80=AFPM Christian Marangi <ansuelsmth@gmail.=
com> wrote:

> The usage of GPIO might be confusing but this is just to instruct the
> SoC to not mess with those 2 PIN and as Benjamin reported it's also an
> Errata of 7581. The FORCE_GPIO_EN doesn't set them as GPIO function
> (that is configured by a different register) but it's really to actually
> ""enable"" those lines.
>
> Normally the SoC should autodetect this by HW but it seems AN7581 have
> problem with this and require this workaround to force enable the 2 pin.

In reply to Andrews comment I copied the two above paragraphs into the
commit message in the applied patch.

Yours,
Linus Walleij

