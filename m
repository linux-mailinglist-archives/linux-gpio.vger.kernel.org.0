Return-Path: <linux-gpio+bounces-33211-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPSDKz4xsmmzJQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33211-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 04:21:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B7A26CC18
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 04:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CE6C302F38E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 03:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8A038836A;
	Thu, 12 Mar 2026 03:20:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CBD388E68
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 03:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285607; cv=none; b=iSJUcAZIuOVohrkFSVmNlwQlLcqLnIw5FBiUh1WfyzGo2qrTm2uKih7QXJkK3i+DB3Qe2KrSHfD3WViv/PJ7Hecx8MYdvkz5NjrFeZC2dEUaMHjbeBi1KEZCFCygQc1H02/HukWtd0G7VbyC0ArRiTo/Qcatg9/Unhe/9+mtH30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285607; c=relaxed/simple;
	bh=nUIFkJOcDm1Y7555ix05egCMXdeOd7itfivpo2q26Kc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rXIOKnPqfk9Dz9N3w0snQhpvOnWeUQMb9fPHcDhhs7maM4AgPTulPkrqbWZnb/TKIEeHOb2uMRVoZpMEmUlR1qoHgI1srYIjIHk/gact4eDAZCxhLgd6rk26Z2kReicfEd28BUiwGFgE7kNjjkK0z82E9ZPlSR9avG+03HPGM3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowABnhdzdMLJpfaBqCg--.11995S2;
	Thu, 12 Mar 2026 11:19:57 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: linusw@kernel.org
Cc: eleanor.lin@realtek.com,
	bartosz.golaszewski@oss.qualcomm.com,
	tychang@realtek.com,
	linux-gpio@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] pinctrl: realtek: Fix error check for devm_platform_ioremap_resource()
Date: Thu, 12 Mar 2026 11:18:20 +0800
Message-Id: <20260312031820.3007962-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABnhdzdMLJpfaBqCg--.11995S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw48Jw1rtFykur4xJryrWFg_yoWDKrX_ua
	y09ry3JFyUCw1vqr1qkw4SvFyIyF4qgr1kKwnIqFyakryDXw17ury8Wr4DWas7WrsFyry8
	WryUXrZ3Z34fAjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbskFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
	IFyTuYvjfUbiSdDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33211-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[nichen@iscas.ac.cn,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.958];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: 13B7A26CC18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace NULL check with IS_ERR() for devm_platform_ioremap_resource()
return value. Use dev_err_probe() for error handling to maintain
consistency with the rest of the probe function.

Fixes: b7f698b22b8b ("pinctrl: realtek: Switch to use devm functions")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/pinctrl/realtek/pinctrl-rtd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 60dfb39bc986..7836a15afe44 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -574,8 +574,9 @@ int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_des
 		return -ENOMEM;
 
 	data->base = devm_platform_ioremap_resource(pdev, 0);
-	if (!data->base)
-		return -ENOMEM;
+	if (IS_ERR(data->base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->base),
+				     "Failed to ioremap resource\n");
 
 	data->dev = &pdev->dev;
 	data->info = desc;
-- 
2.25.1


