Return-Path: <linux-gpio+bounces-20034-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 478E7AB5361
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 13:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 044594624B3
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2823D28C5DB;
	Tue, 13 May 2025 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EMoLE7XP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458B328C2DF
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134149; cv=none; b=pk1Le9MfMALQrSST2Bmt3xq1OKcCVJIHHI9e/3X3hB92OskPTHvDogTOONAs2U33+4PCkZE2SjpkDkM+1+HUZZVMR86joYWaDkM76oD6plxuatI+5rpEqxFO3jcMFLcuk5Lj3DoL83DlI63A+jZth0zRBOPApHqgW+Py6Z4W550=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134149; c=relaxed/simple;
	bh=mssKbIoY65LmLl/b0fCd0FyJzxFycEEFgEHhfJY3hHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hlt4HYB8+Gs+bkhYLa7T88stfShezk6uGUOXpij6X6WEP/aCyxYQgHKk+3RkgpnrpxgHTC/Xrl9Y23KydMn49pxhl9pGUXvSWgtLkGJz/2+iw/wMX6l4v42162L0K1OhpUzMroy6hTHs/mylKUuA2dlZjN0jwR1XaLJ0TYrJbhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EMoLE7XP; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a0b9e2d640so5029969f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 04:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747134146; x=1747738946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o26ZWiTP9c7iIOQX7GPOxDhZLUi1kJ7hn4K0Nn53HKc=;
        b=EMoLE7XPE3TTmkTn9bTQyZREiIRRGX7YVuqCWkphzI9ddUp97JommvmRhnOeydvBAj
         5uYo2197zoJvfViND81fRgVY9vn2k2iNuzcmZWZZFBA7dJcrrYmJiJNOq69n7mFrpd/r
         aRfIYYx0A9LaU3rMyYBThw/E9nw+83fs3APRrDdoTAKZdl8rAjrnQ/xCTOrm/3s3Oj6n
         M6am0bYek9vV7wDwNQsBudi1TEGSO7GkAA3Xz2ULryoHMI17a8npEM/rZF0mvfefoyvA
         q6bdqH2TR++reOoqgKQ2aEh7IOlzs+y1Nr01J5xCohyO1cOIliELvgIVqfJdJ69sHnua
         pSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134146; x=1747738946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o26ZWiTP9c7iIOQX7GPOxDhZLUi1kJ7hn4K0Nn53HKc=;
        b=A/ebwDNFwifY0+BRnNKbu0H50bNGIpv7OYmjU3L+/L3J/u5UmO5F/kieseUHEJtJrt
         dDtMz1QOCFAAoqSyeKWxNlzOy1Flw6Cip+9QZlE83CTDenycBgvnNstofhgNo25JeOEr
         e7EcbE/h0erRtBO6soYV4xu7FCW2OBjnuB+/sDlfB7qwj+SC06azx1TdnbbJ5oPExowR
         7kNE5Egb1SMiCTSWfp2DfpbnBnUOO4fRqWiq0pvvaGBlYVuibjivuoSpK50qlassvrzB
         mleXZRYsOqcTmxwKqfsauwrk6q8nYgRE5ddP2hwSMFzywwqjsEVmQXxOXO9dbUrL6Uqd
         2V0w==
X-Forwarded-Encrypted: i=1; AJvYcCXBcP5F5ypHoL50mm/3Dtyb/thlai04yQJeNM7UwyBkyWcPgt00s6tfDzQzHPl9UMyhow0cGAryE3jD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbly166SQb360Rn5cDKi/mgMifPiwzn+6FrrRB6vJ5HnTdCxW2
	XmBlsNISTE6i2xvJUSGNXy8YWZ/hEZphb9orvvodDAN+pyjmFOMKsnDvv8r7gI4=
X-Gm-Gg: ASbGncvAcqqUq4U+0Xpz+emUEjgOFzQq8G+lcu8Ydl5vLs5Op5kJioWebqXgLCcCvqA
	vZKczJYJxaNrNz6CAwkJsi13f15AUGkzTrFr1gFPNoUs/hlQpGHYEsCZWw51Cz1vUmGxeno87Fk
	1TiIBw67dtwKIL56Zz6r6BvpAjVpS3ANxBDNLnk3W9A8ug6jRXxOUZUMVSVnltCbPnFzaB2A5so
	tiCLLvIuf6M6WcWwt7pvsb89Hh02tbBimRESRaw8ISGwYlltBg8w2upnC7xRQQwDIx4HpxOdDxt
	Mjx3jL+98A6RzLC1g3BnlRZoSgKWpu7hyn6JliJyp6i02aNA1UVrQwSpX+nhrvCii29WHT19Nu0
	jgGlkSNhlbZ2h0Amacq+GEY6A
X-Google-Smtp-Source: AGHT+IEFFJTx+ExeQ0LxjZrLVtDg/lSkbV461KmtV93IzN3+6IjslOyP/QaT3NmsrWAQb9LLcZHxEw==
X-Received: by 2002:a05:6000:4287:b0:39f:7e99:5e8c with SMTP id ffacd0b85a97d-3a1f64c0df2mr14090834f8f.51.1747134146531;
        Tue, 13 May 2025 04:02:26 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ca47sm15851252f8f.73.2025.05.13.04.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 04:02:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Marek Vasut <marek.vasut@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v3] gpio: pca953x: fix IRQ storm on system wake up
Date: Tue, 13 May 2025 13:02:20 +0200
Message-ID: <174713408243.11101.5617298935758722435.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512095441.31645-1-francesco@dolcini.it>
References: <20250512095441.31645-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 12 May 2025 11:54:41 +0200, Francesco Dolcini wrote:
> If an input changes state during wake-up and is used as an interrupt
> source, the IRQ handler reads the volatile input register to clear the
> interrupt mask and deassert the IRQ line. However, the IRQ handler is
> triggered before access to the register is granted, causing the read
> operation to fail.
> 
> As a result, the IRQ handler enters a loop, repeatedly printing the
> "failed reading register" message, until `pca953x_resume()` is eventually
> called, which restores the driver context and enables access to
> registers.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: fix IRQ storm on system wake up
      https://git.kernel.org/brgl/linux/c/3e38f946062b4845961ab86b726651b4457b2af8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

