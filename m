Return-Path: <linux-gpio+bounces-15863-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D765A3284B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 15:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31F51188847C
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A58220FAB1;
	Wed, 12 Feb 2025 14:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RvHdBGE7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA3220CCF5
	for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739370105; cv=none; b=kNLU+fFfdVjKfOxfpDHR7rdKuDkGiCiL/Ulgush6skp91vYh2efUPx0tPPGAQw3uTQcViMwiBwh845nQyRF0HTuIjv1zXlQO+uXGk0M9e7X66opmqzhOtb+nFc20OCI3XMl5VnB7msRINs+pXCh8z6dy6CxYJyZlWksuicF1ehE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739370105; c=relaxed/simple;
	bh=1xluZ/xn+znRDhXdajWvxqNWi62xirMRzK0zofqFzK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eBbhg4CEaHMSHNvwDjSe7LUmghL0rhzd41gC+z2eQkoRhY5DTLyyvL95VKcxfvm/RYVmmXc73ZKY7BDs16BLMJo0P6HesbX//yI8dUKAMfL6DCSdCCoTVl3gP1E+LByNndYrZaqt2+lLcp/D/wECcj4M+FdCcnqRVDWfsJXEi4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RvHdBGE7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38dc1dfd9f2so4623480f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 06:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739370101; x=1739974901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7XFcJrR0jVxIOhGAlDRu0SUXNyGMm70VS4UkzK/e5A=;
        b=RvHdBGE7SIqjWw+rsPcB9Qo9bWG9+V4aFH/m/XuydBk3lLhcSNpY1Ege6hrBKi/CRx
         r6ED8AXNrAXUA+SK+sNOJzoab8G5Mb8TDbtQjwdAr1tlc2SL3pEaMtg2vWx0l8Y2jLJt
         qtnUb5RHYYo1HXh/zJPHVcsN/os9AqtJWpk8VU5reardknI4hndMYw5IRB9in1jne5K0
         +ZB607AJNlpeBC8qEKQEQhlDmox7X/tY/y9jsPnl/iXMuzUSKrKU+zsv68OoOCiLkPmw
         HvvmivxAkMnFJ5rUtRyPYFuxr9ryno2VneoWbEp3I8vILAL27eLGywaig3XrFr6hqU3a
         iFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739370101; x=1739974901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7XFcJrR0jVxIOhGAlDRu0SUXNyGMm70VS4UkzK/e5A=;
        b=Y7ujlcf9d1mSwAqOj85SG1w2EFnekjYTJTzSF2pLl+w9QOpy0duYKmSOghLGEwpnzr
         R55X5+2jRlPB0F3NRhUvaW7IT1FYiENslcas5EfMQ36AcvaNDowvjHdH9AbMjMhdomcG
         1EnVQf+09AolEXAjz7b3KAzp5tUBvT7mv9WLiqJMoIzbSNYsB+dxYLRO3CgRP7AzarH6
         /TSqX9QZ6IRdTydo/Fhn6jPghq8+62YmuOLmdcXPqmrBn9qZAP0f1nVZpmn0Gxrz4SP4
         u2ealXESmGet7QSpPuhsotREIdYtKnstWOClkqWq6PE1cJm3rO39MXkhRmG/gv0BJ/A5
         oWhg==
X-Gm-Message-State: AOJu0YwrVJ42K+oB/bMuG/PGQkrXaZIM7xRFz1UpDmiWpyZD68yYWfth
	vhoWw4gfmsVdtNRQySaFIT2BUvqDiNwBLAv9W9AdWb5tUzLfgM+jaajs6YrAzVCpdx6ZeIoA4uI
	fdeo=
X-Gm-Gg: ASbGncvHbUtf9JwwW/qL/oPkltqBGQ+V8k8Yp9rphPvFwG5GkmkY5t05vyBHil0P7M5
	y2PyhccvLQFsYFcVWjqSq+94FAvYIAOgA8cqtWhS/eXzSh2Du5p99+IX0xWft95yfwk0X4X7ggt
	yBTXTxeSHuwjBsKOcmcVvMOt2xV2i1X2cwXnYQfMRQAIpvC2De5x02g8AP2oGuz95LLN6MHXcUY
	OmKwEMP9bSMN6LaRVKDIStZqtkT/Yd1GD5uhvVVfwLK3M5Xg4v7/hqB8gsw3p63e29VJu661l/g
	MiuvoYENuYqFTzA=
X-Google-Smtp-Source: AGHT+IEUSlN9z8qlAkN8JoTBKW8p1CRSividrqsvgF0DeDdGA0bzCj1hm2FB/XOp81aha1n//r6Yrw==
X-Received: by 2002:adf:eb83:0:b0:38d:d9bd:1897 with SMTP id ffacd0b85a97d-38dea271f65mr2421120f8f.22.1739370101302;
        Wed, 12 Feb 2025 06:21:41 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:521c:13af:4882:344c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a071157sm20938305e9.27.2025.02.12.06.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 06:21:41 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: (subset) [PATCH v2 0/3] gpiolib: refactor for_each_hwgpio()
Date: Wed, 12 Feb 2025 15:21:39 +0100
Message-ID: <173937006403.31129.5577338516228495218.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250207151149.2119765-1-andriy.shevchenko@linux.intel.com>
References: <20250207151149.2119765-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 07 Feb 2025 17:07:33 +0200, Andy Shevchenko wrote:
> Some of the for_each_*() macros use the very similar piece of code
> that may be deduplicated (by introducing a new helper macro in patch 1).
> On top of that the implementation of the low-level for_each_hwgpio_in_range()
> looks too verbose. Try to simplify it (patches 2 and 3).
> 
> Changelog v2:
> - added kernel-doc for a new helper (Bart)
> - added two more patches
> 
> [...]

I applied patches 1 and 2. Please revisit 3/3 in order to not duplicate
the for_each_if() macro.

[1/3] gpiolib: Deduplicate some code in for_each_requested_gpio_in_range()
      commit: 8893516000b247f91fa2cef34f2a77b609e661a4
[2/3] gpiolib: Simplify implementation of for_each_hwgpio_in_range()
      commit: 767412f092fc6e04147305acd70f15770ece47ec

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

