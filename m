Return-Path: <linux-gpio+bounces-32319-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WK+xD9y2oWm+vwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32319-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 16:23:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E82F1B9AEB
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 16:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C2FB3015B82
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 15:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7127C3EFD35;
	Fri, 27 Feb 2026 15:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jc9sf28X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013056.outbound.protection.outlook.com [40.107.159.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2CD41C2E8;
	Fri, 27 Feb 2026 15:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772205782; cv=fail; b=SP81EQ/KcnNh4kJXOQ4VnvyHYrn89vggii1KHOCvHfjFLLvQu6udsecvcqg53XBkGX7aKR9RMfEMpNvZlaLmJ6k0LuNQsE7isn8zpnEgSzAslBCVHUYwNCPAKpuLerloP7uQ06ElBs2sl1Je2XdDr/HInXQNzWCe3tSKLr+EHPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772205782; c=relaxed/simple;
	bh=EQxjsKGD/GXt8vzYgIHX5SVqUnnzt77YlwbawOm+ePc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R+fGaQjXrnvdUiQ8iCIEzds1AROamRCFMWlYPP1YyJtQhDrt3OwHJnyo8x42uKA7DgxE0PtqtnSLMNambN9r25LII/V+QsFqZo3tNo9yrzeVkTtSR+5QHOoZ+uIyg6Bwf2AtlAoq5cPAIrH2Ogk67x/1zq6ZRF9cC4hHw7G8vbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jc9sf28X; arc=fail smtp.client-ip=40.107.159.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j71a8s94mTuHsYN8mt1Y1WzO5USGGp015Lmtjv3I5uEy9/WFn5bdN8kAn4a0FnTAsMIpeQAuwe6vgtyieLXYpJssOXylVoQMpo18B3RgD+hiTiyw3Cim00GEfr/cpTN2KDY5C+qDgtxwyXaK9JwJIyLAixFJaUIvbxyJlhOXE5HmzB62nBB9RMORBiRcPtpmP5Z+/ZYrqxI6Wo1KiDxpBq5MddxVxtXV+tJQgUDjcsEOv+ZsnfavxvSDjSK+SmtP3NyiVYZFjmgmX+ufmqBycZJK/7GDEC289j5YD5HEGIqEEzWBuMA29ApitrBcKZNNbHJW2RGCSYDbF+hgH6G74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmPs7Qu8o+eVtJD1ao8bCyanNcpWhoD2umwRJ/gmDfg=;
 b=Nvbtvtf1hC8s2CtjWkRMk0HvSTsR4CfDjXpYJekOXJs3FJ4H0c5ITjTCYvnD86JX03twXWoyTGMKxKqSsNixPXSouGe3qaQMo4UGOmFjTlykH/hfjRGOiGMAML72G85xPlRYqmfBvbcOf89SGBjhLdN5Iu/c4M9+yUc7kFPb01d8bLGXmIqrUKoT+IAauCe/8HaZZwRzEEEYQO4BKLnRx9+2nKOyVBixNsin4dzQ6dhgQ40dC+blqc+weiDI6FVZEgOLtXfGFAOCKddzQGoCq4QoVQVlaxaP7Lx9CuK0CwQAIc2DJQE2eEr5eFhQujkpf9Tk8KDcYzPlKTAl7DCB8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmPs7Qu8o+eVtJD1ao8bCyanNcpWhoD2umwRJ/gmDfg=;
 b=jc9sf28XCpURkM1cldVuY6ucdrVyukVudnWceArLZi3/U6U2esMIPngoLXGUUnVlL1RhTKQiBv7GJ55ZmlochVygVW0oQqRtON0uC9lVqA8nCF+ho71r2rXSOk8wl5At4ISnhMJKdvLSjuWeIavPJEv2NrVuaBzIy0jLRa3kbwWIVvWUFvmVpdYHhyL9pAwpBWQT2uDiUdJk1tFUrj6bhzfk4qYAfl24wHbjL+cPMfkq1q9yopJlb31k9Xh9nIY+uf5DfXpUHzWayYu6rdSP5Rz1UKO6TA290NOkVlCsybyvr0wUpMKNc3cUDHBLULINW0G5oxfHZ1Ia6dbWEq/3Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AS1PR04MB9477.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 15:22:55 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 15:22:55 +0000
Date: Fri, 27 Feb 2026 10:22:45 -0500
From: Frank Li <Frank.li@nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v2 4/6] pinctrl: add generic board-level pinctrl driver
 using mux framework
Message-ID: <aaG2xQDnMVGGAOJE@lizhi-Precision-Tower-5810>
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
 <20260225-pinctrl-mux-v2-4-1436a25fa454@nxp.com>
 <CAD++jLkT83xz+PSzZZv_Mv+Mqx_+W30d_xk68EDG-sdmFF3x3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkT83xz+PSzZZv_Mv+Mqx_+W30d_xk68EDG-sdmFF3x3A@mail.gmail.com>
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AS1PR04MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fb7ade6-4177-428b-3f49-08de761414b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	iuIQBHOrlUykYgDnQUd7zfnAhdPdPbJoVqFt/jkAovcutZadammAMXrpUOVK0td3NyGPMgJMOonw2pZIf5dUzeaj6FDrksmFVi+w1RuLSMii6aNQOjuGPNiG/IeOCXoi+IZEufdQCAYeCNQUMp2PyWwTO4ylRfdeGIDElAF1OkGtaepl22Sm71KT5PfldrSgS+Ofz1q8HjK9eZGiPNus/dSmsalcvvnYDKgODhUYsnaZaWOqKFj0SeJ7mkGw9XnNMDQasR8x7R5lJoNoG+J/s9A57jTosRCNXxUVm9Pm+ispeOBNY7qILmJt1toZ73CeNd7iYeebsoreuC7BylDzS+TRAHpdNqYz01nnqmaJMT5yyR0ELYufDD9I8vhixq+6SCIBgllMsYqr/z69gkrxtV27mcSW8Ftb4qh1FTy6Sot6b46JnXR8h216Wv7NcQB2FsNJ8NQJCpvfkhbs1sojQu7FH2G0rs6++sVZpW8217JATXMExOQS0VF+wiVMfNMehKFTea6zBh6ncqEjuaIclh7jyOz334enn6PTdenO3CIO1Kxo6blIO9B3s8RsjboCm75ipbpwi35E38km9h3SsO1QYm6IEUe0Ne3YEOkfG1cnKGGWb0yfvLtlOjfFoiYJ8XelC4FWzDlOSJvIh7yu8qNLW2GsklwTbRkpRShiuUYpDjML9NrsNQRDvARKyGvcQKjo6BGIXYOfdr/mG+ai9aa1DmeammZi2HEYYdYnxR1ppG6oP0DZ4knmcGqjZ6H1Nvvpz8WUUUBDxGp6LFDGeOvdKpXG7r4nFxyILl5+sa4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVdKdTJFcEU1WkdpQTBaOFQ0cEtKWmJEbk91UENBR25DQTQrOGpCUjllSjQ5?=
 =?utf-8?B?SDZWdmhrZWV0UEpLVEtlcmRidVlmbzUwYzdMT2NVWmtXY2dIeHMrcEhQTWZL?=
 =?utf-8?B?RVJNcGROdVRuYzVFbEg2YjN5VnRxb1Fkb1duYnRydGZlMTdDdGxnb1k5eEJH?=
 =?utf-8?B?bVpCOUY5STkyeXRnTHhhNno2dzZMRHJEUmdCMVhhYVkxc0lJRDNSa0Z0WTZq?=
 =?utf-8?B?KzhOdjdncGx2NEZMQmdkYTRoYThFVEw5WlhIaC90eDRDM09kTkdpWWhtWGpZ?=
 =?utf-8?B?RjY4V24ycVY2T0t1d2VUZkszS0w4VHlITm1lK29TMndoM3B4b0FwSWFSeWtF?=
 =?utf-8?B?cWQ5THNHSVk5VnhhSmNRUUFXTG1iM2JRejF6b0ZoNktKa3NMQm5HMEtKNDhW?=
 =?utf-8?B?L1Bsa3hYenA3UXVXMXhxQ3RMQU1zdGFFR2tPVWNJY0VTNU1LN3dUKzIyUm50?=
 =?utf-8?B?YmRoZHE2UTR4SWZNL3BhRmxCQjBST3M3TnMrcE1iY0NENGE0eTEyemxJMDFJ?=
 =?utf-8?B?am5rZmg2UktJR3NvY2wzTmNqTllXY1N3RWE1dmFGUlFCV0ZnNVBQRWN4YTgx?=
 =?utf-8?B?QlhtUWVLL2JJVDluWVl5b1FhOEs3Y3g3OGhrVzh1UzJHcEpRTktpK0J6d0lD?=
 =?utf-8?B?U3k5YTVtL1ozR2RsWXVKbG9mRDJLZVoyaENFa2E1QWdTTXlMeUVJSDdxcjZ0?=
 =?utf-8?B?ckhYamUwN1Z4eGR2bEI2ZnFFVkZXYzdOR3FOTUlxZlkvdGxmek1vK056bzNv?=
 =?utf-8?B?VzF6UEpBbGN1UGI2VU1lQS9aZGF4S1Y4ZWVPQ0VMZEtpazBiT1RmNzlMcitR?=
 =?utf-8?B?aGxBQStRbU5tVFdON0Q2UTRtaXFsR0hsSjRuanBTaFgvWm45ZTRRUjFRSTg2?=
 =?utf-8?B?bWNveVBnV2pFWTZxZkdYN0lrNWNEL281cE1NeXlGL25kbmwwTmhxNEFJZk9w?=
 =?utf-8?B?aDJTUDhlZFB3WlFHUnFoUndjN0hzeUJpQmMxY3JobERBNEt2alMxMVMzSUNJ?=
 =?utf-8?B?cldEa3Fkb09GdFdURWdna3BOSFVPWUYxdHJQTEl2L1QzajU2T3BiQlErUENX?=
 =?utf-8?B?Y3RpcWZQdWIrVmNUbERORkxJY1N6V2RDeWdYU2VYMEZqSyttUkt2ek5pT2NH?=
 =?utf-8?B?ajBlcmJkUHU5eldsWGhaOVhFbTluRlg3Rjc3OUpXZy9vdkZuR0JYSnl4QnpO?=
 =?utf-8?B?cjdLS21TNnFXUThqOHFGRzB1WjMrdDVxOGphcmE3dEpsdFVlRW5zeU1STi9W?=
 =?utf-8?B?MWYvS3BSQi93M1ZaenpONmZRVjAxWG1zc0p1VGVpb3I3M3pzTUVXZE8ycHpF?=
 =?utf-8?B?Qlk4QjFLRTBPcHVlSHRCR0I4cDk2bUFLeHN3Y2xlZ1JuT09EcllsaVdRR3FL?=
 =?utf-8?B?d2s3QytKaWNIaG40VUFoQmxKeWM3NG55cWlVNDFtSmVzM1VPcTlROWw2bUVJ?=
 =?utf-8?B?d1VIWFkxSnlNblR6L3k3RXhLcm5EUXp4MUNlMXpjOHhVZFZNY3dTZmZkZTRM?=
 =?utf-8?B?WnlpckVJVFVVL2w4SkxtbzQyTkRZK3ZwNGVNQ2J0WlI4Yjk2dGZZV1FMRmE1?=
 =?utf-8?B?bUZya1hmb0NvN2trdCtJL25tT0tJd0tMVlFkWFkxN1BwbkwrUmlTT084a0JU?=
 =?utf-8?B?VXd6Qy92c0FuamhyUzI4YXJneithZTh6SVJweDNHeE5HcVBDNElYdVZ0RHZK?=
 =?utf-8?B?ME9HSEx2Uk9JU2twMTBMOVl1emRwbGFvdHNTc3drQnVqR1Y2Sm1KVXRCczNm?=
 =?utf-8?B?YlhjcUNybG4yMXNtYVZ0YzhaM0tEb3VuR3EvckRkeU82TFFCK3JUejBneUVa?=
 =?utf-8?B?NjBudGV0NXFiM0lKMDkvVlNMK2p4OUVveDlSS1dsVHRibzhHVTVLTHk4NWRj?=
 =?utf-8?B?VUtWMTVNcXRJRm4rbmF6NTY1Rlp2RFBYT3F6Q1R4WjBsU0RrZXBSb3d3VndK?=
 =?utf-8?B?ZnhoMWRSVThkVWpJQlJHdjU3eWtTVENZWnlKM0lnVkJLd0hqZHBCRnB1YzFj?=
 =?utf-8?B?OXJCVHRndUxQQWE0RlVybzBGSklaYnpES3pSUXNYUDdwWFVTcU5HQ29CaDJC?=
 =?utf-8?B?eGxRT25kc3JEd29aNUFHcTlqaGtzUjlQZU5mdDJqeTRMS3lMMUFiS3VPRW5n?=
 =?utf-8?B?NW0yNmwyYzk5eXdYSmJwNzhuaXQ2bTZSRUVGK1JFaXJlWGoyNmhFY1BKRHk5?=
 =?utf-8?B?VFJ4UkN0aUtQY3RiRy83RXh2VkUvc3k4MThGUWs1TmVIdlN2bEJ4RDdXRkhp?=
 =?utf-8?B?VFkrRVFZa1FqUzBXZ1hZaDBSeXh5TjlicHN1WlZZWmxvUERYM1U3SHoxS3NU?=
 =?utf-8?B?dGNuUGxOYUUzaTdZV05TWU80QmpCbW0xVzhFVXF2VGZKMSt2TnErQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb7ade6-4177-428b-3f49-08de761414b1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 15:22:55.3098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9daCo5mXaN3OvmBuUc3ukeQMV/lIjSa+ZOBi5Curyly1SiwHCsgkuJrAVl0ToK2SySzNXrMtA3KOmnj0WS7CCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9477
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32319-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4E82F1B9AEB
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 10:20:14AM +0100, Linus Walleij wrote:
> Hi Frank,
>
> thanks for your patch!
>
> On Thu, Feb 26, 2026 at 12:55 AM Frank Li <Frank.Li@nxp.com> wrote:
>
> > Many boards use on-board mux chips (often controlled by GPIOs from an I2C
> > expander) to switch shared signals between peripherals.
> >
> > Add a generic pinctrl driver built on top of the mux framework to
> > centralize mux handling and avoid probe ordering issues. Keep board-level
> > routing out of individual drivers and supports boot-time only mux
> > selection.
> >
> > Ensure correct probe ordering, especially when the GPIO expander is probed
> > later.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> (...)
>
> > +static int
> > +mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
> > +                         struct device_node *np_config,
> > +                         struct pinctrl_map **map, unsigned int *num_maps)
> > +{
> > +       struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
> > +       struct mux_pin_function *function;
> > +       struct device *dev = mpctl->dev;
> > +       const char **pgnames;
> > +       int selector;
> > +       int group;
> > +       int ret;
> > +
> > +       *map = devm_kcalloc(dev, 1, sizeof(**map), GFP_KERNEL);
> > +       if (!*map)
> > +               return -ENOMEM;
> > +
> > +       *num_maps = 0;
> > +
> > +       function = devm_kzalloc(dev, sizeof(*function), GFP_KERNEL);
> > +       if (!function) {
> > +               ret = -ENOMEM;
> > +               goto err_func;
> > +       }
> > +
> > +       pgnames = devm_kzalloc(dev, sizeof(*pgnames), GFP_KERNEL);
> > +       if (!pgnames) {
> > +               ret = -ENOMEM;
> > +               goto err_pgnames;
> > +       }
> > +
> > +       pgnames[0] = np_config->name;
> > +
> > +       guard(mutex)(&mpctl->lock);
> > +
> > +       selector = pinmux_generic_add_function(mpctl->pctl, np_config->name,
> > +                                              pgnames, 1, function);
> > +       if (selector < 0) {
> > +               ret = selector;
> > +               goto err_add_func;
> > +       }
> > +
> > +       group = pinctrl_generic_add_group(mpctl->pctl, np_config->name, NULL, 0, mpctl);
> > +       if (group < 0) {
> > +               ret = group;
> > +               goto err_add_group;
> > +       }
> > +
> > +       function->mux_state = devm_mux_state_get_from_np(pctldev->dev, NULL, np_config);
> > +       if (IS_ERR(function->mux_state)) {
> > +               ret = PTR_ERR(function->mux_state);
> > +               goto err_mux_state_get;
> > +       }
> > +
> > +       (*map)->type = PIN_MAP_TYPE_MUX_GROUP;
> > +       (*map)->data.mux.group = np_config->name;
> > +       (*map)->data.mux.function = np_config->name;
> > +
> > +       *num_maps = 1;
> > +
> > +       return 0;
> > +
> > +err_mux_state_get:
> > +       pinctrl_generic_remove_group(mpctl->pctl, group);
> > +err_add_group:
> > +       pinmux_generic_remove_function(mpctl->pctl, selector);
> > +err_add_func:
> > +       devm_kfree(dev, pgnames);
> > +err_pgnames:
> > +       devm_kfree(dev, function);
> > +err_func:
> > +       devm_kfree(dev, *map);
> > +
> > +       return ret;
> > +}
>
> This is so close to the pinctrl-internal helpers that you better work with
> those instead.
>
> Can't you just use pinctrl_generic_pins_function_dt_node_to_map()?
> It was added in the last merge window in
> commit 43722575e5cdcc6c457bfe81fae9c3ad343ea031
> "pinctrl: add generic functions + pins mapper"
>
> There are problems with the above, for example this is only called
> on the probe() path so you would not need any devm_*free calls,
> as you can see in the generic helpers.
>
> I think you need to look into using or extending the existing helpers for this,
>
> > +static void
> > +mux_pinmux_dt_free_map(struct pinctrl_dev *pctldev, struct pinctrl_map *map,
> > +                      unsigned int num_maps)
> > +{
> > +       struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
> > +
> > +       devm_kfree(mpctl->dev, map);
> > +}
>
> Just use pinctrl_utils_free_map().
>
> > +static void mux_pinmux_release_mux(struct pinctrl_dev *pctldev,
> > +                                  unsigned int func_selector,
> > +                                  unsigned int group_selector)
> > +{
> > +       struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
> > +       const struct function_desc *function;
> > +       struct mux_pin_function *func;
> > +
> > +       guard(mutex)(&mpctl->lock);
> > +
> > +       function = pinmux_generic_get_function(pctldev, func_selector);
> > +       func = function->data;
> > +
> > +       mux_state_deselect(func->mux_state);
> > +
> > +       mpctl->cur_select = -1;
> > +}
>
> As mentioned I have my doubts about this, explain why this hardware
> is so different that this is needed.
>

As board mux (uart and flexcan) exist, for example, only one of UART and
FlexCAN work.

when modprobe uart.ko,  mux_state_select called.

So flexcan driver can't get such mux as expected.

when remmod uart.ko, we need release mux_state, so flexcan driver can
get such resource.

Genernally, DT may only enouble one of UART or flexcan.

but insmod uart.ko
    rmmod uart.ko

    insmod uart.ko (here also need release previous's state at prevous rmmod).

Frank

> Other than that I like the concept!
>
> Yours,
> Linus Walleij

