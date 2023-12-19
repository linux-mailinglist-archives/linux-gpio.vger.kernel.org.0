Return-Path: <linux-gpio+bounces-1682-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D733819481
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 00:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5D4F289A10
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Dec 2023 23:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4E63DBA0;
	Tue, 19 Dec 2023 23:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=FII-NA.com header.i=@FII-NA.com header.b="H2svcYZv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392FB3DB80
	for <linux-gpio@vger.kernel.org>; Tue, 19 Dec 2023 23:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=FII-NA.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=FII-NA.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyFjclx+laQ+vurFFm4HZR/32FwWYfVoQgZRnsdXkSvyfKRMCvNIwKwfuQ7LGNnmGIZHdRcrfWpGdTkQo8QpVRYWXDwqCJtPNbDY8KSLF+hz02hXPdmtm3Gi4s1IpUshS5I0yQy586sQwf1xBRjeryy7i93C1RYCGLJnJFDs64PDtglt86H5p7BwwyyTLexlTqizVMafOrzuHmgfhh/2Jw5SBGHyHFuX9CM92gbcp/2aXVaKyRAximikY/npVIJYa8LTM++fNWNQcaHV1i/tLNOzvasqccIgnBdrPe7PacrzJyldOHv4QuJOdyOiknxTwVGBFvS8BVAFqWElS0q0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPNTrk8havvDVBXGfL44lGrfm4MgUZt6bokxCThqpV4=;
 b=FG5A16U/5BPueQ4TrTNvW9XYVhRNGQ2VsMtjFO+OLXLofG7EDv76lVFSpXhM5w6iF6kWUJwRXNoJ4GacTQ4cgX3aWb+vF0wRxWh/JRjQDbipmbJLlDpA1ouWcvXxYp7LC19GXRab82/a7m8HHbbAC5xxNRGbgKs8h1zOgFcE22M8jzwBFiLph1rO3lZntkMerLQouY5e/7qQFQbw7I81y/bRNfZW0wLNkb6q8VVVGmKI/wR4q+EaSL5NJiaStDIhcJxDdSvkC+UxRDo05EdpyBP/n18yEQQSSqKommlQuJYNx31Gi5Uii/nbKUJYPNqOBZLyBp/mSAHhUMrM15J7Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-na.com; dmarc=pass action=none header.from=fii-na.com;
 dkim=pass header.d=fii-na.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=FII-NA.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPNTrk8havvDVBXGfL44lGrfm4MgUZt6bokxCThqpV4=;
 b=H2svcYZvDtsXfWe045GFvpyBcyVKEnZXavWxeZO0pJFDnKn9Zhzg8yziAk/86wjb1wHMxGykAj87VcAUgBQfllw18jy6x1hf4jkM38RZkKFd+Bfa/8Tsdz2dqAzRwmiK0291Xlcxn/YjNYYG3+8WVpPBxXV467n8IAgNmnBclNur234qM8w6Omie23LsevRpUgRJyZcNrQMt9DvIac5iBONgoCv/cA9+wmcpC3oI61uGbY03E4d8LnQ+Yct0DFl7l4npvD5RkmUu6kA1wgjz7b7+lN07KcPPD7wrxRFgHE1XqrBjXLAFKZSPxhgZP3EwAl8V65tOUw8UMTvZxY5fuw==
Received: from DM6PR08MB5322.namprd08.prod.outlook.com (2603:10b6:5:14::30) by
 LV3PR08MB9048.namprd08.prod.outlook.com (2603:10b6:408:20c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.17; Tue, 19 Dec
 2023 23:22:18 +0000
Received: from DM6PR08MB5322.namprd08.prod.outlook.com
 ([fe80::c768:b08d:3b37:fdf3]) by DM6PR08MB5322.namprd08.prod.outlook.com
 ([fe80::c768:b08d:3b37:fdf3%7]) with mapi id 15.20.7113.016; Tue, 19 Dec 2023
 23:22:18 +0000
From: Kyle Nieman <Kyle.Nieman@FII-NA.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [libgpiod] Simplify GPIO monitoring
Thread-Topic: [libgpiod] Simplify GPIO monitoring
Thread-Index: Adot202IHyhmBq+ySJy3Wd56KKERiQBWYBcAANmBnnA=
Date: Tue, 19 Dec 2023 23:22:18 +0000
Message-ID:
 <DM6PR08MB53220B9DB2D96DB817655E0DC497A@DM6PR08MB5322.namprd08.prod.outlook.com>
References:
 <DM6PR08MB5322659E14BB25DBAF6CD3CCC48DA@DM6PR08MB5322.namprd08.prod.outlook.com>
 <CAMRc=Mf9tPSGB+rSL2UZD9Mx5x1X8osP0_j4h0J=bH6XAwbYTA@mail.gmail.com>
In-Reply-To:
 <CAMRc=Mf9tPSGB+rSL2UZD9Mx5x1X8osP0_j4h0J=bH6XAwbYTA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=FII-NA.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR08MB5322:EE_|LV3PR08MB9048:EE_
x-ms-office365-filtering-correlation-id: fe3ed8f2-9b05-48aa-f9c4-08dc00e957fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 O11J1oUqY80YYmynwxL8LHhkYTPGegl2eHI2YmLzWH4zOLl0tkMeo/8906zTaD6KQr1ryIWxvCObC8by7LGy992Lrdq+wDf5JF57eEcE/tjY/PHRSGcxbQ9Pah0oulma1COiqweqSf6gxbX4mwcfcJiBkVlrQnwOWOfWpoFF5iA63cFWQdEgf21a44cb7tgkFcFEWkJ/LmhQXnWAmzn+krQZ0FtmXm6IxHbSOmvMLR/Rz7CRXdPLw7sds5oaY7+4gmj5YO/eKFnUjy9j1DFuQpf8hqU3i0BVh+6a1ExLa2d4cl0/K4SRm0Bb1M7ipYJ7cG3/Rpfp7XucJblamqNLnusWPMbzX119aDBYte9rT1Gfx2gp2QIXrezV3iWfiSyB5fvuF110sfQe7Lnzga2GoW0Kp9iL7vLQBk7Ft/gzLw1PnfmeRp1JFPJuuE4Y4+nhnP7aYjBziMxrNDETPljPY4u2CiXdT0sRfyqQv8deYzxSiSPBZKbjQvvUFPlWyFLLhRLjwuNL4jT47lkXjsMZEVahWQkgn+tTXX8fYy331fOZMtL96jwOSPCRaHpVwYssXu+BXLC+sD0/n4lFSTdpW93eOROSie75yDcXqApQhiY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR08MB5322.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39860400002)(376002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(86362001)(5660300002)(2906002)(38070700009)(41300700001)(33656002)(26005)(53546011)(966005)(9686003)(6506007)(71200400001)(7696005)(38100700002)(122000001)(478600001)(55016003)(83380400001)(4326008)(8936002)(8676002)(316002)(52536014)(66556008)(66446008)(66946007)(66476007)(6916009)(64756008)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TzY4eHZVK0kwNkRmRzAxZklFd2hXZHV2ajdkYlpsYjZFRXFodGJscjM3L2h0?=
 =?utf-8?B?ajBmZXNaUndBeW1MSm9ZRDBWb24yTlhwbWFPbmVkMzNPMFBrNTVwODUya2t3?=
 =?utf-8?B?WFhlajM5b3RFSkJndnRmajBYQ21ybkJJUG5DeGh1VVFhYU5IWFFZQ2lqd3Fu?=
 =?utf-8?B?bG5GQ0J6eDQ4Z1BqNmtpYXhuYU4wcm5ZcjZ5bytOaVhXRFJXMURxSU1JS1hO?=
 =?utf-8?B?QVRnRnhGcDVIdElYSWYrOGQyeVl1VmtjcmcrTHdWSW5ycE1JRlJHUHRSa0l4?=
 =?utf-8?B?elBvZWo1WDdIaDY1akVuMXc1T3pRZmNpVDF3Wk9QeVU0OTJOKzlkNXBSSHVR?=
 =?utf-8?B?cTN5S2V1bHZaclJtZDI5SU9SMXVkV21CRkptcFZKU3A4Z0FCSWhRQldwM1da?=
 =?utf-8?B?ZitBeWJmOExJR1Y3RFJxeVJxczFULzJOTUF5eHlWWGlFQ1U5ZldDYUhtUitq?=
 =?utf-8?B?VU5mbERYclVMaVBkdG50V0pSNHh4YTRnN3JONzJGVEZtRWFsb0c5WWwrM1d2?=
 =?utf-8?B?bFRHWVNaeVZKdzZDbUc5dUl1RHMrOHFrT2h5bEJSKzYvT2pXa0p3RklBczU2?=
 =?utf-8?B?UlBiLzRPY0NRN01xaU9LNkR2dFc5WmpTVzRiSi9IR2kzL2tyQVJTRElRWTFi?=
 =?utf-8?B?R0g1ZjNMdm5BTm5lb20yVTRzeVRnNWx6aU1Dd3JiRGhNWTNhU2RzMjlsN3Ns?=
 =?utf-8?B?cFdGY2x4WGFoeG9LTXFTSmFLQ085K21CbFpSREthZW9MZkRSektadUdXNUpE?=
 =?utf-8?B?ZzdCdXpEQ2cwQmRtWGdCUU9oMlgvLzgwNGhNZUdTemk3WjFmSGpHYXNocGY3?=
 =?utf-8?B?cHU2cStiZ2FNVG15U2lGVUVNUEdac0cyc2o1eHhiSUZPK3JnTzhRYUY3Y3hw?=
 =?utf-8?B?aVMvYk9uWkNZM2JtRWI5ZzFBN2p3ZUpQakovcWJLaC9VWkIycW0xUVdCdWJQ?=
 =?utf-8?B?USt5Z2lqVHE1OTNCTVo2TExKaVRMV1VOYlBsY1NPUUlLNjREMTYzc2pzcmsv?=
 =?utf-8?B?Y2UvV1AzTDFOcWZtbjl3cG9ac3p1WUtXZU9xekc4RTY5YjNPQ0tEL21scGE4?=
 =?utf-8?B?RU5SUVozMmxOMVVGRlZUaWhBSGozV2FWRHlHVWZ1VHF0S0orSjBqTGp0QkZn?=
 =?utf-8?B?QVBCRUxYVUhWZkMwSEc2Vkd1TnF2Rkk2YmtaanVFWElqVXV4ZFpaNkxCUHo1?=
 =?utf-8?B?bnFCNmFvdmkxMWlLN3kzRVpJZnJDVzFyYUIzT29GRE8waUJibE1OUHZPWHkr?=
 =?utf-8?B?VTBUb1FYdFdvRjF3eUhoWnBKWDQ0NXBDejIxVmp4ZnFoTUtueGNoOHhicDZP?=
 =?utf-8?B?ckw1eFpMYUVjT0NsanAxbGkvK0J4OThiazErR3RISDBOVUV6YmVRT3gxQTVT?=
 =?utf-8?B?aHJDTVdEYVdtSzB5R1Bxc1dwQlNGYTl0b0ozRkdpd29tU2VtaVhpOHFLcnM2?=
 =?utf-8?B?KzFJQk9WU09wRDZUOFhTTk1Qcm83ZFRZaXFVTEs0MitVbWliODVrd2RTY3Y4?=
 =?utf-8?B?eUtnTHJpdmxaYTBhQ3VwK1NlYVRQZ3VuandJQjdCMlptS2RwZUk3eXdBeUEr?=
 =?utf-8?B?ZTFoeUMrSWphRjZQaEtBVm55N0hST2ZNLzk3TEtEVXFsV3o3RWgreDhzY1Bn?=
 =?utf-8?B?Q2FzcFhyTzJFMlI0T3FRWmV4NUNOUXRXOElRdnhXZzRvY05PcjN6QXJ6Q1RF?=
 =?utf-8?B?TElhWGFGRFJCd0NpdTY4cy9pZmFtd3FyaXRZNE1KdlRWMHVLM2dRc2dvbkJ3?=
 =?utf-8?B?V3FEMnF5ZHVWa0xmdmZXRm1aMGNjMnBNazloMHJJQ2NlekFpWnRGRUwyYkU3?=
 =?utf-8?B?YkFaa2dSZWpVbEdEcjVnL2ZWRVdTZ0dObEtrVlZuRFM3T0p1bVNBbS9TQUUv?=
 =?utf-8?B?WlozSU0zL2VQOEtDdTRRTTk5UW1kUjJBU3o3cGRuMTY1K3A3NTFja1o1T0Fw?=
 =?utf-8?B?aVNObHJaeExvQlNSQjZxd2lmakd1UkpBWEI5eHRYblFsbjlqVjdaYkFNbFE4?=
 =?utf-8?B?a0t2cTQ0M2liR0NFL1dhdDl5bVh5TmU0S0hIQzdncWhQQy9HVlEwVzVDNkRj?=
 =?utf-8?B?N1pON0ZoUmxOMmFhdWVtK2JGOUhuOVlkbFBWOTVzdVlNSVhOcjdWczU3eUdy?=
 =?utf-8?Q?QP8MT88sd6i0juYvxdUPLyAtH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: FII-NA.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB5322.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3ed8f2-9b05-48aa-f9c4-08dc00e957fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2023 23:22:18.2990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h9VlJThyWroZ/Mx4W1T1S/qn0gPHhaslS9AEQqjl9ZDyMWU8p6379k7GsExRgytBg/TWM82lh7w9d0gd+FA31A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR08MB9048

PiBPbiBXZWQsIERlYyAxMywgMjAyMyBhdCA1OjUw4oCvUE0gS3lsZSBOaWVtYW4gPEt5bGUuTmll
bWFuQGZpaS1uYS5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gSGVsbG8sDQo+ID4NCj4gPiBJbiBl
bWJlZGRlZCBsaW51eCBzeXN0ZW1zLCBHUElPIG1vbml0b3JpbmcgZm9yIGVkZ2UtZXZlbnRzIGlz
IGNvbW1vbi4NCj4gPiBGb3IgZXhhbXBsZSwgT3BlbkJNQyBoYXMgc2V2ZXJhbCBhcHBsaWNhdGlv
bnMvcGFja2FnZXMgdGhhdCBtb25pdG9yDQo+ID4gR1BJT3MgZm9yIGFuIGV4dGVuZGVkIHBlcmlv
ZCBvZiB0aW1lLg0KPiA+DQo+ID4gcGhvc3Bob3ItZ3Bpby1tb25pdG9yOg0KPiA+ICAgICAgICAg
MS4gU3RhcnRzIGEgc3lzdGVtZCBzZXJ2aWNlIG9uIEdQSU8gZXZlbnRzDQo+ID4gICAgICAgICAy
LiBTZXRzIGEgZGJ1cyBwcm9wZXJ0eSBiYXNlZCB1cG9uIGluaXRpYWwgc3RhdGUgYW5kIG9uIEdQ
SU8NCj4gPiBldmVudHMgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItZ3Bpby1t
b25pdG9yDQo+ID4NCj4gPiB4ODYtcG93ZXItY29udHJvbDoNCj4gPiAgICAgICAgIDEuIENvbnRy
b2xzIHN5c3RlbSBwb3dlciBiYXNlZCBvbiBkaWZmZXJlbnQgYnV0dG9uIHByZXNzZXMNCj4gPiBo
dHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy94ODYtcG93ZXItY29udHJvbA0KPiA+DQo+ID4gSG93
ZXZlciwgdGhlcmUgc2VlbXMgdG8gYmUgYSBsb3Qgb2YgZHVwbGljYXRlIGNvZGUgYmV0d2VlbiB0
aGVzZQ0KPiA+IGFwcGxpY2F0aW9ucyByZWxhdGVkIHRvIG1vbml0b3JpbmcgaW4gZ2VuZXJhbCB0
aGF0IGxvb2tzIGxpa2UgaXQgY291bGQgYmUNCj4gPiByZWR1Y2VkLg0KPiA+DQo+ID4gR1BJTyBt
b25pdG9yaW5nIHRlbmRzIHRvIGhhdmUgdGhlIGZvbGxvd2luZyBzdGVwczoNCj4gPiAxLiBDb25m
aWd1cmUvc2V0IHVwIHRoZSBHUElPIGxpbmUgZm9yIG1vbml0b3JpbmcgMi4gUmVhZCB0aGUgaW5p
dGlhbA0KPiA+IHZhbHVlIG9mIEdQSU8gbGluZSAzLiBUYWtlIGFjdGlvbiBiYXNlZCB1cG9uIGlu
aXRpYWwgdmFsdWUgNC4gV2FpdCBmb3INCj4gPiBldmVudCBieSBtb25pdG9yaW5nIGZkIDUuIFRh
a2UgYWN0aW9uIG9uIGV2ZW50LCB0aGVuIGNvbnRpbnVlDQo+ID4gbW9uaXRvcmluZyBvciBjbGVh
bnVwDQo+ID4NCj4gPiBBIGZ1bmN0aW9uIGNvdWxkIGludGVybmFsbHkgY29tcGxldGUgdGhlIGNv
bW1vbiBzdGVwcyByZWdhcmRsZXNzIG9mDQo+ID4gd2hhdCBHUElPIGxpbmUgaXMgYmVpbmcgbW9u
aXRvcmVkIHN1Y2ggYXMgc3RlcHMgMSwgMiwgYW5kIDQuIFRoZSBvdGhlcg0KPiA+IHN0ZXBzIHVu
aXF1ZSB0byB0aGUgR1BJTyBiZWluZyBtb25pdG9yZWQgY291bGQgYmUgaGFuZGxlZCBieQ0KPiA+
IGNhbGxiYWNrcy4gVGhlIGdwaW9kX2N0eGxlc3NfZXZlbnRfbW9uaXRvciBmdW5jdGlvbnMgc2Vl
bWVkIHRvIGRvIHRoaXMNCj4gPiBwYXJ0aWFsbHksIGJ1dCB3ZXJlIHJlbW92ZWQgYWxvbmcgd2l0
aCB0aGUgcmVzdCBvZiB0aGUgY3R4bGVzcw0KPiA+IGZ1bmN0aW9ucyBpbiBjb21taXQgOWI2ZTZk
MjY4NjcxZWYyZGQwMGQ5YTlhYmU3YmE0M2QxNGU3YTg0Yg0KPiA+IChjdHhsZXNzOiBkcm9wIGFs
bCBjb250ZXh0LWxlc3MgaW50ZXJmYWNlcykuDQo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpYnMvbGliZ3Bpb2QvbGliZ3Bpb2QuZ2l0L2NvbW1pdC8/aWQ9OQ0KPiA+IGI2ZTZk
MjY4NjcxZWYyZGQwMGQ5YTlhYmU3YmE0M2QxNGU3YTg0Yg0KPiA+DQo+ID4gV291bGQgdGhlcmUg
YmUgYW4gaXNzdWUgd2l0aCBhZGRpbmcgYSBoaWdoZXIgbGV2ZWwgYWJzdHJhY3Rpb24gdG8NCj4g
PiBzaW1wbGlmeSBHUElPIG1vbml0b3Jpbmc/DQo+ID4NCj4NCj4gSSBoYXZlIGRlY2lkZWQgZm9y
IGxpYmdwaW9kIHYyIHRvIHJlbWFpbiBhcyBsb3ctbGV2ZWwgYW5kIHNpbXBsZSBhcyBwb3NzaWJs
ZQ0KPiBhbmQgdG8gb25seSBpbXBsZW1lbnQgdGhlIGJhcmUgbWluaW11bSBvZiBmdW5jdGlvbmFs
aXR5IHRoYXQgYXQgdGhlIHNhbWUNCj4gdGltZSBjb3ZlcnMgYWxsIHVBUEkgZmVhdHVyZXMuDQo+
DQo+IEknbSB3b3JraW5nIG9uIERCdXMgYmluZGluZ3MgZm9yIGxpYmdwaW9kIHYyIGEgcGFydCBv
ZiB3aGljaCBpcyBhIEdMaWINCj4gYWJzdHJhY3Rpb24gbGF5ZXIgdGhhdCBpcyBhIGhpZ2hlci1s
ZXZlbCBDIGludGVyZmFjZS4gQ291bGQgeW91IGdpdmUgaXQgYSB0cnkgYW5kDQo+IHNlZSBpZiBp
dCB3b3JrcyBmb3IgeW91ciB1c2UtY2FzZT8NCg0KU29ycnkgZm9yIHRoZSBkZWxheWVkIHJlc3Bv
bnNlLg0KDQpUaGUgZ2xpYiBiaW5kaW5ncyBsb29rIGxpa2UgdGhleSB3b3VsZCB3b3JrIGZvciB3
aGF0IEkgaGFkIGluIG1pbmQuIEF0IGxlYXN0DQpiYXNlZCB1cG9uIHRoZSBleGFtcGxlIGZvdW5k
IGluIHdhdGNoX2xpbmVfdmFsdWVfZ2xpYi5jLg0KaHR0cHM6Ly9naXRodWIuY29tL2JyZ2wvbGli
Z3Bpb2QtcHJpdmF0ZS9ibG9iLzhkYjNmNjkzNDk0YzE4YjY0M2E1MDA2MGU5MTI2Y2IzZTBmYzYw
MzkvYmluZGluZ3MvZ2xpYi9leGFtcGxlcy93YXRjaF9saW5lX3ZhbHVlX2dsaWIuYyNMODUNCg0K
PiAgICAgaHR0cHM6Ly9naXRodWIuY29tL2JyZ2wvbGliZ3Bpb2QtcHJpdmF0ZS90cmVlL3RvcGlj
L2RidXMNCj4NCj4gWW91IGNhbiBidWlsZCBpdCB1c2luZyAtLWVuYWJsZS1iaW5kaW5ncy1nbGli
IHdpdGggY29uZmlndXJlLg0KPg0KPiBJZiB0aGF0J3Mgc29tZXRoaW5nIHVzZWZ1bCwgSSBjb3Vs
ZCBwb3NzaWJseSByZWxlYXNlIGl0IHNlcGFyYXRlbHkgZnJvbSB0aGUNCj4gREJ1cyBkYWVtb24u
DQoNCkkgd291bGRuJ3Qgd29ycnkgYWJvdXQgcmVsZWFzaW5nIGdsaWIgYmluZGluZ3Mgc2VwYXJh
dGVseSB1bmxlc3Mgc29tZW9uZSBlbHNlDQpyZXF1ZXN0cyBmb3IgaXQuIFRoZSBDKysgYmluZGlu
Z3Mgd291bGQgd29yayBpbiBteSBjYXNlIGJ1dCB3b3VsZCBiZSB3aXRob3V0DQp0aGUgbG9vcCBh
YnN0cmFjdGlvbiBwcm92aWRlZCBieSBnbGliLg0KDQpJIHdhcyBvcmlnaW5hbGx5IGxvb2tpbmcg
Zm9yIGFuIGFsbC1pbi1vbmUgYWJzdHJhY3Rpb24gZm9yIEdQSU8gbGluZSB2YWx1ZQ0Kd2F0Y2hp
bmcgdGhhdCB3b3VsZCBjdXQgZG93biBvbiB0aGUgY29kZS4gSG93ZXZlciwgdGhlIG1vcmUgdGhh
dCBJIGxvb2sgYXQgdGhhdA0KaWRlYSwgdGhlIG1vcmUgaXNzdWVzIEkgc2VlIHdpdGggaXQgZHVl
IHRvIGl0IGJlaW5nIHNwZWNpYWxpemVkLiBBbHNvLCBJIGRpZG4ndA0KcmVhbGl6ZSBob3cgY29t
cGFjdCB0aGUgbGluZSB2YWx1ZSBtb25pdG9yaW5nIHdhcyBmb3IgQysrIGF0IGxlYXN0IGNvbXBh
cmVkIHRvDQp0aGUgQyBleGFtcGxlcy4NCg0KVGhhbmtzIGZvciB5b3VyIGhlbHAsDQpLeWxlDQo+
DQo+IEJhcnQNCg==

