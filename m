Return-Path: <linux-gpio+bounces-9410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C96C96504C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 21:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEEBB1C20DE5
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 19:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768AE1BF7E9;
	Thu, 29 Aug 2024 19:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D69aHLPO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875311BF321;
	Thu, 29 Aug 2024 19:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960987; cv=none; b=CpOygcbsva2RCx4FjNIVpxbgK0M+wC5hQrIC7AYLeGNEJ2Ld6zulBlJWcoqILke6dcrv/1ffYgjtE4dypFzjvg6Qp9gNNHJ2d+HYZbiVsNiip6j+F9/3wGUxLqzm0DpdI2pLXt00RFfX/yeOT+vZFqRQP0yfBHkhQebIXdb0fAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960987; c=relaxed/simple;
	bh=J0UnOemnBbvaveK3ZttopA9SttRPBlILDCsdGrQX968=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dbLr9LUGnz7ZZr9yQ7COQd3elzwF59FYQwizSmuN4bKhHfeXBw881xZgm9lP4fPcij3lm2KzAmiC680jvhVCEKwSu4F1e2wKhKRf2eFZS0NXqrBAHl5GpUPTzKMBSzknvAlevQjKvJFkigk1JGIc+lgMGAejUu8FXOfwqQClft4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D69aHLPO; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c09fd20eddso1250438a12.3;
        Thu, 29 Aug 2024 12:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724960984; x=1725565784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVnhosqyRNvU3MIF8A1ZPy4QOABFmkjn6UV6v8PRcO4=;
        b=D69aHLPOS0hs91bN3uZH8oyhwkUPaAsehWk0fZHg/ApQaBstd6wfjAisaFdt5b7pSJ
         DibfL0AMUmL8OJCtiIquorvqXZI65dqGrKaSoVi0Qwo8tQOyJcQ/5xAjihpmETa04UBN
         l1/b+Wm3TxrIQml6h4l+FG3eD++4um4R4uT18OxOnBcrzNejG3tFVYC7YYf+5tubS5QI
         U8H9EouNClVK7Na+3KpD1fgWfKv3sylyehVurEVBfES5gHxlK7E1FYg8+exNnLV1crQo
         lfdbaBJLSFrXl62nv16wg2uNFJG/ejLCoM+keVXExmMIpqvOQA5/Nj12Qq8IHQXDqhza
         E4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724960984; x=1725565784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVnhosqyRNvU3MIF8A1ZPy4QOABFmkjn6UV6v8PRcO4=;
        b=u/lqakbJ+zVHmbkBPXmC8K4CjkFXuzWvqZzd5og7bt16fDcWIwu7z3H6gJM+X0UhyY
         /ccbeTO32NFtpbY6NcOXVarzcBgnk8ZJ3bOiuuFitXdDs9DLRyTZL9k8J5h+2tI5vxFy
         Z8GK6fVKveC68ac7U256gTTloBy6zZksLnPX8WSrEn+o/vmGlmXgUDkc11KGntnRlLdX
         kVIPwBqZBD0NfMz32iC1RUs5dAnZ1am9wvqRRLMAucFn8CNEd+TjGF1B93rrskM+7g55
         IfnjThobDnXhXyQIk2xHR7WDh2eRGQhjLjZ4hoO5YBU7EPTEwmumSzOyFT0qmRt+7swZ
         s+PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqT04CbqgLDM9Hlc/hQvkk+3t54E1EiSjieZq5Gw51hFv+295II4fPvSCrLixwo/WWR9wcQ+sLqunNb0uf@vger.kernel.org, AJvYcCXLjVwg00xm8/F7wfjiUOf9SWXMCOEO9+X8yua5RqmEVrZEy1jXg7Brg7UAbKEEm0TN0cZX2cnR7gL5@vger.kernel.org
X-Gm-Message-State: AOJu0YzsOFzVmoWrpLVyIN6PmYliMnrRIT8xlP6GjKo5p2uJifCw5Mgh
	AX1ayOg52uK5VaEmqzHH7mFOdmZg0SO48GbXU6kLDzV3zxexUQKK
X-Google-Smtp-Source: AGHT+IEAP4k+FcXVyClcLWaZz//5KWt0Xhe6oSesLEDzJPKUcfJLL3TrLdErKEK2cIk4A8/yT20nUw==
X-Received: by 2002:a50:c8cc:0:b0:5be:fc1d:fd38 with SMTP id 4fb4d7f45d1cf-5c21ed9fe6amr2957909a12.36.1724960983445;
        Thu, 29 Aug 2024 12:49:43 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:a26f:c074:4086:5001])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c6a327sm1027891a12.4.2024.08.29.12.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 12:49:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] pinctrl: renesas: rzg2l: Move pinconf_to_config_argument() call outside of switch cases
Date: Thu, 29 Aug 2024 20:48:40 +0100
Message-Id: <20240829194841.84398-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829194841.84398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240829194841.84398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the `rzg2l_pinctrl_pinconf_set()` function by moving the call to
`arg = pinconf_to_config_argument(_configs[i])` to the beginning of the
loop. Previously, this call was redundantly made in most cases within the
switch statement.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Updated commit description
- Replaced `pinconf_to_config_argument(_configs[i])` with arg in
  PIN_CONFIG_POWER_SOURCE and PIN_CONFIG_DRIVE_STRENGTH_UA switch
  cases
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 8fc1f28d02d1..cf0dadc18202 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1384,9 +1384,9 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(_configs[i]);
+		arg = pinconf_to_config_argument(_configs[i]);
 		switch (param) {
 		case PIN_CONFIG_INPUT_ENABLE:
-			arg = pinconf_to_config_argument(_configs[i]);
 
 			if (!(cfg & PIN_CFG_IEN))
 				return -EINVAL;
@@ -1395,7 +1395,6 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			break;
 
 		case PIN_CONFIG_OUTPUT_ENABLE:
-			arg = pinconf_to_config_argument(_configs[i]);
 			if (!(cfg & PIN_CFG_OEN))
 				return -EINVAL;
 			if (!pctrl->data->oen_write)
@@ -1406,12 +1405,10 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			break;
 
 		case PIN_CONFIG_POWER_SOURCE:
-			settings.power_source = pinconf_to_config_argument(_configs[i]);
+			settings.power_source = arg;
 			break;
 
 		case PIN_CONFIG_SLEW_RATE:
-			arg = pinconf_to_config_argument(_configs[i]);
-
 			if (!(cfg & PIN_CFG_SR) || arg > 1)
 				return -EINVAL;
 
@@ -1432,8 +1429,6 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			break;
 
 		case PIN_CONFIG_DRIVE_STRENGTH:
-			arg = pinconf_to_config_argument(_configs[i]);
-
 			if (!(cfg & PIN_CFG_IOLH_A) || hwcfg->drive_strength_ua)
 				return -EINVAL;
 
@@ -1453,12 +1448,10 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			    !hwcfg->drive_strength_ua)
 				return -EINVAL;
 
-			settings.drive_strength_ua = pinconf_to_config_argument(_configs[i]);
+			settings.drive_strength_ua = arg;
 			break;
 
 		case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS:
-			arg = pinconf_to_config_argument(_configs[i]);
-
 			if (!(cfg & PIN_CFG_IOLH_B) || !hwcfg->iolh_groupb_oi[0])
 				return -EINVAL;
 
@@ -1476,7 +1469,6 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			if (!(cfg & PIN_CFG_IOLH_RZV2H))
 				return -EINVAL;
 
-			arg = pinconf_to_config_argument(_configs[i]);
 			if (arg > 3)
 				return -EINVAL;
 			rzg2l_rmw_pin_config(pctrl, IOLH(off), bit, IOLH_MASK, arg);
-- 
2.34.1


