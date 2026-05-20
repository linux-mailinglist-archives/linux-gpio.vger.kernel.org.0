Return-Path: <linux-gpio+bounces-37192-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OQ6FHmLDWpKywUAu9opvQ
	(envelope-from <linux-gpio+bounces-37192-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 12:22:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F4B58BAB5
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 12:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B4163061095
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 10:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26BB3D75C6;
	Wed, 20 May 2026 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="znyVmUPw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF3A39C65F;
	Wed, 20 May 2026 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272261; cv=none; b=jjBfrDE66FJn9vIA+0kkn8T2xVlG5uO36BRlRhI4p7/YYSclmXnLUzLWs5FC7Os+8Wst89mWuJecZLLP0WsiQGdj3RTMZBWum2GdC9Z8Pe86XlZ7ABiYq35QE6kaRIV6PCtc23OSLOpIU5gCPKEdCAnuvZxi6aSTpq4kXiJYQm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272261; c=relaxed/simple;
	bh=SQuLb+3kxetYbXw6etzHKsQLXghQRPUoJNFs80H26Xg=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=QVa8SX8lcX2i4hb/Qo94mgSHs0ooBIqmdf1j28zlxB6bamcLftoYKTuJus8H4D73sDUpg95Zr0OjBg7xBWHGURU2+n3gpmbTK2WqvTTUuOLOqOvRXMyyalCNl/E1TxZNLvrLosdsUSUX/b/PN9sozvegBEKRszW8JatyjlUINtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=znyVmUPw; arc=none smtp.client-ip=43.163.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1779272246; bh=0+Kq9qtW53mQXksn0AbcKQrYXcQl/ZLBP7xRiGu3lPM=;
	h=From:To:Cc:Subject:Date;
	b=znyVmUPw9iIk49vt9DXABZNgIwg19Y+XJnW8hitVHGx4aeTiEvg0F67M3wlSRVjel
	 FPEWZ3VOjECaoYOrS0do16xBjEg9DSfFqonmIjH1Y9EU1ycUmdX8RpwpEIdcqOLR2Q
	 rO+V/0yZi0DW7WapQkN2D/D8wOQM8VxUHwn9I8Ds=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 45814E7B; Wed, 20 May 2026 18:17:24 +0800
X-QQ-mid: xmsmtpt1779272244t0mukj55z
Message-ID: <tencent_89120B31E993041B07255B285D71C3CBA405@qq.com>
X-QQ-XMAILINFO: MlsYLnHA0UVjnQ/KK2UNzm8BJ/7lKBxOhYJIdQuOab83ggTAwq5bwgF4e6pqFS
	 z05OrZdd2+WkzVos90/0LFcWXmQmkYG1AI1ytFX24TFV83gPPB63AD8M7S8z548xSewCNTjLSkeB
	 75GtKu8/UDvvKxg9EJ8JiuDCmi7IdVRh+m4Rji4iBXumfk4atji4oxQg3QLb6zUpndNRJ1El3VFa
	 hA6B5rY2gqEAdgqWs0/5eWKq8vA2KUKGOuC/2zzbBav7wlGRmyF7X6q7Q6vw5hyIV+GvrSlzDVmR
	 4c/SZGMzgPvNMHowCi434IIKO8rTXMIr15Wmcp903TBsCBXzzkz2gMGFYkwLFH4zIEiajJWJ50wU
	 5kVmczgFwNLsUlXAWgetojMb0qJpQ4EPll3ctSTYQn23eCrrpt6XGGaoT0o+fLfwEQ2muEy2Z3Oj
	 i103bZadZSji7xWVsLoICAP8Oj6Nbx6qo3wjy+pBjM6XUfGGkbC0MwxObEe6peskPT8fziR+PnCO
	 w73XxZV1p/uL1H2PO/CNJSTEfQN0iGGi3xVvOHthmvSPpezYpHJhL/F32+y5eaJcY4zbt+DJDS74
	 kHBf/vGJWiPqYNRSJqArcqFdYlwFHvadIp0z3uF2slMzJGSam0Ug0u66F7gRu4YsJ7qD6bIPRiPQ
	 YUJ81PfQ1lgemR24M8yA3d7T5BdvOH6N0fZe/jDTPpuOzVM39UO2ozDEm0o+ImyVhQiQFWBVTqIk
	 nWc1/5uJuBXaBSE5k2KVdqSPxHKtVzK8SgqoH4eqYzCWyVuMon0LgmaUtapotcUxBVFEY04lfN37
	 jtCBs778YKvCq6dHBG9AR5QQryzO6ckBnkfrjUdlHr3hsKcG7dcdvKYgqnIar0RvXoUsZUGBNT+L
	 Au4i0Zxbsj8H817j4e5ibljVjxn/+Q936lj1A1OjCP3YGEkpNViF7rKWY9M2h3lyONRZaXoD0Enl
	 WdCnJiMv4slQZ5hBw4ZkWyeg7icJYpGQPT+ErmFIg=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: 2564278112@qq.com
To: brgl@kernel.org,
	warthog618@gmail.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Jiang <jiangwang@kylinos.cn>
Subject: [PATCH] gpio: event-mon: Use O_RDONLY instead of 0 for open()
Date: Wed, 20 May 2026 18:17:22 +0800
X-OQ-MSGID: <20260520101722.25268-1-2564278112@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37192-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2564278112@qq.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qq.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qq.com:mid,qq.com:dkim]
X-Rspamd-Queue-Id: 50F4B58BAB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Wang Jiang <jiangwang@kylinos.cn>

Using explicit O_RDONLY flag for open() improves code readability
and aligns with kernel coding standards instead of using raw 0.

Signed-off-by: Wang Jiang <jiangwang@kylinos.cn>
---
 tools/gpio/gpio-event-mon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index b70813b0bf8e..590ca8db25cf 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -41,7 +41,7 @@ int monitor_device(const char *device_name,
 	if (ret < 0)
 		return -ENOMEM;
 
-	cfd = open(chrdev_name, 0);
+	cfd = open(chrdev_name, O_RDONLY);
 	if (cfd == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to open %s\n", chrdev_name);
-- 
2.25.1


