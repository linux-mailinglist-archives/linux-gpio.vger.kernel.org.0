Return-Path: <linux-gpio+bounces-20675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8067EAC6CCD
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 17:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36275174BBA
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 15:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351EA28C038;
	Wed, 28 May 2025 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nBfiaGUv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFCB244670;
	Wed, 28 May 2025 15:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446083; cv=fail; b=Wx8Ev4ayE5NUrEpPwnxBovqmY43o748bWekzHt2GJzhiMcd5Em1JVB1hUs8N6Y7dBoGyBOhY5Lv+Of2+08tdudiz1sAFYAfvra83m6YygQY1n3/8jsPIe9uqWMDPOQ7RHssY70eiLaa4KeSjbiJ1wbXecn+8xD+Lx5/8e0YBvRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446083; c=relaxed/simple;
	bh=IZfbzp8o0VNvRPnvgazQBCF0BmyViD7esAa3exNJp2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pLsR3wIQOy5R/WlDtE2Xr2A5hoX4WMVCpw1sOMNoHqYgjK6BZSY7iRaebA+MMYekS7YREJXKGsMI7svlnJ58+XGuNmrlcQHAJLITjiObpgRBjZvshAuIbtepPckXf4VZmsollE4iMO5mzZlpHXLypBb9p5Jjx2/NUtmKnZapF6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nBfiaGUv; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piKNaAVWA1SYblKQBLxIz97FF7O+lLXaSQXXMmcJglz/VnuQjitxHqNCRiXvZt7VMHamTp51rx7C/TxB/7y0G+mAWGrGGVVnD/OP/Hby+QvGP6DdRaG5pABj0DNGAjDX9Hq0f3HvRV9uenADNX+07MLbTiPqf4qEOlSS51Efl2beGN3n5C1nxqnG9My0t4fISwHI/9rufsEQiKv2ULhjL7Es4DpFLuUccL28qQ8sioCxqY7zbgZKi3J+CGozS17jxuupIT3bYkcrmAHIYXZubP5oiVDoKsa+BAbxrCf03EqS2ap/hS3KudptF9G7oEDMWa/OcU6xnd7amTWM8JTMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uoj0Eoc/onIkSqwcJQjQf28hxx/VRihgktbhWLq/RgI=;
 b=xUFnVgDf9PYTv6vQuJCW+DlH9cPzecUGkdJhfITwm03Q1Ef/V1bhmTRDRcW1uWudvl9Z6RjUrCGZlqzy35bsKQ3Vpc8Wfz+NPupE96WAD+LzLojKvYO34UOCP1Eyg5kWdgYSSWia0ZuAGLow/97b2GJbobX4HEV+AL+rcZ5QaN/63YYPRYYR6JgZ9fHJaiYUXKLxO9qvomIts+gmDW12vO/pG1cY5k3SRhcur9dYNxerrRambQhphxwvV1kyDqqjJDO9bW7BVs9wdct+M0x4jvV3DjC1UDvVKwHeo05W8qk+V05aBTn+iYY4F5f9737VEQULpXIiEUvMebZPlW8uBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uoj0Eoc/onIkSqwcJQjQf28hxx/VRihgktbhWLq/RgI=;
 b=nBfiaGUvWxAlcc1k5pfHJzaZ1xyyGvFwjzsFaDWG/DxcAYnFImvuLvNlpUd0CxyjrXkrcZQsa1/ZKJcjLSUAzsBk8i3lCfF1p20SwEasApOA4HTmzDKfs4f7G5udQd6VM1wVkGGigOXYwPB/F4PVuttzPcpTHtd7jzxbLX0yRug55KhLFjJL6Fps5QA10/sIT5Y60VjbqznDYzs8bx4yN2ruDYM/xwC9rUXOV+ldB12wRHeqKZMZD3EIYZvrZWMHTvaVUGkq+1XOo9JbNa+6gMhqRbk8hMykXKL/xFX3miJEKwgiYDLxdH69WrElfPocowKm91NAJ2X2sGfNZdk5pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10959.eurprd04.prod.outlook.com (2603:10a6:10:586::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 15:27:54 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 15:27:53 +0000
Date: Wed, 28 May 2025 11:27:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: gpio: Move fsl,mxs-pinctrl.txt into
 gpio-mxs.yaml
Message-ID: <aDcrcIB1zBVtxnne@lizhi-Precision-Tower-5810>
References: <20250523203159.570982-1-Frank.Li@nxp.com>
 <20250527181803.GA877374-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527181803.GA877374-robh@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10959:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f6c5a78-50c9-417b-b75c-08dd9dfc3691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?15k0xqApvRyTdkhA3CLUZPKqjfeqcD/F1F4nhPmd5pH9xsMPrYox0ljj1qFL?=
 =?us-ascii?Q?CJ67IstMtUVIH1kNlo/TFZX6Tmfkto8OqpDBYtIvzD3Z7m1wfsr0I0ZhNSPS?=
 =?us-ascii?Q?AOPlAMXceNwwBBreh3Y2eNRHNulSuLeSE7baZXqRxGJL0JTeQgXQHgcyutYc?=
 =?us-ascii?Q?8LK1UF58ZLcaypSpdi9PIDXjZoI8u9v22oUYhjMm9XkcPd420lkDtanJZuMd?=
 =?us-ascii?Q?v73c35kcoM1Lg9iRXssV2FVf9lfcNdQSw44JlV/LJF2WF/BbUvMvlNKBnpDM?=
 =?us-ascii?Q?bo0gvbFAT1n725uOuFxew2ZuMWMFP0Y8ZWq1+SUKczkO1Ovv3sDTtRtQDbiK?=
 =?us-ascii?Q?2Tc99GpZNtCKK0qhzfZLl8YLTe8wfMWAJGoABgSzmUayzCk1wuHmFjHCVqxX?=
 =?us-ascii?Q?wWrDeekmRZhNmqsfQAzcCr2QqDVKUn6nMkQhVgB4Fj4aoGDY77ftiXGD1Zgf?=
 =?us-ascii?Q?KnnUwphqbcqwsJMOmyMzK0fDy6xSv1iCiq3EYViayd8tFrW8qN4MoTcLGeuB?=
 =?us-ascii?Q?eevnHzveC/IJbCvW8eAL1vi7Hofkw5iczfYzzAib+g/CqfObRyX4lSHueRZ+?=
 =?us-ascii?Q?BwjobkhK6tFQWBrTtb4MIjH3qgGDrqf7A9MeMsYkbUhAlcaMMjaOmogFknm2?=
 =?us-ascii?Q?abDn+Vz4CQANWi5jSA+yM5bTn80MxMmpChmzFxKh69bwUbY1tRGsDsNTWtLz?=
 =?us-ascii?Q?CgoDuTFVKNAhM4aeEEMZ4mMn67oEU8NV9ArVt8ZNOujeAfDQv+wAmrnrl9dJ?=
 =?us-ascii?Q?SJYIwBUCAMJz4GrdLZ2x1VHrTzhFQugkP+GtXDvh8Ur0MPpWr7DF/zd/00Xc?=
 =?us-ascii?Q?2XzIGWBUDC68YaZyo6ncd5cKf7LnSZUJUMCiQQWONHYGtFRpir+lhWyRsj/e?=
 =?us-ascii?Q?90bP9a7hnirhktH7PtMR57Cf4TBQgXIc6IHHKN1q2UlnUDjast5eDbrFVMGk?=
 =?us-ascii?Q?KhhDydcNkwJU6fZnomMX5zuaHD2SH4lBMIcSrWtmsGhF/R/51r9+FBPA7rqw?=
 =?us-ascii?Q?PZDGLIQaIBjH95AA9gmE+TkxFKgWRUrWPB1ykhpTXdwQAmRzEq8icDFuZd4c?=
 =?us-ascii?Q?ScM9TRNXCRzTCGHpT7LCUqpYMgVDN/O3FRabgm+16R8CysWudfHtRUYtrfK2?=
 =?us-ascii?Q?PGOk+Z4GS6wuk7WYGei1vYpBcUkedlX7jRgHZxfG0vFlndd3HOiTQ16K/1gr?=
 =?us-ascii?Q?9YwvaI8lA28SleMN9rG99X+xKfmGTIQfA34gd16tIAetmaQRG7xuiZwvbTTF?=
 =?us-ascii?Q?HNWl6aOKtm4c1QVpMd83WtYp/5Ca+vwUWnil4KVhialdN7NLnb49Z/Ee/Z03?=
 =?us-ascii?Q?4A0DkroA4y7NHQNzuWZNfztXivRyK8UHm0JMufqdPzXWShC6OmFwe1WcUoSP?=
 =?us-ascii?Q?X2e5Gi+KzPPARmG8hxFHbRpMoABYZdON3cKX8zjvuYo9EqIK6BA8S8xWDohD?=
 =?us-ascii?Q?OHDLI6VTb5svdHDWvYiGdK+k2pY2xLVriMqqeNTm2t4i/2EduBkzDA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7dbsY+SZ0jAxBEZKrA6Wqe/r9bGV0OhBpK1zPISt0H2Bbdx/jOKXCGTf5KUg?=
 =?us-ascii?Q?ZvPhWclTOd7bNexsPzc3mrVG8BidSJ0LRwJqgitNZ3JgY/RQtqACQs4Gk5Gt?=
 =?us-ascii?Q?bPBXUPLd/+9wNixbLOFfX2qHjXa4ubuq/RSeZh3rTfxugBLpDqveeaCXW7o2?=
 =?us-ascii?Q?9SjJND2gN/YEmzh7D+ZSPZ8/xKpvgiheHqAIQjp2uHsdGAffk+wlZZatRVz8?=
 =?us-ascii?Q?+/34ZxdoPmwpbJC9i81Iv2c5qd79rrzmpzAGjMkkvVT3uPh0EwfESTxMYYnd?=
 =?us-ascii?Q?PbK+T5VTog34J9Os9tdMcfWAxxfi8WXN6VIL6isXQZTIHyplIAiNu5BEivWa?=
 =?us-ascii?Q?HJY4Lg7Z+D8Rlhf97sggCrSwUlGvDRVz1IAskdQ91gWdNiHTXFkoIrMBKqqf?=
 =?us-ascii?Q?t7T9Ae189F0avmXQYQ7JE55lbhdKklGAkMc0UtjnMsAVo1V7qljr1mUbWgZB?=
 =?us-ascii?Q?xsIk2HvizYTELVFs32qgMznctues3bRxRFMeYbw66+IyYRizV34rE+X9qYlN?=
 =?us-ascii?Q?g2Oj8zjcQBCrb1LPNB/9fr7prod7ZhwdQVQsM86bVRMfPRcg6iB0hXmLcWVT?=
 =?us-ascii?Q?lSyJQYG+eVHg/9oK70+YN/L/HvYrrTHq5yDFadp6VqWNBHg+zeDdeu+lJz82?=
 =?us-ascii?Q?csFwYqVX6oqhHij1ni9cA371R/qgT+2DSk6krZzhk0PGyFeZkaOk2/dv4q6p?=
 =?us-ascii?Q?l4f6cqxmE+Fv+FD5M7cfVdJnnHq+lPTzadX4qW2bDdcJIUdt+lNte51yWqOO?=
 =?us-ascii?Q?hFVICTbdMF7YWu0z8/0B6/A2dcLMuWCb5b9hkYdEZrRcJJ4eyUtvvaBxBBk7?=
 =?us-ascii?Q?zHYkzS46nyIgPQcPnmi/OFIqpY9z4E9Fq+f4OCl4heOQMCkQsaA7yh7gPxtc?=
 =?us-ascii?Q?C8eYt4d3ydRt4HlohxtD2q0OHM3nGZOM9ht36030GY/OharbNSn3TeV1btyF?=
 =?us-ascii?Q?USb1C/2jIMsYtjVGVKH9rFYEOdEzBeLBbFlb8/hmed75tm4esMQCm93dCZNf?=
 =?us-ascii?Q?G0e//e4CAN7/2VYMALqZsTONfSiFe+H+Ucd2MF73OixkuNoTIU5GXrIKmeqY?=
 =?us-ascii?Q?mluGvSCUXC9Qp7MYYJmx29IZZqmGAE79UAIjNiepDl12ta1BOjahq5VZHjUa?=
 =?us-ascii?Q?Ti+0w6niJNu+1tucDIsORiI6wvGG6TTO5MfJIpM2ViqY3AmnG6+yMBoV0n9M?=
 =?us-ascii?Q?mJESdwYaDzNSGZbcDN8Z+LvBKv29ul2vOiTrFzLrVEuT/zP74Xg/7oWfHIIi?=
 =?us-ascii?Q?uVEcQSEayrDG4bM6Gm13zpylPPYmKndUCC6f/UU8ZP6F2POesFrmoe2zGPGr?=
 =?us-ascii?Q?WD4rDz6xBUZ2Shq7SNl0eV6m9VcKRygIVWX1OBODVEn2GQIJE9fnuJ+dL671?=
 =?us-ascii?Q?UTr3nGfSl0MzoMAxAoEeh7eI+/2O8lM7HXVimOxTQQ2Zse4CZGWKfoG8SOEp?=
 =?us-ascii?Q?PQ1sYqW2LDH/hkKth2x1FSjKi6QyH1Br6M7ug0uPTnDc17dQw1g+olIcggE1?=
 =?us-ascii?Q?gtoQsmiSM+bp2eVBJMfWyj8lbaWUvH2m4VGxqYJXwTqrE9rSIOa4PtkWS6RE?=
 =?us-ascii?Q?aUPEnIf1jwlAsI1Jo8w=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6c5a78-50c9-417b-b75c-08dd9dfc3691
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 15:27:53.0904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VfL6hp5tUTrQpbfyfQwFKY+w6KIWpGGPdcBLLgFjOurcB2ac1OMwT82ypF/1P6WdWzCyxC+oLXK3SHBCcM1IZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10959

On Tue, May 27, 2025 at 01:18:03PM -0500, Rob Herring wrote:
> On Fri, May 23, 2025 at 04:31:57PM -0400, Frank Li wrote:
> > Move mxs-pinctrl part into gpio-mxs.yaml and add pinctrl examples to fix
> > below CHECK_DTB warning:
> >
> > arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: pinctrl@80018000 (fsl,imx28-pinctrl):
> >    'auart0-2pins@0', 'auart0@0',  ... 'usb1@1' do not match any of the regexes: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../devicetree/bindings/gpio/gpio-mxs.yaml    |  73 +++++++++-
> >  .../bindings/pinctrl/fsl,mxs-pinctrl.txt      | 127 ------------------
> >  2 files changed, 69 insertions(+), 131 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
> > index b58e08c8ecd8a..b3cf4682be3fd 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
> > @@ -18,9 +18,11 @@ description: |
> >
> >  properties:
> >    compatible:
> > -    enum:
> > -      - fsl,imx23-pinctrl
> > -      - fsl,imx28-pinctrl
> > +    items:
> > +      - enum:
> > +          - fsl,imx23-pinctrl
> > +          - fsl,imx28-pinctrl
> > +      - const: simple-bus
>
> I don't think the use of simple-bus is correct here. The addresses are
> not MMIO (there's no size), and I would guess the child nodes are
> dependent on the parent.

This is legency device, which more than 10 years. It use simple-bus
to probe children gpio devices. pinctrl have not use it.

>
> >
> >    '#address-cells':
> >      const: 1
> > @@ -31,6 +33,61 @@ properties:
> >      maxItems: 1
> >
> >  patternProperties:
> > +  "^(?!gpio).*@[0-9]+$":
>
> Unit-address should be hex? If not, then another reason this is not a
> simple-bus.

Yes, it is wrong to use simple-bus in old driver and dts
drivers/gpio/gpio-mxs.c

It is not worth to fix driver and dts for such old lagency devices. Although
chip is still shipping, we have not board to test it.

>
> > +    type: object
> > +    properties:
> > +      fsl,pinmux-ids:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description: |
> > +          An integer array.  Each integer in the array specify a pin
> > +          with given mux function, with bank, pin and mux packed as below.
> > +
> > +          [15..12] : bank number
> > +          [11..4]  : pin number
> > +          [3..0]   : mux selection
> > +
> > +          This integer with mux selection packed is used as an entity by both group
> > +          and config nodes to identify a pin.  The mux selection in the integer takes
> > +          effects only on group node, and will get ignored by driver with config node,
> > +          since config node is only meant to set up pin configurations.
> > +
> > +          Valid values for these integers are listed below.
> > +
> > +      reg:
> > +        maxItems: 1
>
> Would be good to say what 'reg' represents here.

It is just a index, which are not use by drivers. But need it to dts build
issue.

Frank
>
> > +
> > +      fsl,drive-strength:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1, 2, 3]
> > +        description: |
> > +          0: MXS_DRIVE_4mA
> > +          1: MXS_DRIVE_8mA
> > +          2: MXS_DRIVE_12mA
> > +          3: MXS_DRIVE_16mA
> > +
> > +      fsl,voltage:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1]
> > +        description: |
> > +          0: MXS_VOLTAGE_LOW  - 1.8 V
> > +          1: MXS_VOLTAGE_HIGH - 3.3 V
> > +
> > +      fsl,pull-up:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1]
> > +        description: |
> > +          0: MXS_PULL_DISABLE - Disable the internal pull-up
> > +          1: MXS_PULL_ENABLE  - Enable the internal pull-up
> > +
> > +          Note that when enabling the pull-up, the internal pad keeper gets disabled.
> > +          Also, some pins doesn't have a pull up, in that case, setting the fsl,pull-up
> > +          will only disable the internal pad keeper.
> > +
> > +    required:
> > +      - fsl,pinmux-ids
> > +
> > +    additionalProperties: false
> > +
> >    "gpio@[0-9]+$":
> >      type: object
> >      properties:
> > @@ -80,7 +137,7 @@ examples:
> >      pinctrl@80018000 {
> >          #address-cells = <1>;
> >          #size-cells = <0>;
> > -        compatible = "fsl,imx28-pinctrl";
> > +        compatible = "fsl,imx28-pinctrl", "simple-bus";
> >          reg = <0x80018000 0x2000>;
> >
> >          gpio@0 {
> > @@ -132,4 +189,12 @@ examples:
> >              interrupt-controller;
> >              #interrupt-cells = <2>;
> >          };
> > +
> > +        lcdif-apx4@5 {
> > +            reg = <5>;
> > +            fsl,pinmux-ids = <0x1181 0x1191>;
> > +            fsl,drive-strength = <0>;
> > +            fsl,voltage = <0>;
> > +            fsl,pull-up = <0>;
> > +        };
> >      };

