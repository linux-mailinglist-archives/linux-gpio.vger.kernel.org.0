Return-Path: <linux-gpio+bounces-3938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0B486C5A3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CFE31C20329
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F7760DF6;
	Thu, 29 Feb 2024 09:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NoB5fSkr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FA160DEC
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199631; cv=none; b=PpV+NLA5Wk1vNoyCTCzKaIEDmQU2B4k19rXwtFv3rIF020kAXa4PyraggiPM1ZUeyYL4m3EKhsOPEM+GWtjmOfWwRUwBWPkCcg1OaqTXgWetEY5YbGs6ImDLCSevSI5pnzk4KaevDm7yrY5JQ3JIzb4ZUW7uh0V/v1lkVhpwDrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199631; c=relaxed/simple;
	bh=RyCBVNPqEW0zuUlohfUJLkEI2GPhiZBz5mwYpBOsGEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwgXxXNUohs+zyihbXS66TbxfiPKgd7baWOlTB5vp+1dPxxREUt7zeqNXfSCWJ8iW9smx2QKg2EWCM39xm7f1nH2zg6FpWPw+Tqxt06CHpO6QGvqJGUu/2KfFDcd8ZT51k+QFOtTMsLmBvtzIvKFfZhJz4QXlSjglTJRG7Y/2Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NoB5fSkr; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-608e3530941so7350587b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199629; x=1709804429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyCBVNPqEW0zuUlohfUJLkEI2GPhiZBz5mwYpBOsGEA=;
        b=NoB5fSkrKSan6ocgY+48JaFctszv3wGxfJInJpm3/w7juxaA2jVAFe+Tk/9D7D+VlO
         7rg9vFrwDh1QtdIeirykcHCRnPNTsNo9HEZsoLXHQpxKidhSKAXgsYX3CVB6rrr8WYmB
         TAiqBls+AVh4DL9LszDTMyK81dUOmNo4T7krWGb+qR7qgNEl+xU/MhkL+3eipI0JcJGo
         Q0JAFs8x+iXikHhB/gol8h88S6SiA/SZ4QmyWMR4vQDrCVef+iZZGlfzqP3GJ0dBZjYu
         vmn/2GSyPmBCuKDAq7boWZ6w0ehm+LrlgUXAXfueQChKt2QLCweRe4VyesezlmFQix/3
         ZViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199629; x=1709804429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyCBVNPqEW0zuUlohfUJLkEI2GPhiZBz5mwYpBOsGEA=;
        b=sLp2+KgScCsW4VVTlJyPAVKGEOk86aPvfHY+iWj89fwVjVnYr5ERuhmCWeZUMBFZLq
         uS6IBXOHav8souCec2kJq2kFEhfQgM8ZxsKcpELDb1zLU6DL1p4D/Kmaa8aFsFs4vPxf
         kvSJBtz2KM8uJ4qR7F+FTniHZoQVx2YLTQfCQ4UG2/t0By/5ujapQ+2W4sryAuHU+ih4
         f/Ln+8nCHr6GvBCbr6+eIO3kGp3aCOr586nvaqYbTKwn+aQPrhWV0XRAjku3PEpuGeJp
         kfGOWIHtI1tq61zkRLCsS2CehJB612TtPVtK/459RKC5Vd2g4S4dc1FRMTV6MIj4bWOL
         +tWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFVPU1rXHo8Uv5EF/Az3qjbKd71Uc7Sj67P3aHW/72KwDX1sk6hn5bsVamvrpNLM4u5NeHmDWTUX0MlwpHFKS+C1wgy+cJDj6sTQ==
X-Gm-Message-State: AOJu0YxhCzhgH0lkp7X7szT+ij6yF3pWfMQSG0STBHFXm1gi3nF6xL4Z
	DUDu6wgpV1Jq01uXXa8gQnJkc9hgwHN2XBAbbNWwhde0TZXKP0ISNGbREj/QxRQgBOm2jCMu5kO
	IBq4YoGkUeb07Dk4PazeQ1zWVG49JAGgKwaRwjA==
X-Google-Smtp-Source: AGHT+IHfQ43WG6L84XSpM9t6dnL0FXVQqnymIslzVElLx/G8H6q4X7drU3fbrlbaRUAKc2KmV8CN9kVt8zL8ZNMFCeI=
X-Received: by 2002:a25:aa67:0:b0:dcc:4a0a:d0ba with SMTP id
 s94-20020a25aa67000000b00dcc4a0ad0bamr1560428ybi.63.1709199628907; Thu, 29
 Feb 2024 01:40:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-26-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-26-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:40:17 +0100
Message-ID: <CACRpkdb1-KH1L-ZPqzf7Y33wUeFSNvfjnRt6-YM0zxgW_4Y39w@mail.gmail.com>
Subject: Re: [PATCH v2 26/30] Documentation: gpio: mention generic_handle_irq_safe()
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Stephen Warren <swarren@wwwdotorg.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> generic_handle_irq() must be called from a no-IRQ context. Documentation
> advices on using a fake raw lock to call generic_handle_irq() from any
> context.
>
> Since 509853f9e1e7 ("genirq: Provide generic_handle_irq_safe()"), a
> better alternative is available.
>
> To: Stephen Warren <swarren@wwwdotorg.org>
> To: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
I leave this one off from my branch, Bartosz can apply it separately.

Yours,
Linus Walleij

