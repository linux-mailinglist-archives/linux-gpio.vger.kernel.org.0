Return-Path: <linux-gpio+bounces-36224-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA0HKcQJ+mlsIgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36224-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 17:16:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 963BF4D0155
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 17:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B96A301B735
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 15:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47782390CBD;
	Tue,  5 May 2026 15:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="k6NWPnsJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013038.outbound.protection.outlook.com [52.101.83.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAD434A3C5;
	Tue,  5 May 2026 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777994100; cv=fail; b=ijx6PRYlf/wHJ3PrQP/YDVWNZEJTKsthtErVBWYxow+MN8axdRTz79iwxVJphrp6mDJpvEEKbcHauyoOIkbL2yLYffAunKVDDNUE0VVqZ02+NDHriZOOuHqYQFKYhOKrYEuURxVtrT3H3RahvZzgAW682eKClAzZJSGCAe+vNZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777994100; c=relaxed/simple;
	bh=35ESPu8Q9P83o7gx72gymWtfRoGYPvynOlLlXEha37c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N1/riRxMVSgrUwzY07nOGwN4NUmMAS6IarjOUxZev2bFrM/R50Mrrecl9QPDEP/enfDJ3s/PoJAxAOZfFYElMlbHqqYYEof+DmZ1KSlsv6hJyZn9A6Ras3cH++LdvKGXeRpoghor4hw22C+zoW4Y9YfZ02SikEi66HX5yDw7rQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=k6NWPnsJ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.83.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPh1uNrKLJB3ZPZiJ8Dea4CL1PGJmpTJtV22G/3M2QUv1Bs7AQVOamzsNteXyn3TRZtokV9RbxeXnWHQP6MsTEppYk5h5gTIi81Suuyq+5T173jn4ZnfG2k0GDrq4V3m4TEh9oWTWh5Xq/bP+VvceMc796x0xGrdyCoG+Hydjx5tLPpk9GIKqY5MPimvYEEqg0vHx5FNIz4ghcn2M1Smc5KvuRjWHT13TnnXT+Hc2zixKD45T0/MCItfP+osbonFRDkC7F7Bzc9hwx2mAcwaIMbmoKLNrP/peNKm9dY/6nfokEgZ3ccyj7NO5crxFBdr/KQi/wyaFVJYeJJlLkFJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+gtkGOVgyjT7X+DqcxNNy6R3uwv+zcZnVjZX+u8fN8=;
 b=YYgXjGY4PkiS9LG9lwymo+MLZZ/ORFPNCI1e3gaw0m7K2ENrR8WXz6IheARK/MPIdIJtntPf6B3afLoLRaU6EBpMPLJYb5921iGarUGkmkzH+016qxVNoirWpasSKUwhvwUGNXkWVcYACxyd+OGtjf3jJOkx4XCWH682Mtc5mKf+0Cc7fwU08JR3VBtDHwQ37TmPV06xa2eSs12zYyIXLJwlZlpggPhw4+RgtuTFsretaPrvoLj40ngDM1BM9Ihcf+EuiuL4cqw6pHDvlM1f6Q4mmDfAtuJCCWcLbIj0btrTXZf6beMqOSkxZbE7Yl11ecBd/2Mk+APzOIr0DV4dMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+gtkGOVgyjT7X+DqcxNNy6R3uwv+zcZnVjZX+u8fN8=;
 b=k6NWPnsJ2DyYwaNIG6TQC6QYiYclPPGl6mcfnG2kJTHJa7LVGWXTCvjnyluM0yITqb1kkZENFrhvFhBwiyXX+bDved1vVbkEMzIILQC8VOqCf2u85fUeJm+r6IixWchW0dO7/wFFlUJUUW1iBbgIcdz/pAwHXFAYCaDm0l3u6hULZ8HtTCEGndj8EVyEOsAy7uwm/kZx8gNDeH227SW6MtPu23OF27Qv1BKzisYQMRhnHnRTsMimk1/PEfMylYKZGAUvXI+TPtiLc33ea+6BKUb/vTQkudzqgs/5cHm7GE0iSyK7MxRDJu66giFHCOPb/xLQzndby5m3nyJTvRzdIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI2PR04MB11099.eurprd04.prod.outlook.com (2603:10a6:800:298::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 15:14:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 15:14:51 +0000
Date: Tue, 5 May 2026 11:14:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] pinctrl: imx1: Allow parsing DT without function
 nodes
Message-ID: <afoJZDlChRnPltVI@lizhi-Precision-Tower-5810>
References: <20260504170836.1794372-1-Frank.Li@nxp.com>
 <b5f75901-29c0-4153-ad1f-543dcf7476e4@armadeus.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5f75901-29c0-4153-ad1f-543dcf7476e4@armadeus.com>
X-ClientProxiedBy: SA1PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI2PR04MB11099:EE_
X-MS-Office365-Filtering-Correlation-Id: f4092ed6-8603-459d-4593-08deaab90e28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kBbRFz7i/zeo34xAuDZj8yaE3tr8gHwX4AWlXLksPgYscwF6e1fw0rg6JbJJpUtP7W+6eOxGcLMGsSJuKQu83miS/zZ2C+Asq+/ttpdjDqeI/8fGN1/qeoyvC6cTgOIHNxM77iLPYnopAahlwRgfK0aMzSCyztzgqvfFVKyfcdDkf9+0K5XfFcgkU8HXRijKG/KukrMk2JNbXJ93EoNidvqzkxolwxCuwVExCStEfFarL+wvI6k17XOAi88sfqyCnTx/hCKfXRDc/4XVvltNvAELIh5hCoVovNMLfRr7tqj0tNs3lqBHJu4y/26poaZbYKfteZuteztslx9XNDwetSPwr1LaJt7Ji5g8fsPWYV/Qde2Sxg33cauJLBymvI3t1fN8UjD9QQEPdHaZvBKT9eXJSR4IOiRYn19EjWl7lAi/kFL4sGcd2ejay82d1HraIRXZCVzeI2WkjY6OQFrqCyXsJWGzmX2o5vD06+Dvy2pk/sy5FtglUnCaMesF72AZHwChYQgjqn/fq/fyvHDR2gDBaxkie1d433fOHHYqdz6qgq8sx6gFn9BBy0WNysVGLgOiV1MJ0hXTjMYSCVOz26MFRC6zMWyvbVXnDrOCbHzCUSgMQh8FpFijcY/z/wJ3Xh9ZGMo0Nf6mjcvlazUtQhgvzfwGcpiogmbl8lFXDVdzJ8D5Ow2mydxBheVLPc/miFIre8JMIX3uVrtBQQhbyWh+gwXYR+laOjsfmAaw2F+GrzvkY08fFNHcvEhn65PR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Wb8qIaQniynit5e1pqE1yowUHVxqRAQwkpA+3Pbtv9xHYCtmkPrJWlfJ1L?=
 =?iso-8859-1?Q?hgo6N6RR2y4Ce2x1AL/3uQ1lqmj2Lq9SUHRIp4Y5PxjYhxOL2guVIFp0ks?=
 =?iso-8859-1?Q?X42I1xF27xg44Erjvrg6BcP8B+OGc4+MyvqZGbb+c1fvP/myIH4WvC4cVi?=
 =?iso-8859-1?Q?Q334PVCIRZWBwETzNeNd3PNDvLG38aANCIQh5r9m/R4BxeQILqZPS61HVU?=
 =?iso-8859-1?Q?nmiOhFDIR7UOAQsQ90jCH7wxIgdHYwaQN3IdonQJJPaBTSnR/4nBl0gjfR?=
 =?iso-8859-1?Q?S5SF649BY4whr7AUB1bqjqD19GjmHHRhShhugAuIWo2E4es8CBHkKFPpHZ?=
 =?iso-8859-1?Q?CCUrr1WVC0MD+Bqvobg60du1a9ZGlSbc6UmwaJfQ41AwmarwjEYLUmpMbM?=
 =?iso-8859-1?Q?nUU4SZmrQJu5K2lFW6a7Su0/2vQV5I8f7uone28MImBM554vf6CiWEZmmy?=
 =?iso-8859-1?Q?bWBeZuzcKfhjZAGtrZ+I+9P8inFvsChfa9nuNFe2sPHVPgUl7xYmuofRBG?=
 =?iso-8859-1?Q?hL562G5jym1Hm8NxoopCUj8jkgUUZ32cokkhyVAfDUmP19kmSHPX57YQwD?=
 =?iso-8859-1?Q?bPi3eu6w016/KvTNqGpkyDjC4QjMDvHX8rvDyOEu6vo7w8E+AB9wQgo/ZM?=
 =?iso-8859-1?Q?DCF2U2HVWmK5+9r2MoZqXTuH6dV/vseZ9B0V6aavBcNyQqHH+iStP6mWe0?=
 =?iso-8859-1?Q?8CpcdcgMIsYQ5RMssJPhs1D1mAQNKsWzCHv1JG49LiEuB6qTvKBXycu3FM?=
 =?iso-8859-1?Q?kKmH1Nzxf4UCy1ov0x1uLHrW5I9ZPRYYX7Fvuzx5myBNhfeu0owgAsMR68?=
 =?iso-8859-1?Q?vjGlADUp6tZ3nWPx76VUytt2vV3SJF6X52i59bX8bA9XzWrZ0tqrzjofMX?=
 =?iso-8859-1?Q?NNK7FbXUQunHFcTFkkUN1B7h4oiBRbJ2LkoQt0lWDPKWeNwOQZgZdBITyS?=
 =?iso-8859-1?Q?DBW7DWKAh7pcCS4uJs/EGPxXuz0KGAB+uya1CCBbr8+gVj+cO5pTa2+p6t?=
 =?iso-8859-1?Q?hILC72kjpkxcfv43UfwgVe6AL8R1ZUdYe/zFAkAstI/LJuKAAXwFNx11s8?=
 =?iso-8859-1?Q?bZb5CdT/1bAzrAcWtTaf6v3VXfffTFT887gXjJNbyV5suGu2mW9LAygVfm?=
 =?iso-8859-1?Q?X8F6J1g3X37q/lGrsxDVq09+80ToE1l/ORswlJBGo3+PBm6anWWRd6eYzH?=
 =?iso-8859-1?Q?k+TnrtEzgxYGH2Y9jsHr6s0cpxcVJbbTBlj1VjjppAIz6t/O56FvpiCYU1?=
 =?iso-8859-1?Q?BYt3udDQDvu+e5h8/mFq++vP5j2gT2J1wtTQpiAWtE8yXAz+VQgBHnK910?=
 =?iso-8859-1?Q?ePFIsafK3G9CzvfHORCqDz/zV9PkC3TkBfh6djeAQ7XRVO2nhxQpThpaJs?=
 =?iso-8859-1?Q?s2mhhqJ490rErZtIvNKRJCja9UK8CxcTi+MzjosOzZIZZIUs/oRKA1VUbQ?=
 =?iso-8859-1?Q?zbTFOQuGeVR4PNfOTVmHqIi07iWBlIOHj7LRFImbPgBL7H8CkKJLSFkDzC?=
 =?iso-8859-1?Q?rOSppC+nmUk5E2Q9Jhp89d9YkA/9TsRwDo/6LCA08UzUpd03CxjIgkRT2s?=
 =?iso-8859-1?Q?Qw1SuALeqGLbCj2tZsjIYIGTCvHaKPX9+CAiX9MybILx/Dak4WkgIZmYoX?=
 =?iso-8859-1?Q?hHJzTzdZ5QZitAfxLNHMDHqxWFCt1cINGIR72IJAQd0SKO50mlUWpXRIX7?=
 =?iso-8859-1?Q?JmfcN0N7fO9JOnUus+sfDxaFgjr+Yy4q4Yxf43oCqG81s0t/6cnrthuw8L?=
 =?iso-8859-1?Q?AnG+nL5vgiWsBjokwnnrJw6OakGt2hQCLe6Z1LWKWVCqNNXwYz6f1ycGmu?=
 =?iso-8859-1?Q?hw5iAvgxhg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4092ed6-8603-459d-4593-08deaab90e28
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 15:14:51.7800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85PFUirQwgEzA2cEbZ7L/xit6olLs9lwWj/j3uvpxfPUk9Ru/yLuKAzy8fR14mp4+J3P61w+gr1G5kcpM1vnLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11099
X-Rspamd-Queue-Id: 963BF4D0155
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.14 / 15.00];
	R_DKIM_REJECT(1.00)[nxp.com:s=selector1];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-36224-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,pengutronix.de,kernel.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:-];
	NEURAL_HAM(-0.00)[-0.783];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,i.mx:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,armadeus.com:email]

On Tue, May 05, 2026 at 10:32:48AM +0200, Sébastien Szymanski wrote:
> Hello,
>
> On 5/4/26 7:08 PM, Frank Li wrote:
> > The old format to define pinctrl settings for imx in DT has two hierarchy
> > levels. The first level are function device nodes. The second level are
> > pingroups which contain a property fsl,pins. The original ntention was to
> > define all pin functions in a single dtsi file and just reference the
> > correct ones in the board files.
> >
> > The commit ("5fcdf6a7ed95e pinctrl: imx: Allow parsing DT without function
> > nodes") already make moden i.MX chip support flatten layout.
> >
> > Make legacy chipes (more than 15 years) support this flatten layout also.
> >
> > Fixes: e948cbdc41d6f ("ARM: dts: imx: remove redundant intermediate node in pinmux hierarchy")
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > build test only
> >
> > Sébastien Szymanski:
> > 	Can you help test it? I am happy i.MX27 still alive.
>
> Sure! Thanks for the patch! With this patch applied on Linux 7.1-rc2 the
> board boots again. I see the following messages, though:
>
> [    0.085139] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins property
> (gpio)
> [    0.085226] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins property
> (gpio)
> [    0.085281] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins property
> (gpio)
> [    0.085327] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins property
> (gpio)
> [    0.085372] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins property
> (gpio)
> [    0.085416] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins property
> (gpio)
> [    0.092693] imx27-pinctrl 10015000.pinmux: initialized IMX pinctrl driver
>
> That's because there is no fsl,pins property in the 6 gpio subnodes.
>
> Tested-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
>
> I one have comment bellow.
>
> >
> > Frank
> > ---
> >   drivers/pinctrl/freescale/pinctrl-imx1-core.c | 48 ++++++++++++++++---
> >   1 file changed, 41 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> > index b36c8a1461b7c..bf07e0c64a098 100644
> > --- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> > +++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> > @@ -540,10 +540,34 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
> >   	return 0;
> >   }
> > +/*
> > + * Check if the DT contains pins in the direct child nodes. This indicates the
> > + * newer DT format to store pins. This function returns true if the first found
> > + * fsl,pins property is in a child of np. Otherwise false is returned.
> > + */
> > +static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
> > +{
> > +	struct device_node *function_np;
> > +	struct device_node *pinctrl_np;
> > +
> > +	for_each_child_of_node(np, function_np) {
> > +		if (of_property_read_bool(function_np, "fsl,pins"))
>
> Isn't of_property_present better here...
>
> > +			return true;
> > +
> > +		for_each_child_of_node(function_np, pinctrl_np) {
> > +			if (of_property_read_bool(pinctrl_np, "fsl,pins"))
>
> ...and here ?

Yes, I will update it and send v2.

Frank
>
> Regards,
>
> > +				return false;
> > +		}
> > +	}
> > +
> > +	return true;
> > +}
> > +
> >   static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
> >   		struct imx1_pinctrl *pctl, struct imx1_pinctrl_soc_info *info)
> >   {
> >   	struct device_node *np = pdev->dev.of_node;
> > +	bool flat_funcs;
> >   	int ret;
> >   	u32 nfuncs = 0;
> >   	u32 ngroups = 0;
> > @@ -552,9 +576,15 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
> >   	if (!np)
> >   		return -ENODEV;
> > -	for_each_child_of_node_scoped(np, child) {
> > -		++nfuncs;
> > -		ngroups += of_get_child_count(child);
> > +	flat_funcs = imx1_pinctrl_dt_is_flat_functions(np);
> > +	if (flat_funcs) {
> > +		nfuncs = 1;
> > +		ngroups = of_get_child_count(np);
> > +	} else {
> > +		for_each_child_of_node_scoped(np, child) {
> > +			++nfuncs;
> > +			ngroups += of_get_child_count(child);
> > +		}
> >   	}
> >   	if (!nfuncs) {
> > @@ -574,10 +604,14 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
> >   	if (!info->functions || !info->groups)
> >   		return -ENOMEM;
> > -	for_each_child_of_node_scoped(np, child) {
> > -		ret = imx1_pinctrl_parse_functions(child, info, ifunc++);
> > -		if (ret == -ENOMEM)
> > -			return -ENOMEM;
> > +	if (flat_funcs) {
> > +		imx1_pinctrl_parse_functions(np, info, 0);
> > +	} else {
> > +		for_each_child_of_node_scoped(np, child) {
> > +			ret = imx1_pinctrl_parse_functions(child, info, ifunc++);
> > +			if (ret == -ENOMEM)
> > +				return -ENOMEM;
> > +		}
> >   	}
> >   	return 0;
>
>
> --
> Sébastien Szymanski, Armadeus Systems
> Software engineer

