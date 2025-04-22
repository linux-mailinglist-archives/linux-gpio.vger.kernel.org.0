Return-Path: <linux-gpio+bounces-19162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D82A97B87
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 02:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 132315A090B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 00:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B533A8F40;
	Wed, 23 Apr 2025 00:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="SSpiEEXm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70C64C62
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 00:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745367076; cv=fail; b=dDOXYxzXS/oVWmQBAnDGlW+fnOyLcZ7v9+qEkT2LAa4EqI/Rg08YzdfnOjFI8q0bz5XkhTVS8vIqCS+48Rtx0J+ZB58151BD8KGBCHRcuU/1meu/2BzKkwW2CiVgplaepdPvHWWdT/HF+iwHVHPcbauNw6R62G9szuWki5lDPzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745367076; c=relaxed/simple;
	bh=moRl2yb2yX5kbDJ0us/Jdgj+zcuB6/d49fFflwTkigs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kLtuNYRmE6ILp3hvC7FxboLFlaXcMNXxK/ZZ8JRUv17nGCcXGYKhc2hpNxVSTZeMJn/3Zdrs6MXqOrKCI+Y6abrlOnv1gvwy8xUCjNm+PqikkOT/3U4PjgILD/Hg2IZSJc/KK6PQT7CslTKdQQuj6Kp0jWYB6aRUdooVfeNU0c0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=SSpiEEXm; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKxm3T012729;
	Tue, 22 Apr 2025 23:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=mo
	Rl2yb2yX5kbDJ0us/Jdgj+zcuB6/d49fFflwTkigs=; b=SSpiEEXmSXJk+98f5V
	4ZQzx7CgA+RTCyd1Ah82L5ogKRqhTZfVCSCYkOebFFxx/YACvSZAmGB0e+TK4RN4
	THybgmgJkiNwcfktGDzgMKKk3ACZRc5vvLcZYi0uRRZBDGqSowaiOJFNvoL5fxLZ
	FhF9JZqy4nOfw8ZuToGF9LEJEuD94h/eAjPBlPnTszDZGDIIPf0vh4EEpG9hOe/t
	+9CfUV/BrXnq29VlyV2vPNTCaVoDkr8i6rsTKVZaXul3t5SW9IP5OjXVuzkuCZyq
	o0XmKEjMbeZuCtlXbTPcyE7ECcD9zp8fP0S8nKDzbnlVfjbwEVKaiwQHz2jMHhbD
	ybWw==
Received: from p1lg14881.it.hpe.com ([16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 466jmqgv2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 23:29:50 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 69ECC80805C;
	Tue, 22 Apr 2025 23:29:49 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 22 Apr 2025 11:29:49 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11 via Frontend Transport; Tue, 22 Apr 2025 11:29:49 -1200
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (192.58.206.35)
 by edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 22 Apr 2025 11:29:48 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJkBmZmXoXgZK81Uy23Mw5J5RzdP/M+0gR4upyv33uDXT53DovRp+jT7WQYEH9E550yXZEv0ZMy2VnAHIrb2j9IU+lGZRZgpnNx5O8WgoiT9FcnIwrf/JIf6lg775WSW4EdugW4EHV38RqxeOlKRncrdTavWidlrkfCZDgqMQ4FLQzf58yzfg+tSuzXTb9IK2Y1y+hqbRBwK+F2/XU1IXiFOlXOMMFKWoWdExfgIhVAiDccUb7cditmoVkX/E3dXXbUDoHngLCXiagUHRT94VOolIroCSGTNNjHOejJ5jvIc5HiianH3I1a4T1cwyli8Pfy5U4ldeikb7HRokJsCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moRl2yb2yX5kbDJ0us/Jdgj+zcuB6/d49fFflwTkigs=;
 b=Z9kdUKCzUEtnqxlCCVEchtaBYJ+SzF59NxwcItNBYsp3ABlGg50cuGnt3ASICeqwwu9G6uGlWaOfcnXDSXEym/ka/gYBSht15ZyntS1o0RNgjdzn5ic3ExFFWs/xPU94m030CNOUhw9ikV1OrDIHtF/kLqMwA2g+y/m9W2JbDR974U2EksVYNKjJ/ATbrYln8VsqLFfxRxfOSd5GXAydixyoKMzEDYkACcOBE/hOdmSZwwCuDpPKRRJcXmAkv3f0dtJLsKTa901arrgXoqy1e++emxcVeJ1BsW5Pj2gkLl2jf/pDHcZNdpxUasbHemAe6fsawbm+EMic5vm5mcwFNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4c::21) by
 MW5PR84MB1692.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Tue, 22 Apr
 2025 23:29:46 +0000
Received: from DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::554f:12b2:3d3d:8826]) by DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::554f:12b2:3d3d:8826%7]) with mapi id 15.20.8655.022; Tue, 22 Apr 2025
 23:29:46 +0000
From: "Ernst, Justin" <justin.ernst@hpe.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: RE: UV platforms to test
Thread-Topic: UV platforms to test
Thread-Index: AQHbs9HqbULTdkN/R0W7ARL7kgVqJrOwSrSQ
Date: Tue, 22 Apr 2025 23:29:46 +0000
Message-ID: <DM4PR84MB18295F44324CD9AD83F5810787BB2@DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM>
References: <CAHp75Vcgk4QBrt3AskmbFviQmNQ8w2HQRZG0jz2U5DKui6v4VA@mail.gmail.com>
In-Reply-To: <CAHp75Vcgk4QBrt3AskmbFviQmNQ8w2HQRZG0jz2U5DKui6v4VA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1829:EE_|MW5PR84MB1692:EE_
x-ms-office365-filtering-correlation-id: 4189e333-efd5-40d7-6d0e-08dd81f59178
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cmw3eEU5ZWVmL3RCVnRKYndoUGpRRWdRdmRmbzRsMS9vS1VTNE5LVjlpUzc2?=
 =?utf-8?B?dFQ0dEd3bWlUU1F0bDVDYlpod1ZTNm1VN1h3Z1lsTDNJWUVkb0hUZGlFaDZQ?=
 =?utf-8?B?MGU4ZWY4VU1BQ2h6cXdISDZmMjREb2tYdUlEWnpoZUhaZ0hkTE9nQWthOHQy?=
 =?utf-8?B?QVVyS0hocmlPSDREdW00RmMxdUltM1NQRVNyMlBEQVBYNnhmRDRnakFUclV4?=
 =?utf-8?B?b2NnM0ZOQk9ERGZpdHlGMGREaXNVRWI3Z2RVYjd4V1d2Z0VTMmpIMEFMUWxB?=
 =?utf-8?B?SlpsbWJ4WGZiUlBBYUMzVXBDYVp0b1Y1SzJTenVjaEh5VUJ4VVNtNXVCTldu?=
 =?utf-8?B?TFBMejR3NTBCcTR0cldiVml0bjVzMFkyMFQzR3BvN2hvVUplSStGM0tVdUdu?=
 =?utf-8?B?bDdRZkMyRVBrMDRXLzk2Vlc4VjNNQUxZODdSeUtQWHlDUStMM09yT0tvOE9a?=
 =?utf-8?B?L0NXR0VFTTJUT2ZLNmN0cUVabG9nQ1dXdk1vVU1SSHBYNUdyWWlRUzJUaDhm?=
 =?utf-8?B?S1VoZmNsdXZHeDc5US9vVS9ZRCtCTEdUNHZyKyt1Y0U0eFFpKzJSUWhZbkVi?=
 =?utf-8?B?OEw5TjRlWFJqbnlxRUhjRWhzOHc0ckpxdlJIdFZlZ3NnTjNZYi85cDNnRW5l?=
 =?utf-8?B?T0RCK0ZzOHE1elpyY0RTSE01Mk5zeHRIMGdQbjVmejZiaCtac1R1OTZER2w1?=
 =?utf-8?B?a2VPOWgyR1VZcWZpaUlkOUdDdXBXZEdXNngyMndweVh2cTkwbEpveGdSSVps?=
 =?utf-8?B?MExQR1BTVFBOZURETEF5MENwVlA1Y3dGRk1wTFBUb014SFZkaXBzMVUxYTVE?=
 =?utf-8?B?QmErWXBJWU5BOFBaRjNtUFNqWWFkV005RHllUm4zR0V1RDA2Ukt3aWxQV09s?=
 =?utf-8?B?blFqV09mY0gwRDI1cGNBY1Qwck50RWxxWGlsbUlzRzRIN0hLc3kyV1BBQUVS?=
 =?utf-8?B?aXFBNnYrOXhzY1ltWXN4Tk1OSHJ3M09IUXREeXhxSkIrc3NKLzJ4Q3Q1VWxI?=
 =?utf-8?B?aDRkc3Vva0ljYkZ6VmdJb3hocjRmRDNiL0xGS3NsR0dMQjF0Z2JER1lrVlU2?=
 =?utf-8?B?eG1OS3YvZnp1WVhDMWU3Z3BSVXVIcmYwdjBzUzlncmRmcjFtT25LR1lMZjFP?=
 =?utf-8?B?Z3Jnb24xTHpVQmYxd0ZuaHhBdktGdlFSMm0xY1lLZ1ZKN2x2MW0xay8yeFFR?=
 =?utf-8?B?TzB1eWN3V3NiNVl2QUtXeVIwOVFURk9NdjdwSjVtS1B5K085akZTWHJDN3M4?=
 =?utf-8?B?ZU1zNlkwcVYvRm1lOTlFSUt2WGRNekVEUWxQMml5MFl6alU4WWdLMmdjV3Fl?=
 =?utf-8?B?WHpBenlmR0I4SzhPSVQ2dVBuKytZemNvOGZHR2xWYXQybDVEcXp4bmNnSVZM?=
 =?utf-8?B?VVJOdjJacytSdXNHL0pib2daaUw1dFRLZzZMaUlhOFNRZzZiSktUM2paZXdz?=
 =?utf-8?B?TEdiUjlyRlZTc0lra3A4VDIwdXpKbG52UjhwZUdWcmsrck54NG9KWWtvNFd3?=
 =?utf-8?B?K0pMdDlUald3bWhyZitaV2dnaHJab3NYUE16UzUyRmdiREtobGZaN05GMnZw?=
 =?utf-8?B?bDZpdjhhRWkzY0lxZzNDOFV4WnQ3aDlOcFhQeGo2RHlzUXlKaFBvbFpZeGVK?=
 =?utf-8?B?MzZDNERZamhkYzdTUUtFYUVSQkJreC9jVHNhbzhzVjh4b1RDZHhNb044dWl1?=
 =?utf-8?B?UmZUNGE1WjhRazlSWVNONDJneUhtTWFOUWZpTkhwWFBKWVdiUlh1a1FEaity?=
 =?utf-8?B?ZTdOUUJSeTJCZm1ObWZONGRVY0xBTVlYQVB1cjRYYmJNZU0xdE5yUEhsa1Nu?=
 =?utf-8?B?ZFRKSXRnRzIvcW5JeHN0SFNUYlNlWTR3RGRuaVVxWjN0VzdQYlRFVmhibTRX?=
 =?utf-8?B?RXR4ams0MUZTWUNWa3pyK3lVMlJIQzFrSThEcW5pZ243NDZ6enYzRjhmTVVD?=
 =?utf-8?Q?F6UkOmoF9go=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nk5ucUNxaGFKTC9MVFJzc09EdFBaNDJBRi9HaVQvT1FLZHNUZEM1d0RqUE12?=
 =?utf-8?B?d25EVmsydEhld2tSQ2hXU2sxUnpZWVRtbm5oM3FFeU54alFhSlpmcHNycTRC?=
 =?utf-8?B?VmpRck93UzBBb2c4enVKMkJRVG91d1VvOVZJVitRNmxpNTlMWmM3bFdOaFFh?=
 =?utf-8?B?SFRjOXdvQ0hKVkhwMWUwaWhVZml3VmFmTXNyYWs4VThOZy9DejJXUDNIU3o2?=
 =?utf-8?B?aHZSKy9hVkc3YjR5VXF3QllhRzdpZWFoVmNSWHlxZUQ5STgvckp0WWpsdGJr?=
 =?utf-8?B?OFdhbTJ4SWUzQjUvVVVZY2dMOU9Ja0htS0duQXpFdkNwR3huK281cXowTDZO?=
 =?utf-8?B?SnJ3cm9BbnE3dk1MTURMcGpyZGI0VXlOWENBTEVpOEpYYUJBSVcxMkZVQlQ2?=
 =?utf-8?B?OWJXb3dCWFlTemo1a0ZnNWdhTWxvQ0loaDVlNkZrYlZKQit6VkJTMmRuKzJY?=
 =?utf-8?B?SXl4M0haMEcyUFFYS3I4MXNaOWhjNGVoRDR0TlNXeWpBZitSQ3B1eVV0aXRx?=
 =?utf-8?B?aUJOTFRiM3FtNlFpUU1BNHljZFJ4L2psMC83V2JlRStpcCtvL1ROeVVCMktq?=
 =?utf-8?B?YUhuSmNoZWFvVldGS1ZWcVB3YkQ2ZEdBN0kvL1F6UE5XYnY0aDR2UkdKSW5i?=
 =?utf-8?B?emQ2bkpqVzlDWXZmREdZVXI5MTIxUC9XZTY5dUErMGJJVS9INTRGZkpQcndC?=
 =?utf-8?B?KzY5L0lDbWJ3T09XSTVlbUlwZHJOcTd3RUFVZ0NubnRaSjJLTWdNNjlpazIz?=
 =?utf-8?B?SVhZOVF3N2tmQnJKSVJjZU9SSXlydGxLSWUyMHN4ZHJwbEFBYzFYeXVEZ0Iz?=
 =?utf-8?B?aUVxL01iM0FnU0Z4K1lzVExUNEp1OTZhcVFCWVhmeFhDY1FzaEtBVGgyVkhj?=
 =?utf-8?B?SjlaNktSUjNCekd1ZDlXcGFydHFuM0RxWjVXV0wrY2JCdWgrMDFqbUJzdVFI?=
 =?utf-8?B?eGk0QkdRMmxmWE5hRGx5a1NlZkx6SzRWOUdXMlkxbFdaQ0hoNXNLVlRmaEVv?=
 =?utf-8?B?WHc5TTRFaStOVzhSdm1VV0hLU0VVWU41WE1iOGVNOHNnN2p5Z0ptd1Y4WVRa?=
 =?utf-8?B?SkdJZ3RuWDdZTWhMMEVMbWZxdDJib0orbFpnMWpQUzN5eFNrWGpQSWIyM05y?=
 =?utf-8?B?S3hVMlh1a1A2T2hmcU15dWFjeEpWblZaRWYvSTA0eHMycHd4L0VBd0tmRkpQ?=
 =?utf-8?B?YkRxTnpmOVgwVlZTRm40UU1Jay8rL3gvZm5kaVh5eVh6NTg0Nmpma0c1VXVu?=
 =?utf-8?B?ckdHS1hGZUFCbG51dzQvOUUwMTVMVWlBcjduenNOaEh3bklmWkZjWCtOUDJk?=
 =?utf-8?B?Y1pSWm9IejZFUGhrMkx5eTgxRlNxQ2dTUHdkaW0zN1Q1WDhvakF4c1RaVkhH?=
 =?utf-8?B?K0h6RlN1Vjl5SmNVeENFQm0wWnJNRDdVVUZUTDVtSFd3alk3WEhLQUFOcXVt?=
 =?utf-8?B?TUlXVUVqZXVRaTFudC9sSnZIYnEzY1RoaTcxMjFjRnMvUEVIamphZG8yRGpN?=
 =?utf-8?B?WWpMTDY2YVdPQU4zNCt4eWwyTWFEY3VLeWtadGJ3TG40dHdEekxOaGFTZXNx?=
 =?utf-8?B?M3ZPUlpmTVI1NVZXZmZtMEU4dHJxaFMrbURmeXg5RENBUlQvNnhubDFySExO?=
 =?utf-8?B?TFRSYStpckdtbzJ2NWU4OFZsUzF4Q0ZvRXRJMDVPYnlrbXJPZDI3Y1FzYTR4?=
 =?utf-8?B?M1laTVc0dU1YZDRwKzgveFZmWXc2Q3RXbjcxcVMreE4xODFJU2FJSU5GbWU0?=
 =?utf-8?B?WEZNZmtzdk1wUlEyR1RWMlZtaVBtVUt1czR4SjRJcVlwSHkvelpZandtVHZs?=
 =?utf-8?B?OUlKUEhqTVFZZEpseEI1QzU5MWVzS3VENHN1RDVrQnpGdzY4MFE2NThsQW9C?=
 =?utf-8?B?cTdQQU55cCs5T2FXa0t4dTc3cGNNMUF2a0JhMXhIL2ZNQ2pVUjZ5SmM4Rk5s?=
 =?utf-8?B?Y29EV3A3bm5ocFdoMy9OQ2dpWGFpZ1cwaU1PMzBESlNnMHB6NFhhU2tkd0JM?=
 =?utf-8?B?MmNJdUdhcUplZXhlSHFLcDZYWC9YWnJvRVVOTU83VW1HeGVLeW54VVd2TEFC?=
 =?utf-8?B?V3Y2dkpQRmJtV2FFYnR4elBBclAzcXhtMEh1c2xRRTNCRXJ1b2ZadlRzZGpU?=
 =?utf-8?Q?LWF6Zhv+GI4GQ8Q1lGRJcatUT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4189e333-efd5-40d7-6d0e-08dd81f59178
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 23:29:46.3653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nuBo7ylHIeWCOsu+vHsvmIagptE5rDDWWbXIIr4/g3eLSfREZtzkSG4jTP5XqVUql64T+1KsG75oxtUT2bChNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1692
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: 2xSBIYFmlSWTRJ_eEqFh2HN2A3sUnjz-
X-Authority-Analysis: v=2.4 cv=Lfk86ifi c=1 sm=1 tr=0 ts=6808266e cx=c_pps a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=ZMiWC4AOMkDTe8NZEwYA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDE3NiBTYWx0ZWRfXwVrCWDxL0cYn aF0wPoLzKf08uYlEivSEk0h3D9QD9GeKgmClHEN6SUHGkwYWLB+FvLncAoknVxaIoe1z+Bb6EUk IllovLNEF80HOo1W4iY8u+sM1L7CaKEzg3IiEB1zpwuxlBUB/OnT4vgwz0DToIVBvrYIiV2enTf
 8Wb2yInE58UnbOZl9vSb9J4tFEWSex9h7NllYOKukRtu8iLf+KeRqjQoydKHytExhFDsdlOu67P Op+xuV/0YuEMdUpHXO5xqgxnnGYqnFxzaRoV3X1DRUEw6XSOHTaZbKGWXsS3AIzQKtDwLYIW3+i lvZ3xA4NTwwlgKF1y15KSAxpbkfc3ci0CgytumyDRpVwhqCDHFlk1s84d/F1sImxRKgcCbEpWQy TPabmZah
X-Proofpoint-ORIG-GUID: 2xSBIYFmlSWTRJ_eEqFh2HN2A3sUnjz-
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_11,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 mlxlogscore=783 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2504220176

PiBIaSENCj4gDQo+IEkgZm91bmQgeW91ciBlbWFpbCBpbiBNQUlOVEFJTkVSUyBmb3Igb25lIG9m
IHRoZSBVViBwbGF0Zm9ybSByZWxhdGVkDQo+IGZpbGVzLiBJJ20gd29uZGVyaW5nIGlmIHlvdSBo
YXBwZW5lZCB0byBoYXZlIGEgU2t5bGFrZSAoPykgYmFzZWQNCj4gcGxhdGZvcm0gdGhhdCB1c2Vz
IHRoZQ0KPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNC4zL3NvdXJjZS9h
cmNoL3g4Ni9wbGF0Zm9ybS91di91dl9uDQo+IG1pLmMgLg0KPiANCj4gSSB3b3VsZCBsaWtlIHRv
IGNsZWFuIHRoYXQgZmlsZSB1cCwgYnV0IEkgd2FudCB0byBoYXZlIHNvbWVib2R5IHdpdGggYQ0K
PiByZWFsIEhXIHRvIGJlIGFibGUgdG8gdGVzdC4NCg0KSGkgQW5keSENCg0KSSB3b3VsZCBiZSBt
b3JlIHRoYW4gaGFwcHkgdG8gdGVzdCB5b3VyIGNoYW5nZXMgb24gc29tZSBVViBoYXJkd2FyZSBo
ZXJlIGluIHRoZSBsYWIuDQpXZSBkbyBoYXZlIGEgZmV3IFNreWxha2UvQ2FzY2FkZWxha2UgKFVW
NCkgc3lzdGVtcyBhdmFpbGFibGUgZm9yIHRlc3RpbmcuDQoNCj4gRm9yIGN1cmlvc2l0eSwgdGhp
cyBmaWxlIHBva2VzIHBpbiBjb250cm9sIHJlZ2lzdGVycyB3aXRob3V0IHRoZQ0KPiBkcml2ZXIu
IEkgaGF2ZSBzZXZlcmFsIHF1ZXN0aW9ucyBhcyB3ZWxsIHRvIG1ha2UgdGhlIGJldHRlciBhcHBy
b2FjaA0KPiBvbiBob3cgdG8gY2xlYW4gdGhhdCB1cC4NCg0KSSB3aWxsIGRvIG15IGJlc3QgdG8g
YW5zd2VyIHlvdXIgcXVlc3Rpb25zLiBJZiBJIGNhbid0LCBJIHdpbGwgcHVsbCBpbiB0aGUgcmVh
bCBleHBlcnRzIGZyb20gbXkgdGVhbSBzbyB3ZSBjYW4gYm90aCBsZWFybiBzb21ldGhpbmcgbmV3
Lg0KDQpUaGFua3MgZm9yIHJlYWNoaW5nIG91dCwNCkp1c3RpbiBFcm5zdA0KDQo+IA0KPiAtLQ0K
PiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQo=

