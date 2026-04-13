Return-Path: <linux-gpio+bounces-35080-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJabJ1rE3Gn5VwkAu9opvQ
	(envelope-from <linux-gpio+bounces-35080-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 12:24:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 413A53EA93A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 12:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18EAF30074B3
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 10:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E803AEF53;
	Mon, 13 Apr 2026 10:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="qoZkc8kj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazon11020076.outbound.protection.outlook.com [52.101.186.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E02B4A32;
	Mon, 13 Apr 2026 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.186.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075863; cv=fail; b=oGoBhIkcAawza77QZylwG3bKV4U6GgkF3SG8A/yVxMzRKcAaHfNAKgQBlIIJRTN0YzyvP/4x5r3Y4+kGvmcS9+V4FxmHCCQviKuXrqtc301AS99NmH30B4172tT9wHEyf1sfxcG9ebxJbq5ALpJ6udU+LrTB65QJwA64/8KEQQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075863; c=relaxed/simple;
	bh=UwoBwz/5UqmaCF/DIS8nWi3Ey2xsiSG2t0OaoRUAbjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IhPYgsXupOsWsQ7zG0IKT3zzceK1C8C7XBq1rCG12ANKVw5q5d6F+4U0KEl8cw5qB7AuTr29bp/w6bYYprE7bZ6i1f7IDpJVf01upgtnaTelfGUGWKk0eEXccgR4+2QGqyUQ6T57tVnAQtuVkc/dCR82UiBsHa1/JJFrPzJlw1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=qoZkc8kj; arc=fail smtp.client-ip=52.101.186.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ee4djNtbF94gXUF+ScWnFmCihIqL5nPx//5qB9QXeQiQOiy2QDhA759W3Zg1tNBo9iLbHksuvc2Mxp2MSagsLyHroIId3lhFp6YK3BqiBIkLdQgN4jf+Kv8p66BikWJxOvlheeZF9ISYmgTzFTMUMSi+PWowJFg4Dm63fZf2zq45JXi8bpYeZzcBHornledPR2h3NNt+OVBm7Nhm4DNZpp+JKsTik0VesKoS9fWmADJQpc5+w/nQVoeF5jQLk82/YIFlKOwEAZaPQUZQn1iHsqaN451Ak1PZGRX5bG0r+4JMalwRH2TFLAyHluicaPIwRLTbcBJT6qnInN/JoQh6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7MeAXTgDkJxFEnnQk8qhILI3soPTqKO5syN/ShRqgE=;
 b=cANSMQTvDqcB1OvPHw+akNJ53hOCSwPJDOKMKr7CVPCAfJs7Os1gw0/6R0hKBihZ5KQKO7X7Qj7xNBBrxnRzWtvSJyJ7iOVAXyjJRLjHZqJQFVtXfoLeyDZcoC0FyexMW0yxEIN8MaRRgeKrMBosKmHHatQqopdshHEU6JROldP8rkqrGGATscI5cn/EYh+NhiYIuWuf44hGgnC3FIE09PoewEstVdMGxvarOS5zISh4Mo/9Rs7NLBt+wLzICX8oNIH3o1aP21OQdwFmA65Q2hBmjKX0S9kRCQ0mi9K+pJNmA5jvCNCLPHoDM+fNbKKsCG7yBF3RwFOPDVBzNeTYfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.3) smtp.rcpttodomain=kernel.org smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7MeAXTgDkJxFEnnQk8qhILI3soPTqKO5syN/ShRqgE=;
 b=qoZkc8kjro3V8wA8RyhiEkVQtw4Vkt6ZmzFoGDrvaL78CcK6GzRP8kQCv7YoVUiertUDZ+8ekG4Ecy4RNc9q+S6Oz+Cd+5iKGopvYdop47mLEzihtWqUAJvBYmnA1KH5kgQzcTAFRqX9AoQ0IfVCot396HUvtk5aUR9jW/jQu0g=
Received: from DUZP191CA0039.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::13)
 by ZR1PPF0FE8DDD05.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::287) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.42; Mon, 13 Apr
 2026 10:24:15 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::c5) by DUZP191CA0039.outlook.office365.com
 (2603:10a6:10:4f8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 10:24:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.3)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.3 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.3; helo=ZRAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver02.de.seppmail.cloud (2a01:4f8:272:5fe6::218) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (2603:10a6:18:3::107) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 13 Apr 2026 10:24:12 +0000
Received: from hz-glue02.de.seppmail.cloud (unknown [10.11.0.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver02.de.seppmail.cloud (Postfix) with ESMTPS id 4fvNmr4j26z11Kl;
	Mon, 13 Apr 2026 12:24:12 +0200 (CEST)
Received: from hz-glue02.de.seppmail.cloud (unknown [172.18.0.5])
	by hz-glue02.de.seppmail.cloud (Postfix) with ESMTP id 4fvNmr4TJNz1xMS;
	Mon, 13 Apr 2026 12:24:12 +0200 (CEST)
X-SEPP-Suspect: 38de577852c9412c8bfbca7ab40d0dbe
Received: from hz-scan04.de.seppmail.cloud (unknown [10.11.0.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue06.de.seppmail.cloud (Postfix) with ESMTPS id 4fvNmr3qJmz1wJr;
	Mon, 13 Apr 2026 12:24:12 +0200 (CEST)
Received: from hz-scan04 (localhost [127.0.0.1])
	by hz-scan04.de.seppmail.cloud (Postfix) with SMTP id 4fvNmr35Xgz6qlZ;
	Mon, 13 Apr 2026 12:24:12 +0200 (CEST)
Received: from hz-m365gate04.de.seppmail.cloud (unknown [10.11.0.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan04.de.seppmail.cloud (Postfix) with ESMTPS;
	Mon, 13 Apr 2026 12:24:10 +0200 (CEST)
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp17010003.outbound.protection.outlook.com [40.93.85.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate04.de.seppmail.cloud (Postfix) with ESMTPS id 4fvNmn51KTz1yts;
	Mon, 13 Apr 2026 12:24:09 +0200 (CEST)
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZR1P278MB0997.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5a::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.48; Mon, 13 Apr 2026 10:24:07 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 10:24:07 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: linusw@kernel.org,
	brgl@kernel.org,
	wbg@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [RFC PATCH v2 1/3] gpio: mmio: convert accessors to generic register descriptors
Date: Mon, 13 Apr 2026 12:23:24 +0200
Message-ID: <20260413102326.59343-2-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com>
References: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA3P292CA0047.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::9) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|ZR1P278MB0997:EE_|DU2PEPF0001E9C2:EE_|ZR1PPF0FE8DDD05:EE_
X-MS-Office365-Filtering-Correlation-Id: 56172a57-2292-4b17-eafe-08de9946cee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|52116014|366016|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 5bBbYvRTcngjMvno2nrOO02Gqm6d6U5uB/Y6jAmSo5zCWZhz1jOToXBdCsn9aKELJG6cPx/rBP0s1cU1kJb+QZ7ov0ky/no3+3+KQJSJdxV0PKxqHOU4Mr6dhTfMMqDRuUVPCSqZiTHFPGkenK21dm3MEfTZQJBdwHny8VNL4/9Vc5CtJ9Z33UNU7c781oXeZS9IYOukQA0vJDHgwFWcfeWzEVwlMPgKTFhzXXDSWEHL+LJhcaDN3/WGSSx+exp731IPQGSL907T4lZxPftosjHdZnKjd6F8z8XhPG/4Ntft1/+K3Gx+pIZUqtePqVDZrMlpFUg4Ga1Pbrd/wAh5TV4UgQ8N4NCQYbgdWrmougYgMcVxwxYehbuK6GE+75o0U61Fo/lfmCbaBKJz5xe1Key/1bVSO7GPuAHfgVHcVSjBjo1Hl88IfktBYF6XG2KuXmXMyf7isBBLLMwSo4y96FD6NBbC2409St3tGllsAPx5QxXfKBCb7a+Hq+jvgfnCz5YoxtS/6V6ngIEquo2Ca221LejfCdm+B8ynemocG7yMYnxtyAvDRQyG0Osp5xUN2Clz5F2wdW/n35Wie8lwcV9OBip+0c8fhL9gdEP9GRwQ3t0LWPK5ABywakniNdFjgxJxHmH6W/GFTRsFXyw2aOP5MTMtXj73CH9UE5c6vxWwMT+6uenjRDFOU8k3AUdQK03eftHFryNAzr30MCjxTSP458eFWAqnwdpthbF851kt7mBGdWR49u4RtVtuyNSr7/I53DJ5kLUt7ZE14KuefrhuDltXBdAcWNTCQv2v7jk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 jU3LbXovvhxD5n14Fhs3ayO4ukgOkoEBaTVQBGp6/UuWhJi6wpd40yrho7bCkz0OsoVIPakVPV+uBY8qIQOiBFd0PD1tjbEYBtGhhjjIJIvDW2I/ytCJpX4CDMammBdg4sS/FueUHdz1emagDwbYLGyRsE0gdpV+e/Xg6Y7Uu0H2e9e6W/vWJ9ZBSv4j+zFfEjKObgpjoSM8degYQRpcbMztj/ttDlH7jnN5rdNd7R8vo6cIphmJmrf0IAlm9mXRykhE0tWNTNjDdSICcyt7MhRqbKG5TgNoDLYZ2AASWVzttb70QycgKL2CoIcoZvwH2SgfMJsTsNKnuGoE6gwZ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB0997
X-SEPP-CCCVersion: 2026-03-30T09:40:10+02:00 639c564b
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.3];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.3];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0f4dad29-d0be-4d53-dac1-08de9946cba5
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|35042699022|36860700016|82310400026|14060799003|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iXngvvX+uxGrYw3fOwfrdeD43hl7iLL9592PQcjz/zLo5FyRvGACG4TbK32E?=
 =?us-ascii?Q?w6yDFSMMngr+rz1E+ix14Cyp0pDjLJ4Y9fSifZQ1dIbDclaKyx8PTQ+D+7hn?=
 =?us-ascii?Q?XK/omOxOEtdHQXc0g+Ppv1PS9NtpoQN3J5IH1FagDVngAsa2duQg4XII+Lei?=
 =?us-ascii?Q?Bmddk9mA48ZinYs4sSxuTycmI4s1C148GeB+cf4LOONVAW+5BTGbqCQ0Uhp9?=
 =?us-ascii?Q?RooMjjOfKWdBFIQP9l9Wbik8oebIfPACFIEfQd0z0udLOMjMrCsJAzvoR573?=
 =?us-ascii?Q?kDyrrEPrBSHJZx9Po8Odc3bqMqj1Kq6zpoK/dKoHpA8sGUH+4isq1Munz3bT?=
 =?us-ascii?Q?Wv5esQQYR7BUJfV30mOwlBs1XDGW4DGCyIwGSViWwTiuht17f0uFqsT6H0EU?=
 =?us-ascii?Q?I70vrk2zZtnMgMuDhUlG46jVKXUy/5Zgepm2UO/YAVrq4QMCfIaj0rsZ3w5s?=
 =?us-ascii?Q?CQdGA/2gXP+lKgxkJ80Wa7H5km6vPeg7kUU19Y6w7sj4DHRSvTFV64rR9bvL?=
 =?us-ascii?Q?td0DbwlUGhJnacVBhA8xOTexkZXKk5b0G31Z0HKBnJ54uGspv8lAY8C7D46D?=
 =?us-ascii?Q?GdY72i+GMx9+UoQgCvuMg255kQDuYBt0ufhn38tJSzurYgbfOaP6OilPnbzl?=
 =?us-ascii?Q?QUBv79kCHIRVOGvwJTbHRzYnu1r6Pgup0gYdPu0VGZarfJ6yay0WWbUvND6g?=
 =?us-ascii?Q?d3zSxan8xa1p9OFfO/m4mNDBszANWdXaa8c1h+g2I7vCVZnHBE5sCV/uA4W0?=
 =?us-ascii?Q?X53sGVZJ9v/E1w5DHe+Xal3wGbETB3tKyGc2azH4IvmpIf/x6CB91DSR+u6u?=
 =?us-ascii?Q?+FChjqt8yFoc2Z7glbCD6obVmS11sVtsYNJjoU87vrz0CX822Ig0IZwQngIK?=
 =?us-ascii?Q?rj2d8zoyL/KmIiQknCxvycSEFAoNF9XTWprirfWqdJaqjdWeQco0graOBlGk?=
 =?us-ascii?Q?HNpmZXDoST2YywvWDFzhlovZMjEGI5wEGx/QVxcB/YAYFY/V0x/71+oxgDev?=
 =?us-ascii?Q?6jQDwXqKMuAWiy8BKQK3bNUpMHZApkopLH7USbRsRUJ0aeNgD8pGLcHn6bZr?=
 =?us-ascii?Q?k9hJKP1Gph4hmJuGMq9c3gQz49YWtGKH6gZMdnjyV+qfYm2JZZdHAs99g/JL?=
 =?us-ascii?Q?hyzlB7JiCDSr/6a0YrSY+pHDAblZgUa03PFg3jHNKrbLY2n7UbFX8iRJuPTB?=
 =?us-ascii?Q?Ch0PUear/rqY/IxPOxTSZ94ENnFrayoEPJdXqZTUnd7aoRsjCbOReNDEpiEN?=
 =?us-ascii?Q?W/Z7CUzKkBGlx+K5L3YK?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:272:5fe6::218;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17010003.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(10070799003)(376014)(35042699022)(36860700016)(82310400026)(14060799003)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IpP9o4Bo7f/6iKDMhj3aPCWK8ri3ows3qeuLZnISGTNHfkMaD37kdZdDpJt+sKZ36+2MB8P8p3A8o8Te7vWqJpwDm7bFr9cBp3G0idTn7vcHMr8G8cSoVfwBtDuXAM6wB+5cFvduTUGEFYw5OMYcWz5kKeCbx0Und4uXYNXmOjh6fQ5LvJmg6/8CHQt+XHnDiuZNKFV7bTxqyUr56fTEmDWuRJcHR+aT6tMl8tgAn3va/Qqt4xPXTGmJtNps9ybCxVTShsOKm4DjsBMlK4eegVUdgNeycaaVVsfr8HhaA6Z+ry7+l/V3aygvIcvWccWD/O7ZN0pn9rWaCB33v3X7jQaXjGTAxum7fuH0sRI38+sE3L+0qQzaicjQuwiAXVGQmpE/TKqh9ktDMU7SFaSqcsW6rVxL4XZA4tt3eLJdXWrLDOjZ4+QYRBB72QVrfbC2
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 10:24:12.9859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56172a57-2292-4b17-eafe-08de9946cee1
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:272:5fe6::218];Helo=[hz-deliver02.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1PPF0FE8DDD05
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[duagon.com,reject];
	R_DKIM_ALLOW(-0.20)[duagon.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35080-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev-josejavier.rodriguez@duagon.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[duagon.com:+];
	RCVD_COUNT_TWELVE(0.00)[14];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 413A53EA93A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the gpio-mmio accessors to use union gpio_chip_reg instead of
the previous MMIO-only register type.

This allows the same accessors to operate on both MMIO and PMIO
registers and aligns gpio-mmio with the updated gpio_generic_chip API.

Move the initialization code shared by MMIO and PMIO devices to a new
function gpio_generic_chip_init_common(), leaving gpio_generic_chip_init()
with the MMIO-specific initialization.

Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
---
 drivers/gpio/gpio-mmio.c     | 208 ++++++++++++++++++-----------------
 include/linux/gpio/generic.h |  37 +++++--
 2 files changed, 138 insertions(+), 107 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index edbcaad57d00..39326ab7e494 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -62,66 +62,71 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 
 #include "gpiolib.h"
 
-static void gpio_mmio_write8(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write8(union gpio_chip_reg *reg, unsigned long data)
 {
-	writeb(data, reg);
+	writeb(data, reg->mmio);
 }
 
-static unsigned long gpio_mmio_read8(void __iomem *reg)
+static unsigned long gpio_mmio_read8(union gpio_chip_reg *reg)
 {
-	return readb(reg);
+	return readb(reg->mmio);
 }
 
-static void gpio_mmio_write16(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write16(union gpio_chip_reg *reg, unsigned long data)
 {
-	writew(data, reg);
+	writew(data, reg->mmio);
 }
 
-static unsigned long gpio_mmio_read16(void __iomem *reg)
+static unsigned long gpio_mmio_read16(union gpio_chip_reg *reg)
 {
-	return readw(reg);
+	return readw(reg->mmio);
 }
 
-static void gpio_mmio_write32(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write32(union gpio_chip_reg *reg, unsigned long data)
 {
-	writel(data, reg);
+	writel(data, reg->mmio);
 }
 
-static unsigned long gpio_mmio_read32(void __iomem *reg)
+static unsigned long gpio_mmio_read32(union gpio_chip_reg *reg)
 {
-	return readl(reg);
+	return readl(reg->mmio);
 }
 
 #if BITS_PER_LONG >= 64
-static void gpio_mmio_write64(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write64(union gpio_chip_reg *reg, unsigned long data)
 {
-	writeq(data, reg);
+	writeq(data, reg->mmio);
 }
 
-static unsigned long gpio_mmio_read64(void __iomem *reg)
+static unsigned long gpio_mmio_read64(union gpio_chip_reg *reg)
 {
-	return readq(reg);
+	return readq(reg->mmio);
 }
 #endif /* BITS_PER_LONG >= 64 */
 
-static void gpio_mmio_write16be(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write16be(union gpio_chip_reg *reg, unsigned long data)
 {
-	iowrite16be(data, reg);
+	iowrite16be(data, reg->mmio);
 }
 
-static unsigned long gpio_mmio_read16be(void __iomem *reg)
+static unsigned long gpio_mmio_read16be(union gpio_chip_reg *reg)
 {
-	return ioread16be(reg);
+	return ioread16be(reg->mmio);
 }
 
-static void gpio_mmio_write32be(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write32be(union gpio_chip_reg *reg, unsigned long data)
 {
-	iowrite32be(data, reg);
+	iowrite32be(data, reg->mmio);
 }
 
-static unsigned long gpio_mmio_read32be(void __iomem *reg)
+static unsigned long gpio_mmio_read32be(union gpio_chip_reg *reg)
 {
-	return ioread32be(reg);
+	return ioread32be(reg->mmio);
+}
+
+static inline bool gpio_chip_reg_is_set(union gpio_chip_reg *reg)
+{
+	return reg->port != 0;
 }
 
 static unsigned long gpio_mmio_line2mask(struct gpio_chip *gc, unsigned int line)
@@ -140,9 +145,9 @@ static int gpio_mmio_get_set(struct gpio_chip *gc, unsigned int gpio)
 	bool dir = !!(chip->sdir & pinmask);
 
 	if (dir)
-		return !!(chip->read_reg(chip->reg_set) & pinmask);
+		return !!(chip->read_reg(&chip->reg_set) & pinmask);
 
-	return !!(chip->read_reg(chip->reg_dat) & pinmask);
+	return !!(chip->read_reg(&chip->reg_dat) & pinmask);
 }
 
 /*
@@ -162,9 +167,9 @@ static int gpio_mmio_get_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	get_mask = *mask & ~chip->sdir;
 
 	if (set_mask)
-		*bits |= chip->read_reg(chip->reg_set) & set_mask;
+		*bits |= chip->read_reg(&chip->reg_set) & set_mask;
 	if (get_mask)
-		*bits |= chip->read_reg(chip->reg_dat) & get_mask;
+		*bits |= chip->read_reg(&chip->reg_dat) & get_mask;
 
 	return 0;
 }
@@ -173,7 +178,7 @@ static int gpio_mmio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
-	return !!(chip->read_reg(chip->reg_dat) & gpio_mmio_line2mask(gc, gpio));
+	return !!(chip->read_reg(&chip->reg_dat) & gpio_mmio_line2mask(gc, gpio));
 }
 
 /*
@@ -186,7 +191,7 @@ static int gpio_mmio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
 
 	/* Make sure we first clear any bits that are zero when we read the register */
 	*bits &= ~*mask;
-	*bits |= chip->read_reg(chip->reg_dat) & *mask;
+	*bits |= chip->read_reg(&chip->reg_dat) & *mask;
 	return 0;
 }
 
@@ -209,7 +214,7 @@ static int gpio_mmio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
 		readmask |= gpio_mmio_line2mask(gc, bit);
 
 	/* Read the register */
-	val = chip->read_reg(chip->reg_dat) & readmask;
+	val = chip->read_reg(&chip->reg_dat) & readmask;
 
 	/*
 	 * Mirror the result into the "bits" result, this will give line 0
@@ -238,7 +243,7 @@ static int gpio_mmio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	else
 		chip->sdata &= ~mask;
 
-	chip->write_reg(chip->reg_dat, chip->sdata);
+	chip->write_reg(&chip->reg_dat, chip->sdata);
 
 	return 0;
 }
@@ -250,9 +255,9 @@ static int gpio_mmio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
 	unsigned long mask = gpio_mmio_line2mask(gc, gpio);
 
 	if (val)
-		chip->write_reg(chip->reg_set, mask);
+		chip->write_reg(&chip->reg_set, mask);
 	else
-		chip->write_reg(chip->reg_clr, mask);
+		chip->write_reg(&chip->reg_clr, mask);
 
 	return 0;
 }
@@ -269,7 +274,7 @@ static int gpio_mmio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	else
 		chip->sdata &= ~mask;
 
-	chip->write_reg(chip->reg_set, chip->sdata);
+	chip->write_reg(&chip->reg_set, chip->sdata);
 
 	return 0;
 }
@@ -297,7 +302,7 @@ static void gpio_mmio_multiple_get_masks(struct gpio_chip *gc,
 static void gpio_mmio_set_multiple_single_reg(struct gpio_chip *gc,
 					      unsigned long *mask,
 					      unsigned long *bits,
-					      void __iomem *reg)
+					      union gpio_chip_reg *reg)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	unsigned long set_mask, clear_mask;
@@ -317,7 +322,7 @@ static int gpio_mmio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
-	gpio_mmio_set_multiple_single_reg(gc, mask, bits, chip->reg_dat);
+	gpio_mmio_set_multiple_single_reg(gc, mask, bits, &chip->reg_dat);
 
 	return 0;
 }
@@ -327,7 +332,7 @@ static int gpio_mmio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
-	gpio_mmio_set_multiple_single_reg(gc, mask, bits, chip->reg_set);
+	gpio_mmio_set_multiple_single_reg(gc, mask, bits, &chip->reg_set);
 
 	return 0;
 }
@@ -342,9 +347,9 @@ static int gpio_mmio_set_multiple_with_clear(struct gpio_chip *gc,
 	gpio_mmio_multiple_get_masks(gc, mask, bits, &set_mask, &clear_mask);
 
 	if (set_mask)
-		chip->write_reg(chip->reg_set, set_mask);
+		chip->write_reg(&chip->reg_set, set_mask);
 	if (clear_mask)
-		chip->write_reg(chip->reg_clr, clear_mask);
+		chip->write_reg(&chip->reg_clr, clear_mask);
 
 	return 0;
 }
@@ -394,10 +399,10 @@ static int gpio_mmio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 	scoped_guard(raw_spinlock_irqsave, &chip->lock) {
 		chip->sdir &= ~gpio_mmio_line2mask(gc, gpio);
 
-		if (chip->reg_dir_in)
-			chip->write_reg(chip->reg_dir_in, ~chip->sdir);
-		if (chip->reg_dir_out)
-			chip->write_reg(chip->reg_dir_out, chip->sdir);
+		if (gpio_chip_reg_is_set(&chip->reg_dir_in))
+			chip->write_reg(&chip->reg_dir_in, ~chip->sdir);
+		if (gpio_chip_reg_is_set(&chip->reg_dir_out))
+			chip->write_reg(&chip->reg_dir_out, chip->sdir);
 	}
 
 	return gpio_mmio_dir_return(gc, gpio, false);
@@ -414,14 +419,14 @@ static int gpio_mmio_get_dir(struct gpio_chip *gc, unsigned int gpio)
 		return GPIO_LINE_DIRECTION_IN;
 	}
 
-	if (chip->reg_dir_out) {
-		if (chip->read_reg(chip->reg_dir_out) & gpio_mmio_line2mask(gc, gpio))
+	if (gpio_chip_reg_is_set(&chip->reg_dir_out)) {
+		if (chip->read_reg(&chip->reg_dir_out) & gpio_mmio_line2mask(gc, gpio))
 			return GPIO_LINE_DIRECTION_OUT;
 		return GPIO_LINE_DIRECTION_IN;
 	}
 
-	if (chip->reg_dir_in)
-		if (!(chip->read_reg(chip->reg_dir_in) & gpio_mmio_line2mask(gc, gpio)))
+	if (gpio_chip_reg_is_set(&chip->reg_dir_in))
+		if (!(chip->read_reg(&chip->reg_dir_in) & gpio_mmio_line2mask(gc, gpio)))
 			return GPIO_LINE_DIRECTION_OUT;
 
 	return GPIO_LINE_DIRECTION_IN;
@@ -435,10 +440,10 @@ static void gpio_mmio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	chip->sdir |= gpio_mmio_line2mask(gc, gpio);
 
-	if (chip->reg_dir_in)
-		chip->write_reg(chip->reg_dir_in, ~chip->sdir);
-	if (chip->reg_dir_out)
-		chip->write_reg(chip->reg_dir_out, chip->sdir);
+	if (gpio_chip_reg_is_set(&chip->reg_dir_in))
+		chip->write_reg(&chip->reg_dir_in, ~chip->sdir);
+	if (gpio_chip_reg_is_set(&chip->reg_dir_out))
+		chip->write_reg(&chip->reg_dir_out, chip->sdir);
 }
 
 static int gpio_mmio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
@@ -526,25 +531,22 @@ static int gpio_mmio_setup_accessors(struct device *dev,
  *	- an input direction register (named "dirin") where a 1 bit indicates
  *	the GPIO is an input.
  */
-static int gpio_mmio_setup_io(struct gpio_generic_chip *chip,
-			      const struct gpio_generic_chip_config *cfg)
+static int gpio_mmio_setup_io(struct gpio_generic_chip *chip, int flags)
 {
 	struct gpio_chip *gc = &chip->gc;
 
-	chip->reg_dat = cfg->dat;
-	if (!chip->reg_dat)
+	if (!gpio_chip_reg_is_set(&chip->reg_dat))
 		return -EINVAL;
 
-	if (cfg->set && cfg->clr) {
-		chip->reg_set = cfg->set;
-		chip->reg_clr = cfg->clr;
+	if (gpio_chip_reg_is_set(&chip->reg_set) &&
+	    gpio_chip_reg_is_set(&chip->reg_clr)) {
 		gc->set = gpio_mmio_set_with_clear;
 		gc->set_multiple = gpio_mmio_set_multiple_with_clear;
-	} else if (cfg->set && !cfg->clr) {
-		chip->reg_set = cfg->set;
+	} else if (gpio_chip_reg_is_set(&chip->reg_set) &&
+		   !gpio_chip_reg_is_set(&chip->reg_clr)) {
 		gc->set = gpio_mmio_set_set;
 		gc->set_multiple = gpio_mmio_set_multiple_set;
-	} else if (cfg->flags & GPIO_GENERIC_NO_OUTPUT) {
+	} else if (flags & GPIO_GENERIC_NO_OUTPUT) {
 		gc->set = gpio_mmio_set_none;
 		gc->set_multiple = NULL;
 	} else {
@@ -552,8 +554,8 @@ static int gpio_mmio_setup_io(struct gpio_generic_chip *chip,
 		gc->set_multiple = gpio_mmio_set_multiple;
 	}
 
-	if (!(cfg->flags & GPIO_GENERIC_UNREADABLE_REG_SET) &&
-	    (cfg->flags & GPIO_GENERIC_READ_OUTPUT_REG_SET)) {
+	if (!(flags & GPIO_GENERIC_UNREADABLE_REG_SET) &&
+	    (flags & GPIO_GENERIC_READ_OUTPUT_REG_SET)) {
 		gc->get = gpio_mmio_get_set;
 		if (!chip->be_bits)
 			gc->get_multiple = gpio_mmio_get_set_multiple;
@@ -575,27 +577,24 @@ static int gpio_mmio_setup_io(struct gpio_generic_chip *chip,
 	return 0;
 }
 
-static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
-				     const struct gpio_generic_chip_config *cfg)
+static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip, int flags)
 {
 	struct gpio_chip *gc = &chip->gc;
-
-	if (cfg->dirout || cfg->dirin) {
-		chip->reg_dir_out = cfg->dirout;
-		chip->reg_dir_in = cfg->dirin;
-		if (cfg->flags & GPIO_GENERIC_NO_SET_ON_INPUT)
+	if (gpio_chip_reg_is_set(&chip->reg_dir_out) ||
+		gpio_chip_reg_is_set(&chip->reg_dir_in)) {
+		if (flags & GPIO_GENERIC_NO_SET_ON_INPUT)
 			gc->direction_output = gpio_mmio_dir_out_dir_first;
 		else
 			gc->direction_output = gpio_mmio_dir_out_val_first;
 		gc->direction_input = gpio_mmio_dir_in;
 		gc->get_direction = gpio_mmio_get_dir;
 	} else {
-		if (cfg->flags & GPIO_GENERIC_NO_OUTPUT)
+		if (flags & GPIO_GENERIC_NO_OUTPUT)
 			gc->direction_output = gpio_mmio_dir_out_err;
 		else
 			gc->direction_output = gpio_mmio_simple_dir_out;
 
-		if (cfg->flags & GPIO_GENERIC_NO_INPUT)
+		if (flags & GPIO_GENERIC_NO_INPUT)
 			gc->direction_input = gpio_mmio_dir_in_err;
 		else
 			gc->direction_input = gpio_mmio_simple_dir_in;
@@ -617,25 +616,18 @@ static int gpio_mmio_request(struct gpio_chip *gc, unsigned int gpio_pin)
 	return 0;
 }
 
-/**
- * gpio_generic_chip_init() - Initialize a generic GPIO chip.
- * @chip: Generic GPIO chip to set up.
- * @cfg: Generic GPIO chip configuration.
- *
- * Returns 0 on success, negative error number on failure.
- */
-int gpio_generic_chip_init(struct gpio_generic_chip *chip,
-			   const struct gpio_generic_chip_config *cfg)
+static int gpio_generic_chip_init_common(struct gpio_generic_chip *chip,
+					int sz,
+					int flags,
+					struct device *dev)
 {
 	struct gpio_chip *gc = &chip->gc;
-	unsigned long flags = cfg->flags;
-	struct device *dev = cfg->dev;
 	int ret;
 
-	if (!is_power_of_2(cfg->sz))
+	if (!is_power_of_2(sz))
 		return -EINVAL;
 
-	chip->bits = cfg->sz * 8;
+	chip->bits = sz * 8;
 	if (chip->bits > BITS_PER_LONG)
 		return -EINVAL;
 
@@ -650,16 +642,16 @@ int gpio_generic_chip_init(struct gpio_generic_chip *chip,
 	if (ret)
 		gc->ngpio = chip->bits;
 
-	ret = gpio_mmio_setup_io(chip, cfg);
+	ret = gpio_mmio_setup_io(chip, flags);
 	if (ret)
 		return ret;
 
 	ret = gpio_mmio_setup_accessors(dev, chip,
-				    flags & GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER);
+				flags & GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER);
 	if (ret)
 		return ret;
 
-	ret = gpio_mmio_setup_direction(chip, cfg);
+	ret = gpio_mmio_setup_direction(chip, flags);
 	if (ret)
 		return ret;
 
@@ -669,10 +661,10 @@ int gpio_generic_chip_init(struct gpio_generic_chip *chip,
 		gc->free = gpiochip_generic_free;
 	}
 
-	chip->sdata = chip->read_reg(chip->reg_dat);
+	chip->sdata = chip->read_reg(&chip->reg_dat);
 	if (gc->set == gpio_mmio_set_set &&
 			!(flags & GPIO_GENERIC_UNREADABLE_REG_SET))
-		chip->sdata = chip->read_reg(chip->reg_set);
+		chip->sdata = chip->read_reg(&chip->reg_set);
 
 	if (flags & GPIO_GENERIC_UNREADABLE_REG_DIR)
 		chip->dir_unreadable = true;
@@ -680,24 +672,44 @@ int gpio_generic_chip_init(struct gpio_generic_chip *chip,
 	/*
 	 * Inspect hardware to find initial direction setting.
 	 */
-	if ((chip->reg_dir_out || chip->reg_dir_in) &&
+	if ((gpio_chip_reg_is_set(&chip->reg_dir_out) || gpio_chip_reg_is_set(&chip->reg_dir_in)) &&
 	    !(flags & GPIO_GENERIC_UNREADABLE_REG_DIR)) {
-		if (chip->reg_dir_out)
-			chip->sdir = chip->read_reg(chip->reg_dir_out);
-		else if (chip->reg_dir_in)
-			chip->sdir = ~chip->read_reg(chip->reg_dir_in);
+		if (gpio_chip_reg_is_set(&chip->reg_dir_out))
+			chip->sdir = chip->read_reg(&chip->reg_dir_out);
+		else if (gpio_chip_reg_is_set(&chip->reg_dir_in))
+			chip->sdir = ~chip->read_reg(&chip->reg_dir_in);
 		/*
 		 * If we have two direction registers, synchronise
 		 * input setting to output setting, the library
 		 * can not handle a line being input and output at
 		 * the same time.
 		 */
-		if (chip->reg_dir_out && chip->reg_dir_in)
-			chip->write_reg(chip->reg_dir_in, ~chip->sdir);
+		if (gpio_chip_reg_is_set(&chip->reg_dir_out) &&
+		    gpio_chip_reg_is_set(&chip->reg_dir_in))
+			chip->write_reg(&chip->reg_dir_in, ~chip->sdir);
 	}
 
 	return ret;
 }
+
+/**
+ * gpio_generic_chip_init() - Initialize a generic GPIO chip
+ * @chip: Generic GPIO chip to set up.
+ * @cfg: Generic GPIO chip configuration.
+ *
+ * Returns 0 on success, negative error number on failure.
+ */
+int gpio_generic_chip_init(struct gpio_generic_chip *chip,
+			   const struct gpio_generic_chip_config *cfg)
+{
+	chip->reg_dat.mmio = cfg->dat;
+	chip->reg_set.mmio = cfg->set;
+	chip->reg_clr.mmio = cfg->clr;
+	chip->reg_dir_in.mmio = cfg->dirin;
+	chip->reg_dir_out.mmio = cfg->dirout;
+
+	return gpio_generic_chip_init_common(chip, cfg->sz, cfg->flags, cfg->dev);
+}
 EXPORT_SYMBOL_GPL(gpio_generic_chip_init);
 
 #if IS_ENABLED(CONFIG_GPIO_GENERIC_PLATFORM)
diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index ff566dc9c3cb..30f0d87422e9 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -56,6 +56,19 @@ struct gpio_generic_chip_config {
 	unsigned long flags;
 };
 
+/**
+ * union gpio_chip_reg - Generic GPIO chip register descriptor for MMIO or port-mapped I/O
+ * @mmio: MMIO register address.
+ * @port: I/O Port register address.
+ *
+ * Describes a GPIO chip register located either in MMIO space or in
+ * port-mapped I/O space.
+ */
+union gpio_chip_reg {
+	void __iomem *mmio;
+	unsigned long port;
+};
+
 /**
  * struct gpio_generic_chip - Generic GPIO chip implementation.
  * @gc: The underlying struct gpio_chip object, implementing low-level GPIO
@@ -84,14 +97,14 @@ struct gpio_generic_chip_config {
  */
 struct gpio_generic_chip {
 	struct gpio_chip gc;
-	unsigned long (*read_reg)(void __iomem *reg);
-	void (*write_reg)(void __iomem *reg, unsigned long data);
+	unsigned long (*read_reg)(union gpio_chip_reg *reg);
+	void (*write_reg)(union gpio_chip_reg *reg, unsigned long data);
 	bool be_bits;
-	void __iomem *reg_dat;
-	void __iomem *reg_set;
-	void __iomem *reg_clr;
-	void __iomem *reg_dir_out;
-	void __iomem *reg_dir_in;
+	union gpio_chip_reg reg_dat;
+	union gpio_chip_reg reg_set;
+	union gpio_chip_reg reg_clr;
+	union gpio_chip_reg reg_dir_out;
+	union gpio_chip_reg reg_dir_in;
 	bool dir_unreadable;
 	bool pinctrl;
 	int bits;
@@ -143,10 +156,13 @@ gpio_generic_chip_set(struct gpio_generic_chip *chip, unsigned int offset,
 static inline unsigned long
 gpio_generic_read_reg(struct gpio_generic_chip *chip, void __iomem *reg)
 {
+	union gpio_chip_reg rg;
+
 	if (WARN_ON(!chip->read_reg))
 		return 0;
 
-	return chip->read_reg(reg);
+	rg.mmio = reg;
+	return chip->read_reg(&rg);
 }
 
 /**
@@ -158,10 +174,13 @@ gpio_generic_read_reg(struct gpio_generic_chip *chip, void __iomem *reg)
 static inline void gpio_generic_write_reg(struct gpio_generic_chip *chip,
 					  void __iomem *reg, unsigned long val)
 {
+	union gpio_chip_reg rg;
+
 	if (WARN_ON(!chip->write_reg))
 		return;
 
-	chip->write_reg(reg, val);
+	rg.mmio = reg;
+	chip->write_reg(&rg, val);
 }
 
 #define gpio_generic_chip_lock(gen_gc) \
-- 
2.53.0

