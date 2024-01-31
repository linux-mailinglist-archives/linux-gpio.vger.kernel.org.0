Return-Path: <linux-gpio+bounces-2772-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FB5843793
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 08:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 680E81C2388B
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 07:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262B455C2D;
	Wed, 31 Jan 2024 07:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bsCc94Te"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EFE50A7C
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 07:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706685563; cv=none; b=AHZ911Qoc0plFrowOKVgLD1BvqRd+l+DOfT1O/wEk6WT5UHDOTAg1v8ssgjK64Ev2mufmidiO87r2Mv+y+iK4V++f2zsKGaV0cxfJnP8cMHDgbRypOeVSAcK711dXXDyxkMfSGAihD+kXZPQ/4uQ83YIHUdSfrIa6/1N1mi1uKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706685563; c=relaxed/simple;
	bh=h+sbUvzLd5vauTOG2RK3lZsXuEn4bWQfU9c+cnW0H2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=buF7kSRRBHxwSY6YBQdnl073Stb3k2w7HohcZBtogGR7DMStDYJKszSp1x1vjJr7icVyHXXcq5XohcaAnJ3OFC77hbz+cHZPlU9x5TAuuLagON5QQGdL0Hxnyp4ibGU7zO/CS6lPSQvN24GwYLDK2J27drksYcR4kw/Ek4P/kTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bsCc94Te; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6e125818649so1967048a34.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 23:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706685560; x=1707290360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzwxVq7iqVCMh+o8QAYUgN6xht/KSR0a8sgxs8d65a8=;
        b=bsCc94TeRiuFbGlnxH/9j96/iFd+O2DY1tH3eXPlR9YVm5CBi7DBUbzBDKAjEWiZ+a
         cJw+YhpEfuy05pzW6bRngLs/KyX4gJNVlawY7ByK03d7LTBJ7RxoghQGQ4nkc8nbYqWj
         CaHN4mSTM2/5bEowz+nauwYqvX1Pg4ABRkRFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706685560; x=1707290360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzwxVq7iqVCMh+o8QAYUgN6xht/KSR0a8sgxs8d65a8=;
        b=EpMGhpOsUPdNjRF19ZmyNS/21j0fGwU3+Ugk8Kh/pUYSK4871zitVhC3JUl92ZlUNr
         khT4t3jFkFrbhE3MdDAcuSGIRsyv1bQKs3biACjO+UICvD65m31RmHmReA/0rbpCCz6Z
         WPEkyrKfkmHWZ+c7+hcRSRyIQggs/IuRNKLsJE5WXYzfskjBvy5BQ6nuISPGeB6B9gF1
         1yUC/ugn6VV/GWaPvSCi8Vo4NdP45Jq8UPWom8X4mcRd5q+RGEyq8+BGE4U4LfkR+38x
         KwdK+z86j+H+vuXlqzaPy3kaJKFDgVmvs4TEGX6vzB4N4CdKDt+MxUe9y27U49buTRNl
         8WTQ==
X-Gm-Message-State: AOJu0YyAgpJTPGu/AYaF+tPGlELfirTlzeRVknWOiUS0BE7JTcjBrMWH
	7kp0mBs15m7GNzAaBsVHMWfrq2bCBs9hffNmTjtk7ZyzExoVzR7MWaMcOsWGUg==
X-Google-Smtp-Source: AGHT+IHyEAJqaU+GNR8/XcG12RxxRrhWVX6OBK3RUeMhyMagSltWFxHBzffkIDrSozAjGcSeVL8BoA==
X-Received: by 2002:a05:6808:2e93:b0:3be:aafd:ce2 with SMTP id gt19-20020a0568082e9300b003beaafd0ce2mr1450707oib.2.1706685560063;
        Tue, 30 Jan 2024 23:19:20 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:74d3:dadd:270b:194a])
        by smtp.gmail.com with ESMTPSA id y9-20020aa79e09000000b006ddc7af02c1sm9049919pfq.9.2024.01.30.23.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:19:18 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: mediatek: Drop bogus slew rate register range for MT8192
Date: Wed, 31 Jan 2024 15:19:08 +0800
Message-ID: <20240131071910.3950450-2-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240131071910.3950450-1-wenst@chromium.org>
References: <20240131071910.3950450-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT8192 does not support configuring pin slew rate. This is evident
from both the datasheet, and the fact that the driver points the slew
rate register range at the GPIO direction register range.

Drop the bogus setting.

Fixes: d32f38f2a8fc ("pinctrl: mediatek: Add pinctrl driver for mt8192")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt8192.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8192.c b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
index e3a76381f7f4..3f8a9dbcb704 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8192.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
@@ -1379,7 +1379,6 @@ static const struct mtk_pin_reg_calc mt8192_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8192_pin_dir_range),
 	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt8192_pin_di_range),
 	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt8192_pin_do_range),
-	[PINCTRL_PIN_REG_SR] = MTK_RANGE(mt8192_pin_dir_range),
 	[PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt8192_pin_smt_range),
 	[PINCTRL_PIN_REG_IES] = MTK_RANGE(mt8192_pin_ies_range),
 	[PINCTRL_PIN_REG_PU] = MTK_RANGE(mt8192_pin_pu_range),
-- 
2.43.0.429.g432eaa2c6b-goog


