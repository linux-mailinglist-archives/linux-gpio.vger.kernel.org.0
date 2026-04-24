Return-Path: <linux-gpio+bounces-35448-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI+7HA3K6mmtDgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35448-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:40:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3E3458D4A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E5C63013A59
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 01:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9773A2749DF;
	Fri, 24 Apr 2026 01:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sZKk08s5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013054.outbound.protection.outlook.com [52.101.72.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB911D86FF;
	Fri, 24 Apr 2026 01:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994801; cv=fail; b=pCUXWQO1HuBHmOMFurpuSfoYwPwKHY32yzQnvapJ8DCDpfctStoNpM/nvjd+M6rr0oWNNOwiP8jFujqshUAf8ffL5IAaAyRwsTW59bLk5sLbtha0bgau58FcDaMQfrQsrSO8WoJ6gVeGOYytGZOrwcs+j85o64V7zr6103xXjlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994801; c=relaxed/simple;
	bh=WkDXVk9bnUHejfHXSY1At0nKxCSLZoePbRS+Q5yAEnw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=QQiPvrOh+TFFrhhY4aru7h+6FUGuQDmKwPh3WjdJYfQwbt2uUE/N0+/9OBUw1zBHhZlynb04OVCZFd/16gIAvZaWLp1iDmyT5wXd2csGxYwJe7ZyDNnljarJHpsvc6AGAqPBRSFEmhq7ByFT41AJAr7Ij9W+EwT7ts6xrI0smx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sZKk08s5; arc=fail smtp.client-ip=52.101.72.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N772ILqf6Bu5ZB2TW0EjtoN7AePcCf08vTo+WoQiTq4PzpVAUADEySSkzoTJX9vlSN9Y1Sz4vQnazxa6F9CEswxjYIB3OnN4k9SAVmf4vX6QbQ8uRqtddZGexC6WC4V0rx0WxVhaThSSnCIFl/e7tyZlxy4v4Elu4Z1fNuqLFRnHaoXdSMuSPRwse2uiUy5mkX7oPWG5XIziEdZa2WBg7sbQm9OaInW5vWZkuNnMmSiXknyyzdi22akXEUzRTjcpQKi2wYH6Qo4HW/LuE7X15ZSagtnO6jTbJ4pfyJGKZAkplcZoy6Z+qGlr5/KuIG2agv8rVa0uPjtv6s/Ek6bX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ct2OL077kQIYaYn+FwHUHj7bBRg0Wse8q0rgKPkFY8=;
 b=YH4ZFawkp6e6ukV5cBR+ds/4LlnYr2ZtQrICDRmQ7iHXKt1DUkLbJaD3nfTN/0SzyFbRe974JL8zFzj7fklMB6ZKEAXHhzl0KB/Ewv7eg6mUHlu8a61o06lXrRXFhoVmTD5Ek239DUU5WTHIWb8lRl8oDHDIeVe7cw7QZA8pPcYICBtMzltSSPsKrsSH8j36tn77khaZXnJGVL2aCGcaCVcPxUMP9zngHnE8jVAbE0NI98FbihiS/b8N48vtneIJd0fTmOtBAQmPSeF2kVkMG8deKx+ESs63Lx5nU0udB2kHqDWfPdIkPlbjNcJ5vfXOa0qRUckUgvYyj6YJnZQOJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ct2OL077kQIYaYn+FwHUHj7bBRg0Wse8q0rgKPkFY8=;
 b=sZKk08s51RgHWxU8BN3SmNHOjttznQ4vVSiPaVpZqnrB2RV2Bz9TcfE1ywB2qCFFkWenJjL2SxvKpEDTV72chLfik25u9bJZ+yqk2lbQWtlG0BaGxDMPQX2E7s/aDAvmJ0WPuRD+lCQyhDLstbf04zn1OWEz5ntx540ewuCF9+3MpEGzBHwOxHpfu+iJbbbm2tY00ZVmYdLMm7RXiZFZBhIrsSAQ9B1rQgeddMo+JVYdeWK3U+Gf9COGDc/joH9fiV9SX4d9tooUDdlZ8REP5JUD7ksTO/Olc5e1z6fj3ehDDzTl7W5diFNmH1g4JEaG1X1iq5lX4WSoNwbdZ0NRnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VE1PR04MB7455.eurprd04.prod.outlook.com (2603:10a6:800:1a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 01:39:54 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 01:39:54 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v6 0/4] media: i2c: ds90ub953: Add back channel GPIO
 support
Date: Fri, 24 Apr 2026 09:42:23 +0800
Message-Id: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH/K6mkC/1XPTW7DIBAF4KtErEs1gGeArnqPqAt+Gxa1I9OiR
 JHvXhy1El6+Ed8b5sFqWkuq7O30YGtqpZZl7oFeTixc3PyZeIk9MwkSwYLgsVr48RYVF2RImoD
 KAbD+/rqmXG7PrvNHz5dSv5f1/qxuYp/+tQgYWprgwJ02QuXsYxbifb5dX8PyxfaOJkc3bm+yO
 1ApaUqePNqjU6Oj0anuvNc+EE4YnT666d8RSKlHN3UXk0NLEjDbdHQ4OjM63P+JFDLoEEwe7tu
 27RcWIJ3AgAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776994953; l=2876;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=WkDXVk9bnUHejfHXSY1At0nKxCSLZoePbRS+Q5yAEnw=;
 b=jreQ83mSjy2Chg4LcT+Czji94DlzcXtnZNIGX17II1+LTtFL2dhWSvI69uiSRthLYU6jEZ7vs
 ufBP/7smni8Duj/Hh6GlEok9UYmrcIq5jRarAySQrgdV5HW63eM4f2s
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0164.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::16) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VE1PR04MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2a5465-0dc1-4e1e-ea2d-08dea1a26267
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|19092799006|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	OCoU9f3jdUUKiq8Cj2XsseQT1EeAu3TguxtMtTUc6cpDC+xTHwb5MgaIc0FTzDEmSQ5A2tlxtV7lGNg/Dz465Y4t5XmCDDs1CiUqr0mp01deS/KNoMkomsmcM/5N25kAb2eg4u+FRR50uzsMhb8prV4RjlgJ7e0BwMjPiLL1Bq6o5RACHz3W39+Saa7yiOC1/f9gykVe1C2CFPf94gXvPOZ2NnIYkTBnryKRT1nwI23G0uHaoZNcSlZC3iymnbLPdN5HEE8HhvjrItduE5HFFcaVx8JG+o4jK63WUynJFLV3OFIooV5hLrjwAuphBEpjf3kraXNhDpE/ew84kQZnw+olRDcUL1Z/Zw8COhjG1cRI2L+FSk/JE6M7cr9Q9rV1dFHA5WbvKF/pVKskaTo9w79rZPzTjmz3QAJBfcSEC7IWnYxWJa7FOG8SeOFeq+IduW9M11iaKjjvhqXvNywqn2zkCOa5e3139SLvl5Y9QkC7w9Jn2GXmrzVLQcsiekous1BpdFV5WIznVoaMmX+Xwj0tB4pmbID5S5Di9rmMKWcJGa878s9BgUKAevzfp5qQrgctLD8meAzuhGFI+NNYjYNk2Brht0vRbRg1RIs3O6Av7pQ1cMwlu/CjOhnAK0v6QIarkC/0wurLn6q0n8YZHr3jNduEzaouCTIIOoc/ral9U0tWfib8zGUgKOW/v9hhdegJ8Cu1QFZrIaNqmYKRZOS8A9lF5YUfe5TiORAxenkYg3isNtnLCEA2GopEdz1WV7ur+j2cX7yyXRiW8ouHZWekyTpODwD3ej3m6if9oGA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(19092799006)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHpXOHByTXkrS1dnVEo4aDdQV2xGd2dldEZtL3N5Z0h3eGNvNkhSRWp1Mkcr?=
 =?utf-8?B?OGRwc2I4MzhZQ0NwbE5uZUExTUN4WXU3K29KK1ZmTERRSDBBQlZLSnFmREQv?=
 =?utf-8?B?UjIvWnJEL0dEakZhbUhSUmhkOE9FZnpOQVRITVdPZjZIVGRnQlFyaFlxZ0Nu?=
 =?utf-8?B?cDJmb29vMkI4aW1hY1JRbXVZMGVSMW04dmZJZVpadzBCS3JEUHpYRG9Xd0dy?=
 =?utf-8?B?UDFiY2tZM1FDN3VOZXdva3p5OXRvSjBSVGtYdjl4T0lJbHpmY055UG84cllB?=
 =?utf-8?B?K2JUTzV5cU1nS0ZVcjY2UGdScktIcHFlTzdFTVZTWThyN1VIcU9pendGZ095?=
 =?utf-8?B?Q0J5T2FuS2lFZDBCYVc0YUFZZHZlbHRxZGxVQW42SFRBczBKZXhTZXRURHZy?=
 =?utf-8?B?WEZvbnY2aUtKd1BVQ0EwR0pSckhqci9rdXFodjlNNVpVSk5xN3dGZktIK29W?=
 =?utf-8?B?aWQ0SUNhUXdiQmNyVUlvRk9VOWFrN3BsRkgvUE9EUVY3UzliZllKcHdiYk5Y?=
 =?utf-8?B?MEltZmVyNDZpaGtDOGJneU55c1lqbElDUi9PUkY5SElEKy8zN0NMcUs0SFgr?=
 =?utf-8?B?Y3d0czhTUTk5MDBqK0RZTGx4Zk1zSWt1eDcxOGZNVThpaXJkS1BTY1Y0d29x?=
 =?utf-8?B?RkpONjNUbWFOKzkwVG5vSjE4azdmZVNMNWE4VDlhcGFubURHdGl1UUJQNXJR?=
 =?utf-8?B?RVpLclByYnlYRUdNRTFBeDgza2ZDZFdod3pxNWhacGZKNWEySlhqR3FLd0xO?=
 =?utf-8?B?eGloMXFiSTZRSWZzbEdsSGZWZVJ0QityUjJDQVBadzRPeW9jZ1lpbHVqWEpK?=
 =?utf-8?B?K3kyUTdqekhIVGR4MWxYVGVLaTU5bmVVZ1l5eWNOMUZXa2UxUDFSU2U1MlBT?=
 =?utf-8?B?eU5yRmFSMjRNUHJJWXN2K2Y5aTRvalhBc2hwSkVoVWJMUElEOXluVFp3RzNt?=
 =?utf-8?B?aWRxTnRncW5MMS9BU2ZwcmR1Z2dUK2FLd2xxWVlXbytKNlhkaVNjOFFFcU5D?=
 =?utf-8?B?cDF0NTQrcENWM1V2MDJXajl3TEU3ek1lanlhV3YrVUhaU3pvQVlMUUNCTVNv?=
 =?utf-8?B?L2JOV1hkWC83d0daYXZIWXFyazlXa00xaTltWkRtTEdvdE5CeXJWdGYyaEtI?=
 =?utf-8?B?OHdDY0k1Q2Vta0pwWGZVV2F3YzJkYUpmN3VMNkJHYzVpOVRNVUZtSmtPOGlR?=
 =?utf-8?B?TWoyZ3pERkRGNEppampIRzdCOVFRS055RlYzOStXTnY2eG16NEg3WXNCU29Z?=
 =?utf-8?B?b2ZYdXhRNDlCaWhUU1QvSlVZNUZ0THZ2NWpqaXNEUWExR2lmbDB6T1ZxZjhu?=
 =?utf-8?B?NHVGK0pXNUpIZWRIN3FYSnVLNmg3aDJPalh0WGVvMW92UVNZM0JxcDVsNkNH?=
 =?utf-8?B?cG5jZkI1dWxjTE4zb3UxTHRZbWhCdDFOUVE5TDFhVU9laU1HU2RqYXNsR3dl?=
 =?utf-8?B?L0ZEMnRxTTRoTXd0TlROS05Vei9FWGk3WDlYL2NQa2JYTzk3emtlb0tnUnpk?=
 =?utf-8?B?cFJXQkdpZkVrbGZhcy9pTmVsNzRVTGYzZVczMjZvZytRMXM4bVhCOU82bnVK?=
 =?utf-8?B?Zk5QbXowWDJFMTBPSmw2TzBMZWZXcHZhbUFIeDQ1UTROWVc1bXJmOW9ZK1I5?=
 =?utf-8?B?blZDVlpJbERUSGova3dNSExhNi9MTXdNUGpvZTg3bFNIOWpkeEhGYWVLeXU2?=
 =?utf-8?B?VEFVWk5vMDFrdnhZbkFWaDBLRlBXbktpbDNCL2pBdGI5bUVXQWZPbVc2Ylpl?=
 =?utf-8?B?a3hnM2VnNzcwZWc1UjBFVWp0QlV4MDNOcUp2VDFRRXQxS0R2bTV2L1Jpd084?=
 =?utf-8?B?ZnJYSnJ2MWpPTWdQYUZZTmVQQ0QzMXJESG9NclhXZlJmWXFCVXlPblFPTTE2?=
 =?utf-8?B?WXdWLzROdlhURGxQTUYwMWNDeXZIVFNxZVIyZW5CNFpYUkU0NDdaTUdZU1pX?=
 =?utf-8?B?dzdzS1NjYmdCOWl2QWhleU55Z2U4L3JBY0I1MjJ5WGJtZHlTZy8yUloxaGpw?=
 =?utf-8?B?Z2t5Q0xPdUEzWkdNSjFISDN1Zml3SVNyV0h3azRLTVhIa2ZwNWFBM1Z1WDhk?=
 =?utf-8?B?Rk4zZERJWDJxMWZxdThOVGVRdWVDNGcrb0I3c1BhYXE0Vmxmd2d1TGovOFIv?=
 =?utf-8?B?Ky9MSHhNOERaa0xRZ1JubXdhU0F5VUcxTkx0STdPVW44MnVjMUpCR2drb2J3?=
 =?utf-8?B?K09mM0Z5VWhKU1FLekJSR3hhRGFHRldycG10c0pSYldDY0wya3RhdUlwZXVv?=
 =?utf-8?B?Z1ZZUkpSQlg3Y1ZHWnVhNnUwZlhlL2F0SmRuMUcwU0V2TnZ6SHcwSDFWWmcy?=
 =?utf-8?B?dEswVStJajRPdXZiak9ySFdRRGRPS2haSTExajRBeGxTQk9YWEF2UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2a5465-0dc1-4e1e-ea2d-08dea1a26267
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 01:39:54.2176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfMuEqwx6OSJnK/mF9rye3Va8NfnCNGQsxMHFRkePH+qE+wxvpAwKSVAn4T3XirT8RR13oh3GOnBwJYv2KjQlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7455
X-Rspamd-Queue-Id: EA3E3458D4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35448-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]

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


