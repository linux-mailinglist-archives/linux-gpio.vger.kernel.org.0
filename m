Return-Path: <linux-gpio+bounces-21895-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6DDAE0FAC
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 00:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D160173A1A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 22:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE2728000F;
	Thu, 19 Jun 2025 22:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="UJW26Oos"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2123.outbound.protection.outlook.com [40.107.92.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6995D25D8E9;
	Thu, 19 Jun 2025 22:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750372894; cv=fail; b=rmO8vjo98mh70OWj24LeLVpP5vYTWvUX5CPIhepQ16QuAhVRP5fn+47I9Tr1MB3R32oItgxzRp10eEdMgFV7jLmY2zzK6TbrZWd2EIyXMn3o2KhTTBjDcc1yC8pwN0TQ0MbRoeTZq4jOpoDmvWcZbO330lnNaTe8KSdKyZtIsuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750372894; c=relaxed/simple;
	bh=GVl39WXve2yhcL0s7rDc0VdxuJcf1sXkaZe5xGpelIQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FD6DIYNPuJPiVZsAURv/v122W4ocQy53xlgJrDyVYwabi2vavVcDtGZPox3nVyKEvi6YpT1eMfXDPnsRXfEWTav0iEPmEMGE83fDADUHq0A0OC1SeAysVPrFeBpWR7F3LxZi+w5MYPxDLeEjQElK4VkJOKRZFXUb5t+I43+QKJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=UJW26Oos; arc=fail smtp.client-ip=40.107.92.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhrrIu72870ViCaYoEL7qTQeSQhVeMezUAtNQQjFOAx0VuqnksSNLtiMOlaOGjheCRkOmoL1m8/9zafkGLSnfhcHoUiFUNWnuYUz+AUdWnUyc8E/nVKbT1NQ/sQFv4f3pbzXroPKMXI7PDk/x1G0ZWNOAGZRyj87Jrvrr29enWxYDkVxwu6SIkFFpL3YQqNGohvaHVPx48b7ZyDqR8JsAfBfVdPsyBdDIYOd6NReTFdOuRkghFxToKWDoiWwjqtEknyNVj5RQpNKQiNlB80gNJADksP4t6y2kfJad0hC8xDzX4vfT9WaUDB0Mf71y+MofHMNnEyuPxTRiSHjApSGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVl39WXve2yhcL0s7rDc0VdxuJcf1sXkaZe5xGpelIQ=;
 b=MKKWGbJ50FzhkIhddAC/TjSC3m3mKqn6iutLUPMsJn1eK0cOGupG3noMZEljpvOXaDnSB/QOuIzuRKQACrBsFN0X/b0vKgeeg07DGPuarcE+HSi4HvQq1EnHULdX7p4QhGQ+TRW4re2AmlQLb2YbyWhuOEw8TkIzjsoBOwJmtbFoWr0vQWjFRCyPLHqdpK+Bci5cZID55KkFvniHOKVE3Z/5itYoCxGzA471FBP/eJWt+kWHZmAitVwcb4sHhuMz605QP3qBdkvsjHV7pqDyYfzSFhasCgtLT0uhfyXBnrOaSnP7H35OiiVWkgxqrDKEALQEHggnu5sHZPo+k3jc3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVl39WXve2yhcL0s7rDc0VdxuJcf1sXkaZe5xGpelIQ=;
 b=UJW26Oos3bwE/jw/PiZpCu2VKZGesemfXI5X+Xo4Im7kBq/7Vel426Bw4KjT3+VVF5Oz1iWnC53IWRCQtCKRUa/kDoExEZt4Ffj1UgkL+LUb/erJsQIfhk+da/YqU67LJlRzAs9/v5lIfummWio1ylwXhKkOnRbsaQuva0+WzhM7mWnebA2N8FDe8xNsrEfzje++CiL7fsq2Qk23CKk7/OHwxF1u9FSsG/tTVcAjZx4K7CY2nKMxkhgq34lM0nl7cu1z1EsP13Vr2hbzEZzZXWCHc52n6qV8s2EcCU6OHKa2KcAzne7jvE+zcZI5khrPKUf4E/yv7e6n/qEMhQTinA==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by SJ4PPF0C7A6E461.namprd18.prod.outlook.com
 (2603:10b6:a0f:fc02::f0a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.36; Thu, 19 Jun
 2025 22:41:27 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8769.031; Thu, 19 Jun 2025
 22:41:27 +0000
From: Harshit Shah <hshah@axiado.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Subject: Re: [PATCH v2 4/6] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
Thread-Topic: [PATCH v2 4/6] arm64: dts: axiado: Add initial support for
 AX3000 SoC and eval board
Thread-Index: AQHb3neXHHei+il700ibF96CIekp1rQFTYkAgAXMHAA=
Date: Thu, 19 Jun 2025 22:41:27 +0000
Message-ID: <bfcde082-270f-4152-b474-7828beab7cb9@axiado.com>
References:
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-4-341502d38618@axiado.com>
 <6ef92d1a-39cc-409f-8ebe-d28ad2006988@kernel.org>
In-Reply-To: <6ef92d1a-39cc-409f-8ebe-d28ad2006988@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|SJ4PPF0C7A6E461:EE_
x-ms-office365-filtering-correlation-id: 633c36ec-cfa7-426f-392d-08ddaf826d4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UUZlZ0laUjhHd0kzQ2kwckVjZnZwNzVwZFV0endqTGpJM2lWeXUwczVsWG51?=
 =?utf-8?B?Zk5XTHpSOGNRUUxFY2RieUpCZWNTRWlWblg5b3N1M1ZzTlB3bzVjdEhscFNU?=
 =?utf-8?B?RFh4cUNmUXVGUjJVR0c1RUV2Tjk1dGVvbFB2bUtPeGc1WGZuRnJDSUtwTXJi?=
 =?utf-8?B?VzY3bTVmNjVTbVhDa1VxaVZXZ3labnpCWmdIbytHckVBREovSnM3R1E3d0tF?=
 =?utf-8?B?RVUxTmd5K09nRzkydWJpUnZWcEtZaG1NZEh1cjdvSkpoYUVZS1U5OHFnZG9D?=
 =?utf-8?B?R3FuS0hsZ0t0M0VhUW1uS2k0b1YyVjV6R3UyZkR6cWp2eXFLUjJKby92RVFr?=
 =?utf-8?B?K3M2YkIzcThvOXNEZndNdmg2RW8zazZKQkRKZHl6cHdGRzVLNzVWWlFHTFFS?=
 =?utf-8?B?MkZiWTl4ZVBIbGZUTUZMdHYwa3dQc1lXOHlKeVlJMkZtYWhwY2Uwb0xoTnVP?=
 =?utf-8?B?b2pyWVJtRkNXZHB4QkwycUZURFlaaVNVNm5nOSsvenZjN3FhSVZmb2lQZHBu?=
 =?utf-8?B?SnlKaHBUZTBVR1NZbEdoZGpBQlloYWFRRStCUHZZK3hVOU5jTm9aL0x0SE9q?=
 =?utf-8?B?VkpqRFEyMFp3alJDVy96OUNIUHE0Sm42TmRNZVhHTVc1SWk2d3dWclNycUtI?=
 =?utf-8?B?VnRwU3loVkwzeWM2aSt1aE1ScEJvSC93blk0a01MUm9QSkRDT0taQmk4Ukc4?=
 =?utf-8?B?UXU3elowUnpOV2xsMWJpSElaZjAxaThKVzd2Y1dHR0tOYnVwRG5XZWJ2Wkkr?=
 =?utf-8?B?QzJWUmFxLytYd05EdmdwRkhEdi9vYXM1RHRlTnR4WEpZYVFNQVRrckt1VXRx?=
 =?utf-8?B?dnV2L0kxSzNsWlQyb2wxQldOTHZQVXFLQlVTQmdvQ3RXSCthMG5kUmlQZm43?=
 =?utf-8?B?THg2NFhsSVdyelVtVXBvNDQ3MDVGaGphcExnNE1qWjU1UG00RGtCZHluTzVr?=
 =?utf-8?B?ZmM4eDZ5dmVUaUUybHlWYkVFU2JNVVBBR3ZVK21HYWg2RVdNZ3VPTE0ySlZW?=
 =?utf-8?B?eDZqZTVhcXhZc3FJc3QvSytwK0V4elNHcU9xa0doMTR6L2V5Z0lSSmZMUzNa?=
 =?utf-8?B?YWxYdFdsMHdkQk5uUGlVeG9YVjNOS2xwMUZXR2RZb0grZ2psYXJ0dW93OVA0?=
 =?utf-8?B?QkVaRnVVNStWWGZpNmU5dzhISDB6SVlyeXNLOHlZNHNDYzJKNkJXWjk0a2xm?=
 =?utf-8?B?WGdxY1l3UXBYb2poOWpyVmlPK21IUXc0MEdDckFCaDlxc1UwM3I3S1pWWVJD?=
 =?utf-8?B?ZVlCUDdkVzNUSHdiMU9EcGt0N0NEL2ZJRlh4U055SjA0MHV6VlNVWWQwM0No?=
 =?utf-8?B?NlowcGwxNVpIQ01vQnphM0xOTVZEbVR6V3o3eGJKWHF4bFl5VmpjYmFRM3RK?=
 =?utf-8?B?VHdlOGo2ZGpEQ0pud0FmeTBiclJ6bTkwdTlxRlZHQ1NYelkwQ2xtL3BNV0hN?=
 =?utf-8?B?YTdMUmsrNDg1Slc5R3k3MThBL2YxTFZmNHlza05ZNkZPamlRVUk5VEE0bHZx?=
 =?utf-8?B?NTJpRHJTWG9Dak5uQVp1OCtvR3RDTkxBTUdyR0wreHNMZzNFNWE5Unl4RHl5?=
 =?utf-8?B?bUlzVVkzZXpkaXhlVlhxYkY3Z0RUdXM1Tm1qVjB3MlROcVpEUFE1Z1RiZjhY?=
 =?utf-8?B?TmdpakdrdHJmN3hydjdCczdYclR5c0NZSSt0ZVA5R0FYSWw3SWVYQ3V5cFVO?=
 =?utf-8?B?MHp6UmNRSkUxS00zNjRqdzNzUWprSkkvck8yeEJJVmU2ZVdleHhuMEh5ak9D?=
 =?utf-8?B?RkszVHY0VGhSekhRZ0c4MXBmR01Kc2RKb2xObnJOSldOblMrUkc0NXhtTGd6?=
 =?utf-8?B?TXpjU0lWS2UzTjQ4Y1lHNXlxd1RkbWRZakpBcENkcnovYlM1ZVptN1lFdzhO?=
 =?utf-8?B?S1p3bDhMN1N6OVBwdnUyMHUxTXNzMmFzeTNDTFdVb1FieStucFdlelVuMHBU?=
 =?utf-8?Q?AmeUiU0xJLc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OTNOTlF5UTFuOHdKeUgzMTlpUzJHeHFtTFJUQ0dKb2pXUnovem5qSGpVUmJj?=
 =?utf-8?B?VjVQcCtsWTZGRjU3ZmVwTjBxamFGR2wwYWhHNDNTVG1rbHNxbXNNR1p0Znpz?=
 =?utf-8?B?a01PbzBOT0ZFSEIwdUhqY2tsbXcwRDBjejVpd2JRMUxPZVRhZGYyRFZIckt4?=
 =?utf-8?B?YmxGbkxDOC9TVnBlYWxTZHhJNjZPemlESVVlVFZxKzJyclUvSHB3cGoxcUx2?=
 =?utf-8?B?S002UFAxWFgyZ2ZveWxQVGMzSzdBeEQvUlA5VHI5bEdXaTBQcmVKeWFZbXhH?=
 =?utf-8?B?UGJPZzVFZnRvd0ppMytGT1VnTmN2NUFHUHhNZGVEYU4weWhGcngwaDd2NHYy?=
 =?utf-8?B?RWNjbERITTdIeURSVzZIVXUvNFNCVDBIK2x2TXlpL2l5RGFEQitJOFc0a3dV?=
 =?utf-8?B?ZGJycHdBbUREZk5kd1IxeEFmSko0YWwzbUpDK2U1c0p2ZUVwR29waWd5bWpW?=
 =?utf-8?B?Qmplb3lUdTZLc21JSkp0eDN6UElqMDFwNC8yazFPUE9kNHNnNDNhZzlyZkZQ?=
 =?utf-8?B?YWdWVW03NC93Tm5TVFlIVmVKSGRiNG9EbEd1ODc3N2lNWEtaaUZEZW0xdG5w?=
 =?utf-8?B?dmg1TmRtQjFRZXhiSXZqckZLdGVwU0lOanhmTFBWSllCWW5Pb09VbUxReVAv?=
 =?utf-8?B?STJuTnI5WkdEUWtwNlJLckdzTWRJN054OGhWUERVcTlwR1JjeDVhL3Z4Z0xm?=
 =?utf-8?B?RDNXTW5tYW5YUkJwdVZ2L2pMUTF6aVdUaVFkdWhIaEN0RVI1cFNYUTZUNlho?=
 =?utf-8?B?amt0ZEtHNURTNFlPWHRUaCtYdWlHR0pzYjQ0YkpCWHB5VWI3S00zU1YrVjB0?=
 =?utf-8?B?VVRmZ2dDNUJsak1yZHY2Vk0xNkFJcDliZTBKenlCcG81akNsdEQrQTRHY1BM?=
 =?utf-8?B?dndGVTh5WGRUNUJSVmU2ZlNTYVFzeDg3M2JOWVkwalEvcHU2Y29zWDAzSklH?=
 =?utf-8?B?Y2FQNDd0c2xKZHc1MmJqSGt1N0t3VmhhUDNEMHZaSGZNTk9RZEFnUDViTDhD?=
 =?utf-8?B?WXBleDFWN3hTK0Rib3FMclBmZGtpM0xzbzArUVZ0aGhpaHEzL2FTc05WK3BV?=
 =?utf-8?B?R0w5Wng3NjBITUJBcTRyVkZBandEbDkwdE53aUhXV2g2b3RTU1hVeXcvM0VQ?=
 =?utf-8?B?QU4rdlVlYVBiWEtvNEYwcmgwb240ZlBBUEtGS2E1ZFZaVEozYm9JZG1LVGty?=
 =?utf-8?B?ZVBqdytUL09pV0pZcTY4ak5PK1c2TlU0YTkwaHZjZ0pweFc5THdsamE3aEF2?=
 =?utf-8?B?YS90UmpSWFdoMXZPWnZrU2FtdzdseGhDU1diSWNETmZJWkVQSGJJL2gyUlRm?=
 =?utf-8?B?VStsRE9WSjFaM0JuK2lZaTBMcVRTTkNZeWYyM0grNHZ1TmV1a1ZGbDgxWm5w?=
 =?utf-8?B?QzBVd1ZmcnU2WlVtNXlVdFRvTmpHUkppaXRPNStia0p2ZWlzNnJ4ZHNiaUxm?=
 =?utf-8?B?ZElwUXVyZVFrVEQ3MCtiTmxlWXQxL0c5a2N2aVlwd2h3ckhhd2M0OEFHOVl5?=
 =?utf-8?B?ek11eEV5QU5BQjRsTmg1ZG5HRmFyT0RoTHViOUx2b1VWV3hnRVhoYURJRDRl?=
 =?utf-8?B?dURnZExJNGJWMEV5b05PZ3hHTU93eUlYdU5ZcG9Ld00rajNWWGhvZDFYd3NU?=
 =?utf-8?B?WUVwanJIZlgvNkgwY2phK2ltZUJhYUYyS2lnWjhhY3ptZDBqUTd0WDFOWU5U?=
 =?utf-8?B?c2xPazN2VGpscWN0WVBVVkkxVFJUL0RTNkQ0SHNKTFlLa1I1aUJjRUgvVnpX?=
 =?utf-8?B?WFY4QlBSaFMrQzNwQkpZdTBseGw3Wm1oY2dBVTRHcU8rNUVGdmFMTGpCaFhy?=
 =?utf-8?B?a3VDNmlTVDA5T1BoK3FNNkVWcnRLWlVGMWExS3pRRG5XdmxPU01oTjJkc1Iy?=
 =?utf-8?B?OThwQjVmZjRwaTlZZFJDVVhvZkthZHNRMDZ4QXZzdHdxMG9Pdlp4QmFpZUo4?=
 =?utf-8?B?ZFlvQzUwVW91eXJvRE1MckROS0tLcmxQdlJWNk5GaGkwSDJ0d2FIQ01MMlpK?=
 =?utf-8?B?U3NDR2N1ZXZQUUU3a0RXeE9MT3A4bXgzc1NHUy9NdnExVUZ6VUIxL2dONlZo?=
 =?utf-8?B?YlV6TkxxeFUzaUpMWGRjUEM2Q244Y3ZzZytVcU55bU9kL3RlM2JCWTd1aUNz?=
 =?utf-8?Q?HbpU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30F8897095492C48B4B8496769A28A52@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633c36ec-cfa7-426f-392d-08ddaf826d4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 22:41:27.0529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BqTAU1GICqernvycHFivC3yD8Kf/W9HVmG16bCzXwPPZaYJHascuWFr7UGiGbvIjGfrVrFwPnC0S7VUFgHoQWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF0C7A6E461

SGnCoEtyenlzenRvZiwNCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgdGhlIHJldmlld3MuDQoN
Ck9uIDYvMTUvMjAyNSAxMTowOSBQTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24g
MTYvMDYvMjAyNSAwNjozMSwgSGFyc2hpdCBTaGFoIHdyb3RlOg0KPiArICAgICAgICAgICAgIHNl
cmlhbDAgPSAmdWFydDA7DQo+ICsgICAgICAgICAgICAgc2VyaWFsMSA9ICZ1YXJ0MTsNCj4gKyAg
ICAgICAgICAgICBzZXJpYWwyID0gJnVhcnQyOw0KPiArICAgICAgICAgICAgIHNlcmlhbDMgPSAm
dWFydDM7DQo+IE5vbmUgb2YgdGhlc2UgYXJlIHByb3BlcnRpZXMgb2YgU29DLCBidXQgYm9hcmQu
IE1vdmUgcmVzcGVjdGl2ZSBhbGlhc2VzDQo+IHRvIHRoZSBib2FyZCBmaWxlcy4NCg0KTWFrZSBz
ZW5zZS4gSSB3aWxsIG1vdmUgaXQgdG8gdGhlIGJvYXJkIGZpbGUuIEFsc28gSSB3aWxsIG9ubHkg
a2VlcCB0aGF0IA0Kd2UgdXNlIGluIHRoZSBib2FyZCBmaWxlLg0KDQo+PiArDQo+PiArICAgICB0
aW1lcjp0aW1lciB7DQo+IE1pc3Npbmcgc3BhY2UgYmVmb3JlIG5vZGUgbmFtZSwgYnV0IGFueXdh
eSBsYWJlbCBpcyB1bnVzZWQuDQoNCk5vdGVkLg0KDQo+PiArICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiYXJtLGFybXY4LXRpbWVyIjsNCj4+ICsgICAgICAgICAgICAgaW50ZXJydXB0LXBhcmVu
dCA9IDwmZ2ljNTAwPjsNCj4+ICsgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfUFBJIDEz
IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNf
UFBJIDE0IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
IDxHSUNfUFBJIDExIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgIDxHSUNfUFBJIDEwIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPj4gKyAgICAgICAgICAg
ICBhcm0sY3B1LXJlZ2lzdGVycy1ub3QtZnctY29uZmlndXJlZDsNCj4+ICsgICAgIH07DQo+PiAr
DQo+PiArICAgICBjbG9ja3Mgew0KPiBLZWVwIHByb3BlciBzb3J0aW5nIG9mIG5vZGVzLCBzZWUg
RFRTIGNvZGluZyBzdHlsZS4NCg0KQWgsIHdlIG1pc3NlZCB0aGF0LiB0aGFuayB5b3UuIEkgd2ls
bCBrZWVwIHRoZSBub2RlcyBhcyBwZXIgdGhlIA0KYWxwaGFiZXRpY2FsIG9yZGVyLg0KDQo9PT09
PQ0KY3B1cw0KDQpjbG9ja3MNCg0Kc29jIHsNCg0KIMKgIMKgIGdpYw0KDQogwqAgwqAgZ3Bpb3MN
Cg0KIMKgIMKgIGkzY3MNCg0KIMKgIMKgIHVhcnRzDQoNCn0NCg0KdGltZXINCg0KPT09PT0NCg0K
Pj4gKyAgICAgICAgICAgICByZWZjbGs6IHJlZmNsayB7DQo+PiArICAgICAgICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7DQo+PiArICAgICAgICAgICAgICAgICAgICAg
I2Nsb2NrLWNlbGxzID0gPDA+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGNsb2NrLWZyZXF1
ZW5jeSA9IDwxMjUwMDAwMDA+Ow0KPj4gKyAgICAgICAgICAgICB9Ow0KPj4gKw0KPj4gKyAgICAg
ICAgICAgICByZWZfY2xrOiByZWZfY2xrIHsNCj4gVGhpcyBtYWtlcyBubyBzZW5zZS4gWW91IGhh
dmUgcmVmY2xrIGFuZCByZWZfY2xrLiBUaGVzZSBBUkUgVEhFIFNBTUUuDQo+IFBsZWFzZSB1c2Ug
bmFtZSBmb3IgYWxsIGZpeGVkIGNsb2NrcyB3aGljaCBtYXRjaGVzIGN1cnJlbnQgZm9ybWF0DQo+
IHJlY29tbWVuZGF0aW9uOiAnY2xvY2stPGZyZXE+JyAoc2VlIGFsc28gdGhlIHBhdHRlcm4gaW4g
dGhlIGJpbmRpbmcgZm9yDQo+IGFueSBvdGhlciBvcHRpb25zKS4NCj4NCj4gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3Ry
ZWUvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2ZpeGVkLWNsb2NrLnlh
bWw/aD12Ni4xMS1yYzENClRoYW5rIHlvdSBmb3IgdGhlIGRvY3VtZW50LCB3ZSB3aWxsIGZvbGxv
dyB0aGlzIGRvY3VtZW50IGFuZCB3aWxsIHJlbW92ZSANCnJlZHVuZGFudCBub2Rlcy4NCj4+ICsg
ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MD47DQo+PiArICAgICAgICAgICAgICAg
ICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDE+Ow0KPj4gKyAgICAgICAgICAgICB9Ow0KPj4gKw0K
Pj4gKyAgICAgICAgICAgICBzcGlfY2xrOiBzcGlfY2xrIHsNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAjY2xvY2stY2VsbHMgPSA8MD47DQo+PiArICAgICAgICAgICAgICAgICAgICAgY2xvY2stZnJl
cXVlbmN5ID0gPDI1MDAwMDAwPjsNCj4+ICsgICAgICAgICAgICAgfTsNCj4+ICsNCj4+ICsgICAg
ICAgICAgICAgYXBiX3BjbGs6IGFwYl9wY2xrIHsNCj4gTm8gdW5kZXJzY29yZXMgaW4gbm9kZSBu
YW1lcywgYnV0IGFsbCB0aGVzZSBsb29rIGluY29ycmVjdCAtIGRvbid0IHlvdQ0KPiBoYXZlIGNs
b2NrIGNvbnRyb2xsZXI/DQpOb3RlZCwgd2Ugd2lsbCByZW1vdmUgdGhlICJfIiBmcm9tIHRoZSBu
b2Rlcy4gV2UgZG8gaGF2ZSBjbG9jayANCmNvbnRyb2xsZXIgaG93ZXZlciB0aGF0IGlzIGJlaW5n
IGFjY2Vzc2VkIGJ5IG90aGVyIENQVSBiZWZvcmUgTGludXggd2lsbCANCmNvbWUtdXAuDQoNClNv
LCB0aGUgcHVycG9zZSBvZiB0aGlzIGNsb2NrIG5vZGVzIGlzIHRvIGNhbGN1bGF0ZSB0aGUgZnJl
cXVlbmNpZXMgZm9yIA0Kb3RoZXIgcGVyaXBoZXJhbHMuIChXZSB3aWxsIHVwZGF0ZSB0aGUgbm9k
ZXMgd2l0aCBjbG9jay08ZnJlcT4pDQoNCg0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiZml4ZWQtY2xvY2siOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICNjbG9jay1j
ZWxscyA9IDwwPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8
MjUwMDAwMDA+Ow0KPj4gKyAgICAgICAgICAgICB9Ow0KPj4gKyAgICAgfTsNCj4+ICsNCj4+ICsg
ICAgIHNvYyB7DQo+PiArICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7DQo+
PiArICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPj4gKyAgICAgICAgICAgICAj
c2l6ZS1jZWxscyA9IDwyPjsNCj4+ICsgICAgICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwm
Z2ljNTAwPjsNCj4+ICsgICAgICAgICAgICAgcmFuZ2VzOw0KPj4gKw0KPj4gKyAgICAgICAgICAg
ICBnaWM1MDA6IGludGVycnVwdC1jb250cm9sbGVyQDgwMzAwMDAwIHsNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gImFybSxnaWMtdjMiOw0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgICNz
aXplLWNlbGxzID0gPDI+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIHJhbmdlczsNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDM+Ow0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOw0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICNyZWRpc3RyaWJ1dG9yLXJlZ2lvbnMgPSA8MT47DQo+PiArICAgICAgICAgICAgICAgICAg
ICAgcmVnID0gPDB4MDAgMHg4MDMwMDAwMCAweDAwIDB4MTAwMDA+LA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8MHgwMCAweDgwMzgwMDAwIDB4MDAgMHg4MDAwMD47DQo+IERU
UyBjb2Rpbmcgc3R5bGUsIGluY29ycmVjdCBvcmRlci4NClRoYW5rIHlvdSwgd2UgYXJlIGZvbGxv
d2luZyB0aGlzIHJlZmVyZW5jZTogDQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLGdpYy12My55YW1sP2g9djYu
MTEtcmMxI24yNDINCg0KZ2ljNTAwOiBpbnRlcnJ1cHQtY29udHJvbGxlckA4MDMwMDAwMCB7DQog
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY29tcGF0aWJsZSA9ICJhcm0sZ2lj
LXYzIjsNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAjaW50ZXJydXB0LWNl
bGxzID0gPDM+Ow0KIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICNhZGRyZXNz
LWNlbGxzID0gPDI+Ow0KIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICNzaXpl
LWNlbGxzID0gPDI+Ow0KIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJhbmdl
czsNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbnRlcnJ1cHQtY29udHJv
bGxlcjsNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAjcmVkaXN0cmlidXRv
ci1yZWdpb25zID0gPDE+Ow0KIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJl
ZyA9IDwweDAwIDB4ODAzMDAwMDAgMHgwMCAweDEwMDAwPiwNCiDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8MHgwMCAweDgwMzgwMDAwIDB4MDAgMHg4
MDAwMD47DQogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW50ZXJydXB0cyA9
IDxHSUNfUFBJIDkgSVJRX1RZUEVfTEVWRUxfSElHSD47DQoNCiDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB9Ow0KDQoNCj4NCj4+ICsgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJ
Q19QUEkgOSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4+ICsNCj4+ICsgICAgICAgICAgICAgfTsN
Cj4+ICsNCj4+ICsgICAgICAgICAgICAgdWFydDA6IHNlcmlhbEA4MDUyMDAwMCB7DQo+PiArICAg
ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ4bG54LHp5bnFtcC11YXJ0IiwgImNkbnMs
dWFydC1yMXAxMiI7DQo+PiArICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9
IDwmZ2ljNTAwPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19T
UEkgMTEyIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIHJl
ZyA9IDwweDAwIDB4ODA1MjAwMDAgMHgwMCAweDEwMD47DQo+IERUUyBjb2Rpbmcgc3R5bGUuDQoN
CkdvdCBpdC4gV2lsbCBtb3ZlICJyZWcgPSAiIGluIHRoZSBzZWNvbmQgbGluZS4NCg0KDQo+DQo+
PiArDQo+PiArDQo+PiArICAgICAgICAgICAgIC8qIEdQSU8gQ29udHJvbGxlciBiYW5rcyAwIC0g
NyAqLw0KPj4gKyAgICAgICAgICAgICBncGlvMDogZ3Bpby1jb250cm9sbGVyQDgwNTAwMDAwIHsN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImNkbnMsZ3Bpby1yMXAwMiI7
DQo+PiArICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZyZWZjbGs+Ow0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgIGdwaW8tY29udHJvbGxlcjsNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAjZ3Bpby1jZWxscyA9IDwyPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQt
cGFyZW50ID0gPCZnaWM1MDA+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMg
PSA8R0lDX1NQSSAxODMgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+PiArICAgICAgICAgICAgICAg
ICAgICAgcmVnID0gPDB4MDAgMHg4MDUwMDAwMCAweDAwICAweDQwMD47DQo+IERUUyBjb2Rpbmcg
c3R5bGUuDQoNCk5vdGVkLCB3aWxsIHVwZGF0ZSBvbiB0aGlzIGFuZCBvdGhlciBub2Rlcy4NCg0K
DQo+DQo+DQo+DQo+DQo+PiArDQo+PiArICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRp
c2FibGVkIjsNCj4+ICsgICAgICAgICAgICAgfTsNCj4+ICsNCj4+ICsgICAgICAgICAgICAgaTNj
MTY6IGkzY0A4MDYyMDQwMCB7DQo+PiArICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJjZG5zLGkzYy1tYXN0ZXIiOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwm
cmVmY2xrICZjbGtfeGluPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9
ICJwY2xrIiwgInN5c2NsayI7DQo+PiArICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LXBh
cmVudCA9IDwmZ2ljNTAwPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0g
PEdJQ19TUEkgOTIgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+PiArICAgICAgICAgICAgICAgICAg
ICAgaTJjLXNjbC1oeiA9IDwxMDAwMDA+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGkzYy1z
Y2wtaHogPSA8NDAwMDAwPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMCAw
eDgwNjIwNDAwIDB4MDAgMHg0MDA+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNz
LWNlbGxzID0gPDM+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+
Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+PiArICAg
ICAgICAgICAgIH07DQo+PiArDQo+IERyb3Agc3RyYXkgYmxhbmsgbGluZXMuDQpPa2F5LCBtYWtl
IHNlbnNlLg0KPg0KPj4gKyAgICAgfTsNCj4+ICt9Ow0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYXhpYWRvL2F4MzAwMF9ldmsuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9h
eGlhZG8vYXgzMDAwX2V2ay5kdHMNCj4+DQo+PiArDQo+PiArICAgICBjaG9zZW4gew0KPj4gKyAg
ICAgICAgICAgICBib290YXJncyA9ICJjb25zb2xlPXR0eVBTMywxMTUyMDAgZWFybHlwcmludGsg
bnJfY3B1cz00IGVhcmx5Y29uIjsNCj4gRHJvcCBib290YXJncy4gTm90IG5lZWRlZCBhbmQgbm90
IHN1aXRhYmxlIGZvciBtYWlubGluZS4gZWFybHljb24gKG5vdA0KPiBlYXJseXByaW50ayEpIGlz
IGRlYnVnZ2luZyB0b29sLCBub3Qgd2lkZSBtYWlubGluZSB1c2FnZS4NCk1ha2Ugc2Vuc2UuIEkg
d2lsbCByZW1vdmUgdGhlIGJvb3RhcmdzLg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K
DQpSZWdhcmRzLA0KDQpIYXJzaGl0Lg0KDQo=

