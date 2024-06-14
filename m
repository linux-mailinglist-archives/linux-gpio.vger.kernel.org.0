Return-Path: <linux-gpio+bounces-7461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1AA9093B3
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 23:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE78EB20ED9
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 21:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38651836D1;
	Fri, 14 Jun 2024 21:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="TLALYyv4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2047.outbound.protection.outlook.com [40.107.14.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B468E143C7A;
	Fri, 14 Jun 2024 21:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.14.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718401146; cv=fail; b=QUvxq5IaanetdVK4ZSGCFCnB4M4oq4zVskqVUfca/XCNvB7Z0Th3lezQB76lBvn7SnhhtcpIWEp9bHMj3i7ZJ74hWNw0IcJkLpL+8B0y4pFe5G50V5/WmmsMJfx1LZYme5t856EUl8cs3DY1zOIxfkzxe8thmmiJrXCgTPQIcCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718401146; c=relaxed/simple;
	bh=wxN+UPyITBkyNpizflLgeJlO+bj/ytSVVDOAwm0Qub4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YZ7UXwr4mLFX5zHp4qCTQP/vtWVuR4cRi5C3ahMKCR/6KBrRc1RfDnW5+bnCtc2xklkktvrFdQ8Gk4O9TZvikNH5S97djZuXv6khRbuWOVo3otS/Z0yJMAMhGTo7tjQ9HKuQJ1d/Pq9ukenOx6/gNqjOrOe1Fd/RjYO0Vt9h4qA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=TLALYyv4; arc=fail smtp.client-ip=40.107.14.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLY20SDmv+dE37KGi82LrUjLD4xbPqYsVg0blWFe2sJn4A9eR5KKEACxtL95YmJXG0t5ZUf1aKJ4i77FAyU8K+hTS2DU/PENWY6q+vyty+5MQ9HJIV6zoTIuuFzrLkUGbDfYxTKoklubAkOriAfAk5pgNN8leStIVr7ILx3CHLEqgLarCpOersoRwlR2aZQBBnYKYMEWwghGxNSk0veoHlabYZGaThUo2L9eaMTXqHPihLwxZKZbA7OyrQ1e/CHz9CFasjGbbDtLhaabS0lbZQszLjN/f8Y/jgxkhPkjpMC0ePAtC+n54ENtVFA9JGL3nvebFKsLEJz5oG/ep3bO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5Y2LtF03k2lnMz4IxvTudZQjoCkHcFx8T9gJ1uQ5uA=;
 b=SlUjJelV4vtsQ8YZy3eQVJ6hhbxQd3JqJiwilKAaQckiiCGeSiasYEZSeSojaqOCohNEhtSSmjxGccO9JCv5XSLdbBDwqD6PR5RNFm6dQ9upyJ0pjyyJdt1WXfAdGTuKDl8l7xw7m8xjanNKDw3JZgSpKZzJiyCLJwWAyOlFh/hMlscopHTM/+SFkya7uWeTdR/b9LVdIMiZbnJ4AJfbefw54ZEyP8+StjiYRduXAIp/S2r3e7FYzyucki1ueANPtB6VYex6V1Z+IW2eG5PrKAU7UR6hLiApeDfJKide6kJAg9qeRXPn/dGVt5CCx4QiOVie/BHowdUntLw+uQ7bjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5Y2LtF03k2lnMz4IxvTudZQjoCkHcFx8T9gJ1uQ5uA=;
 b=TLALYyv4M4yRrRU+6s4oQGDDAsamSfVUgXpBGhZnEi0x90ZdTNN5NcaGVFRROsc+WlBUs3MH8jv/HARIutYGxg2pLaUUSymYAL3G0NWFREme6jTZZtsPPFAzTY4xrASnXSJhXjm8xrNO2mIV4adsLFQVmpVCrNI9rwG8/sqV40A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7867.eurprd04.prod.outlook.com (2603:10a6:10:1e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 21:38:54 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 21:38:54 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: gpio: mpc8xxx: Allow only use 'fsl,qoriq-gpio'
Date: Fri, 14 Jun 2024 17:38:39 -0400
Message-Id: <20240614213839.2532061-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: 118b53d7-6f7d-45ee-29c8-08dc8cba633c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|366013|376011|52116011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7JRMvwuBLf4qYWveu2Kvt3sVuEFsljn9JmOTKwdeqpMnUF2vi0wL5nGx+7Au?=
 =?us-ascii?Q?hx0dItXsGd/561f3mmKYBPNbH2ezBewByBMBywuERHBubo14K/xlQrYtPO89?=
 =?us-ascii?Q?ky5ul7dSUpmtSi/RbPxzIbdmmKu9hXUOi/6oOYm3rgEZ5/TjB0myRMTv5PoG?=
 =?us-ascii?Q?AyeCnt8Arq2j6Q/g4DLmfvUFQ61PsGbmiAc0ZKdsi4MgwAOGAMb6eB/Nq1jJ?=
 =?us-ascii?Q?asiqVe1yEG7nq1l8nCaOiTZ8x4e989l1/kK2QNA9AuJYLbbE7HurcF55Bbqy?=
 =?us-ascii?Q?qiNvW1Abu1P8CVFG4Pd6VaNyp8CDAw4g85RVrS4JXOS63vlS/nSvE++azI4c?=
 =?us-ascii?Q?RM/5A5WxAAO1JdGV6/jk7DdRDSgZZsa3F/DY8H1y3LTLuTUkdH9DwHnVhVrG?=
 =?us-ascii?Q?xdFonxGRdeu1yVXZrLGPXHsH+kP3jZMm7hKC7k3quECkvaZrsVzZDBjToTF4?=
 =?us-ascii?Q?+uLPcggcIppZ4d9K3IDTb34jUWzS1XPigqbun0dFVFn3FeRyFvmBoYqr0pdQ?=
 =?us-ascii?Q?2on/8UQFTvPeF5Jfca23REHQ/UZpEPdPf7c5tlo4h0lqiv5LfWE8d5UVAH23?=
 =?us-ascii?Q?P/b9PF2iLrTm/zOwjPJoyBzIBejH7r7PETwk01OGUMu4wpVBu/SmM7ZGRBtH?=
 =?us-ascii?Q?5OzBNGZoj8xJlbluDSVBXrYcHeUWnZPUCCl5C+P9yRAgF6wyS9qaeTVZ7FFf?=
 =?us-ascii?Q?rXRzorRTPs0Gmp2bA63lKTH5d9ZKafPCeC0++9FXxMg/4HwdfoPDH4gAwfek?=
 =?us-ascii?Q?qntffH4nDsQeluKk+t6x4xxkfutOyLh21BGGVuW1x2A9CNuXgXLVC0PhCxB4?=
 =?us-ascii?Q?rgm7aslNBAuBnpcmO6CIN7Dc1j9QxQHc3DYUI1hP4F9qQ7H4eg9KCIQF+fV0?=
 =?us-ascii?Q?eBIqXKcakvwnZb5edZSCYfWWA7bxzBuXPzSi9KBW70xnOnlQbCNkCSug7FPI?=
 =?us-ascii?Q?6N5P5qlHtRYcWQFrJ5ksU06yGyO2ktFsouDnttMImCZnDZs5w2Tpn1jWDDNF?=
 =?us-ascii?Q?VeEOzhfTUkU1p++FDJWagmINxZg4GKi/cMcVatPIFGTlnpOyVAjqBJFL12nW?=
 =?us-ascii?Q?xd1YhO9UEPhKgfd8twD16x3VzCom5KjKqUL1dgxZWhmofKumMkQC9DRt8mGU?=
 =?us-ascii?Q?INEgAswrTeIaq7G2sHYJwQ1tZrNAEX7FPe+MpqCtrN0JeT8pHsN9n538ZrJk?=
 =?us-ascii?Q?SZCN5s9G21wYzL+0BP8HclYPwKe+Yv+nJA3UDLtBUdaa5AGVPPxwzic141I+?=
 =?us-ascii?Q?OSk+Y/xAYJU5ieFAoTJqD7O5aXs+dPIyG38l3D3yg0Vey+bQt6iAowu0Lh0o?=
 =?us-ascii?Q?KUtNkwkEMX+nTBdNLQRE0N8PBdZLmBzYelDYxDFgihAAN36vb6Ov59D/bQh0?=
 =?us-ascii?Q?ZHDiRbw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(52116011)(1800799021)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HqJsh95TCXDyny4STeHGhcvWGsD0PXF1CyQzaFkoUCXRcFnpWRl72XRd/5eR?=
 =?us-ascii?Q?TPJZ7PQgmNtW2jXD+Wd7dU9NArvldGgiR3z7UU3zXmsOktcPrxaBdWr+3GEj?=
 =?us-ascii?Q?JAJeDl/tW9l6TXhHpcKV9U/zeiqSr55Luw5zZub/ShmK3gcpQpcSZDlrviaw?=
 =?us-ascii?Q?8nbAjW+WbQiq6aFd5SPOLejgmUG+krVi0aSryA8GPSkwOsiZVRkUc45qMY+o?=
 =?us-ascii?Q?pFeNygDvLgkbcaSjCfvOqkfx9/AM4iH35Ao/NM/bX5aDMFl6C0HdGL24tCzR?=
 =?us-ascii?Q?CFqZUJbmkmmtFJZAKIJGZB7faeGSAd3vo37izLs1MSIvSecxHvrAnoMk4IaO?=
 =?us-ascii?Q?WxShgEb3KhC6HCwRffeq1BXriCNllfPCZCTEyWt5YwuNNlmSD9bzE6HklUy9?=
 =?us-ascii?Q?YuzWViFYmTWZCdT1upHkdCy5N8GsmoT2aaXLrQKjTB6+4xn090dGS7/7tXpG?=
 =?us-ascii?Q?Dux04+sy60SRlebN9SdT2mJoHJpik/fxAdoEe4qRDy9uG17X1vBtnqpum8VY?=
 =?us-ascii?Q?cUig1NIpij51AsKb/16sNny9wNGrqwRFW8vEnWAu/bzzumAIC1xOUnGdN53e?=
 =?us-ascii?Q?uro0Y21pzgCT0ZyhtcPgsCWbg0NbzQzPo2JSBEG9+PVT0dIbg0aEdR6rFwDs?=
 =?us-ascii?Q?GJN+OkbI7KpYmKqUMWqKtR4v59H/BsyOsjPPFauiZwfPF0lL7xv2PNvIQfHz?=
 =?us-ascii?Q?KoENURSfM/rfhA3IIAEh7oOhB5vntshhzKgis1SwwgiZWb+2bhsfK4OUEYd6?=
 =?us-ascii?Q?wrXPOVgUG69TjXDd5/YZQ+sQmMDQ7jcIC7elQfOrPyVGo5LT4/bCL1yZ8F4u?=
 =?us-ascii?Q?oTfgJ/935Hu0DSn5wKO1tkZ3hdMN/WMpwtX9pRplWhPZzWlK8jvCYu15Rt9+?=
 =?us-ascii?Q?BNyY9yMiIjIANIM7pq4kavg8sipOuXzP9c/s1eR6cvNkX9DeOovgzpM5WCmC?=
 =?us-ascii?Q?0VcLprrgI6JViG1Xs5JYq0Fgsa+YmK9Ov73ksnHIHq291lunuGAVwSFkWhbC?=
 =?us-ascii?Q?magHhLKSdzFoTUhD+M1g0ZjiVHpyIqEO/C6KDQot138IWKUWR2/0Hdsx+jTX?=
 =?us-ascii?Q?ul9EP8BEvjwkNhcxSRx0xdakBd43UTaCB6pkCpDWkCzn+5WI/TM3pMt1z5Yo?=
 =?us-ascii?Q?X8v1XV3y7JSc5t96KH8Sy9TMtJZT9gv0TBnCj7QuKANmsom4juef/6D54b0c?=
 =?us-ascii?Q?4gUhv34qLceaoJPUAsvfpqMdVQKd2DqpAl4+Hj1ai6CAnrNPZGivQxPlxQwD?=
 =?us-ascii?Q?roQtHaRS2j3UAtfyvzkLbdg8GnNMbj68YuLcTrEOKcy3Vl88Mxm1SDO9/MTi?=
 =?us-ascii?Q?NhdGaqbYNHS1CU/lQ/cAyxAaTXnnQ0FK2nXCij5yNzgZf9kqk6WFjkvBHhVm?=
 =?us-ascii?Q?89Jmp6mpAovdet+OIWQIYUaRGQMjfpZ7A67M11VNo0HWHokBJRgE8gWlapoX?=
 =?us-ascii?Q?nYGhts88gxB0YWxTNcQ98qJLUQwlVTeJ1hinZebUOtksHcbXjRgx+J1R7zUF?=
 =?us-ascii?Q?LsdiJEmuy9Yn9Dd5++Tj0FTD0EZYpabt9FmP8fnu+FQpE2L+NoaHIKP7OMB2?=
 =?us-ascii?Q?tphfRnGrhT94n0biIVf47pY0x7cojIBNdN9iOccA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118b53d7-6f7d-45ee-29c8-08dc8cba633c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 21:38:54.0902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWWHRr7eVyAyLeV7pPsAl46AmK2MPrMqEJiiHvlzGx4hqzQRjBO6II675frRWXlU1pgnWq7f+gJ1hbcT7yh1hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7867

Allow only use compatible string 'fsl,qoriq-gpio' in dts to fix below
warning:

arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: gpio@2300000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,qoriq-gpio'] is too short
	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
index eb046a48a3f59..ef72f569c8387 100644
--- a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
@@ -19,6 +19,7 @@ properties:
           - fsl,mpc8572-gpio
           - fsl,mpc8610-gpio
           - fsl,pq3-gpio
+          - fsl,qoriq-gpio
       - items:
           - enum:
               - fsl,ls1021a-gpio
-- 
2.34.1


