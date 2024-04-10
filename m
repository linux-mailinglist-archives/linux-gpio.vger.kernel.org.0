Return-Path: <linux-gpio+bounces-5310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A498A0076
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 21:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D53A28B438
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 19:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E68918131D;
	Wed, 10 Apr 2024 19:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FBDvC7fv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752CA1802CF
	for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 19:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712776616; cv=none; b=bv7e7taqTS+hUcwrtgcfAf7W1ZEeKZcuPg7z4vNlPr/UNqf0ifttVdNwV+7EOIoqKmCXTimlroHAQB0h5vBhqg+PbxAEAxSkIusD0yrJW+kSt+QGTRYNyC0BcCCH9UfA40Esu8Uta8uL8/wRXkJ/tCHURlXsNYJJQsmbgteKDwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712776616; c=relaxed/simple;
	bh=ivlMYY6AzOZUJlvkVWHauBz3wph8BExTRnucbbUpw0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JPB++Wmo1iiBP2KkIirrC3+OwDquD5+b4inz98jmkdwkaChp19sSyldUhUsPa7xeCukFrXCU3zWOZ6K9lnMK5TpESvQazKZjgZJXPQgwK3AyLvEDvOEk9jmR4j2wJJraxqLnd9TESSwBh/RPTKFzXLYcT002giZTOs5dNPobM9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FBDvC7fv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712776613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ewjbw/5mXSsmIn+YMrHgNyJzQu4MuRPXY2oagVZzVVw=;
	b=FBDvC7fvatDxa5Fx3Av2EpQh3dLWstXnk9HiMlCZb81uE7eCa573KmOJEnqbMHwW3KqZrG
	LN+tRcAhKRCmE7FkCNUSiVJCRrG0Z1G/3wJNxb/yRtDMcNgc3wCeNSUuJ7hqstJ1kSzCGa
	KyCoS4TLg/GOKolHt4i8/fp03ePlWpA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-cbpnlCmjOmykRZEwAndp6A-1; Wed, 10 Apr 2024 15:16:48 -0400
X-MC-Unique: cbpnlCmjOmykRZEwAndp6A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B164802CAF;
	Wed, 10 Apr 2024 19:16:47 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 74146444350;
	Wed, 10 Apr 2024 19:16:46 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 2/6] mmc: sdhci: Add support for "Tuning Error" interrupts
Date: Wed, 10 Apr 2024 21:16:35 +0200
Message-ID: <20240410191639.526324-3-hdegoede@redhat.com>
In-Reply-To: <20240410191639.526324-1-hdegoede@redhat.com>
References: <20240410191639.526324-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

From: Adrian Hunter <adrian.hunter@intel.com>

Most Bay Trail devices do not enable UHS modes for the external sdcard slot
the Lenovo Yoga Tablet 2 830 / 1050 and Lenovo Yoga Tablet 2 Pro 1380 (8",
10" and 13") models however do enable this.

Using a UHS cards in these tablets results in errors like this one:

[  225.272001] mmc2: Unexpected interrupt 0x04000000.
[  225.272024] mmc2: sdhci: ============ SDHCI REGISTER DUMP ===========
[  225.272034] mmc2: sdhci: Sys addr:  0x0712c400 | Version:  0x0000b502
[  225.272044] mmc2: sdhci: Blk size:  0x00007200 | Blk cnt:  0x00000007
[  225.272054] mmc2: sdhci: Argument:  0x00000000 | Trn mode: 0x00000023
[  225.272064] mmc2: sdhci: Present:   0x01e20002 | Host ctl: 0x00000016
[  225.272073] mmc2: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
[  225.272082] mmc2: sdhci: Wake-up:   0x00000000 | Clock:    0x00000107
[  225.272092] mmc2: sdhci: Timeout:   0x0000000e | Int stat: 0x00000001
[  225.272101] mmc2: sdhci: Int enab:  0x03ff000b | Sig enab: 0x03ff000b
[  225.272110] mmc2: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000001
[  225.272119] mmc2: sdhci: Caps:      0x076864b2 | Caps_1:   0x00000004
[  225.272129] mmc2: sdhci: Cmd:       0x00000c1b | Max curr: 0x00000000
[  225.272138] mmc2: sdhci: Resp[0]:   0x00000c00 | Resp[1]:  0x00000000
[  225.272147] mmc2: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000900
[  225.272155] mmc2: sdhci: Host ctl2: 0x0000000c
[  225.272164] mmc2: sdhci: ADMA Err:  0x00000003 | ADMA Ptr: 0x0712c200
[  225.272172] mmc2: sdhci: ============================================

which results in IO errors leading to issues accessing the sdcard.

0x04000000 is a so-called "Tuning Error" which sofar the SDHCI driver
does not support / enable. Modify the IRQ handler to process these.

This fixes UHS microsd cards not working with these tablets.

Link: https://lore.kernel.org/r/199bb4aa-c6b5-453e-be37-58bbf468800c@intel.com
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mmc/host/sdhci.c | 10 ++++++++--
 drivers/mmc/host/sdhci.h |  3 ++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index c79f73459915..746f4cf7ab03 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -3439,12 +3439,18 @@ static void sdhci_data_irq(struct sdhci_host *host, u32 intmask)
 		host->data->error = -EILSEQ;
 		if (!mmc_op_tuning(SDHCI_GET_CMD(sdhci_readw(host, SDHCI_COMMAND))))
 			sdhci_err_stats_inc(host, DAT_CRC);
-	} else if ((intmask & SDHCI_INT_DATA_CRC) &&
+	} else if ((intmask & (SDHCI_INT_DATA_CRC | SDHCI_INT_TUNING_ERROR)) &&
 		SDHCI_GET_CMD(sdhci_readw(host, SDHCI_COMMAND))
 			!= MMC_BUS_TEST_R) {
 		host->data->error = -EILSEQ;
 		if (!mmc_op_tuning(SDHCI_GET_CMD(sdhci_readw(host, SDHCI_COMMAND))))
 			sdhci_err_stats_inc(host, DAT_CRC);
+		if (intmask & SDHCI_INT_TUNING_ERROR) {
+			u16 ctrl2 = sdhci_readw(host, SDHCI_HOST_CONTROL2);
+
+			ctrl2 &= ~SDHCI_CTRL_TUNED_CLK;
+			sdhci_writew(host, ctrl2, SDHCI_HOST_CONTROL2);
+		}
 	} else if (intmask & SDHCI_INT_ADMA_ERROR) {
 		pr_err("%s: ADMA error: 0x%08x\n", mmc_hostname(host->mmc),
 		       intmask);
@@ -3979,7 +3985,7 @@ bool sdhci_cqe_irq(struct sdhci_host *host, u32 intmask, int *cmd_error,
 	} else
 		*cmd_error = 0;
 
-	if (intmask & (SDHCI_INT_DATA_END_BIT | SDHCI_INT_DATA_CRC)) {
+	if (intmask & (SDHCI_INT_DATA_END_BIT | SDHCI_INT_DATA_CRC | SDHCI_INT_TUNING_ERROR)) {
 		*data_error = -EILSEQ;
 		if (!mmc_op_tuning(SDHCI_GET_CMD(sdhci_readw(host, SDHCI_COMMAND))))
 			sdhci_err_stats_inc(host, DAT_CRC);
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index a20864fc0641..957c7a917ffb 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -158,6 +158,7 @@
 #define  SDHCI_INT_BUS_POWER	0x00800000
 #define  SDHCI_INT_AUTO_CMD_ERR	0x01000000
 #define  SDHCI_INT_ADMA_ERROR	0x02000000
+#define  SDHCI_INT_TUNING_ERROR	0x04000000
 
 #define  SDHCI_INT_NORMAL_MASK	0x00007FFF
 #define  SDHCI_INT_ERROR_MASK	0xFFFF8000
@@ -169,7 +170,7 @@
 		SDHCI_INT_DATA_AVAIL | SDHCI_INT_SPACE_AVAIL | \
 		SDHCI_INT_DATA_TIMEOUT | SDHCI_INT_DATA_CRC | \
 		SDHCI_INT_DATA_END_BIT | SDHCI_INT_ADMA_ERROR | \
-		SDHCI_INT_BLK_GAP)
+		SDHCI_INT_BLK_GAP | SDHCI_INT_TUNING_ERROR)
 #define SDHCI_INT_ALL_MASK	((unsigned int)-1)
 
 #define SDHCI_CQE_INT_ERR_MASK ( \
-- 
2.44.0


