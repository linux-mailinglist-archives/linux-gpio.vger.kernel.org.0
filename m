Return-Path: <linux-gpio+bounces-15826-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBFFA321C6
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 10:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15F903A5CF1
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 09:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB43205E01;
	Wed, 12 Feb 2025 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Lobg896n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA7B205AD7
	for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739351341; cv=none; b=lUvbHgfzi1c75VgaD79WJ62QBGIkRaX5Sd3biRuKaautx1KMtxyBHf30eVN4wPr3KtADRGAbBzzSQldemQ/4sj00pR2ES18sFCBXy2WZa3IXhfk2+V44JFe+MAp/W3uQxZIK6qA3vh1iNO8/dHoJ1Y7TJ34busy0dvtak11z2aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739351341; c=relaxed/simple;
	bh=OvqYnpRvYG0LGpobj7IV6ZwhbVEj/AeD6iszKsbWduI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hWy9IKKugnqDKWu6n33+U/Ay9Y/K8Q8NYBNoYyQk0+yQQRUuknc4JAxRmSgDsWjyhoYWDOYsnWct3aAYCljdnr1cs8GQok48nfv1yiwPM314XRIuXcXB2E47URfjjocpmHgrLdz7l6Nvhcc2ww/nkwoxhIeP9XaGpLCq78pTlGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Lobg896n; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dd0dc2226so3697459f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 01:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739351337; x=1739956137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKD7ISvSvAMVM8VZFenVGXThc2qL1nsB/7rDLqi7zUI=;
        b=Lobg896ndhZPs6yXKqr/cY4V7/DEA7KP+TKLxYtHkgSFX6r/2uTz0cdPtjt8gaTqsc
         MxQJekncT4s+ZuSl29i2orX8oEVZW197VtoyPqmW6ONGYRIzggpGncki5lsRe4YYZekx
         tF2+mFj5ALB1JxVZNrJIqUch+7VTdWt6hTb3I1LuDfIg8JiwFg37fzKnBx5Bg0zovYrW
         kIhsvXnpDVt9dnG+w5gjDIH2Nujzk71OtTcslUox8/RmPkgF6BVDdyeT5LirvYv3lePs
         Ce03jxrq5pQOQd9Nkb6hPh1lS3cgDyo/wsnrFx+Noqe0rM2QPDGcV0fKmOL2rc7b58Zl
         h6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739351338; x=1739956138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKD7ISvSvAMVM8VZFenVGXThc2qL1nsB/7rDLqi7zUI=;
        b=Xg+IQQgq4odHRZ99s1lKNcrTgzJ0oEDj8vBipcr3lRte84rCmb7C8NeuYF06ONessI
         vypokS5kArnrG++HTuRaJlaMLal71Uz4FwpzgZwJYhY76gvcbB9xgWUtj4C2y2PbBMQB
         ZOYYAafsfZnl38+/hXBFiIfWmPvNicjtiU4nBEhYuTz8AXLBIR5lWfMso89TzhwWv/rj
         To3z6sXvM72zc90Unyj7a35jziKeolNZutTWHaUkGipiB1lbAryjnumBYoKDXRre+5u/
         IiKSohTungdMg4iZ98DhzBHgewcn/xj5vF1fTE0mqkGk/off7pd046sjL8ydWaq/kNu9
         Mj0w==
X-Forwarded-Encrypted: i=1; AJvYcCXgruA9sUnyeF1nzrh2n0fPVrnaCpF5pVau5ocp+ChMSW/PpPftat6H0oDjilQu3/lMhtFUh7Npld7E@vger.kernel.org
X-Gm-Message-State: AOJu0YzFLkv6p+zvePsoU0sofUdsKtmS7VLakEBjN3YGe3nFkCfr4p8U
	3mW/oDpXbmYrDMcOgyXmFAXwpqnFA5tg4U+PvW/l0zpZVV3zOvHx+tgBopKaqtI=
X-Gm-Gg: ASbGncsd0d7wTcXAzTQOIt9fm/6TXZXpHJPyW/7rNClrJ4RiGGQy3fFpHA2bisrSYJO
	VTr2xbZWB9PPuJIS73yGe5IVo5mkuLoMOxe2EFx9REQHVS6NRGDsu1d8CY5a1XXbbIASa/z/Lxs
	RscZRuvG0gtGLMCYlcEmf4IXma36Rh147JLyJNaUCi+cLIlrLi+HseNinez/Gxi1nD/OMzX+muy
	ifZEbmjL+wUmiVaQzTwywAtqR9yCmK9XG4qMF/4WF++Ay6tJ/d8SSCqla+hGAPQprycRTfULO30
	4xxAoLQ0YvlNhus=
X-Google-Smtp-Source: AGHT+IFkWvd1ex79ASDD1erZLM9AfGHHCjVCSYDIPWJ+oZLpJ2fy77FdM8qDbkbqPp6eM3En7ZTtig==
X-Received: by 2002:a5d:64c2:0:b0:38d:d666:5448 with SMTP id ffacd0b85a97d-38dea2d363dmr1957104f8f.40.1739351337520;
        Wed, 12 Feb 2025 01:08:57 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:521c:13af:4882:344c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a078689sm13220325e9.37.2025.02.12.01.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:08:57 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: mario.limonciello@amd.com,
	westeri@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Mario Limonciello <superm1@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org,
	Delgan <delgan.py@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: Add a quirk for Acer Nitro ANV14
Date: Wed, 12 Feb 2025 10:08:55 +0100
Message-ID: <173935133349.8493.1997870240852943455.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211203222.761206-1-superm1@kernel.org>
References: <20250211203222.761206-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 11 Feb 2025 14:32:01 -0600, Mario Limonciello wrote:
> Spurious immediate wake up events are reported on Acer Nitro ANV14. GPIO 11 is
> specified as an edge triggered input and also a wake source but this pin is
> supposed to be an output pin for an LED, so it's effectively floating.
> 
> Block the interrupt from getting set up for this GPIO on this device.
> 
> 
> [...]

Applied, thanks!

[1/1] gpiolib: acpi: Add a quirk for Acer Nitro ANV14
      commit: 8743d66979e494c5378563e6b5a32e913380abd8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

