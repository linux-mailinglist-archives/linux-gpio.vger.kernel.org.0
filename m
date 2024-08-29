Return-Path: <linux-gpio+bounces-9335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 490CC963BEC
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 08:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0170C282B3F
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 06:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A5316C6BF;
	Thu, 29 Aug 2024 06:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="T/XSYSJe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2051.outbound.protection.outlook.com [40.107.215.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C2A16BE3C;
	Thu, 29 Aug 2024 06:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724914128; cv=fail; b=Tz7vhQOCQ9rGmmGJRzzM260XSD1pxU9NlF7ahilH7m6aFHxJypmZioyCtF0blPkZxGfU+gZ+VF/9GuyM88mZIiVVdHBqKJuTsjuoss40VVc69RL5FnIXC3pI2Qd75+9gjXVPVkm5IIDyCx71g57Hg87kiXz4YtdCw0wLSvV4KVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724914128; c=relaxed/simple;
	bh=W6S+d9LZaSyD3IH8EyPw7dH66MXf2OvUVf6736qPtbk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qoj3VpXZX9swZXqzgwE+v9Clwpv3M1Rp2NHlc+gkI8fRJH+XU9UgYW/oM+17nxnS1krNlTJl+ETEPRKaASpTjn1e03aeIKfItT9KlQ7N/pB6TdpshcFp5L2H5AqAknh/LzGTDuj2ar6CIV4vPiOhBVRSgY2hF9WY+8yvdb92MrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=T/XSYSJe; arc=fail smtp.client-ip=40.107.215.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cawSLVcrKRu7ev0bDZ6wl57cxauMV2zoLSROmT05RElrfYfeosbydWYdoybeCrNtv63Em0OtTi4bYD1bKUEmsxLhRgd9xPK8jxMSjdquLGAUEudoadopTo0lCua3yp16lmd66FXWlLOoxBAR+1FbCaeuBRAE71nErP5CKAGvM480wqdCZhhtgRn+hV7UiwfJBnqVoe8PuJjkLvBsTyZW74a2RNOsaCtVr6Lnx+CSB1KUb3QUPfIxkRCDQssJSBNmJHOwI+aDxFzsexSgMEunVj//h/+u8N+0hRNjCQJL6f/kgkUn+xm4tpLgGTfOYUd4yfAn39YU1dA7Eoum5hsqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzQ8NcFNTrNHokkGkI1JW3pZUHqP5+ZNDRLysl8XwR4=;
 b=gn9XNRu6dNkUEsG3l8WTVAV47x/4YcrjnquZMHW6wlhWD1nWSzLIoh62QYDx30GDaCLsE5rCMaJIVqMvdm9rVcJDDQQCkplIcz61AVF9batjpO1MU7E7/R4MDuHaf6neDCYC4v2WeZe2b20yUq2dr99yDPcZnVSpxeRQ4LI9Y1cx8Ztala2auxuFGMmj8ggtFyZM4w5/ieukVRPy1Jpt/7KV2G2lswulDbSCjs5gAfH3lUi5pzzgYcBxdAoDQoEHNPW/eyZYaA3U3IXQXRnir+g5k8CF7CPPEoyvgETrdXifvxN+cseCWfi2EG2l2TVoSKzLTUprmp2PFZjP4oq3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzQ8NcFNTrNHokkGkI1JW3pZUHqP5+ZNDRLysl8XwR4=;
 b=T/XSYSJe+Be8LduBgmkTO9Oj1P7CV84JeDd7Ba8saGIQQX50WWsGko2ar4HmPwEtB6oGxRX5wjhGaLEKEl7DS/UK44cTFb2aDpRwibHyZwJgI7k8rFVOP0e/lNLjXa9AbwAvxiF0EBdunBKuSJ73b0U/PVoDu1DJWIvZCnsUbRmFFnJVtcZ+Ae1yULuv4fuLylO304fKymNsrk3axVbG2dONx++tmqcV+o4IknhFee71wSmTcrbdIgfbRCCQIBN9p6fyWUvfjySXDGc2VuTuqbUKJfwMfe1BsKEG9vsgsuj4l/Y6pyK6OzfQkR4IF+HXwKrY+Ga5wMtUwYS3fdRuEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4211.apcprd06.prod.outlook.com
 (2603:1096:820:23::14) by SEYPR06MB6822.apcprd06.prod.outlook.com
 (2603:1096:101:1b0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 06:48:37 +0000
Received: from KL1PR0601MB4211.apcprd06.prod.outlook.com
 ([fe80::29e8:8083:a2b3:bd1a]) by KL1PR0601MB4211.apcprd06.prod.outlook.com
 ([fe80::29e8:8083:a2b3:bd1a%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 06:48:37 +0000
From: Wang Jianzheng <wangjianzheng@vivo.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jason Cooper <jason@lakedaemon.net>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: opensource.kernel@vivo.com,
	wangjianzheng@vivo.com
Subject: [PATCH 2/5] pinctrl: mvebu: Fix devinit_dove_pinctrl_probe function
Date: Thu, 29 Aug 2024 14:48:23 +0800
Message-Id: <20240829064823.19808-1-wangjianzheng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0237.apcprd06.prod.outlook.com
 (2603:1096:4:ac::21) To KL1PR0601MB4211.apcprd06.prod.outlook.com
 (2603:1096:820:23::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4211:EE_|SEYPR06MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 3456e627-0282-4363-a47d-08dcc7f69c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?56WJ1+pLKOI2aDbmer1F+625RG3YvMg37TSBxA/OvxNEcXW2eJPZFhSpbI7j?=
 =?us-ascii?Q?LQzGEQLXWekCKiQd2j8taHOmoud3g1aa26Vh74Rh3BPESewi83KYHsd2/lxN?=
 =?us-ascii?Q?gvlV1asIcJGrlGmBrYwWXVxBgQ5jQbotbFLuRC9HckxtSFBBScDwlNPXNMPG?=
 =?us-ascii?Q?n6burmCPbmLm0VcpFnrS1z2EmaplXlDh8moFXVS3eawXC46gUPgKrdXpWzQc?=
 =?us-ascii?Q?MPwNo28EOv1sv0kGebmYkbJB6IVO6MBTSJYEI9YTSNpdWAG4Zxt3XU/8VmpD?=
 =?us-ascii?Q?zIt08NZDWu+v2feSnGxi1EXOIejMZ09NBbM8FS22mKvizQ/YKVjVrdGhPwd4?=
 =?us-ascii?Q?oVYKzPb0q35uy7yJqBMEcLisWS6fdTijeiUi6Zj74Da3GMW778Wr/w8+agzf?=
 =?us-ascii?Q?VZfr9JNftVb/bIwjmCr2P8CwqmY5nWuMqFDUPqdj65V6/BjEIsxM8ae2x6Sv?=
 =?us-ascii?Q?UkoctqNMTsvE3XVWuC8/zvlfzbHjh32L0S3xaoD3M8ANxYuIrQrI3G7UAPHc?=
 =?us-ascii?Q?YeOfp7396SWA0RTfbJHokHqz4O0HhOLAbxGrVmvvY7ttKv0pROtvsBydtW3b?=
 =?us-ascii?Q?njdpMtgvXqWChOo9JzQj17LAwD48ZVwqOtSeFBPAGl1Jh3OMpSz3nGgmdgu+?=
 =?us-ascii?Q?af9ljXekYVfD2HBMAQhsCLp/08+i2HgOpenEL2NqplFMP+qjp3yULmXZISqN?=
 =?us-ascii?Q?pLj7JA+VrD5SlnGR28fuC1tpTS6FkRiD60bKs0kCzQSx56gKg2CWmb8Ci/ag?=
 =?us-ascii?Q?ow98K+Cp4vpzIsnEOYBS867/wuyhlr5CEOE80kSQj9GP36kxdu0q/WyRrgBT?=
 =?us-ascii?Q?afE8E/++XsLj16gEzgG7SLsShn4JYfgDER82JJzfs6w2j5OwoJSScxPjB8CP?=
 =?us-ascii?Q?aKj6THsHLpN/HBw0msf4x9664lQnRCtZUeDbYbz06VPFPexLXDCI6mkAFibk?=
 =?us-ascii?Q?6c28b4uE9ced5E3DJuD0iVevthnd8Unqe76wtvyAIZLK3/hdO4J9vNhQZdNu?=
 =?us-ascii?Q?6f7VfgnZTDAr7L9E1Bw3rXdvu9zNLxGzqAwJ7AGqql3XIxBbkRXxDXDOf1tJ?=
 =?us-ascii?Q?wsRy71E5Txe3OTABydaq0shEKumyFbQZQ8Q8nGLoM9Y6Gi70Z9ORJOu6A5U5?=
 =?us-ascii?Q?eeYA74Gza44j2XgIXWatB6bAqsEhJ5fPO3NiXdLIONnVTCucT5a01cvVyy61?=
 =?us-ascii?Q?cI1ZOBJbLwKnvt5iphPLOKAqHOSsBDh38gGX+sULjzBAX/UmcoCURL6UuBWs?=
 =?us-ascii?Q?aEjLLSvxjiIv+D+kPusekmcriG+XA7CrZIYgCtuNBFhHf4seJkqXd7aMUZ9+?=
 =?us-ascii?Q?ukUDtWLZwQL3s0yhkPK5kyMQvvuGJUDjSdUsGDjsZ72LOgQJhOgrKosbp0MA?=
 =?us-ascii?Q?M1CO9eTtRrTtvm8QlH3/XApOiM7tV7BPsiJ9j/zZ9eF9teJcqzq0TJFboXOi?=
 =?us-ascii?Q?ittpSYq9SX0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4211.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UtEGfo10kdZl9YTSu0DZjoyO9hpA74R0CijESRS7Wh6dGRqI5uux/sINJcT9?=
 =?us-ascii?Q?aTP6LVX3p9ggnGTzbV9kj1AWc6QSXswjxxfAv6OTg1LSsjKGgqvY4coSslqd?=
 =?us-ascii?Q?+dTDL0GqCWEkO7W/erh56kUriOff2N72VMBTHfS21hIQ/8aQjW0E0houxsM+?=
 =?us-ascii?Q?E3Np05QL9sDK9Ixnu1eUdocRPJRDhvkOiSEmYEjqBrE6XbeYKHDJQgZbfmnY?=
 =?us-ascii?Q?QLYl4o8SA6Vbp0p4jxuSWFI0QPXd5mEdzcqZGk5oUpOmdfI2dLfdhG/A4lIq?=
 =?us-ascii?Q?NgMuBTj6NPV3jrVxc9tZT/MACGGav2V4wTOw/QLZrm8xqujyuGFhMIqVaHZ0?=
 =?us-ascii?Q?01NS6BGv/lt1KhdDZUuE2oNEcAaJocz7bBn1Fuj6nrbHvCBK/+t7Vz+l6Gb8?=
 =?us-ascii?Q?HkoIM5SoWCPSbvJFhH1NK+sRYjHIVk3Q29DWtjWGYONzHyNokLpYqJByQOU3?=
 =?us-ascii?Q?WorOPJoU878qw516aSvOBz3r39OIDPhoZLJS8P30+VI3C3ctF7qZbqEKD2Lc?=
 =?us-ascii?Q?Camundqzdv10lyp/jcKUWBWxs7eapLZw8ePKchwevZj3/QBVqlHNd0niNP3m?=
 =?us-ascii?Q?r33rBCI8+It3PWsV9FJWAEJrIPNno6iLy/EBS/d6Y2g3GSTj3qIvEmewyb0q?=
 =?us-ascii?Q?+vBy2klQpHwf8DTCrgoTueVnuMwPkVf9ppOk5eyFRVcQUK6jPpv5257xdVr5?=
 =?us-ascii?Q?y+o8Nh4Dkg4ACQSZ5UrwopmEJUapjkkoMLP83hXr5me8lGLGjHFLG8ykyrLW?=
 =?us-ascii?Q?C1fp5UleNF7kA670wmo0WCdCi34IaFW3/qtGKrWNEgyN6c/MIlzgAs5ov/+K?=
 =?us-ascii?Q?+IHd9IE+GJXqTB7yoPLPFRwcS5YhqPRzQzR4MmuhDQsEc8OuX1g30F/NlVhK?=
 =?us-ascii?Q?8MQIa6RC0ER8Tsvhf7rKBSXTFqVulWxuW3m2sqrFsKgofvMn8644Lx3f+541?=
 =?us-ascii?Q?CrVhk8hDtBf+Np93m5cStIvywK1UoASJTj/mWehn6Nef8AS3t4BbWTua6Fk9?=
 =?us-ascii?Q?NsRth2RlJamk2Blf7/1Gw5ArzfupMakZtXke9Dv7U3Wtl3rhFpntTiMk/haR?=
 =?us-ascii?Q?9ceidhYRz6YPYa3/b7AJ/gxpRYbVVFJe/lHMiYNtu/rOoj2wah+IT7N39ACr?=
 =?us-ascii?Q?oV7PvPhMqlymoWpbQ95Gt2yqYULb2be+yJgpu0/kkr6sBD7iB29pi6c8+Hz0?=
 =?us-ascii?Q?rbCRIXhFGSiEnFSOAWTVJvh/io59vB2zeYqC+gO0xgQg1LcxIiceX9d8V9Lk?=
 =?us-ascii?Q?Cay6ARE/dioOcZA2xyyX3+U8XNlR3iKRB/BvLZ1IIGy8VXqsFaqPmH6WYglD?=
 =?us-ascii?Q?z8cY7Ilpv2tumJvIJxRcD0GluKR6CV2H1BWUyxx4ZDn5idxKq7cVvOsFQ+uo?=
 =?us-ascii?Q?m54hec3nJIvM3Kp5SghG3DUGH0qmyHoIlm/OiP93FBvVmkKi2FQlESfSd0fW?=
 =?us-ascii?Q?h6WAxKcPAK8f1FCeFI/ueA90XI7f10aKCLyw5reXX93kuzfs77V2I+jvHsHl?=
 =?us-ascii?Q?AR31AfEH8nF9Uub0Jp8bcgR8RsLEwMXKoEt0xvp0NN2pxQPX/sNrQmPQV6l9?=
 =?us-ascii?Q?/FUdSEAVXGcVEWtB7KSyR6RIQZeYFaCr5LS26v1u?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3456e627-0282-4363-a47d-08dcc7f69c22
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4211.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:48:37.6554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ET8ynPCwQeUO0VRZte9Y5xWNiUK9yP13lri9E5dYtvdx76SjmiR0UF2SuoSryoRuvxYqXL/0QizNP+XVC04e+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6822

When an eroor occurs during the execution of the function
__devinit_dove_pinctrl_probe, the clk is not properly disabled.

Fix this by calling clk_disable_unprepare before return.

Fixes: ba607b6238a1 ("pinctrl: mvebu: make pdma clock on dove mandatory")
Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>
---
 drivers/pinctrl/mvebu/pinctrl-dove.c | 42 +++++++++++++++++++---------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-dove.c b/drivers/pinctrl/mvebu/pinctrl-dove.c
index 1947da73e512..dce601d99372 100644
--- a/drivers/pinctrl/mvebu/pinctrl-dove.c
+++ b/drivers/pinctrl/mvebu/pinctrl-dove.c
@@ -767,7 +767,7 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
 	struct resource fb_res;
 	struct mvebu_mpp_ctrl_data *mpp_data;
 	void __iomem *base;
-	int i;
+	int i, ret;
 
 	pdev->dev.platform_data = (void *)device_get_match_data(&pdev->dev);
 
@@ -783,13 +783,17 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
 	clk_prepare_enable(clk);
 
 	base = devm_platform_get_and_ioremap_resource(pdev, 0, &mpp_res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	if (IS_ERR(base)) {
+		ret = PTR_ERR(base);
+		goto err_probe;
+	}
 
 	mpp_data = devm_kcalloc(&pdev->dev, dove_pinctrl_info.ncontrols,
 				sizeof(*mpp_data), GFP_KERNEL);
-	if (!mpp_data)
-		return -ENOMEM;
+	if (!mpp_data) {
+		ret = -ENOMEM;
+		goto err_probe;
+	}
 
 	dove_pinctrl_info.control_data = mpp_data;
 	for (i = 0; i < ARRAY_SIZE(dove_mpp_controls); i++)
@@ -808,8 +812,10 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	mpp4_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(mpp4_base))
-		return PTR_ERR(mpp4_base);
+	if (IS_ERR(mpp4_base)) {
+		ret = PTR_ERR(mpp4_base);
+		goto err_probe;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
 	if (!res) {
@@ -820,8 +826,10 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	pmu_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(pmu_base))
-		return PTR_ERR(pmu_base);
+	if (IS_ERR(pmu_base)) {
+		ret = PTR_ERR(pmu_base);
+		goto err_probe;
+	}
 
 	gconfmap = syscon_regmap_lookup_by_compatible("marvell,dove-global-config");
 	if (IS_ERR(gconfmap)) {
@@ -831,12 +839,17 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
 		adjust_resource(&fb_res,
 			(mpp_res->start & INT_REGS_MASK) + GC_REGS_OFFS, 0x14);
 		gc_base = devm_ioremap_resource(&pdev->dev, &fb_res);
-		if (IS_ERR(gc_base))
-			return PTR_ERR(gc_base);
+		if (IS_ERR(gc_base)) {
+			ret = PTR_ERR(gc_base);
+			goto err_probe;
+		}
+
 		gconfmap = devm_regmap_init_mmio(&pdev->dev,
 						 gc_base, &gc_regmap_config);
-		if (IS_ERR(gconfmap))
-			return PTR_ERR(gconfmap);
+		if (IS_ERR(gconfmap)) {
+			ret = PTR_ERR(gconfmap);
+			goto err_probe;
+		}
 	}
 
 	/* Warn on any missing DT resource */
@@ -844,6 +857,9 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, FW_BUG "Missing pinctrl regs in DTB. Please update your firmware.\n");
 
 	return mvebu_pinctrl_probe(pdev);
+err_probe:
+	clk_disable_unprepare(clk);
+	return ret;
 }
 
 static struct platform_driver dove_pinctrl_driver = {
-- 
2.34.1


