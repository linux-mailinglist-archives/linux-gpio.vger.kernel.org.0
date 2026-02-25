Return-Path: <linux-gpio+bounces-32199-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP0VDaKMn2nYcgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32199-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 00:58:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC22219F36A
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 00:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D2D23086076
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 23:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF3F387578;
	Wed, 25 Feb 2026 23:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SRPnQXO9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013065.outbound.protection.outlook.com [52.101.83.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A589387579;
	Wed, 25 Feb 2026 23:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772063741; cv=fail; b=WDdVOOWMjSzQUuBQcVredJux2Q4VPUQGioXIk208Ddz1wQHX/9MLEv++9iVPEiC+YNsQU/LkZmispzuS/QrOXRBljNnzV7l09gCvFq26pzJxU7uVBoaS0uS5CSOZM3OUjVW30AwQqfgwYTljANwg7SXNyfElZWw+3vHtdEJ0qfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772063741; c=relaxed/simple;
	bh=Mrv8690NFbwq9YfxxVKxVjG1LaSA8D856X2XcXjhNwk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HAu5uYy0qpVX4p9B2F6KGD9H1tB1fzjxNc/t6IfsFrZ5ukv0oqu0w8OOMQ9caAyN8kNR/q/Z5HNkHvjrWEjxW5YWQcKJpBdqtAYJie2onbZMDjhFTwI6mm+KeMu53SxQFB0tSiXLLSSjdJ3v04JEDakKy4WvYG1OyCYwjY/sPWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SRPnQXO9; arc=fail smtp.client-ip=52.101.83.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOnWzHs4ANQ7p5R1h7Btgt2EPgIAHKPHZv7uLNdsOSEXGCysjpvMgehFAupUZZJWzO7zn3dUyw5D0ecC/GImM4jWqCvC4gp3lP06cVBzltR7jcaAPr0GhYU7DaaWS1Pf4+gfgplm5qxbpSCty3/FZuDRsIDv4zw/SWWwe/W1vCNVfigGiRDZyao3PK/0ghC+vm4+ZRgvc8Htofyi03NNJBklCaYMzxOqLFDn8xfCRq7LTrlemTPVLp5+On8ApMSxx2F6UtRi7OdMHL4BpJSgsAaU92NH7f8OtWnneKKbuWvG+1VZMjLdb0ctN36diQ9Lc8PTqafr4nbGRwJyxb/Jgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAZEuhxh8s28UGQs2QC8rTuQc3uiuIlfeoBBY97q8+I=;
 b=BoMsCogFCVqjf5OZHU5sO+CrwXChEWb1nOemAydGSfut9mQmXkBas7sJ0Ex6caI1yG31400k/SSP27o8BWMJLnBYH0p9DsXkzolEifQRAXm2GIBUGpXLISM7ZK2nXKHvpGGdzOrS+fCJga+PV8t/oLM/kgBlOWazQXsOjaHN6uZXWUZD5QLt2dbVqRDvKVB4YkoFgGr/cNAXhvSnQ9RqW//Jn3ydQNTki45rCXmApVmm5rfTp3YfCY/MMzGfqCJLw+gLUiQZVeehtJcn6pl4eX5Gj5nGCEVeLj70LtkLHfw+3jO8njcWKLRR7T8aLDCHd2Jr18jUMCziOjyOUgqvPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAZEuhxh8s28UGQs2QC8rTuQc3uiuIlfeoBBY97q8+I=;
 b=SRPnQXO9llIREYZKxiFeTAJX8ZuhFoSrfhhk8Bw5JKcbzyYSLX8uQ3j2oe57GPzqRUl3yC9ZKa+mWXLT5KgVLlk1z0akjYBB4GmtID9SypGkzS02QLkGc1Tlu/IAgTiENzGMx35yZ3b5cdGyl9XWq5fEM/RxFbog2DQDUpnifGhUZnPcdHcMHo0X8tOuuGOHqQ9LsarSZ76yd9y3k6dYO8qoeaVtp17IzcWIdeg3eWnpTjci8CNKJ7OuE1CQtsp+Tx/JMFEKpOL5tbx8CX44X/Ip/fUEXvu428xhMw40nSzjk0GHdBlRhQbyrA9XTGcVSbXqicsFz1OJNfBvb8qboQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8771.eurprd04.prod.outlook.com (2603:10a6:20b:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Wed, 25 Feb
 2026 23:55:37 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 23:55:37 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 25 Feb 2026 18:55:10 -0500
Subject: [PATCH v2 6/6] arm64: dts: imx8mp-evk: add flexcan2 overlay file
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-pinctrl-mux-v2-6-1436a25fa454@nxp.com>
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
In-Reply-To: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
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
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772063713; l=1688;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Mrv8690NFbwq9YfxxVKxVjG1LaSA8D856X2XcXjhNwk=;
 b=g6YDmsBH3klPxtAhs1iU3+WlZSMoRPYXbBj2+tIoU/oGGp6dFoK05c1rYiGCJ5N6T4QWCQwNX
 l8V5yIFL3vVCf9fH2l2xDy2/vKEkPcxVRUuasytzwrchm5jTNC5TnrK
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: a35c6568-ee1f-460c-363f-08de74c95f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	gfTBUMHg/ZRPoT8iFvFdZrORirDGIiD2mAHGgTJ3rlwxTNUttWloYIL2IdhJ6EbNF6573QXUj8CLxtUePwqNPRztCEmYPzKoaR70zC+iIYqsvv6GDNQSFzDnh8tXscYPPJ0nUVOnvdNE8NAMTTu/7n/kt16iDNvcxr+i5cMiaYuVyVA0Bzp3gV4ib3zkpObFvS5Nuvl7oxsDrMZROSGgaa6r+hMYfRm4uqAhf8kFy1Wuk53QGsBRhHx6OF88zxfIfqq8POWqwo5AQBkqdFVr1V4FEKeyB3faPoQzpF0RQd209ctjzOaIrZP4SckZpztdQOakntkXSIbkn+/UY30Msn6VJ0+pPkgct+IQWgzqgyLEQymhWaONFmKt1XrnH85Y8hf07Ij3nXxzb3WkNzB04rspAHkfd4BhLkN//Y2PgmI0nuyMnOSGTAAuXbquOel7VajIy2CcYBpGVCGvfUHC4CgT1YTTswXlnneh/C1n/uRIamuIf6yWOGx1KndKO4FNTmi8E4UUOWI3+rOLOHUyojdTdwLYfbe5MI68KdX7aTHdo7i8DBi2romj1pxmRWxKqO+ysXyNe5f6l/Ej0cUC6aCkyIszTXl9CjpU3NyVPn+oR9V2Org+2BOfMjCaTbgWcMTIVbjy2XsHrEpCfhglgKyu/e5fG9zYjqPQ7TXIBjKHn2b/yaF8zInNtASO1R4b1UW9t0L5oTmZ+FdxWatg3Y5cwQeDRejuOTqIkt15C5tSnCn2FB3Ow3xKf53YNRAaEov70gIk8LZceZ0+XEStXBjlY9rEaWR2ZM0mjzMfkXw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjZYa0tYeVMvRmtPR2x4RndoaXhKcHlNMTNJRlFFVFU1czNBQUJqTnRzM04z?=
 =?utf-8?B?QUdCSDNYYUIvRm5NM203dGc1TXhCQlJselBWWEZBUWR6bkpMQ3g3RTZ1dFVl?=
 =?utf-8?B?Y3kvU0x1bDAzYlNuSWZXRnc4V1l1SFJnZy84cHJFT0RUTDFiU1IxUjV1RE5C?=
 =?utf-8?B?MVhtK1VUMjZ4WjEwdXBGaW9Vcm4wbVROVmx4S2hRQUdqMlBUaDlVV3RPUW5m?=
 =?utf-8?B?Sm02K2NDVFlGc21VaW9FcGUzZ1pxUGhGYlVaNlJNMVp4UWhuUGRDRDJTeFRC?=
 =?utf-8?B?aUNBQ1MxcmZQSHNoenVNbE5qVjVncHM2M1RuY0RNWitjcGNUZXBPaVdlalRH?=
 =?utf-8?B?RTV5dFNrT2hkY203RTFHZEdmWmVEaHFFZ2RETEhtTlJZdnh5UExaWFZaQktu?=
 =?utf-8?B?aGtHVGpzZ0VhcjcremlMeDJ2dndNSUZuLzhtcGlKK2lsbXhMUUhkTXJnaU14?=
 =?utf-8?B?WFFObEpTaXM3WDc1RWFnc0RRZENXeFFqbEtHMEp1RWhKaElaUUdkNTlXeUxr?=
 =?utf-8?B?SGpqZTU1dUpJWmpISktubWJPdFhHVFVLRndQNzdqOVVEdjMvQTdNdGkwTytG?=
 =?utf-8?B?Ly9zdTdZWk93M0xaTXhsSW9lcmVyLzRwOWFJcmdOSDhEaHNmME1HcTZpWEky?=
 =?utf-8?B?NUtVaXgvUnFYL3lsTncwZHF1NUgyaGpMcDkzckpndzRoSDByYi9ZOUNYRE1T?=
 =?utf-8?B?Y3NVeEh3NGtZbkNteHcrWDEwUHQxeFdiQmZnM2FTYktWTDRjai80a045ZHlC?=
 =?utf-8?B?SWdsQkcvMWxMVlIyM2N0dndsdDBlOFdUNmxXWklsUGlsQzZnQnA1RWNPZWlK?=
 =?utf-8?B?aEVWSUsyL21hNlN3aXlVeE9VSEhjUUEyT1pQcEQ1a2dROXN0OWJGN3l1eTZs?=
 =?utf-8?B?OGlLbWJvdGx3czhjRk1XL0RGdDBnZUtoV2xhV2VWU0I3bnFYQ2JxcGdRMjlC?=
 =?utf-8?B?ZGxRQUpSdzFjbEVUK2I2VUxjeFQ1b0lnSWNJL0NDaEdZbG4vTTlCSW9zZEI3?=
 =?utf-8?B?Ym80ZVlmS2NZckw3QiswM2plUGR6R3Ezb3VUQ01zdi9GQzgrRko4ZzJmVWtN?=
 =?utf-8?B?TGtybkNzbW9Ia1RZL0grNTRxYXdpYU1rU2dzN0Z2MDBqQ1BIUDQvVXVmNktP?=
 =?utf-8?B?aHc3M3MxN0lKemVJRkxtUFNRUEJreXdYQlIwMDQxdlAzYXdPVWFjR0JDVG9O?=
 =?utf-8?B?Z2NmZFR2aEs3SXJETGZIdmMxdTJoOXVPa2lJMmRadUFLVnZVTXFRbnNRdWd1?=
 =?utf-8?B?SmVYZmJHWlNFMkFwYmQvZ1NhbHkyWGRtR0pydzlVSXMrbHdTaTdkempUNUtL?=
 =?utf-8?B?dFBtcG1PMDc5TXFPelA4OTlaMUlsUTBTd08raTNpb1Izc0ROQXR4Ui9TeHZW?=
 =?utf-8?B?WHE0TDBUOFFncGx0Nlk3T3V5eXZ3YnBSaUVUeXRyVGxJSERudi9QZFFEL3VS?=
 =?utf-8?B?Zk5qV2U5MVR4MlJXNnJWTUM0dnRXTXJtalRQTkVqYytCbXBYTFpYZVpjUDZq?=
 =?utf-8?B?YVV0UVpFNHpTN0twR1hYcUtFMWhkY3UxYkdCZHpYcnN5OFhWbGZ4ek9HU2lS?=
 =?utf-8?B?SHR0S0R6N1JRMHBlcEpxNlhFdzBCMVZjUmVCTzA2VVQ3U1ZCSE5JS040Unk5?=
 =?utf-8?B?Unl1OGVCSU5GU3padnRBY0h3eUpnV3AwYnhMc2tNeWNlc2tMQitZZGdFU1lo?=
 =?utf-8?B?eTIrNlozN1BTU1ZzL0dhNGMwZlAxK2JwUFgwZGhtUHh3T2dCWXJBb3FPL1A1?=
 =?utf-8?B?aXhLSFBhK2ZMdFltYUYrZXVGUWo3UUlvNU1yK1krMkxCaUpXdFdxY093MHYv?=
 =?utf-8?B?OCsrVVNSQnQrOUlPWTVuU2M5TmxXUEZoWE1zNWxyaWxPVVh3RENKTEVCRjYx?=
 =?utf-8?B?ZXUxemp5TGtQa2tBd3dyTkFOQVlIZ09yeWY5UTdWT013WW5NNlFhdUw1M2pF?=
 =?utf-8?B?MjMvYVhPaTdKaTdwUDNJSGU5TXFGeGZHbHY2Z20vbThJME5nVmNVZ3RtNi9Y?=
 =?utf-8?B?dnN6MDVsTVhMYlk0R1JIZ1ZPZEZ4QXEzRE45cGlraHJMS09WbXRFTzNPaWhw?=
 =?utf-8?B?d1NRdXhEdHVyYVZjM1Z2MENpT0hjZFFGVXltYmwvSXY0ZXJjV3JGeUlRSGlM?=
 =?utf-8?B?ekwybGs4NzIwQkpHd09yaTYra0l1Ulo5S3B5azlMZllLRS9LSkRCSTdqOHR4?=
 =?utf-8?B?dHk5THM2VzVUZFV5QXJTY3NOZW1HNXNaZDVxZGNYamtOL2VLWTl1M2VqNjF6?=
 =?utf-8?B?Z1Vzc211N05KTDhjMUNDbUh5b1puZ2VMSU1oVXYzUjBuTGNHcFE1T1VZV1Ur?=
 =?utf-8?Q?JJMlwYH+Lq5JJv3y/w?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a35c6568-ee1f-460c-363f-08de74c95f92
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 23:55:37.5303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBVB506+7YFcNfWK34leqBFzgIfMf3DDIl6yJrLR2g5Mp6JuOhs5ggkP2AzSWXPn52NZIadUSbXB+JXSpkLZOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8771
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32199-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC22219F36A
X-Rspamd-Action: no action

Add flexcan2 overlay file, which enable flexcan2 node and disable micfil
node.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile                 |  4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 700bab4d3e6001fe6cf460fcb09cfe57acc77e36..bd377191a68a6167d5f9a65184d19c789a4223ee 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -233,6 +233,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
+
+imx8mp-evk-flexcan2-dtbs += imx8mp-evk.dtb imx8mp-evk-flexcan2.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-flexcan2.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..f7d2674c45f72353a20300300e98c8a1eba4a2a6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&flexcan2 {
+        status = "okay"; /* can2 pin conflict with pdm */
+};
+
+&micfil {
+        status = "disabled";
+};

-- 
2.43.0


