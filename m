Return-Path: <linux-gpio+bounces-24228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 653A3B21EAC
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 09:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D21D3BA5D5
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 07:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EA72D3EDF;
	Tue, 12 Aug 2025 07:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="KMWvf/Qf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5331A9FA5;
	Tue, 12 Aug 2025 07:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754982052; cv=fail; b=DBJat0dZWhhs+TOy+Uywe1mRb1j3BwtdZOgQw1j5VxDZrIakU0fLrZhBvMV1Crs5rNtBKOTHMJipMmWEAyYEvqQsRrqN8cgCoLIn19BZf+lpygItfnaaJCmmqtGlC2wJ0FYUQp7a8Ko+zcXf/fGCSn/hq0zJLFvNVKnCYJ94ung=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754982052; c=relaxed/simple;
	bh=A+UBvLYY8fUTdbXr/ZY6NCSbhcBPEYyO+GFVNerf838=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNw3PgfjDmu6YVmnqxzTPPnRKexULbbJaVqogKGZQh2HzSe3/I+gHwtWO94wpZ4s2MeKDtAXp/6ChapeOZuWGh17cwAETSZpuV2Ha4eaFAynVFgy9lDCq2Np/RwSE2h2u1U9Vney431cNyo/8vnifZ0/fjQov6u6QcHgNPzgJ60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=KMWvf/Qf; arc=fail smtp.client-ip=40.107.220.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgGnPyH/U3NVzY8OJNzsLXGs4NKY1PTZE1qg/3S2sGQELGl1d76ToqQ4tPtQb2oMjMKGE0Nu7uEVAI6ggGQqul3gmgBu7zNRpH+7YwnJz+ojs3m/IcBqatSseaZCGiV4vrXEP0//bLBDf9nyHCDB67oIb9J2hQVwOvmloENYG8aIVadR2UhMtWspeFAp4+dB9TcZf416VlLgf1ZfF4hlXWBxA3XAEyZaiz1UX394xyzoyd+rfNFSJYK3SWLjZ6Ftv8/5Rvjjqe17NFcH6FLaXNJIjpnrJAFfjiiWNfHDlsRi3/fadC/i0rsTFSzw5kbDlROZ9C+TVwozA07YunITpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2Y/RehJZMbloJY/L6tKYdYKXSaNWQdT7udx7wjKL3I=;
 b=ORUf6oX5BhfHuMeuyht7cWZsxyaq+laq0K6BTV5tXdTxGgSIn3IEbSNxhg3qkILXOYtWNfxfZptWIBdUSHeLTK9ga/ArsiKBah91J35E4x3SYsLpBenNJ42uJD25Ed2tEe4JyAANDO6QVNffbvsUwwcq9hxF1HRieo8x6J/03LhIMhfis7vgI6DpobxiYGdsBI8JN0DQba5lnSbsaFeuYEvv+TyPCU6GmgU/j1lBYK2it4PGDynvAHVL6wVTGLTc9DLCqUNsOzAoTHZo83+09E7tryxp7SopgXQjT/Cbr7u8jCei3uG+fu56Ewb+2gdbveCyjtZJRX/LZJGNG98GlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2Y/RehJZMbloJY/L6tKYdYKXSaNWQdT7udx7wjKL3I=;
 b=KMWvf/Qf2u5JvZcPpSY8Mtd0cR3AIpkoCA6VpJ8A3paYq1kDhQrkDSiTPFOOxXxn/+pFXLtsEeELtFJ6v013oaInckPstEytZtwFiM5OWnIeM4kPWxONFgG3PxcVJLxnV3rL6faWW9ky88z/AY2Hl7B+R4rPpJETph3SHrsJWeGP5ZxLdZGqO8YHMJPYDBOBxmglXC4CydDlYbqVrxoSQ7dN0ZWsN6R1AFHgO4/juyftX0FjWoV3ZdlgZLTb9gxOLCSRAsMwwiL2+5SYPdpzCp3I6AdcvC+N3Kb2pdULTKtbqTO7as3S+6oHcNCRFOP6fsBRf2RpIVBqq9W0NBVHuQ==
Received: from BY3PR05CA0037.namprd05.prod.outlook.com (2603:10b6:a03:39b::12)
 by IA0PPF855F4BF3C.namprd22.prod.outlook.com (2603:10b6:20f:fc04::d35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 07:00:49 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::c3) by BY3PR05CA0037.outlook.office365.com
 (2603:10b6:a03:39b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.13 via Frontend Transport; Tue,
 12 Aug 2025 07:00:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 07:00:48 +0000
Received: from cd065bf83d0d (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id 2CB25D04AE;
	Tue, 12 Aug 2025 10:00:46 +0300 (EEST)
Date: Tue, 12 Aug 2025 10:00:45 +0300
From: Ian Ray <ian.ray@gehealthcare.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	nandor.han@gehealthcare.com
Subject: Re: [PATCH] MAINTAINERS: remove bouncing address for Nandor Han
Message-ID: <aJrmncETAf5EKyEJ@cd065bf83d0d>
References: <20250709071825.16212-1-brgl@bgdev.pl>
 <se5ok3bzlej4gecaep3albatkigcczsj4ailmulqebd737qe7a@ly3vlkqhgm3q>
 <5offogdzedixircmncso7wzswgh3ancblpydnelbbqw3pjxdpw@qcgnpip4g4xd>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5offogdzedixircmncso7wzswgh3ancblpydnelbbqw3pjxdpw@qcgnpip4g4xd>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|IA0PPF855F4BF3C:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db66a59-c21a-4715-bd07-08ddd96df7cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iCzs5OlWnl+LArjvFptJ5vBVOfDtT1/0I6DGBmNOOHcJuWKnIdgbP/TqbnDB?=
 =?us-ascii?Q?/d3iSJxF1wr1lt8Y27UZg0f8ywQS5tCC+RASgtxxv5xG7iKahanN8lpiQftt?=
 =?us-ascii?Q?QCZtO3kOTGdOZyfQ8ED0zxJuGj0vJ8G+vJZZLZarXkr5eqnSzg+3zZBR60cR?=
 =?us-ascii?Q?mUU58tIvgW49V0xWMuaYz3NUZYRczKQSdFjo1XDKWHqftZ+tK6ZFMAhHc9LZ?=
 =?us-ascii?Q?W6Y7x9ExANR4N/3ta6LUFq6KgufOGcAhMT3SmkD8oYsmambEeEMzvtDCM6GH?=
 =?us-ascii?Q?GfB/RREi2qcxFiv0pqIw8ZrAinn8+IiatqF08yYWXV/5wwJ8XdBumFLq1QJ6?=
 =?us-ascii?Q?wcX7qN+BvHbwuf/F4QwjHtFqjbGaTm6JHCs1+B8ygjj5lTVEYJscMtKwvGo5?=
 =?us-ascii?Q?ouQxhXMFEvZszJ2KPYJ/pD+SxyYRBiHj+8i5x2lRq+gqSECMXX4FtafV46PB?=
 =?us-ascii?Q?KyHaVghQPOPoIw/XxZAuSU0K9qwE4sa+hZQA3vUFnIVuRaBi33BEFwYFnB0I?=
 =?us-ascii?Q?Kb1usjNbQXyoLOXXWCv7moDXf5MhAYwSnffUfSj4Mzb7Tb13mYXPQ1xXt/jU?=
 =?us-ascii?Q?zvBjACcZOxfzFjesqTDSiKO5aCJDdgNxj/50vg7LmlpULAj+wco2mqwR7lIO?=
 =?us-ascii?Q?kyzJJ8QNfPL7okxqLdc+Hr1FllLJtXB9tPr02aVq3vGXBCQ+erBqesLM/gWr?=
 =?us-ascii?Q?iSLJqOlWMRHuIjfGYqqb2baMV+bCtNvTLdFhmeOt8hw+bgML594FixdHuIQR?=
 =?us-ascii?Q?aLo1NInBWhxopQ9MlPCu3AmLnRdUQTWd5xYbX8Cq5Say/XQSXkrm+JpolH/S?=
 =?us-ascii?Q?FuljGXoJ6Fkh3rSZG5jV50VGYb1bP3dDGXSAWqIHsqh1S5Z4QoL7iQnfRZm2?=
 =?us-ascii?Q?k+N6UeNh/NBMUN4eDxnrf+cX5TriWbfeKvHE6QIW3+a0C/wfspRBAuJKM+gw?=
 =?us-ascii?Q?F5+ZE5PhQ+UBj2ojvH7UqcPXx04mUibkiMHl9w6SCVoxe1ysY9dAjAPiHGBM?=
 =?us-ascii?Q?7tpWewYlAbUBsRL1yrL3wwhPcU8ee86PN1XLkgHZ5IeFIpDSmecd3VzyF+Kk?=
 =?us-ascii?Q?MCgDx1JqXDObkM70R7YmWreYiiTArrmABMCEylpEztMKWyc112Iv0F1itR6C?=
 =?us-ascii?Q?fr00TcQzXbZ6c/thzM14zdDveCGZ7GHGgzVcwsBWQqWh3viHmTmOSY0v0HAt?=
 =?us-ascii?Q?D6bH8B7Zh/rOO1wQ+VfPbS/BCNOMmiEppijNV1V4HhLfX6cDBiCUWHfhbQmL?=
 =?us-ascii?Q?QhL6C5xL4Qwzuw06O8o3kLPJWnrJ9Ejv+pvXY5fL8G5hKCPTLqTkegncEWBu?=
 =?us-ascii?Q?4bpQmGjrX7uSXWlGR/QFNOi4uTafDG4r0YOV+1Mm5/bRdhNIKsrj5Tey/YxM?=
 =?us-ascii?Q?WwI/a0X3vJ9ewf5IJgvFByADYMFCpK5Sj63Tmw16/tuu+W079SfLmIwIu9vr?=
 =?us-ascii?Q?dYDwOAzsvn63niyPNgJlB+M0bd3VTAggXf6yA6qmFuWTxGBViU1tiA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 07:00:48.4851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db66a59-c21a-4715-bd07-08ddd96df7cb
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF855F4BF3C

On Sat, Jul 12, 2025 at 11:15:06PM +0200, Sebastian Reichel wrote:
> Hi,
> 
> On Sat, Jul 12, 2025 at 10:28:26PM +0200, Sebastian Reichel wrote:
> > On Wed, Jul 09, 2025 at 09:18:24AM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Nandor's address has been bouncing for some time now. Remove it from
> > > MAINTAINERS.
> >
> > +Cc: Ian Ray, just in case somebody from GEHC wants to be notified
> > for this.
> 
> Apparently his entry in MAINTAINERS is also wrong and it needs to
> be @gehealthcare.com now (at least that is what U-Boot switched to
> [0]). Let's try again :)
> 
> Ian, you should update your linux MAINTAINERS entry in MEGACHIPS
> STDPXXXX-GE-B850V3-FW LVDS/DP++ BRIDGES [1].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/MAINTAINERS#n15490
> [0] https://lore.kernel.org/all/20241211083136.66-1-ian.ray@gehealthcare.com/
> 

Hi Sebastian your link [0] is actually a LKML submission (December 2024).

I also sent a V2 [2] (April 2025), but there has been no feedback.

[2] https://lore.kernel.org/all/20250426083220.110-1-ian.ray@gehealthcare.com/

Blue skies,
Ian


> Greetings,
> 
> -- Sebastian
> 
> >
> > Greetings,
> >
> > -- Sebastian
> >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  MAINTAINERS | 7 -------
> > >  1 file changed, 7 deletions(-)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index efba8922744a3..c780cbd11ffb9 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -27466,13 +27466,6 @@ S: Supported
> > >  W: http://www.marvell.com/
> > >  F: drivers/i2c/busses/i2c-xlp9xx.c
> > >
> > > -XRA1403 GPIO EXPANDER
> > > -M: Nandor Han <nandor.han@ge.com>
> > > -L: linux-gpio@vger.kernel.org
> > > -S: Maintained
> > > -F: Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
> > > -F: drivers/gpio/gpio-xra1403.c
> > > -
> > >  XTENSA XTFPGA PLATFORM SUPPORT
> > >  M: Max Filippov <jcmvbkbc@gmail.com>
> > >  S: Maintained
> > > --
> > > 2.48.1
> > >
> > >

