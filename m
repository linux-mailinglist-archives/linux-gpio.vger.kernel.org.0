Return-Path: <linux-gpio+bounces-19715-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D43D6AAD01E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 23:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7613A7A85FD
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 21:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A3523A9BE;
	Tue,  6 May 2025 21:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmRS9fKf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146DD221291;
	Tue,  6 May 2025 21:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746567491; cv=none; b=seckCI5/Sy8z0HWDHDrDD1vs1B49ku5vLJ9VnAiFs9ju6h5hX8JdvhfUQmTbc5WnhTKHOCP0isoMyv01PXDXt+aMbAoOCLtqLF0hRc5Oc2p8eCKeZ3f7yK2gR7x3Odd+/1ILekM1rNZjedwqCg/PgdaPV/rspDevvrd5xdvmlHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746567491; c=relaxed/simple;
	bh=fpWKRGLUlfFcKgRhzd3YKEA/2o+6Sj2FNknpu5FvDG8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=szcABtSvVFakXHWgfr/OfOqXl2KfUL2tIy2FLhhHtV02PpOrd7J3cWE/Z4M1+bmsT1LqS75Jkbi/UgANRGiIAPYjhlLJr8e7dIaDPsMftBG29ydv2QHT5wlJ3nyW0BViKTbj5Hkhf+FaY/9YTEyAm4n+4AjmtvsGPzQc6gHRO2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmRS9fKf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDEBC4CEE4;
	Tue,  6 May 2025 21:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567490;
	bh=fpWKRGLUlfFcKgRhzd3YKEA/2o+6Sj2FNknpu5FvDG8=;
	h=From:To:Cc:Subject:Date:From;
	b=tmRS9fKfYfOenJvpT2PZ76HrYRxLYoWbPRpc7Ga8BsLnjlO9uI26Wy/7E9RC2cgBp
	 83Q8snZUHalNsE0OBgsj/7hrYs6ElY9raQPRuE5JmIhv4PFp77/6H4SiM7LAhan0aO
	 jbD+NPxJWwXM3lwtnECqMggfA7pQX6t3fNYOYw1jY9skbkjSqLo9EZvXCRlYoiDsY4
	 IaRdPdIaibTwwDrsU7EtPjbwpgn4wtYgvy8UFaNycHqXdS9wRa4gHRLe3wt3NWmbGN
	 4WtdIZrnTdAWIHaiti8udr86MiyAg6akXXb2CKMNkoneJ0bBBYfPTQlhNu3/3TC+Ji
	 F+Sfc0DhafEKA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	khilman@baylibre.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 1/3] pinctrl: meson: define the pull up/down resistor value as 60 kOhm
Date: Tue,  6 May 2025 17:38:03 -0400
Message-Id: <20250506213805.2983809-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.293
Content-Transfer-Encoding: 8bit

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[ Upstream commit e56088a13708757da68ad035269d69b93ac8c389 ]

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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://lore.kernel.org/20250329190132.855196-1-martin.blumenstingl@googlemail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index aba479a1150c8..f3b381370e5ed 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -480,7 +480,7 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 	case PIN_CONFIG_BIAS_PULL_UP:
 		if (meson_pinconf_get_pull(pc, pin) == param)
-			arg = 1;
+			arg = 60000;
 		else
 			return -EINVAL;
 		break;
-- 
2.39.5


