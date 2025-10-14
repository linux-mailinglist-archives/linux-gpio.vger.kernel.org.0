Return-Path: <linux-gpio+bounces-27123-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 810E8BDA82D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 17:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8776319A41C8
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C5130277E;
	Tue, 14 Oct 2025 15:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bQRZmaQH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9AD302160;
	Tue, 14 Oct 2025 15:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760457270; cv=fail; b=TOKOOeAbQNvtKhtAUYv8t5XlGl7ng5WCbipY/NIikg2hSkchpzi6EIgNa5PGVOUSdbILZJZjjqgW8N6QXtvNz6Ln0IvqJEN2h6oR/ektfKVUp60hO8CXSZFy+bcFLEcuXU3tcaQSBRBMU40yY4pX97BYUawM+B7d7ZwYwCXcPmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760457270; c=relaxed/simple;
	bh=dJRG1mXqxZSaIS3vZlHPpHmC81EPBFLGa1EJqFnzoHE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HQI2nbsHaQ1FeWZ1hIAvBelvEZC/cV4CLMdHGjXgWgaDI9J/Pp0Srfyp1JbJ0cwFKS5HmqCdXwpnwEImw2hPBtTdW/qRy9cj3SovhEcdpuZnmbFIr1Oclubi+uZGC221UAfimQhD7OZEKKsFPYabEbGEG2gQlZXPyoQD30OMFbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bQRZmaQH; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaQ2zl2s1y1Hy9PbomBnLeUJKADrgwuf4F96Pw8qnnvru3PkdW1D0XBq2u9PvQYdMnEJ7S7l5a72scnW/F9AhJHeHRP5JfdCb0AAd901wSFOEPqfG2yq/oR5TnwgWZrY5rqwQoChL6v7xUH3c5d5fTsduPbyT/z9eQrvvZi18vMCSfyN1Lc+kdcMbw0PBP0lyo7U1YjSAnRy22nIXsbNsYmOCohmKkpzcedmJy1TPR+uY97l8KVEzH/TRMVXqExcQu3TzNDBEZFv3y+QcAh0DjLGa4zrCp8GzKnvq97HcCzeGtO7T6D/3QPLW0O3JDwRUVVMRrsC9TFG54LteJMh0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUaPlQiRB8xke6sSKRJlKwAAfM5e7R32lPw7lFLTaQY=;
 b=o8rl2ML79XkLWgFrvX6vqmXQWHz1zsUtwJC2+roKeNTDOb+ti/stIanI7NmQT7G12EAKeqOG5+OwYidR3bGcpvn2rYmbtRcl7v8cBHSFH+l2xancVnplwRUiPoAj2dPDgWd5aQweUG33iYbkoT6Wv0R76pOPLe0XfBTGgyHAXSPBC0ubEgeH0HykOej/jlKB2gEUT0V0JJ8oi1TujUfRJUgF7oI5DIS0+3kFUDRk3RBErDoOOdPhBB3srx/UendL/AlJh1lvaYqu/JDtzR56mt1zeBZVua8MC7G0T6P79HVy76sd8SAB6KvxjzZ+suRCu5AFZf7zZjoKHZVzqBrPQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUaPlQiRB8xke6sSKRJlKwAAfM5e7R32lPw7lFLTaQY=;
 b=bQRZmaQHV+HXyFIHmPnWOtrcYEKd8J8PvJ+NTIlIUjLqiYOaOYPGDXnuCax+2nkVQxnaXrwEIT/B5QCmNFvjDll2Ai4Ol0xSlJFwx58hKSCdvyfL7R2JE/x6dj5UOs65/OwR8mkRHapKALKJRVEegyfIjxnEiJseNwKp/uoS5s1aiFrhhahgTiWVrFgxh0LOkpS6XpWuiv5Ss/woPkMQjz7xKjYKVVFK40nuiutRzszu2w7eNd2p6J5uUGOIs/IHZKg3w0R/GOYNQNVsTaQG31tl3+4NdTQ4CHs8q2UCJNZHu/TO4USKiiydRq2b1E2NAtrPOvyUspgvPdCIHkxEqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 15:54:13 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:54:13 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v6 3/9] dt-bindings: fsl,fpga-qixis: describe the gpio child node found on LS1046AQDS
Date: Tue, 14 Oct 2025 18:53:52 +0300
Message-Id: <20251014155358.3885805-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0140.eurprd04.prod.outlook.com
 (2603:10a6:208:55::45) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GVXPR04MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: 4109c1d5-3b6a-4564-6043-08de0b39ebed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3pU6+njFAweUy0087DsOGPIO0QzUiNXEcCpVefpYzeQmHblGrnq58MEW+9k+?=
 =?us-ascii?Q?GoKvWbgC6defJDYMXILns5oufzNN4yXhomcdjJxYoivlB2cv+F7cU3n85O/b?=
 =?us-ascii?Q?1kB8koVP7oh3y/B83ZXPvhboPXyi+ZmoFkHIWNZ7cBtna6idCaFW+ZZILfPs?=
 =?us-ascii?Q?aT3ipjdifppPEejEcWRZvK9D9anY4AkIGjPVN0MCN7bHl3b21Ds/joBfs7h1?=
 =?us-ascii?Q?LbKeceAhwQ/HZuPfmdoT8gnwpvgyWVVcUx/KcvG88TOL08NjigVkb8JkXG/e?=
 =?us-ascii?Q?DgrNrWwk4VqXCzmYWPJH2v2akM86UmIhJT6V6NzuiEQ3GhzEW8KkGoVToFJX?=
 =?us-ascii?Q?xRbwuVaAgPCzf2+Oe0Sf8gb8RwMURwoqy5nPfKvCKwhU9PuQRrc42WyPzS5d?=
 =?us-ascii?Q?ecwTH22Aw4pUl/MNujiC9Hf7YmuJXa4UBYxfR7YYr48ebdkNXQSFBE6jQ9Q+?=
 =?us-ascii?Q?QhK7SDExpS5k+PdmQjn16mEJ7Ch0f/vXYnPRHbZOZFjwQvw/4DK71Gu5driN?=
 =?us-ascii?Q?FJRwjPL/9wk2a6x/ntKqP3BHSeBLieZL0GfXCZWSBCNElgyHSMNmnGAK+hqg?=
 =?us-ascii?Q?zxsO465NrfZjYBHVKwUAGGdqsTJyCXNDZA2Y5zXxy5Zgc10Ibn/Tpk7cJpuq?=
 =?us-ascii?Q?BsgCJBaUiCuREcO4KVXS+X6cv9JKUZubJT3fR2rh+BmID6nzLaJNu6gFVTr6?=
 =?us-ascii?Q?ZgQpnBxjKepoqMmo1wipIuN5bgUqRQAeGdBzLy6kak16ER1tCvqeBFZxntWs?=
 =?us-ascii?Q?dRABvtGUdNCxx3QxM5MGecz8UaPliYJ+gsXEQrsO+9vG5hxtn0SB435PtEAo?=
 =?us-ascii?Q?5mhg6YHpeHpHSacV6kdM5AElen8zJL8JkL1+5l5+LBvz3G9uyi+rK1K83n1U?=
 =?us-ascii?Q?2C0up+lpr/97vmqPL1rFR9C53x5CWFX/YK6ViiIddv1hK4crdvTshZpEPgrD?=
 =?us-ascii?Q?6w/j3m1TGVNe0UHQZwlaSsxPMXmPEIjbljaAMvrUpaxEXATd8PmCmUuvuhZw?=
 =?us-ascii?Q?v4nftJeaWtFEFKQ6fgkPfs1Q5u6bYLkknjPCZTIcxBunFQsQSlLXPw52a6l3?=
 =?us-ascii?Q?2rfK9DQ3uDQRf0b+kUlrlQ7BoQopVuIYBG7ks7VYim2TwPW5Wf/tFYJC5LcL?=
 =?us-ascii?Q?Hn11lXM6rWYv7qQELQxb6/AtxZkTRi5cGYhk4CP4+cNex70LZbWDTENDxmVo?=
 =?us-ascii?Q?VfX+fnC+jHRk18hAJ05PfQ0TiLjkjpsN/wIbYtM0NtmOUQ0hQeUyhyJpsHB+?=
 =?us-ascii?Q?nWZT3wKwYMmGHpqiU4HZ83vfG29GnD9PQNuUoS16cSA2+cvVYcx2/eNz5IDd?=
 =?us-ascii?Q?jLFP12pdNbhAii/uS+wiyFZu1L+Sd56HBz5EoF+O42Ti1f4HY+POqjGFlvR8?=
 =?us-ascii?Q?oYAp39EdT+YT+7UFsv0Ls4Izw4zZ65sZasXY1t2K/GIceyPj94oR+8KDSTHt?=
 =?us-ascii?Q?9thsNgRzQwN5DRuvrspjOXygNdioe5+7P2og+SxkYAC3bv3NzwA0SOKfjJui?=
 =?us-ascii?Q?Vd1iUu+k0ojaEgI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IkOI2d2noHfdFmyuRU4ac0YgoLW8BwBmVlRLO+4HMkOSt8pKpCQGRuXMedoF?=
 =?us-ascii?Q?ptuWKQGL4e5a8QkPfxttg5zTBL0XUghfJ3Lkx1iTTAIREwZcaYlLb2Ss/MF3?=
 =?us-ascii?Q?0HUb2ytj77lfRqnQm9f83dFgMnVLxdUElUlQ8UBo2lXHPaUo8tmkRWp5rjUz?=
 =?us-ascii?Q?dr9+xOaKujmciDUsS8uAWEkNTIvx2aXPTBVd+1mfCl1cChawN6C1EHZ71VeD?=
 =?us-ascii?Q?l/O5FH8E/s8zCnWWpBzKDuvykjHIIYnC325KiK7AzdFAOIBAe2SQzJ0hSwdm?=
 =?us-ascii?Q?wXddrQ4HZAlb1mzerTCkmQ1dZ1I8YESOQJQsWVV6H+QM6eL5pKfLZLI6DSa0?=
 =?us-ascii?Q?BV2W5ICuRVBQ5qjKqklUgPDs+aZtdW6b/IPEiGw3Po92Szn8lgSJvHx0HZvN?=
 =?us-ascii?Q?XJKc3f3vKRSKF+drbFdWaWFAgqIC0TQEE2DhiqG7Zj+aRKl3x4gssAcDGCpf?=
 =?us-ascii?Q?eh5S9keqXTAQarpsvY7xHoY74Xeku4lx5jgyR5GDrO3sO6p1tVm2/K5wPGSw?=
 =?us-ascii?Q?9Fjv8x7BQ+WAgAeb95YEv5Urq56px7gXRIYq/BLQNm6DqfnYlzn50Er9ESN4?=
 =?us-ascii?Q?RokW4NxUYiNC13D64SHempg8EgYv10V+MmdJlBd4ttQTTui37Px6E+hjFkxw?=
 =?us-ascii?Q?OTP7kYYAL0TDwAPrS4t3YlqyUl9vFIr9yrK1HfPmlxd+0VVHdgO6YzoX44kJ?=
 =?us-ascii?Q?QeIUM+gSDHwJEh8jO7fZMV0tviyogPQGbRc/rBu1jFYp5PiI9cdlVccGE62r?=
 =?us-ascii?Q?kCnxRVca54nFt1R1iIK5wNWbTPz8B5/zsceOtMzYb+jFcxlyJt4tlUapd5Aj?=
 =?us-ascii?Q?rlxTQ23hIf+9CEH5qzDAZnmai3N1A7kDJ03CdrhV+mQq+awl47ZJucCSHco+?=
 =?us-ascii?Q?S2dAGhQX4XrRigpFJ3NHuZWALjOLuuEzwwiKh/g3QysQWK+LI5DrnZM6UZ3F?=
 =?us-ascii?Q?XeH3TlOwraH/hPohTMjtuTNmT/mjXDneies6b37z74A6TwtLtaL97nkLDnIY?=
 =?us-ascii?Q?xIfuOKwYnrXVR3Hd/ZLAAxJKVYsmIHLJdTjdoTljVS2TXgPyIQYVZ5Dj8W06?=
 =?us-ascii?Q?ieGR/JRqGCe3VEwiRNLEWIJQOMw8bU60uZd8brA1XrAAu42fx66Udy3hDmy9?=
 =?us-ascii?Q?Ke4PFVecsAgCj9qYGG3rkXXR75Mij3/dbJUHp9UoTUMWtaDKxY6WiRGZ8Wcy?=
 =?us-ascii?Q?ucJdJnqeepTJDALR7ntVHG6jmgDYojSlRqaa07KXzDmI233DhdFRsRbN0ND0?=
 =?us-ascii?Q?lQLxzPWbmZIAuTjB4bChXnFIsvqsogF8jcFoO2CANYEWmfvZaXof1PtEXm7C?=
 =?us-ascii?Q?FE+ifEtLYSVK5RNjhzZR4BBhf6txGIHDiiyWzgiU652we2RS0NDJ+DNnY7CG?=
 =?us-ascii?Q?iGgibMgnGtwp2HS5lhVXDPrzr1dDSsO/7eZImdcgW5/n8d2K07yGgkSjWXrc?=
 =?us-ascii?Q?oh4dspZdMqgAf9Lz8iLk+I1ue+912dGoA41slaaAqSSSEz02iA9MowMo8txF?=
 =?us-ascii?Q?hVJwGDcq4OQloWFQqIneC9d4NHLlQqGye7IUnd4SDhM9hcjX6y6LXHrCwD0u?=
 =?us-ascii?Q?M0Zwqlf9w53fNMZI6AsCJai5rkCqvDheSB367ZkU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4109c1d5-3b6a-4564-6043-08de0b39ebed
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:54:13.3516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YsAuXSjt4Z7D/ksn2BlT0Jqxj4rDj8gfUyP/CRkW5tUbSnuqxkpue1I/XJlVyku9QbIN46X7nbQtmAdNt53FMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927

Extend the list of accepted child nodes with the QIXIS FPGA based GPIO
controller and explicitly list its compatible string
fsl,ls1046aqds-fpga-gpio-stat-pres2 as the only one accepted.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v3:
- new patch
Changes in v4:
- none
Changes in v5:
- none
Changes in v6:
- none

 .../devicetree/bindings/board/fsl,fpga-qixis.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml
index 5a3cd431ef6e..2eacb581b9fd 100644
--- a/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml
+++ b/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml
@@ -57,6 +57,16 @@ patternProperties:
   '^mdio-mux@[a-f0-9,]+$':
     $ref: /schemas/net/mdio-mux-mmioreg.yaml
 
+  '^gpio@[0-9a-f]+$':
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        contains:
+          enum:
+            - fsl,ls1046aqds-fpga-gpio-stat-pres2
+
 required:
   - compatible
   - reg
-- 
2.25.1


