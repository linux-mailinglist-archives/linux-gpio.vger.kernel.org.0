Return-Path: <linux-gpio+bounces-22112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD63AE73E4
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 02:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E4FF17E6CD
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 00:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3242378F45;
	Wed, 25 Jun 2025 00:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="jlYaX2bi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2123.outbound.protection.outlook.com [40.107.243.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A722B9A5;
	Wed, 25 Jun 2025 00:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750812141; cv=fail; b=BWt0vld9UqS5rcWhxjzRi6A45dM3nkB1hM07KU+Pghe2sPo6rmzv8B7GOYfoqmMuYpxTu8ch2J5a+Xo8BzmAuPqDGc7YCjVt56Z9qGY9qFKXHKhIwUn7IPOlg0ZWWH4Tr0Wh3HZk6/Tou2KdZ9igIdfqgYvHGjsUkbhC7/AI/EU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750812141; c=relaxed/simple;
	bh=Hk55O7UyHSJQC4LuCG78/mF0z7fPtiVXDLPyfloJA58=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IHlEW42CmsxV7O/7krHCu7qiXI+j7kanzIv9JYoyfiwnyHHlCtB24jEmQmXFK7W+NQ8TNDV68toHv0e7aPBb6ehNUeRU7VZ1vvPMzdlS3IHJA6/nCHMQxSA2Ok7CTZtBSQBaf+w8Zd4Vi/YhWEPmFRmFaCODPGMRTVKlqOVrwMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=jlYaX2bi; arc=fail smtp.client-ip=40.107.243.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCSRBFiwLCsf8DWClBrrbMgXWWEBwgrOnaHboG6ZU+IPwctZEDCWDi2Wu9U0+otqvujnVBUhV52jNi7o+lVxwcMF3s07zlek7T4OqYKZTXWFsYTZ8JNiqbqJm2s8qFwVfR4utXNDJ7i7wbqKarSluhrAchImXhTFjIFsQUKgSA4sREbtfMd8kdY3O4/qyL30erVdL5vvM/ZONPdSNdZegjC7OPEjLYC1pOrzgD3kBDBuOGpN1qTCr0v+OrxjqDKhjW2LpYJ2V94qx7GsL+k0M09DSrWHAfHlQcKt7+uyeqDMAERuQ9Nd5qMPQaxRMKAQ0N4j62d38yaC1xwE6SebUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk55O7UyHSJQC4LuCG78/mF0z7fPtiVXDLPyfloJA58=;
 b=VlDoh97h2iKb3BfUgjtUj1Jvehh5T+Cjcbgq8noklBgZFnTacpRyhgCd/skcC7Be8O4yoTHKzxrfpVWvqFe09KBsUpdE8w1mTY9EDcDX3bMcpqOfXMME3a0KAtBou3d4rbJAS2zN5P/F8fn0meJTeB4HkeHJ+MMBqiLcP8Dc6phenPrXut/wlWjYcwvNrCtegezLSqTipqYYvJ/oVnvzUThYw6qYutBTumGnjzVf/9qgQWgoNL2yQM5yGCNrhq8M8TI0GgJBgb+/PNszxvFQrHRlKpZJ55s7Kw+zXVFNN65Mf33TmX6xbaax29R20PBxU6pJbi6x9ErQYf354TVMeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk55O7UyHSJQC4LuCG78/mF0z7fPtiVXDLPyfloJA58=;
 b=jlYaX2bieFDtrPodbEvIXMcoH/j+iH/f9NRPJ5CKD2LRyMuy+R3NjOh9xLrKFwkfQHtRLYjboG4/j9zXMHcr9hE/qdvHdTCLu4VwAbfLIHh3drJsBLekKzaPDjumAa2Ywqg4mgf4SzkfABDfF5fwk58ch/IwJR4CZK7sV66hgcOWS+W17UaVwM7dFZbHJjTkhn771iD4C4w5OwZWPNSD7o7UgjchAKnaFrl6K2coeAfPay/4KS8SFraezexSx4FLG66rQPmD1EMw2eS2kvqVtH4diwZpYoRSCv8RoZiCQqxg+JQeAzYN/3oZ2x3hinVkfingYgmeJOwnDkCLdqnDHQ==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by SA1PR18MB4789.namprd18.prod.outlook.com
 (2603:10b6:806:1dc::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 00:42:17 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8769.031; Wed, 25 Jun 2025
 00:42:16 +0000
From: Harshit Shah <hshah@axiado.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jan Kotas
	<jank@cadence.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Subject: Re: [PATCH v3 5/7] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
Thread-Topic: [PATCH v3 5/7] arm64: dts: axiado: Add initial support for
 AX3000 SoC and eval board
Thread-Index: AQHb5GREkMWleVUwnEujC+sUqBlKs7QR3j8AgAEs9wA=
Date: Wed, 25 Jun 2025 00:42:16 +0000
Message-ID: <1727c00a-b73d-436e-8ab6-c722c13c59fd@axiado.com>
References:
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-5-b3e66a7491f5@axiado.com>
 <0709a0a6-1313-452c-85e7-2926a6a03741@kernel.org>
In-Reply-To: <0709a0a6-1313-452c-85e7-2926a6a03741@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|SA1PR18MB4789:EE_
x-ms-office365-filtering-correlation-id: a6f04d36-cf67-4ee7-ccac-08ddb3812286
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TjNtV0tET0c5ekVLUjg0NGpaaTB6TFRMM1lkV2Rka0RHUHBsem1KZUU0SjBL?=
 =?utf-8?B?TFN2U2Y1REFGZWZBeWFCRzRzWVY2MEhuMVVGc1NkTkwvTVQ4UWdVK1FHUkg5?=
 =?utf-8?B?RUtUTHB5THRGSzhTUmJJbHUzQlhQaU40Qkl0c29jckJxb0tndENFSjBEMTdx?=
 =?utf-8?B?Nkd4akZYSXJOdE41S0x1MEd2cWVQaFY3S3VSN1FlRS9IcjNiL1BZVmhEN2x2?=
 =?utf-8?B?c1NWcmY3VEx5MDg4U1RZUGw2T012VXBOUFl2NE1CbnFWT3BsNitobUdmYkdv?=
 =?utf-8?B?QnBkUVNTZDRiRTFIVjJmZTFMQUgwZmFtcDVJQVowRVRqQWY2UmxIS3VKTUxz?=
 =?utf-8?B?N21vNDZKT0NZem53a3o3VFlXdGgwdDUzRjUvcmt1cGgxTUVSZFlkdXFUVTI4?=
 =?utf-8?B?UHRNbldRL21tUHFaL2YyV1hGaUJQUXBXdGJGU2RsM3lGeTFRWVVUSllIWG05?=
 =?utf-8?B?ZllKOEN6WVp5cFM0RjQ2T2t2QWpRb1dFQXpnalk2NkVBV3lMczN5S0JxQ2hB?=
 =?utf-8?B?bnRQcmljdWJUYWIzaTFHU1N0ejhpSGdnbWZHRzJwd0NGbzV5djhVTERmTmFa?=
 =?utf-8?B?SWVseVROK01FOFZLN2lTVVNiL2R4cWtmTVNlalhRV3pCLzgrN2h6cEtqcVNq?=
 =?utf-8?B?UU1aQVRITkFIazZsL09MYzBwempHZ0ViYk1JSlpPcDVQVVhBZlVBSEs4dElK?=
 =?utf-8?B?U1gweDNqTk0zWU1mMjFZZTEzcXYvbzJBV0Ryci9WWHFwZEFOdTJwdmJqSVp3?=
 =?utf-8?B?RCtBWTRSOVEyMXpaUTEwVjJacHIvYzVXR2hLb2UvZjlqazlYbkwrRjYrNEtV?=
 =?utf-8?B?MTcrTFphRW82YjdNTFpacjBMY2txeG42ZkxHV0dXNGx4cjQ3aGtvN1NweVlU?=
 =?utf-8?B?ZXFFRDJFT0dUeVhBN2dvOUEydldMZ3F3YklNNEhPSXlDYVBuRW1DQkJHSmQ3?=
 =?utf-8?B?cXFFMElBb1JMeEpaUWxFR0p6aW4xelJxM1lwR3VrRVNVYVZzdEgyNGF4T3Yy?=
 =?utf-8?B?YnZZQkJaNkt0UVlEazVHZ0NseDdCaUJpODJGZzgwM3lWelZPU3hRaERuYlRn?=
 =?utf-8?B?YThkQlBmZnBORWU2Vk1RZ0pHWG9uMFVmRSs0NTRNOTlpYXNONFFrUWYwVXRy?=
 =?utf-8?B?SWNzaVlhVEJSSEtoMVZMRzNtRGpERWNiMTJ4UVlsaktxNERoWWlXME1oMmxD?=
 =?utf-8?B?WWplM21NTHNPTk8xMk5RaERRc3Qxb1Z3QnlHaFhPeGhneTU0U3pzQkw5N2VU?=
 =?utf-8?B?MmJwZXl4ckdKVm5NdDdmYXVmNWdKSW1QZG9JL1I3RVpURVgvUGcwVUpQRHRo?=
 =?utf-8?B?eU0raXpFcXNyYW5qMzRzZlp5RUdGZFRHajdHVlNpeUFnRk4xSmJ4eWgzOHJW?=
 =?utf-8?B?Ym1vNGV5a0RNUjRFb1c3UWxNL1J0VThucW00dWFIdTgrS01VRnh4VjZTTXpB?=
 =?utf-8?B?NWUzK1pVRDBIWmdJbGJSOUhJRHJsMWkrVFJWQ3hndjV2V0UzUzdHbnUxdVJu?=
 =?utf-8?B?a3JERFlqK3N5YWNtYUd6RWQwUFByOFZmSld2cG83Y3ZQZ3d0WGFBdGZFd1o0?=
 =?utf-8?B?NHdvQzY1aXcyMmFNeUg1S2g1bk5tYmFpSUtkdlR5SXNQblZkdXFWdm1vdHR2?=
 =?utf-8?B?d2VsL2orNHhidVkxc3FMUEp6VWZhNllURldpMW5SL0NtclBUck1Ya1BPZm5l?=
 =?utf-8?B?T2RVeDBrSFliRml5OVczZ1pnTjI0UmJwTFhiU1VuZExiTXZVMXZSRWFXMGUr?=
 =?utf-8?B?KzdreVlCU2RKSXcxK0JGcUhFdndua05zSm9YSXpKTEttYnJCN3paTHI0TFM0?=
 =?utf-8?B?V1J1NmxrZjNOWi8rSEFnVjVOVXRjL0ozaTlueC8zN1pwZzVBcE1aWi9vWDBG?=
 =?utf-8?B?YjBnRDI3RXFoREwveGxpZ0xWb2w2SVhPSCtqUmNOZjVodE1ia1YrVmhXanNW?=
 =?utf-8?B?SzV1TE44Z2JVaTcxQ3hKaHA1Z2VmUWFVNlR4TG1YVDFoT01sN3A0QU5JZVhC?=
 =?utf-8?Q?I5tPFZzA7wNLydjUAs2G8eLW5aKvW8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ym5OWk00ZkRuKzlYbTUzbGtsMGMxYVE0eDBZcURKYXVDR0RTRmhnUUk2Nkpn?=
 =?utf-8?B?ZEY1MXNodTdheTIyMWRYdm1zZGdLK2pIMHgyV0lpR285K0ZBa0wyckJIK3ll?=
 =?utf-8?B?ei9DNStSK1FHUWFnN1NHTmRQS2R2TjdQaXNLb3NVVUJIMWRyZTBjZzVzU2lM?=
 =?utf-8?B?OVJveEpvRm81aGRiM1FQV2tpUU1VMG1WdTRlK1BDaXRGS2xTQ3JVYlNkQnVS?=
 =?utf-8?B?cjA0bjY4alV5VXRNYytQSDB6VnkvanVzR2FmRlYvM25rYXFYak5sb1JSQmRa?=
 =?utf-8?B?eVU5UGVTT01wVWd0WkhrK0lnWUxlZnA5WW1oenY1bmlETEtnb2dmOGJLdmZv?=
 =?utf-8?B?M1BEUU1YNUZndURsTlFQUEhDVjdYVjY3SzlublEzNFUrY1l0LzdCeXlXWDc0?=
 =?utf-8?B?TURJRzkwcXVnc3kvaW9IOWl4SGRUYzd4OU45M0Rra3ZiR2NNZEF6bklicktn?=
 =?utf-8?B?L0wrYTJ2M0ZYTjllVmZRQVBuMGxPU2lQeXhjNXpHYzNoU3pOZ2JCOWRqZ1ZP?=
 =?utf-8?B?TnRvYWpubFpJTkJCdUxlNmMrMnlXTHhYN1FhbEsxZnB3cTl6RCthUEFHSHht?=
 =?utf-8?B?bWxvLzEzYjVFcXNHUFRKWXAyS0h2Uk9DUHJ0YjByTXZ0a3laWGFaWFNZQUpE?=
 =?utf-8?B?aGN2ZmxOeElmR29xS3l5UzRrTUpiZlpseHVHcHgrQWdTSk1jTlB1Z3ZPREhr?=
 =?utf-8?B?NjZPL0U1bTVmSnhOTGRUTTEvQWpJMCtaM01KWU9kQldURExLOEdjK05vc0NV?=
 =?utf-8?B?bXNRZU42dGw2bG9NUEVxZ1Jldmgwak9JbE9PTC9rc1h6Rk15NEFSOU5wRGQw?=
 =?utf-8?B?SFF5TkJnV2JNVVJCdkwrNHJGVTJ5TEI0WjQ5MkFNd08xbDlwMS85QUxiYTVa?=
 =?utf-8?B?UkxHa25DWEZyMFJlWkhIdzNZc2grMXpjMWliZWdSeTdMbTQ1TnZtbm41K1p2?=
 =?utf-8?B?TnpOSUJrZ2FRL3lmMU95cjlMamp3cFZQT245VWNreWdkRmMweFdUSXd5N1NG?=
 =?utf-8?B?eUhkVUp6cFl5dzBsOWVuMnE2bDY5NzlkdWtpaC9weTZRSENmZDJWS1F5OGZC?=
 =?utf-8?B?VkU4Q2labHQ3OER2VGhrem9JNVhMTHV3WXozQ3ppNFpJa0xXTG4xcmxCWVFF?=
 =?utf-8?B?VkRkV1k4VXNQekhFRXJHaFcxMmdSaHNzZkR1ZkJjeHhHVWpleG8vSEx3VEFI?=
 =?utf-8?B?MWx5TVJiWmd5NndtRTNVVm1reDFWSUxmbDdhWHBxbUdubEJtbUVOb1lMSnBu?=
 =?utf-8?B?bmxjRXBSck1oRDc0Mk9hc3poMnFkRzBTNXRmcnM5elBjZjR6TTlBak52cnhC?=
 =?utf-8?B?NERSVDJVZ1FEYXlvekxKVnh4K2locEo4TnVnQkZxRW9pWCtiZWN5RllWYXo4?=
 =?utf-8?B?b2ZHTy9sUnhQd20yMksvQitMTlJKVDBsV2Erdm9CVE82MlVCWC9wYWNGZ2xW?=
 =?utf-8?B?eEZuM09lOG1leUJyT1RndkRESnZUMVh5alNUdU05cm5BOGFWQ3NrV2NvcWFx?=
 =?utf-8?B?NUZ4T21YK1FLbGxxMUU3S2dQSjQ0Z0ZkR2VLNVhFMkZoeTNGTUk4eGJNOXJl?=
 =?utf-8?B?R2NlTkIrOWFacnBzUVhCb2t5bGp3OE1DNUNLeU5kZGVZYjZ0ZkN1Z3QyWEFt?=
 =?utf-8?B?bThDNGVOTXVjWkNoaGFJYlZSdXRWamdQakpXVWhuSDJjVHdVb2x3VUlMRDBM?=
 =?utf-8?B?SDBnVDZaYk9pKzNZbm4yNDdlcjlmUFJMTGd0QXQ2M2IzalpnazhmaENmRjJ2?=
 =?utf-8?B?SXNvZDRsZUZXcUpEdktHVTU2NnY5S1FIWjl5M1BoVWFYRW4yTjdndU9PLy9M?=
 =?utf-8?B?RTJaa3BSTU5hcTJqR3ZqY1huZ29wSGpvNllJcnJPWE94eGFQZmZXc2hJK1Fr?=
 =?utf-8?B?RFdNU2g0VStwN2Rocy9MYnNIOUdpSzgwT2FQUWRwSGZ4ak5WNmcvaHl1ODV2?=
 =?utf-8?B?UDU4Y2dJeXdnRG0wM2VIRkxaamJwZ2JmWE5nMXQvYU9VSVc3NEpwMDNlck8r?=
 =?utf-8?B?VVo1TjNDQW5iZTZtVWg1R0FtTm1obGYyY0F1L0pEM0VUNkl5akNkNUVaMEpy?=
 =?utf-8?B?YUJ3cW9yNGN3S2ZsYk9MSlFKOWhFTDdSY1l3bGlIVC9WdVpwbzhpaFpabDN5?=
 =?utf-8?Q?ecjQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAE3B96C9DAC404DA21A2C329B7486B2@namprd18.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f04d36-cf67-4ee7-ccac-08ddb3812286
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 00:42:16.7400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yuY+baWJ9QU+1GsuAu3BZ+O3mg13iwV/QZFslSo3jy0s+jxxF36lqSqg1D5vmaivMpjhtYqKbPKSvKxOjf1ldQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB4789

T24gNi8yMy8yMDI1IDExOjQ1IFBNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBDQVVU
SU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRp
b24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVj
b2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4NCj4NCj4g
T24gMjMvMDYvMjAyNSAxOToyOCwgSGFyc2hpdCBTaGFoIHdyb3RlOg0KPj4gKyAgICAgbWVtb3J5
QDAgew0KPj4gKyAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOw0KPj4gKyAgICAg
ICAgICAgICAvKiBDb3J0ZXgtQTUzIHdpbGwgdXNlIGZvbGxvd2luZyBtZW1vcnkgbWFwICovDQo+
PiArICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDAwIDB4M0QwMDAwMDAgMHgwMDAwMDAwMCAw
eDIzMDAwMDAwPiwNCj4gTG93ZXJjYXNlIGhleCwgc2VlIERUUyBjb2Rpbmcgc3R5bGUuDQoNCkkg
bWlzc2VkIGl0LiBJIHdpbGwgdXBkYXRlIGl0IHRvIGxvd2VyIGNhc2UuDQoNCg0KPg0KPj4gKyAg
ICAgY3B1cyB7DQo+PiArICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPj4gKyAg
ICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4+ICsNCj4+ICsgICAgICAgICAgICAgY3B1
MDogY3B1QDAgew0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGRldmljZV90eXBlID0gImNwdSI7
DQo+PiArICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWE1MyI7
DQo+PiArICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDA+Ow0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgIGVuYWJsZS1tZXRob2QgPSAic3Bpbi10YWJsZSI7DQo+PiArICAgICAgICAg
ICAgICAgICAgICAgY3B1LXJlbGVhc2UtYWRkciA9IDwweDAgMHgzYzAwMTNhMD47DQo+PiArICAg
ICAgICAgICAgICAgICAgICAgZC1jYWNoZS1zaXplID0gPDB4ODAwMD47DQo+PiArICAgICAgICAg
ICAgICAgICAgICAgZC1jYWNoZS1saW5lLXNpemUgPSA8NjQ+Ow0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgIGQtY2FjaGUtc2V0cyA9IDwxMjg+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGkt
Y2FjaGUtc2l6ZSA9IDwweDgwMDA+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGktY2FjaGUt
bGluZS1zaXplID0gPDY0PjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBpLWNhY2hlLXNldHMg
PSA8MjU2PjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBuZXh0LWxldmVsLWNhY2hlID0gPCZs
Mj47DQo+PiArICAgICAgICAgICAgIH07DQo+IE1pc3NpbmcgYmxhbmsgbGluZSBiZXR3ZWVuIGVh
Y2ggbmV3IG5vZGUuIFNlZSBEVFMgY29kaW5nIHN0eWxlLg0KDQpOb3RlZCwgSSB3aWxsIHVwZGF0
ZSBiZXR3ZWVuIGVhY2ggbm9kZXMuDQoNCg0KPg0KPj4gKyAgICAgICAgICAgICBjcHUxOiBjcHVA
MSB7DQo+PiArICAgICAgICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAiY3B1IjsNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTUzIjsNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4MT47DQo+PiArICAgICAgICAgICAgICAg
ICAgICAgZW5hYmxlLW1ldGhvZCA9ICJzcGluLXRhYmxlIjsNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICBjcHUtcmVsZWFzZS1hZGRyID0gPDB4MCAweDNjMDAxM2EwPjsNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICBkLWNhY2hlLXNpemUgPSA8MHg4MDAwPjsNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICBkLWNhY2hlLWxpbmUtc2l6ZSA9IDw2ND47DQo+PiArICAgICAgICAgICAgICAgICAgICAg
ZC1jYWNoZS1zZXRzID0gPDEyOD47DQo+PiArICAgICAgICAgICAgICAgICAgICAgaS1jYWNoZS1z
aXplID0gPDB4ODAwMD47DQo+PiArICAgICAgICAgICAgICAgICAgICAgaS1jYWNoZS1saW5lLXNp
emUgPSA8NjQ+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGktY2FjaGUtc2V0cyA9IDwyNTY+
Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIG5leHQtbGV2ZWwtY2FjaGUgPSA8JmwyPjsNCj4+
ICsgICAgICAgICAgICAgfTsNCj4+ICsgICAgICAgICAgICAgY3B1MjogY3B1QDIgew0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgIGRldmljZV90eXBlID0gImNwdSI7DQo+PiArICAgICAgICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWE1MyI7DQo+PiArICAgICAgICAgICAg
ICAgICAgICAgcmVnID0gPDB4MCAweDI+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGVuYWJs
ZS1tZXRob2QgPSAic3Bpbi10YWJsZSI7DQo+PiArICAgICAgICAgICAgICAgICAgICAgY3B1LXJl
bGVhc2UtYWRkciA9IDwweDAgMHgzYzAwMTNhMD47DQo+PiArICAgICAgICAgICAgICAgICAgICAg
ZC1jYWNoZS1zaXplID0gPDB4ODAwMD47DQo+PiArICAgICAgICAgICAgICAgICAgICAgZC1jYWNo
ZS1saW5lLXNpemUgPSA8NjQ+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGQtY2FjaGUtc2V0
cyA9IDwxMjg+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGktY2FjaGUtc2l6ZSA9IDwweDgw
MDA+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGktY2FjaGUtbGluZS1zaXplID0gPDY0PjsN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICBpLWNhY2hlLXNldHMgPSA8MjU2PjsNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICBuZXh0LWxldmVsLWNhY2hlID0gPCZsMj47DQo+PiArICAgICAgICAg
ICAgIH07DQo+PiArICAgICAgICAgICAgIGNwdTM6IGNwdUAzIHsNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICBkZXZpY2VfdHlwZSA9ICJjcHUiOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAiYXJtLGNvcnRleC1hNTMiOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgIHJl
ZyA9IDwweDAgMHgzPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBlbmFibGUtbWV0aG9kID0g
InNwaW4tdGFibGUiOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGNwdS1yZWxlYXNlLWFkZHIg
PSA8MHgwIDB4M2MwMDEzYTA+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGQtY2FjaGUtc2l6
ZSA9IDwweDgwMDA+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGQtY2FjaGUtbGluZS1zaXpl
ID0gPDY0PjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBkLWNhY2hlLXNldHMgPSA8MTI4PjsN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICBpLWNhY2hlLXNpemUgPSA8MHg4MDAwPjsNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICBpLWNhY2hlLWxpbmUtc2l6ZSA9IDw2ND47DQo+PiArICAgICAg
ICAgICAgICAgICAgICAgaS1jYWNoZS1zZXRzID0gPDI1Nj47DQo+PiArICAgICAgICAgICAgICAg
ICAgICAgbmV4dC1sZXZlbC1jYWNoZSA9IDwmbDI+Ow0KPj4gKyAgICAgICAgICAgICB9Ow0KPj4g
KyAgICAgICAgICAgICBsMjogbDItY2FjaGUwIHsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gImNhY2hlIjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBjYWNoZS1zaXpl
ID0gPDB4MTAwMDAwPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBjYWNoZS11bmlmaWVkOw0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgIGNhY2hlLWxpbmUtc2l6ZSA9IDw2ND47DQo+PiArICAg
ICAgICAgICAgICAgICAgICAgY2FjaGUtc2V0cyA9IDwxMDI0PjsNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICBjYWNoZS1sZXZlbCA9IDwyPjsNCj4+ICsgICAgICAgICAgICAgfTsNCj4+ICsgICAg
IH07DQo+PiArDQo+PiArICAgICBjbG9ja3Mgew0KPj4gKyAgICAgICAgICAgICBjbGtfeGluOiBj
bG9jay0yMDAwMDAwMDAgew0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
Zml4ZWQtY2xvY2siOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDww
PjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MjAwMDAwMDAw
PjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBjbG9jay1vdXRwdXQtbmFtZXMgPSAiY2xrX3hp
biI7DQo+PiArICAgICAgICAgICAgIH07DQo+PiArICAgICAgICAgICAgIHJlZmNsazogY2xvY2st
MTI1MDAwMDAwIHsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVk
LWNsb2NrIjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MD47DQo+
PiArICAgICAgICAgICAgICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDEyNTAwMDAwMD47DQo+
PiArICAgICAgICAgICAgIH07DQo+PiArICAgICB9Ow0KPj4gKw0KPj4gKyAgICAgc29jIHsNCj4+
ICsgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsNCj4+ICsgICAgICAgICAg
ICAgcmFuZ2VzOw0KPj4gKyAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4+ICsg
ICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47DQo+PiArICAgICAgICAgICAgIGludGVycnVw
dC1wYXJlbnQgPSA8JmdpYzUwMD47DQo+PiArDQo+PiArICAgICAgICAgICAgIGdpYzUwMDogaW50
ZXJydXB0LWNvbnRyb2xsZXJAODAzMDAwMDAgew0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAiYXJtLGdpYy12MyI7DQo+PiArICAgICAgICAgICAgICAgICAgICAgcmVnID0g
PDB4MDAgMHg4MDMwMDAwMCAweDAwIDB4MTAwMDA+LA0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA8MHgwMCAweDgwMzgwMDAwIDB4MDAgMHg4MDAwMD47DQo+IERvZXMgbm90IGxv
b2sgYWxpZ25lZC4NCg0KQWdyZWVkLiBJIHdpbGwgdXBkYXRlIHRoZSBhbGlnbm1lbnQuDQoNCg0K
Pg0KPj4gKyAgICAgICAgICAgICAgICAgICAgIHJhbmdlczsNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDM+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgICNh
ZGRyZXNzLWNlbGxzID0gPDI+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxz
ID0gPDI+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOw0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICNyZWRpc3RyaWJ1dG9yLXJlZ2lvbnMgPSA8MT47DQo+
PiArICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfUFBJIDkgSVJRX1RZUEVf
TEVWRUxfSElHSD47DQo+PiArICAgICAgICAgICAgIH07DQo+PiArDQo+PiArICAgICAgICAgICAg
IC8qIEdQSU8gQ29udHJvbGxlciBiYW5rcyAwIC0gNyAqLw0KPj4gKyAgICAgICAgICAgICBncGlv
MDogZ3Bpby1jb250cm9sbGVyQDgwNTAwMDAwIHsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gImNkbnMsZ3Bpby1yMXAwMiI7DQo+PiArICAgICAgICAgICAgICAgICAgICAg
cmVnID0gPDB4MDAgMHg4MDUwMDAwMCAweDAwICAweDQwMD47DQo+IE9ubHkgb25lIHNwYWNlLCBu
b3QgZG91YmxlIHNwYWNlLg0KDQpBZ3JlZWQuIFRoZXJlIGlzIGRvdWJsZSBzcGFjZSBpbiBldmVy
eSBHUElPIG5vZGVzLCBJIHdpbGwgdXBkYXRlIHRoZSBzYW1lLg0KDQoNClJlZ2FyZHMsDQoNCkhh
cnNoaXQuDQoNCg0KDQo=

