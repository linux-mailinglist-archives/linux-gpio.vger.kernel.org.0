Return-Path: <linux-gpio+bounces-13902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 559049F2C7B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 09:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B381163B01
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 08:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E792201006;
	Mon, 16 Dec 2024 08:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="qG3I/NOq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2069.outbound.protection.outlook.com [40.107.21.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448721FFC46;
	Mon, 16 Dec 2024 08:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734339431; cv=fail; b=NxdwTEKRQdUAwOHzmWrko0UzdzDCRJei1j4G8NkGkBCoMAqPvJBKLe5poVxKBKr7q4jVhnjGVY7esgKYjQJB4xNBew6dP8MuvhTYqZEmUzokiNZXTI7esmdfAi48u4a43DIshHT06gN8sjXBF/O67F0MGLer8DbgnX0jLFslXOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734339431; c=relaxed/simple;
	bh=g8df1/kak5zgjqNIJZbnJ54TmO/KEFGs59XZ7loSvOk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q/Q2l3qaD5TgxKyT2CF+382vtK8vHqbJG6c4krGlz4Ok3Me6VNT3P8ICjonfwICGf78Ks9uAotHiUdgrL6yPp3uKRB49qbu11Q7Aa/9yatrxMUtIF0Y8aB7Ap8wJukxAiDwIhEbqz5mPiNA38zfgzH19ZixupCtCUQ66QpeAsHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=qG3I/NOq; arc=fail smtp.client-ip=40.107.21.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkC/7rIb88Y+c240JdPhdw3/kbKJrWVSif15nN7efLQQXzOmvTE0edUT55YMTthZXHbCYvH/FlQiOJ8vamGsvg6axR2SEFkWRi8FgiLmut87gxYY4SwrVoA/o69jbL/tgNFt5epQtYXDc8hZrQ1sP+JtVzanP9O++Ef46Hlr4RGrOiWyvuTswVIC9NcQm+JKEiLTpEgS5SFdh6Bw9VDNg9aSHupKqAvsLhIRnWxS5ldXMu8bSkacD6EXLmAOJjtpi9G/2DuY5HEKI1KK+h9p/V0kXyc8qaJwTIrehHMqYvfIhGVQ/9CXCbgfYafeZQd/Tz5KqLzH4qNvtlmNQMSoAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8df1/kak5zgjqNIJZbnJ54TmO/KEFGs59XZ7loSvOk=;
 b=mbpB4zQL6WJV5ASbK+K8+A4jV9VTA6XTESUm+p0i1idVNyANHiDzv1Y61/K2K6X371lMPR+uxg4XJkBsqFVuHcWIdR5FldoEq71rSvHm/d5/Y9Nj7UYKmH/YlqBj0TGACXP157bZ6bhFrLTiYTzsd6/s2KYjhQqlZD0I5PpDQTzcpaTwUJzQ1D/y0Gn0DKneH0s2giGpfOx8OULN1prKdF3mwsFdMNVYsv+tscH3iej/N9S4k5VmBI94ubuY2CZt+u+gBNWsu90B4SnthE6XZr6fYCzD1iF8ZFsNpxj+kufMKywFg0EDhPrzv2+LHuKUDawjB0NCgnFmuMRW+bwZyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8df1/kak5zgjqNIJZbnJ54TmO/KEFGs59XZ7loSvOk=;
 b=qG3I/NOqGDAflOhQqLFRJRHA/Kx0Cc7URPtSre072lnDDfRG759OWHegixTb6n3ucOkOg1ZAKaUDm+jYpO2OnREjUu10+qXmgek6nuQcliXF+YYXuimJAf6GUxK0oiPykD9TSsT/TyO2i8kvcje36WvU4v8KG4LU/aPJl92hQBoFsmNAQPF0FE4q0LMAJJczbLzPdsaMFPoEqeraeQybIzLBd/KASwdH2grgT5hmojDUhq+SZSh9epi7CrW2l7+MlXRznfiy/SEuxlSEqe9Ta8rNieYbxXSAtRGQ2sRPSSau24J8aYtFoNvy73tyvFRAhrXGMUz3i6wsOZVgVcJpxw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by VI0PR10MB8816.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:233::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.10; Mon, 16 Dec
 2024 08:57:05 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8272.005; Mon, 16 Dec 2024
 08:57:05 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 2/2] gpio: omap: save two lines by using
 devm_clk_get_prepared()
Thread-Topic: [PATCH 2/2] gpio: omap: save two lines by using
 devm_clk_get_prepared()
Thread-Index: AQHbRaJCThPj1tY640qXcJUSCr5fNbLkJk8AgAADvYCAABgWgIAEY40A
Date: Mon, 16 Dec 2024 08:57:05 +0000
Message-ID: <828da89cff6dd2c49df9af6131aa3b43675abc87.camel@siemens.com>
References: <20241203164143.29852-1-brgl@bgdev.pl>
	 <20241203164143.29852-2-brgl@bgdev.pl>
	 <a21531a7-13ae-45f5-a60d-dd80b3ef9834@gmail.com>
	 <0bf97a477f1c547b960c63607395b82d92986ef3.camel@siemens.com>
	 <a175fd56-c21b-46f5-bd0a-ccaa7c0f3efa@gmail.com>
In-Reply-To: <a175fd56-c21b-46f5-bd0a-ccaa7c0f3efa@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|VI0PR10MB8816:EE_
x-ms-office365-filtering-correlation-id: 6c736f37-d890-407a-d278-08dd1daf9d44
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MlBsRFJhSmRzRThRUmJzbVdUZjRLU0xZVHg5NmYyalEzaUNaYjJoTUxNRmc0?=
 =?utf-8?B?bUt6MWsrdDk5TVZnZW9SaTVySnZwK3B2ZGJHVnlTL25sekFhNE1iTVYwNTk4?=
 =?utf-8?B?SEhqYkVlTGtkNkkwQXA5ZXd0V2R0c1pHYS83ai9yTEpueVoxRVFGcG1GalVH?=
 =?utf-8?B?NnRWVlRIRGlZeFRRY3JFU2xLbUs3LzFiUXRLLzJULzFFT1BuQWZiR04rQVlp?=
 =?utf-8?B?ZzdZbkkyZTdvdStvMUYzdThWTUNKQk5WUW1JeFpXd1M4TGNVd2lvYlBBZml3?=
 =?utf-8?B?S2xia3Zhc1NPNXBCWHRDUi9EUUNnbmthemF0QTQzSFR3ZW1ZNEJKVkYvNHp4?=
 =?utf-8?B?dzZCWGVHUHZPUTRsZk55WFNmNXZrN0x3OU92OHlEYktNNXpHL3doQzVJMkNO?=
 =?utf-8?B?V042a3dJMVh1S3F0WTBPS0txcFZJdEowQ0EvV1p4a3dXS2hJNmhHSHJDWGlC?=
 =?utf-8?B?UFdFZUNQVXZxR3RnMWY5R1B1SFpmeC93VGNFR1liQXJpM211Z2s4RlVRcHN2?=
 =?utf-8?B?UVZoVEFYQ2xvRHQrZkxWNUxqcUMzeTF3STN0QzFxQjc1RWNsMjhWbDc2bmxI?=
 =?utf-8?B?M0JlNThjRDkxbGhpTjF5VysvV0JMYW5pWCtIaFBQbzZmbGRtS2toQlM2TzZY?=
 =?utf-8?B?Q2drNkV1cWpOSEFQYm9oUDJZYllTTW5XTzNsWFJOVUtPYjRUVlBqaDRVQXl3?=
 =?utf-8?B?aS9SQTkvaHRrZnYrZ241UVBobVl5RjJrWDFUdGJKTGhnelE5ayt2SXJDUzdL?=
 =?utf-8?B?blcyQ3hMdHRhM2NSL1RTK3JWR0w4NnJuNzJzMytOL1lJdnJndk1vcjBwekVS?=
 =?utf-8?B?aHBKQ09oSW80L1lJNTVZL1lxdHA1UlBVcVMyQURjV3pLa0E3UUZ3ZHBxeVNK?=
 =?utf-8?B?SEZaSUdZWHk2SUE0azBCS2JXYTJPSTh1R1E4enl2T0F0MjhRcHZ0TS96Sy92?=
 =?utf-8?B?T29EWml2ckVPWUdlZDEzTE54R05mbkc5VW0ra1BiK3Zlb0FNN0NteERSVFBJ?=
 =?utf-8?B?dHZBS20yM0NaMGhPQVloalZxdW9Sd25YU1dpRmdBT2t6K3hSWXlmN0lrYm5r?=
 =?utf-8?B?VWtKMEV2dXFTb2UrcHRRTmRqZ096U2xwUDRKd2tIS3dTNUxIbTN2WldTVFQv?=
 =?utf-8?B?QytlYkFTK2trZmQyNWIxSnZMK21adzJSRjl4and4eDM5UGFxN3BLYmIxVHAr?=
 =?utf-8?B?R2FPZ2VhQ25BRmVoMEttMGREMFRFLzNvS3BTYllOVHhpUHJaZG5ld2NSVG9v?=
 =?utf-8?B?cDhzd2tIUUE4eVJ4YUN5cWxPQjNBbm51SFVjUGNaNS8rMzd2aGFwUEpyaENt?=
 =?utf-8?B?ZUFZVlpKNmJ1UHZNc29yL0tTb2JaVDZ5MTlHbVVsRlh4QTRrbGJzQ291OXNp?=
 =?utf-8?B?NVpyT3AwMWVIVmI3L0pmR0ZvVmt2MEo4Z0o3djF3U2pRSyt6aThEMVBoYmxh?=
 =?utf-8?B?R3hMUDBGZ2VyM1VOQ1c5azZ0WHVDNnRUS09Ha3QzN3ZhekcxZ25yV2lzV2JG?=
 =?utf-8?B?Mk5VTi9aQjNOaEh3MTFpUk82d0VUSHJOQ1ZVbXpKUk9jYjd6ZXFXM3FSKzJl?=
 =?utf-8?B?R3g5WTBLMlNaSzdnZ2pSY1l5a1M4Mi9mK3h3cTZPTTlJQmN2SExpL05IcnNM?=
 =?utf-8?B?S0trQ3BBQ0dlR3JHL2EvZm91Y2VKTnBlUnZVakNBa2NpMk9tTjZZY3BBL2JP?=
 =?utf-8?B?RFlpdXBHdXBkUHNoRnBtdTYvNlUvMGdpOHFKb3grTGVvY0NDaHdkaEFjOXUr?=
 =?utf-8?B?d1g1YXcyaWNqMktDV1JzaHNJWTRKalBtaU5BY0dFRVBDazFEQWQvY0hqdzBn?=
 =?utf-8?B?dXlVd21Jd3RKL08wZERMb1U1VnkrWmI0cmw4SEl5L2YyYXdCVHJlckk4eTVx?=
 =?utf-8?Q?M9JV8yyH9y8K1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YktaSGV3eGduZEtIandsMmlBV2dFck5KQ0pETmdxd2piYlMvWlJacHBGbm1i?=
 =?utf-8?B?MTVESzdLcnlnNTE2WFNOZE5qMHpsMDNVcmIrZGJwNTZCRUNKOEhsY1ZHb05D?=
 =?utf-8?B?MjEzdWdSaHRlclR1bW53ejlRYndPWTRmbTM3cmpQb0w4V1pDT2Z3emxoN2xE?=
 =?utf-8?B?dndhdWk2Q3IyR2RKLytYNUpiMXRybnQ4bUVXSmpMbzhwWXh3b1oxWDE5RU5D?=
 =?utf-8?B?ZlNTYm5qbW1yQnc3WXFkUEpDdjY1TkN0ZWtnOE9HdW1LOGNpYzN3NFA4QWtx?=
 =?utf-8?B?bXJmRFRKbEsxTUFvVEVDTTNPd1F0NVFPcXI3ZGdIS21rSlVOU1diS2FWOGdH?=
 =?utf-8?B?emJtWGRMVG1BdXFFcEhrWGRFSHJ3V0ZmNlFKRmFDWjc2dGR4VTZLZnFZY1Av?=
 =?utf-8?B?TVFwUlhMSFhrT0pkdGZpOHUwK1FaZ2lDcUNCenNDcWgxV2RaWlFMc1NRQXpz?=
 =?utf-8?B?R0diTThydTNMdHY3VnNHK2x6czBCV2R5bHBTNzM4TFlLV2NyckZCeTJiVWNT?=
 =?utf-8?B?QnppWG5pKzBWeHg3bE9ycjA4TGpEemF2eWwwb2VLVlRGekRKUFRYK052elRs?=
 =?utf-8?B?NGZFWHNiNFFjKzRKTjBkdVA3YnJJTlUyMmY5WWROMHZjcHpab1hwTExoZ2xz?=
 =?utf-8?B?T0xweENCNWp4SXdYeEVEK214WG56MUsvMDA0S2kyYm1ENHRYRE1HQzBIMk9v?=
 =?utf-8?B?OHZOT3ZNSUVoRkpZV3dOUXdQR2wzUkNWZWhzQy9IeVdtcngrUEo2cHVjSFpv?=
 =?utf-8?B?Wm1tLzJCQXllTldSTUE4cnlncHZ5enZQTDhTeGlXZkQ5elRMOGRSZDRkWjZt?=
 =?utf-8?B?cHA3dnljZjdqTGpkckxRWHdvU0FxRGFOb1NkMUFQZ1ZRTUhtMUEwN2Q0Ymk2?=
 =?utf-8?B?YWI2Q0xJOEpOdmtPQzYzZlBwTVNTL2NZNnN4RHVzeXVhMldscDhJbE9HaEpU?=
 =?utf-8?B?YVpBSWNZeFVQMUx5bEJNd1JXTmRXak1kZHM3MFUzYWNTS3NLRW9iZmNFTjU1?=
 =?utf-8?B?Y0d3TzVoOG90Y3hyNGtUekE2WndKOGE2Rm5QcUFwTU5FMkFBMFhueHF1REkz?=
 =?utf-8?B?b2V5c0NDd1U2MXVuRVQ4NVQ5cER2bmRiSlJocktLaHc4d0FWTlNacHZOMlk4?=
 =?utf-8?B?amlsdmd0bm91WERvYWx3Qnc5dGlBWWp5NlcxK1JZKzBZaXFxYUI2TDlXaEI3?=
 =?utf-8?B?a1ZFK2VVaWZndmwwWFFpNkNwYW84dUxaNTJHK0JRWWg0b0lUd1N4T25kTXlC?=
 =?utf-8?B?QmE2aGtUU2ltblQ4em5XU3ZXaG85RmVJeVFaNzFkSU84Sm45b2c4TXZCMTZt?=
 =?utf-8?B?WFlyMFNabzljMTlteE9rNU5pWm9ybHNhb2UvRzVGMVNWOWlrMW9PY0hQWG05?=
 =?utf-8?B?d1MvcnF1Z3lxWEFKTmE1V1dxRUtKZS9Ma3R0WGE4aGpQZkV1S2FwOUlrOWxz?=
 =?utf-8?B?SmNrOTNhRHFGa1EzdmVmbnFZNVBvTHpMOXFta0h4UkRSaU9xKzExN1FhQS9l?=
 =?utf-8?B?WEdENDVUdkdxMlFUekVnVENrbmRhdTNQMldTTUFLcGNHUi9JdE43TWMyT2dj?=
 =?utf-8?B?WWxsN0x0NjBWN2o4YzV1ekNLaWNyQXJCVGNuMUdrajVncnJhMDIwbmc1OE5X?=
 =?utf-8?B?ODhjd25HcFpxanByVThSUk02VnJCY0dSY2M2VUI4ZkFTb2FkVkxueStGeWE2?=
 =?utf-8?B?N1AvcHFBVnZFLzZ0dHJIVmRHRnI5VGNjdHFGYjJkdnhwRkhMS0ozSHpSQksx?=
 =?utf-8?B?bVVsVU9qRDlxUGJqZHk0NEZTNGtJdzZOR2gzUnpNUmZVNytYTnVnQm1uVGdC?=
 =?utf-8?B?VXcyQkplUk43b3BpSkVEb3d4UHR3NGVLRzhqVHhyTVdPRmg1UWNpZy9BZ0Nn?=
 =?utf-8?B?UXhmNThIWVRad2E2OHg0ZWp1ZHZxWGNZUGd5bGxRVkJpakFVZkRraVVxejNX?=
 =?utf-8?B?dlMwTjYyeUZTN3I1aTNqM2YzZlBuS0dObFFpTHR3eVlzTWF0RjVBT1Y1NFIz?=
 =?utf-8?B?S0FiYk9MVklELzRUVGJTdEhHbWdFcmQ0U2F3YlVDT040a2RrRjhGS29EVUhK?=
 =?utf-8?B?bVVndjYzV1B4SDdkS3dNUU5lY1E0RXV2TlVtMnJzcEFuaGlocWNwV2xnV21a?=
 =?utf-8?B?VzRteGlkZ3J4M0VhQ1E1bUNuNlJzZEc1cVdKSUJDLzdTemtHbEZvRG1nWW9x?=
 =?utf-8?Q?iBvketRDBUpdmqkOj0Aq06s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3C407B9E136794BA79E39012E01DCCB@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c736f37-d890-407a-d278-08dd1daf9d44
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 08:57:05.1042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RLuoaTF01rEHHoUpN/F302yBL7L4fYsuL7aaoz3fJBw5TgVbBqsH+n4B5uynUyeGeP8C1SoG2N076YJY5cL/SNQTAP5Ox+4lhhhARyYCj6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8816

SGkgTWF0dGkhDQoNCk9uIEZyaSwgMjAyNC0xMi0xMyBhdCAxNTo1NSArMDIwMCwgTWF0dGkgVmFp
dHRpbmVuIHdyb3RlOg0KDQo+ID4gPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRv
c3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4NCj4gPiA+ID4gDQo+ID4gPiA+IFdlIGNhbiBkcm9w
IHRoZSBlbHNlIGJyYW5jaCBpZiB3ZSBnZXQgdGhlIGNsb2NrIGFscmVhZHkgcHJlcGFyZWQgdXNp
bmcNCj4gPiA+ID4gdGhlIHJlbGV2YW50IGhlbHBlci4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJv
Lm9yZz4NCj4gPiA+ID4gLS0tDQo+ID4gPiANCj4gPiA+IEJvb3RpbmcgYSBiZWFnbGVib25lIGJs
YWNrIHdpdGggdGhlIGxpbnV4LW5leHQgZnJvbSBUb2RheSBmYWlscw0KPiA+ID4gKG5leHQtMjAy
NDEyMTMpLiBFbmFibGluZyBlYXJseWNvbiArIGRlYnVnIHlpZWxkcyBiZWxvdyBzcGxhdCB0byBi
ZQ0KPiA+ID4gcHJpbnRlZCB0byB0aGUgY29uc29sZToNCj4gPiA+IA0KPiA+ID4gW8KgwqDCoCAy
LjYyODAxOV0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo+ID4gPiBbwqDC
oMKgIDIuNjMyNzkzXSBXQVJOSU5HOiBDUFU6IDAgUElEOiAzNCBhdCBkcml2ZXJzL2Nsay9jbGsu
YzoxMjU0DQo+ID4gPiBjbGtfY29yZV9lbmFibGUrMHhiNC8weDFiMA0KPiA+ID4gW8KgwqDCoCAy
LjY0MTE1Nl0gRW5hYmxpbmcgdW5wcmVwYXJlZCBsNC13a3VwLWNsa2N0cmw6MDAwODoxOA0KPiA+
ID4gW8KgwqDCoCAyLjY0NjUzMF0gTW9kdWxlcyBsaW5rZWQgaW46DQo+ID4gPiBbwqDCoMKgIDIu
NjQ5Njg4XSBDUFU6IDAgVUlEOiAwIFBJRDogMzQgQ29tbToga3dvcmtlci91NDozIE5vdCB0YWlu
dGVkDQo+ID4gPiA2LjEzLjAtcmMyLW5leHQtMjAyNDEyMTMtMDAwMDItZ2YyZDRiMjljODMzMCAj
MTUNCj4gPiA+IFvCoMKgwqAgMi42NjAyNTZdIEhhcmR3YXJlIG5hbWU6IEdlbmVyaWMgQU0zM1hY
IChGbGF0dGVuZWQgRGV2aWNlIFRyZWUpDQo+ID4gPiBbwqDCoMKgIDIuNjY2NTMxXSBXb3JrcXVl
dWU6IGV2ZW50c191bmJvdW5kIGRlZmVycmVkX3Byb2JlX3dvcmtfZnVuYw0KPiA+ID4gW8KgwqDC
oCAyLjY3MjU1M10gQ2FsbCB0cmFjZToNCj4gPiA+IFvCoMKgwqAgMi42NzI1NzBdwqAgdW53aW5k
X2JhY2t0cmFjZSBmcm9tIHNob3dfc3RhY2srMHgxMC8weDE0DQo+ID4gPiBbwqDCoMKgIDIuNjgw
NTc4XcKgIHNob3dfc3RhY2sgZnJvbSBkdW1wX3N0YWNrX2x2bCsweDUwLzB4NjQNCj4gPiA+IFvC
oCA3IDIuNjg1Nzg4XcKgIGR1bXBfc3RhY2tfbHZsIGZyb20gX193YXJuKzB4YzAvMHgxMzANCj4g
PiA+IFvCoMKgwqAgMi42OTA3MzRdwqAgX193YXJuIGZyb20gd2Fybl9zbG93cGF0aF9mbXQrMHg4
MC8weDFhMA0KPiA+ID4gW8KgwqDCoCAyLjY5NTk0NF3CoCB3YXJuX3Nsb3dwYXRoX2ZtdCBmcm9t
IGNsa19jb3JlX2VuYWJsZSsweGI0LzB4MWIwDQo+ID4gPiBbwqDCoMKgIDIuNzAxOTYzXcKgIGNs
a19jb3JlX2VuYWJsZSBmcm9tIGNsa19jb3JlX2VuYWJsZV9sb2NrKzB4MTgvMHgyYw0KPiA+ID4g
W8KgwqDCoCAyLjcwODE1OV3CoCBjbGtfY29yZV9lbmFibGVfbG9jayBmcm9tDQo+ID4gPiBzeXNj
X2VuYWJsZV9vcHRfY2xvY2tzLnBhcnQuOSsweDI4LzB4ODQNCj4gPiA+IFvCoMKgwqAgMi43MTU2
MTFdwqAgc3lzY19lbmFibGVfb3B0X2Nsb2Nrcy5wYXJ0LjkgZnJvbQ0KPiA+ID4gc3lzY19lbmFi
bGVfbW9kdWxlKzB4MjU0LzB4MmRjDQo+ID4gPiBbwqDCoMKgIDIuNzIzMDUyXcKgIHN5c2NfZW5h
YmxlX21vZHVsZSBmcm9tIHN5c2NfcnVudGltZV9yZXN1bWUrMHgxN2MvMHgxYzANCj4gPiA+IFvC
oMKgwqAgMi43Mjk1OTldwqAgc3lzY19ydW50aW1lX3Jlc3VtZSBmcm9tIF9fcnBtX2NhbGxiYWNr
KzB4NGMvMHgxMzANCj4gPiA+IFvCoMKgwqAgMi43MzU3MDldwqAgX19ycG1fY2FsbGJhY2sgZnJv
bSBycG1fY2FsbGJhY2srMHg1MC8weDU0DQo+ID4gPiBbwqDCoMKgIDIuNzQxMDk2XcKgIHJwbV9j
YWxsYmFjayBmcm9tIHJwbV9yZXN1bWUrMHg2MTQvMHg2NjANCj4gPiA+IFvCoMKgwqAgMi43NDYz
MDRdwqAgcnBtX3Jlc3VtZSBmcm9tIF9fcG1fcnVudGltZV9yZXN1bWUrMHg0Yy8weDY0DQo+ID4g
PiBbwqDCoMKgIDIuNzUxOTYwXcKgIF9fcG1fcnVudGltZV9yZXN1bWUgZnJvbSBfX2RldmljZV9h
dHRhY2grMHhkMC8weDE4OA0KPiA+ID4gW8KgwqDCoCAyLjc1ODE1NV3CoCBfX2RldmljZV9hdHRh
Y2ggZnJvbSBidXNfcHJvYmVfZGV2aWNlKzB4ODgvMHg4Yw0KPiA+ID4gb3JfdGhyZWFkIGZyb20g
a3RocmVhZCsweDE4OC8weDI0Yw0KPiA+ID4gW8KgwqDCoCAyLjc4OTQ3Nl3CoCBrdGhyZWFkIGZy
b20gcmV0X2Zyb21fZm9yaysweDE0LzB4MjANCj4gPiA+IFvCoMKgwqAgMi43OTQzMjddIEV4Y2Vw
dGlvbiBzdGFjaygweGUwMDkxZmIwIHRvIDB4ZTAwOTFmZjgpDQo+ID4gPiBbwqDCoMKgIDIuNzk5
NTI4XSAxZmEwOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwMDAwMDAwMA0KPiA+ID4gMDAwMDAwMDAgMDAwMDAw
MDAgMDAwMDAwMDANCj4gPiA+IFvCoMKgwqAgMi44MDc5NDddIDFmYzA6IDAwMDAwMDAwIDAwMDAw
MDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwDQo+ID4gPiAwMDAwMDAwMCAwMDAwMDAwMCAw
MDAwMDAwMA0KPiA+ID4gW8KgwqDCoCAyLjgxNjM2NV0gMWZlMDogMDAwMDAwMDAgMDAwMDAwMDAg
MDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMTMgMDAwMDAwMDANCj4gPiA+IFvCoMKgwqAgMi44MjMx
NzNdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KPiA+ID4gW8KgwqDCoCAy
LjgyODA3MF0gdGktc3lzYyA0NGUwNzAwMC50YXJnZXQtbW9kdWxlOiBPcHRpb25hbCBjbG9ja3Mg
ZmFpbGVkDQo+ID4gPiBmb3IgZW5hYmxlOiAtMTA4DQo+ID4gPiBbwqDCoMKgIDIuODM1OTk4XSAt
LS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4gPiA+IA0KPiA+ID4gcmV2ZXJ0
aW5nDQo+ID4gPiBiN2JiYWZmOGMxYmMgKCJncGlvOiBvbWFwOiBzYXZlIHR3byBsaW5lcyBieSB1
c2luZyBkZXZtX2Nsa19nZXRfcHJlcGFyZWQoKSIpDQo+ID4gPiANCj4gPiA+IGZpeGVzIHRoZSBi
b290IGZvciBtZS4NCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiA+IMKgIMKgwqAgZHJpdmVycy9ncGlv
L2dwaW8tb21hcC5jIHwgNCArLS0tDQo+ID4gPiA+IMKgIMKgwqAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3Bpby9ncGlvLW9tYXAuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLW9tYXAuYw0K
PiA+ID4gPiBpbmRleCA1NGM0YmZkY2NmNTY4Li41N2QyOTlkNWQwYjE2IDEwMDY0NA0KPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1vbWFwLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9n
cGlvL2dwaW8tb21hcC5jDQo+ID4gPiA+IEBAIC0xNDQ5LDEzICsxNDQ5LDExIEBAIHN0YXRpYyBp
bnQgb21hcF9ncGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiA+
IMKgIMKgwqDCoAl9DQo+ID4gPiA+IMKgwqDCoMKgIA0KPiA+ID4gPiDCoCDCoMKgwqAJaWYgKGJh
bmstPmRiY2tfZmxhZykgew0KPiA+ID4gPiAtCQliYW5rLT5kYmNrID0gZGV2bV9jbGtfZ2V0KGRl
diwgImRiY2xrIik7DQo+ID4gPiA+ICsJCWJhbmstPmRiY2sgPSBkZXZtX2Nsa19nZXRfcHJlcGFy
ZWQoZGV2LCAiZGJjbGsiKTsNCj4gPiA+ID4gwqAgwqDCoMKgCQlpZiAoSVNfRVJSKGJhbmstPmRi
Y2spKSB7DQo+ID4gPiA+IMKgIMKgwqDCoAkJCWRldl9lcnIoZGV2LA0KPiA+ID4gPiDCoCDCoMKg
wqAJCQkJIkNvdWxkIG5vdCBnZXQgZ3BpbyBkYmNrLiBEaXNhYmxlIGRlYm91bmNlXG4iKTsNCj4g
PiA+ID4gwqAgwqDCoMKgCQkJYmFuay0+ZGJja19mbGFnID0gZmFsc2U7DQo+ID4gPiA+IC0JCX0g
ZWxzZSB7DQo+ID4gPiA+IC0JCQljbGtfcHJlcGFyZShiYW5rLT5kYmNrKTsNCj4gPiA+ID4gwqAg
wqDCoMKgCQl9DQo+ID4gPiA+IMKgIMKgwqDCoAl9DQo+ID4gPiA+IMKgwqDCoMKgIA0KPiA+ID4g
DQo+ID4gPiBJIGNhbiBvbmx5IHNwb3QgYSBtaW5vciBmdW5jdGlvbmFsIGNoYW5nZS4gVGhlIGNv
ZGUgcHJpb3IgdGhpcyBjb21taXQNCj4gPiA+IGRvZXMgbm90IGNoZWNrIHRoZSByZXN1bHQgb2Yg
Y2xrX3ByZXBhcmUoKSwgYW5kIGRvZXMgbmVpdGhlciBzZXQNCj4gPiA+IGJhbmstPmRiY2tfZmxh
ZyA9IGZhbHNlOyBub3IgY2FsbCBjbGtfcHV0KCk7DQo+ID4gPiANCj4gPiA+IE90aGVyIHRoYW4g
dGhhdCwgdGltaW5nIGlzIGxpa2VseSB0byBiZSBjaGFuZ2VkLiBOb3Qgc3VyZSB3aGF0IGlzIHRo
ZQ0KPiA+ID4gdGhpbmcgaGVyZS4NCj4gPiANCj4gPiBUaGUgbmV3IGNvZGUgbG9va3MgbW9yZSBj
b3JyZWN0LCB3aXRoIHRoZSByZXR1cm4gY29kZSBjaGVjayBmcm9tIGNsa19wcmVwYXJlKCkuDQo+
IA0KPiBJIGFncmVlLiBVbmZvcnR1bmF0ZWx5IHNvbWV0aGluZyBicmVha3MgdGhvdWdoLg0KPiAN
Cj4gPiBDb3VsZCBpdCBiZSB0aGF0IHR3byBwcm9ibGVtcyBlbGltaW5hdGVkIHRoZW1zZWx2ZXMg
aW4geW91ciBjYXNlIGJlZm9yZT8gOy0pDQo+IA0KPiBIYS4gV291bGQgaXQgYmUgdGhlIGZpcnN0
IHRpbWU/IDspIFdlbGwsIHVuZm9ydHVuYXRlbHkgSSByZWFsbHkgZG9uJ3QgDQo+IGtub3cgdGhl
IG9tYXAvYW0zMzV4IHN0dWZmIHRvbyB3ZWxsLiBNYXliZSBUb255IChDQykgb3IgR3J5Z29yaSBr
bm93IA0KPiBiZXR0ZXIgLSBJIHRoaW5rIHRoZXkgaGF2ZSBoZWxwZWQgbWUgd2l0aCBCQkIgcmVs
YXRlZCBzdHVmZiBiZWZvcmUgOikNCj4gDQo+ID4gV291bGQgaXQgYmUgcG9zc2libGUgZm9yIHlv
dSB0byBwcm92aWRlIHRoZSBsb2dzIHdpdGggImluaXRjYWxsX2RlYnVnIiB3aXRoDQo+ID4gYW5k
IHdpdGhvdXQgdGhlIHBhdGNoIGluIHF1ZXN0aW9uPw0KPiANCj4gTG9ncyBhdHRhY2hlZCA6KSBt
aW5pY29tX3JldmVydGVkLmNhcCBoYXMgaXMgdGhlIG5leHQtMjAyNDEyMTMgaGF2aW5nIA0KPiB0
aGlzIGNvbW1pdCByZXZlcnRlZC4gbWluaWNvbV9ub3RfcmV2ZXJ0ZWQuY2FwIGlzIGp1c3QgdGhl
IG5leHQtMjAyNDEyMTMuDQo+IA0KPiBVbmZvcnR1bmF0ZWx5IGl0IHNlZW1zIHRoZXJlIGFyZSBz
b21lIGVycm9ycyAoZmxpcHBlZCBiaXRzPykgaW4gdGhlIA0KPiBzZXJpYWwgbG9nLiBOb3Qgc3Vy
ZSB3aGF0IGNhdXNlcyB0aGVtIC0gSSBoYXZlIG5ldyBGVERJIGNoaXAsIHBlcmhhcHMgaXQgDQo+
IGNhdXNlcyB0aGVzZSBwcm9ibGVtcy4gKENvbXBhcmlzb24gb2YgdGhlIGxvZ3Mgc2hvd3Mgc2lu
Z2xlLCBzZWVtaW5nbHkgDQo+IHJhbmRvbSwgbGV0dGVycyBiZWluZyBjaGFuZ2VkLikNCg0KTm8g
cHJvYmxlbSEgVGhhbmtzIGZvciB0aGUgbG9ncyEgSSB0aGluayBJIGtub3cgd2hhdCBoYXBwZW5l
ZDogSSBzdXBwb3NlDQppdCdzICJwcmVwYXJlZCIgY291bnRlciB1bmRlcmZsb3cgb24gcHJvYmUg
ZGVmZXJyYWwgb2YgR1BJTyBkcml2ZXINCih0aGVyZSBhcmUgInByb2JlIG9mIDQ0ZTA3MDAwLmdw
aW8gcmV0dXJuZWQgNTE3IiB2aXNpYmxlKS4NCg0KSWYgeW91J2Qgc3RpbGwgaGF2ZSBhIGNoYW5j
ZSB0byB0ZXN0IDYuMTMuMC1yYzItbmV4dC0yMDI0MTIxMywNCkkgYmVsaWV2ZSB0aGlzIHdhcyBt
aXNzaW5nIGluIHRoZQ0KImdwaW86IG9tYXA6IHNhdmUgdHdvIGxpbmVzIGJ5IHVzaW5nIGRldm1f
Y2xrX2dldF9wcmVwYXJlZCgpIjoNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvLW9t
YXAuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLW9tYXAuYw0KaW5kZXggNzZkNWQ4N2U5NjgxLi4wYzMw
MDEzZDJiNDggMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1vbWFwLmMNCisrKyBiL2Ry
aXZlcnMvZ3Bpby9ncGlvLW9tYXAuYw0KQEAgLTE0NzMsOCArMTQ3Myw2IEBAIHN0YXRpYyBpbnQg
b21hcF9ncGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQogCWlmIChyZXQp
IHsNCiAJCXBtX3J1bnRpbWVfcHV0X3N5bmMoZGV2KTsNCiAJCXBtX3J1bnRpbWVfZGlzYWJsZShk
ZXYpOw0KLQkJaWYgKGJhbmstPmRiY2tfZmxhZykNCi0JCQljbGtfdW5wcmVwYXJlKGJhbmstPmRi
Y2spOw0KIAkJcmV0dXJuIHJldDsNCiAJfQ0KIA0KQEAgLTE0OTUsOCArMTQ5Myw2IEBAIHN0YXRp
YyB2b2lkIG9tYXBfZ3Bpb19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAJ
Y3B1X3BtX3VucmVnaXN0ZXJfbm90aWZpZXIoJmJhbmstPm5iKTsNCiAJZ3Bpb2NoaXBfcmVtb3Zl
KCZiYW5rLT5jaGlwKTsNCiAJcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOw0KLQlpZiAo
YmFuay0+ZGJja19mbGFnKQ0KLQkJY2xrX3VucHJlcGFyZShiYW5rLT5kYmNrKTsNCiB9DQogDQog
c3RhdGljIGludCBfX21heWJlX3VudXNlZCBvbWFwX2dwaW9fcnVudGltZV9zdXNwZW5kKHN0cnVj
dCBkZXZpY2UgKmRldikNCg0KDQotLSANCkFsZXhhbmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0K
d3d3LnNpZW1lbnMuY29tDQo=

