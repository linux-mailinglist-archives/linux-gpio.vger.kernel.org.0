Return-Path: <linux-gpio+bounces-24793-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73982B3174F
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 14:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58CDF16F1C8
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 12:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26D62E336F;
	Fri, 22 Aug 2025 12:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpjOwmDG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9013D199BC
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 12:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864873; cv=none; b=Wjyh5gG9k4cTnTM0Vv+lSzIaRgdx2fKfX4AzjxtO6Fhb4Sk1kr13ifIXvjjwR2bDee9lGMYDUeGv2u9bVEX8Iq5pp8K0AV+xQ8YobDATqr9yqI5mCew1Q5C+p/d37bT0RwVyzjoHgC2lmNQ51cQmqrA9p+5/VQZgvHAkBxErKG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864873; c=relaxed/simple;
	bh=Ha0X5JrI+INUGhOxL0Mkekxtn+SdZocQ6T0kCcGVwaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YqiCPQiLIGt3xM70yWRDXa2xvL4BfopfDu/xSUBYlTMydK3eUpxJl9+Bvj0OQ9TxzcaOxUJZAcqkaP9/lB13jsuQ2c3M7vGJAX5xcsBQuV8nYEcId/4mO9VS3FXD8c2bS2j9LUHGXrSfxgysTrBn4So4YK5Cq7mpp5qG7SzdTPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpjOwmDG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE97C116B1;
	Fri, 22 Aug 2025 12:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755864873;
	bh=Ha0X5JrI+INUGhOxL0Mkekxtn+SdZocQ6T0kCcGVwaE=;
	h=From:Date:Subject:To:Cc:From;
	b=lpjOwmDGkhdxh7T2QrHk8h/Ifwv/94PsOCsCJIbaPAs5xuMJv0vIgjy8eAGQEbdjO
	 0CZefA3+jzBWGGPgKtTXcRP71BkKKtrrTTZPmeiFfjJKM4plOEZQxg1duCbvD0xCTw
	 wsUU/nG6oSJjUYWiZiJCtTn1TXPte7Rd5CNKcDh94DvzOLGf76bE4ujuSxwfobKqeb
	 uOEflFmCaJrVfgjaTIHTNaUDZRezaZJjPAU6iL9otddIs1Dweyac+urCETdgo0QiDE
	 EFfmDCgzwcCEsgITu5Q/UwjYYUy6NXzw36AvnZi+hHJUJRC5gZbjqNdI6/S56//CLt
	 xtJgPpGyHEdDg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 22 Aug 2025 14:14:18 +0200
Subject: [PATCH] pinctrl: airoha: Fix return value in pinconf callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-airoha-pinconf-err-val-fix-v1-1-87b4f264ced2@kernel.org>
X-B4-Tracking: v=1; b=H4sIABlfqGgC/x3MQQqAIBBA0avErBsopZSuEi3ExhoIlREiCO+et
 Hx/8V8oJEwFlu4FoZsLp9gw9h3408WDkPdmUIOaBqsUOpZ0OswcfYoBSQRvd2HgB7UNMxk7aes
 NtEEWavmfr1utHyGI9/lsAAAA
X-Change-ID: 20250822-airoha-pinconf-err-val-fix-38f6e78538c7
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2

Pinctrl stack requires ENOTSUPP error code if the parameter is not
supported by the pinctrl driver. Fix the returned error code in pinconf
callbacks if the operation is not supported.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 5f1ec9e0de213d587b68f41d3458cf504ee1b21f..1b2f132d76f0aff78768ed846e8d5980e5b46770 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2696,7 +2696,7 @@ static int airoha_pinconf_get(struct pinctrl_dev *pctrl_dev,
 		arg = 1;
 		break;
 	default:
-		return -EOPNOTSUPP;
+		return -ENOTSUPP;
 	}
 
 	*config = pinconf_to_config_packed(param, arg);
@@ -2788,7 +2788,7 @@ static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
 			break;
 		}
 		default:
-			return -EOPNOTSUPP;
+			return -ENOTSUPP;
 		}
 	}
 
@@ -2805,10 +2805,10 @@ static int airoha_pinconf_group_get(struct pinctrl_dev *pctrl_dev,
 		if (airoha_pinconf_get(pctrl_dev,
 				       airoha_pinctrl_groups[group].pins[i],
 				       config))
-			return -EOPNOTSUPP;
+			return -ENOTSUPP;
 
 		if (i && cur_config != *config)
-			return -EOPNOTSUPP;
+			return -ENOTSUPP;
 
 		cur_config = *config;
 	}

---
base-commit: 0ae621d78880a406f164a719150dfc66a69b7148
change-id: 20250822-airoha-pinconf-err-val-fix-38f6e78538c7

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


