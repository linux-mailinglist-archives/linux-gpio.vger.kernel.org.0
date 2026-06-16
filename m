Return-Path: <linux-gpio+bounces-38539-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id au95LiTQMGpqXgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38539-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:25:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F0B68BE00
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:25:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=zaVd+bjZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38539-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38539-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65B0C31BC759
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4F43C81B4;
	Tue, 16 Jun 2026 04:20:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022136.outbound.protection.outlook.com [52.101.66.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BB53C9893;
	Tue, 16 Jun 2026 04:20:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781583627; cv=fail; b=FZmdlQzIf2gHpiFg20uKtW5bzkpiKTEr/FuNyHbMGvpmPLyZ5bdjZ9fH/qQrNKULiJGGWfV+98hUmQx+kku96eyvXtqr/jsGGx+Zn1H8m9FovOmy0BMFwlFzTMoO5OrkpvKck5SEVIWkOoFZc9Gx9bM7h8g1QL2pZDsoC/BuKk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781583627; c=relaxed/simple;
	bh=gaD/NpwGZtVqgHQCfzLS59Dcy6wFZHsW+89+1fGP0nU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MW6J3slrQQVB5SOyfSmN6wjYxC9wJrrW6rdFrEZ6jF1y6flL5NhofRgSCXxqVW6HAp/3ah14bMfYCPeBVOiKqoFyKMHPRmUUsWsqBKWOe5WHHnDrOtChR/31xYcwuKxS79U0gpjU4Gg3kSDNNNtYPr2UBH0owveJtCmfXn27uos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=zaVd+bjZ; arc=fail smtp.client-ip=52.101.66.136
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DG+elcyzsplmHWJmnk2TJlEWnwu+RwN4PocIZFM1KBcu4fBWsk3t16D3srBjaI0pxHGTVJ1zFBd/RvK9Dep7XIicUdgH7MeDrfNTqSVibJ+yC4LRNupmW15u/AodVfDyVyf1J3bJOubgJcKtQvxhV77+Ag3qqpENuTX5YQoB1QOc/B3BXss0T3fJbQQ8bi1MWAVNam//3Z9JqiLY0/No6HM0FiW8lGNM+2s0uHO+EXv/mJGFbG4YpQ9ywSmi2vTEy0VqZmaTihva4qo84Z0SgZCoH4/gT1JdmqJSXBd800kFeMzQCDd8AGahlZ3Dh3IqrbF49tBzFl3o9Gvts2PTpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfFDVedGjQ+R/BwjOpUt5NEhS5WQC9Vrd/se5FOqZ8o=;
 b=fTMI5RkEgL2TIKaFBhM61Eo8oqoS5mAFR7collQS5GOBWlLxblp27U/MhTcjbkY3OMsbT7nuxrmUcPEmuebuP5X9XyV0D+UhvOTZJA+NzC/zSI822k9rZgf3oBNDfUcPa++k4v3jAJTWN7pSSUDi2Bcm5kMyh3ADHxzfrtbscU0235Ewyzz1Q4mE4kptZJ0li9JfTyj99WYcnDA6gDDcx5FnNLrCtUxmba3eTV6Px5c1Zs3t0IMGuq8nC3oOX0VYbHmjuh39WmGYKjd4sxR/5Q/pfYJWN24EC1of36quCYirf43I3yIftEqVTq0tfEA9I5O0Dbdsjh4pKmqrKbJH6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfFDVedGjQ+R/BwjOpUt5NEhS5WQC9Vrd/se5FOqZ8o=;
 b=zaVd+bjZmaNw4PTLKuDfmZ/y0bQZiG2C8dZ1UrWenJEtbfDIKlq+HJltyC3IOzBILVeiozbdy8rOIMiNrvb3fjVnvjQDrjOnH0tBKpPJ/PZnvHF3VflFrKKOKxjWJn39WczNK88GWNtmSE8CWRE4rmBq8kqIeSfBGSDtAssRCRY10IdWA8r8dZVp5KHid55fJrbmthPlZolCEbSEh4KicOCJQDxvp4iKdkNsSupNLYFbZlcpaHFgeCGhaszLnPHomRFoOX5/NOAVTRnI9f2RYWzNJyFz+Xz1+BPogiqTOvUVVGOMSa3UUI+y5+vwImY0hhSi+Rt3s0SHUa9EBtVS8A==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 04:20:07 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 04:20:07 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v2 12/12] pinctrl: airoha: add support of en7523 SoC
Date: Tue, 16 Jun 2026 07:19:39 +0300
Message-ID: <20260616041939.2587012-13-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616041939.2587012-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260616041939.2587012-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::11) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB10055:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c29567-aaee-4a35-d0fb-08decb5e8c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|38350700014|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	JY1RbJR75+xdHKSNySy3WrVfv5z0YaKDhr1Vg7U44T7aXbaXmnyB7s9xC3Mqy/hTAtZhptllKhXMtEE5gQExlzJJE96o+WZDu9fyEfg42TXr6eaUg+PSOWclb08S7jc+TrLVrl2kVIDf8/nG4ZFc+XEQGL1ZTbIm5j9NTOBVHgDf1lqcqBJyvmXTARvh2a/GjnPGBamNvPCgz7bWPU6f+e1kfywUApC7HocfyG3MhRSqu6LXPp9m1GduHkHE+4q2R4d3GrKf7x3p4LvY+p4AO1C80rgUAXGEr/WRngU8Lw1x8e3OfDdk+6fKnDbQzAcRVHNCXJ6Vm0QU5d1Feo/JskIh9X5cRHfELOuH+f2i4pCQYp0FU45BOCayDf7+N62aMaOVe9U8E5IhbOvuecMSj05Ch7Ag8kFMuPXyuFjrLrkhijv9PzXlXHK1xANd9sI5qT5PqnK3L+kCOebsUmDQcP1H2vR18gqSkvE2o/5Ym0KIjLuV28ates6RTUNCiajlXR5Xt4+BPoF+m7XWlNNa9FHDbBiQzz37F/QOl/ejYjJTocTLsQseeuDZCnQjPq9ZJNr38u5EPzGJJnKL2pBfwT7uWZzyS69PT3SvMJZDr2C9Jj9wHebEUgeGj5Oe7g70oULX6LBd514daErSgw1qYchK8EAhcGwnxDk2+N2Z/b0L2BgYk04eNByZfWjPfY5x9vMztq4JPHVEcv019MqLqtBkEXCy5rsC3F4tLzi22oYekeymH6gj0riiWdaL8Bc8iomR5t8pC1gM5aFJ0qgNdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(38350700014)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kLixHnEDq90MBJsxOtM1C4itZWKQEIaakbqOh18794Tjtjjr63UJVIF386AF?=
 =?us-ascii?Q?A5aoQZnBqsQ6XX+WQ4oiOERUlnA4SnnUZrIvTIca71lU7NJOamO+UQYy1Fm9?=
 =?us-ascii?Q?dQ7KFqIb3tEgG2z74WvBLBkWvTyou541b/pBOEM9/0NG+epsf3D3Sy/IXnit?=
 =?us-ascii?Q?lT0acrUtstlLJ7v7WLJz2lCMC8RAoPGa/HE6uGIJZ/WHhNb46G+XIBOyCLgR?=
 =?us-ascii?Q?wo0lJkOQ1fzgktlQ3LWazYNPKZdeMM1rWSs8gWW6CPCI5LaFM+wMHSXF3u/D?=
 =?us-ascii?Q?00xjrOdRIYZDVi6a6ydoP30wz35//C4pcq1fA4u8eKsqgwusqUAbF/Is6uO6?=
 =?us-ascii?Q?lI6ioQ+6s8im0XLIJuLBDCiFdS9/63z+JP9tI4JvsYWLV9GXHPcfvw6NkLjs?=
 =?us-ascii?Q?ZjHYH8PW34noMgD/VQRnd87y12g29ialMp5KX8ypAeEQ3jKC+VU2SJu3VH77?=
 =?us-ascii?Q?xl+j4BcgeeeTAnrWSs2V1ukqGJfhNlD/T68wtDFoR7DAijx6wR3M/mVbGRv6?=
 =?us-ascii?Q?hjvRvDUuLlefB29rkicF4UabkVCkcwQcS4B4GaBGEUt3T5ezVbnVYObt0nVw?=
 =?us-ascii?Q?x+ZirHogJbwf5kMbDDcvLyIRrpjdjjpQ73oB5sT79hwF5gNPvR4aNsMaFL8Q?=
 =?us-ascii?Q?kmIPna69i4Tu0zETb6NSznaya84WMJmw6c23/39EEPekKihGvgYj3wnpR2Iz?=
 =?us-ascii?Q?t0E7ppC4iGAvfcuQG1X6NHvdV+X7LcOhTQy++MbET8rxDey2eGMxzCU3lKx4?=
 =?us-ascii?Q?lev9nDM9Vy+r000ljItNRrSahaTotcRGHvLks5EvZ/FmVaQOrZw9qag3sgx3?=
 =?us-ascii?Q?MT0IfwqO1OBw4nSHsy6YkAjRE+cYPJKhL+is2Xp5HIX9hyk3IFrSBlo24Cc4?=
 =?us-ascii?Q?EW0lGShYdeZq8CLxPg3PchX43xrtWgpPb5jw2vJcTLOwou4zQjHv858JyPxB?=
 =?us-ascii?Q?KR/uPVgOyLFmI21aPZ2BT22xUv92wO6srSQAgAy7ArvE0jyvWipsI3i1OnVv?=
 =?us-ascii?Q?K+rRjgTIeq6/x9Xw1GfWXOZsKt+OHvT8+6eciG/cjzmFbR7Vb9mQ7Zg88Gvb?=
 =?us-ascii?Q?WB24IAstD/OQGZZRZKFR9JHdzL16SQNcEQd8x/NzB/XeGGjqOehNPoqkyXCg?=
 =?us-ascii?Q?Xg98E1Xc3CgyveFTnxwwUoLS6pWImx9H23s21QQR4LAYVOjY1GgV6RFmmr0A?=
 =?us-ascii?Q?99lGNIE9iWmPHswIv9tBZxg88nNZGC93fEAGxTniML7Ts/UFjEg9jqmQkZYZ?=
 =?us-ascii?Q?hWgBZdI4wG+c4hG0ZVwmIItfeD0M69gdbmPkRua/rhTzR+RUEVwZclQKVnHA?=
 =?us-ascii?Q?O7KfiOtOUHttNpmun/FNPjgWftEMRKg2C2TG1ZcSL2gMHGoHZsXGQWDXlmTI?=
 =?us-ascii?Q?ZwQBHDkm5ajd3fuhMJxhRb8OTTu96EMKb6clZc4U1gAG7+qYAQ55pn1QgCFq?=
 =?us-ascii?Q?al8vkWMPcjmciIXgEDucEBc+v04xoLRhhCVDKRUw5u2Wn+u7fcY4etPpuLQ+?=
 =?us-ascii?Q?eog2bgV/mEsJxoFeM8ap91m53YCZa4aiYNmXH1kONkAX1FZzoqpBewlqQuV7?=
 =?us-ascii?Q?gqC4+Tc0QvvSodrpCq5PsQtanFkV6O0RXxWijLJiZb3lMAq9lb8lbaX//ovG?=
 =?us-ascii?Q?cZNWLPNIc73GYp0hoYtv8vP07CJUv7a3jFBlOOwYdjq74uQUamEBe7p7ZTZn?=
 =?us-ascii?Q?nB0wI63F9ay60NSLa9cVYUuTp5THGXJg2xuuGYj+/zmGnQJXt6KzolKJCJH2?=
 =?us-ascii?Q?x58XnL4YujfAcEjvsw2HGYos9u6wFNQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c29567-aaee-4a35-d0fb-08decb5e8c38
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 04:20:07.4527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKcrLbtZnr8k8b8E9pj5GOm0rrPRx8hL6XCV067KaeWB+VgLayJYSMMM0AG+wF21XmMwaOKF8TmG0oAvi88m8yN909Ayz59Uj4JMGAOQQGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38539-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,genexis.eu,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:benjamin.larsson@genexis.eu,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,genexis.eu:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3F0B68BE00

This patch adds support of Airoha en7523 SoC pin controller.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/Kconfig          |    6 +
 drivers/pinctrl/airoha/Makefile         |    1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c | 1122 +++++++++++++++++++++++
 3 files changed, 1129 insertions(+)
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c

diff --git a/drivers/pinctrl/airoha/Kconfig b/drivers/pinctrl/airoha/Kconfig
index 08038a5b11c6..159b4496f64a 100644
--- a/drivers/pinctrl/airoha/Kconfig
+++ b/drivers/pinctrl/airoha/Kconfig
@@ -15,6 +15,7 @@ config PINCTRL_AIROHA
 	select REGMAP_MMIO
 	imply PINCTRL_AIROHA_AN7581
 	imply PINCTRL_AIROHA_AN7583
+	imply PINCTRL_AIROHA_EN7523
 	help
 	  Say yes here to support pin controller and gpio driver
 	  on Airoha SoC.
@@ -29,4 +30,9 @@ config PINCTRL_AIROHA_AN7583
 	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_AIROHA
 
+config PINCTRL_AIROHA_EN7523
+	tristate "EN7523 pinctrl"
+	depends on ARM || COMPILE_TEST
+	depends on PINCTRL_AIROHA
+
 endmenu
diff --git a/drivers/pinctrl/airoha/Makefile b/drivers/pinctrl/airoha/Makefile
index cfd68c45ae0f..8b9202321ba8 100644
--- a/drivers/pinctrl/airoha/Makefile
+++ b/drivers/pinctrl/airoha/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_PINCTRL_AIROHA)		+= pinctrl-airoha.o
 # SoC drivers
 obj-$(CONFIG_PINCTRL_AIROHA_AN7581)	+= pinctrl-an7581.o
 obj-$(CONFIG_PINCTRL_AIROHA_AN7583)	+= pinctrl-an7583.o
+obj-$(CONFIG_PINCTRL_AIROHA_EN7523)	+= pinctrl-en7523.o
diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
new file mode 100644
index 000000000000..d23aa8f826d6
--- /dev/null
+++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
@@ -0,0 +1,1122 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Author: Lorenzo Bianconi <lorenzo@kernel.org>
+ * Author: Benjamin Larsson <benjamin.larsson@genexis.eu>
+ * Author: Markus Gothe <markus.gothe@genexis.eu>
+ * Author: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
+ * Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
+ */
+#include "airoha-common.h"
+
+/* MUX */
+#define REG_GPIO_2ND_I2C_MODE			0x0210
+#define GPIO_I2S_MODE_MASK			BIT(12)
+#define GPIO_I2C_SLAVE_MODE_MODE		BIT(11)
+#define GPIO_LAN3_LED1_MODE_MASK		BIT(10)
+#define GPIO_LAN3_LED0_MODE_MASK		BIT(9)
+#define GPIO_LAN2_LED1_MODE_MASK		BIT(8)
+#define GPIO_LAN2_LED0_MODE_MASK		BIT(7)
+#define GPIO_LAN1_LED1_MODE_MASK		BIT(6)
+#define GPIO_LAN1_LED0_MODE_MASK		BIT(5)
+#define GPIO_LAN0_LED1_MODE_MASK		BIT(4)
+#define GPIO_LAN0_LED0_MODE_MASK		BIT(3)
+#define PON_TOD_1PPS_MODE_MASK			BIT(2)
+#define GSW_TOD_1PPS_MODE_MASK			BIT(1)
+#define GPIO_2ND_I2C_MODE_MASK			BIT(0)
+
+#define REG_GPIO_SPI_CS1_MODE			0x0214
+#define GPIO_PCM_SPI_CS4_MODE_MASK		BIT(21)
+#define GPIO_PCM_SPI_CS3_MODE_MASK		BIT(20)
+#define GPIO_PCM_SPI_CS2_MODE_P156_MASK		BIT(19)
+#define GPIO_PCM_SPI_CS2_MODE_P128_MASK		BIT(18)
+#define GPIO_PCM_SPI_CS1_MODE_MASK		BIT(17)
+#define GPIO_PCM_SPI_MODE_MASK			BIT(16)
+#define GPIO_PCM2_MODE_MASK			BIT(13)
+#define GPIO_PCM1_MODE_MASK			BIT(12)
+#define GPIO_PCM_INT_MODE_MASK			BIT(9)
+#define GPIO_PCM_RESET_MODE_MASK		BIT(8)
+#define GPIO_SPI_QUAD_MODE_MASK			BIT(4)
+#define GPIO_SPI_CS1_MODE_MASK			BIT(0)
+
+#define REG_GPIO_PON_MODE			0x0218
+#define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
+#define SIPO_RCLK_MODE_MASK			BIT(11)
+#define GPIO_PCIE_RESET1_MASK			BIT(10)
+#define GPIO_PCIE_RESET0_MASK			BIT(9)
+#define GPIO_UART2_MODE_MASK			BIT(3)
+#define GPIO_SIPO_MODE_MASK			BIT(2)
+#define GPIO_PON_MODE_MASK			BIT(0)
+
+#define REG_NPU_UART_EN				0x0220
+#define JTAG_UDI_EN_MASK			BIT(4)
+#define JTAG_DFD_EN_MASK			BIT(3)
+#define NPU_UART_EN_MASK			BIT(2)
+
+#define REG_FORCE_GPIO_EN			0x0224
+#define FORCE_GPIO_EN(n)			BIT(n)
+
+/* LED MAP */
+#define REG_LAN_LED0_MAPPING			0x0278
+#define REG_LAN_LED1_MAPPING			0x027c
+
+#define LAN3_LED_MAPPING_MASK			GENMASK(14, 12)
+#define LAN3_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, (_n))
+
+#define LAN2_LED_MAPPING_MASK			GENMASK(10, 8)
+#define LAN2_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, (_n))
+
+#define LAN1_LED_MAPPING_MASK			GENMASK(6, 4)
+#define LAN1_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, (_n))
+
+#define LAN0_LED_MAPPING_MASK			GENMASK(2, 0)
+#define LAN0_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, (_n))
+
+/* CONF */
+#define REG_I2C_SDA_E2				0x001c
+#define SPI_MISO_E2_MASK			BIT(13)
+#define SPI_MOSI_E2_MASK			BIT(12)
+#define SPI_CLK_E2_MASK				BIT(11)
+#define SPI_CS0_E2_MASK				BIT(10)
+#define PCIE1_RESET_E2_MASK			BIT(9)
+#define PCIE0_RESET_E2_MASK			BIT(8)
+#define UART1_RXD_E2_MASK			BIT(3)
+#define UART1_TXD_E2_MASK			BIT(2)
+#define I2C_SCL_E2_MASK				BIT(1)
+#define I2C_SDA_E2_MASK				BIT(0)
+
+#define REG_I2C_SDA_E4				0x0020
+#define SPI_MISO_E4_MASK			BIT(13)
+#define SPI_MOSI_E4_MASK			BIT(12)
+#define SPI_CLK_E4_MASK				BIT(11)
+#define SPI_CS0_E4_MASK				BIT(10)
+#define PCIE1_RESET_E4_MASK			BIT(9)
+#define PCIE0_RESET_E4_MASK			BIT(8)
+#define UART1_RXD_E4_MASK			BIT(3)
+#define UART1_TXD_E4_MASK			BIT(2)
+#define I2C_SCL_E4_MASK				BIT(1)
+#define I2C_SDA_E4_MASK				BIT(0)
+
+#define REG_GPIO_L_E2				0x0024
+#define REG_GPIO_L_E4				0x0028
+
+#define REG_I2C_SDA_PU				0x0044
+#define SPI_MISO_PU_MASK			BIT(13)
+#define SPI_MOSI_PU_MASK			BIT(12)
+#define SPI_CLK_PU_MASK				BIT(11)
+#define SPI_CS0_PU_MASK				BIT(10)
+#define PCIE1_RESET_PU_MASK			BIT(9)
+#define PCIE0_RESET_PU_MASK			BIT(8)
+#define UART1_RXD_PU_MASK			BIT(3)
+#define UART1_TXD_PU_MASK			BIT(2)
+#define I2C_SCL_PU_MASK				BIT(1)
+#define I2C_SDA_PU_MASK				BIT(0)
+
+#define REG_I2C_SDA_PD				0x0048
+#define SPI_MISO_PD_MASK			BIT(13)
+#define SPI_MOSI_PD_MASK			BIT(12)
+#define SPI_CLK_PD_MASK				BIT(11)
+#define SPI_CS0_PD_MASK				BIT(10)
+#define PCIE1_RESET_PD_MASK			BIT(9)
+#define PCIE0_RESET_PD_MASK			BIT(8)
+#define UART1_RXD_PD_MASK			BIT(3)
+#define UART1_TXD_PD_MASK			BIT(2)
+#define I2C_SCL_PD_MASK				BIT(1)
+#define I2C_SDA_PD_MASK				BIT(0)
+
+#define REG_GPIO_L_PU				0x004c
+#define REG_GPIO_L_PD				0x0050
+
+/* PWM MODE CONF */
+#define REG_GPIO_FLASH_MODE_CFG			0x0034
+#define GPIO15_FLASH_MODE_CFG			BIT(15)
+#define GPIO14_FLASH_MODE_CFG			BIT(14)
+#define GPIO13_FLASH_MODE_CFG			BIT(13)
+#define GPIO12_FLASH_MODE_CFG			BIT(12)
+#define GPIO11_FLASH_MODE_CFG			BIT(11)
+#define GPIO10_FLASH_MODE_CFG			BIT(10)
+#define GPIO9_FLASH_MODE_CFG			BIT(9)
+#define GPIO8_FLASH_MODE_CFG			BIT(8)
+#define GPIO7_FLASH_MODE_CFG			BIT(7)
+#define GPIO6_FLASH_MODE_CFG			BIT(6)
+#define GPIO5_FLASH_MODE_CFG			BIT(5)
+#define GPIO4_FLASH_MODE_CFG			BIT(4)
+#define GPIO3_FLASH_MODE_CFG			BIT(3)
+#define GPIO2_FLASH_MODE_CFG			BIT(2)
+#define GPIO1_FLASH_MODE_CFG			BIT(1)
+#define GPIO0_FLASH_MODE_CFG			BIT(0)
+
+/* PWM MODE CONF EXT */
+#define REG_GPIO_FLASH_MODE_CFG_EXT		0x0068
+#define GPIO51_FLASH_MODE_CFG			BIT(31)
+#define GPIO50_FLASH_MODE_CFG			BIT(30)
+#define GPIO49_FLASH_MODE_CFG			BIT(29)
+#define GPIO48_FLASH_MODE_CFG			BIT(28)
+#define GPIO47_FLASH_MODE_CFG			BIT(27)
+#define GPIO46_FLASH_MODE_CFG			BIT(26)
+#define GPIO45_FLASH_MODE_CFG			BIT(25)
+#define GPIO44_FLASH_MODE_CFG			BIT(24)
+#define GPIO43_FLASH_MODE_CFG			BIT(23)
+#define GPIO42_FLASH_MODE_CFG			BIT(22)
+#define GPIO41_FLASH_MODE_CFG			BIT(21)
+#define GPIO40_FLASH_MODE_CFG			BIT(20)
+#define GPIO39_FLASH_MODE_CFG			BIT(19)
+#define GPIO38_FLASH_MODE_CFG			BIT(18)
+#define GPIO37_FLASH_MODE_CFG			BIT(17)
+#define GPIO36_FLASH_MODE_CFG			BIT(16)
+#define GPIO31_FLASH_MODE_CFG			BIT(15)
+#define GPIO30_FLASH_MODE_CFG			BIT(14)
+#define GPIO29_FLASH_MODE_CFG			BIT(13)
+#define GPIO28_FLASH_MODE_CFG			BIT(12)
+#define GPIO27_FLASH_MODE_CFG			BIT(11)
+#define GPIO26_FLASH_MODE_CFG			BIT(10)
+#define GPIO25_FLASH_MODE_CFG			BIT(9)
+#define GPIO24_FLASH_MODE_CFG			BIT(8)
+#define GPIO23_FLASH_MODE_CFG			BIT(7)
+#define GPIO22_FLASH_MODE_CFG			BIT(6)
+#define GPIO21_FLASH_MODE_CFG			BIT(5)
+#define GPIO20_FLASH_MODE_CFG			BIT(4)
+#define GPIO19_FLASH_MODE_CFG			BIT(3)
+#define GPIO18_FLASH_MODE_CFG			BIT(2)
+#define GPIO17_FLASH_MODE_CFG			BIT(1)
+#define GPIO16_FLASH_MODE_CFG			BIT(0)
+
+#define AIROHA_PINCTRL_GPIO(gpio, mux_val)			\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap_size = 1,				\
+	}
+
+#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			0					\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
+/* PWM */
+#define AIROHA_PINCTRL_PWM(gpio, mux_val)			\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_MUX,			\
+			REG_GPIO_FLASH_MODE_CFG,		\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap_size = 1,				\
+	}
+
+#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)			\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap_size = 1,				\
+	}
+
+#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
+#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
+	{								\
+		.name = (gpio),						\
+		.regmap[0] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_GPIO_2ND_I2C_MODE,				\
+			(mux_val),					\
+			(mux_val),					\
+		},							\
+		.regmap[1] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_LAN_LED0_MAPPING,				\
+			(map_mask),					\
+			(map_val),					\
+		},							\
+		.regmap_size = 2,					\
+	}
+
+#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)	\
+	{								\
+		.name = (gpio),						\
+		.regmap[0] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_GPIO_2ND_I2C_MODE,				\
+			(mux_val),					\
+			(mux_val),					\
+		},							\
+		.regmap[1] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_LAN_LED1_MAPPING,				\
+			(map_mask),					\
+			(map_val),					\
+		},							\
+		.regmap_size = 2,					\
+	}
+
+static struct pinctrl_pin_desc pinctrl_pins[] = {
+	PINCTRL_PIN(2, "i2c_sda"),
+	PINCTRL_PIN(3, "i2c_scl"),
+	PINCTRL_PIN(4, "spi_cs0"),
+	PINCTRL_PIN(5, "spi_clk"),
+	PINCTRL_PIN(6, "spi_mosi"),
+	PINCTRL_PIN(7, "spi_miso"),
+	PINCTRL_PIN(8, "uart1_txd"),
+	PINCTRL_PIN(9, "uart1_rxd"),
+	PINCTRL_PIN(12, "gpio0"),
+	PINCTRL_PIN(13, "gpio1"),
+	PINCTRL_PIN(14, "gpio2"),
+	PINCTRL_PIN(15, "gpio3"),
+	PINCTRL_PIN(16, "gpio4"),
+	PINCTRL_PIN(17, "gpio5"),
+	PINCTRL_PIN(18, "gpio6"),
+	PINCTRL_PIN(19, "gpio7"),
+	PINCTRL_PIN(20, "gpio8"),
+	PINCTRL_PIN(21, "gpio9"),
+	PINCTRL_PIN(22, "gpio10"),
+	PINCTRL_PIN(23, "gpio11"),
+	PINCTRL_PIN(24, "gpio12"),
+	PINCTRL_PIN(25, "gpio13"),
+	PINCTRL_PIN(26, "gpio14"),
+	PINCTRL_PIN(27, "gpio15"),
+	PINCTRL_PIN(28, "gpio16"),
+	PINCTRL_PIN(29, "gpio17"),
+	PINCTRL_PIN(30, "gpio18"),
+	PINCTRL_PIN(31, "gpio19"),
+	PINCTRL_PIN(32, "gpio20"),
+	PINCTRL_PIN(33, "gpio21"),
+	PINCTRL_PIN(34, "gpio22"),
+	PINCTRL_PIN(35, "gpio23"),
+	PINCTRL_PIN(36, "gpio24"),
+	PINCTRL_PIN(37, "gpio25"),
+	PINCTRL_PIN(38, "gpio26"),
+	PINCTRL_PIN(39, "gpio27"),
+	PINCTRL_PIN(40, "pcie_reset0"),
+	PINCTRL_PIN(41, "pcie_reset1"),
+};
+
+static const int pon_pins[] = { 28, 29, 30, 31, 32, 33 };
+static const int pon_tod_1pps_pins[] = { 21 };
+static const int gsw_tod_1pps_pins[] = { 21 };
+static const int sipo_pins[] = { 13, 38 };
+static const int sipo_rclk_pins[] = { 13, 30, 38 };
+static const int mdio_pins[] = { 20, 21 };
+static const int uart2_pins[] = { 20, 21 };
+static const int npu_uart_pins[] = { 13, 38 };
+static const int i2c0_pins[] = { 2, 3 };
+static const int i2c1_pins[] = { 14, 15 };
+static const int jtag_udi_pins[] = { 34, 35, 36, 37, 38 };
+static const int jtag_dfd_pins[] = { 34, 35, 36, 37, 38 };
+static const int i2s_pins[] = { 16, 17, 18, 19 };
+static const int pcm1_pins[] = { 24, 25, 26, 27 };
+static const int pcm2_pins[] = { 16, 17, 18, 19 };
+static const int spi_pins[] = { 4, 5, 6, 7 };
+static const int spi_quad_pins[] = { 14, 15 };
+static const int spi_cs1_pins[] = { 21 };
+static const int pcm_spi_pins[] = { 16, 17, 18, 19, 24, 25, 26, 27 };
+static const int pcm_spi_int_pins[] = { 15 };
+static const int pcm_spi_rst_pins[] = { 14 };
+static const int pcm_spi_cs1_pins[] = { 22 };
+static const int pcm_spi_cs2_p128_pins[] = { 39 };
+static const int pcm_spi_cs2_p156_pins[] = { 39 };
+static const int pcm_spi_cs3_pins[] = { 20 };
+static const int pcm_spi_cs4_pins[] = { 23 };
+static const int gpio0_pins[] = { 12 };
+static const int gpio1_pins[] = { 13 };
+static const int gpio2_pins[] = { 14 };
+static const int gpio3_pins[] = { 15 };
+static const int gpio4_pins[] = { 16 };
+static const int gpio5_pins[] = { 17 };
+static const int gpio6_pins[] = { 18 };
+static const int gpio7_pins[] = { 19 };
+static const int gpio8_pins[] = { 20 };
+static const int gpio9_pins[] = { 21 };
+static const int gpio10_pins[] = { 22 };
+static const int gpio11_pins[] = { 23 };
+static const int gpio12_pins[] = { 24 };
+static const int gpio13_pins[] = { 25 };
+static const int gpio14_pins[] = { 26 };
+static const int gpio15_pins[] = { 27 };
+static const int gpio16_pins[] = { 28 };
+static const int gpio17_pins[] = { 29 };
+static const int gpio18_pins[] = { 30 };
+static const int gpio19_pins[] = { 31 };
+static const int gpio20_pins[] = { 32 };
+static const int gpio21_pins[] = { 33 };
+static const int gpio22_pins[] = { 34 };
+static const int gpio23_pins[] = { 35 };
+static const int gpio24_pins[] = { 36 };
+static const int gpio25_pins[] = { 37 };
+static const int gpio26_pins[] = { 38 };
+static const int gpio27_pins[] = { 39 };
+static const int gpio28_pins[] = { 40 };
+static const int gpio29_pins[] = { 41 };
+static const int pcie_reset0_pins[] = { 40 };
+static const int pcie_reset1_pins[] = { 41 };
+
+static const struct pingroup pinctrl_groups[] = {
+	PINCTRL_PIN_GROUP("pon", pon),
+	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
+	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
+	PINCTRL_PIN_GROUP("sipo", sipo),
+	PINCTRL_PIN_GROUP("sipo_rclk", sipo_rclk),
+	PINCTRL_PIN_GROUP("mdio", mdio),
+	PINCTRL_PIN_GROUP("uart2", uart2),
+	PINCTRL_PIN_GROUP("npu_uart", npu_uart),
+	PINCTRL_PIN_GROUP("i2c0", i2c0),
+	PINCTRL_PIN_GROUP("i2c1", i2c1),
+	PINCTRL_PIN_GROUP("jtag_udi", jtag_udi),
+	PINCTRL_PIN_GROUP("jtag_dfd", jtag_dfd),
+	PINCTRL_PIN_GROUP("i2s", i2s),
+	PINCTRL_PIN_GROUP("pcm1", pcm1),
+	PINCTRL_PIN_GROUP("pcm2", pcm2),
+	PINCTRL_PIN_GROUP("spi", spi),
+	PINCTRL_PIN_GROUP("spi_quad", spi_quad),
+	PINCTRL_PIN_GROUP("spi_cs1", spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi", pcm_spi),
+	PINCTRL_PIN_GROUP("pcm_spi_int", pcm_spi_int),
+	PINCTRL_PIN_GROUP("pcm_spi_rst", pcm_spi_rst),
+	PINCTRL_PIN_GROUP("pcm_spi_cs1", pcm_spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2_p128", pcm_spi_cs2_p128),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2_p156", pcm_spi_cs2_p156),
+	PINCTRL_PIN_GROUP("pcm_spi_cs3", pcm_spi_cs3),
+	PINCTRL_PIN_GROUP("pcm_spi_cs4", pcm_spi_cs4),
+	PINCTRL_PIN_GROUP("gpio0", gpio0),
+	PINCTRL_PIN_GROUP("gpio1", gpio1),
+	PINCTRL_PIN_GROUP("gpio2", gpio2),
+	PINCTRL_PIN_GROUP("gpio3", gpio3),
+	PINCTRL_PIN_GROUP("gpio4", gpio4),
+	PINCTRL_PIN_GROUP("gpio5", gpio5),
+	PINCTRL_PIN_GROUP("gpio6", gpio6),
+	PINCTRL_PIN_GROUP("gpio7", gpio7),
+	PINCTRL_PIN_GROUP("gpio8", gpio8),
+	PINCTRL_PIN_GROUP("gpio9", gpio9),
+	PINCTRL_PIN_GROUP("gpio10", gpio10),
+	PINCTRL_PIN_GROUP("gpio11", gpio11),
+	PINCTRL_PIN_GROUP("gpio12", gpio12),
+	PINCTRL_PIN_GROUP("gpio13", gpio13),
+	PINCTRL_PIN_GROUP("gpio14", gpio14),
+	PINCTRL_PIN_GROUP("gpio15", gpio15),
+	PINCTRL_PIN_GROUP("gpio16", gpio16),
+	PINCTRL_PIN_GROUP("gpio17", gpio17),
+	PINCTRL_PIN_GROUP("gpio18", gpio18),
+	PINCTRL_PIN_GROUP("gpio19", gpio19),
+	PINCTRL_PIN_GROUP("gpio20", gpio20),
+	PINCTRL_PIN_GROUP("gpio21", gpio21),
+	PINCTRL_PIN_GROUP("gpio22", gpio22),
+	PINCTRL_PIN_GROUP("gpio23", gpio23),
+	PINCTRL_PIN_GROUP("gpio24", gpio24),
+	PINCTRL_PIN_GROUP("gpio25", gpio25),
+	PINCTRL_PIN_GROUP("gpio26", gpio26),
+	PINCTRL_PIN_GROUP("gpio27", gpio27),
+	PINCTRL_PIN_GROUP("gpio28", gpio28),
+	PINCTRL_PIN_GROUP("gpio29", gpio29),
+	PINCTRL_PIN_GROUP("pcie_reset0", pcie_reset0),
+	PINCTRL_PIN_GROUP("pcie_reset1", pcie_reset1),
+};
+
+static const char *const pon_groups[] = { "pon" };
+static const char *const tod_1pps_groups[] = {
+	"pon_tod_1pps", "gsw_tod_1pps"
+};
+static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
+static const char *const mdio_groups[] = { "mdio" };
+static const char *const uart_groups[] = { "uart2", "npu_uart" };
+static const char *const i2c_groups[] = { "i2c1" };
+static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
+static const char *const pcm_groups[] = { "pcm1", "pcm2" };
+static const char *const spi_groups[] = { "spi_quad", "spi_cs1" };
+static const char *const pcm_spi_groups[] = {
+	"pcm_spi", "pcm_spi_int", "pcm_spi_rst", "pcm_spi_cs1",
+	"pcm_spi_cs2_p156", "pcm_spi_cs2_p128", "pcm_spi_cs3", "pcm_spi_cs4"
+};
+static const char *const i2s_groups[] = { "i2s" };
+static const char *const gpio_groups[] = { "gpio28", "gpio29" };
+static const char *const pcie_reset_groups[] = {
+	"pcie_reset0", "pcie_reset1"
+};
+static const char *const pwm_groups[] = {
+	"gpio0",  "gpio1",  "gpio2",  "gpio3",  "gpio4",  "gpio5",
+	"gpio6",  "gpio7",  "gpio8",  "gpio9",  "gpio10", "gpio11",
+	"gpio12", "gpio13", "gpio14", "gpio15", "gpio16", "gpio17",
+	"gpio18", "gpio19", "gpio20", "gpio21", "gpio22", "gpio23",
+	"gpio24", "gpio25", "gpio26", "gpio27", "gpio28", "gpio29"
+};
+static const char *const phy1_led0_groups[] = {
+	"gpio22", "gpio23", "gpio24", "gpio25"
+};
+static const char *const phy2_led0_groups[] = {
+	"gpio22", "gpio23", "gpio24", "gpio25"
+};
+static const char *const phy3_led0_groups[] = {
+	"gpio22", "gpio23", "gpio24", "gpio25"
+};
+static const char *const phy4_led0_groups[] = {
+	"gpio22", "gpio23", "gpio24", "gpio25"
+};
+static const char *const phy1_led1_groups[] = {
+	"gpio7", "gpio6", "gpio5", "gpio4"
+};
+static const char *const phy2_led1_groups[] = {
+	"gpio7", "gpio6", "gpio5", "gpio4"
+};
+static const char *const phy3_led1_groups[] = {
+	"gpio7", "gpio6", "gpio5", "gpio4"
+};
+static const char *const phy4_led1_groups[] = {
+	"gpio7", "gpio6", "gpio5", "gpio4"
+};
+
+static const struct airoha_pinctrl_func_group pon_func_group[] = {
+	{
+		.name = "pon",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PON_MODE_MASK,
+			GPIO_PON_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
+	{
+		.name = "pon_tod_1pps",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_2ND_I2C_MODE,
+			PON_TOD_1PPS_MODE_MASK,
+			PON_TOD_1PPS_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "gsw_tod_1pps",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_2ND_I2C_MODE,
+			GSW_TOD_1PPS_MODE_MASK,
+			GSW_TOD_1PPS_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group sipo_func_group[] = {
+	{
+		.name = "sipo",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
+			GPIO_SIPO_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "sipo_rclk",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
+			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group mdio_func_group[] = {
+	{
+		.name = "mdio",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_SGMII_MDIO_MODE_MASK,
+			GPIO_SGMII_MDIO_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group uart_func_group[] = {
+	{
+		.name = "uart2",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_UART2_MODE_MASK,
+			GPIO_UART2_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "npu_uart",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_NPU_UART_EN,
+			NPU_UART_EN_MASK,
+			NPU_UART_EN_MASK
+		},
+		.regmap_size = 1,
+	}
+};
+
+static const struct airoha_pinctrl_func_group i2c_func_group[] = {
+	{
+		.name = "i2c1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_2ND_I2C_MODE,
+			GPIO_2ND_I2C_MODE_MASK,
+			GPIO_2ND_I2C_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group jtag_func_group[] = {
+	{
+		.name = "jtag_udi",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_NPU_UART_EN,
+			JTAG_UDI_EN_MASK,
+			JTAG_UDI_EN_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "jtag_dfd",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_NPU_UART_EN,
+			JTAG_DFD_EN_MASK,
+			JTAG_DFD_EN_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group pcm_func_group[] = {
+	{
+		.name = "pcm1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM1_MODE_MASK,
+			GPIO_PCM1_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm2",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM2_MODE_MASK,
+			GPIO_PCM2_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group spi_func_group[] = {
+	{
+		.name = "spi_quad",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_QUAD_MODE_MASK,
+			GPIO_SPI_QUAD_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "spi_cs1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_CS1_MODE_MASK,
+			GPIO_SPI_CS1_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
+	{
+		.name = "pcm_spi",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_MODE_MASK,
+			GPIO_PCM_SPI_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_int",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_INT_MODE_MASK,
+			GPIO_PCM_INT_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_rst",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_RESET_MODE_MASK,
+			GPIO_PCM_RESET_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS1_MODE_MASK,
+			GPIO_PCM_SPI_CS1_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs2_p128",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS2_MODE_P128_MASK,
+			GPIO_PCM_SPI_CS2_MODE_P128_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs2_p156",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS2_MODE_P156_MASK,
+			GPIO_PCM_SPI_CS2_MODE_P156_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs3",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS3_MODE_MASK,
+			GPIO_PCM_SPI_CS3_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs4",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS4_MODE_MASK,
+			GPIO_PCM_SPI_CS4_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group i2s_func_group[] = {
+	{
+		.name = "i2s",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_2ND_I2C_MODE,
+			GPIO_I2S_MODE_MASK,
+			GPIO_I2S_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group gpio_func_group[] = {
+	AIROHA_PINCTRL_GPIO_EXT("gpio28", GPIO28_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio29", GPIO29_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET1_MASK),
+};
+
+static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
+	{
+		.name = "pcie_reset0",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PCIE_RESET0_MASK,
+			0
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcie_reset1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PCIE_RESET1_MASK,
+			0
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group pwm_func_group[] = {
+	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio28", GPIO28_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio29", GPIO29_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET1_MASK),
+};
+
+static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED0("gpio22", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED0("gpio23", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED0("gpio24", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED0("gpio25", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
+};
+
+static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED0("gpio22", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED0("gpio23", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED0("gpio24", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED0("gpio25", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
+};
+
+static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED0("gpio22", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED0("gpio23", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED0("gpio24", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED0("gpio25", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+};
+
+static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED0("gpio22", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED0("gpio23", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED0("gpio24", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED0("gpio25", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
+};
+
+static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED1("gpio7", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED1("gpio6", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED1("gpio5", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED1("gpio4", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
+};
+
+static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED1("gpio7", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED1("gpio6", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED1("gpio5", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED1("gpio4", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
+};
+
+static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED1("gpio7", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1("gpio6", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1("gpio5", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1("gpio4", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+};
+
+static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED1("gpio7", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED1("gpio6", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED1("gpio5", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED1("gpio4", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
+};
+
+static const struct airoha_pinctrl_func pinctrl_funcs[] = {
+	PINCTRL_FUNC_DESC("pon", pon),
+	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
+	PINCTRL_FUNC_DESC("sipo", sipo),
+	PINCTRL_FUNC_DESC("mdio", mdio),
+	PINCTRL_FUNC_DESC("uart", uart),
+	PINCTRL_FUNC_DESC("i2c", i2c),
+	PINCTRL_FUNC_DESC("jtag", jtag),
+	PINCTRL_FUNC_DESC("pcm", pcm),
+	PINCTRL_FUNC_DESC("spi", spi),
+	PINCTRL_FUNC_DESC("pcm_spi", pcm_spi),
+	PINCTRL_FUNC_DESC("i2s", i2s),
+	PINCTRL_FUNC_DESC("gpio", gpio),
+	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
+	PINCTRL_FUNC_DESC("pwm", pwm),
+	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
+	PINCTRL_FUNC_DESC("phy2_led0", phy2_led0),
+	PINCTRL_FUNC_DESC("phy3_led0", phy3_led0),
+	PINCTRL_FUNC_DESC("phy4_led0", phy4_led0),
+	PINCTRL_FUNC_DESC("phy1_led1", phy1_led1),
+	PINCTRL_FUNC_DESC("phy2_led1", phy2_led1),
+	PINCTRL_FUNC_DESC("phy3_led1", phy3_led1),
+	PINCTRL_FUNC_DESC("phy4_led1", phy4_led1),
+};
+
+static const struct airoha_pinctrl_conf pinctrl_pullup_conf[] = {
+	PINCTRL_CONF_DESC(12, REG_GPIO_L_PU, BIT(0)),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_PU, BIT(1)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_PU, BIT(2)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_PU, BIT(3)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_PU, BIT(4)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_PU, BIT(5)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_PU, BIT(6)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_PU, BIT(7)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_PU, BIT(8)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(9)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_PU, BIT(10)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_PU, BIT(11)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_PU, BIT(12)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_PU, BIT(13)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_PU, BIT(14)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_PU, BIT(15)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_PU, BIT(16)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_PU, BIT(17)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_PU, BIT(18)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_PU, BIT(19)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_PU, BIT(20)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_PU, BIT(21)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_L_PU, BIT(22)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_L_PU, BIT(23)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_L_PU, BIT(24)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_L_PU, BIT(25)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_L_PU, BIT(26)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_L_PU, BIT(27)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_L_PU, BIT(28)),
+	PINCTRL_CONF_DESC(41, REG_GPIO_L_PU, BIT(29)),
+};
+
+static const struct airoha_pinctrl_conf pinctrl_pulldown_conf[] = {
+	PINCTRL_CONF_DESC(12, REG_GPIO_L_PD, BIT(0)),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_PD, BIT(1)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_PD, BIT(2)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_PD, BIT(3)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_PD, BIT(4)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_PD, BIT(5)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_PD, BIT(6)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_PD, BIT(7)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_PD, BIT(8)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(9)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_PD, BIT(10)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_PD, BIT(11)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_PD, BIT(12)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_PD, BIT(13)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_PD, BIT(14)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_PD, BIT(15)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_PD, BIT(16)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_PD, BIT(17)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_PD, BIT(18)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_PD, BIT(19)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_PD, BIT(20)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_PD, BIT(21)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_L_PD, BIT(22)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_L_PD, BIT(23)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_L_PD, BIT(24)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_L_PD, BIT(25)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_L_PD, BIT(26)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_L_PD, BIT(27)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_L_PD, BIT(28)),
+	PINCTRL_CONF_DESC(41, REG_GPIO_L_PD, BIT(29)),
+};
+
+static const struct airoha_pinctrl_conf pinctrl_drive_e2_conf[] = {
+	PINCTRL_CONF_DESC(12, REG_GPIO_L_E2, BIT(0)),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_E2, BIT(1)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_E2, BIT(2)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_E2, BIT(3)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_E2, BIT(4)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_E2, BIT(5)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_E2, BIT(6)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_E2, BIT(7)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_E2, BIT(8)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(9)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_E2, BIT(10)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_E2, BIT(11)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_E2, BIT(12)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_E2, BIT(13)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_E2, BIT(14)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_E2, BIT(15)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_E2, BIT(16)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_E2, BIT(17)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_E2, BIT(18)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_E2, BIT(19)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_E2, BIT(20)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_E2, BIT(21)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_L_E2, BIT(22)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_L_E2, BIT(23)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_L_E2, BIT(24)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_L_E2, BIT(25)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_L_E2, BIT(26)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_L_E2, BIT(27)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_L_E2, BIT(28)),
+	PINCTRL_CONF_DESC(41, REG_GPIO_L_E2, BIT(29)),
+};
+
+static const struct airoha_pinctrl_conf pinctrl_drive_e4_conf[] = {
+	PINCTRL_CONF_DESC(12, REG_GPIO_L_E4, BIT(0)),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_E4, BIT(1)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_E4, BIT(2)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_E4, BIT(3)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_E4, BIT(4)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_E4, BIT(5)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_E4, BIT(6)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_E4, BIT(7)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_E4, BIT(8)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(9)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_E4, BIT(10)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_E4, BIT(11)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_E4, BIT(12)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_E4, BIT(13)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_E4, BIT(14)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_E4, BIT(15)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_E4, BIT(16)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_E4, BIT(17)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_E4, BIT(18)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_E4, BIT(19)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_E4, BIT(20)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_E4, BIT(21)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_L_E4, BIT(22)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_L_E4, BIT(23)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_L_E4, BIT(24)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_L_E4, BIT(25)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_L_E4, BIT(26)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_L_E4, BIT(27)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_L_E4, BIT(28)),
+	PINCTRL_CONF_DESC(41, REG_GPIO_L_E4, BIT(29)),
+};
+
+static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.pins = pinctrl_pins,
+	.num_pins = ARRAY_SIZE(pinctrl_pins),
+	.grps = pinctrl_groups,
+	.num_grps = ARRAY_SIZE(pinctrl_groups),
+	.funcs = pinctrl_funcs,
+	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
+	.confs_info = {
+		[AIROHA_PINCTRL_CONFS_PULLUP] = {
+			.confs = pinctrl_pullup_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pullup_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_PULLDOWN] = {
+			.confs = pinctrl_pulldown_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pulldown_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
+			.confs = pinctrl_drive_e2_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_drive_e2_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
+			.confs = pinctrl_drive_e4_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_drive_e4_conf),
+		},
+	},
+};
+
+static const struct of_device_id airoha_pinctrl_of_match[] = {
+	{ .compatible = "airoha,en7523-pinctrl", .data = &pinctrl_match_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, airoha_pinctrl_of_match);
+
+static struct platform_driver airoha_pinctrl_driver = {
+	.probe = airoha_pinctrl_probe,
+	.driver = {
+		.name = "pinctrl-airoha-en7523",
+		.of_match_table = airoha_pinctrl_of_match,
+	},
+};
+module_platform_driver(airoha_pinctrl_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
+MODULE_AUTHOR("Benjamin Larsson <benjamin.larsson@genexis.eu>");
+MODULE_AUTHOR("Markus Gothe <markus.gothe@genexis.eu>");
+MODULE_AUTHOR("Matheus Sampaio Queiroga <srherobrine20@gmail.com>");
+MODULE_AUTHOR("Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>");
+MODULE_DESCRIPTION("Pinctrl driver for Airoha EN7523 SoC");
-- 
2.53.0


