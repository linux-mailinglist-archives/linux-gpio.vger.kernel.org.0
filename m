Return-Path: <linux-gpio+bounces-27912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C8AC26896
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 19:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 494CB345722
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 18:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9BF350A11;
	Fri, 31 Oct 2025 18:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="q6D6r1gQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012037.outbound.protection.outlook.com [40.93.195.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230A633F8CA;
	Fri, 31 Oct 2025 18:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761934443; cv=fail; b=GwoRqUdvNxPr0eDZmz7fKY601UVK3D7G2TPdIPoRIHKoC7BceNJkENQ0+LXpwf8U/ZRLu/Dd2znSs65wal76ejAjOtxw9yKJNroHyEafAuzqbPzxdxUYxnpFRzSFwKY2KHHRKmPI5KoStWMdb0n6jkiTHoDKyq4TMpbIA3cNRrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761934443; c=relaxed/simple;
	bh=Ud5Hh3gs2e7TXEKy+b5KH3iK9XV1LHWPpxnIz2e57Dc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXDeMQ4QPb0+dEW+Bq0BUPRpq7ZuhdLd/0QiP64xt6rlsajpSgVe3oa2p6VJ0sWZ2TxYPEY3TgNtXAVyUBlNhmBk2PNUtURUIzySErpzlJLilg7PHda8IjmuaFBowJ6jhOpG6BkO7KVPWLHmf5Upehsb8q5TsCKBXAck6jO8JbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=q6D6r1gQ; arc=fail smtp.client-ip=40.93.195.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OsiV44ziIeuVABZ2FDbB4gPEU0BMS0lzaJ0r3uvhnP/ZeDp8DxVWno7DI7NZl+K5gd6ay4iwaHxKzFVI3HGfK/CdE9BwWe1OgcwGq92zP9Nod7qef6ISAvnx5pvt2FkqLhsl5Ik0GfkdorxBQKHdDGLlOPS88FLbjhuf3GKv9KuLiPhoKGMZIET+nPYU+4nKDKiRm5zSzF96OFV8JYu2LjByBaaZADEF9J8z5YGAZwK83R90gYdtzwxEaU6xojryefEAnIa5zDbN7jbicmaP03j8qKtKcOTwWxU+M1G8zxbyEeDaxhEphVUQpf3ycuUWqkNC4l1rfYyD3S4RuBOBBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38wroI5KTEum6gnSYuvLRdj3VFkJXr08uUAoS0ns3KU=;
 b=ChzXD1d+cQ+KbXYKq0sWfAqm3E5Lv4ANUpzj8Km9VVwrUu4xCxaH9jVdjOjsAiNwr2k1D+WSCyNXZDI+nfuDI1++xFghpz6NcS5mfwHLAyE1xwzxYJZg5+F/QpIFCbqR0LmWvce+eldfzfWXhprmstmwZgOdDHcOG6PlIzXIbIhXwEGpnbHlsoauQLZIDQLJQx5Y3MdFxv8cm2VtIIwThspioYQAQC+LnBZHSqM9uiZobv8K64qJYE3uASXRLElYBab3gcZKcIwsr8zM2MJj8vlKoMPlzHWZDYZnqm2ZwUFB6G9Nj48UHBGHHdkO5HMzPmpDlwzki/BPycbULXupzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38wroI5KTEum6gnSYuvLRdj3VFkJXr08uUAoS0ns3KU=;
 b=q6D6r1gQ4TjdoPfg9pVPq9cig2bk6JKonECoC0a4QqxRBhCa0OsuS+AFKze5RHKGK5iqKlOsy20DVvOjFqOWqXT0MDFvMZ+RRkXuz0smf8GSsZQPA0CfyoYH0L2KG44pLuldOac/guQWFirfHBsqf2vV52jT5XCzRUgtdSH6hr4=
Received: from DM6PR08CA0027.namprd08.prod.outlook.com (2603:10b6:5:80::40) by
 DS0PR10MB7980.namprd10.prod.outlook.com (2603:10b6:8:1b9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Fri, 31 Oct 2025 18:13:55 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:5:80:cafe::26) by DM6PR08CA0027.outlook.office365.com
 (2603:10b6:5:80::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 18:13:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 18:13:55 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 13:13:52 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 13:13:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 13:13:52 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59VIDp6B095652;
	Fri, 31 Oct 2025 13:13:51 -0500
Date: Fri, 31 Oct 2025 23:43:50 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Bryan Brattlof <bb@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Andrew
 Davis" <afd@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Tony
 Lindgren" <tony@atomide.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v7 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20251031181350.j45twenjaykfk4bt@lcpd911>
References: <20251031-am62lx-v7-0-cb426be9d6ee@ti.com>
 <20251031-am62lx-v7-2-cb426be9d6ee@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031-am62lx-v7-2-cb426be9d6ee@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|DS0PR10MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a351dc8-d649-4924-09c9-08de18a94160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024|34020700016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KpsLdEmfFmUZsWWsMCLXBqzuHQDZ6s5ifQvMqLeylhrrYuTTKtCDUeySHF1E?=
 =?us-ascii?Q?kcFEfeVO3Bd+jw+Cowwv2c3OVSg1Ud7V5zVUqJzWH5t/WWo8TJs2aqK3pl5o?=
 =?us-ascii?Q?tf1h+7VJuQxtklpAR5pguQdvx2UQ8eVJ+EEOcCGcLpN8DQYDjpm6lnN2MeL6?=
 =?us-ascii?Q?g0q1ETqYPoBQkQpl0d9ZxcRkxjCzUvZUJfY4A7I5PPBC5PXbHuUxdmofySs2?=
 =?us-ascii?Q?2ou2nHRloWouwXQVt/gIrlksSY4ljrey+IzNejoKv5a6xTYPwM4wcGP+rT4n?=
 =?us-ascii?Q?x1wxzLyRrLqzb6f5kAAvHbU7LMa4B2mi0Jjv0NAe1gX78Cre7+GZPQH7Bhzr?=
 =?us-ascii?Q?MTu4G5IJfCg8z3kzYiE16UndaTzzF8y2e1UUn5sYKEI+99hLrChkXjED446m?=
 =?us-ascii?Q?Dba2WwK4VegG+N1+uazxdwKuGBqhWQv6uFY0vBiQHZWNnOnrtmqs68dHbB5E?=
 =?us-ascii?Q?1f5oALSqcbo5q/LB/0kQIpfYHtruPtXKElT/4StkgGojyqC1BpQ44jXjibLu?=
 =?us-ascii?Q?+SUDGNJxX5WegChpOUm3KbycT0jR2YFzH3GCq+aChzNrjbrSJboTqyhiS3rd?=
 =?us-ascii?Q?cCtdVWvIHTyMhw0iVN/jvx6R8RSPeTIJmQGIJM+MeXL/C1SkxZxYqeepq8vy?=
 =?us-ascii?Q?2q9tJaZBzsE9qaR2ykgSVPoaiOjkjMpyJS7e8yMKamB9LZeyOi6PL8UIzoiZ?=
 =?us-ascii?Q?FZX7gQJLxxM6r7amnL3KeCXOr4t1pIAqiCz8n92OQt2B05+4Fk7yREQJTOLH?=
 =?us-ascii?Q?mfudYpT9md/QjAoDwwjxOkYoKENc269TMNRka7DOQqHtJy6cm0G4rv4ewS6s?=
 =?us-ascii?Q?1WKDmuGu7oEAde+PRiYu4jEvhQIUDyGYWCK0s04q4PPNc7kgbgQTSWthg1/W?=
 =?us-ascii?Q?Yq8wwPiQ6ar3aJomG52Jht5D1vvklUD2kQ3uGyaV8C90I35ST402zQWcFjPa?=
 =?us-ascii?Q?ZsLSteUgg4cWF+FzlHXY1CxQatwsyxyvUI7jNMOlcIJ/VAfGQDVqPapRfwya?=
 =?us-ascii?Q?uDVUrFcmWMk82QA5prKcKTE3pWpCid3KNxe6qtXOTaIp+Tq5OKV1uYf6u3wV?=
 =?us-ascii?Q?7LUCKGNqcZe/uo1oO8suQXKRhQNMefyGyACjH/Q3GulkAxXunX4XjWIGuG5M?=
 =?us-ascii?Q?VPVHOpBJv8SJCjF8JR6YrUtDp7yiKZBV1DWmp+vVbOlLoayjj3p6Ap6VvbMi?=
 =?us-ascii?Q?ehZWnIZ0H3ETOIL2buMLPq+dklfIyNbH/TACaKFDOV72/Jg3hPj/jgfgnlRA?=
 =?us-ascii?Q?gMfphRWdyJ3z4ebPUfVEd6HmmZtjsZfyzTVBBRvk9eLhGtcmccJO5O/McJF0?=
 =?us-ascii?Q?ORhiKdUUfQW1CIdKBv6ngMy9/KszGLukdms34hrELdgGdEXtcBxUTL7fr5ZI?=
 =?us-ascii?Q?EKuZ2523dcZoEJ9Y5zhyYhQUUB1oAsVhMMt7jlz3DJTVkl5/oho9tJyjqELG?=
 =?us-ascii?Q?NwTbiTgp4odvGpPZ5U4fjHch/uxztj58uqPXo2gnK4Wroihn5/qNiNG4iuit?=
 =?us-ascii?Q?+OzoxQ2j08moKD6G7UpxXt/LaOBm7/ordFjvX7IEhjD1OVWjHMCjApbuLFne?=
 =?us-ascii?Q?hf7mKWzrazBDS0Smycc=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 18:13:55.7929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a351dc8-d649-4924-09c9-08de18a94160
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7980

On Oct 31, 2025 at 09:08:05 -0500, Bryan Brattlof wrote:
> From: Vignesh Raghavendra <vigneshr@ti.com>
> 
> Add the initial infrastructure needed for the AM62L. ALl of which can be
> found in the Technical Reference Manual (TRM) located here:
> 
>     https://www.ti.com/lit/pdf/sprujb4
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Bryan Brattlof <bb@ti.com>

Reviewed-by: Dhruva Gole <d-gole@ti.com>

[..snip..]

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

