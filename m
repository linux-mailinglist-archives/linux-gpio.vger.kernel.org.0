Return-Path: <linux-gpio+bounces-9248-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B0E961E41
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 07:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EEE0B20CA3
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 05:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB79149E09;
	Wed, 28 Aug 2024 05:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="C+7DfAK5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2136.outbound.protection.outlook.com [40.107.215.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F44D512;
	Wed, 28 Aug 2024 05:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724823319; cv=fail; b=J2rMb2EKiCXyJ/D1qjcA4lqk50FOvNKxjs0Ux+jyhpvAHhVh/juahewQhdOx36653dxDszwlKxNt62lPqaHHrCBgyt79g5w5UoHrlBzM4V6pufGT6Rd5SzbP/j7BYgd0MyLGdP2iJ2AiPZJtOk04GDBfsK/hVbo/L5RzMrVQfw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724823319; c=relaxed/simple;
	bh=z2LeYhWsyGp+9fIR9zUhCDaTG/mPyRXSjWonKIrTRl8=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RY06CEHa6RdFcAeV6uP/vMFZOJz5HvHMFBByEecz9R8KVBE760lfoQ0WJHWbjbXiFQOUY1LJe8OiSL7amn8McjdK6qfOJdDPF0BSF+FwokxATOX7Ys1RXleVc7tVgn2dJRYhUIsz/mOLgbvPKTPdY8/57L2Vx8CcNz9Ni9FYN28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=C+7DfAK5; arc=fail smtp.client-ip=40.107.215.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4CecR4/UvWT2uD7MOtz0UAR1bJ0TUTTA/m0O3EtpJQhFFxg/HC4x+oRrHw6jLB8XWEFzLYNg1SdA3zF2qpgxSz7lyQPrG30GPq4hxNLY9OTiFWLSikMGsG9Wrg1WIdrt5SYtrfjPhNc4cQvPKAXNNHScI+Qx26vtGWLjQY3xzZhS8/5wmhsP+tlcw1brXp1LSu4xERrhYyyxwSBqJNFuuOw99CEz6cixsoR0bgdU7PcPJC4FGbHfVROYtkBF2mb8NxWjsJCMXsKxjiTYJV/pQIWHE8dmgGq1cPRwY4UazM1AHz/U+a7l9FJvv4V4f3RncTaP+2e8KnZCOSz8xZFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2LeYhWsyGp+9fIR9zUhCDaTG/mPyRXSjWonKIrTRl8=;
 b=lyCqQ3uNSgSDoPr+fR2V5dIcOzU3D0pNPp6B9SCmwO46BHQvqLimzwBwoxGeEr2atIjPS7iSRj0VAMoPwahR/6zzAZEhTqPSjHnt7SdJUtlnBGvRO2AwnXRWKXNLFESzQxlzRv2lGIUMVTolGtX/F75mpPHIGTEfpEdWkK3kCSpT5c/+NyewLieOu1CXhDTWdgP2yRdV6+g5hpXL3Khru4h/3nyttd9wrqM4eLkLADVv+/otpljmQ+O6xVG7AFL7+88wGQr15+VksDr23P8cJBpiIMB/BikNSBSEnBKmd/AaJIw0HgNycxZNcwx34yq9BiNJwU9y0ZXVYk0YBK+bbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2LeYhWsyGp+9fIR9zUhCDaTG/mPyRXSjWonKIrTRl8=;
 b=C+7DfAK596eXmJNN9B3ak1dmtuuYYhLfZrIMmUQ6p2mH77hnveEd6rSnua/J8M8Z8wSnQ/Pa8BGmuxVwdixOUOWmGxbFPLhIMg+dIUYKad1nj+c2lfv0A303lL4vWnZ22JrMZ+1bqgsVvhMJkaI7GpH3DDI06v69VGVZzAgB/2qKWv1a9+u0GMQVxf2syhfEraSs4GddE7VKKNDV3UIqSGPLbns+Uw+AIxD/pDEtNCZSE2nmn1tmEs0jBxQjTHR8T39SeejzdkUfZjbzkY2fYj+gnGcJOxzbARTSCbXmyb8epXZ7cZMAKVQBM+mfvtzCC00A+YFVAFZWh+172wkXmQ==
Received: from SEZPR06MB7237.apcprd06.prod.outlook.com (2603:1096:101:238::10)
 by KL1PR06MB6556.apcprd06.prod.outlook.com (2603:1096:820:f1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 28 Aug
 2024 05:35:10 +0000
Received: from SEZPR06MB7237.apcprd06.prod.outlook.com
 ([fe80::23fb:f29d:d110:d7c9]) by SEZPR06MB7237.apcprd06.prod.outlook.com
 ([fe80::23fb:f29d:d110:d7c9%3]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 05:35:10 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
Thread-Topic: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
Thread-Index: AQHa85jW3giFtrQL+EeXEX8rz+LNzbIyfuSAgAbXd+eAApK9AIAAKuRs
Date: Wed, 28 Aug 2024 05:35:09 +0000
Message-ID:
 <SEZPR06MB72377884D036E480A4806EFF8B952@SEZPR06MB7237.apcprd06.prod.outlook.com>
References: <20240821070740.2378602-1-billy_tsai@aspeedtech.com>
	 <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
	 <cf92b3ab4b171e7c7c07cada066dad6323c5dace.camel@codeconstruct.com.au>
	 <OSQPR06MB7252CBAEBF1DBE2C613F24748B8B2@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <e629752d8c97a2d14641a7fbc0cbdb1cd01a8ac5.camel@codeconstruct.com.au>
In-Reply-To:
 <e629752d8c97a2d14641a7fbc0cbdb1cd01a8ac5.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB7237:EE_|KL1PR06MB6556:EE_
x-ms-office365-filtering-correlation-id: d4fc4698-0823-4093-33dd-08dcc7232e9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?E9dO9HbQB5Ke3G1XaG9cSUN2Mrv/MtXE+j/1g+jRaaWqIAu5daxyRaX4?=
 =?Windows-1252?Q?I+VReyi/Slgept2B/Qp8By0Ns8QX5NAIUo3mvN2R/sOs+ZgZLnr59lGv?=
 =?Windows-1252?Q?e6hhn2msVB1UQaHQEiBhRlQMzYz2MfsORybCIVz8jVYyr72y2fWb7K05?=
 =?Windows-1252?Q?Z/F5Ha00yBffp5rwOxP1wxq7Wutssa0lzU22Y1YfC9l4Md37ObQgSFw+?=
 =?Windows-1252?Q?k57ulwxHYNwJSIfpblPBZhUfFuWREMOeCMBISsFusemFYvIShDpKajDK?=
 =?Windows-1252?Q?zTvp0ssoqoWBEAmeG2uegyMQuQ0WC3IoaFyN3G2HOYoeEcNJHJu12UiT?=
 =?Windows-1252?Q?VhqNQCNc9AGiw3H9qPhUwYvjRCMvRIP5YoS80/s0CC2VumR0YQEqzo3C?=
 =?Windows-1252?Q?SdjQhYmOQpSWTVHgAbeaxVgT5FLBTRzDHoEBM3dM3pGx6yVm5/WHw4gj?=
 =?Windows-1252?Q?t6m6oy3TX6zeJl10jHJRMIQ7ip80UvLJroya5yt72ziurO/JD12wL7WH?=
 =?Windows-1252?Q?T/b/yxwqkz3moVyHqFC9W8nYqrveUHM9zX+PbM2yBjiw5bVC+WUcP9J6?=
 =?Windows-1252?Q?p8D8LiqVZ/5YrUZahZSxzoelUyRF0Y2nG/gfWVyzBK0fkSGv2UAm1QS7?=
 =?Windows-1252?Q?C0Wtgb7eaWWSk7T43sFdAJInbm9xhZKeUxhniW5RZFHcviSghP5AtZhs?=
 =?Windows-1252?Q?tvAiUJ8FpS84VjofuIORNOZB2GG28qhKW08c4Ald3hl+FbU0MYaRCwPC?=
 =?Windows-1252?Q?lKiXT9KMzlACWCAcCN1xlk2upNSVFJUxVLU2U5/u7aQklZB7ozFT2ny9?=
 =?Windows-1252?Q?KPpwYpk3Iz3qTA+zDNCKeg3htdKOuNPKWCkPY72ZGanznsD8MHuhm/a9?=
 =?Windows-1252?Q?7ee5i6rQt8/wWSaAzWPkM9pRh5J1ps+UnJEsQbSmOMfRQANVMwYhJUhc?=
 =?Windows-1252?Q?2mw3KjbECfaKsOFKNYTHv1gVgGHo504CCbnK8oFpbNyfandxQKDwZlhG?=
 =?Windows-1252?Q?eS2Wau7HGA7fEAsUZ28RfmeOxlwD4Im4yYp3+mYJpo9whdOJejdnEkz7?=
 =?Windows-1252?Q?cF32y1FH3NrDT5rBJZSiWgt7CyuO2L+xJbzHduYhgXJyDxXN+/Rzcu+V?=
 =?Windows-1252?Q?ciSo6HkJ8tiPaL86HrsMm4Jg5qvmXPpbVm8PQkgTPfC/Jh1V9pux4Jho?=
 =?Windows-1252?Q?YP+S3PFNPKMHC9giuZzvGlwbQEVVYX7Y9G/IEJkYQe23VrShPxZfV/df?=
 =?Windows-1252?Q?arZswo+YLXh+iDVWIpbt5KuO5vQW4fxfNdjgobYFqz6S4f0GIlCJef6Q?=
 =?Windows-1252?Q?+D6RzgxlOTXw80K+DL8UDgN87K3/Pv3IKxk/b2Bk/nrsh6L5FrOnByUG?=
 =?Windows-1252?Q?ONWe3gb6QMqQOdaIzTaGbdsiVsGjSPcJokAftlNHyMWF10VZsg9eLN8+?=
 =?Windows-1252?Q?KLI5gfUflSB4nWukEQx05fs7P8S1DngcTaqTJgol9XEaXRC5k/6J+8jJ?=
 =?Windows-1252?Q?gPZo9tshu10gvvwE/yKCUH7k34YSSr8Stjq7xMWqvl5bpJqk6Tg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB7237.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?eZkjTmSSA9EEqIS/YT4ltaW4eW/noFoIT+MGMD6dqvuuGfZO7NTgG2l4?=
 =?Windows-1252?Q?/G9PSIL/x+PEFTEAFc+JuAzWujSU0MgloLSCczvNqSV4Ksp/wKfjF6wD?=
 =?Windows-1252?Q?PyKXUxzfvaWlG7xE7mvPyh8Rnq5sEZ911GOYiqp+TDPvXsLaSKvpnYhW?=
 =?Windows-1252?Q?ufoSDIcfm6WBf6mL+tYdWPAOxoFuwY+XqnGRSVzoXhD4n7W4roy4FTmo?=
 =?Windows-1252?Q?XQcyrQ+Zr6RzOmHgBlAB9FvFL9Qs0hsAAOe35yU+GkR18qgc/Dj+Lv15?=
 =?Windows-1252?Q?w0hcsCZgRS1EhY5pZryFg5C7EFENGqQgooOM82tfYcXfpVJBeHt7VDrq?=
 =?Windows-1252?Q?gTJqnEgTVtDEMicFF35DfK9SNf/qgUetq7XJjQ5d1OkVh0tUx4xBIYyb?=
 =?Windows-1252?Q?ORhE42Ryl+HMn3gJCeFdLZtYxT6kITH8gxEBV5mSUCw29cCUua5X+xTs?=
 =?Windows-1252?Q?SMMz2ilApfwqZOkEkSlK+gCrCEKohO+U1vMUZulkK8Fbs+8Cj68qYvuI?=
 =?Windows-1252?Q?MkaN4TzemFinsspP3JxSIWUzq10x2V7oUHSBvBGIS8JeTYh/ZmbcSwZv?=
 =?Windows-1252?Q?j8JBKXOxrd0TAE/zvsGOAWweSv1Om228QyHdffrTN0P3YyGaRtR4c5eV?=
 =?Windows-1252?Q?hqZYmIvhFgaXZkvvQ6K+Cllk36exiyQ2wzqiXTeGnkAKhG64v7AwZi6H?=
 =?Windows-1252?Q?mPpOdIj5/vjGL8FtV18w9NbazxB/AFuSUbrWss93MMykmLHTUvJQ5VwJ?=
 =?Windows-1252?Q?kPjFBhn81kxVYFat98iV4/ZSZfC9/9uLHpeAqvGO8R4SBHuKFGvdGspD?=
 =?Windows-1252?Q?FkvKWwejwYsuRm1cAy3PURwZbhsq4nth0GR9iS9oEvoiwHp+ExC7KBZq?=
 =?Windows-1252?Q?Chx9CQx4rB1yL1PLmMs57Rf1z3I0+xfvEheb9zYo4+JptQZ0f3BrnQGh?=
 =?Windows-1252?Q?PsAi1E2rV8TW/lpu3GKDkjCnplqVurG6xQtzXZBh7k/JoIVGV74higPk?=
 =?Windows-1252?Q?mr6IP1qMpDL5JX7Agd5YQkQJo1uaRmN1n+uWX6kbGVLWuWoXtwceja27?=
 =?Windows-1252?Q?COR/rYR9N6y5P+QegJGvcD+hxzET9tV4nWif4FHl6V+EKnMnKwijgFRn?=
 =?Windows-1252?Q?5ddndE0Npwk744laEx3BUE3vD1TbKWhPIdIIySp/22U7cYySWBQdp+Kz?=
 =?Windows-1252?Q?Bt1opHTAH3ltCvLWmdZdydcJry6KM6T5RAFM0lIEvHvfLcNUD0PW+FsE?=
 =?Windows-1252?Q?vCsbdgQ3Iycy8fiEYWucaeblv6jbqiZGERnEVAEvz0gryKhFnU2UCnjM?=
 =?Windows-1252?Q?R+vthFQYEl0o4Lr0qdcHxI3MCo2Zvy/f/QWN0oELlaB43JaVK+ykGhmf?=
 =?Windows-1252?Q?Aa1UCwAXjiEoiI/5AmSJ5PIryzAtZxJh1lQ7AheshhKF9kO/JT8Dpb1O?=
 =?Windows-1252?Q?c7CAGe1AsDvoBNTWmE9hCcn7JcFgug4GUUaDhLHgBq7mawNJ4mRh738T?=
 =?Windows-1252?Q?MHIBnn6t2ud9vXVv/6cwXW7qzzTROL0NO2v37FBpgEQsOkXWoq3gixqN?=
 =?Windows-1252?Q?PAaJTw/4frVZr6zyRtSzeePlt8tSTU4RF3QDzVBR/5JCaONOe4h4jgPs?=
 =?Windows-1252?Q?QL8c5G/A9noy1TvU3XJ+pFwL1Yak5DmYQEsWukT8504bYzr34N0fxDHn?=
 =?Windows-1252?Q?1L0PqQ5efglNI1tg8MvXlX3wZHcrvDYr?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7237.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4fc4698-0823-4093-33dd-08dcc7232e9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 05:35:09.8937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kiDV3DW2cCRgWOh/c8hlS0+ZKJ8r9Q4uUt8otIk6HXWh30sQkkmHL+duUxpYTWf29OM69EcZAt7//MoEd2eoLRtpF2aMSwE9DiytP1QocBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6556

Hi Andrew,=0A=
=0A=
I=92ve complicated the merging of the two drivers. I=92ll try to follow you=
r suggestion and put everything into gpio-aspeed.c.=0A=
=0A=
Thanks=0A=
Best regards,=0A=
Billy Tsai=

