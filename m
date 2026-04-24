Return-Path: <linux-gpio+bounces-35444-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEaAFEnI6mmtDgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35444-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:32:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF827458C03
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 229E53004936
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 01:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D7428CF77;
	Fri, 24 Apr 2026 01:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cnoGMdr9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E88127B50F;
	Fri, 24 Apr 2026 01:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994347; cv=fail; b=RY5h0Y4bNsSOk0bjqeDbw96AaKwcck98gur4sHlgYbMeqr9fV6r3YnYTFfsEULcPUUB/aXncGACT2i5rgxpJ9cdDqz6fsnEBD7PcmqWVRtowTHeOM9R8bjlx+2X1JSyX8AAETkxcp6jn9sPQbcwwfMJXy56tcRxi6MPpM68bnBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994347; c=relaxed/simple;
	bh=WkDXVk9bnUHejfHXSY1At0nKxCSLZoePbRS+Q5yAEnw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=T+dDuR2F0vv0YTd0eBy4mSFj9KzIpd9FZV8ySQloj8cdSFFSy51TiHHwQpgLWONr4eVsmUiOjxpPKjTavqGpxt4G2RDLN+lP2i3rq69l9oNWCjusRGlLiMoqSsyHs8n+SPsPb5ZtIO5fM8SHnIo8IV9v40GBRif4ttyM78qV+lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cnoGMdr9; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ne9kyvjbRr9Yt8GRAkxVvjTB39JmADzgoNs26Gjzoo0quQqmS6pFyeUI7nAFX1nLLxLsojTm/8KIVfARO6tjUVmoJaLEdweFwxM+h0DUSgF+kbFgysHfHfNCCyDglQbIEn6oXBNxjJrgEnupmUAhcp+ElNYgUXeTehqfF2k2npXWb0+Y0svzBVL3xIdK/HcuFyzjllGmuPJGN4alycJZ2LfSAVPscFzxqm4UEye12nSt248gzDMCIriys3+DQ/spIp7IxxPmOze6x5fWRR49jkO7qUXqN2k6qnVaRuc5UivCQ75loVzw838oZZIkYOUcxdEAqa6WEEbgmhhytVFAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ct2OL077kQIYaYn+FwHUHj7bBRg0Wse8q0rgKPkFY8=;
 b=V2L5KCh6nIecGci68jxBab2fEIFNlm/9I9GJL75QGAw9cX9BV/135/TpMqwwjEsBvNlSPwhQVEgjJ5E5gxVBKTeGb/L6xx0m/wt0YgJXMqUlFATPk7aJH/C4CNHpqzEdKs8nELX6Bcr5AkTdhfIQ7Wj7RbLfbgRyF8Pyi2iAYJaol660IgO8NIUKr9VqmQqjaFvClSG+VFeR5dtZoRmYV4cNP27ZfHRMWM/5sgMKLrKYUjw7llbKwKbK4JLhllIzC0NKrPBK3GjjbamsX55pDTXj8RQm0J0Rf9+5NX+sFMHw479YMF4SL/xRuk2AhYUtAbxOTj84tptyGlGjvXxt1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ct2OL077kQIYaYn+FwHUHj7bBRg0Wse8q0rgKPkFY8=;
 b=cnoGMdr9NxONvZHspD70LrEaE0vmf9lxesGRkHDi9XERkleQh6vCWGLx2SYdCPMkLqHsnDDothwyGBPpcieNTpC2cSNJrGjzXroZkBMEOfkpj7voiqw2LmTmJKhOjS1rVaswTzezdUZ5al1HOEr8/6bWn/3orKW0/ScQSM1Db0pvYA6gZlI06IpJmsbmBnOXVxl8SFC9Rov5p3hChbvgCi3FJSPtlCFMDPNGAtf4NJBIzyR9qfAo/QXAsDplCfeiT+YNAMr/9EToUB0i3eOuHEkoFBkXjTE9DlTwJLmKBb3RK2h2aFpDd9soI8edl9a6xKCMZez9fvMYahksxs9t2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV4PR04MB11730.eurprd04.prod.outlook.com (2603:10a6:150:2df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Fri, 24 Apr
 2026 01:32:20 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 01:32:19 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH upstream review v6 0/4] media: i2c: ds90ub953: Add back
 channel GPIO support
Date: Fri, 24 Apr 2026 09:34:45 +0800
Message-Id: <20260424-ds90ub953-v6-0-a63cf480f8b0@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALXI6mkC/1XPTW7DIBAF4KtYrEs1gAdMV71HlQU/Q8MitmUSN
 1Hku5e4qoSXI73vzcyTFVoyFfbRPdlCay55Guug3zoWzm78Jp5jnZkEiWBB8Fgs3LxFxYUetBw
 CKgfAan5eKOX73vXFbnO5LuQu3auUftipBs65XKflse9axR77qxXQ1K6CA3dmEColH5MQn+N9f
 g/TZe9YZevac1ZZHSgio8lrj/boVOt061R13hsfNPYYnTm6/t9pkNK0rq8ukkOrJWCydHTYuqF
 1+LoTdUhgQhhS89+2bb/sNO65kQEAAA==
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776994498; l=2876;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=WkDXVk9bnUHejfHXSY1At0nKxCSLZoePbRS+Q5yAEnw=;
 b=TXe1iHsnV/6yUMNdIeQItnqHC8fFAu1EWzf08WcPQvHDW0KMSag2BxMFiJ6VWqgeyRWnkSesP
 dK1gRhDQJMBAAIQXTOcajA/tC4tCdaSeLvVU6g5hj7VOYX1TjHTiVGv
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR01CA0132.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::36) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GV4PR04MB11730:EE_
X-MS-Office365-Filtering-Correlation-Id: 13deb954-b985-4a95-5b55-08dea1a1535e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OXdDW9pPVfOlzYDuW4Xl0Hffu6oU+vWmjJAx5HPxe1f75PVa62fzoZfA6INpul40rSRgKvUWO+3bgEdvIu4x/cKFi+jyq3xAb58zrLjEkXk3eqUFPqKRFeagB6ScCpZnRELWNjruG5mjrcIOnfNjiRd/yj1kcxjv3eTVO1/cq768iA532lQG5UkAYKVrLGqmaAPrK469RYpKNasgj3/FMi83fLHoEZaXZBVOTLZTLZ6GWM5IWjuhGS1tdp4hsrkWP1dhhzvNCy1y55bN+C4G8PqvuK5RSFbqeVtF6mJs9d4NaLK5KxQDKsNo6kN8Q9NHl6ncRVJhaSAHNhcKh7Vl5yaKz64wbu+JqQ4OJGZdizUpDHMS26cUA0qDoQteIOUWEb98auKxwnqakT57Ry3w+hYC43eoRCu8MnvSnXYM02HK0DtInr3UBrzCZz371pwKcnQ02jMyOk908kv4kky9rAMNBSsceljXnhgd2d427S6wj+QKQQr2IQX0+DOGgotOFyph9AjWKfrW3OeGnqf+018ToZjnfTT2Pza+v2Mz124pexbP1kJWnadapCApGlf576p0odvGJ+XF1OPe72v4UJKRM0n10FjkEly4d9I4V9aQiSiYfBOstY12+n095gGoSeuvjduMVhzuV9Kx3JKQ9bsRlaLNbDmUqOYxzIH5ZkQu6QLkpPFf1Q64ZJV5ekjCtTpwUTqQf8mY4I4Ghl5x5MSwE2g7uJcVsfR+LtyW2mEMw4n+meLyGgaizznfghl3+oA0M/jxM51Ex4SUFgL8nwKCSK1tKOIgAen7zfp4JtY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXBqa09SZ3Q2Z2pvME5vU0N4c2pjVjFvSTIwcEVXYUUwUFp0Q1ZIOUp4eUVR?=
 =?utf-8?B?N1gvOG9rem1XWkJYaUVlU1dIa21JTVFFQlU3aTV1U2ZKaFFQS2cvRE1ITDFL?=
 =?utf-8?B?MDYyVG9pdHFRRXBXV21VZCtRanQ2eHV4dHdSYjNiSlowZmlhUWRhSHlVUG5R?=
 =?utf-8?B?S2YxTW5IcTNUVWkxVWQwK2VNY0pXeEZWVDdFbXUvVHlLNVhPaVkwbDhiRFJO?=
 =?utf-8?B?eGtWVTlQZ1Z5T0wzcXBWWjNlNDBSVlVaN1FnVDE1QkxzM2VLVHhSdEcvZWk3?=
 =?utf-8?B?R0dPalVFcDFLYVJsTjV4WS9wWFQ5b1pnU3NYdGZLR3hFb2Jja3hoZzJrS3dR?=
 =?utf-8?B?RlBCSnIrS3k1bklxU0xtZG5OZDRRWWZIcjBsRWx3ZG9janI4cVR1VlVtd3BV?=
 =?utf-8?B?WmVWMU9LQm4vK0Rib2dpYUlDYTJRN0xZT2FEY2JlUVJ4SEhTVTRpZkZjbVFl?=
 =?utf-8?B?L0J4Q3IwYXp5akRFSTJKbUNvdHVTOUxySFFESUVIbGs5VUFGSUZoZkpiTjJa?=
 =?utf-8?B?QXR0MCtPK0UrcXd5QlQ4WUtOUGw3R1lzeDlQb3lKakJIVUVGWSs2TDJmZWhL?=
 =?utf-8?B?bzY0aHNNa1BGZklMS0JhSjRjdzBxZlkxcWFvelNRTGlMUXMyZzRLTjhKNDU5?=
 =?utf-8?B?emxydlovaTRBd21pMUdyYkxkN0xJRTVqSUlkaUJWNUthS1BWR0lVMmp5cm9N?=
 =?utf-8?B?M2tXYUFQRm5EUXR2OVpRajNBZThSQVNuZ1pmZDNQYUVBcjFJbi80UXRQRkVi?=
 =?utf-8?B?Q2NyVXVDdEJwOEdtTFVNLzZNQnRsTWhIL0tocE42WnVjRkR1UGN0M0dtMjFt?=
 =?utf-8?B?bUg5ZG5PUHdaT20zak1oQ2pja3AzcmlleDN6VnloOUN6b2ZhWVJDTDFvb0RP?=
 =?utf-8?B?NjdjS0VBcmxrS29jR29RUnBLWC8wU1dCSG85Rm9RYXJSVVVsTTNGbVBuMThs?=
 =?utf-8?B?ZGlVckZyZGlmajBrRGo4clRscTdzNDdSbEZWcHlIbHZyb01nVkJyVEFML1l6?=
 =?utf-8?B?blVKTnNRNEMrSVBrNmlLTk9DaTRzd1NhejBPWnZLOVNueFZ3YTBpUXZmbWlz?=
 =?utf-8?B?czVlVUhtaW9JM2NMOUt4YUYyRHVpOVR5WGZ1bzA4U2pvYkJwV0RLUmUvdWZI?=
 =?utf-8?B?d2RrWnY0alMyM2tuL1BPSHY0aWVpQ0h4SGxnbzRVZGpwS2RLeWFIVzU1a1Nw?=
 =?utf-8?B?M1FQUHh1UjhNRG9ScEp2YVplL2NwYjQ3VFYvVXd1ZzBJdWIvenNiSG5WMDRS?=
 =?utf-8?B?TG5DQUtERmZ1aU5uOUlZN0tBT001ZWNzRmxSSk5FR2RNNWlHdHZMVmorVTZC?=
 =?utf-8?B?ZGRpUFpJYUl2ZU1DWTZTNkc3MVJUckV2NHpQTXlWMGduQkFQcUZsTnlhN0Vt?=
 =?utf-8?B?dzNnblNveHVpbXBjaVJtN29VZjdyM3VuRWFpaUMxTkwxd1BjSHBPa3N5RVBu?=
 =?utf-8?B?R0IzSTZ3KzVrZUd4aWpHWWFxckp0cnpmV25IZkE5Qk1uYXNIaXg2cDQwcVdn?=
 =?utf-8?B?c0M0OUcvU0E3L1RwcnVWNlFIOHhEYjVkUnFieUlVTjhJSS9wNjVKODNDdmlX?=
 =?utf-8?B?Z2RQNUJqUmpyT3N0MHFhMndwQU1vY1dsYThhSEI0cU1FRHBxTzZRWjN5Z0RB?=
 =?utf-8?B?V3VRcm4zSUlqTFBaRTNzU3I1VmVDRUpJRi9pWE5ZNkJVMGVBMkJ2S2xMMlNW?=
 =?utf-8?B?cEtWT1pibmV4Q0N6WUhBRVkycGpLK0ZNNU1aTHVTL1ZWN3dMQjJnYTZqbnVR?=
 =?utf-8?B?SDlHOFpiRzQ2UE00ek5XbmNwcXJjNDJ2M0IrYUg2ajlEZU9XSm00VVJpQUVt?=
 =?utf-8?B?b3lQNDdkUCtnVU02TkxPbzZYRHF3WksxTS9rR0dUYUZma2NvNDRVcm9aS1JY?=
 =?utf-8?B?YklpMllvUnQ2L1dzY1VSVXBzSmdscmFzSmZmbmdxNDdnU3NiaDU3WGRaczJn?=
 =?utf-8?B?bDZCOWI1UXBLZ3dWVTI2TndsM3NrbzEzakhBNG1SZDQ0NkY2YzdkbDNCWWRQ?=
 =?utf-8?B?MWFkTjBWSE5CbkFWRTJnT1NpanhKOXZmbFRVN0QxaUY3RFA5d3RhSWNvU1Bl?=
 =?utf-8?B?ejJLcTlVNjlzeG9EUWVzZThISW1pUFRkMnZVOEpxUnJ4QVNrcEVleTV1b2dq?=
 =?utf-8?B?N2l2djA0cGJiTnZ6K3RyRVFYRUx0YnVnQm4wZWR4NDY2RGRPR3A4Z3BXZUZQ?=
 =?utf-8?B?VG9QVm5xZS9RNVAxZ2dnT1haWU1mcjZKTERHMkNCR3h5T3RnWjlPTFdhUUVN?=
 =?utf-8?B?dDk0eTVhRDZweHA5cVVzMHNTOTN5N25JRFZKRW8yb3pjb2ZrU1UxYmdPRGkx?=
 =?utf-8?B?Wlk4Wm9zM083NDNnSFMyYzBPSE85RXE5alk3SGNvbjBjUDlYNGNIdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13deb954-b985-4a95-5b55-08dea1a1535e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 01:32:19.5375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: niaMDW960WVMYl0JxZMsIeJixS2SiQ93uMCOMK9MdIpRXtX3C55kEQQRUmI91hXp4aVgJU9uNjPPXlHAKd79Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11730
X-Rspamd-Queue-Id: EF827458C03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35444-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim,nxp.com:email,oss.nxp.com:mid]

Add back channel GPIO support.
  dt-bindings: media: ti,ds90ub953: Add support for remote GPIO data source
  media: i2c: ds90ub953: Add back channel GPIO support

Use helper macro to simplify code.
  media: i2c: ds90ub953: use devm_mutex_init() to simplify code
  media: i2c: ds90ub953: use guard() to simplify code

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v6:
- Rebased to latest media/next
- Replaced label "err" with "out"
- Changed approach from extending GPIO range (v5) to using a custom GPIO
  flag (GPIO_DATA_SOURCE_REMOTE) as suggested by the driver maintainer
- Dropped Reviewed-by tag from Rob Herring due to significant binding change
- Added GPIO_DATA_SOURCE_REMOTE flag to dt-bindings/gpio/gpio.h
- Updated dt-bindings documentation accordingly
- Added Reviewed-by tag from Tomi Valkeinen
- Detailed changes can be found in each patch's changelog
- Link to v5: https://lore.kernel.org/r/20260228-ds90ub953-v5-0-056cf07cc8f1@nxp.com

Changes in v5:
- Improve the description for "#gpio-cells" as commented by Conor.
- Detail change see each patches's change log.
- Link to v4: https://lore.kernel.org/r/20260227-ds90ub953-v4-0-dea596205f9e@nxp.com

Changes in v4:
- Rebase to 7.0-rc1
- Use folder block instead of literal block for #gpio-cell property description. 
- Only log GPIO 0-3 stats since remote GPIO 4-7 reuse GPIO 0-3 pins.
- Link to v3: https://lore.kernel.org/r/20250916-ds90ub953-v3-0-bb7bc6545da7@nxp.com

Changes in v3:
- Make GPIO range from 0-3 to 0-7 to support GPIO data from remote
  compatible deserializer suggested by Rob instead of adding third
  cell for GPIO controller.
- Update driver to expand GPIO range.
- Link to v2: https://lore.kernel.org/r/20250911-ds90ub953-v2-0-03ee76eb6b59@nxp.com

Changes in v2:
- Remove new property ti,gpio-data added in patch 1.
- Add third cell for GPIO controller to select GPIO output source.
- Move PTR_ERR() in dev_err_probe();
- Parse gpio third cell to select which GPIO pin the data from remote compatible deserializer.
- Link to v1: https://lore.kernel.org/r/20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com

---
Guoniu Zhou (4):
      dt-bindings: media: ti,ds90ub953: Add support for remote GPIO data source
      media: i2c: ds90ub953: Add back channel GPIO support
      media: i2c: ds90ub953: use devm_mutex_init() to simplify code
      media: i2c: ds90ub953: use guard() to simplify code

 .../bindings/media/i2c/ti,ds90ub953.yaml           |   6 +-
 drivers/media/i2c/ds90ub953.c                      | 118 +++++++++++++--------
 include/dt-bindings/gpio/gpio.h                    |   8 ++
 3 files changed, 83 insertions(+), 49 deletions(-)
---
base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
change-id: 20250901-ds90ub953-168628c53a00

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


