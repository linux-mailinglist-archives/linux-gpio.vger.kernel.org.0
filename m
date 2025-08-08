Return-Path: <linux-gpio+bounces-24074-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1486DB1E90A
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B895362072B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 13:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA3827BF85;
	Fri,  8 Aug 2025 13:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="LgW4hyTX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013051.outbound.protection.outlook.com [40.107.159.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92254A35;
	Fri,  8 Aug 2025 13:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754659132; cv=fail; b=c58q6p+fhDpqdJSphW/aOFTiUbicUSw7jB2ESAQq89bcP3yGsaTKf/GYn85MUEEyDeu/oQcPswVdq3Cyga/0ZI3qete+oCRM/qtGe5dNNLLX3MLhA6gn0T1Z+UK5DB0xd7mtZiYZkQTLScQn2fZQtRF+QS1du8NFBEAhMyYCV8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754659132; c=relaxed/simple;
	bh=lSz9Jk8mMAL2oLS8seyjMELpd2SCBQ/GyzAwfoPmuhk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MreP6IiH4K3ZMN3AV1S2mKscCeNKFcmx+6yrQbhQbFb34h0ZZxQvH9EQKJXzHoaoEeJ/Xx2sO/nHgSJUa3AN8GszWLB9ISlmackWffGOpfiQ3DiTJVBAzE7Q4gOKQImYcXSTi2UEO5mxNaFzJDdGtCipSxEFJ6nt31khfPU3zio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=LgW4hyTX; arc=fail smtp.client-ip=40.107.159.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERTFnSVqJ32W1QL7Fy/+3+Blcqv4+pVaJaiTlonFEPH+2QVpEZ2PFLf2aiTAWwCOyiJx3+ovziUwbQ+8Y03GgStzn9xNxOLdClKmFEB4LpAZfa03+VM8LSqCk8tWwT/QsghwSzvFLQzU9i8hsITdLQCeP5SUQHHuCQ42r1OiYRRCYn4Ojm+XaOi1VMQQUrNlgqRbbUIvyFcxdiwW4ecp7bismyJsVQ0A1bLG7jQlAGyhC4i4ORLalqBILlIsRdnSFm3+6VnZJ82kUfOOrpT9LbJxvWJnJchtcy9gODoPeT8Zl5mjCuK+Febl5kl5cIet/boD9rmw2jMxwKh+hIyVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgJDZCrVoLajcVIH79KWLg42KL023a89GVuuHlu4zq4=;
 b=M5qRXoXASVNJ34DQa+snaHD7fJsg80Y/tcuHRB317qygETPvaYdLEek5/rSvfnzeVbVxukzxTzUAIW0dsLNIzPiw+580suCwKwseaTK/BdR8vIbsDZ7oTv9onLDHvcScNxV6bKOyu44cZIvP/S8f0vKduN0zLgF0GOoDkmYSAumjkUi/QSb+o2VFY60pUwhQvHCgnb3vuECwreMRFgTI9t5cUvhjQvYcu+/yqt4zCIrVjH4qN0IDa46PKLbXsN64qLRTIzgiN81T65YKnqs557RCtCs+nYa/Wfv1yeZWXRKrzBSgtT4b4hz61GPz3FOQYFc3JKPjCyyJusNXHeNF0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=arm.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgJDZCrVoLajcVIH79KWLg42KL023a89GVuuHlu4zq4=;
 b=LgW4hyTXmc/JAiYWsN0w7LOfpyvBBKUMVnbi4IV0jJzZnVrr2/EhKUWzFZIR3Qzvi4Oqp7I9kndIFlt8U54NjDxvz3B+0OvJn3tiUfpbV3xjOlozFqm0u4UQbWTnJsSHc80LJJgCKJ1ARiYQstzum38SMYbFzklx/Sr+FL8Nsr4=
Received: from PR0P264CA0284.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::32) by
 AS4PR02MB8768.eurprd02.prod.outlook.com (2603:10a6:20b:580::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 13:18:42 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:100:1:cafe::d) by PR0P264CA0284.outlook.office365.com
 (2603:10a6:100:1::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.18 via Frontend Transport; Fri,
 8 Aug 2025 13:18:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.0 via Frontend Transport; Fri, 8 Aug 2025 13:18:42 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 8 Aug
 2025 15:18:41 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 8 Aug 2025 15:18:41 +0200
Received: from pc36611-1939.se.axis.com (pc36611-1939.se.axis.com [10.88.125.175])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id CE1AD17E9;
	Fri,  8 Aug 2025 15:18:41 +0200 (CEST)
Received: by pc36611-1939.se.axis.com (Postfix, from userid 363)
	id C8ADB60C1D; Fri,  8 Aug 2025 15:18:41 +0200 (CEST)
Date: Fri, 8 Aug 2025 15:18:41 +0200
From: 'Jesper Nilsson' <jesper.nilsson@axis.com>
To: Pankaj Dubey <pankaj.dubey@samsung.com>
CC: 'Krzysztof Kozlowski' <krzk@kernel.org>, 'SeonGu Kang'
	<ksk4725@coasia.com>, 'Jesper Nilsson' <jesper.nilsson@axis.com>, "'Michael
 Turquette'" <mturquette@baylibre.com>, 'Stephen Boyd' <sboyd@kernel.org>,
	"'Rob Herring'" <robh@kernel.org>, 'Krzysztof Kozlowski'
	<krzk+dt@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>, 'Sylwester
 Nawrocki' <s.nawrocki@samsung.com>, 'Chanwoo Choi' <cw00.choi@samsung.com>,
	"'Alim Akhtar'" <alim.akhtar@samsung.com>, 'Linus Walleij'
	<linus.walleij@linaro.org>, 'Tomasz Figa' <tomasz.figa@gmail.com>, "'Catalin
 Marinas'" <catalin.marinas@arm.com>, 'Will Deacon' <will@kernel.org>, "'Arnd
 Bergmann'" <arnd@arndb.de>, 'kenkim' <kenkim@coasia.com>, 'Jongshin Park'
	<pjsin865@coasia.com>, 'GunWoo Kim' <gwk1013@coasia.com>, 'HaGyeong Kim'
	<hgkim05@coasia.com>, 'GyoungBo Min' <mingyoungbo@coasia.com>, 'SungMin Park'
	<smn1196@coasia.com>, 'Shradha Todi' <shradha.t@samsung.com>, 'Ravi Patel'
	<ravi.patel@samsung.com>, 'Inbaraj E' <inbaraj.e@samsung.com>, 'Swathi K S'
	<swathi.ks@samsung.com>, 'Hrishikesh' <hrishikesh.d@samsung.com>, "'Dongjin
 Yang'" <dj76.yang@samsung.com>, 'Sang Min Kim' <hypmean.kim@samsung.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-arm-kernel@axis.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <soc@lists.linux.dev>
Subject: Re: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
Message-ID: <aJX5MStJwpQENOSE@axis.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <847e908b-1073-46ea-93f3-1f36cc93d8b8@kernel.org>
 <bfdc2eddde554e1d1808dd8399bc6a693f681c9b.camel@coasia.com>
 <CGME20250721064006epcas5p4617b0450e69f72c94d2b3ae7b1d200e7@epcas5p4.samsung.com>
 <99977f38-f055-46ed-8eb0-4b757da2bcdd@kernel.org>
 <000501dc06ab$37f09440$a7d1bcc0$@samsung.com>
 <e334f106-d9f3-4a21-8cdd-e9d23dd2755d@kernel.org>
 <002001dc06b1$540dc980$fc295c80$@samsung.com>
 <ef3b8e12-0677-4e49-bf2c-b8136c9a6908@kernel.org>
 <013301dc0768$6f58dc40$4e0a94c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <013301dc0768$6f58dc40$4e0a94c0$@samsung.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9A:EE_|AS4PR02MB8768:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc9d923-e847-47f8-88f0-08ddd67e18d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|30052699003|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0bQPACZp9g8lQ/qsGehobkwro6PF7+b3+LaqzOcYS2BPXhQDo3tGvABxunWN?=
 =?us-ascii?Q?aeR+ICLxee3b6FxRmFpC1RPYKNTo4I1qoN78KLxnVc6FWaq1moVDC1IcqNsH?=
 =?us-ascii?Q?UKfbTEW/hV0JJCVh2zJYCx0Zi2pGsQBbR5oV2LfF5dRLxFHcJ/kc0tEa4dGZ?=
 =?us-ascii?Q?o0yeeoEe33dA2N4fpnHvvRcu1PKycQ4kkYeaCl/kxsyy12NUr4qhzReZIE+1?=
 =?us-ascii?Q?Gq4qkmJcqb6xxG28r+Lzglqu+/m8xqP5kAWLwH6cHK0EL71vTR5bUIxJ5YsH?=
 =?us-ascii?Q?l62MoxxkB6C03VAfU3QhnTKI50sPc8vwdpTZAKl4St8bPMTTqIqbq18jPXeR?=
 =?us-ascii?Q?Gk6B8mhPPqAhpKs5YlJO11NeZIkuYDnSV6PaZEit8HOyUk51zo5Nlkw+y0Ss?=
 =?us-ascii?Q?39+6oIgkUo/j+Za8MmkTJxGzeLfjS4PLOQdvhYboE1x/elJpKlP+D0hKgqU5?=
 =?us-ascii?Q?xZ0OO10wu/+LDWIwfhE9HaRfRJMHG2MAybU40OJpnRxamZ1lRFe6j04PpVqI?=
 =?us-ascii?Q?HIUZ9O3Wf0QhshIl1faMPqkRUCI6BYNY7S90tF3XqwspC/972vg1/S8sc2UL?=
 =?us-ascii?Q?D11wrfy/VFUlBLquYTNA/4ma74nUV6YGiuUhiHlP9v4z9ewGPC4hFwIyi+zu?=
 =?us-ascii?Q?JcB1rdIDf4xxfGyIb5nSfbRGIhfmVUqMtyrIN7FR86eKdAs7yU1x/pF17R0E?=
 =?us-ascii?Q?SeL26GFql4sCxLjPg3td8P6Tf3RYRHX1ZolQtyAbrs4emeZYrVAYm84cjAUd?=
 =?us-ascii?Q?wFw/Ex6iFJWZHN4yKNfo4bxWKiZe0YH3AhPOuQRONijtetdXkn5Q5mPaPomx?=
 =?us-ascii?Q?rpa7Bvt3Vr4gx0dUSeBc65rx6Zs0m0r/anS/4jH6wfVwJk+1e3JsPG9UmXXZ?=
 =?us-ascii?Q?F73UwOtYWKd2p5GfvbOef79dJQl2YimOGjGC2+2T9/8nTa3zK+ZfX2jJkOf6?=
 =?us-ascii?Q?GuDLY8bOWZlSeiIMZ5SWrYqsPUtoxD5mCVdLGJzYU06njjjbL+4VLzRFQzLp?=
 =?us-ascii?Q?S8jo+a8eYZSghKXtgCf4Qd3gZTgr3kcnImvhKKCU8Mo9lTx+z7Yi61aNMlS7?=
 =?us-ascii?Q?JCOIOKGdUT2VPmNPDajcRth/wireH3cRvkpipsZgaLD1OlHcuxBZnyld5vXR?=
 =?us-ascii?Q?HmCdJIR4INf/Eov3uKrnyYXAiuhiWn2ZChUFSAmLI5W5t9z/GyD7LNfGNEpM?=
 =?us-ascii?Q?wJwAemnEE8ZqcYSMhijVdAiSxE/6Ankw7ZpvBU4+ukeBRT5cE3FG4kzO32Iu?=
 =?us-ascii?Q?b8tOYSa1nH4zhP0kbSgoy/0v1nFhPXZO3n2+qoHwvDZDjV3xnJw/MkoNm5sU?=
 =?us-ascii?Q?zZBUQGmwMq2giMF5/xKznCE0g1DYnVgOoMXQIcYi8My16moO22sCQZhdaMeG?=
 =?us-ascii?Q?HdEoAUYb5S6hdEovD68F+Mzhm6ZWUitPoC7Zyze4Vyi6/jkcjRfQJPRZSE6K?=
 =?us-ascii?Q?t97HYBgkf/SG1xJmNfbGLiX2ZOkGnVcYAQDkzYdB7euRu4gpLdtVHAFmdx3c?=
 =?us-ascii?Q?Pz2LJ/v1Izz2ljOiclP0Cice9NIC1PtFyFm9?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(30052699003)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 13:18:42.7039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc9d923-e847-47f8-88f0-08ddd67e18d7
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8768

On Thu, Aug 07, 2025 at 12:26:27PM +0530, Pankaj Dubey wrote
> > Subject: Re: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
> > On 06/08/2025 11:05, Pankaj Dubey wrote:
> > > or ARTPEC is manufactured (ODM) by another vendor in that case, won't it
> > > create problems?
> >
> >
> > No problems here. Non-Samsung Artpec/Axis soc will not go there. It will
> > go the top-level axis directory, just like artpec-6
> >
> 
> Okay, understood. I assume Axis team will be fine with this approach.
> Let me align with them internally and address all the review comments in v2.

Just for the record, Axis has no problem in having the ARTPEC-8 / ARTPEC-9
in the Samsung directory, while the older ARTPEC-6 / ARTPEC-7 and
any other future chips will be separate.

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com

