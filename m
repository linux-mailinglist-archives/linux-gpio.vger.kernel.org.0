Return-Path: <linux-gpio+bounces-20227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AEFAB8A22
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 17:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81D241BC47DE
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 15:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CF920B80D;
	Thu, 15 May 2025 15:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RbKW1qQ+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD01B1EFF93
	for <linux-gpio@vger.kernel.org>; Thu, 15 May 2025 15:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321299; cv=none; b=OUZsHGJ64GjPfEHb0qagefkA+OPqisRk5J5za7v2pbDcW99m3v2S5ivMSPORb56DjGfsLElDZi+hZxvVO1aJ2beM5QBce035/7aHYEQW8QHSc5zKoloWjaHnhkJqr1dOvvhnC9fQDp5eZWxZ9AL0Dh0k9GvtI5KLfHvYEoM5Hdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321299; c=relaxed/simple;
	bh=0bpgmELm9pb0sTqZLHy84T/BAyd8bl3vq21w2L/4rbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b2HWQr7zxdJ1deePm2QbNZFARcdZ3C1EsWsRK9vjX+hZQoa8yCSONvZYsziHHjvXQRy0fcHdGJeeIeGghtC2BQCN0qJSAFKjoOGxvCDJx3cRvU8+gldoZjxC7TKC2hRWPJ7pUgIiJ4mZP2h4HIfVztj+cmcwTStATmFkNzNie9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RbKW1qQ+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edb40f357so8275085e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 May 2025 08:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747321296; x=1747926096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+ExZLPgDVqN/4FPN7RMRww8CSWWl502tOiZJcg9SzU=;
        b=RbKW1qQ+wXt5d6fGV19WSyFsSdtGy1xU2SR7jN8WdHqmQvuI+5HKHJM5pE4gDH5MCQ
         qZl69AWj+lzhciGLw8V+Lah84JQUvPmGYbQCehrC4SHxnvP5VG2cq7d3lrIxYqEcQH3R
         bwNXHxYfuHD6Sh7kPaWF8UzkFm+bUs0ThAZhrE3Ttgk/En7jpiO1jYCQveAhMjUZhRgl
         s1iQjl1qfPgDxFqaavEy7TZieg8GSixaqlaIoOB9838IcdBcVCzriYuf0We/0wvKA1v8
         L9W77xtW2zZwT7FlB6p8XV+lVZPgruXLlPiSAsBURbs8hY32tSI8Xv6ooWYs+jcQuAta
         f/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747321296; x=1747926096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+ExZLPgDVqN/4FPN7RMRww8CSWWl502tOiZJcg9SzU=;
        b=C4pLqwAUT2e8IT2A0uggsMduZGITarqsCHxBkn4dMmBisJIC4FUdpG+jpq+hZkq+LO
         1LCIYt90tpuU+3J8MN+D4Vncp07ZioiumCxmF29i4esjDRiCE58y7+l3Z4GriTQSpLSD
         YN9l9zsDmm8GIn4sbepb80f+SsghcGPgs0Ah/BE6eET/0b60Ybe6VXtTwcUk00jKQHZT
         cwNwyPNZvZLkttCECZFjxZdZTRo4XcgircMkMwE88Skni5YC/a9FyiL9Af6yo3VMsGrD
         GTZkeZiq+liOM2FicpvErhJrilmymfz0drE/YF6AuiU29SGiXoFTAYX/5coNkhL/UZUZ
         uChw==
X-Forwarded-Encrypted: i=1; AJvYcCWDhjS4NcHYR1c+Ij3iDatv/FYVWKWcpzdJmr61thhT8F4hdob7cc8M4D4ifcO4/G2iGYil6PAudo/8@vger.kernel.org
X-Gm-Message-State: AOJu0YyvX81ym/vPlhOHD9QFL2b0jIi3+f6toL+SJJD1W5quf3HP634m
	r5PvrzAZzdyhR26i2uX8Y2tjham2plP3YwCp6Oi1WWKrUsbNzAaWH4gJ8ksWuw8MdLo=
X-Gm-Gg: ASbGncvhLuY8LVjLwPc4mQ4sgg1TaoSTft5lTnigqIhRIeZnxwYacNhId4SrDjdQrj1
	xxYayIs448V/fOAJPA08HpYVuXdaq4BhHXCWXCI2mhd/tJPFKBmpJTLddxY0ieE314+3AgkkLFU
	LnDcyaaOs/ytCmPCkcP2odVfyp22dw7IvyquM2fVe3DV4h4iVVdSmPx+NcaFOV1U48FePnfEHRz
	ReSkNEWJC+aZDFM+NJFevU7faNclwsUbZyLDDKvGcZbsyPV5WdjSPcPiEpj/nSamnU5we49M76w
	Jy0iu63vLml1XPkNME/wfuCjaoXSrY62a+yGhtuJkc5Tf0ur1Xo/ickoRx16mSspC6UnvCdI0Kw
	/nsWmyBKGOogwTyil7zrKSb5L
X-Google-Smtp-Source: AGHT+IEaP32P+mtGWKd+DTEdhUkGNIOD6/Ha+Kt5yoVGB1vbS+3gB2gBhfdgIpL/XkzyzcsRFJdbcA==
X-Received: by 2002:a05:6000:188d:b0:3a3:5c7c:1889 with SMTP id ffacd0b85a97d-3a35c84fc73mr60948f8f.52.1747321294274;
        Thu, 15 May 2025 08:01:34 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde01sm23388046f8f.15.2025.05.15.08.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:01:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-gpio@vger.kernel.org,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/2] gpio: TODO: add item about GPIO drivers reading struct gpio_chip::base
Date: Thu, 15 May 2025 17:01:28 +0200
Message-ID: <174732127891.17102.13995153594267301956.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250507-gpio-chip-base-readback-v1-0-ade56e38480b@pengutronix.de>
References: <20250507-gpio-chip-base-readback-v1-0-ade56e38480b@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 07 May 2025 19:28:00 +0200, Ahmad Fatoum wrote:
> Bartosz requested that I add this to the TODO, so here goes.
> While at it, I also added a FIXME into the driver.
> 
> I'll be away most of the month, so feel free to squash changes as
> appropriate.
> 

Applied, thanks!

[1/2] gpio: TODO: add item about GPIO drivers reading struct gpio_chip::base
      https://git.kernel.org/brgl/linux/c/833c086f22ecebe576af42051733796d1690dd71

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

