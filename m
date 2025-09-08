Return-Path: <linux-gpio+bounces-25725-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EEEB485A6
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 09:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 898A03C3601
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 07:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF562EACF3;
	Mon,  8 Sep 2025 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iWK/HRRB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4CC2E92D9
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 07:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757317140; cv=none; b=K3hWySzREnj5mtIUspHKtc2UBfvwbcpkrHlugYz7MMrdKlNHDEd4O+dmSXKw8CMKrSEcBykNsPNiUsd68UF3A9CZ3bQMQrpsh1c56fk4a5GYgke25MS4j1KxKxFD+pnf+YjBkq5F0RWbTN4ClleNVFgb3kuSmrbxhajOcgRRXCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757317140; c=relaxed/simple;
	bh=I/8wO493tvKgW8VniJJ/pXKCPEHvRGo26tejxMuOh1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CU3HbmX57EKjMPxVsqmfOdJQ3k8sN9MkbRFSllBseI/cGY8Bnew4OE2cjFHBZf3e4Ew1QVH3ruMJ0M7duGMitPiFDzt48IuDiQPnd8p5vr4bAS174qiC4hzoGVRQixf8zh7LDfYacD9Tf8QENoIYJhErL59iEn47QMajDTLm0M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iWK/HRRB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so26028475e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Sep 2025 00:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757317137; x=1757921937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SeC71KiTcmvc906xFt+OsD+bdUmNuwTHs5QzOIrc/g=;
        b=iWK/HRRBo41erD6gnD8N/6YXdvcglYZcubuDwTcBMcmpNQeju/baEfP+De2sbXmBlb
         jRY+4xH9gFN9OfV6x0hIm51heIk66vIZhXvHVNdkMxxQYSCBRnKZiTS22jpNFtWaGbkJ
         5OGi90JOSx5RrnTX8stEWrMMk1+f0xPZkL5LsaE0xnF3dk/omQp5tXl0fS9OJlrkVSKk
         H41gixtuq0bmuJN7HqLjAsDWuugVOB6ncKxHXa1OgOBWnHkeccXFX41/JziY076aGk14
         59VeCyl45grS9zRnqUa58voasS41YBfM+jlBZkGXQPICfMzLvE25kEG3SOmfd1sxNgVN
         +WdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757317137; x=1757921937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SeC71KiTcmvc906xFt+OsD+bdUmNuwTHs5QzOIrc/g=;
        b=qr5GJwJQg2rK++pdsMyMMdPASGaccsG70+MhLvE6YhOQMcLxeHXN0GKrZ05K+L78rk
         OiQA89BS/0fYDt9VQMT70YaNAMBhgg3tTR+drTbyNxJybwZAe0RGyg25UPRqmMobducU
         GkSRv7mwo0RCnsy4cQwyLKuINo3ovJm9ow8Qbw150+mt3W2W9jwrB1UdM3gRasnOqFzT
         DET7ktL7GcbAw0y5l5RwzSJXvNEAyryJ0tNKlljAW5H3MbM9Y6cFZYR8E56pRqeGCr44
         ibxnCGoBrfLTAC+OLrsSFRVGShOSPQS7noIa8+8XWX2jUtJm1uUH3apNYmzrw90o4zm0
         Oi5A==
X-Forwarded-Encrypted: i=1; AJvYcCXTJj6ZaVPRHyq7pOSuQv1wfi0r+05PLc5rU0YzSdQZBGkLLBtDzvZCqsWVJLakDCRrY28a4gewHJND@vger.kernel.org
X-Gm-Message-State: AOJu0YysQBhwQ/vix9l5Jp1cVT1Z5Ekz55flrXZe/7ZFmoq2ryBdi0RY
	uCKNNBzUIzxzmDneoaJ+su0cDBFOOgw8nxTqeLYh7dTyZLplPCkfWxXROVHtRceyHss=
X-Gm-Gg: ASbGnctvnyBR4uRCdvcj0SWcgQgScS0wXsrN6QrJo9nL6iMxwzhjEkhWb5SqTIYRkYG
	cJxXCOzx94vwwQmoamHbxVmkq2Oqhh0sRG6hoxX4ZJ73fqpoioZE4llDhBM31aSlm2/QfI9wyvB
	JboVCnYEpn8bSVOCeHMYdbIx7OjE3pY9ED4E29ZlWbyaCXGiGDGijEZ4QgAsxGJxyUKPPdKOpuP
	7EGHB6L9+fPzS6Aye2bALdPjOrkHiFNL3N88a/xLwbNCSvtrzgqKWWMdZ34S0Q6pSD/VXRW98HF
	Nm0RQVS/RgeMLs6OKzac1iB7bFD9FJb7Xpbpl6tIpbSQjz30LaA9ZVHe5IQM1DS7+4mndNZjSdn
	9n7/mNJ9qM3R/VdajOqhCR0My
X-Google-Smtp-Source: AGHT+IHifsfv/Qynm+lweUW0TaX1cbTEu6B5/phXjByXJ7DDFPSF2vYdSkVq2b1g6PKImAH0XT0ciQ==
X-Received: by 2002:a05:600c:3596:b0:45d:d6fc:2509 with SMTP id 5b1f17b1804b1-45dddeb00bfmr69380305e9.6.1757317137171;
        Mon, 08 Sep 2025 00:38:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5cdc:d980:b6fb:1eb3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e92a42asm429977665e9.20.2025.09.08.00.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 00:38:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] gpio: Kconfig: Update help for GPIO_PCA953X
Date: Mon,  8 Sep 2025 09:38:51 +0200
Message-ID: <175731712487.48218.3656320884516812703.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aLmtOWjAWPtWe/gH@bhairav-test.ee.iitb.ac.in>
References: <aLmtOWjAWPtWe/gH@bhairav-test.ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 04 Sep 2025 20:46:09 +0530, Akhilesh Patil wrote:
> Update help description with supported ICs from gpio-pca953x.c
> Include missing IC names.
> 
> 

Applied, thanks!

[1/1] gpio: Kconfig: Update help for GPIO_PCA953X
      https://git.kernel.org/brgl/linux/c/d3e7efad8fbaf0c2d6f039ae074a20c3aa89bd12

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

