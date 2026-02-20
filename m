Return-Path: <linux-gpio+bounces-31971-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKCwB+ODmGnKJQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31971-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 16:55:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B219D169136
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 16:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC28230847CD
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 15:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CB134DCE3;
	Fri, 20 Feb 2026 15:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EzHD8abr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011023.outbound.protection.outlook.com [40.107.130.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0CE34DCEB;
	Fri, 20 Feb 2026 15:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771602881; cv=fail; b=neShGbRkkxG0kElqwmGaebx+6FAN5W3dr02etjOifWZE8WgnuETmMYV3RGBqZkAZ5MIoGE5Muk3mHtt/MgmKOwILJkHDnoFWSQE9ix3F8OnxLkNnFO1kvKW/A/Adng0jaVhVMUXiSe3g/wh9pIfA7xYO4QePo2bRxjujDDjrzuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771602881; c=relaxed/simple;
	bh=nhydjog7fa0RaI5Zj80AdLrL8ne01Py1Mvvv3mRWNWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I/Ttaj3FxAbfMjgu+qg/wjpbt+HX0yvskgdftKqFjqd995bXAjxXOxofR941b3JS3kdhufj8FmK2iLkMvh36rbo87ALqCdZTKAj0MYpaS9+D5kKm9lW3fxiiMCBGAlaiNjeZ9ERlx0E/fTEYwWfFOKTaQVA3xn4pOe98HwiKIrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EzHD8abr reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5bElyd8oL8Cu1zNJXDnPqTn1iGUnZAnOMB2+FEbzety0T4w46Nfw95g5veidozFpEMp7tpn6yn5BxyrJCTWEcNcwkyM3RS5lS3H+sjP+DIu+DP0X16zH+scpO7giWS8dVlxW/YqAIkHmcLQV8chySWkX5pqds3VzpkF/MLtYh1dS52Cmh4L24ZOlcheFVGMHeIX69fseftPBBDIcJkq61oDlaXd4DvNy3bHh05h2Av0OBEGmT3e7jigYrwD6ByUPTe5ZeruY218xrdxAIZObHBwfdAN3rH6QmQGpDVEbLSqefDNacR4cMC1r3oQzooQg5s3oYFDK/300pG6if7MYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbGo0ASf2VVYgrdRZ5OwtrIt6nJOSSBxZITgbKVigRc=;
 b=AcrQbNOrM68BxBIRlZM4glBSSqjtXYJlyyNCTGhoEvs6KbyDLDqFal9l2XRo/KpRbDOLK9lQOnd2QnwX79zCLXoIUXuZh71EVl3TQtEm7+yRsZ3MYDgvaQOaZQvfRQ9tr4969oBj91xLma38jyZnDRv9m3sdEL0XJ3pSQSFY8xKXCfU3kqBOg1Omzpx209I2R1AWLCb3oomaivVTYDeaexC0oVypq/Z41fNDF+ebj1wZEPc/BDI2qaoaUwAt88PCZd460Qv7AIkRLdgjq3Y7pLSM5wqASsO8/tRqXTmPRN0Rz0+Fbrt3yIUE5xNsSsNB6EFaE1nIi3yWCT+2ao7zLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbGo0ASf2VVYgrdRZ5OwtrIt6nJOSSBxZITgbKVigRc=;
 b=EzHD8abr+GHpEyGVrfumx9wQZRdgdkWDkd7h/2A+k3GiOJDqcBjGGHUs+rmyQIS6eGJuPNeHzpGyuPskBj/6fGpXWbo95fdzXavs8Wty+uaa4ybLyAFXBQ44nvknMdkEixTwkKjhmKwLdbnGQ1f3wmzppr0Wax5s/LV+GS2ySVW41b9n7hlUXFNU6KoWQCupcyUErCLnpU0bVUpcUsi90Oktxl8ncQEBPDrp+ys7MdWsduQkvi5Grmz/TDQXOO7MLfjzhVV0kOqdPIVrfql0PmEBSFSNxqBj2PCfHOhDzKMs3b2Wo/D9YatjzbA4KwGAA50dfGV4r06x1WousH1ZdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS4PR04MB9690.eurprd04.prod.outlook.com (2603:10a6:20b:4fd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 15:54:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 15:54:35 +0000
Date: Fri, 20 Feb 2026 10:54:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] pinctrl: add generic board-level pinctrl driver
 using mux framework
Message-ID: <aZiDsmgAKPQPwYD9@lizhi-Precision-Tower-5810>
References: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
 <20260219-pinctrl-mux-v1-3-678d21637788@nxp.com>
 <4d41eb9f-037e-4751-b878-202f7d613001@oss.nxp.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d41eb9f-037e-4751-b878-202f7d613001@oss.nxp.com>
X-ClientProxiedBy: PH1PEPF00013303.namprd07.prod.outlook.com
 (2603:10b6:518:1::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS4PR04MB9690:EE_
X-MS-Office365-Filtering-Correlation-Id: bef8b31a-036d-401d-0248-08de70985811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?8Vke0XEHLoHrwg8iQZSaQffKcFxcf8Hp+ZwpKsE7mpMl9Suh25FoCNQoXL?=
 =?iso-8859-1?Q?LS9Gr+h0zn/XT2h/E+8VRNMFHjlD4MCdjuYIr28vae+sbC2fXn416EwdtV?=
 =?iso-8859-1?Q?D15EFQksvL7KXG+LknTjO5TbDiFdFAn6H+drh/qqAfmWAQjSWlD6Xf7cvF?=
 =?iso-8859-1?Q?9y7xIymMV4lsKm2XwVflGuyv4Pk+plzGd3FaRUlBLGs0ufdWWVLh8ukoIW?=
 =?iso-8859-1?Q?1DJR7Kvf5CF0NxgCzyhL3puIqIiTNEiNjPQBmCQLCsV3BY/Z6a0NNNRZho?=
 =?iso-8859-1?Q?kRbRljj8JHB4zF131gt2eMnl/SGTKpLgl1s38fce5LBNCSlF/zDCzQOnNl?=
 =?iso-8859-1?Q?FsMfw9prZKdwgb4OWQ90mo6mcb4co7VYxU4KlXn/wB3KuzJ7MH7CJVAcxa?=
 =?iso-8859-1?Q?TaUm68jA5hg0lVsqA6xztWYamH6yrKjifcPygIrATYFOTVSbXvBE/4yhwk?=
 =?iso-8859-1?Q?bxP7X+2AU6RdTlzs9zuEt0NKyS/Vp5FMWQ0sRECQmlQsKgmEGja/M5V14V?=
 =?iso-8859-1?Q?0TEmzFuhpRi4yHedL7TqYEs+m1MWEcUQvqyggWT8kf9tjU3/LQBfB3K2Do?=
 =?iso-8859-1?Q?lqWpnNzTXsdytDIHtj3LSQVBI8nEGcdaQgafjn1ouO156q7DpcA8PS6pCA?=
 =?iso-8859-1?Q?Einf7Ung/Cv2rjidqTdBSrNMBruDUWn7J6ev1iI6yDJXMFlrXH7p33VM+B?=
 =?iso-8859-1?Q?ZkZesEf2AokXK/5cfsJ0HmcBezUBRHb2Klq7Ko/LhmfO+Oi7ybGi/SOxKK?=
 =?iso-8859-1?Q?vmu4WUta3r7Y7IW5aHsDPcapMiJ+qIhSVNAMh8a6s1Gg5EPweQq2JIg8qn?=
 =?iso-8859-1?Q?UTwcRP9F0MsIFkFVZq4ixhqSkxmDOrkr9CMcOqZWWCJQclgdT+/kgpggqA?=
 =?iso-8859-1?Q?/jZX/42Fof8qDoIRLpuxZ2V8XleYh4gOCBqHNj55URUx0YbabwlpsTEMhY?=
 =?iso-8859-1?Q?hVbKM+Jjo1ByxNsGewlC2zJC1tQuXCHfp7j5GLQ0CuDCH9paVwtPyeLh6y?=
 =?iso-8859-1?Q?L18pIs4XMIKWYU5gLZzWeDK/xYd6hWbtsKes+6l5en4JS17JLL/7JWml/B?=
 =?iso-8859-1?Q?p8IJhbS5ttYfGWAEXCStya9AoU/n9DyHD4T60eo06ij2YMM/wwGAbJJ4id?=
 =?iso-8859-1?Q?K7pY5L4iGDN5LO+yPHMzSrYofPnwPRkCbCc8phNhUciph/P1St0EwvhCHO?=
 =?iso-8859-1?Q?aFfKJ50y+raohOZhyPqg78frLjg7tq0T7xQXJgRFsduKR7jPh/uW/i1BtU?=
 =?iso-8859-1?Q?VfMIe2hWUM3z68zmVCwtJLhiUF0JBciXZT8w7zP8kMt+RwQuSej8KZ4Y18?=
 =?iso-8859-1?Q?wScIbgPgkspVqAqanhF7xZA2WAeqalKyF1NbTQ8dH6a8z3+q2uqRY7KEnA?=
 =?iso-8859-1?Q?w8YNXvCPckbK8/Eh6EFwdMXTGPmS/aBwrSpupycHJvyOgFmIPdYgJ8WpNo?=
 =?iso-8859-1?Q?mgZaUqIo4XzSu1L14uRlbj21bM+YgVt2bDjhV1kC23hekMaUP9XgiZJ0p2?=
 =?iso-8859-1?Q?vsbgIdrak8A4enQd3mGoIPoJKFfUbDW/AKMxe8/X17QJotQ0Qe43RTI9TX?=
 =?iso-8859-1?Q?erUY40+gUbqG1Ha0Ghel5bDGhqVSpNGUDWmfalzI8OBkAE/UeOJ4uO+M0o?=
 =?iso-8859-1?Q?Gm3rcGqzvR5YiX8hzMEsIvANh7lclcgLJ4Jt/7nvqiQOiQhAV1kHE6Duj+?=
 =?iso-8859-1?Q?ylPLtCZUxS4KoTvzyMA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?mOPDVAb87T5mKE2JlLZCvarKtGHYBzC6PTiQYA7OGWMEbKQSJv7pN5pD+U?=
 =?iso-8859-1?Q?nMufxWGdkP/QiwQ2dMvfI3zp2cuilE1xY/cghCyIGbtkrnaW/ZcxowdsvZ?=
 =?iso-8859-1?Q?AYshzGEpQMTsKoHRd1x0TFMMH3RSIpnK14gOF8k/ZJJQKAsxc/9I9xw30v?=
 =?iso-8859-1?Q?zrWh/oXjmKwjGO5ldh0s+3pLILdkIXqimx+so6xFAi6R/cx38jC2OYwKTG?=
 =?iso-8859-1?Q?D6zJwH0l41khuH2rGXO8//W7Sg7AXpa+m6zd31ONv6UxNuxhdTK7LThDEf?=
 =?iso-8859-1?Q?Eqynk8oHgTHoVSOKmM5STFYlZ1RTz/sFo/Gu6u1/PA0ZLVDRegU888zQi+?=
 =?iso-8859-1?Q?1k3LH4wUCCSJ3kbCEsHIeZQ4tQ7kppNTMAgdjNXLIhJyolqmMQK1G9ntbg?=
 =?iso-8859-1?Q?iaTT8o1j/Q8gs03s7Tl34gW9pYLMbZn2WF+KWsuBfnQYzoVz2ucUGtQ+XO?=
 =?iso-8859-1?Q?qWR6afIfDlc4ab5mZH8hv7MqSalZdoEYlOETAIrNvgkmXHs+aZIUfeIlX+?=
 =?iso-8859-1?Q?2kd75QuER3Ug05LC5KgoO494Fe0yBunyporZxZjLc/SSIlV39GBTz1pQt/?=
 =?iso-8859-1?Q?zb9oS6ugyb5wA6nSD0zwuAWy8M9Prk6Dv7RHsQv2xpAyaoY6MRTmu+y0Et?=
 =?iso-8859-1?Q?QuZ2zX8l8RLhD7W28D7UzRIMcqv+Hl8EpVWq96oT+EgdQUFWvN0kMds3Ps?=
 =?iso-8859-1?Q?FWO1+OcokFe81+8SbHfTjYXeGI9J4cHGenofY1FirzPXAgayie1viVA4YG?=
 =?iso-8859-1?Q?ewD2vuMXIaNuFkhmCtcgCzNmcKQZdBaabQYe/5zOfiqQxVvaXOakQ1daV9?=
 =?iso-8859-1?Q?+J50nxZUko8sxV2mPo5/R1FAaN/GOHJ2cJbqh16Wzq9yVjj9ef1Ccp4Lk8?=
 =?iso-8859-1?Q?VbnllZxRDf+MF9qGc8REswpBlY6Z8OFEAb/Nu3kLU70YxmuJqqx+D9T/Qy?=
 =?iso-8859-1?Q?TXRg95FnD+qYJ2Cfbl0dsGPb/q+nwZTlFY7T9GxGXphC7UvfzA/2/Hjl//?=
 =?iso-8859-1?Q?t4zdmAc+d2bgMbOcL4jR+H5yE3N7738+yAmQU+RKUjQzR0JhCC4hEYxtxy?=
 =?iso-8859-1?Q?XGwNpoitpDix5A1O8xWngVV5FDD+D9H39vUSmkkcErcSh3Ssh9JEZhlvbh?=
 =?iso-8859-1?Q?9yMFERpWpPDNkBTzegrS76ghin1p2EzvzlqxShtz5AWxsth/TFr12ygynZ?=
 =?iso-8859-1?Q?wEJYRVbnX76s6joGH2dW8ntbsaYdBZigXUCcrMu9CjZ2w0DkWa8GbBhcjm?=
 =?iso-8859-1?Q?hzm+0ttnlrZC6dlWH0gdNUQmn7ucjeJiZ3ashq3NqHzdUyF1DGIarSJv0L?=
 =?iso-8859-1?Q?xOulnn3pSWUP1Hhh5rrzFFHiqrty+2kaumJzjOMX9yqQLiUAL1cYjI2Eh8?=
 =?iso-8859-1?Q?94zkKm+YJiR51X3egXErH9OY8ONHDRyl+s+0G7Aia74tI1POm91/wPbG10?=
 =?iso-8859-1?Q?lrPSteDegPGoKOn92xKdFYren6gT1htagkC3ryxkR/YCUOCuboX8KTyssg?=
 =?iso-8859-1?Q?qXO9dWdhpi26HCNO3yNVUzB7kOFVbhEo4j7/77EER9Q6niDDRrd5DULuyH?=
 =?iso-8859-1?Q?ys5bIZDs2Zb+qnCcrdPAqjU/NQpzu5LSm+w67V4CLoLWyLd4qGpggsBTrW?=
 =?iso-8859-1?Q?y8MuP8y40MvaogRu1UomivFDa9OuORJDKQ413+54U6oD6YE31jkKrfgnZj?=
 =?iso-8859-1?Q?AGfBSlComMr1vPUoAUlMEiUtJ4Tay7PvNHJCQiImqRWRmqbeU4xr8ue5il?=
 =?iso-8859-1?Q?oHt6OSBtPOkfobCJ/GzoC8Xq6jl/wdmjbs+Kn5gRpf1ZXV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bef8b31a-036d-401d-0248-08de70985811
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 15:54:35.4654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yp/DcLZqvT7m6HPpdRq6FWEKKwCEOdmrHuIUS4LwH7b6f8xsJpm7SkM9nomdnfvYdGZ2af4/hd3yx5DDDaM5dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9690
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[nxp.com:s=selector1];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31971-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:-];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.976];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B219D169136
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 10:50:41AM +0200, Daniel Baluta wrote:
> Hi Frank,
>
> Few comments inline:
>
>
> > --- /dev/null
> > +++ b/drivers/pinctrl/pinctrl-generic-mux.c
> > @@ -0,0 +1,222 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Generic Pin Control Driver for Board-Level Mux Chips
> > + * Copyright (C) 2026
> >
> Copyright 2026 NXP
>
> <snip>
>
> > +struct mux_pin_function {
> > +	struct mux_state *mux_state;
> > +};
> > +
> > +struct mux_pinctrl {
> > +	struct device *dev;
> > +	struct pinctrl_dev *pctl;
> > +
> > +	/* mutex protecting the lists */
>
> what lists? 
>
>
> > +static int
> > +mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
> > +			  struct device_node *np_config,
> > +			  struct pinctrl_map **map, unsigned int *num_maps)
> > +{
> > +	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
> > +	struct mux_pin_function *function;
> > +	struct device *dev = mpctl->dev;
> > +	const char **pgnames;
> > +	int selector;
> > +	int group;
> > +	int ret;
> > +
> > +	*map = devm_kcalloc(dev, 1, sizeof(**map), GFP_KERNEL);
> > +	if (!map)
> > +		return -ENOMEM;
> >
> if (!*map) ?
>
> > +
> > +	*num_maps = 0;
> > +
> > +	function = devm_kzalloc(dev, sizeof(*function), GFP_KERNEL);
> > +	if (!function) {
> > +		ret = -ENOMEM;
> > +		goto err_func;
> Do you really need this goto? Previously allocated memory is dev managed .

Yes, dt_node_to_map() may re-entry because some defer. we don't want to
defer free previous allocated memory to module remove and generally
pinctrl driver is never removed.

why use devm_ version is because pinctrl framework assume you use devm_ to
allocate map.

Frank

> > +	}
> > +
> > +	pgnames = devm_kzalloc(dev, sizeof(*pgnames), GFP_KERNEL);
> > +	if (!pgnames) {
> > +		ret = -ENOMEM;
> > +		goto err_pgnames;
> >
> Same here.
>
> <snip>
>
> > +err_mux_state_get:
> > +	pinctrl_generic_remove_group(mpctl->pctl, group);
> > +err_add_group:
> > +	pinmux_generic_remove_function(mpctl->pctl, selector);
> > +err_add_func:
> > +	devm_kfree(dev, pgnames);
> > +err_pgnames:
> > +	devm_kfree(dev, function);
> > +err_func:
> > +	devm_kfree(dev, *map);
> > +
> > +	return ret;
> > +}
>
>
>
>

