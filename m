Return-Path: <linux-gpio+bounces-12429-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0663C9B8C8D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 09:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 809C51F22589
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 08:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB0A156C69;
	Fri,  1 Nov 2024 08:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="a3uQJWys"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2085.outbound.protection.outlook.com [40.107.103.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7EF156256;
	Fri,  1 Nov 2024 08:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730448408; cv=fail; b=QBjR01MLUvZ5OzP3REOX6oVk92BVlE7bPraGFuXJsSMpyx6/265jC3IWLJUy3XE6wrVtRESSsO8NwpAKPKc9H4N6gwkMrAo7dkU4E4c/0jx/AuTivuinPkCscxlmRwNmFwfkM1+Eb27VmbF/aNnwQoNFpxmuVv+oCS3GmxWOUqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730448408; c=relaxed/simple;
	bh=D0Qn3XG+JTSOuK/umMUJ2L9ZqNgCBojDkRRKM3z1C68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LPqgjdGF05sf9nhwMh/rmguHVNr/fFky7UUlppNaVZ809cnEhePdGoO0BTiJaXvtzijAEICeLJsyRQ1a6G5FytIBEHBT4oKoAjIqqXP9IN+rlMgIQ4gdROhL2ocZDq5DB2z6J4zzT10k0bFyaPuc1Yof+VTM8Nu6AO5/xF6XBZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=a3uQJWys; arc=fail smtp.client-ip=40.107.103.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R27EAMpG9+XrI87vzc2cRnDVx6hZKBRCYkIjWcGrT3+nbC4EAEmhr2wwG29zUBE3/O0DFfTExr+daZc8iB0Uy7eND9xkCX4HmCi2ZHhCaLwG3kCaKME0YCObfRTy2iJ9mC7frkyr37KSSw3JUVpcifBystcX8d7r12IK4uAFK5okMYDPXJNIiVKWQfIBg9xvaVlySzFvQ3PyKLvPhzzwx6m5Eq12Er5R0bFjYLa6jDPNf4AzIFa1zmEvqq4+HyMKxdwvTFLsQWzkKt2ON4JRBqj7p3MEBAx9jfHmWeOgxQqBZyTXkFwL+lXXa69z3qgqIu90eMLXDztBHkYLp3t1rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBvQpHmQxe+/N53r8V12Q8BNuCnFINZOkRnpiGdpv34=;
 b=X7shKJ85bPn3VFIGQVfXPS+VqMmMDllntl6cCvyRXFdo1gUXK5XtlxCFFyw7eh5cqIuR1n3eIVhFVfHMCayfu2M5KWqR5RRie4ecglE5gzamdg0FNsf1hfHVKPxLX61V50WqGhfSVHLJHHRifXFaA6Sf5HQP3bNoncxxEnNUcW81p55v59maPkW16a9CinnZvMp9XFA+z7PAXNLhXVTjHMgnCGN+aGOtc4pXUTS43vYr6qUm1uNN3y2jm/qlaoXCAytvMc1OYwr6CSU8w8ZBdxQEn2Fs280CLFQX7r5ckYiXU0YRvbJqYe0zuru4gIK6LYk66ppkElJg6eUAUGW3pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBvQpHmQxe+/N53r8V12Q8BNuCnFINZOkRnpiGdpv34=;
 b=a3uQJWysQM3NGX6DRpWKOSPQ0QJlcSRnDl7sg3DyFGpwZ2fifdyQ3LehcuupuPB+BjtPulXjo8iO3poRuXXtlHwHt7jgMxHDQzgp/JQYNX/yD5sw9sLhoNgMoleAw0GY0ZH4jdZkO3e0eVQyKqjSWVGA/r1GhuWoPU6PGYqB0iTpMmVl17eRVrsAVuWTgR71hxZv16ElP0dWi3NH4LyKps4wpi5Bmpu0Tt7fHtLtYJkbRyil1veAGjbEiWKaHEL8VljF599XGygkgpgR+w5/W9sy8NVjwnA5m0Aq/STg5HJOZfwM0BaO/kHRY+WobU8aSLWmyHbQXCwwKxeeRr83xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PR3PR04MB7225.eurprd04.prod.outlook.com (2603:10a6:102:83::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 08:06:41 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 08:06:41 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: [PATCH v5 1/7] dt-bindings: mfd: add support for the NXP SIUL2 module
Date: Fri,  1 Nov 2024 10:06:07 +0200
Message-ID: <20241101080614.1070819-2-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0115.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::32) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|PR3PR04MB7225:EE_
X-MS-Office365-Filtering-Correlation-Id: d0fd8e5a-0fa1-4055-7892-08dcfa4c1e2d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|366016|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OS9MSkJ5YlRnRjMwWjZvTElBVzZJN25VZTZ3S2VmK2g2VnFmdklvR1VJMWgy?=
 =?utf-8?B?MjlPVnp3cVAzdFVKV2Q1Qmo1ZnV4ZnZFNnpYQ281Nnc1aVhWelFMNUR5eTBZ?=
 =?utf-8?B?a0lqaUIzVldxbVFQRndVcTFVV0hOci9pSTdvOHpLR1VSQVN3VEFWQ3c5bWs3?=
 =?utf-8?B?Z0dCWkxidE5aeHdaZ3Z0WE5PNUtLdkkzVlVzREtJMW9QOHZibUd2OGJCSE1D?=
 =?utf-8?B?V2s4UVFEY1l5THdTa1E5STVHTytCVWNyQ2U4NDBFaTJZVHNqamZ0ckpSdzVk?=
 =?utf-8?B?RnVUVVBKeGozNDlSUmt3OE9GK0JhWXlITDltblBRcWdjdlduS1prQWVabC94?=
 =?utf-8?B?ZEc0YVBtTGswazgrV1o0aHQvQ3EzY3U3M3lwNW1vZy9oS2NaMUk4U3A5SzJK?=
 =?utf-8?B?dVJoV0R5SE10Y29id2k2RVBacW1CejBDeVRBU0I3NWFlL3oxbmpINWx2bnhT?=
 =?utf-8?B?ZnAyTXI0b2l6eSswSTJGeDJ4Y3hYQWRyMXdlY2Nsc1lUNTFrK0MyRUc5YUNu?=
 =?utf-8?B?VUxxYWVsNXU4L3VuUzBhZTNVbmJkOVY0a0JhQ3Y5cTNYcnQ4RjVVdGs3L1NO?=
 =?utf-8?B?eHRyL29EZG42V0ErbHVnZGxic043bk1hT2lGTzIrUkdvbEJLNG9KcXVqcWlL?=
 =?utf-8?B?UERUL0ZySFVqK3RtajVEWk5Bbm5kL3RwUGhlMXZXZVp5V3hGWmJ6b2FGeXNp?=
 =?utf-8?B?NWJyeEVQQjBHTnhIR2xzWWdpUnkrMDRSTGc5SVNpa0RmdnpyWnNrTStPUkZL?=
 =?utf-8?B?dk0zUDh4Zy85SHNWU3Q5b216UTBiU3Z5cFZ1QitZNTJmRHJ0VEZ4MFpxY29l?=
 =?utf-8?B?NVp1OWZqOFFEcGZkQmNMdld5a3k4bEJMM2diQUJNc3N5K2MvY3UrSlN0T25G?=
 =?utf-8?B?cDVXVXMramN0d0ZKNXpKOTlHREF5d1I5TWUzMWQrZ0dvYUNjNFl6emY1KzUw?=
 =?utf-8?B?MGZYaUtaV0Vpb1U0anFleHVwR25JelRaT0tpNnYzdXZ4Z2d3M1JtbU0rRUcx?=
 =?utf-8?B?UTFickdTZm55N2FYK2NEcEpFazFGakR4MzZnODRWK3dQbGxwYnMwZW8zd1A1?=
 =?utf-8?B?WUQ0WDhtcW03VTV1VU9kQUpBRFhTb2hJU3ZHZ2Z0NnNnWjdJaGpqcXpRZUZY?=
 =?utf-8?B?elNKb0UzeWtBRVA5K1lJYytKVHprUEZMNTZLOGVsZ0Mybis5RzdxV2I4bkNl?=
 =?utf-8?B?NFNsakhNeE5VK1JQZEE0OTdEUjV5MjhQWkxQS09HbURFMHdRdjIyemxjRVFW?=
 =?utf-8?B?aVZrenU5eTlJY0xiRlpKSThVOW5vajExSG9HV1VKSk0yaEd6dG5ONG1wYUxV?=
 =?utf-8?B?Q0wzMSt3MmlpbTZUczFaOVFlZVNSUkxYdGhONXg2Qm1qRnJqVEE2d0ZYdDg1?=
 =?utf-8?B?L2N1UnpFRnN5amdIbThSRlJzTU9Fek5ZTWw5V1k4NHBiRUlCNFZzblBaSDkv?=
 =?utf-8?B?TS85cVRpZGhYbEZuVEk5cm1rM3dhMEx2Y2JjWmdVN3U5aGxLOG94ZlhRNHVz?=
 =?utf-8?B?YUNWc3dEYjBzNDROTzFnV3JNK3EzMmoxYTc2UUZ0L1JLTTVkUFNib0xCbmNY?=
 =?utf-8?B?OVJuUVBFMmo4NXk0Wml5RGZxTWlHUHBla3hublFqZ1V1RVRpcitOWVZnakxz?=
 =?utf-8?B?SjBVYzhBQnppZlVoMXhyczBGMW03dUErTU80WTh1aTNhaDNIem9ZS0hPQnVw?=
 =?utf-8?B?UGF3L2Nzc0NQWUZTM1JTQUZOTW5ETlhqaWUwdEFZLy9nVm95Zld2TloyWFRp?=
 =?utf-8?B?cDFGVHVVMWt5d1BBbFJ0Mmc0QUpXWmJDMUNqcTVEMDZjK2dnbkZGTU03cS8w?=
 =?utf-8?B?ZFFXYUJycU91NVgySldPdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(366016)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXg0ZUwrRmJ0U1JtZDVjN3RSL01oMmtKa0h2RXd1dEVZT2FPVG16QUVIMmFY?=
 =?utf-8?B?b1JMdndCY3gzVklNeklINjFnWGJubndReDViUWZ5VU5FQUJ3aUtKYjlGU2Nm?=
 =?utf-8?B?U2xIQXJleXNVcnh5S28ySU9rb1h6MTgyeXUrRjEyVFp5UCs5M3B0R0hoWVpw?=
 =?utf-8?B?cXhkWXZyYWZUVWYyTjhOdmpQS1ZYWlpqdGhCY1hSZnZjQjJpSmh5YXRpTjRj?=
 =?utf-8?B?NEtMRHZSc1k3YjlROXpNUGtJa00reG1YUmVHR0xheVBJRzBaajRLbm9xUWN5?=
 =?utf-8?B?bjBMRFovQkk4VW8zd0xVOWxmanNVVEJuZEhzUUNZcmRVWHNjV2loMnRlL0dV?=
 =?utf-8?B?dlJ6dkFRVnVRcGsvbWR3QUZXZ3lVOTJjaWt4R3A0aHQ3NFYzcURhL3JMOUow?=
 =?utf-8?B?dWlnMjM1L2xhTzZTUDdySm5mWmZkUzFKakh4RmR6aHpFRVJDdXJCQnBmQzlE?=
 =?utf-8?B?NFhEVVpSbDBlZklLRjFnbnRKQ1lodmg3YWFETjJJU2dOd09mR1dObDY4Zi9o?=
 =?utf-8?B?Zmo1T0VmeGZFMHlJbFBDNzl5TU1MRTduS1B3N2dxV25RQ2M0RHhkSmJEREpC?=
 =?utf-8?B?SlIzaHVTM3F3d1NOTEZCRjlQem1qcnBsdWc4WHEvYzNrNUVCVHpGcFpTM3Rq?=
 =?utf-8?B?di9uaFJiTi9icDVZVzdUb0JHQXd1TmxkODVvNlI3dE1VNXhjUklPL2RZWGVE?=
 =?utf-8?B?SVJIZm9qOGhJWEdPemZTc3pCL0VDZ3hQSmhZZmV4SnRCd0tGNzVLaTBNUWZm?=
 =?utf-8?B?SVk2aDR0VElKWVVmNk5RZDJ3TExNb3dxWE9yWmo4OG9PbXNLMnNnK0E3TklW?=
 =?utf-8?B?WlZEV3BTbngrMEhnd3pyUHBJZmZWeVVMOHBDQldrZG5reHNaeUNOUFowRWlO?=
 =?utf-8?B?L0hCeXBMbjNkR2wxWmQ3MmNHV3puV1IyQUVSYlFPbEVndXV6cXllb0VkNzJr?=
 =?utf-8?B?ejRORzVWaVNGL0xsSUNtKzN1K0R0amNuRG5XRHNzbngzbU5MSzh1NUNwZVV1?=
 =?utf-8?B?LzErT2g0TzA5eDUzdEltWkNOS1BXUkVBZk9SYVVHT1BTNzI4ZW5LOFBxcUN2?=
 =?utf-8?B?dGZYZzUrbkw2NmpCeHJkQzJFRUY4ZEVDRmlEcHd1eWZNOGlkOE9ZTTdncHZP?=
 =?utf-8?B?ZUFJb25DbDFySkdHbmh1UWFpTDRDMEkySnFwSzA3OHN2UmFyOXB6TDlxK29v?=
 =?utf-8?B?ckZtM1dNV284WWEyMmg3UktsVnJJRkNNT2RmWk9KWElKQ1BmTm0vanlLYlp6?=
 =?utf-8?B?T2s1QzVMcmlEQ1J2WTl4Kyt4RVBhMk1HRVEwemtTNHp4MGpsSm9wZkMveXlq?=
 =?utf-8?B?UFI0NnF1dVBOVURNUGVNK1hJeXRqREF2bXF2QjczQTZZTVp3Z1Q2QmxOV3RY?=
 =?utf-8?B?SXFNQjI5QjREVkdaem1FbURpbmp2emZRYjZjTUk2OFhKVjJlVlNXQVhiajRX?=
 =?utf-8?B?UDlNNlR2dGlHb0hVeDhqWlhuR1BjNEp6ekRybWhQVWI2YkdWcXoxcFJQRDNo?=
 =?utf-8?B?Q1g0Njd5N0F0K2VQZmpQM0hYT0xaYzRNdDEyU1dxKzREVE4rZnlsQlJoZ1Jz?=
 =?utf-8?B?WThkQkduT05NUy9Ca2tMRlAxbSt0NDF5WlNvSnFSTGNqMzlWR1NqRkNiamFR?=
 =?utf-8?B?R1grVkpxanpMcTNmMG81cmkweE1OUVJpTTBORnpDczVmMnFGVk84ZnVpdmMz?=
 =?utf-8?B?WHJJaVVHV0FuekEzdmFHNWNNSEsxSW41eFpnc3hvRmp6TGttWG1GUEpyMThW?=
 =?utf-8?B?OWlXbElEMTMreEpiUjVOMHZQalZBZ3JBTGNad3MvUXFvTTdWR0l0MnJtdVdF?=
 =?utf-8?B?ZUhGYXJHMnRXTlVJVDlSVnNKMWc5WDZ2MTdabUtUOEg3bDVxRHVURnlpN3J3?=
 =?utf-8?B?YWtsZE5kMEVKVzhmWGswUGdJN1hxbUc0ckRDM2t3S3dqUjNGU0dNd054WDhj?=
 =?utf-8?B?VUlFZE9iNi9yR09tdjEzNllXRVQwSUF3T2FML1BGTCtTeU9UQU83ZmFMK3NG?=
 =?utf-8?B?QTNqeEdENnAwMGJpV25BTzV4YzhRYnd2WnBVNzRhT3VDTUJtYXFQMlNweUxG?=
 =?utf-8?B?RjFGQVhEcUVkY0xha3lPczNuT1pMS25jVTBSckdkaHZka1hlby83dVJvNmk0?=
 =?utf-8?B?WjNxVGxGMm9hM1F0Qm0xWDdFdGlESjVPWThpdkFpbmx4dDlBU1ZSb2ZjWk9o?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0fd8e5a-0fa1-4055-7892-08dcfa4c1e2d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 08:06:41.2407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ym6GdVRw1we3SKaWLpyQPTmE+Qd7iNNwXH+q8OEqr2QxK3gvy48p5MYfcobtg0iYEoD3OIOxCBuJRuj0gpltc3E5AbiFljd0JpSS53QBxBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7225

Add the dt-bindings for the NXP SIUL2 module which is a multi
function device. It can export information about the SoC, configure
the pinmux&pinconf for pins and it is also a GPIO controller with
interrupt capability.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 .../devicetree/bindings/mfd/nxp,siul2.yaml    | 191 ++++++++++++++++++
 1 file changed, 191 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,siul2.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nxp,siul2.yaml b/Documentation/devicetree/bindings/mfd/nxp,siul2.yaml
new file mode 100644
index 000000000000..141ec1219821
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/nxp,siul2.yaml
@@ -0,0 +1,191 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/nxp,siul2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: System Integration Unit Lite2 (SIUL2)
+
+maintainers:
+  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
+
+description: |
+  SIUL2 is a hardware block which implements pinmuxing,
+  pinconf, GPIOs (some with interrupt capability) and
+  registers which contain information about the SoC.
+  There are generally two SIUL2 modules whose functionality
+  is grouped together. For example interrupt configuration
+  registers are part of SIUL2_1 even though interrupts are
+  also available for SIUL2_0 pins.
+
+  The following register types are exported by SIUL2:
+    - MIDR (MCU ID Register) - information related to the SoC
+    - interrupt configuration registers
+    - MSCR (Multiplexed Signal Configuration Register) - pinmuxing and pinconf
+    - IMCR (Input Multiplexed Signal Configuration Register)- pinmuxing
+    - PGPDO (Parallel GPIO Pad Data Out Register) - GPIO output value
+    - PGPDI (Parallel GPIO Pad Data In Register) - GPIO input value
+
+  Most registers are 32bit wide with the exception of PGPDO/PGPDI which are
+  16bit wide.
+
+properties:
+  compatible:
+    enum:
+      - nxp,s32g2-siul2
+      - nxp,s32g3-siul2
+
+  reg:
+    items:
+      - description: SIUL2_0 module memory
+      - description: SIUL2_1 module memory
+
+  reg-names:
+    items:
+      - const: siul20
+      - const: siul21
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    minItems: 2
+    maxItems: 2
+
+  gpio-reserved-ranges:
+    minItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  nvmem-layout:
+    $ref: /schemas/nvmem/layouts/nvmem-layout.yaml#
+    description:
+      This container may reference an NVMEM layout parser.
+
+patternProperties:
+  '-hog(-[0-9]+)?$':
+    required:
+      - gpio-hog
+
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '-grp[0-9]$':
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pinmux-node.yaml#
+          - $ref: /schemas/pinctrl/pincfg-node.yaml#
+        description:
+          Pinctrl node's client devices specify pin muxes using subnodes,
+          which in turn use the standard properties below.
+
+        properties:
+          bias-disable: true
+          bias-high-impedance: true
+          bias-pull-up: true
+          bias-pull-down: true
+          drive-open-drain: true
+          input-enable: true
+          output-enable: true
+
+          pinmux:
+            description: |
+              An integer array for representing pinmux configurations of
+              a device. Each integer consists of a PIN_ID and a 4-bit
+              selected signal source(SSS) as IOMUX setting, which is
+              calculated as: pinmux = (PIN_ID << 4 | SSS)
+
+          slew-rate:
+            description: Supported slew rate based on Fmax values (MHz)
+            enum: [83, 133, 150, 166, 208]
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - "#gpio-cells"
+  - gpio-ranges
+  - gpio-reserved-ranges
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    siul2: siul2@4009c000 {
+      compatible = "nxp,s32g2-siul2";
+      reg = <0x4009c000 0x179c>,
+            <0x44010000 0x17b0>;
+      reg-names = "siul20", "siul21";
+      gpio-controller;
+      #gpio-cells = <2>;
+      gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
+      gpio-reserved-ranges = <102 10>, <123 21>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
+
+      jtag_pins: jtag-pins {
+        jtag-grp0 {
+          pinmux = <0x0>;
+          input-enable;
+          bias-pull-up;
+          slew-rate = <166>;
+        };
+
+        jtag-grp1 {
+          pinmux = <0x11>;
+          slew-rate = <166>;
+        };
+
+        jtag-grp2 {
+          pinmux = <0x40>;
+          input-enable;
+          bias-pull-down;
+          slew-rate = <166>;
+        };
+
+        jtag-grp3 {
+          pinmux = <0x23c0>,
+                   <0x23d0>,
+                   <0x2320>;
+        };
+
+        jtag-grp4 {
+          pinmux = <0x51>;
+          input-enable;
+          bias-pull-up;
+          slew-rate = <166>;
+        };
+      };
+
+      nvmem-layout {
+        compatible = "fixed-layout";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        soc-major@0 {
+          reg = <0 0x4>;
+        };
+      };
+    };
+...
-- 
2.45.2


