Return-Path: <linux-gpio+bounces-34328-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBZaAC34xmlwQwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34328-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 22:35:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7E834BC00
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 22:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AD29302DE01
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 21:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D68539B975;
	Fri, 27 Mar 2026 21:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jU8SXE1M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A97C39A063;
	Fri, 27 Mar 2026 21:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647263; cv=fail; b=m6L9kj5R3au+QTCIy1GxxcsF6wFLVRQOOgbz3ZiJjzXw00liQm6ZgCJR1p3rmg0fYRT7SIL06/Kn3fAVUNCRlGBreOiFBs65fbRQ/YgoWw8EV3mq+qStOhW8wzuxtlS5pB4jx0PGCTsG1qJLWXPsShz3KZTS0vLZ+8InjzfIpMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647263; c=relaxed/simple;
	bh=6lZaJD3A/F1rIGObW9t+4MUqh2HqQaormMVYGkjpB44=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ck3/pidZZ0NO74PGb5nMeMGb/RCKvmM3/472uV3K45s6rFNlnuRRuABHIWfVmDP8ckP1yM4pBw821UY0mXSXhTtmQE5RRnQWavDRz44R/9fhXw0pPRrvFPcn89F/nGroU3P0N1LFvMCO8Pe4lpLP+LNe1cRuCjJAMhTjDAKv49E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jU8SXE1M; arc=fail smtp.client-ip=40.107.162.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KyOBWooonfWnPmUn0EOnL0/VXOTjxAaKpVK0u74PKZT4dU19x+yMEQNDj9J0c4nhXQpUGQavPMPoPP9IaP6e7dJ6D2PsNGHqV09jd+sXJkfTlzIeedRsfX2MA7vmiJ298XsFxVH+BXl9tKR9cLifg+BigDtZ92FxvspE5UtKi6pjA4dVmwhNRoP+nbZksPS2sNWwxJH1stoV12sx3zT6KZMOb2DT2GOVbMmVaGnncFgKb15/0/QxStjslC2snI4unRhtxyz6bA1YsR9Hr4wrvNiqIP56SIF6XtZxezjzvbp7qZcV19Fhx7IVD/SFmdg9FKkM8YwLTDve8FCCUYlG7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQlN2xveg+I0NatlzXlXz5x8nuvILqmuLkLNQrT9Y5E=;
 b=UrEXA6CWOIY73Ft0Sbsfk2Z5dshSFkTLFye/RgTqMKwiIzvJRraHoAX8lNaHR704+qMvY4xzvW0dKxLANWceO9yi7vaKEzoJPs1rnV7iXXhkFG7rK7j0BCGq5uIbA7+P3Tmg8CCw6zAMquym7ICferL4hfyCbN2AWTGhHKAduFx8xCeYP+DmSrdJOQO2+WUpxVcSwA9TbMZitKOvOp5GbWmWZ9cEVrT8rURipxXgi4HEIkGVWQnvdl5YjY2mqpo+wU7QZuIFc4TOTIhzNysalUrlQo0fegqtpNWPWLxk8DqiLnVQBmPednITCrOag8QGdNzMVF059vDC3FqAhHS3xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQlN2xveg+I0NatlzXlXz5x8nuvILqmuLkLNQrT9Y5E=;
 b=jU8SXE1MfmWTV/s6ViODLCODYUL87RLAmjjRu0xuI2vzJwOMoEUU2i7orkde8QZeBTNg1/ql7l63161youZd9qukyQIzyY7bUeyaDP+otjA9GG+7jKQUubpyTlMGGg3merWMusu09Im7FE9BNb7gL8523JWAAbthl+4EeelWK2BPBEVOi2EBTDn09DxvRha/hQJV1pSitPCtMyZKhpGDk/il2oV2dqUbZzlYat7f3ZxiAUmGYXq5Sq7j9xrr9ijYWlu0Kqz0inNn+ambI430UpqxvzATVZscMsY1rSXC2yGDh3WxJEkanyBNs5UWivPzLBR1g4PM1EPFLoHuHPaDgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8668.eurprd04.prod.outlook.com (2603:10a6:20b:43f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 21:34:20 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 21:34:20 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 27 Mar 2026 17:33:58 -0400
Subject: [PATCH v5 1/7] mux: add devm_mux_control_get_from_np() to get mux
 from child node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-pinctrl-mux-v5-1-d4aec9d62c62@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774647254; l=6472;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=6lZaJD3A/F1rIGObW9t+4MUqh2HqQaormMVYGkjpB44=;
 b=mkg9p/QmqwXdxiEziAi7orZ4HygQjgaN0eOG0Iz2fmRUgOVzRbqFTf9R+AszzvM34Rb4BLc/9
 udEgfxsccRdDe9CO8JjSzpkGs8f9fmDkh3KkaNsWqOobR+InZaVR6JL
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
X-MS-Office365-Filtering-Correlation-Id: 2cf4bb34-4c6a-4c58-f11e-08de8c489af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ql13aySCGJN7Hn6tOaZ0AnpqRLKDEIzhZXbOA1mQVA/kS+bS1dxqEZzhuy1CtgcB7GYnCpZUNWsS/W82ncdCD1gGfF5uD1sryxqdF2KvsbmiQVazWzbIT/Kydn8Zf05x0/WQ9dhjP1g045Kq6xHchJfqmPZHNGF0/rMUkrqCSyHbBMpKoYCgFkNGwylGIYJUS5V+P/RrLFeCeMOvOE/PS6N4FsOITueRZtRp0VDn3xOamb4o2mzHQPIGBEOyq226VhIZFBNTeTZpFVanXBmlbtKf/4GQsleXAVH1lFuVR9qvcVOZdd3Tl7mVJ5MXzCMaCwIbWEBD3P6fjYjn85yeu1uSImUpQ6t4dvMo6wnGzep4CffLPqPNzxPxxZGLtu1eXMtQGVsjJ++Yf+2ZThhVr19QParZ0OoTaQznayBivBF67c4umwGYIVj6BS/xiFHx6oN82tqFqAEvAF3CLjELBVIRyBp9TRe7Bc8nxh8HK5a8qC+l8uapFvus6sYGH+eLHd3JSoycSrt0E6IUFE3qo5nrbECTgthHIyAISFOIKgu2iJ3JDsBuFoEjwoVC/cO/YxkJo/i+YHq0EMmk/CA+Mei0Q06wa6/yCKW9AG2afVOppvMnOpjIY1pHofD000veNPQjmoQcxb45AVi+cOVLA1QGEpeGVfhgVqtrDbmp/tGPesOevWZqVXShyvTmj/9Vi/8/77mLNb6RTz+YuINlFLzdhSCP2HggvEias6iAVRL3BVnv01aq8QoHqxR9vBA2dHEmzfmKrA46rhwC+2COghaJNNpfbtEkHX3PgPKRt20=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE8wOFZzZ1hUQkdOMUNSYmdnRlVXMWFUaVcwdHFPMG14YW1GMTFXK21rY3VH?=
 =?utf-8?B?dHJXU0NvODZOYzB4UWFFWWpHcFBqTHpBZ3BYTnJRNng2TnA4UmJyN2R0Rkpq?=
 =?utf-8?B?eVRZV3JlaVEzU2dhR2w1eG1LL1gwSDA0cWRQMDl0a3B5Q1RVVUdnSXdadktz?=
 =?utf-8?B?OGw1cTMvT3BEb0NMem9QYXB4N2M0Ym9nYXpzTUpJUVNEYThxeG5IWmJoWFRm?=
 =?utf-8?B?RU9RWTkwbkVIYmNIOFVSbzREcyttcDRkNTBtWUFyT3FDVXNXZXdZR3RPcVNv?=
 =?utf-8?B?U25ITEYzeVNWR0ttZjBhUjdqdlArMjlsckZJNXZxcURWbEx4YnNCUWNtOHRo?=
 =?utf-8?B?SkVCSVdoeDZBQ0tWVlYrN0wya1NlQjBiNnMrQit2WTRhUE90OHhGYkVISStp?=
 =?utf-8?B?TmkvY1dFVjhYcmp3V0V0dEN5aXI4M3ZhVGljMUlMRUVlNm52dGxkOHAvYTly?=
 =?utf-8?B?TW9teDlHV3crdHZTL1Q5ckU3RUx6bURJVHlmY1Bzalc0azhKcWhiNHAxbWxw?=
 =?utf-8?B?bHJzVEpYUW5RWHFPN1prRkNSMWVwdjI1UllkWWNCS1pCOVl5SlE4RU9CODZm?=
 =?utf-8?B?bHBBajI4WjlpWVF6Y1NOSnRlRWtVZjU1V2ZWdVpGV1dVTENLelZ3bFdZay9F?=
 =?utf-8?B?dEhBUHhrMHFCVDVhUHAwUDM2TTJmaDkwaWZZT2NhL3pkSWFPK0dvQVpQOXdi?=
 =?utf-8?B?eGxWSzZpQTlONTV0OFVtZ0RnZDFVQ0VMNEhnM0NEaWV5ckw0M2FvVmRBUjFR?=
 =?utf-8?B?bGlXTFVWWjhONUtJbnNmMEFTTlRjUlFzL3dhWDFaQTZIbWJrK3FKbjNWYmlE?=
 =?utf-8?B?NWsyYzBCcnNNS1Z0SUlrQmZTVDQ3UHhLWmd4Z1RndnhVQjdvclFIS25iemZ6?=
 =?utf-8?B?Q3BQT3BTZm52aGJ0NG1Kdk1GUjdoeEJVakV5VUFGSXVpdFYrWnZTRjJwc3BQ?=
 =?utf-8?B?NEpHb0g4Q242RnVjQ3F1dm1KSjE1ZnI1UFB3YWRNaXpsTGNRVFdwTXJHWFpz?=
 =?utf-8?B?aXowNHdlVU1rL2RGRG9mOVpRQ0tmVGFZWTJTZzJ4UkpFU1RoYlZOZTJnbDNP?=
 =?utf-8?B?ZDNpeDZJWnhFN1JucTgyQ2lONFNUWXVydGxHSjVOVkdLcVBYbTYyOElZMDJO?=
 =?utf-8?B?WEVxOUwyQU0wbFJISXZvMmg1U0ErQTBSOWxjVldHaHNmQlh5S013SnMrcU4x?=
 =?utf-8?B?Z0kvUVdkZDUwUit0MjBmckpuVzNUenBzd21qeTJSRU5NSndkVDQ3cmRIYW9r?=
 =?utf-8?B?bW5nYXpDR1VvVk9KN0EvNW1LUVlrc2pyN3R1N3J4aTV5dHJRamE4c0ozZWJK?=
 =?utf-8?B?TVY2UU1qN1lGUEJOU0JHZjdjTVlSOHArc0htQ01nUFFWWDg4R1oyZk1xRi9D?=
 =?utf-8?B?UmM2bW1sQVhodjNEeml5Q3lWTjNHLzl5cGtKcElCckVjanVMQlZSTWtjZENR?=
 =?utf-8?B?Vk9YQlUxRkhrcmVlWHlUN1ZSTFQ1dW5DSGd3aEgrTGx3YUZoL25WMXFxTHha?=
 =?utf-8?B?VEo0ZUJ3RG5lN2l6Z2J5Y3UyaEI3OHJmem9IcWF0WUthQTBwdTFiM05ydVlj?=
 =?utf-8?B?TUx1cEtXaTc2c3l6c1ZINisrdkNORE9OS25yczBGaW1YaDNOR1ZYaWVaR3c0?=
 =?utf-8?B?dnFRU0o1QmcwN0dxaXF5eVJoM1U0a05IekFtMkZDUWhVbm1IMDMvanYyckM5?=
 =?utf-8?B?M3laa3JXK1c1UjJaVmNBWmQyQ0Jxc3ZzYmNnNC9jeXNneEVZd0pvbVY2YU9R?=
 =?utf-8?B?clEzbkp6ajhjTXBKVGM1V2tGV1pJU2xjc2ZhYzNyQzl1ZE1ZTlkwcXUyd3Zt?=
 =?utf-8?B?TnB5cnZ3Z0FqWk84UlphbitORndFT2ZCOWtGb3psZGkwWnZ6QjZxUTdFVXZo?=
 =?utf-8?B?bm1qcmk5bXlpaGdFZ2NVSTU2dHN2VStXb3pUTWsyeVdRYjZFS2VpanlvaXBQ?=
 =?utf-8?B?T3FvdE1LOU10TkJ3RFZPOHFFU0wyeFZERDRCdHlVZDBwcW5ZRGE1OHFrQzZE?=
 =?utf-8?B?WVBSL2hGTjdLd0dhRWk5Yk9iMWRmVCtYeW9lbkc2VEppN1l1MkpYazJYQ2pT?=
 =?utf-8?B?RmZ4VzVzY1JHTllCTG5hdnBZRno4SmtoV1VsRWhTSnZPSjJ6TEgzL0dGVXVs?=
 =?utf-8?B?WkNGbUVxUnVjQ0hOQWpxZE5jbmJZRGVXOXBJMEdEaUYrbWRGU3ZaN3lUeEVI?=
 =?utf-8?B?WU9sY1d6TURkWllWUjJDa3ZvWDFwRk9BdktsVDdEUnlZUEpDUjA5cjJMalUr?=
 =?utf-8?B?c29uVXJpdGlJeEYrRnJObjc2OXNPZTgwMVNzUE1sV1IyYndyWnlhbXYrQzVC?=
 =?utf-8?Q?Gq/eQlGvAv0/ojQxsD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf4bb34-4c6a-4c58-f11e-08de8c489af4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 21:34:19.9965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkYz5Lpc7xGqzdAhlg7Vu2d4vgo77RX/2jXZMfxhxUxDKWAyKGXLFyFU/KEjoKb71pHitBaKB8PUfNpy5zSYwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8668
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34328-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: AA7E834BC00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add new API devm_mux_control_get_from_np() to retrieve a mux control from
a specified child device node.

Make devm_mux_control_get() call devm_mux_control_get_from_np() with a NULL
node parameter, which defaults to using the device's own of_node.

Support the following DT schema:

pinctrl@0 {
    uart-func {
            mux-state = <&mux_chip 0>;
    };

    spi-func {
            mux-state = <&mux_chip 1>;
    };
};

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v4
- none
---
 drivers/mux/core.c           | 40 ++++++++++++++++++++++++----------------
 include/linux/mux/consumer.h | 16 ++++++++++++----
 2 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index a3840fe0995fe0125432d34edd8ab0f2cd1a6e9a..bdd959389b4ee1b0b8a7367fadf2c148c8f2f0b1 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -522,13 +522,15 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
  * @mux_name: The name identifying the mux-control.
  * @state: Pointer to where the requested state is returned, or NULL when
  *         the required multiplexer states are handled by other means.
+ * @node: the device nodes, use dev->of_node if it is NULL.
  *
  * Return: A pointer to the mux-control, or an ERR_PTR with a negative errno.
  */
 static struct mux_control *mux_get(struct device *dev, const char *mux_name,
-				   unsigned int *state)
+				   unsigned int *state,
+				   struct device_node *node)
 {
-	struct device_node *np = dev->of_node;
+	struct device_node *np = node ? node : dev->of_node;
 	struct of_phandle_args args;
 	struct mux_chip *mux_chip;
 	unsigned int controller;
@@ -617,7 +619,7 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
  */
 struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
 {
-	return mux_get(dev, mux_name, NULL);
+	return mux_get(dev, mux_name, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(mux_control_get);
 
@@ -641,15 +643,17 @@ static void devm_mux_control_release(struct device *dev, void *res)
 }
 
 /**
- * devm_mux_control_get() - Get the mux-control for a device, with resource
- *			    management.
+ * devm_mux_control_get_from_np() - Get the mux-control for a device, with
+ *				    resource management.
  * @dev: The device that needs a mux-control.
  * @mux_name: The name identifying the mux-control.
+ * @np: the device nodes, use dev->of_node if it is NULL.
  *
  * Return: Pointer to the mux-control, or an ERR_PTR with a negative errno.
  */
-struct mux_control *devm_mux_control_get(struct device *dev,
-					 const char *mux_name)
+struct mux_control *
+devm_mux_control_get_from_np(struct device *dev, const char *mux_name,
+			     struct device_node *np)
 {
 	struct mux_control **ptr, *mux;
 
@@ -668,16 +672,18 @@ struct mux_control *devm_mux_control_get(struct device *dev,
 
 	return mux;
 }
-EXPORT_SYMBOL_GPL(devm_mux_control_get);
+EXPORT_SYMBOL_GPL(devm_mux_control_get_from_np);
 
 /*
  * mux_state_get() - Get the mux-state for a device.
  * @dev: The device that needs a mux-state.
  * @mux_name: The name identifying the mux-state.
+ * @np: the device nodes, use dev->of_node if it is NULL.
  *
  * Return: A pointer to the mux-state, or an ERR_PTR with a negative errno.
  */
-static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
+static struct mux_state *
+mux_state_get(struct device *dev, const char *mux_name, struct device_node *np)
 {
 	struct mux_state *mstate;
 
@@ -685,7 +691,7 @@ static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
 	if (!mstate)
 		return ERR_PTR(-ENOMEM);
 
-	mstate->mux = mux_get(dev, mux_name, &mstate->state);
+	mstate->mux = mux_get(dev, mux_name, &mstate->state, np);
 	if (IS_ERR(mstate->mux)) {
 		int err = PTR_ERR(mstate->mux);
 
@@ -716,15 +722,17 @@ static void devm_mux_state_release(struct device *dev, void *res)
 }
 
 /**
- * devm_mux_state_get() - Get the mux-state for a device, with resource
- *			  management.
+ * devm_mux_state_get_from_np() - Get the mux-state for a device, with resource
+ *				  management.
  * @dev: The device that needs a mux-control.
  * @mux_name: The name identifying the mux-control.
+ * @np: the device nodes, use dev->of_node if it is NULL.
  *
  * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
  */
-struct mux_state *devm_mux_state_get(struct device *dev,
-				     const char *mux_name)
+struct mux_state *
+devm_mux_state_get_from_np(struct device *dev, const char *mux_name,
+			   struct device_node *np)
 {
 	struct mux_state **ptr, *mstate;
 
@@ -732,7 +740,7 @@ struct mux_state *devm_mux_state_get(struct device *dev,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	mstate = mux_state_get(dev, mux_name);
+	mstate = mux_state_get(dev, mux_name, np);
 	if (IS_ERR(mstate)) {
 		devres_free(ptr);
 		return mstate;
@@ -743,7 +751,7 @@ struct mux_state *devm_mux_state_get(struct device *dev,
 
 	return mstate;
 }
-EXPORT_SYMBOL_GPL(devm_mux_state_get);
+EXPORT_SYMBOL_GPL(devm_mux_state_get_from_np);
 
 /*
  * Using subsys_initcall instead of module_init here to try to ensure - for
diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
index 2e25c838f8312532040441ee618424b76378aad7..6300e091035323dd6158d52a55a109d43ef120aa 100644
--- a/include/linux/mux/consumer.h
+++ b/include/linux/mux/consumer.h
@@ -56,9 +56,17 @@ int mux_state_deselect(struct mux_state *mstate);
 struct mux_control *mux_control_get(struct device *dev, const char *mux_name);
 void mux_control_put(struct mux_control *mux);
 
-struct mux_control *devm_mux_control_get(struct device *dev,
-					 const char *mux_name);
-struct mux_state *devm_mux_state_get(struct device *dev,
-				     const char *mux_name);
+struct mux_control *
+devm_mux_control_get_from_np(struct device *dev, const char *mux_name,
+			     struct device_node *np);
+
+#define devm_mux_control_get(dev, mux_name)		\
+	devm_mux_control_get_from_np(dev, mux_name, NULL)
+
+struct mux_state *
+devm_mux_state_get_from_np(struct device *dev, const char *mux_name,
+			   struct device_node *np);
+#define devm_mux_state_get(dev, mux_name)		\
+	devm_mux_state_get_from_np(dev, mux_name, NULL)
 
 #endif /* _LINUX_MUX_CONSUMER_H */

-- 
2.43.0


