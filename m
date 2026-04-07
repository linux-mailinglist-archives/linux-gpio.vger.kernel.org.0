Return-Path: <linux-gpio+bounces-34845-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MR/BwRx1WmN6QcAu9opvQ
	(envelope-from <linux-gpio+bounces-34845-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 23:03:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5CF3B4D33
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 23:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A01E230115AD
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 21:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BC536F418;
	Tue,  7 Apr 2026 21:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rlyHNM7d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4A331619D;
	Tue,  7 Apr 2026 21:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775595775; cv=none; b=NFpa6lMbmvHCVUdSM7hLs5SPC+yjVheIwZ0Q2VI443H4xd50wqsDvPsGF3314rPXiuI2LYAI6T3t3f1wGQlrs07WZFzsVbBIVMkZY03rAqjkPXDgBxlwiA908ksOH11RG/WxYSX/RosdiXCPd40iP4RlOVezHy6FO9Lg5AY3nzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775595775; c=relaxed/simple;
	bh=XZORi+qOT3ueCRFYyEPMKt3Jv+FL79H6gaNsnX0L1vI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DQ/lqcU/r6bFu2408bLFgCdDVrv6hSr1tY4B6lIF3KWOP4cjobBhuOllsSCvyJQHS5WLMnbZEYVo9PupmqT9q7E1VWPRl7MLh1b7/bQ3a3ULvhkqvB63Pgay8ecllh6e2S1tMLCpmrjf4OBFBKgVTrI1qpSr6w2/sddd9urTlMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rlyHNM7d; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637FuG6P725743;
	Tue, 7 Apr 2026 21:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=2pcQLLK2exqCF2bMsRP7EZgQN2pDe
	ubTY6PXD577Kgk=; b=rlyHNM7dGkEkmA83jxkJZwD34R3QlISveXX7ou3qdQVxD
	ZmFCMQ1XcIsSuFkUxgtUBW5aXT17E1qWM/3XRj2syi/uYeUC1E+PImVWdZP8JoZX
	GCSkEZ68HkQ26Mgs0PK+qlAP+dLJPInrkExVUjxKhJVh90f6pwbmiupduUxURoGe
	6kQJyf3GVvvJW0BMSEcHpA7KLn68zY8McoDE2V85R7sm8ZDXbVDMLVp4d3dGgjLh
	AL1skHXuxDcWrzS6y14xC67OsA5MOlIPcCUoJcpxEBRyvRYJyUum43qHOM83q5+f
	K1urtA/UXTJDoQD6Rf6ReMc347OgwGr+m6eTlyIYQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dcmqea7ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 Apr 2026 21:02:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 637K7GCs007959;
	Tue, 7 Apr 2026 21:02:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dcmehwy89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 Apr 2026 21:02:49 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 637L2mLZ028958;
	Tue, 7 Apr 2026 21:02:48 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4dcmehwy7j-1;
	Tue, 07 Apr 2026 21:02:48 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: linusw@kernel.org, brgl@kernel.org, thierry.reding@kernel.org,
        jonathanh@nvidia.com
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, samasth.norway.ananda@oracle.com
Subject: [PATCH] gpio: tegra: fix irq_release_resources calling enable instead of disable
Date: Tue,  7 Apr 2026 14:02:47 -0700
Message-ID: <20260407210247.1737938-1-samasth.norway.ananda@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2604010000
 definitions=main-2604070191
X-Authority-Analysis: v=2.4 cv=MtJiLWae c=1 sm=1 tr=0 ts=69d570fa b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=74fNiuXZ1nm4lFzO_PQA:9 cc=ntf
 awl=host:13825
X-Proofpoint-GUID: i3tKe0siE7Vf-IVifjT1Wxj2FWsuZDTc
X-Proofpoint-ORIG-GUID: i3tKe0siE7Vf-IVifjT1Wxj2FWsuZDTc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE5MSBTYWx0ZWRfX4KRSZ3GDf73a
 ZlIcWYbe0fznKgRbKifcl7wvRfo+bum+S8jR7w2g5mOA2TrsZUf5SHtKIBFn+TRs0Y7uX8EPEmH
 0NOFfQ9lI+pkmSx5kqzvAY1gJDG8HSxPJWG23qfxGWnFf5BT6ZF3OsKpKTiO/5GmmoGUZ2liZ1/
 5AR1tPxmaJ8IwtocFX/C+6dDHE+EJsQnYKzwLTGxDOHl5v0duNwZZY8jbv5L85pJRLCpYIBEIzs
 +GMP0Fu0sYwQ0Or6G8BvS7S0JPjWXMZFJpHveIlz2dg9q+YHtcsQ1BLH+VuzAPmwzb2SAEM7+VE
 2YGulHEXwWnz4S8zzafr12v6+WeDEemOVd5IdQXWRw6+d+gtvBOTe/0tSViJ/FZcC498WQu123b
 dNyevlpBDD/AGgn9MsC0JZ4M7iMGWe0DI7Gom3IRtrDULXtaxPer+ZFEd8wP/8a9fdnEQbbubqa
 UNItfn78vC1FE5s1qfQgjlNuqqG6NqnS88hdc5ds=
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[samasth.norway.ananda@oracle.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-34845-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: BE5CF3B4D33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tegra_gpio_irq_release_resources() erroneously calls tegra_gpio_enable()
instead of tegra_gpio_disable(). When IRQ resources are released, the
GPIO configuration bit (CNF) should be cleared to deconfigure the pin as
a GPIO. Leaving it enabled wastes power and can cause unexpected behavior
if the pin is later reused for an alternate function via pinctrl.

Fixes: 66fecef5bde0 ("gpio: tegra: Convert to gpio_irq_chip")
Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
---
 drivers/gpio/gpio-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 15a5762a82c2..b14052fe64ac 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -595,7 +595,7 @@ static void tegra_gpio_irq_release_resources(struct irq_data *d)
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
 
 	gpiochip_relres_irq(chip, d->hwirq);
-	tegra_gpio_enable(tgi, d->hwirq);
+	tegra_gpio_disable(tgi, d->hwirq);
 }
 
 static void tegra_gpio_irq_print_chip(struct irq_data *d, struct seq_file *s)
-- 
2.50.1


