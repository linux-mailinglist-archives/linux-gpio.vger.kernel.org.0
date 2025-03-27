Return-Path: <linux-gpio+bounces-18061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F4FA73027
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 12:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F1CB3BF7B6
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 11:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27759215781;
	Thu, 27 Mar 2025 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="dMXTv7eV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-0063e101.pphosted.com (mx08-0063e101.pphosted.com [185.183.31.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FEE21516A;
	Thu, 27 Mar 2025 11:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.155
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075524; cv=fail; b=QToqexALIG0pBWSmyFG7seMFpEoMnVOhlO+EHVubzs75ZC3vgZCllxlElGVCVcZ+U+86aeYyxPZ5EmhQUvavcLWovhdA0Vm4XnN/B5sxUaxEJPnkp6dfukVMwOe6GfAUMJJSAGG0eC32cJcqKZMTf9Z5ds0lH4fLol8ZsM1GoGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075524; c=relaxed/simple;
	bh=SnBK5n9qKk/7KSlktWAI3Tj/znrldYWlNcUlWHYml3U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qi2X8EW8oVfIea5YGnDmjILc/4kJNTZEHq6LVaF6HsXNfIXyKdUhINOs2hDLf5nlIXvUj1pTvFrsosXV6eYg8XiprTh0Jz40FVH5a1uKouuuEEoZOYbD13qtfY1Erf3cp85cPj9pO7bDERsyEp9LMIqVevHRPeY+pQMSj0jJO6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=dMXTv7eV; arc=fail smtp.client-ip=185.183.31.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247494.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RBQgQE001632;
	Thu, 27 Mar 2025 11:27:25 GMT
Received: from ma0pr01cu009.outbound.protection.outlook.com (mail-southindiaazlp17010006.outbound.protection.outlook.com [40.93.131.6])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 45kwsh0ty9-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 11:27:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q22KNFmkMynCvzUdVRQBd5xT0FBLvv/IBEsKIDBfZkgkq4Q3FsPEn6Rsh+LOAT77LD/SvESX8iUmRhrQOkVmMIMn3OTj5H36tzxy5MrbQb53agP3kfkCqo0oPr9QwLrOUhIjyluanRHFFmKjK/90TsISRmntZJGdqiKtnTGB/DzBjbY4QvUool5VMOTymDcO+Wk73B+/uoT7lmoIAArE6KfMQYiZQei+EXlDIybmgy7UDnYL+6JME/6lHsxabNHgHFs3dGB3EpjI9AYF4yXt0leKgCB6CVCfEGEYMrN6KYHzUoC9424rLSs4Q7jBdFEFZ+gk7ogcUsiAVw6yeK/uMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnBK5n9qKk/7KSlktWAI3Tj/znrldYWlNcUlWHYml3U=;
 b=nzQf7z8bnKkQSjOvMgbTeNHHJnrmghR5i+nijGTUnJf90SXx1VjqZwh9xSxIt5nT6lp09xo2Ew5tzo+KyG7sRE6n1BkwCdacQw+1KFHO8DRxIg4mzR85ZSC9kQZEScYNvdK2BeJEEuUYb+sk+uoGEoGPwbo+Mab0DIR751hgdeqimiPVHVE8MhXo+S7TvCwYRarqRhTu5Wwb1VOr+cGKVz1dpEXXz9rzx7Ahn5FEiea0QP73h93s7aOjmLW+XaSlIturnII6zDF22cmNyqPpBswHX1r5sePjod5vBvp7bhYqCf3d3U/vuIXlPYKTpkXNfiK7qp33vtT5wuW/QwHC/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnBK5n9qKk/7KSlktWAI3Tj/znrldYWlNcUlWHYml3U=;
 b=dMXTv7eVoUm4xdjGTi25IjRXIHHVVtWA7JoMVXZgSvaxqPQWPtpcv5URbRyiphtr4cw9ZFy7/KRPTCo2ofPnjxNucRZQ6lp9DEjLFQE0ajNozodMLd60stED6bX7glOIS1OSqUSuSZvl1ip6upL8ueq0sabISSDNRC7Sgifj2UQ=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by MAZPR01MB8910.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 11:27:04 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%4]) with mapi id 15.20.8583.026; Thu, 27 Mar 2025
 11:27:04 +0000
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
Subject: [PATCH v2 1/3] dt-bindings: Document Blaize BLZP1600 GPIO driver
Thread-Topic: [PATCH v2 1/3] dt-bindings: Document Blaize BLZP1600 GPIO driver
Thread-Index: AQHbnwsq87fV8UldSEm/ELp3lwU1VQ==
Date: Thu, 27 Mar 2025 11:27:04 +0000
Message-ID:
 <20250327-kernel-upstreaming-add_gpio_support-v2-1-bbe51f8d66da@blaize.com>
References:
 <20250327-kernel-upstreaming-add_gpio_support-v2-0-bbe51f8d66da@blaize.com>
In-Reply-To:
 <20250327-kernel-upstreaming-add_gpio_support-v2-0-bbe51f8d66da@blaize.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB10184:EE_|MAZPR01MB8910:EE_
x-ms-office365-filtering-correlation-id: 18922e31-4eef-4b42-7054-08dd6d224cf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?VUlYa1JLaU9renhOSW5NcHFKZEFVNnljQjl6NDJ4WklmTGxSMnZEeEY5TGhM?=
 =?utf-8?B?WnM5ZWRpcjdET01MMit1RzRUZzR1amRlYVI4Zjl4aytCdFIxQVVqMjBMMWNX?=
 =?utf-8?B?VjFxWnNocmwzTFI2VkIvOG5LVDF1TjVxTzJpbUJ2aHZvSTJjYlcyOHpWMU85?=
 =?utf-8?B?ZUN6bEd1QXBvdVBOUWRzMHlxMGlHb3R4VXZUVXhxWmljbVkwKzYxTnp4Nms2?=
 =?utf-8?B?QmlRbGdvZTlxUTRiMERTUXZreW1FcEZrZjl2RnhtNEFWcmwzNUZLR0RwUkVB?=
 =?utf-8?B?c0pROG96YVhVRjFJa3dlMFBYQnI4NDBuZVdQNmRmZ3JKUitvZjFKOUxsM3dI?=
 =?utf-8?B?Vm4raXBtTHhPdlZ2Y242bHN6SDdWR012K2d6dVEySkNYeURjdFNESTJmcWJY?=
 =?utf-8?B?STR4UVVJc0ptVXdlV0JBZXRNREZQUXFLSmJueDIrMkxJQk5OS1ZEblEzakpY?=
 =?utf-8?B?WDU2Q3VyWlY4L2hTWlBHQkkyQWRudVlPaWJNSjZ6UVBBQnp4UHErNXpjWjJD?=
 =?utf-8?B?QWIyZ1pkc3Q1eHQvR3ZlV3FLcy9odGpMSFNHc2tmd2VxbVdsa0RkT0dxRkpu?=
 =?utf-8?B?SDFOYlZ0OTNKVExvR3ZEYXJhU1hJZ3k2a2EveWswY0VXdlZoUDg0NEhmbHJa?=
 =?utf-8?B?ZEI3Sm95Mzg2TldTTEdQd011UzFRY25ZMjArdXVnck5mMVpUNDd2ZXRKSnZC?=
 =?utf-8?B?cTVIcGxnc1BaZzR1NDdsSU8rMSt5SEl6eWh4dnNLV0xFTTBGTFZPZWhPQnQv?=
 =?utf-8?B?MlVkNUJkVlFmdllpKzZkcENUMVFjNUNneC9KT1gzbHJNMDRraHNQVmc0RTJu?=
 =?utf-8?B?N1NlMXRQcEFIK1ZDRmMvSDZRZi81eG16R21MUWV2N3QwQWpaMG94LzIyVEY5?=
 =?utf-8?B?enViUG0vNGVKUDNGR3M0OTRBMGtRZ1AvTXU3cE1SRDViZUdXQ2RQN0xZY2h0?=
 =?utf-8?B?dSsyRFI1bk8vVE9WYTZOcGpadWN5cTRkdFNoRmNwR21BeDZYcUNtVGF1WGo2?=
 =?utf-8?B?cmVQd1IvNmcyM2djeVNCRW9iTVplQWVibXBXektOdCsxN0pSbHh6UzBEbXhC?=
 =?utf-8?B?L0VGdVptVW9VMDNJQTA1VWFIVUlBd0RWUEoxeXV3TVg3ODl1QnRpbHhtUjU0?=
 =?utf-8?B?VzNiZTZTVzhCa1JPNGZtNmF3MDMwdmFOZUNmVFliWkF2bFdBbHpRbnhwN1lI?=
 =?utf-8?B?VVlmRlg2Z3dueTVWV1h2ZXo5dnNZRVZ0aEFIaUJHbEtKcXFCL3U1U3JsRlpo?=
 =?utf-8?B?a2FQbHd2aCtiUzJlcFNDeHdpSjN0cTBOdW53b09nS3Q3N2pNR2diQlJrSDFB?=
 =?utf-8?B?Q2hoSlc1RnRvT245M3UzUnFkb3BFYUpGMmQ4UmU3a2liNFRiM0JrTHlhQitP?=
 =?utf-8?B?Y3NjVGI1ZzNra3VrcU1VejhQNGV5TmU1Mk5BbmVCb1JodWZmc1RlNnpRd1Jz?=
 =?utf-8?B?cWdSNkZtTWdVMW5OQnY2eU1TaVkzNThXOVhHb0pJVGxWcnQ5VFNWUDJFY3pn?=
 =?utf-8?B?Z24wU1YwMHFoVWQ3UEpGQVN1aS8rT2taVXRZK2IwMWZXVFE0dkw5NlJzbWYv?=
 =?utf-8?B?N3ZRZUhmdFBpbUIxUEF1T0I2ZDh1SGdxcW42eDlGck9FaHZaeTZpS3BITElG?=
 =?utf-8?B?NjVhSDN0VDJxVTMzS0pxYmlMN3VUcXlReHdIQTlWNzFHT3BycDExMm5lNjZC?=
 =?utf-8?B?Sk1oRGdkWVF2bE9KYWw4Z24raXRCZ0tZZklVL2lUajRpMjJvZnhlZDRtZ2Qx?=
 =?utf-8?B?aFBKdG5xREFnZGkzYWxRajk1MXE4ZWxlRGJaTWw0YmR3YkRMSnhMTkZET0NY?=
 =?utf-8?B?aWxLTmJJUHRiNmpzVmFneGFnSjlGQ1huSGVsSjkzaERaN0pBSHYvdjZRc2dW?=
 =?utf-8?B?SnFuUUViNjhwMjMwQVJxOUx3bTZ5dFlOR2E2SnYwMDlUblE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S2VyeXpmQTZCSXFKWFhUMWpIaWZ4WFBlWTJNMEtBU1JNWVl0dWZ6eUdBVGU3?=
 =?utf-8?B?Q0ZudWM1K3gra00yWVkxeEZKQ0hkNWkydmprYUJBYXFPclM0TmZ2SUlmc1NX?=
 =?utf-8?B?RFowZ0JIMVhtRWM2NTkzejNDdDVYRXVOSTF6ekJIcjlaMkRNdHVIRkpKc3FH?=
 =?utf-8?B?NU50aTRwNFBNb3lIQzBvUGtSWjhieDVHMXFCQzhDdzBPV09vaktmWWhtR3NE?=
 =?utf-8?B?UUxTeUMzMmFvMmlWbFRvMTFvcnU3a1NNOUlCMzBLWnl3Qi9Sa1l1amE0Rmwx?=
 =?utf-8?B?RG1OYTNSRTNRRXVlZUdvNnFrdk42Skk0K0ZDcExYaEZKaWhMdTJscCsrN0pQ?=
 =?utf-8?B?RUZ5ay9adm5zRksxbFYvSWxGQXhFM1Z1eTJwbk82ZmcwMHpsblNuUzdCek9i?=
 =?utf-8?B?ZU05Z3Q3aGh3SzhrMTNGRW5VQWV1eFhOMk92ZnhHV2hQRkgrV3RvS0NTUDNQ?=
 =?utf-8?B?S2g4MTVBZ21VRUhGdC90TVpoT2N1SW5RL0hGbWpBbWF6QVVuRzhWcmRWT3Yr?=
 =?utf-8?B?QmxMeXV5cVdqdUJ1SjZIcHExQ2xwdDlmbjF1V1pVREJWLzZVR0tOM0JrWGNS?=
 =?utf-8?B?bjJkRjkvazQxeDF5ckhCSGwxaEo4QUpoOTNVOGp4b0dmaXhOQnY5Ykc4ZERm?=
 =?utf-8?B?Nzc5ZXJ2d2VjVUl4TFNSWXhDbkhrbWNBN251VkZQakhFaFp2NXdVTk1RQ2R0?=
 =?utf-8?B?VzJreXJtUnRzOGNYb2U5WVZlT1pjaTk3czhKS1JUbXZUUXBJRzNiTDdVWDBX?=
 =?utf-8?B?MUR1NDdIdElCOWpob1BqUWc5UHIveU1hMnhIOWF3bTVQQmZjcVZCa2VIV3Ra?=
 =?utf-8?B?VGJjR0dreXc5UjBWZG9mdEN1N2NNSmJNbUlCQ1lqQkJqQUtiNHN1VTZhaGZy?=
 =?utf-8?B?elZqZ3VQR3ZIZ0NJbCt2QkJacEkrbmVxY09wYjd6SHRKVEtoalIzcnJFVjFD?=
 =?utf-8?B?NU9EbDFON1Nma1E3Wk82bUFqZHdlV0lEMEUyeS80a2xLUVZkTlJwL2VrRHl3?=
 =?utf-8?B?SVFYTkt6dGkxcFNLUHZrUnlUeXJwMzF2YmJzbDBRZEdCMisvWTB5K3E1MDNv?=
 =?utf-8?B?TUVreGVWSDNUY2RkRjQzNXluR3Q5Z1VBWjNFdlBOdHdMMG91TjlYcHFidlcr?=
 =?utf-8?B?clRaRkd6ZFlTY2xRWnBKRDdBeUIxZXprME1KWnlRSUtvWHl4ZW9pbEVzL3Bm?=
 =?utf-8?B?QlhzM1R6UjhsZU13WEhzWm96Qk5ydGE1d1NNT2FkeEY4ekFUd1ZxL2drN1dN?=
 =?utf-8?B?RDNkSlU2LzJlanRFd2NRQnpDa1FNOW1hNmZQOExXMVdKaUxYcUlPaUFzczVv?=
 =?utf-8?B?aTJPcWFIdUdSRXJFUlV4b3pOSllnZ0I1ZjJoVVpsck5kNHpYUThrb1dzRzZO?=
 =?utf-8?B?aXVlck5qaVFNZUc5dG5UTEZteG5vOUkycjRBaDRBMzFNSnpkZkNDU3BOV3hj?=
 =?utf-8?B?b2hMU1RTR2NrdDdtWHFoalhTV3ZVWXY0V2M5ZXR2dDRBME9MQU5CeDY2OEJl?=
 =?utf-8?B?TnZBaDZ5NWxFQlBRbXN5UUtMQWJYMzRIcXVUbVVRR0RlblN6aElDR0FZVFNW?=
 =?utf-8?B?MithK2ZqckxCQzlFTWtxT0c3ekw4MDN0TWNHZm53UW5rUWo1TUtQQS8rSU5D?=
 =?utf-8?B?Y3pXanBrMXVhOXdyUGpyT0ptU3dzQlFvdHhydmlSRGRWMVZsMnJCa2hnS1Y2?=
 =?utf-8?B?RDlmb1ZNRW1qRysrbWNBbWIwTjZoQndqRDRpVDRhN2dJQk1WYTN4QjNObWxS?=
 =?utf-8?B?VVNPcDN4SisxSHVLL3FxYUZlUzVVZjJIaFBqLzlxajV5QWF0L2J3K0FNeHNN?=
 =?utf-8?B?MXJlVGNBeUVtYUVUVUxTeVpOVjBYV1N5dFpzMWlEYzRLTmVnV0JlZnAzKzlC?=
 =?utf-8?B?MEthdXYyN0gyMjVQMjZSSk45cnI2S2V6RmxIRWVmRlBNM2NsaFZhVXYrRnow?=
 =?utf-8?B?N0cydDNSWXQzUC8zY3piTnc5eDJrOUhJZ25CS2pucThFZUtjRUYxelladlJp?=
 =?utf-8?B?aXhxZkh5bWxIeTRqT29UTW1kZGljWHFhOFpVaU0vMWJVYmtxNUhXMlhNVE5D?=
 =?utf-8?B?TklWTUttdUFGSUhtSFh5cjJJczliS0lXNU5IY2JVd2E1QnRuMW9HWCsyNlRS?=
 =?utf-8?B?Tjh4LzJEWnRDcDJ1a1BCN3RtbUlJTjlvcThFMkdCMzZhU3F2RzczVlJ1aWRT?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7B1AC60900ABF4CBE0453E1FF7FAEC9@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 18922e31-4eef-4b42-7054-08dd6d224cf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 11:27:04.3812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5EcG834oEIN6vqYBXi7WBY/Q76MgCsWgB81sOtIDqx/V0yMqJ/f8yFPI8o4EZBZMTHnFS2qttPMbS63scvII3MEYkSCmK9gK9Rm8dypZsSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8910
X-Authority-Analysis: v=2.4 cv=RpjFLDmK c=1 sm=1 tr=0 ts=67e5361d cx=c_pps a=TXs1g+7sIME2BPo3OSn30g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=-5LYVjoNHPMA:10 a=gEfo2CItAAAA:8 a=SrsycIMJAAAA:8 a=TTxV7h_1yqWNZ0CMU5MA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-ORIG-GUID: deprWkD7PhyZvTQQAZKwhZ-NtS3wm5iu
X-Proofpoint-GUID: deprWkD7PhyZvTQQAZKwhZ-NtS3wm5iu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Reason: orgsafe

VGhpcyBpcyBhIGN1c3RvbSBzaWxpY29uIEdQSU8gZHJpdmVyIHByb3ZpZGVkIGJ5IFZlcmlTaWxp
Y29uDQpNaWNyb2VsZWN0cm9uaWNzLiBJdCBoYXMgMzIgaW5wdXQvb3V0cHV0IHBvcnRzIHdoaWNo
IGNhbiBiZQ0KY29uZmlndXJlZCBhcyBlZGdlIG9yIGxldmVsIHRyaWdnZXJlZCBpbnRlcnJ1cHRz
LiBJdCBhbHNvIHByb3ZpZGVzDQphIGRlLWJvdW5jZSBmZWF0dXJlLg0KVGhpcyBjb250cm9sbGVy
IGlzIHVzZWQgb24gdGhlIEJsYWl6ZSBCTFpQMTYwMCBTb0MuDQoNClNpZ25lZC1vZmYtYnk6IE5p
a29sYW9zIFBhc2Fsb3Vrb3MgPG5pa29sYW9zLnBhc2Fsb3Vrb3NAYmxhaXplLmNvbT4NCi0tLQ0K
IC4uLi9iaW5kaW5ncy9ncGlvL2JsYWl6ZSxibHpwMTYwMC1ncGlvLnlhbWwgICAgICAgIHwgNzcg
KysrKysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCsp
DQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9i
bGFpemUsYmx6cDE2MDAtZ3Bpby55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2dwaW8vYmxhaXplLGJsenAxNjAwLWdwaW8ueWFtbA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQN
CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjhiNzg0MjMz
MWEyMmI3YjlmYmZhNDJiOWM3MTFkYTk5MjI3ZGUyZTQNCi0tLSAvZGV2L251bGwNCisrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2JsYWl6ZSxibHpwMTYwMC1ncGlv
LnlhbWwNCkBAIC0wLDAgKzEsNzcgQEANCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMCBPUiBCU0QtMi1DbGF1c2UpDQorJVlBTUwgMS4yDQorLS0tDQorJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9ncGlvL2JsYWl6ZSxibHpwMTYwMC1ncGlvLnlhbWwjDQorJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQorDQor
dGl0bGU6IEJsYWl6ZSBCTFpQMTYwMCBHUElPIGNvbnRyb2xsZXINCisNCitkZXNjcmlwdGlvbjoN
CisgIEJsYWl6ZSBCTFpQMTYwMCBHUElPIGNvbnRyb2xsZXIgaXMgYSBkZXNpZ24gb2YgVmVyaVNp
bGljb24gQVBCIEdQSU8gdjAuMg0KKyAgSVAgYmxvY2suIEl0IGhhcyAzMiBwb3J0cyBlYWNoIG9m
IHdoaWNoIGFyZSBpbnRlbmRlZCB0byBiZSByZXByZXNlbnRlZA0KKyAgYXMgY2hpbGQgbm9lZHMg
d2l0aCB0aGUgZ2VuZXJpYyBHUElPLWNvbnRyb2xsZXIgcHJvcGVydGllcyBhcyBkZXNjcmliZWQN
CisgIGluIHRoaXMgYmluZGluZydzIGZpbGUuDQorDQorbWFpbnRhaW5lcnM6DQorICAtIE5pa29s
YW9zIFBhc2Fsb3Vrb3MgPG5pa29sYW9zLnBhc2Fsb3Vrb3NAYmxhaXplLmNvbT4NCisgIC0gSmFt
ZXMgQ293Z2lsbCA8amFtZXMuY293Z2lsbEBibGFpemUuY29tPg0KKyAgLSBNYXR0IFJlZGZlYXJu
IDxtYXR0LnJlZGZlYXJuQGJsYWl6ZS5jb20+DQorICAtIE5laWwgSm9uZXMgPG5laWwuam9uZXNA
YmxhaXplLmNvbT4NCisNCitwcm9wZXJ0aWVzOg0KKyAgJG5vZGVuYW1lOg0KKyAgICBwYXR0ZXJu
OiAiXmdwaW9AWzAtOWEtZl0rJCINCisNCisgIGNvbXBhdGlibGU6DQorICAgIGVudW06DQorICAg
ICAgLSBibGFpemUsYmx6cDE2MDAtZ3Bpbw0KKw0KKyAgcmVnOg0KKyAgICBtYXhJdGVtczogMQ0K
Kw0KKyAgZ3Bpby1jb250cm9sbGVyOiB0cnVlDQorDQorICAnI2dwaW8tY2VsbHMnOg0KKyAgICBj
b25zdDogMg0KKw0KKyAgbmdwaW9zOg0KKyAgICBkZWZhdWx0OiAzMg0KKyAgICBtaW5pbXVtOiAx
DQorICAgIG1heGltdW06IDMyDQorDQorICBpbnRlcnJ1cHRzOg0KKyAgICBtYXhJdGVtczogMQ0K
Kw0KKyAgZ3Bpby1saW5lLW5hbWVzOiB0cnVlDQorDQorICBpbnRlcnJ1cHQtY29udHJvbGxlcjog
dHJ1ZQ0KKw0KKyAgJyNpbnRlcnJ1cHQtY2VsbHMnOg0KKyAgICBjb25zdDogMg0KKw0KK3JlcXVp
cmVkOg0KKyAgLSBjb21wYXRpYmxlDQorICAtIHJlZw0KKyAgLSBncGlvLWNvbnRyb2xsZXINCisg
IC0gJyNncGlvLWNlbGxzJw0KKw0KK2RlcGVuZGVuY2llczoNCisgIGludGVycnVwdC1jb250cm9s
bGVyOiBbIGludGVycnVwdHMgXQ0KKw0KK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KKw0K
K2V4YW1wbGVzOg0KKyAgLSB8DQorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQt
Y29udHJvbGxlci9hcm0tZ2ljLmg+DQorDQorICAgIGdwaW86IGdwaW9ANGMwMDAwIHsNCisgICAg
ICBjb21wYXRpYmxlID0gImJsYWl6ZSxibHpwMTYwMC1ncGlvIjsNCisgICAgICByZWcgPSA8MHgw
MDRjMDAwMCAweDEwMDA+Ow0KKyAgICAgIGdwaW8tY29udHJvbGxlcjsNCisgICAgICAjZ3Bpby1j
ZWxscyA9IDwyPjsNCisgICAgICBuZ3Bpb3MgPSA8MzI+Ow0KKyAgICAgIGludGVycnVwdC1jb250
cm9sbGVyOw0KKyAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47DQorICAgICAgaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDMgSVJRX1RZUEVfTEVWRUxfSElHSD47DQorICAgIH07DQorLi4uDQoNCi0t
IA0KMi40My4wDQoNCg==

