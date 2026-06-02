Return-Path: <linux-gpio+bounces-37799-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFgrHayPHmodlAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37799-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 10:09:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D1A62A338
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 10:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5778B30D173C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 08:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650133BED23;
	Tue,  2 Jun 2026 08:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SRUVd1EU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23FE3B3C10;
	Tue,  2 Jun 2026 08:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387321; cv=fail; b=hCz7fibsRiVuKLLVbfK/ya8KRB6gw1SqkPj/pVA0U8A2RvirOkngcuwa8naZJUxv6s3f/lGSzmnXBKNV8F7PczgyTuLWchtdXRtjqYe6LxJCycEfsqmYtbstOA8a7ZZGjaYGhF75sP5uaBn7PjXQx6QT+z9LsXjt5EeqHX6/9G0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387321; c=relaxed/simple;
	bh=y7J0T0Kva5KyRM03ennpFvCMxJRY9Zpk4k7sIaB8IY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f4hNlcmlxNzq1vLkyoMF7K+lh/xqTReeCBuZ7nzakUjXr1BM1jyHQ/l9o7702EdUHJSTugvoHCXhAAoixBo8hipxt+7fTGVqZ1jknf/DTC6d/fPfor/Bb1XYcyHfn9jJJHBmq55Pw0F1Y4P6ChmWliSbKZ3eq7X7aMJ3nmL67/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SRUVd1EU; arc=fail smtp.client-ip=52.101.66.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OP1/Mzq+ODjrxD7Cz8qvjBkBNQ+pMx4Hqq2eQ/K8Ugp/zZCl9zixBlsOW7kEJVKYzeVVvnmNEHPDT+EyYO0yYmZveOCVcTCEoifyRZFjzkXywMwpI4gfvNJcOhiJ9Q0FB/XCcrZe02tkuDVtE8fwVaSf4iN1q3OKswA5j6LAZMTNWO6CISJxs0lxaWC4Brak2CA9Ry8Iqh9QbOv8X0Gn0jbfKd72gMcNUOiI9ClZ/yX5CnhpV8UnhJGF7orst4AqxwL7LxpQ5aEDtSGJq402KTc+6RTTv51aNdkxqjBbA8pTavxV1JhdItWYPUVXgd1YQW4cy4PsUiAaC0PXFv7q3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jN0PZlNaXHXY3jBD/nIZdadYkpQCBvSXsUgS1tIqfEo=;
 b=BT4RO9p/MubRozMr7Tt8yK8zG658i0k+lh5QxyqPBa8CtGKtqy6PNCDzzNyMVHVpV0fEuF5I6gr3OvM1D5/n97xJ2kPjsC9TV9+skHT4HYL+aFjfgOb7cxX4sI+/gmUjUalO4GYRTziVURxrA/iXvoSzw+pvBdGo68l+B3oIpiT23kseE+q9bLJ4DBOI946m/7rzA2bcKQff6flXkaxBXcwN/8ydSI9SCB5qPOTgcSxwo7QXZR867qTRuFt+To3x8wSsb3WBEUK7IIAXsL+sgJkS7eWMbkNF+HnwFcvDiNF+GdDX1stMWLKPeH0z72DSFQHEq8AHVRvl47t/R18aKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jN0PZlNaXHXY3jBD/nIZdadYkpQCBvSXsUgS1tIqfEo=;
 b=SRUVd1EUxrfoAf6+T9Lxk6XLNgiMhP8NQ/qWJubog6r0nOv5fJyOfqhXDvxRnW5W/2uqJzNtmDJa+0P5ChnD6fX0YiTu3pIzEMjPfU7l9/ynlNHoFUZONPDOXeBbunXPM7JSknZIUFogVaYHw8ribo6EINT+JCVrQyzxv53dYj+OFEMXeATTxuzuc/D/SCEAHJVBgyZ21NvWV4xnJubro43NirJCBfUZWvMsArvnnIOfpa2Mjn8gTbe7n1MEvokhmDxo+8ewV2+nLLzHmpYsBSSvETU7jnoCfBaY5n5GlKqRAx2mRXgFhdO15ollA0JtUKfaYrDwH4//ifmw2ML/7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by VI1PR04MB6830.eurprd04.prod.outlook.com (2603:10a6:803:132::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 08:01:49 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 08:01:47 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
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
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
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
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v10 2/6] pinctrl: s32cc: remove inline specifiers
Date: Tue,  2 Jun 2026 10:01:28 +0200
Message-Id: <20260602080132.3256239-3-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602080132.3256239-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260602080132.3256239-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::6) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|VI1PR04MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 29632ce3-612d-45c8-b8a9-08dec07d3189
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|921020|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 DOm1gjyJQ1uk99YoiBIgnVk+e1POR+WMoHbEwTDq+RuQzgeZHImxrNk6tDiiRgK74FXj8CZg5+M4kA/dTJclKs0sFyLHQ8X85DxPjPy7sUUiDoMC/jii2zXHLJ8D0f0P4rntMpzDV3F4sSscHyE0yKPm/mUT7KMJQ1HsjN6p1BKfJ94tEVezZtigFB3JjrCN4Bmy26ovanFH/kGgZPgTwkM+wJJXPRPCg+jr+6nQta76eNwFyRxTxJOMfPS0d+Ahe0Jhn892XdzA8WF79kbxVcgdaWmFgg7kou9VHxSO6e/rDPaEp4a/VjAOhQNdtQS5ucrnZCx7jpltM0zUyvbUh8DtiJ56FIgs+qk21mcSIcghaoZZZUjiZfEwYCCB980RgmdvgZDHU+Q/nroTDPPEz5MXRBsGEypFPRIi5MMhdr7/kcgmLONX95g5NZp/YvobjwnfAVG3iTaxQOvsBXsoB4X1UDoeaPgTLkyoe4uifP9j9YnAxW4cXluzEf7YlsEtcC9PPS0+7sf6RlIOhWdahOybr7wJuorOlsHqYBrXCJicIrSmBbGfcgKwkYxDt7r+BBabwHLNvtdgcfwvpsK9Sb46kpGv8xq43945IVS5A/YpkrMNNlUkk1UkL8wZNrgfJTXESATIVTiimdjNsVuSVmguYRaSgELAQ1p1Ovhy6iqmF/cmmbtrfA/Osg/qF2O2laSodJv5pAqk37TIuFLXBtSdZEMoj22m6xVH/PpWosM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(921020)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MXVITnc5ZnBzcDdEVy9CcjN1S3NUa3kwWkRCdER4OHZySnFmMDhMUzZVMUI5?=
 =?utf-8?B?ZmpUNHRKbGhyZjV4SnlLNkcyRFowdFZ0L2E1aWV1ZVNCR2V3bkNDSktYZXlu?=
 =?utf-8?B?ckcyTmV3VXA1V0ZPZ2s1NFo5dnZvenR2d1Y0SENTV2N1SXpVekl4MG90WEp1?=
 =?utf-8?B?SXdWRUNWcVFrMmpTbG8yNFFSWkg2U2pmVUE3WU02TGtWanl1clJVKzJFREJR?=
 =?utf-8?B?NE9wNEEwbElSZXg4TUVUQitGeUlsZStBbWRMc2Q2OEhPeGoyUFd2K2lMWDd6?=
 =?utf-8?B?aW1JUHo5cVJFTlRteUpDQjNuYmh6WDVhRHVVTUVNMHFkZzZNRnR4ZTFoMTBl?=
 =?utf-8?B?VDlRSjFnd0I1aU94ME9XNVh1YW1CQTFNdC9VSFAyWnh1dFJhQW81cmJhcXl3?=
 =?utf-8?B?UVcrOGRKbnNOYk1xb3BqcTU5TUp2L0VxcGF1Qm1WaisrdkJlOThMN1k3b0RN?=
 =?utf-8?B?K1EwdWhWNkFnZWVHaURMa1JDcEVnWDNrVG5DejFtZWVvQmt4Y09FaTFVazdm?=
 =?utf-8?B?RERkRklXQUtOOEVLdFNENGdZT0xPa2pHdHAwU2h5ZGlncDlSOE9Fc3NENkYv?=
 =?utf-8?B?eFNVQTZaSkVuRklvZ0l2enVaYkM2SnZXUjF4Z2pqTS9xNFB4VDZRZTIvVDBX?=
 =?utf-8?B?Z0FFYkRkVE1oeW5IVnllL0NpZWl2TTlLaUdRelRlTmdOKzJVNUNNNkZ0eUxW?=
 =?utf-8?B?VmxVd1NacklhMGpZelJRRFVkRWZTU3duVjV4bzFDcE9xTDVXL0g0aEdORUND?=
 =?utf-8?B?RnY5Y0FaNkFnelFqUU9YRG1FcWtRQWhybWpFRUFzTyswMmsvM1N3S2g5T0N6?=
 =?utf-8?B?dXBIOXRNVG1jRlgwcldHdDU3eDVnUStVSzJQZksyTkw0eWdaNEIzUGpUNCtU?=
 =?utf-8?B?QkRLTVFvSy9uQ2pKa1NmZXl2QkVadlU4M3FaSXZycHVSS1RPOTNiSHRuWkxx?=
 =?utf-8?B?M0k4dk1jUjJya0gvNWI1WlVndWpyeTZhY1huWmlqWGFqSTYzTXM1MnYyVEQr?=
 =?utf-8?B?THNtdU9Lc0lPTXBNU3poREpjNmJsWEo1NnhvYjBwcXZnbDJUanZnTk1WdllX?=
 =?utf-8?B?WkpNMjlHWW1qVEd1amxuYjBESk5oU1NMTWxQNGlUUHVva3ZVUituVFdXV1Fv?=
 =?utf-8?B?VGJHdk5ITWRwZFB5bjdjSUU3dUxBdnlaSGVFakdMVERKaFVhNTJxYk5Jd29V?=
 =?utf-8?B?c2RTY29VRTJPWWd6M25uK05aWXEyQ1hZMkxiRWdQN3h0SU1OQlZZQllwOERx?=
 =?utf-8?B?NGRYellhcTkzOEx1K2crMDd3dm5vMHlTTDQxaHhkbWhRdjBhOG96Y04xVWpT?=
 =?utf-8?B?OFJYN05CUVM0ekcwQnM2T3VLUURyZ1ZRWm9aYXdzS01Yb3Vvam5TNlk1Um1C?=
 =?utf-8?B?M2czeUZGMlVCOEVSSEFIa3BUdUlheU9CeGJhbjg3aE1Mb2UvbU9yYzRpcFlu?=
 =?utf-8?B?RXNqcXBpNTRBY2NYNlpEcXZ5NHI2SnJXeURDaDdISTZJYlUrcks1TngrRFIy?=
 =?utf-8?B?WDJ2dHNBeUhYdVd3YUR3Y0U5bTlEcC9ZTTlONVpCZHl3emNTRnJ5YzFiVUh1?=
 =?utf-8?B?L1BMaEJrcC84b01MQUJjYitMNXRlTG5XakpCZWNyWjk5cUNuTkRrSFRSSFBO?=
 =?utf-8?B?Nlp0aHhvWlpHeW9OWm5HVEU0NU1XYVc1TnpQTkhZQlhhRlN2bUE0QmNTOVJ4?=
 =?utf-8?B?dHBScmhVUHFaSXE1RzNjZm90cS90VE40amZoN1k5OVUvVXhMcld6ZG03WEZS?=
 =?utf-8?B?YkF1ZUM4bzZDNVJ6cElob3U4Mzg3WjZwTm5sQlNvQU1DcXVOV2ZvYjZjOFJW?=
 =?utf-8?B?MWowNnF4c1kzd3cvUjR1bEJtY0ZDZHc5Z3Z5M0ovVlNzSGxjU1I5V1NCRFhy?=
 =?utf-8?B?eTYvYXI5ZVVnSTdzMC9GQVBNUHBRT1BtakZPSjRpMlVVcWp4SFZ6TUpkZG05?=
 =?utf-8?B?Wk1FVnJOMmg5SU9Gc3BTM1YyT3A2R2JoK1dqeElxWmgxclpKMjg3cmE1VUZV?=
 =?utf-8?B?dDFWdkg4LzVpQWZsWDZjVTJ5bms4VEdhR3FSa3ZSZWU0MExCV2wwbkk2R2ht?=
 =?utf-8?B?aW5RRmxNd1NaSTdvZzZLU2xDcHZ4RVFpMUo4Nm1meEVrQ0xkS3JIYmo4YXNP?=
 =?utf-8?B?aUZMUmcyczY3OWE1Wm1sTDZnMThKVmlDd3pTbXpQRXdxUDJXNjhTTXVDMERr?=
 =?utf-8?B?bjVBdHkvSmp4NTZBc2RuRzVMcXNtUE0veUxrUXloZmp6eW0vUzNISmIrMVk1?=
 =?utf-8?B?V2RCS200K0F0Ym1kMk1KanVLOG0rNnFhOFVTNW9tbG9HNmpJbnFaeDkwVU5o?=
 =?utf-8?B?bG1QUExKMTRhN0U3RHBhNWJPZWMrTDBYQ0VNdHAxVnV5UmRaQllHUG9iSHR6?=
 =?utf-8?Q?XmCgJPVEUlQmujCPe+uPVxRzgdR9hVvUWaii/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29632ce3-612d-45c8-b8a9-08dec07d3189
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:01:46.9272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OI6Q/eTyY0jL1hvQB7vB+jZV8iOwW7/ihU5zuJetFnFVTevzrvFc0ou4PusoAkbCZepXAh4luPotENermPpaws534m+aBSjI0+F4k3diNKfqBecuiOIavt2mS6vD0w4C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6830
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37799-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,qualcomm.com:email,nxp.com:email,NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D0D1A62A338
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove unnecessary inline specifiers from static functions.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 4f88c24e62a2..2645a92df0ba 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -131,13 +131,13 @@ s32_get_region(struct pinctrl_dev *pctldev, unsigned int pin)
 	return NULL;
 }
 
-static inline int s32_check_pin(struct pinctrl_dev *pctldev,
-				unsigned int pin)
+static int s32_check_pin(struct pinctrl_dev *pctldev,
+			 unsigned int pin)
 {
 	return s32_get_region(pctldev, pin) ? 0 : -EINVAL;
 }
 
-static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
+static int s32_regmap_read(struct pinctrl_dev *pctldev,
 			   unsigned int pin, unsigned int *val)
 {
 	struct s32_pinctrl_mem_region *region;
@@ -153,7 +153,7 @@ static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
 	return regmap_read(region->map, offset, val);
 }
 
-static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
+static int s32_regmap_write(struct pinctrl_dev *pctldev,
 			    unsigned int pin,
 			    unsigned int val)
 {
@@ -171,7 +171,7 @@ static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
 
 }
 
-static inline int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
+static int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
 			     unsigned int mask, unsigned int val)
 {
 	struct s32_pinctrl_mem_region *region;
@@ -484,8 +484,8 @@ static int s32_get_slew_regval(int arg)
 	return -EINVAL;
 }
 
-static inline void s32_pin_set_pull(enum pin_config_param param,
-				   unsigned int *mask, unsigned int *config)
+static void s32_pin_set_pull(enum pin_config_param param,
+			     unsigned int *mask, unsigned int *config)
 {
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
-- 
2.34.1


