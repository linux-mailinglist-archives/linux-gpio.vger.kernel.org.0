Return-Path: <linux-gpio+bounces-37801-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOs7CvaPHmodlAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37801-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 10:10:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A930662A39F
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 10:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5A873010D9C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 08:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673A03BF676;
	Tue,  2 Jun 2026 08:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QcnXZSdS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48013BE65C;
	Tue,  2 Jun 2026 08:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387326; cv=fail; b=D0+i6idOzfPEO2F+aFc5ys6QJ2Ge0+k3pk4FkoqNM48jmp5kRiMYVHYd6tH1cYP49WUUVuilukuFDf7qQ1O8tFj71yYvlo5+ujlYaAfU6Bmdd/hgnExcLxe3BHEeK+JifjUR+7k5rAXjim2bawqP84dGEO7O0CbWbTVXNcuwMMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387326; c=relaxed/simple;
	bh=No5FYstjj8mkhNuliL1Ui2I3e6cpdhWHdKGerLgNcUA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ty3vTrSuv3L0g0OCpYp2dodpNFHq5vjG3UEdH70PoQkwPPKpk+Rz/sgQ2bjCuq6pdiChNLYPo+S5dRNdqEqqgP//Gg4ngxK5OIsvttJsVdey0K9AXPWm1z4be20D/yxwTFycKGh6I1zhXnqtXAU8TQozzIe6Zy/VB1I6YxescVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QcnXZSdS; arc=fail smtp.client-ip=52.101.66.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyPwo+fzTshnTZdSdazzIdMjzASpC2KQVMimUKurygkGg2ulI1n6oZDcIWHnSpimXQepBNpn0ZfF5LRGwSuXq0z3hc0lBSRgH3b76QeuM8u9z6FUQQQzP/P17qHY1NlW2FhaC/YrtJtEM6OoHlyLDUZg5TL2SQqWyBHhwaN/STmR/ULuvmHRdiFKijUsoj68Y0asO5KYH9oLoxuzpkwi1EYkHR5EX6K7iS6FmOvo6eJU5z6618+cvjHqVCJAJBp85FbvznFH55bYBrYmzQORWKhPZKFHYpsCzTyIsxZrpHQ9FpWon2PlfIOoU+oLeAhNQTPHCl1eByCvmm/p1vmRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5o98G8ptoVt/TUB1y4XTonwCwJpk6G4RWwGfwPly+Fg=;
 b=XrRnsAgJTtxK9RV4NqZWUvT4VG7fdcjZTKwEfpJeHTbJKqWQX9I0to4Hu7tXQrGpk8ZwPub7nmSekCs8CjJxvMGrcqPQZxgpVxtCWilECULT4x/CfrpDw0ipQglqIDddy/AJ63Xt1VOQaJHmRzDx8tbH0pCRh/+MhzBt9+P/qh0GJj9AHvlIjxpKtekCoOqRdOupqKwgDUQgXb2oQMGIwwj2QdcvB0fI/6RB/jb/yxh1/A4xkPhlxq8efopHo51LXIgnjG6gBp8mXL/4m/LolA2KwU4yMvpRL8syHALos9CDMWzaBJkEHtyTLh6grC1YW/OhbHJpEgwSxsmgBggeeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5o98G8ptoVt/TUB1y4XTonwCwJpk6G4RWwGfwPly+Fg=;
 b=QcnXZSdSkThaMfZjuVGbf7B1yxuxF66kHvxVmK/JJZbfe7QkMQtSjSx/+JWlQo3ZsPq4WPZQuMWzWmz0CV6LizxA2rPwSliUAOZYH/+I1ZVWFz6LEK2Her++VRdlWAo7KNSCoNK2WNWmZOE2QWykRzmsi/gLXZJY0MQqasUp58ezddC8ZbY2YIbFkuY/6HMHcBxCL1uGZsY8b9UlbvRdnazpGQkAZcowTpoCCoPc026NJme0jbxQaZtwcIm4kn3ukL2kdA/VfONxSzgSEWIqH6wPm5oOLp8Ld1GO2RywNGnr34Bg78+4C1Oi15axyTU8y9T7wuU/rQtUoJrYioxaDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by AM7PR04MB7189.eurprd04.prod.outlook.com (2603:10a6:20b:116::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Tue, 2 Jun 2026
 08:01:57 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 08:01:57 +0000
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
Subject: [PATCH v10 4/6] dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources
Date: Tue,  2 Jun 2026 10:01:30 +0200
Message-Id: <20260602080132.3256239-5-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602080132.3256239-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260602080132.3256239-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::10) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|AM7PR04MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4dfccf-72a3-48e4-c35c-08dec07d37d7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|921020|56012099006|5023799004|3023799007|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 7/dviaPGMDDCPI6HYLz4p7tH9BdU7vIvBk6vGkE2BzBYzHk3i9W/B70FjbNlD7ZcGNqVdPZrd2eRqDKE07kcbgn/X0VaYCq9BbqACuf8NMiziejWjnjZ62P64JgFpCMmGuCe9n+TOxz9r/qPv992GLfp++18vDACnsgvxMZuot26eg8UWGz2dRFGJJLHg5JXbhx/3d7lxnoWn3xTwTqeASjf9+8tG9+rZdGX/yLzsTYg2yHRJJb9IB0s6d4NbSNwOSIT22dKmT0lTCmldK4qT1348aaQInflvxSEYYNM72Kf7UHZhwk+fA45vlfkeLtF9ldVGlNezWXlRyI4W8rVD7XJN+dOIboGVDLO09nXtazaCIbXerxuMiEBFxIu8BJWmS1Kk+4OrAjg0/oLyTHEdHSvTv+MZXHJIWxNvPOAVxTEaCADO5jAaDvxuPsew0NcW8CvPu9N7FqzwlIBfDHTwUbAhM6PNCv9jfTNwJ+5vVGzknfOKkUfsjGa6oY6cJbKheledsQBdoW74EzX3NKsnn9qRTdXatIZEG0hD106Z64n8ROlBPeiE3PgLsPdD/fhg0rbCviJ7lB3HOsIvQnRkYwSr5Tq1vgJX2kbuHnm8CGANIoN7GHw7TTMiRko3+TtsV6fo9lC8RRR1akbW1xZBIVpTLN2KrVOfaqtSI7bx2vG5sz1TLYNfVydiqSAbZdE
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(921020)(56012099006)(5023799004)(3023799007)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZlV4eGl0RS9HRENwT2U3NnBnaFYxWERyL25yUXJLdWM4VE91U2dQMXVwd25m?=
 =?utf-8?B?c1BMV0FUSU5rMTgyU1hWOElBc1FkSnhFc0c3cE03QW8rMXU1NldZVUN0dXNZ?=
 =?utf-8?B?bjl5Ni9sbElNZ25DeEE1aXJ4RnJxK1Bqd1VORW8vMnp1RGNibklHN2Npc2VU?=
 =?utf-8?B?K2prcjJRbTQ1YStVQ1ViUENJRkFlY080eUp5bmM1RnNPcVVNRTJoVFpENHB2?=
 =?utf-8?B?WFF6dlByZDBmYndHT2ZodFdQL3RrdmhUZ0tJTzQ1WklXbW5McHloSjBpSHR3?=
 =?utf-8?B?M1NxWmp6SW00NUNSN0ltQTJLcXlDREZzczZZL2JYNVlaT1pOdnM5TFRkSDNI?=
 =?utf-8?B?cC85czFjNmY4MU5DWGtmMGFrelcydDA1d2lwUHE4a1dISERaZjdTQi9McVhT?=
 =?utf-8?B?MzhCMDF0L2txZDlteS9WemJuekZiRkZrOFdSOFhkanN4QVdpb3BBR21lWDJl?=
 =?utf-8?B?RWIxeTNUZHovNzMzUHRpTXJtZnNnR0twckNobE85Z1pTdEsreEdRdnBETHRK?=
 =?utf-8?B?UTFoQlZ0bFZMdmt5dGVXNER2NUJaRis4eW5SSnRHQzJwOEgxT0ZuaTlGQTRN?=
 =?utf-8?B?d1hNVzJtYVZVVHBUOWZCT3ozemZKQXNZcE5nbytlMTliN3lZbFZNWlUwOUlR?=
 =?utf-8?B?emdMd0pVSWx2TDFzMmQrb3lzVHJzaUlvek40cktudUw3UFQ2a0J1MHdtNHF6?=
 =?utf-8?B?anlGazJDeEpEWXVsY3lrUmlTUzVDL1N3NmF2T0xqRlppam1VbVhmQzhtZjFi?=
 =?utf-8?B?SS80VWdITDVqRmFoV3NBaldYL2xLQ25VTlQySFVSRlBzZVlPdFlJdE9nL0wv?=
 =?utf-8?B?S1JPbVpXd1E0ZzF6anV1SWFZRHJXcHhISmRTT1g1bm5mdXNvak1oK2o0YXpt?=
 =?utf-8?B?aHFZNVhnWnAxcHYxaFU0WGxlUGdFOTVKcVY5L0tYOW9Jdy9nUmtRM2VvU3dJ?=
 =?utf-8?B?VjNyeE4rV3puTVZ4b1ZjRmEvZ3FXRTNZWkR4b1h0cmZqa2lRVk4rRGp4VVpY?=
 =?utf-8?B?bjFnQ2cvSS8vMnVodW1wVjIvY25HN2h6UEFpc3o5aG9FVzNDRzFnelBqeHRM?=
 =?utf-8?B?TUlMUGlKd1ZEVDF6TWNUa2lKNWZtN1dkUUZUTkZrUEEvU2tPNGducnVaY2dX?=
 =?utf-8?B?SHF6cjVGRkgwU0t1dkp2TTZDNWhpbmQ5RmpWMWVMZWNtK3pnL1h6Zzk3dkJp?=
 =?utf-8?B?UzU2WS81TTZDbHJwM0grMHhUWlgweU9qN1piWk9ISG9xb3BzRE1QcHFJV3Fh?=
 =?utf-8?B?cFczcHFZWFlkVURzRkVPUVVueW40bmwzYzF6dEZnNzFTWnRkcWVHSW5rTlVm?=
 =?utf-8?B?M0QweTd1WjJoMEpreVk3RnVSeEdqOWJuM1pkRHFuRXdsVkVaN3lCOXBDZzcr?=
 =?utf-8?B?dWU3d012bEsxNGlYeVBNdXU1bWl3eS9VSCtaZEtuRHBjekp6OTBPdFNNL1l1?=
 =?utf-8?B?NHRYMitHSnM0UWFka0VadkVnYW9aZUdNR2Qra3ArZGN5L0JMY0Q3ZU1Ddnhr?=
 =?utf-8?B?ZzdtQ0pJSjhWR1Q4bHlSdktCbE94MlpqamdyQWlnbWIzWEUzT21RbHV5SVVv?=
 =?utf-8?B?OHhGZEVES2piYVBmWm9DRFZHS0gvMGd0dVptd2JDZzlhMTNtWkVmcThGWU1u?=
 =?utf-8?B?OHZ3b0Q4aXNOUk94RHVMZjZ6WCtoNGE3VWVUS3N1aVdXU0ROZzVWeWZ3TVdH?=
 =?utf-8?B?RThzc2w1T0h6alNhK1g2MGRBcVI3WmVJUndtUjNySCtLQUFDMWRZMW1rdWxh?=
 =?utf-8?B?ampXT2ZtWVN5UktyckpjQ0dlODVXV0lpdzlreHpRZzI0YldwUmhJMGdHY3JQ?=
 =?utf-8?B?cnYxYzlUWEZUUFlDblh0V0IwVDhKTFVJOGNQNFZWUTdHUy9pc3Uzb1JCTFpm?=
 =?utf-8?B?MTI1RmNaWSs2K3ovcm16U2VFangyZit6bkpFbmE0cDdpakRlejVwZUo2bGEy?=
 =?utf-8?B?bks5cmo1QmNxbUUxdUNkWXNKSzNzTUZ1ZGVVMWFuS0hERWVLU0UrN2Q2RExN?=
 =?utf-8?B?SWRQV3h6OHhKeU1leWFuY1BaOUpteUU1bjVNdDRsYU1rNlM4OWF3SkNpZkVj?=
 =?utf-8?B?dXJlZm05bTgweFFKTGlTeFQxNStvSTdJd3NQQlBUNjczNjArdDV3RlNxd2xy?=
 =?utf-8?B?YnQ4UUhPTEZwTmpaZTh0SDRaZGlTNUdKdlkvRkNwSGE3eStGTklia1lOQTk2?=
 =?utf-8?B?OTNCOUY5ZzlKcFd4N1hjQkZXZzBhYndnTTMzWDIwNy9zRkcrYWY2Y0N2dFhu?=
 =?utf-8?B?R3lyK28yOUU3ZCtFRGZzUVpmRFAzeUFtbmZ6VWpPdHlueXViZ3Q3OEhlUXdP?=
 =?utf-8?B?aWFKdkc2aXpyR1FydVlZWUtvMFM2V0F5aVNXcy9QV2VMK0RCZTVycmRmNFhX?=
 =?utf-8?Q?hT/9XQIW0Poj0obNzqlIa0SFP+EDs6GC4dgET?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4dfccf-72a3-48e4-c35c-08dec07d37d7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:01:57.5034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YL1xZ9TwgdMAAI2w7jZi4wMN9sKiTvXF/JVW/bGcPZWt0Aco1XO+esbJguWYOc6rR0uT0UC6I/GzAYlfGTKYrnQfC4G+w6U55vvOXMDXY5Em+3zaJ9E9BlvyESTY1C/7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7189
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
	TAGGED_FROM(0.00)[bounces-37801-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:mid,devicetree.org:url,NXP1.onmicrosoft.com:dkim,4009c240:email,nxp.com:email]
X-Rspamd-Queue-Id: A930662A39F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the S32G2 SIUL2 pinctrl binding to describe the GPIO data and
external interrupt resources present in the same SIUL2 hardware block.

Besides the MSCR and IMCR registers used for pin multiplexing and pad
configuration, SIUL2 also contains PGPDO and PGPDI registers
for GPIO data and EIRQ registers for external interrupt control.

Add GPIO controller properties because the SIUL2 block also provides
GPIO functionality, and gpio-ranges are needed to describe the
mapping between GPIO lines and pin controller pins.

Document the interrupt controller properties. The SIUL2 block
contains EIRQ hardware as part of the same register space. IRQ support
itself will be added in a follow-up patch series.

Update the example accordingly to show the complete SIUL2 register
layout, including the GPIO data and EIRQ register windows.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 83 +++++++++++++++++--
 1 file changed, 78 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
index a24286e4def6..e4cc1a3a795c 100644
--- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright 2022 NXP
+# Copyright 2022, 2026 NXP
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/pinctrl/nxp,s32g2-siul2-pinctrl.yaml#
@@ -17,8 +17,10 @@ description: |
     SIUL2_0 @ 0x4009c000
     SIUL2_1 @ 0x44010000
 
-  Every SIUL2 region has multiple register types, and here only MSCR and
-  IMCR registers need to be revealed for kernel to configure pinmux.
+  Every SIUL2 region has multiple register types. MSCR and IMCR registers
+  need to be revealed for kernel to configure pinmux. PGPDO and PGPDI
+  registers are used for GPIO output/input operations. EIRQ registers
+  are used for external interrupt configuration.
 
   Please note that some register indexes are reserved in S32G2, such as
   MSCR102-MSCR111, MSCR123-MSCR143, IMCR84-IMCR118 and IMCR398-IMCR429.
@@ -29,14 +31,22 @@ properties:
       - nxp,s32g2-siul2-pinctrl
 
   reg:
+    minItems: 6
     description: |
-      A list of MSCR/IMCR register regions to be reserved.
+      A list of MSCR/IMCR/PGPDO/PGPDI/EIRQ register regions to be reserved.
       - MSCR (Multiplexed Signal Configuration Register)
         An MSCR register can configure the associated pin as either a GPIO pin
         or a function output pin depends on the selected signal source.
       - IMCR (Input Multiplexed Signal Configuration Register)
         An IMCR register can configure the associated pin as function input
         pin depends on the selected signal source.
+      - PGPDO (Parallel GPIO Pad Data Out Register)
+        A PGPDO register is used to set the output value of a GPIO pin.
+      - PGPDI (Parallel GPIO Pad Data In Register)
+        A PGPDI register is used to read the input value of a GPIO pin.
+      - EIRQ (External Interrupt Request)
+        EIRQ registers are used to configure and manage external interrupts.
+
     items:
       - description: MSCR registers group 0 in SIUL2_0
       - description: MSCR registers group 1 in SIUL2_1
@@ -44,6 +54,28 @@ properties:
       - description: IMCR registers group 0 in SIUL2_0
       - description: IMCR registers group 1 in SIUL2_1
       - description: IMCR registers group 2 in SIUL2_1
+      - description: PGPDO registers in SIUL2_0
+      - description: PGPDI registers in SIUL2_0
+      - description: PGPDO registers in SIUL2_1
+      - description: PGPDI registers in SIUL2_1
+      - description: EIRQ registers in SIUL2_1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges:
+    minItems: 1
+    maxItems: 4
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
 
 patternProperties:
   '-pins$':
@@ -86,10 +118,32 @@ required:
   - compatible
   - reg
 
+oneOf:
+  - description: Legacy pinctrl-only node
+    properties:
+      reg:
+        minItems: 6
+        maxItems: 6
+
+  - description: Pinctrl node with GPIO and external interrupt support
+    required:
+      - gpio-controller
+      - "#gpio-cells"
+      - gpio-ranges
+      - interrupt-controller
+      - "#interrupt-cells"
+      - interrupts
+    properties:
+      reg:
+        minItems: 11
+        maxItems: 11
+
 additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     pinctrl@4009c240 {
         compatible = "nxp,s32g2-siul2-pinctrl";
 
@@ -104,7 +158,26 @@ examples:
               /* IMCR119-IMCR397 registers on siul2_1 */
               <0x44010c1c 0x45c>,
               /* IMCR430-IMCR495 registers on siul2_1 */
-              <0x440110f8 0x108>;
+              <0x440110f8 0x108>,
+              /* PGPDO registers on siul2_0 */
+              <0x4009d700 0x10>,
+              /* PGPDI registers on siul2_0 */
+              <0x4009d740 0x10>,
+              /* PGPDO registers on siul2_1 */
+              <0x44011700 0x18>,
+              /* PGPDI registers on siul2_1 */
+              <0x44011740 0x18>,
+              /* EIRQ registers on siul2_1 */
+              <0x44010010 0x34>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pinctrl 0 0 102>,
+                      <&pinctrl 112 112 79>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
         llce-can0-pins {
             llce-can0-grp0 {
-- 
2.34.1


