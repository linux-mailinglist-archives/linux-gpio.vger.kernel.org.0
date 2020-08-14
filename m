Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E77EE244817
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 12:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbgHNKcM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Aug 2020 06:32:12 -0400
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:46766 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726012AbgHNKcM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Aug 2020 06:32:12 -0400
Received: from [188.210.212.0] (helo=localhost.localdomain)
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1k6WZD-000572-4N; Fri, 14 Aug 2020 11:04:07 +0100
From:   Thomas Preston <thomas.preston@codethink.co.uk>
To:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     thomas.preston@codethink.co.uk
Subject: [PATCH 1/3] pinctrl: mcp23s08: Fixup mcp23x17 regmap_config
Date:   Fri, 14 Aug 2020 11:03:55 +0100
Message-Id: <20200814100357.209340-2-thomas.preston@codethink.co.uk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200814100357.209340-1-thomas.preston@codethink.co.uk>
References: <20200814100357.209340-1-thomas.preston@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

- Fix a typo where mcp23x17 configs are referred to as mcp23x16.
- Fix precious range to include INTCAP{A,B}, which clear on read.
- Fix precious range to include GPIOB, which clears on read.
- Fix volatile range to include GPIOB, to fix debugfs registers
  reporting different values than `gpioget gpiochip2 {0..15}`.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 42b12ea14d6b..0138638276e7 100644
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
-	.range_max = MCP_GPIO << 1,
+	.range_max = (MCP_GPIO << 1) + 1,
 };
 
-static const struct regmap_access_table mcp23x16_volatile_table = {
-	.yes_ranges = &mcp23x16_volatile_range,
+static const struct regmap_access_table mcp23x17_volatile_table = {
+	.yes_ranges = &mcp23x17_volatile_range,
 	.n_yes_ranges = 1,
 };
 
-static const struct regmap_range mcp23x16_precious_range = {
-	.range_min = MCP_GPIO << 1,
-	.range_max = MCP_GPIO << 1,
+static const struct regmap_range mcp23x17_precious_range = {
+	.range_min = MCP_INTCAP << 1,
+	.range_max = (MCP_GPIO << 1) + 1,
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

