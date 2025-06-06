Return-Path: <linux-gpio+bounces-21093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16260AD0666
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 18:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74AFE188D3C9
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 16:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04502690D0;
	Fri,  6 Jun 2025 16:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bsTP1r+R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012034.outbound.protection.outlook.com [52.101.71.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABE219D071;
	Fri,  6 Jun 2025 16:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749225858; cv=fail; b=Vl313PcFtgobIDbG5O2vLEGas+QB78F93GkO8nmMRAnXKH0LqXv4nwZNPbzA5JIytzud7NFtNxY6twVaZrU6Pn2i4rV6v6PoCg3NLo+Tz4tA+UnZTI3NikRMQLQK7iVguNoSyDmoKMvoDohKPpjp6MEhvzFszYc2Ph2TIsEe9xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749225858; c=relaxed/simple;
	bh=hg8c2ZcafLgh7IISbDqwjy3Ld4mQU+pb59/OBfCQS4I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SL9/V67zToeq29ijdhDkDSWQw1IYtk86QVeI00Hvw7UoVhAGle6RG0pY19bkT9IFWB0JJGf1aM5F3iFTyR0b42BnFhmN5p9QsIOyxk6fTEOl1tLNv8j4BDydG3/HWNI4Y24ILxq0NWB7tY0+UhZN1aLnud6Ufd2w7fzh77KMRq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bsTP1r+R; arc=fail smtp.client-ip=52.101.71.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1cIL+lZaYux/akZJnbW7M8gs+JZL+PerAb+FWzuyZAyNYJcByzs5LsoI88kZfRll7/GFolmSSP9O/HNaYQ4/Atys/HMc2duMkO1e3k5tIX0oPis9YzN5Ml0/F5WnwVb9XXUFv/RMMOC0mee6iKjEmIv2xzlS2eqsPuZFiLlURGy7Ll+dnzOVsy/dk5BfSLNjtw+XTUAOeQOPay4hlPPOQw1gHYrCoXE3vuhMtyqvp39D7QZjKIaxMOU9egxCpQCxAF6fLeJoiTNyHXnBTXhxshNamdw9OWWI5WZdttHtILCF2xPqE+ZLUj52fVG3mOxDEeEGY+gA5l6F8EEDXc6OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3yFRJpNj4ljKDXeHGNibszkf+FPY81/fdf3l7w51N4=;
 b=kUjLvlq2yPfbGFkepcH/s9pe/hySXgHBDbB/SZ03Gcpjv80YOyLpBMnSkvN3lyoFy22CofX7AUqtgOq7LAlOEg63whvsWSZ9AZnfpGh2NHiX826oMXm2+hWCdWiQqFAxgWuZC94AHcOkndgHzzFi6LhsDn8RXPVobQAXe/7XcZ5vTWIyqEwrFP056GYsxhNy7tnsywqbSUuZQ0zJZZtOrhhX2Dqspx/ycMK+EWWpxZ4BRBszgoXMpIdQRURgJS5D8FIx+UVjUalRNVIMDWBO0L01UgYQHa1SRCMAkLDD52DsqNQK/+xzTAC08jNTWHA+0yZRBXEKgGW4RO4ueVQi1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3yFRJpNj4ljKDXeHGNibszkf+FPY81/fdf3l7w51N4=;
 b=bsTP1r+R/1qrNot80a4sEtqR4rRbN0AE+KyF0SWOpe9K24cHnZU6qRWPB0ACuXzG9uEuNIPAuByOjnzHMVtPi3cNheEkq2DmC01PokEc7LjaoQEqk21us3+5+7AMAFMJqdokEfjuxkaTK5YDS/CTSVPPBSFU1BbEidfm9iOttPakadqmNE1QFssdGBsm/jXuRJQwjqE2WVW2D0h2iI4ltOcmYcd1pTLWMhplZsWk/MvrpnszWV84EgmqP1a87GRtHDvDTydfKeQulsULqFtDc0vws4lKiEAgBREet6yJzEwjlrI6//od3cZHwna3oxmNSSB7WfUe0kIcrLwoyhn4QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10045.eurprd04.prod.outlook.com (2603:10a6:150:11a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Fri, 6 Jun
 2025 16:04:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Fri, 6 Jun 2025
 16:04:11 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: pinctrl: convert nxp,lpc1850-scu.txt to yaml format
Date: Fri,  6 Jun 2025 12:03:58 -0400
Message-Id: <20250606160359.1356555-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10045:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a91ef2-3dce-4cfd-570b-08dda513c6b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?04YluEjFDxiUr/8qtEslzW3lLMVENM9hKwQxkKTkiMyQV/Vhm/xEdjLWKtBV?=
 =?us-ascii?Q?r0hqEcbmZagaUt0LR+x/uFw8kDG/Q0LlKNFkIXjFyJRQZgfX/BMGqd47JyNX?=
 =?us-ascii?Q?OJV/+A8NYzpOcnthWNIukuNjfDFcOThW+W1cbv1xQJT8FyKdJiT5IvZvt46+?=
 =?us-ascii?Q?Lnwxp6SpqpjwSNBhHOcWQXiLuCFzUR4Z9lg4eqaHoUdrFSyRMWLmYAE9MyX4?=
 =?us-ascii?Q?LWoFLdAGFaoK3HQM0BHIY8qm79a0u+nd852lYaGMRKKDjEvH5WGOwNx3T5+R?=
 =?us-ascii?Q?ECHsAJvE+RsDtwMRyY31S4i0UBC8vWi5THGBOlU6eKsu/yTnQGHVX7AaRt31?=
 =?us-ascii?Q?1EsateANlUGBLLUgVNxz2WV2NQkZ+tgrI916C0ymUx2RCVzkYJC2eTn5k0JN?=
 =?us-ascii?Q?tO6w7y6eoea0NO5ddsDmzz6gYp20GjbQjlTYELPw2Gz8DFCiiQ/F3JasJH4h?=
 =?us-ascii?Q?zFr4lMv4L/8Fwktb050yBQRmDLstvY4Y1BsvORHgv922bnA3W0hf1lElsxbo?=
 =?us-ascii?Q?ychktPg4VDkc5ohOImgYt8wU/noFMIkTiE2hCuy2VWN8Ruw8SluZ3eraSwkZ?=
 =?us-ascii?Q?aise+ozlWx14Br7cGur4dAr9i70pEFga7gtNY344yHwLBXdF7nJhoJccdTlp?=
 =?us-ascii?Q?6qsImnb0Yn4H/WFIQFDOmJjHv3OJbvMAszt9llsk+Pt1lN71X3ODSmBUy5CA?=
 =?us-ascii?Q?zFjMnZOGv8TOhrx6OWe/9WJ1+CNflSJ7Vpvb8AxDx4pCBqEZO7P3XXRocv5c?=
 =?us-ascii?Q?XiUu0illIMF/8XAAjrYoHP/KkiWnJEc+OFA+5mgAR26dQbz2IXxQ3vTbsi3t?=
 =?us-ascii?Q?PNoFM14DATKkfzQzOAqusmT20wSxTQ7Uw9JU5oaEyoYdclZrlNbZZ41dQyKb?=
 =?us-ascii?Q?bs07Z7+pvPnpFaTsQNxLkUIKJt2+fFyfia+1b2wcUK6BTL2391ZsxY+CYzm/?=
 =?us-ascii?Q?1Y8I6w6Za6x1YRhD88+DHoUZ12KWxJDVf3mIgUhAiA+p94IpVDuq8yWkdWuW?=
 =?us-ascii?Q?Mx64+wybReZGSFuMTge+APk2j42j3Mjqfglm1NLbBb/JaS0gZwc+eEX3RLiY?=
 =?us-ascii?Q?Wv/+osaGE3PIEcJDOMeVN92C6dszaEjpUFlN2o+rQ8g+qGEvYjIVMvXe0Ssv?=
 =?us-ascii?Q?KLmpKDIegu1iG7EmZCxAhoKqhDvBRQctxLbtps+VHYKSqaKZF6IpgocauLnV?=
 =?us-ascii?Q?j5+z1ZlfdTXnCvYkL2NpX+wwQ+QzOK8LPy9WVVD8xqbqbeYc+Rx5mwIFN/gn?=
 =?us-ascii?Q?gZIEBeWYIXTeIk6ly3OXeaO8yFOIlUxnleGfk1quUgpFO6VKSM+Idq6gb/Si?=
 =?us-ascii?Q?lk3vvNfbNj2sdWHhzU20jlQq1VAWZG+Oa+lQ2gBdHHA23tPc8eJuSs3qerkG?=
 =?us-ascii?Q?TD76lf4/d8qNged/jl9GJhUjytUP5L9rB7RITue/fsECN/e3KxzzuQJyW/lG?=
 =?us-ascii?Q?N5VNxrHyGxfSBZFEpszH4Gvn7MdHr1mC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ASvrZm/UEmCAtq5zJ8xJxPfzv2TKkpMcUJDYJ3Fos5+tWa8+rpK93t7ZdqR?=
 =?us-ascii?Q?BWo5VhealQssHGRhC6EMvYL0s1uLybun20s/UbE69j+0ZoeJLhFbdLdR5ljn?=
 =?us-ascii?Q?6qmFwE4+m+sjM7A0KdVF1Bb1lXgnzWXKx83SZon8HmOSsJI+elxsBBtBcbcT?=
 =?us-ascii?Q?gwGMAq+AW5D363CT/UfGhHqdvIjCaM8j0TryCxWNnrPijtbxkep+JEVhAD/u?=
 =?us-ascii?Q?ZaWM9LBUbb9MMFcaunlWRLwsfBat2ZL2a8nnQ96D7rqZT+OYOUEW17gnGtJI?=
 =?us-ascii?Q?vjO8t0Yznf5xQ1cmGF7PjNEbuYTsj5L1jZtktJYW0NVL2+3X22f1Gxji0x25?=
 =?us-ascii?Q?HXpxK7zhaFsvVEWVfkNODeXdy8oZUM0c8k2qCS68zEx7MMRbcg/kpgGF2r5v?=
 =?us-ascii?Q?Sc3GOztZsjimfHxXqavT1Gi0/OJAmvzDnHPLCzaiAhk7GUif6Kp3d4Senmc6?=
 =?us-ascii?Q?fms0YqgADW0GVuMNqOc2GwR0wbdkbvub0nuxWtKFN0NMMK+5ynpD2UlnnzZt?=
 =?us-ascii?Q?TdfI3PSUdjzTBS82lywA/Kf+yV3Hjkv1cTuXKBjJgFIf9hrU03aQ6IA7e01k?=
 =?us-ascii?Q?AW3dYox4mGj85DCyT6NDrFFGsUA3JuUfG2jOfQgX4PUQmznbf6dblJH55Ul7?=
 =?us-ascii?Q?/XJiATjFkWXqPCK9L1Hr+3oMiAIAoDntJCjcPmxfkSebWCGQhKugTUR4ZwSG?=
 =?us-ascii?Q?MGoD9zcuKguvYawp+KQiyBVUGEfpZ2WaRbZ/SFtPDcgsXT/1axlmWrovTAkD?=
 =?us-ascii?Q?/T5i2jVF2NjY5n+HQtJJllY0fX9mbOTUrf5l+dLJ+/o8AfeaLqU/YzG6K8ix?=
 =?us-ascii?Q?hURELXHoJSKM7f8CpTloqP2k/naKzQfVucdZGaF2dZ06wwVWFjK7q1N0Rbbn?=
 =?us-ascii?Q?9HQDE82iXl1k+PAOFtmngEIUmi4XjKpezmZE9id+Af+t7MQ5tsCHFsjGEc/0?=
 =?us-ascii?Q?0FQpKp4Ljo+R47JoS5TLLr49FAhhwCtymT+wHXzWkTzql3Bj8SBuu2Gyhz2y?=
 =?us-ascii?Q?dPMBMxurnnhbn42C5uHPC+47h6vggoNaeq3QCO1+uWHBfR8o+O/TJ7LgpB7+?=
 =?us-ascii?Q?pyHQb6cDjHGaCSS5U1YQ183R3PZ1IItNVAFrnPM999gZYp6VtL59Bluv/f7h?=
 =?us-ascii?Q?qSnYNWtHWfmRTz8dLN1suBTA7kDa4nx67R2bnhy5eSRjujAGph//atrWBKKy?=
 =?us-ascii?Q?RdccBDXe+nk5mK6OWeOorNo3tXBzqvUEo1V0N1bBrr52lSxbTvEzsQfaAjce?=
 =?us-ascii?Q?RSbStffu4gvLvPkhWDQX2r8agfDg19kCsrf/Lx9A36rHqVD4TmpiewzzFbgp?=
 =?us-ascii?Q?ENUlBrXBClAjhlIIow67FuW0mLaqgY+wHkGZ8g0XH12ICxhti2ruxeokiwsE?=
 =?us-ascii?Q?MxDQKJrXYMQMRkOm3DNOLFPJjRZtvFKZnqG2Rr/M+1ITQlSfPu5FdMnE/zp+?=
 =?us-ascii?Q?4o1TvROcAlcsD/X62oNBD9m4Hqu3H3W0w/9ucYuRpRbsKhL5eq/DoxYnwJF8?=
 =?us-ascii?Q?qRS+jZZfXYc2OMuOoDMQ9glXMvIAq71M3mivNafRNuVgvmtc745GwYhxDnau?=
 =?us-ascii?Q?o5zIJfDl40ot8Y+GomDSkgWJ7wZDWfHFl8iXhofE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a91ef2-3dce-4cfd-570b-08dda513c6b7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 16:04:11.5142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTBfuVwn8abw2FpATyqiEogREAzp45qj+Rq/ddmWKZWZU1fIiaE2LD1K7wDxZf5710DbNYVfpxYl6Q4cf2xLzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10045

Convert nxp,lpc1850-scu.txt to yaml format.

Additional changes:
- keep child name *_cfg to align legancy very old platform dts file.
- remove label in examples.
- just keep one examples.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- drop generic pin list at top description
- fix subject miss n at vendor prefix
---
 .../bindings/pinctrl/nxp,lpc1850-scu.txt      | 71 -----------------
 .../bindings/pinctrl/nxp,lpc1850-scu.yaml     | 79 +++++++++++++++++++
 2 files changed, 79 insertions(+), 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt b/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
deleted file mode 100644
index bd8b0c69fa447..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
+++ /dev/null
@@ -1,71 +0,0 @@
-NXP LPC18xx/43xx SCU pin controller Device Tree Bindings
---------------------------------------------------------
-
-Required properties:
-- compatible		: Should be "nxp,lpc1850-scu"
-- reg			: Address and length of the register set for the device
-- clocks		: Clock specifier (see clock bindings for details)
-
-The lpc1850-scu driver uses the generic pin multiplexing and generic pin
-configuration documented in pinctrl-bindings.txt.
-
-The following generic nodes are supported:
- - function
- - pins
- - bias-disable
- - bias-pull-up
- - bias-pull-down
- - drive-strength
- - input-enable
- - input-disable
- - input-schmitt-enable
- - input-schmitt-disable
- - slew-rate
-
-NXP specific properties:
- - nxp,gpio-pin-interrupt : Assign pin to gpio pin interrupt controller
-			    irq number 0 to 7. See example below.
-
-Not all pins support all properties so either refer to the NXP 1850/4350
-user manual or the pin table in the pinctrl-lpc18xx driver for supported
-pin properties.
-
-Example:
-pinctrl: pinctrl@40086000 {
-	compatible = "nxp,lpc1850-scu";
-	reg = <0x40086000 0x1000>;
-	clocks = <&ccu1 CLK_CPU_SCU>;
-
-	i2c0_pins: i2c0-pins {
-		i2c0_pins_cfg {
-			pins = "i2c0_scl", "i2c0_sda";
-			function = "i2c0";
-			input-enable;
-		};
-	};
-
-	uart0_pins: uart0-pins {
-		uart0_rx_cfg {
-			pins = "pf_11";
-			function = "uart0";
-			bias-disable;
-			input-enable;
-		};
-
-		uart0_tx_cfg {
-			pins = "pf_10";
-			function = "uart0";
-			bias-disable;
-		};
-	};
-
-	gpio_joystick_pins: gpio-joystick-pins {
-		gpio_joystick_1_cfg {
-			pins =  "p9_0";
-			function = "gpio";
-			nxp,gpio-pin-interrupt = <0>;
-			input-enable;
-			bias-disable;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.yaml
new file mode 100644
index 0000000000000..11f41359b5c8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nxp,lpc1850-scu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC18xx/43xx SCU pin controller
+
+description:
+  Not all pins support all pin generic node properties so either refer to
+  the NXP 1850/4350 user manual or the pin table in the pinctrl-lpc18xx
+  driver for supported pin properties.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc1850-scu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '_cfg$':
+        type: object
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+          - $ref: pinmux-node.yaml#
+
+        unevaluatedProperties: false
+
+        properties:
+          nxp,gpio-pin-interrupt:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 7
+            description:
+              Assign pin to gpio pin interrupt controller
+              irq number 0 to 7. See example below.
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc18xx-ccu.h>
+
+    pinctrl@40086000 {
+        compatible = "nxp,lpc1850-scu";
+        reg = <0x40086000 0x1000>;
+        clocks = <&ccu1 CLK_CPU_SCU>;
+
+        gpio-joystick-pins {
+            gpio-joystick-1_cfg {
+                pins = "p9_0";
+                function = "gpio";
+                nxp,gpio-pin-interrupt = <0>;
+                input-enable;
+                bias-disable;
+            };
+        };
+    };
-- 
2.34.1


