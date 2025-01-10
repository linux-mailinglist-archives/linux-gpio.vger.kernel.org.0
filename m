Return-Path: <linux-gpio+bounces-14651-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BCDA091B2
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 14:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64BE8160BA7
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 13:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBAFC20DD66;
	Fri, 10 Jan 2025 13:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CsD4u4Ri"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3758120D4FB
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736515205; cv=none; b=IQgLULEMolEehlFbXNkYb99YntSi7mjqccGN90nk9g1W84vqc9HIDlJzgARyNToHV92QxOhe0i7u+aMgZ2347OVvmthg0tAYXdwrHHKfaXR/PfIbem8W8i+1aufjtqtnNiuPeCCHmuisjJRwHED3ABlkbrKXSIQJ+ZocgrOLZCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736515205; c=relaxed/simple;
	bh=YgGaihhdEm16P6BN/0D2AnXtkfWYImkqWOU1tAuXSpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T9fnL6+7ZSLwEmBTlCyD9hBQwF1kHH8tTbqMLPJSygIN41b3hNXtAOsQQnmdQtw2KsYBJ+GShTlxlvvkmYbRhsnoJrENGuSkbG7QaSY/Sz5+ECTlPYWYRYNRjCUeHXvMfpzooDmdwHv3vRR417o7hODF1ZGC8+RmgepEAz/8ndE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CsD4u4Ri; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso1138885f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 05:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736515202; x=1737120002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aYub8srtwFquRQbR1cartMALSRJRof0rf1Eom7MQH8=;
        b=CsD4u4RiSOs7a0C3zRHJeG8gaNi+zf1hOA40UHiY3LGC5DqYRvXkkq4aoab9Nc6A7S
         N9HuQ3N9A3syWgXbN+ifIk1j3eTxmHbaelTvCtMDB/0EXWDPKeLCSGI3uN7OqvIkJYm3
         4HSkCx1M8k67j0r+iDcSmF4dw/HTJAm8bvIQfFCQqOVuO8HFJig8Ie/NSMl+iChOzFR8
         s901wyiM8BLzsGGzyQsQaI+W5GOiSIM5euTTIC1N9duqvdKmMSmDh2Ohxxdk4zuiqDxI
         +UTc7jVjgtJGoCOTvHQeoweTRoEBdeT5UNDVtBob3nDbW92WDMUeavI5VWLWSYiyn0Fi
         8vmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515202; x=1737120002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7aYub8srtwFquRQbR1cartMALSRJRof0rf1Eom7MQH8=;
        b=e+PuzqapvUPMqk3S5HqVXddYAG+pnCHshlbKSGJLRsQklrgSVMYhqntGh7rX3Yd7Vp
         Jihq4n1nq01SGodw/ZB1LsvepTunmaeId1/shyE9c0L31FmR9gRx11TD+pnTMaLGz0cb
         QJB871AhF7nz8MJsIiD9zg7YeHgo43nsobGDV1nCvcxGNAkYFOVEqS+wJdH1yWozD8v6
         l9YY1UMZY4BxX1T7qybG7RMDAtuf5vgE6kSdyjKMO4UnYM7hJl2rKbvAhtq+dAvsna/9
         YmkuHfqf7OcqI0Zif7vt7eTUgICsKnGpJuhR0l+Nl52QLH6/sgJVo3YYVmQx1rK52I1R
         MnCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuuP5dfLH+OaBXjQVeypH5hlu4SfFDmBj0qpZ4eSkIl3tSX7sgydYePeIctm7EfLyvm2AAUlQKhRLL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8E1Kf2OOWZ10i2oTS0sNUXG3X9SK5qjH0xAP65RBprfGC2yNO
	pY/GOkpE1cZynsRgDKgEKeIfaAePxbRYVnJBRzNhF+QF7y+lv9uPztnjF0Cg2ME=
X-Gm-Gg: ASbGncvwRy1gPAjt1RBTVP1IhqVed8GM76kGrXtoAfcCmazWeF1rDR5WbgjH+s4uZFN
	pj7vP5xAqFRnh61huPqg/qyOWPVFz7f0OecItlKDiGvzW8EPHhpmd4LXaf4B3rAXV5ZAGhteasG
	o69RY4BJO4xpsME0QXSovZIyE0azaerHdKJZFon2RSSmweWib6gnftUQ0lrLbBseOuNfkUcXnn/
	EmDCIQGEX3zUdLCak7haD2NphD6ZtUiIB2NtbSYVu7NbdvK64d61sQ=
X-Google-Smtp-Source: AGHT+IH/1zPEwfEbt4NuhC0mzqPbS07trRTZkTCvgti5HQ4pwX+jbQyFZ6+94Z5NuOX9xV0We4lfvQ==
X-Received: by 2002:a5d:598d:0:b0:385:e8aa:2a4e with SMTP id ffacd0b85a97d-38a872ec201mr10231741f8f.31.1736515202549;
        Fri, 10 Jan 2025 05:20:02 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5581:e96f:97e:b3a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38bf65sm4491539f8f.49.2025.01.10.05.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 05:20:01 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	jonas.gorski@gmail.com,
	kylehendrydev@gmail.com,
	florian.fainelli@broadcom.com
Subject: Re: [PATCH] gpio: regmap: Use generic request/free ops
Date: Fri, 10 Jan 2025 14:19:59 +0100
Message-ID: <173651519218.65575.13189827123341171329.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250107201621.12467-1-sander@svanheule.net>
References: <20250107201621.12467-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 07 Jan 2025 21:16:20 +0100, Sander Vanheule wrote:
> Set the gpiochip request and free ops to the generic implementations.
> This way a user can provide a gpio-ranges property defined for a pinmux,
> easing muxing of gpio functions. Provided that the pin controller
> implementents the pinmux op .gpio_request_enable(), pins will
> automatically be muxed to their GPIO function when requested.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: regmap: Use generic request/free ops
      commit: 5ab3b97ef9d4bff2513994ef9efc6d95722cb902

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

