Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 321EF25627B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 23:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgH1Vcw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 17:32:52 -0400
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:60586 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726396AbgH1Vcr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Aug 2020 17:32:47 -0400
Received: from [188.210.212.0] (helo=localhost.localdomain)
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1kBlzE-0001C9-J8; Fri, 28 Aug 2020 22:32:40 +0100
From:   Thomas Preston <thomas.preston@codethink.co.uk>
To:     linus.walleij@linaro.org, sre@kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, jan.kundrat@cesnet.cz,
        preid@electromag.com.au
Cc:     thomas.preston@codethink.co.uk
Subject: [PATCH v2 1/2] pinctrl: mcp23s08: Fix mcp23x17_regmap initialiser
Date:   Fri, 28 Aug 2020 22:32:25 +0100
Message-Id: <20200828213226.1734264-2-thomas.preston@codethink.co.uk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200828213226.1734264-1-thomas.preston@codethink.co.uk>
References: <20200828213226.1734264-1-thomas.preston@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The mcp23x17_regmap is initialised with structs named "mcp23x16".
However, the mcp23s08 driver doesn't support the MCP23016 device yet, so
this appears to be a typo.

Fixes: 8f38910ba4f6 ("pinctrl: mcp23s08: switch to regmap caching")
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 42b12ea14d6be..87cde8fb08dd9 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -87,7 +87,7 @@ const struct regmap_config mcp23x08_regmap = {
 };
 EXPORT_SYMBOL_GPL(mcp23x08_regmap);
 
-static const struct reg_default mcp23x16_defaults[] = {
+static const struct reg_default mcp23x17_defaults[] = {
 	{.reg = MCP_IODIR << 1,		.def = 0xffff},
 	{.reg = MCP_IPOL << 1,		.def = 0x0000},
 	{.reg = MCP_GPINTEN << 1,	.def = 0x0000},
@@ -98,23 +98,23 @@ static const struct reg_default mcp23x16_defaults[] = {
 	{.reg = MCP_OLAT << 1,		.def = 0x0000},
 };
 
-static const struct regmap_range mcp23x16_volatile_range = {
+static const struct regmap_range mcp23x17_volatile_range = {
 	.range_min = MCP_INTF << 1,
 	.range_max = MCP_GPIO << 1,
 };
 
-static const struct regmap_access_table mcp23x16_volatile_table = {
-	.yes_ranges = &mcp23x16_volatile_range,
+static const struct regmap_access_table mcp23x17_volatile_table = {
+	.yes_ranges = &mcp23x17_volatile_range,
 	.n_yes_ranges = 1,
 };
 
-static const struct regmap_range mcp23x16_precious_range = {
+static const struct regmap_range mcp23x17_precious_range = {
 	.range_min = MCP_GPIO << 1,
 	.range_max = MCP_GPIO << 1,
 };
 
-static const struct regmap_access_table mcp23x16_precious_table = {
-	.yes_ranges = &mcp23x16_precious_range,
+static const struct regmap_access_table mcp23x17_precious_table = {
+	.yes_ranges = &mcp23x17_precious_range,
 	.n_yes_ranges = 1,
 };
 
@@ -124,10 +124,10 @@ const struct regmap_config mcp23x17_regmap = {
 
 	.reg_stride = 2,
 	.max_register = MCP_OLAT << 1,
-	.volatile_table = &mcp23x16_volatile_table,
-	.precious_table = &mcp23x16_precious_table,
-	.reg_defaults = mcp23x16_defaults,
-	.num_reg_defaults = ARRAY_SIZE(mcp23x16_defaults),
+	.volatile_table = &mcp23x17_volatile_table,
+	.precious_table = &mcp23x17_precious_table,
+	.reg_defaults = mcp23x17_defaults,
+	.num_reg_defaults = ARRAY_SIZE(mcp23x17_defaults),
 	.cache_type = REGCACHE_FLAT,
 	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
-- 
2.26.2

