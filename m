Return-Path: <linux-gpio+bounces-3927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6FD86C52E
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9BDC28E108
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D48C5BACB;
	Thu, 29 Feb 2024 09:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MyfEiDU/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567F156B7E
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199013; cv=none; b=fhout1zkl0Myo3bRa2GLT37M/vkQ3XxmS0GR/U1WCJTVah54tVVssfFNLvf9P3BIdkiT8AIVwJGyJqzjwNmFd28U9hYUtHFlzmlprNByoVUwwXYWN3b/rnrO2ml6/Mj2lZzGH94bBMdKOcov7PP7j3Y+Xt3XTESn48jHr0uAm6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199013; c=relaxed/simple;
	bh=32/5B0NefyE5Im6y4dgv6xs8UUdR/CI5RtA6xy+a9G0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=esPGEBAzzI9buu6i1EyFRfSjrH1UnNgBvajL/HGaaoAqd6CYzjgZcH1bHGVYxaF0XsAAV7WiJ3ILItRBajTQPU5W47EDINrIakcHfI4TiMKlTTDWTGnlGDUbIFOdTvrwJXYfQMq6XtePfc8gopQYByYoTSbjstLyeT1YqlVvdFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MyfEiDU/; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so1799465276.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199011; x=1709803811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32/5B0NefyE5Im6y4dgv6xs8UUdR/CI5RtA6xy+a9G0=;
        b=MyfEiDU/hNwctN/mfF8cFWJDLkWJklFEmmHrau5vDymWWXuN4q6gcJp/TiwvhqQ3sv
         FkgPV+pGtvVsLcMSdVMNhMvSll0VfdkBzon9OuMYeAow0hRtZEvF/dTkgErPcuiQEfqU
         fXDwJTyQvAt2Py47TjfALZeVh8FSJQPfBG2PQ683RpbI8HEWMLuns0V/i7GBH5zgBxkm
         G7xgFi+5V7t/2WT2lDXO5qSzMNdDl145xgo9RjDQMLvDThRb/Gaq5yCgd7MOtcWFA1Ho
         3DilfT8RLMdDnxGlpsW0xhb30RZ/azLf79zMK1htCe00x0+z9jIsVKCM5nY+LEK1/8AN
         +4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199011; x=1709803811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32/5B0NefyE5Im6y4dgv6xs8UUdR/CI5RtA6xy+a9G0=;
        b=pe2KZQJ1ziPpYKZxuYPJmwgZOogaJR32SHRBlypfl4aZLZi3N2p7n7lM8VvfWvRDG1
         FhYBFa3pK+mAULPT8zXtt3vUORzB5j0grqcdWVpzmVK9PxHlexzlrhpCtef4LsLqQ192
         JUMWLspt3SKT9j7iwIuTn2qve0GMrwKfHtzq0xp6NPsPg9NDq8Zjdqb2iMx0df7WdhWd
         KBowPwESZprJuDktOa6JC53u304O61WKFZMyAhf69ATYl+TWIt7MGA9fkBW+yWy7iI9Y
         wP7PqdTWmTvQJfyPja47lQiLPzJAsYvGzkuGsQ1vvuHZgu3TxbWiMRofb1hX6UgGKxOq
         B80g==
X-Forwarded-Encrypted: i=1; AJvYcCUkOVouUZiYzk+bYGBFDmzVFCf8nn34J4nL9cD/m2CnbZpF+4AFP05ubRAOAfU65oIf7fta7lSlwyDafeGFBapQE9adQJEunf8PLQ==
X-Gm-Message-State: AOJu0Yy2fs2YjuRAW+JShotmmPl0CD4naTIVqLVjGK2iISocyA0vsbbR
	V8IwPo/xHquyqu2Ftj9dXMpnXC8aN6amO5cytxH6eSP6JfJZbdOxsFJIDz7IepLtltRL8YwJ7zR
	xbLVQ2HxenlzbTJEO8om3t+UVM+cTfHrxkqJB6A==
X-Google-Smtp-Source: AGHT+IEW4s5E6g3mYFwqcNbY0h2ya2bzFGJoHdTzyRjvnNi+KrG7CYwSfoIGofcklwbV7Yav2ZNyUpLc2YKAqe52SjI=
X-Received: by 2002:a25:c750:0:b0:dc7:4645:83ab with SMTP id
 w77-20020a25c750000000b00dc7464583abmr853571ybe.0.1709199011587; Thu, 29 Feb
 2024 01:30:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-15-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-15-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:30:00 +0100
Message-ID: <CACRpkdYVuAMRAN_YDnZCzmjLg1+AbHyjSw7ymjCb=wFSL2=GuA@mail.gmail.com>
Subject: Re: [PATCH v2 15/30] gpio: nomadik: replace of_find_*() by bus_find_device_by_of_node()
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
> of_find_device_by_node() call by bus_find_device_by_of_node().
>
> The new helper returns a struct device pointer. Store it in a new local
> variable and use it down the road.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

