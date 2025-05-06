Return-Path: <linux-gpio+bounces-19714-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82362AAD039
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 23:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87DC898585E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 21:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1763323908B;
	Tue,  6 May 2025 21:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nohQ9kaC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C349F221268;
	Tue,  6 May 2025 21:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746567476; cv=none; b=tuBeaZSc+TuM0VyNRfwEnIlU3DQ6R/APV/RJyj3vj133Gz693Vq1uuiFEds3aSw7PJhs6jA2qpU3qzEFGkOuaOBtiUfNy0lbRHTGUw0DskAyF5cLT4/aV+Jx5aqYiEMYHn21O3+5UYgkBN8HrqxhG5fwJiiE1m9jSlV0MDDtt/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746567476; c=relaxed/simple;
	bh=W25DsCYn8R/oNpmSFXNWiLK0Xa3cc6Ewn8T+bcqzubk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VUU6xz7+NiBZk7LGCYifTNMpamhA66IpJifsp4ojNoZdU2MoysH+a1PEN2xHXLm/soISlBEFAkc1xDU006wNSPTNDzBTRorNO9B7ohUm53N8Qz7upluzXAETPvg83Qq4klI2BcPxGRYURwoNGmNnJoYHxo9D1dNFntE5TBuLi0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nohQ9kaC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B4EC4CEE4;
	Tue,  6 May 2025 21:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567476;
	bh=W25DsCYn8R/oNpmSFXNWiLK0Xa3cc6Ewn8T+bcqzubk=;
	h=From:To:Cc:Subject:Date:From;
	b=nohQ9kaCoSfc/cJwb3qRgWS6g5aWBi7lWCK7wmSxPCw6Lwqenx5I07tPIHZwQi3u6
	 0sXW8vnVqazFSnU9ne6oOay0cEBQ84vTg/V8bQf1LtNlR/Ls4m42CeZriaG4VhsWmp
	 AXmtYd2XswFMpi5tZJGqw5CnWU/+ba1RPIwv0K7qCtkFbfPPw3E40/d1fAdQrQJzpT
	 k8MLhTD8suvtkFamF4fBWFTDDRZMDhhPE3XGPHoZV4lx6Jxu0airf3Wm0Z7Ok6/TE8
	 hb6FSgeNqY4H/8iJqhJnRgcSssN3npUkeXUdbJRkq7PiW/+14f9vgrd4vZRBbKB0pP
	 3jz4dhyK76k/Q==
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
Subject: [PATCH AUTOSEL 5.10 1/4] pinctrl: meson: define the pull up/down resistor value as 60 kOhm
Date: Tue,  6 May 2025 17:37:48 -0400
Message-Id: <20250506213751.2983742-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
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
index 20683cd072bb0..ae72edba8a1f0 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -483,7 +483,7 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
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


