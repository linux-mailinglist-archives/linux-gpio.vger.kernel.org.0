Return-Path: <linux-gpio+bounces-30275-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51159D03B47
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 16:14:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 653B232E2636
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 15:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771203EEFA0;
	Thu,  8 Jan 2026 13:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="HSO7FjZC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazon11020112.outbound.protection.outlook.com [52.101.186.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D98C3B8BB5;
	Thu,  8 Jan 2026 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.186.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880159; cv=fail; b=HMO6nxTfa6E6MZQY4VibkbA30ipwfJ6TYpP+5O0+VTcjNgRLeKehlk8WqCl+xM19tv64XixtsUk8XNclnpxeDMtXV1qqzPWzY9sUMp0WU5zZ5UHQhrBfEfoqiNuk875XWctFF2BkMnmxdZT4tZHFfRbaIO/KasqgbaQzLxe7IXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880159; c=relaxed/simple;
	bh=tXsae5ebVciL2OJOX4JP4xK1XIORvMPcROmi6bhpHbo=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mujY54VywaRsjJMwZizRlzt/mO+CsWdOreXibpztWXVyzzb7NDwJ21X2Yurug1td3oF7TkrbqKreQ2LlVprm8u3CH45UvEo7L2H8fk1TAvXHIKja5lrJtVcEcYcL1Xb1drIGik4wiKrhTEpvvjQrLQVzwuz2WOVMTBZyxtBVOy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=HSO7FjZC; arc=fail smtp.client-ip=52.101.186.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=javMGh9ffQY7J/lAkohhKo9tmtX6LrKCC27k1TyvLPKg+2k3nk3flETvx8Sp1scKSi8sb1NTpBUQLe38d0MJuhHzfyEt22SKgs6LM1pMD6ZH3TNCr67eXJ3dVxdF+EtfN/wDpXbGCk2/thH3wKh+EPX3pD7tbl46ItVgr7JqBJcQausNnU1qzTRLjs6qTQnwHVQFSbNoC4KYCb3XKaU6p+kXpb9jyFf4HZitFJXcmCpy1Z/dyWm445aVJO23g/+PJaNNvK9Fs9ijdv+b08sPLvN/cuIWRrkBYcbidUOqRjjIRgvv6xXYcuAJTX2VB8ziagAVEikoMTTyE+6BYruAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8q/bD+4rAngPdTBDqInZf4zO2BJ0HJJNjiwJ1hnpWjU=;
 b=bh6Jl89HrPBuUtmxRrkxKJYS5FDvfvAWbBM3eZqlZBDfWguHJQteecp9VlHOK5rKoaZOg9J4H4aqobDRP+9IuA1hz2mVFD1wQhaKvlh3KMH2MHWLLErEMaULXH+Gu6loofgaaghqwiXkazo+RDWuJoMetvDXQPwuoniDePM6mTfbLtKXm/h+lABqUsLNN5TF4XKkarEnIUOhCamfLMjXCdIM8hw9w/SEmir9oK/Tbknh/vL/at4u7ZA6vi0xJ5z98pphUVpc2NvtEbFjCVktaKc4l5E2lKufhwGzDh1cuMyekm51Hz41RhJ9aZnx5kGhXqDDmgRAK2T5MntnPYTfMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.86.6) smtp.rcpttodomain=intel.com smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8q/bD+4rAngPdTBDqInZf4zO2BJ0HJJNjiwJ1hnpWjU=;
 b=HSO7FjZC4t1ZYN34NP2eUlfJwbKgIeASQxP4pdp4CW2bKnSowoknbsgZmyzkOiG4hr5V+Z5gerYNtbfbAS1aGwd5xRPLFcyaZnJB+/PGwOj4+YVoLLFLGsquGD1pA4Ise1HQabKDqFRc5FbAm97N+biYGQ0RdgEReCtv7dzfnzo=
Received: from AS8PR04CA0136.eurprd04.prod.outlook.com (2603:10a6:20b:127::21)
 by ZR5P278MB2037.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:b0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 13:49:10 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:127:cafe::ac) by AS8PR04CA0136.outlook.office365.com
 (2603:10a6:20b:127::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 13:49:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.86.6)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.86.6 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.86.6; helo=GVAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver02.de.seppmail.cloud (162.55.72.218) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Thu, 8 Jan 2026 13:49:09 +0000
Received: from hz-glue04.de.seppmail.cloud (unknown [10.11.0.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver02.de.seppmail.cloud (Postfix) with ESMTPS id 4dn5q90Hw3z116f;
	Thu,  8 Jan 2026 14:49:09 +0100 (CET)
Received: from hz-glue04.de.seppmail.cloud (unknown [172.18.0.6])
	by hz-glue04.de.seppmail.cloud (Postfix) with SMTP id 4dn5q901YRz237D;
	Thu,  8 Jan 2026 14:49:09 +0100 (CET)
X-SEPP-Suspect: fae8bbdf04bf4508af678f49d50a4ae7
Received: from hz-scan06.de.seppmail.cloud (unknown [10.11.0.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue04.de.seppmail.cloud (Postfix) with ESMTPS id 4dn5q86Vb9z231P;
	Thu,  8 Jan 2026 14:49:08 +0100 (CET)
Received: from hz-scan06 (localhost [127.0.0.1])
	by hz-scan06.de.seppmail.cloud (Postfix) with SMTP id 4dn5q861h8z1l0N;
	Thu, 08 Jan 2026 14:49:08 +0100 (CET)
Received: from hz-m365gate04.de.seppmail.cloud (unknown [10.11.0.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan06.de.seppmail.cloud (Postfix) with ESMTPS;
	Thu, 08 Jan 2026 14:49:07 +0100 (CET)
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010006.outbound.protection.outlook.com [40.93.86.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate04.de.seppmail.cloud (Postfix) with ESMTPS id 4dn5q70Cdhz1xfh;
	Thu,  8 Jan 2026 14:49:06 +0100 (CET)
Received: from AS4P191CA0033.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::20)
 by ZRAP278MB0174.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 13:49:04 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:657:cafe::95) by AS4P191CA0033.outlook.office365.com
 (2603:10a6:20b:657::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 13:49:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.222.204)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.222.204 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.222.204; helo=de2-emailsignatures-cloud.codetwo.com; pr=C
Received: from de2-emailsignatures-cloud.codetwo.com (20.79.222.204) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 13:49:03 +0000
Received: from GVAP278CU002.outbound.protection.outlook.com (40.93.86.4) by de2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 08 Jan 2026 13:49:03 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZR2P278MB1002.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:60::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Thu, 8 Jan 2026 13:49:00 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 13:49:00 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: linusw@kernel.org,
	brgl@kernel.org
CC: andriy.shevchenko@intel.com,
	dev-jorge.sanjuangarcia@duagon.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [PATCH v2 0/1] gpio: Remove MODULE_ALIAS from gpio-menz127
Date: Thu, 8 Jan 2026 14:48:42 +0100
Message-ID: <20260108134843.25903-1-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MA3P292CA0035.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::14) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|ZR2P278MB1002:EE_|AM3PEPF00009B9F:EE_|ZRAP278MB0174:EE_|AM4PEPF00027A6C:EE_|ZR5P278MB2037:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e9f610-0146-4a26-3d6e-08de4ebcb2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?CJ3ix5S50mG8tjXYjSS5vHwv+Bt9LUEI6uM4Ao1Az1h9Ru7WqkLxkekoSyD5?=
 =?us-ascii?Q?Ieyw9xXaEeXZqpp6zwuIfhazv0DZjI/VZLJm5qkylbKbVVS/sqFRrHkMFiJ+?=
 =?us-ascii?Q?SaUPJFrk2cm3scDvCQQs10BbtvGK+Wec1wsvoqjJNblemECDY3ah4rOwxwQR?=
 =?us-ascii?Q?2Am3LBYnYx9PbN/+PTrQSjHpjy6RPWn7+tFTos9qYTlKU5jCvu5KEX3PyWhG?=
 =?us-ascii?Q?T7WP09J52pGDzMkSojkqJk2oDOLkLAJ5DcMj8wHIZ/z0hgD7zDu0dEy6V2h5?=
 =?us-ascii?Q?DJBs6IS2Hlq1UlHPaRUJSMolvgoZc+qIw3RJ4fr4aECsbiqGkVVdFVBRHasj?=
 =?us-ascii?Q?uoiar2pHdBqKTSbdAtTHXzifmMLXJbDKpnoh3LN96OTkkXsDT2YDTpH32fLq?=
 =?us-ascii?Q?p8tPcr6wR6TgSX/FrqGSbb2ix3SJqYX38oE71VBg2QpDuWN6CoAClstCaKWi?=
 =?us-ascii?Q?1DgtO+bLu3zvs/V91856N523DT2X2BNisg/KTVX/8MkI8VqlVarIQJrqnq2m?=
 =?us-ascii?Q?RooNxWOPxI2t8hitCFsT/2bOE626aVe2SaSwsaBoZHyPEd8OLbG0OP0ZvJnw?=
 =?us-ascii?Q?Wby8tBry0uRhFzjZqFlaM5X0vxtIYQ6EYhfbopvonizHC46U6PC2Q9/FSkTL?=
 =?us-ascii?Q?Kz/CLEvYbpbr14Z8vxzowMhtOzwQpH6dXzMFpKidBpwjUHvMCZOi5pwr0DxD?=
 =?us-ascii?Q?Bh8h8xb+CAQ62h9c/1+X/AGmeY1gQs7BaxBEA74Wlhx4AgH3st5OoLO9Embi?=
 =?us-ascii?Q?R72jWADAGY/SCf2AlS82Qqg0NYsFX55Lz+bzp74ZDPet6GDuSd2aWokn33S2?=
 =?us-ascii?Q?0wZZccHerapxUjMkD5B6NCTV7BnDgCGRRGi1lxYvBoDsgbVIBay8HxjzS5JK?=
 =?us-ascii?Q?u4zC2MbPhhY20YFFaWeiS1oYwMiRIrlwmEd/a5YeShmb9F6dXDt616N7aoRI?=
 =?us-ascii?Q?bX7t/ndc6JopZn4dj2A58PPBUZXA2KwxGKHIcQN8rVdnx2E7SFLMG+nDlAr6?=
 =?us-ascii?Q?kGDHXXUY4CMqZFltdOwexXKR9xNOJpcgNKUw7sDjF08LocYLzaiiEwqedkI7?=
 =?us-ascii?Q?AMqVTE7T01a8FQ/DRWoAzwmcynSJsY4UwMulq3CD2/YRGYpEPNI/GT+MZ30K?=
 =?us-ascii?Q?uiVMJYGnSehP4IRKrv77siVyTs9YQZPLmY1Wro+Lqpjch0pqCaUB5anEYnp9?=
 =?us-ascii?Q?e56CnmTOgULX33jDrsS8RIN7G09f+rmjWFNIEsEwCP1vFoS1AQhjjJZzc/Ky?=
 =?us-ascii?Q?ojpIq3uO1NwjRX4pkANscTq/Xtyv+DkV+lO/Mhh3Opaxu17uQ7n0zMWC5obd?=
 =?us-ascii?Q?8rRT9rOVatf3BYfR5ezCtkfmKd0wCtrdzrI5cAmeYymsyfn1RV5tBJWwyobK?=
 =?us-ascii?Q?uuIAo7ErrpZi+nVsN2S3VqVvJlamLi3/WXv4JyDj48xokjLpcsaaXtVj4qEU?=
 =?us-ascii?Q?UwixeedKZok16UBE+Zoib9bIZHOe7RgHulKOU4ivoj2Dj86ucF5T8+j+JGeL?=
 =?us-ascii?Q?E1/7m4JkfGbShlLAzBb+WsUAAEq8jKsY9u0L?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR2P278MB1002
X-CodeTwo-MessageID: d0a67188-1acf-4e05-8bb6-5255d7ad0196.20260108134903@de2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 9954a684-4754-437c-2ac0-08de4ebcad4b
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700013|35042699022|376014|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Dkl8CcWWeYnY2eZel9Q/6LDikiOYZbG4OgLDhphgLS00aHhzBig8fqIOFqP/?=
 =?us-ascii?Q?TyeNErUmXD9gWB8mH88WwJTQPBaEum39BVd8YncwLeddJAuWSpEIMLZ4mhsL?=
 =?us-ascii?Q?+n9JNkKXshnhB/s4NWg4K4Sf9CBI/41yxemt7dpw27G/CFmbwT+pbzw/fkr9?=
 =?us-ascii?Q?qYKhFduAy6IQm8RSZIgRT2CTgkeNJ3H6kIWkZX9nqv41fdnEr+Xv0+iPipyF?=
 =?us-ascii?Q?kczVW0RUYlP76Aq09DqdzCcW8NWHnJSlUtYAdNugFt5w2i/QnfgCXqTdIE+y?=
 =?us-ascii?Q?IsRiMQETBvdL2yO2X7heXSi9nXE9ZBqDUE3DO8cbegWch7iSi8x5n3zer8qK?=
 =?us-ascii?Q?F86tcyVjj9/q4tv1NCAYc/wu+tD4IldSqMu4clpy+PmqLxU2p/n0nAhSnJfS?=
 =?us-ascii?Q?sDAFA7La8eTBM0f2GFtzOL/kVqGDGRpqzUD7ByUVBFGpr9isYMuRsvLMDjN2?=
 =?us-ascii?Q?7mq9FdLKFya4Piqi7U15/8AST8peuT+U1l9BDi+SSIUxF1dqvXvbRGKWWXBU?=
 =?us-ascii?Q?gAu2D7ALAzorqC1hP15Z49Pkl0YFTC3GswQEDNYkVdSd55ENnX03H37QO2IQ?=
 =?us-ascii?Q?dBNP5bdwNo6cEKiMbCJOZl6azRXKkNUVMgcmRFuXDCtkLHM7uBVmZK7y3uRp?=
 =?us-ascii?Q?O1KurHN6KFC5FKlMB4xE8xIfFJizwaRJkFtgQRwaH+nTGk1bV5iCtef+tcp5?=
 =?us-ascii?Q?eOvFhHXxU8S/8UnA79kZ13S5e2VGIO727kk0i7F47iNN4J4UeItUrHS0d+69?=
 =?us-ascii?Q?UIoLXojBpAUTFkdE4n4nzXiO8ApD95Lp1swOFOL3ktIf0RcM1hHcN8Xbb7p5?=
 =?us-ascii?Q?BbXgEq3aJpyG04AeMwm64EfAuIBTnAQj99DzrX8oyB3PQPbZeOZ3APiEWJbj?=
 =?us-ascii?Q?a1UnLDJAd2M8fSKqZJkCE5aFCKpv2NESOzhNtY1cw0cVse/XcuYz033dtS7e?=
 =?us-ascii?Q?tgbGM7H3x2njNQl0iCQYRci9k+QTUZt4o2o4HDcOYquWb+fDOupxVyEvk0ca?=
 =?us-ascii?Q?g3D9JTkSflBae7w8gLRexV8cmjfhD80SY0qgCK1VgMW3lhJyCp1HItJQXcDv?=
 =?us-ascii?Q?K9F65bTGjNw5UGwMJg2Pq7NsepBoRHXYmStuJSUyFi1ZbA5hBpViVIn/GzIi?=
 =?us-ascii?Q?oIBRTxDBH12STcQIxR8W18NKHvvJxBWxZRVn9h+SFjs3/hw6rv+pm/WBa8X4?=
 =?us-ascii?Q?0vOYKOZ1Tme4UA4sPfd7tqPz0LSHTFfmX0zptz6LO+orF1RxWWJ3vPuFC6fA?=
 =?us-ascii?Q?Sc773ERs/yMTz83dasCHCgIrCV2fRr8rXktNGt3x3Kjak9B+34CQwt8O1uC5?=
 =?us-ascii?Q?t31HQPhmZD/csQGN2TrWflW23akQTexJLHka2LqdWZlmhXsigw98Q5YahmPn?=
 =?us-ascii?Q?ONpn04jNog328NX4Q84nbmHsXm1Ty69iieuC3wqKT5gmP9T7oEdVZjoxfFbw?=
 =?us-ascii?Q?8hL8EfQO8xQMm7NVbtVmofgkB2C7Z70a/YAqNjK3nPZS0CsqpH60nvv2u5Zp?=
 =?us-ascii?Q?1qgDSmI12u0HS5jZnka5f7KpKlfCPniw6w4hTcqEcJVtwPhXGc6/w3ckqA20?=
 =?us-ascii?Q?LO+m88mb0aAGyX7rEfQ=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.222.204;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:de2-emailsignatures-cloud.codetwo.com;PTR:de2-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(35042699022)(376014)(14060799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0174
X-SEPP-CCCVersion: 2025-12-11T08:12:51+01:00 9ed91da2
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.86.6];domain=GVAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.86.6];domain=GVAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a1ddcaf5-26f0-41d7-ccb5-08de4ebcaf87
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|36860700013|1800799024|156008|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WX+I0qxBAGSzNWCPgDd2joORf/oLfo24gb17ywENRIq8XwU6P1miOMJ7cSZW?=
 =?us-ascii?Q?0WPoX71uBxSXuyBQ7MipryQtPuIagQbrvE59m2LfXrkiQYmo7xR1V77Q5/Kq?=
 =?us-ascii?Q?YiNuHwb163dT/aQ5sczywayLbBXRWqfjqVP0MsL/W7XYx/9XK3JL4DwwXbnx?=
 =?us-ascii?Q?YGHYFrBJdXPijevj/EWYH9hBw0QVao6JI6NZOE/PC8h4xgxpH9zbW0wyK5D7?=
 =?us-ascii?Q?kHRPjgfjt8yjZGstGoqLSLK0ZY9Izl7wkjIT0ukw1Fi/zkn9Ndl86EBAIqyW?=
 =?us-ascii?Q?/AvHMYF8LyU8Y7O2ygTbDD29Whx+V7WZYHZ9qU6TQQYklL2pFrTVqr8qM4Us?=
 =?us-ascii?Q?1N5lQgu8BLHh8qcuFqJW2YnPFufQGUNphLXStmnYdOdwkbVakKK9qh129F4K?=
 =?us-ascii?Q?ojUKhrrdXYXnzd7eE1+Vqqd8sNZaeD0rBuS+XoG39e7iZ7luYqkpC1VRxnUT?=
 =?us-ascii?Q?lwdlJkuea4nnhTzVY3ERSNNCbLbkT8oC6g66IzJ+r1RpE6YuZ3e3e+ot7rk1?=
 =?us-ascii?Q?+IbareHHGbxFhWuGiCJlWnCJ9qCqdzAKarLpFyLGcfzkxRuG1EaGrhpK+sKq?=
 =?us-ascii?Q?rI9zoCfJ4IlSPLwwXOLRvlimiIflGlUsdQBBUh3h8Fn2quw9mMNMSjp5nH1q?=
 =?us-ascii?Q?n4aaPSjlUGMQejrVz4x7kUSaVY0EQeEk+f5RwerxZUAE5x+Y7HLuN4w3ycJJ?=
 =?us-ascii?Q?89IBgGXM3HLcrAMTsw1pxkmaku9QLBpa4o4x/S1hla2lHpTUtxOY2CUAHmjK?=
 =?us-ascii?Q?RVqZ5MMkzNG+m8HecMAb7Ne1kvObk5KFlokf8tA2aKiQnJn/yPaxkKtdvcMc?=
 =?us-ascii?Q?l1zNnKEfxczLVMyVlKjcUDhFxehXy4mb23RwafHjRzDOAghuaxD8L3MBqhsY?=
 =?us-ascii?Q?stCd8WJBsyTs3GXCqB0uwT+tXO1wgkf+1GizkVK47QDCoC4CAdIl0iZ+5w5T?=
 =?us-ascii?Q?nDWcjqqaRq9/C2Yu2i09fUwKZUm06wHT5A8A2aaLqTEDVUynfM5zAZ+U1k2+?=
 =?us-ascii?Q?UnnijWJOFxQa6KBMNOqUDgaas2ldjtUpZs154mlaBFau8ckiuy2a/B+G4CvF?=
 =?us-ascii?Q?kguqHvMIDZuV08hNqOWyStbNE727Dp0/gf6llhNuXztVJaUQ9M0/YiL9xMj1?=
 =?us-ascii?Q?8xPiODi+lI/W?=
X-Forefront-Antispam-Report:
	CIP:162.55.72.218;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandwestazlp17010006.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(1800799024)(156008)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 13:49:09.4514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e9f610-0146-4a26-3d6e-08de4ebcb2e5
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[162.55.72.218];Helo=[hz-deliver02.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR5P278MB2037

The first patches I sent for fixing the autoload problem encountered
on mcb device drivers were 2. The first [1] was focused on updating the
modpost process for letting kbuild to access to the data within
MODULE_DEVICE_TABLE and the second one [2] for removing the MODULE_ALIAS
on all mcb client drivers.

They were rejected and Andy suggested me to split the second patch
in a per-driver basis instead of sending all drivers' changes in a
single patch once the first patch was merged.

The first patch is already merged on Linus's Git repository for 6.19-rc4

commit 1f4ea4838b13 ("mcb: Add missing modpost build support")

So now I am sending this patch for removing MODULE_ALIAS on the mcb driver
in this subsystem as it is no longer required. This cleanup is being sent
to each affected subsystem separately, as per the review suggestion to ease
the handling for maintainers.

[1] https://lore.kernel.org/all/20251127155452.42660-2-dev-josejavier.rodri=
guez@duagon.com/
[2] https://lore.kernel.org/all/20251127155452.42660-3-dev-josejavier.rodri=
guez@duagon.com/

changes in v2:
- Renane commit message

Jose Javier Rodriguez Barbarin (1):
  gpio: gpio-menz127: drop unneeded MODULE_ALIAS

 drivers/gpio/gpio-menz127.c | 1 -
 1 file changed, 1 deletion(-)

--=20
2.52.0

