Return-Path: <linux-gpio+bounces-7245-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3A48FFA23
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 05:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B4F71F22CF3
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 03:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD6215491;
	Fri,  7 Jun 2024 03:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lnVuw2mA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBED112B73;
	Fri,  7 Jun 2024 03:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717730639; cv=none; b=eXnTHQ3ofj7u3G1XvOcSNkRMLYqCg64Ft4EXey6q/3l8fqGvgLuVGKpF1OJW0U709ABSgkcfJMES1yxifrUelvrE+xNHa7iASGxl3W5rRLS3ORoanxyY/LS1Ut8eRgjXHA4ZHo+bPv9DRmJQ8XXtdsO3K7xWjLZOpKVQJqQdiio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717730639; c=relaxed/simple;
	bh=CQgdrK73eqvXbqj9CacWb//XxR+wykDhDlZpTq6JnJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=HjKeK4hZ29gUqPhHaSJ8zWT/CKe4r08n181xMLHgwxRRkfVa0aK2+ZMu2nAbl0zYHfJSWhvGBg1yU+44U3EjVRzmYA3iUtGGCuVeZ5NAn1LrIlbNjCfifTil9Lv87TVL0f2WP8sMCzCqQJoheq12u18WEgOhqGIlmSvPGYKquqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lnVuw2mA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456J2fQ0015423;
	Fri, 7 Jun 2024 03:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NnzBQFYFvsSEyC/wOyCOCs
	r+MntuBtN0BB3SdmENJNY=; b=lnVuw2mA9w/5ID3w4uSZhlaiBC7FBlhWqrPgeC
	sn2BN1miKLFwLFRwwuJGuLORF/wxM2xyBkFqp12vbcfJ2jP+Ae9l1zNNzg20RaTc
	RKJUeusmU/hJKpTRAfnH54KRWIUdqgZzmvetUKQXIwdkzlTF4cWDhC4YB1Tu9Vc5
	8xdgJuUbUF2sHGrjf9odTr6GbcVSvXbFxWREW3L5lxJPTjxEbjHBD/rArkCv4NqX
	xHpM5t2GdXgDheLt8CVKEPoLbwXNSrCFFUwZISNrdNtpg+ArKNFJAg0Ko5T5oQ32
	HPvJ/kjRr0IWN5eS/mxklvUOxkfN2L2wm7t+/S8fM44giCVA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yka7pa2es-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 03:23:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4573Nrm4021818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 03:23:53 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 20:23:53 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 6 Jun 2024 20:23:50 -0700
Subject: [PATCH] gpio: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240606-md-drivers-gpio-v1-1-cb42d240ca5c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEV9YmYC/x3MMQ6DMAxA0asgz7WUppChV6k6OIkBSxCQXRAS4
 u5NO77h/xOMVdjg2ZygvIvJUirutwbSSGVglFwN3vnWBRdwzphVdlbDYZUFo2cKXXq0HQWo1ar
 cy/E/vt7VkYwxKpU0/j6TlO3AmezDCtf1BYR/3hiAAAAA
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xRcF-FshvRDuHdA6rLXP4-Axy5AXzXhT
X-Proofpoint-ORIG-GUID: xRcF-FshvRDuHdA6rLXP4-Axy5AXzXhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_20,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1011
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070023

On x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-gw-pld.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-mc33880.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-pcf857x.o

Add the missing invocations of the MODULE_DESCRIPTION() macro,
including the one missing in gpio-pl061.c, which is not built for x86.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/gpio/gpio-gw-pld.c  | 1 +
 drivers/gpio/gpio-mc33880.c | 1 +
 drivers/gpio/gpio-pcf857x.c | 1 +
 drivers/gpio/gpio-pl061.c   | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-gw-pld.c b/drivers/gpio/gpio-gw-pld.c
index 899335da93c7..7e29a2d8de1a 100644
--- a/drivers/gpio/gpio-gw-pld.c
+++ b/drivers/gpio/gpio-gw-pld.c
@@ -130,5 +130,6 @@ static struct i2c_driver gw_pld_driver = {
 };
 module_i2c_driver(gw_pld_driver);
 
+MODULE_DESCRIPTION("Gateworks I2C PLD GPIO expander");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
diff --git a/drivers/gpio/gpio-mc33880.c b/drivers/gpio/gpio-mc33880.c
index cd9b16dbe1a9..94f6fefc011b 100644
--- a/drivers/gpio/gpio-mc33880.c
+++ b/drivers/gpio/gpio-mc33880.c
@@ -168,5 +168,6 @@ static void __exit mc33880_exit(void)
 module_exit(mc33880_exit);
 
 MODULE_AUTHOR("Mocean Laboratories <info@mocean-labs.com>");
+MODULE_DESCRIPTION("MC33880 high-side/low-side switch GPIO driver");
 MODULE_LICENSE("GPL v2");
 
diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 53b69abe6787..7c57eaeb0afe 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -438,5 +438,6 @@ static void __exit pcf857x_exit(void)
 }
 module_exit(pcf857x_exit);
 
+MODULE_DESCRIPTION("Driver for pcf857x, pca857x, and pca967x I2C GPIO expanders");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("David Brownell");
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 9fc1f3dd4190..a211a02d4b4a 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -438,4 +438,5 @@ static struct amba_driver pl061_gpio_driver = {
 };
 module_amba_driver(pl061_gpio_driver);
 
+MODULE_DESCRIPTION("Driver for the ARM PrimeCell(tm) General Purpose Input/Output (PL061)");
 MODULE_LICENSE("GPL v2");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240606-md-drivers-gpio-b2ea65c345a6


