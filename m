Return-Path: <linux-gpio+bounces-38022-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L0MNAaCAI2q8ugEAu9opvQ
	(envelope-from <linux-gpio+bounces-38022-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 04:06:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A65B64C2D3
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 04:06:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=toKPpTzR;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38022-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38022-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF74630387B5
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jun 2026 02:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B04262FD0;
	Sat,  6 Jun 2026 02:04:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021103.outbound.protection.outlook.com [52.101.70.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563662765FF;
	Sat,  6 Jun 2026 02:04:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780711450; cv=fail; b=Y+wowb7wUItrndpktuiYs35WxJvCz625gdnEDYT670bXBbk14VIeGrXG0lAzoO2S8kfwpcq0VPW1GJ4YCNlOUYwNsnvL9KUizMYZjkONPSbvHBW7tvA/1827XsD+g0HkBK4thxJObD50oiuNistPOTxKwCmMow8r0bjbl230NkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780711450; c=relaxed/simple;
	bh=qPjnGdFWzJltqEPlJrVHe112XPYlWJQ0b/t1sEkAiGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oEO6LWWJkhBMB445UxAWt+Uy63ZFCpL3UVHR5JEHnYOwEQA5SQXmEuqsy11GwfGTqUdT00dToiNYVhw2+bFWPvIqfo1SKgM915Ro306Iyy5+RfAUfJDWmLGPwUd4/gBK2ccerbhKdhD8ulIVpFeGgLUpnHkaHqkISi9rThWbffE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=toKPpTzR; arc=fail smtp.client-ip=52.101.70.103
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYfvqQFdFJ73e5rHcAaGYp8JpaLla5VdIB88Y4gDqkfnFRRR53MvWfQrKUwpal6VMHSvlP8O9g9k6x+PXDOAaygK0bul3KPcejKU+Q+6dIBFAy+c+cKVGx9dJwnf9bTiyIzsGpnkV+5J3LqPFd60ONaDezq3n9vquQ+rOm7YTmBTwk4lXYsO9uDsqL/RRjBBym6Y9Nsadir7cOtvROkzOttxTAIGQUljtsLEq3y0sewgo6mFwCGzBWFr/HIpn8ISCAiTsHMjBnWclJkuRJFAwFaCwMhzqX2ZFRONB7gRTscL1RixSHcGmhoDA1sxFATAlQJPmN5blhhrai7XnMeGag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVl7qtt/yqlCvitZM8hlPGBCH6582+BTLitnDe3e1z4=;
 b=eXM8aQ0CsCWBrfivM+Q6gPyP6o9KB7RF2rx463VqMiAQF2IIv4bHSHBj/QGeJ1HcM3megJPeB4to2ZwujiWmdh5Haf8eyamqFiI1sw0xc+TSh2UWhqUXtBa5dCFWRN4WuhoprJI302BosEBZqfesw2dyL7V9sh7XJEaCZLsREuL9TvZOElbbEV5u+/n/gp5oVnY3VIQvCRyu+rKK9cIPkGiMqZ7ETR5iZkEsRT9pQkS0TOEhfayrU/7HwsC8e+7E5RfneA2+8w99iIHGxtZzivoKtd3kXIpXu0OIUxgJfOgU7qDLBrJtk3UkQszD7ViB8CiTOFeRRlXIS2x3jtADfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVl7qtt/yqlCvitZM8hlPGBCH6582+BTLitnDe3e1z4=;
 b=toKPpTzREYFuEC1iLi/y7t+ifak51klA/9Df1pbnWSnCj5zgXoEjJgLZHYQq+MWWZSNuC/Hi3yEBYARJr/dIjV0Qi16vKo4LPiW6gVVmRq90cP+W9bCVQriA5llwrRBeAKolaROX6lTwVp9AiFFS8qfoDxlBoz7+r//wJw4lejYPLVA4vwBLGbBDbDB7B12KlKPovLJmrua2/pq3ClupnL0q2VmnPwCBmq0LbKyLd/OpXjLUArbvh/m9THbr3BwyWjtsJJZaN/EU/VCTGZoqt4Cm6tog60l2GLSOJtN3/YdaYuSh1ehok/p6n3Ybze3bbnwJkYQFmeHSfr/6PxGi4g==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DU0PR08MB9558.eurprd08.prod.outlook.com (2603:10a6:10:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 02:04:04 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.006; Sat, 6 Jun 2026
 02:04:04 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 05/11] pinctrl: airoha: an7581: fix incorrect led mapping in phy4_led1 pin function
Date: Sat,  6 Jun 2026 05:03:36 +0300
Message-ID: <20260606020342.1256509-6-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DU0PR08MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: 3224cdc2-28d1-45d8-0f40-08dec36fe27b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|11063799006|56012099006|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	6iFIWeBg+MWIHQd7EUOp7IvnRp5C/CCdkfoPnqdCRMVyJtpmhi2yWTC1l+c4rHW9IKPkZlB2S+a8e6HzUh6uBVUCAaZNAuujIxGjTfYTIrz4zp+xVb7RU0gvN8DvwFxoFdt+iaKvbEtM9P/nIrBO98yZUL0AEkbbxDSvQllZGlYFCQ2XdfwhqVOXEhAW9S2e/fuzkvZ7iDOno/nHDO5U8VA3w3eeHzmk1DAAZcMSun/2nP7sfvQSTX86L29XVaZcOtIeWayYwJX6YByCpuaeQV28NrOQm4Y2J/JstFhgPmhkESAINu4htQaHJHyJYw1RTRnDDrS0i6OoCk8txTULGXaPpe/vp1BS8PSy3OLeaf+aox7n5ZuSNgkzxuNcBlESb2jKvGS+hMkPoRmYIxKq5LLmPLdnHLV/zmArNbF40sLqfL0Ip4FUWlePx72gaHJk0tYxbw/sKR/czo7Beu+4GEcRFdxvBmG890NDe4hrMXbgXwPIqmxIgA12UoAhlirja78L4l4WddQT9bhGaF002JVi8SUk41Cz9CDHRyicnBRfeTRLAcr9VJ8c9ROS0UWzUeJ6TGJdQ5ZSrsOPTevgDYWFlqJ73AboYsGGTeM+GmktRmvUJ+E28l6Tb0vH6kL1BB7J8jWJFtMHESLpaZqT8MIK8g6hekb/gIPldsoCKncDcaGN0ajxIx6+2dR1NbawvNePWx5BdV4BzWJubwrl0gczt8Mx9HCwHOkMVmyqXsM6C4LRDFnrEz9oy/aX+WKpYDQ9zKrnEN3+rDLtYl20Yg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cjYYS6ujjMZFcaUWFUL6qBJlqMXGrQaRfAkSKhf/J/jrfyISHm1Z1oxGrFMm?=
 =?us-ascii?Q?wXlAnjU8FgepaNGx7KvDqysBI8kHQxMm4U+c0PfV7LCfmxoWHFovVGOH6Gju?=
 =?us-ascii?Q?CUwb8fto4+tCJTCHLhRKnmhkBwIXjh6sy2zxqXKbhQe5uUUfA+6r/9cBvTJ4?=
 =?us-ascii?Q?tEv+XUHVqD7aTWabnjN63mm/gjiNz1zDWEXP4OcH3Q9LM2pqRNmwFa8OFPLv?=
 =?us-ascii?Q?PBjWHRPkXU8O9yNGP4FHmI9iTekvbOQTRDbIUWbVi7nJeceG5dBsBjCQT5xE?=
 =?us-ascii?Q?zPD2y9zWsAVR0v1XMoG9sOjIbfUuJw80uyrXIziawqH+8Jcu8cm1jDaR8tVk?=
 =?us-ascii?Q?oFAN5WjWlOes8vpmZOUUecX9eOJqWU133r7UPoDFJVJSAvEKdGbMUS+WBc67?=
 =?us-ascii?Q?snLNNuj24FyE+dAv3kGZVVW5v8i6TXJBPXktKMsYhL9qSXQL7EC1ri2ZjNOW?=
 =?us-ascii?Q?BpAYraNgVP7508YnFnrfloQmtd/kL2hr7pkvn8qRrRCwwoz1WvQ3eTDCmaZT?=
 =?us-ascii?Q?bT3GYSzx6ianQRD9UxTdvKAoP/5i6Deau/ip0KC3Y10/4Lu+izFmI2xXSsI6?=
 =?us-ascii?Q?2tbbmSmJMkNzxfM1ddj/VemMwsQQmH544/YQuJ6AiqteA1ggfvb0YCNEOX9R?=
 =?us-ascii?Q?3f3rTYHefqvLANFWJ3+F1uooQB6lFkaa7yC2jNfUh2pFE8IOUW0CcdCJslJ8?=
 =?us-ascii?Q?TF2b6Vrdj3uLYrYEDjjQ3CLSP24bjeAQEneug6S9bNL4LmRfDaAYa6gSGVTc?=
 =?us-ascii?Q?/TTOL5LZzDnhwaDjgl3elfwBkxOVG4M2yRnyqo78PtL5wvfvuK5spRO4E+5N?=
 =?us-ascii?Q?ydzLG/Alqbmiiwm1XHfeWlYmHEzMi/iQUJka546BPrBP5WrHdQSZ8Fxc89qT?=
 =?us-ascii?Q?jk/OgvGcT1jEQru2YbJ+fra5Hehzp0BC5vlGZ/f73LgDXzVQCNQl8q+a2Wku?=
 =?us-ascii?Q?1tJXpBGoXrP9tbeHfqIOf3JNEpjYZelOmznJhpYLIpnuiker9zj0Ai71tVyj?=
 =?us-ascii?Q?o9SmwvU/ANmPeC5J1Ys4fa8ma0DDPILKGbV1X9A4+6OUBoycrPoxVq578JbY?=
 =?us-ascii?Q?bCJnjCz1KQfqHjoGGFfuHCDlSlX2Q1MH1u1TMhA9HdlWuC6IAyw2AGBYsD7R?=
 =?us-ascii?Q?MEzcDqpFyfsTgzxPaAKj1Ryjy479jnLbkhW1ZGm4U2ktfgD47mu1lGiZk2uY?=
 =?us-ascii?Q?NpmQ4oz8zW/KzvVB3KxHA8xDCMJ/981Sr5mOr0+VN4cY/Rmm5AKdD4pJsO7z?=
 =?us-ascii?Q?L++4uP0AIE4l/X19+xKJVrFPlTbzyL3DkOOsZbSH3/bzX9kNSgNx5PgKTkrm?=
 =?us-ascii?Q?WHTJ4lo9X7MBdGntZ6K/TMQf70UwaNZZ09aOQ+SA42WXxLcDDLo1xbIACDvC?=
 =?us-ascii?Q?tUiU+1XADCdrcooEAxQcJu2aanW8YL/Sx0XYs+nXgjMNGCkCJ2B/HiPcTNSU?=
 =?us-ascii?Q?19+KM47UualRxI+vkrfF3DH236l+7REN42SfpVi7w2vLiMDpeUZhPERUbF45?=
 =?us-ascii?Q?O72iHIkHw59zg5yVPasG0437J5rDpiMH+zK8Ll72VQ/xadt53Sz33fSyGNpH?=
 =?us-ascii?Q?Bex1frXE5boGYr5kV+RFbl02PsELV6C67nw1xPbEYRMSF5XZ90qUcwrX3gMA?=
 =?us-ascii?Q?jHOoFLiAHrNYypmxoq0jmWSvL7j5NCLl5ncKItMaiQGfqWvYnpIFn2K8nmJA?=
 =?us-ascii?Q?Di0kZDmp6UD0/2LZPPWdsyb1CC1rbmJ+Bl6fBxucNsyQ5gOUI3hcTsdwbiT+?=
 =?us-ascii?Q?FQT/tghSP0e6/epOlH4o5+9ndbzTH4c=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3224cdc2-28d1-45d8-0f40-08dec36fe27b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 02:04:04.3173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEvifrlAFK6eAhYaUhkDtlbvdn1KAQWQHpTYQpXC7DgYt9FtJWVTMUv88JHL8ohoD1uSYXCS+Ab0xWzvK1XzJTiPdYArR64pY4uohDYPUvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38022-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lorenzo@kernel.org,m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:ansuelsmth@gmail.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A65B64C2D3

phy4_led1 pin function maps led incorrectly. It uses the same map as
phy3_led1. PHY{X} should map to LAN{N}_PHY_LED_MAP(X-1).

Fixes: 579839c9548c ("pinctrl: airoha: convert PHY LED GPIO to macro")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 34eef79d058f..9497f5110f61 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1622,13 +1622,13 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 
 static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
 static const struct airoha_pinctrl_func_group an7583_phy1_led0_func_group[] = {
-- 
2.53.0


