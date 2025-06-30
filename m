Return-Path: <linux-gpio+bounces-22389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1F1AED3E7
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 07:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 767603A31F9
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 05:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025B71A9B53;
	Mon, 30 Jun 2025 05:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eckelmann.de header.i=@eckelmann.de header.b="SZol2vtv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from FR6P281CU001.outbound.protection.outlook.com (mail-germanywestcentralazon11020140.outbound.protection.outlook.com [52.101.171.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994FA19F11F;
	Mon, 30 Jun 2025 05:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.171.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751261782; cv=fail; b=ZlY4mm4b8B5C6fV6FnFkdXA9joY7wpUYqdEGMcQ3tJCH2uZG51xVT73B+mvl5KCRLOF0td/wwcCcjirTh+anOSnFq4Orz7y9M/uNxOLAydVCs+GVObLSmEpn33pTEbakYzyAQrTqiEMh+dCUINxxd1xk1kJe7ycnGdy0ChllhTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751261782; c=relaxed/simple;
	bh=wwaOFoe2F7R69eK57OP2JMVEsYuI4XCxQItHE5xn0I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZwLBSKWAA5Kglyly6FoV8I3WRXivubY2iRfQvUSMHG8G98KRwh5XciZ/Lnx1kaRKAExZGV+sbIiFuYiPqTezFRvDWgqZLfp4DIAybS6V96FebQ3oSd5Xf9DSMes9lrsMMNITzFSfhdM8M3fVBorUmmwrC2SwRAsCOSyRIxtAWCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eckelmann.de; spf=pass smtp.mailfrom=eckelmann.de; dkim=pass (1024-bit key) header.d=eckelmann.de header.i=@eckelmann.de header.b=SZol2vtv; arc=fail smtp.client-ip=52.101.171.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eckelmann.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eckelmann.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6IEtWeckxGnHu0lDOP1Y1scKLUefFpXHVuNFUVD93iKpJTyHYfgX4iqDxV1EBS+deaBBfAnltNa6wFnqdtXivbSRLkCKNEp3AZNXqKO8SYJaD0lV2V954VD9df+QB0Y8oJR42MBrCMobtLPBWOHgdDT4iFCPjV+WKUmkcHkMChwlE8GuK4SKU6L28lXLyeZtbZgmGt9jN1LZBUKhNhAfkCl8EXYft8Bs0ILMqR6G1kpfEGrn7iFAYPSp0NYWyHoCb+1/+UM02J2cWkd3EYBfW4xIjbjnM6vBoauFnoCIYljWBleKwX/m65VdOep+Je7crH8t5GnduIhshjkCziTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8AhFZHSAt8/9lzr7Q3w5TUpnX7QCvA5iu/U1UBwj6k=;
 b=tT0Z5bTe4NSZlsAJP5OiO9vF9kmasXg4TIdVc71XRLT7IXeyL/DEkxXc4tQuUNB5k/uCaMzGJTkI6ofmUW/6qL19wFG67E+xKSuj7S5dZZpDnKKiCEBetR7CwVJSTErz3pC7U+l0xvC2bYUN6scsGIb8yQ7hFnYIbo7ELFmLrCqpNizKzihCQXENKAmCnUQ5Sffa8dDecRAuUgwXEUbzkLoG1R2iAXo6tQr93C7Vr+sibbcziohweZjVe46b8rJQThGPrJ4XDfbpt4msy1vxEioKhbo19hGFtsCvVJh/zwZnvbECDaRdL+m34nB0HUpCl8xlbZC+LktfuOwcGUJezQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eckelmann.de; dmarc=pass action=none header.from=eckelmann.de;
 dkim=pass header.d=eckelmann.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eckelmann.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8AhFZHSAt8/9lzr7Q3w5TUpnX7QCvA5iu/U1UBwj6k=;
 b=SZol2vtvM54sTlsblyxzP2/xnfhIK45ToUHSEcUh4pRthqwji7SjSgX8hrwTK19lWP/qO0/xbi0JGqvgZAqQ+CFUDBy4YYvS/zFYwoKWZdEQQZW+XHDjGFYt6z/72xk7T5q/Q6LG1yRUvLgCritPN9XNP6MjnU/QhR1TMbG5m4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eckelmann.de;
Received: from FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:da::13)
 by FR2P281MB0268.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:10::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 05:36:16 +0000
Received: from FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3927:fe99:bb4:1aa7]) by FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3927:fe99:bb4:1aa7%7]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 05:36:16 +0000
Date: Mon, 30 Jun 2025 07:36:15 +0200
From: Thorsten Scherer <T.Scherer@eckelmann.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 04/12] gpio: siox: use new GPIO line value setter
 callbacks
Message-ID: <j4nypsywtvsaryl7i5hxmkq3p6aahqdovmtswiiftq66mpthjc@5qyag5c64dtt>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-4-bc110a3b52ff@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-4-bc110a3b52ff@linaro.org>
X-ClientProxiedBy: FR4P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::18) To FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:da::13)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR4P281MB3510:EE_|FR2P281MB0268:EE_
X-MS-Office365-Filtering-Correlation-Id: 5161ddfa-bdb2-4019-2e4d-08ddb79808a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iYhYzp7aiam9+ASdAm9BDxHhxUVtvxVX2R/16C2Wn0NnvYHmq8vjzlo8aeoq?=
 =?us-ascii?Q?336/vs9baqqQdQyvafF6Ogu0MlHjkyMpGdaMINEdl3G4f+Ddk99mhUEWf1XD?=
 =?us-ascii?Q?h/HskVsystvJ0tqlSGie4RJavs/3iG6z+yawAFgPTaAOEkd3k2kuIDFvCE0C?=
 =?us-ascii?Q?JNbSvjiRuK09nodYc0TKReoU4dBhON71T12dCSmTiCjITVtXwPrmDEHY2e7h?=
 =?us-ascii?Q?2SWCLcm2wEnCVXNAwByzrK7uU5a+1ozA3gbeUlrlUPvNwWiMgUPZUU5uLTls?=
 =?us-ascii?Q?hqMgrscVY21n9Sj0KOIp1z05fnR5B3bUS5uQMtfTQ0Dkv0W710QppC5YAEDp?=
 =?us-ascii?Q?U1UwCQV/uky4bcLuIxNihHad0XfsjXAOtsbvvE8luvjsQfcbMR+LKFknp72X?=
 =?us-ascii?Q?w4ANyFP314YUcpsWJd9nvwcXW6kv+BTUMwHpQtZuNHMemBh/gRXozbkOROk0?=
 =?us-ascii?Q?W6TJmEPve+jAfF/Nx9/HYLPyAyAcekIN1Oy7tTNWf6R1fotn0W6WwttdBJ8z?=
 =?us-ascii?Q?E2m2dVIw27tj1TEYpgf6z1Ka8Ys4iLN1nEwCl/4c8FnbbTJFBf38bcvucmMO?=
 =?us-ascii?Q?fBrlwUX1N4U63xuV7ADDoPHNdtZa9JAy9C+H0EqE/UsEKDfW95JYhQWrajlB?=
 =?us-ascii?Q?M/mlzggyWMeVxZX3OSJQHFfUGHGLU4sn8hxuz9qGGbphXucTIiSkr1yXNFi4?=
 =?us-ascii?Q?9BlZQbqTgCNfd1UPAY1NEoUi7cH8eR7cTOyykJq6iJeoml49lark4UphTu7R?=
 =?us-ascii?Q?TfRRj1BngpPoPNUQzBt+dTo2ftIbMDAs9p2dCtLwGVu0i2xXjtwNPz781Cul?=
 =?us-ascii?Q?Tn5D19ZpNpvnUxHACVhZzH5ZaD1zDoWYbZBLKFVxL+pD8ZQlTKko3muEoWD4?=
 =?us-ascii?Q?9kOubnjngSY7RYpDzXRTjPJG8NE/dZ0StJeZTNq+b0vUOXUGAKqbp6Qp8BTY?=
 =?us-ascii?Q?BBGR+qOEUI6Jy0EHZMs+zn1Fj6oWQGP0x29dUvbhI0DiZRbCwmYF4i/gAwxi?=
 =?us-ascii?Q?EK2TMeg4KnsRH1C0azC++ynDjfjPf9LRcQJVrvSSwn7v267NrUAjOYrNtopC?=
 =?us-ascii?Q?D7Oh4lALmTmTd8UfPLBw0f3oW86Udb84PKl1aq+5mc3M4fP09z9irqZEGYQL?=
 =?us-ascii?Q?pCmI5XmN2Pf3sL8Q6Ezw0Tw1sQZPMijX7xIsQrJ1PBtY+kMvns7aqrtfbg7J?=
 =?us-ascii?Q?KXZMrssETCAwckkcckbzM/hVqPeebl9JTWWQX8ahypnfqXlKmkLSsTQ+wBLf?=
 =?us-ascii?Q?RLFUx2npsJD3N66QSsisk8qq59J3eblRtFNnpwuyfbLM/2h9896IqDYg6Yaz?=
 =?us-ascii?Q?J6GOqJBG2vhKOa5rvY6SIyP00KYRFZHfHeD565MtzXw+W4DKWXyeT9Qtvyyo?=
 =?us-ascii?Q?r4QzncAcqcrTgvsBnzEOJ8t8lAV6nKTQK751dEnSK92QdcqnOA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EGzOFFMEY+zTLVA+Y0xsmvVT0LVuBRekWpsgL4lxVB3mqVlMfAlBbNLSxcCv?=
 =?us-ascii?Q?/ESjeIcyyfCh4sIbAD1pCp4HcY9PAUH3gj/qG4sNrzVb7wWSo9LqW6yXIfni?=
 =?us-ascii?Q?TxxwXCJKIbMFy2IOI9rCqHOGKgOwZtMq3rzkbtUC26ke46rDOgSdiVD4Dpa0?=
 =?us-ascii?Q?6OyDvGPGgDU9918Gb47y0EdepumGvtIri6P5AQV1WjgKsraJWZ8Cq9NovtqF?=
 =?us-ascii?Q?F/MVS+825rKqyKrnOaTijdbC3sHQDORaDb0J+S0ckc7vHR8x7JVzEsEk6AIE?=
 =?us-ascii?Q?CyfUmVJezivA9gSXPOblPjWmms1U0O731PYsx1QDSd6GN8lYzGSGlv2TgFKP?=
 =?us-ascii?Q?Ufe1DCwsEAof1P/Ks+zFIZfgtUoYT+cPI30naXrCG+eBT5NZV2e4+YNXmqTi?=
 =?us-ascii?Q?Pz9IpS+BxziRbd1QDZlLOtQqON5r5TAr/+66BYHWoPbOwf1ex6xLmy6V8jkt?=
 =?us-ascii?Q?nIIAkSSJRGb7xDQVLHajyj8MJDga5HppV7W5gVGc7G7fzemjSzGhSyaam1qk?=
 =?us-ascii?Q?iOr8hAhF/xapPbQS/wv4/kGQywbKW09QgN99hV2w5Bzrqe8RbhhcbYz5YPBW?=
 =?us-ascii?Q?wRODljdkcUqs4RWqh8rhcKHzJUTY40Sgtf4LMfN525joDop3pZImYybDfH0J?=
 =?us-ascii?Q?wL0YdVOeO6lVzCfZHn/zRzh3EyNDTogj/eG0pMWvVW7VMDC4cUyLpn/bN/Sf?=
 =?us-ascii?Q?fL/faU6xLm6zgzaMvGurIcGnRnzF8mZSaDeVnscMtqOSPJM6AFumB8V1+Cq/?=
 =?us-ascii?Q?MEfB48ywV66cYazMHpQ9xBD67ti+xcT5fbOiYUbSInfZj/+PLJ19U5xNZS/j?=
 =?us-ascii?Q?d8saQn2u1mBz/DOpLIBTrmQCmMr9A52ekpJOS3DeWZDiOi68RO9ebSFMY7VY?=
 =?us-ascii?Q?LItvxe2N8TJyHoJed4QttIlvUCaxoaZzs2t7l5srTmtralQ7HQrxYVBmJD1i?=
 =?us-ascii?Q?VP2280qTeER/RfzDgvs2xPJshfu2e4r7sOUAtYg1v24bBDyszTxPSoRRRQ4s?=
 =?us-ascii?Q?oUuMGwHNnDKiyZZWcNr1q4NPmyeRwpQoxFdhteQ1N4qnjFAiUJmQDi8uZw5i?=
 =?us-ascii?Q?dQRoHCdcM+2HSxjzJh591pTQMA+MkhzAg6v2O1s+Bwb8Rh2/KZKBxO3ya2Ir?=
 =?us-ascii?Q?9DS+gtjKsMxCzXUHLmg/51QuKgUVM2YaBur8e3J8dePscvxAiAC3+TF8fw3J?=
 =?us-ascii?Q?jeGTtd4zgBdnZLgyE/zC64aYq3LkbuJN4hCAZPZOZOtc5po3fVX8MD1JP4XH?=
 =?us-ascii?Q?tLL5FEZF0O/VsvLTAYHAKyuU2FVNYixyrNFQbO+M598QNHIiacwpsHSYHzHT?=
 =?us-ascii?Q?UzOSNMLB4SVnyQ98x3VDWxwCgm0D1Ma2LyrYI/5SiJHReaJGZi/iww0uBJD3?=
 =?us-ascii?Q?0lst8H8/+TqOWRHuf+tZYnGxePzdZIFAJGYbfMT0b/nRuvjHs02zoKsOp2Py?=
 =?us-ascii?Q?qvh48jK9jYFh+bhHEFnJ1xrBiYtjUfguc+bPArzSwKIsvXXZUV7cJJwwjIOS?=
 =?us-ascii?Q?FF8kCdMOdywZBYvZBL8shm7wifk+5yMBX6gc93M0EgrwdsIaMln+xXMrsTL7?=
 =?us-ascii?Q?S+uUIZD+MioIMr/Y8Uqvf/z1St8foKgYhe0L6SB5?=
X-OriginatorOrg: eckelmann.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5161ddfa-bdb2-4019-2e4d-08ddb79808a1
X-MS-Exchange-CrossTenant-AuthSource: FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 05:36:16.6414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 62e24f58-823c-4d73-8ff2-db0a5f20156c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ux8y5tXkaZ6CtE21UuoG3W018FgJLVXXy1TV7y0GDcg5nfmksXxCsdbkZ209GQ7LmDnm2Flz685R4Rgsskw0PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB0268

On Wed, Jun 25, 2025 at 12:33:27PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Thorsten Scherer <t.scherer@eckelmann.de>

Best regards
Thorsten Scherer

