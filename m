Return-Path: <linux-gpio+bounces-27571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFD1C04951
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 08:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 879E63528CA
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 06:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2782E2798E5;
	Fri, 24 Oct 2025 06:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="NGwOKhwY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020113.outbound.protection.outlook.com [52.101.84.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E0D261574;
	Fri, 24 Oct 2025 06:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761288860; cv=fail; b=oDxlQswwkr39/N/FEnG/ZPlsvslDD0WN6c1tZ1JnsRM6o4J/19xscfiMxghwcaqWz/uD66jZBwwjxBLGnqto3xvKAoVEwiraw44OQpvvZ2zLF3GRrHQLMlgiShlBs7oIy1xAcxyEnvUThza3SAzb7ng0Bglu4G1BFbzQ6L0E0iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761288860; c=relaxed/simple;
	bh=e1XXQuh+xATbVTOi74O1qwipby8ri+aO7JXRYXSZwYM=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L/7mglExk9EHcYDAWG7OMlcfS5HdtoMgkJOlB6y0n42hUurVP2zcKmtAzqGvcDG9yuZmu3dIWUN5m5t1ZFOD2o6vCE5kGBLBB5E4Bc6Z6vQi9KbAjtD4xMMUFMoy2Gqg0LQwGaaOZdmxAAXajrqE93S8j1tecyO7eWIQGoD6trc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=NGwOKhwY; arc=fail smtp.client-ip=52.101.84.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOHAYN2Ezdowfd5k6KRgLw+L1aovjRtZy00cUSI1UCvidTH/V5LQPxU9UZifRV/pjdVi+EdpCYgG/+SvpIo7lkB/R8gRWsv5OOr5kh0pLBrIwZR6gIDTZuVkdsi1URkS1OVRyE5b5FTWzjKN/SM7MjPIqcceSwiJFUPlzvvfzH1u3L5zqFJvwzhwFCE96ET0EbQviarx2A3RCN0R3pgppOrd4Ea7++l+YGq/3UWJ5h83C0KtTGcSljVWCCNlLxpGV6pUOFZLmSP0t2csdu+zgohVWM8OOjU+WFB6o1vmJbw2f/L4aIPoYvmgo0aFDVHJNdoAm05IwMFczchwbZyHpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbfsAuEPs7MgTOSXeolP3pH/i9PB6a7jtgLBXRnme08=;
 b=dMlB6s6evaKn/fr4zf7r/pGizGIV4zidNl4cBZXZEvlDeak8L6QKPMZ8XGFXWbL+qLxkjxKuq0bAeyQpwtb+Y4N9YRGxrGB9OQeiGBJZ6fzkBdyv7BIfZR0VK9qY/PlBTKCa5s3CSiiv68qH1N/d4KOI8kDVFIFAaGUOtvW/RM98KLNpoUDl9TmwOQdF44b8Ux2yF8+kWYMI6xVc2yiSIn/XoMVr/IBS/D+am/2d0j/V7eaelXH4oT6K/ibToR8TOsc1ZlH2hB+wfPxdSRE1OHhpzwHfVqWhKhzKfiegv2LvBaCAB8D1owiiixglHhRFDJsvy1FOjoN/SAmn+wLVug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=gmail.com smtp.mailfrom=topic.nl; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbfsAuEPs7MgTOSXeolP3pH/i9PB6a7jtgLBXRnme08=;
 b=NGwOKhwYqLRqdMliCj0cn+5qnyabY85iqMGI9MR4EXyeXGLLaKpDjQVxB0gxwrLPdlDu7oRKymh+pGRDxjjE4wmEXHzfBsP98L//mGsYOb6qCKkP4RilnoCLmWH/Nd5wKWT2oWOhUczuJ6an6Wz/ImYmNCaGpn71WzyaPgzt6UBGcZ03Z+a++s5dfKPYss9IMTo8AtI+EM9ZDDW7EZ4Rs67jN+lH3kzCbOWecusUvn/1LCYCQrZl3TXZ6mG96HW2RoiWr0OmEP0K2KEEzNaaT2wgUUYp5ML09Uwi6ZsRb++WZ1GCLppp8bp+vB7tOIq3zIs8NJxBI9kzj81zeVBYtw==
Received: from CWXP123CA0002.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:73::14)
 by GV2PR04MB11836.eurprd04.prod.outlook.com (2603:10a6:150:2fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 06:54:09 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:401:73:cafe::fa) by CWXP123CA0002.outlook.office365.com
 (2603:10a6:401:73::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 06:54:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 06:54:09 +0000
Received: from GV1PR07CU001.outbound.protection.outlook.com (40.93.214.103) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 24 Oct 2025 06:54:08 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by GVXPR04MB11629.eurprd04.prod.outlook.com (2603:10a6:150:2c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 06:54:04 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93%5]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 06:54:04 +0000
Message-ID: <aaa1208a-f11a-4537-94a8-afed77c7fe84@topic.nl>
Date: Fri, 24 Oct 2025 08:54:02 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH v2] pinctrl: mcp23s08: delete regmap reg_defaults to avoid
 cache sync issues
To: bigunclemax@gmail.com
CC: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251009132651.649099-2-bigunclemax@gmail.com>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20251009132651.649099-2-bigunclemax@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM9P250CA0006.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::11) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM8PR04MB7779:EE_|GVXPR04MB11629:EE_|AMS0EPF000001AF:EE_|GV2PR04MB11836:EE_
X-MS-Office365-Filtering-Correlation-Id: 17bbe9ad-380e-4002-e6cb-08de12ca21ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RzJIb2FwY2lxcnVXK1lxeTRHamhVQWRwYWdiRUU1YW5ORjJLaTdLRVFUcjl2?=
 =?utf-8?B?Nk9QcmxSTGpHSGV5bVU2YXFKbDV1eWJ4VG5RQkRqR3E0R3g3bjUyei9zQ1I3?=
 =?utf-8?B?VkdtLzdnUXQyZVBZUkFRMmNTWnN2bm55K0MvTHpVQUFiOXNXRytibVJKMWJ6?=
 =?utf-8?B?eFhnakdaUDVhaHBQZ0RNNE5sSU1HdUtGaEZZbjl1SkJlanhhNVJVeW5ta0cw?=
 =?utf-8?B?bTJTdmFHSE5YUWkzQk5JbXFFcUIwR3VJeldYcG9VY1dobGljUnk3bit0Ti9t?=
 =?utf-8?B?czNuNGNuTTcwRDJRdkVrb0NIVDNOd0dwR24rSDA5bVZ0b2thZTV5d3BOSmRs?=
 =?utf-8?B?MkV4cHYyZ2VRUnZqOUYzZ3lEZ3o1akZ4ZncwelFUT2g4L3FqMzVlR29mSk16?=
 =?utf-8?B?R3lYSFJ4QzY3bHBQNExQRXMwaXJGckx0SkROclFpT0VOZ3dObFVvbzE4MnZn?=
 =?utf-8?B?dEdFZFNKaUgvWVZIWFBHM0wzdVorbmsydmVianpEVkxEajZlS05IcHZNM0hV?=
 =?utf-8?B?eTE0dEFQOG1hdFI4UXlhOGIvMnRRSjRxTHVuKzJMTUNiRXczVGdLNm9JZWtn?=
 =?utf-8?B?MVNkN0VORjRMUFBaUUZTRmZYcXFhVytlMkc5YkcrVkxMNU9wb0JVTExOWktj?=
 =?utf-8?B?cGJnTnZzUGxjd3RPbUhLdm0yWjltN1B6TW5KelMxRmpSM2lWcEZHbmVub3F4?=
 =?utf-8?B?ZUN3eWZOWDltd1NlVlhpM3JPeDNacGpzcys4UTc3Tnc0SE55bXlJcGJrZlZp?=
 =?utf-8?B?cW5lTmxhQ0NhTURnOUpsWG9qZXdrNktBRjBhalJ5RTZpeDBFK2Y5ZXpBUHVR?=
 =?utf-8?B?aVpWUTFzSWc5aHFkaGhmdmdLUm1jMCtWcEJldWFkOVprd0xFRFlrc3djQWVF?=
 =?utf-8?B?dmVzLzliR001NFloOHhMT09YZTBORW5nT002amZWRUtacW9TcVM3N1pHMnVH?=
 =?utf-8?B?dFZhVTl4L0F6RTVnNVhGQmxlckVHVGd5NzQwTXBwcjFwNFQ5ZEJXeDVCa1Ji?=
 =?utf-8?B?UHh3Sm5iajB3ZWs0bmpZS0FlUmxRWGM4L3FPUjBnUi9GcVVzNjFqTUVUNEhK?=
 =?utf-8?B?dFU5WlhoZmJxWlRteXFpdWdzRHFDWno5RW1lUzlZL0tqRmNwcFZieFRkMEdr?=
 =?utf-8?B?c2JscVBtQ1dHU2dQT3E0K1l0RmxaSXBkOGo1VDZsMllDMWZNNFVvSHN6WkFz?=
 =?utf-8?B?U1ljSjlXNlZwSGprK0RHajZnVmJsYUpkM3ZHTTRLUjBzYTF1YWxxNzVFZGVE?=
 =?utf-8?B?RmFkbTNKQk5kTWNRQmVTczZlVkxiYmZCVUxpM1VxeFJZa3NUZUc4dW1UVkhX?=
 =?utf-8?B?NncwbWFYazVxdzdhZm1XRHoxcnp6K0ZsQTgzdWJnajlOckthU1cyN3NvUHgw?=
 =?utf-8?B?WlB1ZXRJbWE4MEtLNm9vd1licFNiZ2svUDFxS28vRVZ4Sll2Um9BM0hkWEc0?=
 =?utf-8?B?OW9RNmMrNkE5L3AyRVZ5eldrNG5mNHdJamNJdmtXV0lNbDM2SERxeWlVUXl0?=
 =?utf-8?B?Z2tRVGo4ZkcyakdxcTlGWEVkU0RYdnVINWdsY25sbjlOM2Y5cVRDWXllSVNt?=
 =?utf-8?B?U0JWVDhlNWx3cWpCYzR6cTJOdWszTjVZSUswcmZpekplZjVPOXVnRkZmdkJr?=
 =?utf-8?B?SzBkV1FuM3M2b1hocUFWKzRzQmM3S0JZU2pHRGZzUzRWSmdYd2JkekJvKzF3?=
 =?utf-8?B?Y24wcFZxMEpsY3oyRGUreDB6NGRIeUN4OTNEYVpkSEdkS0I2RUQxeWlHd1pX?=
 =?utf-8?B?Z2UyYVNJcktZcjQwa0JaWXFlaFF2VHRCYis4RUFXd3MvWWVSTUpjcE1CQkNt?=
 =?utf-8?B?UmQ4NWpiS0E1b3ZoY3YyVGdqaFg1bGtJSXZiMEpFTkt1TWR1NEx4RGNKaDFQ?=
 =?utf-8?B?cTRGRjFYZ1FDdDBUd2RPaWo5QURwcEZpYlBsSENEcjRJSVpQVzdZU01IZXBJ?=
 =?utf-8?B?eGdPZnJibGNtK1I3L0F2cHJKc2FXNlRDUmRJUHpna1h6TlhVN2wzL2tQWVFG?=
 =?utf-8?B?K2FCTmN0dXFRPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11629
X-CodeTwo-MessageID: 31e491dd-b156-4748-9268-0df2552aa8f1.20251024065408@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b9475ce7-6714-4309-9662-08de12ca1ea4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|14060799003|35042699022|376014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3ExUTdjdEIycXAyRHY5b3hUSllHYlhGdDkrUWtXaVYrTmJ6K3VKODR4Z1hr?=
 =?utf-8?B?c1ZEcVd0YXM5QmlIUnNEejd6QjQ5RU1uZGhkaHVjWHlsNDhZM21GVkVKaUl6?=
 =?utf-8?B?cUxmZkJETzYydENxRnVvcGVxSVZiaXh6bFVSV2k2ckwveDdtNDMwQ09tdDFL?=
 =?utf-8?B?USt0YWpjREVXak5uRG1tVXpZcDRhNmFPd3JYbFd0cFJHUkNjN2xidy9oRHVa?=
 =?utf-8?B?SXlLaW9wMWQ1Qk5oTEVQeEF2c0t2WGN2bUwvVTkwcVEzcHJyckxmSzdYUU1O?=
 =?utf-8?B?dWYvS2paeE1ld0JBQW1kUWUwSG1TUThQcnMrbGg0bWVTOEFVRXpZSGk2dlZr?=
 =?utf-8?B?OVBhdVdpWXMrWTVndFQxeGZmZGlQQzdtOUV5bG9iWjFFUWRGYktmVWFjM25K?=
 =?utf-8?B?cjMxVnE4dXdES2lncEVTS3dNZzkyWjZSMFhzcXJWRVgycXB5QTRFMWFhNnZI?=
 =?utf-8?B?bTBieTZUTm0wNldLOUhDeDdKbWJ6bVFGYm5XSGRjUGg2ai9PRytEd1pmNkJB?=
 =?utf-8?B?bEFlWGtEOGo4ek11bUppY0ZpdVMrMFRlQ2pqbi81V3EvTDEwL2hXS2o1ajd1?=
 =?utf-8?B?a0RvbkFma0tVZkErNHBRL2VicFZTdE5vOVo3c2xGMG0yc3BXTE5FNC9KN3Mr?=
 =?utf-8?B?c0VabU1VdkpTcWNiOStiZ0hiTWpwL29aMWtWc2NrZG9wL3ZJbWJuenAvbDJ5?=
 =?utf-8?B?TkhiTFpjaS9ZcGRlclZxRnZFR0NENXRkMUlFVGtjWUZTc1FvU3FvTFhFNXBN?=
 =?utf-8?B?TFhMTzg2YVVSZ2ZJTFNtaTNsM09QRFJ3VG9Kck9YcndKY2dmb21sdGRVWVhx?=
 =?utf-8?B?Ymtoc3gySFJLMnJXeFljTHczSlFSQmtIVDBGSXR1Nk1VYTFrRko2a2Vmd3Y4?=
 =?utf-8?B?amlmVXpXeWRDbG9NdDBKNGhDaVQ1SGJ3TUhKV21PdnFiN29hZDNobUNiVHBI?=
 =?utf-8?B?SUlLbVFDTmk2VkJ3VTBPb1MvTW44dlMvdzhPZ0IwQ0ZtMXd0aFNNY1J2d2pv?=
 =?utf-8?B?OGpFeEs3dzlFUURrc051TitKVGFLY3F3d2srcTI1em5BTHc2S0w1dTVFbnha?=
 =?utf-8?B?dmllaFloK295a25aL2hqdWtDYkl2aXN3NU9IMGZ4V2E4V1BUaklNcHdhL3dG?=
 =?utf-8?B?NnRXdVNPWlNmNlN6VmJjRG0wUHpTZHgxVUczUGxKc1J6OGlhT20zaGpyRi9h?=
 =?utf-8?B?NDVJR20xcVYrekdGeFlqak9kWjhVVFBab29pVGFIRzFSTys4V0NZVzRlSnFN?=
 =?utf-8?B?LzhVeElKaUlSNUVDTkt0b1d6cHhUTWtNMDF1UFVPWEZRb3VXNWJpWXhZWmtj?=
 =?utf-8?B?RE1LeFJNUDFJY1RlY0psRmhWNHJjU0t0enlvMmdjT2x6VExUY3kxaHowamVJ?=
 =?utf-8?B?bzNkMWlxOTJMZFZjR2JtZTdXeHRwdThreTd3Q3lqV0FQdk9VQy9FNTBhQjgr?=
 =?utf-8?B?dERsaGJYeVRLNWgyR01PY0w0TlJNQVNWV2lTcHVLNGVOQXQwM0hsb1NrTkJQ?=
 =?utf-8?B?ZmRMcW1kTmtka1MxWkdGSXVrMGQ2R2RiYm9SU3dCOUQyeUVaTk1ydFFPUENi?=
 =?utf-8?B?V1owZmF2Zkpxa2FWY1IxTWxTWEN1Z1B1K3BWNWFNcXBXSzZ6dzAySElpM0Ry?=
 =?utf-8?B?Y3VBVDFYUDcrbGs2RUl0Ym0xblFxeDBzTDFzN1NTQVFnWWxvOGp4VS9tTlJs?=
 =?utf-8?B?NEd1M2xuVFJhSEVzdnRJRFZzWlQwaGVmTXM2S0pkbmJYRXlMbDZxYUZyYXZQ?=
 =?utf-8?B?UWRWM3VqcGo0bFdyc3V1bmZBT3FmNGV6QXdvb1VnN1NqUzB0aE1kWTJ6RXZC?=
 =?utf-8?B?T2NVQWd3VHJqeTZRNGhUYVI4cmRHN29tc1JCWXZjeHQvTGM4V3dtQVJBZExE?=
 =?utf-8?B?V0FYNnNhU2l2dmhYc3orV2VhZWlqcWsyaWFCY3dzalAyYUZLRTdMcFEwRHRG?=
 =?utf-8?B?ZVlFZDlHckVVM0ZiT2p5MXZ2Ris4L1NiVTVLSVQvOEI0bTRHVGlZZ0NtZWE5?=
 =?utf-8?Q?02BwVtxfGJQzg8NjJIs6XoldbLPaQY=3D?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(14060799003)(35042699022)(376014)(7053199007)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 06:54:09.0714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bbe9ad-380e-4002-e6cb-08de12ca21ac
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11836

On 10/9/25 15:26, bigunclemax@gmail.com wrote:
> From: Maksim Kiselev <bigunclemax@gmail.com>
>
> The probe function does not guarantee that chip registers are in their
> default state. Thus using reg_defaults for regmap is incorrect.

Did some testing on actual hardware with this patch "as is". As Sander=20
mentioned, the REGCACHE_FLAT caching mode assumes all registers are "0"=20
initially, which causes similar issues as what we're trying to solve.

I've verified that by setting a bit to "1" in the OLAT register (using=20
i2cset) for an unused GPIO line. After a reboot, the kernel resets it to=20
"0" because of the caching issue.

I then changed the cache_type to=C2=A0REGCACHE_MAPLE as indicated below, an=
d=20
then the kernel doesn't touch that bit any longer (as it should).

So once you've amended the patch with=C2=A0REGCACHE_MAPLE, you have my:

Tested-by: Mike Looijmans <mike.looijmans@topic.nl>



> ...
>   static const struct regmap_range mcp23x08_volatile_range =3D {
>   	.range_min =3D MCP_INTF,
>   	.range_max =3D MCP_GPIO,
> @@ -82,25 +71,12 @@ const struct regmap_config mcp23x08_regmap =3D {
>   	.reg_stride =3D 1,
>   	.volatile_table =3D &mcp23x08_volatile_table,
>   	.precious_table =3D &mcp23x08_precious_table,
> -	.reg_defaults =3D mcp23x08_defaults,
> -	.num_reg_defaults =3D ARRAY_SIZE(mcp23x08_defaults),
>   	.cache_type =3D REGCACHE_FLAT,

Must be REGCACHE_MAPLE


>   	.max_register =3D MCP_OLAT,
>   	.disable_locking =3D true, /* mcp->lock protects the regmap */
>   };
>   EXPORT_SYMBOL_GPL(mcp23x08_regmap);
>  =20
> -static const struct reg_default mcp23x17_defaults[] =3D {
> -	{.reg =3D MCP_IODIR << 1,		.def =3D 0xffff},
> -	{.reg =3D MCP_IPOL << 1,		.def =3D 0x0000},
> -	{.reg =3D MCP_GPINTEN << 1,	.def =3D 0x0000},
> -	{.reg =3D MCP_DEFVAL << 1,	.def =3D 0x0000},
> -	{.reg =3D MCP_INTCON << 1,	.def =3D 0x0000},
> -	{.reg =3D MCP_IOCON << 1,		.def =3D 0x0000},
> -	{.reg =3D MCP_GPPU << 1,		.def =3D 0x0000},
> -	{.reg =3D MCP_OLAT << 1,		.def =3D 0x0000},
> -};
> -
>   static const struct regmap_range mcp23x17_volatile_range =3D {
>   	.range_min =3D MCP_INTF << 1,
>   	.range_max =3D MCP_GPIO << 1,
> @@ -129,8 +105,6 @@ const struct regmap_config mcp23x17_regmap =3D {
>   	.max_register =3D MCP_OLAT << 1,
>   	.volatile_table =3D &mcp23x17_volatile_table,
>   	.precious_table =3D &mcp23x17_precious_table,
> -	.reg_defaults =3D mcp23x17_defaults,
> -	.num_reg_defaults =3D ARRAY_SIZE(mcp23x17_defaults),
>   	.cache_type =3D REGCACHE_FLAT,

Must be REGCACHE_MAPLE


>   	.val_format_endian =3D REGMAP_ENDIAN_LITTLE,
>   	.disable_locking =3D true, /* mcp->lock protects the regmap */
> @@ -614,14 +588,6 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct =
device *dev,
>   ...


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




