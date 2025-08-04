Return-Path: <linux-gpio+bounces-23994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23CB199C2
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 03:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1024F7A78EE
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 01:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC7D1A08A4;
	Mon,  4 Aug 2025 01:07:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B71A927
	for <linux-gpio@vger.kernel.org>; Mon,  4 Aug 2025 01:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754269648; cv=none; b=AQkYnwoeZHR6AxYFNusU+41TKMwp3vlTZMM14hzXYJyb/MxsjpINLur80i+eO8+I/bhqqbvKu7tCXDmbFTU91ujQdipgSIg8SsleRKjc/oWWG5Lr/cVfVAWztji+j6m0wFWgpQHJ2qKQLAnS0bQV6T/jwRydJLLY6n4T4TUXDcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754269648; c=relaxed/simple;
	bh=6cbn6Wu7LpFfawFkfX81dqvhsHHyAE1ccK3U2EJqy4U=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=fb0mf/pst/W1dGZX0MI9gx1UK4sxlIX9DKA9tVZaKbU9X/+If/1M16u/GeuipJg63mWef/IkO5Ine1JPUx546Z1D1v0l5L6aR6v+iGR6Ynps8fP5ZxpffaTb1MVXlFQSKs2+xrqCNvgfOtw9zeRLwyzpUv6drQm1/FcsmzbWxM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 585d258e70cf11f0b29709d653e92f7d-20250804
X-CTIC-Tags:
	HR_CTE_8B, HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE
	HR_FROM_DIGIT_LEN, HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN
	HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS
	HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED
	DN_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD
	AMN_C_TI, AMN_C_BU, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:dd06f271-6704-4778-bff8-cf4869d8816b,IP:10,
	URL:0,TC:0,Content:-5,EDM:25,RT:0,SF:-40,FILE:0,BULK:0,RULE:Release_Ham,AC
	TION:release,TS:-10
X-CID-INFO: VERSION:1.1.45,REQID:dd06f271-6704-4778-bff8-cf4869d8816b,IP:10,UR
	L:0,TC:0,Content:-5,EDM:25,RT:0,SF:-40,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-10
X-CID-META: VersionHash:6493067,CLOUDID:d8ae665269239c54b116cfa857e23723,BulkI
	D:2508040907101FB0SD9U,BulkQuantity:0,Recheck:0,SF:10|24|38|44|66|78|102,T
	C:nil,Content:0|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSI
X-UUID: 585d258e70cf11f0b29709d653e92f7d-20250804
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1724248187; Mon, 04 Aug 2025 09:07:09 +0800
From: Li Jun <lijun01@kylinos.cn>
To: lijun01@kylinos.cn,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2] gpio: aggregator: fix macros coding style error
Date: Mon,  4 Aug 2025 09:07:04 +0800
Message-Id: <20250804010704.12648-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These changes just fix Linux Kernel Coding Style, no functional
improve.

-Macros with complex values should be enclosed in parentheses

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 drivers/gpio/gpio-aggregator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 6f941db02c04..16c1ddc66013 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -247,8 +247,8 @@ struct gpiochip_fwd {
 	unsigned long tmp[];		/* values and descs for multiple ops */
 };
 
-#define fwd_tmp_values(fwd)	&(fwd)->tmp[0]
-#define fwd_tmp_descs(fwd)	(void *)&(fwd)->tmp[BITS_TO_LONGS((fwd)->chip.ngpio)]
+#define fwd_tmp_values(fwd)	(&(fwd)->tmp[0])
+#define fwd_tmp_descs(fwd)	((void *)&(fwd)->tmp[BITS_TO_LONGS((fwd)->chip.ngpio)])
 
 #define fwd_tmp_size(ngpios)	(BITS_TO_LONGS((ngpios)) + (ngpios))
 
-- 
2.25.1


