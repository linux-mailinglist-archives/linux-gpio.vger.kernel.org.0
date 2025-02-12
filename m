Return-Path: <linux-gpio+bounces-15858-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD7AA327DC
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AE783A1515
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 13:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DB020F075;
	Wed, 12 Feb 2025 13:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="lMnzlQHx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-0063e101.pphosted.com (mx08-0063e101.pphosted.com [185.183.31.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E420F078;
	Wed, 12 Feb 2025 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.155
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739368720; cv=fail; b=UlhGjfVs6EI/CblyLzvTBxCN0L4+lQ4ieGUfpoHcQj/T1YCYQuDLPEm2kRaycBIj4AhltWNBB15fYLhqXVmrkwW4zLpcXskdayY6ewS/ZHUOSiSGyN8euflylyZ00QzlTgpK1Sdy73yp021k1eA70hxmScG4m56oT/RWqh4SCtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739368720; c=relaxed/simple;
	bh=iPEhy3unv9ZkHSMwuaiQmby1r+Z0x2aFY4zaN0noZ14=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z0rSGiMUaPPLhmz7PgWQJ2BtPj+D/nNI1BjuT6aZ7ojWgUbyxEBMMZNmncLsifxOTRmPE9sSAZhRFL8GY5GCquvqTED9kYo9awBj0YZtrkwJRSMI4a8CCtWnCmamdsE4GpL4K7Z57imjazehrXmOwSPIzoAzRd2C8jwyVc5y04o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=lMnzlQHx; arc=fail smtp.client-ip=185.183.31.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247494.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CDLggo017194;
	Wed, 12 Feb 2025 13:46:59 GMT
Received: from ma0pr01cu012.outbound.protection.outlook.com (mail-southindiaazlp17011030.outbound.protection.outlook.com [40.93.131.30])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 44r9at0dfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 13:46:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiH1cTuZvccq5eenuQFlYA2d79BPpLKuQl7E0Vr/dPYI92XHN1DtXTgqaN69FWrxqbvON5xeGMkCTvOIBkt5xkds7dU81UFii5hh0IH7Jm/N7pKZhKyBugerFAZJxdbYys6zmw01xxupOZ/9szx0ZCxv2rA974T1jzKkybaEMEJYQPZywHSfjLI7uwtnzIFZuFt4lurj1HTrsjlmYTVf/zHfikQDkJVLQk7Dt2gSeDp31MMyrrCq+R2efrahG0i0tIwEmSa9v/LDDfnw2c0vy4NNnU/lGzJDJ1/z0/bjTk3/ivoQFJH6Jju4cRk+hB9ShC46KZ/cV901+9ecNeD+JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPEhy3unv9ZkHSMwuaiQmby1r+Z0x2aFY4zaN0noZ14=;
 b=uFNV8Lq41bTJrx3klGwgiH6trPzW7DcdAhR/J22r+g3V+WulOuyl02OZkoUzlJtE7c6Z+AvZauJc7E3TCWcL/eB5RCWUSK3qaUVOYFHzQluNIyi2XhdpHIG9N1JKhLQA3Rv/mrGud0788KaheBf9oHCXLcWaafEWruE4QAhdXY0OLvR0x1BYZrSC3x82QQeTuG5roAiJx0mRZuBNsKQlHSgSdKYQYvdGgFzQ+bbrlt2ibPw5UghzILnxeHynb7raLaZ46LKs4sZReNpokDWkV0l/TrS+EJ+Jql/S0IWZGctG5Se5M0hZndFOuaHD+5I2V7p4Q0MJ+fx4dSOmyviStw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPEhy3unv9ZkHSMwuaiQmby1r+Z0x2aFY4zaN0noZ14=;
 b=lMnzlQHx9IznT2ZfgWUY5WstwrdaXdPZ9ocYF/bArycka1cPUBgaewdJUyz+Hp4Rvnzp38+FUwTlHZ51fy0bVvz58ep/8V4quWgWkX79rHbiBRushEkOmSTOzYGOo5M8/i329PVRie06x5gJMbtmC9xDEK2ZPfPCPmrRQ5DR/HE=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by MA0PR01MB10196.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:127::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 13:46:51 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%4]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 13:46:51 +0000
From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Neil Jones
	<neil.jones@blaize.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        Nikolaos Pasaloukos
	<nikolaos.pasaloukos@blaize.com>
Subject: [PATCH 1/5] dt-bindings: Add VeriSilicon vendor prefix
Thread-Topic: [PATCH 1/5] dt-bindings: Add VeriSilicon vendor prefix
Thread-Index: AQHbfVSR81zBZG4K70+B+VdIWNDmeg==
Date: Wed, 12 Feb 2025 13:46:51 +0000
Message-ID:
 <20250212-kernel-upstreaming-add_gpio_support-v1-1-080e724a21f3@blaize.com>
References:
 <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
In-Reply-To:
 <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB10184:EE_|MA0PR01MB10196:EE_
x-ms-office365-filtering-correlation-id: 6d560761-0e9f-4c9e-bf25-08dd4b6bb437
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R2JSek5wTXhPcGxEQXZJeDJWUTNJd2lLd3V1OHhxK1FXdDVLY2FUbUMxTkFq?=
 =?utf-8?B?NFJlZ1FKNTZlVHYwQ1MwNlpNZkFFcnFEanRYdGoxUXQvZlZzOElVK3Y5M1li?=
 =?utf-8?B?MmRucjFIU2xxekk5RVk4eGxnUmpNR3hKOUUxSU0yb0N4ZjA3UEhuU25aWTZY?=
 =?utf-8?B?YnY3UlBDOHV2VnQzUnIrbG5qTEdqeDE1NStMcFVoMHcvcjhjNE9DMDV2czN1?=
 =?utf-8?B?VmNLZ0ZiRVNXcVVWQnY2VU9YWU1UUXdXOG5NZThMeFI2Y3R6aGtkdThjT25N?=
 =?utf-8?B?TCtNdkFUK3l5MUtjUUl2Mmd4OEVQdlJXMHkvWmpvUGQ0bkpSaFpWR3B5N1Nm?=
 =?utf-8?B?STBDQ2wzVXZKSzNBdzlqWjIrNVVkNnFFcjFXamZXY1g2aDRzalNFUFQ0enJR?=
 =?utf-8?B?RERHWHhFQkFueUdKRmRhLzRSVllNVk9WbGtoUml0RmJJRWhnUjhLUVg4VU5p?=
 =?utf-8?B?ZlVMZEVQMFhMS2F2R295Q0o2anhjRHVyTjhFcjJjM0xlMnpnR0xncXJpWTM4?=
 =?utf-8?B?dEVyTS9LK1dla0xKa3N3K1lvTEo2UHB6WCs3dmN4dEdERGY0ZTJ4RldlSDRk?=
 =?utf-8?B?QnFqK0M1K3lIT245eEs0cDRGaGsxU1BibEVEUUR6MXk2T3pUcmhpTS9kcjdo?=
 =?utf-8?B?UUg4UU5TTU5vU1EzcUFPdVg4eGpySXFqbG9kUXJGSkZBNTBMUzJBUTZHN1lD?=
 =?utf-8?B?N052NlFxUS9KMU9YNXZvWEc4NEtxL08xNTNtaExpcEUxTllLcWZsNk5sQ0Na?=
 =?utf-8?B?Mlh0c2RWazhKV29nakt6RWpOcmlRWXY5S3FqNWpmMVlUaExrdVRKZDZ0eWxr?=
 =?utf-8?B?NnNUc21aUzZsTEhTSWovSVVTZUlMNXd3VDc0L05oWFR6eWIxUlB2WlhMN1ZI?=
 =?utf-8?B?UjJxN3d1SjF6YVp2U0VLTXhHMTEwcE5EZ1JZWGc5YVlwaTd3TjA4dEFhak1B?=
 =?utf-8?B?WWlCb3dDcGJwUXdCRnpxM0JzR3VTdFFJbmVyNUtacFJ4cUxrcVRLVHJOYS9D?=
 =?utf-8?B?TThCK0RjREpsQzhBN2VLMXMya3BOU3YzL3d2RVNlWlhlZFF6Z3ppV2dRdjZv?=
 =?utf-8?B?bkVVTTgzN0lRZi9Vd2hVYVF0blhna2tzN2Z6TFNZekZiU2dnUFlPY0lUWVBi?=
 =?utf-8?B?RlJIY1hLSWVPcVduTE5Qd3dVMzFEcVBpK1hSWUU5Z3pnWG5wV3E0MUhjOE41?=
 =?utf-8?B?Z1Zkb2xVTHgwQnpPaDEycnZTWFZneE9hd2FjMTJMdncrSVhCVFNWUk42V0xj?=
 =?utf-8?B?T0JKZitvWXVwTnRHVlVIcDE0c24yd0FtWXZiekpMZlppVkxMR0gvNTZXeEdJ?=
 =?utf-8?B?VW1OQWd0ampIT01jQys2Z1YrbFN2eDdTQS9TcTA2TFp2T2dmcXB2azJxa3RM?=
 =?utf-8?B?dERQUS80NVZLZVlEQnlxWHRoV1E5b1lGQ01Nck51bjNSWnhMOWcwRmhHd3VZ?=
 =?utf-8?B?UFhnUU1FbzFoWUZ6Mk5JWjJtMWRnR1QxOWJMVFRmV2hnN0U4emFlSGpTRTR3?=
 =?utf-8?B?M1hjRWhZTjYxVXRCUzNkMkhhWXRzVUNsRTRITmZGMTJObTRDcjlYUU5BQmFu?=
 =?utf-8?B?MmovbHNqV2lZMFhYV1lLdEZlVXg4U1U4N2h4MXFTMXIzazl4TUNZcFIwRWlC?=
 =?utf-8?B?Y2owRjJFWU9jcy9keU9LT0U3dmhVNDdXV1RUZXBHVTFibE1taW5NR3Z0R1RQ?=
 =?utf-8?B?K1JvL2NFSG05NnBybVZrWTRubjFEd3IxZU9yTUw5bU02cUs2Q29EZ28rN3dT?=
 =?utf-8?B?LzMwYlF2c1BSVFZUTHhsWWRwcFZNUHBXTkF0SUFXd241aFMrRjYyZWMwbE9T?=
 =?utf-8?B?MVRPRzZZVmZoOU9QRXVtayttbEp3Vmwvc1JHcDlQWHhyV3Bva0dGS211QW1i?=
 =?utf-8?B?NEoyTi9QNHJvT3RwYmZPL3ZwTTRxWXR1TDQ1aGZTL3dycDVsWXVTWW5hQVU5?=
 =?utf-8?Q?F8K0AXs5eMrm6stKLHT8eoQmU0xf+Eps?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MFV0ZGxnOVNVVkhUd3FjQTdtbzQ3ZEo5UGhEWkZqRkFxeFVmR0ZQbTc3N0NU?=
 =?utf-8?B?N24rZXJNd3U0ZEs2YVh6SjExT3Q3N1BiUk92OU5ZMjFOWXFQL3F5TDU4MDVy?=
 =?utf-8?B?ZXpTR25mbnE4d3JjZFBGWWJ3cXZmTkJwRjJhYks4ajdJZjhrSVk3NCtRNGFN?=
 =?utf-8?B?dGJmbHF0bTZNaUJMQTIwZ2FsMEUxMi9WMTZRc0ZGT3ExT2cxSnVxYnV5eHdX?=
 =?utf-8?B?RFpVL1JKN2RIU0VtVHBnNmFuSk9ONEtycUhFczkyNVh6SmJvOExSY3p6K2lZ?=
 =?utf-8?B?WTNyNDVLdWl4Y2l4LzByZWZSeWg5VnBFSzVXY2ZkZzlnanpzV2ZiYVRDelVX?=
 =?utf-8?B?WFZ4aTNxRndGOTFhQi94TnowMDUvYWhDbWtDc045WDllZm1QM3VzeDJvN2Ra?=
 =?utf-8?B?aG9ERXV2RzZtZHlSc05DdlIrNDA5c3FLekx5d1pWRGFzVG1qY3VPMnNOU2FM?=
 =?utf-8?B?b3NZaDNPNGFQK1Nwb2lGaEhScEJuM2N5SFdvcUlHWUI5cXM3UHhzUGdwalFY?=
 =?utf-8?B?Q2p5M3FBS1VicmZaOCt2amhzanF5QjZIcm5vYmtBMHZ2V204bUVTaExlYWR1?=
 =?utf-8?B?YUxCQ2Z1ZnBDbHZiaHAvZyt6RHBtbzVaUjFTYnovdktNdERDb0lWNGJKcXdT?=
 =?utf-8?B?dFpJeXVQTHdkcG5BL3JnbzlWcmF6aFo4NFBvUVg5M0x0UjVqVnI2cnFvM1kr?=
 =?utf-8?B?V29ycTFqb202cFVjZG9vYUFiNUtVaVlmVTNsY2w3MGRJcHA1TjZGdnhiVCtm?=
 =?utf-8?B?VFhES2svVG1SQ2JiMlE0L3AvOU1ZNkRMWFk0bUxpT1o0MVROcEhTM0hkbEVa?=
 =?utf-8?B?NHViSDZyNVlPVmUxd2gwcE9sZSsvam8zaDcvYjJka0N0a0p2ZTRjUy9SYlpW?=
 =?utf-8?B?TE9oVkxUNXkydVMvdVZoK3BVOXMrdjZhNnV0VGZrcFFqYjNNVkFWQTE2N2kr?=
 =?utf-8?B?WE11TEhWZmhFM1FQUzhQRHJZUHRiNVNxalhrQ2dMUkNjWllqbE1UWHhjY0NG?=
 =?utf-8?B?NXlQN0NIU3ZidkVudkU0cjA1RGt0bm1la3V5MWphb0s0S1ljRHZxcXE4TmVV?=
 =?utf-8?B?ZE9mNTBkaHRpQTNqNTZOYVBnS0MycWw4QVFpWmxNNkMwbENBQzB2a2NaemNt?=
 =?utf-8?B?T0hMdGNndk5lZllxL2w2aXJ1SnRlZkgvWnFqNXJwVDEwRnp2a091TXVBcklE?=
 =?utf-8?B?cGIxd1F5c3MzKzFFSEQ0QWRTOURQSFFTaS9Qdzh2Y1R1dk5HZG5ETUtoeTht?=
 =?utf-8?B?VHk3KzQ3Q096UXpoZWJHdmRwekJhdG5hcXBreEVjUk50VUhXTHRwdi84Uloz?=
 =?utf-8?B?dXY0akFhVS9wWnhhc1QzM0JMUEQ2VjN6dDRmT04rNmpKZ2lhby8rUUhpdkNm?=
 =?utf-8?B?Uy9tMHhIMjdGdkFNSHdYYTdpcHhrWjRpSmZML0tzamZwZUVtUTNNL1FzRWVT?=
 =?utf-8?B?dTFGQms5UlJkZmRTempjUGNKT252OWNFNmpvdHFKUmtUYjlFMnlPWkp0Vzdx?=
 =?utf-8?B?Um13cDR6SlFvdHM0U0NMdUE5WkNuVkFyM1Z6NnBqUVdFdnltMEt6MmdWajdh?=
 =?utf-8?B?bDJ1RHJHT1FGeVBTU0tpYTdwZC9makVvbjh5TGx3MEdnbXFaNkhpMThRNkcz?=
 =?utf-8?B?QTdPdkJHcTFwVHpjV0FmSVpqbkJMUE4wUmR2d2hlRzlxVjdIUnJ0U0R3V256?=
 =?utf-8?B?ZCt6bFZlUmIyT2NiWXBEQWVxTVNBNDYwa0lWUzRZY3NKVGZ1eHN4cWxTNDI5?=
 =?utf-8?B?ODhGS2N4amVYVThnUXhMZFgyTkJ3RWkwNVlBcDNyeWVNMWFDTkZ0YTJVcjNv?=
 =?utf-8?B?dXFka1lRZ3loeVlZbisrQTNvK1A3bk5JcGI2OGhJZkpLNk4yMUwzYnZiZm5s?=
 =?utf-8?B?SksyTG02VmVmRFNHZnQraFIwVlRpQjRzTGxTUkZ1bkRMMEIwT2kvYzdXUExV?=
 =?utf-8?B?UnFkMXluWko3c2VhdW5YM2ttTzlxaWhVb2dOWDdrU2ora1J4VDlEczBrcC9t?=
 =?utf-8?B?L1YwblJTY2xKLzIrK2pwZWVlYi9UUWpvbml2cnV2U0ZmL2lyQjRRc1hlVDl4?=
 =?utf-8?B?NzAyQ01PRkJIU3RwbUdab1BxUlJaR3grUGZNN3NveWdmSFMxUkNyZit4c3pp?=
 =?utf-8?B?OUhKTzFjQ2RJZHNOM2M0b3VzWDZ3ME42YjQ0OWFTYmgyK2NocFFXOGZ4d2hq?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0308E47AADBF043ACD8AD700E8C2E86@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d560761-0e9f-4c9e-bf25-08dd4b6bb437
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 13:46:51.3582
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C2QSolOlqMsL6wO5QbmT3oh31G/u4XtyK8uE+vEsJoaOkMsZy7gIT+sS321qqydNWrDwlZOCXa9l6f3iqZ+Xpz8IDv8Q8piKc0cWPkyXpag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10196
X-Proofpoint-ORIG-GUID: liVMx0ctbwm5F_TS54kiOM5al9iUFCJ6
X-Proofpoint-GUID: liVMx0ctbwm5F_TS54kiOM5al9iUFCJ6
X-Authority-Analysis: v=2.4 cv=YatH5xRf c=1 sm=1 tr=0 ts=67aca652 cx=c_pps a=YuR9wxGk6pucJSra5CpfIw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=4MthsM0t3ikA:10
 a=-5LYVjoNHPMA:10 a=SrsycIMJAAAA:8 a=WOQFmDZJCxq8cBIZgTIA:9 a=QEXdDO2ut3YA:10 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Reason: orgsafe

VmVyaVNpbGljb24gTWljcm9lbGVjdHJvbmljcyBpcyBhIGN1c3RvbSBzaWxpY29uIHNlcnZpY2UN
CnByb3ZpZGVyLg0KDQpTaWduZWQtb2ZmLWJ5OiBOaWtvbGFvcyBQYXNhbG91a29zIDxuaWtvbGFv
cy5wYXNhbG91a29zQGJsYWl6ZS5jb20+DQotLS0NCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgfCAyICsrDQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sDQppbmRleCA1MDc5Y2E2Y2UxZDFlOWUyYjUyMzEy
NDM5ZTRiMWQ0OGIyNjIyMDBjLi4xNGRmZWZiZmZlMDUxODBhNGQ4YjYyYjNiNTRmYzI1OTY0ZjU2
MDI4IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRv
ci1wcmVmaXhlcy55YW1sDQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dmVuZG9yLXByZWZpeGVzLnlhbWwNCkBAIC0xNjQzLDYgKzE2NDMsOCBAQCBwYXR0ZXJuUHJvcGVy
dGllczoNCiAgICAgZGVzY3JpcHRpb246IFZpc2lvbiBPcHRpY2FsIFRlY2hub2xvZ3kgQ28uLCBM
dGQuDQogICAiXnZzY29tLC4qIjoNCiAgICAgZGVzY3JpcHRpb246IFZTIFZpc2lvbnMgU3lzdGVt
cyBHbWJIDQorICAiXnZzaSwuKiI6DQorICAgIGRlc2NyaXB0aW9uOiBWZXJpU2lsaWNvbiBNaWNy
b2VsZWN0cm9uaWNzIENvLiwgTHRkLg0KICAgIl52eHQsLioiOg0KICAgICBkZXNjcmlwdGlvbjog
VlhUIEx0ZA0KICAgIl53YWNvbSwuKiI6DQoNCi0tIA0KMi40My4wDQoNCg==

