Return-Path: <linux-gpio+bounces-31563-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN60Ea1li2kMUQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31563-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:06:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7695411D8FB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB519304B748
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 17:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CAA32ABF6;
	Tue, 10 Feb 2026 17:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OiN11tUs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ACD32ABD0;
	Tue, 10 Feb 2026 17:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743165; cv=fail; b=UdMmBjsW9Z3SXu8CnPiDV5oOm2Yf/XpnLORw0M9JrWwmhUXXfrPvEFSWcAAHPrFYFOa6ssRTtnEJ+UAv6sqkL7fRbCtbiokmsV4/5uorfLXCyyv1vCEa2A+PXWGIacXt7ulBoAurewRtsjeLIvI521/Ldj4WBP/A3zmzkpySjOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743165; c=relaxed/simple;
	bh=cGobakO6CsA1ExL18AiFrMqP2HAld54z5WFCDQwfoUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pZ3t+qaGONokEkCzI0FODMvlzweCCFnnG7Gjgkyr5OG9QLkqDVcdliUDY6QfI6WjekG1L6pIEqzB8K4hEbHX+vYe3xLIDvbOVMJVU9zWZkwIKmHp/kE3p8JNfpSrUvgPYLwT4LGf3Spai8SlItyGlN81XW+QapMLEY5PA6YIV6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OiN11tUs; arc=fail smtp.client-ip=40.107.159.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmRpRk06Y1NlPd3XRbqhmX/MEvXUWpyl0J3D51XsLRF2BdT9owzBsHNWs8TCjHGFV/S0PKzTV42Ime8Awd27rkbM63epSI/sjQbu+9AN/zfGoQDXe8cZhMot/8AefIN4N2wFpo1JPToxtuVrujFKNVjslpq5nf52PEowmoUuw2jDfha1UM4BmbR4U0QOaXtY7hfzVn107XgrXzO9HqUVKL5oGlm9C60rj1ttezNMGEz8eRDScmyX3C3qrNMyo/yJMBQFuTY4tiFzV3OBk2A/af9OZWXt7kN4ZNobRr8O9t5KcXUP47emVDHfaZqBJtTYLkSNY5UuVN49uJT/ntH4/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3Z6Sl1hmnAVNbH8POuWCNQSscOH1M9kbu7yanKFppU=;
 b=LqdAl1Qgbb43UOwD8BR+haR3eWEvXYaq3H0IYWwi23tmODykmEPBRlZ3wPYtpRusHwY8f5qwQqwbKU1bOcaMAHFakZuSpRiWXK8YVoEJk/pPrFrDCzAq5kHdJhBOakdladqOGzHKFMXHQCj+AcVhX2zxFSKMbogAkEDKmvg0b29a6QJAqd9B4v3CjqEAc5xo/46LHJgwuZfb3LPwOZQsjbP/+IQdHPFep2HlWnvNtr/UIt2HIqcaSxf8ezegT8ZuFql2YBwsF4k9VILhxdDoj1BqMdCwIvEKcQQvB4IbAvEWzxdXUpVQDsilUqUaOhzKs/dLgNnnbb4M5+/i+ehmHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3Z6Sl1hmnAVNbH8POuWCNQSscOH1M9kbu7yanKFppU=;
 b=OiN11tUsFw7yhB0PQpQksSjEAsJlZFmuZ7tL4GkFEDmkmRjV4GunYkDl5OcGG4evK0etswSA+aJ/K/tkRJ/ImPB4MGAkIovtHpWWfjUB6uHgGM2zfGto/Byq6HsNO2MZhnIucOYVVsJ/beU5A/ukmdsmvH2dXybmj0m9o5bJLjEvHU1YwpeuifxULFypQaxSZFrNGYZ5yc8iE6T4Q6cjwoi3epSrCZtL3ngwjVh7kRmg/eXA1KM02O64SrrZT5HrepXihgEFbw77YXN6AxM72HBXLEx4mdhgh/I+fqBknITeb29Zd/8MXV/0fqxkqb4FuAHJfziHuFCYME5nn30ZHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DB9PR04MB8362.eurprd04.prod.outlook.com (2603:10a6:10:241::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:05:59 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 17:05:59 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-imx@nxp.com,
	arnaud.pouliquen@foss.st.com
Subject: [PATCH v7 4/4] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Tue, 10 Feb 2026 11:04:39 -0600
Message-ID: <20260210170439.406513-6-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210170439.406513-1-shenwei.wang@nxp.com>
References: <20260210170439.406513-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH1PEPF000132FC.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::2d) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DB9PR04MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 710d16fb-d289-4ec6-3934-08de68c6a99a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BTU+q9U1jKe6WYwSM0bThVcuHUAMMzzH1S//lmHmjIzyh9bVrQ6AEE72XUB2?=
 =?us-ascii?Q?ShJj+dn0Apt3dc6yd1hBe3uRVAlVM+51yvnMNvymMxseEyDGGtgwgmtNwMdg?=
 =?us-ascii?Q?+GUWg3DYpsbSQF/H+yqhzYmFahqSRPHy1Oa0cpT0epxyvJ9nghKvuDPpAtAC?=
 =?us-ascii?Q?Py50a5FfoLm6aG3/XUV3i2a/F64CdyB9hi5Rfja53o0TPtoqLUQWok/fuxJy?=
 =?us-ascii?Q?A10mF73fRlM8Q+1BwdeZKzjh18gKu6eMzil6RzNJTvML8k767Y4O61aFLxq3?=
 =?us-ascii?Q?FYlw1A+c1l8j49A+WbbOkQNx0ABX4VK2JFvDw+bL4pVlgfuo8w+q+BbHK+lv?=
 =?us-ascii?Q?l8aeR7eVAUNEbhzDIespCirpY2N15I6twT6p9V0Z0zs6vhfi2xQX15wmaxwm?=
 =?us-ascii?Q?w1u4DcUUzEWfXGynQQ0YAnhdBPX+r0rBJvfZ177CG58n80E9miUYZtH0ROA7?=
 =?us-ascii?Q?8ZNpcdISEO4+bBBx6RpmvmpYDgkyCbXsW+V1AgDMepV5Q4/WBZK+XUc94cpH?=
 =?us-ascii?Q?XjOLu+DSekZbkyiObJ7hbPczC8fWgNb32K8hMMgBSF+qnU2D1lcSwdCA5b1D?=
 =?us-ascii?Q?z5J4CiTC4xC9f2Q+fiJISLgAIAE5U1FuC+hCDKI9FxPBCrNGw1LtiTJ1XP82?=
 =?us-ascii?Q?5/vPvdOd0u8pb700/SqxXtpJ0LGSoeg3a9SC3GNSdp9bqNeDWQuPoxPUDpR+?=
 =?us-ascii?Q?OVOkICfo6UpOSQ8/pcoiQEbukkH07H55hmicOJXlJwg7yY/I+6N722w/Tb/g?=
 =?us-ascii?Q?PuZlu93MhRD51MNVneCFTgRJR1BeMnFIgozurlp+1hUgDcLD4bxrUPJrTcjN?=
 =?us-ascii?Q?b2jz8N4OxZ/VNgEMMQ+rfhKcodnO8XLlA8IAe8ioX4ocnj/YllB7H1HPRPkj?=
 =?us-ascii?Q?HNy7qpf2VrJNS5DncIXMdJcTCj4cJCcnblpj7qWqPUD7b6wk5J1hSpZWozhb?=
 =?us-ascii?Q?7X4n70uGKS6LE3Mw1A+oRsBsBa+Bphn/YQOv6+eKys4ouUUAxlDmH/FHgvt9?=
 =?us-ascii?Q?Z7PJJR3YrKKKqOSEWuCF4c6U6un5QAR2HLmmhFZAne9VPCDsEXVmWK29rKpv?=
 =?us-ascii?Q?41iqH3dZDHdrS9rrHo22yelCDXV8C/DW+H9y97sXWHFR5NGHnlwfMBFUfGVK?=
 =?us-ascii?Q?66u/umw7PhS4q7gVFKLDClzc6fRmFI3Wvmwyjecs0DaFVrRV86BwoLcLA7CP?=
 =?us-ascii?Q?yxdkd3LNEcGawYMMXH514LaN2R40mTS33KM9DPcktNYZOUCjNPZHtyNTCejN?=
 =?us-ascii?Q?tQ/kUwDPGvFF+niKEI5Oai2xKL7G0WQ7P8xC0Tf/CEO8gxUqEvtmVXLf1BYO?=
 =?us-ascii?Q?Vi7KfADlCBJn25eLwz21kibMJ8AlbSkVBvQreTQTPRkrcR2xuTEqyfbtWs2F?=
 =?us-ascii?Q?aD5lEvPKY7HonaJzNNJxtos+bQ9F3EvTnO69gtgTQ6wT8X48C9X2sPDSHLCd?=
 =?us-ascii?Q?zgKGQ/DWsIsQ9QfgcZ6Z6kgbHCbtLUm1foQv6Sdin4cjrOnoLxNhuVP5KTvI?=
 =?us-ascii?Q?Uq6sNoc5PPaS9JJZrkARmV8J0TdBxDTuoaop4Q8w+liYXSAVOK7F8TTSkON/?=
 =?us-ascii?Q?ZU8ghnx4ijVQraZB8gbFfJwzy5+ytndvtUvvowovKE+IO7LAvqnQB7ZIA44P?=
 =?us-ascii?Q?t3dW2CVFyv7J+slea1kh+Yvg7vfFB3hbfcRvki60SJAV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PSqBAZ/jVb/Vn3xy4jg0BHrfmlukxktvLnndwC8dQJvk5/SN1cItFaiv0MMb?=
 =?us-ascii?Q?P+QV8bk2yk0u2x4NLrWVBkiXSQtcHQqiSXFt8cjh0fJuYEoQJfe32iGq+zZO?=
 =?us-ascii?Q?rIeBZTc19n5IL+UIuzHFIOZSbYN5xswImvhxMEkLr4L4V4eA7CftxzdTx4D+?=
 =?us-ascii?Q?BArAnINbl6C1s972r5ew4MpgZuW1qDgPY1wSKomLl+Rw8TtUcGQbVp/GY8Ji?=
 =?us-ascii?Q?+E5upsclpa4VkFK5+sdHUkb8mfJzjXgdp3vnxtfrsMbPEmvkJExMJCEPPoso?=
 =?us-ascii?Q?iQIgYldSRddbW8MiTai6Smx3lNR4Xtf6AYCeeRz2cx3ZWQuUA3GzKE/Z+78p?=
 =?us-ascii?Q?qBuS1J66g6fhxKbXBiHtvQdQ0Ayb9n1kQotZyesyocSmYTYmlG4vJeTyuFLk?=
 =?us-ascii?Q?ECK0iSUYLLugLMIN0yvxLak4U3kwNluz0gLbIawvtWyJzC8MZXUEWMdF9JfH?=
 =?us-ascii?Q?Jm9e6M+bmb15F2KNpoIuyUfj0XePDt+b2Qq82g/HmgfaXLOVshcDZMJlGJjW?=
 =?us-ascii?Q?AH/Dcwy0qScNPkqkULM7tMICQPPo2J6SYeVvUlL55+Zi0UMSOli32oMfdkVz?=
 =?us-ascii?Q?s2E8FPl1FctDeyKCOUHUKVWwbVWzIn6C9ebqOuF/OlGVFeHr2Pc5Tx8mu+Uz?=
 =?us-ascii?Q?UAdxWTY1OWayl1/zC5OQpC0FOeFIj3Nw2/g59vRqmh7VEVrTuKIQgPBkSN2W?=
 =?us-ascii?Q?WLf96OzekF2AIBvYoh/stkX8q5cELbyQ9P0UvDJNk61Fm+nCEYiokytYYHYu?=
 =?us-ascii?Q?ilc/u6ZxklSrMy+S0qLjGcnM9V0yraWzp0kEVw+nqVOAjzADYwVFOBc5gPql?=
 =?us-ascii?Q?hbV734qfCe/ud2bYjoWJ8+7+CZY/fvaG3vBtup4Ysh8mZWWyxsecUYU2Hqwz?=
 =?us-ascii?Q?f1n8nBHkzX0uKiBLnuUtgugP3LlQmqlBbpBKVQDNh74jb4oYcX8TvC8oYcCq?=
 =?us-ascii?Q?PA7D84CeRq5b04tdlIS0N8/bb5NfaM8KSzLgtCnU5GBGwa2DIH0HFknP5C4l?=
 =?us-ascii?Q?En/CnAMBB7U0a1004PrkE2ri2yVeRz3z5cjpki049etArF3QxX6SzTmoaEn+?=
 =?us-ascii?Q?TTmn3fMtZ3TnyJhXGcWvJn2dHEAJXnTMnUPV2c+DfTEiRWcm7q3pTWn1iZCT?=
 =?us-ascii?Q?aAq/jUY6es/SEPp4SmdpRTe6rugtRtMXsPTyW5o+5P63bA7jaWEnKgAKMMlF?=
 =?us-ascii?Q?vrbpmYrZjT7P4iGGw/E7HcrIuM5w9Yasqx9BdjTyfHolq9GcK2m2vX4zN2uM?=
 =?us-ascii?Q?9qBnIvPZwv2wOlpomCzfOh0S/bpVuY52YtkxtUAGstupe00YYw1Xr7yTPY43?=
 =?us-ascii?Q?vWuBufOZawiwYehmHWtp15kQ/1gia6IAZv3u812YK++1scOOllf6CyCh6Vas?=
 =?us-ascii?Q?OOwEaxQvISeNuYaBRWbqW7v0pSN8IZZqeRIenkP5kdmRqF6C9ephuGUgoQDb?=
 =?us-ascii?Q?Ebt/zXupSfJeH8TnSG79497Ya4iw7Xy2RUsZoQqjb55Pp4/SNNBF/+n12tD0?=
 =?us-ascii?Q?h0stbjCyZmzzn6pgI/7egoL05+InlM2TUEA4Vpv4RQLpDqDs7OLKevaIQjcj?=
 =?us-ascii?Q?VPphR+mdo33FwyiM4ZCUNEaVVeiT2U/XKlmQFl5os/yeebcN4LFPgSIA2yoS?=
 =?us-ascii?Q?meQGiRMkSe+n4s/U9CjybHTQ1RB9MANJXA1yeAxox4kAGxJBRpwZJfyd9dNG?=
 =?us-ascii?Q?SdPUOgXHrXI1bYZ513OuAl0PtGfMovif6kwB3KdZE94AGdSENokkfJp7A+xy?=
 =?us-ascii?Q?2OusW9jDfw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 710d16fb-d289-4ec6-3934-08de68c6a99a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:05:59.3475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8W+riRnEJuTorWaGx6VZ8znJj0Rh9wsQalZwKAOnjiPAptswsmEMevzMLHgjstEtIKLRaEwDP32JzhXOgfMj+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8362
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31563-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,foss.st.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,i.mx:url,0.0.0.15:email,nxp.com:mid,nxp.com:dkim,nxp.com:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 7695411D8FB
X-Rspamd-Action: no action

Add the RPMSG bus node along with its GPIO subnodes to the device
tree.

Enable remote device communication and GPIO control via RPMSG on
the i.MX platform.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..93846435c6c1 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -191,6 +191,33 @@ scmi_sensor: protocol@15 {
 	cm33: remoteproc-cm33 {
 		compatible = "fsl,imx8ulp-cm33";
 		status = "disabled";
+
+		rpmsg {
+			rpmsg-io-channel {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rpmsg_gpioa: gpio@0 {
+					compatible = "rpmsg-gpio";
+					reg = <0>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+					interrupt-parent = <&rpmsg_gpioa>;
+				};
+
+				rpmsg_gpiob: gpio@1 {
+					compatible = "rpmsg-gpio";
+					reg = <1>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+					interrupt-parent = <&rpmsg_gpiob>;
+				};
+			};
+		};
 	};
 
 	soc: soc@0 {
-- 
2.43.0


