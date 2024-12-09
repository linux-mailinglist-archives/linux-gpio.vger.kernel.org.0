Return-Path: <linux-gpio+bounces-13630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A3E9E8C8C
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 08:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2B0118864C3
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 07:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECAB214A95;
	Mon,  9 Dec 2024 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yadro.com header.i=@yadro.com header.b="ToeJQjYP";
	dkim=pass (2048-bit key) header.d=yadro.com header.i=@yadro.com header.b="Gm6n3ncw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mta-03.yadro.com (mta-03.yadro.com [89.207.88.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DB915573D;
	Mon,  9 Dec 2024 07:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.207.88.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733730478; cv=none; b=CtQfWMQrztqNY9Y+025WKL/uv2pNzX2wM4RSYr53Y5IqT/MPrtqZhydjpHHhydBlmGuPxw36lTFVpEcMElzjgcjeKYSnCDt545UdV8ps0AEtoSzBZQconMNxUDDf/jaCdD2PNPBx+a8wUxZzfHnkcDY/wmPCU9wvQ7zn6qcXdb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733730478; c=relaxed/simple;
	bh=Sd8GLV1GZTuMQndnci343v7z53UP/Oxb0I80I1PF628=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=plQRaP5le1OMkzXReG+xMPtSE84IWSu3ww2x/Ybf5XaZu491jle952tX+CBmBYzyqYXAYXKXSy2/9oEv/bsFxIM8S7gvBR29zfPsu+sb0HOlw8ThizffNQdpKKsWVgHSIU1OR1Tsg7zGcVNqWVptjy8sm4sE3dRIJHJ3C2o+9LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yadro.com; spf=pass smtp.mailfrom=yadro.com; dkim=pass (2048-bit key) header.d=yadro.com header.i=@yadro.com header.b=ToeJQjYP; dkim=pass (2048-bit key) header.d=yadro.com header.i=@yadro.com header.b=Gm6n3ncw; arc=none smtp.client-ip=89.207.88.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yadro.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com 1983EE0008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1733730464; bh=9rTtz124RMOkvIMCEigwQM+K63GbqUml6CtYuHYZxYQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ToeJQjYPeOBCziDWhCGfg59C+idKZRuO623CNHq4hFVAqT4I8Eax1tF8lFRHrgZIV
	 Ts3HdvhXMMTJZhEokQ3hyVxIrwgihFr+SbmRP/idBAE2n70AQUMN8J7EG+yeIdnSqi
	 anAIpy5ROaTQvhEVfUCys5lGkrKWjiJl+1WeAcuyBCZWi6mUzF6PvYzxAcmWhGBiJW
	 3LhToC76XQhNU8tTo16wkDakjbQ9hAw/jfrUBXSl3Im0DVRZGJ8jzlmaC54czBCQF/
	 +2wDQ5RGb+zBDrN9MRuPQbjxwkm3RVhdjJ6j5JkWQyG9hRbe8qUAH15vjS2Np5inPq
	 WW6Bvp3ppk9aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1733730464; bh=9rTtz124RMOkvIMCEigwQM+K63GbqUml6CtYuHYZxYQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Gm6n3ncwcl/8vHsVaZTj99eQ0lnMXMQOA0pyPiTfHOCvqn9rGpWCjNu7GB3btY1M7
	 iG+swQDeJ71FLU3hoa7+ZSaoFlWRDDZ7vwFyX2tmHEZhQB+mQBA3yAywBMKMCoE1Qc
	 C6jmW0AbKPrc4sXWRSCTarHDcmsj8nYScbsmqerqQvkCb2eaWT+UxuQZABi0P1bQeL
	 FN61V8UM2h7Wy2w5MeX+vlOAxxZH81sn5x4h19I12TPPLOfww2GFOYC06ZOUI2XmA9
	 3aa4iAnJmsqnx5oAbPDXvAJYVmNP4diCkxIj3V4WbTP6IotdMOotAm1+JnlSf7/MKb
	 2oouM3UHwo3Mg==
From: Evgenii Shatokhin <e.shatokhin@yadro.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Nikita
 Shubin <nikita.shubin@maquefel.me>, <linux@yadro.com>, Evgenii Shatokhin
	<e.shatokhin@yadro.com>, <stable@vger.kernel.org>
Subject: [PATCH] pinctrl: mcp23s08: Fix sleeping in atomic context due to regmap locking
Date: Mon, 9 Dec 2024 10:46:59 +0300
Message-ID: <20241209074659.1442898-1-e.shatokhin@yadro.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-08.corp.yadro.com (172.17.11.58) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)

If a device uses MCP23xxx IO expander to receive IRQs, the following
bug can happen:

  BUG: sleeping function called from invalid context
    at kernel/locking/mutex.c:283
  in_atomic(): 1, irqs_disabled(): 1, non_block: 0, ...
  preempt_count: 1, expected: 0
  ...
  Call Trace:
  ...
  __might_resched+0x104/0x10e
  __might_sleep+0x3e/0x62
  mutex_lock+0x20/0x4c
  regmap_lock_mutex+0x10/0x18
  regmap_update_bits_base+0x2c/0x66
  mcp23s08_irq_set_type+0x1ae/0x1d6
  __irq_set_trigger+0x56/0x172
  __setup_irq+0x1e6/0x646
  request_threaded_irq+0xb6/0x160
  ...

We observed the problem while experimenting with a touchscreen driver which
used MCP23017 IO expander (I2C).

The regmap in the pinctrl-mcp23s08 driver uses a mutex for protection from
concurrent accesses, which is the default for regmaps without .fast_io,
.disable_locking, etc.

mcp23s08_irq_set_type() calls regmap_update_bits_base(), and the latter
locks the mutex.

However, __setup_irq() locks desc->lock spinlock before calling these
functions. As a result, the system tries to lock the mutex whole holding
the spinlock.

It seems, the internal regmap locks are not needed in this driver at all.
mcp->lock seems to protect the regmap from concurrent accesses already,
except, probably, in mcp_pinconf_get/set.

mcp23s08_irq_set_type() and mcp23s08_irq_mask/unmask() are called under
chip_bus_lock(), which calls mcp23s08_irq_bus_lock(). The latter takes
mcp->lock and enables regmap caching, so that the potentially slow I2C
accesses are deferred until chip_bus_unlock().

The accesses to the regmap from mcp23s08_probe_one() do not need additional
locking.

In all remaining places where the regmap is accessed, except
mcp_pinconf_get/set(), the driver already takes mcp->lock.

This patch adds locking in mcp_pinconf_get/set() and disables internal
locking in the regmap config. Among other things, it fixes the sleeping
in atomic context described above.

Fixes: 8f38910ba4f6 ("pinctrl: mcp23s08: switch to regmap caching")
Cc: stable@vger.kernel.org
Signed-off-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index d66c3a3e8429..b96e6368a956 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -86,6 +86,7 @@ const struct regmap_config mcp23x08_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(mcp23x08_defaults),
 	.cache_type = REGCACHE_FLAT,
 	.max_register = MCP_OLAT,
+	.disable_locking = true, /* mcp->lock protects the regmap */
 };
 EXPORT_SYMBOL_GPL(mcp23x08_regmap);
 
@@ -132,6 +133,7 @@ const struct regmap_config mcp23x17_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(mcp23x17_defaults),
 	.cache_type = REGCACHE_FLAT,
 	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.disable_locking = true, /* mcp->lock protects the regmap */
 };
 EXPORT_SYMBOL_GPL(mcp23x17_regmap);
 
@@ -228,7 +230,9 @@ static int mcp_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_PULL_UP:
+		mutex_lock(&mcp->lock);
 		ret = mcp_read(mcp, MCP_GPPU, &data);
+		mutex_unlock(&mcp->lock);
 		if (ret < 0)
 			return ret;
 		status = (data & BIT(pin)) ? 1 : 0;
@@ -257,7 +261,9 @@ static int mcp_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 
 		switch (param) {
 		case PIN_CONFIG_BIAS_PULL_UP:
+			mutex_lock(&mcp->lock);
 			ret = mcp_set_bit(mcp, MCP_GPPU, pin, arg);
+			mutex_unlock(&mcp->lock);
 			break;
 		default:
 			dev_dbg(mcp->dev, "Invalid config param %04x\n", param);
-- 
2.34.1


