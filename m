Return-Path: <linux-gpio+bounces-18895-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD888A8AA6D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 23:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A08A83BF3D8
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 21:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F412517A9;
	Tue, 15 Apr 2025 21:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZgY2IwG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAEA2571B5
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 21:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753736; cv=none; b=d+x9wqQk9QvXBo2y/wN3y6L+ZxE5rhshODi5vD8x4S61bWnTvFPLvBe9vpQwDba/cJNfFLfBRSQKq0XSNYr3WX3F4sIF/TQY2cllFW+PQVXCZyjCQJySxIW3BFgz/C08pv67mBMqlK4Vl0EEjRjOQ/C8ixHG6kqWeAGECd/L0Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753736; c=relaxed/simple;
	bh=w/GU520f/3jBAe24+ir+D2COnHV2dCfaPkORIPMWF9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJwjAIEfrbPKHxpcO8lW7/wqT/ehFjnj6dfhk3hW+2kbBoOkhptE6iTngW3B2Xfngfau1THBOHBTOLh4gkFCRuLNqOCUst2RRH9e0RwtP15sE54Hpw759STZmnOUycGG5F6USuCsVBWj2OX1/P914SLIaNjb7poIY3L6xo7mgTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZgY2IwG; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54acc04516cso1374196e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 14:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744753732; x=1745358532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/GU520f/3jBAe24+ir+D2COnHV2dCfaPkORIPMWF9U=;
        b=yZgY2IwGwDD6Xd1zIz8g/u09tiEAOCez4tZ5CdZUFsZJjjDLSgO5Gxo8lpp7B7EjST
         sq+4GG9ENMkoVBfyvICDzcFB6u+d0kZX6icRosvU9fu+0QKsOhoPRf5zzr/ikZnSohk9
         7b0AOHl6uX8I7uk917QviuwUTS0SrROnsqgE0vWzXDUM/zxCq+TXy9mcd/o6Ah58E2ep
         NcbRs4OoOtbeI1TVl9B2EIy+YxU2nUps9M5XMYRXBzTO+kUi7zGfRBej6koYTaynmGKk
         iKIqonx1bF5L55gUPvLfXkLnHK9igRQL57+aGP1jrzNeKMoIYkjDmM1C+qASqqWYqMkx
         q4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744753732; x=1745358532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/GU520f/3jBAe24+ir+D2COnHV2dCfaPkORIPMWF9U=;
        b=fP9w67E45RnC1z2OCysxgjmx1i1GH90x/KetLoTxO1xuR8Zs2o9OzqIP0Hlp4X18cw
         Sm46THkzIknwqapXDycZRa8Bu8YLVCn1OouqkUuegnYT6PxMSzGwlH3wY3vVF5iKgP5/
         +Oi0FRDCdVTVJOjRkI2NZftqSQ/YqWrcGqOb+nhLuJTBFzHxPSGrOEx5pj4M5XGZAPfL
         grae0txNsXXY26YDPnyQf4AVARp2ZpHUpXTYiPMRHKcGViMtTr0nYXzVyo9YebhXuImR
         LdnkfbdJ+Rs849Lbj52kvc8TW66VKJU/a87Yn+Rcy41L51rJJlmMQ0rmoXsDTjCXveXG
         dusQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH77Pu16oTPm+o+E4Q31PLetUOLnnLwsPUAxhJMvZ9in2KxRdjPUTIn/K9Ixz7VdWpOii82loASGX3@vger.kernel.org
X-Gm-Message-State: AOJu0YxiUQ9/UTD4qlNpF9ZgkrbUBWtSPBV82B04GDB5i21tDwzq5tQ7
	XLuMvyCorW2orpj1kQczA0TA32ie6ddZBad8ZCz9IlSdrafTTIG9Wa/7iSz6kjYspmnb/hL9eqC
	qz9rIGC4n7PdzWgHsWwC7VW0GfRSrllFizXNZiA==
X-Gm-Gg: ASbGncssSyNUq4v9Pqp0OIK5sJAz79WKjXwVgRN6mqFZNIAINIqX/i3mna+veyDaECG
	zqz1V80VClS1xAr2rMkL5/81Qm5wVdybnVN55oP8A6yz2ybR0MyLPEmBy0ZJZT8uen0TDpwgAqP
	UXdQVBUZY5G/veWHOyEumCSA==
X-Google-Smtp-Source: AGHT+IFSu+OKLB2VNur9Dle83J6HMvG4kflsWZSu9S8S6IR4G67eFIhSB0oS7wnO/q/UzPPA34KfjLwXTtDj9Vzih0s=
X-Received: by 2002:a05:6512:1328:b0:54b:f04:59e8 with SMTP id
 2adb3069b0e04-54d60517c07mr145437e87.23.1744753732331; Tue, 15 Apr 2025
 14:48:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 23:48:40 +0200
X-Gm-Features: ATxdqUHvlNdtzl3Q_1xgpiYLVxVG4W9MxWXBnWdrebvCbvJB7NiLnFtisrLsjeo
Message-ID: <CACRpkdZGmHqS=Ln=YF26aCLcuJOB-Zx3AUA8sSyf+Z_LJiC2Uw@mail.gmail.com>
Subject: Re: [PATCH 00/10] pinctrl: convert GPIO chips to using new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 9:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> the first part of pinctrl GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All patches applied for next!

Yours,
Linus Walleij

