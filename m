Return-Path: <linux-gpio+bounces-8695-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA1394D805
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 22:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 544D3B21638
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 20:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A51415ECD2;
	Fri,  9 Aug 2024 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MrZg2uYK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C40C33D1
	for <linux-gpio@vger.kernel.org>; Fri,  9 Aug 2024 20:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723235107; cv=fail; b=n2PyWgm5wO2RDY4Y7JYdqDhl1QXtWnWASE/GQF5fWxECfsssIJKa6T+plgOIl6wqqLscIAKIyQ0viZ3GliQDzkC9TLl02mx3bOVm3nukLvkXeCMoFgcHh6LW5lYvsRzSA55I1THt31MsBvVnXeIuIr0r/ZoDY0EIu1uzI7CNMus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723235107; c=relaxed/simple;
	bh=wthVut9KQnd1Uew6YQ+9md9vWLmFgKWN4uaqFr1yyNw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MqdmBIgzGeruuqIoBwM+6g7PrhkmyOI4c+ElhtvDvwopFRlWPbANp6Bq2Cqkk2mX3TyChNec2pXS6xxg9Pk4nU4ElPZ3gIRfvmihugkSgk+1ahvnCNqp5+7a1ZKMG9Wqvh2IiJbFQQyRAu67i9qwwYnN8NIRj4ZyOLu155i7lmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MrZg2uYK; arc=fail smtp.client-ip=40.107.237.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E826zi5q04btF5mvWFoqL8W/6rYobzjQ+Kr9rabBYdoxywMERlscyprOJ0kME2Y13JIVvQTILE0sK49rGrCBrDcIzv6Nd1+UbBC/JMDttVxz3cfRbxASZsOfXx4sYjtjnaG8FuMAEOd3wEr9XT+KP6F6izDp1nENySiJoWHnaJacwSrZ26sMAXXnQdR85Qvro/DHo/Ac+3I8I+lTwYScwwsW6oT2INWozTpR8ucM7kriYYYZdZtUJUiUYKN/tZC6bH11mj5syGtrVV3HE4Rg+vtM37YS/2Y/6V1UaxFoIW+u9ocFhiKVBJ2SnniWHTyPvkSNPfnyf9MHPnkMGZ/rIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wthVut9KQnd1Uew6YQ+9md9vWLmFgKWN4uaqFr1yyNw=;
 b=R2zZBEIuLlzSblGSzOznJaPSToJrxfhb0ERHmp2o4xu1m5HeKJiVZPwK/kUoVgTcZIVg02ryFaD6875hXHqNuEZ3m3C5oR2Xmay1BQbW2tHQMsEPZ5jBndgoWxffKOaclbPrEAvX/++qkGfoPKuuM8hOp2qyui44a07nkctP6p9eT0+QLsCBd3u3GJgfLfE7YvJ+K/cGC27y2joF3IcxDe92G8vE9zRTEw2lPX4SSbfzXWVfMW5V8phmXJU76rnKy2tc7lzChwEKNuCl3t5dyerHfFOKPxUWinoh/C9q3VGUnSMTifKhMz9r+8W5T2xX0+YyLEvXEY2VHmLZGYylaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wthVut9KQnd1Uew6YQ+9md9vWLmFgKWN4uaqFr1yyNw=;
 b=MrZg2uYKsP1rf94l7iCrxTHQ11Pxmw4Egwp+EYF4PX9hgwH6J71jerJmzbVRJIEADASsY/p6ritH7/Y0Bue8gT29ZN1YwWhVG6LAUIbqPS9RXtDMa7I30KWEUsz2K+De3zUmCuDT00n0fyerkkWd8TG7Yusq3Ya8sTmJrJtIg7/D+DdAExl6kByhrRvsbqJl0ffZruKhqDjcUvL/KmyGVJpCNSUF4flfedD4VuJXc02SnXgvLxb77MLVRjNItNRhcKJ6tINW9mmLGhfho2Sch24voxfRNSaiLDHKTVxtrpIfd48d9zew91H368fcTBotn1/ROsQCe2zcbnvRClvABQ==
Received: from CH3PR12MB7738.namprd12.prod.outlook.com (2603:10b6:610:14e::9)
 by SJ0PR12MB6965.namprd12.prod.outlook.com (2603:10b6:a03:448::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.17; Fri, 9 Aug
 2024 20:25:00 +0000
Received: from CH3PR12MB7738.namprd12.prod.outlook.com
 ([fe80::fad1:1acb:f5eb:98ee]) by CH3PR12MB7738.namprd12.prod.outlook.com
 ([fe80::fad1:1acb:f5eb:98ee%4]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 20:25:00 +0000
From: Asmaa Mnebhi <asmaa@nvidia.com>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>
CC: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
	"bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Thompson
	<davthompson@nvidia.com>
Subject: RE: [PATCH v2 1/1] gpio: mlxbf3: Support shutdown() function
Thread-Topic: [PATCH v2 1/1] gpio: mlxbf3: Support shutdown() function
Thread-Index: AQHavCL5vFoTumo/G0KcI4eczXlworHLsq6AgFQIjrA=
Date: Fri, 9 Aug 2024 20:24:59 +0000
Message-ID:
 <CH3PR12MB7738928E3B528F9270E1BACAD7BA2@CH3PR12MB7738.namprd12.prod.outlook.com>
References: <20240611171509.22151-1-asmaa@nvidia.com>
 <CACRpkdYJyeOYYraBn6GKrCmRGO1L8eFsWPbhsEqc0OwXUWVorg@mail.gmail.com>
In-Reply-To:
 <CACRpkdYJyeOYYraBn6GKrCmRGO1L8eFsWPbhsEqc0OwXUWVorg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR12MB7738:EE_|SJ0PR12MB6965:EE_
x-ms-office365-filtering-correlation-id: 4be0618b-775d-4999-044d-08dcb8b157b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UmFYTXhScWh6eUNGMHM4aWRGZlhTdmIySkQxYVJCQnpRZTNqakRjUURjeUR6?=
 =?utf-8?B?cVJpaldqcGpNbWN4K0V4MkowNm5Xdk8vU09wWkZmTEJGbmJrZ0tPK1hkejZz?=
 =?utf-8?B?SHJqZEwzNEtDRkNwSE1tRXdsb3FDd1IwRitqdVZ0c2ZUQnFueHhnQ0Q5NWFR?=
 =?utf-8?B?WTJsN1R3NjRtelFCMTJwaEcydFpQMkZCelhMbGpOdnhZd3I5eUx5cllGbmpY?=
 =?utf-8?B?dFl1ZEFrSlZjNU4xZzJrVW1UMXJ0ckJMNCs0U2JJcHcxN2J6WVlEN093TWZh?=
 =?utf-8?B?SmVSNE5oOSsrODRXU1RpN2EvNFJEWG0zMTVWUUlFZjAxdXVtVERzREMxUGl4?=
 =?utf-8?B?WGgzQlo4ZDBKblMxMFV5U0xFYjNaRjdkeG8yaG5KZk44UkRacDhqNUpYRXo0?=
 =?utf-8?B?SmZDRjl2RnlYQlRrZVAwbFNjdzJaRUVxMElLaGNKbVZFZ2FUWHA2NHlBTEMr?=
 =?utf-8?B?OFFOWkg3ZzNvS2JpZjhZSC9mejRTalNLcmtacEZCY3RBNHFSRWVFU1JtUUxv?=
 =?utf-8?B?VUw4WGczNElVdUhFMWlxZ1gxdGlycUpkcjBVNThoNnN2VW56amh3cnMyM05Y?=
 =?utf-8?B?S0ZpRitZRzZiaG9zSVRQa0xWUEdRcTRhUmFtem5iK2Z0RlFtRFAvdzRiSGtP?=
 =?utf-8?B?czBHdWE0OXRPZW9GZzB3dkp5OG9ubVJzb2lzanErcFliMXVGTklhMDl1VDBH?=
 =?utf-8?B?aHY3ZFRUVlBSalQvd3lHaDdlRER1Qk1vMnltL245U3EvUTZsc1JPeEhnYVlO?=
 =?utf-8?B?WFRZZjdIeHNQQ3k4cVJzbCs5azhZaDloWlEvSVJaaXZTWlFDQUVTU2s2SkFC?=
 =?utf-8?B?cExid3lsT1dLUVRPQjkxQ01lMTV6Tm5vdnByV015WENoTjZ4dVJOZkQyQ1c3?=
 =?utf-8?B?TWZLUWhjMVFTdE1ILzlMT05xTnRzNGU1TjNRK3dPcWNzNi9qMTYydE1pRVVm?=
 =?utf-8?B?QUh0S2F4cVpPUjNoQlhpMmU1VG5KK2pNdGV2T1pFNllLM3BZVG5MSHp6dlpz?=
 =?utf-8?B?Si8zYWI2REhIbVFvaS82YVV6Q1dzYWpDZlM3R2RTTGFlZ0NjS0xaaDZIanU4?=
 =?utf-8?B?TXNlTVNsS2pON0FWRjIwckptNW0rZGExUHppZitUUEp3YWJ6TGpjbmlFRDJF?=
 =?utf-8?B?eWxPQ3hWanMra0ZMVGV4QlZmTGlPZlkyWTRjMzlOSFgvOWZmL0FaUG9IRlBl?=
 =?utf-8?B?emxZREpGd0hES0NMTXNnUTc3R0tHLzNEbUVFRlZmNWtWQ2dlYW9RcXg5ZElB?=
 =?utf-8?B?MlJVMGVXUTJrM2hqem9Lek4zMU9EcTZhNWlEdEdnSnZtNEU0SVJpVHhxYysy?=
 =?utf-8?B?dEl5c3UwQnJwRzI4TTgxNlduUVg4VDZldStlbG51aUpKYWsraHc2NC9kWFp2?=
 =?utf-8?B?eGd2bVFVdHVQRm91REZpTmUzaVV3YVo3dVVjRkZUdmNyN3Y3Z1Blcm41azhV?=
 =?utf-8?B?SDFFc3FHMXhGTEI1RjhqemJzMG9oL2xJU1RRMWVaQ2VXYm1pcTNSRlpmbDhD?=
 =?utf-8?B?dXZqK2NSN1MrTWtnemxLMEt3WnJRRUJtTDJyeWtRdG1zd0N1ZGlmcjJDdnBR?=
 =?utf-8?B?UTlON0xXc1F2RGdrL2JHY0Uvamx3TmFRZHBRNjQ0V0FIdEs0VkhZMFdFRzZk?=
 =?utf-8?B?R3VRRFlKQi9jWUNLNitlaEY2UXZpNys3Y2thZzRubnJnR2VidWVIVzBzcGp3?=
 =?utf-8?B?QU83UDBEbWNXVWJOR2Z5ekN4OHBJak9MQVV0UE1nRU11Ylh2eTFSbWl4M0xM?=
 =?utf-8?B?S1ZLZHpRTklQMlRDNlRUdi9WYjJCcTY3Z09keE9HQnMyWHA2czdZZ1oreWQx?=
 =?utf-8?B?QXVCZ1dzMWhNNlIycTUybk9zNU40bDFvcUM0R0plaWpCOGo1ZlFKc2lPbExT?=
 =?utf-8?B?c3A4UHpJZnFNS2tpRkdnNW1NUFZIRkIrRlN3WmRXOUxQNnc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB7738.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MndCaUZpWUgwbURPWGJPczV2dU5XaGxFRjlvNlZwbThQZ05ZakxkSENtb1RV?=
 =?utf-8?B?TmdudkRJaTFybUV6ZjFodFE3TUZRcUwvaVlCanBFM3g4a3Bwd3NmK3oyeVRm?=
 =?utf-8?B?dXdOa0lkWTJwb3VaanNSazRqOXVTQWFnODRuSUp2QnQyeFdnK0hyaUdaQS8x?=
 =?utf-8?B?WDI1WUJwQTF5RW9KeW1KekxKemJSWU1id0o5WFowRG83bXFMK2FxeTJXdm1t?=
 =?utf-8?B?TmRERWQvemhTMmZBNlp3Y2VaSHZRRUdVSmRvOHZhd2xXbkNnVEtFS1ltY0Fr?=
 =?utf-8?B?aE1EcEhLU210QXB0UkVPbGMwK3Q1YkZuYmpXb2tsTWtKeHg3OVJuUUZFbDVF?=
 =?utf-8?B?bFZWaFpNRDVhMG5ONXhZZlhINm5zMFVDckJBcE5HVUpxRVlLR3lwZEhIWVRY?=
 =?utf-8?B?NytCdyt5RXpCVXZqczZPa3FlYVkyOW9YQ2pGcDV4VU1STUVPMVpoRmFZakxk?=
 =?utf-8?B?NGZZRmc0RzJacUNhTU5icTFzSkhldW9RTUFqYWJ6a1ZPVThEYytKbENEb2l3?=
 =?utf-8?B?SENjQ2QrRlN1WXRrNktrd1F1WFd5V0pLZTgzckpwZG85ZHNGR1VqdkpFaDlW?=
 =?utf-8?B?L0RodEROTUppV1pacGFldFJKTHMzdjd6aFFzL0lRVENTN2xFNzk1L2F4V2xG?=
 =?utf-8?B?ZUs4NDV4c2YwWnlJWDkwazA4MEgxS1NEc0ZhRm85NW50bTJSbXkzejB4K3hJ?=
 =?utf-8?B?Q0Q3NkFibTBuQTVLcVJaenIwekVET1hMTU9xaktMaVBxM0FzM2x0eGdlanI1?=
 =?utf-8?B?QWlZaVZuekoxcXBGZjVaMEc2UEsxNDhiTkMrcTBHVloxRkoyS0k2T0hKbzdO?=
 =?utf-8?B?VG1kVklnYjRRMU5wREtLcVpHNGVkbEF6UWpJRmtINnRyZ2dtWTVTT3JoN0dk?=
 =?utf-8?B?VkxPNXFTY1dsNitEYVo3RlZFMDUvS3BUTm93S2Z6QjM3ZHFtSHRzMk5PUllI?=
 =?utf-8?B?OTg2cSsyS1hPcFd3OFVtMHpBR3VoWWtkWStTZHY2OXI4a1BCK1dCTmRXN0p5?=
 =?utf-8?B?MFJmbUdlUElSTnNlUkZkZDNKd1FnTGRYZ21SZlpObUhaSUJuNitXSDkremM1?=
 =?utf-8?B?RDhMZmtnN1dWQVU4a3NCS0MwUDRZaFJZQjFFL3YxN3F0VGh5UkNBcEloZlZZ?=
 =?utf-8?B?NE1WS2hJQlJlK3hxamExZWJyUGV5RHB3MFZBR21IaFUxZWdhL055eXMxTlBO?=
 =?utf-8?B?RGpsYmsrNlI1OXEwandqSmNLM2puRVFPdkR2S2dtWWhUMXI3UE9mSTRyY2pH?=
 =?utf-8?B?T0VOZlJTSjZONWhnL0dvcmZzOGU3akNwdDEwNy9HaHNRZDZUMzBOU2FrWmRM?=
 =?utf-8?B?V3RyKzhaRDFlc3JRTVBNWnB2UlRNN1NFdDIzaTF1S1J2RURvdTBSNFcwZnZy?=
 =?utf-8?B?Y1p0cEJtVEx6VWxRNW9MTklqYWlhS2VpSlo4UFBab3BmeDBHN3pCbDZFRmJH?=
 =?utf-8?B?R2Q1c0l3RURWOS9RR25QeU1ta3ZiQU5sTkd1d2x1RWRyTnRIcnl1NXBjSS9K?=
 =?utf-8?B?L3d1djVLblVjVkh1U0dhZFkvb2xyMVp6b2svazZOdXNEVTYvMEY5Y2NNSXhH?=
 =?utf-8?B?MkI0bVhoZVhpVGVxMHQySWRPS3JWVldLb2pvcUZIVS9oaTZCTi95eEtEb3hG?=
 =?utf-8?B?b2wvU20vMUNsSWtNcWlTc1Q4SVBRbGlDMm1JdlRCZUZrd3R4dFlTUnNyM1JY?=
 =?utf-8?B?ZTc2aXhTcmhsR25NZFdpUHhWUE1JbWJxWHY4bmt6dWpkVmFnZVl0L240SWQ4?=
 =?utf-8?B?YjNqNU96L1Q1TVp5Tjc1S1h1L0doY2VtbDN4RFFTVU4wWVZtWW4yZWhoZjc3?=
 =?utf-8?B?b29LR1FxdVJPd3Q5ODB0QmhadGc5MFNlYzZ5a2N3Z2p5NDJSS3ZzNkRQOGdl?=
 =?utf-8?B?OVhlZ3JnQjRNRk9HTVJPUkxrNzd2Zlk0anF6V0w5ejFHSjJlNUZUbkhqRzRC?=
 =?utf-8?B?WjNKTFhrRG1zaXJ1Nk9jeDAyT0F1RHVYUXZObWtncllLck03R3FmRzJ4dHVx?=
 =?utf-8?B?aFN1SmJ3eFFqdzVZT05KNjZvUTBsRGlRaVA1NU5LSEdUVzdvdWNVQSt3eXdq?=
 =?utf-8?B?NUYzRW1pd2xXOEJIWElKeTlGWWt5NlZSc0JpMy85YitBT2FaSm02WmRRRXVL?=
 =?utf-8?Q?nCMI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB7738.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be0618b-775d-4999-044d-08dcb8b157b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 20:25:00.0210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LwYGOwe4k3xrqEnQT1GZII6oajbMaBj8u7CaFs8vY7T8L/LCCdUm8ZBqyA8H2VgGyoPwpXHPJOHMImA/2q2SKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6965

VGhhbmsgeW91IEFuZHkgYW5kIExpbnVzIGZvciBhcHByb3ZpbmcgbXkgcGF0Y2ghIA0KDQpIaSBC
YXJ0LCBjb3VsZCB5b3UgcGxlYXNlIGFwcGx5IHRoaXMgcGF0Y2g/DQoNClRoYW5rIHlvdSwNCkFz
bWFhDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMgV2FsbGVp
aiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiBTZW50OiBNb25kYXksIEp1bmUgMTcsIDIw
MjQgNTowNSBBTQ0KPiBUbzogQXNtYWEgTW5lYmhpIDxhc21hYUBudmlkaWEuY29tPg0KPiBDYzog
YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbTsgYmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbTsgbGlu
dXgtDQo+IGdwaW9Admdlci5rZXJuZWwub3JnOyBEYXZpZCBUaG9tcHNvbiA8ZGF2dGhvbXBzb25A
bnZpZGlhLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzFdIGdwaW86IG1seGJmMzog
U3VwcG9ydCBzaHV0ZG93bigpIGZ1bmN0aW9uDQo+IEltcG9ydGFuY2U6IEhpZ2gNCj4gDQo+IE9u
IFR1ZSwgSnVuIDExLCAyMDI0IGF0IDc6MTXigK9QTSBBc21hYSBNbmViaGkgPGFzbWFhQG52aWRp
YS5jb20+DQo+IHdyb3RlOg0KPiANCj4gPiBEdXJpbmcgTGludXggZ3JhY2VmdWwgcmVib290LCB0
aGUgR1BJTyBpbnRlcnJ1cHRzIGFyZSBub3QgZGlzYWJsZWQuDQo+ID4gU2luY2UgdGhlIGRyaXZl
cnMgYXJlIG5vdCByZW1vdmVkIGR1cmluZyBncmFjZWZ1bCByZWJvb3QsIHRoZSBsb2dpYyB0bw0K
PiA+IGNhbGwgbWx4YmYzX2dwaW9faXJxX2Rpc2FibGUoKSBpcyBub3QgdHJpZ2dlcmVkLg0KPiA+
IEludGVycnVwdHMgdGhhdCByZW1haW4gZW5hYmxlZCBjYW4gY2F1c2UgaXNzdWVzIG9uIHN1YnNl
cXVlbnQgYm9vdHMuDQo+ID4NCj4gPiBGb3IgZXhhbXBsZSwgdGhlIG1seGJmLWdpZ2UgZHJpdmVy
IGNvbnRhaW5zIFBIWSBsb2dpYyB0byBicmluZyB1cCB0aGUgbGluay4NCj4gPiBJZiB0aGUgZ3Bp
by1tbHhiZjMgZHJpdmVyIGxvYWRzIGZpcnN0LCB0aGUgbWx4YmYtZ2lnZSBkcml2ZXIgd2lsbCB1
c2UNCj4gPiBhIEdQSU8gaW50ZXJydXB0IHRvIGJyaW5nIHVwIHRoZSBsaW5rLg0KPiA+IE90aGVy
d2lzZSwgaXQgd2lsbCB1c2UgcG9sbGluZy4NCj4gPiBUaGUgbmV4dCB0aW1lIExpbnV4IGJvb3Rz
IGFuZCBsb2FkcyB0aGUgZHJpdmVycyBpbiB0aGlzIG9yZGVyLCB3ZQ0KPiBlbmNvdW50ZXIgdGhl
IGlzc3VlOg0KPiA+IC0gbWx4YmYtZ2lnZSBsb2FkcyBmaXJzdCBhbmQgdXNlcyBwb2xsaW5nIHdo
aWxlIHRoZSBHUElPMTANCj4gPiAgIGludGVycnVwdCBpcyBzdGlsbCBlbmFibGVkIGZyb20gdGhl
IHByZXZpb3VzIGJvb3QuIFNvIGlmDQo+ID4gICB0aGUgaW50ZXJydXB0IHRyaWdnZXJzLCB0aGVy
ZSBpcyBub3RoaW5nIHRvIGNsZWFyIGl0Lg0KPiA+IC0gZ3Bpby1tbHhiZjMgbG9hZHMuDQo+ID4g
LSBpMmMtbWx4YmYgbG9hZHMuIFRoZSBpbnRlcnJ1cHQgZG9lc24ndCB0cmlnZ2VyIGZvciBJMkMN
Cj4gPiAgIGJlY2F1c2UgaXQgaXMgc2hhcmVkIHdpdGggdGhlIEdQSU8gaW50ZXJydXB0IGxpbmUg
d2hpY2gNCj4gPiAgIHdhcyBub3QgY2xlYXJlZC4NCj4gPg0KPiA+IFRoZSBzb2x1dGlvbiBpcyB0
byBhZGQgYSBzaHV0ZG93biBmdW5jdGlvbiB0byB0aGUgR1BJTyBkcml2ZXIgdG8gY2xlYXINCj4g
PiBhbmQgZGlzYWJsZSBhbGwgaW50ZXJydXB0cy4gQWxzbyBjbGVhciB0aGUgaW50ZXJydXB0IGFm
dGVyIGRpc2FibGluZyBpdCBpbg0KPiBtbHhiZjNfZ3Bpb19pcnFfZGlzYWJsZSgpLg0KPiA+DQo+
ID4gRml4ZXM6IDM4YTcwMGVmYzUxMCAoImdwaW86IG1seGJmMzogQWRkIGdwaW8gZHJpdmVyIHN1
cHBvcnQiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEFzbWFhIE1uZWJoaSA8YXNtYWFAbnZpZGlhLmNv
bT4NCj4gPiBSZXZpZXdlZC1ieTogRGF2aWQgVGhvbXBzb24gPGRhdnRob21wc29uQG52aWRpYS5j
b20+DQo+IA0KPiBSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5h
cm8ub3JnPg0KPiANCj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoNCg==

