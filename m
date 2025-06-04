Return-Path: <linux-gpio+bounces-20935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5941ACD1DB
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 03:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 932421884628
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 00:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063E51C5496;
	Wed,  4 Jun 2025 00:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeZTixrO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52C213C9D4;
	Wed,  4 Jun 2025 00:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748998478; cv=none; b=U/d7O8qF6vLq25Neqi7M+6Mi/Df/W2AwQ5Hl7vGwGZ7uPkbjP+yTiDNSyWsWYEnLT+C+PEPwT+0BP3DfcR88s3tZhQQ7/oP9kOoAm3hXP6AZOOgCnxSgLoA5Y+Y02ptpfxA/HpLYZOhLxJTfp4wSj+P4xXm1x4bE3k0mvqschrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748998478; c=relaxed/simple;
	bh=/5J54oeE9cKwnVaQsI3Q9CbTpwnfwTU7Sag8V98unKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iqART/3OarfPon7rOwDeghsghX6UVXfQp6EvVN6kCZ60v5YcVXceAyXofPjHEgDSjAxWGClRQwKKWVV5ty0OUM9fP1HhKgevk1o4l76HN4Z9+6K9B5MDwxA0rmz5XJuKM37ueqvTo08mLdU/ZJRAtSKgHUZnTKs3slDWWwchn6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeZTixrO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E25C4CEED;
	Wed,  4 Jun 2025 00:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998478;
	bh=/5J54oeE9cKwnVaQsI3Q9CbTpwnfwTU7Sag8V98unKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WeZTixrO9+4kuIr2+WR1WSmxDROFvsfLOL6F5qY5Nj/yWz9zbrQNQZ+gkgo+AoKPV
	 B121Eh2eEFkSwA1eZA5O2FXfRaMcQnqPxe+wuDK5xeUqgvSLnlVJBlhzd3MPDf5foC
	 qIYzTumxO/5AEF/EQVVSymhjUPCsE5+0ugOWNAAt8Xsina3K+xNkpXtlTGbjIW8KUN
	 lEL+EK4tGrT7PJE3uNZIbwgzGicbnjodNjTDqKD50H790V/cN101D0x5/i3DKpSatS
	 ytV6OVDe7Ia9ECBIGieqWFZzhRtDbF07B5Bc1hjBB+aVJwH7HlLwxnE3kUF1ILowb0
	 FgI6KhKebfphg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 097/118] pinctrl: mcp23s08: Reset all pins to input at probe
Date: Tue,  3 Jun 2025 20:50:28 -0400
Message-Id: <20250604005049.4147522-97-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005049.4147522-1-sashal@kernel.org>
References: <20250604005049.4147522-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Transfer-Encoding: 8bit

From: Mike Looijmans <mike.looijmans@topic.nl>

[ Upstream commit 3ede3f8b4b4b399b0ca41e44959f80d5cf84fc98 ]

At startup, the driver just assumes that all registers have their
default values. But after a soft reset, the chip will just be in the
state it was, and some pins may have been configured as outputs. Any
modification of the output register will cause these pins to be driven
low, which leads to unexpected/unwanted effects. To prevent this from
happening, set the chip's IO configuration register to a known safe
mode (all inputs) before toggling any other bits.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Link: https://lore.kernel.org/20250314151803.28903-1-mike.looijmans@topic.nl
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Let me examine the exact change being made in the commit: Based on the
commit analysis, here's my assessment: **YES** This commit should be
backported to stable kernel trees. Here's my detailed analysis: ## Key
Reasons for Backporting: ### 1. **Fixes a Real Safety Issue** The commit
addresses a genuine safety problem where GPIO pins can be unexpectedly
driven low during driver initialization. From the commit message: "Any
modification of the output register will cause these pins to be driven
low, which leads to unexpected/unwanted effects." This could cause
hardware damage or system malfunction in real-world deployments. ### 2.
**Small, Contained, and Safe Change** The code change is minimal and
surgical: ```c + /bin /bin.usr-is-merged /boot /dev /etc /home /init
/lib /lib.usr-is-merged /lib64 /lost+found /media /mnt /opt /proc /root
/run /sbin /sbin.usr-is-merged /snap /srv /sys /tmp /usr /var +
capability_test capability_test.c f2fs_folio_analysis.md
ipv4_multipath_analysis.md ipv6_route_allocation_rcu_analysis.md
ixgbe_e610_set_phys_id_analysis.md linux lpfc_timeout_analysis.md
mac80211_mlo_mbssid_analysis.md pfcp_driver_historical_analysis.md
rtl_bb_delay_analysis.md rtw89_mlo_analysis.md
tcp_multipath_load_balance_analysis.md test_unaligned_diff
test_unaligned_diff.c type_size_check type_size_check.c
veth_driver_analysis.md wifi_mlo_mbssid_tx_link_id_analysis.md Reset the
chip - we don't really know what state it's in, so reset +
capability_test capability_test.c f2fs_folio_analysis.md
ipv4_multipath_analysis.md ipv6_route_allocation_rcu_analysis.md
ixgbe_e610_set_phys_id_analysis.md linux lpfc_timeout_analysis.md
mac80211_mlo_mbssid_analysis.md pfcp_driver_historical_analysis.md
rtl_bb_delay_analysis.md rtw89_mlo_analysis.md
tcp_multipath_load_balance_analysis.md test_unaligned_diff
test_unaligned_diff.c type_size_check type_size_check.c
veth_driver_analysis.md wifi_mlo_mbssid_tx_link_id_analysis.md all pins
to input first to prevent surprises. + linux/ + ret = mcp_write(mcp,
MCP_IODIR, mcp->chip.ngpio == 16 ? 0xFFFF : 0xFF); + if (ret < 0) +
return ret; ``` This simply writes all 1s to the MCP_IODIR register (I/O
direction register), which according to the datasheet comment at line 29
is the proper reset value: `#define MCP_IODIR 0x00 /bin /bin.usr-is-
merged /boot /dev /etc /home /init /lib /lib.usr-is-merged /lib64
/lost+found /media /mnt /opt /proc /root /run /sbin /sbin.usr-is-merged
/snap /srv /sys /tmp /usr /var init/reset: all ones */` ### 3. **Aligns
with Hardware Reset Behavior** The change makes the software behavior
consistent with hardware reset behavior. The MCP_IODIR register defaults
to 0xFF (all inputs) on hardware reset, so this ensures software reset
has the same safe state. ### 4. **Minimal Risk of Regression** - The
change occurs early in the probe function, before any other GPIO
operations - Setting pins to input is the safest possible state - it
cannot cause unexpected signal driving - The error handling is proper
(returns on failure) - This matches the expected reset state per the
hardware datasheet ### 5. **Affects Critical Subsystem Safety** GPIO
drivers control physical hardware pins that can affect external
circuits. Unexpected pin states can cause: - Hardware damage to
connected devices - System instability - Safety issues in embedded
systems ### 6. **No Architectural Changes** The fix doesn't introduce
new features, change APIs, or modify the driver architecture. It simply
ensures a known safe state during initialization. ### 7. **Similar
Pattern to Other Stable Fixes** Looking at the similar commits provided,
this follows the pattern of commit #3 (cy8c95x0 fix) which was marked as
YES for backporting - both are small GPIO/pinctrl fixes that address
real hardware behavior issues. ### 8. **Clear Problem Statement** The
commit clearly explains the issue: "after a soft reset, the chip will
just be in the state it was, and some pins may have been configured as
outputs" - this is a well-defined problem that affects users. This
commit meets all the criteria for stable backporting: it fixes an
important bug that affects users, is small and contained, has minimal
regression risk, and doesn't introduce new features or architectural
changes.

 drivers/pinctrl/pinctrl-mcp23s08.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 4d1f41488017e..c2f4b16f42d20 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -636,6 +636,14 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 
 	mcp->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 
+	/*
+	 * Reset the chip - we don't really know what state it's in, so reset
+	 * all pins to input first to prevent surprises.
+	 */
+	ret = mcp_write(mcp, MCP_IODIR, mcp->chip.ngpio == 16 ? 0xFFFF : 0xFF);
+	if (ret < 0)
+		return ret;
+
 	/* verify MCP_IOCON.SEQOP = 0, so sequential reads work,
 	 * and MCP_IOCON.HAEN = 1, so we work with all chips.
 	 */
-- 
2.39.5


