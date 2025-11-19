Return-Path: <linux-gpio+bounces-28742-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D6FC6E1DE
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 12:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 326C92DBFD
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 11:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABC7350A15;
	Wed, 19 Nov 2025 11:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CRfhpZSK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E58734EEE6
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 11:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550240; cv=none; b=R7b93cf+zZpXkevDulcb47Wkw9MS0+uvEDyLCvVfg4Ne3SyX3PFFu8mf6C11Hh7ZafG3DdHbgXhDEtBnBcmG1FPeMIrNrRGiU9szDXqY/T0+n63ii8ou/C0z9JxXeqwdyqy4SJO/Mz9AIQz2YUTkBv403opeaY/e9inYVXFC3lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550240; c=relaxed/simple;
	bh=bSTV4nDkOFUkqQXzxTm6yhRfPyxCrC/lEoyW84+3r0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nx2UD3XI/sJEg+h1we09AU+dfXCXcSIoAD8bs3uxf+fiDpPCHlIBGgYBxwO1mLX4JIpeRoHMOHhoRlbvdpu8/rFj6E67DtRgaWVUTx0JQ3o1NaCqApCouDt1ASWz1UW4bvCsPNwBCmUgOPZYFk8SuQaxVc95/EVn2Rk3bnJWr3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CRfhpZSK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so46236935e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 03:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763550235; x=1764155035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PunctF/ONEjDBsROhwlLrHMeXYTwDaONJP6PiDvXimQ=;
        b=CRfhpZSK5hPd0veCHxJ799eblbNVtz4UQGoujSsqSY9rbTEky7qouHVZr5lAc82HXS
         Pi0USRyeO0FGohFQEQWDkVm2vGJT9f2jsP10UnXtwFJE0q75ctGZqLZxc6AuAb+BY/oO
         l0rDsFEyp90ATnpyDv1k9A3JJk7PZdTtqCQlkSNvHUiOHJLDZ+h6sntc7FBKdw5hShYj
         CMHOZ3LGNPNZkTLpaQXz1tPQghFty7rwI6onpX6hf/Pzj0b/Fy2fxWZcMKBfaA/AJf1M
         r2YcjMVlb4aYRuBu51VTJVNg0kF7DybnxUsA6Q1WbMqYgoHo+PvDhtthVFCPdqnCXTNN
         dJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550235; x=1764155035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PunctF/ONEjDBsROhwlLrHMeXYTwDaONJP6PiDvXimQ=;
        b=af8n443aPvtSpbUAPBcPvXcs6sjls5wuXXDxXkvWrStLyUz+nEODU+4q6f1IoWN1PG
         WIpjZVqE7H2uK88/oW5h2PIhh5FUQEuQzgg4ptPcu4KSlrC2hhk8E2O4nB5zrbUc/aXJ
         MYz4ja86ryrWVkOuZO9sbOjipsXbxfU8drW0jU5LNKU3xedBZ0LBu+loxF+0PFBtVk2f
         NiQTSkbc75/6mUZeVUbLfI4yKRnOSQChDG1WJgTaGav0FiiRSqGQtl20QNUl7GFAH1+J
         xvXoc3UjkIAPA1BlPFxSBJRtdkF4qkfN/irkg5RREFSRaaK9hcGChzmF2QaYOL8tTHpC
         7NBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw3JSAe31G53c2gpgbJdrC4zqNz06vWoI51WM8EU1OsIQTcTdAnX7piBI0xN16EsZ0qK0DpRzp2Dsf@vger.kernel.org
X-Gm-Message-State: AOJu0YzpNwQhwDdqxIP7c1RJrp/ova5k9VLbHAMlrgevvvucrQBf4Lbu
	ijxjZ1pnL0OiuLoUEQPAAAoElCQnvhpnaq5LRw/lrSeNZE3b0s18ZE+Of4aTUAh0gDM=
X-Gm-Gg: ASbGnctqEt32I9pwhla35O1GWPV5Xs7/GGjtTbaOi3Pf39IUTTTQUcnHKVYcQJ0huUD
	KUg5mSEggU3sXvbAGammuLHYp+acjB4sZtfaYMgOVGw+1MUiNEYN0b2QVLYRH+NMRORmAhqmZDP
	f/WBapTQ9qjWqv3fu2Ieds2O+FGfXyA2vH8472t1g7T6abYlRw6VVkK6PDzUAUZXl3hazqZd08X
	D8K6cifKQ83PFusGZoVbIioPIJLLAXz+bjB3FBupZK2GTCAXMGD5qlUl0ogcO4fVJUd9zpPRmIF
	3fCXEBGdERqtfgluIiET/SKTFV71Kfes3/rkBHxOnCvKUVmLssrj1AwxhXFQ4WyQLX61hVIudKc
	GkakFKl16uT+ImylKYqPBRVA7o6Y3aN38XY5LBw2aImMJ17JHjat3L1OQVjFQloHgsiC/Vt2mNX
	8EYuXg5D6HoYyXE/Cf
X-Google-Smtp-Source: AGHT+IHaztPLlfkC+Xir2kD5lwp795aaQBs2kUfGLU9lWrHj6xry0/cJlId4pK5pw1I2kXU2VWBC+w==
X-Received: by 2002:a05:600c:8b21:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4778fe883e3mr222981825e9.30.1763550234066;
        Wed, 19 Nov 2025 03:03:54 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:c10a:203f:120a:d2f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85cc0sm38437449f8f.17.2025.11.19.03.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:03:53 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH] gpio: cdev: make sure the cdev fd is still active before emitting events
Date: Wed, 19 Nov 2025 12:03:50 +0100
Message-ID: <176355022869.63990.7203538137756215633.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-gpio-cdev-get-file-v1-1-28a16b5985b8@linaro.org>
References: <20251117-gpio-cdev-get-file-v1-1-28a16b5985b8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 17 Nov 2025 16:08:42 +0100, Bartosz Golaszewski wrote:
> With the final call to fput() on a file descriptor, the release action
> may be deferred and scheduled on a work queue. The reference count of
> that descriptor is still zero and it must not be used. It's possible
> that a GPIO change, we want to notify the user-space about, happens
> AFTER the reference count on the file descriptor associated with the
> character device went down to zero but BEFORE the .release() callback
> was called from the workqueue and so BEFORE we unregistered from the
> notifier.
> 
> [...]

Applied, thanks!

[1/1] gpio: cdev: make sure the cdev fd is still active before emitting events
      https://git.kernel.org/brgl/linux/c/d4cd0902c156b2ca60fdda8cd8b5bcb4b0e9ed64

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

