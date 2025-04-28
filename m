Return-Path: <linux-gpio+bounces-19382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E27D5A9E9B8
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 09:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90C3F188F2D2
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 07:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D607E1DFDB9;
	Mon, 28 Apr 2025 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jvpMGZMu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B791D9346
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 07:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826119; cv=none; b=nNXsn7grxLXEmM6jzgHWbEKW8ewwtl/XeEJ/j9/i9CUes0hTyY4nSNXjIGt/tYFhXPEaC7Boi85139Q6IPZWCx7tcWAH3jKF/GMqQWaEouSjM1p0MvOEy85eNnF8mcdt/3ItBNyYt+5pi5fTMncdfWV1risvN6vtVC24+bielfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826119; c=relaxed/simple;
	bh=oSqIkRupR8TYRhDce+2kE5eyvj9Skfdy3j9c3wxau/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eejaaVZeMlBrg9x8SUh1+gyKI5WFnLK65HPPDF07Djc5jCXd0mrrggOdTLdzL9t+7G+8gYiM+JtmA5l8/j1iotEKzsBqDoruz0iheK31HnKnHAvR6zEi6ghQKqgTY+A5rIX32PoG/RI+cvVDhLnf3haOeQ+LkfIp43jaFi7kCV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jvpMGZMu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so45852575e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 00:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745826115; x=1746430915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtXe3DJwZopbQ1jjaiS1Q49hS2sBgO4tG8niY++hBCc=;
        b=jvpMGZMuIBW5Fes64T4SrkieG/tEKaG79TtuznW4p5qUYTocF1nEtwoDeXyfWwBqsM
         jMAumiskwWveynJ0T4ZkV3goSx+0w+qu/f2lHUxorFMgvEmn5dImP613X9CI8f2nabX9
         YSdVBDzwJyBjgTnhuP0B7uM6YXJym/1FjyIoxRLxgXwNusXPS8Cn/1TsWNVJK7Fg47ZY
         5zU24DOnhlDZHY6l5NdP2NQ1vSE+g51sd7uC6XtPCzj/QidBiqecrhD82bJhLXtgzq9u
         gsHvjzqh4DGAut04sNpKWbn+rtDCY1oLkYzdYs5PhxhmosFaPrcm3N1/8VuNEHeObmYr
         /5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745826115; x=1746430915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtXe3DJwZopbQ1jjaiS1Q49hS2sBgO4tG8niY++hBCc=;
        b=WKgl4nSL+5t2Dazyz4E+PW36S58l8pfaqgk7JcihK0v3h2t6N4OA0HuYcyz9TKsPIe
         jg7qwIAOKRepnZjS+AFygaUym91iqCBXkFz6R1Jpw6VG98kbSOH8Y9SBOnrXW6BbH7ej
         /rYO/mCL0AQJKuBwWxICDPHXcaWuIxSc8szA8z31aZnOvd4R5u4EcdTIZceyLsZM30jk
         fLcRNtAy+o8VbJ+GcwukPNkEksGxY4xP1stQOefw7uqMz9ezWeZwVKdmt6gXmb9j+tWf
         ZvbeJaylTcCcsBF8yGV4KPhcxRYLCM0Lvog65rPalQzXxz9k0bLYA9pAl6I2L/fRCIe2
         2Kqg==
X-Forwarded-Encrypted: i=1; AJvYcCU5K0auZf6z8p238uzVSGDQyLVGxNeQrZ/xE9a2PiDxiyfmf05HalqDrQlhBcW5sQSu124blvrW9qyY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr8x6J+KkCkqqrk0cnCv9937KOhXzluCVm0BPeOcbFgSP9QE/N
	YK6gqWEX1EjBFgdXLjCBBrmN1HQSMam8vXKu5eWfoeSp31cUaagG5BrXcFI63zRcvzoGbEw4V2X
	GxNM=
X-Gm-Gg: ASbGncuGiUsTWmQ29syetRY5+4MMw382O9D2vWOIeFF5/7xgGAx4QNUsFvuIKhhvKh6
	17I6jvr2iTxN9GNb1i3pqGc9PxM8T6a2L3xRWUgH2VgwId5yK6+8P8rPaPI9oc/AbP0yP9oHktJ
	+atirkPvSjLF+a20WEwiJ/O8oN9nXZLrg6wG1KqEls/kz5bNXUqcS0rEMBolbfsQSpX9sJReNi1
	TzKP/1l1aM65Nz8yFnCiPKUYdQ9CHuGNSxc+Jpse+7XEzZ5D3Vr81iyvxFuS4U9XcMB2kGpWjyM
	ZSRZN47C0KkgZB75KGAsoxoV/NoApIi3CDQFx78x
X-Google-Smtp-Source: AGHT+IG6vJMcPDbbB8aJXp4GBvSvxlx9tDVNz+S/2DNAZ5R+nMzSTlCe5ma26a9KdD4uVH3db2JQjg==
X-Received: by 2002:a05:600c:a0d:b0:43a:b0ac:b10c with SMTP id 5b1f17b1804b1-440a6699e8dmr82436405e9.26.1745826114893;
        Mon, 28 Apr 2025 00:41:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:96f1:a768:3c75:f123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408c7d6ccdsm130656105e9.0.2025.04.28.00.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 00:41:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: (subset) [PATCH v2 0/3] gpiolib: finish conversion to devm_*_action*() APIs
Date: Mon, 28 Apr 2025 09:41:52 +0200
Message-ID: <174582608319.15717.12211907178640999391.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
References: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 20 Feb 2025 18:20:25 +0200, Andy Shevchenko wrote:
> GPIOLIB has some open coded stuff that can be folded to the devm_*_action*()
> calls. This mini-series is for that. The necessary prerequisites are here
> as well, namely:
> 1) moving the respective APIs to the devres.h;
> 2) adding a simple helper that GPIOLIB will rely on;
> 3) finishing the GPIOLIB conversion to the device managed action APIs.
> 
> [...]

Applied, thanks!

[3/3] gpiolib: devres: Finish the conversion to use devm_add_action()
      https://git.kernel.org/brgl/linux/c/d1d52c6622a61a0ae8dd2bd2097b25c0f553d2f3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

