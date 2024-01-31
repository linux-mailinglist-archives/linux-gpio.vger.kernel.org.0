Return-Path: <linux-gpio+bounces-2771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0845843790
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 08:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B476282012
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 07:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86B74E1C4;
	Wed, 31 Jan 2024 07:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f1ylBp3o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A8750A7C
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 07:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706685559; cv=none; b=GTaXP1rJpdLM522SeUhdC+Sf1UXGCZrL6v4gugrdJQTWQENQx0w189ggyZKOtVPHx9xag33RpoQVe2R8hKUofRH6qIoOryxT/WR22ix0heMx6olCrGyMVsjU6dsod6Y+LtcncOws5aNB6TC43otoLMK7JxnldZPokwIrz+TrHes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706685559; c=relaxed/simple;
	bh=UheKOyu4PxdtXP+p7L8FVFpklQZUHf5uiW8TCuBmqB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pVZViV3oQZgoqpdoEaO9dzZGUIeCdypcLol5/uu9wnIbhs+RHsXUwjouUrcMdb/XR/4h5K30WpcxBVY3gOTcC1YyXbf0Ptd95BXjx2SNY2M+Lo/ToiuSMbX+yDM3fxGUUcRiko70j9W0s3ZKeB6JGHpf63dgF/lTkZMCRL1IIqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f1ylBp3o; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6e125818649so1967025a34.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 23:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706685556; x=1707290356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2wqRnRIGXiLCSvzJZLYjMcTKthyhOO5v4D4vqmcQVvU=;
        b=f1ylBp3o/u0oX3yfMO19zsJm/IUuvdyBkDH8dy+dSFoqpLSqU29IoUI/5qA9AK+mS0
         hYYRmyIZtpa1y9ECIJdyO0IpcPt+hXPv34zkJ0hfpQ3A4SLHwceO4D03czLRZUuG24JD
         0QurlsaeKGKe7X7Z40CfOu2LLbPFsjgI6LLdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706685556; x=1707290356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wqRnRIGXiLCSvzJZLYjMcTKthyhOO5v4D4vqmcQVvU=;
        b=bBZZv2FVU/UEtGR/Cw0MM6WDjMLuFwZCBvHmrl6A0rsjZ25sZskwRn7HcnsfwyDtDD
         n5HErhBO0d6bPuRIY0JI1y/Q0COeoUENPPryWkmWXvehCdNybvkZ3x14TQWtOqv2SPK/
         z4dkK/n6gVBXJCTGllt0TiDWb+iV1uC10/mXNc4peM8lGCV5x+ergGLcYw+uvTwptqcg
         KtNu7IbrZ/7TLiURCA7La6QboG2Xh4TdxRXoHGyYjCb8BUVUf1/5xUt0TV4XOZKuj4Bn
         KWujr9c4+mOIJWlAm4gP7/T9xTQtbIrpEEL5Wd8UtVOuTEFz2Df/RxRTOgujbro4ve8H
         cYLA==
X-Gm-Message-State: AOJu0YzwGbGELxY6Qx8ba0Hp740/Zr4CXhketmH//vtSc5VPfsnx87JZ
	lOUfh6FDR8p/0mBmrrqSkgsAN9Sp7AxBSIKfcpoclUCdwcPnjDdL1yy4jcHsd0RNwIG9pJXrEbA
	=
X-Google-Smtp-Source: AGHT+IF6hDfOWd8Jvsh/0B4DrXgvbzPeIc9dpxLSCGCQ44hmQpNs836JCIa0j3ZmA5ktz5abA8uT2Q==
X-Received: by 2002:a05:6358:7245:b0:178:63a0:b795 with SMTP id i5-20020a056358724500b0017863a0b795mr686144rwa.29.1706685556269;
        Tue, 30 Jan 2024 23:19:16 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:74d3:dadd:270b:194a])
        by smtp.gmail.com with ESMTPSA id y9-20020aa79e09000000b006ddc7af02c1sm9049919pfq.9.2024.01.30.23.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:19:14 -0800 (PST)
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
Subject: [PATCH 1/2] pinctrl: mediatek: Drop bogus slew rate register range for MT8186
Date: Wed, 31 Jan 2024 15:19:07 +0800
Message-ID: <20240131071910.3950450-1-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT8186 does not support configuring pin slew rate. This is evident
from both the datasheet, and the fact that the driver points the slew
rate register range at the GPIO direction register range.

Drop the bogus setting.

Fixes: 8b483bda1e46 ("pinctrl: add pinctrl driver on mt8186")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt8186.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8186.c b/drivers/pinctrl/mediatek/pinctrl-mt8186.c
index 7be591591cce..dd19e74856a9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8186.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8186.c
@@ -1198,7 +1198,6 @@ static const struct mtk_pin_reg_calc mt8186_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8186_pin_dir_range),
 	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt8186_pin_di_range),
 	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt8186_pin_do_range),
-	[PINCTRL_PIN_REG_SR] = MTK_RANGE(mt8186_pin_dir_range),
 	[PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt8186_pin_smt_range),
 	[PINCTRL_PIN_REG_IES] = MTK_RANGE(mt8186_pin_ies_range),
 	[PINCTRL_PIN_REG_PU] = MTK_RANGE(mt8186_pin_pu_range),
-- 
2.43.0.429.g432eaa2c6b-goog


