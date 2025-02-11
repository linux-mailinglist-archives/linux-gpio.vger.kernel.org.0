Return-Path: <linux-gpio+bounces-15703-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ABCA3062E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 09:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE8021889397
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 08:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932DA1EEA4B;
	Tue, 11 Feb 2025 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kkV2Oing"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D435D1EA7F1
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 08:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263546; cv=none; b=SlP+Oo3bjOxphOnKuMp1HPosAQ8vjIKzvTB5mRB1kExodYGEKCeXYZXXRKFLpJKeQV+F4QAzo6UqjFwUye1ejhY5NgWmulRJn37//tWnlaoNYFoLTkHGXatTmYuWpIniXEKsDSmgoHiZYoFXmA8LpepF8PxRiyB8CN32cOmE3o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263546; c=relaxed/simple;
	bh=81BIQZ+L2Ch4Nlpf2eDVFnu52Ewfxa2CaawfkZdW9QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q7ZwFsJQHN125lOG/hyZ5yHb4f+LDTmgQ3R3X6ooHPM7dENu635sN8jXZa8fEdMGDUZFKa1/nJQkJz7GCOcwuGFZV/Z7WmeOHnlyMlM6+XYRoc7+08FgtcPwv1Vfrz/DlKjJ6pL9CIZnzDSJuMaMQ3//yTO0tBzWTf/agvBH8k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kkV2Oing; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso16035285e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 00:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739263543; x=1739868343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9d7922w6HvmLNtdn/s3Y8OkZGdDlZZOo2h8DhGQAboI=;
        b=kkV2OingIFhU4n8O7bU/hNskzI0D+wK+SjMIk+lmrwaCgRQ7/EOfiI26zporbzBfVb
         DIXnfi9rYjVdjbiSoi1aKjCj2++m6Y+MBpsuyLsjsy8yq6tEGsy/oEhVVUhQ6sCC+t1z
         2wFwwwlosd29y9Kp8PhHwDe3b5FBz+vkQe0Dv+DoGsAdYec1NZ2QfyQyhgoquVfDoZ74
         7ZPEkOivx6znxUEMODXrdplXlOKzy+BmbUIvK16JzweAEHTxUGCJL+3BhhzwjD1P5ztF
         DlCjTfyeJ9bUly2vBk/Aurm3g/0Yl/PnVo7f+6foC3j/Cf6RcZ7nL2LPYYQzganQ5U4B
         NOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263543; x=1739868343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9d7922w6HvmLNtdn/s3Y8OkZGdDlZZOo2h8DhGQAboI=;
        b=bPSidV6H7NB9qO7ohOvxjLY31Imu6TvfU164UW+m1k6xPUQXlbvuvflCmkyp+pE0EI
         hpVonXJjE0jxG5kg6aOtF5l6u8zUcooY/PcL4HPsabIxhZHeZVemuVHSbwoxa55oR0yi
         9oKO7vTIkLtHNlHdN2CZ0wc+dOUmjDOUHiYBNXJu0ZXxhmunkKk34LcOMx8mCPyEgyEi
         1OZ0Bcrn0HigcMmAAPU8odRSrYQIn8HoAJnFmePCL4N/qs07wNrhgZwQrnhspAcdGwd1
         1fl8+L79D/bop+H2pnKireD3e8bWqSjqGrcziAJrVB9Rt/UgUjgpBzVMsFvDQ9mxZ2FU
         rceA==
X-Gm-Message-State: AOJu0YxnuurMMbexhPrVSwK/PEBSDtxnxd38tBFnQx3XX/zcaj+lm1Ys
	HujaOIvOeElvXLxXFgfORvkuB4i3jI4Y5oGwka3iwz17Clg8weBO7bvlCyPYyjf0illzuxQU/yG
	DchM=
X-Gm-Gg: ASbGncsCKog9N32WRi1xxayd1xpUqj0kf2JRjHZTHMT8gGBbbanTXPecszFzl4yLZQe
	HFhQVS57BADZRo4xFMbuj9sVWKxZxFeKrgY6r2mtbxWMx9uLGB9htk6/ttEq10y4VRQ/jXOHTsq
	YBAMbdTK4OBwkJ5vo6PDgXTFGvXOUdLUw2UGxKutm4TQTSi2bSMN1kQEqcgURmrLgLzdQhlcouE
	y/bv+vY/F3Mz1OawH7v9rHtfwVh2xgfxduvcWjgAYHUq2IMbbCea58Qxa8IpW9vFMnpH2Ft7tj0
	thYXUbGtsoCIjA==
X-Google-Smtp-Source: AGHT+IFXJ0r2yebE99B410tw3/63I9kwAbNgDKK2YOK7VmlZreYyxF70Qh69gndHZ9U2mRTCFlj+wQ==
X-Received: by 2002:a05:600c:3b23:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-4394ceb0eeamr20266405e9.3.1739263542886;
        Tue, 11 Feb 2025 00:45:42 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43946bff4d4sm46216755e9.3.2025.02.11.00.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:45:42 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v1 1/1] gpiolib: Even more opportunities to use str_high_low() helper
Date: Tue, 11 Feb 2025 09:45:41 +0100
Message-ID: <173926353972.23713.2175303106968169247.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205112936.575493-1-andriy.shevchenko@linux.intel.com>
References: <20250205112936.575493-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 05 Feb 2025 13:29:36 +0200, Andy Shevchenko wrote:
> The one of previous changes modified the library code to use
> helpers from string_choices.h. Nevertheless it misses more
> opportunities to convert the code. Here is the second part
> of the conversion.
> 
> 

Applied, thanks!

[1/1] gpiolib: Even more opportunities to use str_high_low() helper
      commit: 5f05e9194ada5609edbefb542c0dbfdbae984958

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

