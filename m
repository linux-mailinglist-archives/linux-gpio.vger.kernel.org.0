Return-Path: <linux-gpio+bounces-27505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBAEBFFC10
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 10:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66EFC189C099
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 08:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE8D2E285C;
	Thu, 23 Oct 2025 07:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GOsCqLSp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C16F2E285B
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 07:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206392; cv=none; b=TuNYF3OJ74SW9qzqlfRIldWMy06mbM8br2GX3D4ETADFYoBJ3t9L7DeipyrEps5xArdqwq+b/Rm3cCvl2XVznOR759SwoWq5rO6gmPpm0mlsRu5qjzAg1bFPjyVz2YiZ5umO1vyg3ZT0xI766EB6/N+a2uSJa+eBiqtlYIDzQq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206392; c=relaxed/simple;
	bh=+SpyXxRkftlNGmLUWNB3Rcdg3zyaCMYWurX6VO02fTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PZ9wcCVG+RJCVfZnc6fnmXqR/qwXogNiaeuDPHHFAhi7XGFCURd3vGC3FF8GFEz4MQv+vA52fXVJPB541S+WkvXbLyGfhMZ6rqeWOB7+vldGtEQXxfJclHPywUwFf/ZwmZXOuVqOCIhQRRdY1Yi81IEYSyzAEjm0+p9P31tmmqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GOsCqLSp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-475c696ab23so2431955e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 00:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761206389; x=1761811189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5LFle24C4lX4/lX8LsiFnLh/vNITYUjWURDn9xN210=;
        b=GOsCqLSpNrZkVzeKwwv0ivG0JN+EMZYfsgSnlDcY3rknELlPurWfx+Kj0BsdJrbun5
         W9r2BgELyouZndPzwMeQLU4f47DEqVcfI+0Wm0N+vMSVgG/TOhROhvMrTFAy29odCfAw
         4A1shlcMIxybJDMN8CGapZH/D+SYoasiyU2Lj8o+1VXWvj/wf8+m1WYkBL0lCwOLOA1Y
         9J/xl72VjjOkqTzK7mN55ovaOmPXV1KL3EXz414km6mO6hBkTdoBvb1gED77YwiNEy9H
         C+/delPUtw1TbZfqMULRQMhwVsjwoFv6LFFgctIARzNKYory4XjbquRNEcZpp3Wudv96
         Nnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761206389; x=1761811189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5LFle24C4lX4/lX8LsiFnLh/vNITYUjWURDn9xN210=;
        b=VEYJCMmXy53JrUi4CDeSpnhRl0At5zLv618/YQ73JBxAjujpCFJmgwXWTltCjbtuoI
         eraxwfUODyXADbwf0tlZiM9KZxLpyThorRJaacUYn9b4d6+t/rZk0HrPrwh4AHdlDGLT
         Wmmzvem+XUrFV7J4xU1t9OOa+/DhTjJiNNe9D7BTir8ueTBkfUNyRjkFvXf2pXwEcCtb
         YitdwZmQksY/vyy0xvL4o/KQkT6J4FQEcFtrLASsqahT6HOu0C0yURori4FJqyjxlWdA
         noC/s0lKDStrD+hWzXpyaubjUDOc2Zg2TAXUGFOCswUjhs7zfRtoA+zDmkI2yVDUjjAC
         lRXA==
X-Forwarded-Encrypted: i=1; AJvYcCX0Ke0+mkWoGrxqf22sGK264m+7JWQiCavbUHcM0hh1RVc/Xw8EJ7a1n8UaI2G4CoTfyXspP1yu7uup@vger.kernel.org
X-Gm-Message-State: AOJu0Yy80IEq+JUlBKNBWnX/z59sBlrc9DLXI9P5+4rgW6HTRyYKHQQ4
	q61ab2InM1FbY4XpeGcp94pWPJRm9/rfC491XJPwvLUMwAGlwHIpOmnYiNoVT6B+ltY=
X-Gm-Gg: ASbGncseVRMzNls1ZQbxn0j2zlE4OEV8ONOWwuntxucpgNkHVX+WvFQCZdKKWCBLK6+
	xFh1QDg2kas4SPNKb6T7sWqxB3/ClDWJqM02K5C6DIN0nD9lIFUvSP+ZpAeRdx4oM3Qja3yLszL
	DwRr2MzEIGOmZ7PPGOz8ujUK+38SZnlZBWdSkWTTTxNz1/QOhaCsMJhQcn6jIQr6IZ4vM56wRCK
	zAdb0OEsJIZJ8myzPCc6/3CxEmbNXYYzdRuOkypyKGYd2XPcQNqFa53NQ1nUv1xhhyRx+OyaKBm
	GHRSLNNw3LcK026TWqzMPsJtEks4NBu4T31egAx6GU+yJrCW3kmPLO0R9ufPEI2Ejw7GmXNEHms
	NslhepqSWAVA/RmN3kiV6K62Vk01Fe6+kPDGDLweHIyMJGVh2RSKQWYolTQs6kt7/FnfiyZ12mc
	yY3srnDzZCXmN+TF4k97ETsw==
X-Google-Smtp-Source: AGHT+IFw8DrAsP2ujJ1z9Xf51elPbfYymJObtmKWyxRCkb7tIajC9Z0M/MWJkVISOmNQ3AsjztV93g==
X-Received: by 2002:a05:600c:190b:b0:471:a96:d1b6 with SMTP id 5b1f17b1804b1-47117874dc2mr176361195e9.7.1761206388338;
        Thu, 23 Oct 2025 00:59:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1b4:e02e:c538:6feb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475caea0468sm22931325e9.8.2025.10.23.00.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 00:59:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Michael Buesch <m@bues.ch>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] gpio: bt8xx: use generic power management
Date: Thu, 23 Oct 2025 09:59:46 +0200
Message-ID: <176120638405.24462.15473867139996562246.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251016163618.1355923-1-vaibhavgupta40@gmail.com>
References: <20251013174319.GA847155@bhelgaas> <20251016163618.1355923-1-vaibhavgupta40@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 16 Oct 2025 16:36:13 +0000, Vaibhav Gupta wrote:
> Switch to the generic PCI power management framework and remove legacy
> callbacks like .suspend() and .resume(). With the generic framework, the
> standard PCI related work like:
> 	- pci_save/restore_state()
> 	- pci_enable/disable_device()
> 	- pci_set_power_state()
> is handled by the PCI core and this driver should implement only gpio-bt8xx
> specific operations in its respective callback functions.
> 
> [...]

Applied, thanks!

[1/1] gpio: bt8xx: use generic power management
      https://git.kernel.org/brgl/linux/c/d5376026f9269601e239545e2ec4aea0cc62bf2a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

