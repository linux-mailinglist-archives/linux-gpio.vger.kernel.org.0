Return-Path: <linux-gpio+bounces-30786-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBsKGoRdcGkVXwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30786-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 06:00:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C945145C
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 06:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1609E7C817C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 12:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42B4427A10;
	Tue, 20 Jan 2026 11:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="md88kSov"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011045.outbound.protection.outlook.com [40.107.130.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5E34279ED;
	Tue, 20 Jan 2026 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910385; cv=fail; b=FGTu78PCYfDJ1jQitvtLdflY17295xfnFiDtbNwiDuUGoveZk+cqHRVfBcL4danZTcVHJMnynos1x0wKw5qWq7f+P55oOrzVsLv7uZRIHJoeOFvrgFA4QsPAGaZH8za7qNL8jKqqy9Zxa9w7jCokhGtS6LtVDxtpkUARC0UE18g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910385; c=relaxed/simple;
	bh=eX9wRIiU8hTAQxrnU4RMxpNrNRh56NWy2BIg9fmHUyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aDQescPuEyVD4ADlftX3TF8YaFdslXT6biausrwEmYj3yGPtMbuRBaTlKWwKuE/PdBM+3ztyustynS3GAbrCYzr//YU+xes6T7XRcv+WBj0Z1NLoECAy88tE1G9lgwM8ORHGZvsixDVuH9auW86A9UF7qIM1cLAcItdcAzp3TwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=md88kSov; arc=fail smtp.client-ip=40.107.130.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xo0VHWbMA2cUGUnzIa1EG4ISls7rS8ZMYYPQD9nwLxNya6nz1EmKPo5gi80ZnFwQPxDfk/+pCsOjRi8o70/h7j0R1Zfci0bFHLy1t0ekczi+jv7XYjZVTd34rf0HH94HyrvCgfQiwpi9jOckyM2W3BgRaY41aIoyzbx103u8/s6F0Iz0CnY8o9NPNz4uan83+rlWqSGBLIzXy0mpwnQa7u6B4VbgWAKNX2Ew/W0/5fvUAtdijpz0xHoulNOUrdfXOU0pvWFit7wkr1NA2jgOUwtl7BCRgO01qLy3u+bSu9hFaxSf/Dq7HqHoY92z+4QyAmfj8YF8/rkWhIPyk3/nEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ftAGQTvYEmzeShFd7S7Vs2lz8Y8B2MIFvCvIdUGN+w=;
 b=m1A/qJjFTX/+ym4aw8LIYnh0WpUV4fsz8Bl6eIOMB5pR94VxKkkMR8IIw7PjmbkVHWA57VexwUl2Halhq5KS650WlHb+J+77mOltOPZ9+IIkZqoxvEcZYKqPv2mTY+/VwSmb+YI087WmUWehj+KhuFLR8lpTu1ogoJkEGt6QcXwcmfzZH6JsG5naHnzBmolwbVx6JGoYjh4qUtWz1o/dkCYhjkzaPzhpTe0UPV7pe0sFqQtU+XLduxPYrw40oXyXnZHaqrS1IdBlwQ3effPoQJfQLfxAnqdDaRKkjDAcEbLQCxNowGkEsXoUfISoyVB/6YGD9NMq42EF1Zg1cLDYmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ftAGQTvYEmzeShFd7S7Vs2lz8Y8B2MIFvCvIdUGN+w=;
 b=md88kSovCel4+uSXcQ8eHxS4pHN63jZ2To6wsuN1DNZbjyJuxwjSieOdUJBCK2kd+o/WgdVda1WdtHgcXKnwkCsPTrD5TJwe5K8EF1YRE89jgVrYmmZnsqMS0AYMnxDb15fj3iPNC/b/ZMrcftknQgidDZ+k2GG9zjjg4NTqa435nQhLIkCR8KVCw5QiWwI80mhcdpRAV8+yecTSqRHkgJAyhJiLq5e8FktLN+MiwOW+urALJLMGJB5CFMIOIYs6KG/nsXUUhRbGm1v5KWIt0pjyBrYH8BYPCf0mDkdGqmDjEluF6gTfCSMMpkkirfI3fr86v2N6YgRJMPWmBuGQBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by PA1PR04MB10769.eurprd04.prod.outlook.com (2603:10a6:102:488::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:59:38 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 11:59:38 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>
Subject: [PATCH v8 05/10] pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
Date: Tue, 20 Jan 2026 13:59:17 +0200
Message-ID: <20260120115923.3463866-6-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0444.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::6) To PAXPR04MB8190.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::23)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|PA1PR04MB10769:EE_
X-MS-Office365-Filtering-Correlation-Id: 727b8a63-e6f0-47b2-b857-08de581b6300
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?520H2ADJcOFQdZaU1LwELVlrIF7THOAjtibi1cbAQ3HXdghgmPwCCi6oTcam?=
 =?us-ascii?Q?+ZKZeKIMummGmZgkIGZK7qaTSP1EqF2nk3wjQ0dmg25wQJmGITGBe/fZoB4U?=
 =?us-ascii?Q?HSNVs6wpOrhBGeqliMd4LUszS+KEDiqZPFk0Jzh+HhL/d5/ZGAxg0m327s4B?=
 =?us-ascii?Q?ijVHrw0b32LmikojRT8hiw3lwmVZ7HLT+Q9YimNSVbO7UQOObzC6rikAzBeW?=
 =?us-ascii?Q?vojRtNvpgR5QI5soRevkSzEDt44PxvwUy0G58v29Msj5ecYVG7zr3ndviwHK?=
 =?us-ascii?Q?JjxB+TMAX2vCw5R4+ryts2cuhCf17xKa6bYy9mQuggS0PENCi4mN6PC+7CKo?=
 =?us-ascii?Q?vLWPAF8ljOgohRX+6Hl97c7o0+ivk1zmUy62Rfg3XNYiCK06ysTSJjniIf3s?=
 =?us-ascii?Q?WxkR79XXCX39qx78g02hrLlugqtnO0HAxsM1l+4MOtOq5pgF4jvP3ACcWMxV?=
 =?us-ascii?Q?svKjGYcfkMebn1TQAJzrUnd0BywPFMuucj9tpj6SX+FV7bLKSirond+JvZRx?=
 =?us-ascii?Q?jpVQFTNE2pyuJCQZ6uOnF4kunqr8wjscHxO/ZDxI4syk2N4XqVTi8ESGEbG5?=
 =?us-ascii?Q?Rj5bAsryWaX2ZQvEsb3u1xLnZhhgJPQshy2jDcg/BEuVwJ55qQbbXoCN/CUx?=
 =?us-ascii?Q?aBd5Fx6NOQeoAYy+G+ThfsxeGCb5ZM/8gTipWd1hDJxPw4WsntXbePdM1hwq?=
 =?us-ascii?Q?SgsKkjQnMZKatOaF3QaQqmQPiMW5SJonOz4EKBj3r/4GkaBfbvik7T7LWr0U?=
 =?us-ascii?Q?MVrJH9suTqAQvdG2M1u7fEUATfje2S6OhygVHTIBV2DNPFjOVz84GAXTugGO?=
 =?us-ascii?Q?MVd/ZRZQJxRcTpiBMJtNK+OydP06KIxWpuGfS8k09L6k+HOvaNVx+bnIs0QY?=
 =?us-ascii?Q?SW9244c3uB/PhI/iwMYsSehQf8M/Ef9qvhceb8imluH5cS6BTxghY4ZAFkZO?=
 =?us-ascii?Q?DSPAENrC1wafAZyPfXMdoSs5Ci6YQjKy6PB6mnEjZonG346FbY0Bspmbo+uX?=
 =?us-ascii?Q?OrQvMqpD2LYPQEh3Fsp5A1+W9vxD/C+Y0NvS7iZwmLYar9o7RPDyZ1nbfBBO?=
 =?us-ascii?Q?Ro7sVSkH9kn7l31TxPuByP5UtjkzvBlG4GI/4Xd7LCXrpNGx7kmag8ImQ1dL?=
 =?us-ascii?Q?hh7/cv88jxkKZPwtgBFb2bd6NHMs1fhg4EaRXKvuKYj1KRQqpio66HGPUSoB?=
 =?us-ascii?Q?UvgEmizzxmHiBywDKDuxgTfqj7gkL1jXgdZ9c64Z+9Gu90k/FyK1nmTvBEuD?=
 =?us-ascii?Q?IbFOBY7CFu5jL21q1x3QRRV7GDSXeRiYNSs1LEP0QcAdCtu/A585LGEHUxjD?=
 =?us-ascii?Q?+td/tD7gBZGGGOaITsgNE/d/el9nwNlMIEVIwk//MFd15e1c0kpS/owwdXzl?=
 =?us-ascii?Q?oAPMVC2FwcZp0UuRRJbeoA8gE2ZAF1z2h4qKE0xv2G1kJkhFQF6PSyIbosnP?=
 =?us-ascii?Q?BNnbSatfVIq2y5JNkdDmkVzXkLpWoim0+ADLe7YN1kUA25U0s0tytNjfRaHH?=
 =?us-ascii?Q?0EZjI5IkH6w3HJIz6WFtYdl2XifvSslhtmSeSE+5asmVGn9mqB7+ChFaTlCL?=
 =?us-ascii?Q?gPwYlOX10Ei83q8SY1mjG2Ll0kRv0slh0dZIQByC4x4f2ZpWk6cesUqxfSBJ?=
 =?us-ascii?Q?Kw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LOeGCoxSQezCZTlfFGcPLVgs4KBKrpGgpjCP8onWYu3b/LzHNIpUL5lDNkNT?=
 =?us-ascii?Q?XYgld4zyNq4I7j/XCMbN8rc2ghW+mHKc2gu6DKxbsvzpbEWjQiP75PRdFx4r?=
 =?us-ascii?Q?QxW7Lw0+W9/WtzJbQ9o5fvX7JHP47CU0Mx0Z4KcUWzGgwhOSaU2JWwaxjP/l?=
 =?us-ascii?Q?sgsmyKsi/8kWhNTAKRqptNqdrkXx8/yby9aMsqf9bc0DVquyfxxuLcv/93CP?=
 =?us-ascii?Q?/ePDsWBmmg3XoovlcGb2c0MqzpZTwAUXklhbth2Uc24CiPT7xTX1MQCRhgxP?=
 =?us-ascii?Q?/AE3n/33CjXwkJ7B5maUmbikfL10PjCCNdm0iF7Y2GsAPl8pB9DRqg4G+GjH?=
 =?us-ascii?Q?Dfr2YbmdYD1jFO0AQpzNhErL623yiGouzLekg173lY2fDjRCmgd7T0JMt2Y0?=
 =?us-ascii?Q?NDYLIpZLTCC8ECzoUerqWLIBtPcVWt6OZLnYVAh882EpoA9dQfY2Hzc0tGyR?=
 =?us-ascii?Q?9sRAdA3qWeqaPEoqGNt29V2G9dSTEwyTTnuuQi4wgdnovPbwZvUZ0C6NgqTP?=
 =?us-ascii?Q?xiT28ZGpN8UB4dJbB+OvtRAoBx5UwABbB9R5el69RvziFqL2OAp9Dm79GnWY?=
 =?us-ascii?Q?K6e/ObMQtrCN9g4oMi/yiJpDUm3fLoidof0J3R/rTKMI/cRz14HebBIVpUAm?=
 =?us-ascii?Q?GBc5ICzG0ti2GH5iZR5HB4T06WwSE4beFx2vU4tCuDfece3BU3XpwyWtn8iu?=
 =?us-ascii?Q?VdDwsS6/7/oYbNXOEj/NMx7QW8HVFyxOgw8Aoli7VEbPV3xpw1TEHyzDpMgh?=
 =?us-ascii?Q?xIqZs/3MoQzsd/MzPSdzCqvi3tyVfEoscvHbqVbLThkdiHChVo/jSkkV6vc/?=
 =?us-ascii?Q?syOXin2wvSKTdCN9Q2ejoOF5wxXkhh9WtYfnddj/lxQp359csPSOf8AthEyk?=
 =?us-ascii?Q?VkmCyfZhr5SX9r3rktuAFbUbF+6zT60WNKNdvfKMwLFtbALSx1QhzbfKhoLO?=
 =?us-ascii?Q?6CnO8pI/v72N5viGkDi6//5oFJZMhzSa4gh9ZgQTXwKsVCBkSbwBbge/iTIG?=
 =?us-ascii?Q?m95VST/TzyhQl04U6SyOGEqUxsyEsQD5twj0O3zEmMCIIPfiNnntGdReyURq?=
 =?us-ascii?Q?ARdW8spmLvDrFjs727KMV6c1GbCnu+4/6vV/UZsbjcDRVBeToWvYHcuIyKLj?=
 =?us-ascii?Q?QNC0z6SXi+D6sMLBy6FEYP416zZ060WIH2y6CeBDaii8l43gwp1B5I8260Vd?=
 =?us-ascii?Q?ValWGzQyV83nKAIroBGiWd180fbmqqW4FPQlT0FL8UdbMQFeZXL5o62FeYIJ?=
 =?us-ascii?Q?XF7vYaAw7A1Vob55d7KKjIU9lL8J24gdGV70TEkL9w3BEIlH+AW7dFH0pHRS?=
 =?us-ascii?Q?tFPrRl79qAeCjNJ0lWdML3+m/fHtWyA6kv9tgg+tTo8yi6rUmNmNuYOddOf/?=
 =?us-ascii?Q?c9Q7xT5ck6/RrD8XTODk7g8qqj+QOubts0jRauep/zwi8XZo7QlwV4qfIfB0?=
 =?us-ascii?Q?aW8qW3wVDu/IoZZzBs2i25OA/EXRnrx3saBwqVsQ9JUpgK1MaAiezZydbe37?=
 =?us-ascii?Q?/bVPDBC75zTwEgZKGOsw0Fyu9fgk9yLVvHIjKJFu3K7rO1YtTRCfP0VzyvTK?=
 =?us-ascii?Q?6GiqMnSIFjN7cRf0DpQ1JYK+y87OOqIWV2hP2M/opaTHjuHyrmyAyr6KPXik?=
 =?us-ascii?Q?eMEMczabqMb5v4IZAoa6kYnlNLBX0SP63McYqvOc2ow8dCnbSwtzuLBGB1Ng?=
 =?us-ascii?Q?+zfLxG6hracmqy41SkRAqZ6lm3phEfVTzHHovUVcRP61w3BVdTkgJpcLezQU?=
 =?us-ascii?Q?NN5LHTqi3NZ01EFAtVO2ijvQwV6nj8lz3d25y59cP53QDM/TPxy5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 727b8a63-e6f0-47b2-b857-08de581b6300
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:59:38.6136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1r/52W8GWw1/bXDk5Pd2NdSSab5ugfiGXQmohDd2PIvL3TPVFisymlCblbkpNtM/dr+vPdWCXyi+oUzNtjHibziACwx9dt7ThU7xkoQWo3QevvZRH3PjpvpzBk/PXff
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10769
X-Spamd-Result: default: False [3.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : No valid SPF, DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-30786-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,linaro.org:email,NXP1.onmicrosoft.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: D3C945145C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Switch from "devm_pinctrl_register" to "devm_pinctrl_register_and_init"
and "pinctrl_enable" since this is the recommended way.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index a98f8e7c2768..4767916dbcab 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -974,10 +974,10 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return dev_err_probe(&pdev->dev, ret,
 				     "Fail to probe dt properties\n");
 
-	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
-					    ipctl);
-	if (IS_ERR(ipctl->pctl))
-		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
+	ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
+					     ipctl, &ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
 				     "Could not register s32 pinctrl driver\n");
 
 #ifdef CONFIG_PM_SLEEP
@@ -990,7 +990,12 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return -ENOMEM;
 #endif
 
-	dev_info(&pdev->dev, "initialized s32 pinctrl driver\n");
+	ret = pinctrl_enable(ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to enable pinctrl\n");
+
+	dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
 
 	return 0;
 }
-- 
2.50.1


