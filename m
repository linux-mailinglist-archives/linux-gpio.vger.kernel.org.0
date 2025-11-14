Return-Path: <linux-gpio+bounces-28490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 365F6C5D41C
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 14:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 70EDD35B97E
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 13:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F02316183;
	Fri, 14 Nov 2025 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mFDW3r9m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013017.outbound.protection.outlook.com [40.93.196.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16692313555;
	Fri, 14 Nov 2025 13:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763125530; cv=fail; b=rOZ2mWtzO1R5SaA+xsz0Uv5+BFkbN9Y7nD2u54bx1zOPx9ytM/pAfUC1tWYam73u1wtSOCCGo6gNaT7ORLxMK5by3wgYtQktyJ2yxka9bQngM+tAl57hjgg/CqD3EPgdJ7u4joyqEG3VxsMxB4qg0MgSkIM7s8BdEe67/EwZf9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763125530; c=relaxed/simple;
	bh=WovUPcvuwboQalfCXWf9Lja17L7gLj3ReXbBSA3t2kA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgVyXQowu8Migw9rz18wic9jN9VfdaUlfiqlEd1+/1c1s0x62aa1RQBiVb/UconDz415kRVyWt6+lrUbV9tJvqzOu2MVzikUEL/PbRgDuZBlN28vyBAJoJlg2TbHaJlMBre0QX22EnLrbKM/tRzOhFjmtaQubARVcr8d5xZ7+jU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mFDW3r9m; arc=fail smtp.client-ip=40.93.196.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jk/BWj2avlUbgZa9DzSlAKVlFQjxhb/PbqWD6roqBN9QETbMLjB2JKFDeYrFsYFAJQ1kKYm6zP1fu96DJ2xF05l4Z9iFwa9CrAkFC31FZQ/zsX45+E3fzuU706JJpUK0FPZ+JJGT8LgKu/F8H/AAvmsDfHxKzykaZfZpS0T3bA4loE8oMbKAqJLfy6Mr7w16UgMynbTsa4StI/LraWfHCecrFPPk/mi42XhqabIFueQVI/IEaSymSPezGMGo7ubds0uruk9jPr4QjrzcytfddP1Hgnnw2e6nQjvjpq/ATFLhMdMcPR1JghcEmwrtstYWTxZSmLfTWN++1olUjfG5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cc1rsuJ9EhwS4Z99ihcI1XwG1OmQT5JZRymAcJIVE9I=;
 b=Ai6DJPGpo/6laBGxGl5q7UaBnH2VlOmjv8cEcxDgYNLuTgarft9fIpBMvUvw8jdB8QTU5JgV15wdCjPGhbImRHhwLh0AHeT7Y9ixtszyyfLyJ/nzluMo9AwkxaRUnfDWMeEgmKn5hW5PkBSskr26MGX4aR1rSsm40rn3QQvVSS7p714SOh0b2lXNgpQL+uH3GXip4dTQeb4LovLxes4+/IJveG6wy9XKtDwy8md6KSMaiFyBQcjDwRsUZFaYPb9WzyyYnO7ScbJLBwjds9Am4vGtC0kpp8QbVa0zw8gaBdqWfAg5zdEhY3mlE4eIWH1veCX8tlqrXPsql75sJH/C0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cc1rsuJ9EhwS4Z99ihcI1XwG1OmQT5JZRymAcJIVE9I=;
 b=mFDW3r9mNkp2eLwThZI2aDSXVKPDVlDZbJx40OUBsZB6lHHuVsEIgtgyQ6XR/LmDSo5Vslf4opuMlWuZK753HwmFwfGEYKAx+GsR11FlU3YBYG0LDh48vnAn/SgDCYUdn1kV7zK0Eezz9w7UM06yyzXBi2+QgStd7lr/QTM/wSg=
Received: from SA9PR13CA0171.namprd13.prod.outlook.com (2603:10b6:806:28::26)
 by SJ0PR10MB5742.namprd10.prod.outlook.com (2603:10b6:a03:3ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 13:05:20 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:28:cafe::f2) by SA9PR13CA0171.outlook.office365.com
 (2603:10b6:806:28::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.6 via Frontend Transport; Fri,
 14 Nov 2025 13:05:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 13:05:19 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 07:05:19 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 07:05:18 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 07:05:18 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AED5Ibf2060955;
	Fri, 14 Nov 2025 07:05:18 -0600
Date: Fri, 14 Nov 2025 07:05:18 -0600
From: Bryan Brattlof <bb@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Nishanth Menon <nm@ti.com>, Andrew Davis <afd@ti.com>, Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	<linux-gpio@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>
Subject: Re: [PATCH v8 3/3] arm64: dts: ti: k3-am62l: add initial reference
 board file
Message-ID: <20251114130518.2br6uo76edwi5a2d@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20251105-am62lx-v8-0-496f353e8237@ti.com>
 <20251105-am62lx-v8-3-496f353e8237@ti.com>
 <882565f0-a903-4e6a-9bd5-a3839bfe18ec@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <882565f0-a903-4e6a-9bd5-a3839bfe18ec@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|SJ0PR10MB5742:EE_
X-MS-Office365-Filtering-Correlation-Id: 88565f05-f6b7-41fb-9074-08de237e76d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVpTa2J1SXdaY0p2SVlUMXZuWDdTK0JHbWp5N3F2WEMzUmpzbHo0bGkyS1E5?=
 =?utf-8?B?cW1QU1dxd1JPRXdvY1hZV2pOeXdUaGJ0MFdyTkpOYzJGUFVIY3krMk9BTGhq?=
 =?utf-8?B?MjRrYVp3QktKR2k3aDNodkJIQk00d29VbmFmeFdMbkZnNmN1MXYyR05ZaUlQ?=
 =?utf-8?B?b3NkcC8vaGVjL3N2aEdlV25NYjBuWkNIaThieDJFaUNqZzVGaWY3RjBaOUFJ?=
 =?utf-8?B?Z0RxbmNiOWx3dm0za2RZYzg1MThrRS9QVjJ6eFdKTVUxdjlyVzhBNUN2Skxh?=
 =?utf-8?B?anlncnExbmRBdVlaZWNUOG8xcXpibnJGQ3R3TFJDTkpDMTdib0NvYTFQbnh1?=
 =?utf-8?B?cWUxTWZMYzJzaUxFcExQcmhIa0prU3F3MjF0ejhjcjZqTklEK2VadEZ5U2hI?=
 =?utf-8?B?b05jU290UmhDSTdUbGFxdE5RT2p1TGErTWVaOVI5TzIvTVE2K254TER0cy9T?=
 =?utf-8?B?UGNTcHNady93T1dsSWFLUTJ6T1QraGpMc3d4OWRwTzlyVkVxeWhSdjRDWXZH?=
 =?utf-8?B?dERheWc0NGovSE13VktlNlVtblRCR2w4RHA3YUx2QXpLS2FMSDlzUzFlN0Ra?=
 =?utf-8?B?YzhrREdSQU1MZ3RVbU1uL21lT29JemU2VG45bkowN1NUcEJYMGRUL3NTcjN5?=
 =?utf-8?B?emcwaWZIakdTQklMVElBSEJ4MkMzMjc2MUx3Y1VqOUVvUm5uaXp6V1hMRWRJ?=
 =?utf-8?B?NUwrSGhCdlg4UkdhTktzN2ZxQlNlRHVCV1lJMmU5YlFxM2VRc2JVWDArVG5W?=
 =?utf-8?B?cTI1NnUxVkR3ZWlqT0dnVzY0c3J2VWRZei9xbU5LMmVZWUVoY1A1TTRwSnNK?=
 =?utf-8?B?YXl6THFoMEhveDVyQUEySU84Y29mZzQrVVRPM1M3NVlrbk1pZjczeUVWR08x?=
 =?utf-8?B?REpDYkQ4ZFZqeENTYjRJSUVJWncwMmtOOXZTL2U5RDRWT2FKTnhTbFRUSUNo?=
 =?utf-8?B?UzBrUUh6MWNlQVZMSzRhRWFJL1dLaWNoYmRvMDE0b0E3K1JqOUxSYU5XM05j?=
 =?utf-8?B?a0RIVGErWlBsS1RaendVQ0s0WlBlZTk2Z2FzL1AxZVhXRzRmR0xQMys2UDJ0?=
 =?utf-8?B?OU5OWmczd05RT2RoaFlWV0V2K0VycktGeDBYUTNoWGcwYkFVbm1YWkw0Z3Ri?=
 =?utf-8?B?aTA0S1VJODFHakh0MmFWSVZYZ1dZQjEzVDJzM1Y4TnIxQWVlL2hVV0dSWU5o?=
 =?utf-8?B?S1lCMmhGZ01nOE9XYzZpUk5hU0Z3MHAwTGN4SEZzT2o0UkpxMkVzc2twNUQv?=
 =?utf-8?B?TXY1eEt6MWphcGdTeDlXVWRIYjhTT3dvMHprMmxidFdJQjF1QkVHVndvUCtR?=
 =?utf-8?B?MjhmdjJORmRzL3A1cDdQcUhjd1lJQkVlK1k3L2hVZ3BPK1ZNNmdnamFzZXY1?=
 =?utf-8?B?TDFwbGI3bTRTM0loU1ZNRU96NitMQjRJbSthU1RNcWVENC9qc0VZZjM2Y0FD?=
 =?utf-8?B?R2paVmhTUzZPWGNua3E3WW4xbmdTVURncUxQTXhHUHhnNWt4U3AzTFRYaWxt?=
 =?utf-8?B?NE84YjNwblk4UzFudzJJMjVUalJ2UTRyTG1qcVNIN3JnVVd3dmM5Rzk3QXJm?=
 =?utf-8?B?d29wdG1hd1M1WVBSU21iUnJmaXJmNjJpOENiWkx3NW5ycWVDMDVOSnl0Y2xn?=
 =?utf-8?B?Qm1nT210SjBRcEtOYUxCNUUwazJWRW45bUh0WEc3eVNrUkIyR2pMT1FWK0dV?=
 =?utf-8?B?bGJJNlB2dmZObmFzZXJuQ0xKZWN4QzlncEJDOFpLY0szcGZEaU9pS01uTkZ0?=
 =?utf-8?B?OWZiUXd3SVdUcFpHNTRha0xxbzlRUXE3WDlNcGEvR21FOEExRWU0NFlzMzFs?=
 =?utf-8?B?YlhUam9xbUJoU1k1bjVvZDl0dW80N094OVRMQ3lLbUNvS2s4d29SeVhOUDIv?=
 =?utf-8?B?ZEozbnhObVV3bWFFc1RLbWRHQjJFcituQVFiNlAyekZiSXdHd3M0VTZ2NjlU?=
 =?utf-8?B?ZzQvcXpCV1pPSnJZcExsNVdsdVFpV1F5cENNZmFzUmhjSEp1c2VZOUs2QWZM?=
 =?utf-8?B?ajFJWlJpR2FHTnA5WW11Ky9OL2tGZWs1Y2ZDMTNUdnhPZkV1L0E4ckZhcGxV?=
 =?utf-8?Q?shRIGe?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 13:05:19.9432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88565f05-f6b7-41fb-9074-08de237e76d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5742

On November 14, 2025 thus sayeth Vignesh Raghavendra:
> 
> 
> On 05/11/25 21:16, Bryan Brattlof wrote:
> > From: Vignesh Raghavendra <vigneshr@ti.com>
> > 
> > Add the initial board file for the AM62L3's Evaluation Module.
> > 
> > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > Reviewed-by: Dhruva Gole <d-gole@ti.com>
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> > Changes from v1:
> >  - switched to non-direct links so TRM updates are automatic
> >  - removed current-speed property from main_uart0
> >  - removed empty reserved-memory{} node
> >  - removed serial2 from aliases{} node
> >  - corrected main_uart0 pinmux
> > 
> > Changes from v2:
> >  - alphabetized phandles
> >  - corrected macros and node names for main_uart0 pinmux node
> > 
> > Changes from v3:
> >  - added and enabled more nodes that have been validated
> >  - added link to data sheet which is now public
> > 
> > Changes from v4:
> >  - Corrected Copyright year
> > 
> > Changes from v6:
> >  - moved thermal-zones{} into the k3-am62l3-evm.dts to allow other
> >    boards to selec whichever trip points they wish
> > 
> > Changes from v7:
> >  - enabled &i2c0 to access the eeprom on the board
> > ---
> >  arch/arm64/boot/dts/ti/Makefile          |   3 +
> >  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 362 +++++++++++++++++++++++++++++++
> >  2 files changed, 365 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> > index 361248dcfff42a27f07cea6bca31461f8dc25b92..386ab1e91bcc3463e2d0618919da1ec3ce314bf2 100644
> > --- a/arch/arm64/boot/dts/ti/Makefile
> > +++ b/arch/arm64/boot/dts/ti/Makefile
> > @@ -37,6 +37,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
> >  # Boards with AM62Dx SoC
> >  dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
> >  
> > +# Boards with AM62Lx SoCs
> > +dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
> > +
> >  # Boards with AM62Px SoC
> >  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
> >  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-var-som-symphony.dtb
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..34c24b368d9e88cd94a7426cd1524f096e9c43c9
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> > @@ -0,0 +1,362 @@
> > +// SPDX-License-Identifier: GPL-2.0-only or MIT
> > +/*
> > + * Device Tree file for the AM62L3 Evaluation Module
> > + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
> > + *
> > + * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
> > + * Data Sheet: https://www.ti.com/lit/pdf/sprspa1
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/net/ti-dp83867.h>
> > +#include <dt-bindings/thermal/thermal.h>
> > +#include "k3-am62l3.dtsi"
> > +#include "k3-pinctrl.h"
> > +
> > +
> 
> Extra blank line.. I can fix this locally before queuing.
> 

Oops. Thanks Vignesh

~Bryan


