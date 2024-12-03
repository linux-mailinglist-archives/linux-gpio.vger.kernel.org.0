Return-Path: <linux-gpio+bounces-13464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC399E2AA6
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 19:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A105280E27
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 18:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF191FCF72;
	Tue,  3 Dec 2024 18:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="ssANT7xn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2050.outbound.protection.outlook.com [40.107.21.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42841FCCF9;
	Tue,  3 Dec 2024 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733249995; cv=fail; b=j9vR1eRbHnimHv/F8V0OI6gt8YnnfN4krJN6IKZQ3NKpcrm1a1XFHZHNk9bDwVOyB1Su5gp/mja6nPe9X1VPx0eNU3qeRTY6oaFjmZLO9qz/BLHZpQ3wF/rmIpdGnGG9mfy5iyoDW1WlmQsbIfx11nT03hXqP8AYOmSnQE4wPdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733249995; c=relaxed/simple;
	bh=j5E1bRZquKmzNOw+jOKxnkKvLwnaVgwWrzhZD2kKSa4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mXCY7/rtCIbBlvTc0C/KtlGngOJodB2H/OJBQNwx78dwE+v3b+9SDNrRoyNdqvjYnCDaXfWhQOpDTiIvFJkQ3DpCpnC8Tls1SNYYS4bDj9RDQAHP2Vqss4dB8RRltE7lvPH21iuMvsMk6TznACPVcvEJEulh2kRWtwPysUgR3S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=ssANT7xn; arc=fail smtp.client-ip=40.107.21.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQ07k9iNHw99WL64JeIk6QOsW04knya58vfpe9rIbsBBAAl5ivn8CPbjxvdm36zYw5XXKzNJYxrXCP9b6ST6AFkex2/ZhIo9XLtdmREyvKhWgUIrS6XkJtTKub8HzLrr+T/TaIyichZg+502mk3JJGANwfH3bThhuR1DNhXMmF3AGFNT/LG6keRPluPnheS6D1hgMEQ9O8HNiooRz9QCY0lbUnYQKyfsZdgS3uI4ngodv73rSTNvBGaBOSs9xfMjgPJuAL0h5dzPgE38xqqVjj6soAaLd664ITJlw9XN+4wqMWbtQzh2Fh0lg/UFlNOwTsvODZZbml80fBf4vkeK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5E1bRZquKmzNOw+jOKxnkKvLwnaVgwWrzhZD2kKSa4=;
 b=b2S1Xyy+IDqaZe5Gbcbid1OlgExesEJyLkMJJPIkyV9qZjgqGQ/lxkchPAI8URT5JWce0RmZpezG3cSrOho0hwIh/vvDXWgRdv67cYZmOBfBE7gIXo7RBvTEwwtdMLc+kM84JlB0jnYv7BhYqNNJ1CQzoo0wtw9NLIKK/EJRLJ6wHUy1jdt+vje+QQCt5E8+w2Zd5xOKKAE7oBsadSsR8nfJ7AFiEAjyKS3wahV/19FBunprdhwu6hP8I4jdSiyEDGFGtNAjjqqF+gzoZN0brUst9AvES2Qx03SzIyRs9fPJu5SDO5M2pEZ81r+S8ZsljmW4s0+hyVEE4b/SIf/aQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5E1bRZquKmzNOw+jOKxnkKvLwnaVgwWrzhZD2kKSa4=;
 b=ssANT7xnPAKpW7c4CcmouLi17fdONSsd3MIAlbYR3sddttf3HHoDRBsT0ZuMp92gzNDEGIhMkjvPidErBS6/be1SrbTQcd6tGIE+QP1fK+VIuE4EQBvgQHIyiSseGE5BlvZYOMZ+92X78/gCxFjjhnHvUKp1RpSFLDDKrGIfNXux0VfO7C6eZo3wToucTmXgpmtRGV1JiSJwdosQbiqqzS/au06Nsn1BMuaeeNrBtaXP5q9BZaJx5rynYQRA2AgDEkeRXAaiTPAUN5HVHOiBp+wQAIE/1rsJ7UaDKRjsCzaX7zwyUH9fStthSaIAWLJjJFeFRs+PJJBpCGwE69zQRg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PR3PR10MB4094.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.9; Tue, 3 Dec
 2024 18:19:48 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8230.008; Tue, 3 Dec 2024
 18:19:48 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "ssantosh@kernel.org" <ssantosh@kernel.org>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>, "khilman@kernel.org" <khilman@kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"grygorii.strashko@ti.com" <grygorii.strashko@ti.com>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 2/2] gpio: omap: save two lines by using
 devm_clk_get_prepared()
Thread-Topic: [PATCH 2/2] gpio: omap: save two lines by using
 devm_clk_get_prepared()
Thread-Index: AQHbRaJCThPj1tY640qXcJUSCr5fNbLU1JmA
Date: Tue, 3 Dec 2024 18:19:48 +0000
Message-ID: <34ab5f0b78c2869cc43797a72d6a2f40d9b246f3.camel@siemens.com>
References: <20241203164143.29852-1-brgl@bgdev.pl>
	 <20241203164143.29852-2-brgl@bgdev.pl>
In-Reply-To: <20241203164143.29852-2-brgl@bgdev.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PR3PR10MB4094:EE_
x-ms-office365-filtering-correlation-id: 93fc264f-451c-44ab-87d8-08dd13c7126f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?djBkNExSRnJyQnNuc3czSzBBZCt5VjA4V0VDYVpNSEE3NU9MV0pENFpYM01M?=
 =?utf-8?B?aS9zRm9YZTFiVlc4eDcvR2xJZmtFZmZYR2FibSszOEFjd2Y3RnZzMVFvaTdL?=
 =?utf-8?B?ZFFTWkEvb0Z4cmdETDNvRXJnbGwrZkNxdWlac0U2V0tuVW15VE9xeUxCL2Nt?=
 =?utf-8?B?WlFYbjJhRWp5L1NkS29EY2srZjdEUUlQcmlaaUpobDJTaTZCdEx5STJKbkVV?=
 =?utf-8?B?a00vQnBJZTIreWlaZFp5R01BMWlGbCtzVXpIc0V6SU9xb3M2NzR6azZMbEZy?=
 =?utf-8?B?N09sazIwWkFoeHRkTGRsN1JUSFRjK3BzSmtzKzBHRGord3ZtOWlkZEZVb1pM?=
 =?utf-8?B?TU5SeGpYeEJmaGd3aXlRQUQ5OVdTSUlhbU5FalJscEJpbllZVFdTWklOOVVi?=
 =?utf-8?B?a3h4MDRzeEJwK1ZRdWVJN1dNSEZ3UlVjVmNhWkpGVVBNSFNEVmxzRmxaaDNa?=
 =?utf-8?B?MHlvU0thWjJoejdHNFEzM1FNTFMyM1FGaDJwSm5OOTRJd0p4QUVocWNSeENU?=
 =?utf-8?B?VktQWC9jcFFCWFBCTWJEUm9MYWh5U1l6VnhlNFlkQkZMR2VJcWtENUlObEp3?=
 =?utf-8?B?ZTJlNGxrSlZVQlF1Zm9mZVpDZm9kMTB3S0MvRHBWOFN0SUhuMERoYzlONlNu?=
 =?utf-8?B?TEo0NUZMeEdqZytQZzRhalp0dWRaMVE3YlJ4dmwyZ3BjMWRncVgwV1hKbXRH?=
 =?utf-8?B?ak5NL08zb0xMR01jbzlrazNwTlhCemp2VkhjQWpvWHFMa3dXV1NPSHFna1B6?=
 =?utf-8?B?U3ZXb0srZHRRMC9jbG9yYkQrN0F4VCs2b0Q4ZzhRWW8wbjc2bW9adVFieTh4?=
 =?utf-8?B?YVhrRStxM0c1MjRFSUZtaTdXbzFNK2t1ZHVJWGQvVnR6MmxnWXJnT2tvbE02?=
 =?utf-8?B?VGNpVTBxeDE0VE8zQ0JhdjlFcFYrQlhMRXVZTi9KYkJlMDFMUUtPVllvQ2xr?=
 =?utf-8?B?NlNiUDI1ejN3RWZIVE8vT0NKbWxjMWtkU0o0aFlOZlBFMlY2dHp2OVlzMXJu?=
 =?utf-8?B?L2FNenF4U0x5SVhSODN6YjhLOFR3Z2UydjJxcHd3N2hrWnBLa3B0NlY0VE41?=
 =?utf-8?B?bzhmdVdzU1g4d0tqSjhEK3JsNjk4bmtDQlA5dEpaSkYwV1BseENXL1hXMlZF?=
 =?utf-8?B?N1lvMmtmM0lMR0J2aGlhSWxPYThpYTUwTU82Yzc0ZDBZQllmK2dsVFF2NlBF?=
 =?utf-8?B?UWw2RHVvWFErZGdoQkg1alhFQkRNVG9NQ1hRTHNLNGd0WjNPWUZMeVdRcXNm?=
 =?utf-8?B?NXRNbTBPbzFjaFRETkdzdTBabVJBWFZVamhNOW9ibU9ZTjZKVHo1Tkx2NDcz?=
 =?utf-8?B?QW9JMThhd1VCZmdGZlVOVDR0ZllBYmRjME5od05SWEMwc2F1TnFiM0NSczdP?=
 =?utf-8?B?MEVJa2VycVlaczNYeG51UnNzYWxmSWpQNGhTRlc3VnFvK1YvNHkycXlUeGZi?=
 =?utf-8?B?KzhXT0ZaSEFjblluejZHZmd5RnprNmpmL29aTElibnIvQ0dwbEdwMmkzVmlk?=
 =?utf-8?B?UWtMSnI3TmdHK3lHN3ZscDNaRGthVlQ2Z1pmZGNuQ2E3OVZWUm5xOEhLVjBj?=
 =?utf-8?B?OTZXZXptZHNoYWZsdGxFK1hnRVlOZDB5T0t5Z2N2cmtTQWQxNFhLQnQyTVM1?=
 =?utf-8?B?TERmUzNSZDByNE1IbTdnbkZkOUZDOVROdEtyN292anc1Mk4rdFN0RFZUaGVN?=
 =?utf-8?B?MHh0bVRCTk92N3NuZ1UrSDdSTzBPY2YxaUk3NTVSQTAybXl5Z0xVQmZ0NFY0?=
 =?utf-8?B?TkFSL09VU2Q1N1drdFdFMnhxSEtJNmV1eEJzNWZrV2daYjVhMWQ1cW5VenBV?=
 =?utf-8?Q?fqsd/BEP+6mPuxDkMx35+MZmei99Eqb8WeKCI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QSs4WmUzdzdjZ0R3MEZ0NDkyQ25XbTIrQy8yRGt6MVJwSE1obVpMemRtSWtQ?=
 =?utf-8?B?OUVDVVdsZnhVOWJFUE5rRWc3Z214MS9wVWwxbzZmemJsYVJQRllDMlR1M1JI?=
 =?utf-8?B?YWNoMzRSdWQvR0tTQk5hSk5IRzNsOE5nNzNwbG5zTlF4Q1dqNFQrMlAybTRK?=
 =?utf-8?B?M1Vjb2JidG9pNzV6SnhBMGVGUitGaVlocDNTSzhkdUF5TS81enJGeFhhdk5l?=
 =?utf-8?B?cUJlbURIMEJVdHgyMlVVcmpQaVJ0OVZMK2JKMVZzZDdIcXMyK3h3MThhL0p1?=
 =?utf-8?B?cEN5L2FuWXdZRWZ1VTJUeHF5SmNna1I4NmhZaVk2Qjh1WUdmeGtzOTU4c09G?=
 =?utf-8?B?c3Q2L0I5Z2xRckRCdG1DU0U0U3YvVXRiTzE1c0JMOVF4dEtQaDNRcmgveHdy?=
 =?utf-8?B?N2N6UitmTXYrdncvcC9hbnRrRktIWFdKc29QYlErVlAzK2srRGtlcERENlI0?=
 =?utf-8?B?Q0NRMDVVR1N0OVhleEZFUEk5Y0g4bVVBY3c4RnNRVXpFejY5eWZZeFRtR3F0?=
 =?utf-8?B?anVaTktwQ0h6NW1MY0JHb0FLRkFJU2xVK3RHMmRBdkxVZEF1aFVsaVRBTGZ0?=
 =?utf-8?B?U25BK3VlSS9WM2djK2F3ZWFURllsOFRlcDBVRU1PbTlYakdmQ1l5Y2J5enVm?=
 =?utf-8?B?d0ZyYko0UzdUS2dOR29xQVFPUXF6aC9GU0dvNzJHQVIvTjVELzVpWnh2WjhW?=
 =?utf-8?B?OWNHa3B0ZnlWQ2hVV2l6TW91a2tRdmJSOXVySHo4L0pkU0hrZWVhclZGUStn?=
 =?utf-8?B?Z3RwVmVEZkRqUDNJa1c4UnI0VDZpeXJFc3IvTmd4bmdoODlVTDZQVUxCM3Ns?=
 =?utf-8?B?TnJpaENQd0JicVh6QzZ2bkxlOTB5Y0Z0SW1uakhRd2E5TWdxczF6V1laaUps?=
 =?utf-8?B?dzljNWlCOTdiaDdOaU5LT1NBUm90T2FaSzExVmdQaUFUYWhnY2N5R0V4eW9D?=
 =?utf-8?B?VTU3c0RSTlJKWS9ObE54M0Y4aXFPTWM1UzAwU1VwRjZkMWs1R01IVmdoQzcr?=
 =?utf-8?B?NjY1SFdHWU9zVXF6QjN5dXorKzRFSmFRVEdzakdnenFJNXRuL0RqNDVhSFB2?=
 =?utf-8?B?RStpMC9WUEtNZTRnOTBvLzBIQyt1QmNiMTF0WlZHN2hIQmo1Tys5TnBMU29k?=
 =?utf-8?B?Z2MyTVFPS3JXNVUreDJvYmQyc2RheEVFemZ0bytWalZmazFRUGU2Mm50b1FC?=
 =?utf-8?B?TmVUcGI4SkcrbWt6bjRWUlJxWnN6Q2xzTVlXL09GRk9qeWFaQm9kR2VyM3ZL?=
 =?utf-8?B?ejFmY2tnUWQ4Qk9ydW9vdFg4ZUJjaklCKzBydWNNUVI5MHlTdE13MzBCZVhq?=
 =?utf-8?B?WFYyajkrTnNrN3F4YmExck1JVVEvb2dxdWdXV3BuZForTkxKb29tYUVNMzFx?=
 =?utf-8?B?NlJvZ1Y4K0ZlcUhoTklyMEhKbXg1TVpFai9PZEhUR0o0L2FwVzg1aTIzbWxv?=
 =?utf-8?B?WjRoczlZRlVMWDJoWDRMWmlhbm5nVU4zcHBHaTJpYzRNRFFKaWNtMkJrQkV5?=
 =?utf-8?B?WWNCUTM4SHhSZzlmOGJHL2N4Y1YwSUVTOVZqdzBmNm96aVdldVBCQStmRWV1?=
 =?utf-8?B?WG9sVWtPcEp0VEhveWIzZCt6Tm5waHZwcjU3eExnNHRoV1FiS0hFTEVJL3dR?=
 =?utf-8?B?REk1RnBjZ0pjYUFZR09iVlo1d1Nwa3JaTWVZUVVBd1p1bm9BejEzK0s0aTF4?=
 =?utf-8?B?YzF2ZTUzTElpTEo4bUtpbmhkMDFyWEZSQjMyTTYvQlUxWEJST3hRK1ZQa1ly?=
 =?utf-8?B?NFZDYTVmT3FKUEdpS29rams4elFHaFhEem9XT05zaWY2V0lxS1M3QitXcHV1?=
 =?utf-8?B?V2hUa050bDR0YkQ1VS9HZnhKaStaZll6QmNYcDFQUzdSSHNKeVlqQ2VkSURZ?=
 =?utf-8?B?dEV6M3ZKeFlQSG1ydm1qOXdrTG5kM2NkWWVLUjdaTnplZ3hSTWYxT1R4Z2JB?=
 =?utf-8?B?VlFCTEZZTzJtcndRL1I0VVJCSEVlVWFjekhvSDg4LzROdXhkNFYrbmdKM0F5?=
 =?utf-8?B?OVNHZkMvRUNEeXQzNTcvK2laZVFxcUJ0Q2VVUmpuTGxZY1kvOGdGNWNTOHV4?=
 =?utf-8?B?aVVSQ3Jpdk4zdGhGN1ludUlNM3J0RmhITFU0REZlck84cHU1bm9YWUNzTExQ?=
 =?utf-8?B?ejhyUnpDMDRwdWhxaUxndWpLZVJieW8xcnpITXY2SThoTHQ0c2k3dWVhOHI5?=
 =?utf-8?Q?egXMNffiMVenM0IYDIWHpnE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <930A650AF4BE8448B89D701407ED427F@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 93fc264f-451c-44ab-87d8-08dd13c7126f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 18:19:48.4743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2KUg8uVMQdx/0MUnd7He/0sschh/XCtUSZglfBGNiOlYn9IkvhA9ZeSZ18F7LxKbN7Hs13G1/yJ3KFSXJvBC9RPvlgR9OuuX9lzfW1bIMkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4094

T24gVHVlLCAyMDI0LTEyLTAzIGF0IDE3OjQxICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOg0KPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxp
bmFyby5vcmc+DQo+IA0KPiBXZSBjYW4gZHJvcCB0aGUgZWxzZSBicmFuY2ggaWYgd2UgZ2V0IHRo
ZSBjbG9jayBhbHJlYWR5IHByZXBhcmVkIHVzaW5nDQo+IHRoZSByZWxldmFudCBoZWxwZXIuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3
c2tpQGxpbmFyby5vcmc+DQoNClJldmlld2VkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhh
bmRlci5zdmVyZGxpbkBnbWFpbC5jb20+DQoNCj4gLS0tDQo+IMKgZHJpdmVycy9ncGlvL2dwaW8t
b21hcC5jIHwgNCArLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvLW9tYXAuYyBi
L2RyaXZlcnMvZ3Bpby9ncGlvLW9tYXAuYw0KPiBpbmRleCA1NGM0YmZkY2NmNTY4Li41N2QyOTlk
NWQwYjE2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1vbWFwLmMNCj4gKysrIGIv
ZHJpdmVycy9ncGlvL2dwaW8tb21hcC5jDQo+IEBAIC0xNDQ5LDEzICsxNDQ5LDExIEBAIHN0YXRp
YyBpbnQgb21hcF9ncGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+IMKg
CX0NCj4gwqANCj4gwqAJaWYgKGJhbmstPmRiY2tfZmxhZykgew0KPiAtCQliYW5rLT5kYmNrID0g
ZGV2bV9jbGtfZ2V0KGRldiwgImRiY2xrIik7DQo+ICsJCWJhbmstPmRiY2sgPSBkZXZtX2Nsa19n
ZXRfcHJlcGFyZWQoZGV2LCAiZGJjbGsiKTsNCj4gwqAJCWlmIChJU19FUlIoYmFuay0+ZGJjaykp
IHsNCj4gwqAJCQlkZXZfZXJyKGRldiwNCj4gwqAJCQkJIkNvdWxkIG5vdCBnZXQgZ3BpbyBkYmNr
LiBEaXNhYmxlIGRlYm91bmNlXG4iKTsNCj4gwqAJCQliYW5rLT5kYmNrX2ZsYWcgPSBmYWxzZTsN
Cj4gLQkJfSBlbHNlIHsNCj4gLQkJCWNsa19wcmVwYXJlKGJhbmstPmRiY2spOw0KPiDCoAkJfQ0K
PiDCoAl9DQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVu
cy5jb20NCg==

