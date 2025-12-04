Return-Path: <linux-gpio+bounces-29242-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F224CA3022
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 10:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 281373012DE6
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 09:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F25D334C27;
	Thu,  4 Dec 2025 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kK2hzbPK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011050.outbound.protection.outlook.com [40.107.74.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0E21917FB;
	Thu,  4 Dec 2025 09:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764840646; cv=fail; b=QpVyznaiib1g5MSTs/KaYDTGPecYwUcG0HF4uIj6nHPNgc7H9vL7CmmqDxeRXgf0LfIVHdVmZJjy+emuOCe95Ca6zw1gEOaEotpcIOTmNcccGIaLWH1i23COkEPRfJ93gDKqhkUfH+0QwWCkaOfKWH1mhPpaO6mtlH56NID8+UY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764840646; c=relaxed/simple;
	bh=BNcZ3s/jZg3pgsW60DVY7YYzPvy892RsnAbCyYJ9UBM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sPEQxyY8eDdFI1AeGaYMk6bv3h0E05SyT/v0ZJNHFUZQOevQqgH4HGeTfpHbQ1Q56ovRWZiWu+291SodJRb/sSg49mnZ1iF3SgUTqYwWhWVhbkZF2mY92VMQjyR9ZkQdnB2vd3pHOqRBQsMn6J3YctMl0HkcDKhxUoVlHA5VUzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kK2hzbPK; arc=fail smtp.client-ip=40.107.74.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUy/bCXmw0/vFu30TbUg1BRJMz00MgfC+F5IgSnssGLwXpCRZmu6ZzjtTlbaYk1JJ02lQDewMEvDMF5EJiuSUAHtuWKmEMTmWlBpQxhwl1lMtDFmvv1R+jltvD6u8deDyMIzMc3p7agwqbg+Y1Om/5QjyIdZQ/xT7AIEwORFZQXzbeU5msGF7iik3e2KRWair4phKX6rua7LKF0+ThtV7cRKW4XVBzPqPsbs2/jXso8aI243HAdIBlDe/Z65nw+D23Q8mcRUooWJdaInPE3DlrNYNG5Z+94lDKv0er4Bw1xFQ3YKF3xWyyIzwLKrNF+bf3EdshlqHXQcBwwbM0TTZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNcZ3s/jZg3pgsW60DVY7YYzPvy892RsnAbCyYJ9UBM=;
 b=wg5yALDENSKFvO0Z5ZJ/UD7NnduVQYJPfqi7Cc/PkM5LDZHMTFu3E1LaAo3vz69AiTaUU/i9Myn+Rd7i3YvR76tX0JDIEWY51oAEqeNPb6P/hNtsnrHDLeroVuuIQT+AnqOkZCO23o/q6ftS8DFar3e0KEAAr7J6rjzDUfcVWiKxVcfdhSCfCvIp6VIY6PutkX42SQ4LoptK2dfhY+T12FZEUlM+Qoy9Cu3iLAcMhlvE25VVihWdAM7ihnZ6m2TeZ6AzO5IFGC5CujuxWS8Q3FNKapt+meLtbgzNIW/gS5UlNtEowg5h+y4vmnETE/wsVCpqJxjPsEwpPbq14uryfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNcZ3s/jZg3pgsW60DVY7YYzPvy892RsnAbCyYJ9UBM=;
 b=kK2hzbPKw1PQv3T1jRdPpCJHl+ljDKPD7Y348owzaqhuVa1STXoNUSTxRvly+YyDsb4WtC1S1J0wRB9tWxsdJLgT1TIjnIgtlrU+TNAmqPsvSIjCTON5D8hkJkkdoBiuU6543o+NB0E+PkEWtqUp1nO6+p6F3duiDvCdWFTMzB0=
Received: from TYYPR01MB13955.jpnprd01.prod.outlook.com (2603:1096:405:1a6::6)
 by OS3PR01MB8842.jpnprd01.prod.outlook.com (2603:1096:604:17f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 09:30:38 +0000
Received: from TYYPR01MB13955.jpnprd01.prod.outlook.com
 ([fe80::52be:7d7a:35ec:4b29]) by TYYPR01MB13955.jpnprd01.prod.outlook.com
 ([fe80::52be:7d7a:35ec:4b29%7]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 09:30:38 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij
	<linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/8] dt-bindings: pinctrl: renesas,r9a09g077-pinctrl:
 Document GPIO IRQ
Thread-Topic: [PATCH 3/8] dt-bindings: pinctrl: renesas,r9a09g077-pinctrl:
 Document GPIO IRQ
Thread-Index: AQHcWtnUxdioYA77oEOcpPc+HgdeCLUPoQKAgAGeHpA=
Date: Thu, 4 Dec 2025 09:30:38 +0000
Message-ID:
 <TYYPR01MB1395515F6CBA3E3FBBAA4297085A6A@TYYPR01MB13955.jpnprd01.prod.outlook.com>
References: <20251121112626.1395565-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251121112626.1395565-4-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251203-furry-amigurumi-ocelot-dda208@quoll>
In-Reply-To: <20251203-furry-amigurumi-ocelot-dda208@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB13955:EE_|OS3PR01MB8842:EE_
x-ms-office365-filtering-correlation-id: 6e13bdd5-2aa0-4a7a-40ad-08de3317c931
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SHJkdGYySlhuOUZwSTIzYkRZSktLcnBYUVVtYXJSQ05lc2tacVhhemg5dTR1?=
 =?utf-8?B?OE5OTTdHZmpnanorTzIwa0hqMzltS2puOFpXZDFGTWthLzVOanY5Zm5yVGNF?=
 =?utf-8?B?QmJJSWFMNm0wbTZIekFud0JYTDBRSGJ3WWNHcEpNQ1FseFVpb3ZISEMzbXhF?=
 =?utf-8?B?OWtiTzFWRmJIQmVMVXA5NENsa2w4OS9sOCsrRTg5OG1QY1lYR21OR0ppUXpu?=
 =?utf-8?B?TTZYcFJIUWtxdUJ5a0tSdlRIcDFBemhRQ3B3TTg5WDQ2ZVJ2VTJxNWVhKzdH?=
 =?utf-8?B?YnhYeEtNSkRER0dKUHlRUHVOcmJ0RGF1ekNjOURBbHN5MWd1K2dackh1bVAx?=
 =?utf-8?B?SUphNkZjNlNVVTlqUEFvMzc0R21VcEYzbWRhWENsY3UrekdwclhvK0E3bzd6?=
 =?utf-8?B?d2ZtZmZzaExFVEc2OWVqMFY5VytYbDNsb3pvRG5sYjhLTWtnLzJna3dlK0xV?=
 =?utf-8?B?eWtFSXlRTmdCTmIxcEJDNjY2TXE2NmVDcE5EN1pQWDhqWnQ3clBGajZyUEQr?=
 =?utf-8?B?cWg3M2xwTE8yU052S0c0S1lLNnRmSjlqYnBWUHJGRURON3duaXVEd01LcURq?=
 =?utf-8?B?bHEvcDkyNkViU012REZGQXhzYnhmV1FzSTNzNHRsL1NYSGx3SUZvRzVkVjcz?=
 =?utf-8?B?VHhQTzVxV2NzRkh1TXRFRm83Qnl2R0JXQ3BVQjRIQWJPK0R0aHRpQ1hDWjR0?=
 =?utf-8?B?V1BrdnZDMjAxZmZuVGJKWmFQWXBtM1FBNkk4bWh2OFB4cm5JaXBsZUczVUpU?=
 =?utf-8?B?YXYvS1VwZHp5Tmp4Wk1yUDNBMzd1aGdxdTNpR3UvZmQxdnFiYzNWYTZjeUpY?=
 =?utf-8?B?VlErelQ0QlVZNFZGalBGYnJvMjRHaTRuMzJZYXE2T3JnWUlWYmN2TVlsRXVN?=
 =?utf-8?B?WXZxbGk2R2VNSmlUL3M3NjBBTUF4cFJaWWVxT21hc1ZvUDcrRmoyYnNDS2Nn?=
 =?utf-8?B?NGg5SWJKS1hHWUlXQmpKY0d6VTB2eVRDRGtCeWxHWkV6dkFXWCtTa2I1MjRj?=
 =?utf-8?B?TUU0UHhXUEc2TVJ2MVk4QkZ3Q1BTWi9ySDlRNHBjSWw2enpxTlBsQ0Y5RUs1?=
 =?utf-8?B?cldIWXF6OGFrRzR0VHJKVWZzUmRseTlmWUczMmhNQXY5OFhHbHJtZ1pSNWhm?=
 =?utf-8?B?blVVODRyREtEWVowaGJRZVBLaTlHTUljZ2lySUpEYWcvNmVKekNneVVzei9J?=
 =?utf-8?B?dmliRGNKU2hvR0hWT05FR3pZd1VwWURFQXo3aVo0Q051czYyV29SOXN3US9M?=
 =?utf-8?B?YjN0THFNRG15SFBkUTlqUExLZjQ0Y3pOL2k3VkNuc1plOGtHSzJwelAycmlP?=
 =?utf-8?B?RzFNQllsSXc5b3grUDhIUGwvYTdQc05yWkJOUk5Tdmd4ZWVVaU5NcUxSdUtv?=
 =?utf-8?B?eTBFSWt1Tmh3Q2RGdWNNRmFTTmNWaDR3REo3NWJ2eEgzVTVCUGtkbnRIYlBU?=
 =?utf-8?B?UkFtYmdnTjNWWDkxZSs4b3ZEaXNxMU92OXdnc0tlRDg1dWdUZm5ZRTlPaWY0?=
 =?utf-8?B?cTJDMDBjN253a0FqNHMxanVKMHRiNnlWeEJrUlg5K0lRNFNPQXYrVElHN25p?=
 =?utf-8?B?dWhRU0lJMXE5UkJLUG1UWVFLUHNib1k2R2FJc0c3cmE2VjdSVTVlc2lubHUz?=
 =?utf-8?B?cm53MEdsSUYrUytpWktZOHVaZUtIY29WcUtXRDlQd3hLYlVWQloyZjlTZ1lC?=
 =?utf-8?B?SElkVFZDYVBoM2FzU2VlRFJJNFU1amxPYjlZMG1PN1NRUm0ydkVFM25penhw?=
 =?utf-8?B?bC8zWWw3SEtlTWpsL2ZFSlJvaSttaEE3aUs1bzhseldNTmdsb3RueEtyK2pX?=
 =?utf-8?B?QTUrMTdGbVpXZmNGS1g0VVVKM2gwZUtRSXQvSnFXSnhzM2Nqc1RxZ01hZ1pq?=
 =?utf-8?B?M3lFTThheFQ2TjBNeFpYcEIrd21helVlZmkyZnBaOHJjcUZrMXhrRlY4VHdW?=
 =?utf-8?B?R2JJZ3RGRlJ3bkZkaEdKVnRheGRLc0JRQlI5bUFCK2s3d21kSWE5ZVk2VjFh?=
 =?utf-8?B?NG84TVl3SUttaG4vaWl0R0pIRjRIbjZjRzdZbURwRk5sbm9DUGJNNitWREhv?=
 =?utf-8?Q?oDHJD2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13955.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b3l5MFoxS1BoRXd6UnFFMXFVQU9yMTcrY0dGRndQbjZ3Qk9FVStoZE1uQlM5?=
 =?utf-8?B?eFQwQVNGcnFaR1F0NTNTVFpZWXpWYXdiWFd3TEJPU2JpZ1hJREFDVzdLaTMw?=
 =?utf-8?B?QTdtTnlxTzhkSDF1RXB1RmNuUCs5TmxsRng5S2tIb2FWcEMyTnFNZ0xraDNs?=
 =?utf-8?B?YlZ5U0VPeHMxWWJHT25UMUpWcEZaUmRFYkFpaDlZOExxRnErSUhKSW9uNXBU?=
 =?utf-8?B?c3l4TC9XWlppQjFvZHZhMjlUT2ZtRXJEd3l6UEd6VXl0Q1VVOWNQcjQwNzNJ?=
 =?utf-8?B?S1JadmM2QTJoVk5nR3d3K3o0L1IraGhSb01pNFo2OEg1UWJLenJGMi91cldq?=
 =?utf-8?B?VVV4alkrOU1mOERjUk9NMXFpWHZEczlUeE93N014eXhybU5NdEhCZXJxdWZC?=
 =?utf-8?B?R1hOQXZRanpqcm1uNlJxZ01wdEUzaVBlb05LWjhIckw0UVR1TGpHUlppT0xm?=
 =?utf-8?B?aVNaSXBmcUpjNEZWb0FPOGNDNE41T0tNSWEyWERIeXhiR3ZTQjkxTEhJT0sw?=
 =?utf-8?B?cyt4clhHN3dtR2hkdHgyTzIwNzRneEI0M3FrSWQrd2hNU2JUemNXaUYyVlpo?=
 =?utf-8?B?ZTV2SjkzNlMrRE8rUUN0VnhMaC81RW1TSktlcCtGZlBhZlF2VTJJNFhZY2pi?=
 =?utf-8?B?U0FydGpySnJEQnVSWllZVWd0NXRFSlpYcFlNRitiaHpsZG15MTBhQWVNWGlP?=
 =?utf-8?B?WHA1VUEycnBGYnVtTHkwbkd4VWdrdER3dHQ3ZU96cTgxMEI3NlFpMzM2d2pY?=
 =?utf-8?B?eTlYdVVoYjk3eE12L0NnejZraFJja3A3THE3cDV3YkhzT3BTZks0SVR1WnVF?=
 =?utf-8?B?eTFNZ011UHNSNDVWTWtOelUwTG9iOWRBZG1hZVdnaWhNZldGcEYxVzg2ZTFJ?=
 =?utf-8?B?dFUzUnFseExpNlI0WFh0dm8wYWlNZy96QnoxTmx2S3AvYnZQbmZSbUg0TGxI?=
 =?utf-8?B?U2E5M0FIZHlFRDZEVmRBeUFtK3crTXNFMWx4UTh4NlJ3Qzd6TmlSeXk3c2hZ?=
 =?utf-8?B?VlBlRC9oc0dCRzhJaE1jUjJLcFFTT0ZYZzNVWlJZVkVUMGM2MnF4NUZZTmJa?=
 =?utf-8?B?YkUwNjJKeGtMWHB3eHVmR29aTkl2UFJBcElNMU16S0VzeVpGd0ROckdQUTV1?=
 =?utf-8?B?aFlwNExsR21xZzJBR25wOWVXMWd2ZFBwYkJoL1BnTDhyYTNQdnBZZjdFNSs1?=
 =?utf-8?B?M3lnS3dWejhObmZSK084N3JWS3M5QUREMm9INERNc0RuRVFKemUwcDViQ2c2?=
 =?utf-8?B?QWRiR2kyRGtmNnpEaFhQSEEwVHFSK1NOdVpDUUgxR0FWcGNJc20xdWZuVHUw?=
 =?utf-8?B?SVZoaW5TcGxJTS90SXExTU1wem0yVmRKcUdEQjJySm5mUmRlb3BoY3JYRXYx?=
 =?utf-8?B?b3NTT1JPZUJZYXpLdEFpdFdJNmFOdFRoMndHRUxWeHlUNGZURUdNbjZKZm9u?=
 =?utf-8?B?T3Y2VXRRcTdoS1hkdnFwRUV4dzJHKzBxT2RCcUpIMHYrV3FvU08rTmViekda?=
 =?utf-8?B?Y3B4dzRxTmxub0lLNHZtYWwzZzFMa1VRYWhhTlgrZUMrekQxY09HZHBIYWc2?=
 =?utf-8?B?WFpFWDlOK3JlR0djK2M2eDhYT0svNXRNMlg5a25abVBnbEV3bVJYQVp4U3dI?=
 =?utf-8?B?MTdpTDdYTDYyZmVnODhGRldHTVhYMlUrZytDTjc3MlFzYXBiQ3ZRM0tMSXk4?=
 =?utf-8?B?bms4QTdSRU9ueEVwNVhqaXhHYkc5c3d3REx1alNYM2JTTG9kVUlGR1I1Sk1l?=
 =?utf-8?B?UWlBQ3lpTE1YRndpYStERUh4bzRVMTRpOFdUT2tOYTkzbmFoVmRDa1hkbXh5?=
 =?utf-8?B?WFY4R3l5QUxZc25BWWJlZmtsTWJYYjlya2xzMDRjcUtYcm4wbVBBcnROMG9I?=
 =?utf-8?B?YVRkOHVYbkdhTTJjYXh1RkZ4U2I4Q3lwR0s1OElNYkdjVFdOQmlBOTJKWnRU?=
 =?utf-8?B?SXB2N1VNaDNFZFVjV05WdC94bFN0U3VtTXQ0RDUveklZWGQ1aXY3YmpxbVM3?=
 =?utf-8?B?YktYd3g1ZzA2aU4vaHhTYTlkMXd2NnhhTnd2aDBoSTlRaElmTU4vQlZ6WGRp?=
 =?utf-8?B?ck5laXA3anVaSlZlWWFpTkdtOHpYdmRNUm1COWUyQ1pTcUZQbzZic1RZcWMx?=
 =?utf-8?B?WkRaR3lXL1RBa0hsTE96VU8yWUhKS3E3N0I1ZmM1bW5ET1RqWWpTUXUvbWo4?=
 =?utf-8?Q?894CyD1ZOBYzHdmeLQJaG5g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13955.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e13bdd5-2aa0-4a7a-40ad-08de3317c931
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 09:30:38.5403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6soKoReXu/7xCsr8zR+pzgSpcJTjszuP/3FRb7hpjGz8cCmL4pF5gNIMozsvpe2am5jXwYdcxPsp2sk1KGZ1PL+0XV6N9t/B6rynPbU641R7hCCr2PFhCL2UOhxuGJTO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8842

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMywgMjAyNSAx
MDowNCBBTQ0KPiBUbzogQ29zbWluLUdhYnJpZWwgVGFuaXNsYXYgPGNvc21pbi1nYWJyaWVsLnRh
bmlzbGF2LnhhQHJlbmVzYXMuY29tPg0KPiBDYzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCty
ZW5lc2FzQGdsaWRlci5iZT47IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz47IFJvYg0KPiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkNCj4gPGNvbm9yK2R0QGtlcm5lbC5v
cmc+OyBtYWdudXMuZGFtbSA8bWFnbnVzLmRhbW1AZ21haWwuY29tPjsgUHJhYmhha2FyIE1haGFk
ZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRldi0NCj4gbGFkLnJqQGJwLnJlbmVzYXMuY29tPjsgbGlu
dXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9y
ZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzhdIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBy
ZW5lc2FzLHI5YTA5ZzA3Ny1waW5jdHJsOiBEb2N1bWVudCBHUElPIElSUQ0KPiANCj4gT24gRnJp
LCBOb3YgMjEsIDIwMjUgYXQgMDE6MjY6MjFQTSArMDIwMCwgQ29zbWluIFRhbmlzbGF2IHdyb3Rl
Og0KPiA+IFRoZSBSZW5lc2FzIFJaL1QySCAoUjlBMDlHMDc3KSBhbmQgUmVuZXNhcyBSWi9OMkgg
KFI5QTA5RzA4NykgU29DcyBoYXZlDQo+ID4gSVJRLWNhcGFibGUgcGlucyBoYW5kbGVkIGJ5IHRo
ZSBJQ1UsIHdoaWNoIGZvcndhcmRzIHRoZW0gdG8gdGhlIEdJQy4NCj4gPg0KPiA+IFRoZSBJQ1Ug
c3VwcG9ydHMgMTYgSVJRIGxpbmVzLCB0aGUgcGlucyBtYXAgdG8gdGhlc2UgbGluZXMgYXJiaXRy
YXJpbHksDQo+ID4gYW5kIHRoZSBtYXBwaW5nIGlzIG5vdCBjb25maWd1cmFibGUuDQo+ID4NCj4g
PiBEb2N1bWVudCB0aGUgcmVxdWlyZWQgcHJvcGVydGllcyB0byBoYW5kbGUgR1BJTyBJUlEuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDb3NtaW4gVGFuaXNsYXYgPGNvc21pbi1nYWJyaWVsLnRh
bmlzbGF2LnhhQHJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vcGluY3RybC9yZW5lc2Fz
LHI5YTA5ZzA3Ny1waW5jdHJsLnlhbWwgICAgICAgIHwgMTUgKysrKysrKysrKysrKysrDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVuZXNhcyxyOWEwOWcw
NzctcGluY3RybC55YW1sDQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bp
bmN0cmwvcmVuZXNhcyxyOWEwOWcwNzctcGluY3RybC55YW1sDQo+ID4gaW5kZXggMzZkNjY1OTcx
NDg0Li4xZTE3MWI0NDNkYTEgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVuZXNhcyxyOWEwOWcwNzctcGluY3RybC55YW1sDQo+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVuZXNhcyxy
OWEwOWcwNzctcGluY3RybC55YW1sDQo+ID4gQEAgLTQ5LDYgKzQ5LDE3IEBAIHByb3BlcnRpZXM6
DQo+ID4gICAgZ3Bpby1yYW5nZXM6DQo+ID4gICAgICBtYXhJdGVtczogMQ0KPiA+DQo+ID4gKyAg
aW50ZXJydXB0LWNvbnRyb2xsZXI6IHRydWUNCj4gPiArDQo+ID4gKyAgJyNpbnRlcnJ1cHQtY2Vs
bHMnOg0KPiA+ICsgICAgY29uc3Q6IDINCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAg
ICBUaGUgZmlyc3QgY2VsbCBjb250YWlucyB0aGUgZ2xvYmFsIEdQSU8gcG9ydCBpbmRleCwgY29u
c3RydWN0ZWQgdXNpbmcgdGhlDQo+ID4gKyAgICAgIFJaVDJIX0dQSU8oKSBoZWxwZXIgbWFjcm8g
ZnJvbSA8ZHQtYmluZGluZ3MvcGluY3RybC9yZW5lc2FzLHI5YTA5ZzA3Ny1waW5jdHJsLmg+DQo+
ID4gKyAgICAgIGFuZCB0aGUgc2Vjb25kIGNlbGwgaXMgdXNlZCB0byBzcGVjaWZ5IHRoZSBmbGFn
Lg0KPiA+ICsgICAgICBFLmcuICJpbnRlcnJ1cHRzID0gPFJaVDJIX0dQSU8oOCwgNikgSVJRX1RZ
UEVfRURHRV9GQUxMSU5HPjsiIGlmIFAwOF82IGlzDQo+ID4gKyAgICAgIGJlaW5nIHVzZWQgYXMg
YW4gaW50ZXJydXB0Lg0KPiA+ICsNCj4gPiAgICBjbG9ja3M6DQo+ID4gICAgICBtYXhJdGVtczog
MQ0KPiA+DQo+ID4gQEAgLTExOSw2ICsxMzAsOCBAQCByZXF1aXJlZDoNCj4gPiAgICAtIGdwaW8t
Y29udHJvbGxlcg0KPiA+ICAgIC0gJyNncGlvLWNlbGxzJw0KPiA+ICAgIC0gZ3Bpby1yYW5nZXMN
Cj4gPiArICAtIGludGVycnVwdC1jb250cm9sbGVyDQo+ID4gKyAgLSAnI2ludGVycnVwdC1jZWxs
cycNCj4gDQo+IFRoaXMgaXMgdGVjaG5pY2FsbHkgYW4gQUJJIGJyZWFrIHRodXMgY29tbWl0IG1z
ZyBtdXN0IGV4cGxhaW4gV0hZDQo+IGJyZWFraW5nIEFCSSBpcyBuZWNlc3NhcnkgYW5kIHdoYXQg
aXMgdGhlIGltcGFjdCBvbiB1c2Vycy4NCj4gDQo+IElmIHlvdXIgZHJpdmVyIGtlZXBzIHRoaW5n
cyBiYWNrd2FyZHMgY29tcGF0aWJsZSwgdGhlbiBicmllZmx5IG1lbnRpb24NCj4gaXQgaW4gdGhl
IGNvbW1pdCBtc2cgdGhhdCB5b3UgcmVxdWlyZSBpdCBvbmx5IGZvciBjb21wbGV0ZSBoYXJkd2Fy
ZQ0KPiBwaWN0dXJlLiBPciBmb3Igd2hhdGV2ZXIgb3RoZXIgcmVhc29uLg0KPg0KDQoNCkl0J3Mg
bm90IGV4YWN0bHkgcmVxdWlyZWQgZm9yIHRoZSBwaW5jdHJsIHRvIGJlIGRlZmluZWQgYXMgYW4g
aW50ZXJydXB0DQpjb250cm9sbGVyLCBvbmx5IGlmIHlvdSB1c2UgdGhlIGludGVycnVwdCBmdW5j
dGlvbmFsaXR5IG9mIHRoZSBwaW5zLi4uDQpJIGNhbiByZW1vdmUgdGhlbSBmcm9tIHJlcXVpcmVk
LCB0aGF0IHNob3VsZCBrZWVwIGNvbXBhdGliaWxpdHkuDQoNCldvdWxkIHRoYXQgYmUgZmluZT8N
Cg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=

