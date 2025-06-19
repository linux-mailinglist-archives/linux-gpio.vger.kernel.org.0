Return-Path: <linux-gpio+bounces-21834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAA0ADFE67
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 09:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 227A53A2171
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 07:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290D32475F7;
	Thu, 19 Jun 2025 07:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zR6pnixk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90611A0703
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 07:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317013; cv=none; b=sfAwOMR5i/sC8YPWY+a9Ie+S/n6EtkFMISd7rIjpHM++pDKuu1k/wjhRAcv8/zyDbo6bquKwHiQ7hWrQX5VzAoH5nf1bSJWZEl+SjSxb7PRZV2EqKdHrF0x5tw/fsCQO42vQW+0O7ysBugldnQvYrJRRTK8etdJvrn8FkjukzDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317013; c=relaxed/simple;
	bh=idDFcxqcaZi9ITOA6O7O8mllE4ghKzrrd7yNzSOM2L4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AMRyox25pCFYIhnNEC/a9bP11vsmVKqp+bP7aQDaYvRc6UMbiHubcHSwnuBEOT7OfSQGOr+BFdzCKBUt6PxgxVmIGV7eZOl3oJ7F2JGvszY3/ElcvKvYuQ/eRzZuUFuMeUrq94XSGqkVL3UkwlYS4fShrZUAxkY9UZEfvyA6Uv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zR6pnixk; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so4966725e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 00:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750317010; x=1750921810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJ7WKC8SwlHWnkxUpPjJRL3c4L2d7RoKGqvzAae/doc=;
        b=zR6pnixkCp6zsjJXT0jpVG9em6OAYlr60twEB/Tnwh9XI+3ZEmAHkb9wA/wD9NEQKh
         vqGFjJdypKx/+/2nRpH5UPVmgmbFDEstlJxOUccLZRv7YDNXGGpWdtJyvYAua3eE1b3c
         eETtsyfiSJYQrJ+oQBOzBX1C281aLpvRIcpGmy9BOFsr/jvNCdhrFpjaFD3OJ1tsmLgF
         t+4BawXxhbMYqDS/2r5h4Jr9La1wUdzdyVlfTZTxQInLMc6FyPAk4z7BpyymRr4ceSLh
         c4IKRk37UuTtsn+iGXzcPv9wvXOf5NpYNp4dKPCGb1VFcZI6Bv3eDejNZ12+LQ8ph3rW
         sMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750317010; x=1750921810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJ7WKC8SwlHWnkxUpPjJRL3c4L2d7RoKGqvzAae/doc=;
        b=rnUbg0LIC6K15pGWTCOc5TW7boJRDwp7a6x9idCfFDqGQ2g/TFPHsBS1nYQMukjzHJ
         I6TgZ/8cp+8nuByA/LREeFjHX3fqC64Gzk3vIwKghuddtuVH/yeJqu1T1Y+oLD3SL0wT
         20fJ75cndEP8e3rumEkkjPmaMdwi0732iyUEUQKVyf/BfmT6+6rjPD2Bdl44s5rvHa8q
         q/EpayIZqWP865DsZ+Xp0rIu5GJYuKEqRHryhB+pqdBy6Wvo/KvKekkaljIOZCFn6xrg
         xiBpbzJVGYxBeRx5ef50LtulsZtpLGPljbu3uJVNbmtmI+ILZQCSNxl1lhFIkLMRi0Qv
         SU8A==
X-Forwarded-Encrypted: i=1; AJvYcCUVNbFzRDtPhWo0zKHt6oXjoOjsmt0zMic99VlT0qe1ve0jAHX7VUj+Yf61BdwolEWhuZFvEVfUowDe@vger.kernel.org
X-Gm-Message-State: AOJu0YwWUEz6is37uHMPP+wTOvyQPQvP7L+zTO0+TnH1Q4Ufaz0AjJS2
	Udb3HWYuWHceb4KDgerkDOpsj3cyKl7TTJBTdR3qbAR9OhQ/Ynf5KhJAbxsy4JmWZ3Y=
X-Gm-Gg: ASbGncuDVTlSTi6h7WrPU2juqaBYmkN+SsBDYotcAVB4GYMNJcvQppIcO0jthS7IGFF
	YVeyMnblSBC4CikcLpUNKtsvsLOHRolr9gqrcviC8ZA5vPleoNZEWNyXgUy8yQn/n0q70EcmJLX
	FO1v01jJupO/X95CxWTa0oz6yYVaxIp9qIaLQ29Em/u+5jk3EIYE05+kJv77HM7FQEc3EhCh4pb
	XSB/5DIA6E6/LJzl9JR4SMelQAC/yempcP79hEiZMYGGHKMyGYuCu7/NDktZ4Ip4XZg8CTAPZ7t
	oci/CrkgPAJFqRRKSi9JIU7FlkZlslBIFlnXHDVt7miWCaOb0f8mqajT9uIkRFA=
X-Google-Smtp-Source: AGHT+IHzP+i1T5dB4ay7/aTiSPYaINe2A3Zw6rt9PEf6xWeqmugHB7dSuPeuV0xJhfe2MdtyIcwRZQ==
X-Received: by 2002:a05:6000:1881:b0:3a4:e5fa:73f0 with SMTP id ffacd0b85a97d-3a572397846mr17415430f8f.20.1750317009976;
        Thu, 19 Jun 2025 00:10:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b628ecsm18982991f8f.92.2025.06.19.00.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:10:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
Date: Thu, 19 Jun 2025 09:10:08 +0200
Message-ID: <175031700235.8154.11042956002137082224.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 13 Jun 2025 12:14:11 +0200, Clément Le Goffic wrote:
> This patch series introduces the Hardware Debug Port (HDP) support for
> STM32MP platforms.
> 
> It includes updates to the mmio gpio driver, the addition of device tree
> bindings, the HDP driver, and updates to the device tree files for
> STM32MP13, STM32MP15,
> and STM32MP25 SoCs.
> The series also updates the MAINTAINERS file to include myself as the
> maintainer for the STM32 HDP driver and adds the necessary
> pinmux configurations for HDP pins on STM32MP157C-DK2 as example.
> 
> [...]

Applied, thanks!

[1/9] gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
      https://git.kernel.org/brgl/linux/c/deefc7083414de81aad102b60f0390f600d7eb79

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

