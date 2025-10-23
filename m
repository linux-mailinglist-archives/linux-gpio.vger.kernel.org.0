Return-Path: <linux-gpio+bounces-27526-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F2AC00F8C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 14:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D40E33A2EF3
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 12:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1D030DED8;
	Thu, 23 Oct 2025 12:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uyG+8FMJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7096F30C353
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761221153; cv=none; b=tHc9nNBk1IWcyH131Rin/ZZfnR52exkjlQ180U4u4Ixxu0G5xaBQlTQ9YscI4DjdKimxd6JrotGzG3/B6IgKi930qVhYIuTIOTkj56nJcac+v1JSWXdxTEu5SwbNVysD3YHa+NbtwBDB9LJb1fbslTve5ns7nznwHvaSYSjtpn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761221153; c=relaxed/simple;
	bh=Iw/i/voACEOEUB0dl8Hwa2eGsgmSTL3oU67E/m1QVYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/gB7896mWRmi+rPGaP0fsrC6qghMeQwnxmPYYBnivgEkj0nPq65/9VxwM0wma/NPLkGlaXnuB8Zf7dY4sLA6nG07OZ7ISPlEQKXg42itq/EQ9c+25rX1O60kWbcGeUw1Ui1vJEJv/4koK0LOq/v8OjkhyP3F+9DsFVZoXDva9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uyG+8FMJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so610401f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 05:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761221150; x=1761825950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+knHP+hH8wtFXL9FrX8Adjy6J9Lu8uJnSEg3TGlm3I=;
        b=uyG+8FMJ0sbkNL3nSa3XQOzVI9s2QM7VyNyk9i5TN/UqebVdXbkmHmklYMIX3eodcS
         XBSO1VX/OK+f4qVrfG8kWhp1OaiLxPQ3tNtH0Of5rSk97HhQHfI7LUGoXsXr0OOYABxD
         Y1IePlPMCdWYddBRTEIzxzfyttWk5KNnBeUDrelBeopSGRQ0O29PV+qxrGSgqvRH1rdA
         Qe4GD8ofcIfS3+7PTbQfNzTnsAuqpKJR60NsgDuBuloKnl+3McuZP52DONiXIBux8Vfj
         /27dJ9qYsIkS2fxxLtrORNpy7X5iL4CQbYOOxvKZLV0kUTSs2ZSyK9D42ytpjKLHVqU0
         qrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761221150; x=1761825950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+knHP+hH8wtFXL9FrX8Adjy6J9Lu8uJnSEg3TGlm3I=;
        b=qlCac0MczTgHU7v4eAw/hPrVLshUfijeZCyHplcy9e0nNLFjntHn2x2DGrtvXQdayc
         s8csvQXGu79/R7qkNkq7TX2LpGMS5peckX+1+q5iy+JezxWSllRhDAGEGrsdVkpSWA8p
         ysxzOwZ5w4G1zrVqOIU5FGDQTmtg3Vbw9/VcKNgrv3U8E9C/SkniQVc+M0atFjW75LsR
         SThbSOyoQyxB/dITevtPEn5yZJE+1ZnXfl1WnB1PRBVAJmrbn0zfYx188AL7x3HYw9ks
         yti4Zw7Q6v2ufK3SlncI4be1zFHRTYcBdzJMzzBUMWWG5oTAsvME3/l/OCDOKAersQTd
         ezrA==
X-Forwarded-Encrypted: i=1; AJvYcCWP7CN4o6lfpYIk8M6PZTasbExXtJEgRHJ5UgvBq+hAWKfdZZ0o+GNjFDcThq4wzbeGWdoCjiPvFTQy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7NLlLpoBAqAQlxyZXA+U742+fXrf6ND5kJmLfvourI+1bjXp/
	M4q3CdtTA89OOwwJ/v+ZnfzMdvsRjZRKMEIuYnEJwUh/ym1LBunGwsioR3nR+rUmdDY=
X-Gm-Gg: ASbGncvtT0+oV2UrydGbWi1xncRQi5iQd/mq8gkidXnMy5zRbh032LcgUFB3eZqaxMg
	bOKwVrFzTAuKRNNW5iY50DZitk+cwKufdYl/Duf8YhFSoeYYXK4XLcvOqHF0O/PHBoXE5wD4TdK
	uAB7Vlz6ImCoqKSpqYNIKPBudASaOPsTDjylAZxc+r9Wl6GzpS5h1fygucOq7/8xIbDwiWRdtZq
	t26LVpKrbDnnMxT5/YInVZYjS/CC/8vpwU6GktigAX91U9QTRMggdZU3H0Gg9haq0Yo3eTCJpI0
	wimIi1k6E+bTO5TBs0cxOlJwPqV3m1KMuH/DdzLrV9jV1T1HBox+GJVTFtqNtPF5NWuLhMzUdDB
	Bt8FKXKeRGnF0C0tS/21hjTCqz95Vm0DRVVT7ubO+osx6t3laXF+5vNHXvQnFCvlxYZKgznGAVq
	rnWbwldtaT+Oikh2KO7aHOzg==
X-Google-Smtp-Source: AGHT+IHwJs8vP+ZphKLVg8Qnj866Tn55HPAEvE8rihx7f3rOB0WHPIdkAlWdTCpxtTyY9j9MwN+iRA==
X-Received: by 2002:a5d:5d10:0:b0:427:7ac:5287 with SMTP id ffacd0b85a97d-42707ac52e1mr14432699f8f.34.1761221149595;
        Thu, 23 Oct 2025 05:05:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1b4:e02e:c538:6feb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e763csm3719949f8f.6.2025.10.23.05.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:05:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v6 0/8] RTL8231 GPIO expander support
Date: Thu, 23 Oct 2025 14:05:47 +0200
Message-ID: <176122114012.40841.4682534085501812836.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251021142407.307753-1-sander@svanheule.net>
References: <20251021142407.307753-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 21 Oct 2025 16:23:55 +0200, Sander Vanheule wrote:
> The RTL8231 GPIO and LED expander can be configured for use as an MDIO
> or SMI bus device. Currently only the MDIO mode is supported, although
> SMI mode support should be fairly straightforward, once an SMI bus
> driver is available.
> 
> Provided features by the RTL8231:
>   - Up to 37 GPIOs
>     - Configurable drive strength: 8mA or 4mA (currently unsupported)
>     - Input debouncing on GPIOs 31-36
>   - Up to 88 LEDs in multiple scan matrix groups
>     - On, off, or one of six toggling intervals
>     - "single-color mode": 2×36 single color LEDs + 8 bi-color LEDs
>     - "bi-color mode": (12 + 2×6) bi-color LEDs + 24 single color LEDs
>   - Up to one PWM output (currently unsupported)
>     - Fixed duty cycle, 8 selectable frequencies (1.2kHz - 4.8kHz)
> 
> [...]

Applied, thanks!

[1/8] gpio: regmap: Force writes for aliased data regs
      https://git.kernel.org/brgl/linux/c/ed2bd02d24947e36c9438bee1449d9bf87671b16
[2/8] gpio: regmap: Bypass cache for aliased inputs
      https://git.kernel.org/brgl/linux/c/3233741c0be59dd224e797deb2dd1621695ac95c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

