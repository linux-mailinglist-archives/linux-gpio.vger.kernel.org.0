Return-Path: <linux-gpio+bounces-34837-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOMRCOlR1Wkf4wcAu9opvQ
	(envelope-from <linux-gpio+bounces-34837-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:50:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 764E13B30B5
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17C82302F9AA
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 18:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617AA31F99C;
	Tue,  7 Apr 2026 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="i/jaK/8M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022078.outbound.protection.outlook.com [40.107.168.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42AF25393E;
	Tue,  7 Apr 2026 18:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587764; cv=fail; b=Vuv3jS5+B8rnF/PHFImlxKTw7+l6YwZLHIoL5GEeUM5AIr7bS2eMTsomOFkSHDPPhtzKpwvnRv8rncPvt6fYAtlJd7qaC6+HVmuRskPA7y6U6DOfbkznFbYdtkKvYtnVLPKPERfKZrOGPTn3QIDEGICuWPr5v1n/6rFYkOPhmMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587764; c=relaxed/simple;
	bh=R4sXP8DemNCFaE/okyQoyROWKk52nOli1mSIaru/pcU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IIKF2bAwxxfSBNEqBviD5cEZj4/EfvTIfOtSbdUP0JlnTwbChqOhuxw4nUStLKm9MTdzeLZ/La59GDi2/4So5xqg6N3LM78+4d4cixcmI4AfdMFz5UzNij8U6Ccl6XIGKjnyPtFNHWc3V3ProEBg6wfNmgvg6XS8STtnvvY4AGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=i/jaK/8M; arc=fail smtp.client-ip=40.107.168.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v37KowBZwDvIhBtMHQmw0B5x1pTXxWWUCS1wZxmItrEU00rv08EsoO2eWieguwqnGGCY0r6LESGHf9GbItzLPd0ZQPU2slRG8NszDCYy5D9Gs1l+WFgcibzaz/xNn3CKR13lcz3+05L9TFnfxPDy9oziv2++Ai+mCbKBaKJNwx9Wws0SUyndzFxwELyQqh3CLR0RKOghwoHzGVkblSaUc+ZfHS1Jsu0p//fjACi40f4dnPFLf7NQHDNillJGOfcm0GBXqQ1QcKnCdichbXhUbkYfaPuiJqHx2gH3bYUKtDpdTK4LztNtOqbTg0Rnd+VJHs0zySkSdIxZ9ukJKxWswg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ+byARz69Q1ru5glUVDbo24AUqdXK7YMlOYP/qhNQs=;
 b=A8ZodqROttWETPUmMXFs6RcuA/sCuW20Kfc6ypK9LMYOUK/3+RTSASD9Ya8xymGgjoWsc+1JBEgVj4BKgWXGeKqFC2jlfb8wnzjgpMswiID4bR/obATcRIaHSutG/+neUsPezJVZOmyY4Pkidfz9YeZgL1iHixCgTqtyTjanxlWa+IBoUTUz+UbXUJuKSOLNA8GN50gfxWKubyfbgUUsdybmOIyVUlN3cKq60k0NW7mC3URatVkHmQ5k/N462GcP0amis8qrp6hSPWGnqnO+RP+HncDNz2F/V9jSCG/qiip352W6wGutHp9QAxbdPkChq2l1cv24kNaMywL7drrE1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.4) smtp.rcpttodomain=kernel.org smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ+byARz69Q1ru5glUVDbo24AUqdXK7YMlOYP/qhNQs=;
 b=i/jaK/8M8Knw++u3Mo/eLo3SxaEcMoyqZfs4BDDBMCo5UC1GHATL5lTJ5CHETeIM/dTdb+ePMK6EKkBRR3cVr5Ie1vK16UDD/LY3okkvbCASmtVc+QM81MZ9Pln8la1PLBI1iGHZW2jv1Y/GLRc3UPNnO7Rrf+tPAGnVeW8RzdQ=
Received: from DUZPR01CA0199.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::28) by ZR2P278MB1056.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:61::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 18:49:18 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::21) by DUZPR01CA0199.outlook.office365.com
 (2603:10a6:10:4b6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 18:49:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.4)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.4; helo=ZRAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver01.de.seppmail.cloud (2a01:4f8:a0:13df::219) by
 DB1PEPF000509E8.mail.protection.outlook.com (2603:10a6:18:3::61a) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 18:49:17 +0000
Received: from hz-glue05.de.seppmail.cloud (unknown [10.11.0.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGP1PVFz4vjx;
	Tue,  7 Apr 2026 20:49:17 +0200 (CEST)
Received: from hz-glue05.de.seppmail.cloud (unknown [172.18.0.7])
	by hz-glue05.de.seppmail.cloud (Postfix) with ESMTP id 4fqwGP13Wdz20Qq;
	Tue,  7 Apr 2026 20:49:17 +0200 (CEST)
X-SEPP-Suspect: bb5caf39a18247a6ba6401eb6b79d2fe
Received: from hz-scan01.de.seppmail.cloud (unknown [10.11.0.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue03.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGP0Kyfz23dn;
	Tue,  7 Apr 2026 20:49:17 +0200 (CEST)
Received: from hz-scan01 (localhost [127.0.0.1])
	by hz-scan01.de.seppmail.cloud (Postfix) with SMTP id 4fqwGN4nNkz4JBl;
	Tue, 07 Apr 2026 20:49:16 +0200 (CEST)
Received: from hz-m365gate01.de.seppmail.cloud (unknown [10.11.0.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan01.de.seppmail.cloud (Postfix) with ESMTPS;
	Tue, 07 Apr 2026 20:49:15 +0200 (CEST)
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp17010004.outbound.protection.outlook.com [40.93.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate01.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGL5qlHz2xLN;
	Tue,  7 Apr 2026 20:49:14 +0200 (CEST)
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 GV0P278MB0162.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.18; Tue, 7 Apr 2026 18:49:12 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 18:49:12 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [RFC PATCH 0/5] gpio: add PMIO support to gpio-mmio
Date: Tue,  7 Apr 2026 20:48:00 +0200
Message-ID: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA3P292CA0072.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::17) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|GV0P278MB0162:EE_|DB1PEPF000509E8:EE_|ZR2P278MB1056:EE_
X-MS-Office365-Filtering-Correlation-Id: c57c3a66-96f4-491e-0ea2-08de94d65f76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 4dZ9SLL7Tw8pJVo4TAACa7IUCN3HQWydvf2yxnf6TJ2TpU2GTS+ah3ZFfc1UgvfjNEDEKeLz0E6HCmKt2MQ9GUxu8/sES8xCEt+RzGqa39BkAlNRT67st0ATAzuKKus/TAuH/AxfZf1hBxIObIwFfHY3wFxczJaqiWQtX+9atQS8rdxoxBfhDEkKIvgB8DTOXgovr0B3TsNFElwm42uWo3OwKcs5KRzZ0Fz1ey9EIegXja4SVbMwonVVkjWsZZ+PGblkelkaF4mlwgRY3krKFMx37AlO58LoUVQuBrn0rt8Tcyhp3zc9h7qsMaPMG4rf2F+lMVkF5KjbZXxZjvJbnLeDjrNRK0/md4rjmmKzh8/EjZ7fV6H28g6c2IvwxTR7I7Wn9SSbOU+aRnX6936QxprbTJu5yUIbb3R5TJ8EpMpsyyy8EC+kF0VqY7aeDA2+6adR7M7UVw/O06E5Qzg0wOcbI2NZmDl6lUCDd2az/ClFwqVYfLKUMo5AbcjadAvWt684CZnjnhGr5KoiypE4pAF2hmG3QvEGKMi2GHo2hWQ/uTeov07RvctmTQM549Wl8VLp4scIyhQ0rj8gRgLeDqM7kHeQzya6oSQgGsav4+ZBmhWZnTNLnSKi3y7defVYN6LhAEoStmxWUgJWJFGMjFi+V1Cv7sKHe35aSi6u1ifluwAoMFGMggzDQGYxiqmojBjHkwHbuC9wmh9AiDMX1b3AV+w6Ed/ts9GSrK+7eraPNnwmjDPH2RYQM0IefXx+WJ+1krYIqzo8on95gnvhkssERntxwmbyXasd6XIDdhM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 pn8oVH0EiJ+umbvNyq0tvCEwsDIM4nW+NN4JTrquYbU8bmhZp1W8SGG0IgupfHuRO89jq//nfRotPafCAzDZT9P/xY7+QzUwpqHJQKczxq265jWi+Cqd9GYXOYO8sED6vzGJD6gIid9DAukyTBW8jSibS1W+n5/yyAC4mrr60+D2CJ/X8gb26S3ef5ZB6cNpJkiDCv++9+K4dw7oPcFZgMsWZYcjmlElGWhtP8e34NiF7I6J/kwDYDiUOYP3wIKGtbydadz1qNxNghPb8wYjXTyWEUFuHHQxPEa47B+Saox+gZPKV6TPDMfJkqqXTufoNieVnxslaQwFSb4JrPGbUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0162
X-SEPP-CCCVersion: 2026-03-30T09:40:10+02:00 639c564b
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.4];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.4];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b7baca83-2c67-4fca-b849-08de94d65c20
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|35042699022|376014|14060799003|82310400026|10070799003|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h3mGyr20kyxYMc7F7wAKoOCazh6TP5CC0WDP3RE5htp+G0Ze/JTX7dzkIVIW?=
 =?us-ascii?Q?+/pVhSjJ2+AuqWHOIX4V1cz9JikxXRX+yTKxeIrZ3lgw8izYJPqwZw/4u+x6?=
 =?us-ascii?Q?flMPmH+Qb0jZGQwETyDNWbQOpNpytLUcwysQM4jM3Nk5mczdb5meJWrxH+SY?=
 =?us-ascii?Q?M8eW9JeJwMBWkILAPKsYI6Eejpi4yZGO9unHbiNutwcjfKP44VMh2USTG7hi?=
 =?us-ascii?Q?mBbUcfaXDXWKykh6strhELdh2jLCuooFGT6yKYh/D8Tf3OtdSIYTd4Nion6g?=
 =?us-ascii?Q?mRlssFHPampaDT523rriqljrcYYiZmlCqDV/muk9085HtTHvc7QVA/L3owaN?=
 =?us-ascii?Q?Vm1EFdu6axSz1iErFkP4MS4KxA78g+B3d50a6nO93ZaxqSNum90I1fJoySVO?=
 =?us-ascii?Q?X084C6AAQiy+P4bMxGUZtXoktHe7RT0fatyu3eF2eKNOCNSyRcZdnr91J1rI?=
 =?us-ascii?Q?yIntE69zJOdV5S7A+ZMwMkOL5Yo1Pi0eFOxwPB0TAdlljVY5bzozmc9DFszO?=
 =?us-ascii?Q?YpFKP7NjTuVLfk+3dU4QCDsIX+n7yZI4EVuC3W0V7uaC/cqdaH/MWXclUQ6L?=
 =?us-ascii?Q?qB63CK1BB+6sDMoVrTKwg98yPoWF7dR9w2WM1D3hlmgIvqEn5L85QhZAzuCc?=
 =?us-ascii?Q?+2HCiMGIwVLvs48kM9aZxPrFP+WWgie7bmVxio40O712gGXaeLBIB/nz/Gil?=
 =?us-ascii?Q?l/zdtFSOcO90aqag7FffObI6mPX+Mp+1ZwWAnq3JAGdQVzLasWa2hQKJOU0w?=
 =?us-ascii?Q?+XyLKoeQapvb7jXON0kjdkSwF3quLvsyFUKiMe/FDiqJ1qkKAvnFjSU+wJaO?=
 =?us-ascii?Q?7G/bIys06qN43fRRbpuqNgI/ANgSI2/DA8mO+beB5xsYO7A6/ygQbew4bEiE?=
 =?us-ascii?Q?XLs4R1lcsrKrWJ2J6duguKsaaU7FF+OGeCPhR3aLOKTYhaWr8I2fVRkDpttP?=
 =?us-ascii?Q?E29ymGWXYqUL2eMB0m76ebTgwpPXfP2biDyVI6GgmtzjM10uhJJ8kVOKr54p?=
 =?us-ascii?Q?KkVUYTl92e9YMzgMNg4c/n450jbbOxYIKwLCSYdvr9ODNW3YQJVyZbwZV/DU?=
 =?us-ascii?Q?snMV1wJxspHCLbFFdmRl7kPCdnacoyBX3Wl87ncsRozVC9n5DMFbrgakGO/z?=
 =?us-ascii?Q?CQSc+yig9VnKYjdIkunmBIhDXRqFee+6ffAfBwY8hXBS2nmEuHuFsvtlZm/k?=
 =?us-ascii?Q?MtVB0V2xYXjdeQ/CATI/5CjrR2IjQbQllO5VYg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:a0:13df::219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17010004.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(376014)(14060799003)(82310400026)(10070799003)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DSV6Iif1vqTTKBxZ3zBDslntWtgleagCKU622XsjFprAW5b28wSz/mHlsBz/MuPKB2AXoQ5a0fV+Bk2SXbc6pDOaHhYzMB6UBLoNoWPQicBRvUI73gb7UkZA0JVLJ9LvttNOzbhNJ65G2LH6T+nWBtK/ArLPYl5aECrbD4dsRQ/m4KZGtD7XTlRB9fr8HdYTv5xCCNlH8EWiJdV2gF08hEJhnZcprpMU9jbU187yamytWbhW63fI2ZRQ6Y0C8mpi7ObFBVJQ7tU4Ob16ucTgc8fGCOAbR4KDj63ztB1S2FnyOblM2bPJ58mlMR+FZG1w0vYRKQ0UTPH9Dwp1sBxnV5direlirvJ5Lmfmc0gVyAwu/7LdhYJ22X4h2d5jWWenDyb6pch/EwMYVljIt8F0K+NN9ejJCQb/OKXkkg8BH4L75F9p3P+V7H3a1UNLy3hK
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 18:49:17.7463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c57c3a66-96f4-491e-0ea2-08de94d65f76
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:a0:13df::219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR2P278MB1056
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[duagon.com,reject];
	R_DKIM_ALLOW(-0.20)[duagon.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34837-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev-josejavier.rodriguez@duagon.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[duagon.com:+];
	RCVD_COUNT_TWELVE(0.00)[14];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[duagon.com:dkim,duagon.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 764E13B30B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series is an RFC for adding port-mapped I/O (PMIO) support to
gpio-mmio.

The initial motivation was to add PMIO support to gpio-menz127, as we
plan to support this across MCB client drivers. Since gpio-menz127
currently relies on the gpio_generic_chip API, adding PMIO support only
in that driver would require a significant refactoring, including
separate callbacks for memory-mapped and port-mapped accesses.

While looking into this, I noticed a TODO item added by Linus Walleij
about extending gpio-mmio to support port-mapped devices. Based on that,
this series explores adding PMIO support to gpio-mmio instead of
handling it in individual drivers.

The main goal of this approach is to preserve compatibility with
existing MMIO drivers using gpio_generic_chip while extending the API to
also describe PMIO-backed registers. To achieve that, the series extends
struct gpio_generic_chip_config with dedicated fields for port-mapped
registers.

To handle the different register address types used by MMIO
(void __iomem *) and PMIO (unsigned long), this series introduces a
small wrapper structure that can represent both. The read_reg() and
write_reg() callbacks are then updated to operate on this common
representation.

This series has been tested with gpio-menz127, and the driver worked
correctly with both MMIO and PMIO devices.

This is being sent as RFC because I would like feedback on the overall
approach before proceeding further.

In particular, feedback would be appreciated on:
- whether extending gpio_generic_chip_config is the right direction;
- whether introducing a common MMIO/PMIO register descriptor is
  acceptable;
- whether PMIO support should instead be implemented differently in
  gpio-mmio.

Jose Javier Rodriguez Barbarin (5):
  gpio: generic: add a generic register wrapper for MMIO and PMIO
  gpio: generic: extend gpio_generic_chip_config with PMIO register
    fields
  gpio: generic: add io_port to struct gpio_generic_chip
  gpio: mmio: convert accessors to generic register descriptors
  gpio: mmio: add port-mapped read/write callbacks

 drivers/gpio/gpio-mmio.c     | 277 +++++++++++++++++++++++++----------
 include/linux/gpio/generic.h |  49 +++++--
 2 files changed, 243 insertions(+), 83 deletions(-)

-- 
2.53.0

