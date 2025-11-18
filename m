Return-Path: <linux-gpio+bounces-28640-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3199CC6835D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 09:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 53DEF2A3B2
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 08:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F423081D8;
	Tue, 18 Nov 2025 08:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="qQYKTCpa";
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="qQYKTCpa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11021131.outbound.protection.outlook.com [40.107.167.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E1C274B5C;
	Tue, 18 Nov 2025 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.167.131
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763454710; cv=fail; b=LAKxX2N3TJdtYP+b3gKXckWJZfFZK6AnTz8pl6BKdnvH6vsHQyE95B5k9jvTgHbDl34ZigAxsmdISH3T2of9+o8eKgtKtJYAk16TbyNDT0YoECvxmdDmwOy6vKo5RM5ux24/wOF1Bjastca71ZnQapZndbknNcWMZJaSmJze914=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763454710; c=relaxed/simple;
	bh=2yGf4foP5UXXL4YqecOIO7pRA0gtrrPXD0NOyv46Rl8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Y2rVCS6e53F1yafnSEsSkEUy92WnVnbFwoEjl5aL1Mrfm6HCRoyh/A8qsUYLJGt7r7+foCjjGzaf7mq8XWnktQ39rlgWCI7ZvP8AGM1RTrm5AEsLWDdpqCeI3LVG2wh2X/iI7+H2A2NCVGVl4Z663DFTdnR2K969WrbZDhUayzg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=qQYKTCpa; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=qQYKTCpa; arc=fail smtp.client-ip=40.107.167.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xcqLXBVB3k8+nfcX/zam1E1sRKEwR37PvA70xQJBk86/XD28+HeSgeWBzT7d6FaYorNhAeJP/CjW5F4TL8oVKaDCimUU1rnD6InCOBvdvrIR1gucTcRHacuVuKBn/g9jBCi5InNtIDavR9KiTP8jYW1xO2m7sGe8C4+Yr7IdpyizMMV7x00vbYFAM6vWrd2Bqjy4kjtO/JiFCUOHScpPNIdiAmZjoOXQrxP0ospkHRltUE/SQMDjmkxF4/EtxiaTNbV3ZN4jV/d6o09NkZ9Qxyq2oluXuRBAhMfLwjlNW0ntB/zv6SNo2cbpRBezDTPEySzYK7Hjx1lLZJuPC+zKBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vS9wIL46bYkMUf1yAaOk/sMgz07JU9J6RJsW4OeurAA=;
 b=CRNmRDCt7zyZwU8k9FFVXVIKsTPRXb3g7ZXqofcEQSuHC8skZrIc6/5D0k7ITVzeSn8FOu8p5Un5wKJfIM+9Lvyozq1WWGldbgIXcAQ6m/ewNQica4zMqVWfl3mYvm2x5C50m7eVMV5bT0YeC16W2cQv9cr5Bn2SRUVIlI+OZyaZsWQ/mD65VOLQmEHVtFht4CyBKNb8A1s8pC6Z4ac7ZExHDe57CdNize94Lg5HGmz+/ln9gHhJbiVo81CMyj0FLM1jR5jEZ4HD7scpbRIdxLszoFT1OBCoHRn2BCXURY1WBwM7Hz3oJ7u/M1VkUF4Gw8RXjIAG3KaAgU4Iy29+NA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 194.38.86.34) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=pass
 (signature was verified) header.d=duagon.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=duagon.com] dmarc=[1,1,header.from=duagon.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vS9wIL46bYkMUf1yAaOk/sMgz07JU9J6RJsW4OeurAA=;
 b=qQYKTCpa9+kRe9XP/fQSCdWv9ROLYfwb90j80jpnRy8vqToTltK9NRJdh3YHIu2+8K+Gjt3XecLuKpQhOTkJezmeHVluP8lckvXoUZTErK+hnz/GHX07KnD6/T+Bx3PJ9fpTLMWaJeIFFFABghDNYRTHHwPU5j58QGdMURV9gWc=
Received: from AS4PR09CA0017.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::11)
 by GV0P278MB1031.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:4d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 08:31:41 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::c7) by AS4PR09CA0017.outlook.office365.com
 (2603:10a6:20b:5d4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 08:31:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.38.86.34)
 smtp.mailfrom=duagon.com; dkim=pass (signature was verified)
 header.d=duagon.com;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 194.38.86.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.38.86.34; helo=securemail.duagon.com; pr=C
Received: from securemail.duagon.com (194.38.86.34) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Tue, 18 Nov 2025 08:31:41 +0000
Received: from securemail (localhost [127.0.0.1])
	by securemail.duagon.com (Postfix) with SMTP id 4d9d8H5FmLzxpC;
	Tue, 18 Nov 2025 09:29:51 +0100 (CET)
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010005.outbound.protection.outlook.com [40.93.86.5])
	(using TLSv1.3 with cipher AEAD-AES256-GCM-SHA384 (256/256 bits)
	 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by securemail.duagon.com (Postfix) with ESMTPS;
	Tue, 18 Nov 2025 09:29:51 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyCxCsTxAcAhkw4+HAGHZuryX2GbG8kWgMButx1FMaMfgFBmaJziU4TLnAe3tLsjFSHVwXXoz0ows3HDYcUP+0QxS4c2JsgxkkC/AtwIrXqqC8MsOcv/oBAoqEiV66M6rVB8XkC5ir8UkGL4vIsIohr4NJrKX45znVoMlZKkv7sO8TMbJfaRQwvD+gSBMEFGM21ovDOY3y70Zc4ybdLZIe+Iq2dwZdXHh4LbSZS34FlHWElk0CPp2055JoxwsnWmYRdtz6ItWxDN//Fak9rvr4HMi1sgkeB17HP5nDRjx+hJjC+H79prV9MBpP7Z7YgCmNqLp6BZ8ODCeoyiaMB6IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vS9wIL46bYkMUf1yAaOk/sMgz07JU9J6RJsW4OeurAA=;
 b=NcHuWcqLwotDKBdGzZRmIwSv3G0e0TW0Tm3IOQH6QLvyMAWQFC/kM1ruIZYLtTs1r189sF4HbqtuxkDLe/yCKQ80e2STovSD/PINX28NwX+B2oA1Cfaxi/AO1e9lIUgfSFHGtARUh2u69JxFUP2AN1eq0LAmu+7AqUvuZUunTRKxuj6lPL5yI7bUTemrTBB7vdNingIYVokuD6SBjN6JVhDrxLIq/WvE/67Q5fRr5KKIcgyVhBEJtnVh8NuxnPDveO+cu8GN5ovHzqv3jliiSDAm2DP2LMp4c89twQg1aIKA7nlesmtRbWAhUzrQ4D1AXREcOpF+qL/GghUUpCdQFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.79.222.204) smtp.rcpttodomain=linaro.org smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vS9wIL46bYkMUf1yAaOk/sMgz07JU9J6RJsW4OeurAA=;
 b=qQYKTCpa9+kRe9XP/fQSCdWv9ROLYfwb90j80jpnRy8vqToTltK9NRJdh3YHIu2+8K+Gjt3XecLuKpQhOTkJezmeHVluP8lckvXoUZTErK+hnz/GHX07KnD6/T+Bx3PJ9fpTLMWaJeIFFFABghDNYRTHHwPU5j58QGdMURV9gWc=
Received: from AM0PR02CA0157.eurprd02.prod.outlook.com (2603:10a6:20b:28d::24)
 by ZR0P278MB0789.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:42::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 08:31:37 +0000
Received: from AM2PEPF0001C70D.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::e3) by AM0PR02CA0157.outlook.office365.com
 (2603:10a6:20b:28d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 08:31:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.222.204)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.222.204 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.222.204; helo=de2-emailsignatures-cloud.codetwo.com; pr=C
Received: from de2-emailsignatures-cloud.codetwo.com (20.79.222.204) by
 AM2PEPF0001C70D.mail.protection.outlook.com (10.167.16.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 08:31:36 +0000
Received: from ZRZP278CU001.outbound.protection.outlook.com (40.93.85.27) by de2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 18 Nov 2025 08:31:33 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZR0P278MB1266.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:80::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.22; Tue, 18 Nov 2025 08:31:25 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e%7]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 08:31:25 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
CC: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [PATCH v3] gpio: menz127: add support for 16Z034 and 16Z037 GPIO controllers
Date: Tue, 18 Nov 2025 09:31:15 +0100
Message-ID: <20251118083115.9545-1-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MA2P292CA0015.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::12) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|ZR0P278MB1266:EE_|AM2PEPF0001C70D:EE_|ZR0P278MB0789:EE_|AM4PEPF00027A63:EE_|GV0P278MB1031:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ad47ec-3dfe-4971-e092-08de267ce64a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?CMOM/yQfgR19EswoJAVpa678jgZESr9b/H+sce2P3PhMlg/JiJKwqqhVxBcV?=
 =?us-ascii?Q?gsaDD5Z7PmIXFCZJtA/2TBvZWYB53QmlKMl8kGkxVJLl2jN4lzjuOYBGEGHT?=
 =?us-ascii?Q?90IYHgChf7/cazgMwjGNw7tKkMCNkzz/ZKAFFq5vnGd5hFkwVrzcIiXsL2rH?=
 =?us-ascii?Q?jHrwAN0KA1/XZFk2zA6F0sIvJsws1GZ/yfQVUoHq4aHdPES/xJ4x4BhfuzRn?=
 =?us-ascii?Q?j5wwPxgJashnh+s2zlU2azOtdcykFjjw+OzSsEr7/I62cFuE9Hb3Z5QzQfbW?=
 =?us-ascii?Q?f5rogiedjj/4CDN1cIM2y42eFBR2eGQ4y2F0fS/B0jhAu7Z9TPtFgukAmOZr?=
 =?us-ascii?Q?Bc1S1w46BUdoT60Yh4RD669V3A8dfXf5/TzIJJQmLUkET3njMYSKw84l98oT?=
 =?us-ascii?Q?IGQyzQ/AHJGmABTrGCUrWaouYI7S4/OuSnfCBvbQCZ53l+VaV/a/hz3gb+HI?=
 =?us-ascii?Q?gwag/PTIg5JiXiDq3MXzJJm3PKD/UwuJocKa1v7f+vkpECLNghojjyLp/15N?=
 =?us-ascii?Q?mc8PUqJmZ3PoJ4UAYIDlAH3mjcWriViBWq9qqMXMiS/BjxOcmG5QMI1trjyV?=
 =?us-ascii?Q?MTDLvJo/6Hs/vkuJ95FmRd4M4VOp/Str/ipkU8OHtTk+BMpsdw4tygUt/h78?=
 =?us-ascii?Q?RqsxQlF26bnAsA7wXwIZQQjSbR9BUewJ/rp28Krds2AnLqPXVVjNuu9ybkVt?=
 =?us-ascii?Q?GnZGEgumwp4Wy7C97+1qeELWA9/ajCxlUYaCSWKKhmXCVAIAz8xUWpK0IrtD?=
 =?us-ascii?Q?8jsGfGDy45XXMkm0iazNHeH5Oo1miSE0eTCD7N8OxegkHiY05POyTlVtljJF?=
 =?us-ascii?Q?OeW3E2BEvHbxamyFOVIoA26+Qy/qCW2nS4QT34DPTLVhlzD3mkIJqqlh3LeA?=
 =?us-ascii?Q?igu/NY8dk3at/y2YlNh1KJl0LHbAt0bN2NKlOAE2R2fGafNlCE5GV8XhVuq5?=
 =?us-ascii?Q?bywyJqIbXrESZAMIYBYYur+BQkPNNHZ2/VAbVIxkqFZjQgwEKrATIDBkpjiN?=
 =?us-ascii?Q?9u1cUx/2IhJKb6eBc8gVXiSp+EiVF/BakV4sa054y4bPfsIxBaq86b15DZbw?=
 =?us-ascii?Q?bQzT5UJNuqtAY/EXgGT8IEzNRGYkz0wGKOesXQF/G+QsHDudzGegrjT0jk0Z?=
 =?us-ascii?Q?+DFqNc0yrBU6yFRjfCXwbOGsxA0X+tNFgmPmxZPyemBljj/MjorGJTK/ubbO?=
 =?us-ascii?Q?ESbFrRd14uF46jx6j/6nzEswFTpiXqTj45gDaXoeOpRtu/jBjVNaPGBQT2M+?=
 =?us-ascii?Q?C+dQEk3WYJ0/TEp4YHefmc0sIAElzShhck2oC+EcVEFQECfAR/ywto+3VXt7?=
 =?us-ascii?Q?o1HWTrNZ4RFq/9N5T7yiqo73jRKwCmpyyu1w7Urqetvr4U/JyysYvRRvwt5W?=
 =?us-ascii?Q?moyw7wrXzaDLJ05b8Ybt3f9Rpxdsr+2q6u+MeozSM1K+fmmW+cwhMUw0zTC7?=
 =?us-ascii?Q?vzy/hNtVcPOZHnp6L64ByqfxlbG5S/Ce394x7L8ePc1GIr3PTJsnKsxKwVwk?=
 =?us-ascii?Q?Sj5W2ITPTBYQXcj8cOoAi9RYHARt6M34cZSW?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1266
X-CodeTwo-MessageID: 82f32a6a-8b89-46ad-bd76-4c2f59102bdc.20251118083133@de2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 1949ccb7-18b0-49ef-c53e-08de267cdc6e
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|14060799003|35042699022|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?pculSQK2x+lcbqYDyVFfR3iJeMlrfwGeY2kIEIi5bJrnW4njT0LR3Cox9xW8?=
 =?us-ascii?Q?g/U7+tpTqtSm1yJjLjAqjZPy7OABVGmE7SqwJxTt1GlUQwz5RzP+P1DANY3P?=
 =?us-ascii?Q?vVPOu8qfPbGbdE5Me0gRM14dYTDAKdORYruKp9m3k49KPF9nAGQo/NMpWCN4?=
 =?us-ascii?Q?zFENbEaJNfAq+3Xo3di4LrLLsFDwmD5evGT9NbexWfX46EK2zbUkZacGRv1p?=
 =?us-ascii?Q?nl5v/imHM9RwHT6X+qCgI1a5llfZE8HJllo613O2tdjq2852Mz4e7dOdBlN+?=
 =?us-ascii?Q?B5h5TnIjBlgL7g/VGKJWgKk6qqLEsGziIHpGNfD/AHY5lMZtloUmLGQXXVID?=
 =?us-ascii?Q?2cUbBjjyAgo4o32cW7zwH76mZ4rb2M9XxUhGmmDleQv+7HoY9W8z7Nmz/1GK?=
 =?us-ascii?Q?ZHBOAoB9zznzbYjrbO3bnEdDWtkN7uqv5PgZ4ziB8lecRGN0DsguLzm589lI?=
 =?us-ascii?Q?U8h7ot8N0x7vSQ2vW1VGPKh+OBptUJpOHr0q4gXQKQNEFFYGKZtB7Vbk4PiQ?=
 =?us-ascii?Q?9v6RDsjtO8aRmFM/KlH6VyVi/eITDbTZOujyYj1ghzTBIY0Vrkkg2NMt11Bl?=
 =?us-ascii?Q?FKQ0yxlhUN8VHtN4fsPle6csx0nzC7RbSSqwEWFoH3c/+tXtqESq+ZvegSTd?=
 =?us-ascii?Q?VtXfkU8xyXkkt3j2J1msZHaQW73OmJ1EoqJez+jtDXitI+/j08YMi75CWf3A?=
 =?us-ascii?Q?unSGGVSjXS/Uxw5AlZYGU852YWf3+0GDk/nM85dM1yK6Y35icJ8wLntI1uSG?=
 =?us-ascii?Q?s2SMBDFRz6pZOJLE08euYMZPzhVOZGG0odirjIUsQGY1rNfGCTP7i+8ckB49?=
 =?us-ascii?Q?9iAY5tblz4E/9y/afg4pGnC3u9olA0XXG9knln0TOoDM1NtmGJeYDPP4sePt?=
 =?us-ascii?Q?hhAEj21XRQt55UEg9ThpKXh6H57ARgvX5kCsnNMzLhuG/wYgZUkADWApynMS?=
 =?us-ascii?Q?pf/CETynjpyp/c605DUzGXNnrXnUVGR+qmGr5XGsWvACjqKyle6XlSxZKBTp?=
 =?us-ascii?Q?lGJtfz7Es9KcASCMqUE+HA15ApyF0QCN0+jaEz/FgczdYgyoVxhrW+wfzMgj?=
 =?us-ascii?Q?9BqqMBLfwOvNLp4TswVFkpBqBEJupIjBYWgh/ZDvODDlUKEvHI3xu1tnwEzl?=
 =?us-ascii?Q?PwrTNUEpRTO/bF76XSTjGHcq15DjgprgPelek6LHrMBCFvg19QIUJne54Ttc?=
 =?us-ascii?Q?yxPWlmAqXcV8fOE19wVfI3ZZ6h1EcQlni7UIHfPPnlw2F+bMEUZI8V9QL3st?=
 =?us-ascii?Q?ti9cn4ZI0QAHSQGUHZsSLgWnueOn7xEP5H84nL3lbsXD8SC+0h6kQzNoON0Q?=
 =?us-ascii?Q?Md5S6jrYVcJQpsNQpSlaA6Lhn9gfMV6EpE6rj6SqMbl7mnP5WNi9+ajX9mGw?=
 =?us-ascii?Q?QlI5BkOJLsr5XmFuABKB4Em1iRVLOQyP48DDaO8fCp1tyaKcouoTrwiedxRm?=
 =?us-ascii?Q?iMsoIDCY4Cd7ryHm7h8mC2ezW3/wJs92+RiPO2FxsSMkala5F3bDiU4jz3ew?=
 =?us-ascii?Q?EXT+BI6bCPZELHtiw08aroFDsrSwpl+h+w2rwa+ORI1AKiZlKf/XCTlh6bCp?=
 =?us-ascii?Q?UTD7AUfO8txrkejGjlw=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.222.204;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:de2-emailsignatures-cloud.codetwo.com;PTR:de2-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0789
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1a21f0df-02f5-4586-6064-08de267ce350
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uqT+OzhPA2y0cwUaOFIlnJ5sNQjMwJ84VUSr7VHHnKRGjXgD4IFgWfKXh0Cu?=
 =?us-ascii?Q?Ln8WDF0if695ETyCjMaafigSxjPvJ+YMFe+P/jJ+tZ9QfkSqO2rwcGCXcxdG?=
 =?us-ascii?Q?Aoc8K5ZdkUvyEoPkBOZFD2Y/VKvSaSdCQVbTMPMURtMOr2NBTzJ7jzHZOaGH?=
 =?us-ascii?Q?ESjhboBQwEsEFw239jD8ObCT9pVH9IpSYucjRfpzprh04WbTCxzzMpEtUI8g?=
 =?us-ascii?Q?4kIQUtiO29EYY7N7Ocq6c/uY4FnivA28Z7wBT+xXs2fiGaUCa9h9Ajhw1/rv?=
 =?us-ascii?Q?B0FHASlmWBNxLwwcOlEzyqJ/20v2uCDvY5Q7BT/x1qAGrADawRy6VuzVpnvL?=
 =?us-ascii?Q?tgVf8lil8k+0G+0+9ZFwOxvUbj5WDLcsqxvB+bkUom2KRvbFEz09OHc1uoNl?=
 =?us-ascii?Q?+n/LP/MDJnssgADNbD5XXIDhoXtfvx0+4+Qu7CZF69ZqfeZyB1hqoM1XsLy7?=
 =?us-ascii?Q?d4KbEDHpimtkA0pVw+NFpz+4vAw9kl7yAHf0YoXTUlc1sXPoRi0WWBFPQsSE?=
 =?us-ascii?Q?5cUnnSDadVZJ1a2adAUmk2JHy1NnTk0MFmiJMMkXVOaiNuSM/GZU2cvJCfSk?=
 =?us-ascii?Q?CQwac5sSIoTMbtYHLAwZcxEOy3+66iugvgI6aHHADxKqQitsLfrLMFIpBILm?=
 =?us-ascii?Q?qZ4ffba4hD+RBxL6ViD56xI1f47VEpfDFenofiOeijy8bUPDiWk9WODQmyLj?=
 =?us-ascii?Q?GGJl4f2NI5jDkg/7HsZOYBS67gu87NMyIZxabf6iSazNmFYxn24+GJ4jtrTr?=
 =?us-ascii?Q?vnDe4CU+cQuOzrcuef7b+I3ESnRsgbmfwAFwJLwCNtAfu4Z4xR/WT2gJ0pFb?=
 =?us-ascii?Q?hHP4opMzx+6a9aBIaRnJpS3sd4YS2a1k2N3FOQo0h4fEhpb4Be4JMLkLv2T7?=
 =?us-ascii?Q?DA/a08z1s8BPohmnlr8fX6fHnY3gvBFaC+R2+Hze2D1nprYHr8GPzCoNF36S?=
 =?us-ascii?Q?rH93v8YhEtCKFUsCGA99OCd7zzp1TuBKOOAc28cRuhtKO4Zdx7xq+FrLWtQA?=
 =?us-ascii?Q?mvQ3ACEIM+dBmbjbn/vGlGi7IJ6FcHiRqN2zB3IM/p7gZ6vssA+1koCFVupu?=
 =?us-ascii?Q?tRkrlMUJ68AxE9FQdWv5jCzQKOHF3VlKGfv2r7BMz8YgK0XLjGklKsZj4o3T?=
 =?us-ascii?Q?xS7GMzHlcpjjTB2tHRt/4ZWuHQi+VaQs1HwGn8RHvCfKi02LJdiVj3DrYGGA?=
 =?us-ascii?Q?NtTCr762PRNPRLwongNsTTCkO32kj3CYYP9c+9OBjLLjSgIeQ3v3rxeo6Tzq?=
 =?us-ascii?Q?86T6wHT+t1Dfa6/HlBvP2Q5MkW+SsiEtz8wRUKi5iIbusqsHWGvRndHIcxN/?=
 =?us-ascii?Q?JWsJ+R5Zw9j2H0gk1Jx1sVQfLOGYLyJogYCkJEILSYbhkALO603aQvWXnAgR?=
 =?us-ascii?Q?4vqzKvqdWH6068NxQDthRRsdWnmhGnK6tU2B2fHprd09nevj+KTheu9E2PXa?=
 =?us-ascii?Q?/tvefEBopikzqoANPgmykpLwT/yVX6k3ybFnv0XwEbY/yomxd7WvB4drgD3a?=
 =?us-ascii?Q?85ZOYa00K5U/VZlEh2DUweHP3iBBHLpUgS34O2J3JKcFYMDz27uO68ABH7hY?=
 =?us-ascii?Q?FVVBMAiuEzyyWL3wtW8=3D?=
X-Forefront-Antispam-Report:
	CIP:194.38.86.34;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:securemail.duagon.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 08:31:41.2294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ad47ec-3dfe-4971-e092-08de267ce64a
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[194.38.86.34];Helo=[securemail.duagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1031

The 16Z034 and 16Z037 are 8 bits GPIO controllers that share the
same registers and features of the 16Z127 GPIO controller.

Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@dua=
gon.com>
---
 drivers/gpio/gpio-menz127.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
index da2bf9381cc4..52b13c6ae496 100644
--- a/drivers/gpio/gpio-menz127.c
+++ b/drivers/gpio/gpio-menz127.c
@@ -24,6 +24,11 @@
 #define MEN_Z127_ODER	0x1C
 #define GPIO_TO_DBCNT_REG(gpio)	((gpio * 4) + 0x80)
=20
+/* MEN Z127 supported model ids*/
+#define MEN_Z127_ID	0x7f
+#define MEN_Z034_ID	0x22
+#define MEN_Z037_ID	0x25
+
 #define MEN_Z127_DB_MIN_US	50
 /* 16 bit compare register. Each bit represents 50us */
 #define MEN_Z127_DB_MAX_US	(0xffff * MEN_Z127_DB_MIN_US)
@@ -140,6 +145,7 @@ static int men_z127_probe(struct mcb_device *mdev,
 	struct men_z127_gpio *men_z127_gpio;
 	struct device *dev =3D &mdev->dev;
 	int ret;
+	unsigned long sz;
=20
 	men_z127_gpio =3D devm_kzalloc(dev, sizeof(struct men_z127_gpio),
 				     GFP_KERNEL);
@@ -163,9 +169,21 @@ static int men_z127_probe(struct mcb_device *mdev,
=20
 	mcb_set_drvdata(mdev, men_z127_gpio);
=20
+	switch (mdev->id) {
+	case MEN_Z127_ID:
+		sz =3D 4;
+		break;
+	case MEN_Z034_ID:
+	case MEN_Z037_ID:
+		sz =3D 1;
+		break;
+	default:
+		return dev_err_probe(&mdev->dev, -EINVAL, "no size found for id %d", mde=
v->id);
+	}
+
 	config =3D (struct gpio_generic_chip_config) {
 		.dev =3D &mdev->dev,
-		.sz =3D 4,
+		.sz =3D sz,
 		.dat =3D men_z127_gpio->reg_base + MEN_Z127_PSR,
 		.set =3D men_z127_gpio->reg_base + MEN_Z127_CTRL,
 		.dirout =3D men_z127_gpio->reg_base + MEN_Z127_GPIODR,
@@ -186,7 +204,9 @@ static int men_z127_probe(struct mcb_device *mdev,
 }
=20
 static const struct mcb_device_id men_z127_ids[] =3D {
-	{ .device =3D 0x7f },
+	{ .device =3D MEN_Z127_ID },
+	{ .device =3D MEN_Z034_ID },
+	{ .device =3D MEN_Z037_ID },
 	{ }
 };
 MODULE_DEVICE_TABLE(mcb, men_z127_ids);
@@ -201,7 +221,7 @@ static struct mcb_driver men_z127_driver =3D {
 module_mcb_driver(men_z127_driver);
=20
 MODULE_AUTHOR("Andreas Werner <andreas.werner@men.de>");
-MODULE_DESCRIPTION("MEN 16z127 GPIO Controller");
+MODULE_DESCRIPTION("MEN GPIO Controller");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("mcb:16z127");
 MODULE_IMPORT_NS("MCB");
--=20
2.51.1


