Return-Path: <linux-gpio+bounces-22650-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F102AF5DB1
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 17:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CED51C237D0
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E489A2EA491;
	Wed,  2 Jul 2025 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cx82pC1A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70992DCF74
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 15:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471799; cv=none; b=Dn7QH1iOXgnFewqNX21r3ZtkBFArq6wK0quH+6iLW8PsRzXxpuZ71zNe6bXgS0nCaEXo3Bm2X/Q501BAILU/pQuiIArNiHDshJdruph/x+aM1VNrcZnBC9qRF9vQHeyA8+4+o9H4K7eqfDzhojJvjP1CEzxxZhgqYNHpebuX+IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471799; c=relaxed/simple;
	bh=Gg3Ztw5mbV6LN/f/Ji5k38/KgNR5/X94oaYADowlyfY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZJe16vmuhkpBA4jHr5AybEmgYZ7ODpeTNpMtmGQkP8RYqLyYkAx3NTKjNIsbLVZMEmA9Gsa1Vr8YlNi1FoyxkqKv+cs1qRQvrSUs3mWPorZjF2KzlcBW59Opi6gBn9GQsPsMjw77gdxFaIRkx1rLbBG2VV3arqYmRn/XIU1V82s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cx82pC1A; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso8110385a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 08:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751471796; x=1752076596; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dCAc2KTVC/KYVThbWt25dTqshZNAwmGCU6+3oetHyms=;
        b=cx82pC1AG+m5QUG1yiU/TGP+060ba7XsfTWmAlc9psG9McdkjaoECKhDm+DjU4KfWz
         Zh/bZi8Jzv4gj0+eHKJv0XyiIo3gMaD4FVzVjarKi4w641RlBor/Lrg/W1gkLEKEWXUx
         BM/xj2S8iQBYB7xZeLtqdNDDkvIWVCo1mYaoCSshGpnCx8piJYYWPmNrEa8AFu4vYc+Q
         w4KO0BTKT8V/VhCvAuYI3Mv1+OecEVSbGMHRqwNzn9e+5njwiu11gSxdDVyBv/92AIdU
         OPc3lfGRIXldsT2OZAjjfNEvuLjp0Zz/NJPW7EmoFfFPyHJGKJOlV96nxZ61y8jQmbnp
         N59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751471796; x=1752076596;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCAc2KTVC/KYVThbWt25dTqshZNAwmGCU6+3oetHyms=;
        b=rkgr+luWoTk34QGJUMNIDdHm9+MlnJF/rTGVVTN0xWAvm6TDe/oDyUlgKchAnh1qlQ
         C+iu0JCXBM7aYqOq74DFTtKe+hDf2dLjBROVcQ089fmMTfyoC5QjsHNwq8c4MrJH9Y6/
         JLrDe45jUlrequjlKnzs9PWCdt7IRbwZg0WfbEqnn/MnHEfv7FKI0TFlUrhFhQDpOdZv
         L9Fqfw0L5Mpcvu/qZYA0xD3LPH4DG56+4fMjrTXYNJwip4tYzyABYxp0xeufinutRQEh
         LoKegUt1pu8REPjASGLmNdb7y1RxR6iORdOJOIsLVsNsSEzkdS/e0nqmAMLjXitMiE+y
         NTyg==
X-Forwarded-Encrypted: i=1; AJvYcCW2sikVF+emKpGtikFerYBFpXrcDFwHAunR5Ynb30ddxdMLRdCFxNzs23m6peNxND0tIjfqJn/nanKa@vger.kernel.org
X-Gm-Message-State: AOJu0Ywefpa/SCQJDAV790C9Ae9jiJdrEGemvQB9vnyKqWeZuVPaD7hu
	dlCcJSR1VlzVUADcaTFT2KQyAP30aYUx8cqqAMc8KYpwiHTGoOOtfD3V+7y/aFW6Nfg=
X-Gm-Gg: ASbGncvIV8xYlIDwzAbZjMYbMsPcjBjHZNR8ikhitLiYJEDgJFl4pbrXGtip4I32IWH
	nuQ9ibmeRmFW0gcHw93xUrVUJIZ4xo9MqXfbCJ+CVt77GZply7oNzk6bXgFGFzMU7r0VWveeo1U
	+4hstvBYk+yrXFloqrSrgCyyLuOZREqjVOh2Brt2lVIrpR1etTWZB2AkhA2ETTTR/a2nP1OHm9b
	M3Ht/YcuZzFHrQTjOZXbTyM54otHq5i8/pRduMrqrrxzvD+UmLSFac8dIRKp0XGmBe4SxAOknHt
	JFLQtX4BD0//Vs1WEoCuajBc/ZPjvd3KD66TW6bq4QmqPKCgWwl/J1EUORhqLDrHumeDjbtSJfr
	HD4IhScSWH5OYLA+WDphm+Jm1kckEm4prw3BzVhcURWQNQdj0oNvLgs7GrUtgAMRPqo+NsBPEH9
	0glZvkgAg=
X-Google-Smtp-Source: AGHT+IHXrZ5By/YIGmoOwxks5XDcOiTKWLCdtObMvsXO7AjbA2fZCsAU3x165zE/3s/lKEpePIpfqQ==
X-Received: by 2002:aa7:d0cf:0:b0:5f3:857f:2b38 with SMTP id 4fb4d7f45d1cf-60e52d021b7mr2841293a12.17.1751471796023;
        Wed, 02 Jul 2025 08:56:36 -0700 (PDT)
Received: from otso.local (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c82909b93sm9151109a12.29.2025.07.02.08.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:56:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Add pinctrl driver for Milos (SM7635)
Date: Wed, 02 Jul 2025 17:56:15 +0200
Message-Id: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ9WZWgC/13MQQ6DIBCF4auYWZcGUah01Xs0LhSHOkkFAsa0M
 dy91KSbLv+XvG+HhJEwwbXaIeJGibwrIU4VmHlwD2Q0lQbBheRKcJaWi2okC+TMGp9MW2ymTum
 mVSOUU4ho6XWA9770TGn18X34W/1df5T8p7aacYajHTR2nZK6vdmBYpi9w7PxC/Q55w8FF3fas
 AAAAA==
X-Change-ID: 20250620-sm7635-pinctrl-9fe3d869346b
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751471795; l=979;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Gg3Ztw5mbV6LN/f/Ji5k38/KgNR5/X94oaYADowlyfY=;
 b=QBFfi9v+fdzcREV4KRyqPt7V0s/Wzvd6gSLuSqnD6tQpuUCQcoANwHrXEuD7fsiaHVXr8OTSZ
 rqtj7W1yVuMCAPYLDcEv+iu1wcbPQi/Ll9GhXRJ0eKtc0B1meLKGwzG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document and add the pinctrl driver for the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-pinctrl-v1-0-ebfa9e886594@fairphone.com

---
Luca Weiss (2):
      dt-bindings: pinctrl: document the Milos Top Level Mode Multiplexer
      pinctrl: qcom: Add Milos pinctrl driver

 .../bindings/pinctrl/qcom,milos-tlmm.yaml          |  133 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-milos.c               | 1340 ++++++++++++++++++++
 4 files changed, 1482 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-pinctrl-9fe3d869346b

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


