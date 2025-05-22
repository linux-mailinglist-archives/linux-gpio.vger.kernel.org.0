Return-Path: <linux-gpio+bounces-20460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 200B3AC066A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 10:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 746A3188FECF
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 08:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848162500AA;
	Thu, 22 May 2025 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Z+nWEFaI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64669221FB3
	for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747900830; cv=none; b=sHBbqxooYiLhSFKrubkZIRHEdUq9FyNQJ/AbqdsG527pw610x+60qMNnCaFLU95060UWTmGbq1S9xl1WElfE+ZdIZpYXlXf2geutkOcqHYVQZLXO55xIkhVWXIQCFkX+70nYfCYMeP+zci4SPMVuLdrw4vHmMPD72pwZ7SxY/Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747900830; c=relaxed/simple;
	bh=2KrLRCNsvyk+hOa4GOw+soTgVGJ/UOZjQf27qAwdHMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CW3u9E70D4g/jsIaID8a7KMLryb+hw+2njkfqKxJDNGSN0Ahpshkz6Jh4widxQn1SrBISpmRN0s4x7ND2m5cqGXBfCpsDcw1ooAXxl99RI6IXbYKLFHXV8lVd2pvio6XObJy0uoPEBaO4J5InfDK/2DMkZsMeptMa5OyCTrLbgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Z+nWEFaI; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a363d15c64so3738443f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 01:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747900826; x=1748505626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ilxl+LSaAl6Lq/YJ+iXyW4KufkIqKnj6oK2o+Hh3z1c=;
        b=Z+nWEFaICmKG3vLaynTV/QECLCx5/vGIMQynd+OEOelvsX8QhIp8fQVcNam8+w8flk
         wgSVONPADdzGbynsmLG3V6pRmP5xlTGOmjpq2FCSYWCWU16OW2m9vWxkz+ju0vbJx7tG
         C9G/PhS+MoSogy17s+G3HPSRBnEXq8tQ0raAK19tEpJxIyLDNYaNw26Z1TaDC0V7HdMu
         LgXdYHkp35Pz4UiE2GiGk/gFr45H6WubsDW1uQYrcFD8ilRtqmkOlfvb+xJawu6bq/Ww
         /4HNo2O28GcoOQ7OkbvUrOZ/KrP70cc/5VICLmSyj+ACv9ZwexHBL0VPCUPY4Suf6In+
         DA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747900826; x=1748505626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ilxl+LSaAl6Lq/YJ+iXyW4KufkIqKnj6oK2o+Hh3z1c=;
        b=oq94R/hkAe80MPB6/kV0EOtnumjFIDu7cQLiWJRXFth9zvrKj7DajV377eYjoUF14s
         rDHb2Q+twaAB5LOEHvEwOwFAvzc+2dk8ZUsJQE2l8/BllRETWo5L40JS1zPMfIAo5Mmq
         Z9nvxtT6GzSw+1iEgfGoEisdfAewa/wityEZh47jeuGcIH7K1kIITiDsRQYJimXzCjJN
         LX3vJP79hGs61hDUjepU6LE4yvkbX4r81RJDJMmbh5GCQNVDOwQI0U8jmI0sFHmrot/X
         Wa5VE3MpEFQVUC9AMb87UXfm801wTr9tpArepfULdhcaUU/AyiqL53eaxZpixrDtoNNW
         d1Rw==
X-Forwarded-Encrypted: i=1; AJvYcCViVHE9/nLvWls0BrvRSd0nNIbsYQXaBbmM2JxPxIUn0bG3RVbOZ+G5bJVMunUyz2/0n8/+tvhxe0GJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxwZF7QVm68dHg33Zl9X23i3c7pOaPHlbbSsdpkQORqHBpmxzTg
	ql3cdtLqCdeI3Pids5I9xuMxCv7q7nGQ10uQqqHrc8BAaWu8tDzNuN/GDUX4j71lMs4=
X-Gm-Gg: ASbGncsEREBuu/nPAvO/cbnv8WVUS3aPlrDiZKmJEfj2hTD0ym/FZBEtpftXOWRVoNP
	QSzAsx2PciWa7HE7cYF6JNpXNbIvhStKJiNqBSwt+RyqiDetAeoKK5Z5LulxEbRcymWNjrD90KW
	OkQIRe+n4qis8y2EPZCRkldE96vdKB4NF6+qLZqJH63IoMo3FPxdLhKkw678qL3/PFGU8VZQ9dh
	LuLomzh6RRexRuoD476KZDr4DWXPLCbKVMtJ7ZJKnmgEwk2MPzAgod/p/BNbdBlZbeAmFBZWofe
	yFsvsKuCqzZcnMpHS8J9bvZIIgpHXvisvxAMGx7zUaaajYHD6ZCC
X-Google-Smtp-Source: AGHT+IGIbjY86ciIOyRVyM/0jS+mEA9hAYBdMWLbkWJXiCcKUuA3jgCciTCBgFzCu9rZSMQYBYX7Mw==
X-Received: by 2002:a5d:64ee:0:b0:397:5de8:6937 with SMTP id ffacd0b85a97d-3a35c840cfcmr20664488f8f.41.1747900826480;
        Thu, 22 May 2025 01:00:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:774c:e9f0:1d32:4927])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a362b4e2e1sm20913519f8f.96.2025.05.22.01.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 01:00:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/4] gpio: select GPIOLIB_IRQCHIP for various entries
Date: Thu, 22 May 2025 10:00:24 +0200
Message-ID: <174790082298.11547.4760162788670811259.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250522-gpio-fix-v1-0-98ceae7c4c3c@nxp.com>
References: <20250522-gpio-fix-v1-0-98ceae7c4c3c@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 22 May 2025 15:11:49 +0800, Peng Fan (OSS) wrote:
> There was an effort to make irq_chip immutable for several drivers,
> but kernel test robot reports build errors for:
> gpio-mpc8xxx
> gpio-pxa
> gpio-davinci
> 
> Thanks to Bartosz for helping on this.
> 
> [...]

Applied, thanks!

[1/4] gpio: bcm-kona: select GPIOLIB_IRQCHIP
      https://git.kernel.org/brgl/linux/c/86fabf1b174069465ea12b4140cb35543fd0c738
[2/4] gpio: grgpio: select GPIOLIB_IRQCHIP
      https://git.kernel.org/brgl/linux/c/3dff3563cc11e90f046902f0b2be40e82f5ee251
[3/4] gpio: lpc18xx: select GPIOLIB_IRQCHIP
      https://git.kernel.org/brgl/linux/c/01e4397d0c1c9ae434c574f45359ad0c226a864b
[4/4] gpio: timberdale: select GPIOLIB_IRQCHIP
      https://git.kernel.org/brgl/linux/c/8b8ef309093ff196967a21ee51a9cdb404a13bf6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

