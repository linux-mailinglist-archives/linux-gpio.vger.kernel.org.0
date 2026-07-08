Return-Path: <linux-gpio+bounces-39679-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8WsQCy93Tmo4NQIAu9opvQ
	(envelope-from <linux-gpio+bounces-39679-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 18:13:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7412D72885A
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 18:13:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=lo+1d8FK;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39679-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39679-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47BB532231BB
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 15:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0777D41CB3D;
	Wed,  8 Jul 2026 15:46:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010050.outbound.protection.outlook.com [52.101.84.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F8436F903;
	Wed,  8 Jul 2026 15:46:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525570; cv=fail; b=cL5sQoEUT6DMXGYkxUGEwaNCyEYqvoFvGRLSkRs3Qv5m9k9KWpmrvWDmMkVD0TTzQdMPhfD2Srj/Cq2nRIBt9PBVI1HtcyNVt5y9z1iGMAIaFkubpv3dm7h+6IhBuSyQqc9F2T0srjFC9zpZlZTtdn8RfHXoprTXvJHIRbx6M0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525570; c=relaxed/simple;
	bh=J2MKxzzf9Y1kZQGLl8WEPtYlIOn5p3D5Msjj3oG39DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HaC+TVaG1VnMlsaBSDG4F1KcWVw4poyPBvUsM65R4UuK33bUxcyCQD0p7nI9QQd8OJQXsG3S+JabkFp1qqtNLeW6n1Gg+xR/yosdz+V9jQtwqo425TYjCAkZV3TK4OeJf3tCrdv2L/+MQYnQuS8YaQG0h4MV4LoftZncPPUhLc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lo+1d8FK; arc=fail smtp.client-ip=52.101.84.50
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khRoIUe79kDbIRe8estd/AIqR2iN6ByismAaDBvAtRkG68Gt6gwMeU7qh2IbZhxve0lfM8dYMw9FMtXShgoKMtfPPOI+/fYdkcJTwPbSD6ICd+Nj4int9IM/7x0YTRI3kqAolaSm5GmCH/QtqAZ5GSl3wdJ5ySyNdrzZ3MRLkRLaCKUG7kylyZ+Kr+zJsHPPFUIAqJzPVoFdaFE0GAxLLA+k9N1jSGM0Ai7Uf4v/G2I/jKXsurCba/A/w/dCibbNHSsk1YvVKBjMkA4F+yWchW04qP3n8MeUOVG4k1NG4uicW2qxd4LsyMOfk6OOvVdh4CvEk/nMM8Z7svqihT5lZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c800sQR4wMTgnSajSO8IcfOrG0O91BjeHezoA+CitR0=;
 b=hzKEVEOHle0wZF7GG6allbZjUnLJ6JocDju/AJfh1fk0WoRl2ALbUELuZex7nAlTVwYAH2uVzbE7+S1eg8LwPdG231DbNwRWAqydBEWYfXVPGId1e1YNpTzrtwcxuHrRslM4t/8kHLRVZrtoi6ZD1oaWyop8Tu5n2Pu/IJFiku8uuNqPnx+YVhkAH/DqdWjOzfBayJq9jesUYWh0Gs9tHUqFEO/AbkoXfHVf6gdWKkOVFFkAyhpbbxGgp0bRbyqeTditobv8pohQh6f3wcJRgE/R8k9Ozu8h3wIw+d6OTM7h83CgWwgDJqkNWCtcP6fre8O2nslLDQB+dQ1gGU4R/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c800sQR4wMTgnSajSO8IcfOrG0O91BjeHezoA+CitR0=;
 b=lo+1d8FKRutQsJjevtNneC15UNoBNZX+cOb78QAY3S9FHlXJvbToMUyHdd9IItWyRGDlE3XbBFMjfKKkki61/F7pqmLpmKJkMbVStGA0mgpoESy6He5nfDF8P85Ylnm0kepsiiaP1Ty6UFc6r26cJ0HWGiss9FoWJ2EuI2B3iCKR7IK91hyWcXNRLEJYNhmsEpD9aZbzA9wDdyrXLAELZVZaKu26qvqIQVwedOpwVm+k0DHY50NCfquvRqxYxMorQghatYPlSzhVIEniUQCfxO0S0hRvNdnUeUvVdd92A1BnL+FZQGMuHKb8uPiu4KjkX1ez8bj5eNU0UdcOebPxsg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB11001.eurprd04.prod.outlook.com (2603:10a6:800:27d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 15:46:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 15:46:01 +0000
Date: Wed, 8 Jul 2026 11:45:51 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: =?utf-8?B?5ZGo5a+F?= <zain_zhou@realsil.com.cn>
Cc: Frank Li <Frank.li@nxp.com>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linusw@kernel.org" <linusw@kernel.org>,
	"brgl@kernel.org" <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?546L54Kc?= <wei_wang@realsil.com.cn>
Subject: Re: [PATCH 1/2] dt-bindings: i3c: add binding for Realtek RTS490x
 I3C HUB
Message-ID: <ak5wr3UopGMyNC0c@lizhi-Precision-Tower-5810>
References: <57df140e88484ce6acb1c5c2360ebe40@realsil.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57df140e88484ce6acb1c5c2360ebe40@realsil.com.cn>
X-ClientProxiedBy: PH0P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB11001:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a9c721-e7db-4cb8-ea26-08dedd080299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|19092799006|1800799024|366016|13003099007|18002099003|22082099003|3023799007|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	jEp0uH1faykghosd1rA6Et8W02IFshxMpnbkJnQXU7c6/o+iADbOMLiiPEaducU6ACfDmNs7uSrBJ998qLNhD1fHbPYXFL/eJgphdyOm87DluTnQZNqlqtQp3of4i3wNzGMJkA860VTzxkHf2q4q9DipBCtPxjwu4YUVbed/KCNIKM4mjxa0XUUgkqkWexSlG2cSyEOk07XbjqHduOxZDrmv2Hs7NnF77ObQLmt4g25PbXYX0A0PJRnC5f39gnc7tmUBMrQaxe4mln2onueA8/omWcY0DGDhKTmvpHmdzbuc/0M+k0EM6VMue0/TrIuSmSLONLb4Jw+tsJqMe7WyzvtZNhwhPmWFn3YdZ2/0xfabJ8XIQplJDzm8Rnyp76X8fQu+tpE+/2NpshBM5kbm3EUsNw6FEd5JGkbzNcmqMKx2XO7BYdMH8/n1Y1+2orzgODpM61AiAIBlI4gkG8T/Gs6jflhUY9+RU+QKrUPx8tWXx+1sTpK4OsE/dgoolYrFh0X6h8Ur6CpAocO06Wd8rOpqVOwm3m8A8ceXpLMJtbYoAvLZf96oDyqilDd7BPKOrQsNGYT1V6MAxEhf0fXW7SeqPXTsge5bkLosOXiMgDuiNuojVuREPiOwf84nyCla
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(19092799006)(1800799024)(366016)(13003099007)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ymh4N2NYMHI0VnM1YVRjTU8rNS96NVdlYk9mOVorODJtazFhay9IOFg0V25i?=
 =?utf-8?B?eXd1dDhMeTlTejBTNmgrOTJkRzR1cGdxRVpMMmtSK3ZNM3NYV3NBeGlISnZJ?=
 =?utf-8?B?b1ovclBmZS9SamNFd0dCKzhFKzh2a1VuWFdQdGFGbWpkVExoR1p1OE1GN281?=
 =?utf-8?B?cVlORHZzdkFGUkNLYnBXdUpyemp2MnpxOFE1My9sOVpEelJiOHl6U1o5QnpM?=
 =?utf-8?B?VytZVlVNYUFkSU1wYUwrN1hTOEpEdlRQZ0dKcTBPYnM4QlZabkhIWnd5dTl6?=
 =?utf-8?B?QnVuZXRyaEF6cWJXd0xLSzEzSVUzMWV3WW96ZkZ4eGpZMzUrZ3hXeEtsMkEx?=
 =?utf-8?B?MmtRdnhBU0d3MENTSWpkaDBMdWlkMFgxZ1UwUTdVSktBcXpmdGRyaWNlMS8z?=
 =?utf-8?B?WWIxNk5KdGhPdThIZStyWGpxdUZjbXNYUGNnMEVxdGdYamUzNzFURHpsZTA0?=
 =?utf-8?B?ZVBPSTJadGNqMWxmV3NydFlTWEFQRWc1WitEMkFoMnNDYTlwUlpSdUpMNDh2?=
 =?utf-8?B?OHNvY3dQazVYckJRdzZFNzRNTDNEam5nUUd5bmtZMk05UEdGYUpIR1RLY0RV?=
 =?utf-8?B?KzVjSW5ETGJ1aUI3dVNJTXBXN2dVakNaVGVQeGovUndOZ1ZzT2NQZWVTNlM2?=
 =?utf-8?B?RFh1M1Flc0pDNWg4OGdiYmF1cnhCTzduMVlpK3Y1RjNLZEJjbGx6MWtvRzd6?=
 =?utf-8?B?ZDVFVWFHU2tseFJWNHFLaHJ5UVBEcWtBS0hGa2hwZ3BoaEpqcXFKR3BDZHk5?=
 =?utf-8?B?aVJEWSt1YjdHM1pHODNOc2lQc3c2d3NPVkRlNjdnSE0rWUNIVXF0UEtqSWhO?=
 =?utf-8?B?ZStaTjlQeVlsTVJwdThScG8rQ1pVMHRCT2xxcms3am8yZW9vN3pJYUhxUDhu?=
 =?utf-8?B?eE43L1duY3NoWTlNamVnekdLYXdIYWI1STRSUlViSUgyNXlpbFhYSlZHSGZl?=
 =?utf-8?B?NEpGQ0hTTm4xMzljMGl0b2JPZ1N2UWxjbU50SFp4YmtEZ0NUZzFKSExZS05U?=
 =?utf-8?B?MndreGZ2VUpPaFptdFNNRDU0dDY1a2VSV2lCQnN2dGhjSk5JdjhEL0w3aENu?=
 =?utf-8?B?elRleUpaME9sUVJaWXJqak8xNFZDMVNJRU9nYlZlN0h1QWJnbG5Wak9Rdm4y?=
 =?utf-8?B?RldHWVhpdDRiRzdyMXJ1bXBVNjBzNlBqNDVsU09mSzJkamptZWp2R0Vzdjlh?=
 =?utf-8?B?bDVicWVCWWErMkxHQWkxMFdMYVNCVWpURWtnNklncnNTclRiZ0xRcVhPWWd6?=
 =?utf-8?B?VGtGZ0ZGQUROWHhMckhhME5LOC9iQWgzU3dQNHpDT0lRU0xRSTVNck15Vlp1?=
 =?utf-8?B?UGQxUnhFb3V4MzFMdGFWc1dBbENvaWVLRlVrcTdVakprZWJaNmdZbWMxa0gy?=
 =?utf-8?B?QVlabDFIb08yN0pvQUwxRDBwUHhSRFpqUnpaZkd4cDBqWi93NlJYRnA2OTFV?=
 =?utf-8?B?anl2KzQyVUpIUTZPTnNPYzN0ODdkdzlXT1pnbXFIUHVGZjZpVG1tK3g0d3lF?=
 =?utf-8?B?YVY5SmIwYzNucG4rbTh1cFFkalRaOFNvd0djZkZJVlFaY3lPQU55bEJLcDZn?=
 =?utf-8?B?TEdJNEUvZVdiV2dlS1d2NGZUMCt5M3UvQzZ6c29EeXQxb2RVRGNTdk5yNldM?=
 =?utf-8?B?R0djdnR4Q0c0Q0s1eGxqeXovdVYzWnlNSWt2cm5jSXRSTEY2M0JucythQlRz?=
 =?utf-8?B?dHdqV2NIYXJiVzMvZEdYVDM3eUdhMGJJc2lYa3loSnBTbjgwcm5MMGhkczQ5?=
 =?utf-8?B?NzF0MTdXb3RlSzk4ZC9SREI2Ym9HcmxrV1h5WDc2RThWeVV5NnR6OTJsWXV4?=
 =?utf-8?B?eXBEdUFLQXdFQU9PWjY3SmoxSnVLK2pZUE83SmJRSjNLOXpyNmpVSElYNWZN?=
 =?utf-8?B?UnVqUFNBb3RqbEU2SEREQVNhQWhHVGxtdi8xaklnOGYrU21hS1BId2lGRnFD?=
 =?utf-8?B?akNlaEFBMjRENjlCbmdWTEE3ZnF0a0t2RnN5R1NQbFNwaU5ER3JxWnM0Q2NV?=
 =?utf-8?B?Mk1XYW5YNWt2U3I1dXdMbVJBdmJYR25EbmJ3U3RsalZlcmU0dW0zLzlnL1dE?=
 =?utf-8?B?Vm1oMWxTY01KYXlSQW9mV0hXY1dQN1ZsUGkwRTQyYzR4YjREUUtqdzlkK2Zm?=
 =?utf-8?B?M1RUUTBnaEtXbjVac1VISC9RY2RWUmpEYmxTY0hDVDVyeVdiQ0piU2c4NTU3?=
 =?utf-8?B?QUNkY01xSjJmZjdySTd0d1JvcDVZSmJnQU5RZ2ZETnlqUFZlMDZEYnJTc1dJ?=
 =?utf-8?B?MkJCRmhYc3BTWmQ3WG5FZDNKQjFqTWhaeEdiV2xpWk91emVDSFNiU284d0hK?=
 =?utf-8?B?U3hXV2RpVDFKOXZlTkllaHFOemY4cWJhVmxiTmREUHhabWcxOW1LZ2hsYUJD?=
 =?utf-8?Q?TupNRH5N3CANIxvo9vfxvWk5eyhF8tQY2USs0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a9c721-e7db-4cb8-ea26-08dedd080299
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 15:46:00.9793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WO7xOI/dPqepiN78zdknfWVSjJ8LWwCKt4fSoXtt4GtgTBnYUtoiQyWqiq/fU1Jx7DY/wTQQNL7TPsKzOfxbJBJZGQVKxRS4gcqyC9n/dfl/23cbRhma3azGWAGY0Wlj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11001
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39679-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:zain_zhou@realsil.com.cn,m:Frank.li@nxp.com,m:linux-staging@lists.linux.dev,m:linux-i3c@lists.infradead.org,m:devicetree@vger.kernel.org,m:gregkh@linuxfoundation.org,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wei_wang@realsil.com.cn,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7412D72885A

On Tue, Jul 07, 2026 at 07:28:28AM +0000, 周寅 wrote:
> Hi Frank,
>
> You previously suggested that the Realtek I3C hub driver should be based on
> the common framework introduced by the NXP P3H2x4x hub series. We have been
> tracking that series, and it has now reached v13:
>
>   https://lore.kernel.org/linux-i3c/20260701065755.2067793-1-lakshay.piplani@nxp.com/T/#t
>
> From the current version, [PATCH v13 5/7] appears to contain the generic I3C
> hub framework. It adds the common virtual I3C bus support for hub downstream
> ports, mainly through drivers/i3c/hub.c and include/linux/i3c/hub.h, and does
> not appear to depend on the NXP-specific P3H2x4x hardware implementation.
>
> Would it make sense to split out this generic framework, together with the
> required I3C core helper changes, so that it can be reviewed and stabilized
> independently from the P3H2x4x hardware driver?

So far, I3C hub interface register defination is standard, I suppose P3H2x4x
driver can work on RTS490x with little bit modify.

>
> This would allow the Realtek driver, and potentially other I3C hub drivers,
> to move earlier to the common upstream framework.
>
> If this direction sounds reasonable, we can rebase the Realtek driver on top
> of the generic framework and help test the common hub code as well.

Please base on v13 to continue your work. Some sashiko feedback need be
addressed, it is quite close to land. If you can help test, it will help
much.

Frank

>
> Best Regards，
> Zain Zhou 周寅
> Realsil Microelectronics CO. LTD.
> E-mail✉ : zain_zhou@realsil.com.cn
>
>
> -----邮件原件-----
> 发件人: Frank Li <Frank.li@nxp.com>
> 发送时间: 2026年5月5日 4:34
> 收件人: 周寅 <zain_zhou@realsil.com.cn>
> 抄送: linux-staging@lists.linux.dev; linux-i3c@lists.infradead.org; devicetree@vger.kernel.org; gregkh@linuxfoundation.org; alexandre.belloni@bootlin.com; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; linusw@kernel.org; brgl@kernel.org; linux-gpio@vger.kernel.org; linux-kernel@vger.kernel.org
> 主题: Re: [PATCH 1/2] dt-bindings: i3c: add binding for Realtek RTS490x I3C HUB
>
>
> External mail : This email originated from outside the organization. Do not reply, click links, or open attachments unless you recognize the sender and know the content is safe.
>
>
>
> On Thu, Apr 30, 2026 at 08:13:53PM +0800, zain_zhou@realsil.com.cn wrote:
> > From: zain_zhou <zain_zhou@realsil.com.cn>
> >
> > Add DT binding schema for Realtek RTS490x series I3C HUB devices.
> >
> > The binding describes configuration properties for:
> >   - LDO enable/disable and voltage level per port group
> >   - Pull-up resistance per port group
> >   - IO driver strength per port
> >   - Per target-port mode (I3C/SMBus/GPIO/disabled), pull-up,
> >     IO mode, SMBus clock frequency and polling interval
> >   - Hub network always-I3C mode
> >   - Hardware identification via CSEL pin (id) and CP1 pins (id-cp1)
>
> Please base on
> https://lore.kernel.org/linux-i3c/20260420105222.1562243-1-lakshay.piplani@nxp.com/T/#t
>
> which almost done!
>
> Frank
>
> >
> > Signed-off-by: zain_zhou <zain_zhou@realsil.com.cn>
> > ---
> >  .../bindings/i3c/realtek,rts490x-i3c-hub.yaml | 410 ++++++++++++++++++
> >  MAINTAINERS                                   |   6 +
> >  2 files changed, 416 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> > b/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> > new file mode 100644
> > index 000000000000..30295eefee89
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.ya
> > +++ ml
> > @@ -0,0 +1,410 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i3c/realtek,rts490x-i3c-hub.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: I3C HUB
> > +
> > +maintainers:
> > +  - zain_zhou <zain_zhou@realsil.com.cn>
> > +
> > +description: |
> > +  I3C HUB is smart device which provides multiple functionality:
> > +  * enabling voltage compatibility across I3C Controller and Target
> > +devices,
> > +  * bus capacitance isolation
> > +  * address conflict isolation
> > +  * I3C port expansion
> > +  * two controllers in a single I3C bus
> > +  * I3C and SMBus device compatibility
> > +  * GPIO expansion
> > +
> > +  Having such big number of features, there is a need to have some DT
> > + knobs to tell the I3C HUB  driver which features shall be enabled
> > + and how they shall be configured. I3C HUB driver read,  validate DT
> > + knobs and set corresponding registers with the right way to satisfy user requests from  DT.
> > +
> > +  All the DT properties for I3C HUB are located under dedicated (for
> > + I3C HUB) DT entry. I3C HUB DT  entry structure is aligned with regular I3C device DT entry described in i3c.yaml.
> > +
> > +allOf:
> > +  - $ref: i3c.yaml#
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^hub@0,0$"
> > +
> > +  cp0-ldo-en:
> > +    enum:
> > +      - disabled
> > +      - enabled
> > +    description: |
> > +      I3C HUB Controller Port 0 LDO disabling/enabling setting. If enabled, voltage produced by
> > +      on-die LDO will be available externally on dedicated pin. This option could be used to supply
> > +      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
> > +
> > +      This property is optional. If not provided, LDO will be disabled.
> > +
> > +  cp1-ldo-en:
> > +    enum:
> > +      - disabled
> > +      - enabled
> > +    description: |
> > +      I3C HUB Controller Port 1 LDO disabling/enabling setting. If enabled, voltage produced by
> > +      on-die LDO will be available externally on dedicated pin. This option could be used to supply
> > +      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
> > +
> > +      This property is optional. If not provided, LDO will be disabled.
> > +
> > +  tp0145-ldo-en:
> > +    enum:
> > +      - disabled
> > +      - enabled
> > +    description: |
> > +      I3C HUB Target Ports 0/1/4/5 LDO disabling/enabling setting. If enabled, voltage produced by
> > +      on-die LDO will be available externally on dedicated pin. This option could be used to supply
> > +      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
> > +
> > +      This property is optional. If not provided, LDO will be disabled.
> > +
> > +  tp2367-ldo-en:
> > +    enum:
> > +      - disabled
> > +      - enabled
> > +    description: |
> > +      I3C HUB Target Ports 2/3/6/7 LDO disabling/enabling setting. If enabled, voltage produced by
> > +      on-die LDO will be available externally on dedicated pin. This option could be used to supply
> > +      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
> > +
> > +      This property is optional. If not provided, LDO will be disabled.
> > +
> > +  cp0-ldo-volt:
> > +    enum:
> > +      - 1.0V
> > +      - 1.1V
> > +      - 1.2V
> > +      - 1.8V
> > +    description: |
> > +      I3C HUB Controller Port 0 LDO setting to control the Controller Port 1 voltage level. This
> > +      property is optional.
> > +
> > +      If not provided, LDO configuration is not modified in I3C HUB.
> > +
> > +  cp1-ldo-volt:
> > +    enum:
> > +      - 1.0V
> > +      - 1.1V
> > +      - 1.2V
> > +      - 1.8V
> > +    description: |
> > +      I3C HUB Controller Port 1 LDO setting to control the Controller Port 1 voltage level. This
> > +      property is optional.
> > +
> > +      If not provided, LDO configuration is not modified in I3C HUB.
> > +
> > +  tp0145-ldo-volt:
> > +    enum:
> > +      - disabled
> > +      - 1.0V
> > +      - 1.1V
> > +      - 1.2V
> > +      - 1.8V
> > +    description: |
> > +      I3C HUB Target Ports 0/1/4/5 LDO setting to control the Target Ports 0/1/4/5 voltage level.
> > +
> > +      If not provided, LDO configuration is not modified in I3C HUB.
> > +
> > +  tp2367-ldo-volt:
> > +    enum:
> > +      - disabled
> > +      - 1.0V
> > +      - 1.1V
> > +      - 1.2V
> > +      - 1.8V
> > +    description: |
> > +      I3C HUB Target Ports 2/3/6/7 LDO setting to control the Target Ports 2/3/6/7 voltage level.
> > +
> > +      If not provided, LDO configuration is not modified in I3C HUB.
> > +
> > +  tp0145-pullup:
> > +    enum:
> > +      - disabled
> > +      - 250R
> > +      - 500R
> > +      - 1k
> > +      - 2k
> > +    description: |
> > +      I3C HUB Target Ports 0/1/4/5 pull-up setting to control the Target Ports 0/1/4/5 pull-up
> > +      resistance level.
> > +
> > +      This property is optional. If not provided, pull-up configuration is not modified in I3C HUB.
> > +
> > +  tp2367-pullup:
> > +    enum:
> > +      - disabled
> > +      - 250R
> > +      - 500R
> > +      - 1k
> > +      - 2k
> > +    description: |
> > +      I3C HUB Target Ports 2/3/6/7 pull-up setting to control the Target Ports 2/3/6/7 pull-up
> > +      resistance level.
> > +
> > +      This property is optional. If not provided, pull-up configuration is not modified in I3C HUB.
> > +
> > +  cp0-io-strength:
> > +    enum:
> > +      - 20Ohms
> > +      - 30Ohms
> > +      - 40Ohms
> > +      - 50Ohms
> > +    description: |
> > +      I3C HUB Controller Port 0 IO strength setting to control the Controller Port 0 output driver
> > +      strength.
> > +
> > +      This property is optional. If not provided, IO strength configuration is not modified in I3C
> > +      HUB.
> > +
> > +  cp1-io-strength:
> > +    enum:
> > +      - 20Ohms
> > +      - 30Ohms
> > +      - 40Ohms
> > +      - 50Ohms
> > +    description: |
> > +      I3C HUB Controller Port 1 IO strength setting to control the Controller Port 1 output driver
> > +      strength.
> > +
> > +      This property is optional. If not provided, IO strength configuration is not modified in I3C
> > +      HUB.
> > +
> > +  tp0145-io-strength:
> > +    enum:
> > +      - 20Ohms
> > +      - 30Ohms
> > +      - 40Ohms
> > +      - 50Ohms
> > +    description: |
> > +      I3C HUB Target Ports 0/1/4/5 IO strength setting to control the Target Ports 0/1/4/5 output
> > +      driver strength.
> > +
> > +      This property is optional. If not provided, IO strength configuration is not modified in I3C
> > +      HUB.
> > +
> > +  tp2367-io-strength:
> > +    enum:
> > +      - 20Ohms
> > +      - 30Ohms
> > +      - 40Ohms
> > +      - 50Ohms
> > +    description: |
> > +      I3C HUB Target Ports 2/3/6/7 IO strength setting to control the Target Ports 2/3/6/7 output
> > +      driver strength.
> > +
> > +      This property is optional. If not provided, IO strength configuration is not modified in I3C
> > +      HUB.
> > +
> > +  id:
> > +    enum:
> > +      - 0
> > +      - 1
> > +      - 3
> > +    description: |
> > +      I3C HUB ID based on CSEL pin. There are three possible values:
> > +      0 - CP0 is selected as primary Controller Port
> > +      1 - Primary Controller Port is selected by software by writing the REG#56
> > +      3 - CP1 is selected as primary Controller Port
> > +
> > +      I3C HUB driver reads CSEL pin status (REG#121[5:4]) and tries to find DT node with matching
> > +      value in 'id' property.
> > +
> > +      This property is optional. If not provided, DT node can only be used by the I3C HUB driver if
> > +      there is no others with matching 'id' or 'id-cp1'. If there is a multiple DT nodes with no
> > +      'id' property - the first one will be chosen by I3C HUB driver. If there is a multiple DT
> > +      nodes with matching 'id' property - the first one will be chosen by I3C HUB driver.
> > +
> > +      If both 'id' and 'id-cp1' are available, DT node will chosen only when both values match those
> > +      read from I3C HUB.
> > +
> > +  id-cp1:
> > +    enum:
> > +      - 0
> > +      - 1
> > +      - 2
> > +      - 3
> > +    description: |
> > +      I3C HUB ID based on CP1 SDA and SCL pins state probed during power on.
> > +
> > +      I3C HUB driver reads CP1 SDA and SCL pin status and tries to find DT node with matching value
> > +      in 'id-cp1' property.
> > +
> > +      This property is optional. If not provided, DT node can only be used by the I3C HUB
> > +      driver if there is no others with matching 'id' or 'id-cp1'. If there is a multiple DT nodes
> > +      with no 'id-cp1' property - the first one will be chosen by I3C HUB driver. If there is a
> > +      multiple DT nodes with matching 'id-cp1' property - the first one will be chosen by I3C HUB
> > +      driver.
> > +
> > +      If both 'id' and 'id-cp1' are available, DT node will chosen only when both values match those
> > +      read from I3C HUB.
> > +
> > +patternProperties:
> > +  "@[0-9]$":
> > +    type: object
> > +    description: |
> > +      I3C HUB Target Port child, should be named:
> > +target-port@<target-port-id>
> > +
> > +    properties:
> > +      mode:
> > +        enum:
> > +          - disabled
> > +          - i3c
> > +          - smbus
> > +          - gpio
> > +        description: |
> > +          I3C HUB Target Port mode setting to control Target Port functionality.
> > +
> > +          This property is optional. If not provided, Target Port mode configuration is not modified
> > +          in I3C HUB.
> > +
> > +      pullup:
> > +        enum:
> > +          - disabled
> > +          - enabled
> > +        description: |
> > +          I3C HUB Target Port pull-up setting to disable/enable Target Port pull-up.
> > +
> > +          This property is optional. If not provided, Target Port pull-up configuration is not
> > +          modified in I3C HUB.
> > +
> > +      always-enable:
> > +        type: boolean
> > +        description: |
> > +          I3C HUB Target Port settings to control the port enable/disable policy.
> > +
> > +          This property is optional. If not provided, Target Port is enabled only on accessing to
> > +          the devices connected to it and the port is disabled automatically after the accessing
> > +          is done. If provided, the Target Port is always enabled.
> > +
> > +      polling-interval-ms:
> > +        type: uint32
> > +        description: |
> > +          I3C HUB Target Port SMBus polling interval in milliseconds.
> > +
> > +          This property is optional. If not provided or set to 0, polling is disabled and the driver
> > +          uses IBI (In-Band Interrupts). If provided with a positive value, polling is enabled for
> > +          this Target Port with the given period.Note: this positive value only affects the SMBus
> > +          target agent polling. The SMBus controller agent polling interval is computed dynamically
> > +          from clock and data length.
> > +
> > +      clock-frequency:
> > +        type: uint32
> > +        enum:
> > +          - 100000
> > +          - 200000
> > +          - 400000
> > +          - 1000000
> > +        description: |
> > +          I3C HUB Target Port SMBus clock frequency in Hz.
> > +
> > +          This property follows the standard I2C 'clock-frequency' semantics.
> > +          Applies only when the Target Port mode is set to "smbus".
> > +          Optional; if not provided, the driver uses 400000 Hz by default.
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    i3c-master@d040000 {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      hub@0,0 {
> > +        cp0-ldo-en = "disabled";
> > +        cp1-ldo-en = "enabled";
> > +        cp0-ldo-volt = "1.0V";
> > +        cp1-ldo-volt = "1.1V";
> > +        tp0145-ldo-en = "enabled";
> > +        tp2367-ldo-en = "disabled";
> > +        tp0145-ldo-volt = "1.2V";
> > +        tp2367-ldo-volt = "1.8V";
> > +        tp0145-pullup = "2k";
> > +        tp2367-pullup = "500R";
> > +        tp0145-io-strength = "50Ohms";
> > +        tp2367-io-strength = "30Ohms";
> > +        cp0-io-strength = "20Ohms";
> > +        cp1-io-strength = "40Ohms";
> > +
> > +        target-port@0 {
> > +          mode = "i3c";
> > +          pullup = "enabled";
> > +          always_enable;
> > +        };
> > +        target-port@1 {
> > +          mode = "smbus";
> > +          pullup = "enabled";
> > +          clock-frequency = <1000000>;
> > +          polling-interval-ms = <10>;
> > +          backend@10{
> > +              compatible = "i2c-slave-mqueue";
> > +              reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> > +          };
> > +        };
> > +        target-port@2 {
> > +          mode = "gpio";
> > +          pullup = "disabled";
> > +        };
> > +        target-port@3 {
> > +          mode = "disabled";
> > +          pullup = "disabled";
> > +        };
> > +      };
> > +    };
> > +
> > +  - |
> > +    i3c-master@d040000 {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      hub@70,3C000000100 {
> > +        reg = <0x70 0x3C0 0x00000100>;
> > +        assigned-address = <0x70>;
> > +        dcr = <0xC2>;
> > +
> > +        cp0-ldo-en = "disabled";
> > +        cp1-ldo-en = "enabled";
> > +        cp0-ldo-volt = "1.0V";
> > +        cp1-ldo-volt = "1.1V";
> > +        tp0145-ldo-en = "enabled";
> > +        tp2367-ldo-en = "disabled";
> > +        tp0145-ldo-volt = "1.2V";
> > +        tp2367-ldo-volt = "1.8V";
> > +        tp0145-pullup = "2k";
> > +        tp2367-pullup = "500R";
> > +        tp0145-io-strength = "50Ohms";
> > +        tp2367-io-strength = "30Ohms";
> > +        cp0-io-strength = "20Ohms";
> > +        cp1-io-strength = "40Ohms";
> > +
> > +        target-port@0 {
> > +          mode = "i3c";
> > +          pullup = "enabled";
> > +          always-enable;
> > +        };
> > +        target-port@1 {
> > +          mode = "smbus";
> > +          pullup = "enabled";
> > +          backend@12{
> > +              compatible = "i2c-slave-mqueue";
> > +              reg = <(0x12 | I2C_OWN_SLAVE_ADDRESS)>;
> > +          };
> > +        };
> > +        target-port@2 {
> > +          mode = "gpio";
> > +          pullup = "disabled";
> > +        };
> > +        target-port@3 {
> > +          mode = "disabled";
> > +          pullup = "disabled";
> > +        };
> > +      };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 2fb1c75afd16..71ee5071ac0f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12214,6 +12214,12 @@ S:   Supported
> >  F:   Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> >  F:   drivers/i3c/master/renesas-i3c.c
> >
> > +I3C HUB DRIVER FOR REALTEK RTS490X
> > +M:   zain_zhou <zain_zhou@realsil.com.cn>
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> > +F:   drivers/staging/rts490x/
> > +
> >  I3C DRIVER FOR SYNOPSYS DESIGNWARE
> >  S:   Orphan
> >  F:   Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > --
> > 2.34.1
> >

