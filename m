Return-Path: <linux-gpio+bounces-8965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF6695ACA2
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 06:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94DE61F2277E
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 04:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBF73D38E;
	Thu, 22 Aug 2024 04:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="JncvMHdi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2073.outbound.protection.outlook.com [40.107.255.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F8513AF2;
	Thu, 22 Aug 2024 04:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724301739; cv=fail; b=OI8W6rsImjVbWiCoL7jWcRZxArirQYbnxvoz5Q4isT2MELZZL2dAS8opPtIN/rV5O7okEgkcqZZ6ikXApRfXBO6JTA3zIhh06ui3+bSfV5WhUm1NvIaEmfXPotCupX+gUxOFcjlnJtytPjuGlnI7opNX4Z+Cw0FutIbgGPcoPko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724301739; c=relaxed/simple;
	bh=VrY/PFmC5kLS3cEzAqqTpw3bcPikHTOk6sS9LvZSWH4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=F9yxsrAZ0VW9fOB0yHED+fyc+yXaX4kI4BAJS34Hp+S3Krr/uVvABQ0TpDyNtHYhjhHdd9qInT1hHBfuRzj1cMh27FRVS+0cEQuL5QuFCZhG3YvSVjiip7GD5DbwOzgBaRNcXVE6y5nr/g3NeQVcLUteuJMWdHKkw8qDolv/nT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=JncvMHdi; arc=fail smtp.client-ip=40.107.255.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8g4z2C+7UHDj679P8ilzOfq1YirKgShQFRpIceNGsT5zK/JxcUIlXQRp0c4+kDlD3QGJWxuem7UyAt3fiNzCxXB4fbxL3oPEopWbsn6AALZzu5/6VqksESC9tEYC78yhuEOxn4AF9bOGYjODiPR1OFFM2mY5ajIYVirB21oAd1eYzRAwUwiUv6P9W+qzR/PHpPin2jun0VZWUirIPOfXj9y5lOvmodupVKhfTirhkfgtht+8X1Th9oTXfvYrkFiDiUuMOZJKwPiPXhX8lASZzIJ8HjUVa/Gh8ZxiM7dxTAhPlXjTu4AiXn0E51RLJpwCBn7fC5SfZf8z80K4zrrTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqDAwsRiOcYlQ3xptTuFwr88Z38YpJJQ+WG1qE2qFWU=;
 b=UYGdbqO0BkOqsu173kS3XLTdQbDL8wsP2Wh3SEegugJF9nydaz48ruyrcjoISr2WLk7wmC1a9cU5CerPiBBvCJ02oLb2BXe6jXT5UMWmCWP5m6dQS92M0P8uXrol7UELYRdnMIGB3bK5uYv5vIuftkOuF9ISYN9JRxuXfo2MixJWmZ+nUB8Cev8rPLDXyvFkt0IEm+PzgKoQo7LvCg08JkGMgV5FItbaqA7Dz/KgICny8hysujgBePfFI5FFU3jDDXyyh5Jw5EKvr1gwHGntnydb4n6EyTm2XjjZIOPnz71MogsLXULLHRRIWTdCoQ2+SFmJw2UhCC+OKYMQAkIRwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqDAwsRiOcYlQ3xptTuFwr88Z38YpJJQ+WG1qE2qFWU=;
 b=JncvMHdiKW//l9OlerperPIgV3OuAl25Q1mI8HS3KxX+AnY8TwWq/Ar+gKztkbxqisG4TX0ItDkVlH5RQBvtBBCzgczicmC6sleX0faiHoy3PMoAIcG6W2wl64BHFlD44YKPJisyzxJqfaD3GhAAjFGlUvgIC/REUo9nzpqD9iBYlhKDudY11XZtxRSICX0IQaRreX0tbuWokU6v9dIUQhswKpFT0gKjbX0C4CNqPDf1NGVC0YFvfNXUaxJzqGEWk0Z7ZwTqdpKKwm2hxhh89jUDO3x+VJO7bTTlgT2X+qgH4i7xeqWQISNZcQpmtYDIpUkKz4HQtkYQp28OgnquAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by SI2PR06MB5139.apcprd06.prod.outlook.com (2603:1096:4:1ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 04:42:08 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 04:42:08 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] drivers/pinctrl: Switch to use kmemdup_array() 
Date: Thu, 22 Aug 2024 12:41:56 +0800
Message-Id: <20240822044156.2301-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|SI2PR06MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b6b5ff-22c0-4075-d14c-08dcc264c774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1kayZMzoco7aP8ObqYLLlC77LwE0Dhq67FZvHCT2uF0v4MroLTqWmQOfVLi+?=
 =?us-ascii?Q?d+7ppJdgoCiR58+lM56HSsnlnSuxBf7WNfd86oHxSX5vWISAT2/SeX3AETSs?=
 =?us-ascii?Q?725Nyau3eXnM/SHQexc340SBLNFBRT2kHIfMfOFtHGQ1vztDSDg3obClB+DN?=
 =?us-ascii?Q?udBHoVwC7IbmkqHK2JVl8sMCAjICshoQPmgOnl7q495VLym5ReXSyN8nL0b0?=
 =?us-ascii?Q?X5Ojve4kjh7z6kZYlUZxASFz/URPR7hcEmXTa2gg4DzXRCadx51HeXzJV6K2?=
 =?us-ascii?Q?jjQP3Tl4Hzj8F2DNwZqCbQYzlxx3aC/WgCzZCFDKH7sztwm0q0iQiAIZLFoO?=
 =?us-ascii?Q?PKlWtzwE5eKUA0iksnn4/gZ7YdbDlYjFhOaC8kg8RWSQy1wItQOIX/DXAcvR?=
 =?us-ascii?Q?sM4yKgquUfZcWIAnxWbZsy1pYvfVLuSXQpXpva+CuRkHnP//1YoaTgs/wat4?=
 =?us-ascii?Q?ZygHNa/k/43fQ7HyehEqDdvcyWztn0ZdjM7YLqsX4X5cNZ9x658xuPpN6bl8?=
 =?us-ascii?Q?+tDiLhhvfqfamMC5M7L2O8Mr98UPNURH7vvdGeVVDcOB2Mt3A4l4axF0HRzM?=
 =?us-ascii?Q?xhj18G5qOj3wjppeHhCvDJ7yVa9u14jpJ9rx4qYnr3txD2GcQscSFzGJZV//?=
 =?us-ascii?Q?qtz0nx+BlaJmpAVMAdjabSjs/aInnpIS8jyB57QWRDuGFKtXE+chma5WcY2p?=
 =?us-ascii?Q?N9w3PS4pAZgv8t2WhfjqNuWGFMaVErNY9topbEKq6SlWNXAmazKgJthEWDQX?=
 =?us-ascii?Q?6918AzwoL26PfaMOmA99ImNNLSIHxmA/96Kvgv60DzuMMUy98d44TrNf448T?=
 =?us-ascii?Q?aI79F3y2vNOxZ/M5Ay5cJL67GszTm0Z/AaFqHw1JdSxSsazkk83tCPYOShcO?=
 =?us-ascii?Q?5uu4OK2caHLoJGL5mFOdKkBj3n5r5bwkPc7GHn8gramLV5MSvAaCfRn2RXl1?=
 =?us-ascii?Q?46JVHin3Gxp6TbI8i42j9Tsj1Q/SLZONLigT5rhA9Hfvy0hF/IUT7x/f+K13?=
 =?us-ascii?Q?2HCYybEuric1P81AI9hzobo7p7PxsEqhL3UsceyAfSqsRxYmGq9hmLRI1XFg?=
 =?us-ascii?Q?90eLQVU59Tu7ry4L45Hyw0TGPlJdmy1o6su7qX0SvFTi7mB6D/44ghTLeILU?=
 =?us-ascii?Q?O4OQ7HBMkDTLgKuxp43s8+NL7EvSvxrWTojyDBE/LgIqoPbO732MFHxmVVx8?=
 =?us-ascii?Q?w3Z6aFvCDEpjRRCsutq0WVZ6/Sj+JMHilbcJFHQ5/Qj2weiqsVl+AIVYTgGb?=
 =?us-ascii?Q?A1hHDN/046RCTYve9pXySwTQ7YxzpGO28FX+cq5VJjHLk763L+8ypaZl/yMk?=
 =?us-ascii?Q?CkedtjXcAYPsMR3abz8zwTiuiz4JeJfAoupVJa8Mzn/y9glhdEpONZYmoBbt?=
 =?us-ascii?Q?CCxckFqLmFmqKv95k0oG9KQ9Kl8O3p+Lhl8rjOq+yEcnsNNQLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LSiIFI9K2hDlV/CLucMhb1QutvsiodH6uSmbAA+OhXh5AGl+sc5qxrdw0+ri?=
 =?us-ascii?Q?ZhV5fehsMXj/v9roVJYeG2RPxLIjm4d4ET93krkWjB4mOnW1vaWzssMUJ8ZJ?=
 =?us-ascii?Q?Ej4l4iATpCd/HOByM/Tiv7T6wmAwvgYmObCsi7kEon+eRBG2UPbNOrkRVwWB?=
 =?us-ascii?Q?Vr4Hde32Jfifx9vDP8lAXAZJ0K0uoVVok7pPtAOYr8CQwwIdrt70DRRx/zMv?=
 =?us-ascii?Q?V6xUWAjx3Kb3qQGx2OU0i/QtUrkJxdiAqkY5N8tJ9SSn3Psu9DsGlROH2UQE?=
 =?us-ascii?Q?0Joiu2hnlKQ9XeBQM3+aiU14kKzQpQ0Nvnz/Or/Uo1mC/6NyZjCRbkhgRNOQ?=
 =?us-ascii?Q?f8K2+5RXyugjaW+HAspba9mwBNGJ2SuXz8mvTvebtez+z9zYdMKQvCkY/Rrr?=
 =?us-ascii?Q?D7Wm+VMuomHXyzeAKwdyBurq8dx6o8ISQo0f4H7xx3ot3y6tRIs9Tpo+OBnh?=
 =?us-ascii?Q?af9saa2a6O9vP9j14opfLMgUSZ29QmOH3y6XAJQ5knMtuAl22CVlRDLsfxk0?=
 =?us-ascii?Q?W1e1qAKvRTn1A6Zr3JjLg1tSnOrjoFNXt95ywK5HhX5Y+qq5ABdtsfuKEGnp?=
 =?us-ascii?Q?k/i7BQ4hEdiYITsRg595K8rPx1SeXNf3p9zgonk0sC2peH+BvmjP9cN+V5Cb?=
 =?us-ascii?Q?SBfeXpmRwQg0bcCYYggErIPi1dEtlTbVQDQ4uaIhvNuEO+lsf1X8atzIBeen?=
 =?us-ascii?Q?8f9cj7UCb3AdADeE91DS/mo8++HxO9B2Jpry9zLAtRk3EtC917o5PBl463nB?=
 =?us-ascii?Q?ykf6vEOL3MO2WGz3T/K7//WpsY4ZC8I2BGYhP2goNsHqYRD/KML8nQTRuFbZ?=
 =?us-ascii?Q?n8pY4Jcj2ArZlsMHBHP+7PzuoZ0uN8/P+NjImvbYG+z0ToO6ubSHWrWg6qwt?=
 =?us-ascii?Q?RpsTNhmAvQivclqLQUaBLc0T6eXzeK6TBVagS5IJXlUeabQj+U9m1XASu9GN?=
 =?us-ascii?Q?WWDuvwodEwAc7pe4pUxIcA631dRGm6sIbbwXUtQVDpHeFVLF03nomOI6OR2j?=
 =?us-ascii?Q?HhP+0KHaasZB16kicjgGBOU5hfyRC9M8HzI5mTOSYAUXsbayoOAGCuQ3t1Mh?=
 =?us-ascii?Q?yaFNoACAICl54qa2FIwRo+ZXhOaM8c/capqIyXbS3dtNgoGT507NAkeiZLkY?=
 =?us-ascii?Q?J5qx3YZzaoMzokBAiQlpfaNmpJC5VhR/F6QEy9A2qfuiD9tJ5q2TmVMFS8G3?=
 =?us-ascii?Q?JLvU474rpxxQqXRmHnUgSxu0E5hB9dHhWOR8VfDK0j9iu3TZg7mpwOh5lZEi?=
 =?us-ascii?Q?aHp0epg6QSFGHy0U7PwvvuOcu7e/4SP6tF0grXJ1jldsE32u7bUVRSvieDEX?=
 =?us-ascii?Q?Ko6sy89dWlZ9xjlPkRUfI7ZugkvB+Qb5DLSGE8AXCIRE1SqRekXF/kIXYtyw?=
 =?us-ascii?Q?iv8M8UHdlsWWHqRg7baZtT+ddGfBcIVibUWOLCmASm3WGJe4lk8vdEwf8pzY?=
 =?us-ascii?Q?c5H2wVp64EX5+LZvQMh9kqzsMh0lk7YOejTSLtqjdjdWoscGOplvq8tBNQDA?=
 =?us-ascii?Q?uqH1mLHJTZiD90QsD3gYkUe6/KJapJD4ruy2LBlJPICiMvEdf2dQc1lf0/VD?=
 =?us-ascii?Q?j8bWO94wyVW6NsHVVROLToLguqX643mC4QoIDpVB?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b6b5ff-22c0-4075-d14c-08dcc264c774
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 04:42:08.0763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M671UQog68+bYvXulsBZdibFKNm4WagR/saoqEMwclw2g+HLajB4Ny33BBu0TqGZJswph3oBR1VD3UqSdY9U6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5139

Let the kememdup_array() take care about 
multiplication and possible overflows.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/pinctrl/pinctrl-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-utils.c b/drivers/pinctrl/pinctrl-utils.c
index d81d7b46116c..f18903de1d71 100644
--- a/drivers/pinctrl/pinctrl-utils.c
+++ b/drivers/pinctrl/pinctrl-utils.c
@@ -70,8 +70,8 @@ int pinctrl_utils_add_map_configs(struct pinctrl_dev *pctldev,
 	if (WARN_ON(*num_maps == *reserved_maps))
 		return -ENOSPC;
 
-	dup_configs = kmemdup(configs, num_configs * sizeof(*dup_configs),
-			      GFP_KERNEL);
+	dup_configs = kmemdup_array(configs, num_configs,
+				sizeof(*dup_configs), GFP_KERNEL);
 	if (!dup_configs)
 		return -ENOMEM;
 
-- 
2.17.1


