Return-Path: <linux-gpio+bounces-23798-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 612B1B10D99
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 16:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81DF05412E8
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 14:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80492E2EFC;
	Thu, 24 Jul 2025 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2+HlHoaO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9E72E040A
	for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 14:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367106; cv=none; b=DkzPGSYh8iDWK7zJhZFtXTuxceqYsm3o9YAGQUuuNU1xPmvREeQ535mye83BBtUcHsyHU+luKxsTxLl+bB2lbvNtTti/Vna+gxzWnJ52x9q1kfa7t3hkv+D3M5WGI2Xc4ak0TqJVgB7tfpjgsih0ikFFnWVCEhTQ3JoMJtRP0zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367106; c=relaxed/simple;
	bh=tfa+6qezgu9C6sQHtR8RqJsOg7dClKGTFK37obBkvWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aGl+81Y2DTYoDsGqCHt3xptGTdoq0VhmZDL++T0SWR3YEZP2OGGavPsvIdAAn2jtYr7tO9edGZ7Gul7N+sjp+YD0tOyus+fkVfb0OnXuR5lnm58YNuUD2+8nGmqXtRQIKcPgSLAcB7U6sGkPo1JikQGoO4UDptbUCQXqM6JEKCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2+HlHoaO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b49ffbb31bso753269f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 07:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753367103; x=1753971903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDwsomuNdj41hPlMWXxN9KpqGOWNIeXBjQB5e/Iw7d8=;
        b=2+HlHoaOpGMRBkyrfCsGbcyWR5Zr72YHFEW6t/iSRvc/8ZhkpFZERulVw8m6ySJhue
         Wny1dQNbDu+lg+JxmJmLOSkzoAzllKzDrjFSHZ30+MfzI6/ewrxM7Lmar+3Vob6O6Aa4
         avubPFaCsT4h1vW/tC0tg9OdIHob3ngobWLFsDe5zObNHairVpDIVoYbstIWCv1tld8s
         BJq/ccFL3DKGbwiY4Ri711HYZtIyT5tCo8L/Vqljtlx7rBqb5EzOSi69mkesdL2CIzHD
         1lob5Vba4/NcwFnr8pyI2Fvul+OvFSGbBrKHXeW1KCK6umGLDWMgbier3jgxbSHvrl60
         rsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753367103; x=1753971903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDwsomuNdj41hPlMWXxN9KpqGOWNIeXBjQB5e/Iw7d8=;
        b=QiNCSItSmTIK06OKF8r2agax363ojCplbkqsem0Z89B1dLYSRpEWjcT9Y2/XhPO0rN
         cQ+wae3/IJ/t91NdXBA8krsZWOrMNMJhPJhcpeweAsQjHEcrJOVh1okPW9ZETbfWbsFm
         qISzqLCtM7j3A1VGheSLjyImFHSX4ZLp3+LCJjKCOJSgXKkFmvcQKuIxpO55EyHsNPY7
         TcLX+mi7F44BlXF6xZo2ALQXF+6k3Jjq54wHzeG8yW8X7XQdyLS4goHJ9W+kYuwB6/zo
         IQsmrPpKQ1akB1ffazqieqkUxp+FcOZesZ6XMGAXmvvFDSE8jIUb7WswGPvG6vHYvMdc
         VuGA==
X-Forwarded-Encrypted: i=1; AJvYcCV7QVqG5VwJ23JFs5DbCHwmYO/8Wz9LYXLmIVG4eCUnZ+P2sR7TiFt4FGBIIOac4mi9aO3oEDR5+1db@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg22wjzzl6GhAVwC37PFFBChy/kBH8Rwum4EYaCUECFgKe0FZ7
	zhsv48dIlCsDqBZWxybi35eZAFwNPiCUh6YxqBYW/TuxTxda8GweTk485AeA9krHnVI=
X-Gm-Gg: ASbGncvRxPW/8pfm8E8N2XmSlav0BNJ+3L4P2nLnwvIqstVzGStE8tCp8I9NxnEBkAv
	zzavXZRxfVHbpMZQbF1PIZkOIzbyvPOcSqlDRRGx4hyiE+8+kASlD5F5w1CBKtbtKASJILB+kQG
	C/6daqdNWdCbk60D9SEI+IV3v5KOSlkyQtPS6n20GUY26gC64Zo+zc12hpPy1hHmjhurJQMxn1d
	oYhOPlZgwjZSQLK1FfQj1RJK8Nsy4y8mmDTKUfpPNuvJ9B7iMyockIu4DEspalVan3Aw9RaF43N
	RUlRjm55MjyOsHfDIzIqE5H7ZiWB6XeBI+UQO0s3Erarxr5HjttKbpQc9d53nj25OqS9edI4yYf
	W8A2Q3h5wYCOpYw1arQ00yHg=
X-Google-Smtp-Source: AGHT+IFVpPmoVaFnnyv2Q8MVKhGmzvbvMJGKR9lhr6Bsj/oTsmU/UJpFU4LVtR/XBu0GzRRucBDVnA==
X-Received: by 2002:a05:6000:2283:b0:3b7:58be:8fc with SMTP id ffacd0b85a97d-3b768f1f235mr5772547f8f.43.1753367102982;
        Thu, 24 Jul 2025 07:25:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45870568fb1sm21858075e9.27.2025.07.24.07.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 07:25:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Peng Fan <peng.fan@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Koichiro Den <koichiro.den@canonical.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] gpiolib: make legacy interfaces optional
Date: Thu, 24 Jul 2025 16:25:01 +0200
Message-ID: <175336709883.93776.16672644078934370200.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250722153634.3683927-1-arnd@kernel.org>
References: <20250722153634.3683927-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 22 Jul 2025 17:35:43 +0200, Arnd Bergmann wrote:
> The traditional interfaces are only used on a small number of ancient
> boards. Make these optional now so they can be disabled by default.
> 
> 

Applied, thanks!

[1/1] gpiolib: make legacy interfaces optional
      https://git.kernel.org/brgl/linux/c/678bae2eaa812662929a83b3de399645e9de93ad

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

