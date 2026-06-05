Return-Path: <linux-gpio+bounces-37986-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C4kWCwcjImrdSwEAu9opvQ
	(envelope-from <linux-gpio+bounces-37986-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 03:14:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E4A6444FD
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 03:14:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=YkOOROqb;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37986-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37986-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=riscstar.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23A7830FCC83
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 01:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C743644BE;
	Fri,  5 Jun 2026 01:01:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B0935CB76
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jun 2026 01:00:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780621287; cv=none; b=s5iCi5Tg/kXarBpeb6Po5c9jMGT2PZbFfUJ1KVMqavnH/NzjVCGvqtwyIBr8cfiEuOLOxDkXWsHbHoSHwh/bCi9qDaKXs0y0cx6vK4Cxi3UcACK4qlwe1SKGeRO5nc1WvqFoKqhIwf5AwHygXo4Wf/uESPZX61OueFPSUw+MLzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780621287; c=relaxed/simple;
	bh=NYqtz18Vi4h6amY79JOSwciWh5J4DGUbxj7ljZpHckA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJIoW6EyU90NdQGPVLt6ltlPoFoHJyFTsezfjtoN0ozGR+m0auWS2c2sVnUz71imod6jWLr8HUM5Y4tPLtFe7rO09L//VPOPCTO6xoiPZiqlStPRjozFER516X2jiyG/8Ld/Ucsd3IsiPjJdMhrdIPz8vTfiQfSpKX+++aovnMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=YkOOROqb; arc=none smtp.client-ip=74.125.82.43
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-137f27712fdso1596409c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 18:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621258; x=1781226058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5/opMyYHstCvLC6D+VPIEWzznFTHx3VHFIRMnLujuM=;
        b=YkOOROqbXVpBbizwBGx2y5TCk3ETYmu6kXEbGw31Dn7XXOVlmI+lTH5fobb5/PPbdW
         basjk6qT6j5S8wA+YTgtHG1N3vmkRdz+3TuXjLkoBjOJXC4gwMy/w91RFghHXDm5tP5h
         hzvAcP4yZb5HflQOeOQhZ/jc38gG8zcq8ERgF1yXqzZ0Sa5Vx+I1VmLtgabcJjydihn/
         633/Op7y52cZQ80XvdDJc+eZXPbzEyO4r+4+t5gqPkc9LEHVxXix5P6TVcZDCu841cIu
         G4Hk4PbmfC5Tp1FO8AdBI/f22HPHOby1d+iJb5qTZlBfqY2Zkcsg7pde2VJ8j/L0eRxN
         Z7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621258; x=1781226058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s5/opMyYHstCvLC6D+VPIEWzznFTHx3VHFIRMnLujuM=;
        b=KG58LLiJ6Kp/PURNT1/3c6Q6tpctygTNAIHF81I8QwGSg1MO6itgmn67U1PBexidqk
         K74sDboc0Bg0GiS8YdqjC3Sl4HiKFQg48mVX6FAkIkc/DMdTEuTklZ9jv2MFM6giqgr6
         6uIhgZUPWY70dDi8rmyqCEpiGJMsZEcSG0x10RH5xfETV5WEBbpNmjIMvKCQUOTXHUgq
         vUKcNguCOy7j+622/B/GmTulDAIwUAl6Z5T+2v/2C1aRofiR4lXLXnJgxvlaEDMqYrUx
         GCjHsyD90Ii1aNLMI7HNCpjrzMtCkYMr8kjccFWNVfvJzuXeNZC8GCPFlaLU6/muE8Nw
         bC7w==
X-Forwarded-Encrypted: i=1; AFNElJ/rSCBklz29U9jytaTqfrgbNBpXkWwR32jBKL0eD2ZhRQx77PSJop+FOYBOToOlYWmgQXL3oWBCMV3Y@vger.kernel.org
X-Gm-Message-State: AOJu0YywJvmwVlpqhTBOdSOwTqfkGh2FpmUkSnuzb8ZWZxyxAjYxxkr4
	mcUyyuelHGkagoboxEVuE5OtQXwXOSseU+aOQ6IIXBr1hMkMUL6CeeBKlzhBFYnflKBYzqpMb4y
	FJU7O4CA=
X-Gm-Gg: Acq92OHuB6x6JuVriYJlKyZHRNnyfBBEF8WuMDKyOdbrNRc3a5CcKIHmVSFGJf+OWFn
	omHGsiTn/MeNzYcFgQsrvZLkYln5ua6KTMMBG5doIWIIEHrXgk8gk9m2e1IEBQ4rjCzMHtKHY4o
	RVjC/9pX8XwCw9BMt3t1RuTHEZC7vidLipIAEHeccwk8dcA0BwuNvrJRk/AB22MJwmy9vfQZA1v
	v+SRxvM6sL/knPG4PhkhCFuWhjYqywjcNGmF9YJpvNhxaE+xSDBhcCDSJOGL7p4kQuJn7wAJmy6
	oVp8XNiSPIkmluWlhk6+WvHsNGbrudVz6J7GNdxPAb3YP5JX9VDC04xtsGW37KkLeqeYiX2vPW5
	0Ut8YB/sAaOfBWym85rG773v73BZIoTvy/mkBzXnrGe72Yn/tKXnfpPKhNgMCbD+G/FLadH4k8k
	8hTAkFDFjswVVoswhca0okW51DEgNGrTO/XQbDLg==
X-Received: by 2002:a05:6808:2e4e:b0:47c:6c9c:607d with SMTP id 5614622812f47-4868dc00eeemr864279b6e.2.1780621247107;
        Thu, 04 Jun 2026 18:00:47 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:46 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: daniel@riscstar.com,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 06/14] net: stmmac: dma: create a separate dma_device pointer
Date: Thu,  4 Jun 2026 20:00:13 -0500
Message-ID: <20260605010022.968612-7-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:daniel@riscstar.com,m:elder@riscstar.com,m:mohd.anwar@oss.qualcomm.com,m:a0987203069@gmail.com,m:alexandre.torgue@foss.st.com,m:ast@kernel.org,m:boon.khai.ng@altera.com,m:chenchuangyu@xiaomi.com,m:chenhuacai@kernel.org,m:daniel@iogearbox.net,m:hawk@kernel.org,m:hkallweit1@gmail.com,m:inochiama@gmail.com,m:john.fastabend@gmail.com,m:julianbraha@gmail.com,m:livelycarpet87@gmail.com,m:mcoquelin.stm32@gmail.com,m:me@ziyao.cc,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:sdf@fomichev.me,m:siyanteng@cqsoftware.com.cn,m:weishangjuan@eswincomputing.com,m:wens@k
 ernel.org,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37986-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[49];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,riscstar.com:from_mime,riscstar.com:email,riscstar-com.20251104.gappssmtp.com:dkim,pp_params.dev:url,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84E4A6444FD

The Toshiba TC956x Ethernet bridge chip is an Ethernet AVN/TSN bridge
that is essentially a small but specialized SoC.  It provides two XGMAC
Ethernet interfaces along with a number of internal IP blocks, some of
which are used by both eMACs.

The chip implements two internal PCIe functions, and one of these is
used to manage the common internal IPs.  Both of the PCIe functions
use an auxiliary bus device to represent an XGMAC Ethernet interface.
Separating the PCIe function from the XGMAC IP this way helps in
managing the life cycle for various objects (common and per-MAC).

However this separation means that the MAC device is no longer the
proper device to use for DMA.  To address this, we add support for
a second "DMA device" pointer in the stmmac_priv structure.  The DMA
device pointer is used for all DMA operations, while the "normal"
device pointer is used for log messages, memory allocation, runtime
power management, and a few other things.

To set up the DMA device pointer, we add a new device structure pointer
to the plat_stmmacenet_data structure.  If set, it will be assigned as
the (new) dma_device pointer field in the stmmac_priv structure.  If
the plat_stmmacenet_data field is NULL, the "normal" device pointer is
assigned as the dma_device pointer instead (preserving existing behavior).

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../net/ethernet/stmicro/stmmac/chain_mode.c  | 12 ++--
 .../net/ethernet/stmicro/stmmac/ring_mode.c   | 12 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 58 ++++++++++---------
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.c  |  2 +-
 include/linux/stmmac.h                        |  1 +
 6 files changed, 45 insertions(+), 41 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
index fc04a23342cfc..331e6523ee018 100644
--- a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
@@ -34,10 +34,10 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 	buf_len = min_t(unsigned int, nopaged_len, bmax);
 	len = nopaged_len - buf_len;
 
-	des2 = dma_map_single(priv->device, skb->data,
+	des2 = dma_map_single(priv->dma_device, skb->data,
 			      buf_len, DMA_TO_DEVICE);
 	desc->des2 = cpu_to_le32(des2);
-	if (dma_mapping_error(priv->device, des2))
+	if (dma_mapping_error(priv->dma_device, des2))
 		return -1;
 	tx_q->tx_skbuff_dma[entry].buf = des2;
 	tx_q->tx_skbuff_dma[entry].len = buf_len;
@@ -51,11 +51,11 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 		desc = tx_q->dma_tx + entry;
 
 		if (len > bmax) {
-			des2 = dma_map_single(priv->device,
+			des2 = dma_map_single(priv->dma_device,
 					      (skb->data + bmax * i),
 					      bmax, DMA_TO_DEVICE);
 			desc->des2 = cpu_to_le32(des2);
-			if (dma_mapping_error(priv->device, des2))
+			if (dma_mapping_error(priv->dma_device, des2))
 				return -1;
 			tx_q->tx_skbuff_dma[entry].buf = des2;
 			tx_q->tx_skbuff_dma[entry].len = bmax;
@@ -64,11 +64,11 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 			len -= bmax;
 			i++;
 		} else {
-			des2 = dma_map_single(priv->device,
+			des2 = dma_map_single(priv->dma_device,
 					      (skb->data + bmax * i), len,
 					      DMA_TO_DEVICE);
 			desc->des2 = cpu_to_le32(des2);
-			if (dma_mapping_error(priv->device, des2))
+			if (dma_mapping_error(priv->dma_device, des2))
 				return -1;
 			tx_q->tx_skbuff_dma[entry].buf = des2;
 			tx_q->tx_skbuff_dma[entry].len = len;
diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
index 78fc6aa5bbe95..0d334c51fc1c2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
@@ -37,10 +37,10 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 
 	if (nopaged_len > BUF_SIZE_8KiB) {
 
-		des2 = dma_map_single(priv->device, skb->data, bmax,
+		des2 = dma_map_single(priv->dma_device, skb->data, bmax,
 				      DMA_TO_DEVICE);
 		desc->des2 = cpu_to_le32(des2);
-		if (dma_mapping_error(priv->device, des2))
+		if (dma_mapping_error(priv->dma_device, des2))
 			return -1;
 
 		tx_q->tx_skbuff_dma[entry].buf = des2;
@@ -58,10 +58,10 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 		else
 			desc = tx_q->dma_tx + entry;
 
-		des2 = dma_map_single(priv->device, skb->data + bmax, len,
+		des2 = dma_map_single(priv->dma_device, skb->data + bmax, len,
 				      DMA_TO_DEVICE);
 		desc->des2 = cpu_to_le32(des2);
-		if (dma_mapping_error(priv->device, des2))
+		if (dma_mapping_error(priv->dma_device, des2))
 			return -1;
 		tx_q->tx_skbuff_dma[entry].buf = des2;
 		tx_q->tx_skbuff_dma[entry].len = len;
@@ -72,10 +72,10 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 				STMMAC_RING_MODE, 1, !skb_is_nonlinear(skb),
 				skb->len);
 	} else {
-		des2 = dma_map_single(priv->device, skb->data,
+		des2 = dma_map_single(priv->dma_device, skb->data,
 				      nopaged_len, DMA_TO_DEVICE);
 		desc->des2 = cpu_to_le32(des2);
-		if (dma_mapping_error(priv->device, des2))
+		if (dma_mapping_error(priv->dma_device, des2))
 			return -1;
 		tx_q->tx_skbuff_dma[entry].buf = des2;
 		tx_q->tx_skbuff_dma[entry].len = nopaged_len;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 8ba8f03e1ce03..76c8551687998 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -278,6 +278,7 @@ struct stmmac_priv {
 	void __iomem *ioaddr;
 	struct net_device *dev;
 	struct device *device;
+	struct device *dma_device;
 	struct mac_device_info *hw;
 	int (*hwif_quirks)(struct stmmac_priv *priv);
 	struct mutex lock;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 35da51c262484..09d2640a18b3c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1730,12 +1730,12 @@ static void stmmac_free_tx_buffer(struct stmmac_priv *priv,
 	if (tx_q->tx_skbuff_dma[i].buf &&
 	    tx_q->tx_skbuff_dma[i].buf_type != STMMAC_TXBUF_T_XDP_TX) {
 		if (tx_q->tx_skbuff_dma[i].map_as_page)
-			dma_unmap_page(priv->device,
+			dma_unmap_page(priv->dma_device,
 				       tx_q->tx_skbuff_dma[i].buf,
 				       tx_q->tx_skbuff_dma[i].len,
 				       DMA_TO_DEVICE);
 		else
-			dma_unmap_single(priv->device,
+			dma_unmap_single(priv->dma_device,
 					 tx_q->tx_skbuff_dma[i].buf,
 					 tx_q->tx_skbuff_dma[i].len,
 					 DMA_TO_DEVICE);
@@ -2166,7 +2166,7 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 
 	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
-	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
+	dma_free_coherent(priv->dma_device, size, addr, rx_q->dma_rx_phy);
 
 	if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
 		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
@@ -2214,7 +2214,7 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 
 	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
-	dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
+	dma_free_coherent(priv->dma_device, size, addr, tx_q->dma_tx_phy);
 
 	kfree(tx_q->tx_skbuff_dma);
 	kfree(tx_q->tx_skbuff);
@@ -2266,8 +2266,8 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	pp_params.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
 	pp_params.pool_size = dma_conf->dma_rx_size;
 	pp_params.order = order_base_2(num_pages);
-	pp_params.nid = dev_to_node(priv->device);
-	pp_params.dev = priv->device;
+	pp_params.nid = dev_to_node(priv->dma_device);
+	pp_params.dev = priv->dma_device;
 	pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
 	pp_params.offset = stmmac_rx_offset(priv);
 	pp_params.max_len = dma_conf->dma_buf_sz;
@@ -2290,7 +2290,7 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 
 	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
-	addr = dma_alloc_coherent(priv->device, size, &rx_q->dma_rx_phy,
+	addr = dma_alloc_coherent(priv->dma_device, size, &rx_q->dma_rx_phy,
 				  GFP_KERNEL);
 	if (!addr)
 		return -ENOMEM;
@@ -2369,7 +2369,7 @@ static int __alloc_dma_tx_desc_resources(struct stmmac_priv *priv,
 
 	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
-	addr = dma_alloc_coherent(priv->device, size,
+	addr = dma_alloc_coherent(priv->dma_device, size,
 				  &tx_q->dma_tx_phy, GFP_KERNEL);
 	if (!addr)
 		return -ENOMEM;
@@ -2898,12 +2898,12 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue,
 		if (likely(tx_q->tx_skbuff_dma[entry].buf &&
 			   tx_q->tx_skbuff_dma[entry].buf_type != STMMAC_TXBUF_T_XDP_TX)) {
 			if (tx_q->tx_skbuff_dma[entry].map_as_page)
-				dma_unmap_page(priv->device,
+				dma_unmap_page(priv->dma_device,
 					       tx_q->tx_skbuff_dma[entry].buf,
 					       tx_q->tx_skbuff_dma[entry].len,
 					       DMA_TO_DEVICE);
 			else
-				dma_unmap_single(priv->device,
+				dma_unmap_single(priv->dma_device,
 						 tx_q->tx_skbuff_dma[entry].buf,
 						 tx_q->tx_skbuff_dma[entry].len,
 						 DMA_TO_DEVICE);
@@ -4571,9 +4571,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	first = desc;
 
 	/* first descriptor: fill Headers on Buf1 */
-	des = dma_map_single(priv->device, skb->data, skb_headlen(skb),
+	des = dma_map_single(priv->dma_device, skb->data, skb_headlen(skb),
 			     DMA_TO_DEVICE);
-	if (dma_mapping_error(priv->device, des))
+	if (dma_mapping_error(priv->dma_device, des))
 		goto dma_map_err;
 
 	stmmac_set_desc_addr(priv, first, des);
@@ -4599,10 +4599,10 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	for (i = 0; i < nfrags; i++) {
 		const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
 
-		des = skb_frag_dma_map(priv->device, frag, 0,
+		des = skb_frag_dma_map(priv->dma_device, frag, 0,
 				       skb_frag_size(frag),
 				       DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, des))
+		if (dma_mapping_error(priv->dma_device, des))
 			goto dma_map_err;
 
 		stmmac_tso_allocator(priv, des, skb_frag_size(frag),
@@ -4827,9 +4827,9 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	} else {
 		bool last_segment = (nfrags == 0);
 
-		dma_addr = dma_map_single(priv->device, skb->data,
+		dma_addr = dma_map_single(priv->dma_device, skb->data,
 					  nopaged_len, DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, dma_addr))
+		if (dma_mapping_error(priv->dma_device, dma_addr))
 			goto dma_map_err;
 
 		stmmac_set_tx_skb_dma_entry(tx_q, first_entry, dma_addr,
@@ -4878,9 +4878,9 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 
 		desc = stmmac_get_tx_desc(priv, tx_q, entry);
 
-		dma_addr = skb_frag_dma_map(priv->device, frag, 0, frag_size,
-					    DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, dma_addr))
+		dma_addr = skb_frag_dma_map(priv->dma_device, frag, 0,
+					    frag_size, DMA_TO_DEVICE);
+		if (dma_mapping_error(priv->dma_device, dma_addr))
 			goto dma_map_err; /* should reuse desc w/o issues */
 
 		stmmac_set_tx_skb_dma_entry(tx_q, entry, dma_addr, frag_size,
@@ -5190,9 +5190,9 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 
 	tx_desc = stmmac_get_tx_desc(priv, tx_q, entry);
 	if (dma_map) {
-		dma_addr = dma_map_single(priv->device, xdpf->data,
+		dma_addr = dma_map_single(priv->dma_device, xdpf->data,
 					  xdpf->len, DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, dma_addr))
+		if (dma_mapping_error(priv->dma_device, dma_addr))
 			return STMMAC_XDP_CONSUMED;
 
 		buf_type = STMMAC_TXBUF_T_XDP_NDO;
@@ -5201,7 +5201,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 
 		dma_addr = page_pool_get_dma_addr(page) + sizeof(*xdpf) +
 			   xdpf->headroom;
-		dma_sync_single_for_device(priv->device, dma_addr,
+		dma_sync_single_for_device(priv->dma_device, dma_addr,
 					   xdpf->len, DMA_BIDIRECTIONAL);
 
 		buf_type = STMMAC_TXBUF_T_XDP_TX;
@@ -5788,7 +5788,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		if (!skb) {
 			unsigned int pre_len, sync_len;
 
-			dma_sync_single_for_cpu(priv->device, buf->addr,
+			dma_sync_single_for_cpu(priv->dma_device, buf->addr,
 						buf1_len, dma_dir);
 			net_prefetch(page_address(buf->page) +
 				     buf->page_offset);
@@ -5867,7 +5867,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			skb_mark_for_recycle(skb);
 			buf->page = NULL;
 		} else if (buf1_len) {
-			dma_sync_single_for_cpu(priv->device, buf->addr,
+			dma_sync_single_for_cpu(priv->dma_device, buf->addr,
 						buf1_len, dma_dir);
 			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
 					buf->page, buf->page_offset, buf1_len,
@@ -5876,7 +5876,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		}
 
 		if (buf2_len) {
-			dma_sync_single_for_cpu(priv->device, buf->sec_addr,
+			dma_sync_single_for_cpu(priv->dma_device, buf->sec_addr,
 						buf2_len, dma_dir);
 			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
 					buf->sec_page, 0, buf2_len,
@@ -7817,6 +7817,7 @@ static int __stmmac_dvr_probe(struct device *device,
 
 	priv = netdev_priv(ndev);
 	priv->device = device;
+	priv->dma_device = plat_dat->dma_device ? : device;
 	priv->dev = ndev;
 
 	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
@@ -7945,8 +7946,8 @@ static int __stmmac_dvr_probe(struct device *device,
 		priv->dma_cap.host_dma_width = priv->dma_cap.addr64;
 
 	if (priv->dma_cap.host_dma_width) {
-		ret = dma_set_mask_and_coherent(device,
-				DMA_BIT_MASK(priv->dma_cap.host_dma_width));
+		ret = dma_set_mask_and_coherent(priv->dma_device,
+						DMA_BIT_MASK(priv->dma_cap.host_dma_width));
 		if (!ret) {
 			dev_info(priv->device, "Using %d/%d bits DMA host/device width\n",
 				 priv->dma_cap.host_dma_width, priv->dma_cap.addr64);
@@ -7958,7 +7959,8 @@ static int __stmmac_dvr_probe(struct device *device,
 			if (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT))
 				priv->plat->dma_cfg->eame = true;
 		} else {
-			ret = dma_set_mask_and_coherent(device, DMA_BIT_MASK(32));
+			ret = dma_set_mask_and_coherent(priv->dma_device,
+							DMA_BIT_MASK(32));
 			if (ret) {
 				dev_err(priv->device, "Failed to set DMA Mask\n");
 				goto error_hw_init;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
index d7e4db7224b0c..7ba068f1ca88d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
@@ -25,7 +25,7 @@ static int stmmac_xdp_enable_pool(struct stmmac_priv *priv,
 	if (frame_size < ETH_FRAME_LEN + VLAN_HLEN * 2)
 		return -EOPNOTSUPP;
 
-	err = xsk_pool_dma_map(pool, priv->device, STMMAC_RX_DMA_ATTR);
+	err = xsk_pool_dma_map(pool, priv->dma_device, STMMAC_RX_DMA_ATTR);
 	if (err) {
 		netdev_err(priv->dev, "Failed to map xsk pool\n");
 		return err;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 4430b967abdeb..02ae177d5c27d 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -245,6 +245,7 @@ struct plat_stmmacenet_data {
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	struct device_node *phy_node;
 	struct device_node *mdio_node;
+	struct device *dma_device;
 	struct stmmac_dma_cfg *dma_cfg;
 	struct stmmac_safety_feature_cfg *safety_feat_cfg;
 	int clk_csr;
-- 
2.51.0


