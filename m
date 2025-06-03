Return-Path: <linux-gpio+bounces-20920-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1A9ACC34E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Jun 2025 11:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 797D916C281
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Jun 2025 09:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D382820BD;
	Tue,  3 Jun 2025 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="cQbuwTpm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013031.outbound.protection.outlook.com [52.101.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5A028150E;
	Tue,  3 Jun 2025 09:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943670; cv=fail; b=sceO/qTqWcYO8R1AJNdPs9UMPXXY5p5X1eb4DhFW6xCZp9wAlTHSMNOpJamuOuC4Rz/DQ7xiqiPeZIKJ0dKLrVTWtmqlZFamsaK9iJALIiy6d4DU89G4kzBnoGUJAtNnQIfo9XNg1yhHTlPNWk++mxICrU81xgQg15YMeDajTaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943670; c=relaxed/simple;
	bh=WLSV4Oj/YwLEG+4Dxk8zEJnspsIeFRcH09VpQ3+mcSc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rs+ln+azy/3ZoKTZ3x1zB07QMmwuBWDoDnnVpcEDgs7Yx/fcL0MEU/LsYcm6aO6jxzmQZvMUBDIo6hqOQiLS1EWk/m4BxTjVQrU99R0itakLdI0/YpMUpHGYfMEK+naLDE1l+2oorDNdkExo4xBZVDaSInd3LbOoD4yKBRIWwOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=cQbuwTpm; arc=fail smtp.client-ip=52.101.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNoSY5yRtfDl8CpT8qVsGCx0Z8QRS7q6/T/e6bCGsxmBB1P9Sc5nv2hKk5lcXYh8mgRaHAwepXdBsq6LFjKfTByV16p63t1Fb+lQCnNkxl9sql5n/PWkDxul78u8bV6MwWE47v0PITwxOdj1GHRhevoE28xMI9V4JlluNvPidIWtNeN8gv8imJFqamyJ6NfSk1IE2ICmw1WbUvzrcjrbkT87fmNutgrIY50tNLaEf+2Fz8zGsPmYE6PgiHB4EmcfUfX/wLQEXlupUeUSYBd3FQtxRQwzbqts2Uv99ertCPmha0PtXk2hgTLiRkoeNyafn7kvCNvJLrI2ocSnOelk0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6m543ia5fr8oJocIBbCjFksGHXNBZLjfQLcdlYZZBw=;
 b=Um4dWEvy1XnqSvBae6mmdAJeHNzIAnNS/5j4qeBwZLSdy2kJHSYWuu2l3ymdp0Ba6sNOcZTLbeuLdFLswGEmXEKTBtY0O11YTHXVUfB4FOwQpA7Sj3SNYAKDLOOFR/NEuQHdt3ODCkc24aZmsmweSwT5HH0tNdjuTKbFHygG6e1bg5fnmIgZ9CmIrA5b5SmP3gbrR3yszMYhW41ggtI9Mrv+fVrivx5txL6RPSoyWCvxfl/sQ0vzuFymbBHhQNyMwLWGnE8F+zSq3NcX8J6IzDd3BOL7VDnPCegHIXVAEqQMvT2Fnoq+BTvQNi2aHu7Jwtzs1XzkDUDMPN2h0cSOiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=amd.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6m543ia5fr8oJocIBbCjFksGHXNBZLjfQLcdlYZZBw=;
 b=cQbuwTpm9QWtwgvur8WTcs1U/yyW1zreOuuohmt6HFCFMLVbn9QDAzPJe4mWammjNn41XV7ksMJriC+uxFsAEK0fG34EHa29vpnxHC7nT74gw32rFIX6eD7sgdRn0FV1Z4TXco/LejJ1vN+6ybGjqDQ7IKw4CHV6d7ET6UT20cg=
Received: from DUZPR01CA0259.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::7) by GV1PR02MB8514.eurprd02.prod.outlook.com
 (2603:10a6:150:9a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.23; Tue, 3 Jun
 2025 09:41:01 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::d9) by DUZPR01CA0259.outlook.office365.com
 (2603:10a6:10:4b9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Tue,
 3 Jun 2025 09:40:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 09:41:00 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 3 Jun
 2025 11:40:59 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 3 Jun
 2025 11:40:59 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 3 Jun 2025 11:40:59 +0200
Received: from pc36611-1939.se.axis.com (pc36611-1939.se.axis.com [10.88.125.175])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 17C26F86;
	Tue,  3 Jun 2025 11:40:59 +0200 (CEST)
Received: by pc36611-1939.se.axis.com (Postfix, from userid 363)
	id 13AE262A92; Tue,  3 Jun 2025 11:40:59 +0200 (CEST)
Date: Tue, 3 Jun 2025 11:40:59 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, "Broadcom internal
 kernel review list" <bcm-kernel-feedback-list@broadcom.com>, Ray Jui
	<rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, David Rhodes
	<david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, Jesper Nilsson
	<jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>, Damien Le Moal
	<dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Michal Simek
	<michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, "Jianlong
 Huang" <jianlong.huang@starfivetech.com>, Hal Feng
	<hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@axis.com>,
	<linux-riscv@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH 16/17] pinctrl: Constify static 'pinctrl_desc'
Message-ID: <aD7DK5V7WV5YOfX2@axis.com>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-16-76fe97899945@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250528-pinctrl-const-desc-v1-16-76fe97899945@linaro.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|GV1PR02MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: 2428eb23-537a-4ff3-456d-08dda282c026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nnYMCJxzoDCQcS6nCpvjhaZmrnjP64M0FLb9LGa6l8VXtWEfUAelIF7sch0V?=
 =?us-ascii?Q?ZljCL2dH6Fwx9pWx6Z3wnuMYNuMdP1TlppVaBqqf7Is/41DySTXszX6AKHZ6?=
 =?us-ascii?Q?ubU0JWs4nxClsUj8DtmI6c3+hmvaNkY1WXZfTJaBSTOAIESUj6NBWQSiQKP5?=
 =?us-ascii?Q?jwbbHklkxE7vNKBuFmYi/XW6izqvIvs4j9S313Bu0+BD+iBbm6XW6lFqeALP?=
 =?us-ascii?Q?xPyQqNeoF4+oS9zZwgPF7KV+ahVMVul0kHH+1QmvXHYXBLfFnPxlGQ8dootF?=
 =?us-ascii?Q?VQMx7Xu0xkUPRBnf9IUwECb6e4rhXM6Ru8nBVqFgx4sXiARvBkHKJD6EBKuE?=
 =?us-ascii?Q?mu4q0j0n6extG5ohXi6bu8WkgFls2r03lqgThEbHMN58FrWz0G0mG/bJxBhO?=
 =?us-ascii?Q?Y63hLXdKSZynXvu1eFoGjF9dsdy6epYhcXN2EevK3KSkY7kn2FvOl+0pMyP+?=
 =?us-ascii?Q?IJphA69w3x0GiSChmMfzWCCPxqqPQKY4bizYfqjQgVR0sNxpO3WIPUwWnVbz?=
 =?us-ascii?Q?dEYge8fLpjoe4/C+DQm+GzbIa5KWvk6aMSdQ0Sz2389mWqLljesi7HAJx1ce?=
 =?us-ascii?Q?xSViNzMuodIb9bLDfolfLlek20MflM02Fam2yFkY38qvi+eM1l+xvDvF9NOu?=
 =?us-ascii?Q?kAYQXbxeiiuJs1bfFUmv4XUDWbQJ2edyfgw/28za+2ONxC99fDAWcDID91iD?=
 =?us-ascii?Q?bgdAjX1DwEYoxZM1fPC725KrdxrnZ9oNyFYddu1Z+0beVjurQBOdXCFCw28m?=
 =?us-ascii?Q?B5H36TMELodh6+DAcNt4PHaeMuX769uVxJCFAdgWX4j+fe/DH23GRQKl5M/8?=
 =?us-ascii?Q?PmcGT+DS3+IneNXP5ym9m02QKU9iO4MoEOToKw0YpwfLKFekEHsDV9MRv2JB?=
 =?us-ascii?Q?0T5C3kMH4uo421aqn44uhBUFyozzcYElZC9KigFrP3W+QT2EhdCjtDV6La/n?=
 =?us-ascii?Q?qjlbCnEpe6TYROMyCU4tiUA5vZioZAsJb277tM12AooMqtrx356HxauHcdp7?=
 =?us-ascii?Q?8nQXIPDsotnr/j2TfKy8HVncvghlUC2imZ9tUXesdIVmyMsUBhfKZJYoqKKQ?=
 =?us-ascii?Q?sPfldn+9LartxNqPZj2gUUBLYqYB1GimurkZHTmL+8Y4tWT4QyGH7IkMEajs?=
 =?us-ascii?Q?6pt56NKm58cXuVGR4jKCJPGrvsxfyufSJEEG94lL+QjKwOh9kzkT/1WCatHa?=
 =?us-ascii?Q?lHUglkqjJWtSVE4EWeKghjpXY0SPE33LNhDeGsPhoBoBZRwQgqpPYVR+5LvE?=
 =?us-ascii?Q?7Km/3miVXFI0tvHnE7qO24+A9gR+L5cZaIaj7o//mvemWICRYHRxYFuilC/a?=
 =?us-ascii?Q?QBEeGCztj4pbiKcFWP2TOa4qrcLdGpgprFZdwZVjmc4RrKb+6XxXzJKokhCr?=
 =?us-ascii?Q?8kbpbwQvTGKbCznmsQ0kytXCheXr4f164MEKW/2BZ4ya89kXrqURU7hoVY4p?=
 =?us-ascii?Q?DEJk/fd0prvVAGPR7eAzUFCnL25HQStkqUht4PlNPqt+uRTWDILXetPWygl0?=
 =?us-ascii?Q?6u+pbgOxRfrT2lstBKblz/qOs4tfeOprl1Mw?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 09:41:00.9134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2428eb23-537a-4ff3-456d-08dda282c026
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8514

On Wed, May 28, 2025 at 12:41:12PM +0200, Krzysztof Kozlowski wrote
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

For artpec6:

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com

