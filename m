Return-Path: <linux-gpio+bounces-22840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F20B1AFAD0D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 09:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 446903ACD0B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 07:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC06EEBB;
	Mon,  7 Jul 2025 07:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mYfUxOK1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A659C1E5B88
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 07:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873202; cv=none; b=W38RuY2ihpHM2QCqKNTGNdXfojfQN/G1kzOlBAFFzW0oi9g5pp10XaFojzCMboYDZ6A37lBMJtUguYD618kz9eT7c2L+vnlo+vyIx0V632bdnsxIxnGU5TfgBVUU3Ra69f7GWiPWsTLZnxduey0h2jNbLa/AkpZbBK1OYOoJ5vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873202; c=relaxed/simple;
	bh=BlnaHDWN5SbXEMVEI0YLSlyKahI7tFiclh4e7BkSgig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O8HVn4OEtOkpb0H7hU7YIKsn09WGC6DKS6mdR99DuQn/uO1dNoihW9hpBzqkUtc7YOxKOTVMG2ZTyJL8nJgrYUaHRRsZQ8Yk7YfvjXqwpAOrhoTF5Lo5FsvGr8AwR3m+B/B1KGEmt9nMXZKBRCk0AHkamyHd5nkiwPG2LEJCD7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mYfUxOK1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-454ac069223so17811515e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 00:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751873199; x=1752477999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+M88naLnUJ0t8QJIK0WbEzaLOGjlUjQqADUu0a4dJSQ=;
        b=mYfUxOK1rfbRm3Dzrzv2Iy10p7w26CBSJsQpnyKQdy0eKxscjvsyLQ7bvy+oI9geFC
         afl6Do1qMI/98S1iYu2yvK6mlmdFBuGr+LJmThOryrLL2+MEupdgAwvam2hC2IKyK5Qn
         fCyN4N8gNvExxel21eOiLaNu4R2nYozHmvB1qep00GqlsVgGfSqJ4Wov1Bxb6s0fbEn1
         Ws+VwFfpwTR6Zx/lU4Lsc5e6RsWcK5m+k/D75dCZCe9nbTzC2tIE751cN592Q2dBRTlx
         m2nj620juh/5ArnZiczEinhu6JIB3cZXByBqzUDMcfTUgOp4TQxZrIMCD+8VKFdqYcBo
         HgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751873199; x=1752477999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+M88naLnUJ0t8QJIK0WbEzaLOGjlUjQqADUu0a4dJSQ=;
        b=QnEkKpEp0yeUJMXBLRxJArR9ZCfVvHEdpgOIFw9Y9P0VWrXjW24jzkvt65SU3Paj8g
         NhLN/ex8bJVGpDBW/kcr2jgldP8ZglBSs8SY4MBq1zlle6uIiHFbZXyFU6J5/2ugv/D+
         HAlDHe1hIYMgqq0P84uuDDriQzTOxlXAz6l5xwVvZiNIR1eWCWgoDsfzvgbMu3ITKEvh
         PWSrM30sm4o0KujtHnIvrB9cheYu83JhD4o5NifJoCX1V7D/mFtTLPYNebHTnUkGKacB
         iHnAN/PLta+eHe4qRAM/yB92K3bTu10gpEgrC0RvP+DObevS9BWNzIqkki0CKX1GEl8b
         DWhg==
X-Forwarded-Encrypted: i=1; AJvYcCVnzfrKs1wEVRRP6EUNxwkKiz9DOCon2x0GfNpr3dpPlc2uJDfs3dyZcJCjIKVPTPS6EYs7ExVeh94n@vger.kernel.org
X-Gm-Message-State: AOJu0YzzV8/2HbtHG+rl3ssctk4aRXGqZtn4HtnlUumMKEil6TB4PF3N
	M8iUFR6pyJGSYoH2uKAkkB8N2qbSLaNRhBh5iDJ8UosiZmVCTHCvu0GqXoIRN084aUs=
X-Gm-Gg: ASbGnctgsidIx4FqPUCZrq0ZY2cZJLHjnCyUbFjFPDv+Ar/ILaHLmCH0Sf+YlMSXb/B
	bRs0pasQlD0TD36mxALwRx/80jVhn/X5AC/AELhTxkV9lGlUau4Id5i5v2NDarfcGNKidRoleX+
	hY4NQb1MeDr70CUiHnUBOgbDngbi4sthEvbcrNbvGciVrSfAuhVXVxNrldTcBcwaSrrqGAH9qpk
	MBndERHR2/hcghO3flCQrHBHPgT0i25+RUdcaTXfVTHTA9euD39iE2pD4JFUqd3dfWMBy+B9fFZ
	51VmMBjMi7Nvb88nGohwLLzqSWcXdek4vyeYL0iXl5ao6H55opvOOlmRBQmFFzU=
X-Google-Smtp-Source: AGHT+IH2a4FQU3gjAoeitT9FgQsVG9Ag0yKWeP/cCvV7/BHHehw8QBk9ZW19zI7R7BKdGB7OsX43CQ==
X-Received: by 2002:a05:600c:604d:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-454b1f69c85mr83094335e9.12.1751873198957;
        Mon, 07 Jul 2025 00:26:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9969aa1sm135733875e9.6.2025.07.07.00.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:26:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] gpio: reg: use new GPIO line value setter callbacks
Date: Mon,  7 Jul 2025 09:26:36 +0200
Message-ID: <175187318871.9037.2163001449380297521.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250623-gpiochip-set-rv-gpio-v3-1-90f0e170a846@linaro.org>
References: <20250623-gpiochip-set-rv-gpio-v3-1-90f0e170a846@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 23 Jun 2025 09:57:16 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the legacy generic
> gpio-reg module to using them. We have to update the two legacy ARM
> platforms that use it at the same time as they call the set_multiple()
> callbacks directly (they shouldn't but it's old technical debt I
> suppose).
> 
> [...]

Applied, thanks!

[1/1] gpio: reg: use new GPIO line value setter callbacks
      https://git.kernel.org/brgl/linux/c/527db0a8811697968df30797eae2e1d5f8b6964c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

