Return-Path: <linux-gpio+bounces-20228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37658AB8A29
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 17:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B405F1896B0E
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 15:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B46E213E67;
	Thu, 15 May 2025 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Y0QEaw2K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD42204689
	for <linux-gpio@vger.kernel.org>; Thu, 15 May 2025 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321302; cv=none; b=lmaxg5lrw4OltrJauXEf9yFIYaIlFtP3eIoW1+B0Z9O1I37SscxsOX2x5AZCMVPfiLjLC3t3QWIyH4tC0dg4BJzfismRm5JHrIjKCuLQ8UnVXXqrDHWtLHjKa3lC4OZOeN+Hxlgd+yexNNqYIxsk52EGYpuloWvUItyfYs/UZFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321302; c=relaxed/simple;
	bh=gwvgls2VA7YH6b1HH+79Y0OYUFtcsjeEGBTt2xXU8y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AqwDJfWmsGVlUy2TjXo44rxoj7hJTiUWCxxu0Mx/ihoHxJyYmyKVfk8jQVaTs+zrEO18PUbVXc37od2XSFSza5oZ+boIK7O9HBikNvBeojoMkvHIU156TWYYn+5WANOVk9i/3LhqNAy+vI0yOKTuc+EszPP3N8z9grqZplFp8kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Y0QEaw2K; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a108684f90so685761f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 May 2025 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747321297; x=1747926097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLqMkFSPNEN1hS2qnrOzMpkhN6pHh1aoC/AzKLBLV/4=;
        b=Y0QEaw2KJsrhW2agUQoy+ViVYVnkIBHTpnn/nzdmiG/PbGIMAzkkdc5Ku/N+IXqL9d
         STNr2Y3zqe1QLwVxEivYRZF26iRYlNMjMpoWKFTCaP7zUSknW/ey2dAOAYdYk6KwN0LK
         yArS5VFfNaLHH3anDHdDAihG4GLQCtIYEH+WrxrJ124LHRyIzLtymn/raxz4FgBVqZi5
         F6Fl7PKF6tIxwRO76TuwwPmtme49mWwmEMVUMaLDIBGc2JntROICp+VTt/Vit3uUN7Ds
         rGurBsuCEYUc6lB8U8p/rQMjqh+fOOR185m1m9+HGsgN/RVVqsTeQdQvgwBmY8SPa7+h
         jo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747321297; x=1747926097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLqMkFSPNEN1hS2qnrOzMpkhN6pHh1aoC/AzKLBLV/4=;
        b=FuytBejgXzusRrV1tokJ3ostMSiS4bKTVe79e27GLpneww5FanYy6ic3XZ9THMKKSo
         2nAWXyR8kjOVkgDG/uPlY+98XTrRTIw3xj0JeMungg3C+ScTN072hxpXotdizjNGC6Pl
         E/G7SlZJS8SqmjSKP1R9lQerjQAP+EJWR0RkjXdabZFOQKTFeDf6NdnAZhVtCMV45bIi
         oZx8v0xjFla/dFoEx7OZRvo8Usv5K/PMOOwKGS36U93uVgXuMC/nj9X78P7/K88f3ndi
         rAQYOBbgOK0HgQypuTO+gqfPYkysmE4c1Y35So/Z9LSo+ojrP2V05ikDeVW3gq/wgQcd
         CcCg==
X-Forwarded-Encrypted: i=1; AJvYcCXADM7uRHjDhBUxEyAFEQWIe1KlcSzPX28ZaG9DpL4Mau0NTkMM0mWxWWgNXN+xcN1sVRdyUK8YVg53@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3F/Uj0HO28p88KHiCC8uPN2UliGgTmePtiWIBqBIXPWpMaSbO
	9m+R1YqvgdfXjWu5oARIfckFpfl8e6vnMARYsKJrm58ojTuO6t/emM3i+WRpWkWTw20=
X-Gm-Gg: ASbGncuDJ4ZYB8e00JAiM/m9JsEsccB/Sf+Gk+KpMh2JrWbdnNZQbEnz+d4bTo9zgN1
	MFJeHonBOYeXWPP8nlT9offzg20QJ7siqyMJajCcLMGRdjuNPhclITShh18j46axnyIep0Pf9z9
	b33HG0mIl7ruGojCvxBhFJ31QyylI11ww19eUvXhQN76zJ+iTksnFOq24biFVLtyi4AXMLPuleQ
	fVfOx3ieRGlnTQJdqOi4T329wnzv1p1B08JMzhThgAmjAKDqKp67wyxXHoMwo4u0ccPmF9zhGj6
	3YikyTX5lISYLZsj9S62Jq7EmRSGE1Fl7WYNayaW8fxsWST1bq8Qx4/V1ZXV0H4O34TAjR+U65g
	Iv9KpmJuCOh5XbM+nRC11d7kU
X-Google-Smtp-Source: AGHT+IGsAKFgjs66CEclWGo2OAGE7x2yF/O4CZXrBnVvBqkKBdDXu1lvcu3um1VWUo4w6Oo4wz8SIA==
X-Received: by 2002:a05:6000:4313:b0:3a1:f67e:37bc with SMTP id ffacd0b85a97d-3a35c7dca79mr128071f8f.0.1747321295486;
        Thu, 15 May 2025 08:01:35 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde01sm23388046f8f.15.2025.05.15.08.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:01:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: mxc: configure dynamic GPIO base for CONFIG_GPIO_SYSFS=n
Date: Thu, 15 May 2025 17:01:29 +0200
Message-ID: <174732127889.17102.8532614606603162153.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
References: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 07 May 2025 15:07:25 +0200, Ahmad Fatoum wrote:
> i.MX GPIO numbering has been deterministic since commit 7e6086d9e54a
> ("gpio/mxc: specify gpio base for device tree probe"), a year after
> device tree support was first added back in 2011.
> 
> Reverting to dynamically allocated GPIO base now would break most
> systems making use of the sysfs API. These systems will be eventually
> broken by the removal of the sysfs API, but that would result in GPIO
> scripts not working instead of essentially toggling at random according
> to probe order, which would happen if we unconditionally set base to -1.
> 
> [...]

Applied, thanks!

[1/1] gpio: mxc: configure dynamic GPIO base for CONFIG_GPIO_SYSFS=n
      https://git.kernel.org/brgl/linux/c/0a45c1a002705c8622738fbd2a2913acf886ea27

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

