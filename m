Return-Path: <linux-gpio+bounces-20524-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC933AC20BC
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 12:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBDE83B4C30
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 10:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B7E229B12;
	Fri, 23 May 2025 10:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMPe1HBt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1DC22A4E5;
	Fri, 23 May 2025 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995309; cv=none; b=C2PPespXikCY944Th9HTNwxOgSqF/68HYXww7rBSDCVzRqQT3AnTPcg+9EA8sfSm9NdAzRlqTMSisonVrAEH4CJZm5D6K6fz2OoiCJIdqQ3blS9oayAngtG3X1BpcQUzgs6RX9CiDUAb1ppc5bi0jEHmRliZVPYziZP7d2rwOoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995309; c=relaxed/simple;
	bh=9B8Qbuz0+HjwNMerJ1VV6FpRT6m7U/s0nPQnJsXESXk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dvVAlljNI8Eo9/wsKngzM01SeR6kDt2VdWS5iyfgueMXWSrw9LWlG5fEmTXXNW8QnqYXL4rvUMDs2bK0YMZB8S4YQuP9vxpkU9koAk05GN/dfUK1yeI/lTTkpl30zQX1k3Mg1xbRvHDRPzV+nhu6RDMKTBwXM1SCWT3QnUF3Av0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMPe1HBt; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad563b69908so955424466b.3;
        Fri, 23 May 2025 03:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747995306; x=1748600106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=12Do9t9YpCf+Nz+IVlJd3oQSzsy39pOVxJJm3ENuKwc=;
        b=XMPe1HBt5RET4bQMYSlP/oPTJKE24V6d5nMO20ZHhP6HKIXYwiAA63jnz0u1IVvivz
         5is7g64k4N3qjdhIK/0PPeAt//xxk8XaevKPEyuQgJ/jhvWjXIyNbsebtqntaaCTAnWe
         T56MgED/UsYQy30JqFqwYH+tugV/boU5PS3DFFEypBV9kNxCwQ0EvlGdpiuiCL5S0LYc
         Q29QU81DuM4LT0TwwCtncnkGFEc6yOBonbtF+5y4JeVoLl9rFTr1/8EaMSX2gBFAm6PF
         EHjOd6byVA15/Gi8SQ9AqhQJTbtKXfgN8mwuX3ARKgd9E8Ji5iVs/Vyhuarszwse6d2G
         AQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995306; x=1748600106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12Do9t9YpCf+Nz+IVlJd3oQSzsy39pOVxJJm3ENuKwc=;
        b=udQgWqZLKu8nsnAXGs/lpa/nAvKoVrVoOwRzBPuQ3l9J27leEyFT1tLo0bQtrDgD3b
         ElzsOAm+dVbHxI5D/tp6IeHA+2nf5cccd6gAAn8L91nW44kxvCWK2Kf4UzO6LBfQj5WJ
         kHAXMXIge2UEMBoG9EEnhFrYm1qVhM8OWrWK++o9WKD5wzC/Lb5P5Fo9PAHbu8k4PpsK
         e8EmYkG5RiPLn3pObGg6lR2nJLrT5/FYxU/4nOtpbR33FhyOeD9Opa20Ih7LMnWdplBa
         9U987IM4mvyrbmSHwNpox1v3JQGzVhjbBUyzT4gB4o6LdUAY11fenc2WsBvW1i9v5eOb
         1nDg==
X-Forwarded-Encrypted: i=1; AJvYcCUOBFJLQsjlhnVy1oXOLE+PxnP8YSDYqDYsV4ziXT8l3iYDZ2mYI7oECwBygBHDTPMf41bVtsLb8EOuJPC4@vger.kernel.org, AJvYcCUuRNz5D6X7tGT677esOThRXwnJjKnLiCWkHrTXPV2fQF0xu49KxV+H6SDkeYbEhiR42erRnsuVLoqcew==@vger.kernel.org, AJvYcCW7UglxJXQ9S7/cIhQQ8nuborU55juT5SqjvZx/5E7+Jagoc9C70t5BCTeZYEHwZ5DqoDHRhpfZIQ3IRkvs@vger.kernel.org
X-Gm-Message-State: AOJu0YzLxky2RqroJuBGcsE5bQ3J0WBvdMU7R26yrlVW5M4Y5k2OYKxo
	JOAk+QU2wv8wMK8Mgo9jI3kO626RBgdQEn8kYH8e3585fM49KhyAum/f
X-Gm-Gg: ASbGnctdCrOwHhOyF3wpzSX8sdKr1gKUewrqR1Yi3rmd8QfD1hQ7hVarZHJJl2vaf1Z
	0TQ7qGJ1nGLisebt+3MbSyvRNuwGDcBYgepacybkttWmvc+/W+RjCIoMXWqYeXLVwGChJRNlzx+
	/Vd+1PVRZ63MO+p73C/rpbzqSYyZWTiRbLAr7ynRJJuFeDVYoaX/etOXDbrWry9XRHNlvM5xRaw
	eLjNZ9Hu9D+VKipGxOh0dv0T3Giwq+btsxLpNaJTa7SpobewHpW9EiMhQuZ4sXD5YqA7nB8kVS3
	XKtTTl9P8P7Xq0RgnRQJwCi9SzUeCktm5qHUNNJ5tsNa6yhXz5+XmEBjAfO+3QU2aQ9imR9FjCU
	oYdk84ml1
X-Google-Smtp-Source: AGHT+IF9z/ZwcIGZ/MFGn3LzYKCuz4hF1lfNqCLb8lo4Mdq9Jp1Bno4R2tXKBU4ikKUFTPlMGPVwAQ==
X-Received: by 2002:a17:906:230a:b0:ad4:f6d2:431b with SMTP id a640c23a62f3a-ad536dce6cfmr1912503166b.44.1747995305575;
        Fri, 23 May 2025 03:15:05 -0700 (PDT)
Received: from T15.. (wireless-nat-94.ip4.greenlan.pl. [185.56.211.94])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad52d06dfa4sm1212928966b.57.2025.05.23.03.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:15:05 -0700 (PDT)
From: Wojciech Slenska <wojciech.slenska@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Wojciech Slenska <wojciech.slenska@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: pinctrl-qcm2290: Add missing pins
Date: Fri, 23 May 2025 12:14:37 +0200
Message-Id: <20250523101437.59092-1-wojciech.slenska@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added the missing pins to the qcm2290_pins table.

Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-qcm2290.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcm2290.c b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
index 85c951305abd..eeeec6434f6a 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcm2290.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
@@ -167,6 +167,10 @@ static const struct pinctrl_pin_desc qcm2290_pins[] = {
 	PINCTRL_PIN(62, "GPIO_62"),
 	PINCTRL_PIN(63, "GPIO_63"),
 	PINCTRL_PIN(64, "GPIO_64"),
+	PINCTRL_PIN(65, "GPIO_65"),
+	PINCTRL_PIN(66, "GPIO_66"),
+	PINCTRL_PIN(67, "GPIO_67"),
+	PINCTRL_PIN(68, "GPIO_68"),
 	PINCTRL_PIN(69, "GPIO_69"),
 	PINCTRL_PIN(70, "GPIO_70"),
 	PINCTRL_PIN(71, "GPIO_71"),
@@ -181,12 +185,17 @@ static const struct pinctrl_pin_desc qcm2290_pins[] = {
 	PINCTRL_PIN(80, "GPIO_80"),
 	PINCTRL_PIN(81, "GPIO_81"),
 	PINCTRL_PIN(82, "GPIO_82"),
+	PINCTRL_PIN(83, "GPIO_83"),
+	PINCTRL_PIN(84, "GPIO_84"),
+	PINCTRL_PIN(85, "GPIO_85"),
 	PINCTRL_PIN(86, "GPIO_86"),
 	PINCTRL_PIN(87, "GPIO_87"),
 	PINCTRL_PIN(88, "GPIO_88"),
 	PINCTRL_PIN(89, "GPIO_89"),
 	PINCTRL_PIN(90, "GPIO_90"),
 	PINCTRL_PIN(91, "GPIO_91"),
+	PINCTRL_PIN(92, "GPIO_92"),
+	PINCTRL_PIN(93, "GPIO_93"),
 	PINCTRL_PIN(94, "GPIO_94"),
 	PINCTRL_PIN(95, "GPIO_95"),
 	PINCTRL_PIN(96, "GPIO_96"),
-- 
2.34.1


