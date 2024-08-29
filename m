Return-Path: <linux-gpio+bounces-9323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1139696397C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 06:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 798F9B23C4D
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 04:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD6861FDF;
	Thu, 29 Aug 2024 04:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="mTqKJe+b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2046.outbound.protection.outlook.com [40.107.117.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ECE1C6A5;
	Thu, 29 Aug 2024 04:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724906933; cv=fail; b=UuskCuLGp+9ujoBbSvza2/b6ryXCiqcDCXMvdS3r62Yc38oRKg6M4hBYcr5sJmdO+ZxvMIqcvsjaxdyW4IQ/+fXFs1PmyBYTdDbygoxNS4uVCuD6u+VkYazvKDpdv/goJ35dfsQCeC+BuGIeWXzpXSH6i63GweFEIRiRRpoZ2DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724906933; c=relaxed/simple;
	bh=qjzrxo84QfqFF7TIg/AjSrcJdUJ49CX1K1RVBynP3iU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CQpKkX+no0Pme3nrRjKkl+y0aOnMgEskGPGLZeiexIMsp3Nhq2Ksylav+SOFI2cLK+ZG38Ert2/Ttcc+fNZw7HfZlT58toWZO5kBxfJDzMjS27Ht9/FSIZ0pVAfmBNq3WpRHS+GKAj3AOaYDnh4vQi+M3m7nE0TX+ZEt6WigBJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=mTqKJe+b; arc=fail smtp.client-ip=40.107.117.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYGzB+lETjP5w2E2q/w7eBptF6jGrPvoO7bzE9YFt5cVM8snj2iV8wi3k1rXbys5NCPaUKt2EDuz4nRZyppWZS5ZA/cB37iXAht4ThSGWhzDBS10q82RUOBFqmyYsB0RxhQstfU7pE0E83sOet9Q14sUFuwunaHKg7qIIJBHszOO+GB0Ltjml+4yaoQNMISUCh9om568GrG37KDMsPpSOS6p9rV9872RGLwZC5+/A96VLotO5erVdivGLjakx1eqhAROgfUHvvAtzt0iIatlCamtLKl6cLD1RNsKEf9NkMDVKrUH4nYe0nlMRtmUa5RMnw/e2XEsm2DK6XBOhS5Txw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBV3o080cqUndCRmbrssZdM8rqOZKImW35LqH2INqXA=;
 b=URnwXD7EVD/rdh+yXgICw0FmWnJTAY0Kb0BkbdemZp/ko8m/6xKWZ6UowITbIviXJfYsSJx6ldZD/7kDA5qRR15UuKJu2mz9aOupDjinqPLngAJ6EXuXxfUiSODTif3rbAUOrhKgeVL1Tv7smXg3VAjlApjqe8IvJbNnZLP10G1iYOPayXnp7pgrnmdSrG0kVOzpBPWAU0DOZc4ox6woCe9HlfCTbkaxS4VLex2FZx0tHgZLid2syC2VBw7JPIU7vLCWLSkaCBrQFED1CbNBPHv8ldVp4B6IQI7lDY6PvYfJyJeiO+oJhYMO5NCeaG+CUWV5ikR1uFq3XRJtPd6kFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBV3o080cqUndCRmbrssZdM8rqOZKImW35LqH2INqXA=;
 b=mTqKJe+bDWCi70ImrC/bZ2ceO9keDeEyKvdzBVigZlceUvtnZW2Q/wl0HbizwVS0pYGGlK4I3zgb4wABGcrtkDZ41ef6OMmif8Xs5qJcRkEOu2+pxddxmmw9qMlaByv8vFNj+vC/97OTRLLt55Rd7aUIYGRgOIEERBkDHbdsuPY2n6OLmTKCF9bXiM0m10SqXKYAVfLAWpGUBnx6ABhSZvIjibEDBdxV1JlIrdaxBp0Y0sMZR9/BaNDRNtOuVnC/6ycnw9hLUuP433zXTchbjvUNiRn5CSO+mzXlPbErdViaMLZL+h1eTLKPS+lEkFEHuTfNjAGImLbBNFZTexfuLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com (2603:1096:820:31::7)
 by KL1PR06MB5884.apcprd06.prod.outlook.com (2603:1096:820:dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 04:48:48 +0000
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1]) by KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 04:48:48 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: ckeepax@opensource.cirrus.com,
	rf@opensource.cirrus.com,
	linus.walleij@linaro.org
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Yan Zhen <yanzhen@vivo.com>
Subject: [PATCH v2] pinctrl: Simplify with dev_err_probe()
Date: Thu, 29 Aug 2024 12:48:35 +0800
Message-Id: <20240829044835.2047794-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0079.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::15) To KL1PR0601MB4113.apcprd06.prod.outlook.com
 (2603:1096:820:31::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4113:EE_|KL1PR06MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: ef648f26-d57a-4877-2eb2-08dcc7e5df03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+QNRHCkJ6Hp5CpLQcFiMtmcMqch2h3zU0Awtfj2mTvxuHNkCrvHO1SOj1JUZ?=
 =?us-ascii?Q?Y5z+urcb+ig6JvoQheJsqsxmQwjsu9G65l1ejmA2NvtJCxramVa5NhnVmKjV?=
 =?us-ascii?Q?1+5q/V8Gi0Qyak+pWmvAfwOiFjYdopEQ+uj2nUg0L/sGOSCgKPfkRNNXB6u6?=
 =?us-ascii?Q?XtACcyHbNZ3fBogc0Or5Q0nuGM5C33Hmfe/58dcXiDV493vFEKIpkoXDieK3?=
 =?us-ascii?Q?2T3TwCUolIFcFpNm02nJlOJEv61LoucxJ5eX8xNDD2YcjFKt6GHOSQhClAg4?=
 =?us-ascii?Q?k6rDL6HiTQDMkAf6GNPW1+z6jpCp7sTeYVNhFgp62uZHxL48O+q7Jalofd6X?=
 =?us-ascii?Q?9iaF/rXENNlecRNkjF/KMfKYjxu0spTFnGLYfHMfEpXftOu5SMZkcgs4OVoj?=
 =?us-ascii?Q?yb0HK9x776Y06ra9SgA9j1ZbRNpwOia70F/6DJRI5vDRGw/wsFAyVnZy4B5n?=
 =?us-ascii?Q?srWt7EOijDQsFjsEOVbsyLN+9ZPpc6vI9VxdNYbh/lRN9dOUxmEu8IzcjhyC?=
 =?us-ascii?Q?tiTNEpiqfJiWIhsDDt9SProXvAqvKNIYFpYNnVvN3hDMxacDvmf2C9cy1lp6?=
 =?us-ascii?Q?kgyyHHBgNtKDkIIP6ezU3ApaAMFhVDha1o42xIYdTdog7gk5MBSdiY3ZFL8U?=
 =?us-ascii?Q?Q4K+JkpvBj0wG9R/La0pxzUWiNsJ0PGRw1NAVzWWqg03Pz3LMUlVFhiPmFtn?=
 =?us-ascii?Q?X5Dl0wKNqXwqDZ8DpUnWCMlziqK0B0tOZECzq9LVSx5UcqlqdAc/DtSphoRp?=
 =?us-ascii?Q?L0ZpHv1ga30+2vP8hY5EP4e/IJHuGEevdi4sOh6R+JIZcISnfdUhawB2kA3S?=
 =?us-ascii?Q?Pa0QdGStfoRglokK/TSzpZv5XSP6L/cFMf0hdNpNNKMMeN+Oy8EW1bEOkh17?=
 =?us-ascii?Q?StV3Qo7Aq7WN1QrXFsEyc3f0t8EJDkS+sjiK84F6NMYJdrLDdik0dcE/V1yd?=
 =?us-ascii?Q?qXSAj9hxxRoHpVU9bItZC8A43E2VE0bUS67fy5rrdWZJcvmQ6pG7tyung08e?=
 =?us-ascii?Q?KPBbFgTFnnHCBVBvrHLPpdNM3AtoMUEu4xgVXH/Stm98gcbEp8bEuCXtqWgX?=
 =?us-ascii?Q?gjQPAa/DlHBUEHiX82rA+gv4SqTqtq4nyUBytXJZVm6tmntk928ScoygDhVO?=
 =?us-ascii?Q?OXhEpSuDB427ErxcYXaVRJxxQLu0XczN0diX46BmwLpF8GXhhcNIlahDFP87?=
 =?us-ascii?Q?vNS7kIHJZOldvSqOpos5rJQbKHgcGaqkRWgDoY7utt6BPUkgnwEZvUMmPz6x?=
 =?us-ascii?Q?2UwvHzU3J8OirYaKz1gewAS8rez4MYGRdWhQb3bnW7lDUaq/FZDL/GoDMqBq?=
 =?us-ascii?Q?wjaITgUCMBsQDwAoz2vM9+6WVu12D3gBpekDDIaACI1vfF3SW9mmZWHv0KQM?=
 =?us-ascii?Q?jMt48ylQxyLEu6pS4vVjypHB7YFOzNxoDUvxLKuiBXnA2pTn/g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4113.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iRRMeZc5fLVhol61qhLjD8hRnYofPZabFaN36EjYMV73IN0RHZwW+43vE5FP?=
 =?us-ascii?Q?GCbg32pTb1b1cdwsCRAdyPzS3JdlAHqvSp7LBYIcINnhzB7t9Fh5Kk9d6Fil?=
 =?us-ascii?Q?NRexoGwadZ1aDJh17XdD85OctZ72DAT3KD1Pksl7SHZKhs0Bb/RqsqAHf73R?=
 =?us-ascii?Q?lXy6yHNtBNYLaMrzyQQosuLNMOpnhe0sJzEUu2z90EVFaUj/FW4ouWyp7np0?=
 =?us-ascii?Q?kHmb9biicpO512Ls077A0MRM0lPcGxV7iMM5TD8DqPf48y34uW5e7Nr4GxJ3?=
 =?us-ascii?Q?BMe0X6Zzsl3EsZhQdDBl6lud+2mqJrGVNUwpkNHeR/rySFj2Xf9WF5L+9/CB?=
 =?us-ascii?Q?5e69Gbb8PoWkVtDRaik3S3AH/pshZHFQAcWKetOdlkGpNvO9mjwgCcVt1W1l?=
 =?us-ascii?Q?nvizvF7Yt+uh7Ey406sZADm3YhOoYwLYDLt69qkDbbHujV2dhLbQvo0LrsER?=
 =?us-ascii?Q?kwQowz4SfTawLzK+6DHwl4Nd/UF1Ae14QFEqtKbTYjB50uZdl0cig87wF8ap?=
 =?us-ascii?Q?kFQ60XRZCNohV5Td+8C8F366zQZRzMakkCqgLtwcWPUAorUuEJuGHiULqXs+?=
 =?us-ascii?Q?4R32Yta66fBijS7qi8aAwIre108pgukeSlnHYulJs+PVLhzS9ZF8E0bcvgwk?=
 =?us-ascii?Q?NTfORtjQprv5nN6yBJ5zxYfDfI8Vg72H2oRqHbQlxqYZsqN3m55COKPznNp0?=
 =?us-ascii?Q?VmtuNcNPynNNUVfYre58I2XIaSGQ6c4sAJtX6yLXnCN7iZbSR2gQ7Uc3RSKh?=
 =?us-ascii?Q?t2pp+q355WkCa0D5iW2rwL6o8msWZYQ5hccWlTomkAX0RM+ZvY3ZTi0A1GnU?=
 =?us-ascii?Q?Vqe6WMxSsD9VAMNnHcnxqF/sDgUXFbBlraoRM5KH8XKCYB8YTdO/f0RergMh?=
 =?us-ascii?Q?BaoDBeErNAAf4qeOoXD/ElUY8b0I2BbPjq7yg63OEs+EfVwlqQRjqufc7PPm?=
 =?us-ascii?Q?9fSr0GTzxZQVZyBa5sMWLhPUny1nIjixrOoIiVaIQsXAKqQ3hKs4qE3Ng7Yc?=
 =?us-ascii?Q?mvu4MoVaIkuvahi3hiwCkhRtyXXrNrnDsrrTRzpsXQ5kw2T+fQNrtY4Sn2q8?=
 =?us-ascii?Q?gfS73Yb6gxC7mGDGDC1PjFLvSt8oU7chGBTr/RbBNLsNFBhagwElaSg/eItP?=
 =?us-ascii?Q?z8M5+nrL3cqmNIkwK94lW3+7oBx11LztE00Jj+bpbz+1H/RIsMJy884WNso8?=
 =?us-ascii?Q?9h5bulOrKIcmC1OizBfSHCjr+0YAJV24lTxX/FSpfM0+l3ZQRwmty2A8isCS?=
 =?us-ascii?Q?SmxzzfCmAOVe9mU/DKLEycD0NP6VD7uW6JysgZ3rOyDsPVT3UgVTH9Vey0gi?=
 =?us-ascii?Q?LWByZ1lj2AzZaNatKs8h5KlOyYObdFd9olS4Ua1ty9UCYSHJl/qZtiLEixfp?=
 =?us-ascii?Q?B/cTtx/lv86ResDzzRzNSXc41mhX/kCiajzCT6SoWcfMPgxTQ0M3JnTh6uHa?=
 =?us-ascii?Q?cpj83jnkqRAjQNwoeg9YFk0XDx+Rcu/yudrYjoMdh3t3CLmFbriUBfNYEHR6?=
 =?us-ascii?Q?1T432SkPpX7xM3csBSAOUaqJbCXs0VXfk5AYmqUCEvEKyf8V1MHwAj8UmjYQ?=
 =?us-ascii?Q?ySYY6Krx5BSbx1vh+te/Qoraij+J2T/t4beE8ZEp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef648f26-d57a-4877-2eb2-08dcc7e5df03
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4113.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 04:48:48.4664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4Mpf4QGkXk52lVyBEeOs1fQIX9fIHlkhj1TLkuAg6H5OB8UD4mO3KkryM4TjQBq2zudpBI1yuXor9QuEcXfzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5884

Switch to use dev_err_probe() to simplify the error path and
unify a message template.

Using this helper is totally fine even if err is known to never
be -EPROBE_DEFER.

The benefit compared to a normal dev_err() is the standardized format
of the error code, it being emitted symbolically and the fact that
the error code is returned which allows more compact error paths. 


Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---

Changes in v2:
-Rewrite the subject.
-Remove 'ret' from the message.

 drivers/pinctrl/cirrus/pinctrl-madera-core.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index 898b197c3738..2932d7aba725 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -1063,12 +1063,9 @@ static int madera_pin_probe(struct platform_device *pdev)
 	if (pdata->gpio_configs) {
 		ret = pinctrl_register_mappings(pdata->gpio_configs,
 						pdata->n_gpio_configs);
-		if (ret) {
-			dev_err(priv->dev,
-				"Failed to register pdata mappings (%d)\n",
-				ret);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(priv->dev, ret,
+						"Failed to register pdata mappings\n");
 	}
 
 	ret = pinctrl_enable(priv->pctl);
-- 
2.34.1


