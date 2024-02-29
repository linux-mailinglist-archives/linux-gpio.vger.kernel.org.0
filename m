Return-Path: <linux-gpio+bounces-3928-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A928C86C537
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 101AE1F227F0
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0F05D754;
	Thu, 29 Feb 2024 09:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F9/LAApI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2045D73C
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199049; cv=none; b=l2MwBritpVkOsU+jNpwCSVMPpo2WSP/CU9frJaldXCIAoMvZD6lW0NwZkVWRE0wXAIp79rGiJvCITYXaj/uBNkwjbIxm3sfN1zTxYgip6E2/WllV4wnmVZU6+zbsKa44aX0ZPijpxXcx5lFPnpTeWSEkVTihGa1nFpU7A8l54aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199049; c=relaxed/simple;
	bh=31chdHlOIqy4WCMDjv7GZKxMkfPu9JZLtk09++EW130=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3GkXR2YTHw+xtst9K6uJ/PahRiAu++HxkmgzSfEkNc94QANP1UJWQ8rdxD0grUD+p4VK90GxWfSZbFoezilaP2AvVWIFmBxhafDA0CswEDrFqVCHDdkpPdsKpySOGQCNwl9DNEzX5F9iAYlClnUBFWcLHj6ttFdwmmdn7KLNwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F9/LAApI; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so752148276.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199046; x=1709803846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31chdHlOIqy4WCMDjv7GZKxMkfPu9JZLtk09++EW130=;
        b=F9/LAApIsHY429+cdXGQchpL4KoOf5QrS8Yb+dXjyclik0vicnut+U+NP2c3iRyPBR
         t6yFM3DaOtkQsi5qcgFOzp+9bX1MUbXPyAddqSjeOmAOwaZhe2hyWQIAin/wn74LDPwq
         I0e2c6lrHx2IzDf6jmUphVrte5OWNmQtNg/KjvvGGpYAY3T4TPKTtCYrx3eFNudnI6AV
         Yi7opuP3nXvlLv8OwE9K3PKRyBRHqG8t7H7HGLqXfjhrruod7caV8Kn2whRjSrV/l++8
         +0kXdoYujbLWvQXZGCy/4p53bY8Ro+RUUEqXhYh+28qSMLionK28a7qKbEXWpTisGVEd
         i/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199046; x=1709803846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31chdHlOIqy4WCMDjv7GZKxMkfPu9JZLtk09++EW130=;
        b=EMF2EEZMWB6eEA33OHAWDfE6sAZJChxD34NPFL3GwKj2iCVzc+/UTNo8E7u3TYjYYV
         KZRGtbGTqrE2Lnhh6YMUS6CzMnpXKcVtxrisXmg86obmihKW/uB78rwcVNSd8qxB9TrH
         Tcv63E6yy6dbYboeqK9HBv2vPM6A58OfdvFNgHgFdOWATaEDj9SQs1tSJ/xBgeboqt/o
         90CWjPGfboRp832nm/0g+Rw6YaYfdPlsmlmrYc4xFxKpnSyL2TUQ+y5UXi3VjvS9yMvX
         JsKC375bUmtedJpRrSqNdu7VDsR+F7amwPRp0RKk+Jvlwz4rYmh8I2oLIiMIZhmAqXg1
         iZGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1bsoUx+KiqjTgsQr0Hyq2PrF6gHk/0yaoSZSuKey27tNsFT+jROd1lVjmQXYEqgziuhRyoBAPAcnjGwzk/lujpHGQNmQFewAzVw==
X-Gm-Message-State: AOJu0YxT97K9I6Hhu8e9kGlFsTEJaGvEbmqvZ+A6RjAcLqNG0VW9mQym
	EUUU8kDbKgES2BvsA5BposyQT3IU0BjdOTGEPrxSzw36ckbmlFGPZalf+b7CwvjRvyjlqN7aHOe
	QLgFjTQ9HGteZ7pLR3RLQleFwXqdsEbaEoXNwRw==
X-Google-Smtp-Source: AGHT+IEmhOIkoqQABgOgh2spi9fO0NuLliWyGBbtbQP2Y3j61zegZ8lSPYJAXlb0pVJPAWRTtqtOPDmNbSb0YROYMtQ=
X-Received: by 2002:a25:d30d:0:b0:dc6:da83:88e6 with SMTP id
 e13-20020a25d30d000000b00dc6da8388e6mr1480292ybf.32.1709199046701; Thu, 29
 Feb 2024 01:30:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-16-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-16-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:30:35 +0100
Message-ID: <CACRpkdaR4fLef24SMFj=_C=o=dqWvKemVJPKcx1jjwjrvVnRPg@mail.gmail.com>
Subject: Re: [PATCH v2 16/30] gpio: nomadik: replace of_property_read_*() by device_property_read_*()
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Avoid OF APIs in the GPIO subsystem. Here, replace
> of_property_read_{u32,bool}() call by device_property_read_{u32,bool}().
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

