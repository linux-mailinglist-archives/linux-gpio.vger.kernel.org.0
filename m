Return-Path: <linux-gpio+bounces-19295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD58A9C05D
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 10:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AE2E1BA058A
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 08:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1131422E3E3;
	Fri, 25 Apr 2025 08:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="fkyGI96y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0073.outbound.protection.office365.us [23.103.209.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11E217736
	for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 08:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568377; cv=fail; b=EGlxf14w2+Rw+vJ6s8Hm9a6G1MV/RDx6+FBMKqaLLYl7sgGln9FcCSJD6XsvwQveeZC5YfA7WUpPRelvEcxZT4vFKxlKwag191pIz8FfgOwUudW8K7h0xms+IkLgMLVQnHC+j+IO5bHNKDO7UVXiTU++aE0oNyHI2Qa/MikOJ2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568377; c=relaxed/simple;
	bh=MsjRizOz4LUJjYxjOp1zqul+zOdkDFrUKyVkbCcNROk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Us2JF2rIf09vHfIZZmCj54jCqrLN/gzeTv2M/7qo3dZbAMxoDYpvwiKG0l7shB+egP7vVagCb7ozntaaGCxx6ayEDSRuaAzyJ44og6Scv59TsyuXOurm8lNNGNpCx+D5XScA4lDoyf4Jajz9jrsoIUAagn/gTtKB2AKhPO1D2O8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=fkyGI96y; arc=fail smtp.client-ip=23.103.209.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from BN0P110MB1708.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:186::5)
 by SA1P110MB2038.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Fri, 25 Apr
 2025 02:30:48 +0000
Received: from PH1P110MB1268.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:189::11)
 by BN0P110MB1708.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:186::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Fri, 25 Apr
 2025 00:22:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=b3keQt7sCCfHJlTyLYYnlq3JlqlIZNhtOICkZIBOq5h+il7VSvv9PHhYftDIv+1P5hBE59jLfhBiFKO3BlxORkYMvLBcOBjjFK23PTdFGFSlRLtfDpQHvgldzpCyhNrWeq+ZnkBQPjKCSCEedCACJGsDoRXYz76kLF4/U5GQ0IADGI5UFvvk4sZg7ErgsagQh4Y5TjULEXMeR20VXfkVpk9do45pEvSFhNZcWBQ7TkMwb02Utp/rJufVc7jSLCLg75actpleRWCOyD9rNzr4DiNUrXeQ0YyXZU2wJeJdMwapQLYugevddiLEweP0Fy7HhNVrHTDbCWt+IEuD83pWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsjRizOz4LUJjYxjOp1zqul+zOdkDFrUKyVkbCcNROk=;
 b=mkJ63n6q9cOgsjNzKVRUHYjOadjv8dGCV82MLdbBM8kKjZ/vt09aKs33Uv5oRtvrZL/H85EOQuEoEoYNe0stcJqFv69XpfWmD87XJZfOXH48tDvJKWy8wSFIXTOY4S+k3YVZCM99I91rX6Ur3Y2TVqDqtJCB9iXqXO9znY3gHQn121TcbDd18uWu2ncAQdaFg+JRgPK/KiChD4MGKYohJYopESlenenH1OckuiuLyz4TkgIv3IYhr/GP61Q9gr9qcykWU8ePRwomMNhwNzOaCrjrul8GoA67eSgVKvzrukfnEt9E5CfZj1wa3EmPwz8GvNjyR39T3KnOL61S02qxoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsjRizOz4LUJjYxjOp1zqul+zOdkDFrUKyVkbCcNROk=;
 b=fkyGI96yWm80/An6ZiC0nTCiWAhPGoe9Fv/+0NJosQKH8iymIV+2SdWxq//6xWj97vPMoknljXRpwKgOQqQnMEpRFp1U3AFc0c/9ZwgfwJy+fgXhdsLcpjFmXdrfy8AW6dE8OZ8RmH8dDCH7Sfq3ujc3QD3Z7TFFDnwReIb44iGbuvou4qlmQcNP6A4sjSSdApoGF2XN5ACaY/dBwGHw+9Bh0bqhz+dtZl0X+WFiEuDroKswG9EMgdKftiv2IH+SCBPDKuvhD0Bu2jRcGEnQzTHj37Pds3B2A+IcMmnyrk9YxtVEqTsz9XtTYm6VFVn8FLvqrEAWvxcwCQ/X7rlLXw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1268.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:189::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Thu, 24 Apr
 2025 13:19:43 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 13:19:43 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, Phil Howard <phil@gadgetoid.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: RE: [PATCH libgpiod 0/2] bindings: python: make license information
 in pyproject.toml conform with PEP 639
Thread-Topic: [PATCH libgpiod 0/2] bindings: python: make license information
 in pyproject.toml conform with PEP 639
Thread-Index: Adu1G1zCxzlnTvYBTsaUzUde9uSCog==
Date: Thu, 24 Apr 2025 13:19:43 +0000
Message-ID:
 <PH1P110MB1603A18AAA09EA111167673E9F85A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
	PH1P110MB1603:EE_|PH1P110MB1268:EE_|BN0P110MB1708:EE_|SA1P110MB2038:EE_
x-ms-office365-filtering-correlation-id: 7078a0cd-83eb-4472-2cc4-08dd8332ad24
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SjF6RXhtUVJMVkZvcDUreFZJaVBMNXNsamduMm9VMG5uenVPY1pYL1ZqN2hD?=
 =?utf-8?B?Zy95Z2FjT0c5cmFkM2pBNUVXNW8rQjlFODlCM2c1ZnFCL3FIdk5acjVtY3F6?=
 =?utf-8?B?SEx2MVVtUy80Rm5pWHhrREYwOTRQaEZXcTd0dTBUdU9FckdBeDhFK0llZjdh?=
 =?utf-8?B?ODgvSkhiVmFWU0dvZkdIM0NoL1UzZU92NmtKRTdOYVdRd29RWlpqdzVydmZx?=
 =?utf-8?B?U21tL3g1ZDRvYnhZZlRPUE1pclpNWTFqWWR0UWtyY3VBSmxYNE5RbHg5VFQ3?=
 =?utf-8?B?TVFrQml2SFlKbEdlR2dEUE8yZHUyQzRxNmI3emxidVBud2czSG82dWlHamlM?=
 =?utf-8?B?SFV0QjFCWlRPbXpCNE5yTlNsMmlNQmlMM3lWUUxuNE05N2RDWGFzRngzUnJ4?=
 =?utf-8?B?TEhWM1RiV2hMOE1kVWpibmdLK1hzMFJkN2NRV0ZFVWI4WEZmWi85dTgwaEIy?=
 =?utf-8?B?VEdJU2JPS3FRS1FUVFd3aGtZNUdlRzJDV1BHOEI0eHQ5Nmdqc0s2QVNRQ2pr?=
 =?utf-8?B?Ymx0bTZTZjdIN25qYnMrUkxuVEZjUTdhUCtLNFpiRnNSMFZZSmpSclZnZGdB?=
 =?utf-8?B?eU1Oekw5SU0wL24wWXNmTXBPNzBub2kza1RYWTJsTk5Vbk1lRzViKzl5WDZD?=
 =?utf-8?B?c0JpUGZBRjVvakw1S0RLSXNYTHB3UWs2bXFkdWRoRUZNTmwvd0hlNFNabXhB?=
 =?utf-8?B?T3NIb3hJOUZGMGRyalY0RGNBUm9sdi9YaHM1UG9kREY4N3p5Q2h3eTVrSG1E?=
 =?utf-8?B?OFpQb2x3bFVsbHNCa2dLSDFXdElPZFYrK0ZJbTgvcUc5Qi9oTk0wMEVTeWd3?=
 =?utf-8?B?Sjh1RHJrN0NmdThnN3BRMlJBYXdSSmNTaFhvU1M0clZSQXMxSzMwdkN0LzJN?=
 =?utf-8?B?OFo5U2YwK3ZwZWFhVGlpRUZpNWNBSW5qUEd5QlRCNGF4LzlDVTFZNWJoNjZI?=
 =?utf-8?B?TkZLallGaml1WEpveU4yV1d4S2RPeVZvRkl6OW1wbkFqRzNGRCs4dkdkZG14?=
 =?utf-8?B?ZjJJeGFzYVJuUGthSS82RFB6cUZnbjBxUVhQVHJpRE5Tb1N3OHhYcXY2czZX?=
 =?utf-8?B?UEE0UVRZVXBjdlZJS0VOemMwbExwOU1ZTS9KUGVpL2k2ZTlvQS9pWXFEQzlL?=
 =?utf-8?B?ajVCUlREZisrejZxdDZaai9BR2d6QWY4bGRsVC9PZC9JbG1vVElITkxMOVJY?=
 =?utf-8?B?KzRQakVZT0ZvbXFCeElIYjhXREJoenNMNHdQOHFoT2ZqUCt0bFVFLzdIKzJF?=
 =?utf-8?B?MmRubFFNWlJCV3FqNUkwRTJvVUJQRHY1NldDYWpHWlhPQ29VVTlCU1NQVXpl?=
 =?utf-8?B?ZkU0NExteWo5dlhEelEyaHVzZ2ozZDA0QkJxRktSRHI2cXJxa0YrQW1kc3N3?=
 =?utf-8?B?SkNTUVhTTVdGMHMzNW83MGF4TkxacjNhUEx4UnpBdnJKQXRzbm5UZWFnSWFt?=
 =?utf-8?B?ek1mZlVUbzl2Z203QW9LR1lTbmNQNlR2T3lqdVNaWUIyUHAwdlZ6bVkwQkFV?=
 =?utf-8?B?SXFJOHFacm1aUTI5YVZ3L09uMUlESkhTMjlrOHJPYU5SbnNWc09OdjdqMS9Z?=
 =?utf-8?B?RjhLVzhIV2FsNUpINnJjOHI2OE5PUy9uMWhYcWZwbTdGRTJ1NkdFeW9hV1h0?=
 =?utf-8?B?d0Erc1VxWEQ0eHFxOWdvMk5CRy90dXN3VlZPTENNUFY0R1FQUndMTU1VWHl3?=
 =?utf-8?B?UzF6dkkyNnpQdnoxSWNzQVlZM251aXUvcVNTc21Ta0ZHeFNSalQ0cVliY3Zi?=
 =?utf-8?B?d2dRTHlTTUxSOEVFMXVnYkkybWJ1TTRtUHRDQ3J2bXRtSWhpNThXd25GNlVE?=
 =?utf-8?B?WDVBem13R3JFNHRDazA5S2dTRTVhdnI4QXg3Q0JhZUpIakxNRWtmb1Yra2tr?=
 =?utf-8?B?UjgrWjZ6cWg1STZGRlFpNUhMMzdjUHIrSHN6TlZTeWw0ZHVIdzRsT3EwTmNo?=
 =?utf-8?B?VmVpSEhuVERwbitaNVJqVHYrMWdOcXBibGFoTUpGZW1EaWRQN0lTKzIvblk4?=
 =?utf-8?Q?Q8J399UK5DYwYmnA9319MU8MvxqOUk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aWg3VzZPaWh6YVhoWUVxVEFOS0Jvd2VTa1FuQVgzYmEwMXVXTGNUK2w4V3BX?=
 =?utf-8?B?STRpd0ljOEs2S2hDRFowK0FwRlVjZEN3SUdUR0JmTStocmNxRVQyUTJPNUFD?=
 =?utf-8?B?WWdjQ1Y3MTIySTZ5Zmp2V1FRZ1E5QzNNa254RnZ3aXNoSXpYTlJ6V0tIdDRC?=
 =?utf-8?B?Z1JhY0YyejdZWWlYUnI4UE9TREtSYnVHUHMrODVlR0RRcVV2N0pNWGgrSmJW?=
 =?utf-8?B?VmVab1pNTzdtWWhldXJRRVppZjhEOVQrUkQzc1pna3k5Q1oxQnc3SC82VHdi?=
 =?utf-8?B?enhYRGpJeHdEREZiNTdwVFpBQ0lyRGFjOC92MnZPY0ZzYWg2cTZFdk1uTTRP?=
 =?utf-8?B?L2U0Rnp5ay9BV01nek4zRzhhdkoyZjJZUnV3U0tUSzJ0QmVJVE9UZnF0TURa?=
 =?utf-8?B?bGc4MXd3N3lTaTQxdGVieXUvNzJLYUpqVUhxOHJ5VWl5ZXk3a2JUWk1Jc0dQ?=
 =?utf-8?B?anhEZUkvUHlrSzJUM0xYY1phQVNzSUJJMnhSTThwQ3Z3ZkQwV2hWMStUR05o?=
 =?utf-8?B?eDV1Y2h5c01mMnlFY1ZGMUVIdXJUY3drKzd4QWlsUGsvaEVTU3Nlc0ZHc0xm?=
 =?utf-8?B?NERWR3NnUC84ZGZuRERlYUw0RUJVWTJOc0VDMlJDRzM5amdJWnBXTTlzNWZU?=
 =?utf-8?B?UWgwNDFPQTZwb2FpMjhPM01RUHV1SXVSU2YrZ1R6bEk2VWhnNHNJTXhXeXE3?=
 =?utf-8?B?VXMybWFoeEtPSlFFOUJRd0JwQlBFNk92SldKV1N6aGxyTlg5WEtVKysrbHZL?=
 =?utf-8?B?YWhMSjBHd2Nzcy9vdzlqQ3cyNFFWV21zemJlTXNYVHh2b1luK1lyRU9CUm8x?=
 =?utf-8?B?OGo4VDRYc0FsQkRzdW43SVR0Z0J0YnhIb1pHSVZnQVBWeW50WUUyZ2Z1Zmtq?=
 =?utf-8?B?S1NsME5oWHptTmRwZE9SWTVOenhSZ1RzSlBSNjRHMTY2dEZ6dHVNQVpwSldy?=
 =?utf-8?B?b2ZZNXNKM00yL1NadGlQajFJVTkrZFEydEZjYlVxTjJ3UUNZZG5hbk9QYmZD?=
 =?utf-8?B?RndmWXp5akZUTnZaM2o4enZOaHZNaEpCbDUyNU02ZDlMZkh5YjFTR01pN1lR?=
 =?utf-8?B?RGM1dDBpM3dSN1FpV2h2d3BjVTNVb2pYU2p3R2dGQVlJb3lKQVpiaUg5NlZT?=
 =?utf-8?B?bThUT0RWTUhDZkxCclFGYXNPajI5a1FTbkx5bnV4SFMxNlhSbm0rUm5lalBS?=
 =?utf-8?B?Ujllc0I0T1JKbExlSDZKYSs1bnlDb1lMcHoxSUw0ZVprY1hKVVVYd2g3aU5F?=
 =?utf-8?B?R1RlWnhucWNpampQK01MVXM2d21NTHliZUs5OU5QVzhSS3hlTzZ0djd3SUpn?=
 =?utf-8?B?cStpd3hwTVBDTS9kaVlFbjVjU3pENEVjWlVCNnhDTDhaVXFqWVZjVkwvQ3Ru?=
 =?utf-8?B?QWhwaEhGblZaQk9MWmhDOWtHQXljVkxLYmQ5SndhY3BST2FtQjRBSUl5MFB2?=
 =?utf-8?B?eDRLSkNsVjVlWVpXdWF0b0FNbDBiVzJGY1Vjb2RkZEdJQTgxcjdESnIvU0la?=
 =?utf-8?B?ZGRKTi9tNE5EdWFkNXpyTWlSME96MTFqdkthMVF4Rkt1cWJNY1ptTHlUT1hy?=
 =?utf-8?B?cmlqdjdyWitxMVVKcjFCNEVzejhLWjFHc202R3NmbGFvSVFKOVl4SzJpOFN1?=
 =?utf-8?B?WXJjOURPdnNhZjRSTHdqdWVQTkxDNE4wSFB5WElyT1ZzWVVWVFkwZnZuMVJz?=
 =?utf-8?B?MjZEcUNjMnRBZzRkZ2x0V25YUlZXZ0xBQVJqck1PcEZHbFhXbU5ydWszVlU2?=
 =?utf-8?B?bVZCNWRNaUQveGZWd0JFSGprREpNRWQrN2R6bncvcGpnQVRJbEpndC93ZGNK?=
 =?utf-8?B?MDVBeXhRSm5sREZ1OHVEVElaNVF2ZWw0UmQ3RUdqQXNoUkp1blY2YjZRVnVN?=
 =?utf-8?B?MjFlWWVrRW05a2xIOUZZWFgyRUN6dVF3dGNBSDlkNXZPV2xJbXMyVTdVbkNP?=
 =?utf-8?B?TFlRdmJtZ3NzRXJteGhoV0xlZzJQUnh5WEZtdmhzVCs4UEx3SU1IL3RmeXNL?=
 =?utf-8?Q?y9Pni+leFF+ZCojDLGl3SOvwk+5MCM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7078a0cd-83eb-4472-2cc4-08dd8332ad24
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 13:19:43.2452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1268
X-OriginatorOrg: xes-inc.com

DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCYXJ0b3N6IEdvbGFz
emV3c2tpIDxicmdsQGJnZGV2LnBsPg0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMjQsIDIwMjUg
ODowNiBBTQ0KPiBUbzogS2VudCBHaWJzb24gPHdhcnRob2c2MThAZ21haWwuY29tPjsgTGludXMg
V2FsbGVpag0KPiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsgUGhpbCBIb3dhcmQgPHBoaWxA
Z2FkZ2V0b2lkLmNvbT47IFZpbmNlbnQNCj4gRmF6aW8gPHZmYXppb0B4ZXMtaW5jLmNvbT4NCj4g
Q2M6IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBCYXJ0b3N6IEdvbGFzemV3c2tpDQo+IDxi
YXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+DQo+IFN1YmplY3Q6IFtFeHRlcm5hbF0gLSBb
UEFUQ0ggbGliZ3Bpb2QgMC8yXSBiaW5kaW5nczogcHl0aG9uOiBtYWtlDQo+IGxpY2Vuc2UgaW5m
b3JtYXRpb24gaW4gcHlwcm9qZWN0LnRvbWwgY29uZm9ybSB3aXRoIFBFUCA2MzkNCj4gDQo+IHNl
dHVwdG9vbHMgdjc3IHByaW50IHRoZSBmb2xsb3dpbmcgd2FybmluZyB3aGVuIGJ1aWxkaW5nIGxp
YmdwaW9kDQo+IHB5dGhvbg0KPiBiaW5kaW5nczoNCj4gDQo+ICoqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KPiAqKioq
KioqKioqKg0KPiBQbGVhc2UgdXNlIGEgc2ltcGxlIHN0cmluZyBjb250YWluaW5nIGEgU1BEWCBl
eHByZXNzaW9uIGZvcg0KPiBgcHJvamVjdC5saWNlbnNlYC4gWW91IGNhbiBhbHNvIHVzZSBgcHJv
amVjdC5saWNlbnNlLWZpbGVzYC4gKEJvdGgNCj4gb3B0aW9ucyBhdmFpbGFibGUgb24gc2V0dXB0
b29scz49NzcuMC4wKS4NCj4gDQo+IEJ5IDIwMjYtRmViLTE4LCB5b3UgbmVlZCB0byB1cGRhdGUg
eW91ciBwcm9qZWN0IGFuZCByZW1vdmUgZGVwcmVjYXRlZA0KPiBjYWxscyBvciB5b3VyIGJ1aWxk
cyB3aWxsIG5vIGxvbmdlciBiZSBzdXBwb3J0ZWQuDQo+IA0KPiBTZWUgaHR0cHM6Ly9wYWNrYWdp
bmcucHl0aG9uLm9yZy9lbi9sYXRlc3QvZ3VpZGVzL3dyaXRpbmctcHlwcm9qZWN0LQ0KPiB0b21s
LyNsaWNlbnNlIGZvciBkZXRhaWxzLg0KPiAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4gKioqKioqKioqKioNCj4g
DQo+IFVwZGF0ZSBweXByb2plY3QudG9tbCB0byBtYWtlIGl0IGNvbmZvcm1hbnQgd2l0aCBQRVAg
NjM5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5n
b2xhc3pld3NraUBsaW5hcm8ub3JnPg0KDQpSZXZpZXdlZC1ieTogVmluY2VudCBGYXppbyA8dmZh
emlvQHhlcy1pbmMuY29tPg0KIA0KDQo=

