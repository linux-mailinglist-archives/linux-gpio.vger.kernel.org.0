Return-Path: <linux-gpio+bounces-21611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5265AADA661
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 04:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C2D33AEDB7
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 02:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED5527A46A;
	Mon, 16 Jun 2025 02:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="WdgTdnkf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2090.outbound.protection.outlook.com [40.107.220.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6129FB67A;
	Mon, 16 Jun 2025 02:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750041313; cv=fail; b=JqYVqfhVX7tsUtSWW1dsYrsTjrHnfWlDGXasGGbcJzlkIqvRh0wh5FBkPGqx30eObyBmuQcfP/j1jGcOoH98FzJOMazoZkSdiLgTJB16WQM+cBgp85kivreSihqVi0FcfqhHhhcPY8JCJvExzgf8nvI6MnevpRTOVz7SYCdMBPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750041313; c=relaxed/simple;
	bh=fPYvxYLnbjOARt7b+2/d5DpefchBIALni8Q7MtPhPkI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CpGTOUgVm4GPrVwmcmu6UN9GLbvEdhtWl0Oyeh8MUY+Mg7EMxv9XqyVf37XorxbwGQQ8K4C9q297YwCIui7KQIa2tBogEQtNhmbfZlXQSwJcIuphcv2pvSUYFxrXMY9kbBqAG10GZ34ZyZ+udzHrHPTC9aebmKtJmQFqKffbQ4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=WdgTdnkf; arc=fail smtp.client-ip=40.107.220.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHCAvt4ZbIg7JoXHwb/hhg0YF7b3PVfjLr288v4HomWlVIiKcHEmXtXe6eF9Cghl2wmnoFZP5UUNQvcrazsg/nYmrhldWP2xKQVqyopETaJx0uoIhmocHzoXlk5/Z6YaZIpenIVVBEOdRUFYnMLIuTgTivICoIn1JNBVRg2osCYrv2yYlxv1oITFMZtpZ0JYqgOWRVayE7erLHzz/E0VDXzWIobYKoSCj7y4EUB9ouOiKxibSUqp56W/Bd8pw0Eq/GlPOlYQV1zTqGAmu3l8dv7DGzUQO6+gXWvZQy7KYw/Xt+nvHZMh61YXQhRzg5qnvOIjdtXz6zq2CEd7AZ9TYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPYvxYLnbjOARt7b+2/d5DpefchBIALni8Q7MtPhPkI=;
 b=kcK8jNcQPF5uoGxJVIRJpBKVCrx5SXDS5BmbwhpTxHAE9wjRcQTRWrZRe9+3X8KfOIvJh9nvDoOSiVK+l3P/ZZcdVrgU2H1vrWJVZVaMcP6BwZtMe20RzKFermkHt9ItsvY4sFeJ42QEE5ofsDpXONh+a7jZLssZwGKdnEomnEFyJyY17aeu1/OnxLLu7fX1/7pJ7wnYOzgZG1dyFeCmKCnQlFUoDHSyQKfPYw3NCj4C0njvtD4kg5KPk9w9+zjXr34gk5MNkFkBcUj5Xs9ICVD20YknPajsrwaRihEMkS2Gsx0jMJEfUCcNPCzClkW5DOlCjvSLhxmV2p/1b1B+Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPYvxYLnbjOARt7b+2/d5DpefchBIALni8Q7MtPhPkI=;
 b=WdgTdnkfRt8QzK4t5RkAnto0lKzPasxcVCx6n9sH1aungiMSI8kOlrlc7vQErx+EfpDe/DjJ98n5q1+/wpRXO1GRbGuIUwT+Fg+RHIkjFLjZ5CwKY/tZ6IiGaFHFJdspnhGLjuUgOAySjN0UsoUiKxGozHgkTedMKZ+qOo8yqHc2TH2/VR5LZvw64rmsVwO0f0xVqlJEbDzGr9d5KQ4ZQVOC9IHMH8LxUhaUQFRhSkf6UwXFoc9BHazZlawVu6sHzomrtBQUSkn8nHw4+jFc3hf+BJr5YLUrBt+C8IXynEkizNgRjo0u8V1nkIF53eazp7GObv6UHET1jM3Onxiw9Q==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by BY1PR18MB6024.namprd18.prod.outlook.com
 (2603:10b6:a03:4a7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Mon, 16 Jun
 2025 02:35:10 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8769.031; Mon, 16 Jun 2025
 02:35:09 +0000
From: Harshit Shah <hshah@axiado.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, "soc@lists.linux.dev"
	<soc@lists.linux.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon
	<will@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/6] dt-bindings: arm: axiado: add AX3000 EVK compatible
 strings
Thread-Topic: [PATCH 2/6] dt-bindings: arm: axiado: add AX3000 EVK compatible
 strings
Thread-Index: AQHb3ZKvW1F+4lAqPEyXKxLru+qPf7QDhqQAgAGLprs=
Date: Mon, 16 Jun 2025 02:35:09 +0000
Message-ID:
 <IA0PPFBEC4B1F8ED67D037ED2D0784AA70BD570A@IA0PPFBEC4B1F8E.namprd18.prod.outlook.com>
References:
 <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com>
 <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-2-327ab344c16d@axiado.com>
 <174995610354.3364317.17258718728761199104.robh@kernel.org>
In-Reply-To: <174995610354.3364317.17258718728761199104.robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|BY1PR18MB6024:EE_
x-ms-office365-filtering-correlation-id: 1811b775-9cd8-48fe-af23-08ddac7e69e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ucF45O3D2fO2j0+DMKUmOtW7T2xVQWwttHgePtHDsdz2fGFa2TVRDCL8QG?=
 =?iso-8859-1?Q?8UYIuO3PRf484xycAU/RHhqmavJ+5CvcTbEly5NSQLy2qG/cpT8RAyehCz?=
 =?iso-8859-1?Q?YrG4P+5QHS3G8ovnaRTt6/GZgMHdPKLLMP/Yv5sxbF98Bc5t0sqT6KQzx3?=
 =?iso-8859-1?Q?Enq3/BRnLoKanMb5ElMCRtS74D6hVMb+4po0jDQx0osq0zzNqhhIpV6Aym?=
 =?iso-8859-1?Q?QerNbLonTjyHsRO2Q1yD3LQf0INXbLxQDOWAlJ4VVhXhy7hcwXQ/kt2g26?=
 =?iso-8859-1?Q?fvQArpS4V/mDUjjlcRYNqOIqWJ+jvkMKk5PQR6dJE+Pp6w158aMHy1xtIY?=
 =?iso-8859-1?Q?EMCAA1WXaeFAQ6+08EfgTdiyJHTH2jXucfBiC/y0CY6rhOKueK+LJD4gNW?=
 =?iso-8859-1?Q?Depvcuaj8aWvCPXP3ig0QaZ5jU6TVwdKXuJnAobwMU4B+0VLNBAa+jPX3T?=
 =?iso-8859-1?Q?WpeFCISlR02TaZcT9JdOMaxB2MUPrw2+lHozcff1pIZ2/m+p61w454cwYg?=
 =?iso-8859-1?Q?xntw8YVRUy3so6iIvNmJMlaz7MPAdG26Er+a5+FB9Q/ZjuFFYfS1qje1ES?=
 =?iso-8859-1?Q?8zbZKq5IKR89qe2VQEGLUxYxjDd/m5Qko6E249LKdCXCiCJoOTaBw5Lj6D?=
 =?iso-8859-1?Q?DJB5qoxROKYD+81hNfk041y5jgcmmbFLpSacXVye/rENrL4mQ9Gp9fXaa1?=
 =?iso-8859-1?Q?i0AB/wt4u9W4oPayWLfUCXzj0jRiZdQnvnx1juHKESngOTs9cevf28EI5x?=
 =?iso-8859-1?Q?V3pm4MBAz4zLNxZ90f7/hdfHEIu4WbU7+Xe4VL+Yi/xRiGZughYHHsnLPG?=
 =?iso-8859-1?Q?ce/GUZSJCIUybG73OGN4fRLAAbkSnUu9wSBeER5zjrOrx2SNfnIKmYXHPE?=
 =?iso-8859-1?Q?7Vq6hLOi8gKSeT4ol89NK+qHG+jUS6EvvyI3/6F5eEnQSWdpuE88ZUBh5q?=
 =?iso-8859-1?Q?le3kheaIT92kaUdi7BoP9agTnry+ouqwHTGwLOSCe2GEAmXi31RqOjfFur?=
 =?iso-8859-1?Q?wsg/eHxRF0/rAy1KKRaElGYSFn7LtKi7pK5YRs2KANdDDP4YM00EBFynui?=
 =?iso-8859-1?Q?j8L0qena7uyQorhV+dxC3Qix7Knr7XU+WDQ5vE+OMcwT9ral4d9AbZN9uM?=
 =?iso-8859-1?Q?fnie1fEg6n3ofpRsobemNIETNiHmLfi3II93llR1paJfl6BgGCq/W9QwDU?=
 =?iso-8859-1?Q?l+PpQk8DYdT9y9NeABgpw0lNqFlP1YdSjMZDeubq5nltRoVZYooab10jij?=
 =?iso-8859-1?Q?65Gwnw2daZ4QLzF8+S6a81WdKQGrA5XE0lqTjHn5Z3FwsKPZbyTjF+r5sn?=
 =?iso-8859-1?Q?MIkyUCkd3jmgV4NzBjYK++Pm/MAA5kAcVjn9phHryyoZJulp/jWjH8Hcht?=
 =?iso-8859-1?Q?Qu+FKuHIhrTJo/4QTTOHCoXD759ENjokVWUpZRUW/xj4UBQFo4aao4f/32?=
 =?iso-8859-1?Q?KfToTjcIssQdzrieMjGRkeGyQHeQSSha4np+5dQrMjnqS9baGG4VLohyeS?=
 =?iso-8859-1?Q?ok91u9kX2pRnx1c7mP6oCG/nYNqBJ+zJGTjRI3QqGijg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2pXpmwh+0tc5w5yz7FqDhy4Wmu8S/ejuREsOSy+Qjuou/D5kBczPvm6KrT?=
 =?iso-8859-1?Q?riiW04w2U7a3YGwZtzQasVoQ7JczW/s4VvQj9UeW0zsdC+zm18gEJUk+X4?=
 =?iso-8859-1?Q?rJyGe0LVNglW/+v7Dn1VAY3dTNF4E2VZ2LJfjJ+j8xBiFcHhcvqxHU8NFM?=
 =?iso-8859-1?Q?ZZ7Drk+b/KqnCd4QFwXLPah9CToFwvMgSw1hr2bNt4Yr+AhMAaKR172sSp?=
 =?iso-8859-1?Q?1uLJx8AgYmWXf1miBlXu5fMcDEpeSOpApPOglMRrBW62DJ1hshET5kCaTC?=
 =?iso-8859-1?Q?kG2OBg2Q/PCcQfpG0G6Ca/XclL/S2ohEeResqIRxYdnTZjjApy3kkopvWA?=
 =?iso-8859-1?Q?Kxk3Wc9LbrVwr95FUy4O3T8Jf2lQ09pdcabuXGlGBlBx4OenNcLJKAvv34?=
 =?iso-8859-1?Q?0tj06MUFGDb/T05+E9j1cJWiQOY+rqDwpKnFEm1bRBAqHPVD0ejcI7J7Ul?=
 =?iso-8859-1?Q?veDv8Pvzeq3c4p9/J+1ELUxytvQg0fXHsCCPf6VUIPjKvsS5qCyRzpHRKV?=
 =?iso-8859-1?Q?CF//iQJPf7YVqklntY3Ge4gsKyMQR/T9qyE6k8sZAoVUgvP8uw270WCZos?=
 =?iso-8859-1?Q?CuCMk7aZusxrFVrzCb4ZE2R7KCw0Za4jLzbAYsRVP4wCsE30aZyVtPKWJ4?=
 =?iso-8859-1?Q?Iw2QoQ+37ERWkd+/99aDkGCoePBM1SPZW93XX5s0QchTpcxj93oWv93jPu?=
 =?iso-8859-1?Q?XnjmJEUmV88GF0Myy5E/D/LNjblCpL4x9O7EbxmmjVapOGfORAF6bmlrfo?=
 =?iso-8859-1?Q?d8MhX7jrUamJxrBTEjPcp0nrIn+mOrBf/amqFYXzgPo3ntS+xy3IY5Ygy2?=
 =?iso-8859-1?Q?24jApVnqsaCxi7c9w2GQnxR8MGM22S1z7jXjtXA9esUtpUoGaLia7Yo8xo?=
 =?iso-8859-1?Q?AR7UlVC6A2Z1Wd8Hr1WAVdMpgJ3MeFg8l93BETYbLspZTBnpRuNqCCjCDZ?=
 =?iso-8859-1?Q?kRL/4AYGboGsswe+B7APGXGqpKd5sGs4+swrFRVnYzVr/dN2tYhR0Xnyn6?=
 =?iso-8859-1?Q?iG43Kxfz3u00r6i+W+jqQY7o1JlKIoEJ9NThMjUx6owJaVSuQo5ra85wSg?=
 =?iso-8859-1?Q?5ZHOaYQ0SDKLsh5aJY3C1Pw5sH/vI7DrA0skx401Dxh4bfPnMD9wQlyqu7?=
 =?iso-8859-1?Q?qETNzr7sgOX0djK0MrgGvmgb5WL3p7d5eVHC+qabHz4D8t4hWeG25/y5Q1?=
 =?iso-8859-1?Q?xylgs4e1NltjSp9904LsV28yRp3L3gnBc7cStfESU+j2S8flpLjo3QyYLq?=
 =?iso-8859-1?Q?ntXubVcj2enUzKfbfhlISSnwkxUxrbADfDzR4uM7sdjNTDecEhUrcyI0Mz?=
 =?iso-8859-1?Q?RFQ8FUqqkGg9mwLpSJItMXvYgSuEdUs8LglQgmeppqzPvDCWQi2XFL8M+T?=
 =?iso-8859-1?Q?/f7SJpABWwzc8b5AVsEN62R16ZZ8O5jq9bDLbYPnrxIcQaYyfYW2RLXPaW?=
 =?iso-8859-1?Q?5IxiED8Twp0ArG6ZUlVD+JIKxqICBalHrJ3j7xOUZ8Ul7W6CRENyO8znQn?=
 =?iso-8859-1?Q?Fp2c7xm/e2nMtJtGOiAg2xn0hsWI1U+5pOsreNdsbL+0kM0u2hl+vPBVID?=
 =?iso-8859-1?Q?19umrrbRhopUnphKGLbvvKj9JCfhU11GcDRJEA1tvm8NayQjusMOLN6cqq?=
 =?iso-8859-1?Q?3je7wC/6NaErBS7X9UvnFPZ2v8EYhF7TovT7Cw9pF0CxmtIt4fcplMTGEa?=
 =?iso-8859-1?Q?cku5sY4K5+hIsCQ0ThU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1811b775-9cd8-48fe-af23-08ddac7e69e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 02:35:09.8455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 98HLNLp/Fw1BX69ZZk+4SMbJ527BduXu/+boJEOFJf8Zk7LlmU4Ayxw44CYbxXxL15e1I/tC5/aM2rDXm/xVsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR18MB6024

> If you already ran 'make dt_binding_check' and didn't see the above=0A=
error(s), then make sure 'yamllint' is installed and dt-schema is up to=0A=
date:=0A=
=0A=
> pip3 install dtschema --upgrade=0A=
=0A=
Thank you for review. These two were missing in my environment. I will subm=
it the v2 with the fix. =

