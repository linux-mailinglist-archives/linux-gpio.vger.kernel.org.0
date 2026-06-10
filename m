Return-Path: <linux-gpio+bounces-38238-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LGg0HUU8KWoWSwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38238-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:28:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C17BF668425
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:28:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=azPn0ung;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38238-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38238-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93BA2313FA0B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BF23EFD02;
	Wed, 10 Jun 2026 10:20:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D8E3D566D
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 10:20:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086849; cv=none; b=eh94QO8T8GbFNsYgRW4xqCwy028QOv1Pdiy4qVIPxaiVZNHMUWBr6ACZZ3EMT9HiQvobgxKHDfpr3CR9O/vy+7adn166WRydXlAAYMvSMvwfAIrx8pLvyoPUwmID5qiiv7VDapeddrn7N0i2p/d+NPX00WkfhO9Z0b6eMT4qjx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086849; c=relaxed/simple;
	bh=B0H2WtJ5TfN7fCTCPJlxSseEixkQNbFgXQ0JnWUQn/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dAfFLbVq4/R8v3OVq1e7So1W7/FrTcB9P7ozu/+o5sIPD+eUwMHFxy+VJid0vNxl4BibvPdB8m7x6vPs7qCLr/0JMf5N3jHR45N+RAScNtwmTSzeYzrsFU0JCSVCMG2+zqZG0mhAe7t2eKUtAm0yahnb041U5qJXV1MCGoKwOYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azPn0ung; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf20f6be6bso51931765ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 03:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086847; x=1781691647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccE2EB2fnzyeaAU6yY7eDAKmvbXrjVPbtb4CUqU9a2E=;
        b=azPn0ungQd+TkcTijZ6rmGHMZX0vjBfyczP1AiU/rRDqoCPcpLitBBmQ+WUXV+xgUs
         POy4BqUwBEfk7hqtH8ja9HgtocK8yjIAsei/VS+T8AFewQ/Rslt8OFsirZAJQrxF9eQW
         hogSASlzT8Qwwblm44ig4bQUwbhhXh+NOP4Xy4cC9yIrc0IlCbqahE/Vz/+1FLHqFe4A
         cU5Q3pumuAxQu6o7M8+oRre50wbe7HNq+S0ezH0oT1xa5ztPrwLXkPoA7zIohpEHjLXy
         H1mhWKSxp+TNj2mEe7dyCCpubDnaQUzfpUMVqQpN7bNX9ok8QvsXX5aHeFC6YoYyzJjU
         BCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086847; x=1781691647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ccE2EB2fnzyeaAU6yY7eDAKmvbXrjVPbtb4CUqU9a2E=;
        b=SPa+t4VurbBa/Crgf9IM0UrjRSNgiRtFv7P+vbVfC/xDY0nmY4ajNXFPwb81I5ZP6B
         LCHbOnTA5RovdW2aFdwBZrmCqnG7LPWbRgJXwXUDkHLKRjB3J0WK7n8C4N7m9LL6vtwJ
         vdVkawdgLcu5PRGHYIaCOFD/qd6tF1rEm6fZjpPB3MPH9s3/S7+NVuX3c2xIp/34LyfW
         aY3ya5l8aJyK2Tr3/GDQA4idMMPHbJScFTeVKrOR1ehqUVpOumTWB7dXZtwwvHwXyjWA
         ku4UeIbmOswYDqWaPNyYSGKAP5rUWhaUzhgQAr5U9NZCFmYuHXqdJWxF+fCCsVi+PoD+
         f36Q==
X-Forwarded-Encrypted: i=1; AFNElJ8T2YYGD+f5UPOBsgrB70bSTLHCyxyqQB7yxGccbGEjuXew4dkqMfPw3B+0awn9Sy5eGbr2S9YjZE4V@vger.kernel.org
X-Gm-Message-State: AOJu0YxA9JlMsKbC4FJbsoEEXDZBcldp3i/Tg1N8waRGbT211wC9k910
	WETWa+Auv1W2+AiTujP4/8JAmJdMd9WyeuqVCiNqZLWxLaVRCyOilAXA
X-Gm-Gg: Acq92OHha5PGTYNUT5/INQ8eOST2PFemCLJF5bGbvaes+hwmfsFaJA1nHScpNNN9P+Z
	Hy78uKNojWT5rMePOsJzLtLcf+GtVlj9S5Qagkm5r9o3YrlX8csthe5jlFTGyKIWGY/F7WP6dyA
	zK6EHU7G+X/bYJAeS86jhHS13gSOI+Z7NzZirqqTd3iBpuP5CR6DXiwYIXOyVaCg+wwCFRK+Vt+
	9horl91zKTCS7lOiJ6+X2dc791bFsPn0fj+uh5t6roT3nmafO5/oNtiKblHPCjAuCQxvVQxR0vJ
	hGxCbwQBfuzz/FTTC96er5mrtYFlwSrnHf6O21Hg5DncAVi6Qrb4fLV8vwA8+dk4/FT4yuPWCjr
	rtV8BKBin4qjglKNtacPBt3si5BxFtwBzz4e9SEYCe2HA2++JPeTWTXe2yrkbgHLEeukLMR+kRR
	OkjFUUAGkfnH5S0BkJ2q/lnVAaz7/xKeZbLtu+cnsPg4z7gDsn6j5l0MQv/TPhcP4os26Y
X-Received: by 2002:a17:903:b0b:b0:2b4:6080:d4d0 with SMTP id d9443c01a7336-2c1e80ec3b7mr273180005ad.22.1781086847357;
        Wed, 10 Jun 2026 03:20:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 02/10] ASoC: mediatek: common: mtk-btcvsd: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:13 +0700
Message-ID: <20260610102021.83273-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38238-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:matthias.bgg@gmail.com,m:lgirdwood@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linusw@kernel.org,m:brgl@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:phucduc.bui@gmail.com,m:matthiasbgg@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C17BF668425

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/common/mtk-btcvsd.c | 81 +++++++++++---------------
 1 file changed, 35 insertions(+), 46 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 5e7e85b4c98a..85cfc602dfd3 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -319,7 +319,6 @@ static int btcvsd_tx_clean_buffer(struct mtk_btcvsd_snd *bt)
 {
 	unsigned int i;
 	unsigned int num_valid_addr;
-	unsigned long flags;
 	enum BT_SCO_BAND band = bt->band;
 
 	/* prepare encoded mute data */
@@ -330,7 +329,7 @@ static int btcvsd_tx_clean_buffer(struct mtk_btcvsd_snd *bt)
 		       table_msbc_silence, SCO_PACKET_180);
 
 	/* write mute data to bt tx sram buffer */
-	spin_lock_irqsave(&bt->tx_lock, flags);
+	guard(spinlock_irqsave)(&bt->tx_lock);
 	num_valid_addr = bt->tx->buffer_info.num_valid_addr;
 
 	dev_info(bt->dev, "%s(), band %d, num_valid_addr %u\n",
@@ -349,7 +348,6 @@ static int btcvsd_tx_clean_buffer(struct mtk_btcvsd_snd *bt)
 					     bt->tx->buffer_info.packet_length,
 					     bt->tx->buffer_info.packet_num);
 	}
-	spin_unlock_irqrestore(&bt->tx_lock, flags);
 
 	return 0;
 }
@@ -365,7 +363,6 @@ static int mtk_btcvsd_read_from_bt(struct mtk_btcvsd_snd *bt,
 	int pv;
 	u8 *src;
 	unsigned int packet_buf_ofs;
-	unsigned long flags;
 	unsigned long connsys_addr_rx, ap_addr_rx;
 
 	connsys_addr_rx = *bt->bt_reg_pkt_r;
@@ -385,7 +382,7 @@ static int mtk_btcvsd_read_from_bt(struct mtk_btcvsd_snd *bt,
 				     bt->rx->temp_packet_buf, packet_length,
 				     packet_num);
 
-	spin_lock_irqsave(&bt->rx_lock, flags);
+	guard(spinlock_irqsave)(&bt->rx_lock);
 	for (i = 0; i < blk_size; i++) {
 		packet_buf_ofs = (bt->rx->packet_w & SCO_RX_PACKET_MASK) *
 				 bt->rx->packet_size;
@@ -403,7 +400,7 @@ static int mtk_btcvsd_read_from_bt(struct mtk_btcvsd_snd *bt,
 		       SCO_CVSD_PACKET_VALID_SIZE);
 		bt->rx->packet_w++;
 	}
-	spin_unlock_irqrestore(&bt->rx_lock, flags);
+
 	return 0;
 }
 
@@ -414,7 +411,6 @@ static int mtk_btcvsd_write_to_bt(struct mtk_btcvsd_snd *bt,
 				  unsigned int blk_size)
 {
 	unsigned int i;
-	unsigned long flags;
 	u8 *dst;
 	unsigned long connsys_addr_tx, ap_addr_tx;
 	bool new_ap_addr_tx = true;
@@ -430,17 +426,17 @@ static int mtk_btcvsd_write_to_bt(struct mtk_btcvsd_snd *bt,
 		return -EIO;
 	}
 
-	spin_lock_irqsave(&bt->tx_lock, flags);
-	for (i = 0; i < blk_size; i++) {
-		memcpy(bt->tx->temp_packet_buf + (bt->tx->packet_size * i),
-		       (bt->tx_packet_buf +
-			(bt->tx->packet_r % SCO_TX_PACKER_BUF_NUM) *
-			bt->tx->packet_size),
-		       bt->tx->packet_size);
+	scoped_guard(spinlock_irqsave, &bt->tx_lock) {
+		for (i = 0; i < blk_size; i++) {
+			memcpy(bt->tx->temp_packet_buf + (bt->tx->packet_size * i),
+			       (bt->tx_packet_buf +
+				(bt->tx->packet_r % SCO_TX_PACKER_BUF_NUM) *
+				bt->tx->packet_size),
+			       bt->tx->packet_size);
 
-		bt->tx->packet_r++;
+			bt->tx->packet_r++;
+		}
 	}
-	spin_unlock_irqrestore(&bt->tx_lock, flags);
 
 	dst = (u8 *)ap_addr_tx;
 
@@ -462,11 +458,11 @@ static int mtk_btcvsd_write_to_bt(struct mtk_btcvsd_snd *bt,
 	if (new_ap_addr_tx) {
 		unsigned int next_idx;
 
-		spin_lock_irqsave(&bt->tx_lock, flags);
-		bt->tx->buffer_info.num_valid_addr++;
-		next_idx = bt->tx->buffer_info.num_valid_addr - 1;
-		bt->tx->buffer_info.bt_sram_addr[next_idx] = ap_addr_tx;
-		spin_unlock_irqrestore(&bt->tx_lock, flags);
+		scoped_guard(spinlock_irqsave, &bt->tx_lock) {
+			bt->tx->buffer_info.num_valid_addr++;
+			next_idx = bt->tx->buffer_info.num_valid_addr - 1;
+			bt->tx->buffer_info.bt_sram_addr[next_idx] = ap_addr_tx;
+		}
 		dev_info(bt->dev, "%s(), new ap_addr_tx = 0x%lx, num_valid_addr %d\n",
 			 __func__, ap_addr_tx,
 			 bt->tx->buffer_info.num_valid_addr);
@@ -701,17 +697,16 @@ static ssize_t mtk_btcvsd_snd_read(struct mtk_btcvsd_snd *bt,
 {
 	ssize_t read_size = 0, read_count = 0, cur_read_idx, cont;
 	unsigned long avail;
-	unsigned long flags;
 	unsigned int packet_size = bt->rx->packet_size;
 
 	while (count) {
-		spin_lock_irqsave(&bt->rx_lock, flags);
-		/* available data in RX packet buffer */
-		avail = (bt->rx->packet_w - bt->rx->packet_r) * packet_size;
+		scoped_guard(spinlock_irqsave, &bt->rx_lock) {
+			/* available data in RX packet buffer */
+			avail = (bt->rx->packet_w - bt->rx->packet_r) * packet_size;
 
-		cur_read_idx = (bt->rx->packet_r & SCO_RX_PACKET_MASK) *
-			       packet_size;
-		spin_unlock_irqrestore(&bt->rx_lock, flags);
+			cur_read_idx = (bt->rx->packet_r & SCO_RX_PACKET_MASK) *
+				       packet_size;
+		}
 
 		if (!avail) {
 			int ret = wait_for_bt_irq(bt, bt->rx);
@@ -749,9 +744,8 @@ static ssize_t mtk_btcvsd_snd_read(struct mtk_btcvsd_snd *bt,
 			return -EFAULT;
 		}
 
-		spin_lock_irqsave(&bt->rx_lock, flags);
-		bt->rx->packet_r += read_size / packet_size;
-		spin_unlock_irqrestore(&bt->rx_lock, flags);
+		scoped_guard(spinlock_irqsave, &bt->rx_lock)
+			bt->rx->packet_r += read_size / packet_size;
 
 		read_count += read_size;
 		count -= read_size;
@@ -778,7 +772,6 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 				    size_t count)
 {
 	int written_size = count, avail, cur_write_idx, write_size, cont;
-	unsigned long flags;
 	unsigned int packet_size = bt->tx->packet_size;
 
 	/*
@@ -794,14 +787,14 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 	bt->tx->buf_data_equivalent_time *= 1000;
 
 	while (count) {
-		spin_lock_irqsave(&bt->tx_lock, flags);
-		/* free space of TX packet buffer */
-		avail = bt->tx->buf_size -
-			(bt->tx->packet_w - bt->tx->packet_r) * packet_size;
+		scoped_guard(spinlock_irqsave, &bt->tx_lock) {
+			/* free space of TX packet buffer */
+			avail = bt->tx->buf_size -
+				(bt->tx->packet_w - bt->tx->packet_r) * packet_size;
 
-		cur_write_idx = (bt->tx->packet_w % SCO_TX_PACKER_BUF_NUM) *
-				packet_size;
-		spin_unlock_irqrestore(&bt->tx_lock, flags);
+			cur_write_idx = (bt->tx->packet_w % SCO_TX_PACKER_BUF_NUM) *
+					packet_size;
+		}
 
 		if (!avail) {
 			int ret = wait_for_bt_irq(bt, bt->tx);
@@ -838,9 +831,8 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 			return -EFAULT;
 		}
 
-		spin_lock_irqsave(&bt->tx_lock, flags);
-		bt->tx->packet_w += write_size / packet_size;
-		spin_unlock_irqrestore(&bt->tx_lock, flags);
+		scoped_guard(spinlock_irqsave, &bt->tx_lock)
+			bt->tx->packet_w += write_size / packet_size;
 		count -= write_size;
 	}
 
@@ -985,7 +977,6 @@ static snd_pcm_uframes_t mtk_pcm_btcvsd_pointer(
 	int hw_packet_ptr;
 	int packet_diff;
 	spinlock_t *lock;	/* spinlock for bt stream control */
-	unsigned long flags;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		lock = &bt->tx_lock;
@@ -995,7 +986,7 @@ static snd_pcm_uframes_t mtk_pcm_btcvsd_pointer(
 		bt_stream = bt->rx;
 	}
 
-	spin_lock_irqsave(lock, flags);
+	guard(spinlock_irqsave)(lock);
 	hw_packet_ptr = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
 			bt->tx->packet_r : bt->rx->packet_w;
 
@@ -1018,8 +1009,6 @@ static snd_pcm_uframes_t mtk_pcm_btcvsd_pointer(
 
 	bt_stream->prev_frame = frame;
 
-	spin_unlock_irqrestore(lock, flags);
-
 	return frame;
 }
 
-- 
2.43.0


