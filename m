Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3AB6256278
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 23:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgH1Vcs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 17:32:48 -0400
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:60590 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726594AbgH1Vcr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Aug 2020 17:32:47 -0400
Received: from [188.210.212.0] (helo=localhost.localdomain)
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1kBlzE-0001C9-N6; Fri, 28 Aug 2020 22:32:40 +0100
From:   Thomas Preston <thomas.preston@codethink.co.uk>
To:     linus.walleij@linaro.org, sre@kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, jan.kundrat@cesnet.cz,
        preid@electromag.com.au
Cc:     thomas.preston@codethink.co.uk
Subject: [PATCH v2 2/2] pinctrl: mcp23s08: Fix mcp23x17 precious range
Date:   Fri, 28 Aug 2020 22:32:26 +0100
Message-Id: <20200828213226.1734264-3-thomas.preston@codethink.co.uk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200828213226.1734264-1-thomas.preston@codethink.co.uk>
References: <20200828213226.1734264-1-thomas.preston@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On page 23 of the datasheet [0] it says "The register remains unchanged
until the interrupt is cleared via a read of INTCAP or GPIO." Include
INTCAPA and INTCAPB registers in precious range, so that they aren't
accidentally cleared when we read via debugfs.

[0] https://ww1.microchip.com/downloads/en/DeviceDoc/20001952C.pdf

Fixes: 8f38910ba4f6 ("pinctrl: mcp23s08: switch to regmap caching")
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 87cde8fb08dd9..7edb067f5e76a 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -109,7 +109,7 @@ static const struct regmap_access_table mcp23x17_volatile_table = {
 };
 
 static const struct regmap_range mcp23x17_precious_range = {
-	.range_min = MCP_GPIO << 1,
+	.range_min = MCP_INTCAP << 1,
 	.range_max = MCP_GPIO << 1,
 };
 
-- 
2.26.2

