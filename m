Return-Path: <linux-gpio+bounces-24611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64365B2DA71
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 12:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CD265C6E66
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 10:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524C22E3363;
	Wed, 20 Aug 2025 10:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GW9/mD5I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B28C2E3360
	for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755687593; cv=none; b=Oa+35aB9Y+CD6FPGzyRcqWsjKmZr97OIuVTOxKeBWF12g1lrVVe7fhNeSPii3QHHOkm6xNS0EpuZdVaQMZfSwf83lIiyb914WIy9ZKvL76wSyDCIgN9BFxOyCuMA2eDnDrL8I2OFYDYqHMYf0sEDJsmhfIA2Yl+XPvj7Gl7cXiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755687593; c=relaxed/simple;
	bh=5C9Cw6MbKNCQyVtWzlqvzZV4YhvuQBxfCGDsbT47Af4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uG1Tr5NlW3gqpw/8P3sV7sX/4Tqe/NbnZu0AqlXnwvuBVAPz2rGxJSV6jqvfnLLemP3Uj3Me3kcrchgx/QwXpPBVJbMgi65Kd/80xIJMFqRx17e5f6GlCkf9Eg727mn4Lwv9L6Gd3zr4lxPWOctudW7rkDBEl24Jjz8F4sMdrIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GW9/mD5I; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55ce5277b8eso6451901e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 03:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755687590; x=1756292390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+BEjeTymJl53+LtXk+0qEyZUOBzNtqD78OrGPM4yjY=;
        b=GW9/mD5IVBeAT9QGFcMFJ4iFLXupZhZ3id0/7Pg9bGDXmbiJt2mNZurI37kLrC1aoh
         mAXymfscUmF68xzbTC8PwNQezoc5ZNXOXKyRfqFTqNy1GU9xhlkcFkLSG0lerdiTKViS
         5ZVIu2XMNPyd0U/ZygEB7WV8LhActhjur1VRCB6PZstFchZFufeZMJhzDTTiBwy8g6vn
         Vn850IIXDvvg5k42kC/VK63p2MvVdYk+0X1XBP8CSlGzfR8Uisr/W2Ep8+9uh/nhdaue
         sLIhOI+HOSrQn+0AqoRZhA+/B+w8qwfgG8da+uVUtDfdXmehSzhHStkgBMVOCJL6zAHv
         MbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755687590; x=1756292390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+BEjeTymJl53+LtXk+0qEyZUOBzNtqD78OrGPM4yjY=;
        b=LX3j0YbB2+I4prIL5IAvOoPFC0MGb0vUAZnZ45oiVzIimOX3eK4zVSEkDD+WquojYk
         ndoUW0FVja+qMSaV4OrLrlP3E0soQJZwr5Gx7Avo4VeJDhkrGMf1RoG7gEM1dgMhwbZ6
         wpCe43h5HtgSo92rvwunnky2V49lAfpDAdov4imIVv2TQldLz+o2ANkZDmr53qOQFeRd
         Xl5GAWguEKcrne5z/RYHNqvmZcNUxKFjAz0z6bjA3ZMIEAcSIjp1ZytebpTW53CQBXIm
         6uztmkUyTe5hv9Gc3yBzc4sEU1/5wopZe63EqjFziWkqbxGl3Jm+arOUefWMDscw04S+
         5Teg==
X-Gm-Message-State: AOJu0YzVGENs4H69RPCI902gb3CslQjsf0XfDzBlihg1C1jUMUChtlwM
	pKDcTKg9LhtUnPAzMdK/vgTTTQG47kuu+Z33npRo027ClCtvJpsshvlb9scDvpm+DpM=
X-Gm-Gg: ASbGncsLhwxObZHqKF7G5+qyUwHbH4Gtnj/vitPj4btvgc3gobsrK5yNZTsiJSerzuW
	WLjmxxW7Fhl4Qq/DfFllr3l3KGfgw8EtcLn/2a7k0xS8wObpPR4Ad6qxHJcWGClV0u4HSZaV2gH
	7OkC6WGE5f0+KlNHYh3gz48ZktpXNInkIDG2bfUwWVUPSBkWXAQG9kE5dmoKJenOUYm6cUEhmEw
	kEkdaP3fPnSefcBVzqvkASKpGu6Kkeq3syCsO0NqqUOboWNMhG9sjdkwb7ShwQvQrvkM0oYOYOt
	ZBUi7RJwJZQOyre+cvAtPXq6BOL033zXPTDjqcBHo+UsBW/Dy6bzJZJtxwlw+VW1qmkL1/IENzN
	Rf+sYPI2w9L08eRCq4imc0crRXQejRFvX
X-Google-Smtp-Source: AGHT+IHqrRQ+miCCo7OxAGLDcG2tIAR+OXgFYcsgdCZka4b7YXYZm4lv74XmM6I+zjRf5OgKI/ZGBg==
X-Received: by 2002:a05:6512:158d:b0:55c:eacf:452d with SMTP id 2adb3069b0e04-55e06bc148emr794304e87.50.1755687589605;
        Wed, 20 Aug 2025 03:59:49 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef369843sm2518285e87.60.2025.08.20.03.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 03:59:48 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Aug 2025 12:59:46 +0200
Subject: [PATCH 4/4] gpio: mmio: Add compatible for the ixp4xx eb MMIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-ixp4xx-eb-mmio-gpio-v1-4-0e167398c8ac@linaro.org>
References: <20250820-ixp4xx-eb-mmio-gpio-v1-0-0e167398c8ac@linaro.org>
In-Reply-To: <20250820-ixp4xx-eb-mmio-gpio-v1-0-0e167398c8ac@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

The IXP4xx expansion bus can have simple memory-mapped GPIO
on it. Using the proper device tree bindings, support probing
this directly from the device tree.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 021ad62778c2f49f0819b767a60112945999f572..79e1be149c94842cb6fa6b657343b11e78701220 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -730,6 +730,7 @@ static const struct of_device_id bgpio_of_match[] = {
 	{ .compatible = "brcm,bcm6345-gpio" },
 	{ .compatible = "wd,mbl-gpio" },
 	{ .compatible = "ni,169445-nand-gpio" },
+	{ .compatible = "intel,ixp4xx-expansion-bus-mmio-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bgpio_of_match);

-- 
2.50.1


