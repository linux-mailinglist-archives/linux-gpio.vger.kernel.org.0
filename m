Return-Path: <linux-gpio+bounces-24997-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C72E0B3747E
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 23:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5FDE1B256FF
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 21:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1726D13D2B2;
	Tue, 26 Aug 2025 21:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="RE0eypAI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0087.outbound.protection.office365.us [23.103.209.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2C230CD97
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 21:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756244768; cv=fail; b=hldrMj5YBpBfXuX37JHI1n7MhpNmjXoECl7ja75v7Pryb6vZg4HjKhe+1urwbHN7qDcO02k8wo2uVrn/5XpA/dUJCUoyZeoA/T7Pm4zsmePLFXMIWo6+Iz5AQ9+1hpe6IfCyCXDowpY323nN/GuOkon0yiShXH9rbBiwWtJ/KhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756244768; c=relaxed/simple;
	bh=PB3nZ4smEJ3eVFp0EK0rFogOQeGZ8NDX+YIK3cHbQ9I=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=smx4GELK2614bjmFqbruKszDI2V610LMpTo8pu2PkcUrosYv7WX5QS/QTdSZEfKJA4K4K9n3DhFHW6VZAsjVm2IQEUYTt777Ltbs4n9PFt05z2tMdrm/ItG87Nkb7osgL7Ye/9G+vZNPpNBx9xYD4Jj0Hb/NhsWMP37UvIdr+ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=RE0eypAI; arc=fail smtp.client-ip=23.103.209.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=yqQVslMM5x02tg3WxecPVPNGFX0z+XJ98H8VLkJdZ+Ek4e+dMxrGPhtR8Z2DXAM8fuxr3zxFCtUsH0Ph9VdrwHVYU1MudSPq3AmKUnMhNiKaePuxfL12RTCDlKoEZTsJZZ6Bo30qfcQqnQCxRpWfYv+OINKd2/ukkbdkwib2xO5h1S5BrTVlgFC5M5HEWoHlNn/T8BkdGOhdzwdHmoX0JIeYPnEXTH2G+JCxp0OmmuiZoCyXNwowmrw9pULyiO1fGE8XImT4omSlACTEU22PsD9GfIeGYep0c0x5OoPdV3xOtgxOTxHaIouDK2dX9uXRsP6v4thTeitad4zFW4SXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PB3nZ4smEJ3eVFp0EK0rFogOQeGZ8NDX+YIK3cHbQ9I=;
 b=YnmmM1XKffk6ptFhqOpgBcgg3MpUcmGZGqZPb2Qb5oH9LRXkyEYhvbu7k3ot0JC5ciAHMoDqFuacHhpT9un82uTO177vxsN5tsgHsnQVC92aO/vmMsS1eojxPinEcJviO2Ckl436ZazcpDji2MoRBhYsq2Uz2lTpxCg4dyi7ZJdKFy4/3FKUip0iDtUQBNwmp/Zei0GfZsdW/0g+foGtAE8XwfLxMnyauZqeJkC6HeVOppvNbK4yGr0nsTtAqzNUR9fbGWT9v7v8qx6oi/ywpWozXnY23glYNKWquJd4H8nlaCxvAtasHE7a68Yj+2xGkFBVwMlDGFLPqY2hnQXTtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PB3nZ4smEJ3eVFp0EK0rFogOQeGZ8NDX+YIK3cHbQ9I=;
 b=RE0eypAIbmcRZYIJEoAwUSFfhGHMXP6E/5V+Saq0mA3OL/c+XqLmTkM/epqrvQkNOV9HC3lbVXcUi0jOZukegMnNh1ceNV5qTSxse3tIOxnsr776CCk97z2l0ryq75aKiNManaM2mMKtigcfdYk3n4r9UfOIpZQ6Fpcty0eWWU5Hfm5PKr+pZSDSSiiW3RZzwn4GBysCKLxGHPKcqp7Wn89OMupcdn7eNAy5Djevj1arPcV3EzqI38o/F004cjcEplfE5hy5aRPFtX4K62Izx5j36FsAAbTsrMagTBhKRKLjkcvVAcDb8qlJi6dWV1WXIX0qDnJpNBhZtSlxGji5aw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN0P110MB2169.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.32; Tue, 26 Aug
 2025 18:14:44 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.9031.026; Tue, 26 Aug 2025
 18:14:44 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson
	<warthog618@gmail.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH libgpiod] build: bump required GLib version for tests to
 2.74
Thread-Topic: [PATCH libgpiod] build: bump required GLib version for tests to
 2.74
Thread-Index: AdwWtTvhqB+QRDKeTzy9kgbI/8ODTw==
Date: Tue, 26 Aug 2025 18:14:44 +0000
Message-ID:
 <PH1P110MB160359D4326FC6260E2E66539F39A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN0P110MB2169:EE_
x-ms-office365-filtering-correlation-id: 536e9cb1-32bb-477c-3532-08dde4cc6f43
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SXpnKzNGd1VJVThNaHhCSEM2RTVBYXYxS25qcGRxRzVuK0k3Q0dPMGxXRElp?=
 =?utf-8?B?TXBxRlg4ckNvZkpqdDZYdnBEOTd2VVA5U1UvT0tlUk5UN05aOFpQV0hPZ0RJ?=
 =?utf-8?B?MmdNelNjSmVZdUpKYStWTnhuNnZ0SC9iNEZraTBBK1VqOU54MXNob055akVy?=
 =?utf-8?B?YjBmUFB5djNLQ3BsUWhmSktsTjcxeVU2QnNja20xd05WOEpvSVhDb1FlSWZB?=
 =?utf-8?B?NmorRS9aQTJLRmVjYTdBYndNVVlNWnM5TGgvMXJNb2RQZ0trcnVDNmJGdmE5?=
 =?utf-8?B?M2g2YzlqRGRRd3krVXBGMHBucTYrQkxwMXpja1RrUFpCdnYvVTlQYXRhYjFL?=
 =?utf-8?B?bkdndDB3MWFYcWI3NFE1ZmllMHRXZDZmckZmV2RmYWNmczJYT3k1aXoxY3VK?=
 =?utf-8?B?Tm85anlPQ3JyMmpFT1I3ZnJ2OVQ0LzRxa3AvNGlYTXpFckNsckgwRUVmNWE4?=
 =?utf-8?B?L1NrZWlvYXg3T3RiNS9QY1JmaS9tM3FnN09sYm95d1BMOGw0bFRpNWRuY0pY?=
 =?utf-8?B?blJNNTM4b0hQQzhlWnllZGIzRTFjbXdLM28rOU04OVFvb0dPTFN3T3FKdGpu?=
 =?utf-8?B?S2tQYzhhaGV2TDVrS3JrOGt1T0dMV2ZHVStXbzcwUlBwMTRzN2JCYm0xd2Rm?=
 =?utf-8?B?Y1lqd2VVaThPL0JBRmpSRjROVU5UTVFLVHhhQzJPOSt3RXVkcG4rVlY2eWVS?=
 =?utf-8?B?UFJEb0VrU2lmOEFNOHV3ZkgzVmNxREVGM21yZUF4VXk3SStNU2dscTBCeWYz?=
 =?utf-8?B?MkpqZGhpakNCT05QUmo0Z09TdVZsbGtHaE83ZlYwcHF1VlZzZHFXMjhJcXlU?=
 =?utf-8?B?cFQ0STVXYmdqL0Z5VUN4aitnQWE2clVCN09BVW05bXdVMW1PLzhHZGVvT2hM?=
 =?utf-8?B?cFVMVGdEMjU0SG5OaVhQYTF1U3ZIdDAzTVZrZUZ2K2N4QnJsYWE1YWVjN29J?=
 =?utf-8?B?SU90cmZicm5XdHc2OEJtSXRoQWdvYzJweDFFYkJsOGgzeG4zK2hTSGo4dHF4?=
 =?utf-8?B?RXE4V0NZZ3dER3N2cGdtQkFzV0M2N05YM01rRjVvaVFyM1FWNFZjWlJCQjJz?=
 =?utf-8?B?THB4ajB5aXpaa2FnL2pWcm9lR2w0cWZpQUN1MmNGOEVjMCtKbldvNnZzOURB?=
 =?utf-8?B?ZGlyMUJDYytGOGI2dDR0b1ZTeFRmcGMwaGpTdGhjbDQ1dGJ5RThGQjRIc05x?=
 =?utf-8?B?dVZrOGJhVGtnakJLdXJTS09BdWhKTVpwck9USk5lcUhSMWtWMXRWaTZqb3p0?=
 =?utf-8?B?SGZxQUVhVUJUKzZBQUNrcGVoVnIvcVZXOGFvbEo4M3dneFFMdk1RY09UV1JY?=
 =?utf-8?B?L0FrMll5M0tiblBYQkRNZlUyektKTkFYbjVMbGZKVTVnUWxZYTZ0Y2M5T3V4?=
 =?utf-8?B?eFlXR1RZSFg5OVVzUUlreEsvNWJGZVNJak5ZamdyM3dYeU15djE1SzJjQXY2?=
 =?utf-8?B?ZGNpbW4zNmZDSW9GNTBiY1N2V2VXY0RHVXFkak9lS29VS2JVeWdoVDJRMmNT?=
 =?utf-8?B?S2YzM2lvcllFWE5RWnh4VzVEVUNXTTVCQVE3ajlkVm1VOXY4cWxIR1dCMXc2?=
 =?utf-8?B?MFlPYjBxaW0xbWFSK0Q1UTJ2a05WZkdUUkVHOEg2c2tyNHNFRXhKK2ZtaTFM?=
 =?utf-8?B?K0FEZGVBVFYrYmZzd3lpcGdEOWU1VStDRjdNSEd6ZUdraXlCYzVvL1MyYm9n?=
 =?utf-8?B?NzhCVnZZMi9EK0svTGkzQnhwMjEwa0RCN3U1OVNVamE4eVRiQjNWcXYvN0pV?=
 =?utf-8?B?VWxNTUZ4TXg1REFtejVsdzRRaGtPR3o3OEk2ZEozMmlDTjlkcjREczN2dnBV?=
 =?utf-8?B?eUtFbDZhZVZjT0Q4Y3NQZ1oreXZlelRXK0dNT0hHNFdrK08zK2MxYnNQR1RM?=
 =?utf-8?B?bWZvZkoxZS9rNTgxNnNnVTJXRU5aS3A2bU9rZFRtc1h0bXA1R21rWWo0L2FY?=
 =?utf-8?B?OHZ2Q1pKSEwwOXZqcnVzTmpEV0VLN25FTHFPY3lLT2dUYXRtSDhmRmJOM2NW?=
 =?utf-8?B?WVA0M0hYY3BnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z21ROHNBaW54SHlxczhsRnJ6cTFRYVR5S2VlRzUxUkpOSUdMNFBVRTh5Ym1L?=
 =?utf-8?B?dDV1MDJRWFRBWFdUMzZIUzc3YUpVdjVDaUtRdHRBcklBVzRDdEJjUlR5NHl0?=
 =?utf-8?B?TXc2c2MyL1QrQ0hWSWZXd2FtM3BTNjhLMEdPYkQxNjRZTnB5ZGZYdVNoOVVl?=
 =?utf-8?B?ZDVCWW9HRWRWbkdNY09vK05ISDc2WjFDTWtsVHhVbmtjOFpLcTdGdi9MRThy?=
 =?utf-8?B?K3BOaFdYSTQvVlYzeHkzalpMTnJJbVFydm9zY3JocmxDUjBnb1R6d3dXdWMr?=
 =?utf-8?B?eFFIMkttTjNNTnpLaEVmOGY1VURJT01DS1NDZ2FDdG1IMmtQUDBRU09oTlpw?=
 =?utf-8?B?bTJCUWF1akZUZHNJR1JVeVh6YVhXYkRsYmVud3VSOHc0RGxnRTB2VnZ6b3NM?=
 =?utf-8?B?ZzRqWitiZTRRcC9ZT2xYRXMyY2Vwa3JWTGhzT0xCNHpwbVFGbmNwS3AxaVND?=
 =?utf-8?B?WTdZTlAvYWtDb05pOWhNVjU3NHJ6ZUprMWpYZnhkWGhUcnpFSllGTTJVMHAw?=
 =?utf-8?B?MytlcEVUSzVEaWUzOU13WEJlQ202cUNHTEJoa0ZCVXBJZTdhNXJUWFlpODhX?=
 =?utf-8?B?bWxTNWQxZ3JYOG84Tis2M2tzazhMNXdyNW1oNVhVVWlQSVlpeUgzWklwTFIz?=
 =?utf-8?B?aDVtMitJN1FrNGJUMUlldENEcGpETDByTzFKYXZURGI3clZqZWxwdmJ1UkJG?=
 =?utf-8?B?UGdsRjBsL3RlNlppaHhEL25CK0IxcFU5RXM3NCtUVXhyQkFSNkpmL2FrdFda?=
 =?utf-8?B?TG5HTEFvZ0duVnhmQmZmV1gwck91d2Mxc3dDZFhLL25lSVdtSEZaanNQd1lw?=
 =?utf-8?B?eWZQaXNRTDNrQWNSVDJwYWYxWi92QnQ2R0ttQ3Zud1lkQ2RyTnRLdVA0TnJT?=
 =?utf-8?B?cVc5UmhwSmYvMnN6SHhldThmcW5YZDVwOGZBZCtnUmV3d0YvY3BwS2d2KzRr?=
 =?utf-8?B?ZVFudDZ5bzBqemxlS1FGVmgwaW1oVXVESW5aRXJSc1pMNVNERGVMREUwWU1O?=
 =?utf-8?B?dEZESzdxMUxCZGYrdlAvR0tPaXo2NDBNZnljcmdxSmxHZndiUVJHaWE0L2Na?=
 =?utf-8?B?SVpzVllYSDZUVzNBbzFXSVp6YjJ0QlhVT2VHWndXTnpjTlVNQ0E2UkdpK1pH?=
 =?utf-8?B?Z1g2bVlKNGZzNllFeEFLeVpDc3hiWFN2ODhKRFF0MTNDZnltSDF1eFJmYXdz?=
 =?utf-8?B?RytPZWNZaVJRUkRzR0pUcnJlSWptUmpocGxUUnBUdUpiNHdtZlEyMk1nVTZu?=
 =?utf-8?B?bUhqYlV1NjdnVTQ0cjJrS3g1K25ibDhSM2p6Y01ObTRNM09kNFRzN0Q1WmVO?=
 =?utf-8?B?VFZqR0VDbXN2NndVTjFqay9HQzVERkxPQkpGVWFiK3YyOUV4WUtBK1Y0cHVY?=
 =?utf-8?B?aE9ZZkMzNWtKYlJSUG96UVZ1dCsrVHlBcjZaL2ZtRUhsdGo2aGF1bWJ5OWFQ?=
 =?utf-8?B?cm1ObkR0SEVFakp0c2tBc0dVcC9ERGV4RWJVZlhhU2NKcVB0QmdKc0NXNUhS?=
 =?utf-8?B?bGFBR2lybGhNZkdkc2VEY1JuMFNGNnNoTVhzN3NuK2FNN1RXVXBJSTB3ZjdG?=
 =?utf-8?B?TmFjdC9FVS9XWG54Q0V0Y3J3cUNZTjQxeVBtYnVPSjk3bEt2RmtXUGl4QW50?=
 =?utf-8?B?K285N1dwU05ncnJ6SHdpWkREc01Odk5sUmoyVVN6ZDdValJLN3dFaloyWmFY?=
 =?utf-8?B?TnFNTHg0ZWlabkliQStDcEM4NmRlY2cyeGt2RVh3RHdFYTI5bDlXcS9VekMv?=
 =?utf-8?B?RG0wNVI1bUpBdSt5UkpnS0toZ0tabjBrQ3FXckh5bVVsTGVsWU5lay9JZy9o?=
 =?utf-8?B?dnpQQzJic0JncjdUek42bWF4eUtWYWVkd2ltWkIxZ1JydFBWMFgvRDV5R1VS?=
 =?utf-8?B?TnJmc2tTV1RGaGZ6NmhmcUNrY0xEVmZsVTJiNUZpZWI1VHBGcVh0T1FFMytX?=
 =?utf-8?B?TUZ1MW55OTVvKzRpd1k1c3oydlpZWk5zT0JFK1hzVGU1MCtDQ3dSTkxBRTUz?=
 =?utf-8?Q?NSDtJK3ImHvxxZ/B/c72+EPeZUkB30=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 536e9cb1-32bb-477c-3532-08dde4cc6f43
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 18:14:44.7602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB2169

PiA+DQo+ID4gSSBrbm93IHRoZXJlIHdhcyBhIGxvdCBvZiBub2lzZSBpbiB0aGUgR2l0aHViIGlz
c3VlIChteSBmYXVsdCksIGJ1dCBkaWQgeW91DQo+IGRlY2lkZSB0aGF0IGl0J3Mgbm90IHdvcnRo
d2hpbGUgdG8gaW1wbGVtZW50IFBoaWxpcCdzIHN1Z2dlc3Rpb24gb2YNCj4gR0xJQl9WRVJTSU9O
X3tNQVhfQUxMT1dFRCwgTUlOX1JFUVVJUkVEfSB0byAiZW5mb3JjZSIgdGhlIGNhcD8NCj4gPg0K
PiANCj4gSSBkb24ndCBiZWxpZXZlIGl0IG1ha2VzIHNlbnNlIGZvciB1cy4gVXNlcnMgYXJlIGFs
cmVhZHkgdW5hYmxlIHRvDQo+IGJ1aWxkIHdpdGggYW55dGhpbmcgbGVzcyB0aGFuIHYyLjc0IGFz
IGNvbmZpZ3VyZSB3aWxsIGJhaWwtb3V0Lg0KDQpPSy4NCg0KSSBqdXN0IHdpbGwgbWVudGlvbiB0
aGF0IHNldHRpbmcgR0xJQl9WRVJTSU9OX01BWF9BTExPV0VEIHdpbGwgdGhyb3cgd2FybmluZ3Mg
aWYgZmVhdHVyZXMgZnJvbSBhIG5ld2VyIHZlcnNpb24gYXJlIHVzZWQgdGhhdCBtYXkgd29yayBv
biB0aGUgdXNlcidzIGJ1aWxkIG1hY2hpbmUgYnV0IGV4Y2VlZCB0aGUgdmVyc2lvbiBjYWxsZWQg
b3V0LiBJIHRoaW5rIGlmIHRoYXQgaGFkIGJlZW4gc2V0IHdlIG1heSBoYXZlIG5vdGljZWQgdGhp
cyBpc3N1ZSBzb29uZXIuDQoNCkFja2VkLWJ5OiBWaW5jZW50IEZhemlvIDx2ZmF6aW9AeGVzLWlu
Yy5jb20+DQo=

