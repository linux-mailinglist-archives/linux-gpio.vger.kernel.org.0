Return-Path: <linux-gpio+bounces-39247-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S1XTDvvfQ2p4kwoAu9opvQ
	(envelope-from <linux-gpio+bounces-39247-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 17:25:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9A46E5E9C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 17:25:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Su4ialLW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39247-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39247-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BC4F304D9D6
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF27372B5A;
	Tue, 30 Jun 2026 15:24:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068B0371D07;
	Tue, 30 Jun 2026 15:24:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833069; cv=fail; b=p1FyguYcUI8AUt46ITW9MZ+9BM3a3PA+7479Tdn1AdOeFtn9fCyVQp8TyphCmSrvZaTmWYw+QiGF1Cah2iHB54BI48/byg9BFZJm2RcufT8HoAyFccDOodz1KuOeBjo5+Yyat8xnrMFeKKyJGXqnub7d12aCBVHVz7b6lKbWA8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833069; c=relaxed/simple;
	bh=srXzvK2ss61xI7KxKtxYXkDcDlmVlD8AXCZHtBWdoQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uQy4V5nGzGFpdiWJ7/cakeRo0z1D2exIDcBWAryBWUAWnKOf59wA7IgMavNwUuJ5mlvA0AGH1nvtajfb1n2jcVZAMdH48Dk4K0ClHR0wQtfHv+sb+qp4GyvPDPmZHrT7nD3lxd6d9nx4+4qfdIQhe8MRkiMhyoaZT0lXguhogKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Su4ialLW; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wi+PSKEB3r+2EokGbFxxxdYWhPOl0ve/7cxgdxiL9/4SQKmj+1veiZznxdKV+QNKKSaypdILrkBpId7SDsAN00REyp3cCWyS/h5UwvOYREz0MVngQWY93IMle37Qkgr4DIkcZjqlW3zFBmQFs2tOP7prWfaxezkC8sv2iuoxnvj1YBSG6BLlQRXR9tNt4uRGqZm7YDmU7ivh4cl1rVhEWgQXw6j3MSUIz42xHn5vkbXz9cHKtyY10qs7H1SgWkn2fHK9dlOO5RUiSXQosfDSu1OMgdzPjJEzMMGLG5penscsFesars5/0ZmyYn8ImOZw07ezgpjxeiy/xSFwqN47Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCAXoJSlnUL4H/9dsqX+W+UndEBRf+uXnxNKd6Fp0IM=;
 b=I7yGo6lauaWgKymL29/+yetuTKMZO1xwULrusCJ9iLqZjQh3UkqEtZidU9lQf/5g3EOuq2C9nrttbp+cvfBwHicSB+yl5WCgiR+x+Yi1bqFZEwkulBvskSuh86IcUruxgEDfsJC6xW3W6s8Y4kRgTPPBTR0f9uQxJJ9cj3PC2LmvF808B1CRvIvkKpQfRuL4JFcAcMtebBB2dhc+QNSjeygFLN9Jbr7CJaorLe0oTBqFRSxwCDJW/fhtzJZPGq07BhXoEbKYQpQ+32zegwcU3c2PniC3ZNC7Q3Lyy9beTB47CFnVier7LYwcMeuKt3Hy/xZntLU91+RAEShKSN9y/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCAXoJSlnUL4H/9dsqX+W+UndEBRf+uXnxNKd6Fp0IM=;
 b=Su4ialLWU/8lorWKa/hnbrAMcIJ4V2mnaQI+Z5UC+sb72Sak4gKFP5fi84KXW2h3SGmSdwY051umPrMvWjrLYtM+a+sVqEMC2E4ehrZyTYfZJKWh5m9HRILnJ2/+BvS42yGEKfUDUoM/plN14tXAptW6kdMKGpVMefYlNj7M5wkWhrUPBHNYf0Xe2/p909d8AsKC94cBVbsnjYMo6ooTFC1xcl3E2th4/9YrUo7pjxgygd5cAiTJOLhCLjmb9qxfE/AFvktqpvIv5QYcNC8LnRpRR+6zNYRbslXVHWMeNZ+u+jnIHAlHgzOd3ubDzngpsE+EDOnDhfSC4t+DI/A9lQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10190.eurprd04.prod.outlook.com (2603:10a6:800:228::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 15:24:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 30 Jun 2026
 15:24:22 +0000
Date: Tue, 30 Jun 2026 10:24:10 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v12 1/6] pinctrl: s32cc: add/fix some comments
Message-ID: <akPfmrxhjZkpxsDm@SMW015318>
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260630125403.546375-2-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630125403.546375-2-khristineandreea.barbulescu@oss.nxp.com>
X-ClientProxiedBy: PH7PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:510:339::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10190:EE_
X-MS-Office365-Filtering-Correlation-Id: a2cd345f-18f7-4a2b-e90f-08ded6bba974
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|19092799006|7416014|366016|23010399003|6133799003|11063799006|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
 PzffMNF1K5Cpem0ZvwFv/hBWFpSHaIACxrgxQZn6iP+da+s/lRyWjmPP89etcrdG8K1CNx/ioHKJ1U5MtRm3WEtRyDA6U8mojTmsxKt0sbzKnLPTK1gKfcgLMhR/8NJa+5pRuSSYCuJax0VD0igBw3oLDc+4Fxh5YPdVlavsU5JQ4Nfqn7J4OrFxBYK7UbCH/9Q0DlG56Ob2T+OJA0gB3ZK0ODT6Yiwtr52pWIk7KH8dlI3ZRz7qLp4UhdXvmhkuYG87Cbaq43McGcmhLXFOMzo+UmmPCyScMHGltIPQZIp8Rbw+AXyC03Y4ZiWGRAjD4HgwxqlgxTC2omULnb23yNjQqWCVCQsQRnpdQ76h/2Ir1M4bFsdRCQatZPcrfgmQgp1l1D5PD6CW0TIzkFvTVJxaR/cHIG6IbAs92mFcN8dJdziJCLHhot/Mbx1Uosc5Jso48EykFYdQlEbjqNKs/jM+MZLphXNS/9E3kcQUZ9/4gm1MtM5V5FWKqpvdjOykeUKjAyv17AeJBkMFZfrY3X5mb48vqFNbJflU1LCTN7Ff/yTmKKf3U+Lc+A20pdKKq/O6ZY+I2v1XEvR2zs7eiFo6GEZ0S5r0x4afouFbVsYl99uNC39O2fAXA4FrefJYEFGMwCcyx9tYtpBv2gK1rxoxtAyEuL+3eUFjRBp6h6s=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(7416014)(366016)(23010399003)(6133799003)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?XOAC0zaTo6Ghakn8WJ8Z3V3mqRyOqTUDoe5YXJTYDrd9jGVI/pYBUOc3NqsL?=
 =?us-ascii?Q?nprQli95DEqCxzH8VWxEL8yxtjEaTR+H/sTJ2QZPhvtTadaPYh+KXgH5+MPB?=
 =?us-ascii?Q?yI0wqSixKhGLDie51WxSEfXDfYAyXA1M3fDKD0oaX1YGYsTbP6ETVn21M/hw?=
 =?us-ascii?Q?u4qmJdHixOla3pE4CoyidOoBNYvkyu62iBhBZ+egIxxhP4Jc2+Pm95jgMGgD?=
 =?us-ascii?Q?LRbouDmpaokhkgips9F6ZeUUjov3C0HP+7c+wdqbl6czmZQXYOknEUdzz2uf?=
 =?us-ascii?Q?ZWlWwYMPuAFl8j12sJZsqQmhtGNwcfjkQO5b0wxrH9C57IRpKGLD+Q0+zJGj?=
 =?us-ascii?Q?eiusApSUTcOSvb0I0XM+CgnpAOUNpV6W0X+GplMxGOgLkyfmqOj3PCCgHDOT?=
 =?us-ascii?Q?mGHgsaJiHbNgyPSwrpLLRpgQYXtrxd2xH18OxAda8dQF/zkGUpOt02SoID39?=
 =?us-ascii?Q?fIvGlcoWePCzXb5rYcZpbkffzoy6Vm/rEGQmsbl5G40D8o9XFp1PKoGS/sAu?=
 =?us-ascii?Q?LjvANtlDx6LgxUA3lWIM2o16pKs1Ne7JP3uYINz06C6IdQvNSNGT+9xT9jKf?=
 =?us-ascii?Q?dkhguaSBoCKOel7EffQWBHHs/57tbOYFZXLv+kWMEMLfKI5lw+67urS6GGtm?=
 =?us-ascii?Q?FrYdRh5JIlt/besjhklTpp19neJ7jV0a6Dr3toBQUqrEn/aPxSIqycCuKuDX?=
 =?us-ascii?Q?Gwbil39IaFx26ycDyhvF8lVT0ioOTq0S4b/fFtzVXl+yCm/1wbQMkRXK7UxC?=
 =?us-ascii?Q?86q1DWRYWkYvZW16Tx+W/kAKZDt7lfRFMfyOQfdsbD3bR2f/0443Y6fTzYSx?=
 =?us-ascii?Q?sddGD88tYQzHlsYmsJZ9XUXuIUj0kgKyJKyVNOetcMck4vLdlWRImGXkNk1d?=
 =?us-ascii?Q?5ZQ4VQdRXEW8Me505jULWv+Hs8gPgoGy0SlduD0mv6WPJQ8P1ZXrRELVyuGS?=
 =?us-ascii?Q?mjmvG/6ZRJC9xuQE/nr36a4s743O2jXTwNCNXQC75LGjGfW3eD+pM2kF1+XJ?=
 =?us-ascii?Q?Uci2ggyawJC20Bi3r2ENgz4u3LnYtcjZPH7y03eKCAqBmnBi3awQVKdI9l6Q?=
 =?us-ascii?Q?5LqbCvLJLl9BT88zQEYFKVx3pgUHjMnwRr626BCLSxOd2DUfUZzb3PQgri6X?=
 =?us-ascii?Q?SaHw1hYuL6f7tb1ixthC7TMFAaTvj4IXV366nUxtRSyGpv3etn2hBJ56EHZC?=
 =?us-ascii?Q?kkJALHYBVCM22qyGh0JUc0stkHhLGj3IWLP/W4DoOVtlyyuF2HqlDhmuQ7ca?=
 =?us-ascii?Q?mW+bRKPAgWdpfTE8zKaNvyk+hj/xormAXdzugBTSW/+dwlN2XblliKpNZRWh?=
 =?us-ascii?Q?BmHkMpwh5qiv3GKwKs8TZLNdmCK/GPVpHX7yjPJ5QrNNVBeyAPKyi3/cDde/?=
 =?us-ascii?Q?RRddbdWX4ahu1QX3Y+Z3ZrKy6t482uTwNVDNeDfUWmvR6Y3rW60ATjO8SYO/?=
 =?us-ascii?Q?/bD1mFxAUFyZSdEs7j/WM9engL+I4rmD2iYLNYwrpLtkbf39UXNx6vst6YUT?=
 =?us-ascii?Q?ThkbxzAAwWKVEw85e/ZR4Gs8DsnzuKQR5SPlaFv8wy/4Z5mLp2FcV0LrYoWc?=
 =?us-ascii?Q?RefpxGpKnfwxZRzAZF6SF3jJRCCCs57+Dj0+y/DGfJca+pIMWBTXXJXXzQ7c?=
 =?us-ascii?Q?Gh/DU6Pdl2oB17BmvxwCDItcB27QT4zntrANDRRlJp7P7fzjYmPb+AWWHRZN?=
 =?us-ascii?Q?hP0IpwFhLA31GJ9Lw4vKhL8eHURipYgG0ErHwp7s8A5CEOC6ZqHRv3z2VnjR?=
 =?us-ascii?Q?2rqF+j0/DL/dXWE4iHwYRXGrKrQ00uRWcf2WNabB1W8JuCIa2JfG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2cd345f-18f7-4a2b-e90f-08ded6bba974
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 15:24:22.7088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEuS8Y5xLOHDJ3/hhjtDTf7rlowkZ3Zyk5iLvNqNJLNb+ATTdnLLPYAVUAOHsqZobDhwpnYEvj6iXp/YjJFrqWUpfjhoxEu7SEoYYyFb89tr12GSIGAWPJtX6G1tnWFX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10190
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39247-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:khristineandreea.barbulescu@oss.nxp.com,m:linusw@kernel.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,linaro.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,nxp.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C9A46E5E9C

On Tue, Jun 30, 2026 at 02:53:58PM +0200, Khristine Andreea Barbulescu wrote:
> Add/fix some comments and print statements.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> index 56be6e8d624e..2a32df932d8a 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -60,6 +60,12 @@ static u32 get_pin_func(u32 pinmux)
>  	return pinmux & GENMASK(3, 0);
>  }
>
> +/*
> + * struct s32_pinctrl_mem_region - memory region for a set of SIUL2 registers
> + * @map: regmap used for this range
> + * @pin_range: the pins controlled by these registers
> + * @name: name of the current range
> + */
>  struct s32_pinctrl_mem_region {
>  	struct regmap *map;
>  	const struct s32_pin_range *pin_range;
> @@ -67,7 +73,7 @@ struct s32_pinctrl_mem_region {
>  };
>
>  /*
> - * Holds pin configuration for GPIO's.
> + * struct gpio_pin_config - holds pin configuration for GPIO's
>   * @pin_id: Pin ID for this GPIO
>   * @config: Pin settings
>   * @list: Linked list entry for each gpio pin
> @@ -79,20 +85,22 @@ struct gpio_pin_config {
>  };
>
>  /*
> - * Pad config save/restore for power suspend/resume.
> + * struct s32_pinctrl_context - pad config save/restore for suspend/resume
> + * @pads: saved values for the pards
>   */
>  struct s32_pinctrl_context {
>  	unsigned int *pads;
>  };
>
>  /*
> + * struct s32_pinctrl - private driver data
>   * @dev: a pointer back to containing device
>   * @pctl: a pointer to the pinctrl device structure
>   * @regions: reserved memory regions with start/end pin
>   * @info: structure containing information about the pin
> - * @gpio_configs: Saved configurations for GPIO pins
> - * @gpiop_configs_lock: lock for the `gpio_configs` list
> - * @s32_pinctrl_context: Configuration saved over system sleep
> + * @gpio_configs: saved configurations for GPIO pins
> + * @gpio_configs_lock: lock for the `gpio_configs` list
> + * @saved_context: configuration saved over system sleep
>   */
>  struct s32_pinctrl {
>  	struct device *dev;
> @@ -970,7 +978,7 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>  					    ipctl);
>  	if (IS_ERR(ipctl->pctl))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
> -				     "could not register s32 pinctrl driver\n");
> +				     "Could not register s32 pinctrl driver\n");
>
>  #ifdef CONFIG_PM_SLEEP
>  	saved_context = &ipctl->saved_context;
> --
> 2.34.1
>
>

