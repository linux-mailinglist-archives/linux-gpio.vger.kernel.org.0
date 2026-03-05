Return-Path: <linux-gpio+bounces-32599-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOPMMIq/qWnNDQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32599-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 18:38:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0F92165C1
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 18:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0DAEA3013958
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 17:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7973E51C5;
	Thu,  5 Mar 2026 17:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fpLGP5Ou"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013064.outbound.protection.outlook.com [52.101.83.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C96C1F936;
	Thu,  5 Mar 2026 17:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772732290; cv=fail; b=JwyjejRwbVKs8VmCKdBa18kwM8vvgPNGMeaU9uZUJ9RKWBGvORunyHBJCt9Fp6BcnA0iyN8TFtzwcp37hHE2VtqR9FigZEs0zaC4vtZdGmDpRo7WrQl4nfFEi3GQecuA8hPMSqerhYc1+qdfMPL0LJq0iwuNG8oP7FUfZqjS+HM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772732290; c=relaxed/simple;
	bh=633qBr/TRnAQv/ookIHFvtOZBMgyeRHu+swp3VxalLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S+ynX2iFSKm/hdniDCMpDdEKrZlvuR0QlBDSC/7fKsIHplEfeY481UL5PouMYfX+EYzhXfW4i9JaKGhAjtvdqgzGp1GkTwTBvGKzwknKgErDmreLqRdMfCIdwOQIul1xB1VK8cxMRds4uUf2ah312GKAC5Zlhsbq7Khaj2K4Q8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fpLGP5Ou; arc=fail smtp.client-ip=52.101.83.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/L+k7Cd+AzgffPgrAsgDQZAF5cETgVMusAhqNesX2b/WtnkkvqSqF6ZJ2wJxfIJhnYFz2RRkkgkbRE1pPz3ebMOudfUL+Xb4DVllj8H6BgXCc+SDylFy3N6f4lPnphvduWv69to0yUI85ndhSCxtskzUwX/msCXsgLhTSzrWQOvDnR2vrIagSxyJpUm9vwpNgh3UTHdLw5EOZ3z+IkRckzzzafykXb2ika8X1UAxNS92d7G4WiYcndKVc7FuG9rY+NjuZmaaMU2T4xhqiBRq6VPhhozBWYyniSbaYgOsh+UuvhTnXPyiAcOSYg98PURiF92cC/1vf8q2rftACW9Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0hqXPf4kTbOxJkOF4gql1YC4rmxr2neS6DmqcMuUNc=;
 b=igSThpjwdR3j/huitz7B5Iqu/f6M917qtzUeLMGZYKz05Z34TXCk6ywpNndo3ttTmJ1ctZaI1Un7/ikSKX8l7ZMtWn1jJ7un3yLekMUfb+4XdwNajtbvzwbpoEB0iIkRyEJi65oyVB2d/OHV5CnVMXJN1tSb+fFfTflWMbYEvZp57nlQj1Tac9VtM9gj6Z5q5Mp688XID0HrlhCYDvze0GWwG09Z32vxGOiMiVFHgulcJXmVYkJdEzgxDiQFEulyClCIbbJP7KqHbLZOY2P2jLlLdzn3xhXZnnohOZSawyJ6miNslCzhZRR1NqaeTqcq5WBY01wwm7OSHV5xfXR6eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0hqXPf4kTbOxJkOF4gql1YC4rmxr2neS6DmqcMuUNc=;
 b=fpLGP5OuXlCfs3iG0WMXPDy5siWKRmEQjh6zGzA/B4iFPlEwfn3NwdXvz94y5fFkatk4+HX+ZlatrfODYqo0TZ0Xmn6v1WNaAHgbsUO8wY/RDeZD6WKu61mFur1720J5CYAZfND1or0PHIcOKhmAr6Yskp889bBCvEU1CU+Iz/piJ7Mr1vErR8WcJEw1rG/yPEvbCSt6NMXCdPsMB0CBJPzVxiknZkM8K9VxCMN3P+NqS7/u91ub9HkfRcfOkMpeZNSfvDqapNLiFq0rY+doNY7TM0rQys514cVAmQx6l5eBskCXdMgYH8dSe7rlIz26Q9bKl3/gv6k2FnBsbg5VLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB11041.eurprd04.prod.outlook.com (2603:10a6:150:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 17:38:02 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Thu, 5 Mar 2026
 17:38:02 +0000
Date: Thu, 5 Mar 2026 12:37:53 -0500
From: Frank Li <Frank.li@nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v2 4/6] pinctrl: add generic board-level pinctrl driver
 using mux framework
Message-ID: <aam_cZhlCSxu5WHS@lizhi-Precision-Tower-5810>
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
 <20260225-pinctrl-mux-v2-4-1436a25fa454@nxp.com>
 <CAD++jLkT83xz+PSzZZv_Mv+Mqx_+W30d_xk68EDG-sdmFF3x3A@mail.gmail.com>
 <aaG2xQDnMVGGAOJE@lizhi-Precision-Tower-5810>
 <CAD++jLm=6pTh7N5UAXFaaYWCs5DhfQdb+8TnM5XLcYC886=kLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLm=6pTh7N5UAXFaaYWCs5DhfQdb+8TnM5XLcYC886=kLw@mail.gmail.com>
X-ClientProxiedBy: PH0PR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:510:5::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: 27f9533e-a0e5-43dc-8ce0-08de7addf34b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	ZX7tuqGEsHMu4ctHSqIpgqpad9c5l41h6tfon8mmcxDozCMJLv6B8zXsmcyN7nXfVptRbIz44ggrqr/kSuqSckfRzGZuMq4qFoWHmkvTcPGgnQFw/p8071tFPAvVZD+73CEkCOEqbKHK9GcUU7fNlBovEqtvk1lCqBZUIoRatSvrN1fNABBpGShL2341h5O01JCkObDmDVvqBElt1hIVwq0wlhrUXzJ5Vz5Fz9Qg9ic/ZvBpFcoQ+eet7X3X3jT0g+xZBMnjWnTdDnbL0bFR/LwwEShjM29xbURceQr3MdGMPRae5SrUpO/EbiID7ZCwabbCqZ90vUL1iq4BseCj+HnpV35MbhGeNGnZHmGH5OjUzNLaZOUMq5o0DUUBgBpNPe4OWbFPuEeKwP2Awph9AqI6oKH8ExFhNd3dYmaA9QJ3+Bbksb6jb9m7hrpf0fK2pyMOXtiFkjA6k07LYv2wNcujfyBwcLPTsncZfMTEHlTYUWg8ZRTj4mcEerzmUQCYCqxXD3sbu8tt5htRIaAh7M8qmtwUwd31eM4D18j4+liD5kBz2OURYMr2/uP5KQONk3naJWOhh43WZTR1snNQPYc7TkX3nUsy7DX216jQQqWAAWgYrrYg9f9Wi3fowHnzL2IYVqdnE7TsYiCZwcdJH+uf41SjCgENxvkCQNbMEMh9uyeb3+wMQypEMfHmV1Z+BZDQyk60wmlY4EcQYLb8iG7M2diZF0BVCXSdeRZSKZJ6B5lp+jblhslkO+EkBXmKkbPaWvnCUGvgI2p4MHZ+qmEqr1pDRYGFqa5+l02icpI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yld3ZFZrTERYVnRIUTI0Ri9MOElKeW45RTdqQ2VlMEVnWG0vcWU1OEFmNWN3?=
 =?utf-8?B?YlFwdzN0K3lqTERFeXFmWUw2YkEwdDQ3a1JRWlVvNG5URmFxcksrbndpT3lB?=
 =?utf-8?B?eEFCakFyREFVZlJiSGZ0aG9pQTMzR3poNm5PdzJFMFltVjQ1NGFZdWQwV01l?=
 =?utf-8?B?ZXdKMzhyelFQWUI0RkZKUUljbTdadTAwVDNmbzBtMmc5TElVaStLQ3g0ODJC?=
 =?utf-8?B?a3Fja0dVbWNHdFdadDBXTkFpVjkvVWJOQTJzN3ZYdFN1TGtEMmJpNmVlVGVV?=
 =?utf-8?B?RGR1MHQ5QzVYY2VlZmYxUHJyY0hYeUVRbjRRZFhTeURTOTVDdXg1NXU0N3ox?=
 =?utf-8?B?Z3JTUURYNlJac1RScXlJY2o2c05FcmZtZS9od0g1WnkvZ0o2OUFKbk1OQ0tw?=
 =?utf-8?B?SlFkZHdyaGVCdjFWSysxSmtIUFFzU0p0bTU3cUM4R0pnR3dMeXJUNDZLN2dG?=
 =?utf-8?B?eGtwSDdrNDlOUEpkSXU0N2Z2NWNMQlNNUjI2ZHEzOGZ1dURlVjRNcThIdG5L?=
 =?utf-8?B?SUwvWjNydkxvVjVDMUk0UjJPcWxtRGlYNHloMmF1WkVSMEh3YkJUOWdpVW5s?=
 =?utf-8?B?aW1rL1I4di9lekZwSWdwNThwc1llQVNCTW51bjdRNjBuLzVTRzhIZWd2N0p3?=
 =?utf-8?B?djlYUmhwaDUwQnllUDc4bXBvR1Z3cnJaVDd4SFk0YmxqVkt1c28yYURXSkpT?=
 =?utf-8?B?UU92RGk2dllNVk1JRFdyeGdvb1pFZDRSN3RzUGNwYlZKQ3N2aW8zMFh4cERn?=
 =?utf-8?B?VERqN1NrVkYzbHdGT2d0NTlRemxmb0lGNnkzOU44Mkh5ZndiK1kwc3ByTXVi?=
 =?utf-8?B?ZVkyVDIzUkJ3UXkzM3JjRklNVmdPSFUzUWFBZDUzdHg2ZUpPZGJxc1hyVGZi?=
 =?utf-8?B?VU5kMTBTT0RCZ0JsdHZJWGQ3RUtPZVhlbERBZVVEYysweHMxanRBMlJpb2Rh?=
 =?utf-8?B?TzJzVFVSaDRNbHc4a21HQzRxYzlmRTZhY3JkdW9MalR2VGpOSkFTMjdNZkxY?=
 =?utf-8?B?Q3JjVWRmU3ZLeHU2emk0WTB2YThHaXRpWk1WNEsrakNyL0JZaUJhMWgyaXd6?=
 =?utf-8?B?QUNPQXplQmF1eCs3UlY0aHpIc2VWVm9SbWRsSlhrM3VNM2F3dUlEeEN6c0dq?=
 =?utf-8?B?a2x2TTFnZThldkJNOS9PQjArZEthZUtuNUNhTHhBd1hrVkVsOFpuRngrOURD?=
 =?utf-8?B?QXBRNzBVR1dZUS9Na2xzTWVyU3ZrWGhsUXVQYXVEd3JjcWVqaG5DZUlQaVNy?=
 =?utf-8?B?VjBvdzRLUFoyNFJHWTJLU2FneXFzR3NnMjVkdm5KaFlVYWFJVFNwek4yalZx?=
 =?utf-8?B?ZkUxMTFuVDlvOFk2Nll4TTRzL1E0R3cyRHcxT1BHbUVxNTlmOEh2ZGp2WDlZ?=
 =?utf-8?B?dWpLMnpINDkwOG1NRE9Qd3BhU1hlYXF0bTlOQjMxOTN2eWwyeWhwazlGM0Ji?=
 =?utf-8?B?K1dMcVZ6K05hK280TGZtSzFXYzhpeWhYbndjdWtZdzc3L1F4QSs3T0l4c3FS?=
 =?utf-8?B?dHZVWDNvbjVrZ3ZEcjcyL3ZBWFgzN0JLVTNKRVJFK0l4d2hRT1FiUnl0Y0NF?=
 =?utf-8?B?MUlIRHY2eXFxVHlhOU0zcjRhdXZCTUdmQjVWWUVlMjhldWJCWCtnakF0UHVM?=
 =?utf-8?B?U0F1ZW9PZjQ2R29mM1pmRDdTWGhMWGYwY1RGcnlWUkd3SGZTeFVRN2NKM1ZJ?=
 =?utf-8?B?M084bDZGNmF0SlZITURCZEowR09YbnFYZFBWUW4wc0VEZ2Q2QUdHVVJ0OUxP?=
 =?utf-8?B?dTlKSndUamdHaTZudnVMVmw3bU5OV3QzdmVKNWwyUWlLa3ZUcHF6TW1qMkdn?=
 =?utf-8?B?YUt6K0Z1d3VzVUlHUWpMbi92N0w2OFFONzJtM2hxbmNhOTY5OTluY1FEM0Q1?=
 =?utf-8?B?ZG5qUWZFb2wwTVBmWStYOTZKQ2tuZDNaM0JuNm9pejVZK1FmUFMyQUpuRGdx?=
 =?utf-8?B?YnBNby9wVHlMQ0ZmeWhSdE1QbUhlblA0ZThiRUQ2NG9qNG9wT2xTeWVsaGhO?=
 =?utf-8?B?dUY4a04zNFRZSnRmT0l4QUo1VlVON1ZTMkJ6aWxLRWg1Z1dxTlJ4bm42R0ZZ?=
 =?utf-8?B?OC9KTlhmSkR1N1hFYUZKWVphRTYzZVFidHhzdStvc2w5WWd6K3dVZ2tTV3Fr?=
 =?utf-8?B?c2s0S00vUHZnT2NaWUxQNHVHTEJlb1pORHJtZXM0SUlaTVlERm1CZG5MTGlR?=
 =?utf-8?B?bU5SbzdrU2xJd0ZJTkVsUVFCYjB0c1VEbmxMeHM5dk5mOG4rSEZtd1NLeVBF?=
 =?utf-8?B?Mi8rMHJRUDlPeEpQQzhmcEREMGdCTU0ySXFrKy85ZkM5QjU0Q2NFS1ZiUFUr?=
 =?utf-8?B?UURmMUVJNjE3N2pHVFhnVEpDVnFuZWx1VHZNU3Urd05qRzQybjh1UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f9533e-a0e5-43dc-8ce0-08de7addf34b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 17:38:02.3181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a71jUAoXHkJwwTwGcAZJDsLqaKjflV59lGlBMJ9hGPVSHPytXeL7Hnh3wrX/v88R5ozWG6lf//ZK9Z2X1BuXsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11041
X-Rspamd-Queue-Id: AE0F92165C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32599-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 11:11:00AM +0100, Linus Walleij wrote:
> On Fri, Feb 27, 2026 at 4:23 PM Frank Li <Frank.li@nxp.com> wrote:
> > On Fri, Feb 27, 2026 at 10:20:14AM +0100, Linus Walleij wrote:
> > > On Thu, Feb 26, 2026 at 12:55 AM Frank Li <Frank.Li@nxp.com> wrote:
>
> > > > +static void mux_pinmux_release_mux(struct pinctrl_dev *pctldev,
> > > > +                                  unsigned int func_selector,
> > > > +                                  unsigned int group_selector)
> > > > +{
> > > > +       struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
> > > > +       const struct function_desc *function;
> > > > +       struct mux_pin_function *func;
> > > > +
> > > > +       guard(mutex)(&mpctl->lock);
> > > > +
> > > > +       function = pinmux_generic_get_function(pctldev, func_selector);
> > > > +       func = function->data;
> > > > +
> > > > +       mux_state_deselect(func->mux_state);
> > > > +
> > > > +       mpctl->cur_select = -1;
> > > > +}
> > >
> > > As mentioned I have my doubts about this, explain why this hardware
> > > is so different that this is needed.
> >
> > As board mux (uart and flexcan) exist, for example, only one of UART and
> > FlexCAN work.
> >
> > when modprobe uart.ko,  mux_state_select called.
> >
> > So flexcan driver can't get such mux as expected.
> >
> > when remmod uart.ko, we need release mux_state, so flexcan driver can
> > get such resource.
> >
> > Genernally, DT may only enouble one of UART or flexcan.
> >
> > but insmod uart.ko
> >     rmmod uart.ko
> >
> >     insmod uart.ko (here also need release previous's state at prevous rmmod).
>
> Can't you just enter the state "init"? This can be used
> explicitly on the uart .remove() path using pinctrl_pm_select_init_state().
>
> Sure the device core does not do it automatically but this is a
> special case.
>
> If you want a generic solution without having to change any drivers,
> Add pinctrl_unbind_pins() to drivers/base/pinctrl.c and call on the
> generic .remove path for all drivers to put the device into "init"
> state during rmmod.
>
> This gives us better control of the actual hardware states I think?

init state is before probe if exist, which not fit this case because:
- on board mux need be enabled before probe, some device need communicate
with periphal at probe, such as SD card. SD data/cmd line must be ready
to scan SD, similar case for all mtd devices.

if add new state "release",  when the pinctrl may switch between default,
sleep, ... , "release" have to switch between switch state, such as default
 -> sleep have to change to default->release->sleep.

mux device also have idle state, which map to pinctrl's "init" or "sleep"
state.

The key difference should be
- pinctrl can uncondtional switch state.
- mux frame have to use pair mux_control_(de)select() to switch state.

So, I think just need a hook in pinctrl system to call mux_control_deselect()
when switch state and release resource.

Frank

>
> Yours,
> Linus Walleij

