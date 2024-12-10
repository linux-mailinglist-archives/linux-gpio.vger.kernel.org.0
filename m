Return-Path: <linux-gpio+bounces-13718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AFA9EBBF9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 22:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A14B168FBD
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 21:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED03823978A;
	Tue, 10 Dec 2024 21:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="RD/32VVr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0081.outbound.protection.office365.us [23.103.209.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673F7237A57
	for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 21:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733866858; cv=fail; b=CjUn74xLID2fKlUKZkLhJek6DRchsLnTECifpGFmXp0RzVCLSGiIvbdBxJBs+B/PiuJYAl/6wyp3GNSa/HDajVn5VzwePhbEKjB8Xbxw//u01MCvervWSEmzQtFzFizSzaFlirtFEAlEBBrFdiPKFoqqzI3w12pg+7dlDP5REmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733866858; c=relaxed/simple;
	bh=gQDEL7XES3IBE+m9e/R31/8QhW+2Vu1tkF5nzcDCuFI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EHyWupRHpnZO3p9ceNJHQGs7DUKtwTWaYNhKl6VD7WSfUq14FGzUiDTWuGBPz8ORPp1wtx84IM3E4034Z/cMIgX56xGLES0JeF3W9tU0F0Fq1BkXO9++q7UoqWZPxtmCtUsL+lunDcaKeoTgxyUtyMCd3KO9CnbjAVcFcmRGJcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=RD/32VVr; arc=fail smtp.client-ip=23.103.209.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=VKDoPwUPvbCrM/TJQRmVMOMUSKfTSUFLaJvvvCnQzcSrgdc7CunmjWeMDIobuqNpwbsDDPch5LY/L4uXxd47S0maR3Se0eE9t0fpJqmcuFOpwI9X8GFT6lgRS8eY1gUTfYW5M1dLG0KGITQxiy6b1dKupZojQY8f0dC0rrCmefVVSXoWBt1VPGyugJcVOAXcSHtZE56vxRsNVvbWrWSkEz9u7HZJeWoTXi3SAXtrrbsigBANtPR/IK6VcC5Q3jIIXmMRXjf23s4A9QYXvSgi8eGZ0/Jo+pI0gtomF1PCpjZ+za/U69v9x31PzHpyGSeNGqgkI24lgLCsOm5w/z9Q8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQDEL7XES3IBE+m9e/R31/8QhW+2Vu1tkF5nzcDCuFI=;
 b=zDWKFLtBrCSqxeJ2BZFt/EdjYoBWkBD5EM1k901AF9lw1vL2Jm4s/2V7wrPZXaNvM/RWJY9jKJoxR+UjIpP9ZOiKfixoeZjnc8mefOk6WD9UUnvMC8sTxgl/el7SSm1+mEPI3j/oVmuqZMvCneXrAB8lDf5iU8orM3GVlH+YSfprcYhLQti77yARSMG9ROw02/85w90o/drc3li6QsKnDhVHNh7DesjLNH9ohsJ5E19zsbTGu3hpJBCNQdLxVYKKO8geutgui1Eq8i5P5RSpWP/nuQwHFXxPRaBkk+iSCGOMWnNES8c7zb1DzPLY6femk7AN0geu5ldcazk44eLNBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQDEL7XES3IBE+m9e/R31/8QhW+2Vu1tkF5nzcDCuFI=;
 b=RD/32VVrF/oEsyod/lCyl3YsbGW9Jrw/n7oLnPKHfUhgAVfCIaNdpiyuAOTksutGPSk2jIkoht5mRA/bvek4p2sswm0Z3UkR8Uiy3sd0hlqII5CfwmQAvrESKYWXMxTIu2CS0RBO9IOx3VzHDaD+fxc3ywZfUb3Z0GCnAL0y+r+1LI5blFk05lN+SGl4yHHKF8K73TYo9sB0XjR6bYIl3j3gvdzSuou6adfTMCBNmjXaPEif9ML/DFFS/O/7PzdPeEDUzlrNRcX5ftJTvlmTrA74884kKkvFqikmeuydseNgxVcVNS+Ks5SozYIV33Vr3itqGn6YsxJf5U39dFmxwA==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1775.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:177::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Tue, 10 Dec
 2024 15:02:55 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8182.026; Tue, 10 Dec 2024
 15:02:55 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Kent Gibson <warthog618@gmail.com>, Linus Walleij
	<linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
Subject: RE: [PATCH libgpiod] bindings: python: provide fileno() for Chip and
 LineRequest
Thread-Topic: [PATCH libgpiod] bindings: python: provide fileno() for Chip and
 LineRequest
Thread-Index: AdtLDxlnny9QK8EGR1+zjEq275fA6gABIGZg
Date: Tue, 10 Dec 2024 15:02:54 +0000
Message-ID:
 <PH1P110MB1603ED35A156B907BC8177EE9F3DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References:
 <PH1P110MB160324C826F703A91F39BE7C9F3DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To:
 <PH1P110MB160324C826F703A91F39BE7C9F3DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1775:EE_
x-ms-office365-filtering-correlation-id: 592a897e-a415-4c98-1996-08dd192bb9ef
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bXdCQXFlaHNicnFlaUM2allSYSthMERSMktBNW12VWhjYUpKaURGN2VQQVVU?=
 =?utf-8?B?RGFCQ25WTGFENHExZmFGZUtGVEZWRE1IL1BWcEJ6Z0RCN1k4T2RtM1V3U3J5?=
 =?utf-8?B?L04vZ3h1b1laZ2xkaE9zcUlneW5OTjJ0eE12SVljN2RZM2lSOTQ0b2pHeDNB?=
 =?utf-8?B?WGZpenh0cmc0T095TUEwZlVxVmxxRHRMb1hMU1hvdTJiTkdxdFJ0RGp5ZitS?=
 =?utf-8?B?NTVTNzR2REN5MTZCTlVJbHk4eUY3b2dsVXo0eG91TVMxQzdqQ2ltbjRJRGg3?=
 =?utf-8?B?NVlDejFuODF5OUpCMG1NaWIzZFAxbEMyY05GQnNZTVRaOG5MT2MvYk4rZHB5?=
 =?utf-8?B?bHIyTFZtYlVFWHFiSEhaV1ZJWDVpank2b1ErVnNuZ3Fhd1hSeTRZTXA3cEZ1?=
 =?utf-8?B?eU5LdkpZY3gzYjZaampseXdGb3hKZTVNNi81N3duOFZjUlVXMStsWnhTSHJI?=
 =?utf-8?B?RThSQWk2d0tGcFp6VU9pd0hvM2JsYnl1N2I3RnRqTlNmL1lkb3JZbjljaHVM?=
 =?utf-8?B?RkxzdG9NUTRFcmN2d255Mit3czBhTmQ1SGtmNG85M05BSWlmMjg1ZWZRWlR5?=
 =?utf-8?B?U1N1eWVCNGRzRjZsejBXL1RiUzV0N3VOV3hpTFN0bVRrTVV5YkZLNjF3dDdL?=
 =?utf-8?B?azdmSGovczNBNDVNaVZUS0tOcHRDc1hxRG8wRFV3Q1c4MXp4ajZSNFpWSHI3?=
 =?utf-8?B?N1h1TjNRbVluSHRRYUhRTW5IQ3NLenh4S0lsckhVcnptMUY5WmlnMUliMTVV?=
 =?utf-8?B?dzRrVDZNT3dFRnJOb1dYYks0UFRNZmljalFJZEcvYzRSQ1l2cnJibm9vZmll?=
 =?utf-8?B?ZFFxOWdaaUxudVlieDkxbzJtQlFBMGx1ZGM1UFVlSHYvWDZ0eGRYd2VrTWdv?=
 =?utf-8?B?WEwzVFRGUVJBSlhNblpYRjBTVkI4WFhuVXRBQ0hUM1ZRS0lsZUdJUmR2V3Vv?=
 =?utf-8?B?UkdYUDgyYzUxRFdPL0ZId3R1QlB5dmM2THZ1YVJnYmI0RmF5U1QzbU9mUWJ0?=
 =?utf-8?B?QTUzclduM1ViSEc4cEJGR0tVMXNDOWU5bVJOT1dUTE1pRG4xQ3ZOUVRETVk2?=
 =?utf-8?B?My9oMHEwcXVQbUFqLzdVYU5wZzJHekJGMFZvUXdOQmhZRk9KZzFwK05WbHpi?=
 =?utf-8?B?YnY5ejZ3L29qaXh1QVV4aDVCcXo4d3EwcmVIdnBGMnhDaEZaUHBGODZxaHoz?=
 =?utf-8?B?bncyZHNORHVWOW1FQlN4M1dLRzY0NCtBS1RUOG80SFhpbkhvZWZVeGo3UlZv?=
 =?utf-8?B?VVRjd3FKYUo4SitENlNDc3JmNHlyQTlRUFJHZ2xCbHkrRzJvK3B5UjQxbW5Q?=
 =?utf-8?B?U21udXJzemdlRExnTDNtcjRUbllITHhoL21RVG14TG9WUjdjeU9KZ3V2eXd2?=
 =?utf-8?B?cHUvQ3g5aC9HSjRTa3VKSkN0WDcyTzhuRnN5ZE96NjFsWTdIMU5WWGtoTFZ1?=
 =?utf-8?B?QVIwdVBQejFKNm0rSUNRNkRMQ1QzTVBrREhnRjRjV2taSTI2MWFBZ2g1Tita?=
 =?utf-8?B?cmMvajBJR1pIZjdES3B2cUZMakNBa2tzMDlOa1ZzWDZDUHZlQ2U3VHdLTzhq?=
 =?utf-8?B?TUd1QjhzMDZlSit0dHdoZnpkNnV2em9hWHFlc0lLTDg2R21OTysyRXNydjQw?=
 =?utf-8?B?M1IreHFhNTJjVThLajMxR1hvWkZrek9mZTVSNS8rQTNUUzVUTWFqOHRRRTZn?=
 =?utf-8?B?YmxETi9RbmNjQndPN04zOU0zdzVaQU9QL3FBVTlBaDBuWFNFQ2ZGeWdzV2Zz?=
 =?utf-8?B?R1Z2bWNGSGRWNjBBWW5JQVk3K3p3bS9FcUhjSG8wcFR0VzlqODk1d2Q0Z0FU?=
 =?utf-8?B?M0JDOGhYc3VKR01RZnIwNURVSjRsVE5zeGcvQ0wwM2NuaDFocTEzYURuR0Rz?=
 =?utf-8?B?UjlVTzl6eGcvM1NTNUZFL201T3U0WG9SdEJPYVdnNkUxSHc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VVY5bmlIbzNUZXFJY0hmY0xEbGpiV25EUmNsRmNsTlBWYS9lRnY2TWRtYUFG?=
 =?utf-8?B?SHJDRUZlUFRsSUF3TjJ2Mjd6NWpNb3J2a0sxMXRIK1BHR3k3dC8rWllNQzZD?=
 =?utf-8?B?YWVudWJvU3RBSmkyMG9iUkhCLzRSN3dsVXhSYzdWT3d4TWVCM1FpU1JuVStE?=
 =?utf-8?B?bkc0c1pwOUp6R2VDZFJsWFpIMTU5bDdLeDdTOTVZNldFY1RKV09Pdld5c2hv?=
 =?utf-8?B?c1Q4TFUyZWJxblg4cjlHUlJNcHMxSnNsOExzMk9TREVoYzJ2TVJGQ3Z1OFV5?=
 =?utf-8?B?VllmbVlTRlZlZTQvWnA0TUR5eXY5M3U0Qm56M1ZUQXU2OEtjeTRheng2OVZa?=
 =?utf-8?B?VXhWdk11THpZb3NzV29UaEJwS3h3T25vLzgvVGp0d0FKVjRweXZKTVFGN0Yv?=
 =?utf-8?B?bUI5RFJQTSszS0FmL3psVHNpUWdtbTRIMktPL1R3QWQ1ckp2Q2N6azlLVW5V?=
 =?utf-8?B?ZGkycnQyV2tSdDNtdnhDY1hYTTE0NEU5ZllRTUorSzlhSGtmOEJCMDRKekkz?=
 =?utf-8?B?dHQxcFVuOWF0L251SFBPWmxtN3l3K0NpM1o5d1pqTmNiTTd3RXpwU1RiMTN4?=
 =?utf-8?B?T1dpSW41eC9XWFdXeHVqNTlhSDNSM3E4MVEvRVVsWDBBZjM0Wk9OaXpJVk1Q?=
 =?utf-8?B?S1BwNnk5RkVVWk1LR2VOZVRNUk1yMDVzVWFDVG1RTjJFSjBpUUEyYTZ2TDNa?=
 =?utf-8?B?SVI3dUxVaWs2SW1qODJXcWwrM2pUbURGWXkyYWRPUjFkMXpmcjROZVFkRk9J?=
 =?utf-8?B?elBWd3I2SVA4eVlkUEZ4c3V0cStUNUpZTVZYeDViZll2d3FmdWZCcExZdmVw?=
 =?utf-8?B?UlZSSHA1SjhQbGdJRmFnTnJzZ2ZUYWo3ZVRDRGQ4OXMvZEdJZzRkRGZydEpO?=
 =?utf-8?B?bDRFTEFOcW44dzlTdTJJR1ZWK2dQS2xHNS9iMDZZcmhGd0w1MkNwdlVnZTVt?=
 =?utf-8?B?aElTdzNHSGlVV1VHUEd3cks2YXB0UTRhV3BhelFFTCs1azhXUk5VNkdaV3NV?=
 =?utf-8?B?NWtHUlNWVnViTnBSKzJXSy85QS9lcmRUOE9ZdStqTjhsbEkrb3UwbVVQNElq?=
 =?utf-8?B?KzFoeDBNeWRvRm84YUxEZS94Z3dVR204NnIvWUZIT2FjR2d1Vi9XTXorM2Vp?=
 =?utf-8?B?Wkw3TzlWZFljK1p0YTZHdjFya1EwbWNZNmNWWkdWNnM0Y1dzNnMrYW9mN05s?=
 =?utf-8?B?STFLb0ZhM0xjYWFyZGkyaVY3bmVJVFVLQ2hmTFBtUjBxRGZwQ3laaTFsNE1n?=
 =?utf-8?B?cjZ2YXhDZzY1dEN2ZDJTWVBxbUNYZDBpMjBDN0VaemJzUG03VFpDNFRkdmtq?=
 =?utf-8?B?ZUJVZ0pBVUFORGF1YzFyOXBVTmE3V3R3cHRSaVpMTG5nSEZsRDhhSTB2RGRx?=
 =?utf-8?B?bnZ6TXdzamE5cnFoZzNTcHBaN2x3czV5OTNaUmdEUmgxME5Zelo1K2Q4MXI1?=
 =?utf-8?B?YkFFZEM0c0swT21EbGEreXZ5SGwwLzF4NWRDekpwbVl5QnVHT0ZiR2JMZjRn?=
 =?utf-8?B?dXFTMm1XdndFVjNmNFBqTjBuU3psODFKSkJWYlhnR1VSQnZuMmcrZmxibEsy?=
 =?utf-8?B?SGtMcTV6YjFuaFVNQWtIUjB4N2Y0OEp5OVRKK0dFRzg5bXZGR2NRV3BveXZW?=
 =?utf-8?B?SHJWVWk0ckRNdGpacVB0Rm5ZSkxKMnM0RlcvWkhMNVk2cGNRTTZFMHlDMkJk?=
 =?utf-8?B?L0dFdHVYNWtCZ3BET01sUFFsNFlPamJ3VS9OZzhrdnV1TXd6d3MvQjI5VW9q?=
 =?utf-8?B?WkFObW1RaFB1T3phRGM2Q2hoRXgvdlBnKzFzZ2NzbWxZVGZ4aGQrN1lCRW0z?=
 =?utf-8?B?T0p6QW1pd2tWWmhmS1NTQWphT29VTmNhb2dXeXI3cGVzNEl5Z2VweU04OGRO?=
 =?utf-8?B?THlwdVVUK0J1cnRpWHZPWFVLSFF6czN2alZzajAvRlhabG90bTJkRkR5YjVl?=
 =?utf-8?B?bTR6aG11TkZLbW55aWZubXhJRnVEc01ZMm9qU3NXenc5TFQxaEhmMkRjYVBS?=
 =?utf-8?Q?pIhAIzkrNxd1bLjlwCVgHddTjx3RSg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 592a897e-a415-4c98-1996-08dd192bb9ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 15:02:55.0080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1775

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVmluY2VudCBGYXppbw0K
PiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxMCwgMjAyNCA4OjI3IEFNDQo+IFRvOiBCYXJ0b3N6
IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPg0KPiBDYzogS2VudCBHaWJzb24gPHdhcnRob2c2
MThAZ21haWwuY29tPjsgTGludXMgV2FsbGVpag0KPiA8bGludXMud2FsbGVpakBsaW5hcm8ub3Jn
PjsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IEJhcnRvc3ogR29sYXN6ZXdza2kNCj4gPGJh
cnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBsaWJn
cGlvZF0gYmluZGluZ3M6IHB5dGhvbjogcHJvdmlkZSBmaWxlbm8oKSBmb3IgQ2hpcCBhbmQNCj4g
TGluZVJlcXVlc3QNCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+IEFoISBUaGlzIGlzIHdoeSBJIGRpZG4ndCBzZWUgaXQsIEkgbWlzc2VkIHRoZSAtLXN0cmlj
dCBzd2l0Y2guIFRoYW5rcy4NCj4gPg0KPiA+IE9uIGFuIHVucmVsYXRlZCBub3RlOiBteXB5IC0t
c3RyaWN0IGlzIGdpdmluZyBtZSB0aGlzOg0KPiA+DQo+ID4gYmluZGluZ3MvcHl0aG9uL2dwaW9k
L2xpbmUucHk6MTk6IGVycm9yOiBOb24tb3ZlcmxhcHBpbmcgZXF1YWxpdHkgY2hlY2sNCj4gKGxl
ZnQNCj4gPiBvcGVyYW5kIHR5cGU6ICJWYWx1ZSIsIHJpZ2h0IG9wZXJhbmQgdHlwZTogImludCIp
IFtjb21wYXJpc29uLW92ZXJsYXBdDQo+ID4NCj4gPiBmb3I6DQo+ID4NCj4gPiAxOCAgICAgZGVm
IF9fYm9vbF9fKHNlbGYpIC0+IGJvb2w6DQo+ID4gMTkgICAgICAgICByZXR1cm4gc2VsZiA9PSBz
ZWxmLkFDVElWRQ0KPiA+DQo+ID4gSG93IGRvIEkgZml4IGl0Pw0KPiANCj4gVGhpcyBpcyBvZGQs
IGJlY2F1c2UgSSBzcGVjaWZpY2FsbHkgaWdub3JlIHRoaXM6DQo+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saWJzL2xpYmdwaW9kL2xpYmdwaW9kLmdpdC90cmVlL2JpbmRpbmdzL3B5
dGhvbg0KPiAvcHlwcm9qZWN0LnRvbWwjbjU3DQo+IA0KPiBIb3cgZG8geW91IGhhdmUgdGhpcyBz
ZXQgdXA/DQoNCklmIHlvdSdyZSBkb2luZyB0aGlzIG91dHNpZGUgb2YgdGhlIGJpbmRpbmdzL3B5
dGhvbiBkaXJlY3RvcnksIHRyeSBzcGVjaWZ5aW5nIHRoZSBjb25maWcgZmlsZToNCg0KYGBgDQoo
eHRmLXB5My4xMikgdmZhemlvQHZmYXppbzQgfi9kZXZlbG9wbWVudC9saWJncGlvZCAkIG15cHkg
LS1jb25maWctZmlsZT1iaW5kaW5ncy9weXRob24vcHlwcm9qZWN0LnRvbWwgLS1zdHJpY3QgYmlu
ZGluZ3MvcHl0aG9uL2dwaW9kDQpTdWNjZXNzOiBubyBpc3N1ZXMgZm91bmQgaW4gMTMgc291cmNl
IGZpbGVzDQpgYGANCg0KSG93ZXZlciwgaWYgeW91IHJ1biBpdCBvbiBgYmluZGluZ3MvcHl0aG9u
YCB0aGUgb3V0cHV0IHdpbGwgYmUgbm9pc3kgYmVjYXVzZSBpdCdzIG5vdCBsaW1pdGluZyBpdHNl
bGYgdG8gdGhlICJmaWxlcyIgc2VjdGlvbiB3aXRoaW4gdGhlIG15cHkgc2V0dGluZ3MuDQoNCkkg
d3JvdGUgdGhlIHB5cHJvamVjdCBzZXR0aW5ncyB3aXRoIHRoZSB1bndyaXR0ZW4gcnVsZSB0aGF0
IHRoZSBjaGVja3Mgd291bGQgYmUgcm9vdGVkIHdpdGhpbiBgYmluZGluZ3MvcHl0aG9uYCBhbmQg
bm90IG91dHNpZGUgb2YgaXQuDQoNCldlIHNob3VsZCBwcm9iYWJseSBkb2N1bWVudCBvdXIgZXhw
ZWN0YXRpb25zIGZvciBob3cgdGhlc2UgY2hlY2tzIGFyZSBydW4gYW5kIHRoZW4gdXBkYXRlIHRo
ZSBjb25maWcgZmlsZSB0byByZXNwZWN0IHRob3NlIGV4cGVjdGF0aW9ucy4NCg==

