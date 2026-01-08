Return-Path: <linux-gpio+bounces-30276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F01D03EC0
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 16:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAD6E30F639C
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 15:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46229426EB1;
	Thu,  8 Jan 2026 13:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="xDxDZdsr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11021131.outbound.protection.outlook.com [40.107.167.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95C638170A;
	Thu,  8 Jan 2026 13:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.167.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880166; cv=fail; b=n63fMLUiN7EwNDge6GuPesJ4ex/8WPbBn9PHTeavVFeqtcebxThFe6HL/S5yNqtAwUIWlkxz6I7lLOGJcsW7APs8WVXU6Wn22Jl3kiQojNXwrItBt/bFx+DeLTsbGkK25t/GthVZcMlVE+/Dvm0yzVgIiJvyDyCQrxvBXNnXHUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880166; c=relaxed/simple;
	bh=p6p22OPtB9fENSuUkal3cxC3qMzd8cH+0PoJ/orZXlA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d4wfR1YPoMGe0wz+tJPhF2WnWXR9s/rwVgP0qLpe6xzP+CFkkIgCo7S932ZusZIBsJ2hl9xkeDydhjrZTekGVWLNdsoNgqVynAV4GpuE++j9wOXsxSvGhho3iOPnVAqIJ8UuT3qMIKsVkvAPIWAT8SE50c1yJkPRA27M+sUjhyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=xDxDZdsr; arc=fail smtp.client-ip=40.107.167.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSpycGOg0L+BWPhkPJtSRKPk5XVQ7rNb2WzTytZ/+DHCPEe+AwdWFzllvGG29kJexGmNmfXzkzFP8ADEJKGluAqLfcmg6en9JObYB0J9I30CY5k8IBt01hge0BRkrHhq1APZMXqm5668l3PDUrTRblcoO8r5sr7xjaPzzK6kOXVkpa0hgsPffGXdGlpsLt43wrs80fI9hn9uKKx6cytsOT7BbUuHFIls1Ca73UZcexKXHU7ta1wyRCQB0sZCMwVRWEG5vig0WQvVCoYtsWBZo+O6MmQKh3qjXynI692j8XpTiDESct2nDEnCU8evPK4lxutfPprCNfmwc7UVUQsR5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6p22OPtB9fENSuUkal3cxC3qMzd8cH+0PoJ/orZXlA=;
 b=lMO+gtvVqHdAwHSV8005fcaf5Z8/f/ANYzZcd+x7FRu541pnjsHZtA3U+UBIRqTYf97J2se7/9cIFonUNkPnfW+QbO9r7WqwmnHB4dnUYBWFhsUF9VkR7xqh4jsPhkPOA/F/JG8WrhZHZhvGvrQUWf+mW5uMdo0MJZNeGJILxQ9EWTqu1f+EJSAgoL2I7oJBVEQwjPSFQ6mT/2JoYKqI3v3/KrgxU/kWR/0KqpgiiqnUID6cLrRkVhjd3hTATNhcO/IU5cLpTqmviB1ObVQ9gW7CwpgCP8oQ6E+a3h7z/G0nh/koP5JxY/HEJX04EB6Ji4TL6ei898MqK5584wIYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.86.7) smtp.rcpttodomain=intel.com smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6p22OPtB9fENSuUkal3cxC3qMzd8cH+0PoJ/orZXlA=;
 b=xDxDZdsrOXkg4wfQEBgrj1pe6h9oLuL0mL9NuWyw8Q+Jk9792NmK6vC3Mr5zXpugztgbsA2y33/9JMK7Dax/VZZ2x6OoActZM22ty8Te1/fqpiDA6NELsi/A5LcjX/4xQ3DYhob2j2e+di9z7Zt5Djdbw0nIHy+CKpTaycIcyLo=
Received: from DU6P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::21)
 by GVAP278MB0103.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:21::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 13:49:17 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::da) by DU6P191CA0004.outlook.office365.com
 (2603:10a6:10:540::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 13:49:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.86.7)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.86.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.86.7; helo=GVAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver01.de.seppmail.cloud (2a01:4f8:a0:900b::219) by
 DB5PEPF00014B98.mail.protection.outlook.com (2603:10a6:18:3::285) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 13:49:15 +0000
Received: from hz-glue05.de.seppmail.cloud (unknown [10.11.0.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4dn5qH3FgBz4ww6;
	Thu,  8 Jan 2026 14:49:15 +0100 (CET)
Received: from hz-glue05.de.seppmail.cloud (unknown [172.18.0.4])
	by hz-glue05.de.seppmail.cloud (Postfix) with SMTP id 4dn5qH2zqxz1yNh;
	Thu,  8 Jan 2026 14:49:15 +0100 (CET)
X-SEPP-Suspect: 06d527dee85a4dc2b29b176b4e8fea87
Received: from hz-scan01.de.seppmail.cloud (unknown [10.11.0.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue01.de.seppmail.cloud (Postfix) with ESMTPS id 4dn5qH2VcSz20Kd;
	Thu,  8 Jan 2026 14:49:15 +0100 (CET)
Received: from hz-scan01 (localhost [127.0.0.1])
	by hz-scan01.de.seppmail.cloud (Postfix) with SMTP id 4dn5qH1vGWz4HkP;
	Thu, 08 Jan 2026 14:49:15 +0100 (CET)
Received: from hz-m365gate01.de.seppmail.cloud (unknown [10.11.0.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan01.de.seppmail.cloud (Postfix) with ESMTPS;
	Thu, 08 Jan 2026 14:49:13 +0100 (CET)
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010007.outbound.protection.outlook.com [40.93.86.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate01.de.seppmail.cloud (Postfix) with ESMTPS id 4dn5qC22bDz2x0h;
	Thu,  8 Jan 2026 14:49:11 +0100 (CET)
Received: from DUZPR01CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::13) by ZR0P278MB0154.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:32::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 13:49:09 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::74) by DUZPR01CA0006.outlook.office365.com
 (2603:10a6:10:3c3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 13:49:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.222.204)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.222.204 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.222.204; helo=de2-emailsignatures-cloud.codetwo.com; pr=C
Received: from de2-emailsignatures-cloud.codetwo.com (20.79.222.204) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 13:49:08 +0000
Received: from GVAP278CU002.outbound.protection.outlook.com (40.93.86.7) by de2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 08 Jan 2026 13:49:07 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZR2P278MB1002.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:60::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Thu, 8 Jan 2026 13:49:04 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 13:49:04 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: linusw@kernel.org,
	brgl@kernel.org
CC: andriy.shevchenko@intel.com,
	dev-jorge.sanjuangarcia@duagon.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [PATCH v2 1/1] gpio: gpio-menz127: drop unneeded MODULE_ALIAS
Date: Thu, 8 Jan 2026 14:48:43 +0100
Message-ID: <20260108134843.25903-2-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108134843.25903-1-dev-josejavier.rodriguez@duagon.com>
References: <20260108134843.25903-1-dev-josejavier.rodriguez@duagon.com>
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
	ZR0P278MB0523:EE_|ZR2P278MB1002:EE_|DB5PEPF00014B8E:EE_|ZR0P278MB0154:EE_|DB5PEPF00014B98:EE_|GVAP278MB0103:EE_
X-MS-Office365-Filtering-Correlation-Id: b13e7a82-1445-4d1e-25e1-08de4ebcb6bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Dysw0GlCR665V1Yp3VhQ5XB6q9sJlm4XnsWoDOxQmG4uafXs8AN+uQ+vK7cz?=
 =?us-ascii?Q?8MuMZbVlrP+wJldpjT/k7HMRBlG1PWLf0y3jRwa94L684ESVojyJ1aA5DjMp?=
 =?us-ascii?Q?abbkZX01PnqLMmizLSAZ9ErqLVP5xbX/9CZVp2XKG2qWHQ2wuncb2rk/srGw?=
 =?us-ascii?Q?1IGbYEEpjsdPSqFDT65Je7ZqRkCeEBZ+a2AHpqUlskA/bfm5Pu/Wwj8LKZsc?=
 =?us-ascii?Q?wA4P6pDdbK86S2wSrmECz2oPe88A/tvxUFgA7bj38a/vpveJu6fjqorHv7Zt?=
 =?us-ascii?Q?hV9hAKb7ohlcuXtrpiuu58M3pow2Zh5SxszjsGk3xxS5mL9Z8Vc3srrU9oFE?=
 =?us-ascii?Q?MiAj54QdHizxUdpsDtAFUqbgmpk+vnaF+8IiOQC3r5guY3IZfg3hXq0/a0EC?=
 =?us-ascii?Q?YHjxQbSfkfoCBvnJ2x2o7O4aNOfIZLnmXAaPFPIF5a7NhDM4/O9LJTBBoLMF?=
 =?us-ascii?Q?MVwK2WdQqyFY7dSb00xUjiMXohjbyuqBSDB+w18o2D0aV9D5PjRA7LKtUjoB?=
 =?us-ascii?Q?1kj9T4IueyPuDLJeUPXtKhPRWHwh4WKIaShuENZZS1DZ5TCVC8wuzu3sq1he?=
 =?us-ascii?Q?Pwr6eLDCUjsbPZBbS1gLB3rSjomm0ek7ww+0Z5/fLET4uUXSKFLBqEef/xKT?=
 =?us-ascii?Q?DY1RNSSneGcF660rJ4J7Iwxj95Jev3jxiiv9WZcY1nfA+JyRfcc4s5nTO3oq?=
 =?us-ascii?Q?6IwBWH1orwr1pn9pBI4dK3+Ma8OvJs4Y0lXnFunz/1WkW6hmUQFqzevyi+xf?=
 =?us-ascii?Q?PCwTKmPYJho3w/mlPy3INEMzXWOFHS0DS6/qLRppt8tYzi3gTvSoj6eG41dA?=
 =?us-ascii?Q?KoJ3tIgZGHmATntKT4eJBITj3tkW7W+wx+x10+5bs0VljZ2BOgyVHapCT+VV?=
 =?us-ascii?Q?2Rq12pFoe8+NQRISCucFu17hiQXVsVmiaRn37b29UFI6r5rJMwu7hoIOoPbP?=
 =?us-ascii?Q?e9p596NCPc1Jgzm3GZnoLT0nHEZYEuUa4fXrpsviwSggpipmdsZRNTkDb77c?=
 =?us-ascii?Q?1oa9e/2jJMIevC4R0m5GuPer/ydVNjB91mo5WGgKo848gZKIkVfYlnX9RGnv?=
 =?us-ascii?Q?aNe4KFUKItAkW+6+eUHxE7yxXCg/lDXhLF4TAdPTl0iLrPiLgLikGFFNcnew?=
 =?us-ascii?Q?tnou0WiPQkXubDCSDtPwHFPRqd6fPoHoKovn38KHcxApr1HOvlShcv3OWoFV?=
 =?us-ascii?Q?ZoG9gSuU1BMfqpyssjEnnDl5BIKY4cLaxj038lJTMGZgg2aho3t35M3Xruaz?=
 =?us-ascii?Q?NNDqV8C6fm0lK2cM+mymipZOxgSkBwkilf4ifVePYPIRrBA5/8Vjn+D57eFb?=
 =?us-ascii?Q?cSAc4AD1C04+5c3jjjARhJZPT8zJbfFF5dv/TFXGDgIPM0vXEXIv7OMZksMO?=
 =?us-ascii?Q?HVDm1XvUszM5vN4DBcDpvSf5HT5/vh+7VR/1OcSVVj419qucMUiP62j5TXJI?=
 =?us-ascii?Q?HcQvWoJTEmcIIL7xYQ/fWkv9DqXs1g+lNFXijw7h9j2/adkFdqlavAwVuIN1?=
 =?us-ascii?Q?rK/hv83zm1iV8zvx8jVMbHPjgYqXhRYQZNh/?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR2P278MB1002
X-CodeTwo-MessageID: f1d9ab8b-058f-47c7-98c9-a790a6368597.20260108134907@de2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 42a86b43-3076-4532-16d4-08de4ebcafac
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?NLlKSPtm8VMzaZ0igdo6mOvZuWM5N40+qCxmc53Klin6e1DHrKuaNk+667UX?=
 =?us-ascii?Q?VS9DGQtEm4wkp/AOmJ3G7KKqPlR/caarXz+AQHXszS/LWVAmDOeik3V8HtkT?=
 =?us-ascii?Q?ppiuXUCRCgqTb+AXXpK1VdNMmP3Y9k6Hmfr+VlieCLgLLohWkWgUf2I+9wfB?=
 =?us-ascii?Q?r81xACGTB0oOaEN4bjgsT/ajb2PAkfLp9gc2OukeBTzyvCKwule8zucr/tjN?=
 =?us-ascii?Q?oAYOKcUXMTRWF123KjLoI6z+BJzGQfRGTcAFzgbiAEiefOtt0sVfar/K0Mpi?=
 =?us-ascii?Q?IfRDl7UOZn1NL8EfbFy0ckLh6uUIMvaA4fn71AClOVCDaBL/+xuH/zK2/JOf?=
 =?us-ascii?Q?WGrLMQ+eFlG0FS9u1JPX9VWm/XGkAo7tSjF+Zt1RqC6v6B1azlXKxg4Gwzct?=
 =?us-ascii?Q?RgGTIBYsupa26Pcw+6S7eu6nQJqi3qxlrSyOZNwn5DOPiKNz4Rl5WaWjC0Yh?=
 =?us-ascii?Q?y4LDaNV2fWPKxYjHQMzhjvAuQafbndXlMc4funG8JE7nTMDJ4ggm1fxF6v/N?=
 =?us-ascii?Q?lHzBaR41k244yqRbZbbhridbVkB4eBf2z/27ATMHVIr1N5WZnPbuqpZgpVD2?=
 =?us-ascii?Q?pj1b+kW4DLz/QMVT+9ZGJ45LRU3aR8GXyufihrgoVwGrt2a+WFUW4EeK9Aim?=
 =?us-ascii?Q?c7/ruKBzY1tMHCmML6XMlaWftHsOxBiqgONwO46q+h/U6lC4x8aKKuhPK2Az?=
 =?us-ascii?Q?laKCP+YoWWefgd7QLTi16o9nbb7WvM3LgsGfZMq73aQWXbYNkOQpFdTl8J1S?=
 =?us-ascii?Q?oXRgT43rvSC8N3VNcT9LFarF28J/FkMBXL2VTXPP1orTDjzyG5W8Oxazd+Wv?=
 =?us-ascii?Q?0ayaGSuDt3RPgsM7mTa6o8Nam5/F1C4pvdMHpNaD41/2FR5AnigtG/wkqW7K?=
 =?us-ascii?Q?ZR+YDpe5avxyH2q6XWVWC4vm0TMX0tFoNjuxVeYdDQ7q/2r4mO9Oz1CisUiU?=
 =?us-ascii?Q?dX12tkJp51iU/mEHK10g813wrIbB83e01dGOToy4RiuATzNQ+rZQN3vjM2q3?=
 =?us-ascii?Q?71Hgj6wJvCjiFzxIIkZ1Tkey1Ss8dZO2WEJmxf/1LAZB5KgCtrGyeVS3qIjd?=
 =?us-ascii?Q?9GxrQKdkj3Acyhn/4f9MmkFE1BR3dUqbgkKFLGnUKuEl+DVdK9twDuhayHaN?=
 =?us-ascii?Q?g+bxG/WxNXRa7braW8JI9j2vHyIeTeuD10AeM8L99ZYmbyMehDL60surANp3?=
 =?us-ascii?Q?X+dqhrl2TQkU+0ZZ/jpGYdJ0aM/Xgfb5ubtzSPfJwuZ62ZIR/KIbWtR/7Dde?=
 =?us-ascii?Q?kuYoaharIErgjurq/+aMaZpayUayxa4DUezAHxyRIG8/wM2wVHpAQC8vtBUD?=
 =?us-ascii?Q?MyziB6biIPDPixOaI0ie4N/our3I0ogNBryvJQhOyTTxDTM8GWSPkgbpTfDQ?=
 =?us-ascii?Q?JyTPl1IvC6qpPi6GO8sWhRzcCYIYgk/iZfNgq3suxt7wsqhdxPcOnUnY3wfR?=
 =?us-ascii?Q?MwpKQzoItY3q/hSmY5/RAdg8SeZiVywG44JLI0G1o2hZn//B612eIrrCGNs9?=
 =?us-ascii?Q?EydSpjaBmn6kCQ86PO0zqc3soyHNIbgtborc/Kk8sU+QY8606PMgcmfQSd3Z?=
 =?us-ascii?Q?Tq4AkF9CQFF6+AarueM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.222.204;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:de2-emailsignatures-cloud.codetwo.com;PTR:de2-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(35042699022)(14060799003);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0154
X-SEPP-CCCVersion: 2025-12-11T08:12:51+01:00 9ed91da2
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.86.7];domain=GVAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.86.7];domain=GVAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b25370d3-1cd5-48b2-d5d7-08de4ebcb222
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|10070799003|35042699022|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vE65uRZH61PK+LY2PLefJemxp64ReULvJX2KFsuzV2TLW0se3sXNtf1IqtT3?=
 =?us-ascii?Q?xg1BotgCph480387EfInoB2D3GA+Q8Xekr1AmsJhbF0GsAvRGuFd9Od0h+Ro?=
 =?us-ascii?Q?MQtFRwtVsTkhGKxt3LGmGH5Q/yx7/f6UnPLn9U5tiQHzKtFVYlIUq/WFunw4?=
 =?us-ascii?Q?yWX5df+lAafYrEt+bbNTiHY0StOJ29KbX8VCkTRFNGyC/au0cf6GIAPyxsG0?=
 =?us-ascii?Q?6v4Yf69614Nkcrt3iInMFx+nGcgNLGuW9qcgoetmjBMkwHQH1TvQKhTxoDr6?=
 =?us-ascii?Q?XljJgdl8TNMmpPWgSdqB4Ljvb6/qBY3NVtnN09N4ty+HgPYPAqtSaMWrCp8F?=
 =?us-ascii?Q?ZVmkwkPdNksw42ewR3z3JQgCBASC9+0xPqKzM8ewfGZHg9Z+d6yWuNtt/6Sw?=
 =?us-ascii?Q?GrD6t1mWMK/Q31mZ9zV4LUMWu2OtyOYdAJoDyKBUMekthXUFtO0SuheTp4qO?=
 =?us-ascii?Q?ixVZC54IKInQBFyaRnM4TwnMnJOQIn7MsjQxVwUPbtPskbwB5ALyG+ERV0XG?=
 =?us-ascii?Q?An+q40YPcfdjOLrrA16PIEMhiFF6u0SzMcw7BE7wY54VZ0sx9YL3EE5+f2vK?=
 =?us-ascii?Q?cr0tqMCVlVVVR474pi4gWoZeVe3xdx0iFx/cW8Pg1p0S/i79wdrrzwxHPFfC?=
 =?us-ascii?Q?wIWwCgCrM+pwJbl///lYKhtthBSN6H0ehYtZvIrmkskZRFYArRSvHAgDngTI?=
 =?us-ascii?Q?umbZm101Bct939QMswP2MTvCvMixZQ4djWGEtETeMh/0RdSL2PKqRxVALO65?=
 =?us-ascii?Q?gkZgE8KO3+cOmgyB2zznCknPLRsrhv9yhtcwb+2PmNG4gbMx+0YTC68udXPF?=
 =?us-ascii?Q?GCToe3Qdjq+c2stPls2YvhVveUE/O0JwcHUxDFBtdkIUoo2ZajwZ+NSuyOFE?=
 =?us-ascii?Q?El2Q9lGzA1BKZzBl+FFVz8oeohnnK/8LX6jHY2WLOQQijFiu1HkBHb1jejNh?=
 =?us-ascii?Q?sKfEGFbN6Yqjwuv+oWYb6X8X86fDNUogQxi0H424JvDfjmDgg9iG3Z5u+Gco?=
 =?us-ascii?Q?B77LT5e78hmu/Xps0GfqIjhji9h5E1D8SrTlqkShAAk34wrshodY/TcaU9I3?=
 =?us-ascii?Q?m7iih257Ja4PuqmO6xReSxnHVTkl57F+J3NH45kDbpwXtUDerQDuvXTlz0ck?=
 =?us-ascii?Q?YQpmFoETlwEG2D1nNSMjLwYrt1gdOeJh2g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:a0:900b::219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandwestazlp17010007.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700013)(10070799003)(35042699022)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 13:49:15.7766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b13e7a82-1445-4d1e-25e1-08de4ebcb6bc
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:a0:900b::219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0103

Since commit 1f4ea4838b13 ("mcb: Add missing modpost build support")
the MODULE_ALIAS() is redundant as the module alias is now
automatically generated from the MODULE_DEVICE_TABLE().

Remove the explicit alias.

No functional change intended.

Reviewed-by: Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
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

