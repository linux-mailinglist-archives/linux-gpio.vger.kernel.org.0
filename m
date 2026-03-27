Return-Path: <linux-gpio+bounces-34334-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GziAOT4xmlwQwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34334-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 22:38:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AADAD34BC82
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 22:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE5C830DE600
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 21:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129423A1E96;
	Fri, 27 Mar 2026 21:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WPYuHvPW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132F63A1A5F;
	Fri, 27 Mar 2026 21:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647280; cv=fail; b=Wc05AtbiSUko8cPtfKyIkTdYdpG/bN6RRPJYNCT73QsnSMC8SkGllWrbPzMsyv6Gldy9zVyaw43T5LhxpMo097nMGyrpCzhuSqgxqwHe9JXEzZEkpmFEj+7XZk1Jcl/KoJ7WU4IfVcnGqEA9/cdrqljcpBARDVu1oBanemmOzf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647280; c=relaxed/simple;
	bh=YjekS0zr/swbFjaUMALudPHZ5yVmBdXkiTRaBeNarUI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=j3Oa6OQ2lKjTMr0DoqF50aOxdhOTgO3gay8Gn5R0DUldKxeT87zm9ObA/c7ORkoWSNx0LNp9x7YXumfeLxWrrUXscqqQivkvPTLVX3EAUxA+mXxfk+Q4Z17+z/XmxvLu68BXmGqLPsahPrOM0P6DUpZYN+AsC/TnUxmPdXIOj5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WPYuHvPW; arc=fail smtp.client-ip=52.101.66.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wa4NMunOrI5dIA8i5zeSLooExG0RP0SzzIhspUQtODOWwkTZnve8OlHakAcFxlnMRaB+e6woBsG43ogRKHUNwVatlncYp+iDck14XcgOxZDld6AC4b3oNtiPP2CKbqokE6ms3FOMik+YZBuGbvhxHrYpvyKrJRGIluRuxbETjiGMklAvUajjhGZrWv3HgQemM7HkJ6Dh7ypDfe96MV4c1atZkY9IrWgrjjTxk+MIea9Zl69xHI+ieSZE7RiqPu4UHYX9+nVP7J9wQRPdIBiV3ciz4L9d8NgQhd9F5ZmlNTbHkOpEAJ+DBqQQ4zRiqy1ksbuBpC4mAZwzcwbyugfLOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrnfVBmH7lq0Sg1oOGIcvjqEwdPNcCOfRCUWaxpAoIE=;
 b=S9hSSEXKpkuhDIdu+hei5tAmra+6gpW4k0UtgRLg0RKUhJ6xn55ARm4I//ia853CIy09kUQV86E1x3Bo5srZuWu9hxlk86pgGJbPUtHE9uxjMjxI5513GQz1r3bQ613VpOAEmdadqX9b73uRWAH/GxeJTDDW3tmOQvn87y+dT+PRbmxBadSJI/a9FOzHOjstrwDxNZJkyTFz08isgZr3WNKWp15XrKn5zenPG0sUVKUn7GbbWM8LuXihoezZRL1H+UDtjKJ0bNvcPxI1DdwY3Lp2Ur9d8yAq94f8v2key+PByRR9R2v1Ug4itL0G1vEC7ZQoldqhC58XwtM1oSElGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrnfVBmH7lq0Sg1oOGIcvjqEwdPNcCOfRCUWaxpAoIE=;
 b=WPYuHvPWSoIP37Mcvj/UkiSDXRJBgNKKlgsuIKVebsJuyj4909ok/WrOmxj9ZNG06Mw56c/VEkMQqN+rR+zt4JuEytGXQrnoDJHXPZX6u5sq0Q+3PyqCIiCmqjuTbGiWXEYf2+ISlx5hhs9adw25jLaUy00wU9eCofe3rp4FvuJHoCU+Y92032kLNaMSSJlw5kAkk/e0Cj4orKF1+JFWExqC21pFIuL0+P/Gd4qhaK5DhoYYp3xr8j2PZA0OFsEmy/dwy9/Pa3iwkGoT685UYepxbSMCyctRDV9KvJwRntWmI7urv2pSf+Y0LT/jnAk8C44VFotK+0kx8XLhdbassg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8668.eurprd04.prod.outlook.com (2603:10a6:20b:43f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 21:34:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 21:34:36 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 27 Mar 2026 17:34:04 -0400
Subject: [PATCH v5 7/7] arm64: dts: imx8mp-evk: add flexcan2 overlay file
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-pinctrl-mux-v5-7-d4aec9d62c62@nxp.com>
References: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
In-Reply-To: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774647254; l=1718;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=YjekS0zr/swbFjaUMALudPHZ5yVmBdXkiTRaBeNarUI=;
 b=035MwxCcue9gCKyayMUiGuNrFgq0GXXuLVEzeFk7ZGhLjzrn5teZWdsw90CqP5GZ7a5wzk8db
 Y2jcE1N74xiDkN+xwjkkndB68azzwi2HSP52ilSUd9WogC8pL2SdOsQ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0182.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8668:EE_
X-MS-Office365-Filtering-Correlation-Id: ef14b8b1-57f5-4f38-c6ab-08de8c48a4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oIA/gpR2EWSqc2yORkgV+RkK0+5Tl3T9IxlosyFl5PesETWCIwuDdPFLJk7j4CSrWDsGbCfjObNHtnSQpxMKMnnV57z/R+0MWqv0g76DKQuNjAMCr95XwQQ5IJQ5h2Q7SyVzRV1LgkLEPqZF8U0mLS8YSHMvYNdXqGhd9mnRgv2DgoJ58AMiPFkrtSUZ0bPzcz2HzlcO35BV8JoBSrvAeTjcyaEXWwrkeeGCcSTeDP7Rb7gOEsLKHqhauHCJx1Kor8gZ7iFU/BHVvAmuySsG6ZU5SgA5lbtU3B0bvdS0u49BXSwrVjG5YUSy/P/HjLuvDshUGeARjxlOSpdHxvlDRNHY3U5iG+sd7FJI1qETJquhuJVwp4rkcaNkSqc4VKon+jQp+mTPFqG70Aa7UQ6yUrr9g60QwD6myoLVDuii26gYopxLoumPnfKy6NWaWazYxdDu+PJhNe5gcE3a8mpgWrRuA22s04qady/B959T+kEew6X65O0B3aksqSGbej6Mzqc2Cm05+Pt5wLz0lL36y72t90H9rOgn6h3EiWRf4GITzKehb6DSTdI/ABIlsFWR733nCMm9eI0+M6tEKTyWWwFP6cZUDUlUp3O3fCFpT3zOlP/BLZxOiQs/Gi+8XxdLSkrzptsUupMrLCDUb+IJpbckQ1jJUOI26xqVzcCWWhKZnjXtLDNxpYy6nBuhOo7bAs6oz9KOFAsB6mT/iQqYJyWhWXDEblxdBFyPz6wiGRnPh6dR+zGFT/tuUzTMv3TGBA74qPvBkcB8wwCQz8L9fvG5ojcEjeDhdkhsfXgq1W8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjhobEVHbWZyWS9SWTlYTkxtaWkxenZqUytrT0ZrLzQ4eWEwbXozY3JmSVlP?=
 =?utf-8?B?eTE5U2JaYTB2VWh0YkdHQTYrYUt6VmhqeUVRMzg1RklRZlZzSy9jd0V2V3dp?=
 =?utf-8?B?ZDM4ZVpZcHdGSWwrSG9uRmR6U0t3VjNaQVJlYXBhWlpyVTA5WjIvVURRR05t?=
 =?utf-8?B?ZW5ycDZjMTdrOTlVZDUxV09tbmprNWZ2MkZFbUhxMEtaTm9qZjVLMVVrT1FB?=
 =?utf-8?B?NmxxYk9mUlM4ekpwandHS2YxNHBPa3pUZHFTK1R4S1h6WDJEbG9BRkdsWThB?=
 =?utf-8?B?VVFmNWN4THNRUmFqL1J6Z0hqT1BEaER6WDRaMTlsZzdpSGduSjdoYUdrNXFl?=
 =?utf-8?B?ZmJSaENGVzJCdXB6bEZzTlNaYjlSL1orbWx3b3Z1ZHJvYTVxeWZMTXAvSXE4?=
 =?utf-8?B?N2J3TkFzcHZrZm9PUTQ4dTF1dGdZVHZqM3E5SitoL3A5L2cvWVo5TGRiR0ND?=
 =?utf-8?B?cTdpMlpXeis5QVEzcENMaVNBQ0ZRMTJTU2w3dkhNUUI2Q0pyN0NNWDN5VlMz?=
 =?utf-8?B?dUZXQVJyQTRubW5uYWl3cVVpYjNSYklGeFRNQ2Q0NUlBZ3VJRVo2dFloLy81?=
 =?utf-8?B?bVFJWnNLTTc3UUZtajFwZU1jVVFSbzN4bDBEaU8zSVZDQnF5ZEZ3M1dJZk9t?=
 =?utf-8?B?SHJVbE1tdVkyYkxzdEZFaldJRm8xWGF1RHh6L2tZdTJSbWNTcndzdmNnSDgy?=
 =?utf-8?B?cXVXUXlxNUtBV0dQWm9IclJZeHkzK2VqTC80cmhuMEpkOE5uWis1eWovL2o4?=
 =?utf-8?B?ZVBUWU15c3Z0VFJPTHJNbWNERTZIMjE4Z2dEM1hrMXpwVFRsMGM3cEhrS2FN?=
 =?utf-8?B?WVZCei94bVZXK3JWVmZCUGF6VFpUeW9ITWEyNnNTUEdmTjN3MGVXdUVRdXNK?=
 =?utf-8?B?WWhPT21wRkNvR1NCSEpydnlCRGt4d1VCekpPaldFZ1FrZ1NTMkJNVEZuTWpB?=
 =?utf-8?B?VTNOL05peDBzaitZK0txZGt1RXRMOUkxSkNrenlNSUVSSFQzV3lZSUlhbDdo?=
 =?utf-8?B?TGYzTDQ1M21oMExZcFhMcWVYT0RmTmhtM0dYdGFibnc4NWFlNllxZnRqSG1W?=
 =?utf-8?B?MXUzWWE3WWU1czh4MklHTHZ6eTJibGFUQk1ObzFkTWFKNXhXOW5iTFV4MDFN?=
 =?utf-8?B?ek9wRDFqVFptSG5lbEoySlJPZjFYb0F1SS9mSnhlUFZTSDJUc2txMG9RR3Zq?=
 =?utf-8?B?WlVyUGZCbUpIOGRRcUpyc1ZPRGpOUXJpL2dIaEZvU1VpNFVpNG1INXFMSHFz?=
 =?utf-8?B?aklsSk9rc3FKYkxzR2RhaXRacXA2YnJxVlhMSlk4eTM4UVorUVVwZENRU09m?=
 =?utf-8?B?Y3orbVl0ODZabkJJTGcwajdtZlhHSUZQZTFzYVZIUnVRQnQ0M01INTZmY29k?=
 =?utf-8?B?TXFlSTRTOXh1L2FtYlQwbmJ5aFYzMWIyMVZ0bnhhOTh5OC9WbWVySFdycXdK?=
 =?utf-8?B?WnBsV0RlVkJzOXR3WEZNek9WaTVMRmFvS2IvMWxKWmNRdkhhVHRJcWlLM1Ro?=
 =?utf-8?B?cUVCTno5VUFxa0RTR0pncWk5dmdYNVBaZTJaVnN4T2dNUC9aeEdHU3JMQkg2?=
 =?utf-8?B?bHBzbmVhQ0NpaUJvVkdPbUZWNTI5MGR0RFIyMXphRC95KzVTOXpNRHh1N24v?=
 =?utf-8?B?d0FDY3NTUDJiS1JtMWhzMUNUU3lkSVpyanlKNUYvcUdxbDNOWmtPQlVpNlRP?=
 =?utf-8?B?Qjk0TkdvaG1ZMzVxeXg2UDFyaXZqMVNiUHljVmgvK1pGRFYycER6ZnV5N045?=
 =?utf-8?B?dC9KUW05VnEzU1QyUHRIemZVRVZURDZFekFzdkxHU0RoV0tVaWZKYTMvMW5V?=
 =?utf-8?B?VHpsUXFyb2ZxNEdUWEZacGVFckJpRkFkSFBkT2hZbGg1UDltQzZWRUxwcVkv?=
 =?utf-8?B?VWNJVHNZY2J3RTNzMU9vTWhBWlNOQjhFVndBb0lzd3lTUkQzYWg5cWFOY3hY?=
 =?utf-8?B?UDNFb2pjN0wrR005UlF1L28weVFuUEkvUzJwQ3lwTUpCRU0yeXFEMTZkWEh6?=
 =?utf-8?B?c0RVS1ZCNE5JV1drTXY1RXNVdGhCd1VoUE1xby92YVB4YVFLWXA0Ri90QmVF?=
 =?utf-8?B?c29KK3MzT1dGVkY2S2NleGVuTjYzSmV1WnRhcTF5eWd2eFRTMEMzWEFDaFd5?=
 =?utf-8?B?Nmx1VWUxSWQ2TW9mMk5mR080NVRtZ3IyUVltQjA0cVcweldRUjhSaXgxL3B0?=
 =?utf-8?B?UEtpdFUrNDA1dTU5cjlXTTRNTlU0VW5LemtaY0tHOWJwRytmSVFYckwwdzBO?=
 =?utf-8?B?c3V6RXJzTEtyMTExeGplQWMwdUYyemhLUnhkNEpvYnY2eHcyQ0k4S0dGRUpE?=
 =?utf-8?Q?6ycDaRogVxP5SVUQjD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef14b8b1-57f5-4f38-c6ab-08de8c48a4d6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 21:34:36.5506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dlbn3IrVs1y0YMm0FYa8TYgZpkcsY5b98vQKcbaimyiwB8IsTqe/YA7h43wsvzL0IX1pP7H2dAl2Z1h2VYRpsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8668
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34334-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: AADAD34BC82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add flexcan2 overlay file, which enable flexcan2 node and disable micfil
node.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3-v4
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


