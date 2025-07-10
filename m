Return-Path: <linux-gpio+bounces-23108-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB1BB00880
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 18:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14ED27A8842
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D5F2EFD8F;
	Thu, 10 Jul 2025 16:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HOI0UQI5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A6779DA;
	Thu, 10 Jul 2025 16:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164789; cv=fail; b=J9/9f/A5gfDLcN/uVyKo4PoNyTMg6mwqi45pjm/2YoYQmCh5uKIk4XoyJW4m7KKi2etxyx99eyfPWpWIkwr0YQ/M9uelJY66xsCZ7xPIpDadW6QzmeJq5g/9DklmMOUOLtmxNMVHxjyBplZoyPO+P4XnibSgksgXg0943HqTL08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164789; c=relaxed/simple;
	bh=kl+k/h++1wEbds2cCEnWFVUM7yIEKtOb3XPByOb2LTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YqW9cWZSqhk86WPbNqnd10+Uv6+uX9e330lu1/gn7yCqTmsnon+e+4wvosblMj/qBenAm05XTVrj621mf2oFRdzSOZUoxrCvTFKB5R0uGtxM7fZQ98fQxIfv2ialC09o3D/JEg17QiviRnag0GnLm7J/bpFZ8VpV8byCJdt1/b8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HOI0UQI5; arc=fail smtp.client-ip=52.101.66.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsyUajEocngKpbiyFkx3AAhW+lu/ZTiwDE6nK+O/JjtLlIWW+SVmdMJvTq4cRZCZ9IFLXfKkIA7xbC3lDyvuNvg79bCFIFY8+79BLfzW+T1RSXuwu5eeNqi7GMLUvjoUDvtZ65Bb440iudBs4XtYcWef7UOL5dsEuYoW+rLXnUzuJae8iSqcabBEdvkUTkzME77Y3nAK4rEEiO3+njRUH6cI2XbI2E+rc7ufLuUBf/9BFMQxJ4gdH2/APdtsNLrd4DYiJ3CFAwnJTFznspsMbR0E98eMF2dZPvsAhFKLAX4DzEVQBqoFhZKjFx/Obuz1p2f1WIsIukhv5oxNCHiOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofmKpim6RCd+qbpJYjFRFbM9z7Wy1xww8DUorSd8A7c=;
 b=FEEQ5/bdNQDvMoV1X5IHA5r0tSy9+eGJ+jMDjtxr41pwoTXc4uT/ijePH1AHEKkZfrAuhvy5IHAb+lcmkTr+67J+D+MVKRA9GPjAA7jzXIH5x+oO3OHXQ3+mDNBaTi0JYT4p1R2BANg5clHQsYzJhaCt8ZbIaTDc/ZJPS/pUaJdDX2LubtlNJl3sucIPr/8iefDDx1KJKCvRe/gJsKBuCGQ6jJ4IbsZdkszgZ1eYE7tKTr+GGOICHLIIofbPFMUrXZfEl5F3Avoq/yzA9ihrs5o0xZ3wj0ALC6gdE7WJrYBiPSP/IioLG65Cjx5kLBmIqq3bbjfPTZDWP63RYZcZyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofmKpim6RCd+qbpJYjFRFbM9z7Wy1xww8DUorSd8A7c=;
 b=HOI0UQI5WCMWtIUNlbGi+EcszAmFy0f8mbDZPHA1iEXbwIFzEgjSpDNGiyPny/zi/nWRSRnXfhFahBSTTVNkpPKkf3Qc/EfSbKsO93SkXdgQiEa1Eg4+agUBEVqv/5r3uefl4O8c92xzkN3nMVGzVlXctBcBvisQLo5PkZlTKsIeTKcXD80cu2McU1A6OB/lB2sGMrC0cJ7p10DQFZW/0sVxBNqK3uRr2WAILSSe1I/mDauEuCm59ZRj0+WvYpGvTnO4vXnBqmzWudwn+rw14vBQ3JSGRzYfW2zWwjhrqcODYTlvAGpgtJEtZDruTC9LRSuXaTKgaD1T3rZj+zpvmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9429.eurprd04.prod.outlook.com (2603:10a6:20b:4db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 10 Jul
 2025 16:26:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8901.023; Thu, 10 Jul 2025
 16:26:25 +0000
Date: Thu, 10 Jul 2025 12:26:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com,
	mbrugger@suse.com, Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com, lee@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	ping.bai@nxp.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	srini@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, s32@nxp.com,
	clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com,
	echanude@redhat.com, kernel@pengutronix.de, imx@lists.linux.dev,
	vincent.guittot@linaro.org
Subject: Re: [PATCH v7 06/12] dt-bindings: pinctrl: deprecate SIUL2 pinctrl
 bindings
Message-ID: <aG/pqeqMBEUDTmaP@lizhi-Precision-Tower-5810>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-7-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710142038.1986052-7-andrei.stefanescu@oss.nxp.com>
X-ClientProxiedBy: AS4PR10CA0001.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ca4e78-5a4b-4817-571c-08ddbfce83bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9uRP0FTQgGBy7Z+BHhg+/qmoD8S/pnNhdMX8UPIYILuZ2/PgVko8JgYx1H4q?=
 =?us-ascii?Q?5eTsa3cnw4BVmM1QMwI/5g9BfnafEJvMbTn4gF0qm+CwF10UEu18hiwbWleK?=
 =?us-ascii?Q?1qPmzc1vTTRAd5xzjv2strypwABDE78hhSImCqaodQEHGOv1dUQ24dfAwstz?=
 =?us-ascii?Q?ZpoZq2DnMYB7x8BJbBmBXCosSdW9yDRyXdD5neA1GwK+3QjAFBS0njOOnRZn?=
 =?us-ascii?Q?oGSW1ZXi0q1gN98ygbzc9R8GRtxeNM0JeK8BYtCgYSls3/ZX0SDnC803wEO6?=
 =?us-ascii?Q?fgFdaLbx45DA3uigHWLIKEKh5VD5oQVoPvZzDDbKSRYtmnznHGW76MjQV/T/?=
 =?us-ascii?Q?scyj1nDd+Rw/eX+/umgxE9F0Dl5ba9v2a1ythw066NawFyQ2mmWWmb1Q/tJm?=
 =?us-ascii?Q?D6Xo+4B75XuDVJruFTxf4zBEC3oR7q/xJyVTea+sdZ7+bAm11WeP2U4NhGiA?=
 =?us-ascii?Q?m+l6F89ydQNDBlUZHuQ5heFlxCdJO/3B6lBn9C4NvgCxtG2j4WiOZmuwx2ku?=
 =?us-ascii?Q?zHE5CowobmRFMBj4gRRRKtyXeH7psrePu5pzUnuz9050rfkPJtEDmWfWW5t8?=
 =?us-ascii?Q?V0235nRIPaukCmji6j/goxJsK+NpT6Rl7ZrpThi3JQd6RAiQqEUwYR9hAQn4?=
 =?us-ascii?Q?gsQylqQ1YHRv3a7KOkt/a9cqDNNUxExA8oFemntE0sDTD7KERNnm8WNRqTO4?=
 =?us-ascii?Q?OuUIh13qte2S5kaToYlU95jU5gI2oZUdJdziT3uKOhY0/41vx6gRKKdgXnUT?=
 =?us-ascii?Q?E+IpMttPgH+IZHLTMb15T6wJIiq9fnCjq17rwfeqCsF9fmpC0kJy0KoID2KF?=
 =?us-ascii?Q?CCj+HA2nJB9WqT45FFlBg6q5YruNPWn1fPdHPXMi9F0d4n//ScoFtHAwy5km?=
 =?us-ascii?Q?oF7IOTnOxLtOTQjvBewM9H+4+WhnuljDTaadn68aY4qi4BnUyUEQYwsjRedp?=
 =?us-ascii?Q?1rhguJK6I/HLnaM91SFrr4DNKUqrnn0rjOmqBJC5oLeWDwQe0bDVP/A0UWSu?=
 =?us-ascii?Q?PGrTo4gXS9WrxvSbUcMdKbioGkxSybl+/TTNsh9pG+DKCS9cT4hIZ6ka8e6+?=
 =?us-ascii?Q?3c4Q9+NwWwvmaU60EyKs0fT8fbwLB+h3jbRlUTGPNV2Egjm+uklbT2/Eeb/d?=
 =?us-ascii?Q?VmWtj+PVKgTqJe12f/qn/OVRjkdaTdxdEa+AOkVmyarD8Bj352zZKrYQ/G4L?=
 =?us-ascii?Q?29j09Wt0ppLdtrGnC6ZABSqbegc0YseoWaIJH+cqm3txspSHGgUehZ0mQyR4?=
 =?us-ascii?Q?ZvAp+eOBEbiVWnxrPquDgXa3EBYjDpQpdDPEEfc4Ub8xb+yxpEjsuncLaqxV?=
 =?us-ascii?Q?4KNLlaUAs26c92PsGSn+86jXsIerVGFX4psB3bqsgtW+8lSLwY6ZXIPGolLF?=
 =?us-ascii?Q?UeHOcHuJpx4Ck9YDnEXZ1Zk75G59kMwM3FKE3wveJfOO6YCcX3Vuyfo8SNnV?=
 =?us-ascii?Q?4BjRX0at2PmH65W7gRL/GzVCuv8QGCqpHZWrBB2GRbUqZXQvmqOhQCiabMOz?=
 =?us-ascii?Q?kpKBpCN0azvHssU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ltq+3Mo4dfHh+OckCHU1Pw+pUiY5ZjtW3LCeWbDUVOjiK9T8oyCEXAUzWKNs?=
 =?us-ascii?Q?PpKFwrNIxGLComBklmzgTJ8Dfd+feNmgjQdF942b5YUsg01wwcTLISTF7Be5?=
 =?us-ascii?Q?q+xYKFAr7R/lR603wNgsWvq1cNk0ptS782RjBr1Gbrw3EKelIcj0D+rS0reC?=
 =?us-ascii?Q?KE2JIx3ahyP2ZhhttPbmf33O7J5a48hGbwtjEcOYwqI/WMnxLYoGTr38LLSx?=
 =?us-ascii?Q?fT+fyAa3Bzli1V+OE4bsnIgE4TCVKg2ezbt4sPzDNH4mhNp3P35kQgqkqdDO?=
 =?us-ascii?Q?ux1rYcreXF8rxaFsgmfEZuKub2SmTv31uz7alIKWTXmuzQ1ROY404wn+aVPD?=
 =?us-ascii?Q?/2BkuT0GGzFxiTnfRcXKlIvEw/eoYoOqmSGqIX01hJLbCoVQd0muZHmVwcDO?=
 =?us-ascii?Q?1Q4Pu1CoHuM1X1Kf4SinNRTqktq2qpqRAeclGsvloelnd/WKVDxjF85wpqw6?=
 =?us-ascii?Q?CvLB/PLTBXBTU31S7kFpwvI58FcYeXTo53ALhal8A7gmcGoj+3mno7HpqsVT?=
 =?us-ascii?Q?foiHcCIZvNxAT9C/isqQSkCmxmrhm86VQNo2w6JslICl4yqGxu45oGJ9skEj?=
 =?us-ascii?Q?Ji8KsrhKTxKeaWp5JWjxjX9ITpaKQYcisIhC/AGn9WDt8iwiTvYzUFbqDnlz?=
 =?us-ascii?Q?uHgzOzU+oD/mxzsd1mNWF/VmjfK+qqtPpZOq26E0UHilGjFxlHvRQYBxltMo?=
 =?us-ascii?Q?pycRwEWrBsfLPFrKWDcXjKwnv9/j+Z3PdrhTW3rjy97OsiB0J1XBHQIJO5kf?=
 =?us-ascii?Q?h8pcI5XBC7ofqz9I2cLjxAFRbiy7dhhsw/4nSCJLTIFIx1WqH3mNB65ToBe8?=
 =?us-ascii?Q?j+YtIaaVbllnHqt40UUrVYuQe2MOphc3bIT6qevpjO1cW5hqNJfe34s44fwh?=
 =?us-ascii?Q?3vZj5o4l/3/5fMVeGb6Fx/iaYGZxV9A4o3xhUQuO2g/xL4jvqHaVCEkoUItN?=
 =?us-ascii?Q?YyV61M7D+WZ3hnJMcbYf+RI08X7Ulc1PS1EbHHD4qBCzOW66UzEBL8nItEQ9?=
 =?us-ascii?Q?WoXiA1PjJZxp2iibMlLLwX9iERcBZ84WYnLygOlWBwR8tlfdlo85wPesEknj?=
 =?us-ascii?Q?4+Zz2rY8h60K65PDgrFpDE1Q7FKD3wpHetYvffAGDbLZjz+hVpWPvMahp9or?=
 =?us-ascii?Q?wCscCBJmCXFt/E4U723kr0vE/yIZFrVMHAlUIg9fW+a+cM+JdHnyae6Cedz7?=
 =?us-ascii?Q?9M3zuVvIAajgTJ2ObuxTa3H+tLK0K1DlHAsMTwtU/LhY4d3Rb6SU0+Fa5Y4x?=
 =?us-ascii?Q?LIDJli4PXx6dwwhSDruTpOeFtbsCBZF53kcYIOhz5eKN8+EoyqSleVMOPcJh?=
 =?us-ascii?Q?qeNM5J0WPIm5BsFJPTGXcrouWDBSURN9wC54A98dVPRqXirvk8sv0hoYCej+?=
 =?us-ascii?Q?iCpCjMBztACJgD3WbwmA23Kebj4PIJpSD5DfF6s+1yxDhj4LE2gwNHIry18B?=
 =?us-ascii?Q?1W3nOpx5Xi5hD72ve7q31h2Q1guhbDxQUs9aZenOFEzqVON4FAw1zYkODyYd?=
 =?us-ascii?Q?tCOxXdLt7Zg8HViXzbivIZpmNnLQemMNxkTfSaYsweL5UWaSDege9xxATAnm?=
 =?us-ascii?Q?+Fm0tOnpn4VRoSSm8jWW4YvIgI8iixJGH6jO+gq6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ca4e78-5a4b-4817-571c-08ddbfce83bd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 16:26:25.2417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oo+yp6i/XuVI7bli32A2Gr31fi3oS54RtmgLrMUbN+zriv65GGXJg7ntV2cIRc7Myaz0Jnmr9JNBKT/Pt7BpTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9429

On Thu, Jul 10, 2025 at 05:20:29PM +0300, Andrei Stefanescu wrote:
> The existing SIUL2 pinctrl bindings don't correctly describe the
> hardware. The SIUL2 module also offers GPIO control and exposes some
> registers which contain information about the SoC. Adding drivers for
> these functionalities would result in incorrect bindings with a lot of
> carved out regions for registers. For more details see the discussions
> on the community [1] and [2].
>
> The existing SIUL2 pinctrl dt-bindings will be deprecated. The new SIUL2
> MFD dt-bindings are to be used from now on.
>
> [1] -
> https://lore.kernel.org/linux-gpio/20241003-overall-unblended-7139b17eae23@spud/
> [2] -
> https://lore.kernel.org/all/a924bbb6-96ec-40be-9d82-a76b2ab73afd@oss.nxp.com/

suggest squash to
[PATCH v7 01/12] dt-bindings: mfd: add support for the NXP SIUL2 module

Frank
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  .../devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
> index a24286e4def6..332397a21394 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
> @@ -11,6 +11,8 @@ maintainers:
>    - Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>
>    - Chester Lin <chester62515@gmail.com>
>
> +deprecated: true
> +
>  description: |
>    S32G2 pinmux is implemented in SIUL2 (System Integration Unit Lite2),
>    whose memory map is split into two regions:
> --
> 2.45.2
>

