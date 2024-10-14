Return-Path: <linux-gpio+bounces-11283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D5099C366
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 10:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19C6C283B91
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 08:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BDA15854A;
	Mon, 14 Oct 2024 08:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ia14Iyll"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE301581F2
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894717; cv=none; b=YpbVJmJScOoPtEOnd+yjKGlR4f8Y5eiXVxkY8/HL5XTgfvrV8BOS8jmRunVy/v9VSfn+a4wMq+9FxFRx7WcExjOYpT8U7/AAppsgVhnUOgK6h0P4oITweETYBCZ+4FaMXZSxlKYMT67sxaGutqIZXmoJHflXUO0B79PXMPaZqC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894717; c=relaxed/simple;
	bh=xjOQIBKFQ4hDmFj1xQS3dgUvVasX3HXJz/ZWRUBk604=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jJQfDWpksmGECtXCQurOVgPLrWT1ubFvxId7b3r7arTju0yRoiLWAfnEnAd9IICs7tNisrOfU2YECj5NjHoajMInkrIf0MzjA68oe4pObf4PBgmZFhQ9scfK3ODqFXrY+vTZokcVhyA6h3I5wbhAj6zhD3JSN34WAl3hmS++1EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ia14Iyll; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so2831735f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 01:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728894714; x=1729499514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C05OXST78BruJxxa1zeybAiFGS605rIOOOqnoYlzeWk=;
        b=Ia14IyllcEVex8j3UQM/n4lU3z6ZPqHCyfIqcLqFL3COeZbL3ADxK3Rati8OyUC2Cf
         vndDHb9lS2L/AEnD01j3NJCBFnb7gPln6c/sMYlMas2lAORlNDL8iPU3CTV6Ccno+vV3
         CuR/hB/YzYC2ryBw2DzUyOUgZyWAmtew62WKEqdBwgSg6p8eJAQwOxj17NSWJ8yDnsDE
         V+zyiWgNM9pmXtYQDeTbLkKIdDaoDPaqdDCxqnbPtGhAnjvNZJL3j1JTboYUCmtsC8Wu
         U/FcKP9UyJz/WZPPyR+lhgIFour8ppu93237a1shoY2J2icghHtxTUpqzQoQq5k+AxLX
         i/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894714; x=1729499514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C05OXST78BruJxxa1zeybAiFGS605rIOOOqnoYlzeWk=;
        b=wbzxUUW91z5+CMjQqaXbWKwR+45O4wNAGPfaXXsXWNtPA8hjYHgBhU52H0NjoWP0ep
         QPPhErKU9CuhnNpI8h9xbjPgAfq8987IqSgf+JCR+yKasBNEnllw4ggTD6u2dcJTRVKt
         2TbM13M1znp8MDTtO47OU9q//8xFlOFiV2vvDljFspwGSUGrRwGOa598sWXJdzRSsmC1
         Mm5BmzBydh2gN7qivZDJU7owvXLXq+Frv7zzy9Dqg54Q1L5uVCU9SNj4IzR34ssMGn/J
         8/nqmv+3vOIS+YWPR4XhJTJq5Il6kfJspiZt61VovOPlFrTA0EmIJjOsi/s4nnce7dMG
         1BEg==
X-Forwarded-Encrypted: i=1; AJvYcCWyasOsafsyywChmZVcD+2ezILEzgOGTXtgV1vRagcA1DuKaJlTn/y0mZz15k10//OQvEC3a4MQVAxt@vger.kernel.org
X-Gm-Message-State: AOJu0YylUpGdWOYommw0kn9FLpMuQYMdqz1wClpjz/gStS677/EJsKjX
	y43cl4L9h2o2l7CDIwGXZdcZu938rWmeFyqlU+W4MdbVagv64WjdhUYtUgw9Pl3+tFlX9/9PZAt
	e
X-Google-Smtp-Source: AGHT+IGftJe+CXGllU0M8y7/IKDb429f7k1VevaNKk/gKa8H8ugNvRkINgUHkF1YS1uTi9NYbjc9eA==
X-Received: by 2002:a05:6000:e85:b0:37d:4d21:350c with SMTP id ffacd0b85a97d-37d551e1303mr6392447f8f.13.1728894713825;
        Mon, 14 Oct 2024 01:31:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de54:ebb2:31be:53a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b7ed69dsm10737698f8f.92.2024.10.14.01.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 01:31:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH] gpio: mvebu: drop dependency on OF_GPIO
Date: Mon, 14 Oct 2024 10:31:34 +0200
Message-ID: <172889468795.57095.15111681852340725345.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241008081555.23465-1-brgl@bgdev.pl>
References: <20241008081555.23465-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 08 Oct 2024 10:15:55 +0200, Bartosz Golaszewski wrote:
> This driver doesn't really depend on interfaces from OF_GPIO so the
> Kconfig dependency can be dropped.
> 
> 

Applied, thanks!

[1/1] gpio: mvebu: drop dependency on OF_GPIO
      commit: 3a5ca23bb65169f2f79727c51a5495a2d7a5166e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

