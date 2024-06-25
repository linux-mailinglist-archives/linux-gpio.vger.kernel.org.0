Return-Path: <linux-gpio+bounces-7663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A16915D51
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 05:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DE57B2130C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 03:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED3345010;
	Tue, 25 Jun 2024 03:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="fe6eizxz";
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="YZsfpr38"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C03286AE;
	Tue, 25 Jun 2024 03:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.153.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719285908; cv=fail; b=RwFdaRNe2yEQt3HW4TEPtGg0BwjEeZYpHR8uyULMPnqQ1sjtTGLozi74MJ0BlFElB5914DUN61b3evoCNXWyiXGKcDjgEm1AKAWNQO76F5iKLXVIh7qun/EO5gJqvzSL2SuTQMwPUG6bHWrGm6ZJRIrbDp9QrT2beVkrvIaN3UM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719285908; c=relaxed/simple;
	bh=Ke6zrvYMqb0S4t+w3smr5xyNXoQFTB8/570rC/I6qUk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=S9CvkHjObiKJ/a6Rc3tigbne5DmhFJA2Cl0lSJ9WuqVkE+5IQBbc9ZYsZ9xdM17MA7AU2vfgrt45SwiME+ziwKHINzo9oTDX22bRj1U7mSMkXcVgF0jwtYMcvE7o51/PAJGrV9F3bRD6J8LzmyG5WB5GaG/r0E7qAilCsDzXjko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=fe6eizxz; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=YZsfpr38; arc=fail smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719285905; x=1750821905;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Ke6zrvYMqb0S4t+w3smr5xyNXoQFTB8/570rC/I6qUk=;
  b=fe6eizxzrOM0+NZ3oNhUJMhbPJ5H+0dtwSFV3MlqRuiKDaus1sD3/3q3
   vfcTsVc/BIvaYvDBdnSuzhWvS+Qxx0892VtN8jAPMABDAJsScE85nCEXu
   A/v6Dq4vOs06OBzDLPhIobhZadVkPhAD+h8cI1L1vLBy8qlkC4xWBjbVs
   c17nh/NaK5Lj4lx8vyXFB/2pCMtywo4lL+BhDsAL81zMlvIE0Yq3hp46v
   YHY+0tESS3VslzxaBVdVaVVh80NX1n3DsCFyCsc+3eQuFOWEkVzU1erKb
   H5LfXQhXfN9DnMvjP6KpzLzHMF/l55JHgfoxMA14iJe4TkVmqQuz9nvCM
   A==;
X-CSE-ConnectionGUID: HktIpVJmQbiFSsHr5Jn3CA==
X-CSE-MsgGUID: Sy+r5k/3RH+m0h8/MOqcXg==
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="259326505"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2024 20:25:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Jun 2024 20:24:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 24 Jun 2024 20:24:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leq2INLbh45Ddstu+rn2D+AK0Mg7RXSEEzJ003+Y8ujl7ODPR6To33xfXFuZ6j4dd+nsH1XmOdYvfHx/RgO5ENkPrxKaF4bf3Jg1IoobuBmmfkfyX+8tP7GhaWbhdTz8WbNs+zRl0m1gQ5hyJrdXF2DWyfng0C/Y2wZzXzbntZuNqI9pTfz1znanVyfDVWAIo1+SEVZ223dRSvEJ7wp4EWmpA7zRt6yK/JJr1BuU2nlow5iYMiYG6SXgR7ClizjAlsw9NrwDU8imIqZ6tA5rku5bsNqZT5g8Qa/KGqGxGa9gvUfnjfPF27tTbzesUnNAFtW8Zf6daxYVlzLzVhg2HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ke6zrvYMqb0S4t+w3smr5xyNXoQFTB8/570rC/I6qUk=;
 b=WzAncNUvVDJJwU8oGw9uxqpt1eeqKFQ3zW7g0C+u/KAwaTN7Vggqr6xv5C0vs0t0eaWPB6AAAWC+08I490muwYrsVq8+P7JNEND16kg+L48VIyCh4OneKnpiCpKJ5dfiPb3ZvaGYe7iOeglcSK76WbuMNi8jF10JN6Celgkms8C9UmQV5d0xVdhgdOZ36KrwipbxXvuMREPWvJVsjm6tOD0RWpEhkgGKBKHDyrz+8hvG7LXuFFens4nxZ1SMcFvGJzUF0YfUfZi6eKJPPk0vU9WXONBuPbQqTKEpCw7L7zsClHfBlpTvjixQMWdvRURs7u+SxWNuGISwvNwpCT7cOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ke6zrvYMqb0S4t+w3smr5xyNXoQFTB8/570rC/I6qUk=;
 b=YZsfpr38YFTx1xBb/D3n464JXxDN/CoRcDuXJ/HFk0ID/raswQwXXSLRJO1Vt7dbur7cUzhAN8xIP/ElbppfCPSw+v+Vv6BCL334NSHLibsHe01SIJIQQFw7yMUtyPBIPCJ0Sx2eWMdKmTaedjeyqvmhgP5RC4FzZSSRjV04JxRwBukVVz7PsGmXswLgCZdISclsEE9MagVMoWCsCc5r1UiE70zz6VdG35udA3Wb5UrlUVEC7yI8kNp0x7SzHBadgM9Vn5SoAsT/UTkRCm5utUJHj8gYnebzKh0H9Qmo3NLx4EB2Y5VDVm817x2/RTyuAnoTg2OL7FPcgh/rXK45MQ==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by CH3PR11MB8186.namprd11.prod.outlook.com (2603:10b6:610:15a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Tue, 25 Jun
 2024 03:24:28 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 03:24:28 +0000
From: <Manikandan.M@microchip.com>
To: <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <Balakrishnan.S@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <Durai.ManickamKR@microchip.com>,
	<conor+dt@kernel.org>, <Balamanikandan.Gunasundar@microchip.com>,
	<Hari.PrasathGE@microchip.com>, <brgl@bgdev.pl>, <linus.walleij@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <arnd@arndb.de>,
	<alexandre.belloni@bootlin.com>, <linux-gpio@vger.kernel.org>,
	<Nicolas.Ferre@microchip.com>, <Varshini.Rajendran@microchip.com>,
	<Charan.Pedumuru@microchip.com>, <Nayabbasha.Sayed@microchip.com>,
	<krzk+dt@kernel.org>, <Dharma.B@microchip.com>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/5] dt-bindings: gpio: convert Atmel GPIO to json-schema
Thread-Topic: [PATCH 4/5] dt-bindings: gpio: convert Atmel GPIO to json-schema
Thread-Index: AQHaxh4ahtr6jTH5jk608x62f/zCsLHWxeoAgAEMN4A=
Date: Tue, 25 Jun 2024 03:24:28 +0000
Message-ID: <910382a4-bc65-42cd-993c-68853707e63a@microchip.com>
References: <20240624100431.191172-1-manikandan.m@microchip.com>
 <20240624100431.191172-5-manikandan.m@microchip.com>
 <171922826608.2823095.16579055566825356768.robh@kernel.org>
In-Reply-To: <171922826608.2823095.16579055566825356768.robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|CH3PR11MB8186:EE_
x-ms-office365-filtering-correlation-id: 01d1a3ee-d3cd-4b61-e3b8-08dc94c6523d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|7416011|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?aXZMYkQyS3k4blI1TmQyNW8vdU1kWnNzMjU1ekVrUGtVVm5tSHFScVMrSDUx?=
 =?utf-8?B?ckZ4MUtleExIaTZhY0NGMmc2ODVvWjNOdkxOWHQxM1ZOOWQwQ1pTRzA4aGxX?=
 =?utf-8?B?SzZZeFlObTNabDRsSm9MZkI1TzdhWXZKWUR0aEJRekhoNDFjcEdaVVJhYU9E?=
 =?utf-8?B?NTMrOW8xOU81eWVIVTlnazlFQkZrV3Q2bW95VVpZaVhPVW5HNHF4amw3Mk1S?=
 =?utf-8?B?emIxb3R5MUtQTDBZeGZrelJ0cktYYWVRRjFsVDNndzVDWVBOSWozaXlDWWpP?=
 =?utf-8?B?emIyNXlBbGp5eDZTd0VoM0tXTmtXTlRDUkp2N2twbWFFMVk3dGhPWGxpb3Yz?=
 =?utf-8?B?TG4wc0xkOGMyRE9tY3hORG02andQVWYzMnBrYXRlZUxOakJjaUI5Q0pocGM1?=
 =?utf-8?B?SzErUFBjVzA5NVliblYxRUlXbGxIMkZ1YjZmOWRJVUdSOFdWUzh2Q1daL2xJ?=
 =?utf-8?B?d09QcTB5UWU4M1c3VU4yME9aVnJaWnpMa24rV01mRUhrV2QxZmJheGpTNGJx?=
 =?utf-8?B?eFRnUGxvMnJYU2VDakpPTzlwYjJpZlV3NE1aVVYrMGNib1ZIaVlROHRBZ2tZ?=
 =?utf-8?B?WFVhWUNaenBhaEtVaFhSTE96ZnhkaUc5aUhyVXI4ZG51RnJlRFVnS2tnWmxz?=
 =?utf-8?B?Szl6VUVtbVcxSFRGK1N2Ni96VDFIWDRiNE5Cb3NRdzNTdkFzOVhVdGp6Umxm?=
 =?utf-8?B?bzhvZEsvTWtrbTZEbE5UajBzTHhOVjJVVG5SZkJiVUpWY1lhUmw3bTRyMDRs?=
 =?utf-8?B?OEIzdUJkak93NGxYRVBjVlFMOWp3NkcxWkwzdDdSVHR5VXRnTXlzckVaZlZn?=
 =?utf-8?B?b2RZMzlIR2doZkhibTBRUkZaKzRtbkJuZmxNaUk4Z09aTnNhaXdmbjFsR01G?=
 =?utf-8?B?MVlNRmRBYmdNZWlJU2VaSkZQS2QxTUw2ZXFEOGovTmo5NjVxUmY0Z00zUVRI?=
 =?utf-8?B?cFNuUTQxM0V5bWhlK2FPbE5HTERjbTFpS2IwT0k3ckkvaXh5SDJyb0JHRDha?=
 =?utf-8?B?TjRSV0NSbFVpRklZOWNEbDYwbHBZTGs0b0t4eGgyWmsramIvODVnVXd0Sk5R?=
 =?utf-8?B?N29DU2ZBVm1pcnc1MlZMM2dReHU2NFJiMFJJWG9MUFJFdFhoeGYvMERJeHlu?=
 =?utf-8?B?Sm9MbnB2RklZYmJWSkFWNTNBcDhhaE14T3pJNGgwaGVQY3J1aUFUcExYYko4?=
 =?utf-8?B?T3RzdzVEK2xLS0lpOU5UK29WMVhkTTJTbmlaa3BQUEYrYm1QWHdGZmtlNVdz?=
 =?utf-8?B?cVl4cnpUYzFhUkMybkZvZEJ4REkyUGtyOWJ3Wnp5Yk5SUzFnVm5nYSttZEx2?=
 =?utf-8?B?NjRNQkxoMVlNTnZ0dEQ1Sk1hdEdXSFExbkFkRzF4Y1VVUWZqS2ZWQW92Ui9O?=
 =?utf-8?B?ZFFzS3RpbXlWRU5wSUpwNHZVc0s1cE9xRTJwdE5UZW9ibisxdWV3QThhRGY3?=
 =?utf-8?B?M2NxTk43VkNkM0JEclJkSVUrU3BwUE5idUJrVTBhZHkzSU53SFFVTXl2Wlda?=
 =?utf-8?B?OFNmQ2tCK2JwQW4wOEcvdWk0SzNVNGUveGhWbXpQakVJbzNILzNBZHc5NFpi?=
 =?utf-8?B?cWZyWnllYUVIankwa0JSZm15Qm5qL0RtR0xsQWU1cjQ3dkFqMC9ZcHBIN2hu?=
 =?utf-8?B?S1dYUWRVWXVvVGE5Wjd0UkFrVzU3aXBJZ2U4VTRuUWY2TmNuSE1peExUOWZZ?=
 =?utf-8?B?MUlWMDhVWThqT3NGWUFiVklNTjhmc0FaODh3WlNUVHBCTERkL0xsM01lSEpX?=
 =?utf-8?B?elkrUTljeDFzK2tLTTdlUGRpaWx4N1kyaFFza2FJZnhsekk5Y1pRK0svS1Bw?=
 =?utf-8?Q?QnvpSZEmCzyt+zFsAt6txc0JYhrJVOQaofYLY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6609.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(7416011)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUhvUms3cVFNZ0Zsc083NzhQNno0RXJuWTJPNDZFVmlHNE9YQ0J4N3BTcXlY?=
 =?utf-8?B?bUtTck1vRmtyNEI1Qk9Menp4SVREK0ZKMEMvWXJwT2ovMUIwZlVDZ3k3NnZl?=
 =?utf-8?B?Z3lWTnNtZTRrdUduR3RMZVFzV2xrY2FaWmgzYWEvWGNIcGdJWFlnTkRFeHZO?=
 =?utf-8?B?M3RwNFVaMm40N09pd1lqaFlZcnN5RG5yRE5FT1BYYlNlc1dmREV5UmtyMUFR?=
 =?utf-8?B?aVZucHQ4QmNZZ3MzdEFaS2xjNHI0R01ab0lhL0lNZlFjSE1oUlJZQXFNYy9v?=
 =?utf-8?B?cFJXQ09hUXZXaCt1Rjd5NHVuQjdYb0Z5UXZWMEpCdmsycnBUSjFpd3R6bEYy?=
 =?utf-8?B?SDlSVXFrSFBiLzI2MzBjUUZvQWNOSGlwazEzemxOUVNkY1lLRlhVV2w3THZU?=
 =?utf-8?B?Z2ErS0dFSTVaMUo1OUNJT1hkc3Nac2ozcGxpNC8weitQMWVVMWNycUxaN1Q5?=
 =?utf-8?B?Nmt2SkE4WU9PVzVyNlJCWldVcEtTdHJ1c0dEWlora29DTFptUDVXZis1NHZE?=
 =?utf-8?B?WXcvcThpamNOakpCMGcxN29lRmRKcDBEbW43TGlYSkY3LzJJUjRJU2ZzQVN1?=
 =?utf-8?B?NnZYTzRlUXNzcDVNMGgvL0t0aTBWOHFMZi9RTmgrY2luQUVhRjM2c3BHSjV4?=
 =?utf-8?B?ZnNHZTgzWENlYmFvTnZWQmcxbFY4ckJ1Zitla0JSeGt4dGNNUWxzTWxoVngz?=
 =?utf-8?B?b3VUcm1HaWdQakE0ejg0ZllzVjA1TFpKMVVjeEpVbDYzUUNKd3ptcXZHcHRn?=
 =?utf-8?B?UE5saU0wbTZNK0pWSEF5N21GSlJWYysrZE9pNi9PSEZYdE5YeHVjaUhGK2x1?=
 =?utf-8?B?NHJuWFp2OUtNWnZMbm9lUHc3RGxyc2NJV2ZFWkpaVmg1YUF4Sk5SbGNlc0w0?=
 =?utf-8?B?SFBRTXpnV1phZzlsZURXeXhwRHhxVnN5cVJjVEhWR1o5UkNwT0YxdWxDbHpt?=
 =?utf-8?B?M2xNenpQVmJMWUtSYlFWMDVobkozWVhJVWUxQkpUZWt5NFJKbTd1S1BhUGdm?=
 =?utf-8?B?N1BienVlOGJRVWVNUzF3S2VwMFdNakRFTFlNc1BqRVVHcTNuM0g4dWF6eUJG?=
 =?utf-8?B?MWFXZ1EyQUtWOVNpUHJmaXRONzRKbnBLM3lqK2wyTUxFUmQwbW5yd3hzeENZ?=
 =?utf-8?B?Kytlb0ZPYUlsVEhvampjUVBwUXJMQTdwM2xaMFNOM1ZvUTZDUDRXNmV3NHpK?=
 =?utf-8?B?TUQrcitDQUs1aHFmdGNWQUczcEdYc25vRzdZeS9YSkx6UytPQ2tUK3B3Wm55?=
 =?utf-8?B?UXR6bGl4aEFqOHA5dXJYV0xzUm1ZeUkyR2Ewc0xzZ1JGZ1krcmROUEp1WC9o?=
 =?utf-8?B?RTRaZVVkeUFKcGhYdVhhTy9sN2JQTG9iT2tvRnJNb3FBNXJKSXNJbS9uSXNy?=
 =?utf-8?B?WVVzN2Y5NXNBS0ZzZy9abFpnRWZPVkRraWJlOVREdE1tQXd2aU1sTzQvVUxw?=
 =?utf-8?B?QU8yU2czOWN2QUF3aEdHMzdlZkxVMUExRFgvMnNuZDJWbjgwcW1POVh6bW40?=
 =?utf-8?B?OVRFL3psYytPVzRHeDk3REZuN0IyVGtqUW5WSi9XZFlTNzZHQms2MVMzaFRW?=
 =?utf-8?B?anJTQU44NXVLTGNabGp3LzU5ZUZUN2s3N1NMNURZZVZvTWRVd2VYc3IzSXJi?=
 =?utf-8?B?dXpodkIzbUN6MVl5T2xaNUdyN0FSeWVKWWFxanh1c3AxQnd3dVBsWkNpaE5B?=
 =?utf-8?B?bzZkNk10MngwamVQWlNpNXhHdVZ0MjNoaDZ1WW9vQjk4dEd3enZuNmhGVXlR?=
 =?utf-8?B?cnVCTDI1V2JoVURxdUF5TENKY0djNVN5UENybmo5YldsRzBMVzZEQlRzbFAx?=
 =?utf-8?B?Y3pmaUVCVmVjNlV4dk9hZFIxTU5wVjU2dGpvajByaVdla0hqNzUwam45NnJR?=
 =?utf-8?B?VmV4SU5RTjhoVUkydkhyRmo1azBsTkJ4VEtxYlpyaXFodlNnZTR3Y2NHOE13?=
 =?utf-8?B?L2F6R3RFcTFlaG9RNG81ejBiZENxdmZKdlQ1cmhtRTMyaDVaYnNMMzlPdzVD?=
 =?utf-8?B?SDRXRElmeVN5eTdvNy9yTjM1eVRYMkpxUjUvZnhaZjB0elF1NXcxdTRaUndV?=
 =?utf-8?B?M1plL3B2YXRCcmZJbWlFWiswdGxKTzNDTHBLVWk0ZE5GRXZvYitRRnRSVFpN?=
 =?utf-8?Q?LOYWq/CybJWnT+wecPxuc/454?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <734F51723515E543898B7D7B0E169226@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d1a3ee-d3cd-4b61-e3b8-08dc94c6523d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 03:24:28.3594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dTwwoGnX2Yf55x9HZ/q+ubeGjc3eSFqB3E0aiW5s6syqD0VW3ppXtcXuaWasmayeLgzznU6tddYckC6h2VZAWLlDanJGUQHUC7R9q4+JwQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8186

SGkgUm9iLA0KDQpUaGFuayB5b3UuDQpJIGdldCB0aGVzZSBlcnJvcnMgYWZ0ZXIgdXBncmFkaW5n
IHRoZSBkdC1zY2hlbWEuSSB3aWxsIGZpeCB0aGVtIGFuZCANCnJlLXN1Ym1pdCB0aGUgcGF0Y2hl
cy4NCg0KT24gMjQvMDYvMjQgNDo1NCBwbSwgUm9iIEhlcnJpbmcgKEFybSkgd3JvdGU6DQo+IEVY
VEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxl
c3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gTW9uLCAyNCBKdW4gMjAy
NCAxNTozNDozMCArMDUzMCwgTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gd3JvdGU6DQo+PiBDb252
ZXJ0IHRoZSBBdG1lbCBHUElPIGNvbnRyb2xsZXIgYmluZGluZyBkb2N1bWVudCB0byBEVCBzY2hl
bWEgZm9ybWF0DQo+PiB1c2luZyBqc29uLXNjaGVtYS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBN
YW5pa2FuZGFuIE11cmFsaWRoYXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+DQo+PiAt
LS0NCj4+ICAgLi4uL2JpbmRpbmdzL2dwaW8vYXRtZWwsYXQ5MXJtOTIwMC1ncGlvLnlhbWwgIHwg
NzggKysrKysrKysrKysrKysrKysrKw0KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlv
L2dwaW9fYXRtZWwudHh0ICAgfCAzMSAtLS0tLS0tLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDc4
IGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vYXRtZWwsYXQ5MXJtOTIwMC1n
cGlvLnlhbWwNCj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9ncGlvL2dwaW9fYXRtZWwudHh0DQo+Pg0KPiANCj4gTXkgYm90IGZvdW5kIGVy
cm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6DQo+IA0K
PiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6DQo+IA0KPiBkdHNjaGVtYS9kdGMgd2FybmluZ3Mv
ZXJyb3JzOg0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2F0bWVsLGF0OTFybTkyMDAtZ3Bpby5leGFt
cGxlLmR0YjogZ3Bpb0BmZmZmZjQwMDogY29tcGF0aWJsZTogJ29uZU9mJyBjb25kaXRpb25hbCBm
YWlsZWQsIG9uZSBtdXN0IGJlIGZpeGVkOg0KPiAgICAgICAgICBbJ2F0bWVsLGF0OTFybTkyMDAt
Z3BpbyddIGlzIHRvbyBzaG9ydA0KPiAgICAgICAgICAnYXRtZWwsYXQ5MXJtOTIwMC1ncGlvJyBp
cyBub3Qgb25lIG9mIFsnYXRtZWwsYXQ5MXNhbTl4NS1ncGlvJywgJ21pY3JvY2hpcCxzYW05eDYw
LWdwaW8nXQ0KPiAgICAgICAgICAnYXRtZWwsYXQ5MXJtOTIwMC1ncGlvJyBpcyBub3Qgb25lIG9m
IFsnbWljcm9jaGlwLHNhbTl4Ny1ncGlvJ10NCj4gICAgICAgICAgZnJvbSBzY2hlbWEgJGlkOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9ncGlvL2F0bWVsLGF0OTFybTkyMDAtZ3Bpby55
YW1sIw0KPiANCj4gZG9jIHJlZmVyZW5jZSBlcnJvcnMgKG1ha2UgcmVmY2hlY2tkb2NzKToNCj4g
DQo+IFNlZSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvZGV2aWNldHJlZS1i
aW5kaW5ncy9wYXRjaC8yMDI0MDYyNDEwMDQzMS4xOTExNzItNS1tYW5pa2FuZGFuLm1AbWljcm9j
aGlwLmNvbQ0KPiANCj4gVGhlIGJhc2UgZm9yIHRoZSBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBs
YXRlc3QgcmMxLiBBIGRpZmZlcmVudCBkZXBlbmRlbmN5DQo+IHNob3VsZCBiZSBub3RlZCBpbiAq
dGhpcyogcGF0Y2guDQo+IA0KPiBJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmluZGluZ19j
aGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlDQo+IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3Vy
ZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwIHRvDQo+IGRhdGU6
DQo+IA0KPiBwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlDQo+IA0KPiBQbGVhc2UgY2hl
Y2sgYW5kIHJlLXN1Ym1pdCBhZnRlciBydW5uaW5nIHRoZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxm
LiBOb3RlDQo+IHRoYXQgRFRfU0NIRU1BX0ZJTEVTIGNhbiBiZSBzZXQgdG8geW91ciBzY2hlbWEg
ZmlsZSB0byBzcGVlZCB1cCBjaGVja2luZw0KPiB5b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQgbXVz
dCBiZSB1bnNldCB0byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlvdXIgc2NoZW1hLg0KPiANCg0K
LS0gDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoNCg==

