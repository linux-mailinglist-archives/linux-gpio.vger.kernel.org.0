Return-Path: <linux-gpio+bounces-33177-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELMeBf69sWkwFAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33177-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:09:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 834A1269134
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D67930000B6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0BD35B126;
	Wed, 11 Mar 2026 19:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fktWGuNK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013007.outbound.protection.outlook.com [40.107.162.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213AD3290DC;
	Wed, 11 Mar 2026 19:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773256132; cv=fail; b=Ae80rPTWWs7Djac0TEZD5kgcfTZbfpLspS/HPMu3jUYqOMSarQqCGbEadS00w14cBT1IHIVTdD5ZU4OMLGjoFpzstRWqjW5/GMkY7xKV3wZM9sLT2INRPCPtwwfZWtGi1TpwfmNIBt7nruTtgeWJmNKkOY/sYUECLIFX2svSR3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773256132; c=relaxed/simple;
	bh=fNpYKqCRuA/NzyW8TuYqnEKGw18r0cR0k4woms//VgQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GYFBPO/IjTangDRGmfLm4Y144DJeeJtCUM5eSPBNdlCyy2mbf8AIwzlqOvLTkxqZZMonY2U48r2sTmxlj4NVPWfD73KjBXc5aKH9PTC3NjfGqXfCgN6RVXj7vNCBxWTpVIiXewSSEmxn09vx/q8puctebJEHQ8CyuZrpVyZnbhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fktWGuNK; arc=fail smtp.client-ip=40.107.162.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/DScyFj4RmQ6pAMse2hFFaEgrWHGw+rluaxKRLTzT/IsZ0GO+2T7MI7w0+bZnNl4vpaTAli/1/dtSODtzgSYgyL0FyL4GLZHvMM02IFT0DbsuX9fveFcQQFOpfPQksCPT3coPjXfsGz0XVVXDeUJw+TKKVTWYen3Rc550DOYad6VrniWyadI3RDWE4lyvUG+wwX0SPlEGh2UCVUad2tK92VPRycSKmmVC00KNp02LCepHsXTftTfkNCERwE/UHrMVb/7gbpoLBxcKmUARXadEQPxaTEuKs0P0MQSVvZVpWRuWTc9fUFzYRNBbvtmwMbFinmZTK2NY9MflY0sriHew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXDd9sddiP2WZwfKAQM8CfwFs+wHluCC4D3npKiXY1w=;
 b=DiOCVqav9dDn6FWtiPmlxHVbzmvFVpAOU/kUHvIznVkd2XWgDxknLzCmaQWSr0ZZdMZIdnuKWOOARysptY18wMuJo3JUHw2xycdrvOOriWBfawTZTmww/jmXDRXLBcKbUF6HKbGYVsVrOGRciw/0ZbR8pgBAV1Wr06AJiEQxKUWjLqNgIB4tpqHQp9SG8EHWmpc6nLtzHtRGviE9EiW3r7VhYQ20xSWI/Xl+8VMnkTsAVBWS1IoWcbNqJgCFbmpwP/4KBQ+j28TcVz2CnwBGoFfSxDcbm8g2HmB13qe4+tt12mrpCUkJNI+Umg1TJIAW7JbRwIV0YaWlKc9zROWkdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXDd9sddiP2WZwfKAQM8CfwFs+wHluCC4D3npKiXY1w=;
 b=fktWGuNKzsr4gibqUvjzw1ziuff5KssODWkQauZZ/V7h2+n1v1xOPFiqPN+wqoNrwXkdHcuBLzcUFsXeYSBa0snaYb5BLzdIqmt/meQ/orJO8jh7/+TEVHwMWZmlT0sPIWZcbdzwJFvC7ScHqmz+tSuZrBbBbqFSQJ09xZJsjR3u2PKOBpw353jWICh/Ls97GyK52IobsbNKHGkOnroBXcIaamwHrCxh2vZ/yGwfNRhWv70a7LJf6KkKoSJtp1NkYoUo9y5WpiiDtzWyb1M6T0uqN1bbet39jd26HK5LsHr3+zEimUwi32Vz210Pl+f7b11XKBJBK2oHY71hkgaSuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9121.eurprd04.prod.outlook.com (2603:10a6:102:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 19:08:43 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Wed, 11 Mar 2026
 19:08:44 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Mar 2026 15:08:16 -0400
Subject: [PATCH v3 7/7] arm64: dts: imx8mp-evk: add flexcan2 overlay file
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-pinctrl-mux-v3-7-236b1c17bf9b@nxp.com>
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
In-Reply-To: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773256101; l=1715;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=fNpYKqCRuA/NzyW8TuYqnEKGw18r0cR0k4woms//VgQ=;
 b=jMqqQ9suodSsnkC4UdMBnl58Wipt/qXOCucHacMN+NLC4sEUoRUkjCcG1eI7X90FrowYP7Wdz
 zri72oSQUVqB8ykGQTvTOHMw2d1UpMR0npvdtK08may8YiOSmO64dkp
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA9PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:6e::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f77bf4-bd70-4851-7720-08de7fa19d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|19092799006|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DAcrduIbJ8TJMbOfOOYf1JvGEAJLhoPVjQxN9n47060+h/KC7+GqbJYxuO9QJjcNZZBkdXOpM1ITaRcSe7i5pvq9WQYO07JeyKu9tc9vO8FO/9SUqB2b/ZbdyLfhm8gWwHS0i6w6uxy9V2DzEPslCUIddMOPxOZbt0j9Xyf4VIwie34d3kAnRmYtkZjZ3FjXdMXvvbl6RYZCUvrFXjzKA1XWR2zSzeQUGIdgTyOEVCHaG7MXhD1vD42SEP0cUNT+sahuX98qLjGDQXdUwtREaHmqgTw5JqYaa4mwSL8Tck0QqkeE5RdBaqmVdqd4jG2/jMeJAIvL0BHSc4JHIg1VLUn9OduWKHRviyAA4f8Tppn4DgAXvaKD1XWaKuZleCDzEzrIawK9ntXpCq+EVaqMTkKitme8CHu96OT4XXrRf4vOprihHSp0PVzbuK3jjy41UO5ke2sqMToTuccNDuVIEsuC7r0T7FHVGDvM4fpstcwE1Nu8AKnJsuVJdk/dCdBoL1Se4XANW2fylGBh7LIL+9tZW2Z2UvYWGMmKRBhUmpJh+whxIhAlayyMcQXxJBuTkwPZ5KRQxoeaypMO4ZBAN+vLgZdL4RlXwXokgHB9ue4hEJSg6QrPALaJXEdS8HI8J5sS1IEGshkUtne/y7l8RC+j+1RM764BDfhl7PKYNGfOGES68FtdQLpqmndcTQfj6IYxKj+fioeN4DI5rgJVUfyL6J0Si/wYuK7fOdhUD2PGpx8rmdx8WhBUErb4XIdUclr94+e8Z3R/pxyOFyyWD7c5ETF9YWmcmjO9E2Zt17s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(19092799006)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFNTN0wvWGlMbFQ0cnA0NFFodWhGSkNJaUxDMW5DbDA1OHczeUFyc1VVVDcw?=
 =?utf-8?B?MmJCRHJ2c1Rwc0JHb1RLWGNtRHRMcFdkaDkybFdLbDJDWUlxcENiaGcxYnVY?=
 =?utf-8?B?S08xa3pMZHB3anEwN0wxQmJUNlUxUjBpUXcva3ZkVzM3SHlYa2R1dnFTRzBK?=
 =?utf-8?B?YW5aSHRWcUZhbnJKQ2NxdjJBSmNFTHNsMmhLTkUvMnBLbUJ0UHE5bnF1K09V?=
 =?utf-8?B?NEhEa3lJWlhZUlRrOU94V2JNK21lQmNPb3ZjVzIrTWZmK2gvTUVBZXRERUFR?=
 =?utf-8?B?QnM5L3VCZUV3U2ttc2l4eU4zU1lsSldGdHc4R1ZQVDlVZDdJeGdGcnZpQmZk?=
 =?utf-8?B?SkZ6Vms3cWxTZnYzVEhLS0I2Q0J6a09hanZ3a05id0FFcUdzbW1hejgxNGhX?=
 =?utf-8?B?NWl6ekdVMXZyYnhUV2xaZDlsYUFvVXlCdG9UV2NRV3NRaHFObzM3L0dPZGxO?=
 =?utf-8?B?TFQvWGQzSzRXT3Z5K3pwMm1zd0NzREw1dGJYd0xOelhHNkUzVmhwVnBlZnQx?=
 =?utf-8?B?T25HcjA2eTZlelJuN3Q1TkFBdXBjSzBkZGxGYTR1cTE1QXljV3NFei9pYUxX?=
 =?utf-8?B?VVY3cXZOQWo0bFdNaTVueEZvNDNoSHRJZEozUDVVSzlKd29tNXZSNkpjRkpV?=
 =?utf-8?B?WUdRV3JDUkVJMXRlWHFHQlA3MytKQ1RxS21tYU9Ud0JTQkU3cFZjbUtQWkhy?=
 =?utf-8?B?VkhqcHB5Nm1sUEJHWVNFcTFrclkvNWN0NmZzb2p6V1VJdVY1dHJZcFEvZzNQ?=
 =?utf-8?B?d1U0c0lkNFVHVnNZUGgzeVdSMnNpSGw4QUlvM0YrbzBMb0VHMkZ5MXc1ekZC?=
 =?utf-8?B?YzlkczJ2ZlFKTXczTnNaVFk0aWZlbTQ3L3MwMVVxcXJ0TjFOZkxSYWZTM2Rl?=
 =?utf-8?B?MHVlMkpRRVVuc1RiU0NMTGFhMWdTeHZFTFkwaFllWFJoZFlxTUk0dk5sMFhX?=
 =?utf-8?B?MERyenRkdzNlWmp3VjA4bVhPYm1Mc1JDQ1FaVzdZRndZdThCMmFDa0tGSkFk?=
 =?utf-8?B?bW1tUEhBSkkxQ081U2tybS82ZUZGdWhVdEtDR2Y0OHZsT0FhWHZVT3huWGZ6?=
 =?utf-8?B?S2Rxc3FrUFJ0ZUtVTy9PeWY4VlB4YmlaclYwWm52ZG9jd1ZCYVhQNlZiT1Zi?=
 =?utf-8?B?TXUzbEp3R3R2V1pGNGdMVEljazVORDlSejU3QzdrRVBvUGgvVXA0V3kxb25P?=
 =?utf-8?B?ZjAyTlZDd0g2ZU43b2ZiNy8yYmdUSm1vcWh5R2tJWnJsNitaRVpSdG9CU1pD?=
 =?utf-8?B?aW1Teit3YkpSdmQxQi9EZ1IyWkhWK0hTRXNKQ2tVR0pYdm8rSnhFV0N6dDlQ?=
 =?utf-8?B?Z0tXUGdpeWxiVDVadDVyNXpmOVRBMEYzSTFJaEkvNURGcHEzekhERDNHRitB?=
 =?utf-8?B?QWZleG5Oc2UzdS9weG9ySndQYmFrdnFrUjBYOU5MaTgwazNYUUdoS1Jkejg5?=
 =?utf-8?B?eGFUbHRhTElqcFcyYUpFWEhIM3ovZE5uQmh2dEY2ME5YdzdHbHhGRk9lZ3c1?=
 =?utf-8?B?bG1EQUh0c0M0RnJsNUxqVGpvU1dRQWRFWGNXRjllVGlDWThvc3RCUWMxOXho?=
 =?utf-8?B?czdGTi9Yb0lDYnUzOWhDNlhQSVZSdTVUZVNRbEROTnF3NTkyb2d1dy9FdVNX?=
 =?utf-8?B?S1kxc2lNd1pLdVhJNFc0ZFpQM3hDbmFsc1dDS2c3ODVvczhGTTBjOVdTRHhV?=
 =?utf-8?B?UmFuWlcvTlhSUExNaUZEcERTWGc4MGxybnBHSVdXeGRudVJqZ1FXTWpndDNi?=
 =?utf-8?B?YVMrajVIc2duYTFvV1JZcEJ6Y0RYSElTM1l3alB4ZFFZaXAxWmxvMXR4VzhC?=
 =?utf-8?B?dVU5Ylk5b20zcmFkeng1UFViZkVoYktDUE5kVkY2WjRQMitIYnIxcEY0Y21k?=
 =?utf-8?B?OEkyK0VmdjZ5SkRrb00zRDk2WEVJYVM5QlpKcWhCNkQ4WVZzS3FpbHFZcGl3?=
 =?utf-8?B?OWN6UHpJeHhNRExBYmQxeW14bWJpejZLQ1kvY3luMngwZDB6bnR4RWpoeGJq?=
 =?utf-8?B?VVoxc08reVltbjNzREhrZWxienNJd1hUWUdUeW83Tzg5a1E0RXZhZDIvTGRu?=
 =?utf-8?B?ajZyWjNXclVyei85ejhlZlRmcVhHaWZpWlFCOHhiL01LZDFwc2hmNWJLelNX?=
 =?utf-8?B?ZWVwNmZ1SDJPQk0vMWxPdndYeUZldUNYRXZ6bE1DcGdEdEZUOWU2OWliVDNO?=
 =?utf-8?B?c29ha2dTbjZOTlUrUllubkFlNlNLU245N1dvVTlGQi8vNVo3eUtOOENTWHR5?=
 =?utf-8?B?R0JSTzMwRE9Wc3Z5a2pFWDVZQlkrM011KzQ1SGhodExQNEsrWElsYzFzaUl3?=
 =?utf-8?B?N1NXVFlQaWFnUDFmNWhHY05DVkkyOHZheFA5TFcrdDIvVFVjdC9pUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f77bf4-bd70-4851-7720-08de7fa19d89
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 19:08:44.4569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUyfsAc+8nIP6LsrOdUgIFq7AcqXNaUTAW3odp4c389V8mgQTrWlXY4/akPmqhvkQMX/A5XHQI2UXkmuC63Imw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9121
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33177-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 834A1269134
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add flexcan2 overlay file, which enable flexcan2 node and disable micfil
node.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- none
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


