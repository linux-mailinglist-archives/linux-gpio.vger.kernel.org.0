Return-Path: <linux-gpio+bounces-16954-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B62ABA4C459
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 16:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E84EE1882B93
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 15:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38DFC2147F4;
	Mon,  3 Mar 2025 15:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4knYuPo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684CD21422F;
	Mon,  3 Mar 2025 15:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014607; cv=none; b=f0tbKI2wuaVDND2B+LBYmwW+DywWeE6bind4UM+basQdwMnpfdC8whVtdCmReimTVZiGDSjxdVRHdoBaOprv87MucNOomfK6ortpULRXc/c6pdCsjR8h4THqm2qx3NMW8vYLTg4pmlXCQNnHSWhDiiuV/1eGzpv+bKWygzYFYXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014607; c=relaxed/simple;
	bh=wG1LPG3PWw+Nuyv3av9wI4E1Dhhx8hVT1Q8Qt5vaaZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhyLWktawIrsQ5I8vfOh94NSrY/eKeJhn62so12IksY74MTGg5A8kwb8LSl75qGyZCyn68F/sBIDY5ROXs0Evgx+9arYZ8Bl5s3UyuN4TGFPJ/MaeZLwrbLbk/ipZA2Ra3h3VlJTKc4pA+VFpfJdOmGOeLXw28KjdsnfDHhnDCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4knYuPo; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741014606; x=1772550606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wG1LPG3PWw+Nuyv3av9wI4E1Dhhx8hVT1Q8Qt5vaaZg=;
  b=d4knYuPoZPxDEiLuJJ9t+knQVqGhmvqEBfyQWKOH5cGb4aw9TvtCiLBr
   Pn3yvwXiBY/uFJgtf+TrdL9PhR6NPAR25JuAezLF8kQQwfIrYq8Vq2B5y
   Sv3kOJq1x95ZJRPqhm/Fyh7joywxtUofLtKLmbBMkqOurZvGb4VjEqptA
   qZvi5QfEk5vVajxw4oGLVWWG+g2wFF/KmshKVsT5RaqlUl53cC2VXim5o
   2o3/uII7qCUhG+SJQ/71yv+dbo9noObO9GAfeUs4HJmAT81yQ/xUiOL0w
   aEuuCGgpfeHlliAVW+k8uY6R6EZarI5LqM9jzGRru+QIzgk0dgnoFWN9W
   w==;
X-CSE-ConnectionGUID: Ya5YA/njTpa4dl9icIdfag==
X-CSE-MsgGUID: axPEXjpKS6SVNi3xQwfq+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52099510"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="52099510"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 07:09:02 -0800
X-CSE-ConnectionGUID: pgxIWZkQRxeqhNEnyyqc6A==
X-CSE-MsgGUID: DUgtES8RR62rxCN2N6wIFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="118739576"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 03 Mar 2025 07:08:57 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 804C610A; Mon, 03 Mar 2025 17:08:56 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH net-next v1 1/2] ieee802154: ca8210: Use proper setter and getters for bitwise types
Date: Mon,  3 Mar 2025 17:07:39 +0200
Message-ID: <20250303150855.1294188-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250303150855.1294188-1-andriy.shevchenko@linux.intel.com>
References: <20250303150855.1294188-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse complains that the driver doesn't respect the bitwise types:

drivers/net/ieee802154/ca8210.c:1796:27: warning: incorrect type in assignment (different base types)
drivers/net/ieee802154/ca8210.c:1796:27:    expected restricted __le16 [addressable] [assigned] [usertype] pan_id
drivers/net/ieee802154/ca8210.c:1796:27:    got unsigned short [usertype]
drivers/net/ieee802154/ca8210.c:1801:25: warning: incorrect type in assignment (different base types)
drivers/net/ieee802154/ca8210.c:1801:25:    expected restricted __le16 [addressable] [assigned] [usertype] pan_id
drivers/net/ieee802154/ca8210.c:1801:25:    got unsigned short [usertype]
drivers/net/ieee802154/ca8210.c:1928:28: warning: incorrect type in argument 3 (different base types)
drivers/net/ieee802154/ca8210.c:1928:28:    expected unsigned short [usertype] dst_pan_id
drivers/net/ieee802154/ca8210.c:1928:28:    got restricted __le16 [addressable] [usertype] pan_id

Use proper setter and getters for bitwise types.

Note, in accordance with [1] the protocol is little endian.

Link: https://www.cascoda.com/wp-content/uploads/2018/11/CA-8210_datasheet_0418.pdf [1]
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/net/ieee802154/ca8210.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
index 753215ebc67c..a036910f6082 100644
--- a/drivers/net/ieee802154/ca8210.c
+++ b/drivers/net/ieee802154/ca8210.c
@@ -1446,8 +1446,7 @@ static u8 mcps_data_request(
 	command.pdata.data_req.src_addr_mode = src_addr_mode;
 	command.pdata.data_req.dst.mode = dst_address_mode;
 	if (dst_address_mode != MAC_MODE_NO_ADDR) {
-		command.pdata.data_req.dst.pan_id[0] = LS_BYTE(dst_pan_id);
-		command.pdata.data_req.dst.pan_id[1] = MS_BYTE(dst_pan_id);
+		put_unaligned_le16(dst_pan_id, command.pdata.data_req.dst.pan_id);
 		if (dst_address_mode == MAC_MODE_SHORT_ADDR) {
 			command.pdata.data_req.dst.address[0] = LS_BYTE(
 				dst_addr->short_address
@@ -1795,12 +1794,12 @@ static int ca8210_skb_rx(
 	}
 	hdr.source.mode = data_ind[0];
 	dev_dbg(&priv->spi->dev, "srcAddrMode: %#03x\n", hdr.source.mode);
-	hdr.source.pan_id = *(u16 *)&data_ind[1];
+	hdr.source.pan_id = cpu_to_le16(get_unaligned_le16(&data_ind[1]));
 	dev_dbg(&priv->spi->dev, "srcPanId: %#06x\n", hdr.source.pan_id);
 	memcpy(&hdr.source.extended_addr, &data_ind[3], 8);
 	hdr.dest.mode = data_ind[11];
 	dev_dbg(&priv->spi->dev, "dstAddrMode: %#03x\n", hdr.dest.mode);
-	hdr.dest.pan_id = *(u16 *)&data_ind[12];
+	hdr.dest.pan_id = cpu_to_le16(get_unaligned_le16(&data_ind[12]));
 	dev_dbg(&priv->spi->dev, "dstPanId: %#06x\n", hdr.dest.pan_id);
 	memcpy(&hdr.dest.extended_addr, &data_ind[14], 8);
 
@@ -1927,7 +1926,7 @@ static int ca8210_skb_tx(
 	status =  mcps_data_request(
 		header.source.mode,
 		header.dest.mode,
-		header.dest.pan_id,
+		le16_to_cpu(header.dest.pan_id),
 		(union macaddr *)&header.dest.extended_addr,
 		skb->len - mac_len,
 		&skb->data[mac_len],
-- 
2.47.2


