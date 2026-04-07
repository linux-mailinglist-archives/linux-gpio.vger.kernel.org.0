Return-Path: <linux-gpio+bounces-34840-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yChPAcRR1Wkf4wcAu9opvQ
	(envelope-from <linux-gpio+bounces-34840-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:49:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 095B33B3091
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E89A30195D4
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 18:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA9031F99C;
	Tue,  7 Apr 2026 18:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="euZ4SBqz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazon11020098.outbound.protection.outlook.com [52.101.188.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19A933AD9B;
	Tue,  7 Apr 2026 18:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.188.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587768; cv=fail; b=KQ32qCGMUW9uzF6qUw0z6PZMD/igsRbJzedNT4SYSBLPyvCckGQi4hAKW6fmVpbmPTntkWoeS8F2mb4zn+2efKiONQkS3PAeNGRlCjHlRjxEsIHd7N5hAf+bCJo5Z7iZJBl2lU1Yi2Gc6l43/asjfOVu4XBZwXAtMrvm/yagxn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587768; c=relaxed/simple;
	bh=JdtKGygpOn3/p5dYe8iW6MXFAN/9o2F1YIMIg8o9xAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JCSPoZOMHlq/3CJ9b49HW+wdmH5bBIBLme396ylOhj9jY7aWX3ixX2JP1D2H8dpQLHMeIWB4zxqJXx7dc+CxRYZZVbdO5BqKI3JqL2ZRtRG5gU7399usQU+U1zMdqajVy3fTP8so4wL2cNWX8IIroFNOVzZhugIhYKO+qS3CwZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=euZ4SBqz; arc=fail smtp.client-ip=52.101.188.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5F8kTHqBn6I3+4nHDroT8oMhABTXMJY7J3x7858ogJF6gAU3p3+9xYjp0b6pvGB1NnjQkPZv4WACHi2bhT/Apo8MJYReIguOWYUUzHtnc7KN4IR2+ePtokCNr+xkE+zBycagu9tnMMRi73JtT/7w3MVRtF5EsQH44OglKP3KC7Nyl4RSz2fDVduCoQtWeZrvha3vOGMs0ZbSYkbTJWUDe7nVpuL2MJQdhqyUAgrClYILTDQDx7GiQJTyG0xE1J4D6m/DsruedIkfaYq7u14RTAY6hQJzWKPO/nulaUQ8i3tv7nPwM/ckXrqnjFlTBOlJx+r3cgAkhwKn6SXmjqeKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jsaCVS/LBWrBdEAPajVqv/NaQX7alkOD0cqVP9v0bU=;
 b=vXBF0YZupteW40/6CNmLKXtWPye7Bbu/Lj7lPuhBtFebEFe0Az+mL/3IjUwh00w7c+jNj5dQUTWfMEe2B6rptteHBr+cwRnPXVGypjbZ8X5m/ajCKb/90E3crIhCBifJa4ijRmn19xPtS7wDjSTQd5iNxAoOTtdLG2Tm7/L//X5VvIiQjZ0ak1VyLXXf2hFOWOwuk59aAUCwnp0LVLb2TrOI7ARlA3vuBZb315rnf+BONyp/zDujMY+bZXuR6h/nS3f90IrmVGR14qMEfXHVbOmNJDiARYET6U/KON+ukLVQDFYTxlnhVo7qy+ePGFh0rwnI2d15frdc3GG5Talfug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.3) smtp.rcpttodomain=kernel.org smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jsaCVS/LBWrBdEAPajVqv/NaQX7alkOD0cqVP9v0bU=;
 b=euZ4SBqzz16PrHHAuft9na4kMd6uK+aqR7aYOM4G0T6+lwn5PcJcw+0EdAW4ODP0xsDZoVxARcai/kDaLRMPBq8Ew5pE6VsBkOTIa0fDgZzUQ+oCTdFl6PH66n3peiBACAPT+4ZT0PcLSbWYBB0JRL/cJNU6LP3wXosmeD44XTA=
Received: from DUZP191CA0053.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::21)
 by ZRZP278MB1828.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:b9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Tue, 7 Apr
 2026 18:49:22 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::3a) by DUZP191CA0053.outlook.office365.com
 (2603:10a6:10:4fa::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.35 via Frontend Transport; Tue,
 7 Apr 2026 18:49:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.3)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.3 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.3; helo=ZRAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver01.de.seppmail.cloud (2a01:4f8:a0:13df::219) by
 DU6PEPF0000B622.mail.protection.outlook.com (2603:10a6:18:3::20b) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 7 Apr 2026 18:49:22 +0000
Received: from hz-glue01.de.seppmail.cloud (unknown [10.11.0.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGT5JRrz4wfb;
	Tue,  7 Apr 2026 20:49:21 +0200 (CEST)
Received: from hz-glue01.de.seppmail.cloud (unknown [172.18.0.3])
	by hz-glue01.de.seppmail.cloud (Postfix) with ESMTP id 4fqwGT51Ylz20Tv;
	Tue,  7 Apr 2026 20:49:21 +0200 (CEST)
X-SEPP-Suspect: f31541e406bc473f97c9775e5e4dca19
Received: from hz-scan05.de.seppmail.cloud (unknown [10.11.0.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue05.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGT4WMYz20Qq;
	Tue,  7 Apr 2026 20:49:21 +0200 (CEST)
Received: from hz-scan05 (localhost [127.0.0.1])
	by hz-scan05.de.seppmail.cloud (Postfix) with SMTP id 4fqwGT3vN5z8n8v;
	Tue, 07 Apr 2026 20:49:21 +0200 (CEST)
Received: from hz-m365gate01.de.seppmail.cloud (unknown [10.11.0.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan05.de.seppmail.cloud (Postfix) with ESMTPS;
	Tue, 07 Apr 2026 20:49:20 +0200 (CEST)
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp17010003.outbound.protection.outlook.com [40.93.85.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate01.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGR63R3z2xLN;
	Tue,  7 Apr 2026 20:49:19 +0200 (CEST)
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 GV0P278MB0162.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.18; Tue, 7 Apr 2026 18:49:18 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 18:49:18 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [RFC PATCH 3/5] gpio: generic: add io_port to struct gpio_generic_chip
Date: Tue,  7 Apr 2026 20:48:03 +0200
Message-ID: <20260407184805.807328-4-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com>
References: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com>
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
	ZR0P278MB0523:EE_|GV0P278MB0162:EE_|DU6PEPF0000B622:EE_|ZRZP278MB1828:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d6eeac-7436-4fbc-6bb8-08de94d6622d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 I0x55nsIk1a/I110IfDBtcE+1/w/hlwHqW5Z2i3xOH54nE8dASD2ZBzoDr0FPr3v7A6CBOlnFrBGKE7UrLlTYmhzPvrfhMRuM9JSgrJduxfP3P4MQO7EUkuvdWUvZRgIJ6BH9yBOZ1V0o8bEym+Ua+Pd4/F/0jEkT9G+BNJSIXJuLvUbVr+QJy0BLjdWqLUQxPLf2eFMnxPYWg2P7xj57loVIiqEqD+KCzrO8cca1aoa3hZzuMyjUTa4pJDInAV+XWpKa/zV7Y/BtHv1gPy/j945zX3WdagqJYXHhOAr9Zp50pif7YqZ++TRDAB8q+nu7sk4198wZry8eTZNJVVQAcxf4ZxsY21w9unfNMChfCCUgPeKalHsr9ToRJqIWSIL5Ko13AFd7183DojgPMI640y7Gh0kzohKWJb6rhHAIf2QBt9Na5Imjt50Sm4bWXAfQxxcfP3H3d2cEux3rA6oo9e3n7bINXAzI0G1hIV1OjAAACEzNIcWavDfLFNHoWGFCh58b93V0jqqlirEgWU0ulnns25W1Kpj6xii6HqpHNdPS9fPNuVas3bVUFIHBGtkIy/MBbBCKU/pV4M+gBem5vlwdbqV1DYNUkNP0z98ojkfJTaI7zojH4cs3+qZ/EV1vM2pQKh8kuZd1XjOxzl+nMSkbUxd+Ab7IO/2I/avMYXTeP1nIRP5gIyxVM6ijdilEBsCNo2bhI/8Ak3BwdeatiuG5SjZyJhms+pMweZbHxipLA4gxf+BxIs/vQ+PShvvuTn749yIbznw87PIKf4UmqUzdCzasESGZR2p4+i0MTw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 fyoxWM+zpRnHydDBnW0laQUTaCKkthWsFyBK8BVOU6Ccbgo1b1+C8Ianqclwh3xx6gUBGH20A39wWqkjiPhi25EBovGRAeY7HtmL3AK3zBWVWi/QaZ98hMftHSavh8/0YF/BlTQ5dplZgklHaXZv416Th4ylc8FrQK433ZY+SQ5cwNRlFC8hmlld5+x8lz1bRC6VrhODJDyCXezaP149siWMHUhrey2uPKCZyyA7m0xRUyLSOPZbP04FhTkGngWOoN2hEn5JbJatPEJmw13nDvVbDWlpPuaaXzu3CtrdMoPI24MJI2qkMj2Oyu2UPem+CFsDuCsY93dbnRFEEJCvsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0162
X-SEPP-CCCVersion: 2026-03-30T09:40:10+02:00 639c564b
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.3];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.3];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dfc60da8-9c61-430e-5396-08de94d65fba
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704161511799003|10070799003|1800799024|14060799003|35042699022|376014|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QrP3ngblKpmN4i8VXaPfbgRBmUZuDEzgYeJdEn3Jx/ibA3MKShdqQxrWSN/N?=
 =?us-ascii?Q?cLA6qJcB3K63qSTlzbBeLkWQIoAezqoOq+Mt+PpTgh44sl9qIekei/qtvvQ1?=
 =?us-ascii?Q?t/P8cB0LR5q/jx4PP4AONUgr8y+R+xlAQHFxQE1vdT3psHwIRIqjUd+2LXUZ?=
 =?us-ascii?Q?g6hB59ERGo3Tx60gODzdPjbyHVuPt60KVBlGWgT5+zkuCpU4KnwWZOoqiQ1U?=
 =?us-ascii?Q?GNZXbBCBw+mAGllI2Ceq8lUsF55Hu70cWSBUpcOCN1nN7ppsHBwI1NEM8eQD?=
 =?us-ascii?Q?qM14LLApgnozEtvBArMrJlZLPLhPtihd6yCmoIz+KTjfno7P+dfgsDa9gUy4?=
 =?us-ascii?Q?Uot3B2Xx6vnmpp2/CkECH9UW9wrgrSylGyxaYvWzPFLwrpHi4IEwIOke2YF4?=
 =?us-ascii?Q?cr3XUjqiSWDIQ6dL7soYJyx2ki9sv+flTmK50I8ySrv0hw0qnXLP7rXo0utp?=
 =?us-ascii?Q?qRm82EdwVYL8MabB/o2Spg5QCw2Nrnzd0K6g8OF8zJzNVG9HL7vj0MN4J5ic?=
 =?us-ascii?Q?XaqquKMmEfTKEvnHyJOiYJjDlK88hOU3lAkPMqq5qp4rbuzMEuqTy+gmwm/p?=
 =?us-ascii?Q?B5jlJQuLMbuJD7m9Q2FxSr0CvPXzJgVktY/EY3UNL674TCNtLe9vSYL4P2uP?=
 =?us-ascii?Q?xLIBLuA+LiUXlmzypWquGqbd5yPx62qoYU2d0thVRd7+ZmO3N6r54S7Jh4jo?=
 =?us-ascii?Q?0ziHG9qNSQX6dz5fVlPieBPITren1okX7XZOBkLdW6V/pkjUaNaA3yXQ42FF?=
 =?us-ascii?Q?IwMTp5/YjEtBTksC9uBqL6Q98qeR+PVV8gBabyW4OxdPm9PU8fMLFShQpu9X?=
 =?us-ascii?Q?uzWtFymGbnmhRWrjDhQkhxUx83Exb0zbEuGc7NhMyfubE5oiRe/p92fOjqSq?=
 =?us-ascii?Q?DKhh2/MgtjIvd5vuECTBGr/W9A/WSuAcVj9o8HW6FtpPiLHSmEDVYr8z+F/I?=
 =?us-ascii?Q?GaPHfihZD5FJswcbSJELS/CQ3zaXi3z1YRkhRi3PFUaWMLPJ70zOQv4N3Udi?=
 =?us-ascii?Q?IqkTiR0Il881vndM+T0ahBx4qvYwBqVfwj3t4GwIag0yXn5XdK7S93QF6TF/?=
 =?us-ascii?Q?mBW+gJI4kgxYGDpo+0MRDriDikyfmU+pTGntsPo9fglgkHXqcAMzYaakr2g6?=
 =?us-ascii?Q?Dg12GUUvvcXwv6bIdXJcE+ky7ZDC8b+CnYUiW7nWm9Ae5oWDTOzOFKgIWLri?=
 =?us-ascii?Q?i3ibwh5szy8eQftmDrwS0Hujd3P2F2Ggmc4bPdrR3kOUBprspgJBiml3NvI?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:a0:13df::219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17010003.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704161511799003)(10070799003)(1800799024)(14060799003)(35042699022)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RS54f942hRpgWyPbFB4BRW/TEFRIRMSAgtKcvLjyRWs1T+dEiIWOA0KwvQ3AKKr4I04s6ECSLS2EtzoLnD3QHt1AFtg3G4dc04x0FPjgsodxxmel4p74L6xh248x5prWz1tpOhy/irDeKIEIqgVzi570ALTpIxTQz/8RmcJajr2XlPRo7CCiqF0fJgIe0LwFqAEU7ADOH9Zq6PGTj5uHjMK+QEoUwn5ZQkfQ8giDTRcpcbXSgNPq1zBDrSWIaCmk+6QsKrsyfbu6onv/YMP4h75ddbdmyKjOl77PIlNmTlol34Rl1Fkb7qJCbQqOw9O4ex0wqrZBaSTnfqN6eUzJ/Y6gdF/Jxj0RR6kCZTB1WvIH13bBULcqeCGA47Gb4S818wmw8g2HmEEGMxBH7Lvyic6R3vT/9Ydm3aKw7mhuxY7vSQhMaJtmchPXdiuxQ6yf
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 18:49:22.2693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d6eeac-7436-4fbc-6bb8-08de94d6622d
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:a0:13df::219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRZP278MB1828
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[duagon.com,reject];
	R_DKIM_ALLOW(-0.20)[duagon.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34840-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,duagon.com:dkim,duagon.com:email,duagon.com:mid]
X-Rspamd-Queue-Id: 095B33B3091
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add an io_port field to struct gpio_generic_chip. Initialize it
depending on whether the GPIO_GENERIC_PORT_MAPPED flag is set.

Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
---
 drivers/gpio/gpio-mmio.c     | 1 +
 include/linux/gpio/generic.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index edbcaad57d00..37e1ed6569e6 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -645,6 +645,7 @@ int gpio_generic_chip_init(struct gpio_generic_chip *chip,
 	gc->base = -1;
 	gc->request = gpio_mmio_request;
 	chip->be_bits = !!(flags & GPIO_GENERIC_BIG_ENDIAN);
+	chip->io_port = !!(flags & GPIO_GENERIC_PORT_MAPPED);
 
 	ret = gpiochip_get_ngpios(gc, dev);
 	if (ret)
diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index 9a71a8fbe56e..eec63f8fe144 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -111,6 +111,7 @@ struct gpio_generic_chip {
 	unsigned long (*read_reg)(void __iomem *reg);
 	void (*write_reg)(void __iomem *reg, unsigned long data);
 	bool be_bits;
+	bool io_port;
 	void __iomem *reg_dat;
 	void __iomem *reg_set;
 	void __iomem *reg_clr;
-- 
2.53.0

