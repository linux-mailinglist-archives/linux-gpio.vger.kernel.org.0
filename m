Return-Path: <linux-gpio+bounces-8497-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9688E943BC9
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 02:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2018DB2404C
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 00:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D80149C5E;
	Thu,  1 Aug 2024 00:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osMXYE+x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76802196DA1;
	Thu,  1 Aug 2024 00:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722471314; cv=none; b=QjPMZ+Z5xUsTnTCl+P4ug2IcmrKEn3SN/iEvQec1TBe6p5rBcL9M/qGFsyieTeZ+P04Z8yJms0PaFdCgMmdDj3zbfAhvrbL6PVQzrU6pT2hEWhGYEBGGOtqxQuSd7FEHwXWo0Zp95X3gXLKWWhQ76HaYJsi4G99dYvIVqfaO7Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722471314; c=relaxed/simple;
	bh=rEuIUDOjXhBJuZZxIIV4Z4DS1dJ190OWw+jL9ZhwwS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9W5K7K30BDzYCqPDrN2HCv+7HoK6mAHLwfmJ8kKp6rTTHe4b/nxZfOWontPw7hE2nzSE3rDe9VDoGwGQ7WCQQnnZgU1cbxtzdByLzaWMc/S5zuTYynS8BXSi4WhMhEdxEv/f9KeXuY2sAGrPQljazgEszZOgjRQuOPgKis4LAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osMXYE+x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DD8C32786;
	Thu,  1 Aug 2024 00:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722471314;
	bh=rEuIUDOjXhBJuZZxIIV4Z4DS1dJ190OWw+jL9ZhwwS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=osMXYE+xk22A5wk8q/86PV6PnvBWhnrXB7uVlUY3pLwWAjMEwS7+9v/JONC8Bt9tu
	 SpB+wSRC7neFxBDwIGx+/jw2BIvbdxadydMDn6kr6bTcPY3Wsxqq5rAOZMlIpvGrxy
	 7tp5BQKOeUfWj0hx+Dch1NewSoe3qbcaj/c/GFZlmaNJZHbYACq8Y7voHNkrIhxqXQ
	 wIIZ9enw+RSw8dYGXEAlIm8SdAl4mWo6ci1WINPpQdrh3fdB74JT6KVeC0eblj5ff+
	 gvoqogoaA+faPVVd/cXCBfQ8/7+dalATowMx1cXyNo/XSmPC6NiChnLXIk/TBT1Pb6
	 TOPFhPwK1heEg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 068/121] pinctrl: renesas: rzg2l: Validate power registers for SD and ETH
Date: Wed, 31 Jul 2024 20:00:06 -0400
Message-ID: <20240801000834.3930818-68-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

[ Upstream commit a3a632ed87f0913779092c30bd0ea7dfd81601f3 ]

On RZ/V2H(P) SoC, the power registers for SD and ETH do not exist,
resulting in invalid register offsets.  Ensure that the register offsets
are valid before any read/write operations are performed.  If the power
registers are not available, both SD and ETH will be set to '0'.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
Link: https://lore.kernel.org/r/20240530173857.164073-7-prabhakar.mahadev-lad.rj@bp.renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 60be78da9f529..389602e4d7ab3 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2583,8 +2583,10 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
 	rzg2l_pinctrl_pm_setup_dedicated_regs(pctrl, true);
 
 	for (u8 i = 0; i < 2; i++) {
-		cache->sd_ch[i] = readb(pctrl->base + SD_CH(regs->sd_ch, i));
-		cache->eth_poc[i] = readb(pctrl->base + ETH_POC(regs->eth_poc, i));
+		if (regs->sd_ch)
+			cache->sd_ch[i] = readb(pctrl->base + SD_CH(regs->sd_ch, i));
+		if (regs->eth_poc)
+			cache->eth_poc[i] = readb(pctrl->base + ETH_POC(regs->eth_poc, i));
 	}
 
 	cache->qspi = readb(pctrl->base + QSPI);
@@ -2615,8 +2617,10 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	writeb(cache->qspi, pctrl->base + QSPI);
 	writeb(cache->eth_mode, pctrl->base + ETH_MODE);
 	for (u8 i = 0; i < 2; i++) {
-		writeb(cache->sd_ch[i], pctrl->base + SD_CH(regs->sd_ch, i));
-		writeb(cache->eth_poc[i], pctrl->base + ETH_POC(regs->eth_poc, i));
+		if (regs->sd_ch)
+			writeb(cache->sd_ch[i], pctrl->base + SD_CH(regs->sd_ch, i));
+		if (regs->eth_poc)
+			writeb(cache->eth_poc[i], pctrl->base + ETH_POC(regs->eth_poc, i));
 	}
 
 	rzg2l_pinctrl_pm_setup_pfc(pctrl);
-- 
2.43.0


