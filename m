Return-Path: <linux-gpio+bounces-19071-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C887A947ED
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Apr 2025 15:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E6813B47C7
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Apr 2025 13:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E79E1E7C09;
	Sun, 20 Apr 2025 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dsKEO6Ut"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5849D1BF37;
	Sun, 20 Apr 2025 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745154067; cv=fail; b=GzxAQZ5AfRht8IqFMGt4smDsAI4J40HJTbN1Sx1rl8Gab9UQ5ISGf0YXC/GdIXyPOZpgn/BNanFJneeN2VhFmLxSCcwpJA6ogkKd/+eCO4Bbb3ha74U6hk0MhzSvduVGE+0lNMRmdlw60G2arsvii9V+RZAb18D38OS2gxzIQ0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745154067; c=relaxed/simple;
	bh=z60oPMmbrkMk2yP7/gGvdp+JZH3hPmvbXVAPwIofkaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qlhGH90+mEbquerikylDGh1t158FVlGfKQJcO9dG9oy9arfFgzGs31286RU8esnqBVGFU+9z0HTS1dh0+ORaIk91smlDs6z3K+QLhhERf4dsk0ecCgMafZey9WhgDB7Z/kpwfH7j2Tbo5kY1DV0jfJUC77xj/sqQEneTmomgi7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dsKEO6Ut; arc=fail smtp.client-ip=52.101.69.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5jsyACcg+JG9dgdQVOTVIMcU2JLPa8j7HSn7igSeI948MYS8BhpbPBUMqyq7qIQQVZTyQhuEx6R8jjcb6n4vEQcDR6l910Bn8O70u/pF4JZKHDKATvHV4E5M64l5snIFAX+6R9zyJ9JnAYxJcP62ZDuXaqdLRIW7EDTOFCa77FT6useZKpe+FXNzGjNf8W2tuvLerSx/8T1HFFaKS1zTyvz2f6KPcpBda+e9XCsg98FF9nmZdj+o+gEeqH7pgfo/bbOM/8TkhWSnTf0JRQSNZZWhx3Ds/MM8YcuNP4Eq/k+pOt1ndvl0hygj/YuG4yzch8NEEG89OxVjv6ru3dFrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AliZtT2Ah4ogIeSeVRiVgwW6DZoqQ7NrzIpzML0hhpQ=;
 b=p+8woc4p1MnMSd3RgKXRrfLFpXZpdaNLBAygvhY8+Zv0nsasnyr9SRh7UNKf1W/i33Z6a5kMYgufBenbFAE7AL52AB4nAaLP2KTyBm+bq90CB7XLDbuRLffoycobzW9VEyEaBbRqr0GjlXrE+leWqpVPtYlBfl82ZiaRJZyVGUW+CH5k5I+lFv5b90PuiDwU2QSPTRrZJR7OZhoR1D8MyFeLLRuXl+2MU+oYH2SAN7kWcvnLaVKUNbJ0uDnDhR50at2t3ANuc9kANQjcT+aTcAqgGDVqAMTQBNkANRh05hZpRlqbPcbQ/bhkFuQWC51LA4QTvRZmHA49JYznvifG0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AliZtT2Ah4ogIeSeVRiVgwW6DZoqQ7NrzIpzML0hhpQ=;
 b=dsKEO6Utdh9vTBEGXCEYAt1CTUs8nhOsnJVEPR0jxEAPAatiDcWs3+WyZ5hIHSq3Cvrt0ZuMwozir46wEJeEDTg9P4FW+atMxViEDBg6mN+zB7xsuJ2TQKFw8EVkwKpAtvJEZaGXYRh0I2XuSht4C4wkEovz1VZ+yhDayZDDC7WhYlGqNy6YBN5evDowtRa1OEEQicT7blHdhZqFAe2Tch/qe3tlCEDEz7vZTXzw1XKEwfg33fLOmqTt8XtlBI5Y+ILE/J4JysyqdJHUegwv2quhE8SASdBVat0J2pTGWoK1M4oV32R1NDD+68ky1AZ5h8HCNpcnQNf4oK4H+mit9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7859.eurprd04.prod.outlook.com (2603:10a6:20b:24c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.30; Sun, 20 Apr
 2025 13:01:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8655.031; Sun, 20 Apr 2025
 13:01:00 +0000
Date: Sun, 20 Apr 2025 22:09:44 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <20250420140944.GB31933@nxa18884-linux>
References: <Z87sGF_jHKau_FMe@bogus>
 <PAXPR04MB8459EA5C7898393E51C246AD88D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB8459A73179FFF0ED0C9A51E488D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z9AdICiyaCmzKh-N@bogus>
 <Z9FnZzBQuZ1j5k3I@bogus>
 <Z9Fv9JPdF5OWUHfk@bogus>
 <20250313052309.GA11131@nxa18884-linux>
 <20250409035029.GC27988@nxa18884-linux>
 <20250409-incredible-attentive-scorpion-fa9def@sudeepholla>
 <20250417-diligent-anteater-of-felicity-70bff3@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-diligent-anteater-of-felicity-70bff3@sudeepholla>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG3P274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::16)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6c1fc8-7d33-40c9-2dd1-08dd800b664d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cMfO44PNA90LIn0g/A4DnYj6U41zzCSCFxmg6E6wj0jBfxwGF8ee9e6DAzEo?=
 =?us-ascii?Q?nIkXA9l+iFSVLShcs4bZSAj5KmTVN2DI7VFddIRLywcjiHtP6EMhGoGYCILC?=
 =?us-ascii?Q?9Ras+UumWeYbJ9uvz+UcaSgQSCSn5FHw91GXus9AYYdtJ4S62uPn6lIuDQ0T?=
 =?us-ascii?Q?dTonqHKLxnwfpImJX5K1B37tnypu/o0v2p+Ca5cYKqO8Z/cGMu61+jdP4qr3?=
 =?us-ascii?Q?7fiyha4/GN3UBVN4bZ1g1z3lPK3L8qo9rhMhKoiXAthQtIBvYbmCn79yxoRd?=
 =?us-ascii?Q?26MS2wj+RWKdxhGmMB8AvTnGPApxQguQuThOKoRK8fRjaHO/RO5zP88epEA0?=
 =?us-ascii?Q?hBh1GjsrlNRXERFEKVrw6MFjPdWV7xd3C7uu5YlqsYoK8yTUYxTjdOFRDsIp?=
 =?us-ascii?Q?PzsCOvWBL4YDGwfmNlGTIf+Ay60W7HFKI70hgKZiu6h7Vf0clt4qz2cc0Vkl?=
 =?us-ascii?Q?sUD7PokH0CCqzYpA9lzq1+jk1uNiqxAXJyz+/k8olGMs2JYchQKwHXw58kcH?=
 =?us-ascii?Q?pC4tputTXOIKrFwl49OTVocnTkuNjcbs724zysAeTooQzMvLbdMGEuCNRjB+?=
 =?us-ascii?Q?Qi70OFzmqh6pMebYZv2agWx+ZNboiQ1WU4EZC9/qd/mVoKu0Pe2+bmmGwl15?=
 =?us-ascii?Q?Kf9S0/slKTWFLm6kO5K0EnIsKJbOtAiE2r1PYHUWoP2L2l2FfDEy9Fh8YtMd?=
 =?us-ascii?Q?AVPbPP27NFq43MTO4Rew28gQKa+wfcqeNB/x/1yM4SlFHRRE3lhqCatprsyg?=
 =?us-ascii?Q?Kp/4mkocKiwYPeED4gKRXfCl4iLCysOy3yxGF4mcwlgSSV85JaEE6Sf2rYFW?=
 =?us-ascii?Q?847bcwWKZ2rPsvCpFKAC2rsYdAFD4C26U2ljJaOh3fc2LdlgAmrxfv5vqbHm?=
 =?us-ascii?Q?Ux+4k6hFyCZBuBdYxuyVUo6m+y0AhICje3I0x4tSS5AQdbJnqXUSNU7X71/e?=
 =?us-ascii?Q?lgbTeNsvoMWUSUzJheMEzpuWlSid/IUNu2d+5dNMy4HjXo8yzOPdD9+sK/RP?=
 =?us-ascii?Q?lnWHUCvjsraLiTNughRXu6cWvfPL6bYPTa2GuwwJHUcrH4SpHh+VERdBWziQ?=
 =?us-ascii?Q?g2tcEHP1IxGv20c+B+BAKe4Wb8bmXqyAVucMzMCQ4827C7D1krEs7h3Mk8Ma?=
 =?us-ascii?Q?Et1sj+bnz7wujHXgQZyWzZt8vzB6v/ZTwoETPtsP9ihIJ96bWWxqCbRhc9jj?=
 =?us-ascii?Q?TaXwkUxRwp4vji1pNvUw3+kVei3CUVPUpXMrYikBiYYY0QQY7jK6brEVcve5?=
 =?us-ascii?Q?qPn10VSofkAmPSUR6bY4jQxLFOhmIwX6/9gIIA28VfW5Z6Pgnp9LeqxOyY3B?=
 =?us-ascii?Q?uubb7+gDLPEUaWLCra6XlOMz4K43KnClrnPMv/NgnKhX2WGhLUUHSm5qYal3?=
 =?us-ascii?Q?CToCcGq4ev7EF2ZRMoNKX7hlXCeMalUmhkbjK0tZTs9BBpYgMpl1YDe6XBx+?=
 =?us-ascii?Q?ptUIctEgkldxhThggjwC4fKqZp/kKSbt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/oB+3APWRchLYMsRk7PQbI3Z/ax7Iffu3nH06iJY1kpaCMTtmqpahQc9m7f9?=
 =?us-ascii?Q?z+R7jZlFzSi9TQ9RaLE47d7d5SATWxgaRHg62GtoVB7iio8jI6nMp51X2u+D?=
 =?us-ascii?Q?niuZ694B1qw9SpdxZ66GJZvNJdCzhZESQOvT0v5cKg2C7pRgNcaWkIHse0z3?=
 =?us-ascii?Q?HPL2YtlTSQ5tXJK2AjRRL2+t0j9g96vXvqYZD7hfGGbLZv+bx19y7oDXalR9?=
 =?us-ascii?Q?iMHsCnQS6aeHLS2GF9KRaFUEJgZxsq0HvtpiCx2aYVmsz+wRW4bPH8E9kkbA?=
 =?us-ascii?Q?pbkljJu2TsdYbOhJ4YN7xqeOish5Pfnh+YNOpXmsLPGqUL+VeXzWlVSxx3NC?=
 =?us-ascii?Q?eD2s2oEh7VWvfwlo1H3y62yGV5Gy5gFX9RHahfkD9ep2zX6duRW/9oLMpjMY?=
 =?us-ascii?Q?ZGeKjJldQtlLQJheO9UOrPXmvog4phJBW2IKFIQ0I6A5+ViIxpKui88uxyrc?=
 =?us-ascii?Q?tdh3TozjV414MLc9iQv3f7UdGPmzfgNBnF4IyzqfHC8BJ2n9JbMU8n7+c71F?=
 =?us-ascii?Q?iV31Tp89UoHE3buoBhy5NRfk89/qyaRFWL6BonrxEqW1eciHJ5FyNdw6CGrG?=
 =?us-ascii?Q?pfzWy3H4bAvFxMTwBOC6xxGqvU4cq+YvPNIovxFbtjlFNbQ740CnrGujaDFr?=
 =?us-ascii?Q?Z8ki1C40YNiuX5+e2ohIa7GIl0EZHG7RVV5VCUZ5IF+ZKr8vL1zm4Wax405s?=
 =?us-ascii?Q?zrCG0WhE+MYKcsX13OjNEnB+gtCBit8++9q+yO7kOVvdrlnEb+T3HYVgyg8G?=
 =?us-ascii?Q?Dbb+YXrAagC6JboyKofZt4p+g1VOONG+pkEpae3zkc4ymChRQ/ND60gPtwE5?=
 =?us-ascii?Q?a5ZCIw58fQymKmpV08Ke5sGEsh9sp4+OhHlTsMozKtDA15QDKbNvwBcx2Nm0?=
 =?us-ascii?Q?Rea5NaJX6aOsdV20flhZe2IOFVB9t7URudaONHzrJr9G4WqmZyFhsaCmYATT?=
 =?us-ascii?Q?kWl/HCqGe+NAF2/wrpTqJXyQUqcgogTgVds6sQr35ZK7fX7TEt1Bv/Cx3rUH?=
 =?us-ascii?Q?C/YFyFt7Y6xqAmP1QSAAbnVWgUz7FzIjseAZqDd657EVbmVEs65gJEvpGu2D?=
 =?us-ascii?Q?htgnZNSmrs/gyMEc6oAt4VICODLx/DZ8B2nB4pbKfly+iyzGn3Ic2xuQRDeJ?=
 =?us-ascii?Q?eFPNfPw0167KBE0IWhuIVjXU4Q3bJNY3+lOjW+aBNOYJIFi3ci8YzkuzE3X/?=
 =?us-ascii?Q?1ubcPlzZG0Ld+3KRcNaXxcgX7ZyLd/I4L2/0FPMRouwOOdOrsy6pDXFu4Ah/?=
 =?us-ascii?Q?/YfBHZyXvSFCU2YbqbAGsLvkXUj9b1Nxl9yAZVUOlJTARdUc32v+TyGE8AbR?=
 =?us-ascii?Q?VcO755estzMK+hsyMRDDlxp5rbXi279aEKRtHVhwewbzZ7sN9I2yidPPBAQV?=
 =?us-ascii?Q?5OiUzqywpGXBbtjPIjnzso/lmLPfDnLk/IzMsLGSMQT7dCQRhZ83l/yRTY2G?=
 =?us-ascii?Q?lPnnIm1mjassnbxhmIZvRFX9RirM3b3xO44n2ickodjfJYLe07k23LsMZQ33?=
 =?us-ascii?Q?gIE3MhuSmq3F4M2sqZ001DG//7Eq0wpO1kZzOepr5PuF6ioS1yG8JVzay0wl?=
 =?us-ascii?Q?4KmPfcTlBC0en7SaQT+mPwIXU/EibyZk1pU95mdc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6c1fc8-7d33-40c9-2dd1-08dd800b664d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 13:01:00.8764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ewrmkb7HtRZ9tWckP4B0a1jrpKN70oBDWCn1p4dbaXFQsAvbeiVvQG7/d27+1w8KFn1h8XmhmVU9u4xoWRsCYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7859

On Thu, Apr 17, 2025 at 03:26:42PM +0100, Sudeep Holla wrote:
>On Wed, Apr 09, 2025 at 12:14:00PM +0100, Sudeep Holla wrote:
>> On Wed, Apr 09, 2025 at 11:50:29AM +0800, Peng Fan wrote:
>> > Hi Sudeep, Cristian
>> > 
>> > On Thu, Mar 13, 2025 at 01:23:27PM +0800, Peng Fan wrote:
>> > >On Wed, Mar 12, 2025 at 11:28:52AM +0000, Sudeep Holla wrote:
>> > >>On Wed, Mar 12, 2025 at 10:52:23AM +0000, Sudeep Holla wrote:
>> > >>> On Tue, Mar 11, 2025 at 11:23:12AM +0000, Sudeep Holla wrote:
>> > >>> > On Tue, Mar 11, 2025 at 11:12:45AM +0000, Peng Fan wrote:
>> > >>> > >
>> > >>> > > So it is clear that wrong fw_devlink is created, it is because scmi cpufreq device is
>> > >>> > > created earlier and when device_add, the below logic makes the fwnode pointer points
>> > >>> > > to scmi cpufreq device.
>> > >>> > >         if (dev->fwnode && !dev->fwnode->dev) {
>> > >>> > >                 dev->fwnode->dev = dev;
>> > >>> > >                 fw_devlink_link_device(dev);
>> > >>> > >         }
>> > >>> > >
>> > >>> >
>> > >>> > Thanks, looks like simple way to reproduce the issue. I will give it a try.
>> > >>> >
>> > >>> 
>> > >>> I could reproduce but none of my solution solved the problem completely
>> > >>> or properly. And I don't like the DT proposal you came up with. I am
>> > >>> not inclined to just drop this fwnode setting in the scmi devices and
>> > >>> just use of_node.
>> > >>>
>> > >>
>> > >>Sorry for the typo that changes the meaning: s/not/now
>> > >>
>> > >>I meant "I am now inclined ..", until we figure out a way to make this
>> > >>work with devlinks properly.
>> > >
>> > >when you have time, please give a look at
>> > >https://github.com/MrVan/linux/commit/b500c29cb7f6f32a38b1ed462e333db5a3e301e4
>> > >
>> > >The upper patch was to follow Cristian's and Dan's suggestion in V2[1] to use
>> > >a flag SCMI_DEVICE_NO_FWNODE for scmi device.
>> > >
>> > >I could post out the upper patch as V3 if it basically looks no design flaw.
>> > >I will drop the pinctrl patch in v3, considering we are first going
>> > >to resolve the fw_devlink issue for cpufreq/devfreq.
>> > >
>> > >[1] https://lore.kernel.org/all/Z6SgFGb4Z88v783c@pluto/
>> > 
>> > Not sure you gave a look on this or not. I am thinking to bring this V3
>> > out to mailing list later this week. Please raise if you have any concern.
>> > 
>> 
>> Yes I had some thoughts. I will take a look and refresh my memories first.
>> 
>
>OK, I will post it separately(may be next week) but I wanted this way.

Thanks.

>Revert to old behaviour and driver request fw_devlink dependencies to
>be created if they rely on them. I am not sure if that is better approach.

This requires to update various drivers(clk,power,perf,pinctrl,regulator) to
set the flag SCMI_DEV_SET_FWNODE.

Using SCMI_DEV_NO_FWNODE would avoid updating the various drivers.

Anyway, you decide which to go :)

Thanks,
Peng

>
>Regards,
>Sudeep
>
>
>-->8
>
>From: Sudeep Holla <sudeep.holla@arm.com>
>Date: Thu, 17 Apr 2025 10:59:10 +0100
>Subject: [PATCH] firmware: arm_scmi: Add flag to control setting of fwnode
> handle
>
>Currently, when multiple SCMI devices share the same protocol,
>their fwnode->dev all reference the same device tree node. Depending
>on the order of device creation, fwnode->dev ends up pointing to one
>of the SCMI devices, causing fw_devlink to incorrectly establish
>supplier-consumer relationships treating the first-created device as
>the supplier for all others.
>
>To address this, introduce a flag that enables explicit control over
>whether the fwnode handle should be set. This allows only those devices
>that require fw_devlink support to request it explicitly.
>
>By default, only the of_node is set, which is sufficient for most SCMI
>drivers.
>
>Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>---
> drivers/firmware/arm_scmi/bus.c    | 19 ++++++++++++-------
> drivers/firmware/arm_scmi/common.h |  2 +-
> drivers/firmware/arm_scmi/driver.c | 12 ++++++------
> include/linux/scmi_protocol.h      |  4 ++++
> 4 files changed, 23 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
>index 1adef0389475..eeab5de03a1e 100644
>--- a/drivers/firmware/arm_scmi/bus.c
>+++ b/drivers/firmware/arm_scmi/bus.c
>@@ -389,7 +389,7 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> 
> static struct scmi_device *
> __scmi_device_create(struct device_node *np, struct device *parent,
>-		     int protocol, const char *name)
>+		     int protocol, const char *name, u32 flags)
> {
> 	int id, retval;
> 	struct scmi_device *scmi_dev;
>@@ -439,11 +439,15 @@ __scmi_device_create(struct device_node *np, struct device *parent,
> 	scmi_dev->id = id;
> 	scmi_dev->protocol_id = protocol;
> 	scmi_dev->dev.parent = parent;
>-	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
> 	scmi_dev->dev.bus = &scmi_bus_type;
> 	scmi_dev->dev.release = scmi_device_release;
> 	dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
> 
>+	if (flags & SCMI_DEV_SET_FWNODE)
>+		device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
>+	else
>+		scmi_dev->dev.of_node = np;
>+
> 	retval = device_register(&scmi_dev->dev);
> 	if (retval)
> 		goto put_dev;
>@@ -461,11 +465,11 @@ __scmi_device_create(struct device_node *np, struct device *parent,
> 
> static struct scmi_device *
> _scmi_device_create(struct device_node *np, struct device *parent,
>-		    int protocol, const char *name)
>+		    int protocol, const char *name, u32 flags)
> {
> 	struct scmi_device *sdev;
> 
>-	sdev = __scmi_device_create(np, parent, protocol, name);
>+	sdev = __scmi_device_create(np, parent, protocol, name, flags);
> 	if (!sdev)
> 		pr_err("(%s) Failed to create device for protocol 0x%x (%s)\n",
> 		       of_node_full_name(parent->of_node), protocol, name);
>@@ -498,14 +502,14 @@ _scmi_device_create(struct device_node *np, struct device *parent,
>  */
> struct scmi_device *scmi_device_create(struct device_node *np,
> 				       struct device *parent, int protocol,
>-				       const char *name)
>+				       const char *name, u32 flags)
> {
> 	struct list_head *phead;
> 	struct scmi_requested_dev *rdev;
> 	struct scmi_device *scmi_dev = NULL;
> 
> 	if (name)
>-		return _scmi_device_create(np, parent, protocol, name);
>+		return _scmi_device_create(np, parent, protocol, name, flags);
> 
> 	mutex_lock(&scmi_requested_devices_mtx);
> 	phead = idr_find(&scmi_requested_devices, protocol);
>@@ -521,7 +525,8 @@ struct scmi_device *scmi_device_create(struct device_node *np,
> 
> 		sdev = _scmi_device_create(np, parent,
> 					   rdev->id_table->protocol_id,
>-					   rdev->id_table->name);
>+					   rdev->id_table->name,
>+					   rdev->id_table->flags);
> 		if (sdev)
> 			scmi_dev = sdev;
> 	}
>diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
>index dab758c5fdea..c948c4d88332 100644
>--- a/drivers/firmware/arm_scmi/common.h
>+++ b/drivers/firmware/arm_scmi/common.h
>@@ -151,7 +151,7 @@ extern struct blocking_notifier_head scmi_requested_devices_nh;
> 
> struct scmi_device *scmi_device_create(struct device_node *np,
> 				       struct device *parent, int protocol,
>-				       const char *name);
>+				       const char *name, u32 flags);
> void scmi_device_destroy(struct device *parent, int protocol, const char *name);
> 
> int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id);
>diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
>index f6c9e4491240..433b057ec0d9 100644
>--- a/drivers/firmware/arm_scmi/driver.c
>+++ b/drivers/firmware/arm_scmi/driver.c
>@@ -436,11 +436,11 @@ EXPORT_SYMBOL_GPL(scmi_protocol_unregister);
>  *	  for the specified protocol.
>  */
> static void scmi_create_protocol_devices(struct device_node *np,
>-					 struct scmi_info *info,
>-					 int prot_id, const char *name)
>+					 struct scmi_info *info, int prot_id,
>+					 const char *name, u32 flags)
> {
> 	mutex_lock(&info->devreq_mtx);
>-	scmi_device_create(np, info->dev, prot_id, name);
>+	scmi_device_create(np, info->dev, prot_id, name, flags);
> 	mutex_unlock(&info->devreq_mtx);
> }
> 
>@@ -2668,7 +2668,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
> 	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
> 		 idx ? "rx" : "tx", prot_id);
> 	/* Create a uniquely named, dedicated transport device for this chan */
>-	tdev = scmi_device_create(of_node, info->dev, prot_id, name);
>+	tdev = scmi_device_create(of_node, info->dev, prot_id, name, 0);
> 	if (!tdev) {
> 		dev_err(info->dev,
> 			"failed to create transport device (%s)\n", name);
>@@ -2865,7 +2865,7 @@ static int scmi_device_request_notifier(struct notifier_block *nb,
> 	switch (action) {
> 	case SCMI_BUS_NOTIFY_DEVICE_REQUEST:
> 		scmi_create_protocol_devices(np, info, id_table->protocol_id,
>-					     id_table->name);
>+					     id_table->name, id_table->flags);
> 		break;
> 	case SCMI_BUS_NOTIFY_DEVICE_UNREQUEST:
> 		scmi_destroy_protocol_devices(info, id_table->protocol_id,
>@@ -3244,7 +3244,7 @@ static int scmi_probe(struct platform_device *pdev)
> 		}
> 
> 		of_node_get(child);
>-		scmi_create_protocol_devices(child, info, prot_id, NULL);
>+		scmi_create_protocol_devices(child, info, prot_id, NULL, 0);
> 	}
> 
> 	return 0;
>diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
>index 688466a0e816..2546b7977fe3 100644
>--- a/include/linux/scmi_protocol.h
>+++ b/include/linux/scmi_protocol.h
>@@ -947,9 +947,13 @@ struct scmi_device {
> 
> #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
> 
>+/* The scmi device needs fwnode handle */
>+#define SCMI_DEV_SET_FWNODE		BIT(0)
>+
> struct scmi_device_id {
> 	u8 protocol_id;
> 	const char *name;
>+	u32 flags;
> };
> 
> struct scmi_driver {
>-- 
>2.34.1
>

