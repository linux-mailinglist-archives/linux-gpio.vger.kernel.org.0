Return-Path: <linux-gpio+bounces-18730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F7A86C6D
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 12:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E93B17BF89
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 10:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9881C863B;
	Sat, 12 Apr 2025 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DcuUp8d5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD494C8F
	for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452902; cv=none; b=KwSgVe4n8SRXYkmRPEKrpKUf7WabbxwkECxdoQbFs8WZ6x5Y9Spjt/COtusHA+wV9eRnI1OKR50RdxafIoUxEuOdOxV6uyyQ023evTrR8CanjedGgfED30lCOaTxSTq4nssYvHnqwfu3Jj2fkfQGdJD5D4CDjF8S6PipWwfbO6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452902; c=relaxed/simple;
	bh=OUaqaenZQK40EKCZ5x5D+sjoF6j3O559xsJm3HomQC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PP+caeVlubbPoobYPvKI7fVOSgHRJ1Qu/8O3uBTDmXafsIX707RV1djVCyb2rCW9lRh+nVxoyxWNl89fVnq1D0h70up3t7tp/BvU9I/ddoTAHbqHk2huqWtaE8Zw3Owj9PbT8yXgJ9tUlqNfh44PRt9N9rS4q81w4wea4rqnpt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DcuUp8d5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so28183645e9.3
        for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 03:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744452898; x=1745057698; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADz2UHdhn6VlUtCxoXIDmk2qzKdPwe5zasSgeJVB5z4=;
        b=DcuUp8d5N7CwSxEYROiNlwQ4bGCKhy18TJO5ecjLFPm8kfMb0HqKcZZpRrbEl1xeZT
         KpYoRrIXuTaGuIfPXcJb5A0fx1LVGR1pqYS/ebIDDgiACeP/wiKj3LBeJS9gkO5Bo/jh
         oOs9RVJC05ioaz2lhWGEIpATl0uLX592H/z1NBx+12YnWpmDjeBcOP6SEQgmkG/ditVS
         lOxRMYJ6BO3R1iBtuoNs8q1NehD6C85f4Cf87yL0BQyg3XKw5DDDFXozcmFHW39VAXXw
         RaYEzYEgYBVdec1Dqa5MOa9AA+MviyXLqTL3LjmsiX0TLbTIYKkr5axKO87Qw19Csps9
         sJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744452898; x=1745057698;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADz2UHdhn6VlUtCxoXIDmk2qzKdPwe5zasSgeJVB5z4=;
        b=Hv0iUXr6jYG5KkgRnkh/Ows14weil430eVs0HWgMa/qNa6es2yFHjg/EOlkeXekNvS
         /LjeAJ9hWLEMv1u2aSCKMj3Wy2TiDeIxSnWDfma9V+Ioecxvhx4WC2mgiKOfdziRbbVV
         rCGjrFv462mpQe/zyZ24NXh8GCxlY1hd2pcn2y56AS21Ds5f/ZcLONMI4Vu/fkmCPjKZ
         VLNg2JvBKyH2nIx5HETGfiuiRM4lS+NirZpypZhSsRu1XZU5HOXwdoaMuh/fHjSkeHyB
         YPSArmLMJUMNYaCPLC2e+peJ0REtiq1xvLJm2dHXf9EXwiakGgp7AsQj+yZZgfGPLMbN
         8ISg==
X-Forwarded-Encrypted: i=1; AJvYcCVd2imGHgT1R/S21Tl//It0E8cb0UUuDRht59MlaUYDtIfMevfFwW4yKzSKmGdpjKw0Hp7NF74U1Khv@vger.kernel.org
X-Gm-Message-State: AOJu0YzMUQ8SY4iojm2rJRnCCnyelOBtZk7T2DTOQBuMIwrN3Omm9v7y
	1Mu9IlteTS2dN/+1fW/UhMp7ge0pjtyIYFvpy4BlgHTqQoiR/Liyb3rCEb4mjRo=
X-Gm-Gg: ASbGncufRHfGxjSOY8ARy+xWdh9xOKij18MS3kTNpGEqJ/7aajDxV4xh1nWpv5nfPEx
	Lq+La/J65P7RSro1azibW11E1PYT8Z6yPGrYOb0Zsw6udn3H6RzaKpPgjeRWsYoYuPLsCYF+N/d
	Hj6AL4vfLnMCZ3vu5Rjq5mGPer0nKT90kVWyypFJ3cb3Sp5KBbd2/bSunX2UXH04BtZhOc0KSZT
	RYVH0Jevf6BaIGrriEmY4iA2fqYBSBjaowT13ES+5epsAl/8flyM/GMz6Km0iFYM70h+g7yUoLu
	Fsz0l+ri9B1fpu5DfRY4uFU4169N00/C3Ll5JETul7pMxgN1Ywyepu3K
X-Google-Smtp-Source: AGHT+IHxVaO0Q6A5zfZJplMfUr/1H1I3HvmVPXjbMZB/QaHYgFmax6t6yrpQoZxMY7sOOsN7U44WiQ==
X-Received: by 2002:a05:600c:3b0d:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-43f3a93d1d8mr64377345e9.10.1744452897722;
        Sat, 12 Apr 2025 03:14:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae964048sm4713549f8f.2.2025.04.12.03.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 03:14:57 -0700 (PDT)
Date: Sat, 12 Apr 2025 13:14:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] gpio: aggregator: Fix Smatch warnings
Message-ID: <cover.1744452787.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix some static checker warnings from Smatch:
https://github.com/error27/smatch

Dan Carpenter (5):
  gpio: aggregator: fix "_sysfs" prefix check in
    gpio_aggregator_make_group()
  gpio: aggregator: Fix gpio_aggregator_line_alloc() checking
  gpio: aggregator: Return an error if there are no GPIOs in
    gpio_aggregator_parse()
  gpio: aggregator: Fix error code in gpio_aggregator_activate()
  gpio: aggregator: Fix leak in gpio_aggregator_parse()

 drivers/gpio/gpio-aggregator.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

-- 
2.47.2


