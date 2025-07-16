Return-Path: <linux-gpio+bounces-23347-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD65B0708B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 10:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E3F258149A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 08:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1D42EACEA;
	Wed, 16 Jul 2025 08:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pdCtu+OI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451162EAB9E
	for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 08:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752654525; cv=none; b=NGNijQy5eOdLd83Y3m/qh73PhVp87uzbllMCAWiDYlFAY8XPixYZsCfzLI3Q0xOqG+1BgpZJ8HQCa6Rs4WuFNom7eTKu3MjmZCoMIKi8vhF4+efHqJBKu2cMrX8kO2pPUo3+//6iVJkPYMJ5yTEgVFwpo+icc4KArSRJZCRt+Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752654525; c=relaxed/simple;
	bh=O36NMuz2Ke3agEQcDLOp1rudOZKD0xkF4/Uxvo62gPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EsOw0DaPrE1G9oOHDFYwK2PS0m+K400qwv42gOp+vcTlMQA1kAuY3pmRfT60VKPUFcsM0gA//KYhUodCfNbI5sNvqYTX0GeKSTkyjqDNny6HbB5XCKl01AgcpryROteE8+wFnTMmVYPXQU/XkkrVIWO6SHcZ8/ADXekqBfdEWLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pdCtu+OI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso5968243f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 01:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752654521; x=1753259321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYlZqmOyGyqPJ6Cp++YK0y+ESRUo7O5IxtsDgIQqjis=;
        b=pdCtu+OIm9LNn5Phb0Ubw9XkEhnXQzaHnhgytYvsdIjL7A78bUkiYuLcsBIicb91hL
         SfTgfi35tJ3saXRT+snYDU90HDDn2sTN0zMAbXR8s8dXgRrWL1/gV8rzyWrVUhK1/BrO
         f0XhqRZncJSiYxHpuizldmnYKkPUHb7ttZKzED57i2cBVIzEmIJbMcDA2D3k3rkwJfn8
         UGpHMO70PtSNblt3tKy+h2ZOsz61zT6t8PJN6CKSZXMxZGaOzgVzephCYhdAYykk5uu6
         V5DVjkbdSW65q4sN2jKvQzv9xI555Tj2cjUTfJ6olO+sj0YN7un4DwbaHKFxkz4/7dS1
         f4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752654521; x=1753259321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYlZqmOyGyqPJ6Cp++YK0y+ESRUo7O5IxtsDgIQqjis=;
        b=GuyS0c7DiE6++GyoGUy1SnXgUMY10PhmpqqgFBgWr8s9qrG2b8LAqgFf6vYU3iv5gD
         0jpmB4RGhtV7QPqoLf1d+UOOjVnLHhlN5W7NLOn5qut78aVjeCYtkKDCt3T9UkxUYN4b
         n8eQ1wSAarIPgUefd/oo4ljkaM1T/f6ntAeP6oI3Vr5K0k4eCvMuBvF2DzvqwNMI6RPp
         6ySMy+QxDkbI8iCJaDTBHki1QXX7TMJnRZv2uzh/ukb0bowHMQSzq/jFvxwZHtRX0Dwi
         Gnum4zESLfggaLHcxSLsVZtblkL7XS1P32IFZU09TjybiRqD2b31/Kz9srQ+5B1PzSPU
         xFpw==
X-Forwarded-Encrypted: i=1; AJvYcCXlAeroYHMMPcJ6apEAfAcmSyeXlZjEhLakkGp8UaCjdNhYCPEADBe1GtF92nej2v2OKGdJ6Ken0Y/W@vger.kernel.org
X-Gm-Message-State: AOJu0YzT1RJxT+9mJ7x4ZQf5coDZRgxGb/UyOw0tWmoSBSxUpzCbFsVi
	4sQSMFV2ts3tJBZfm0bZSKx7WXxsEOeL7oZDwb40/5wplzgvKPnrloxGUTXcUa6kL40=
X-Gm-Gg: ASbGncsEMMnRaMjYzBGhyrmcHrs+5e8p1xuBtWBcOjwOM2EKRWpt5ts17e4ZeF4Nlm6
	GelhElzulplRT3URloQDmzkFmDdIv7dhC3ewB3V27XoFp8RbKPCMJD3OfDcIYYlkZZlvRqIpSn4
	GKKFhELU/yp9dXeolGabVjbp/kRk4HYbNVOqx/izQta3Y3SFG8NT6zsKcnt5kkuwbwiUe5IE7vN
	Oqy/RQKsNFU2ITLSND2XGC6wZIH8XG6SxAXeu3LIVPNzvsXKieq4PDwnxGs9/x8wOin2Us665jQ
	vLkjUJasbLBWoyMj2cEd9tieD3hIlLvRX+Q9wKsZjjA1T71xaeGYNLvT47VVklbSkNzW1onWETx
	kfkLcegwzBQ5d2/uiUhTumw==
X-Google-Smtp-Source: AGHT+IEpOupMs2r3tIYK3RD5sQQi7neE9B5zvm0/8thHJJy/tqF/kJK2EDn9Azc5pOG7mPiEjSQ6bA==
X-Received: by 2002:a5d:5f55:0:b0:3b5:e660:951 with SMTP id ffacd0b85a97d-3b60dd4f6c7mr1698353f8f.14.1752654521481;
        Wed, 16 Jul 2025 01:28:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e8b9:11d7:19c9:41b2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e14e82sm17287901f8f.71.2025.07.16.01.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 01:28:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Jan=20L=C3=BCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/10] gpio: sysfs: add a per-chip export/unexport attribute pair
Date: Wed, 16 Jul 2025 10:28:38 +0200
Message-ID: <175265451581.10877.7456063787084603228.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
References: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 04 Jul 2025 14:58:47 +0200, Bartosz Golaszewski wrote:
> Following our discussion[1], here's a proposal for extending the sysfs
> interface with attributes not referring to GPIO lines by their global
> numbers in a backward compatible way.
> 
> Long story short: there is now a new class device for each GPIO chip.
> It's called chipX where X is the ID of the device as per the driver
> model and it lives next to the old gpiochipABC where ABC is the GPIO
> base. Each new chip class device has a pair of export/unexport
> attributes which work similarly to the global ones under /sys/class/gpio
> but take hardware offsets within the chip as input, instead of the
> global numbers. Finally, each exported line appears at the same time as
> the global /sys/class/gpio/gpioABC as well as per-chip
> /sys/class/gpio/chipX/gpioY sysfs group except that the latter only
> implements a minimal subset of the functionality of the former, namely:
> only the 'direction' and 'value' attributes and it doesn't support event
> polling.
> 
> [...]

Applied, thanks!

[01/10] gpio: sysfs: use gpiod_is_equal() to compare GPIO descriptors
        https://git.kernel.org/brgl/linux/c/32ad0b9a17f9aa8dd9308feda671bda98b274d24
[02/10] gpio: sysfs: add a parallel class device for each GPIO chip using device IDs
        https://git.kernel.org/brgl/linux/c/2028f854b3f5b3816cd5d5dd83057a873eddc4d6
[03/10] gpio: sysfs: only get the dirent reference for the value attr once
        https://git.kernel.org/brgl/linux/c/c38c3a349b7bb994252e93c7c122fa0b50ddf12b
[04/10] gpio: sysfs: pass gpiod_data directly to internal GPIO sysfs functions
        https://git.kernel.org/brgl/linux/c/7c49c1298f3ab3331008e85ac22b2d32b4bb450f
[05/10] gpio: sysfs: rename the data variable in gpiod_(un)export()
        https://git.kernel.org/brgl/linux/c/12faec7ed1793221c1dc9f69575a814528d74691
[06/10] gpio: sysfs: don't use driver data in sysfs callbacks for line attributes
        https://git.kernel.org/brgl/linux/c/f7d4fb62d04542646a48de08b10354692f3b98ce
[07/10] gpio: sysfs: don't look up exported lines as class devices
        https://git.kernel.org/brgl/linux/c/1cd53df733c21ae0d344a2dec941a3e2a06fefd9
[08/10] gpio: sysfs: export the GPIO directory locally in the gpiochip<id> directory
        https://git.kernel.org/brgl/linux/c/4fa93223e03eea3243db83786f556b6c1494de3e
[09/10] gpio: sysfs: allow disabling the legacy parts of the GPIO sysfs interface
        https://git.kernel.org/brgl/linux/c/e69c6db4cdbc149ff090f1449a114c33ba766dc8
[10/10] gpio: TODO: remove the task for the sysfs rework
        https://git.kernel.org/brgl/linux/c/0c0438d444a7814783099c9028823bff5977e4f0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

