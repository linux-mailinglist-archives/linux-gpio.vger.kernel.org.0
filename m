Return-Path: <linux-gpio+bounces-11067-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 954CB995132
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 16:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 578292835B7
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 14:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FAA91DF98B;
	Tue,  8 Oct 2024 14:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="7Dfxybom"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0042.outbound.protection.office365.us [23.103.209.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393CA1DEFEA
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396811; cv=fail; b=E1R0FPB0AGNi+4T2s44pPAqA/K4+QnqoEuIb2XB03XIXerRJ7ZYZrQwTH4qH4Gqu6SnI32JdYzflqQG8KVDRf4qavvZzykgSaolYFPdDIThCuZn+JlICue1bOeUfpIxdJ2ybbPgrYqUbY5Rjqq0/UCUxCf3JOnVyebTsL2O9eLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396811; c=relaxed/simple;
	bh=qwGN4Yau2dpYGDGPTcgIa9rC6Y/xQXfPrDVRvp5eJ/8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PoDrZgDCbkZJUizm8/QqYv018ztDDN5lYQYCtHV0232Wvi3YK7N3gJq9416bZ3hZIbROiDrwz/f/FgjFjRgqxkV/LX1abJUp+t/+zzzloTUbrZth1avSGSvYZE3k3UNjclh+DQkdX7lK7O/58OWlaoyG5oFjXAtMuBQMyNH/OIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=7Dfxybom; arc=fail smtp.client-ip=23.103.209.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=I1+xfGdmsOXxuxwbSr2whDQcSxnQOOejkUMnz0P7ZlJgtgdDfikPYBs1NmTC9eOYf9n1BPJ1sr3EOblbziRHNZerT4V7UBddqKgl2cev+F4EUsSugBxsG80Cd1KARttvRAna7oavENDXqzGItoD90+bAfyw/pcQdzVo7vkRyPERrtnqqzZ2tzoob/sAsowgC0r89ssIXUAaj6pcgksQSk6s7O8VYQnu1I5+sVVf3bPVp1UIN1RePQoA7umf6mrBA4A/l9JKL5iPatmlpOIXhIRq0R+fC3BTsERpDd6mznBMLP96V7ikWhlQ+y+N0xaczQ4J/dkVHbAWq/PYs/n8S8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwGN4Yau2dpYGDGPTcgIa9rC6Y/xQXfPrDVRvp5eJ/8=;
 b=xO1e4RqEgNgJWZNkMr+3F+pZINlD8u8vTJTd8riUjaXXASXEfWf/GKPJQv2VeNaK6T5+Og6YDPWQl8Ww/gcEI/u7bDVEzmcdNL3tU17KVGcucJqHDYQflZeuR/Sf7kg9sfEZApE23vRzIhijjhtwNkQQwc/TI6pnf7l8bfu+r53/neUYrrx6TsFocpFrqLEVpSPfARy+MNYAJUPMso4duJf6JLfgn0QaZJOERT1Ko/6ZzyZ0DiY6lxH3jMisTgBfqzl+WJngj/h5L4YKJDXuh8j9hKj51Nh3Dv1C/MPOMEdMrm9w7PxBB30byR/RXNm4UYVOwBkXO40R+f8hOp0x/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwGN4Yau2dpYGDGPTcgIa9rC6Y/xQXfPrDVRvp5eJ/8=;
 b=7DfxybomYtRF0VIBqeZMTnZI26uawCWdLEb8HvTyIrfXc6tB+6MRcfF6eXHRPStzZ96ouCLf6UH0ULwyWPG90rqODfbsYpv9WRKlGQXhnJa1oGhWlPHjnFYR/rFlyBtpe8QG+ogEZcFzpsZ2NzJNDL8fZXshkSeAPevk4d1qjD4PrJOzHJ4wKTfPOxOcJyVtDRkK7J6pVO5jfCyhHkgYY75JQg2PdVYe+fYIH0MPDeb5qqGTR0vwOskktJyQXiowXrwYp5cvDta7pmYOlKs8YC8av3LQjDbA7PzjAoEjwBuv5yBizhdpC2vPl4lZScmgtW2B3DHrN1Ywj1XWNJ64/A==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1113.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:175::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Tue, 8 Oct
 2024 13:38:50 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.7982.033; Tue, 8 Oct 2024
 13:38:50 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"vfazio@gmail.com" <vfazio@gmail.com>
Subject: RE: [External] - Re: [libgpiod][PATCH 00/22] bindings: python:
 conform to mypy and ruff linter recommendations
Thread-Index: AQHbEQ7ARZqKxH8p80KbElPfjetdKLJ87GWAgAAAMjA=
Date: Tue, 8 Oct 2024 13:38:50 +0000
Message-ID:
 <PH1P110MB1603A40C2D7D3AD07B57D4349F7EA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1113:EE_
x-ms-office365-filtering-correlation-id: b6eb3649-e3c9-4287-9864-08dce79e8afb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R0dhMlEzZXUvbkJiNWhZajZaeU5Ndmtmbkk3Y2czaFp6d0ZMSVZ4UEZpTFFO?=
 =?utf-8?B?eUYxanFEc3crdnpqUmlzNFU1VmlQOVlTS09HR09MNWVMMWlySDFRSzZCVTFG?=
 =?utf-8?B?RW5lQWIrTGUvS245YjBSd2FkM3RMZU1JMGJBNWlMS2VYbUxWL0t0aHo3eXhD?=
 =?utf-8?B?Q0tjdnBZY0JrNURjUHVyQTVleDdoVFR0VjlFU0ZRTkdzeTljMmQ1M2s3RVpx?=
 =?utf-8?B?M1lWSk56c3B2TTRvVXRqalJoSlZFRUFQR2l3VndIdExvODlJRjJldXhpb3Zq?=
 =?utf-8?B?VDBIeWhibGhobERmVkFzT2RCWjdWYVM1WFNNemluV2p1dGgxV0lQSnpLN2FI?=
 =?utf-8?B?VTMvbkZ2MDBIWSt4WXV0Ny9MaURFOC82SEVCQklLTGpFR1VWNkVCdExLVGgv?=
 =?utf-8?B?UHU3enhDRVdmWVdRRGdUL2JvQUtwVE5wak5XOUd6anhHMmlLNFBTM01mZ1A2?=
 =?utf-8?B?eDFKMUhkRXNyMzRRc2tuTHRrK3VqY3ZRc2hmT29mUHRpcjJzWW16SEJBTEdi?=
 =?utf-8?B?Ty9sOXFJY2R6U2NpN0pYbTRRK0Fwazc0WjMwRFAvSll6ems5ZXdvcEZJU1dS?=
 =?utf-8?B?bmE5a0pqaGlwOFc2eS9MVEZTaHVMdkFrQ0lkMGJ2bDdqZ0JocStoYjZhb0pR?=
 =?utf-8?B?cFRkdWJWOWxGWGYrdnVpRDRUa1RlSCtoN2ZzYjZwSW1oQXVSbXREY0hVZnZy?=
 =?utf-8?B?Y0JsTUswTWNQaEtOTVBoc3dRSitvT0VmTE9BR0xrRnpuQWhaREEzbnU5cnVZ?=
 =?utf-8?B?KzhpUEFsVnVYQTlkbXRHa3F3akc1ekxnSlltMzI4TnR4Z3ZDaytUV2wybW96?=
 =?utf-8?B?Y2F3QXdmYi93MnRMZktyU3hiY1dNd1JxQXpJbUJOQjZzS2lPWjVac21vdm82?=
 =?utf-8?B?bmZKUWFESEcvRWZIbDNqR0dhZGY3eWdQbzZiZkFVZ3VQQTZTWWJJR3B4QzJX?=
 =?utf-8?B?WnVBRUgrQVhMZ0FhYTYxeHlydngzRDBGSGphZWp1eHRkUVRjWnh1d0x0Nzhp?=
 =?utf-8?B?d0d4SE5RUmNydURmZWRTZGZyTDBvQnQ0WURKMkhHRHFWRnFCMnhZaXp1KzdR?=
 =?utf-8?B?NWpXS0NjS3FrczN5bGd1V1o0a2tXZW9qM20yRGw3RDh6SUZwYWpJSjJGOHJz?=
 =?utf-8?B?Q1RSU2lEM0F4eVpRTjVOekFXQ08wYStJb2RKcHpMK0pzZ3A4VG1qb0graEtP?=
 =?utf-8?B?T1hlYitESXZhRnpidnhOZUV2djFmUUxGb3pZV0tlbFBRc3JURkd1bVI5d2NQ?=
 =?utf-8?B?dUZnSGl6dk9tdVhNVjdZbTVnZ1lHdFpJUXNoK1lScDNkcGpIWGpjWHNpcmw3?=
 =?utf-8?B?bTVKWmNWZU9vUHEyQStLbE1qQ3UvRTJsL2FBMHNlSG5DekVNZitGNGZaZFVr?=
 =?utf-8?B?dGZyd3dHaFdLZkNoNVNUQnVpKzZRV3B1bTV4NjdsUG5LTTlVbDJRVlREZjhh?=
 =?utf-8?B?Wisrcmd6T1A5OW5YL0gxd0p6OXExNDgzZFU5Vm5xTHNCbnFSTk9Hc0dTajVO?=
 =?utf-8?B?MllndngwY2EyT09RMkJRV1dhdVBZMlkyRC9XRStUcEdKdVIvM0RjQzc3ZFJD?=
 =?utf-8?B?QWdtbXk3UXlPdFNSc2plb3hpWGxVWXBTN1RoTHNtOWVlc1RQd0lmZFpyVndv?=
 =?utf-8?B?SUg4MVBJNGZVeTBSbnFZQkYvTktkMk1wT2hKRWNLME14WFlQd0tMSGhtWkYr?=
 =?utf-8?B?dXJuQ0hFWVRDUGZ4Y1AvNkZzWkhnSkI1ZWZvY29KaVo5bXd6Vm1QSnZnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S3dxSWlLd3QwSzJscCtHVUM4M3BJTFhldHFTNlZBQ1R5L2JzRXdVMXVYZWlm?=
 =?utf-8?B?ZHB1OGtYRXBaWUJtaHdSSG9UcG5ERzZkdTBDancveFpLNHRnT2JlRFVTSDVw?=
 =?utf-8?B?RVNnTHNLSkN2U2V5K2FKRWs0aTZtSnIwVXpQQ0tPYWdNK0NrSC9GSisxaDRx?=
 =?utf-8?B?eVVDbGQ1eDE4WUVsNnkzMkVlWlhJb2I1YmdYbUtMY3VvN2hBWDM0ZGJjdEZm?=
 =?utf-8?B?MHpwUVdUQm5GamJwQklZZXVKWGQrWE1CSGRNaHNFZE8rWEtpNlR2TlFiZUk5?=
 =?utf-8?B?S3Ixamc2aVdJVERQMjRMaGJDUjYrTExuTTJJYWtkcm9wMXpXc0d3VW9YN01L?=
 =?utf-8?B?cVpCTTYyOXF6NS9CTW5hWERJZE5aQmxOa2hlUFdDTnBCVjVwb3hJbFB6TFJu?=
 =?utf-8?B?REdaazdLN0dnQXZIL3R6WkpLSDZ6WDlLWWplUHA1V3J1UWliTWREYU9EZVE0?=
 =?utf-8?B?QjNQQktBM1BDZ0NlMENyZ21qRGJHbENEWmhWOFhyd0J0cEpXVlZlQWxKb2g5?=
 =?utf-8?B?czVUcFZaamhNRlN1Mmh3TGRUa1hPeWEvb0pyMW9kK1RKSHBZOWN4L1FXTTNk?=
 =?utf-8?B?OGM0YmdjU0pFays0MmVUclhndFhlTVAyMzNhdlpJY3A3aDh3emxrTG9oTWFz?=
 =?utf-8?B?VTdWWnJOQjhFcnlMY1F3c3hyUVBBRSthSkIwTmJyV0RZMERZOEhObjMzZHR5?=
 =?utf-8?B?bmtWdGFiVzVFNDJJRFFTSEM3YXJHeEM3WC81V0VvQmpJTFJCdlFOZVoweTVL?=
 =?utf-8?B?VENvS002YUJ4U1dNZzI3RVR1cTBHNEZuRVN1TzRrZGxEdmhzMnpXVmxEbFR6?=
 =?utf-8?B?Z1NneVVMUWNMcjR4WDBCS3Y5RUhXQUpLSm95b3lGRnpyUXBIN3h4TmFZTHg2?=
 =?utf-8?B?WHc4MGxyOFVtWXFkbTB4MDhmVFhKMnRISVpuNHJDM3R1SlhxNjdPOGdMSnlQ?=
 =?utf-8?B?SHJCeityV00xSXR5aENVUzdyQm5UZzJkYStBTDlBQXdZUUwrTTZWcHBsd1d4?=
 =?utf-8?B?bGY3TnczT2E5WFVrSkk0dlVYc00wdVBkdWJLRk9tWFJKRERVdkdid3RSTUU4?=
 =?utf-8?B?VjJZVjc4dW5NZVVwZ0FaaEtxRkJEaE93TndUU05XRFBmeVZ6UG1ZaTVSS3dr?=
 =?utf-8?B?SFF3T0pycVk5YXNIQlJ3TG9OMU5lcklLUnFGLytFYVo2MGRRZHQrcllKN3NO?=
 =?utf-8?B?ZkFKNklrWXBFVEowejRLd0NEelhRUlJwOG9OU25ScHk0U2tJU3c2cm9lS29v?=
 =?utf-8?B?aDgrZ250SytBSkNVd1pkNUZXUS9jTlNiOFZBS0dXQlNUUHRYV3Y2RWlsa2Ev?=
 =?utf-8?B?ZjNsNkFqbGxFd2RwNlhaMFVZMUZ4MndQRzNIeDJOR01NKzV4Z3RRMThDa1J5?=
 =?utf-8?B?WDFxSGp3SUVkWVNrM0RpeWhXbUI1RnJJbURDYmlNTUQva0dsR1pqM1NWd0J6?=
 =?utf-8?B?dFJEZmxEdlFpT1JsUjhQeUNpbzVnVjVRdzhNRUFoNjQ5US9CSEltN3ZvUVJw?=
 =?utf-8?B?b0pjQy8rcmZ3eXo1bW1wNml3WTVKdzBDMldCbTlxelFXdVF3b3NwMHVEalpr?=
 =?utf-8?B?dFl1dzZaQmdHK0I0amh5Y1pUS0NDcG1YQ2RkMWozajhpcU9vU05ITjJ5QzJS?=
 =?utf-8?B?ZTBkY3QzSFc0SDJVWDlOWk9yYzBoUXk0bHhNMGpkdm9KUHR3ZnMvdi9BdFEy?=
 =?utf-8?B?YWhYR1VxRWxaMzVwSFlpcXNPbHRIWEExWXBFWEhyWGVpOEtueDZlTkdPYk9Q?=
 =?utf-8?B?QzhxODlGTUhzdkE1WFlxZkQ2UDlDZmsvY1dPc2ovU3VSS2RaNSt2U3IrSnQv?=
 =?utf-8?B?aTNIUmZOelBXVXYyOHk2TTl2RDgxQU01bllkSGRLem5xZjlFaTVndlJRU2My?=
 =?utf-8?B?NXBvUjUrVlQ0T1ZFVTJ1dDZsY0g5Q0t2TVFtTWFDbWYwNXdPUjZpckl1TGR0?=
 =?utf-8?B?cWtncjYvZllPbFdOS1BQVDR1N0dWU3RvcmQ3OU93MDBGbHUvZkpXRUNlSU03?=
 =?utf-8?Q?axOYrR7zKWjcUSdvGN4GdGkbEeA32k=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b6eb3649-e3c9-4287-9864-08dce79e8afb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 13:38:50.2067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1113

QmFydCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCYXJ0b3N6IEdv
bGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPg0KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDgsIDIw
MjQgODozOCBBTQ0KPiBUbzogVmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPg0KPiBD
YzogbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IHZmYXppb0BnbWFpbC5jb20NCj4gU3ViamVj
dDogW0V4dGVybmFsXSAtIFJlOiBbbGliZ3Bpb2RdW1BBVENIIDAwLzIyXSBiaW5kaW5nczogcHl0
aG9uOiBjb25mb3JtIHRvDQo+IG15cHkgYW5kIHJ1ZmYgbGludGVyIHJlY29tbWVuZGF0aW9ucw0K
PiANCj4gT24gRnJpLCBTZXAgMjcsIDIwMjQgYXQgOTowNeKAr1BNIFZpbmNlbnQgRmF6aW8gPHZm
YXppb0B4ZXMtaW5jLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBlbXBs
b3lzIG15cHkgWzBdIGFuZCBydWZmIFsxXSB0byBlbnN1cmUgdGhlIGdwaW9kDQo+ID4gbGlicmFy
eSBoYXMgY29ycmVjdGx5IHR5cGVkIHB1YmxpYyBpbnRlcmZhY2VzLCBpcyBwZXJmb3JtaW5nIHBy
b3Blcg0KPiA+IHR5cGUgY2hlY2tpbmcgaW50ZXJuYWxseSwgaXMgY29uc2lzdGVudGx5IGZvcm1h
dHRlZCBpbiBhIHN0YW5kYXJkIGNvZGUNCj4gPiBzdHlsZSB0aGF0IHRhcmdldHMgUHl0aG9uIDMu
OSBzeW50YXgsIGFuZCBwYXNzZXMgYSBzdWJzZXQgb2YgbGludGluZyBjaGVja3MuDQo+ID4NCj4g
PiBQYXRjaGVzIDEgYW5kIDIgcmVtb3ZlIHVudXNlZCBpbXBvcnRzLCBzb3J0IHRoZSByZW1haW5k
ZXIsIGFuZCBlbnN1cmUNCj4gPiB0aGUgcHVibGljbHkgdXNhYmxlIGNsYXNzZXMgYXJlIGF2YWls
YWJsZSBmcm9tIHRoZSBncGlvZCBiYXNlIG1vZHVsZS4NCj4gPg0KPiA+IFBhdGNoZXMgMyBhbmQg
NCBmaXggYW5kIGFkZCBhbm5vdGF0aW9ucyB0byB0aGUgZ3Bpb2QgYmluZGluZ3MuDQo+ID4NCj4g
PiBQYXRjaGVzIDUtMTMgZml4IHR5cGUgYW5kIGxpbnQgZXJyb3JzIGludGVybmFsIHRvIHRoZSBi
aW5kaW5ncy4NCj4gPg0KPiA+IFBhdGNoIDE0IGZpeGVzIGEgZHVwbGljYXRlIHRlc3QgbmFtZSBp
ZGVudGlmaWVkIGJ5IHRoZSBsaW50ZXIuDQo+ID4NCj4gPiBQYXRjaCAxNSBhbmQgMTYgcmVtb3Zl
IHVudXNlZCBpbXBvcnRzLCBzb3J0IHRoZSByZW1haW5kZXIsIGFuZCBmaXgNCj4gPiBsaW50IGVy
cm9ycyByZWxhdGVkIHRvIGEgc2hhZG93ZWQgZXhwb3J0Lg0KPiA+DQo+ID4gUGF0Y2hlcyAxNyBh
bmQgMTggZml4IGFuZCBhZGQgYW5ub3RhdGlvbnMgdG8gdGhlIHRlc3QgZ3Bpb2QgYmluZGluZ3Mu
DQo+ID4NCj4gPiBQYXRjaGVzIDE5LTIxIGZpeCB0eXBlIGFuZCBsaW50IGVycm9ycyBpbnRlcm5h
bCB0byB0aGUgdGVzdHMuDQo+ID4NCj4gPiBQYXRjaCAyMiBhZGRzIG15cHkgYW5kIHJ1ZmYgY29u
ZmlndXJhdGlvbiB0byBweXByb2plY3QudG9tbCBhbmQgYWRkcw0KPiA+IGRvY3VtZW50YXRpb24g
dG8gdGhlIHJlYWRtZSBzbyBmdXR1cmUgcGF0Y2hlcyBjYW4gYmUgZXZhbHVhdGVkIGFnYWluc3QN
Cj4gPiBhIHN0YW5kYXJkIHNldCBvZiBydWxlcy4NCj4gPg0KPiA+IFRoZXJlIHNob3VsZCBiZSBu
byBmdW5jdGlvbmFsIGNoYW5nZXMgdGhhdCBpbXBhY3QgZXhpc3RpbmcgY29kZSBhcw0KPiA+IHBh
cnQgb2YgdGhpcyBzZXJpZXMuDQo+ID4NCj4gPiBBbGwgdW5pdCB0ZXN0cyBjb250aW51ZSB0byBw
YXNzIHdpdGhvdXQgY2hhbmdlcyBhbmQgY29kZSBjb3ZlcmFnZSBoYXMNCj4gPiBub3QgY2hhbmdl
ZC4NCj4gPg0KPiA+IEFmdGVyIHRoaXMgc2VyaWVzIGlzIGFwcGxpZWQsIHRoZSBwdWJsaWMgdHlw
ZSBhbm5vdGF0aW9ucyB3aWxsIHJlZmxlY3QNCj4gPiB0aGUgYXJndW1lbnQgZXhwZWN0YXRpb25z
IG9mIHRoZSBjbGFzcyBtZXRob2RzIHNvIGNvbnN1bWVycyBjYW4gdHlwZQ0KPiA+IGNoZWNrIHRo
ZWlyIGNvZGUgYWdhaW5zdCB0aGUgZ3Bpb2QgdHlwZSBhbm5vdGF0aW9ucy4NCj4gPg0KPiA+IFsw
XTogaHR0cHM6Ly9teXB5LnJlYWR0aGVkb2NzLmlvL2VuL3N0YWJsZS8NCj4gPiBbMV06IGh0dHBz
Oi8vZG9jcy5hc3RyYWwuc2gvcnVmZi8NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQg
RmF6aW8gPHZmYXppb0B4ZXMtaW5jLmNvbT4NCj4gPiAtLS0NCj4gDQo+IFBoZXchIE5pY2Ugd29y
ayENCj4gDQo+IE15IG1haW4gY29uY2VybiBpcyB0aGUgbGFjayBvZiBwcm9wZXIgY29tbWl0IG1l
c3NhZ2VzIHdoaWNoIG1ha2VzIHNvbWUgb2YNCj4gdGhlIGNoYW5nZXMgY29uZnVzaW5nIHRvIG1l
IC0gYW4gaW50ZXJtZWRpYXRlIHB5dGhvbiBkZXZlbG9wZXIuDQo+IA0KPiBJIGFkZGVkIHNvbWUg
b3RoZXIgcmVxdWVzdHMsIHNvbWUgY29tbWl0cyB3aWxsIG5lZWQgc3BsaXR0aW5nIGludG8gdHdv
IGJ1dA0KPiBvdmVyYWxsIHRoaXMgbG9va3MgbmljZSBhbmQgSSdsbCBiZSBoYXBweSB0byBwaWNr
IGl0IHVwLg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXchDQoNCkkgd2lsbCByZXNwb25kIHRvIHNv
bWUgb2YgeW91ciBxdWVzdGlvbnMgYmVmb3JlIHNwaW5uaW5nIGEgdjIgc28gSSBrbm93IHdoaWNo
DQpkaXJlY3Rpb24geW91IHByZWZlciB0byB0YWtlLg0KDQo+IA0KPiBCYXJ0DQo+IENBVVRJT046
IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4g
RG8gbm90IGNsaWNrDQo+IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNv
Z25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUNCj4gY29udGVudCBpcyBzYWZlLg0KDQo=

