Return-Path: <linux-gpio+bounces-30009-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD52FCEABD6
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 23:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 831F93015026
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 22:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E9F23D2B1;
	Tue, 30 Dec 2025 22:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="NJzyKgcS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022123.outbound.protection.outlook.com [40.107.168.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEEB218845;
	Tue, 30 Dec 2025 22:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767132038; cv=fail; b=N+/pKzrFLM7bmvUQC+1h30q4BgnCsnZgk6ogFopfa0M9l3yHjv3O4NYA+eKg8tyx4QTUvAVIhadsgMDt6WY+S+bRZWsMO6OIvQwKScFrM5yF0RCxUNHZ7/tPNNukJ66/U6HeuGcXgyIUUhVShAo2FV4svv/vaQkKSP9WUkTP2EA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767132038; c=relaxed/simple;
	bh=2LQxbuobAXlegIx61gFOHL+t5v4N2wPhJBqqH4OnPgg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nAmZRXnqv976Xxzr6wXCT4vXU2egkcVs6h/+b+er3hX798CbPOPhGMVCJ83T72s2oBCNjuAIuZ4WvLS/JGbuHR1sefDBI3+MGVgIEVoz+COZBvwvGlZYDKhNnAi30UGcGoSiSndGmdKRR61Pceqi+M9jCrqZj5ngWEr7lGfHntA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=NJzyKgcS; arc=fail smtp.client-ip=40.107.168.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joxi9geQb4QcjPTGNLKhGu9jBC33C/XbXtGiNDQiy1MavWyu3Z7fkqrouHTI6+DZv1gIgN8IdpuSI/vjEYO1ZiDwWDoNC3E2S62EthhQFEnaB1HryO90/7N/aMEM6flD4eohoJns/ltBMdUDTreYkXmUtzyL6Bs29V1L2Zgk8lV5VPPb3HOIaKfZGPWHczEKU78IF+ydrnRDvPKPUbZf+VgDTut6pSYHPiQ61pPb446yIalK/r8jE6WcN3rFKK+KubEvx8XMK3wCf6Qxyvq5txJ0stKYNWSRiVIbCEMHxvW0wVYV1lYFHVrqi/LSPCeZU5o0qgj7bWWOJ63SYbd6oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LQxbuobAXlegIx61gFOHL+t5v4N2wPhJBqqH4OnPgg=;
 b=YX3YmBkHw7RFvycM2h5fe0BcJpz48PFGRCnSwIP+wJMzF2FoGYpcCPJCyrKHjc/R/tkfLffPKNX9b5XYpUhJrzqzM9XhJ3YuL3bVJsQI7NE1g+HtGNqRpS75rTrYRAnlsFHBc6VItzoGVTIul8x0tQC99nAIvfRTjpsMV98octtrEhD6r2gxSgALvWhZV0ViWrDs3gMi2S/Zy2j6qsAHsIDlJ+V1sCaZnRIENkrdE8luekcpFTMf5bqr3NyHW194Y/tQPWVfFnQR/7ETJgXV1zB4mr8G2DSTTgLNFryfe2U4WcI9TwMDeW073YDAxbunCmha3mpoJ+odW15o2hgNsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.55) smtp.rcpttodomain=kernel.org smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LQxbuobAXlegIx61gFOHL+t5v4N2wPhJBqqH4OnPgg=;
 b=NJzyKgcSlnO2ar0/Kr3/4Y3lGSWmmEbkN6ZFRE6qEGxns+F5KxFrj4lEFoY7tZOiPI4+zsUQv8vNY7LkSnPojBDudN44t9OU+d1eHdEzJ1K10UyaNrDke8RrkBd/YXogu9o+ZvpehlQ4vtzIUhdPAdEHRYXXr2ButSM9SMHJN0Q=
Received: from DUZPR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::16) by ZR3P278MB1528.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:a0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 22:00:31 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::9d) by DUZPR01CA0020.outlook.office365.com
 (2603:10a6:10:46b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 22:01:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.55)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.55; helo=ZR1P278CU001.outbound.protection.outlook.com;
 pr=C
Received: from hz-deliver02.de.seppmail.cloud (2a01:4f8:272:5fe6::218) by
 DU6PEPF00009524.mail.protection.outlook.com (2603:10a6:18:3::5) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 22:00:31 +0000
Received: from hz-glue02.de.seppmail.cloud (unknown [10.11.0.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver02.de.seppmail.cloud (Postfix) with ESMTPS id 4dgn8H19tyz1196;
	Tue, 30 Dec 2025 23:00:31 +0100 (CET)
Received: from hz-glue02.de.seppmail.cloud (unknown [172.18.0.3])
	by hz-glue02.de.seppmail.cloud (Postfix) with SMTP id 4dgn8H0wJrz1vdp;
	Tue, 30 Dec 2025 23:00:31 +0100 (CET)
X-SEPP-Suspect: f54283979766409a84943bf1d1f590f5
Received: from hz-scan10.de.seppmail.cloud (unknown [10.11.0.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue06.de.seppmail.cloud (Postfix) with ESMTPS id 4dgn8H0LSxz1wsW;
	Tue, 30 Dec 2025 23:00:31 +0100 (CET)
Received: from hz-scan10 (localhost [127.0.0.1])
	by hz-scan10.de.seppmail.cloud (Postfix) with SMTP id 4dgn8G5NfKz4gqd;
	Tue, 30 Dec 2025 23:00:30 +0100 (CET)
Received: from hz-m365gate04.de.seppmail.cloud (unknown [10.11.0.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan10.de.seppmail.cloud (Postfix) with ESMTPS;
	Tue, 30 Dec 2025 23:00:29 +0100 (CET)
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17012055.outbound.protection.outlook.com [40.93.85.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate04.de.seppmail.cloud (Postfix) with ESMTPS id 4dgn8F1mr1z1xY6;
	Tue, 30 Dec 2025 23:00:29 +0100 (CET)
Received: from AS4P191CA0027.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::10)
 by ZR3P278MB1588.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 22:00:25 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::76) by AS4P191CA0027.outlook.office365.com
 (2603:10a6:20b:5d9::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 22:00:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.222.204)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.222.204 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.222.204; helo=de2-emailsignatures-cloud.codetwo.com; pr=C
Received: from de2-emailsignatures-cloud.codetwo.com (20.79.222.204) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 22:00:24 +0000
Received: from ZRAP278CU002.outbound.protection.outlook.com (40.93.85.0) by de2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 30 Dec 2025 22:00:23 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZR1P278MB1410.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:98::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.14; Tue, 30 Dec 2025 22:00:20 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e%7]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 22:00:20 +0000
From: Javier Rodriguez <josejavier.rodriguez@duagon.com>
To: linux-kernel@vger.kernel.org
CC: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH 1/5] gpio: gpio-menz127: drop unneeded MODULE_ALIAS
Date: Tue, 30 Dec 2025 22:59:24 +0100
Message-ID: <20251230215928.62258-2-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230215928.62258-1-josejavier.rodriguez@duagon.com>
References: <20251230215928.62258-1-josejavier.rodriguez@duagon.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MA2P292CA0027.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::16)
 To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|ZR1P278MB1410:EE_|AMS0EPF000001A7:EE_|ZR3P278MB1588:EE_|DU6PEPF00009524:EE_|ZR3P278MB1528:EE_
X-MS-Office365-Filtering-Correlation-Id: cd9abafe-bba1-44c4-9043-08de47eed9e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?vvcf1P1U7Xp4g/pWn3zxGFMGOX9aUQXKb3siCIEvYM3mjlSkRk2D8sOcPUS9?=
 =?us-ascii?Q?TqRTbRRCckU4Pv0b0EwZxaJE6o1MT1VyxRl7w4P5IIGw8qojutAsiRR65iey?=
 =?us-ascii?Q?ihzKZR2UejWvjLoy54HusxDhFI+aeE6C08rE2ZtBHAk3z4agKpmmv7AD7DdY?=
 =?us-ascii?Q?NWCaDztp2sa9JzdaP3bd3U3ZT/mGG8pYS3tlUq8k8MsCzy86hK9v5U+Y/fPT?=
 =?us-ascii?Q?u+rcrxfYD3J7xp6rQgRMWQY8YDaQGOeypGZZpads/refCjNr+wUfVqlbjxmO?=
 =?us-ascii?Q?L3DVn0Ux8bgHdHdLDFuZ0i/KJIrgHvRl/rHUeaEys7uR4vxbkPHzz8PoFf3l?=
 =?us-ascii?Q?D4zPLY/MT2lSxMtdenenKqZ35qCvAqwM7wGzq8GGDwVTAJDPSYgdhaeOpwfk?=
 =?us-ascii?Q?XCjh9hETMPZt9xIuKK5ydqTyG2Dw4BVwEjocix027IlLV6rOGzykSoNfT0JS?=
 =?us-ascii?Q?E+/FG1vpFzksP1H4NMD33dsE7aDh17wpotIUC3p6uvllf7CMwY7c3DT6mEka?=
 =?us-ascii?Q?rm5K6zgM4B7c6zLuYPeL2e8RbFh1N8OXsRR4K8HzOFZ2/6m1iz1S2i5FlK2V?=
 =?us-ascii?Q?d+DoIYr/WnMm2RJH1wKyg/0eT7u4wdaHnN/t+ENpksepIKRtS2EQ4IsgQkww?=
 =?us-ascii?Q?F5/KTXXgRap2y26IF/6is85LSrk4Hz7KJ6MqGEkx8O7d8I83gI1K2xKPhKA3?=
 =?us-ascii?Q?vR+6fbhPxgz+dY8q2ZzCIlbSk8xOzbN+KJ/qIvvQEghlip9kLwK1fnzwZD+b?=
 =?us-ascii?Q?dCUN0l/BrHhk5Wrp9/NqDmjr7DATTfZcBissPaQHfYY3hGqZZzT6TOrGODRf?=
 =?us-ascii?Q?8cCEOqzC34N8zNutsnJYHuYOsx8+0b7D8m3xddzuOW89QhsSpG9xUYs8goPc?=
 =?us-ascii?Q?Tgybgh7KqPtjBJuy1m/yi9+nsIcgNoHkcTiDFuLpZUXaJEMkXfYD4lqqx3bV?=
 =?us-ascii?Q?0iUzjABitFQsGYqFQnEWxqgiP/GI+dcErJ1Yfht8mA4f6xp/iDg+YEMNLc8k?=
 =?us-ascii?Q?hNKp8jZ8hjU7M+qLFsd1z8aQhHRvjgVDJZbJ+46GJZLRpw0uhuloodPbMA49?=
 =?us-ascii?Q?sPR+1JdECtS2OY1G3oy0GShS8I/PJkMDAU8KBaSS6Jo3ufnvRrMSai7Ho/nm?=
 =?us-ascii?Q?vu3ssLO/gOC65sMaXjDTi1hqmGcU9V3RGakNlY+dYAwf0cDyS1tp8neZFPH1?=
 =?us-ascii?Q?qtUyyi+cDILZxRfF4OGvBgQaQWM/CJ4l+aLMgt2s7sU1XfPg4m+hH24Sphru?=
 =?us-ascii?Q?XL6Zl910TdxTBikD7KRNciG8oeKrbPstvU7n1rbVKzdPsYa4r1HXWGoMPcpC?=
 =?us-ascii?Q?3lnwCEeXILcrX45iSITtqKwSKvOjemlCoZmVBKg341qRjhRwM9npa9DJifyC?=
 =?us-ascii?Q?Dcru9cYOSxB9WYS8+f7iG936rDpZHsDTckIKufNTpG9IeDhDyZQw17ulDzxb?=
 =?us-ascii?Q?qIendD+mp4wRi2JmlNHREFk11SiXf7iHVv2qPls77b/LDfZrpdFCxEDO+3R4?=
 =?us-ascii?Q?dVILHc+Nb0X1LCEm8Hm2Wa2pgijo3CVKljIQ?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1410
X-CodeTwo-MessageID: f3be5715-6713-4406-ad47-5bd7d4147f8f.20251230220023@de2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 c3908d70-e886-45a9-e1cb-08de47eed345
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|35042699022|376014|36860700013|1800799024|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?NP/QLfRDOjOAx6OvVjnVF86kYJS8iM2qU7k0hxYiz6ktgo/QWwIYMsQSYgn7?=
 =?us-ascii?Q?b6J6pFNuy4lwH75dYnGjSAQevctMMcA4e7+eTXLpxG39Zjroph+HVZsKsiZa?=
 =?us-ascii?Q?XTMEDhUy70AF7hyO6Hy1wtAU/r3t3t2N9Sk4ci7h2XhrA9B5Ez8H73GuvQ1Q?=
 =?us-ascii?Q?HZbVcerWmlmcYEfKs0wnsEWir57f4ML1fWwvm64RWKULKfo6abmiSKlgAbfi?=
 =?us-ascii?Q?mHfuthmX6t+byczxoAlonN3Japr6A3o3I8mImm9tPPA+URqiSDnWmNWFR3hs?=
 =?us-ascii?Q?lA74I727iQrjbFf/JMoWa0EgovwSDnGM5GzIm3a6x8KUv3UzHsTv8K+7+MFU?=
 =?us-ascii?Q?YJUw6UCxhBsMOuK/M0xtJRCkcdY8kVk5vjEWFkXpN3d82gv/cTNTVh9NHqAK?=
 =?us-ascii?Q?TJHxF8D+atbaVQqyZV6Voew9n0HdRP2NTyCISDzC5AVGMXFOh5q5KPNgBWQb?=
 =?us-ascii?Q?WfoJPFe8J43PKLSD9zuOpBqypdeIK6Oz8aDuUF27U9NPmYP5z3R5Zpge74al?=
 =?us-ascii?Q?tQG81NmHOiGGWh+5wefNqo4AFvq0AURVCRcG4jmlV0gTm/W5KjE68bMSZxfV?=
 =?us-ascii?Q?Frvwo4z1QA7Cyop+JQ1iypaXCjWZQn5EKASurvEjalUFOK1LKLrUCDYRGM+Q?=
 =?us-ascii?Q?0pwHa59eZnWwZ6V1uv2zi4z0dVbU0fCbShxh7KzH6+MiW2Otu9skZ0CVNGw7?=
 =?us-ascii?Q?Yd+YHSWUp4Iy1hukF0vXnXF2GvIiftSg3/TAWKZbK7dRuDu9Ktz3LQ8fsz45?=
 =?us-ascii?Q?SodPMXl53PBz4YZQaKK4UArDzBXT4J96Iy8I3c/HqGWJMWe61z6S516fwvyP?=
 =?us-ascii?Q?2KuyWGMcaENRDmwhfvWN+p5mcOFhCjRjnws1NNxbxds5FmJDATSTqSeCOCl6?=
 =?us-ascii?Q?+SnRlLqwYT+byehAqskXfWJHxBb4C+S4NfyNtlEum33+juPR641A4qJONHJL?=
 =?us-ascii?Q?Hu4xJECE8DJEIDvitF3TBFq6zoWTLMscKHHiViMcbmIwqN0yjAFfSurThwBz?=
 =?us-ascii?Q?vkw+HQNHqZHz0rQL715MyJIBJ31L3jzpQkgVdeA/NMNZAHSfI72MwXw+joxS?=
 =?us-ascii?Q?tUu1T2aI/YMcke/g4kmHAnGYbZUfImSLEQLxPvbaAMPFemugXUdmKClKq7au?=
 =?us-ascii?Q?AoEWjJ1FNv275+DHFS/amqHeuyjf6WeVJG+XSBq5E3qQ9oYJXFCfyarLQzZv?=
 =?us-ascii?Q?sviAYdk4C34UfHCbuFZFTKySfkdVtNRWtpiZUlvgFXKIfER9akPIHT2iOeIV?=
 =?us-ascii?Q?7R4XAC4hQVKo7q7w5E5ANb9ZwhHx2EVWQ3nHPLk3/SgvXY1YaVDWMRLYLT/E?=
 =?us-ascii?Q?13BRe3vYsnxYnry/v4pPCTfjDO2Hw4x9ruM3Y4ZGRyhRTx9G6dpczDK4cePL?=
 =?us-ascii?Q?wdHiL7k1+7Tnk7nZEavhFLye7RgWjHrvzJyATtjcveiafu2qF0n1cwjyNWij?=
 =?us-ascii?Q?/4xifMaDbi4JRNDvuMrnbp4So8kXI6ML/VMmO1ldum+DbEUZXvpCwAkJPN8K?=
 =?us-ascii?Q?dLUfVOVlvv52w8QYFh1E1hkf+SCygfo3hPGFQCX9NpC1hxVNhR2fkHQ9w/4Y?=
 =?us-ascii?Q?eMkznafjZlCR+x3Kyyc=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.222.204;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:de2-emailsignatures-cloud.codetwo.com;PTR:de2-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(36860700013)(1800799024)(82310400026)(14060799003);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1588
X-SEPP-CCCVersion: 2025-12-11T08:12:51+01:00 9ed91da2
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.55];domain=ZR1P278CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.55];domain=ZR1P278CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd50d6b5-9520-43bd-00cb-08de47eed5ca
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|36860700013|82310400026|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O+YvVhDYU/IRtHURyFXT2BgfmH+KyjM85r31ZERyiPqyeg6uQ/mC+4vxa/Rw?=
 =?us-ascii?Q?01UMQ3ucNhND4264crsicfCKyNLySfLSL8R8pncjlI3WfscI+ZranmbD88Ty?=
 =?us-ascii?Q?BDLLNPl7RjK3oFFRelhJrc0Qd0DHBui3YkwxCt4awFY80AD/k3BwUeTHGLl/?=
 =?us-ascii?Q?QPzWBZuj0NdZmgPFl3iWpYhJwWXEyPNtpD3v9QhJPDJ5GTxnlg/Irbic4C56?=
 =?us-ascii?Q?T7cwAChVhN9ClvgJbPFe7UlKgxnrwLHjMc+qI8ySbNqT32xuP+rQU1L6/TkH?=
 =?us-ascii?Q?AouS5Fb32Fp0R6hn9DLPnsL6Mz5WVpYBXm0q+6X7YUbI/UX779d9hEffMne1?=
 =?us-ascii?Q?5QsFUzcSp49jb3lPzJqtc3epYDFpENj/L9aIIFU1XcKHK+BovC2mCR0IQVZB?=
 =?us-ascii?Q?vmfY2q14q3KcS2WEMqFf2CiZt9FJpqFQKBySFcAyfx+OSI4ie7avzag8a+tJ?=
 =?us-ascii?Q?hSFAJ5E42si/uPy5dPhxYqEm5Es33z2xeSGHIlg4HPoBm6mlT+XStuOhFzL9?=
 =?us-ascii?Q?teo2+UEhXjKTJlADj3EPm2l3ynJifrctXFDzJk1gaupjzNl9r8B69CJApT3L?=
 =?us-ascii?Q?dkHpy7odat1byr66/JwUuY1t+3NBlEoXyKyGLaYE8SM70A4+y0+XOlUHtFPV?=
 =?us-ascii?Q?F05yK4aI6sWFcMFmgmF348oI+9o2VaIghCCdfU7hf6y9QSQH6d1d7pMcyBWS?=
 =?us-ascii?Q?CBiwLLMbxXkOBACZbhaxFt46EA9cA996EXrmEqVL1rSDPV8FcBZNwT8Cvibs?=
 =?us-ascii?Q?4pY7YtttAU5dF6XRZEDJi0Iycry+tCoTyEz8m/u3T4DEOlRAboOI5nXGX2nz?=
 =?us-ascii?Q?cyAXQNvhZEef+pEJ3RJUFVcNjJVeu0Ec56E8mh8cMZ/C5WyTP9Q2mD6gYAgD?=
 =?us-ascii?Q?uezHP5bTi944zGRfjQJ2Doq2/oOroTMtLkOKP70bY9AaCKabgTMbEkw1mSBs?=
 =?us-ascii?Q?lD1ZQs+AQsNsL7kBYejU4edT4AgTwZBAWGv7Q/XpH8dkAE6QuKyHlBoAGDya?=
 =?us-ascii?Q?V4I9EbliKm22vA0la9SwPG/a2pKtMt+s0UTypMDYC8e5Ex9dOl2y3IFI/oCf?=
 =?us-ascii?Q?nNlWuRb4RExbDTJoVBfRS0/f9NhH34728bGktn0iTpY0SmGDBcqR5IrYcIAj?=
 =?us-ascii?Q?1MvIUSXbxbeu?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:272:5fe6::218;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR1P278CU001.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17012055.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(36860700013)(82310400026)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 22:00:31.5609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9abafe-bba1-44c4-9043-08de47eed9e8
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:272:5fe6::218];Helo=[hz-deliver02.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1528

From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>

The MODULE_ALIAS() is redundant since the module alias is now
automatically generated from the MODULE_DEVICE_TABLE().

Remove the explicit alias.

No functional change intended.

Fixes: 1f4ea4838b13 ("mcb: Add missing modpost build support")
Reviewed-by: Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@dua=
gon.com>
---
 drivers/gpio/gpio-menz127.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
index 52b13c6ae496..f51e7517f551 100644
--- a/drivers/gpio/gpio-menz127.c
+++ b/drivers/gpio/gpio-menz127.c
@@ -223,5 +223,4 @@ module_mcb_driver(men_z127_driver);
 MODULE_AUTHOR("Andreas Werner <andreas.werner@men.de>");
 MODULE_DESCRIPTION("MEN GPIO Controller");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("mcb:16z127");
 MODULE_IMPORT_NS("MCB");
--=20
2.52.0

