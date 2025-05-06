Return-Path: <linux-gpio+bounces-19712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED817AAD014
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 23:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 276DF986C94
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 21:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EA023315A;
	Tue,  6 May 2025 21:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2AbNYMS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BFB233127;
	Tue,  6 May 2025 21:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746567441; cv=none; b=epEG9yftpKFgePFsK4of1o5wNcWQRx3Us/QvU2OJyDepBw11+M+egmnzFSUMjGjEQdA2e/BAZXqeDTzXJcbZtDv0uGrpvFaPJx03/+DWI8wqb/5es3H4U9SaVWBm9lUUnVqgr7eE4/N2sFu2p6bnPh77Wa/dio7AtOcO0WXt4Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746567441; c=relaxed/simple;
	bh=/6dotfspmfvLZQl7LisUvq7pisMsJv9hVeR4uJ/vVSA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lEk5GvSKSaSamgeWpHWGIBuKi+TPSGO0KzgFwchG2DpVq77qZ6PP3YZiLGkRTvdBLquBB9XuZkQyRW8Ooe4V75PsbO74OM9jmSOfwXTxuPyklyUS+t1T/xlJFKhxoqQxJVh7//VpshCFO5bCsKwQ2wYZJxAmspxN6QPXjCSG0tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2AbNYMS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E63CC4CEE4;
	Tue,  6 May 2025 21:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567441;
	bh=/6dotfspmfvLZQl7LisUvq7pisMsJv9hVeR4uJ/vVSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u2AbNYMSYOYrfWqQ6O1px2QdfPrjmcK/cyLL4wiBweTgVid3OHvfgg6nsgLSBkthx
	 k6LIy1nguMn4/aKj8homDQD7hGviz7DuVonqYdLB28ANcKFHqFPjlOMy7FrF3hcZP9
	 A7Jn/8XVi2uGp3J4fMq3tt/f0uh3vyZqikght8/DCEgqjizjcWxsN04N2bQbv6Upn/
	 ccxNeJI2QteEi+K0FkFJOrxRh4FePLr6FeVAu6OUNfdH8GKhnMpjjlJzBja413F7Pu
	 dRGLUQPVUgB6stC7vNk+NTbq32v4n2c5OtI9yBfehmJMNpTtg2a5mpfPh0mqV8tOyx
	 w5EK0HHIpsdog==
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
Subject: [PATCH AUTOSEL 6.1 2/6] pinctrl: meson: define the pull up/down resistor value as 60 kOhm
Date: Tue,  6 May 2025 17:37:10 -0400
Message-Id: <20250506213714.2983569-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506213714.2983569-1-sashal@kernel.org>
References: <20250506213714.2983569-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.137
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
index 530f3f934e196..1f05f7f1a9aee 100644
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
2.39.5


