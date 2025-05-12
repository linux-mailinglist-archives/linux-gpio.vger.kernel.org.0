Return-Path: <linux-gpio+bounces-19964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14228AB3A6E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 16:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25C823AFBC5
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 14:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C7F21D3E4;
	Mon, 12 May 2025 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipULPwnM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8400F21C9E8;
	Mon, 12 May 2025 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059796; cv=none; b=Rfyt7Mv5xUJhDqgqWoAV0/P0g0LjtymWd4xgZz8O0MwC8HHBvD8UTSVppM0MMdNe1/K0ehJJ6xF6WWx6xXdCpIo5WN4eUTZsi/IvbcAQpLRuYactuMK97aS7DrrZb0TuXM8iSZ0sFqMWbwGXa61OAiCZGId6/aC63ZcOdD7QCMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059796; c=relaxed/simple;
	bh=ZLTORN5u7xcGbuKsv3Ru9a7w59Xjk8sOypfmX4XRREY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZrCgGqmAjP6Lff+NZVmg3/oKmZTh/2q+JjGiXsM02w2Weim8EK2LhGw0GIaxX+S5fvBDN2DcQ7hr+qBtnkwTjapqQwUAd+mZTNiqs7xyoaMDvqdq7m8snjufEJp5t6/HEXZtVOuYiIDdnNIjvTAgGGKEjI01RfykIufMstJ36Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipULPwnM; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acb5ec407b1so787115066b.1;
        Mon, 12 May 2025 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059793; x=1747664593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjdqA5SphZm+l2ts69ztB+ZwZbqHkrkuYbQuDIwGCqA=;
        b=ipULPwnMmdnzCMoF8BDGF+AcMIKvZ2fpHk+VIScUcZ+PlsMkSzpVJJkRfcm0zw370+
         mCJ6TYZPufzR6LebcEz3V811sdYBphyw8kBJoH5o9U/Ag4jBVnvXZ9GRnpvPEpjPvxU4
         wTWEWIpNCq3Vm93bzI1AOh21BKDDRDA7X0OYOQ98de+p8JDqaz0+1nW+PIH9U/PW9c6m
         xcjsHwK5rWuQowEW3dV2Lk/NcoDkpyBXyG8VXl0oYr2Xaz1BAtqZ64Y/P79oHJ6pAnA1
         SaTXsus49ZGjyK9CaCgj5oFPEtrnb94UqT2ia+zjf6X28xBsRH84LQbBRPmVu+1/0UU4
         Qh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059793; x=1747664593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjdqA5SphZm+l2ts69ztB+ZwZbqHkrkuYbQuDIwGCqA=;
        b=H1WaTxE35xP2C7BtXoZEX05llfTjDT5fehx8uBnxt9sL3ovaqb9lv6T1OiTHk+j/dp
         KFQ4y57GqDW6PQjugnCCZAuWVBH1Jv7KHxzGjP7IPf0uUweMflIKmJiJnV+4tb9QYKOe
         BVL+6FtiX8ASfcs9IJosZNT8ymV6GsQnQT8UmLDj66vTrHl0LqvtGoLMuhr4g1s6zZGc
         TVy4w+6b3R9EgkvsN7LNkhugK+4qCX7xI0COZJRgyx69UTzzL4Fam4plKr9sZJduvXm4
         Z+UgIsqH6cvAXF04ex+zi5OzmqXL4MYEz9g5e+Xzdq8HzRyFJPx2Ah0XSR81Zfme4VKO
         anOg==
X-Forwarded-Encrypted: i=1; AJvYcCUUqyo1uXYGToJJ8dVw1I4/uhhy5OHE63+qydFdFpj250EedAHtfmzdO5l7N2lFiYNktm++a+xik2FDpeCE@vger.kernel.org, AJvYcCV7KS7HYYhM+1egXkPUC156jAj12sHeyRQzWZair6bwWk4RyJyQPzge/OkndcR+X4X9edRJi9FyfOy/@vger.kernel.org, AJvYcCW13Dp2dPnLj/y3i5kyZMVt6IYsX6u60F53p0xWJMLw9bG47D7aM/qjhrNRQrEzqfBvmrfznLQY@vger.kernel.org
X-Gm-Message-State: AOJu0YxCGdBsWAc3CdwKp/eYSHR1HRHh2P4YesmH1hRkqE8+JB8UEQ7X
	1rz8haKSCaX7QoJk8rM72hggeSMp/OtlrcBCDIRr3nevWV/Wk+FM
X-Gm-Gg: ASbGnctJ0GvJPELcXlwgOjAf6k3fGhPTrfEsHyTMbXdFKuapcwt76yl22WJX9a2qqt6
	smhUueXQv2Sq2fN76M1p0cwIIPCooDH+TVTf4qFUvOxfCQmL6o5mQSC3GaFtHK79wKA5zkfbbBi
	ZGVdZrkipB/lQNsYH1sXRANikiNXd4IbTa/4cecgg/ae539tpokEvJGedCn+yV05Uf7WjSRbwwg
	1swE+10EG35kbNwybiWNtbzJLirJKbFwodNFfMsk4Ug5YUpXcOIgFOAMorn5r5RhkSuTzBz7ptD
	opUZmVxBPkCB/z4XSMD44uZc/TcrkrlP6htkKg9GfBLzgipkzawzTYIB+jwN8513uw1s8XVTTMB
	ITgn6TcjwxGuGCnQ=
X-Google-Smtp-Source: AGHT+IHY89ib1m+RqAiIfHD1t0Lvi8Km0tjdoUyONCMCestwVPtVg38jm6cI4xiUm+sBXYxZlhwWDg==
X-Received: by 2002:a17:907:7a8b:b0:ad2:3fa9:7513 with SMTP id a640c23a62f3a-ad23fa97742mr725361766b.46.1747059792642;
        Mon, 12 May 2025 07:23:12 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197be0c5sm619626866b.153.2025.05.12.07.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:12 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 12 May 2025 16:22:43 +0200
Subject: [PATCH 7/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_pmx_set_by_name()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pinctrl-a37xx-fixes-v1-7-d470fb1116a5@gmail.com>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
X-Mailer: b4 0.14.2

The regmap_update_bits() function can fail, so propagate its error
up to the stack instead of silently ignoring that.

Cc: stable@vger.kernel.org
Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support for Armada 37xx")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 18c6c5026b26c294ee65e3deea02d2e852e10622..f35bf0cd98c97419ba0ab0291a23d4774a595d39 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -358,9 +358,7 @@ static int armada_37xx_pmx_set_by_name(struct pinctrl_dev *pctldev,
 
 	val = grp->val[func];
 
-	regmap_update_bits(info->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(info->regmap, reg, mask, val);
 }
 
 static int armada_37xx_pmx_set(struct pinctrl_dev *pctldev,

-- 
2.49.0


