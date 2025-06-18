Return-Path: <linux-gpio+bounces-21763-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C77C2ADECA9
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 14:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E063401837
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1DE2E3AFF;
	Wed, 18 Jun 2025 12:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gt2kqujI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE522DFF2F
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 12:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249823; cv=none; b=YEhtJJPi42G5vfU0RvwJI+0sdo1RAToXgBNSRyh1plHNYaFEOWk/vmHbSsgA5JBQDZ0ScsCVkaHN5L7oJ2FDpeIWLfP9KoqgyMCh29eJlvaQBH0ISl8LjFJLoiVT17hFTWmd1XZ4WwKpQ8brYR7RceaEzaYUOAEOQMWGw5h1NYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249823; c=relaxed/simple;
	bh=kAygI4ev3hipA5TKiXNVmwIcsZ7+rgvgVA+GO6/6H6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LuwqgLbtrJbzniNCcvFlgdHnPPWtpFln80ffjtRD0goAjI64BBEs3YeIGxXdBpaM6gF/WQ60wYelRGNpKzte3HnkqkKhmesXo3J7SzDwRn6lZNtEX2Q/0DK+4UbQES1Vz68+AGug75RL9X1fH9HaSebMIQzr6nizxzT+7n/IA0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gt2kqujI; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32b43c5c04fso7016401fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 05:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750249820; x=1750854620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQTB75G8uUgBMyAAX12JhH5txrAj1DcFBhtKKz24PTU=;
        b=gt2kqujIOQRhobpZsC43ZPccJQpvV0MOA9tswi8gzE2uhkyFlrb1a0DEZZAWP+FUI2
         aPmHzTRnnMOWwU/Xv1botlOWQlt1PQht2ehqsY98J6kokAcrPIaaQUQ4pN9spGWzUbSN
         vQLWYOEzvmncavNohhTyNj/t5pc36yry8zFcGR9fzyj9YLf5wgfga62QaA0TRq/P1dF6
         QKTB+FQI57UWmDXBubzhBxJT2tn7d8H67EFAPWI9I/5Bpv8K6Eg+GzNYJLY6VT5SPU7U
         S/4P8fx6dMfJCwJiZl4WLJHF0nahP0mHiqfNlJnlb5rkiNw4XmVA4KSJwwhYPmGMBNbB
         OGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249820; x=1750854620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQTB75G8uUgBMyAAX12JhH5txrAj1DcFBhtKKz24PTU=;
        b=eDXIPBTZ/8qqWcUXksE0HVhYyyBD2FGCombk//YDEqAoVsIXZmAXqjsYYg2f3Y0skG
         mV1ycNx55p7/pLgr/Xwxl+ejWYHVAWjbDOEiYlf3qpxizx0F+AbL65m5vlbXevp/HqNX
         vNThj8QeUHIezHlPfZ+1S0whUDk/1C2V36JY+L6OeuZbVcD4LUiHeV76YJE965Gwm6zk
         HHhvDQfpOP16oWpiE8k4BEZUw/W+nuF9C5NXtLjgfVgtcKnxhXpq54YfJiv5wV+5UXyn
         JGyIToHy9WgMJHYnvR2QN7CEblJU5nn+XztWkbfcC0JdWiHAHixpCpDcnWcYRQUMM2Au
         iyFA==
X-Forwarded-Encrypted: i=1; AJvYcCVXq6K2n7JsMmCkpJi4NMgeI0ns6Tk0ZdNaz1aAARuTFNXFoTKTroTCggtqoyqF47VtfYTim5zZGW/C@vger.kernel.org
X-Gm-Message-State: AOJu0YwaUo/di+hAyaQgQOKn1QgC4dUO88EywIIgebLrBK/lCrNn+mBY
	yY4Fo+C7JLQnguLbyF/d8Zs39cqfycoMzDvDyKKFVpyz7qTLkXHI+DSjzjff4BxN8+9bVwPWo2a
	VzpDTUP9vmjCTcbbjtML9Y3oQVA0TWDYDaonMbNzysA==
X-Gm-Gg: ASbGnctEDe5tk6wQUdOKJyh/F3iG7Uab+dUaobCRr65g/MImy+A2H2UGYnHip+QaKkX
	RlDzW85oAM4E9P8iFBcfB01Y+jfrGu1IdM0zDaI2n4wX42CL2eT+G25Kz6+SYdV+jFhbCQDygSY
	skQanuIYvIsumGmPvR62w1KEI2EUYJsIXra4iDfOYcM3g=
X-Google-Smtp-Source: AGHT+IGIhRJFv1Ba6R4yp8rFo6dY6wGpRl5V6O/QGXm52fbnJBdughdFvLkQvf2FB3CR5WNkXCk+SFCfrmRt90k53JM=
X-Received: by 2002:a05:6512:b14:b0:553:2912:cfdc with SMTP id
 2adb3069b0e04-553d38ca1c3mr855269e87.9.1750249820186; Wed, 18 Jun 2025
 05:30:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613181312.1269794-1-miquel.raynal@bootlin.com>
In-Reply-To: <20250613181312.1269794-1-miquel.raynal@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:30:09 +0200
X-Gm-Features: AX0GCFvrCunV14RNvzKSZ2HTRXKME5qG74EO21bVrPNwSxtcFCcj-72MPW9Sr4Y
Message-ID: <CACRpkdagchPQke6mu4Ma=OC169Fkm6swnPxA-oO=XxOoGQ+KiA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: Fix boot on ma35dx platforms
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Steam Lin <stlin2@winbond.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 8:13=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:

> As part of a wider cleanup trying to get rid of OF specific APIs, an
> incorrect (and partially unrelated) cleanup was introduced.
>
> The goal was to replace a device_for_each_chil_node() loop including an
> additional condition inside by a macro doing both the loop and the
> check on a single line.
>
> The snippet:
>
>         device_for_each_child_node(dev, child)
>                 if (fwnode_property_present(child, "gpio-controller"))
>                         continue;
>
> was replaced by:
>
>         for_each_gpiochip_node(dev, child)
>
> which expands into:
>
>         device_for_each_child_node(dev, child)
>                 for_each_if(fwnode_property_present(child, "gpio-controll=
er"))
>
> This change is actually doing the opposite of what was initially
> expected, breaking the probe of this driver, breaking at the same time
> the whole boot of Nuvoton platforms (no more console, the kernel WARN()).
>
> Revert these two changes to roll back to the correct behavior.
>
> Fixes: 693c9ecd8326 ("pinctrl: nuvoton: Reduce use of OF-specific APIs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Patch applied for fixes.

Yours,
Linus Walleij

