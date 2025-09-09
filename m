Return-Path: <linux-gpio+bounces-25773-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA6BB4A010
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 05:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8871D441CE3
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 03:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2522F25A2C7;
	Tue,  9 Sep 2025 03:30:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022081.outbound.protection.outlook.com [40.107.75.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6E154723;
	Tue,  9 Sep 2025 03:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757388642; cv=fail; b=N9Gw2tbCxRUn1eUCL/64qfSAvcwOcD6lpPRw5BnwKhrsNQUtvIoJFk/+2DjNZmtosWujsP2iPdjKa4IhSwnetQbf27TFKZ3IFmdRKP6C51UrZRBpygu5zPJQH3DNaGsk4I/T2pTpQKnYF6DSpoj4tMJfJFN5pHYZzRj3txqm3VU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757388642; c=relaxed/simple;
	bh=7dFmJxZXkRX03ATacaU8P+2PNFNcGGH+YXRvw7+ZuBg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Swmc6uy2pCosJSWM8gbhoFhdOjZkmVX33XAgRZ7nKGRo0Ell4YhsdAOHsTWx9zXdGHD3JSoWCK7RIxy1HH5NPEUF9mDziaBnw3S6dWXmfh6KU4auTOog2QOkt22HFnONloQG/2vualbV4zZ+a69Qy+5faUAd7JCchDrhwmfQFVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+nrtFnI33EoA8kE4//IXUZUljGhqMdE6UtDzfVU0/oPQ9hhEMvqu8HU+/dqZti9SCAQxCUFjXyRFzFhZ0zxKC6LcW2UIxpRMN4JdTa/JhywZFqNtuYihAhOPAoEn7xuMyU8c8L1o/BpMoJowh4fDISeLuz3v+sh1BNUdWIRbSe8tqd+SnD2Xr5w2Jd5lZPgC6cyzRgsBhfSYDaf80jYp2xdagEUpXcNC2lQuHN1weujJxYtVHcFBP8iepD+BufRqPWxb9S/+OH8qhij96ZxYlPKdpSrP8MZ6Y92u6em8vwsfMIhlPi/LXyzMv1aVnJNup0DRt7MqsUevSh3QwMh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dFmJxZXkRX03ATacaU8P+2PNFNcGGH+YXRvw7+ZuBg=;
 b=FzNmoTYOShbbx6FRjUSg3BjIXNc2RXecK5KrgvbvpHd6PYpYTqF+816oWqKkx65/FqJVCzyk63Ob0+y1xdqdJzvZ+nsRfgqVPq/UJ/jaJ117irvxt1iJchYpDPOQeayYfd2OXdlHF3WAETCabv/vFeYj1eoJw9Aa9fHfezOxMC0C43jJrUjCmZNIKh2O7tWYe6Jy+KFPbmcwn+hpKwmhfjcftc3Nrwki1Zxz2Lnkp7VNNGwLv7OVto2yFYoOLcb7MKj7oQkx3GzWOIylfFB3VMz/hZYGasy+Ks4K9bdHO9Dv/F28nAix1bGu9JwFsZ3dEqRGdJR2HFbf0L6d8cpRKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 03:30:35 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 03:30:34 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMi8zXSBkdC1iaW5kaW5nczogcGluY3RybDogQWRk?=
 =?utf-8?Q?_cix,sky1-pinctrl?=
Thread-Topic: [PATCH 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Thread-Index: AQHcFvw6Jst8WcIA+kKHV/WtkB0Of7R4ZNEAgBHcnvA=
Date: Tue, 9 Sep 2025 03:30:34 +0000
Message-ID:
 <PUZPR06MB58879640C5849ABA55EF0C34EF0FA@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-3-gary.yang@cixtech.com>
 <CACRpkdaX2VPAb+vihZ5BEAsGy+jNUdQ8q+3c3Q78uWmqZYeu=g@mail.gmail.com>
In-Reply-To:
 <CACRpkdaX2VPAb+vihZ5BEAsGy+jNUdQ8q+3c3Q78uWmqZYeu=g@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|SEZPR06MB5832:EE_
x-ms-office365-filtering-correlation-id: e2dff9c9-8690-4870-ee17-08ddef513cd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aGwrN2ord1hnbUFWT0pWbndJeWp0QUc3eU9IL2NVem50MmcwelFqYk9rUUEz?=
 =?utf-8?B?ZmN6aFg3OTFTZ3NUU2ptMGlRSVc3bVRzcHQ4S3VzSDhYMUQ5MmpzUEF6ZXlJ?=
 =?utf-8?B?Tm9rZHY5bitBa0lNV3ZNQ2xOL1lXeWVmUVlub1R0emhEd3d6YlFxTi9LRjhP?=
 =?utf-8?B?QkcwcE1kWktGajIrWUpsd3RFbGhza09SLzZJaDhTbmd2K2FJanhSMVZJV3ow?=
 =?utf-8?B?ZmVrMEMwMTJmL2F4WlNHY2xHYXFQdm0zKytuaDRMdThwd2lMWm5ybjVUUkdE?=
 =?utf-8?B?SjBNSk1NQTBlT0g5bmFWZlJTSnQ5WEVTRXA0STRWVDFNMzA3UWFSQWY1cUM3?=
 =?utf-8?B?d2p5SFdnQlRZT3F0cjdxRDNnUWhmTjlxWWVIbDY5Z3d4R3A2cDJUUkwvdmRY?=
 =?utf-8?B?aXJVOFJNbkNINW12Y0VjRFJTTXVGVUhoMlBzNXpmVmt2dEx6cFU1aURVcTQ1?=
 =?utf-8?B?TTZ4S1lldjhWQWFZUkJBYmhMOStMUXl1Y0t5SlNFTUlnaTc5UGJLaXQyam9J?=
 =?utf-8?B?YWcvMDJZUVB3R0lqRTRhL3ZkQitlazUyeW1ocEl2MWJlZVYvNnpnREZqK2s1?=
 =?utf-8?B?dk02a3VuK0k3YlA0eWtCRUl3eWpkdmV5UG85ZVUrTU9jSmQzRWorYk1yOVl0?=
 =?utf-8?B?b3o2L3BYa3FYZHhVVTQrL3JvdUhQMjBxNVZaaHFVRWlNT25CbzF2Vno3bHc2?=
 =?utf-8?B?MVNpK1czM2UrS3JPUVBndlllQmtGL3hVNE43ZzdmUEgxWVZiMUUvNSthbnA5?=
 =?utf-8?B?MDVpWWhlMFAvRWdWU2ZmanY3ODZRVGVPZzZGbWkyaG9SR2RQVmNIK0JEbktw?=
 =?utf-8?B?QlVIQzdPTFN5M0JqczVOMDdhdmtmUmFLbkF2T3RxWW9sTEFCWmRpM1ZJZHNH?=
 =?utf-8?B?SHFvV2R4b2E2UWNJR2oxQnd1QUZBb0tpRUxBUXdHa1FEdEJrVTZkbjVwVjVh?=
 =?utf-8?B?R0pLbVpRUUJpRVhyc3B1NWIzTzRlNGVnUWdWaDdmcTJKREV2L2N0R0NKT3BU?=
 =?utf-8?B?dWxHY0xwM2NWeW9ZbzVwWDI5c21CTFRnQUg0WEdMeGtGUlRaME9odWpCUEFC?=
 =?utf-8?B?UHNzWE1yUFF4UEsxa1lYdGZXTXVEdE5FU2w2QjN6ZnBlbk5HbkwvVG1JSi9j?=
 =?utf-8?B?MXcvV3M5VEw4S3FKZ0s2RVRjdEJOc1ExWFo1WDdVcTRwS0w5djZqc2F6T04v?=
 =?utf-8?B?SFZzRFRqRXlLVlM1VkhudWFGNm9BV3VEdEkzNEhNWE5BMGdaYWhqcFlHUFRF?=
 =?utf-8?B?WHJ1akdXK0xrblZaVno2Y0svUHBWUXBiSUFaMUlSMWhQT3NKeHQvKzA1cm5O?=
 =?utf-8?B?Q3hqTGNpTzZBU0ZHZCtONWhISXoyTEx1L2JlNFhUdW5wUU85RDE1ZzdnKzR6?=
 =?utf-8?B?YmdTMENFL0JDNjBCZmdIRXFxUnRFVFRlRnZNMHpTdGdwZVcweFJSN1ViNlh3?=
 =?utf-8?B?SmpsY2E2QmJ4bjNjV21yOXh4WmtiN29UdzdRYnhsR1FZdytOS0M1RUwySkxL?=
 =?utf-8?B?UmZZNEpBSTBZUWlTYmhqVUFlN3N3Skdrc1RHbFpuRi95UzVXakNPQUhPOGpl?=
 =?utf-8?B?RGFvNXJIbjJxRW1XdmZiZjRvKzFXMEVMTUloSWZLUllDbUp1U2RGSlIwTWRZ?=
 =?utf-8?B?UStwTjNWTVdUdHc3eVdWY2VNOCtPR1BabFpnWVBzSDNEZ0xtb1pTc3lLTkxl?=
 =?utf-8?B?WlZlQUdCaDFOYWRUbDQ0UUJ4QnMyb29UV1dEN2x0bWVLaHFvTjBhVTBsdVFM?=
 =?utf-8?B?MGt0UkZlREZKK3RWU2VKOEppNVBhemdDMDMyajUrRmJKTm9vTU53dDNHaWhN?=
 =?utf-8?B?U1BBaWRMTTBNeVJibWNVRy80bXdRV2RwOHJYR3pqdlprUGtxeDVHaFZzcjRr?=
 =?utf-8?B?djdCcDNVNFFYaGhhdFpCL1k4SmF6c3VLblFjd08vZm1ncFZxNzNQQ3JlTVlh?=
 =?utf-8?B?SExOcHNodlRyWmEveUVGRi9nRlBGbmkyTzJteEZXWUlRUG5TN3VnWC9kV29i?=
 =?utf-8?Q?TfBSHXkVbg7MyxBtPwjQ4bUCNrj7+Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q3ZROVZUU2FESncwSk44TzgxclVDUSs2WjkrSUw4UFU2ampGWjNiMG92eitR?=
 =?utf-8?B?NTVodmMzN2JraDB1TmppV2hoOUczc21HZkFXSHBBdmIzTXAyS2ZMbHNsKzBE?=
 =?utf-8?B?WkFVdTFib2J0ZzY3MUVDbWlxRXpXMkxzZDdCN0FBbCtJcjE1TnJpNkRSTmMz?=
 =?utf-8?B?UHVQYWUrblVLaUJjakpNd2JYV0xGbytlV1EzdGMveWZGNkJUVmFvYzQzNE9s?=
 =?utf-8?B?K21YK2RMR1Uvc3ErOGV2MllmKys1U3NEYWdkQzdQQlp5N2dmbmsybWhnM2xp?=
 =?utf-8?B?dVhPWkcxcDhpTCs4ajFlcUExMHd3N05nMzhvaXRFcmJyMk5EMjc1a3p3RGFT?=
 =?utf-8?B?YU9xM1pnL1I4MlJacjVBT3pOMXRQYVlzNTNDMEduekluQ0RpOXBYb2pEUWJH?=
 =?utf-8?B?K0RMaEM3WUdGcm9OcVBLUkxIbE5LVnVxUUhqRjdCZ21uT1JGTlY1Mm9KOU5L?=
 =?utf-8?B?K3VqY2NERW5MNU1QdjgyY05KMmVZSmc1Z0dkTXlrT25tZlRtRVREVkhpZ0da?=
 =?utf-8?B?MEJyZkx4ejByMzZyb2MxNGlwWVZEM2RPQ3AzamR1TWdPa1ZYMmYyVzUwNjk0?=
 =?utf-8?B?VEJtOVpHbmhEb3dRcGw2ZkNpcU83Z0ppNEN3ZGFzTEc4NHM4blRBMzFmVDZ4?=
 =?utf-8?B?azhZaUdpMDkxaGlUMDFPVUhPY0M1OFE5Y21rNXlXYXVVU1NQdVVjUzhUdnNB?=
 =?utf-8?B?Zm4rTEtsdHR4K3d3czl0QVQvVE9wQmlDU2c3dWxuZTJaYks4R1FRaTNVeHZK?=
 =?utf-8?B?SGI4blovRXp2NFpRbllJUmdCQnIrTFNwNFplOE1EOVViRmxCeC9SM2lZcVRx?=
 =?utf-8?B?Sm4wSXpUcU9qenFOTm9DWkZ2TnhmdllMc3RYN3g4Z3I1WjdFQ0QyR3NvTjJ4?=
 =?utf-8?B?d05naE1YM085TFlCMG16eG1KUjU5cm02Q2hvcFI0SXZIVmVvRi92aHhLNUpo?=
 =?utf-8?B?d01wQ0FLNzhwOFd2WWJTUGxGRkYrVnhjdlp4RW43cTROR0FSWElOaEliOVFJ?=
 =?utf-8?B?dWpja1Q4dHlxQ0NhbzdWOEs3a2U0aWd6eWxLckZuQVpsYk5nMFYxMEN1NTJ1?=
 =?utf-8?B?aUhUMG10aVRRNFl5eXZaWFpIQTl4ejNMRCtzam1Hc3h4ZEZ4dVR5R0hBTE44?=
 =?utf-8?B?Y1pmYnhOZjFuTitoV1F3Nkx5WndFUytEa3BpclNtT3FleFhoQi90UEVUaU52?=
 =?utf-8?B?WEdZY0JsaE1ZekJtb0hrL2FLajNYTWl0Zm44SU05aDkzbi9rZVhZWnRkSUxy?=
 =?utf-8?B?d216cng4cWc0d0s2cVU5V0ZKMjFhUUZDcE9MWThEZjRsbk1JbERDMU5mYlpm?=
 =?utf-8?B?a1ZiS3UwTzFJUlFUQ2ZTcXZtTWlOOFZRb0xPWGViSDlmeWl6MU5RMDRYcUJK?=
 =?utf-8?B?bWxzT1E1NnhpbUpVM1NyTm5OZ3RKcjFFMmxub2I2SFREMTdSS2hQNWRWazlB?=
 =?utf-8?B?Qy9yRGxoU1YvN1pxaGVGa1pDQXVkM3ZSdm5TdUxjWmZZMGNGSUwwUlFwZjg3?=
 =?utf-8?B?ZUQwSzc5TkNEVWZTSSt5Y3dvclJWdklSV2FkWmF5MG9GU25yUVoxaWpGdFNv?=
 =?utf-8?B?NEVQR2lTSHk1VlMrU1loajRhOWtZSldDQThVVTArOGhhR09yeFFWWktjMlFa?=
 =?utf-8?B?RWYvbWNreEtqUkNWZHJrRng5b3hpNm56NDg3SkhiVjQ3bnZ3bHFERW9MdkpX?=
 =?utf-8?B?UGtDdEVJcFVreVRPQmF2U2FOdzJ4c2x1K3RjOTdFVjAwRHA0WGh2eWoyakRC?=
 =?utf-8?B?bkphMUFjMkRFSjd5QmQzRUtlSTkzREpYeTdRMWlxNzA0cTZJemlaa2VjWGxH?=
 =?utf-8?B?Vm9leExUaDVEQVQvSU93b1RyVGovUjNYYjhwSWZEUzdXUTFuaG45Y1JNS3ha?=
 =?utf-8?B?Ty9zMmQ3QUhyRUxuRTlpbVYxL1VVOXlhZDBKaVAvRmxXZktSUWV3M0tyOW1F?=
 =?utf-8?B?RzhHYTZPYk9lWmxEeWgrY0hJM01UK2hnMkpyQnJZSlNRTHJqdmRzY1VHWjd1?=
 =?utf-8?B?ODA1MjBOenE4ZlRHZ0RXeC91NnFWRnpCWjlmeDgvRTd5OHdqMm9VZGJWRFlT?=
 =?utf-8?B?czdZbGdJd28xWGY5a0ZhWDVTdEFWbEtZbTVKYkhBR2k1L1BEOWVKMEl6WUtS?=
 =?utf-8?Q?rpUCLXEpkJ8GIu0aLQqd9yyfe?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2dff9c9-8690-4870-ee17-08ddef513cd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 03:30:34.8280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vyajNZY5FBIifM41fHGAD88UVf1Gx4iebGDWgak17vIc582PSeOf+3dbpIMXAElN1DzVZbpy0rsOK/ShA4m1Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5832

SGkgTGludXMsDQoNCj4gDQo+IE9uIFdlZCwgQXVnIDI3LCAyMDI1IGF0IDQ6NDLigK9BTSBHYXJ5
IFlhbmcgPGdhcnkueWFuZ0BjaXh0ZWNoLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEFkZCBkdC1iaW5k
aW5ncyBkb2NzDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBHYXJ5IFlhbmcgPGdhcnkueWFuZ0Bj
aXh0ZWNoLmNvbT4NCj4gDQo+IEkgc2F3IEtyenlzenRvZiByZWFjdGVkIHRvIHRoaXM6DQo+IA0K
PiA+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9wYWRzLXNreTEuaA0KPiAoLi4u
KQ0KPiA+ICsjZGVmaW5lIENJWF9QQURfR1BJTzAwMV9PRkZTRVQgICAgICAgICAgICAgICAgIDB4
MA0KPiA+ICsjZGVmaW5lIENJWF9QQURfR1BJTzAwMl9PRkZTRVQgICAgICAgICAgICAgICAgIDB4
NA0KPiAoLi4uKQ0KPiA+ICsjZGVmaW5lIENJWF9QQURfR1BJTzAwMV9GVU5DX0dQSU8wMDENCj4g
MHgwDQo+ID4gKyNkZWZpbmUgQ0lYX1BBRF9HUElPMDAyX0ZVTkNfR1BJTzAwMg0KPiAweDANCj4g
KC4uLikNCj4gPiArI2RlZmluZSBQVUxMX1VQICAgICAgICAgICAgICAgICgxIDw8IDYpDQo+ID4g
KyNkZWZpbmUgUFVMTF9ET1dOICAgICAgKDEgPDwgNSkNCj4gPiArI2RlZmluZSBTVCAgICAgICAg
ICAgICAoMSA8PCA0KQ0KPiA+ICsjZGVmaW5lIERTX0xFVkVMMSAgICAgIDB4MQ0KPiA+ICsjZGVm
aW5lIERTX0xFVkVMMiAgICAgIDB4Mg0KPiAoLi4uKQ0KPiANCj4gQXMgc3RhdGVkLCB0aGlzIGlz
bid0IHBhcnQgb2YgYmluZGluZ3Mgc28gaXQgc2hvdWxkIG5vdCBiZQ0KPiBpbmNsdWRlL2R0LWJp
bmRpbmdzL3BpbmN0cmwvKi4NCj4gDQo+IElmIHlvdSBhcmUgdXNpbmcgdGhlIHBpbm11eCA9IDwu
Li4+OiBwcm9wZXJ0eSwgd2hhdCB5b3UgY2FuIGRvIGhvd2V2ZXIgaXMgdG8gcHV0DQo+IHRoZSBz
YW1lIGRlZmluZXMgaW50byBhcmNoL2FybTY0L2Jvb3QvZHRzL2NpeC9za3kxLXBpbm11eC1wcm9w
cy5kdHNpDQo+IGFuZCB1c2UgaXQgdGhlIHNhbWUgd2F5Lg0KPiANCj4gVGhlbiBpdCBpcyBub3Qg
YmluZGluZ3MsIGp1c3Qgc29tZSBEVCBkYXRhLg0KPiANCj4gU29tZXRpbWVzIHRoaXMgZGlzdGlu
Y3Rpb24gaXNuJ3QgY2xlYXIsIGFuZCB0aGUga2VybmVsIGNvbnRhaW4gbWFueSBvZmZlbmRlcnMN
Cj4gdG8gdGhpcyBydWxlLg0KPiANCg0KRmlyc3Qgc2hhcmUgYSBnb29kIG5ld3Mgd2l0aCB5b3Uu
IEl0J3MgdGhhdCBXZSBoYXZlIHZlcmlmaWVkIHRoZSBuZXcgc2NoZW1lIHBhc3Mgb24gUmFkYXgg
TzYgYm9hcmQuDQoNCldlIGp1c3QgaGF2ZSBhIHF1ZXN0aW9uIGJlZm9yZSBzdWJtaXQgbmV3IHBh
dGNocy4gQXMgeW91IGtub3csIHRoZXJlIGFyZSBzb21lIG1hY3JvcyBkZWZpbmVzIGluIGR0cy9k
dHNpIGZpbGUuDQoNCldoZXJlIHNob3VsZCB0aGVzZSBkZWZpbmVzIGxvY2F0ZT8gV2UgZm91bmQg
dGhlc2UgZGVmaW5lcyBsb2NhdGUgaW4gaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsLw0KDQpt
dDc2MjMtcGluZnVuYy5oIG9uIE1UNzYyMyBwbGF0Zm9ybS4gV2UgZG9uJ3QgZmluZCBhcmNoL2Fy
bTY0L2Jvb3QvZHRzLyovKiAtcGlubXV4LXByb3BzLmR0c2kuIA0KDQpXaGF0J3MgeW91ciBzdWdn
ZXN0aW9uPyBQbGVhc2Uga2luZGx5IHJlbWluZCBtZSBpZiBJIG1pc3VuZGVyc3RhbmQgYW5kIG1p
c3MgYW55dGhpbmcuDQoNClRoYW5rcw0KDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQoNCkJl
c3Qgd2lzaGVzDQpHYXJ5DQoNCg==

