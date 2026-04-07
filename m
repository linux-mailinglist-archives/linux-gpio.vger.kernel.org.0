Return-Path: <linux-gpio+bounces-34838-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOzyCOxR1Wkf4wcAu9opvQ
	(envelope-from <linux-gpio+bounces-34838-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:50:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C04813B30BC
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61B1D3036D54
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 18:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E79633263A;
	Tue,  7 Apr 2026 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="YJapxY3N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11021124.outbound.protection.outlook.com [40.107.167.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E307F25A321;
	Tue,  7 Apr 2026 18:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.167.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587764; cv=fail; b=EiVtviG6LVwnexBk8JzdWfp048qmJzs1EPRT4GH6mz3W5mkusdmiaEoahGYeFZlyl9dwE+1LBsJ6LK0hr1L929wQ6k7beqIRk/R2Fg5TLRMsyWVHdaiG9DFX1u+B5wOvvATX1PEjxE3ZoxQRK1yoRxLo20g4fIOz3cnN2W7tFb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587764; c=relaxed/simple;
	bh=GsLT9skqXxNqS8tdVC0hBa9a+AJGlUePwwj06cat+Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B0VqG2lWcqSmPnCIiqZUUwKqWDLbeFIfZrAnYmCGSrb74PyVsOFYCi90f0VvBRvgwuIKkAvYIDEn7I55Fub/OmunpSdqT4lr+VeQkai/ZTKJa708I3KXO4kGdom/pgwU+U+CgQ5g1k6wXK0Ppeo1jE9Ljt8MmabYxRzI+9u7qqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=YJapxY3N; arc=fail smtp.client-ip=40.107.167.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJQWglIkhDFfvd+NAiV+QL8bOco0xeN8gfKG+kZy/MlhBkCv/Q/Py+84MOCqFetqgXPdhgcmoSaJumK6RxaLJfaDrFRkvr3WeE2YIAOXaWNngHGX8dyddDImW2todI6jk++ew/c9zB78+fGJ4NORiLMhLK513MhKA6o5hPNLtPwvdQG82UN/3FHshEivY9V9F8TNenRkw3LYC4Z1VGeemtaC5GE6VqKvynZ3rQoQPNzUAHE1v22C1LQFr+D0gR4m2cBlxre6fKQqyGygoMG0fTE29UDuPLvQY6kF1ovzPOWVZpi6B3CNB9UGefyP08qncxqPEQb9OYfPdIzibbAgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tSU0evtGs8EtidQCG5nZVpGaFPEmE7FKr4PzsVR8Vs=;
 b=p4SVdjgFpf3g2ClHL6OyaTlY4fBiaEqu1hj8sDXyJ7fU/E45od5YAAe7vg449+7jbhpJektpvKbmij+ajiTtvz+yKQjOYiAy8/XhK9e4C7D+qEB6pvzBNoxwKm9rKft5ovpfclZ3A7j5ZNkt4HVNorsxDsaSi1RyOUCZbcW15rcO1b/rrTpPEGtSIrIpZQvkPb7J1ViK40QAeM3I19SthtM93uB2wFRFn4CSTWBEzPPwicbTiCPfRuNhAmytumWvFJ7LW4SriQMuvIgg4PaDnqGIRrO6Z8AoalgqmZYyRb/XBTWDTa7FVD/RTm26qefdHVm6bWomMkgSzujnGN8E1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.4) smtp.rcpttodomain=kernel.org smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tSU0evtGs8EtidQCG5nZVpGaFPEmE7FKr4PzsVR8Vs=;
 b=YJapxY3NW2ll/lxFlRLY8sL8SAmzexm2TKLO1cuPIEliWZsWtIBOuy3gsVPY6zN2KKAlznbQKdLMp/PNvh08xosL/UCOG9xvHLqZy/N4oVtNEYYJxlAwQPKDWZ2AfDRi6fqX/NcxRNjoNo+7eON1WueyCj2tPQNdtzkdVTnHHz8=
Received: from DUZPR01CA0237.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::20) by ZR4P278MB2096.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:b3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 18:49:19 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::57) by DUZPR01CA0237.outlook.office365.com
 (2603:10a6:10:4b5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.35 via Frontend Transport; Tue,
 7 Apr 2026 18:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.4)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.4; helo=ZRAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver01.de.seppmail.cloud (2a01:4f8:a0:13df::219) by
 DB1PEPF000509EE.mail.protection.outlook.com (2603:10a6:18:3::628) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 7 Apr 2026 18:49:18 +0000
Received: from hz-glue01.de.seppmail.cloud (unknown [10.11.0.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGQ0pkhz4wfb;
	Tue,  7 Apr 2026 20:49:18 +0200 (CEST)
Received: from hz-glue01.de.seppmail.cloud (unknown [172.18.0.3])
	by hz-glue01.de.seppmail.cloud (Postfix) with ESMTP id 4fqwGQ0VYrz20hw;
	Tue,  7 Apr 2026 20:49:18 +0200 (CEST)
X-SEPP-Suspect: 385a42524b254aafafe27cd15d8621e2
Received: from hz-scan09.de.seppmail.cloud (unknown [10.11.0.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue05.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGP6xq9z20Qq;
	Tue,  7 Apr 2026 20:49:17 +0200 (CEST)
Received: from hz-scan09 (localhost [127.0.0.1])
	by hz-scan09.de.seppmail.cloud (Postfix) with SMTP id 4fqwGP6Fctz19fG;
	Tue, 07 Apr 2026 20:49:17 +0200 (CEST)
Received: from hz-m365gate01.de.seppmail.cloud (unknown [10.11.0.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan09.de.seppmail.cloud (Postfix) with ESMTPS;
	Tue, 07 Apr 2026 20:49:16 +0200 (CEST)
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp17010004.outbound.protection.outlook.com [40.93.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate01.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGM6mctz2xLQ;
	Tue,  7 Apr 2026 20:49:15 +0200 (CEST)
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 GV0P278MB0162.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.18; Tue, 7 Apr 2026 18:49:13 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 18:49:13 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [RFC PATCH 1/5] gpio: generic: add a generic register wrapper for MMIO and PMIO
Date: Tue,  7 Apr 2026 20:48:01 +0200
Message-ID: <20260407184805.807328-2-dev-josejavier.rodriguez@duagon.com>
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
	ZR0P278MB0523:EE_|GV0P278MB0162:EE_|DB1PEPF000509EE:EE_|ZR4P278MB2096:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb99e0a-195d-4ff6-fada-08de94d65fff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 w5jmIdVlO0mf5x6iOaQh8lrEWPYFTKFYmHIwXL4C5XiYNza9syIqT1ASk7A5I7usYlqDkdFFfwX2Mxmlxjo79i4t3F2Kcrb3iPD/bb1az3SHtiEQgPj2NeDf3ner+yUDuVkFeY7if4jMGLiT4AffdE9VeowBbW05PA2LTJXBqldLbgXPk65XVmA899x2EVz38RLk85EgE6npzBG3vA3e5/FLiVpQSfBiLsSDXvd2b043E/GXvV2hB/QwfJZkHsLovtg0dcqsJtHdBZeHwYZgcMuSz5zZl7tsJAjGcSwNgIta/ManleEpj6MTj/NQ8UBDGUlMxHkZmkaulnU8UOR7iTzopwt6fFFAP2wiFHYPMpN1Hyq2HiD3xmzizurNM/K2YyncUuBZZ0dvdfr/41+90Pg/0Tp6hEOayxme9JYJ36ZrxFwl8tu8iK8IKXV+Q0TQcOspS37dmDVanw8qvzkHREbks2KYOcZ53RCzgnwjvQJvwr0qlVDJVTbnCEa88R0aoxbSkwkmZy3Fvy6BRM9cqcpdXStQAyRaXV56QSMMS2ADqNYb9PSoTrC7Zw/lLkdF5T1XMHT3dxjhkm6DzwoNrJpUX+fV6Ch/JwIUgxBJF4zKX83yBEETXJstCU5pFxLXy4AxVeLKF1MyxrPCvT0PlsdNOkeGmIfRoW1hNr2C3aF5ZCh6n5VF5yHSEy4Irs+h+u4pSY2BQKUaP5XZknGDTe01i+eM34/9YuHQObmZVfrgGko45CSnJqE8P4ThYpUYooT6cxaY5rIUb5QwTNCFXPdZbsxqBjQF9vYj0HrP6vc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 DsD9f1DMy0caImeXlAhmQkSOWCpdsz6TmBMmI9fFuiFZnGgaG9H0lAo+YyE24ER4D8gUSLdSMfWfD3s/+xRn9uF8Gm6EXQKP1bePo7/EaQebsvg6Z4hdJZWp9mdKDjh2HBtTzkC0gHK/KtpeY9mkV1vPaMWCh0/IGsHLLs5/Sl/Cv1LbrCjMmjn5PrPjEXH2OY3DCyPURVKFb7yu5SwdF7LhinRjwJjl35rq4RWH26bhoEqCoRKpOWJRYvo+Is7fgV/UlyQVAKCJBHR9100UfbCTgBJK3RWLpmAqHJRKJOqII5SZxcTNhrZ1PrxbJo2ZS6roi1BveG96IEG2hR1veg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0162
X-SEPP-CCCVersion: 2026-03-30T09:40:10+02:00 639c564b
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.4];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.4];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e2ba8c9b-98b9-4f2b-c1b9-08de94d65cf2
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|82310400026|10070799003|376014|14060799003|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eACzm9sJklTyM+v5LGLWAFRvBBSLSIwgNNr2RU3mDetWuVbbmDufBhg7TE3L?=
 =?us-ascii?Q?QKJbWYdZy+owQruQLLjSZdOEHlHMowBYtXgRidl72+yYh3G0zgxu21zSNjlM?=
 =?us-ascii?Q?EnLzuHQ4+JZvpX1OCHlzMeQHDxJiqz0I1uvlSuju67TJjeA5Xm/BPylO632K?=
 =?us-ascii?Q?wsiu2eavM8k/SufPLqpFOUKvhklWqET3esUIpaFXZ9Torg3MCaa/OAvgzII3?=
 =?us-ascii?Q?cRH3vuJ7nW9DxdMWSLN9FixHgmhP3cuwbGK6BDlQQjKWQJduI7B50zCv6k0v?=
 =?us-ascii?Q?3Xz+7ebjIbTN7/xgzaXGDmgZ1XCJPyBSnUec0eAN/jgfpBbQncBxvet8L/6p?=
 =?us-ascii?Q?+5F57seumUaiCPiP7F0t8Fsoe3H91uyts2IyRP19CA7lN5pyGa2azsyRRsoK?=
 =?us-ascii?Q?WWh49JJnZmmGoTuQM3P0tZGHRXmJoodDAVbSE3d6C2Gg0zEaiD2YfP3LWDXn?=
 =?us-ascii?Q?7sI1jcZe6aZm4gMEOYaEeHMK35SiaTyVdHMmUhUWMgAGhjxC4Y9l/8xR9a9G?=
 =?us-ascii?Q?Y0yqlKNFzRuj/nLWPLLUncNnisxIPu3psVdTRHwj+wWmL6LoGo/bz8K5d+pF?=
 =?us-ascii?Q?skcgiepfymxQnju8CzOO8SWRMsLqE67aYO/GCL8SOmIxw+7D9+g/FesHl5D1?=
 =?us-ascii?Q?9oCwuv7/hj7VkH37JrnUheDhZuVqfRBy2CaFyQWsDqSYsUMLGkcOrBGtmYhh?=
 =?us-ascii?Q?asVdjlCBWW+mwhKddYsS/rmIgw0jdCDXCDyn6f60pfN050571Dt7I6DHleF0?=
 =?us-ascii?Q?SH8Gi71mDQ73EXe+6vIVHkNaS5C4j2GP48XG9R7vZR5T/wuNU8qFVSJmRow5?=
 =?us-ascii?Q?1OESy3Nyho+FTfWHflNOXracVIQqW8vUJCdGtLrGccDNrhsYwrabgpJQ3Toh?=
 =?us-ascii?Q?FzX7RRi0ASoJgor0uxSFDgQZtUnt0vFTPOR5XFBBLwa05X21lM2r1EBQ5PNc?=
 =?us-ascii?Q?rV8CGkYSDBiW2UeN2cv5X24jZ5DUv+MZKMqNAMH9Ynyu0KsmRBOLJmhj0py6?=
 =?us-ascii?Q?x1jF/otPsURy41EOOAV4xx1pUvAcNZhWlhSswPuFgOywQE65fnyvzqfzG2XF?=
 =?us-ascii?Q?+32tGehFcUy7RrNwzTuKLRvasnOXyLDT9SRpDlWd2maDC0Mmeatep6tV7ppM?=
 =?us-ascii?Q?va9w80ljwG9NSc3SzyrlZdufQgElK1JpxtnRILUiL224k4ilPBtVCWMqfHGB?=
 =?us-ascii?Q?g+fDIbfeEbhZs9/QRG3oiw1l6pIxHzmeOeppFOMPuIopntjrBXm/PTfpdmKr?=
 =?us-ascii?Q?MlJd+qYNklS3zAk84db+?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:a0:13df::219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17010004.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(82310400026)(10070799003)(376014)(14060799003)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ILGMHnT0h5bkhb5wkk2XDqA47/bNzQB8jkTl0POMOn2MDbu8ux9I0RzELFbtjiFzYOd2byjN6asDyT6jCED9fLc/TQmzlm+GPeiSgLYTT+evce3G1wS4drca4LNaUBN8dBAlQ5rAfMnzBgVH+nlTNwBq7T88wCsZw7yTU16IsbsFa1zIkKW2B3ECuIM03IGsn0pH+bqZ9VYqc5h/wca24BqlVxqKs7ZJg13ENy2BCwOj6jI32BMDePEJfmk/HOZFmBuoJbahGtNEs9qN4lioGuEAeCFA5fNlUwdRLXmF7NtmwwpXMXcBCN38Se1pvMk1xqtpsaVIUb34d3JUA6H8SH7ABzMnnZ4cmNMNpRny0oU/JeQEun9iVzS2HF5aUufdtMYN7ZIiEAS6yFroUtfGyLV8+Ltb5gZD8OdEo/In48awNu/gNR4bgTsE6FtDNC/I
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 18:49:18.6512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb99e0a-195d-4ff6-fada-08de94d65fff
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:a0:13df::219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR4P278MB2096
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
	TAGGED_FROM(0.00)[bounces-34838-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[duagon.com:dkim,duagon.com:email,duagon.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C04813B30BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For adding support to port-mapped devices within gpio_generic_chip, a new
data type is required for passing to read_reg() and write_reg()
callbacks as I/O port-mapped and memory-mapped registers use different
data types.

Introduce a new struct gpio_chip_reg to encapsulate mmio addresses and
I/O port numbers.

Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
---
 include/linux/gpio/generic.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index ff566dc9c3cb..87c624070901 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -18,6 +18,7 @@ struct device;
 #define GPIO_GENERIC_NO_SET_ON_INPUT		BIT(6)
 #define GPIO_GENERIC_PINCTRL_BACKEND		BIT(7) /* Call pinctrl direction setters */
 #define GPIO_GENERIC_NO_INPUT			BIT(8) /* only output */
+#define GPIO_GENERIC_PORT_MAPPED		BIT(9) /* port-mapped */
 
 /**
  * struct gpio_generic_chip_config - Generic GPIO chip configuration data
@@ -56,6 +57,19 @@ struct gpio_generic_chip_config {
 	unsigned long flags;
 };
 
+/**
+ * struct gpio_chip_reg - Generic GPIO chip register descriptor for MMIO or port-mapped I/O
+ * @mmio: MMIO register address.
+ * @port: I/O Port register address.
+ *
+ * Describes a GPIO chip register located either in MMIO space or in
+ * port-mapped I/O space.
+ */
+struct gpio_chip_reg {
+	void __iomem *mmio;
+	unsigned long port;
+};
+
 /**
  * struct gpio_generic_chip - Generic GPIO chip implementation.
  * @gc: The underlying struct gpio_chip object, implementing low-level GPIO
-- 
2.53.0

