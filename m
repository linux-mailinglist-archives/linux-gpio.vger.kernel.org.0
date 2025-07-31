Return-Path: <linux-gpio+bounces-23910-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DE5B16BFE
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 08:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DFF3164E3F
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 06:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4CB24110F;
	Thu, 31 Jul 2025 06:21:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2D3190692
	for <linux-gpio@vger.kernel.org>; Thu, 31 Jul 2025 06:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753942911; cv=none; b=oFlY3M+tFA0E23yWCQjDmYQJC5fUBSJfvZFPGTZLsUAwGP0vlsdEMNhmotitfJL6c67+oywQImvxAj2zaV/MUlXxKfJRff3RFMPKyetFTyp+AgYufTESsLUJ0m646HeE89KyZLHb5//CwLcB6dqmNUV4o4bSFAce302VKqU2wB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753942911; c=relaxed/simple;
	bh=6cbn6Wu7LpFfawFkfX81dqvhsHHyAE1ccK3U2EJqy4U=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=W8/ViD7bIAsctxoteHm9lzQWcZzbJMQtIZ2hxrBaTTbYBATfJdwgE77YEH7S/Wk9cz6C9sOdFAaQf+AY+NZRZx6W4TRdc3avJsxgKlKi18i72+5DYmhuvVCFyMsH5K13ZZMRYLz+Q/uiHPXbc7+GerPZEhq+HT5QepPO6oxX0fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9f52b3606dd611f0b29709d653e92f7d-20250731
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:5fe71995-2c4e-49ba-8432-da159e0ae216,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:6493067,CLOUDID:57868668d7948ada487b88d0e40343fe,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:1,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9f52b3606dd611f0b29709d653e92f7d-20250731
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 218097651; Thu, 31 Jul 2025 14:21:41 +0800
From: Li Jun <lijun01@kylinos.cn>
To: lijun01@kylinos.cn,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: fix macros coding style error
Date: Thu, 31 Jul 2025 14:21:29 +0800
Message-Id: <20250731062129.572912-1-lijun01@kylinos.cn>
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


