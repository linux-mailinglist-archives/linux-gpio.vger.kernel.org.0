Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4B213E290
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2020 17:57:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733304AbgAPQ45 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jan 2020 11:56:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:43570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733301AbgAPQ44 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jan 2020 11:56:56 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E866F21D56;
        Thu, 16 Jan 2020 16:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579193815;
        bh=gy4N+1wZV5eV3/+8RCugN+8K0/4YRGCghnyX+ih/VPg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rlGa9atcEt0/63vWI7H7jasNCFwcgeMwyAH+dahOfqz1HLMDfb0JIkpPSY/N+xzd3
         c9hJILLktl+FtCv7shGu7a0qgpdFD98XqnHFCQruU2+sWHjaFsUkeh+C99x8kK1Fap
         GqmbrHaoxPuhC4gMycKaIH6RtFdMor6R5pIioePg=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Sasha Levin <sashal@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 076/671] pinctrl: sh-pfc: sh7734: Add missing IPSR11 field
Date:   Thu, 16 Jan 2020 11:45:07 -0500
Message-Id: <20200116165502.8838-76-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116165502.8838-1-sashal@kernel.org>
References: <20200116165502.8838-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

[ Upstream commit 94482af7055e1ffa211c1135256b85590ebcac99 ]

The Peripheral Function Select Register 11 contains 3 reserved bits and
15 variable-width fields, but the variable field descriptor does not
contain the 3-bit field IP11[25:23].

Fixes: 856cb4bb337ee504 ("sh: Add support pinmux for SH7734")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/sh-pfc/pfc-sh7734.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7734.c b/drivers/pinctrl/sh-pfc/pfc-sh7734.c
index 3eccc9b3ca84..05ccb27f7781 100644
--- a/drivers/pinctrl/sh-pfc/pfc-sh7734.c
+++ b/drivers/pinctrl/sh-pfc/pfc-sh7734.c
@@ -2237,7 +2237,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_LCD_DATA15_B, 0, 0, 0 }
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR11", 0xFFFC0048, 32,
-			3, 1, 2, 2, 2, 3, 3, 1, 2, 3, 3, 1, 1, 1, 1) {
+			3, 1, 2, 3, 2, 2, 3, 3, 1, 2, 3, 3, 1, 1, 1, 1) {
 	    /* IP11_31_29 [3] */
 	    0, 0, 0, 0, 0, 0, 0, 0,
 	    /* IP11_28 [1] */
-- 
2.20.1

