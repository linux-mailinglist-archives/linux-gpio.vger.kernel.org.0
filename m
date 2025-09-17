Return-Path: <linux-gpio+bounces-26287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB816B7E1E8
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4119C3258B6
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 09:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730132F25FA;
	Wed, 17 Sep 2025 09:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HVLPCzHL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AA830596D;
	Wed, 17 Sep 2025 09:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099896; cv=fail; b=GOJPj4n40n9NKwcu51ONuxduetNBZk6PiUZorEY6IBonmzzU+eZpvakZy2kzAmfu1wsYulMsHPZ6y5JVLStCe4tTMZs8ToyDL6GUHLIk90nbQ6wU9qvdl+n0lgao4vTGbNDFW04S+po+ES/u9Xdg/v4MxqBoat7E0qI2YtGCFDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099896; c=relaxed/simple;
	bh=/IIv2tBZaaOa86vNSlxFM98voEr5KTOi9yTgQqenguE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ux2p4SaSxUizzD7+dwZzSbuv7wlbGVDNM5qjE1PESBdUgG4W91DUNGzjWomEoH9RpOvEm73jUMddLgSyKsMnjgvJzlgb2AuAWJs7FcHXR8jtylN5XjD/EaDh5/qPl7q6gnQ3xNCS9DKoDQLPiV2Tbg3HlHk/A1w2FwGWFp6USZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HVLPCzHL; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Af6HOKIdEwK17o7bRtscrsxjZDFWWNA6pvF9jFHVoWk2L9poDV+Fzt22ssR4dJrohO4qvHAVMjoxqi8oV4t5xsGkmHDI8vgsgbeDI1yLrtmPdlKbhp79wb3p400LjPs1cLf8PV9GTYAKRI3cDdXGOR+HfSPYhtJQOnVFWj32r/Ipg+xyXCBELERs40e1gRvbbRXC1KsgcOgcoha6SxrlKryaGSkWmSImRxFE6OMfgzZ7aISAMQ4wP5D/RN94g7Oakm/yiXODu9XQK25LRdut0dWCYNQkKDIqxtDcyRYBBbE4o1fGFVROVXWbnYPXPJ/G2WxLybtwP/7BxtFC4vuOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9GDZupTYQzu1HKqE5vXI9jXvA6AMTETBKkSWVCIQtI=;
 b=t0i749rIffUWIDf9mKMOCDoZPDkjoksttgN3/5lM1NwaCyACDBDMt1Ix+gWrwx/PpXjBnguZtgQlGxqg2NM22DOWxC2JBgqTUbybB3tazG6YtieXG8sl4QLTCCCbIf5Rc1nRNFWC1Lqx6ZcsoHZMjPhOadeQo2LobmcmAmwlcv5T4gqLosuJojsD5jeO7pyBsQZ702HAVIPc4H/DObnnOJE9eLukAQaSMJ2JOrfm1d4LmLyCSjXSRv8JkDmE9xmUYaUVCZPwEQ53Ujzfv4xlOGAilDac9PPYD3c3YS/qqZlR+pOyVHJqN52RbcvTIkoGFSt8vAs3dI43jauEh7vGhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9GDZupTYQzu1HKqE5vXI9jXvA6AMTETBKkSWVCIQtI=;
 b=HVLPCzHLXNfBOsLK641uGCdOO7MsR3N8TOCpa4FFwbhk9/5jySkgY2gHrMJ1ftRFKueLkq51WAHLWJ+eMYCTw4rIdsg6xZZPye99ZOuKNQAB1NpwiJE/FyfShXFWt/MYTOzAQ4o8XpLjw5PTgKpLOg5I/0q1H+Lz5hNj3TkUZEXyJy0LtYsXE+xSi/vX4iW5sqonSQ38DQd3OBSbW2nsvr4zw4K1NxA0/4goF77nf8yFqQ7IrCrKAdzMMjT1dFbF1I7Z9TtY7hZw3/iOtXhbhozmu6jFMh2XQ77WTvARd0LmIur6D+PY9HT7QBv3flmp43OdRkTjnmcu5mt1i9f61g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PR3PR04MB7387.eurprd04.prod.outlook.com (2603:10a6:102:91::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Wed, 17 Sep
 2025 09:04:51 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 09:04:49 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 00/10] drivers: gpio: and the QIXIS FPGA GPIO controller
Date: Wed, 17 Sep 2025 12:04:12 +0300
Message-Id: <20250917090422.870033-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0005.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::14) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PR3PR04MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f85f86-70b1-4e86-0c38-08ddf5c94158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wrv1M7xqK1NngkQTq9AwxG9QtU2UVC2TMjmX9dHkTbYWpvJ3JshIeWfrzHMf?=
 =?us-ascii?Q?DN0x46qhgO+yaPbmQ+54Rmh+67HxShA2ttU67joTUjhPq8Y3YzDOtE0zELjS?=
 =?us-ascii?Q?Wpo4QTly/UNSqwhtovwQaJSElyzAWJKXshzhnO3qk2z3j5d7mf5OUFWTZ9OM?=
 =?us-ascii?Q?jgpu2hZz0a9gjYMsMP8I42kz36/7ojhit/oFdVzcyyWMBcglw8pMJpd3kE2+?=
 =?us-ascii?Q?AgT78RQjLrdKP2EpPt1OAxB+W1iboymZ7lxwXBSucRRKY5OibUjn1BzicSwz?=
 =?us-ascii?Q?WBl9wkiiOhrAvPnCGRdRnJT6TUXHhHp9KjTbEUUbkudH4fhbZW1Rf2+BWJGe?=
 =?us-ascii?Q?McuUbDssNzeEnwirlSKsmHJXZ8RxH1KO3EKL1313CyOVFnL+eRyjsFqGQrEz?=
 =?us-ascii?Q?A9isIV44A/SbcvKiZs9Hd/kwScxPpYuxRFVgxfr6+ye5tGUCOSCJ/+1yuc7j?=
 =?us-ascii?Q?fVYRlK9yan1MLC9JxyW6wGelrtihkEz3uTHzRHpmuwtqOd5N3eCSSipOU/bk?=
 =?us-ascii?Q?F+jG5hKOxzgfH0tFhmWNeZFdX1Xhl/SfnPaxJMDCqNfDppvE0uUXEzSWNjkh?=
 =?us-ascii?Q?rW7sFNuCWBci+bzHKO0KboDMhU5hfIPu3mjJhpanCDNjqwIIutMlq2Qituz2?=
 =?us-ascii?Q?UW3kI9g/s28qJBQwInCo7LizGJw9MPEY9eXnpuvR7lGWQ75SIpVodv6nG2QL?=
 =?us-ascii?Q?9qCFKp25hBXv2HjY4MtnOlCHhGbpjpgWNwsQ09k2E0oBCfXtDnau2COOadq6?=
 =?us-ascii?Q?D5SkkrVIBaM/GAm55XAKsRy6FMteyNG1dHGLxoxDt8EnSJRZHr6mqyx/inBl?=
 =?us-ascii?Q?A8/wG2aFIcY7ifpoI/SULoN7nlNAldBv2mnmrC3hqOLLaf/UXuyIXRPpZBa/?=
 =?us-ascii?Q?FMK7H99lSMlqaDpqZdGtYhAUXt8Z7PESBvqixg6sV5ooa6yFNmJa9pC6EesB?=
 =?us-ascii?Q?tCEhQwmyh+z1sIX4uoDk43X+7ey34V91VE0HGCyBhlHS9sQLcosnbJnCLW5/?=
 =?us-ascii?Q?ApDH0s3TfryPxbb8RbIELhi/HNmkFeX1uhVLlVIevcjFawwY28UXtGUxvO9L?=
 =?us-ascii?Q?TcESFntKKSBRV2GoNMKy6h3qIl2sCZvTy7jBpPweSKrlglPmn95xKPhoTHu+?=
 =?us-ascii?Q?YNPaa8G/RCHkQHI8GWfiWGyb7UYul/81KZztVEImQ7u5KX+e/23FFMfR5zvL?=
 =?us-ascii?Q?mV4mrLB/PvqXfroJGSnY3Skx89Jlqw4Ls0ehyaB6L6muOGXQeqxUTPxRQgHJ?=
 =?us-ascii?Q?kAbyBxY3zSNWcmTZm93BBjAN9FMsONhn+jQpy3usvnUxJFSjVk9a3m6zdasE?=
 =?us-ascii?Q?W/UoLlPDA5WjmE5g5JqxBv8I/0TI+s8HKhZsGzm0VCW8gfkOEOp++6tfO784?=
 =?us-ascii?Q?wK2JdCJb8lsfn90t6MT2VebbNHmroWIe9j1T8vn/yS+6oE2TdcKxZ5RmjgIy?=
 =?us-ascii?Q?Pl1oX0fIGEI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UHWag2V0i18yuXRuf7MHtxvvGpzUEnVQPoF7P4rgjU4Pcs81fb4btbpGfgJ+?=
 =?us-ascii?Q?g2tkOtrt8RS6fe90nOAIEhJlUySkoI0EIHAbeHmfApjHQMlBaacHDoQOUNvA?=
 =?us-ascii?Q?vvZ7oJAGN+MHTS2UaDi2sCHpmOIGjoUkACrifvZzCdTfnjXUsuWpIQLamhLc?=
 =?us-ascii?Q?5BIhIkIH1kYrDsigzQ0uy41IWzSa+XLQIay0Q8p9I4AGnwDmjtA7Q+IasRCV?=
 =?us-ascii?Q?q13I4Td8Z7z34sdAi6AnJSQwLoFSnFOuFXnkAIiZa1NKDgycqnn2jU9kxz7/?=
 =?us-ascii?Q?SLiJEYZs+9r1JhZ5ggiyoJ1korKGI5Y4eT6Sdoykts6rDB2rf+Dh3YAJo5zR?=
 =?us-ascii?Q?F6mOm7lLIfdJURpS7d4jKPfqjenx5dGmTcHdkLu/iJtiJW/npaMeBxwg+C0+?=
 =?us-ascii?Q?BAbp7QGYpgno0RnNrQEox+fQ4n+RI0sG7tjg0TnFbuZe+sj9Dt8dcJUMQEzz?=
 =?us-ascii?Q?k1HTZRBdVMcnCpyQHbF0mVMioRJcTDe/2hjiSUaOyHIZA9AsA3TsRb8Iygvz?=
 =?us-ascii?Q?W5BQ4zbn4M5Vf6caDfeHFFxt/VGMkVLSzULLyW0cYf7KEG1M3YEAE1KtFLsO?=
 =?us-ascii?Q?M0iYPVgg4XYrXLF4FHrSrjTY6JtfYz8xTpZq7JWWzc0UcRPWcu7ObA87Wm7O?=
 =?us-ascii?Q?xdocniZcPGQ/m732CT/zsqxI6+s0gbCXjDp5i2jx5Fq5KNTRhUlFXQEyVCmH?=
 =?us-ascii?Q?7/Nk2tSJ+0H1D3KDSTmaVmnYEDx4exVeZkF0Mlts6hsX/H5S36xwG/vqc/x4?=
 =?us-ascii?Q?2XxoRV0UbeiGYyLD2OxD3r2795tRnNateHm9LmZJR7Xt7WZNKh9+QL3xg4G6?=
 =?us-ascii?Q?9zd5ou4JxR3MfkgcEOz5Q3ErH7upAI9jReVIbLwNayJfVCmacg4jqfZK0gv+?=
 =?us-ascii?Q?Guyz9Tx7Yg5LczgEnJMxw+sGol07WTYhKNO2Xj5pXpmqD5D20cCT12d8NacU?=
 =?us-ascii?Q?8m3JFCi/OEtGmgTp+YlO+205bi+JqI2Kd2wmv1qY/c5+9zurGHwGHuRYGd2A?=
 =?us-ascii?Q?9X8loO8ocpPOrFNOIL9Zjg8mSFxzbp/wFQnIm9CEEbtk7igWm3iHAfVYx6id?=
 =?us-ascii?Q?x4fwIJHPV6U5T69A6/Rlwmjho3dcOiu2o/80Fdfa7PLepy8RAhbU9GEq19/i?=
 =?us-ascii?Q?NxgM8igjfcSms9VpggWCABJMihVGpG0X7NLWIY2jNRZVG0k+RJmr5UawOxms?=
 =?us-ascii?Q?cXOUgcvHRDrizM58DlJYWHfWs1HDuT/FHzeAheHXlDaOvh3IqDUu45zft9PE?=
 =?us-ascii?Q?RlPqnZsI+Yy06AJU9Fw8NAJEr3wl8axTeRXSIjmK5lCf5hKftrb1oFumLwh1?=
 =?us-ascii?Q?KKt6PnpGM/w5+MyLrsngVD3ObNuDMffos3qwtgdbKXEDTuuI82MRWneTu76R?=
 =?us-ascii?Q?OqPxgH+85youbEspLWW25enGliWrXL/kchgDYsM7F1SJqJbC7HeqClEHQAo4?=
 =?us-ascii?Q?NkEIX0GM5ViQzSh6f03gzZmJRvDMA8R+4EDHN4aoe8pV29ciRTq9Y+PK7IOg?=
 =?us-ascii?Q?CkexClj3uNy7B7Kdhdh1Mc8eUu50tZNCkfN7q6gtjosKICcGEMcynoCI6kX7?=
 =?us-ascii?Q?je04mgYc2088cxo0CN9tnFf7avBos1IoXXIHqpSf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f85f86-70b1-4e86-0c38-08ddf5c94158
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 09:04:49.3437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVaTTheEvsu3BG8dRJQ4EYS9vje5oFmG+eVkRwVpBgzVgDOLxxnQQ2IypauHu9UUh0COWJl+Qy2riR8kDkLZwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7387

This patch set adds support for the GPIO controllers on the QIXIS FPGAs
found on some Layerscape boards such as LX2160ARDB and LS1046AQDS. At
the same time it describes the SFP+ cages found on these boards, which
are the users of those GPIO lines.

Before actually adding the GPIO driver, patches #2 and #3 add and
describe a new compatible string - fsl,lx2160ardb-fpga - which would be
used for the QIXIS FPGA found on the LX2160ARDB board. As opposed to the
other compatible strings found in fsl,fpga-qixis-i2c.yaml, the
fsl,lx2160ardb-fpga imposes a unit address for its child devices. This
will be used in the next patches when the gpio controller node will
define its unit address as the address of its underlying register offset
inside the FPGA. This requirement is described in the yaml file and it
only affects the newly added compatible.

Moving on to the GPIO subsystem, patch #4 is extending the gpio-regmap
with the fixed_direction_output bitmap which could be used by user
drivers to transmit directly the fixed direction of all the GPIO lines.

Even though this patch set touches multiple subsytems, each with their
own tree, I submit everything at once so that we can have a clear
picture on the overall intention. The hope is that each subsystem can
pick up the related patches since there is no compile time dependency
between them.

Please note that CHECK_DTBS will fail without the following fixup patch.
https://lore.kernel.org/all/20250912165916.3098215-1-ioana.ciornei@nxp.com/

Changes in v2:
- 1/9: Used the newly added trivial-gpio.yaml file
- 1/9: Removed redundant "bindings" from commit title
- 1/9: Added only one compatible string for the gpio controllers on
  LX2160ARDB since both registers have the same layout.
- 2/9: Enforce a unit address on the child gpios nodes (remove the ?)
- 2/9: Enforce the use of unit addresses by having #address-size and
  #size-cells only for the newly added fsl,lx2160ardb-fpga compatible
- 4/9: Add the fixed_direction_output bitmap to the gpio_regmap_config
- 5/9: Use the newly added .fixed_direction_output bitmap
  representing the fixed direction of the GPIO lines.
- 6/9: Use the same compatible string for both GPIO controller nodes.

Changes in v3:
- 2/10: Replace the trivial-gpio reference with an explicit mention of
  the accepted child gpio compatible.
- 2/10: Reword the commit message.
- 2/10: Add the 'else' case to the if statement.
- 3/10: New patch
- 5/10: Make a deep copy of the new bitmap.
- 5/10: Remove the offset check against the ngpio.
- 5/10: Added documentation for the new config field.
- 6/10: Remove 'drivers' from the commit title.
- 6/10: Remove the qixis_cpld_gpio_type enum since its not needed.
- 6/10: Remove the NULL check for device_get_match_data().
- 6/10: Use a bitmap declared on the stack as the config field passed to
  gpio-regmap.
- 9,10/10: Moved the reg property before address/cells-size.

Ioana Ciornei (10):
  dt-bindings: gpio: add QIXIS FPGA based GPIO controller
  dt-bindings: fsl,fpga-qixis-i2c: add support for LX2160ARDB FPGA
  dt-bindings: fsl,fpga-qixis: describe the gpio child node found on
    LS1046AQDS
  mfd: simple-mfd-i2c: add compatible string for LX2160ARDB
  gpio: regmap: add the .fixed_direction_output configuration parameter
  gpio: add QIXIS FPGA GPIO controller
  arm64: dts: lx2160a-rdb: describe the QIXIS FPGA and two child GPIO
    controllers
  arm64: dts: ls1046a-qds: describe the FPGA based GPIO controller
  arm64: dts: lx2160a-rdb: fully describe the two SFP+ cages
  arm64: dts: ls1046a-qds: describe the two on-board SFP+ cages

 .../bindings/board/fsl,fpga-qixis-i2c.yaml    |  58 ++++++++++
 .../bindings/board/fsl,fpga-qixis.yaml        |  10 ++
 .../bindings/gpio/trivial-gpio.yaml           |   2 +
 .../boot/dts/freescale/fsl-ls1046a-qds.dts    |  52 +++++++++
 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    |  78 +++++++++++++
 drivers/gpio/Kconfig                          |   9 ++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-qixis-fpga.c                | 107 ++++++++++++++++++
 drivers/gpio/gpio-regmap.c                    |  18 +++
 drivers/mfd/simple-mfd-i2c.c                  |   1 +
 include/linux/gpio/regmap.h                   |   6 +
 11 files changed, 342 insertions(+)
 create mode 100644 drivers/gpio/gpio-qixis-fpga.c

-- 
2.25.1


