Return-Path: <linux-gpio+bounces-34175-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK/hMbdqxGlEzAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34175-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 00:07:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C4632D3F1
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 00:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE5793088332
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 23:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420EA394794;
	Wed, 25 Mar 2026 23:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J/JmKopF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010040.outbound.protection.outlook.com [52.101.84.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED513264C4;
	Wed, 25 Mar 2026 23:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479874; cv=fail; b=KI0W+49cAJfmwPwXILnuMdhEeYxgqDs03bx1gI0Vt4ELBBNeBXZgb6Vup+GfFUhMJdbzohrMjcFDUtEDFmOIS+n/ne7JrGy50Lnm2CJpYTfe8JeB1Ld4TjdVA1+zf1Dyx45W0qEPcVoxIJAyfQuFlD5mNc4YFWeYoXDixsyY8Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479874; c=relaxed/simple;
	bh=DmAPb7OZBiyKeLz0y2fs7pQjSz8NwO/m9FoRgPem4PY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=dAhFqBmgE8ohXnYPfIhJjVPtkNREsMugP9gezQfn6StkI4keLj8+kNZFU/zpvUSTlm/weQBmw0g41Uoym0NPhNEYPCV5hvizT9iJlmtMlMySLlq3LxACityI3YnbqkFj5hfHwbt9ISSbr0x1eK+T43oe6Eze0jisE2T/e6to8sA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J/JmKopF; arc=fail smtp.client-ip=52.101.84.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9nRkzwWsl7OI4nGYaOndwuEimUMd0nLOHza0vRON4DtZZ3vMZRURCoCvKi8ZnErJT4oBmafBA6UqRBzmdt/G7csZcMw/X5Qbzg7BOjMWDxOOECnRmEPiwx0EnoNI/iALY38qTy+0BT6yYAe0Td0zCkzjgGILuOKbraMwvg7t49bPisiixS4VNBk93fpJGwLOsKIWxUqhLHrduZjumGfMMTnecUFwLBI8RIG18AIcMk5jBb/APNdvk+1/nkNvjUaGV5FbBUKDxWB1Md29tln6Wlfpppff1n/eGPDqjUWIzzFTmV1dGTAeeHDMR+oHwwmODaNYebMeFgIityOk91bRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDtbKSqjnt6iFJq8x5U0QzAkLelaLAXYOnTcZlPggpY=;
 b=Q3Qi2Py4RlHnstMy9Es6VGEBqM4XelWEHqeJrsNoXYUlZ/4I44cTxGHyM0fn1HhBsu7lX/G+IHCdwmb+lmI2aXrozpBTUgsYxxJYSF5mSjDR0IffTHfh9NcT5pK/FemsUyt06JVWuAqb/0tQSvXxgdN5TyBwyt/ZudKGHuy46fYZkTYWAQZJCOMcnTd6AJuajMeVj6wpAd+zxt6p9GHTffm6Mxj0/Ubiq2cOCyMPtdC8dHPxFgOUywxsZ7HD1DjAEPYWAsGosaycUWNymPCM5uy+VPgPZVlO3HDu2BFUjo+2C8mQOL2YvHz2P0V2GWcFWXFv4Gq6TtR0MTxJkudCJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDtbKSqjnt6iFJq8x5U0QzAkLelaLAXYOnTcZlPggpY=;
 b=J/JmKopFVVZJPkbIYSkTPQk3i0l5tpU9YbflDA/nUWvuNlk9gCzCDp2iEh2R+qu69r/ollH4ev/jIjcZX7BPooOnVRavug+j8kiMV7B1ed8sfJNvpOHhLv0FdILekLcSvhTpIF7mF+xbxoT1ekL3RgGfF2PPQ3JxRPDHOMLIFFerKJpvgMn3BuUofK5HR7LfY2kg1oLO9rTPnW0fvy0aHEuT766NNVMBYVVXCxWaBXPCHH0sl9AvWyJCgtvX3zX7J0tfMkh3VFIUiTZeh2EKmbBh0YsrH5HkL7CEroZDI8gqPRnUoCjJ5xpWIDhZplArl/VEbwvqbeSyE7jYydkegQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV2PR04MB12140.eurprd04.prod.outlook.com (2603:10a6:150:30c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 25 Mar
 2026 23:04:28 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 23:04:28 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 0/7] pinctrl: Add generic pinctrl for board-level mux
 chips
Date: Wed, 25 Mar 2026 19:04:09 -0400
Message-Id: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOlpxGkC/1XMSw6CMBSF4a2Yjq3h3j4AR+7DOKCllSZSSEGCI
 ezdQmKww3OS71/IYIIzA7meFhLM5AbX+Tj4+UR0U/mnoa6Om2CGMkNgtHdej+FF2/dMa1tqoaQ
 EwTMSRR+MdfNeuz/ibtwwduGzxyfY3l+nTDoT0IzKvKgRJMvzorj5ub/oriVbZcI/iSKVGCVwJ
 isUtuKCp5IdkgGkkkWJTCrQkCtbqkOu6/oFw29sDhgBAAA=
X-Change-ID: 20260213-pinctrl-mux-df9c5b661540
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774479864; l=4715;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=DmAPb7OZBiyKeLz0y2fs7pQjSz8NwO/m9FoRgPem4PY=;
 b=YCocW9qYb7CRV2MaU0pCcyFyTfgzw/Cepw9a7vvZRfYlfWJlxG0qYwipw1MFKFxNk675Flvl6
 VpNDMcAMuBSCnL935Lad7DT/0aKToI11lrzTh/dkW3oCiMXDKJqjJxp
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV2PR04MB12140:EE_
X-MS-Office365-Filtering-Correlation-Id: ea410de2-f67d-4922-eed6-08de8ac2dda0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|52116014|7416014|1800799024|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	3Ix6BL1IG+Eilhxa3QkqcCHb2QIuXnYcHDnjFegS8k3kcnNMyDtPLaqHxxU9Su9TYS0U6lChWWO7EHs6pGae5mFMIwq8smUb/RX7cu1jjo0ToWscz2+ofiwjIAsTlQep9SZLBC7Xh+gi0332717xAzgo4KrLLV2B4f+nAXAgW2nX148ZVWrRavLbKV+uBLQDz3wXRVN/hd3fexDbr7gVrZ//zyCXDluNn5XA55MKfdykjaTuCY0Ctm3fCMgEi7RjfVAT2kTAdQXcLaX1+tRjIVuxKoszcubRQM5OOX765z2wOePl0DJJUYn71q9kZa+b/zZ6By5PjnD9we7l17sXNu2ymOUVDEtGr6ETw97r8f3bZP/zKTgfW1limpuxZ8BASc98RTH/jMH5KOKRxqaGp5CTbGlwGXlDg3Zcd0nxGWGdx3mpcIUiTNtZIIRVKkVk3CZsd1W3DEDT7B56fdJ8WBzGBCcHMhzNeCPZI4mOi8nHC4gZ6H3SPXhSakYLJ2Q1kI/pAz7fUUcRmi3JHl5Q28A9pkQPhRfmOI2bxydNDugQcv0+Tk8LLI7VjNfRorE+//5v6ijVNjLGHQjxumX7Q3C2FAo77wDmkxoXHGxGlU8VW3eHa6h7bhL0DfFCIv3cvN4/M3lFqZSVeAaN8zJ7scwUk6jFw4Pr1HE2saFMzbpZuvfsGJtw51nXubZN+xEnOtaJTuv4aT+owhZj08mBWNYxMyBsGCD5XI0f116RQbHjn43ukd9baqFxsIXX5qFW0KEx5RB1+OKfFkJQSgC9fky77uUQ5KhphkKJwezCf/8gabsdM5P1jc+TJF50rm0W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(52116014)(7416014)(1800799024)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnQwMkNJQXpySzBvSUVTdmY4a1VZblJscmhNdk9EVjduZmVWNzlkaFlQN25v?=
 =?utf-8?B?TFRtZTVsUnNqTlJZd0NMcFpFNkdJWTRkY2dRNXZpYUlpdEJ5MXVLSFNOL0Zz?=
 =?utf-8?B?eVdvMjVMcmxOV25VOWlHeE5qbnppUnFjSkdaODYxWWQwRVhXcG1KNWl4clVY?=
 =?utf-8?B?UnFGY3FqZWszTndRL1E5ME1GbURZb3ZLeFlBeEZDVjhtUHZYd0tQUFp6M0hk?=
 =?utf-8?B?QU1oODMyYi9adTE1SHIvL28vYnN0enZKTGlDbnZqMStyR0x6QjlxQ05wTXdo?=
 =?utf-8?B?K1ppdkkzaGM2YjR0V1J3MU5mN245TG9kc2psR3BuK1F2cGozSkxMc2FBd1gw?=
 =?utf-8?B?UVBnS2NMd0QxVGVRaXhBZ0ZGeGU1OTZvWTd5djV1Z0lkMG44WWFjTkhZRWR4?=
 =?utf-8?B?QW95YWlRSlJYeUpnNVdmTXIxMU1HR2MzZk1RMUNneUZCT0ZnenpaamcwemEv?=
 =?utf-8?B?d0Z0ZlF5QXM2d2d2bUtiVHJOM3ZrVnZPellGUE1XRU5WMGhBK0FSNUJBTm51?=
 =?utf-8?B?SG05bSs1eGVKZ3N3U0c3QTdRRmJ4ZWJRcm9RU0ErZUtvWmR2dmpSbGhWS1My?=
 =?utf-8?B?V1VoZXREY2h0YmRvaGNjb2pUTlVSeVJQVWlyKzdJUFZGQVBHTlJmNW5hNHla?=
 =?utf-8?B?QU1XdHJTUHVIWUJ4QVlZaFIzMUVsYTEwWGVmWFJJZHU4VFVLZFNaL0tNY0Vk?=
 =?utf-8?B?NU40alFEWHJnejNFbHpKQzFXZ1RTWno4UkdBbk5EbTJJdm14emZLa2FQanFH?=
 =?utf-8?B?akVlRjJpMmVFM01DSElZNXMxUjZQUjNtUGFmRWtFdUFuWkR3Mzd1blh5K0xT?=
 =?utf-8?B?RVpHWU90Vk5MS0E4WFl4N212dDJwd1MvdHlkRnU3M0VKMlk0WHhwVDZXSWFk?=
 =?utf-8?B?NjZRZkJkdmMzYk82OU5yWXZGc2hsT0tob1NmT3l5OFNGZTZEejVRRnhjcVdx?=
 =?utf-8?B?UDNnQWtwWWhhN2lyVHVSbUZCdE1HMXdZQ295QjhLVTJocmlrZnk5VXJsZloy?=
 =?utf-8?B?MHVrRXJ0bXBBTFdJcWxMMXF4bHNMMi93V05MaHJaTVZzVHpVNU12eXZUK2hQ?=
 =?utf-8?B?TjFKekRLSG1sc3pZMzlacVZlS1IxaVhPa1JNU3JlVVpRMEhvWkk4UGZZdENa?=
 =?utf-8?B?ZHlYa0lZVTZ4bmtJWVRsOGRYOGQzZ1Rxd1FrcEI0U2oyY1JySUQ2OVlHVGNW?=
 =?utf-8?B?Vjd3TVVrb2NMQzF1eGJKN25tM0RGZXA1QWlSZDVWTG5ZL210bFRRNXkweGxt?=
 =?utf-8?B?ZVpOMDZnc3o2UGQxWVVNNWt0SlQ1TVZ1WXlIaXQzczR3V3pCQ3BrbzQ3WUFF?=
 =?utf-8?B?NWVwSEM1N25vWjcrend0d2lCaWhMb1ZFdS9KSnlrVGxTbnFMaFg3cy9GTldO?=
 =?utf-8?B?dHh2azQ4NG5kZXBtTkJXaEJ0WlN4OVlURUZXaTZ2K3E2T2NWSnl0M2puZytm?=
 =?utf-8?B?RzdvZm1SdHBBWTNCZ0ZBeWUybVNCUXhJYSsyWmVOR1RURkhpbzB5T3hwOUJO?=
 =?utf-8?B?Z2Q5MTcwNXg4Vkh2YTdFZVBZelVNWk9TSUdsczJLR3JZWUVobnN1OUxDQXhK?=
 =?utf-8?B?dkUxVEV2T3JPWEhxTGFicG15ZFZzMksxT1M1RUxJZUZvd2VQQU10Q2VqZmFk?=
 =?utf-8?B?MXlxZmk3b2Y3QmV3WDRGaXFTZG85bWZZZ2xzRStXT1B2cnBFd2JCRDVLbUps?=
 =?utf-8?B?SWxaSjY3czR5cFNtYUd3ZjNCVkhlOGJ2YWM3aFJSUVgwQWhDL2xoSTQ1dGU1?=
 =?utf-8?B?Vm9PYlNiN2xTWnRDdmN4NnFSL1VURFljdXNlSTZmNWpKS2RVdmFhMDZCMm85?=
 =?utf-8?B?bEx2SlZWVTlmQktlcmFaZHlPNkRxYW0yZEl6Zy8raWhTcVdJL2RRSzdMa0Rp?=
 =?utf-8?B?cFQ3cnR3akR0WURtMkZxRXBIdUJ0dmpqVHdsMHhsc0RJanpONW0wSU44ZSsx?=
 =?utf-8?B?Znp1N2dqMmI4REVRQi9tN2M0YWlkcjFJL0NCRy9YeVF5b0UrWVRrQ3RrT1dV?=
 =?utf-8?B?eS9pTnFiM0xseCs1aldMc3NVbG1xNHNLaVdnMXBYRFc2MlRSMUFETE5ERHli?=
 =?utf-8?B?NG55aGxXVlFsWnZGQi82aHlSUFRpWFFkbjJFdXZIWWcvOEx2WDJlVjF5ZVJN?=
 =?utf-8?B?MkYrT0U3a3c5TkNNYkc3YjBMR3FTS3RsNUVvMlhFeXpPdElFc2MrOHlTLzhv?=
 =?utf-8?B?dnZCU081ZWZ6Z25aOHpSSU5zd3I3MWdjMkdlUnM0a0RSU0w1dHp1akpIc0V4?=
 =?utf-8?B?S3B4N3piRzAyaDZZU05LaWl2eURpRkNSM0NzMHBIY3QwWStiWHRLRmJHM0d4?=
 =?utf-8?Q?s7Ehjv6J/bHOypbk9Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea410de2-f67d-4922-eed6-08de8ac2dda0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 23:04:28.1664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWwfFHtVPsUC00ZyHUBRNNa9PpCrr4j2kIJ659PUL55Zw6GbbqMAtJ1WwZVsNqsuyJ9D+jp/xL9Fx1LTSY0a4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12140
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34175-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 24C4632D3F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a generic pinctrl binding for board-level pinmux chips that are
controlled through the multiplexer subsystem.

On some boards, especially development boards, external mux chips are used
to switch SoC signals between different peripherals (e.g. MMC and UART).
The mux select lines are often driven by a GPIO expander over I2C,
as illustrated below:

        ┌──────┐      ┌─────┐
        │ SOC  │      │     │    ┌───────┐
        │      │      │     │───►│ MMC   │
        │      │      │ MUX │    └───────┘
        │      ├─────►│     │    ┌───────┐
        │      │      │     │───►│ UART  │
        │      │      └─────┘    └───────┘
        │      │         ▲
        │      │    ┌────┴──────────────┐
        │ I2C  ├───►│ GPIO Expander     │
        └──────┘    └───────────────────┘

Traditionally, gpio-hog is used to configure the onboard mux at boot.
However, the GPIO expander may probe later than consumer devices such as
MMC. As a result, the MUX might not be configured when the peripheral
driver probes, leading to initialization failures or data transfer errors.

Introduce a generic pinctrl binding that models the board-level MUX as a
pin control provider and builds proper device links between the MUX, its
GPIO controller, and peripheral devices. This ensures correct probe
ordering and reliable mux configuration.

The implementation leverages the standard multiplexer subsystem, which
provides broad support for onboard mux controllers and avoids the need for
per-driver custom MUX handling

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v4:
- use Conor Dooley suggest to extract funciton pinctrl_generic_pins_to_map()
- Link to v3: https://lore.kernel.org/r/20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com

Changes in v3:
- collect rob's review tag for binding
- extend and use pinctrl_generic_pins_function_dt_node_to_map()
- add judgement about
commit 2243a87d90b42eb38bc281957df3e57c712b5e56
"pinctrl: avoid duplicated calling enable_pinmux_setting for a pin"

which call pinmux_disable_setting() before pinmux_enable_setting() when
switch state. It is actually what wanted. Previous remove .disable() to
avoid hardware glitch when switch state.

New .release_mux() call intent just release software resource, like lock,
don't touch hardware register. No glitch involve. Comments already added

Linus Walleij:
  I hope this answer all of your questions. If I missed, let me know

- Link to v2: https://lore.kernel.org/r/20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com

Changes in v2:
- Add release_mux callback,
  test insmod/rmmod, mux_state_(de)select() called.
- Link to v1: https://lore.kernel.org/r/20260219-pinctrl-mux-v1-0-678d21637788@nxp.com

---
Frank Li (7):
      mux: add devm_mux_control_get_from_np() to get mux from child node
      dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips
      pinctrl: extract pinctrl_generic_to_map() from pinctrl_generic_pins_function_dt_node_to_map()
      pinctrl: add optional .release_mux() callback
      pinctrl: add generic board-level pinctrl driver using mux framework
      arm64: dts: imx8mp-evk: add board-level mux for CAN2 and MICFIL
      arm64: dts: imx8mp-evk: add flexcan2 overlay file

 .../bindings/pinctrl/pinctrl-multiplexer.yaml      |  57 ++++++
 .../devicetree/bindings/pinctrl/pinctrl.yaml       |   2 +-
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../boot/dts/freescale/imx8mp-evk-flexcan2.dtso    |  15 ++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  23 ++-
 drivers/mux/core.c                                 |  40 +++--
 drivers/pinctrl/Kconfig                            |   9 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinconf.h                          |  18 ++
 drivers/pinctrl/pinctrl-generic-mux.c              | 197 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-generic.c                  |  91 ++++++----
 drivers/pinctrl/pinmux.c                           |   5 +
 include/linux/mux/consumer.h                       |  16 +-
 include/linux/pinctrl/pinmux.h                     |   5 +
 14 files changed, 425 insertions(+), 58 deletions(-)
---
base-commit: ff76d257e86235eb07ef33db8644a517c48d1c3f
change-id: 20260213-pinctrl-mux-df9c5b661540

Best regards,
--
Frank Li <Frank.Li@nxp.com>


