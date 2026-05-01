Return-Path: <linux-gpio+bounces-35958-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKAIDHLN9GkDFAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35958-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 17:57:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C339B4ADCDD
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 17:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B991F30231C2
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2026 15:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528F13DBD63;
	Fri,  1 May 2026 15:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="OrjKZ4BA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023153D8900
	for <linux-gpio@vger.kernel.org>; Fri,  1 May 2026 15:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650891; cv=none; b=BtafKtV2q2YEE0xb6hjT7dNrrkdaBSgDlbeSFDxiG+0mG2ATaDkNYpd74LrGQwCPTNionVjSwwwEKdJ/JhS6E7TG58IIJYPDpmV1Ce6KS6hD7NGJFiJ/xk67TnU9xsZyjWv6DCxvDBhfeRscQ/jHEcSY9ha1Kw9e+OA0coEb/ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650891; c=relaxed/simple;
	bh=9daJEeYnL/520gIUs2ya+tNWpekA/4sc3weLpZydFsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcTYCMeRT/QTvLNowtAykYH3k3dsMIqxjRat+IK0LxMbUJBJpg0AVpJchxElH1mWPB3Ki5VXF6KwsEggIp6T9BkrBeRCBssaKIA0jlcJnS2UoJfgESek1rho1SWdBYmNBZiYokF9Dj1fiKT39KlAIKVLWUydbW4+s2H/5oYLZXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=OrjKZ4BA; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8b5cda2dab9so3445376d6.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 May 2026 08:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650888; x=1778255688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjvnjhHrTVfCoXWYYCjuP2ueQSiOCln/+g460j3fdpQ=;
        b=OrjKZ4BAjy3Ftg9XlHRlEl9gBtqn2ck5LmClDYn6M1br5cggYvJA5YFATjlgPYkBIp
         B2/iCfj61qsYpAgBmrmvpMEJ2yV0S6FTM9JwcpxWhvKgEtL7vtU8aLYcgRf+aozQ/xDk
         j5ms8JvOqz+txUikawOUcyd6j+2cJjPnfS3Lq+7TaGbkmF2rxE7pxtpIZO1A2pXfBiVJ
         Oq+cFL6Ujnh5rLfCvN9FN5xObTvDQWaNLOAPz2MSvCtSTjSm8xKgpBAghSFrEmt0kM5h
         913a6wO6GcnHWkC9Vnr9bzv8E4NcGb6ODo49+q7z8oqCFIvxuBLQJdoC1xyo4PCXhGDN
         nRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650888; x=1778255688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IjvnjhHrTVfCoXWYYCjuP2ueQSiOCln/+g460j3fdpQ=;
        b=Slb8mXFUcA8JTYVFFhKEo2nNPxT6C0rYMq+LcmLjDdqo+pGa/9BfshjLPx7lJjhn7C
         1QMS+uxx9duLJP2LEZLUrt8Y9ikEcqFiMTWU6rQQ72CNgNgx3iEQegrRVFK981dCKtAE
         u6JxMdvglFEz8Mvzh2WJWPzY66vALmcvlbNjx6koC3vi5HZH1shH+PD8irmRZOzAVZWQ
         48PNwrj8w8pyfsLLYLx5vgsJMGC2/MDdYkQxKOTeAlrIchzOhnR82NWKDMBWhHIxhhY+
         VkaYrNadOEE/kziVrvk8MRHROfEpDhoAjjRDYtZq+URyOsNLFY6xKUVAoNjZ+5yEwVUV
         UhFA==
X-Forwarded-Encrypted: i=1; AFNElJ+14Z7Yxh/qL/S/R1YAegLJq+MQrU5MIpYll693CBFTWybE8O7ZOkd7Qojjh5XHeWKZVT150UvDej1T@vger.kernel.org
X-Gm-Message-State: AOJu0Yxedss+WpNBMnaa6FEx7Xq6gh7/J7kSWSs3+NbhYci0trMeYKhp
	r8cNuphcdAjUdcP3HH7qewd79luifNvQ5vPHhZxUvKVuR1yrASzBZ/lw58XWrOel5WY=
X-Gm-Gg: AeBDiet+0AJlZtMdnpUqSUMmbVdyxevZpSg9qBqRXd2NIRRpsWrv0yZsATVxOv4iC1S
	PQw8js4BJqjZl674PXqyN4W5tdqwsAQR1EjGcJ5uc0VmG5PU+qgHm2sopByXH2L030Dujs01AHs
	ztYc5QMb6aPTS2uEBsWqjx4Lmc2C7aeFH3vtAm2qBTOEOfwb3MRxb34iLWiCvm9VFwAJjFbA/ga
	vYSDGiPNyM2Gsbfe8Wah6ix1zp1XCs9fFJqCEDk268ECAPRYSC4wMwSwqgzf8q5FF0RVkK9flOj
	AvMJioMM0iM/zMfF9WvI6UXtDSRZmhIgx3j2iFEOQloo2iLl6KQOAaRM4Lg3k9FehvotuhVSXW/
	Muj7XXQOCCmycQkLQ6chtMGhIGLnLpYUyyI1G/kRksfvfXua8LPt8g/+8/50W75HUWoETfbSnMY
	iGNs1x6/xJkqQPCwynz1yDlmR4D2EeHzonx48yIKDjBPOlAYLMKjjQFayp9UQ1aHE7L0erxWs5H
	WAWQQ==
X-Received: by 2002:a05:6214:3d12:b0:899:fdeb:6ace with SMTP id 6a1803df08f44-8b400081541mr103035466d6.23.1777650887865;
        Fri, 01 May 2026 08:54:47 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:54:47 -0700 (PDT)
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
Cc: Daniel Thompson <daniel@riscstar.com>,
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
	matthew.gerlach@altera.com,
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
Subject: [PATCH net-next 06/12] net: stmmac: dwxgmac2: Add XGMAC 3.01a support
Date: Fri,  1 May 2026 10:54:14 -0500
Message-ID: <20260501155421.3329862-7-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260501155421.3329862-1-elder@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C339B4ADCDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35958-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_GT_50(0.00)[50];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar-com.20251104.gappssmtp.com:dkim,riscstar.com:mid,riscstar.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

From: Daniel Thompson <daniel@riscstar.com>

XGMAC 2.x and 3.x are architecturally very similar.  That means that
for everything except one erratum we can simply use the XGMAC 2.x
callback functions in the stmmac_dma_ops structure.

Only the set_rx_ring_len callback is specific to XGMAC 3.01.  It
limits the number of outstanding write requests that can be serviced
per DMA.

The other erratum addressed in this patch is simply a comment to
ensure that a feature that stmmac doesn't currently use is not enabled
without contemplating the errata.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    | 52 +++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 9b0b5cc619556..bcf59ad8a1939 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -374,6 +374,8 @@
 #define XGMAC_DMA_CH_RxDESC_TAIL_LPTR(x)	(0x0000312c + (0x80 * (x)))
 #define XGMAC_DMA_CH_TxDESC_RING_LEN(x)		(0x00003130 + (0x80 * (x)))
 #define XGMAC_DMA_CH_RxDESC_RING_LEN(x)		(0x00003134 + (0x80 * (x)))
+#define XGMAC_OWRQ			GENMASK(25, 24)
+#define XGMAC_RDRL			GENMASK(15, 0)
 #define XGMAC_DMA_CH_INT_EN(x)		(0x00003138 + (0x80 * (x)))
 #define XGMAC_NIE			BIT(15)
 #define XGMAC_AIE			BIT(14)
@@ -463,6 +465,7 @@
 extern const struct stmmac_ops dwxgmac210_ops;
 extern const struct stmmac_ops dwxlgmac2_ops;
 extern const struct stmmac_dma_ops dwxgmac210_dma_ops;
+extern const struct stmmac_dma_ops dwxgmac301_dma_ops;
 extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
 
 #endif /* __STMMAC_DWXGMAC2_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index a84601ac32153..dc2897e9931d1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -38,6 +38,14 @@ static void dwxgmac2_dma_init(void __iomem *ioaddr,
 		value = u32_replace_bits(value, XGMAC_INTM_MODE1,
 					 XGMAC_INTM_MASK);
 
+	/*
+	 * A friendly warning to future adventurers. If Descriptor Posted
+	 * Write support, which is off by default, is ever enabled then be sure
+	 * to make it optional. This is required by errata for at least XGMAC
+	 * 3.01A... and the XGMAC 2.x and 3.x are architecturally similar so we
+	 * use dwxgmac2 support for the 3.x family as well.
+	 */
+
 	writel(value, ioaddr + XGMAC_DMA_MODE);
 }
 
@@ -490,6 +498,20 @@ static void dwxgmac2_set_rx_ring_len(struct stmmac_priv *priv,
 	writel(len, ioaddr + XGMAC_DMA_CH_RxDESC_RING_LEN(chan));
 }
 
+static void dwxgmac301_set_rx_ring_len(struct stmmac_priv *priv,
+				       void __iomem *ioaddr, u32 len, u32 chan)
+{
+	u32 val = FIELD_PREP(XGMAC_RDRL, len);
+
+	/*
+	 * Reduce the number of outstanding write requests to 3 (from default
+	 * of 4). This is an errata workaround for XGMAC 3.01a.
+	 */
+	val |= FIELD_PREP(XGMAC_OWRQ, 3);
+
+	writel(val, ioaddr + XGMAC_DMA_CH_RxDESC_RING_LEN(chan));
+}
+
 static void dwxgmac2_set_tx_ring_len(struct stmmac_priv *priv,
 				     void __iomem *ioaddr, u32 len, u32 chan)
 {
@@ -619,3 +641,33 @@ const struct stmmac_dma_ops dwxgmac210_dma_ops = {
 	.enable_sph = dwxgmac2_enable_sph,
 	.enable_tbs = dwxgmac2_enable_tbs,
 };
+
+const struct stmmac_dma_ops dwxgmac301_dma_ops = {
+	.reset = dwxgmac2_dma_reset,
+	.init = dwxgmac2_dma_init,
+	.init_chan = dwxgmac2_dma_init_chan,
+	.init_rx_chan = dwxgmac2_dma_init_rx_chan,
+	.init_tx_chan = dwxgmac2_dma_init_tx_chan,
+	.axi = dwxgmac2_dma_axi,
+	.dump_regs = dwxgmac2_dma_dump_regs,
+	.dma_rx_mode = dwxgmac2_dma_rx_mode,
+	.dma_tx_mode = dwxgmac2_dma_tx_mode,
+	.enable_dma_irq = dwxgmac2_enable_dma_irq,
+	.disable_dma_irq = dwxgmac2_disable_dma_irq,
+	.start_tx = dwxgmac2_dma_start_tx,
+	.stop_tx = dwxgmac2_dma_stop_tx,
+	.start_rx = dwxgmac2_dma_start_rx,
+	.stop_rx = dwxgmac2_dma_stop_rx,
+	.dma_interrupt = dwxgmac2_dma_interrupt,
+	.get_hw_feature = dwxgmac2_get_hw_feature,
+	.rx_watchdog = dwxgmac2_rx_watchdog,
+	.set_rx_ring_len = dwxgmac301_set_rx_ring_len,
+	.set_tx_ring_len = dwxgmac2_set_tx_ring_len,
+	.set_rx_tail_ptr = dwxgmac2_set_rx_tail_ptr,
+	.set_tx_tail_ptr = dwxgmac2_set_tx_tail_ptr,
+	.enable_tso = dwxgmac2_enable_tso,
+	.qmode = dwxgmac2_qmode,
+	.set_bfsize = dwxgmac2_set_bfsize,
+	.enable_sph = dwxgmac2_enable_sph,
+	.enable_tbs = dwxgmac2_enable_tbs,
+};
-- 
2.51.0


