Return-Path: <linux-gpio+bounces-35957-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CACCOQfO9GkDFAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35957-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 18:00:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD3E4ADD6F
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 18:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48FB63076F72
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2026 15:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990FA3D902B;
	Fri,  1 May 2026 15:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="U/FsVG6P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1C93D7D91
	for <linux-gpio@vger.kernel.org>; Fri,  1 May 2026 15:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650888; cv=none; b=a5vgU1JpZM+gUYPq2KUH+4LBJHhQiyp585QeibGZZEIMMGWmiTb6VSgM6/7ojMw8Ic8PgWAMvYBOxZVagaqdzOeET6nmuGdSVZHjtThJgxbyl3Pp6wu8OIEb8nL9sL8nZyQyTrSLTwZ4RBd02Y+MV6l9gIgXKab5SZN+RyARy+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650888; c=relaxed/simple;
	bh=rWJMdH+guxvVRg/fYfPqNZhV8vkxgoYK2GCfMJpBrRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkyOm5Zfc85eV/+x1t43/ZAS9+v1J0/qkcrRw/PDShZ1sYrcFMLBzn/+m9stm2Vo07cybEEc32H5IN65mVqxDb44/JfvboBp6RMnNWvCmrIm2p3QDpFoXafz45cg01FRiME7hSDSoxolyhIrO63R8Xfwj+tK/HKIMXXUHlpcuDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=U/FsVG6P; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50e5ad864a6so21283301cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 May 2026 08:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650886; x=1778255686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJZ0RqgIk8/DP02YY4aEMI6Gbsvdjs3yNWLkzeFClOw=;
        b=U/FsVG6PzyZt6PaiHwol1aUL60lqQbkzo/5IRLlwPh/F+u9Q6oJpp406tWYXgCB5xq
         2sOnKYSK1tZTXw1E7WCFzXPVm2984ZKyN2dKc2NcleWjXoKRc67HNhuPjRWkR5c/HH5D
         uOXdYVzfHdC5rkwrDRvQ4VaZyRh/McRSXU0l5usj1yR8wLlrs/r1gx2KZvNrztV3Sxbs
         1WhLNM4+MITbHZRfcCAa9dM8esWiT4DIbxkPmd1n/WD2sDyc4NJzhH/4ALY7goLcCPUx
         3eOQm8sSfdHkdcl8Oj6UFDiE8EP7YAuN1Jrd6S9c5W+2SKmVTaCFJ6n7AfqrjeiIb8SM
         x++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650886; x=1778255686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lJZ0RqgIk8/DP02YY4aEMI6Gbsvdjs3yNWLkzeFClOw=;
        b=WrHVAmPWFSZ7Ijc8lVItAaagqG+eRgpLD1ui5b1yF6ZlospQ94teX/xm/u0hwK2cyF
         3RDLV3PgxXLLjyD4YAAuVz8ni/L2AZaZWKhdbgC75bV6ZrRXKmiG9jpO7R+BPAjhvZj/
         o13o9KHbI4ZIDXiPJE0ygT9pI2+ZvvTigaAFaOMtsEzdvrDEr5uMvOSyIaaQ/B4IuiYi
         bw9jcGGOppTUGpAxUjkcZmjMRBRp3m+DwSLyEV/3/F0+2QeuN5xwTmHfClGhvVFmcbLb
         /QuPaOI0pQq73UP5tn/kZpA1G8XuO+nFcy2gjzkHQjnLqI3dtNACJLZvvm+1R5j6KdD/
         YsZg==
X-Forwarded-Encrypted: i=1; AFNElJ9uRocsJe4PPY7IQUwWZ1Eyv0iS3A8EUO5QPTFHw6UboCyBDpk2OFPFrTnNrBFz2xuqoaJClToLcCyV@vger.kernel.org
X-Gm-Message-State: AOJu0YyqnaWMQcHQY7jx29Spxuv6f7PO9qRiolcfqszxvf+Yo9BCtDyw
	FPb1qbAvyPhrMloPdPxAaPGYyScdNwlBr88gd/QOHGaOwUEffN3XN8S8+RAWN6wDB8M=
X-Gm-Gg: AeBDievKL2PdL3HdaL7eNTRY3DDbr+Nywp1QCfz+w6b41MJ6Qgbfb5JjzscFxsXmhmo
	f6AV00Xzg8+ZpW7vNYBfxHWavRKJ632lvVI17OZMw2wzEIHzpLgSTMaZ+NxOAGolnwBGIv7Rgdr
	nX7X10C0jeXHGUre6g2eRkcjS/fFxDIg/s6ONnOuz04CEyW+whAwBp5tPdVDdR9Fv3hIW4FYiQ/
	//FcSWIPue9grQNchqAD8cVROuNw4fVmJzP9E0ZDxVsy1xUm8XItDDM0RKZw1C0l+lBx99h6nR/
	frIn5LP532fW9FS4kpHuitnMFYExamV3c9vhtJQvTTtFGlRWDNgdXyhrFml8Cx9Pdr1guEIsQY/
	jYXNJuDoEDwyiaj5KU3+7xaUdvMsh9q8QOWJ5rpuo2ZYgEsB7PKc6XlphDOyzlO61CQnPmf9L9U
	yS8LxzN93FMaYS4dwcbJsUaCTqYNWW/R4zxBjArwoAQIwkMneMNFUX3zxtxJu+7mZfMoHq484L6
	aqgcg==
X-Received: by 2002:ac8:5d07:0:b0:50b:6b21:2bf7 with SMTP id d75a77b69052e-5102a940d0amr119383461cf.0.1777650884691;
        Fri, 01 May 2026 08:54:44 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:54:44 -0700 (PDT)
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
Subject: [PATCH net-next 05/12] net: stmmac: dwxgmac2: Add multi MSI interrupt mode
Date: Fri,  1 May 2026 10:54:13 -0500
Message-ID: <20260501155421.3329862-6-elder@riscstar.com>
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
X-Rspamd-Queue-Id: 7DD3E4ADD6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35957-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,riscstar.com:mid,riscstar.com:email,riscstar-com.20251104.gappssmtp.com:dkim]

From: Daniel Thompson <daniel@riscstar.com>

Currently there are no XGMAC platforms integrated using the multi MSI
interrupt mode. In other words no existing driver sets both
DWMAC_CORE_XGMAC and STMMAC_FLAG_MULTI_MSI_EN.

In order to support systems that do enable both options (such as the
Toshiba TC9564 whose driver is currently being developed) we need to
add logic to the XGMAC DMA callbacks. Happily we can simply
replicate similar code from GMAC4. Let's do that!

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     | 2 ++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 51943705a2b03..9b0b5cc619556 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -320,6 +320,8 @@
 /* DMA Registers */
 #define XGMAC_DMA_MODE			0x00003000
 #define XGMAC_SWR			BIT(0)
+#define XGMAC_INTM_MASK			GENMASK(13, 12)
+#define XGMAC_INTM_MODE1		0x1
 #define XGMAC_DMA_SYSBUS_MODE		0x00003004
 #define XGMAC_WR_OSR_LMT		GENMASK(29, 24)
 #define XGMAC_RD_OSR_LMT		GENMASK(21, 16)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 03437f1cf3df3..a84601ac32153 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -31,6 +31,14 @@ static void dwxgmac2_dma_init(void __iomem *ioaddr,
 		value |= XGMAC_EAME;
 
 	writel(value, ioaddr + XGMAC_DMA_SYSBUS_MODE);
+
+	value = readl(ioaddr + XGMAC_DMA_MODE);
+
+	if (dma_cfg->multi_msi_en)
+		value = u32_replace_bits(value, XGMAC_INTM_MODE1,
+					 XGMAC_INTM_MASK);
+
+	writel(value, ioaddr + XGMAC_DMA_MODE);
 }
 
 static void dwxgmac2_dma_init_chan(struct stmmac_priv *priv,
-- 
2.51.0


