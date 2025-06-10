Return-Path: <linux-gpio+bounces-21161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 878CBAD343F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 13:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91EE0173568
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 11:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEF728DEEC;
	Tue, 10 Jun 2025 11:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="qjy8o5Th"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC37328DB68;
	Tue, 10 Jun 2025 11:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553261; cv=fail; b=QKqSxJr7DmZsfps2VypP5yQb9T7btTVesEdQa/V2m0uqoSpbcfdJXHi7AyqfsYajPyoeumk9oQV3SSQ+Ywotl+oiMJaGbpG5BuMQqF9U3gHROrEf0HGhpBm0HQtDCJTPX+2dtnc2ot13GBeWfd9/Z+peRpwfQLtWv3OyaAxxD+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553261; c=relaxed/simple;
	bh=4Vr76ZODyiQHBA8zzaHOuMjSyeRhtoOoj8Uxvo63zNY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EYbBNFQ2oD9N46Uy5xorW8Iqod8TEDllLIdzv+zROTXBabne2qSH+HvJG+M+w37LCX9h2Pn4c+Kw1nKQmqILC13q8V1cuVSOUmtz9AnpzDEy0Ywy3ntkPozzG16IZX7vIDN4Tz+1hdqkqN0e5CdUBfli16vEbaUba2f5IGq8eG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=qjy8o5Th; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AAso9J026078;
	Tue, 10 Jun 2025 07:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=4Vr76
	ZODyiQHBA8zzaHOuMjSyeRhtoOoj8Uxvo63zNY=; b=qjy8o5ThgOt6ICY2OYZft
	xuOqQQtOOTuhBF5ztiqB8UEE4bwRXaXST8yeE3vfdmCvtE7f/lP3Isgeq6SeQ1w5
	xIb3kH84BgIAsK0qgrJKI89zpb+4Hn1z4kwKQycuXrLQMIEl3kan8U4l8TDHcr9R
	pSzxui9WZ4ZbTOuGtGgoyWSWHgx7M87r4uoYI2j5PxlodC6Cl3BzBtOnwbNrFe1V
	mo79aC55nKw9gWldUofiwujaEETUcOVwzBT+c97krkyAU0Q/ru6keioj8kIpdzG1
	NVy+DF12BXjEtJU/HkI+VCa/DsLFfZ7YRwB+yeTRAmQt3WJmSltgANu7mtgS2rcn
	g==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 476kcd01c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 07:00:33 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlyHmktzXte6kCasBTt/oaJzMXprMJ5B1MgZEqe7vbPA0xnNvmoA7lNDIp5RxFLCZaFNUXPPCvBsA7Q03wz+KOKyYO2+VNy4nV1bU48zs5KlynI1kp2OFvSc1bP0dwhvPmABGwAs06VXWHzcHkgz20ZAgfJxiRTdeV3NT3qGq8S5Cnr9ueLd2MxX0r2fO2uP87WfnxzBkgpP8bpmiHwGQk1vyRM0BkvjlLGQgH49YAGHk7xNXzXWwDr7y6RWbwRy/OCkhqJl/8rhCkC3CsS2qhHAat7Rt/yozadNchuFTObzeQJv9PB1I3sZ27KWhdfbps/IKS1Bc2hD+GAVoYHVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Vr76ZODyiQHBA8zzaHOuMjSyeRhtoOoj8Uxvo63zNY=;
 b=U+5oKpPDHrAGEj9AUYmjXZ57X7qABByT34UPoEoT396f4UrQ3hLJ96fAOuGjfTRh5QNN1bW7L6Nel61QH5pmnejSc2VCdkWaXwUzKhWhKeFXHrXZivGipAEwlKOiaf1NnqojF6I8WwSKjKABEYf9kUwXvx3x8pAlz0/fIICreQW8vO6X8UojQQBThsnzGfUlsg4uEeYk2Miw0gLyTFlXv3lLAlWo2qfJ4iPoDagItyDLtE+9bCZLufFxhZzzK7/k/vSVjGSpR8Dsq6FItSq8o7RyIZA96w8ba9Fz/XME+OIzLT8MUUaShBuZT2f0PJrypA/dQWmUuEhqjkeOqd7A0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6512.namprd03.prod.outlook.com (2603:10b6:510:be::5)
 by SJ0PR03MB7125.namprd03.prod.outlook.com (2603:10b6:a03:4e4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 10 Jun
 2025 11:00:30 +0000
Received: from PH0PR03MB6512.namprd03.prod.outlook.com
 ([fe80::c8b5:7953:eec1:cb28]) by PH0PR03MB6512.namprd03.prod.outlook.com
 ([fe80::c8b5:7953:eec1:cb28%4]) with mapi id 15.20.8792.040; Tue, 10 Jun 2025
 11:00:30 +0000
From: "Hennerich, Michael" <Michael.Hennerich@analog.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: RE: [PATCH RESEND 1/3] Input: ad7879 - use new GPIO line value setter
 callbacks
Thread-Topic: [PATCH RESEND 1/3] Input: ad7879 - use new GPIO line value
 setter callbacks
Thread-Index: AQHb2euva3K0XzcwukSy48tBnyg+57P8Od6w
Date: Tue, 10 Jun 2025 11:00:30 +0000
Message-ID:
 <PH0PR03MB6512E13B673FE71DAAEB23668E6AA@PH0PR03MB6512.namprd03.prod.outlook.com>
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
 <20250610-gpiochip-set-rv-input-v1-1-5875240b48d8@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-input-v1-1-5875240b48d8@linaro.org>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6512:EE_|SJ0PR03MB7125:EE_
x-ms-office365-filtering-correlation-id: bb2b39de-9e3c-496c-ab7e-08dda80e03e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZXdPdFhhcFZaejNleVZEcVFTWkhEK3ByRWw0S1JDOW9wb0Y4dE8zQVl5RGM4?=
 =?utf-8?B?MURTQ1p0blo2VDZWZ1lMMXZhajltT3BBaU4vc2pSRzQybXIzelJkUHhmQUNr?=
 =?utf-8?B?cElyaUIzVkRBNzJKY0tTSW5EbjJRS3FFdGkyMGdRcGlGc3lwWHZtbUtSN0Fq?=
 =?utf-8?B?Y2hqL0h3SEswTCtQQWRESFlvdEtQL0NNQmN5UmRWamJTbnhkK3MxSTBBdlJK?=
 =?utf-8?B?M00vb2VJdTJiekZ0VjYwcURRT3ZxTW1sNys0UU45TVRzdC9MeVc2NE1kV2JP?=
 =?utf-8?B?d3NwWmlUclRwakEwdzVReDFyaXVKZC9KaGduOUNHTnZxZWl4OXJydG5sb0wz?=
 =?utf-8?B?K3crR1V5YTBnd1E3cmVxM1RuOUwwdjVTcjRISXgyMnNXQjVlWkN1a053NEhI?=
 =?utf-8?B?V1d1Ly9taTFIa2lxWjZUQ0lITy9TcmhzbmRwc0F6YjVySHBJZ2NtOXNjdEY1?=
 =?utf-8?B?UWlsd2V6bGd4QUxuUjNWeVo4UkZWdWplUG1SeGtEVXVNYkdlZ0dvZ0V4MHBJ?=
 =?utf-8?B?L2RGeUtwUzF5eFlrSHVaajdyTnVmbTlGQ1pUQmlmdE5rOHhmR1h2bjRmTDV6?=
 =?utf-8?B?cFlkNU1iOEhxRXkzU0NkM2xuQ1BSUk9HaTlmYk5YYkNhMFJ1U09mODlpd0x1?=
 =?utf-8?B?M3pRMytFOGZGWjkrcStzQnVaZXhhUklmTWFHakhKc1FSdXlyK3I2R0E1VVpm?=
 =?utf-8?B?M1F2S2ovU25vbDV0b2pPczdLQ2pYN1dDY2RwcEdhdUowU2ZXREV6SWcxZmNi?=
 =?utf-8?B?YWxCQ3g3R0NmSm1DdlZtT2w1M3orMnhVMDUzQUIzYVNtZHU5RDNmREhaZjNE?=
 =?utf-8?B?c3A1VitFTFBJTDNFcjBQazF6cERyZjFRR2xLbmdnVjNQRkRaeEgzVHRNdDFU?=
 =?utf-8?B?eEFDYTlXaWtHQ05vRU0wVjJkY1VKTmpMenpRaG9uNk56bjJDNVFIZkdlTGQ4?=
 =?utf-8?B?NlduMHQ3RVBuYmN2K2xmSFVzSGFRQmR3T0lQZTZiMEtrTHhna1JRNDU0Zksw?=
 =?utf-8?B?U0pYMU9LU2VvcVphZVgxa0NnSUc5b2NpaTgvajhCc1plNFFVWlk0djdCaERl?=
 =?utf-8?B?eGdZVE5wTlgrL1B4STdHelN6R0QrRXhid0VMWUh5Sll3ZWZWN1RCa1hUTkpk?=
 =?utf-8?B?TDRQcnhyaTNZODJzL3gzSHdtWTdzTGhUdDVrVzE1WThnRkJXMEZBZDJySzRv?=
 =?utf-8?B?UEU1Z2xmSVY3R0RxYVA1WjRuTERnb25Vdk8zMm1rU2Ivc1RoaHQvUmRtR1BT?=
 =?utf-8?B?U0Z6L1NiWE45M1k0eGZzWWgwTzFZdjdnWjNhUVR5YXJFNWI5aUZ2ZmkvUjVU?=
 =?utf-8?B?L1lla2tROWo1SE1sZEFTYk9BakZYWVMxMjh2UWxmYzJyZWRkVlp2N1BVWWxs?=
 =?utf-8?B?aWR1cjRRTERHM3I1MVdZZjdNcjdPYW5wNkhJcFJRZ0hWNWJvakxZUFhMMGJm?=
 =?utf-8?B?WDlTRG9uSFZYY3dzU1IwT25yc01XTGtGZjNHejdoVytLZGo4T251WVR1R1Zx?=
 =?utf-8?B?MWtMZ0d3UnJCMVZsTEhsa2Z0Yk1Sc3hwbDEwQm5YRVZtZkVka1BkNi9NSlZT?=
 =?utf-8?B?azc4Z05nNlkvOXI2NnBOc3BxTmlBaGV6U0E2WTBacmJSYnZiRU9qMGhsNDVk?=
 =?utf-8?B?Tlk0bG4wRFpKTjd6M0p4U1AxaHcwbXg4RUFqcWVyV3c0a0FZZ1hjMnRsajVU?=
 =?utf-8?B?eTAyR0IvQU91ajltM2RGUEh2NjV6d0hYUGl6dDNvZU8rUHRJTGczM2N2YVZ1?=
 =?utf-8?B?bDJ4d3RQc1dVMU1QenhSSnE0Ly8yczlpY0RlaFc5anpiRERVeXRLdkF0Wnhy?=
 =?utf-8?B?V2tXdFlRVGFySzRZekZMTU5WellhL2ZzbjBGamRQNXdKTDlDR3YrV2JIbVNp?=
 =?utf-8?B?WFlYWmFrQzVpLzFJTUhodnVva3hpQkdWVFNnVVFpUXE2TlFZOWdFUjdJUUYz?=
 =?utf-8?B?eXJMRmRRdlNpWCtPTHFLV3B2SFJnZC93a3ZsbjlMRW5rV09VZEdTdTZ1aXYz?=
 =?utf-8?Q?N0MOKOtAXCdOFYc7ohmf9dZsdbNB6k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6512.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YWJuKzlnSGE0U01aS0trYVUyM0k2dmdKV3dqeTVwYUdjUnZBOWdhRWN4TUxm?=
 =?utf-8?B?Wm5GQnNramFvY2FXRjBncXZQSXFKMDhFMW1wQlQ4VVVOd3VjM2pKZlRWU21P?=
 =?utf-8?B?NUhvZTZET1VHd0tUdWkwM0JNRXorQkEvN2xxRklZRGoyZWtrT2tnblFKMkN4?=
 =?utf-8?B?S29xTGwyMjAyWHJmT1E3NUlvWTNhN2h0Z090T1BlYUVNSGJFME1QY0dZZzNv?=
 =?utf-8?B?Z2RoZlBKL3luRzc5ZTNNNUUzMUxFbjU4T01ZQXg1dGNYeDFZejhFay9iM0Ev?=
 =?utf-8?B?TDRhOU5HekVFbEJXb09iQzBDNWdybmd0QjE4WGxHSGdDVjFWajA5SzU0SXJR?=
 =?utf-8?B?b29YOU11a1h0QmI2S21zWmlhY3R5OHlmMkNMb3M5QTVkb0dXdkVxQjVQVGVJ?=
 =?utf-8?B?d1NrYXU5MXg5YlF3djUzTkNXUU1ZaUJ0MEFNRFRwWldENHozN2NvaGZIa0hV?=
 =?utf-8?B?ZmZ3VC9pV2VrVnlZK0FueWtJRXV3V0QxSGVXRDdQVUpXOC9oZDRyRmZEaS9J?=
 =?utf-8?B?NEQ5SEFNczk1M1FDQnhiaGNZMGU0RkllVzN6T3NWU3Q4L0xhelg5V0cvVFYr?=
 =?utf-8?B?ZU0xVlQrdmZkd0FtdThDTzd1YjVSRkcrT1FhbHF4ZUw0eXFUWGtuOUN3UThw?=
 =?utf-8?B?U0R6NERUaUNoeE00VWxqcVZUbmYyU1NaZ1grWmlVQm5sUjU1NWlYbDN6U29J?=
 =?utf-8?B?bmxIcXlQV3h6T0NXSzY3YklnK3RLdk5CT21yYitoZkFWbnl5R0VqcGpYb1Rs?=
 =?utf-8?B?V2dGYjFCWEFFdE9VNXVHdExQbHpqeFZBMHVMRStLUktxSHVzY0tvS0tQWGNE?=
 =?utf-8?B?cSt1QUVZeTg2SlA4Smt5K1p3cXgwNHphc2ZBSVpVWHdXYmhWZlppd0hQRDh5?=
 =?utf-8?B?SlZtN3Z3WnZGdnhqNzA0bnlmOVYvcWNnZGNHYnIrenNwVE1UZGx5V29XK1p0?=
 =?utf-8?B?TndQUDhsQ1EweWljekRvNXNXSHZxbDhMYURmMGFmaVBxNm1ocDdMcHNRRlRX?=
 =?utf-8?B?NHB4NTgvclZKL1ZGV2l2QldubEttSXc4NmFaT0ZTV0VVU05rWi9GU3laN25P?=
 =?utf-8?B?U1RaWk4wWWdNRkpCMm9ZYmZYaHF4TmRDa2dvWFBpWlkzWGxRZVBhZVFsQWtE?=
 =?utf-8?B?Q2Y4Yi9BelB5UlFtZWQzMjBrRmRmZWFBL29KWWJqbXA2QUxUZnRHTWlLaHlI?=
 =?utf-8?B?cnZlRWhXWWZ2YnNWcWJHRDdWc0R1Y0h5T09FTDd1Nkg4UTFEaEVDUWtTMVBa?=
 =?utf-8?B?a29vOXJFeWlPU0Q4RjdlWWJudS84NG5Xa3VOZkFNa2g1Rk5Mb3cwelpvaXA0?=
 =?utf-8?B?dS8wU0Q0cStxd0NHYzR5Rll6RFhYS3NCa2pjL2NNRkI2TWp3V09IOEZCb3RB?=
 =?utf-8?B?VGlIa3B5eHZGL2R3V2srQjdQSW5ieFVLRkowejFRdjJVYU9Pd0FiSHBUenJM?=
 =?utf-8?B?SDUvc1BHYUMzM3J3R3FHMlVUZ3FnQ01lZG9PQ1Q0K2JBcUxzZm9vUzRWOXpY?=
 =?utf-8?B?MVZqOTg3UnlDN2svdVNGa2JZbEg3dU9lOExxYmljM0JURG9pcTVFeGF3S2Zt?=
 =?utf-8?B?Z08rcnhMZDZYMGR6WktSVE81TXBTQjJydjJNZTlSQlhBNVNXUmhNdkpmS1g1?=
 =?utf-8?B?am5ja1l2Ly9VbVlwcUxOb2RhY3Q2MWZBdFRlaWhZdmxBLytELzVPdzFKQVNl?=
 =?utf-8?B?dUVEekFEVCtnSUNOeFBWcm10TzFuU2lhL1ZhQkFBZHRuY0l2c3N3ZzVJcUc5?=
 =?utf-8?B?dzVrdWxnTlRUNXRwa1NFcDMwbWV4VXlIMmJNWVRLTFJyVHE1emlFZlhwQTBx?=
 =?utf-8?B?aFFYTTQ2QnJOU2JVYWRBeUV0eG4rVXNiQUdyNFU5UnpkZHJ5SWh5NmQwdk9B?=
 =?utf-8?B?RHcvWmlsaFprbWNBa1JyaDFJaXpiMi9NaktPRzl3aVo4Mmp2bTI1R2tqZGty?=
 =?utf-8?B?WHMwdU1mY2hMUW9aeUl5YnpRMlRqQXZqUGtYR3I4QU5wcWFaRGhCWDd6bmtx?=
 =?utf-8?B?d25WT2Z0QlZQaEFHM3VFL2xVR2lLMUF4NTYvaEF2YjRUTWpHdUdLTGVkRGha?=
 =?utf-8?B?MnozblpFdHJ2MUVGODJQYUkzMkxrK2tWTWRsWFZzK24yb2ZhYjg4RUx5OFdZ?=
 =?utf-8?B?dlc5ZXRvNmpaR0lQVWFqamZ1cmVXbjVOYTYwbldUZk41ZHVvbWNGdjIzM3Ft?=
 =?utf-8?B?U0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6512.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2b39de-9e3c-496c-ab7e-08dda80e03e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 11:00:30.4240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zD8jvf0xw/F14Ue3f4dAbv8JVpHJF+0ZiaxJqNaje8ohoQL6WLo0FdwFMwE7ylqQXhIlDsSjZAqlWeJX1ZVceBJxq2Ppv83UdlYj57wsqbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7125
X-Authority-Analysis: v=2.4 cv=Ia6HWXqa c=1 sm=1 tr=0 ts=68481051 cx=c_pps
 a=yRdPyDuw7Sx63jVS1OevmQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gAnH3GRIAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=cdgfygPOYCZXOI56R1gA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6yCiupk01vtmLyaB34r0__F-kZSZYPoW
X-Proofpoint-ORIG-GUID: 6yCiupk01vtmLyaB34r0__F-kZSZYPoW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NCBTYWx0ZWRfXx9kp0N/rqjJC
 /EMFdj4yTxB24MF+7QqR17jvYm9GrwMkQrF4ICUhaL9lqQ5ZGSE7enDnT9KI3+y3zwi2dvZ56LH
 /GDNQmi7nKOa3b7pRrZX38L5LN/0CO1YsD2bez6e/Ya1GMMQWRKWSe1Mg7W6dYPgszlS5LYZB8s
 F0hj+m9QtFwn6yT+JfNXcK8TxrZHhADntWUepBKqWOL5yAV1SExPitYwv25ODaeqmmE4K2OlbV4
 JOa097jv3YuMpZ00PKgCgyrmJ7j+dy3/m2mtVX+/Gv2XutwuXXmUWeBAjpD3ouey1o1wBAwDiwq
 KOiTgtwSi999PufUWUW8fFPxaM0cowOTWVAqZre1MfeVBWXi2dREgRQ4U8fO8Eh4ItWWGn5IH5Q
 HGS64ml90O3UCpw3TuJaR2/duPrEtMdGk5pJjRYw04mrdyvF+DWucmv+UREyD8MffsYGu03O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 spamscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100084

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU2VudDogVHVlc2RheSwgSnVuZSAxMCwgMjAyNSAxMTo0
MCBBTQ0KPiBUbzogSGVubmVyaWNoLCBNaWNoYWVsIDxNaWNoYWVsLkhlbm5lcmljaEBhbmFsb2cu
Y29tPjsgRG1pdHJ5IFRvcm9raG92DQo+IDxkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tPjsgTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsNCj4gQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gQ2M6IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGdwaW9Admdlci5rZXJuZWwu
b3JnOyBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+
DQo+IFN1YmplY3Q6IFtQQVRDSCBSRVNFTkQgMS8zXSBJbnB1dDogYWQ3ODc5IC0gdXNlIG5ldyBH
UElPIGxpbmUgdmFsdWUgc2V0dGVyDQo+IGNhbGxiYWNrcw0KPiANCj4gRnJvbTogQmFydG9zeiBH
b2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPg0KPiANCj4gc3RydWN0
IGdwaW9fY2hpcCBub3cgaGFzIGNhbGxiYWNrcyBmb3Igc2V0dGluZyBsaW5lIHZhbHVlcyB0aGF0
IHJldHVybiBhbiBpbnRlZ2VyLA0KPiBhbGxvd2luZyB0byBpbmRpY2F0ZSBmYWlsdXJlcy4gQ29u
dmVydCB0aGUgZHJpdmVyIHRvIHVzaW5nIHRoZW0uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0
b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+DQoNCkFja2Vk
LWJ5OiBNaWNoYWVsIEhlbm5lcmljaCA8bWljaGFlbC5oZW5uZXJpY2hAYW5hbG9nLmNvbT4NCg0K
PiAtLS0NCj4gIGRyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vYWQ3ODc5LmMgfCAxMSArKysrKysr
LS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2FkNzg3OS5jDQo+
IGIvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9hZDc4NzkuYw0KPiBpbmRleA0KPiBmOWRiNWNl
ZmIyNWJjYTQ1ZTE4ZTgwZmFmYzljYWQ1ZGQ3OGY0ZjY4Li5kMmEzYTVlMDE2YjZhNTQxNjg0NmU4
DQo+IGE5ZWRmOTA2Yzg5MWQ0MDM4YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pbnB1dC90b3Vj
aHNjcmVlbi9hZDc4NzkuYw0KPiArKysgYi9kcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2FkNzg3
OS5jDQo+IEBAIC00NDQsMTAgKzQ0NCwxMSBAQCBzdGF0aWMgaW50IGFkNzg3OV9ncGlvX2dldF92
YWx1ZShzdHJ1Y3QgZ3Bpb19jaGlwDQo+ICpjaGlwLCB1bnNpZ25lZCBncGlvKQ0KPiAgCXJldHVy
biAhISh2YWwgJiBBRDc4NzlfR1BJT19EQVRBKTsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgdm9pZCBh
ZDc4NzlfZ3Bpb19zZXRfdmFsdWUoc3RydWN0IGdwaW9fY2hpcCAqY2hpcCwNCj4gLQkJCQkgIHVu
c2lnbmVkIGdwaW8sIGludCB2YWx1ZSkNCj4gK3N0YXRpYyBpbnQgYWQ3ODc5X2dwaW9fc2V0X3Zh
bHVlKHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2lnbmVkIGludCBncGlvLA0KPiArCQkJCSBp
bnQgdmFsdWUpDQo+ICB7DQo+ICAJc3RydWN0IGFkNzg3OSAqdHMgPSBncGlvY2hpcF9nZXRfZGF0
YShjaGlwKTsNCj4gKwlpbnQgcmV0Ow0KPiANCj4gIAltdXRleF9sb2NrKCZ0cy0+bXV0ZXgpOw0K
PiAgCWlmICh2YWx1ZSkNCj4gQEAgLTQ1NSw4ICs0NTYsMTAgQEAgc3RhdGljIHZvaWQgYWQ3ODc5
X2dwaW9fc2V0X3ZhbHVlKHN0cnVjdCBncGlvX2NoaXANCj4gKmNoaXAsDQo+ICAJZWxzZQ0KPiAg
CQl0cy0+Y21kX2NydGwyICY9IH5BRDc4NzlfR1BJT19EQVRBOw0KPiANCj4gLQlhZDc4Nzlfd3Jp
dGUodHMsIEFENzg3OV9SRUdfQ1RSTDIsIHRzLT5jbWRfY3J0bDIpOw0KPiArCXJldCA9IGFkNzg3
OV93cml0ZSh0cywgQUQ3ODc5X1JFR19DVFJMMiwgdHMtPmNtZF9jcnRsMik7DQo+ICAJbXV0ZXhf
dW5sb2NrKCZ0cy0+bXV0ZXgpOw0KPiArDQo+ICsJcmV0dXJuIHJldDsNCj4gIH0NCj4gDQo+ICBz
dGF0aWMgaW50IGFkNzg3OV9ncGlvX2FkZChzdHJ1Y3QgYWQ3ODc5ICp0cykgQEAgLTQ3Miw3ICs0
NzUsNyBAQCBzdGF0aWMNCj4gaW50IGFkNzg3OV9ncGlvX2FkZChzdHJ1Y3QgYWQ3ODc5ICp0cykN
Cj4gIAl0cy0+Z2MuZGlyZWN0aW9uX2lucHV0ID0gYWQ3ODc5X2dwaW9fZGlyZWN0aW9uX2lucHV0
Ow0KPiAgCXRzLT5nYy5kaXJlY3Rpb25fb3V0cHV0ID0gYWQ3ODc5X2dwaW9fZGlyZWN0aW9uX291
dHB1dDsNCj4gIAl0cy0+Z2MuZ2V0ID0gYWQ3ODc5X2dwaW9fZ2V0X3ZhbHVlOw0KPiAtCXRzLT5n
Yy5zZXQgPSBhZDc4NzlfZ3Bpb19zZXRfdmFsdWU7DQo+ICsJdHMtPmdjLnNldF9ydiA9IGFkNzg3
OV9ncGlvX3NldF92YWx1ZTsNCj4gIAl0cy0+Z2MuY2FuX3NsZWVwID0gMTsNCj4gIAl0cy0+Z2Mu
YmFzZSA9IC0xOw0KPiAgCXRzLT5nYy5uZ3BpbyA9IDE7DQo+IA0KPiAtLQ0KPiAyLjQ4LjENCg0K

