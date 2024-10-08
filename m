Return-Path: <linux-gpio+bounces-11066-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F07995129
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 16:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1AD21F27756
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 14:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A501E04A0;
	Tue,  8 Oct 2024 14:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="MsN20HJ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0053.outbound.protection.office365.us [23.103.209.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06621DFE32
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396742; cv=fail; b=ly+JWLn+AMd8BQ44q4+ftiaacc1YHeu4LwEWBtGliKbS5uaAMlPKavoBOmVBzA69xYMECbYM+Olv2mFUbo5qFybAKUkk73ea4JZuFgRGIdRBDNcezhEr5p59doBSoLkm+zTaknw3pLchYxH+UWvd916qIgaMsG/Onlcftetu6tQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396742; c=relaxed/simple;
	bh=1emtv0Bt3RcufuaVfP+00hRTB/JTBNyZkvDjDNHmdHg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qJh9SZvDI4A2rI+xKcofNHgz6ten7XXSKqYOxJkbUb/bkDy3tfOy3yO9hYaQZdtch9n1QWrakpQypqsrk7XoPxutAZ3rOwWxn1DaEe4M9yNxWpv7yUdv24jHhlcroPjeF72WOsat93/hegfH9zcjCLXm6DHonkFL3d9YLsc8A2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=MsN20HJ2; arc=fail smtp.client-ip=23.103.209.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=sMFrTtprPKfmY6MjOgvhOoRVhTBElVZfL0CzDjbcVXPEPvobISK0kPj62NjR74Knj9Hw1UHHrFgzrsr6yghtlh+WQ9iaEO+vFekcu9nPA/yDdF5K1D1mqvinjBOuXpaHXIhW+1XJm4yHw3STKWIc0BQI9C7WhtA9txK208fr6wWIE/dcpmMG8ZAflZGzdjUgRVrw+N4OqXHJzpY5B6yp9N7EbqEt4Kx8bqFnoF0NRUeFpEaG/9q/xfkQK5zmVBljZqLuApZeyyb4zXFMZCFx9q3XnHZ/DOFCvavk6zktoiZ9gvuAHvS+rzwcGcWNaDqXr6vq7DLvjm/SQPfEjmRVCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1emtv0Bt3RcufuaVfP+00hRTB/JTBNyZkvDjDNHmdHg=;
 b=BekEQoAnxnxqm1X/QvyopJmOmsGN3xcUQ4o1hfPX/BQUCiPXMVlnoKqCpgffTq6AS3d/atj/Q3yuYKRDvXSdTIXIZbZjuahlyQyAMPNkRWRrbPRBosdUKkriv7QcfCoOZXLiI/nR/1bXfsAR2R+XcIDJJMXICB4zM8kbu0OK//6nBnZoJgkI8Qj/6v507HWOTKTP6DNa3G+EiyTxIjI3bVHi8y2cPQL3w6oft/52p9p0y4SfSDY3xR4l9H73WwSduaz2m+u4VzEiU7xCXYA6G2ORVMtu/cFxPuY475bp6ZRBisD5g08hId7etLq5Iy5vK96sDXr2cbNlimvGAZfcKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1emtv0Bt3RcufuaVfP+00hRTB/JTBNyZkvDjDNHmdHg=;
 b=MsN20HJ2rsziSo3s2DBmNsZd63GcsyZtEWozv3k7wn/+fn3sQoDZV/DW4NrrH3UDvlv6gtlYZYN+rP95JfHMP8LS+YFm4bwN8CiVOuKbNXW+jqLYdHzAUpbD6gDPO5M+K/r3kMx9Kmnvxb+Hd3C9PBpddLeiVLIC4V85BMnisbhpmNom4NZoI1jSN/wR4xG2qipfR0wTrPWujqooFCJ69dx+8ur89/iKsIbNjzJ2NG3PVNgVVClbhZhW/N/nXok/wSWAnXcK0FDqhHsxcTlPgqFl2xJcdkDHcr+VnfQjdOalOfPpXJUuJ0YvJJXnc00CROVxIqsqwfC77nnNqE/spg==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1131.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:177::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.32; Tue, 8 Oct
 2024 12:37:42 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.7982.033; Tue, 8 Oct 2024
 12:37:42 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"vfazio@gmail.com" <vfazio@gmail.com>
Subject: RE: [External] - Re: [libgpiod][PATCH 01/22] bindings: python: clean
 up imports and exports
Thread-Index: AQHbEQ6+dwIEGoatOEeZt02GG8slMbJ8xMyAgAAC8xA=
Date: Tue, 8 Oct 2024 12:37:42 +0000
Message-ID:
 <PH1P110MB16034E0BC481FB633E39D28E9F7EA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1131:EE_
x-ms-office365-filtering-correlation-id: a22db77a-6d98-498a-d986-08dce79600bb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|41320700013|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YlY3Q0gvVi90MkovSmxiYjBNaEMzK3IyMktGaFV1Q1dRbVdyakxzc2JQWk0v?=
 =?utf-8?B?bnN3MFdsYXFiM3cycmlpTEkwVWliWkkxSWRZT0pHNDNlZVh0TngvbjJQOUtR?=
 =?utf-8?B?V2FEa0YrWjNUdzVqTWRIQnZ6eU1ySElWYnUzZmtWWFpRejNhbjg1c1FvYXZZ?=
 =?utf-8?B?T2pEVXI5OFdLc05lV3dzZ1V4Z2t5Z0R2UUpHdkZkbmF6MGNzZko0dlZ2b0hw?=
 =?utf-8?B?WDBpeDZObnNCWmhWNVBBNHpKOE5lcEZqYU5QaWc1UHNveWhpdlhrTXNBMFlQ?=
 =?utf-8?B?ZHVJTm1GTml2ZFlJYlJ6cXNkK1ZVVlRWQlJKTlNWajJ3bVcwZlBiU0NKRTRu?=
 =?utf-8?B?SVBFSlJkakh3MlIzQmZWL1djN2dpMXIvcm9DS3FWVHVCbHpPa09PTWgwOXRN?=
 =?utf-8?B?SExXVEt1bjNmZGF3ZEpQQ1VqVzBkbnltd0dHMzdTTE9YVk1jbjUzUmRsckwx?=
 =?utf-8?B?U0V1QlBxb3BOd1pUWmNqbjVCTHhIKzJTanBPWkQxcEROVWI3ZDN1ZW11SUVi?=
 =?utf-8?B?ZWhsSXFBSkx1dGpjaG4xQjdRSjEwVVM5SWVUcGUzT3pWdHRSRXUwY1FFV2Ji?=
 =?utf-8?B?dER2MTRNK2JmazNHUmZuTkRIcGkvbEJNUitIY3RnTGcxNzBYVmJqTll0M1Jj?=
 =?utf-8?B?MU9EanVKUDMreGQvaE95TEhWcEhrS1pURjNmUHk5RGw4MXZPRklpb3lhNHdz?=
 =?utf-8?B?WVNQZGxmaFNwdjQ4enptVDQvTHpCdUZEOXl3N3ZIOHN2M1pwYURHakdiTnJy?=
 =?utf-8?B?TzAwRElURnhYUUJMSFlwV2N6cU13a2FDeDF0NDFXOFFhVDA5YUtwNlNZeE5V?=
 =?utf-8?B?MTB5RURJQUlvVDNVbERMd3RRQ1Y5a0loVTFxcFRJNlhDSitXdHZmN1drWEh0?=
 =?utf-8?B?cEExS2lyZHZBdTRyenVrV3VmSlhkTnFiV2hkM2JzVnB2MlhLdHNyQTVXWlIw?=
 =?utf-8?B?ZkREMnhUV3hGSyt4Q3V5YXBMY3RMWE93bHI5Nlg4cFNadnJyNGQwVUI0Tjgx?=
 =?utf-8?B?enRxLzBGdDZQSjVXcktoUldTNmtzOFhudHZmUGhZalllQndUN0hkZkE1NGZn?=
 =?utf-8?B?WXpzM0NqS1lidm9QRFh0bXZXclJIMHVTYklvei93VFI2SjNCQmY2by9XdDRJ?=
 =?utf-8?B?RGZ3TVQ4YUVxbjJLejliejJQL3dtNE43R3J6UlBUbDlNVTVqOWtZcWZTdzYx?=
 =?utf-8?B?Y3BEellDd25WaHYvNm0wN2p6MGsxWnF1QjI4OEsxbW9rY0JDWHA2aWpTaGx0?=
 =?utf-8?B?bEQzajB2Q1l4NENSbE5YckpXTURvUCtCR1pmWTllckh1U2o5WDlrOHpITFRm?=
 =?utf-8?B?ekFYTEtVSmxaRzgvMk0vNDNsTXJTK2dPMCtDNXE5Z2V5RDZjKzdrNG1IWkNa?=
 =?utf-8?B?Z1F5TTcyQUg5R2l4NVB5WTVpTTRZOHZXdUZIaGFEQm1HQm56V2l0ZUdPZ3pN?=
 =?utf-8?B?QThqQ20zL2duV1JLOElqVjFxQ2hCNitTZFluSUJITUIyc0xuejhqQ2RuQTJn?=
 =?utf-8?B?ODdkTnk4Q1cxKzl0NUMwUTdUTkFEdGM4TXlibTAybUEvbXZHdzZFRjFXcVh4?=
 =?utf-8?B?TWNOdXJPVXlsK1d0alRXakZocmh2VkVLbUV4QXJQTEc5YklwWjhTU1Brd2hB?=
 =?utf-8?B?YW8rZ0RQV3dwV21FNWM3N2hyZmNlNG5GVGo0L3Yxd0NOaFROcWp5VmxGTDc4?=
 =?utf-8?B?VndmV3pqV0p0ajJnUCs2N3dYQlphUFlyd1ZDU2hhbEZEc2haM0xDMUo3bWo2?=
 =?utf-8?B?LzVLOXlCQTNxSDRWMWdka3NtdFh0TE1ZMmJxbWZDc2RDKzU4WWdHclB3ZDdl?=
 =?utf-8?B?cTVvVHNsWElxeUcwUzk3UT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aXlpQVZIZEdPcWFVUXQweEVtb1JBakhGTTVvdHJzTWhpa0plR2h2SU1GWkls?=
 =?utf-8?B?UklMQTUycWxZYXkrQldRQUFOTC9iTUpiNUtSUXhRWi9vSUZpQWxjeU9xVWFJ?=
 =?utf-8?B?bEErTk0wNCtJS0hGcU51aVYwaHRTeHMrNHorRk9qd2ZqalFzWWRVdlppVzhH?=
 =?utf-8?B?TUx1STJxL2JXbnI5OEZuQTJOeTZPTGpBQUtWL2tEcEdZVU9CRS85d1pFL042?=
 =?utf-8?B?NHUzSUMyRndxajVVNDlFRnVRYm85WG8xVzhBSVhWMEVib24xL0l5NkYwMzdT?=
 =?utf-8?B?MjVqY1FDakcyaVdqTXJIeE9OdlptWHNhM3pJNW5uU0VNR0Z1WXdvMWZweXhx?=
 =?utf-8?B?MUkyUHo0MDFrcElveVVKdndONlZsMkxxNHpsREoweXBSc2hWKzNsMmk1WjVS?=
 =?utf-8?B?NC9uN3dYTDUwOUFnY3RIQmIxdFNYSmMrU2dRQTNmYUd4RzV6WFo0MmxJSWVj?=
 =?utf-8?B?c3NSOHZ2cnJjRXFCb09ZamhMWkRVTEZNcWpYVFBOcjl5c3ovdkJBNHR1OTAr?=
 =?utf-8?B?Y3h2TTdNTUtOeUJCSlBDeVRSRlRBRThwUElvcU1KazVyN1crVG8wU2tDc3NL?=
 =?utf-8?B?dENRYkI1YU5NTEJWdk5rM21EU0xDYXpmL0xXdGRhbGcvODhLdmZoZXFEYTZB?=
 =?utf-8?B?NEVwbVZON1ZTa0crZ0xJdXMvZldCd1lmdU9UNlM3eDhFRVl4WEJyVEFLNWlK?=
 =?utf-8?B?cGtwV2swVjlmK04zZ1o4VkhaVEtSUHEyUHBFNHNWdVpYQ1p0L0EwbVREQWtr?=
 =?utf-8?B?Q2FSeWRhbWtRS2pNanRrb0NMdCtzeFFMay9TaGRZcFJJM1VlcEhjeEo2UnJu?=
 =?utf-8?B?bkJJOTh1UTM2bmNTeUQyOWJYWnpkbjBrRVhnTHN4TUpmT1BQbGpYaVVoRFpF?=
 =?utf-8?B?ZlNPRGFSbXJsUjNmYVZkcTVLSFlmMG92WGZwRzhHL3I0N1RtU2FjN1N1Mmlx?=
 =?utf-8?B?U3BYaHVlQ081K2E5b1BIYktobFlmRmg4SG5MQzdjVTZSOUJKMFR3QlpWN0hI?=
 =?utf-8?B?ZVRvNUcvTTUwRUl0MFpXd1ljRVFPaU9jamQrN2ZjYXROWXhiY3VKS0NYMlJR?=
 =?utf-8?B?THBlVjFORzBrL1dSZVpxRzZkanJXWW9RUlRiZi96M0dlck1jNklnKzlUY0tn?=
 =?utf-8?B?STBmUDhUMzd4bEVNd2hyeXFxdDQ4azlOeVZ1THR1QUJrVmtoM1dRS1RtdmNs?=
 =?utf-8?B?UTZOUnp6dkp1MnR2cElaMSsxcW94UXhzcmhGN2daSjYrV0htak9NQzhQZW02?=
 =?utf-8?B?TkhhVEk1N25nUVlMbno5L3JuWHhjVWFRbjdJeUp5aFczSDhjM0NEM0luMVcx?=
 =?utf-8?B?SkMzaklHZGp6RzFaaTJvNlhPU0hEbzAydm1xeHl2TGFrb21wVi9KalFNcXJr?=
 =?utf-8?B?bG11c29LVVhReTJKWFQrVkhPR01NY1k5NlpPNEpLK3RUNzgxZHJNMnFrWC84?=
 =?utf-8?B?N2paREI0TFQ2eHN3Yk5yYnJVMmNwbzVqWGpVRzErRjMvYUdIMkNib0YvUXVw?=
 =?utf-8?B?ekJ5M3BnQ3c2ekNRV3JlM255V3o4NjlNSk9VY0Z1QlFsK3BCRlBlc2tkWm83?=
 =?utf-8?B?RTVYcmczQWpCMU4vVC9TazdvTS92bkZ6M3BzY2V6cnVQenN1cVpnV1p4WTRn?=
 =?utf-8?B?OElZRG4yMGFaay9GVkdOSkhCVGx5QnJQRk1JaFRYV3UzVDBOb2RUNVdvbWVS?=
 =?utf-8?B?SEF4ZGZlenM3SFAyYkhNNm9XN0tlVUxiOGZCSVJwYUdqZHRjM25mSERiQi9w?=
 =?utf-8?B?Sms1YWRkQkhmZTc5WXBsZ2xsRC9pRHB4ZGwzVUYyN1FteVJOZWh4S2xoWm5n?=
 =?utf-8?B?OGFHMmNuNUVlcnRFZnRFVGhjUmIwTDI1Z1BQek5keUIrQkU3TEtjRHE4Zk93?=
 =?utf-8?B?TzR1dTdQeVhjSzBoTEpaZk0vTjNXUC9NMGpyUWdFZmZ6a2FkZ3luMGRQUTJw?=
 =?utf-8?B?TzBvVWppUFRyNURwUDBubDFXUGZXV0N1UjNUL0pFZ3FsMHZBcUoxaTZkVUdi?=
 =?utf-8?Q?rveRZYbcglDWpntepdG7mf45Rb7tFk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a22db77a-6d98-498a-d986-08dce79600bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 12:37:42.2575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1131

QmFydCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCYXJ0b3N6IEdv
bGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPg0KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDgsIDIw
MjQgNjoxNiBBTQ0KPiBUbzogVmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPg0KPiBD
YzogbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IHZmYXppb0BnbWFpbC5jb20NCj4gU3ViamVj
dDogW0V4dGVybmFsXSAtIFJlOiBbbGliZ3Bpb2RdW1BBVENIIDAxLzIyXSBiaW5kaW5nczogcHl0
aG9uOiBjbGVhbiB1cA0KPiBpbXBvcnRzIGFuZCBleHBvcnRzDQo+IA0KPiBPbiBGcmksIFNlcCAy
NywgMjAyNCBhdCA5OjA14oCvUE0gVmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPiB3
cm90ZToNCj4gPg0KPiA+IFJlbW92ZSB1bnVzZWQgaW1wb3J0cyBhbmQgc29ydCB0aGUgcmVtYWlu
ZGVyIGZvbGxvd2luZyBpc29ydCBydWxlcy4NCj4gPg0KPiA+IFVwZGF0ZSBzdWJtb2R1bGVzIHRv
IHVzZSBsaXN0cyBmb3IgYF9fYWxsX19gIGZvciBlYXNlIG9mIHJlLWV4cG9ydGluZw0KPiA+IHB1
YmxpYyBjbGFzc2VzIGZyb20gd2l0aGluIGdwaW9kLg0KPiA+DQo+ID4gQWxzbywgZml4IGluc3Rh
bmNlcyB3aGVyZSBgbGluZWAgd2Fzbid0IGltcG9ydGVkIHZpYSBhIHJlbGF0aXZlIGltcG9ydC4N
Cj4gPiBUaGUgbGlicmFyeSBub3cgY29uc2lzdGVudGx5IHVzZXMgcmVsYXRpdmUgaW1wb3J0cyBm
b3Igc3VibW9kdWxlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgRmF6aW8gPHZm
YXppb0B4ZXMtaW5jLmNvbT4NCj4gPiAtLS0NCj4gDQo+IFRoaXMgZGVmaW5pdGVseSBpbXByb3Zl
cyB0aGUgb3V0cHV0IG9mIGhlbHAoZ3Bpb2QpIGJ1dCBJIHdhcyB1bmRlciB0aGUNCj4gaW1wcmVz
c2lvbiB0aGF0IHdlIGRpc2N1c3NlZCByZS1leHBvcnRpbmcgdGhlIGRlZmluaXRpb25zIGZyb20g
Z3Bpb2QubGluZQ0KPiBkaXJlY3RseSBmcm9tIGdwaW9kIGFuZCBJIGFyZ3VlZCB0aGF0IHRoaXMg
aXNuJ3QgcmVhbGx5IGEgZ29vZCBpZGVhIGFzIHRoZXkgZG8gZmFsbA0KPiB1bmRlciB0aGUgdW1i
cmVsbGEgb2YgImxpbmUiIGRlZmluaXRpb25zIGFuZCBzaG91bGQgYmUgaW1wb3J0ZWQgZnJvbQ0K
PiBncGlvZC5saW5lIGV4cGxpY2l0bHkuIEkgdGhvdWdodCBpdCB3b3VsZCB3b3JrIG1vcmUgbGlr
ZToNCj4gDQo+ID4+PiBmcm9tIGdwaW9kIGltcG9ydCAqDQo+ICMgbm93IHdlIGFsc28gaW1wb3J0
ZWQgbGluZQ0KPiA+Pj4gbGluZS5EaXJlY3Rpb24uT1VUUFVUDQo+IDxEaXJlY3Rpb24uT1VUUFVU
OiAzPg0KPiANCj4gSXMgdGhlcmUgYW55IHJlYXNvbiBmb3Igbm90IGRvaW5nIGl0IHRoaXMgd2F5
Pw0KDQoNCkl0J3MgbW9zdGx5IGp1c3QgYSBjb252ZW5pZW5jZS9jb3NtZXRpYyB0aGluZy4NCg0K
QWxsIG9mIHRoZSBvdGhlciBjbGFzc2VzLCBpbmNsdWRpbmcgdGhlIEV4Y2VwdGlvbnMsIHdlcmUg
ZXhwb3J0ZWQsIEkgdGhvdWdodA0KbWF5YmUgdGhlIGludGVudCB3YXMgdG8gZXhwb3NlIGV2ZXJ5
dGhpbmcgYW5kIHRoYXQgdGhlIGxpbmUgRW51bXMgd2VyZSBzaW1wbHkNCmFuIG92ZXJzaWdodC4g
SSBtaXNpbnRlcnByZXRlZCBvdXIgY29udmVyc2F0aW9uIG9uIEdIOg0KDQogIE1lOiBSaWdodCBu
b3csIHRoZSBvYmplY3RzIGluIGBncGlvZC5saW5lYCBhcmUgaGlkZGVuIGJlaGluZCBgbGluZS5Y
YCBvcg0KICAgIHJlcXVpcmUgZXhwbGljaXQgaW1wb3J0IHZpYSBgZnJvbSBncGlvZC5saW5lIGlt
cG9ydCBYLCBZYA0KDQogIFlvdTogQW5kIHRoYXQgaXMgYW4gb21pc3Npb24gZnJvbSBteSBzaWRl
Lg0KDQpUaGUgbWFpbiBiZW5lZml0IGlzIHRoYXQgYWxsIGdwaW9kIGNsYXNzZXMgYXJlIGRpcmVj
dGx5IGF2YWlsYWJsZSBmcm9tIHRoZSBtYWluDQptb2R1bGUgc28gY29uc3VtZXJzIGRvbid0IGhh
dmUgdG8gaHVudCBkb3duIHRoZSBpbXBvcnQgcGF0aCBmb3IgdGhlIGxpbmUgRW51bXMNCm9yIGhh
dmUgZXh0ZW5kZWQgdHlwZSBoaW50cyBhIGxhOg0KDQogIGRlZiBmbihhcmc6IGdwaW9kLmxpbmUu
VmFsdWUpIC0+IE5vbmU6IC4uLg0KDQpvcg0KDQogIGRlZiBmbihhcmc6IGxpbmUuVmFsdWUpIC0+
IE5vbmU6IC4uLg0KDQpJdCdzIGNvc21ldGljIGFuZCBjYW4gYmUgc29sdmVkIHdpdGggYW4gYWRk
aXRpb25hbCBpbXBvcnQgc28gaXNuJ3QgYSBodWdlIGRlYWwuDQoNCkkgY2FuIGNlcnRhaW5seSBy
ZXN0b3JlIHRoZSBwcmV2aW91cyBiZWhhdmlvciBmb3IgdGhlc2UgRW51bXMuDQouDQoNCj4gDQo+
IEJhcnQNCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0
aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sNCj4gbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50
cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZQ0KPiBjb250ZW50
IGlzIHNhZmUuDQoNCi1WaW5jZW50DQo=

