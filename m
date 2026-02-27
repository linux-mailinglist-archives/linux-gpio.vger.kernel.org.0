Return-Path: <linux-gpio+bounces-32264-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GICuCSZfoWmksQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32264-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:08:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C501B4EEE
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 195A9302BE2D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 09:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA8C3921F8;
	Fri, 27 Feb 2026 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Hk9F/SJr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ED236F437;
	Fri, 27 Feb 2026 09:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772183208; cv=fail; b=hKaA0WpVR87uIU+1u6zGNrnKkyeIRoniIRxlbfCnHXjQqVUDUlggDvLOSjuHFbR8NTQtabh/sQyaUSLq3njTAo6bqI0Ra5OXB59wpg9MMvPpPwRB7AYQB8k+OMlEmygWCRyurtRSGhFEYE2EefmGPfkhCMCbboptW8oLNRonTNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772183208; c=relaxed/simple;
	bh=+s4oPoriwP+VDAjkTGO18ZLJ53p4GGoH/8px9BxzPV8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IeR2z1c5daxx2MF3onUsWPJC/vFq2weHCUycrIj9aCIlU5Z8/rMem21zvz4rDQc+7NZ+g9wuAvnUumtHsI5VAU3X0jcR7Ihc5yggAB8wLD/Z3MwTkOsWzUHCLHGB/dEsvRiPrB3fQIsq6OM5/ntlmkdUyKtWUzZ+UPH7hmSu+o4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Hk9F/SJr; arc=fail smtp.client-ip=52.101.69.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkaFNhvd3qmQfGlqr3Q7QskcoABrX2ZuxO9J0jVrMsYV4+9c8GwHTX62WZV7cseHnKpktU3aJ+i9pRd2mjwJhahWbCfImNPGH7A0Eid0LmIk1g/yL8qo7LA88vELa/U2V7dwTGVh30BZ4N+Wybp/Z782LTFR8ouJRySB/1D/0qtlVUdfufOHfFUxAiERzdjbynhRF1pGdOl2XHxvAR8xk3U4EZQm5tDP6CYPaFqGlumROqC79xrVpeIv/hu8Jj0TZxPHtC/6AY763L/bMERBA7eBkhA+9zQQs7c0arqN+QNGzt2G3uZFVahw6DxfvD7K4XGymG4JoeJslCwAYikncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+s4oPoriwP+VDAjkTGO18ZLJ53p4GGoH/8px9BxzPV8=;
 b=riVVT0M2wRvhp+qmen1hjpigqPWsHmTqu/zeq9QG4rTjYpVp067JSq9YFzfqCMZ2PVCH82Q/mA7VXGlxTUWjVoY2XdFvketR0lj/37XQJSQxuEPgIpkK6mhS+3gWJfvK5f0qlVaKXnVDmb1QA5JyZMlBAE/+bxCEz9jwWIdXbY41k26CMltW4KNH7laLxyHoMZhbTI+X594Psk9U0fLgLtlJxXu3+ZDpx8YuNWrgaP/KgLoF5OyewleIH7EYassEZwFi9hXTyxAaebFyZe4EEjGHB66GSscbfusJ9Qtbfk+lv2gDKRcFdNPbEKfueq7/qNhHIWCHSGcqu3T6Qcj9Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+s4oPoriwP+VDAjkTGO18ZLJ53p4GGoH/8px9BxzPV8=;
 b=Hk9F/SJrJeuLMhsEItR/3jRpZWW7zPo06hMsJvQzKqPjiyWfLOBJY+GhkhGo1oAJGMH0R8s4kugm+IJ/UacxHEhuzG7lzLtDWEEOf7Y4VZqKPDKXXrVGiZHrHv4IcyJsA8/+AlPGFGBtjDv/1P8wvfvv89WJfXmZ7NOaae95E0cjpiFRHmu6i1PFkvia5zxFGLVuqvW0DzYx+VWSylP1T2MF5JpLOQufYRvLspalxgCw/eSThE6ExXgjcIQDs7j4n10/W0awyd9EIlyE5Glik7dShBneXqCKioukumaYdG16iiq/f56dXvweauqopUTy7j5sXpD84VSLnWvrnb93lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI1PR04MB6862.eurprd04.prod.outlook.com (2603:10a6:803:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 09:06:40 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 09:06:39 +0000
Message-ID: <666b2a17-28f9-4fcc-932b-ac01f326d558@oss.nxp.com>
Date: Fri, 27 Feb 2026 11:09:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] pinctrl: add generic board-level pinctrl driver
 using mux framework
To: Frank Li <Frank.Li@nxp.com>, Peter Rosin <peda@axentia.se>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
 <20260225-pinctrl-mux-v2-4-1436a25fa454@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260225-pinctrl-mux-v2-4-1436a25fa454@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0009.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::19) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI1PR04MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b5c028-fa30-4c2d-833f-08de75df8494
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	4LnX9njA0u7TNMNHesWbw93mX2gS6xKGZs52N1XhW84bHZldMLEprUmxswHsfCPnzyv4ukTEyxua86h0XYnErxEE3s17tY/J3BOknqOc6lwXy0qVcbct52uncc11SWk4KLQRQw8OJyp9LKcDwL0lpQEUzu0s/g6wudzTDqCenbA3xZ0lZgNpcqcr0fvbvTi/tV+heeJFKWxQQ/LLzdzyyEMJr3hxXpugey6VFxoZNnzXLcdL7CBGdBWVZVmYp3nyUl1Sh/asCjCQkSjcASTHBDYimD7z6XG0PhTxMcoLec+qi6doJU6KmzS6UyXv/8Z/D1PxO87eCOaPpAKh6wbcbhlROjqfA6tivnQUr4+9LUzSrox5uou4b4xT3UGuzFYuJ6raDYZC+U2tXI/mdWexqGyDMqKK22v0DmGz+N4/rJbVb3tXNlF4lLYvyWnRsKaArWdH3oNU5wH1SNX+sWSatdBgmQSJ9kck4Co+xAMg1XnlRwNeqQYFdd7xTkbvryZ+GuhQZZfHamQ5QZq8HAbtAfC7KvUPa3Df2JNUH+UxjmDd3jVixpUP3kSczKZDsmWLhHdPBRq76z4oj2Uf4FA8IrlulrdT8a2toyB/RwXTV+YjAQwVlA0UyFQZBtX2M8lRRm7CxRAZxIKSb5Rt608sKO7zYNlsCiQFNueleNyc30/RYJfjhNJjxeE2TLrP2mD7Erh6M6ArQWNQiqlsEszmtDpykWaCMComSWcf1WHXQxFwsUaFbcvZtaF+UUE5W1kH9/zbLgfsQc7t5gqphflgxw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEVudExaSkY3VTVWV293anF4Nng1eUV5S0l6ZEEzOGJiNk00QThhVkRnSzFU?=
 =?utf-8?B?UFZNc3Q4cDlCenQvY3ZTQUVad01Xb1diV0ZTY3EyMnIvTHE3WlJ3TDZiTm92?=
 =?utf-8?B?VTB1U2c5MlZhQlh5VGRwa1laY0NEZU9tSDJTNHphQkQxdDVUTGFyMFBZbmRi?=
 =?utf-8?B?OHBodkdvSTJqYnVwZnRnaDVuREU3aEc0QVhtMkFPbU5YMWRYY0tPNTRYbTJt?=
 =?utf-8?B?YmNDejBoRWhiSFpRZ3NrTDdEem5XZnNWSjhVZjZrUHBwcEtGUGQ1SDNDbmNv?=
 =?utf-8?B?eDlZMGJpd1FlN3NLUjRMcDNaL2dIVEJXSlZFSHJ3dEFPL2ptSzJkRGZGTllZ?=
 =?utf-8?B?ZUYrNmRDR3U2S3NTYTIvMmN0UzYwSzJna2VwYWVNOWExOWdJRWw4eGRJTC9y?=
 =?utf-8?B?dCtnRHMxUHlYZU92VEZ6ajNIbzhRTFJncjN1THNQZDM1a2RiY1hRMlgrMThR?=
 =?utf-8?B?akFta284eFlXZ1pDbmtheVgzdDFHSG9wWHdIdUtKaVd2ZXM5cmVEWjEzcXo3?=
 =?utf-8?B?VC8rU0J0R3FzeE5HbFo5SGZjUVdMNXNZVjA2TTQzeTRUODg4MmNQYlUzQnVQ?=
 =?utf-8?B?ZmZpeUdqVHJvYnFaRGVPRExJVXZUamVKcWZYMGcyNHJpN1l6T3V4b0RLQVhw?=
 =?utf-8?B?L1dhMTNCNC9LZzN3RlJCWnFnNllCWUR2czVWZXk1WjBrODBNZHNGU2J0NWti?=
 =?utf-8?B?NVF0ZU5TN09XZ2dXdWZ1ZFRkVW92TlVwKzN2SW5xU3JSS0dKdDcwQUdjOW55?=
 =?utf-8?B?cVFwRUc2cnpFZFJJSUVRbTM4cmhhTUZLV2swcXg3QTEwakNpeUl6K0RiSlR1?=
 =?utf-8?B?SXVKY2hWZGUwb2wrZTFRMmJMUytDVWdqK2hMT3ljLzdoTlJJM1VudVh1K0JT?=
 =?utf-8?B?QTl5TnZBK3Q2aXBTYkFDandsVXJhTzg1eVZ5ZVBkK2JJRkFaSUJIOU85TU9R?=
 =?utf-8?B?SGkyUjk3UzdpbWhkazF3cUVMT29ZendMVncvOXdQV285SnkyVTh1cnBCSlVC?=
 =?utf-8?B?RkwxTUk3ZlBXN2ErekppQlRjdEMrQUcrdUxIRDk3RFV1VkJCbFB4cldEY2Rx?=
 =?utf-8?B?amtkbGxCQkhDa1YyQVYzY0p4TkFLcTB1MjU0QjFpWW1mdC9ab2NEUEtFWXM1?=
 =?utf-8?B?b1YxVk9MeEhWdzJuMjUxaU9WUi9kMVFJU1lCenZQYzgxYXNIVTFNSXZFaWZT?=
 =?utf-8?B?R01yZkxXRVBscTJqUjhVd2ZjRVZHY0NpRy9QelZRZDU1MkF4NnhBa0M4YUNs?=
 =?utf-8?B?NWtpZHFYTUNpcDJMYk5QQ0FkdHkxTmF1MWwrazdjV21tSjRYM3dPS0hESnFT?=
 =?utf-8?B?a0ptdVJsc3B0NERlNXRVRnhDQVVDRmg2NlFvcW1ZUXZLNXpyS0M1N05GYUVx?=
 =?utf-8?B?NWVJc1RIOTh4RnNnWnhnL2VicjVCZVdKV3FTcXduNGVWZHkyQjVldFkrWkJi?=
 =?utf-8?B?NzVpOUI0cDFJdExaV0hQOVhkc2pmQU5iQVBud2NLMkZWZXBCeUhDWGQwR0pY?=
 =?utf-8?B?VFNFSlZJSmNKQ2dzUnFNZGlaVGVRamNhMFpxbDEvTTJ5aXFXYldtQlh4ZW1F?=
 =?utf-8?B?QS9DUmptM1F5NEF5amRhTVVpODNYdEJGTkVHdWQvaE9reGNMcW00ZUg3Vy85?=
 =?utf-8?B?Yy9QRWdYeDhFWk1qZjQ2aWE0UmhtUi84RGpWQjBwTENUM3RBb1BLQ1NUaVRT?=
 =?utf-8?B?c2xsSktxbGNNRVRPMkpRbEJZcTloV1pnLzlvVzJNK2cvYkViU1NQQWgyMkpI?=
 =?utf-8?B?eUlHdGY1ekc2cFBMeERoY1NYek5zN3JwbENrMHVIOFlqQitPUzhjeEE3WFk1?=
 =?utf-8?B?VzJMU0hJbmpZZXJVMVp3V3RDVDJEelpuNWdRdGxRMEltSVV0RFpvNUI4Y0lj?=
 =?utf-8?B?aTY4MUd4SXpOdlpkL3ErM21xNFBVMSt5b1g1eUp6TW5TRmpFNlR2dTI2QUl2?=
 =?utf-8?B?K1hpR1IzTEFIRGgzdGNnbkhESlU4d0M1cGYyZmpyNXptTWZGOTM1c1p1MVBZ?=
 =?utf-8?B?aUdvQkpWOUFlT21tWDNOZDJjWHBXcUVaNTJzZjJLVktudmlVWndnK1hBci9y?=
 =?utf-8?B?b3ZlSFZVWHhLWDV5ajFhMzlRblZVaGtzYi9QUmhnRXVDbmttdm5HeW1ISG5x?=
 =?utf-8?B?THZYMEVYMUlXZVBKTW5FQm9GQkhYLzFKTWhYdlJEbzBNdkUvTkJSak95d3BH?=
 =?utf-8?B?OVJXNFFFU2JxOHVMeWpsOTZiRmd6SXhkOFpDczNwUUNBKzZWZm1kU3loNkhT?=
 =?utf-8?B?bHhXZVNJd0JZOHZLaUpnMWljbE9ZcnR5M2luZ1E1b3NLMTA2aTZpd2p5Z1ho?=
 =?utf-8?B?d2l5QmZ4eEw4azBOdEtMZGVYZ056K0RCM1dGMGlibUwzZFMzdytwdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b5c028-fa30-4c2d-833f-08de75df8494
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 09:06:39.8602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yw0tP7VryIslOUU+xy/p1aKSpiq8JkvR9xW2Mmqi1syWEEDHklKNkG0dFZVMrRHI6yoE/cIgkO9a8C4agv3kcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32264-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.baluta@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: B5C501B4EEE
X-Rspamd-Action: no action

On 2/26/26 01:55, Frank Li wrote:
> diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinctrl-generic-mux.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..978cbc4f82a0b3e56dd83ce24426d4e764262a6e
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-generic-mux.c
> @@ -0,0 +1,241 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generic Pin Control Driver for Board-Level Mux Chips
> + * Copyright (C) 2026 NXP
> + */

Nit: NXP legal asked us to drop (C) so this should be Copyright 2026 NXP!



