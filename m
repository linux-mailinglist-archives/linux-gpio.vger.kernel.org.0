Return-Path: <linux-gpio+bounces-8258-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CCA9346CF
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 05:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DB9FB22270
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 03:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E470F39856;
	Thu, 18 Jul 2024 03:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="creZX4j2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A81718B14;
	Thu, 18 Jul 2024 03:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721274054; cv=fail; b=kPjaWm2zMHVxVCJaTE5dm8mhGDHFlfndmt1bQf5os2vhOSR0vh20/zZZayuKwj5jtCFHWaFyyiYpoHu/LrCoYgIrEoLjBI96/nOZeKIHDrc8wMZkwR3F6iYakeQjGqeefAZuNErJntEGuOZa4wp7k38YNq4umifwBFG1pjqsGhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721274054; c=relaxed/simple;
	bh=hDxiUbaiDQVqWZ9+/VnuLHtusm7WYiUwA7mpflRibx4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PSR/l4VQgGxVyXPWuJhU7g/+NVOy8U4u5c2y6CL1lxEciSBnVY6/Sw8zdQfsJm+Ei6u3gCuiE8PQhyxEByM+1mkDl9PvJye+gvVc+nG2aNMOti7Ssy3qLJ2ooNBpy2oM4PeTBtwZLV6JveJ6Dn9/Nw5wZZ05/CU5xxkOnKDE0lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=creZX4j2; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOavIeIdiXuASVfJSDJTkv8O4zmbZShdu4/+7Ob3Y6swvQKuzdYyi4CIujlJ5DN9qSpbw2oY5tFBDTUtd9Bf1vuWZTJuBiMXBhYFTecOO13eSBXKHoKEQgw4XCBfjn8R76JN/HfFR7cUwyc++UQPL9CS/K8QKQaoE0+zyoV1FU/uagjO/Kxx4NOsu6oFrTZXzAjL+YwfvboDCl36Nbl3gpuMYwRZB09EcKFMOMn7OIuCdDr8IBrIXNHzhfJMBi+YQTymCtTKkCvYtj8tTgfTGjRQSPreUq6WmYEjo0poV8EL5kT9dvh5CD13ExrXDx1SLZSIvtd8dkpMPVf+uQlmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDxiUbaiDQVqWZ9+/VnuLHtusm7WYiUwA7mpflRibx4=;
 b=BkLXWTLUQbKm1/k4Y1/gqgWsqSLMPYX0H5zlxxdxd3Qgf3HcES9VmUbCmmLfF7YUeEfaYHyptVEhdmSjbOLQyHvqxxWaeF3JMVGC6XfemnHwUPj8AK+kuT3EzeI8V+MklxiL4blxM9xPaOwqVdHRuo0TLiRtU1FA0c3nTGzi7BzLp7y8eF9nLGGcJAntmW72sxgJnmVpFS2xXZDjI4fy1wq5jScoi8CVZ0B2hoFg7g1ZltgiI1LKqOCm7rkeoxC5iSYSUAfLMCDyr1ldzHDeuO+APZRGqlBQr1MFDEPDWcDKR27lOQxpN4xW/JXf4J/9s1TbvmwbkmYZFBtldKmtaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDxiUbaiDQVqWZ9+/VnuLHtusm7WYiUwA7mpflRibx4=;
 b=creZX4j2rpm0GBSLbx6WVoN+8MABLfJb4FkgeC6R5J2BEaN2Pztigdc+IkIW0LcMYFUNOfwgwLJX/EeR6W9vB3XGOGZ+sEGPEBqgkmyLgJ8f5yoE5UhYSvZndwp0INc6g8WTdVi4jfVka9zU7t1q21Z1yz72FQdWrsHgqAwlW4Y=
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by GVXPR04MB9880.eurprd04.prod.outlook.com (2603:10a6:150:119::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 03:40:49 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 03:40:49 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, Rob Herring <robh@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"'devicetree@vger.kernel.org'" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, Aisheng Dong
	<aisheng.dong@nxp.com>, Frank Li <frank.li@nxp.com>, Shenwei Wang
	<shenwei.wang@nxp.com>, Bough Chen <haibo.chen@nxp.com>
Subject: Question about gpio-hog
Thread-Topic: Question about gpio-hog
Thread-Index: AdrYxB2okPCeSPTPT0i7IfzJHAmx+Q==
Date: Thu, 18 Jul 2024 03:40:49 +0000
Message-ID:
 <DU0PR04MB949657D9575090C71714D2A090AC2@DU0PR04MB9496.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|GVXPR04MB9880:EE_
x-ms-office365-filtering-correlation-id: 2402c7d2-d49f-4541-18e4-08dca6db6a98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TkxHbkpTajloNXNqYzIzQ2t2NjMyTm5tdGtBczlUS3AzSkVXREg5UUhpOElM?=
 =?utf-8?B?MUFqT0dtdDdFRGIzS09Pazl6ek1ZNC9lZm1BYnZWWGsrMlNiSDlhUG9iS1RS?=
 =?utf-8?B?eTV0SXpHcXNRaXRMY0hsUGNnVXhvN254dWd4U0tKR2lhWVZtUmlwZmljS2RP?=
 =?utf-8?B?V1BSZEI4KzdSeXFzVGUxQU1qZXQ1NzVVdm5nb0ZaWGk1eUVtZHhsTE9UQS9L?=
 =?utf-8?B?eHRsc3paZU5HQ09kNDB5bjdzVnlWRmsyU2dwZ0dFWDg0akFGTVhPYi9NZnF5?=
 =?utf-8?B?Zk9lM1JwMlo5WjQxT3NWdGplalRRWG42ZmVzK0J2RmxVWTJmUWlNS1BHaVZk?=
 =?utf-8?B?ajZJR2pjZTltVzZndUQ0VTA2VXo0UE1nSyt3ZHd3dmtMRTl0MDdnQWl4cmlu?=
 =?utf-8?B?L3YvZmUyQkFJN005aHRxd0g0c1hGL0lJU01YQ2dQbGhwN05BcUVmK1BtcjNi?=
 =?utf-8?B?YUNTL3lNWHdZQkFBV3lLN21zdkc3d0cvckcwTldGWkJWNXJ2SHdISXpIVVZj?=
 =?utf-8?B?cG1YTTdFY2g4Y0czWlVBWlJVR1RvWHFLNkVWYkN4djE3Wm5FTmFnR1VQL3lH?=
 =?utf-8?B?UllmVGU4a3I1bXhmZ0tJZzUxQVpyRk9LTHppckxiOWZUUWpzQ2FwbVgvclpJ?=
 =?utf-8?B?aW1JakgwMlpYSUtqZm9yUnlWaG54UU5tSUlMdERZKzQyRitoOS9lalRVUHVG?=
 =?utf-8?B?bHA3Znc1N0NkTzR2RGRBWjcwNks0THluaDd3YUhDbk16NzZtZ3FRU0NKemRu?=
 =?utf-8?B?WjF2bmRSYVZjTEgwZEE1K1NJREpRcHlYT05LdG80V1ZIMHJMK3AyTzhKdGtk?=
 =?utf-8?B?ZktQc2xHQ2k1RzUvWXJkMHFtcDFGUm9kYkZSc1Uvdy9kZGZabnIrd1BJcmFr?=
 =?utf-8?B?aUZ5dXpvUGdTdEk2cmM1bFBieFhPR2hadzYrRkN2SWk4Q2wxZ2xycTg3SVFM?=
 =?utf-8?B?cUkzbmVia2Y2QTZBdlRPT0w2MDJSbk5VcnFocWJUeTNGMlh0dmVDQXVxL3RJ?=
 =?utf-8?B?SlVNc2FzSWxPV3l3bmpWWTVDTE9tN1ovZTkzRkFLMStaZERtTDE4SnVYeWVS?=
 =?utf-8?B?dlVTK0xWU0JMNkxwa1RWVWZLV1NYclduTVlZOEQ5bDd3UTFkVWVCcFA1UElF?=
 =?utf-8?B?MzJpTnptTk9TbUd6TzBIU3VYYlp3V1ZjZUZxMjJpd0dUc2YrS3R0K0FQVWJl?=
 =?utf-8?B?ZmsrM3NxMzRQYnNyU2t4cDMyU0N4UERsK1R3WFEvWWg3amgvbWdpQkxOeDNM?=
 =?utf-8?B?TklpT3Z4THNobXd6MDNrdWxYdU5Jb1ZlZ2xvWXE4Sjc1SElUcERjZ1hkZVhq?=
 =?utf-8?B?a2ZUajlGMGdmQytVUkkrU1BycUNuODBxQVVxSEtjYTlXVW1oRWhlWHhuWlZ2?=
 =?utf-8?B?Y1RtUExRYktoeDk3cjBUcUlnUnpiZUpZVE83OUNBejVFU3JqK1YxZFg4YmpK?=
 =?utf-8?B?d1R1REhlUjJ1bSsyWHlGbUtselhMTTVjVHBVNmI2NmwzVkkwSW5oSXMyL0pG?=
 =?utf-8?B?VmNETmFEb2djUExPQ24wRElVTStpNnpLanpzSUxzSDdqRjBNTHN3K1A1WEVD?=
 =?utf-8?B?Z1lkOEV5R0hpZzk2cjVBMDhEVXdidGpRTmRab3VEM283WGl6VXgxNENuQ0lS?=
 =?utf-8?B?dkZFVnZVSTZVMHBaaG1WaUZuaE4rRUNSaXdZZFE5MzFqYnJvVVRYVzBwTXgz?=
 =?utf-8?B?dHdFanc0QStoT1F0clowWDVpV2tmOU1EeHFqUGtOZENBOXY2RWpzUkpxd1RF?=
 =?utf-8?B?dmpuZnVRREtlSDExcElPdmgyRjJjaGZtNFZQeHpaNG03cjFUNkx6a2JzV1p6?=
 =?utf-8?B?UWk1WXZVVDVaUkF4S0Y5anp3QnhmMG1mTm8wT3Z4OXZOQ1BJeElRUzBOd3Jn?=
 =?utf-8?B?S0tHcmJ4QUVEVTJiY09VaWZPY3JRcWtkQVdiV2NGdk5XU1E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WWE0NG42MmZSL011K3pBeHVUZnI5bFdiQ09FNVhtYi81UkFDVXdpbXJ4eHov?=
 =?utf-8?B?dmYzaTRFd2E4REdOZHJ6T00zdGNvdVFXWTRjVWxEK3cvNTRQNW9xZGJheUpy?=
 =?utf-8?B?QkYyU0F5NWlrNGxuT0dOWnZGbmpjL3BoVTdZYnY4WmZycHBpVWp5N2JzOVdC?=
 =?utf-8?B?Sk4zSkRBeWtwa1ZEM0Jxc1RyK0NsQXJ5bVR4eExQQXJHcDFWUkFENXFrTFZV?=
 =?utf-8?B?VDlwdW96L0J3YzZxeUs5NFV4MXNjZFUwRUZNU0xyWTB3OHNxVkFIa1RteDJ1?=
 =?utf-8?B?QmRPZDdQWjZSWnNVYk4wbytXZk81aGx0cE5ybzJNQkFrbXBrbWdoWWw1MHlC?=
 =?utf-8?B?Uzc2Slc3aTlZYTR6SFZDVDJJU1dUYzFSbENBYWlIZmRLQW9oaWFRT1ZPdExD?=
 =?utf-8?B?UFZDVXljYlV4WGZnTUVHMG1OOUpPQUs1SjdnUWRwQldQdFNHMkwvdGdHbGM3?=
 =?utf-8?B?WjMwdThkbjJjSit2KzNoMDQ3bzBWZFRYay9JcDhSRnJET1lqRE1PSTdDcUtr?=
 =?utf-8?B?cEM1YWg5dHdwMGpMdmVzbjBXdmRUL2dYZUJ3UmZnWXdUdVhhUllXWUJCbU9B?=
 =?utf-8?B?V1B1SG1ublA0OUNFelVncXVVSDAwdUtRTWdEaklvYnM1TmpsSnhzVlZCZHo5?=
 =?utf-8?B?ZWx0bmtGQ3JVVnMva3FrTnBBTlZNMzh4NE5Od0ZXNGlqVE11QVhqTEVodnBE?=
 =?utf-8?B?bzl4SFI3WWdEYkZ3dGpjN1RzU3EzMS9jaEVRbG9sM0FlN1YwMWRGN3BvNllB?=
 =?utf-8?B?TzFmNE03dzJpcXgxV0daMy8vTmJFeTBYYStlNWhUS2U1RVY4MGVyeEdEOTVQ?=
 =?utf-8?B?ZVhsSnMweEpML0RyaXVDR0dnYWJkbldSb0NYYlJkRGpIZ3h6MHZCMjFaMVAy?=
 =?utf-8?B?ME1FNE1peG91aUZXOGllZ3JySUE5YXRRQzIxeUh1ald2K2h4bjFnOU5UVXE1?=
 =?utf-8?B?VkFnd3VrYWxRNHdGZ1pXZEZXa2ZESTdEM0t5YWtGRi9ZYXF4NithcVdpQjlM?=
 =?utf-8?B?RFhPR2JPME5pZldxdWloU0I0eitGSUF2enZrMUhON1ZTWWRteHB6TkxyaEto?=
 =?utf-8?B?NUtIdXpNMjhRYjJKR28wL2Z1TEhFS3RIZ01wZEpBL0NUWG42TmNLU21Bc1Fa?=
 =?utf-8?B?bXdHa2libStxa1ZrV24wQXhSOW93SWpyZ0VSeXlkUlJyZHAxa09Hc1ZSK0Fz?=
 =?utf-8?B?WTBhT05LcTNPeTJudHRmQkNOZHJLNkRUbFoxZzdYSlhrUU5lSG5HcDRCNnVl?=
 =?utf-8?B?VnVVdUI5RDdUb052NU1ValF4ckFsVGJPTUtOTC9lVGJtTFJ6S1U3SHJuY0xU?=
 =?utf-8?B?L3MzZmNTZXc1WkZNR0QweFpuTGJXU1BFZlNRRFFWRkJ6Uk5RTGU3T0RuYnBx?=
 =?utf-8?B?RmtKeGpEcndSS0xHamErL0VQZGhuRys2bGsyQ2NzSmtuRDdaQlB6WXB0MFZq?=
 =?utf-8?B?U2xBTmh5a1Q3TWkxZ09EaXVFakNkaXo3TG1DRmpVTWNXNWNYWldXb1V0SUJu?=
 =?utf-8?B?RmVnbnBBWEpWNkUyRE03NE5YY2E0Nkp2NmFvdUptcWRQZS8vNUZiMjVSMXk2?=
 =?utf-8?B?VmlKMnZVUmg0WDN6TEUzZmg3emE2RzNXVXVGUFBlVG0wSmpTSFArNXcvRnhV?=
 =?utf-8?B?clp2NDJkM2FPeDFqOFV2TGMybUM2a2RkamVDeE9leG13MEVHTUVMbWlHS2dk?=
 =?utf-8?B?YVV5QjQxVHZVbVVycVdUcm1leEVnSUl1MjgrU1VEWmd1elVGM1czUW1vK3hT?=
 =?utf-8?B?NG1DU1hoTHgwcDV3R3RmSlpLSEJrQ0xLKzVLVmdQZzZWN01GbVhxZkdQb25F?=
 =?utf-8?B?cnNGYk9oQ2VqTjQ2V1BKanE3Sm9mUnM2eHR5TTRvb1dzMy8xazVlSFdJMS9h?=
 =?utf-8?B?YkN0dmlsaGQ2ZTFRaCtZV3llUU1NWWxQc2tmVEZjZU8zeTlCU0Q2cEZFYWtD?=
 =?utf-8?B?MlZ1b0cxT3E1SEpkUHUvNGF6QWRUNE1wVXVjQXBGcVVVek1FOCtxMmlCeVVk?=
 =?utf-8?B?UGg3aXh3UE9HQVh3TmJzZnZkVWdwd0RNSDVUaklFRHJLMWgzSEtFdGRZRDU2?=
 =?utf-8?B?aHYzT25GMWJsWW14WUlEL3UxUFArV0V2UlkySjM2aFVCaElOT09wQkM0WGY0?=
 =?utf-8?Q?1qSQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2402c7d2-d49f-4541-18e4-08dca6db6a98
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 03:40:49.5772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s9+rnOO2mvxjlrDysmqK95vioJWQm+7FJmrYvjmfGpFrDOkS8NHVTKIlea5fvtlg6ZRekyTkl99ek1hA7znDNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9880

SGkgQWxsLA0KDQpJIGhhdmUgYSBxdWVzdGlvbiBvZiDigJhncGlvLWhvZ+KAmSwgdGhlIHByb3Bl
cnR5IGdwaW8taG9nIHNlZW1zIHRvIGJlIHVzZWQgaW4gR1BJTyBub2RlIHJhdGhlciB0aGFuIGlu
IHVzZXJzIGRldmljZSBub2RlLCBzbyB3ZSBjYW7igJl0IHVzZSB0aGUgZGV2aWNlLWxpbmsgZmVh
dHVyZS4NCihzb3JyeSBmb3IgcmVzZW5kLCBJIHVzZSB0ZXh0L3BsYWluIG1lc3NhZ2VzIHRoaXMg
dGltZSkNCg0KZS5nLg0KDQpwY2FsNjUyNDogZ3Bpb0AyMiB7IA0KwqDCoMKgwqDCoMKg4oCmDQrj
gIDjgIDjgIAvKiB1c2RoYzMgYW5kIFFTUEkgc2hhcmUgdGhlIHNhbWUgcGluLCBoZXJlIHNlbGVj
dCBTRDMgcGlucyAqLw0K44CA44CA44CAdXNkaGMzLXFzcGktc2VsLWhvZyB7DQrjgIDjgIDjgIDj
gIDjgIDjgIBncGlvLWhvZzsNCuOAgOOAgOOAgOOAgOOAgOOAgGdwaW9zID0gPDE2IEdQSU9fQUNU
SVZFX0hJR0g+Ow0K44CA44CA44CA44CA44CA44CAb3V0cHV0LWhpZ2g7DQrjgIDjgIDjgIB9Ow0K
44CA44CA44CA4oCmDQp9Ow0KDQomdXNkaGMzIHsNCsKgwqDCoMKgwqDigKYNCn0NCg0KVGhlIGJv
YXJkIHNoYXJlIHRoZSBwaW5zIG9mIHVzZGhjMyBhbmQgUVNQSSwgYSBNVVggdXNlIG9uZSBHUElP
IHBhZCBmcm9tIG9uZSBJMkMgR1BJTyBleHBhbmRlciB0byBjb250cm9sIHRoZSBzZWxlY3Rpb24u
DQpTbyBiZWZvcmUgdXNkaGMzIHByb2JlLCBuZWVkIHRvIG1ha2Ugc3VyZSB0aGUgZ3Bpby1ob2cg
aXMgY29uZmlnZWQuIFdoaWNoIG1lYW5zIHVzZGhjMyBuZWVkIHRvIGRlcGVuZCBvbiB1c2RoYzMt
cXNwaS1zZWwtaG9nLg0KDQpUbyBhY2hpZXZlIHRoYXQsIEkgY2FuIGFkZCBhIGZha2UgR1BJTyBw
cm9wZXJ0aWVzIGxpa2UgYmVsb3c6DQomdXNkaGMzew0KwqDCoMKgwqDCoOKApg0KwqDCoMKgwqDC
oGhvZy1ncGlvID0gPCZwY2FsNjUyNCAxNiBHUElPX0FDVElWRV9ISUdIPjsNCn0NCg0KVXNkaGMg
ZHJpdmVyIGRvIG5vdCBoYW5kbGUgdGhlIGhvZy1ncGlvLCBqdXN0IHVzZSB0aGlzIGZha2UgaG9n
LWdwaW8gdG8gbGV0IHRoZSB1c2RoYzMgZGVwZW5kcyBvbiBwY2FsNjUyNCBJTyBleHBhbmRlci4g
TWFrZSBzdXJlIHdoZW4gdXNkaGMgZHJpdmVyIHByb2JlLCBhbHJlYWR5IHNlbGVjdCB0aGUgdXNk
aGMzIHBhZHMgb24gYm9hcmQuDQoNCkJ1dCB0aGlzIHdpbGwgdHJpZ2dlciB0aGUgRFQgY2hlY2sg
d2FybmluZyBpZiByZWxhdGVkIGRldmljZSBiaW5kaW5nIGhhcyDigJzigJxhZGRpdGlvbmFsUHJv
cGVydGllczogZmFsc2XigJ0gwqBvcsKgIOKAnHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2Xi
gJ0uDQoNCkNhbiB0aGlzIGJlIGFjY2VwdGFibGU/IEFueSB0aG91Z2h0cyBmb3IgdGhpcyBjYXNl
PyBJIHRoaW5rIHRoaXMgbWlnaHQgYmUgY29tbW9uIHVzZXIgY2FzZSBmb3IgZ3Bpby1ob2cuDQoN
Cg0KQmVzdCBSZWdhcmRzDQpCb3VnaCBDaGVuDQoNCg0KQmVzdCBSZWdhcmRzDQpCb3VnaCBDaGVu
DQoNCk1vYmlsZTogKzg2IDE4NTUwNTI0MzQ4DQoNCg==

