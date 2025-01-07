Return-Path: <linux-gpio+bounces-14562-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B03A4A03D6C
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 12:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 170D73A3C52
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 11:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587491E47C8;
	Tue,  7 Jan 2025 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jpsBThWJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011033.outbound.protection.outlook.com [52.101.125.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C761E4929;
	Tue,  7 Jan 2025 11:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736248587; cv=fail; b=mGqP42twBUn0kVQnEzePpMA9S6SguS/vgKt5ibYd+ZbrR+xMl4WV+sR6oYJloPEvEyHJi91EYf+pEs7CRFMr5bm0mzUH/U6TSkwdFTEt7pjCboRSBOwaa6calvBRT3dyVj4RN5TQSPwWf4IMYPEMX2WijqWr2k9jeJXgD2ChMj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736248587; c=relaxed/simple;
	bh=80yifQWiVLOXAv4ti6InITaksC4DOqij8KHK9LABzUA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WX+PHxugwjG9O0ZlV0r1RzMphjimrGugyoGlUXS7pGE9awDNUEcuGg2jrUhpOvPjUGza866v4bMfPMNOWRuktqm2uu0kGllW2Z0C2ZyY45OYt1KdPxtuRADSNFlzI84iKbAJ6iIh3zOhCb4rYWp1SgeRAqe4e3ZSHfmko+fi3QE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jpsBThWJ; arc=fail smtp.client-ip=52.101.125.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkHTGoxGkiiaRasd0YokOxspZju5B4Zz6R/MOeZbvVOu8dFhFquY8XLMwJ5S1XHfQdZucwRbKR+jJwF9TeO1gwKzPi3Cl0Jra+yVLyiAD0eiyFAq1/NIurVDXshIiGh63mEQWy0AR2BPCdPbtzrtteZQZ9yCw+2MyRdqU7Sw0b1DoC0D8EdyXgFqMGHgCwxL+JzYn1P+NIyOM8jIp5z9L7NbQ0FA+nzZ/zInjd9FCjrjr8RfhalSOHrpJNFqWsQW38PZji6uymGEpMmdhWyzSRTud4x/o7T2+iXzG6m54DZD0oxS7w4pS/1Bmp635HRN0llipflTtDYiXRXsHuRgQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80yifQWiVLOXAv4ti6InITaksC4DOqij8KHK9LABzUA=;
 b=ftSfsTP9icslUyFAolZCib4G78/M5rTaggAQq0QJ45+r6xsO1eK4MElr3xQc9X+nannLcGR27DacnnTF8SVYF3PouupPQlv/rIwtvoDFDfxAbgYa0kDqa9iWq2AaK22EbgQK1u296mykfEUCb1Syi3OCiDyp951+gPSEaUnV7blhArIvP6krLTsTyDtE2XS2ezteYQLhc1Oc+CQmMSQrztTRNP/0s+jHHktNOc9cZFACTO97pdZ9h82CPOHwo7+EdNxl/RnmyRG+uM0x7LDxHUtFRlOSx6uTxCecgu/oI6U3xgaIdJ5aPE1FBxVmWABC4Xk6HJ1Cm2D0aSnINpWIYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80yifQWiVLOXAv4ti6InITaksC4DOqij8KHK9LABzUA=;
 b=jpsBThWJoy/0fyMw0dXsxu+gPdJ6r+Yp19K4z48cRmWmrMJxaSjhH3QE8HUDKlZ04ZqwQfkDtzB8jVU1zFM7JyXOyPm9gSBsseB/yO49qpXEaXO8za3yrn+GDh2+6wpj2cri1hLb76QEZeRpNmTiMGSLypONvH4TBgn0MOMtG20=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10510.jpnprd01.prod.outlook.com (2603:1096:400:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 11:16:20 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 11:16:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add alpha-numerical
 port support for RZ/V2H
Thread-Topic: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add
 alpha-numerical port support for RZ/V2H
Thread-Index: AQHbT/Q3WD6tdQXPjkGBdqOWiVuV17MFfr8AgAXMM5A=
Date: Tue, 7 Jan 2025 11:16:20 +0000
Message-ID:
 <TY3PR01MB113465EEACE66870D4E7529DB86112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
 <20241216195325.164212-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdVcDc1YK70WT9YF+tTR5Qxk8Wq1v+moPG9xK5EgnYyhag@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVcDc1YK70WT9YF+tTR5Qxk8Wq1v+moPG9xK5EgnYyhag@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10510:EE_
x-ms-office365-filtering-correlation-id: 6109aea7-8e5a-41c4-e204-08dd2f0cb696
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SkIvL0t3M0hsejhVVUdRUFlLdUJoV0JlZEJxRTFmckFQT1NoN1lFM3pCYmR3?=
 =?utf-8?B?M2ZOR2ljSnBPaEJ2NlA2YUFaeSszZHpLeFNqRTVPUFBENGVmL08vVk42bnNn?=
 =?utf-8?B?UTZIRldqTWU3TFh3cDgvS3U5VjZDVGVnQkQ3c2VnNzdIZHZPemYzOFl5a2Rv?=
 =?utf-8?B?NTNFNDhBZkhndkpTUEQ1SldQNkl4NjdrOCt4eVJFOHp2NVpCZlptc2hUakhV?=
 =?utf-8?B?aDlHTWF0SFJHQjJVdGRrei9ucG9wOWlpZmx6eEFkaXhyeHNZWTVLbzJnVU9o?=
 =?utf-8?B?WU1Lb3lpSHIzT1R4TVg2a2dDMTFIZWkvUnhodVNWaHQ0ajYrdnYxNG5jYmdJ?=
 =?utf-8?B?SUIzeFo1TGc5RjdHbkEyaWFMZ1JDRjVNMXNnbkJUTCtlajRBOWsyak9aMGUv?=
 =?utf-8?B?cDQ5TERiM080cWNDQ1ErYW9GT1Q1eW95ZVp2dGI1Y2JORzBNS1h3ampQdnk1?=
 =?utf-8?B?UnVaajBpV3FiZ3FLblZkK1BCYzE0RVR2NEgwZmM1b0R4S2ZraXRzT2dqQVhC?=
 =?utf-8?B?elpUeHZiVzNtdHlwcnNES0ZxZzZ3ZUtkVFhReElPOHFicTYvY0sweXNBOW52?=
 =?utf-8?B?NjY0RlU3UmR5TjE4YUVqbE1JUmMyN0hkRGNJZithOHp0QUd6UDlrdjB1Z2lO?=
 =?utf-8?B?MERaUHB6UzVpMjZaVmYyRExzcEFvU3BzMTR6NFRFMzRmNHU4cjFHVlNXWjYx?=
 =?utf-8?B?cm5TWXUxSHVqNzlHcHN4U3NLOVM3TTFmUFNKeGYzV1NqL3ByLzg0MG5wR1J0?=
 =?utf-8?B?NVdhcUtmZHRNT2YxY2VRdEs4eHVtdmdTQlNBWjBEV0IyMUpqVHk1SytkNmFu?=
 =?utf-8?B?eEIvdjRGTHdLbWNoOEdDZk94aWhQVUxEN1h1UWtiZG05Vjg4U0dreGxvRzZG?=
 =?utf-8?B?SGszeVQrQi9Wa1lwanVlY1I0akhGajdxdktrSzF5VFZ2ODArYkdmQlR5VUxQ?=
 =?utf-8?B?WFBkZXlyMnlkS1c0YVd3RlpFMjNVVWdEUHVWbWxQTHF4aWhvLzE0ZlV4S1ha?=
 =?utf-8?B?ZGgwWDlVSGxNNG9MVDhoRHlvU1dpSmJwWGVLa1BIYWdXQVR2YlJ2TVRkM1Fv?=
 =?utf-8?B?bnljRy93MGpBV1pNck9XaWRpbHRJSHlLUkdCNXdwRzhBVXdzNWxYV1NEZXZT?=
 =?utf-8?B?QkJuRWhKbm9lMDIvV25LU2VjMEFLVjJZOUdZZlBwRVFPNVh2RXFwMmd5QVpO?=
 =?utf-8?B?RzFJa3JwNStTTXUrM0xXUDZsUHlTVDd6YXp6ZFZ2ZGNJWGZ3UmlETWpjb1VR?=
 =?utf-8?B?OGxpR1l0bWVrbEpiYmlXb3ZTQlZHSStCUUtlaERRV0UreW1GYkVkdjZteHA3?=
 =?utf-8?B?VHI0RFEzL0ZSbjJoRVdUcnpSYVlxWitaMC84bTE3aUhLemQ4THRPR0h1UHht?=
 =?utf-8?B?VWNPWGVsZDNOL2l5Zm1xWlhVWUdvOGo5VkF4T0ZSOXRwcHB2TmMyd3VPU3c4?=
 =?utf-8?B?bFl6VnNCL3lvdk00eFNCdDlXMGpFa2dZWHVrNE5MekNCS1g1bHQ4WTBoQkdG?=
 =?utf-8?B?SkdDVkNVeTN0Nm1ZVml3S2JLejZyd0FpdE5JTi9tY2FNbU5ZWHplLzROK29U?=
 =?utf-8?B?empCNFdBcEtmbmFrYjBVS0tWVHI4bWVsN0JFU1AxYkRmZFhWdUxyT3N0RE52?=
 =?utf-8?B?b1htMTFYQTdHbXpySUlCMXZiV1N6UE1aU2FBVWhZbVZIVXl6Q1lvR05qZmdR?=
 =?utf-8?B?N1JjRlZkTElmdTB6TkR0LzN6WWNGbE5neU5yVjVEYVF1Qkx6SVpXc3RQTm1j?=
 =?utf-8?B?MW5oZGhTYk1FZ3ZzYkZ2ajNmR0lkUEJmSXpLemExMHBtMCtKSW9sd0tGVmJE?=
 =?utf-8?B?aHpoSmJvVzg1RGJEYnYzYkI5aFRBMkRRamlpY1lYRzBFaUczNDZhRG81VVFq?=
 =?utf-8?B?R3ErWnpNaWkzVEE4TnZEUlc1MmRaR0gvTVRpYlViQVFpOSs3NkFPOVVwVGxH?=
 =?utf-8?Q?cTc5iAhfqOAU5oeOUphchOuAR3W89KcJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zm9ZOVJ3L2hDZ3dOS1RrK0YrbFlBdE5wa0V3YXl1SWJEcTFlKy8zSk1pd0Jz?=
 =?utf-8?B?cGlRWW9qMmxPRnd3c0lBSzVYL0VISkVXaDNtekpTTmt0QUZ6U2YrZG9WT2tO?=
 =?utf-8?B?eHl3UDVqT3JGMU41MFFZRS9yUXJ4NXlSMDhWcEFCTmVQU3JVNjgybkIzaGdR?=
 =?utf-8?B?OWZ0WVlKb2U4TkljeTNlYUxuZEdnWlRhQU1MVlhNbWJMMmZDT2hodFcwNzRl?=
 =?utf-8?B?Rm5LWnVNbU9uNjh6S3VkNk16SDlaN3hmWHlzYy8yd1lYSlM1cVZJdFNUSXRh?=
 =?utf-8?B?UDVHRWhGWXdHbXlKQmRSR0xyS1Z5bWlqMEpDaXhwRXJIVXFSTWc1RXpVMCto?=
 =?utf-8?B?V3JpYlBqdXM0S296OTJIVDFJTm0zYUN3MWFEL3FqSlhpTTkySzk0emhYYUhZ?=
 =?utf-8?B?YmxrdVpxczZ2NGk5OFZTOGk5ZHZlcTE1dkVndk1PTS9zUElSdVpvUk9RTEVR?=
 =?utf-8?B?QTZTRFQzakk5T0lZZnBXRTJDcm9xMDNFL2Q0TlN5Sk5MQm1PTTZhcS9pV3RY?=
 =?utf-8?B?bW84K3JFMkJlY09UMTByeGZ4Qk5PVDl1anJqYlQ0RUVhekxnYTRMVm9VT2Ji?=
 =?utf-8?B?d0RkS25uQUVCdUdVdWtmaDhxdFlvNERVaWptODRqUzB3d0R2UEZhNnNlQkhV?=
 =?utf-8?B?RmtINUpja2RaTElIUlFIRmlEU2lLazlic3JjVE9xN0ltd1VDVlN2K0lJRDVs?=
 =?utf-8?B?dUowL2luVjFWOGNEcFUyQWNHOEYxZWIrN3VlQWI0NjJkS1ZuVlBrSFBDb3NO?=
 =?utf-8?B?Tms4R3Rma3VoRk80SFNnMk5CNjRDTDFOVXEvMjNNT0RTUWNyS1QxMEFZRTl0?=
 =?utf-8?B?YXN0WWw4Y1YwODF0WWNlcGtaVE1lOTlybzVJS2RiWnRqbVQ0elF0ei95Tmc2?=
 =?utf-8?B?bGMxaWpTamFjTFYvN0JDUnNhOWp6UmlKV3J6bklScUJscjZkWHB0UUFmN1Ar?=
 =?utf-8?B?bnI1QStYMTdwVjNtc0ZmNjJUa3NZa2NOUmsveFJyRkxMVTZLZ1c3MEpHdkQz?=
 =?utf-8?B?S1YzaGNwM0hrT24zcUhkQWpaMjB1ZGE1ZFdCQ3UxeUxQVjhES2dBTXllWmZj?=
 =?utf-8?B?QkJrL0MzQnFCODlSYmNNN1I1MEY0TlNwaDhYYlhHQzBPVXBDTkkycFhCalZt?=
 =?utf-8?B?Vk9jT3FQd0FXVjJ0cUtscHF2MVZmZ0ZCeGJoSHRUL0hGbnhkRUJyYVZXTWIx?=
 =?utf-8?B?eElPSHA0Mkw0ZkE3RWZsNFdaMzh2aG5pY1pKK1h3QmcyWXdRTGdYd3kxV2pv?=
 =?utf-8?B?Tm1mODVheEpYNU9vbGtrd2tGTXhvVUd4dk11MlQ1eDVWelpySFRqL2h3UVU1?=
 =?utf-8?B?bkxBeFVaTVZ0djc0c01aVjUrODJSTjBOeExtSWJlTGZzb2MydVViK3hXeVBI?=
 =?utf-8?B?cFNUbkMrYWp0c2RhOTRtczN2K1ZFZzl0WDNnNWlhYmVJU2M0RU5TQUNYZFQr?=
 =?utf-8?B?VDF1RkxibmVway9RMW1QWGhVcXViRUZ3S1lQZXRmRmd1Tys1WHV6RWUzSW9z?=
 =?utf-8?B?blBoaFY4cXZQVXc5VGsxOWpRMGlmcFd4QWY1d1ZPNFgzTDI3blNFKzJ0RG9B?=
 =?utf-8?B?cDFDcEtka3hkaW9ycFFpZDVtYzJTaUkweXIrSUZ2TGo2Y3poTTc2RmpOLzJW?=
 =?utf-8?B?a1g5SktjaStyaVVjNUtsbytLcnl5Um5rZnBZenExS2w1Qm5MbldzQmQ1QUlZ?=
 =?utf-8?B?bVYwTmhlc0JZRHpSdzJZSVQ3NkxuMU11cGR1Zy9kQ1pWQldjUWhWVUFaR25Z?=
 =?utf-8?B?WGsrMzlHcWRzd28rakJwZWhYb0lzTUFmRnlhWUZmNWFHZUxSUmRSa01wR3ZW?=
 =?utf-8?B?L1Y3am4wRzJnSDhRUDdZb3FlaHl3VUdod1U2REJzZWt5RkE1Qy94eDU5Nk5n?=
 =?utf-8?B?c3pGRW0zZ0tRcjRudU4wS09PRGhzd2VqMWtCV3k3UkVMaUt2Qk5wd3BVWXk1?=
 =?utf-8?B?R0dkMmovZVFwd2xoUjlERHN1ZGlreHV2Tk12TDIwWCt5OTc2SkN1R0hYNzlq?=
 =?utf-8?B?OWxjTnpyQUdNU0hDVVAxZnI2TEwyRXFIVDdWZE9nd0ZUSnlBVnBwZVdRRkg1?=
 =?utf-8?B?ZE9EamxwRGdOMnpkQ0xTcWtSODVVbHdXanZ2NklHTGdZbjZrQ2pSTDlwTzNv?=
 =?utf-8?B?YUJ1dFVhTDA3MDkweUN4bjljVXBJRUNmUTFZU1JWQ0xpRmp6NlA0dUM5Uk1O?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6109aea7-8e5a-41c4-e204-08dd2f0cb696
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 11:16:20.5464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kKOfrM8jt9XLV4Qv4EzzqzmFXt+xWwaZqnBeVDwLDfzQ3KdS9557k/c5ObvbMi4hbLtN2YiyHjF/ZqkZMeik+sNwb1U11moNzD/eduK6w9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10510

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDMgSmFudWFyeSAy
MDI1IDE4OjQzDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMS83XSBkdC1iaW5kaW5nczogcGlu
Y3RybDogcmVuZXNhczogQWRkIGFscGhhLW51bWVyaWNhbCBwb3J0IHN1cHBvcnQgZm9yIFJaL1Yy
SA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIE1vbiwgRGVjIDE2LCAyMDI0IGF0IDg6NTPigK9Q
TSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFJaL1Yy
SCBoYXMgcG9ydHMgUDAtUDkgYW5kIFBBLVBCLiBBZGQgc3VwcG9ydCBmb3IgZGVmaW5pbmcNCj4g
PiBhbHBoYS1udW1lcmljYWwgcG9ydHMgaW4gRFQgdXNpbmcgUlpWMkhfKiBtYWNyb3MuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+ID4gLS0tDQo+ID4gdjMtPnY0Og0KPiA+ICAqIEFkZGVkIG5ldyBoZWFkZXIgZmlsZSB3aXRo
IHNlcGFyYXRlIFJaVjJIX1AqIGRlZmluaXRpb25zLg0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBk
YXRlIQ0KPiANCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5n
cy9waW5jdHJsL3JlbmVzYXMscjlhMDlnMDU3LXBpbmN0cmwuaA0KPiA+IEBAIC0wLDAgKzEsMzEg
QEANCj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNE
LTItQ2xhdXNlKSAqLw0KPiA+ICsvKg0KPiA+ICsgKiBUaGlzIGhlYWRlciBwcm92aWRlcyBjb25z
dGFudHMgZm9yIFJlbmVzYXMgUlovVjJIIGZhbWlseSBwaW5jdHJsIGJpbmRpbmdzLg0KPiA+ICsg
Kg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLg0K
PiA+ICsgKg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpZm5kZWYgX19EVF9CSU5ESU5HU19SWlYy
SF9QSU5DVFJMX0ggI2RlZmluZQ0KPiA+ICtfX0RUX0JJTkRJTkdTX1JaVjJIX1BJTkNUUkxfSA0K
PiANCj4gPiArI2VuZGlmIC8qIF9fRFRfQklORElOR1NfUlpWMkhfUElOQ1RSTF9IICovDQo+IA0K
PiBfX0RUX0JJTkRJTkdTX1BJTkNUUkxfUkVORVNBU19SOUEwOUcwNTdfUElOQ1RSTF9IX18NCg0K
DQo+IA0KPiBXaWxsIGZpeCB0aGF0IHdoaWxlIGFwcGx5aW5nLCBzbw0KDQpUaGFua3MgZm9yIGZp
eGluZyBpdC4NCg0KQ2hlZXJzLA0KQmlqdQ0K

