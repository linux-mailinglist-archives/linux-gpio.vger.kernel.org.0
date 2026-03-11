Return-Path: <linux-gpio+bounces-33173-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDjJG/m9sWmxEwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33173-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:09:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C503026912D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CA503145B5B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76E7336EC5;
	Wed, 11 Mar 2026 19:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dysYBlVz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013007.outbound.protection.outlook.com [40.107.162.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2A8345CDD;
	Wed, 11 Mar 2026 19:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773256119; cv=fail; b=QjXvh36EY6JhyNq98JWJx9VMosR/8PzEzFzVk/e4vbY0aBCuhItm0JBT4zzSdA3apPCGjs3WmU8703i6cZqlys0H0wq+bR1QBPgQcYniTcAirOJ5s1lHIC4KxuK0aQ6gbAxO1+f9wqPvOhUIznHw9JbgLp+ujjqTogAtyY4RDeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773256119; c=relaxed/simple;
	bh=IhKgCmw3QsoD0onh9KozMt/HEJ+UCA15T6uI3V+VNKU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hu26p6MIURwUeXKRh2Rwg11HQGC2RsDHgKIJva2glV1DT45NXDHEYLfRrOHKzeoSisz/LedbSzEQeIgpVSqIqiGa9WoLQVan0VRZymbdNU26iDREDFDu3qsWnafg0V0BfjCcaTOM857/dYN6xnMnetv1w4sg7sD0FQtRph1on7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dysYBlVz; arc=fail smtp.client-ip=40.107.162.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCui+LBT52XcmpdgGvPofrsho40EJWhkMSLsrMIIBGNEY8WYfPfJ+XhTwFUfrzAx98FHVLMdDUJaEN8KJReM7XLQPCTaBUSuNCzU24O3hHkibTbU8/D7qi5lWeTkTCCvzDj4I1jtMeQTdDUJjgtZfvyhmMEn0OZgvLRVWyf3xj+gRKsy6XgWFcuj+Deyck+GHV+yZ+I0zpOlRSH8hRl9wS2BWISwY2udrNm+gQIdfSstzF5ZgUh0q7XVghA7sEju+G5su9b6+I+oXlmnssMDEJhzrO/Zw538tZ3m/uZhU64RN/lSv14YRBoUNUMOn30MqEIglvHoFNY4b8qJKv6yiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeH68k6+zZsVimnQEb3fuPQG5MVeDXLQDceNQ1jYFoM=;
 b=pnqfQwj2ppfLAZSyQMqnkx3Bb9nZTk+r9E0LpJu8I2kzoUnb9D3STghG1jct9huAzJjG4P3Z2s4NzC4BMvc1BC+yOPS+WBFVR2Pik12NKgjjEtLuvQr4Rn8T55HNdZ87lxXljKLqQOHbGL5alBfH1oSHxR+oNRTTqkdrcky5PZhF8U0diNBBGk9pfmnkPyZIdeerAe7yKwBOeEkFaY9tz8PhTg7xPFnnlQy7Dy31BY+e9Q/r6/XbYoQBwmVu7QhXpL4DiaQ8fsglVBmTJ+pR5IpLrJZhl37Zu4zQu62w8akgtiUxiOf5tZXq3+2hRbibG3umoae9zfhwzO4H4eDfSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeH68k6+zZsVimnQEb3fuPQG5MVeDXLQDceNQ1jYFoM=;
 b=dysYBlVz0G6Zm/qb0Iv8UxsEq43ZQg3o5kgbPWUscjEr5EcILLrnDKOPtgaWw7vKaU/i/VBA2VfR9OrhWVuJMsQeEVEmpZuPAYQaAWRhSHcs6YLig7Hjz+MCkCXuldRoHZ1Nuw0ibql7neTUYg/iQuOYAE7JNOmLNYzYM8vwWLazAfbhDIDiUE3g6T5eLK3B58OtJmEIya0p8pZ5cEXIcAWu5iXqdN/J+AeNHVgQ+gD+zus1CWBJmRVb4FSQ6B0ac2f6oX46wypwGR30qvDn8k1Ech4zk7n7LdWqUJoer3KSxMwc96HEQLwklC0HPUiZWwdnhHYg7ldnYBKm6s4Q8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9121.eurprd04.prod.outlook.com (2603:10a6:102:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 19:08:32 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Wed, 11 Mar 2026
 19:08:32 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Mar 2026 15:08:12 -0400
Subject: [PATCH v3 3/7] pinctrl: pinctrl-generic: add
 __pinctrl_generic_pins_function_dt_node_to_map()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-pinctrl-mux-v3-3-236b1c17bf9b@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773256101; l=6277;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=IhKgCmw3QsoD0onh9KozMt/HEJ+UCA15T6uI3V+VNKU=;
 b=rJEY/jiLZgWFDmvvd+C7T/DgggZ53O2b/GGnLiIe7bWzswnLwKOkS/Jj+mbwuexzmEyKuSAxM
 J8N60WTH2MiBhQ7wrdWvkIaLxCNbBjvmbWuT8F67Vru3caQVPzWjp0o
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
X-MS-Office365-Filtering-Correlation-Id: bea89387-e106-4020-6381-08de7fa196a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|19092799006|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gz8PinHcVJBHUImasJjSXV1kUPCDSRClg9iUJ/AKYnsNXg4QNe5osBYH/QDR2uOWKuQmMt3zYQGMopjTdMX0e5zwWlWWVscIoWre2z3IgODC9WCZefgzap5CGoQKr96avjag+FG7CQYHRrXMaWs4z1Moke3AmmnXAH5VxQKn9hKS3dk+G3OzQCkW60xKqft7QuhBBSu9c8dau6lCByQhrbShffYKYE910QL++XY6TXQe+aEfClkcvzMtP3QUmOPIoR1GxoT0xPMMm9ZbgXTzp29LgqMs1qhTIg3nixLi4oOc3/EotleIon3X9H0L0H8eEKDUQf85O8qFQAyMZkPJHa9k2u4qO1c0WBWYFTtn3v3lXikJmPnL6Ez7XnTLu1VzQGTTJy2uPoKmEAb4BYnXnw7v9vq709ZBr97Y+bwHW4b2TVQqgQJy7diB82VhgQ0xQklj14rdUH650t2oY9DC/vNnjCYvL1fRpD3bc1Lh1hIXE9+I6pDWkMQNa5xj2nO1HP0S8V+714ts9NnkCwuLUrp0lK8E+T+hNIQDWw/CC3Yd2sSQyXyGmBgKabe6ltepn9ojKt4HyLqGEMlt69E+c6trrASk+AOCAjJrzCIX/6ZzJvA9q/pcuhoj6ytA4Y0Sxg2lfrCsnWsrHClPSgD1YjI8CvGE6jj8H5Day/SA0XU9ybiK59gooA9JCywrhQorHBnsE4Ov/uqkkDbec+PO6ZZrEJr6mE92C4NVG0utrgEmOgQIwNCcoPWHKuKIGR77d54lIKjquzAbhZ1haa7auY3XhuNsw4tPc9+pLawXbdA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(19092799006)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YU9tSWZJeEE1TXQ0VW9UVkVDcUt4SDkzdEIvS2p2RVhaMit6U2kxanBGenJ6?=
 =?utf-8?B?VnNkNlZSMytsM1Z6alRFbnNvNFdzUEdZNGxPZmU1WWVxWjdid0g3NGhiR3gr?=
 =?utf-8?B?Vjh4bVNYM2poQzlwMXdJOWsxSG9xbDdnemVmRXdQd01xdkFDN1NNNU9mZ2w1?=
 =?utf-8?B?dVFLWlh4V0l5aFpLdHJRVzRDZHg3UjdxbFhBYkN2K3EwL3ZrTUx1RlFad3V0?=
 =?utf-8?B?c1dnZmhEMWh0QzFXUEJYazk2bHNWVDNLaWlmMTZUYytTME5pZEdSWjVBRjUy?=
 =?utf-8?B?Lzg4Q0Y2UFFkVnVabmFPNEVVTXlNRnF2cHcxVnVIZWZnTkxtSGtIUS9Kb3g1?=
 =?utf-8?B?N3JVVVh1Ky8zeGlmcFJFT3E3QzB1QmpZUEp1WUd2dlpYM21DZTR3cnIyQUhz?=
 =?utf-8?B?NEt2b2JHUllIV2huNlY3M3dHeEUrZW43L1RzMnIxMFVUM2ZGN0F0a3lscTA0?=
 =?utf-8?B?MFF1Tmp6NEFSQ3RLS3dWZVVIVFVvU2lZdmsySlVjanphRGtKOEpyTGgrcTFK?=
 =?utf-8?B?KzBJZFVzZUQ5OHR4L1VpYTdvSGwxU3Z5QjNKc3dGWkZrc0RzQUE4N3FBWDhK?=
 =?utf-8?B?UHl0TXNmMm1nUlcxMm5WUFNhSjIwWHNDM1FiUldSTE5ESWR0T005QXZDWHBh?=
 =?utf-8?B?MWNnZlFIckF3TlNNUnV2cjJ2RXRFRUhPeTBUek5DbVNoZFk2KzF0cmhtMGFl?=
 =?utf-8?B?Q3A2YXNLT3Z6bjhRKzlOcnpKSjkvbVU5R1pMa3RwMXFyMHBQd045WXlxNXQ2?=
 =?utf-8?B?bHdOeU9IQ1F4N0NITGFsTDliVzN3MURxYmVXVUZDSThocHp0MGFVTGVybzc5?=
 =?utf-8?B?dUp6MWhiaCszR3lXR2FiSmhRK1N6Y2NkLzQyekIrSkFUNTZLMVBpL3VGTjdC?=
 =?utf-8?B?WWdxcXpwSW42NVR1SEx4QnNKMTE1SmU2ZDZpRFRIemwwQjZheGFEMjF0SWZj?=
 =?utf-8?B?Q3NVKy9vV2VRa0pSVzFsQlVwMlZWck9DTkpCaC9tN0tHcThLcTRnNTZaS2Rk?=
 =?utf-8?B?RFNxQXROanpCNURvSXd4L3cvL05QYktxcmhhK0d1N2UzTGZYT1hnWnRZakI1?=
 =?utf-8?B?dTcxcHJueDBCRkc5R0lweGtoRGQvQXRhc2puY1RXMVdFQWI5U2l3Z28rMlBP?=
 =?utf-8?B?T0plZFpaRnNrSUV0am1sY212ZHUwOTFlYnlpOTNoOS9BYXViRGhJWHd6bHVM?=
 =?utf-8?B?NXpsMllpT3hjdm9EVHo1R1prSTE5dmVKWUxiV3h5eTZMVGhGUVBwK0dYMkli?=
 =?utf-8?B?OGRFaTNIM2NCWVp6SzFOZ3NyTzJ4cmdtOGwrNmcvWk1BcHI1SVNzS2s3dFYw?=
 =?utf-8?B?SGVBemx0VXRETisvY3VPcVBWWGpsOTdnZkRsOXR0RzRaRGp5S0ZvNDhYRkdE?=
 =?utf-8?B?K1ZzR2FjMnJkaVJnaVFTVEhLS2RnWE0zN0NVU1ByZVFEQjNxMXRXK3dicHN3?=
 =?utf-8?B?ajJVUlpoajZmM29OQzR3OFNxWGxONHM5Y1AvOGdGT2JjeTYxU2Y4Z1JaclJq?=
 =?utf-8?B?TlZtckRZQ2dQRjlPanJtTUJUdlRrVkQ0cmVHOTBwam9MbHJNSXY3Y1dpZXZn?=
 =?utf-8?B?dm5FOGNVRDJTQllhOTVhVEFFVlU5MkJjdnd4V2VFZHJvQkxlQXRlbHl3WVpi?=
 =?utf-8?B?cXE4cGh6ZjFZL0pNdDJUMk1GUlUzR1ozcFRlTzJrcmFEWmFnV3BwRDk0Nks1?=
 =?utf-8?B?TzFUL1p6ajlacHNtb2lDSFFtVkExQVZIcHp2bm9DVHRJWHgxR1dXaE1STzNK?=
 =?utf-8?B?WnVvSzhJV09qZUMvZTI4S2hUZmthQ1BnZjVqQ2JESVRod2c0U21ZZUNsenhU?=
 =?utf-8?B?UUI4clpjaWZmcUVzRFhHbnVac1JuSmRhbHJXT1BHSVdIWXQwUXN2TWVIeEhZ?=
 =?utf-8?B?b29YSHd0UHAzd2x6VGFmUjRMcE5xR1ZUeVdqcmUyZDViWktTUHJVODJma2x3?=
 =?utf-8?B?VDVndktBVkovN2x3cGJkT2xoSmZOR2laWDZVaXIwK1BheTc0a3hRSjJvMmdR?=
 =?utf-8?B?VStLNVJmSjNhRm5nKyt2aXRoM0dReTl2YUVyTUdiWmt0ME5uM2pETHRKVDlP?=
 =?utf-8?B?SVhTa1EwdG13UkVtb052WmNSLzVZM3FoSm9hK3FCZUZKSThWaFlRK0pOZEJQ?=
 =?utf-8?B?V3JSTERiVXdrZmQ4K1RqM2F4MzlOdXpCRTh5cG5lOHExY28xMDJna0NacG1y?=
 =?utf-8?B?R21Lc2dZMHNoaTJhZ3pROGxWcE5pNWlLcHNBRU1Xa090NFR1eUJqQkF4UTVS?=
 =?utf-8?B?QmtkUTk2REh5Y0xRZ0QxYUxtZGQ1VTFTWHpIM3hSMEJzR0x4emlOUmVsUUdR?=
 =?utf-8?B?eGRUampYVGlIZkQwTDZiZkRzVG1SbTNjVUVWZ204VFBpeU11MEM0QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea89387-e106-4020-6381-08de7fa196a1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 19:08:32.8067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pL5GiIXPy9zosWtit87pv3FVeq/m9c8GZHuvfum6ouFJAbCpJ1tMZDNxQGM+LI5bib7vsjNoaKBiCQ1M+mEdpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9121
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33173-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C503026912D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce __pinctrl_generic_pins_function_dt_node_to_map() to allow
passing private data and skip_npins to pinmux_generic_add_function().

The 'skip_npins' to skip parse pins in dts because on boards MUX control
chip switch the whole group together, so needn't handle each pins.

Keep pinctrl_generic_pins_function_dt_node_to_map() as a wrapper
calling the new helper with a NULL argument to preserve backward
compatibility.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v3
- new patch
---
 drivers/pinctrl/pinconf.h         | 21 ++++++++++++++++----
 drivers/pinctrl/pinctrl-generic.c | 41 +++++++++++++++++++++++----------------
 2 files changed, 41 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index 2880adef476e68950ffdd540ea42cdee6a16ec27..d6d22c088a144de0180314826b8cb8c528290970 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -162,10 +162,23 @@ pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
 #endif
 
 #if defined(CONFIG_GENERIC_PINCTRL) && defined (CONFIG_OF)
-int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
-						 struct device_node *np,
-						 struct pinctrl_map **maps,
-						 unsigned int *num_maps);
+int __pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
+						   struct device_node *np,
+						   struct pinctrl_map **maps,
+						   unsigned int *num_maps,
+						   void *func_data,
+						   bool skip_npins);
+static inline int
+pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
+					     struct device_node *np,
+					     struct pinctrl_map **maps,
+					     unsigned int *num_maps)
+{
+	return __pinctrl_generic_pins_function_dt_node_to_map(pctldev, np, maps,
+							      num_maps, NULL,
+							      false);
+}
+
 #else
 static inline int
 pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
index efb39c6a670331775855efdc8566102b5c6202ef..dc575fbcc7103bebded49d8268764531f349a8c9 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -24,21 +24,24 @@ static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *p
 							   unsigned int *num_maps,
 							   unsigned int *num_reserved_maps,
 							   const char **group_names,
-							   unsigned int ngroups)
+							   unsigned int ngroups,
+							   bool skip_npins)
 {
 	struct device *dev = pctldev->dev;
 	const char **functions;
 	const char *group_name;
 	unsigned long *configs;
 	unsigned int num_configs, pin, *pins;
-	int npins, ret, reserve = 1;
+	int npins = 0, ret, reserve = 1;
 
-	npins = of_property_count_u32_elems(np, "pins");
+	if (!skip_npins) {
+		npins = of_property_count_u32_elems(np, "pins");
 
-	if (npins < 1) {
-		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
-			parent, np, npins);
-		return npins;
+		if (npins < 1) {
+			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
+				parent, np, npins);
+			return npins;
+		}
 	}
 
 	group_name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", parent, np);
@@ -110,10 +113,12 @@ static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *p
  * and functions, create them in addition to parsing pinconf properties and
  * adding mappings.
  */
-int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
-						 struct device_node *np,
-						 struct pinctrl_map **maps,
-						 unsigned int *num_maps)
+int __pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
+						   struct device_node *np,
+						   struct pinctrl_map **maps,
+						   unsigned int *num_maps,
+						   void *func_data,
+						   bool skip_npins)
 {
 	struct device *dev = pctldev->dev;
 	struct device_node *child_np;
@@ -129,7 +134,7 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 	 * Check if this is actually the pins node, or a parent containing
 	 * multiple pins nodes.
 	 */
-	if (!of_property_present(np, "pins"))
+	if (!of_property_present(np, "pins") && !skip_npins)
 		goto parent;
 
 	group_names = devm_kcalloc(dev, 1, sizeof(*group_names), GFP_KERNEL);
@@ -140,13 +145,14 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 							      maps, num_maps,
 							      &num_reserved_maps,
 							      group_names,
-							      ngroups);
+							      ngroups,
+							      skip_npins);
 	if (ret) {
 		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
 		return dev_err_probe(dev, ret, "error figuring out mappings for %s\n", np->name);
 	}
 
-	ret = pinmux_generic_add_function(pctldev, np->name, group_names, 1, NULL);
+	ret = pinmux_generic_add_function(pctldev, np->name, group_names, 1, func_data);
 	if (ret < 0) {
 		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
 		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
@@ -168,7 +174,8 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 								      maps, num_maps,
 								      &num_reserved_maps,
 								      group_names,
-								      ngroups);
+								      ngroups,
+								      skip_npins);
 		if (ret) {
 			pinctrl_utils_free_map(pctldev, *maps, *num_maps);
 			return dev_err_probe(dev, ret, "error figuring out mappings for %s\n",
@@ -178,7 +185,7 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 		ngroups++;
 	}
 
-	ret = pinmux_generic_add_function(pctldev, np->name, group_names, ngroups, NULL);
+	ret = pinmux_generic_add_function(pctldev, np->name, group_names, ngroups, func_data);
 	if (ret < 0) {
 		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
 		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
@@ -186,4 +193,4 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(pinctrl_generic_pins_function_dt_node_to_map);
+EXPORT_SYMBOL_GPL(__pinctrl_generic_pins_function_dt_node_to_map);

-- 
2.43.0


