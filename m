Return-Path: <linux-gpio+bounces-18318-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E9FA7D66C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9EE016A79E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B479A225A22;
	Mon,  7 Apr 2025 07:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kjNHKqEr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0842E2248AA
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011742; cv=none; b=GaicHRum0ccajkQgHFEgoRpooXvQYcP8Bn6SgWgHM7V0G4sk+q3Wpbl0nkAQWPgYjhAnITvKsH2IKnGn9b/dTD5Z5T+qokb3TJni0zCLNX1CZe5MTAJMlol7oWt+P/lwOZKvLff4OUaTjVCXptiWKT019SL3qtJga8a8WbKdh58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011742; c=relaxed/simple;
	bh=V38eq7FCelCROs42raMwfhM/55ImU/2u3l53cm6mEn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YV2Sy3n6fTbwiK4ipwQR+fkrzQhWU2hRciLFiQ80jmP/xC8yW+QPslWJQ4rmSF9AAYVHqt8iJn8+fmQbqDFTZ1yYXpgFgIdrufgPyRKZK9e2cTJuKzVfm+hJv+9lSm88GhglmtHZiVHhiwqsa+nGmeNKuGp4tzq3qIz3XNLD0lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kjNHKqEr; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3996af42857so3215351f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744011739; x=1744616539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaxmJdvdhtX7hTbnte9HAxlvmD2ZRh/FVwxHdpp18yQ=;
        b=kjNHKqEr+q1fYV9nEQxljZd1AFCuIR2oo6xz8NaZJhxdhJUkWuFLOs2r2e/PCbZeNW
         eoG406Jn9pArw/E4qX18RnD2jgBp843kLs7jT7FalwXhCNOFBUkwxFEQVFeC/ZfJp/aN
         1uzGU/vh1DiDVMoahseXd+DrY9Z+3TH5YIpDTLgB/v1kb0FJeGpwxquTT8lh1NjApujZ
         +h/WmkEKuDZROKRC0QWjaolC6E9uJP5JtH8b2eGDchfMQ+TE9hXB4eeM1p97AQeKoO0u
         IlmuzsvzpbdKMDtAOBpZ8I1FvCp9cd3jsmnEaSEhVD9lrLoshJ3fzeXKUUEYuE1hnTFF
         f+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744011739; x=1744616539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaxmJdvdhtX7hTbnte9HAxlvmD2ZRh/FVwxHdpp18yQ=;
        b=AdHKYH1HEe8DW0RxhSnkOiwN4sySj472O4y1Ee7x0dd8mfGPRA1045GoQjF+aY5VZf
         RCxX1I3BthHog2vKYxJYI0fHmlixLUjkR//KqtCI/Q6FNKbd0ug65mDOBYm5ea9/Mwly
         mKRKB84qfN+W9BLli8REnG7dRmxs8wMWHpiRgdvG0kRHEEFYgDmPUY/y97RQ7uVwG5vA
         h8tcfUnkYNjvrh8f0u26rLuPTsxPQewzxB+l/3pqZM9Q4a+cZTwp+ha5k14i4b5f6jaO
         7nq8DaxRaO3sruC23xLbErqsBZzyDCR9dLpMb1f2Vo0sf91/Z4M6MRSEUw26ADF52XcJ
         pHpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6AG+dGvIMeJt5adCQC4TXQeiDgdcrO1nno5tHK1vu9pObTUNxArne+iebpINK3OjkQ/jxCbZdK5fl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzma6kGb/1yjJjda+s6BKY/Xu/s0pP8Ptt3/vl1fWGkzzOU2Tnt
	ci4eyH2sE9BUUjZTrdI5Rz4xxMbBF+r/91IUUKfcsQ6sj7mquq+b5bHgKo7+7/k=
X-Gm-Gg: ASbGncu3XujqIotVxWPEbG+R46KAQWA95KWOzRAcpKxp1LuZPAZEknpRRH3/nXgdgXD
	yEm06OC1ZmUc9Fg5KRzJ+PEvUUX/bbFqMmYGyc33mXZdpyvIDaacyyRXTDA6M/yPtgjfwabVRVu
	b7Iw4D/SXoVhp3ihoPXdPGoZdHk4MhMWleS+BnD8rI36WlUCpibgUBEeeHzQF5b+VL2q2VLRQ1y
	zdiQCs86Lf4Rv578djqEAY/Tq8DXjsJtcpMqkA90ZTl4Kl/SA2+P/Lwmw0x+4bCRWtg2OvPClcv
	u5Qr6C0RmUan2SjGBkuaYOgHsFLXk/tMk93jhU9/Wpu1
X-Google-Smtp-Source: AGHT+IE6QgJB9JshmZZcPlhwCB6EA7JVQMD4x3bAODJvhStUzpBPIJijVfdsvTwXBWDIy69lNco/0A==
X-Received: by 2002:a05:6000:420f:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-39c2e65a08bmr14907199f8f.24.1744011739377;
        Mon, 07 Apr 2025 00:42:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301acec9sm11131294f8f.40.2025.04.07.00.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:42:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	krzk@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	andriy.shevchenko@intel.com,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: (subset) [PATCH V2 1/2] gpiolib: of: Add polarity quirk for s5m8767
Date: Mon,  7 Apr 2025 09:42:15 +0200
Message-ID: <174401173191.24103.4199616669647190339.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327004945.563765-1-peng.fan@oss.nxp.com>
References: <20250327004945.563765-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 27 Mar 2025 08:49:44 +0800, Peng Fan (OSS) wrote:
> This is prepare patch for switching s5m8767 regulator driver to
> use GPIO descriptor. DTS for exynos5250 spring incorrectly specifies
> "active low" polarity for the DVS and DS line. But per datasheet,
> they are actually active high. So add polarity quirk for it.
> 
> 

Applied, thanks!

[1/2] gpiolib: of: Add polarity quirk for s5m8767
      commit: 4e310626eb4df52a31a142c1360fead0fcbd3793

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

