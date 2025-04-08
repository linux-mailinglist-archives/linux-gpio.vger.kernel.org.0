Return-Path: <linux-gpio+bounces-18475-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D31A7F8F9
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 11:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00EC51683DA
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748C626461B;
	Tue,  8 Apr 2025 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A2qVtnb0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00CF263C7D
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103238; cv=none; b=Plrmb8C4Qp15nxtn+FPaQ0v/5gzslFDUs0vTqSp/tyM7MuejbPQR1w/Z/Q2HbCTS6xjayGaWYhU8yghoqZi9LI0SPKUTZs5wf0Wpq/CsKda2KYA70MN6RtKb0V9+cjgH/vxuez8TjdLp8VODGLgb5EB/QnszrFBNG/11b9t87/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103238; c=relaxed/simple;
	bh=ECKU9VRa9SZdC4Y2qpEahVNrW+AgpNO+ao3cSKtCDaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SN8FAsqVoaSWLQ3kaencZrN2cOmcRlnsQ+Q5qFJCeqxHcZJMIdY6JaYp864RaZhLtlyZyRvA/Pjk7x4M7cRdoVKP+eiA+4rT1F5t7puqyPlowyYB6XzSTEGmvaejAJK2sjhdKUnnFiz4rlFUvCljeWwYjR8mUynAdBh/HZJMbQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A2qVtnb0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso4050385f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 02:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744103233; x=1744708033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yL8NonFDAFn9CCY3B6fe4kxf++Mi5GuZ+sS3OjKRTAw=;
        b=A2qVtnb0KS92QF0sn0yX9qJQphNN6SpAKqKQgYEcfRXQRclsnNkaMmLDZ3qWL3hQ3G
         DdCEldQMZOxm1PCs9On0XAkEAAVNx0i9PyF2mufq6FvA1ia+lVxkuX8UeqZuMw0zth9z
         NIyg9LRPeYaqX39BMXsfKdVvuaqYWvZIDWuDeMHerYVQVQI6BsZ0/ZlGLo7ZDraJjyFi
         cksfSFHkHQlSPXvJYDU893pvAEDA2qCOv+B+Jl497WGnrPZTSflE5kqcVOksM7VqB14T
         A61eTcciTcAeR11PCvod8ET/QDWmWd/TgGOAGQTC6/30yG2hTdwUQrk8mWWXwjbyWSev
         Pfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744103233; x=1744708033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yL8NonFDAFn9CCY3B6fe4kxf++Mi5GuZ+sS3OjKRTAw=;
        b=JIKED+gQVW2mBLjTnB5K5QDjCDGPcJMCRoVtgWGGUF2vxckA+HBHbSefUqqmrEImmT
         bNqvb+f7xtAj7BY+e9/UeUx0dgBQMnxYh27hBQGnw4of4JxJKPb1sgPiCWwsj1/vuwNI
         MN87nA5gR/BJycR2VaixtSOu6Zi3Ned7Q0PZkhNlA/cEqycBRhldyxRvXOO0dxipznjY
         18+6sg68/3oPszuQCxWd1f5MY+kqFVGQhT865iCKsTIGAwN6BgUMNsFFAcSOcrI8LQuw
         9+oyFcewlGZZnCBOKEpOc5xDiyXeVhc4zF6jf1RVGqBcC7eC9Gqp+RC4jGjbneH6w3+v
         r8TQ==
X-Gm-Message-State: AOJu0YwIuOI5ba36JRHaSfFmTAptzx+vogr6HYBfQ8bEqoh6SEfksCdW
	eiZ5gckzCzoyDeqmltCbDd4fXthYwHVdjEzLUjnLDjRhuH/FzxEjFMIuypz4cescJJ/47xzpbJQ
	pkT0=
X-Gm-Gg: ASbGnctyXDIfN/Px/MbbSZqnJDPOwY9xiG2SeQzioyL+xmpTdeA3v59dm8F7cjekya5
	0jYBohMOitFvcbMnoE6rWtx0C3RteqpU/FpK737ROyEG593UHeTQrZ0lfMSnMZuUKj4/vjp5nD9
	e4A6wlBY5a9GRAAgImF+odPR8jptCMtsQjGAltW++TpQKncceAOcAGv4QCcUfQm0A3fCHt3Q+RG
	Ee2a9XfFfKU32e7yO+xMam7Ljd74DczKyBTpVzdJXNOxVVn57gxwVzGbEoD/YdxIuofKZspytXo
	4H0xfkmdWdT4eYFMs1352YRhKhPpzlMUGO7VSx7shQJzI18W6ZpuVms=
X-Google-Smtp-Source: AGHT+IEEUUCdQ8+KWeardc7yL2m3M66AWEIdgm7xhoUfYk5I4by5eAm7Hv06t/LMCbKlhAwYRn2RHQ==
X-Received: by 2002:a05:6000:2483:b0:390:e535:8750 with SMTP id ffacd0b85a97d-39d820b09f9mr2086926f8f.9.1744103233156;
        Tue, 08 Apr 2025 02:07:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a79aasm14580113f8f.35.2025.04.08.02.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:07:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 0/2] gpiolib: of: Fix and amendment of OF quirks
Date: Tue,  8 Apr 2025 11:07:08 +0200
Message-ID: <174410322474.42503.2626843932782716503.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250402122058.1517393-1-andriy.shevchenko@linux.intel.com>
References: <20250402122058.1517393-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 02 Apr 2025 15:19:59 +0300, Andy Shevchenko wrote:
> Just a couple of minor updates to the GPIO OF quirks.
> 
> Andy Shevchenko (2):
>   gpiolib: of: Fix the choice for Ingenic NAND quirk
>   gpiolib: of: Move Atmel HSMCI quirk up out of the regulator comment
> 
> drivers/gpio/gpiolib-of.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> [...]

Applied, thanks!

[1/2] gpiolib: of: Fix the choice for Ingenic NAND quirk
      https://git.kernel.org/brgl/linux/c/2b9c536430126c233552cdcd6ec9d5077454ece4
[2/2] gpiolib: of: Move Atmel HSMCI quirk up out of the regulator comment
      https://git.kernel.org/brgl/linux/c/b8c7a1ac884cc267d1031f8de07f1a689a69fbab

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

