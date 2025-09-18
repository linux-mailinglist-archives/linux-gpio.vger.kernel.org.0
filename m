Return-Path: <linux-gpio+bounces-26323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BACF2B844E3
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 13:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E2311C03272
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 11:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5719B303A20;
	Thu, 18 Sep 2025 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kemXL4wU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013067.outbound.protection.outlook.com [52.101.72.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D07A303A1E;
	Thu, 18 Sep 2025 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758194123; cv=fail; b=XgjK1mz3pJZAmj+3tO8YGyCvJDVHkhKLviVQ1U89CfPkNDY8Qg6RYjuc/nHQzqusqxbwm2371km6AlixUra1MEdEqYz86UqNYLyyBlc8paH8SsHagtL2UOT+wAG5amqEMGdyfnSzDAyOOdoyUdwbZGuhnAz2Posn5YxNVBI9DHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758194123; c=relaxed/simple;
	bh=svgyeYNt3ndMYtwlz3e+XjtgW4fCbCAHYYddP/b9CJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dXpyIDoPsSf+4oM1ANj4yZg220YqL30UE5lBqe7lRoU7Xn5ELfhhhJlaS+5zhBdjeo8jhMc/ItM8oQSJlDJKaLH6jIQTCFtLq1s3ymdEWzzEnep5ZYyLFZgm+vzZLCYCMULMTYpnPekq/RbUf7p5K8xI4NFnODOTlKVQntwz/GI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kemXL4wU; arc=fail smtp.client-ip=52.101.72.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFyBzq0fy6lvCZ7PnFp7fcsvn5KNfGb45fBl0Wr+o/QOWNWElDZBtG8xxBA5gMzcHxWuhxb14FtRzP4UEsin0VugHSzMAnZe+NBgGh36PUjdettoubygGeQpK5TdJ3z6gr28nc7sFKHIG8tx9aM9nAy12mV2pN9KyMTmyCr/LcQKw1fG6mw4ekFTBRrLo0Bl1GfdW9nHeTWVOAI1VfZeNljhHaVFRMc+NfbhAObHrEjvZzau6uw54s3J6OU7qH11BDRhuyPUz2Htk+y6AQI3OZDMMHI2h6T8aW9ARksku/8yfgaZ4A635UJLOsOTtyHQl+3ewxm7WBZLZIMMG8kjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9YQq9BnmremCFACWzsq960yuD6yioTo0dkyIE4ZHdw=;
 b=kORpQC/zYVPfbLVilw9PdkAk8JaQ0ptCUPNvm7xs9z6Z/6OkGtZB5qASifAJiZ3m3Q1VVW2aXK8VpcF/C1gJJ3ertHL8jkEnNI+kcQUg0ec5KKiZIuGcGn9b9Z+R2hSUjtH/ZkLLMEWujGaPbUglfp/EzNIrEbC+m307cSStR8AWH5v80LCZddPbed2CodqXlhgnC/gVzw4NnWhPoZTIlA4MoLvN0lKokVNSecopnvfISAZlVB1vJw3YCgWwZsNNTNwe9LZGGFd+7HCCH70768F0Vkrjz2ZwzkQaeoPtbRuSOk3dV6tlJw+DXQWZdRSt7DSxSOm50KP0zdRwNyqVOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9YQq9BnmremCFACWzsq960yuD6yioTo0dkyIE4ZHdw=;
 b=kemXL4wU2l99bkejkqPcDGxAvmjx/6C24xEcb9XcpijZLSf8I1wbpYOD88OwNY2vCFPy+j0QY61TWPT34Nlr3w7wxxTdStB5zu4KynuHkGBn7FqGjj4yTH0Tog2k0eFjUobX0U60NjI5AMOXepSFaCZspHOiusVgagMV+R3XMpMdzTr/5u0jsPEfUcL89Bi5KGc5QVU1S3r0mqnJ7Y7R50o/vZiSKM5PjWGppVnHRXZXUcxFbb3JpYF7geOlAxDTkvibT661e05esUMeVB4NRy4xcaKCFd62puiKzF9WtM3q3DMfNe0IPZOA9JjvWhu+lEU6mHJj94ZwFM5FBkHGWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by VI0PR04MB11614.eurprd04.prod.outlook.com (2603:10a6:800:300::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 11:15:16 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 11:15:16 +0000
Date: Thu, 18 Sep 2025 14:15:13 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 04/10] mfd: simple-mfd-i2c: add compatible string for
 LX2160ARDB
Message-ID: <c66ntgflv2g22bylqac6hwztt6ljmjl4bgdwwcljs4vssvzr7g@4uwyzb7dw4bu>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
 <20250917090422.870033-5-ioana.ciornei@nxp.com>
 <20250917092006.GC3893363@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917092006.GC3893363@google.com>
X-ClientProxiedBy: AS4PR09CA0018.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::6) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|VI0PR04MB11614:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d87f6be-7427-4943-d6a8-08ddf6a4a511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?huEIyjXFRmPpbHghLHCbs6ke7B36nM26ulKJjZbiLm8Mz4YAlsbk8+s7RbOV?=
 =?us-ascii?Q?xuuhE2a6SFdcqOSIuUiXYoW0CgxfbWFopmuDoO5Mlt1/L3PCG9g5pbTAMraw?=
 =?us-ascii?Q?i5Qm6DisXTPBhKUM7rjR3x62aCXWy9bsdD3TUaW3DTtTMZc18Xn0MiGNJrok?=
 =?us-ascii?Q?JY9KJxNTIytLMQiGusvRg/WMT383oT2m5ExKZtLHdj7hjRUNsnK7cmN8s9f7?=
 =?us-ascii?Q?OBhHIXDPpmb80fK9m12m/qfgwrOrXPel3n52c0nLxJDpPq8E9Wfz+ODQTqih?=
 =?us-ascii?Q?7OtEadpnTudCzGuji+WxpUJVbDxXLMVNwmYQuQf9EN8sIyyUgbnaRnhvGzv5?=
 =?us-ascii?Q?/oH6g1nripE8AVT4y7jA2NU5WA5U+gTy+wlh/XyvE9eHF0w19OMlakMxgCt2?=
 =?us-ascii?Q?ylHTWLgwo1astM7ZqhkLG42ad2c1t9iCxx/g7s9fjEd0a37ZDZnoR0MpDNcE?=
 =?us-ascii?Q?odqTmI4J0keFFWGPCv2KBKuGDccoKG5pzdofGa7h1tUNIXcisNwC+q7+CDAD?=
 =?us-ascii?Q?6pguAuN2rHZONiGKB7s6pmajeI8ybA4HkyGJay0pn3fMgFXZi2NEL5GNlehB?=
 =?us-ascii?Q?Q1/VS+mm9ZjangeOjVNH0LCnuDivlAl8eyo7284JlDl1kBPOk8BawT42AMze?=
 =?us-ascii?Q?yuQukkH8/ZH4vhPOX/3JbCo39B2M1GcAxvW+yxvtf7OKxCkAz0WZVLA4cHGJ?=
 =?us-ascii?Q?Fofr24xxOB2jDnDdxLrHde2hBnxUeBQjcvBRvRnrWPY1KzOy5n+bBb4NC2v5?=
 =?us-ascii?Q?UDzXuxj1F6Df0svLaIsrfiJ3BMAc/jH2t3Jv/MiOCSzW7r9LL/7EUQmrOxoX?=
 =?us-ascii?Q?h348mLNwZKzZ6Rrg60Gi0EA+zyKT4uzh99YH3qcXMmchbFyELwHUrYBcg9cr?=
 =?us-ascii?Q?x21jlFmeiyFZXqRLJ51lXRL51oTJcKDOZFOIU8iJCdxHme67mpIKlo65jgQv?=
 =?us-ascii?Q?zn+x9aGDfIGVf/cPDNK8S+rrqDkRTAMM3Ri5h3E4HelCweB/LwuvBTG6LPNp?=
 =?us-ascii?Q?xZEpEs0MyExGqyxf9WYHjg6Rpvv6bIG+BRLF9sKqEmbNl+1MbkfGfxHkuDMr?=
 =?us-ascii?Q?Vi9rk2piIn7ur4cWYcfyzhUzlcRT+6+T9+L982QEKSMHi8UbX1GscPJWke+j?=
 =?us-ascii?Q?xTMBLeXfmsUsaI3aaBhtqFZXFcraqb3IXSd8uRKnvWUVCaVz5e70jmJgKVGq?=
 =?us-ascii?Q?L+QzzA9IEVOoq3iKlkqtS3zMAwTXho0RCeSOTMtwpI+9wQe+UtINOJYEPESS?=
 =?us-ascii?Q?/YT+mNv+ZUajlYtDZuxUfgkv8+Kr4xUAnLMc9mKh0HyU34PNuApLsYwoD/vM?=
 =?us-ascii?Q?ww+3Gn5uxETgvFDHjvmdwaI7y3m8biegNtKNODtEFL9Kx2q0GuX/Lq0cMo0z?=
 =?us-ascii?Q?EgG/yGKFZZiAuXaK+FcO1/aVHF2LuOQo9fmorB0+vKgt4HM/v0cRXG0J80eN?=
 =?us-ascii?Q?pl8M23c09AY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XSsazj03WuVuEGDXFtQwS6LLw0quNKxZBIp64SrpcdJCdcUIhdfzFIvg9zD7?=
 =?us-ascii?Q?vjg0tZd0ZS2BHVO8P1qEgcjshqN/efindZC4/AGoButnZFBU4BdjDpUgio6O?=
 =?us-ascii?Q?ViRCPGdFrLgt4f5zGgotH6GTew3pQCEWSc1/P/k7gnEIUCAmC79co1oZ6wu0?=
 =?us-ascii?Q?Ld5Z8x5sL05YEnKjc0AL5pbvDIt76Ggp8FvrZCZnJHe0YAK8nWt7bIOknxQt?=
 =?us-ascii?Q?J2OoFLm2Z240wqeUAUeUOyeWFogkmOcFyJQuVhw7bK3+tbisToqrQb3xJCGC?=
 =?us-ascii?Q?gpzmHiwcCtI4ChX5nak72/FGcc2DNTHUlHlKegfo9LXnHma771Khib3G/Gor?=
 =?us-ascii?Q?SD8SEto2X3hbW6NSqkhH37Y+1ViJiMH37pAxrjvVi8fap43CiUWEABAI+c8p?=
 =?us-ascii?Q?M/7fulLEx7WWuChuPqGRGt/Lcho+yqrwAufMOrGC8tHRJ30ifgBJkHM2kPNJ?=
 =?us-ascii?Q?BkJxxuBf7ByrwgPED9wKJaSjMAhghm2uZGFnRpKXD/XFlYnaypsbecFSgrHc?=
 =?us-ascii?Q?1utRGK0xXXVSVr9vnqY65FtFhXr4u4wFguCcPUv3dLKAnWxAr/+/rhzZytjR?=
 =?us-ascii?Q?pn5R99U4c5cPTeus6n+YjH/juxQA6A4QB8F/SK0NgocwZbXlpPeyQpW9cOyf?=
 =?us-ascii?Q?Ucd8CQOaFlC9Jn0h8BcrAfibFUCiLRfCoe44x4ALXPc03Ww529EZGF9VEh8g?=
 =?us-ascii?Q?w3bz68y5PnYE/kwOuyUUevAR7mrBqrpTxal1Sh6wIaLJaL292WzlNYtt9l73?=
 =?us-ascii?Q?+gb/L+vItfgOJ1CleDZkvOj03H5EP6GCOKY5H2g14X0DUgcGmAjPPeeT0Mkr?=
 =?us-ascii?Q?v7rgqISZSAuwpEMNnHuC74yXI+QLKMBNkRXrxfOgyPPPU0fB5Owk7rrC0OCU?=
 =?us-ascii?Q?6q+6cR95uuabVy8TfnPY7rxPMU+HRO/KN9fKnQvOaAnHfgQ8rpEtwO6f0WMx?=
 =?us-ascii?Q?AV72xuMF1glapdYPt/yV1DnporWNB3gWlTtgj8Slt+SdHK4cbU6oVUvFBdbd?=
 =?us-ascii?Q?Li7eLIh+5urwwzsg7JrHoVsstj8I563G57q5M+BD2/Qam78IbCasxsAlAt25?=
 =?us-ascii?Q?wgHP53g9HXOpNmFrZjpaZ5TYchGpMuYDhdeo75Q+geQxAdl8+a34SdHXRmen?=
 =?us-ascii?Q?mdh59u5Xp8xUY177g9mSeD0PIXN53sEiQrG3up/7s8AC02gEzLuUk3x4LJHa?=
 =?us-ascii?Q?P92ZAwOs3Ctv4XMioPYLIFwXk7AEt1K+bB4xrnPcqrU3aN2tR9Z3C/bBEgUk?=
 =?us-ascii?Q?Oqe8BHT4o1hDAvhd6qBRbAES+mX31Ro2cHbob8Mrn8whP6siK/75Q/rZpfWa?=
 =?us-ascii?Q?ZV0IR2MRRxYlsh9rzz716qp2XJVRt3eEKk6O+lBlazI3Hg1x+3ddnYNqPtvs?=
 =?us-ascii?Q?pC1YAs27IQj64BY4HGuF8So2iBCjDaQjo9LeQY1HA6nuqoy4rRQEhkazQerS?=
 =?us-ascii?Q?MOOy43qnkLf9aGaCJGdzFZyWWNEACLNELI1t2epZZ7WI5FhFigvffUZoMmfr?=
 =?us-ascii?Q?/AV6azKLocr91l6djEEGCTwt8OSvgnx4n1w0Ub91WkYxX8ycHzdNbG8nQlNM?=
 =?us-ascii?Q?DbxBmrWb7z6pL4Zp2XmBW0CmSOwsuJHKgTaSu0EK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d87f6be-7427-4943-d6a8-08ddf6a4a511
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 11:15:16.2989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8Opl8C3vnB+iSy+yYnGg5rffduvPIauKyBZeJfVwJiZwkTY/52e4gZVrnPktMciaqCIV1jl6f5OVseWaxt7+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11614

On Wed, Sep 17, 2025 at 10:20:06AM +0100, Lee Jones wrote:
> On Wed, 17 Sep 2025, Ioana Ciornei wrote:
> 
> > Extend the list of supported devices with the QIXIS FPGA found on the
> > LX2160ARDB board.
> > 
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> > Changes in v2:
> > - none
> > Changes in v3:
> > - none
> > 
> >  drivers/mfd/simple-mfd-i2c.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> > index 63ac26388860..6fbe85437d8d 100644
> > --- a/drivers/mfd/simple-mfd-i2c.c
> > +++ b/drivers/mfd/simple-mfd-i2c.c
> > @@ -115,6 +115,7 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
> >  	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
> >  	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
> >  	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
> > +	{ .compatible = "fsl,lx2160ardb-fpga" },
> >  	{ .compatible = "fsl,lx2160aqds-fpga" },
> >  	{ .compatible = "fsl,ls1028aqds-fpga" },
> >  	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
> 
> Please keep alphabetical.

Ok, sure.

Even without this patch, the fsl compatible strings are not in
alphabetical order. Are you ok with adding another patch that fixes the
initial issue or do you want me to just do the changes in a single
patch?

Ioana

