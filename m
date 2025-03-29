Return-Path: <linux-gpio+bounces-18104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2BBA757A0
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Mar 2025 20:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82D827A323D
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Mar 2025 19:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05321A5BAE;
	Sat, 29 Mar 2025 19:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="BeF+M/Ez"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF568182D2;
	Sat, 29 Mar 2025 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743274904; cv=none; b=T6ZHODFeEu5dwhbL2rDZuddxIgOV+tQb/8HgV/ed+/AhSzCZxbLWTFuUe0m1V2Oe3y7uEQReQPzlxPZQXtxW+mXy7g2bW+MFCU9DsqJ9bH84MoUY2E1LKlOKJs9tL8QIHK3GMgFiM6TmL2H/iBwaJVCZH1g0ml1nNMUUaxuMEgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743274904; c=relaxed/simple;
	bh=Clp/hYZoUdAnabVyv6fxW2GJ2mX2YFnlFv949QntI1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KWjAANmoLC8fql9DkeEsBzF63yCobHZHd4VV5MkSFsdQCuOaFp8OL6+LIrXbLLHsoqGfGPhbjGGVn8KEYuRaNrlpd9LSRnOAdKgQr0Bt3vMIugMFVLe2kU9ffBq5jnC5h3peFRZlgIO+6AZCVS6B/GjBPD16YSFLthxEMbHidTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=BeF+M/Ez; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso5945396a12.3;
        Sat, 29 Mar 2025 12:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274901; x=1743879701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U59vr0zBBqMHwQ7X8QxznFMvqw1Fg+vz+3lxSO/2TPc=;
        b=BeF+M/Ez1kamZTelYE7ggoYpDofX/VJPBjQGIz2ZNp+mckQc+y5bFVZpVXDIHeGoHj
         k0ueJmZ4zxjsetIpEzek+jN/Gj4g57TsH0nn92m+4P75jhE1tb47YvlsX930DwQrTTxb
         hWZbX3uG1ih/wLkrr1F3opmuXGGGiwswwougWPedXZbsUCJLabaEQTLwkNg7+Y6PtXkm
         gGFJpUvMJMuJrRNhe36qFWoUjJmeOD6opSSDEQhrGpc5v83XuSrreN926QMMC3Jbnfgz
         b/D8/tdCUmt50KWurZBhDvdKiB1UfK+Ics8ooHAdG0DUGei5WWvh9SCiZdW9UEtS4IYx
         Zlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274901; x=1743879701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U59vr0zBBqMHwQ7X8QxznFMvqw1Fg+vz+3lxSO/2TPc=;
        b=IXHfT9adkynbsgz4pJi1PzP1CIlXhPRvEeUUFjUgGuE6surP9pK82RhmkXlpbsV+bN
         fB351liK9CyX1NYRmNOC8n8IF4E9zpdjyt9TznPJyDRKA71t01KObTuBTmy9BPusmADz
         jt3t80hXgXK2ujE+2dZ5Htrwkau4s7RFlHkPix2ecr4AINMG2uLtzrI6o6iAgIKKdozt
         KcxaJI0Y3MizYWTxxDPeShgdjRwybSWWdV3T9BUQqq3MPRvuUbqDMCio8ObB6kNvd0fz
         zHLK/gl1M3XyYy9gj750s21gG6pJisvVKT7YC6KBskcVLE55PVMvtNtqKRVfPpYDEK5F
         Muig==
X-Forwarded-Encrypted: i=1; AJvYcCXvkeyjHjQjDwoFcpLZErqeOCvOPWzpPegUKkCY047XkCWYkiaDfhiCUAsVPZd1tHh2ODYMSZMtPSGc@vger.kernel.org
X-Gm-Message-State: AOJu0YzF1IoZs52qNRY1uN9uOcPe+fR31D3HWa5+1aDZuKtsz/oW/xvR
	77OuUEevjUZRfgzvNEbZUYrIMS1rXMqLxRAViE8fUaJJT8kax/bn
X-Gm-Gg: ASbGncvHrTvFRl5QOQLzJBS68ErXz3M2CEONCdw2CLIx5tAjJCrKLOWhhChyjJ1MYQ2
	ND0GpPPUy9hu6zMg5MHc2KD2RPRI/jXfL3DaJuflgRjLVyLM8dGIW6tF7GX3rFjaEVlesDk9Hyp
	o+01BWqmkiDDJG/hwqyFF/KT7BpkGJZFFj3wGl69sWLZvHWFFIuFp1aPymjcEU8rCfLATR/oCX/
	VCk37T7TCZkV9Xeu/BmTUuzqtSHmCBMFDaKOskrG5uDPMiLwCMRgAhxeiq+H42gu4qcyM2GuTTE
	DEmJjg1Rw0Q+WVRH31f1ntc3xziZGKdf5rVd+qIYPYTZfocdVtMUo8NzGcPWhrhKL1gfGly+lBR
	EE7/fmAUlVZn41pGry+6YZu9Yu9U0JktnyfsV/IKiZgRC5+KeuQd4jcN3OIoalLKnq+I1PA==
X-Google-Smtp-Source: AGHT+IFCZmQvxgAXplrXyIIkWZNZdRoKac8B36FAtmzTprgUIMSkQz7UFb/RGY0oFoPv2TH62Ye4jg==
X-Received: by 2002:a17:907:6095:b0:ac7:358f:1b11 with SMTP id a640c23a62f3a-ac738a49b90mr357126166b.23.1743274900941;
        Sat, 29 Mar 2025 12:01:40 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac719621718sm375998066b.102.2025.03.29.12.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 12:01:38 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linus.walleij@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] pinctrl: meson: define the pull up/down resistor value as 60 kOhm
Date: Sat, 29 Mar 2025 20:01:32 +0100
Message-ID: <20250329190132.855196-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The public datasheets of the following Amlogic SoCs describe a typical
resistor value for the built-in pull up/down resistor:
- Meson8/8b/8m2: not documented
- GXBB (S905): 60 kOhm
- GXL (S905X): 60 kOhm
- GXM (S912): 60 kOhm
- G12B (S922X): 60 kOhm
- SM1 (S905D3): 60 kOhm

The public G12B and SM1 datasheets additionally state min and max
values:
- min value: 50 kOhm for both, pull-up and pull-down
- max value for the pull-up: 70 kOhm
- max value for the pull-down: 130 kOhm

Use 60 kOhm in the pinctrl-meson driver as well so it's shown in the
debugfs output. It may not be accurate for Meson8/8b/8m2 but in reality
60 kOhm is closer to the actual value than 1 Ohm.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 253a0cc57e39..e5a32a0532ee 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -487,7 +487,7 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 	case PIN_CONFIG_BIAS_PULL_UP:
 		if (meson_pinconf_get_pull(pc, pin) == param)
-			arg = 1;
+			arg = 60000;
 		else
 			return -EINVAL;
 		break;
-- 
2.49.0


