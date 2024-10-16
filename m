Return-Path: <linux-gpio+bounces-11446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 873599A0BCC
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 15:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C02B2856E5
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 13:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E2F20ADDE;
	Wed, 16 Oct 2024 13:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="VefHAbya"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776771D8E1D
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729086231; cv=none; b=k2vfjKFD3dD2KJwwP9iApqSSGkJcDIO0Duvh91p0kFUTXAEsEPXToVZLdSzaJWi6DvXFl+Q2n47yf8mcM5CqYzGaRq9h4UGpRmkbb1duVTdVNr1FIoci4qaXv9wS27Qfck8gNRBKMjNBwVvHcb9OMIBQ9bQbt5HUIVR30njadIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729086231; c=relaxed/simple;
	bh=KWcWN0Jm2eUdhtHlZSZFOhv8Zx+tr8YDUBPTLQTMBgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c77lEagMXSYFGuCGBovJTG7pqRFQ9orGjdD8nocfezDHHBb0YypYcoE2KEBHxzMRmdY4wqoND0E9ZE28B/6Dfv3Z/tVCl8tNwny3WKuq2mf9Kv2wPpxQ16+91GklZS5ru9u451U8QScEdVnncUuwZqyiEMN+8/lMmMb1f+6EsC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=VefHAbya; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso2636633b3a.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 06:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729086228; x=1729691028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hPSkU20Itc6yAh+bZBbT2R0RT9oB/wml9mSdgooTOww=;
        b=VefHAbyajJ+EibY++LZu5yyNn8ulR6BdY4Xor9w+0ufoTXHxwawvH65ukuEch2Gmgs
         D4giuT05u9kSpUZ9VzhhX5V0nNeKJlYoU7YwZ0KMgYPYb34NR/LcuYtvESYJykH2cqDh
         yWu0zAMjnSJJsSO1+v8Ejr7/XR73n09RrvRyXPYTWx+DMA8/ischIZlALM3fMo6wTi07
         kmJlIPaOhBZLq5G5a47+tk8TQFm7/H9I0BunCss/tJR+1SRHEy3jxITB2d+UJBTlMnjR
         RULfdPFnO36GW0u7qDhNWewOC8akmqPiEt33zkobuFE7bmA0++KXjO4A0GmhgOdZOsAe
         QMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729086228; x=1729691028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPSkU20Itc6yAh+bZBbT2R0RT9oB/wml9mSdgooTOww=;
        b=Eb9a6GCsqybo32sjlqy1bEQH7IUrCmdrg+7A8hwhizGnIOgS2jNP/kZIlmuoaaB6ul
         GjDmV3uEm2b48tclRcRbqtWNWcq3Tl4VgNyR9V1l8AhL0KvmPUhNmE/9fl/avf8hk+La
         5nnIlSfTvO8vU7bo0g0zQVAwNYvsETPxZoecyvup4tsnu5T0g1LJvn+rh3TCdy5XdOhv
         kOqzSz7vv8a1oA2pgqKDcEc1EmT/+dy8gWrjxPbgLO4FgvcXXy9XOhjfYixi0wFoHj22
         oKD7QbkpAqjfwUDElZNFRCacCSbPPTriFwkZWR5BZGJO104dSgUXSNFn74UwDlnahTyr
         jr6A==
X-Forwarded-Encrypted: i=1; AJvYcCWehuYm4/CTDjsri12rG1J6WLrLJXcvUcbqJTKxE4VzfN4XpxB0fTmz08vhfQAeFUUOO/6EmLeXsDiJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwB/9qBlFkFP2Nw0FTFZo3CVK94x0KMgvdkeww68Y3Vfb4D95GX
	LL+1m4R0J2yHUd90hUsG4zQQ/cn2T89qdanPsyaE4U8XqeILJlAiJj8tT1k1F8oRdiP3u8/cNDR
	8YLkAAM9m
X-Google-Smtp-Source: AGHT+IE1Q+vPA30KNlMFxGEt9h2r7Mf4JtaF8VKYh5yzDNUyMZMQT+8Yyx33/wO8c5gt6uUjOIGAxw==
X-Received: by 2002:a05:6a20:d49b:b0:1d7:cc6:53d0 with SMTP id adf61e73a8af0-1d8c9576f83mr22762980637.5.1729086227779;
        Wed, 16 Oct 2024 06:43:47 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.27])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20d17f84e9bsm28977495ad.19.2024.10.16.06.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 06:43:47 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: drew@pdp7.com,
	guoren@kernel.org,
	wefu@redhat.com,
	linus.walleij@linaro.org
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] pinctrl: th1520: Dereference pointer only after NULL check
Date: Wed, 16 Oct 2024 07:42:21 -0600
Message-ID: <20241016134223.4079-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pointer `func` is dereferenced before NULL check.
Move the dereference after the NULL check.

This issue was reported by Coverity Scan.
Report:
CID 1600802: (#1 of 1): Dereference before null check
(REVERSE_INULL)
check_after_deref: Null-checking func suggests that it
may be null, but it has already been dereferenced on all
paths leading to the check.

Fixes: 1fc30cd92770 ("pinctrl: th1520: Factor out casts")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/pinctrl/pinctrl-th1520.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 7474d8da32f9..07f8b51fb294 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -803,11 +803,13 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
 {
 	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
 	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
-	enum th1520_muxtype muxtype = (uintptr_t)func->data;
+	enum th1520_muxtype muxtype;
 
 	if (!func)
 		return -EINVAL;
 
+	muxtype = (uintptr_t)func->data;
+
 	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
 				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
 				 muxtype);
-- 
2.43.0


