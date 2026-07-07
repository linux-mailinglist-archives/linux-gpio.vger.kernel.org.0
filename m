Return-Path: <linux-gpio+bounces-39583-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hpwkCobOTGosqAEAu9opvQ
	(envelope-from <linux-gpio+bounces-39583-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 12:01:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3D871A11A
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 12:01:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=selector1 header.b=gel+msZo;
	dmarc=pass (policy=reject) header.from=microchip.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39583-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39583-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 26580300F259
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 09:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9933AFCE3;
	Tue,  7 Jul 2026 09:58:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010043.outbound.protection.outlook.com [52.101.85.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238AC3939D2;
	Tue,  7 Jul 2026 09:58:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783418306; cv=fail; b=bEHM32PYvjvvkvnAn8zuHOCavKD/h1Jsvz+85h1iC/SiFT2w93xtwT4+uwPVpoabaM1BfUx5s5hw2En5zehaaYHzaMZbNc+wn7B6E/26+M79qz5aeJtD5G81/xxVd4zoyhLHPo99op87Juyb7SrIrQi0xTbcWDOYeV63Eyqof5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783418306; c=relaxed/simple;
	bh=b5GEj3SUxHsSlcqHFl9RHBlMicbShNCssS/7lyLG1r0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HZRdUCvx1ZQG1vm3/MWe0NWCzrVfE0fhmkg+U0DTTPY3wYZ7A6gVYsLPWEPJGXKrRsQa5Usw4xCPWdWWQpJCfy+KTTLNj54yARRdFXf5fkqowGHQluOH1qlFeWseoM34gHO3qMfqXm5WfusrBuzuWr1QIVVF7PSXrAr3+W1qtL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=gel+msZo; arc=fail smtp.client-ip=52.101.85.43
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNAHMpc+dO9MphFjmssvAUOFy+zFwls/pVcsbjZSWq1Z/kX6WaaVmm6dsoegu89AA12rELydzTkQqI44bfJFidm+Wx6mB6jfY7Cwk+fqE9kM2/lBxJF0THazbWE7nTuSN6FIwndFbkUMASRe0sl/Vky++f6aA/6ShAFcq3tck9kixMGs+GRvwYED7rBm3+NaidZKL3daVkdIkwLtVOtovquzeEmQDNeEelnPX/yyoOFHVcB8AIxUHiDHZkAbzH5Gf4DBIQCxGVv0a9JUwlemn4dzV9cabaPAo64qNS5a/49alnJ+Htv+kbeQ7vMaQlOPlC55VbCZXBIzLzA/jAKujA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5GEj3SUxHsSlcqHFl9RHBlMicbShNCssS/7lyLG1r0=;
 b=hEfIKP31TtESEdlPohZweP/bQ+UZQq6gpUhi/b5lS8oOWMO+E17lk3ah+18/2wEzJK7DFwbOmb0gb9tBdZSN94cqhnEp/5MUhnP0VthqpPqWWxFfFsAi9+UdVF8YI5ITJKAR7PA6QL3V5rqhSy4XzjgLWZHCmgbJ9MGHyGIs8R5vb8ekZFg8hliuO66uFEwbSiM/E8Tv+SJw3yGLxG4QuVxYFGU0AnD9eByCJzhTQAVEueaCXi6AiwDnUCRYwFYOjdtkloYr1KBrFICRD9OEy/pGarVUWuXqhvxlfIugSAs4r8eCvpmyI947A+/g0adr1Hd4j0Ik8RTmUPjVL2CKYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5GEj3SUxHsSlcqHFl9RHBlMicbShNCssS/7lyLG1r0=;
 b=gel+msZohiYYE5MuQawCb3HvI0eXDFVRq1XBv9CIsA9spaUyH0B1Xn2Sf93jYb9Ox4jd8UYJOGV42vIkTTYaM1hLu8u6m0vNC1bvuxP0SMyOd60ye/urB90p7OuaRz3sEhftELg6y/SfFfhesFM4uSSPlCxTBjcYdFk9n7E//tWwuBuexJEoxJrB/N2kn5RaiHfyMC94/cEl7D9rNYRezz5VcelLtPGV1k4qW0BJ3JnR1/F/Cwi+J8CoeiP6bwHmrb8BUQg3W/emYMLyCFZ9Qs5j7MW03w/Wyl6jc/elWMI8Ej3oBN3TG9hJFQ+4anXqBs/fFh8YtF9oP+cCUdKKGA==
Received: from DM8PR11MB5590.namprd11.prod.outlook.com (2603:10b6:8:32::8) by
 PH7PR11MB6499.namprd11.prod.outlook.com (2603:10b6:510:1f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 09:58:20 +0000
Received: from DM8PR11MB5590.namprd11.prod.outlook.com
 ([fe80::238d:9dcf:c2c7:75e6]) by DM8PR11MB5590.namprd11.prod.outlook.com
 ([fe80::238d:9dcf:c2c7:75e6%6]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 09:58:20 +0000
From: <Conor.Dooley@microchip.com>
To: <ivo.g.dimitrov.75@gmail.com>, <conor@kernel.org>
CC: <vkoul@kernel.org>, <neil.armstrong@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
	<andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
	<tony@atomide.com>, <linusw@kernel.org>, <brgl@kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: motorola,cpcap-usb: add chrg_det
 interrupt
Thread-Topic: [PATCH v3 1/4] dt-bindings: phy: motorola,cpcap-usb: add
 chrg_det interrupt
Thread-Index: AQHdDGam3cJf3YREAkK3VRP4rbzJH7ZgvSEAgABGIwCAANI2AA==
Date: Tue, 7 Jul 2026 09:58:20 +0000
Message-ID: <dad556ba-5965-42a0-b78a-2d417b2f6837@microchip.com>
References: <20260705101105.1798069-1-ivo.g.dimitrov.75@gmail.com>
 <20260705101105.1798069-2-ivo.g.dimitrov.75@gmail.com>
 <20260706-visitor-calorie-b805ac5af970@spud>
 <2b192691-54d8-4449-a18c-b87266c6c73c@gmail.com>
In-Reply-To: <2b192691-54d8-4449-a18c-b87266c6c73c@gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5590:EE_|PH7PR11MB6499:EE_
x-ms-office365-filtering-correlation-id: bf41d7af-fe28-418a-7d0e-08dedc0e469f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|10070799003|376014|23010399003|22082099003|18002099003|38070700021|3023799007|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 Ypm2BrZ8B2cmcsvqK1iE3EyN65d8me999mPx7NhkicdZU0iuz9vbVetPCp+lC40WYTwYJEAyVHgCPzkhk9AYptu93lJ5U1pUobtnMBPebit4MMiGnqibX+orj7DPhTruIXRZJjTx5bqsNm+T3b+sWiq7AfA5ZRxiaok4gjZlimiHoYGi04p1xLk7n9cIgMzxb3ZHHwAtfoAAFXAij/tXDiI7UcLQLumJuJ86ogJ5p7d4pmj2y0B01wmA1NxlbYEV9kesDYjN0Nxr7Ru5v9Tc9Q541SMWEHjezsfRjNpgA9mYinsKMs9Ga0pfwTjZnUEBsYhKnHXg/YIC8G2HzuAIeOZF8uOBqKBCnVfrHr1YqgBGncH3VE3AwPnx+XeAb5SBiZc+rVs8WapX11Vq0ode6yGhh814JRR/oIQJYu9SNhBa7hgVWEv5PamoG4yc35ENOK9yi2zLwtZOD2S0OZ0Mn6Yb9kBn80+dCbs4psKlKhdguWfepEZF/HgsX1l1ohq/JSB4nMCQgj66b49xTycnkStMcnKzNuMPfLdGVVa8nX9LskMTSulO/7weelCW6FpZSgaYpBm/7zJBMocaBr0XOBXjyBXzlkawBO7zSZ7SsjFeH6WmVS3OkvFuubaH/iC7nDwpY9R5WXzFGIQ1mNOrdDZIv2f4OTp9F7QjSmP4qiETBtz66rgN+6oN81b4Av/9xM7FCU9oJ0K4psbkFHtGTQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5590.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(10070799003)(376014)(23010399003)(22082099003)(18002099003)(38070700021)(3023799007)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?amhVNWswTFpJdVRxVXJoWndNbU5wMjltN1JlUXc0WEY5YTdpa2xrSUVVczFU?=
 =?utf-8?B?YnpUeitBVytReDRNR2l2YlRKMkhqT2VxYXlEUEg3RmttQU5aZmJDaG14RmJz?=
 =?utf-8?B?SlFwNkxoWlBQNmx4NVNSUDJCYTUxcFJrdTBHMXNwY0JtZXVwT3BDVndqT1pj?=
 =?utf-8?B?QjE2Z0xEVTFoelFySjRXM2hBNUtOV04vV05jNTBFNXFOdW8zekFOT0JoRUls?=
 =?utf-8?B?WjZzZmcwVDMzempkSmQ1dnFQU2szNHcwc0hGMEF0T1Evd3prQVpxNit6TlZa?=
 =?utf-8?B?N3l4bkJlL0JzMGp0WFRnUFExN3VGMmR1ZkVpVTBvTC9SV29JRGpJWVF1WGpZ?=
 =?utf-8?B?ZUJYdE04eHNHZFRIOUpnTU9QVW1PTGZNQzhrMWtBRFdWY243ekk3bW9QSjVP?=
 =?utf-8?B?dmFwaHdwNUNqNTB0bVdDemtieHhGM1NZdFFsNFNNQUt1WGxZb0V0TStGRXdE?=
 =?utf-8?B?alhOMzJxR29wcXhDcHpDMWJQRmduUG1INjByWGNvMDhxbXpMaEd2QUhpdkl2?=
 =?utf-8?B?UHlIaXZraXZtblNTTkhNQVFiMlI4U1Ivbm1XYVlrWXQ5eThRSU4zMzZ4VHBI?=
 =?utf-8?B?ZklMajFzSXVqNjJnYnh5SHBDcWx3ek9RbmZURVlha0g2U0orcUdiL2pYTkNT?=
 =?utf-8?B?azFrV3RQRWlYZzhsMmJsUEdpR242SFVxYlpiTWJyME9rZ3NrVE1sQmdRalZt?=
 =?utf-8?B?MW4rS1lLTUcxSWdzOFhkMjNvSVhGL0ZkdjFLaU5OME5mTHM0Z0NFK3BuT0o4?=
 =?utf-8?B?ek9xOFd4ZlJ3eXNzdU4wSG0rR0Z6Rmg4SFNZVGRuVDFNR0twK0x0bEtXbVhh?=
 =?utf-8?B?TTA3dk1XS24rU3FMT2Q3MXUwMjNnT1MwT1AwdzBoamlGYUZ6K2hEa3BWd3gv?=
 =?utf-8?B?MS9tSGsvYW1BN2hlTVpLRVlkemdEUmd1Yzd1MmI0UDB3ditXYnAyYU1GcFV4?=
 =?utf-8?B?SzN2Y3dUbnNSMjdub3I0S2NEU0tYVzVvbGQ5TkhrYm1HaWRxQ0oxNHJ4VEgy?=
 =?utf-8?B?Z2hIUjBxb0ZNOXZ6L2UzY2lUSHVkMjdRWHgxL01Ga2NLVjhmUE1zUGtpR05D?=
 =?utf-8?B?VWhQT2E5Tk54N3BwM2V6aWxUeTg0elhHRlMwbEFCeHBGWmxyZmFRK1FFNnFY?=
 =?utf-8?B?dkYzekJBbHJVWkVsY2pJbHoyZWlOVmlmdVFpZEpGTmJOR2VyY1hXcHA4VGJH?=
 =?utf-8?B?SjRHdkp2TXZCbTV3S3RZcUcrNzRKajJ3K0ZjNmlQWGlMZm1SSUVhOFZiUEhR?=
 =?utf-8?B?cXd0WU1xUk1hTXVzUEVhdkM4U3VCelpMdVZWMjlrTS85TWRIWDhPU2hCY3Fy?=
 =?utf-8?B?WVhMY3ZQbldVeGhDeWJSbzRWWi9yRFo1cGkydUhMUDRFQS9iVlFRT1lJb1ZL?=
 =?utf-8?B?U2JuVFNyTnRVNDJldVh6NXZheVJGZTVYUzNsd2tXRzZDVGYyY3ZUaitCZHBC?=
 =?utf-8?B?OUpRZE5hTkVIMHU2TXBRQldDd0YyQlJyQ3pvN2cwQ05VN2tvS0xETlR4UXV5?=
 =?utf-8?B?YkZmNExES0NRUXovNFlyampHNWNiY250dGNtWnJQNXNmYjRoaVV0RGQ1SUpt?=
 =?utf-8?B?cjRzT0NiZzFiVUljUysvY3dseVZ0MkR3TlFkS0Eyd05BMm5hWUNmc09XNVZm?=
 =?utf-8?B?YnJNV3RLMWpHVmpoVU1PVDdPMEJuSTI1bzJWcFVNNlJsemRmUGJVSUVERTBI?=
 =?utf-8?B?b3dlWWRaaHJ5NFpYVzlJSVdjTTd3aHJyKzRRUGFOYkE5L1FIMHpzb2ovRzN5?=
 =?utf-8?B?a1dKeG1JM0htVDJ5TzRGRVFwSVpHWVB3Q3pKT0htV3hJbGExRUVVQWpsdCt0?=
 =?utf-8?B?Wm1hUFlOYVY0WG9JSWVEaVRjZkJDbGo1MTBPM3NTWWpWeUtLaThaZzVselNW?=
 =?utf-8?B?eDdrdE5QQ3dxc1Jxc1dRL2w2blFQTkNkcHdPZFNjaEZJUlpHbmNDTHltbTgz?=
 =?utf-8?B?Qmhzc1V3M0N1MG5vdE9XYTVKV3VHUVludGQ1ZFFMM2VqSU8ySFhueHNRQ1ZD?=
 =?utf-8?B?S2VnUGdURlpPYloydmZzU0dWakRZNGZoL1NrV25EMFhMZjRDN3hHUkRieWZz?=
 =?utf-8?B?TkI1QmlGa3JoKzNqeVA2S3NVT2MrVjMwWEFNYndwYXdyTlBHRDBITTVleW1N?=
 =?utf-8?B?T1dlWVNjQVNmdjd6SXVON0dhQUZmUDVacXFiWkcrRGs4VGs5SW8xLzFmdWYv?=
 =?utf-8?B?dEh2dHdLRW1CL2hnbWZHN1FXSnY5SUJkNDBjT3U5OUdVMWIyZXBpK3MwcXly?=
 =?utf-8?B?by94d0h2Zmt0YlptZlNKM2d2VTJ6Y1pSNmhUUWtLWVduNDkrK3hvUDFBamNv?=
 =?utf-8?B?YXhXVlFINWRUdC9CRE4rK1k2NWxqMWhLV2tldFVVWTA2eVphUXF2SGIyNEdl?=
 =?utf-8?Q?VMEH3IsKIIcRS9hkjyL2OxJK+JTcd2kUE7jeUjvTpoVG8?=
x-ms-exchange-antispam-messagedata-1: WoJRyCNJvShU4w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDBFB1D7C7EECA48B4F013997D87235E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5590.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf41d7af-fe28-418a-7d0e-08dedc0e469f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 09:58:20.5450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P3KeVGUMvpPoN39YAziQhPSaulLAFa8xMlKy/+5YN9aSoPal9tUoXpm/lMw5qMgq08lJTj5ikwfKHhuLAA5iGj3mN0CdS/BM4TCVPd+O82A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6499
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39583-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Conor.Dooley@microchip.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:ivo.g.dimitrov.75@gmail.com,m:conor@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivogdimitrov75@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FROM_NEQ_ENVFROM(0.00)[Conor.Dooley@microchip.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,microchip.com:from_mime,microchip.com:dkim,microchip.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B3D871A11A

T24gMDYvMDcvMjAyNiAyMjoyNSwgSXZheWxvIERpbWl0cm92IHdyb3RlOg0KPiANCj4gSGksDQo+
IA0KPiBPbiA2LjA3LjI2INCzLiAyMDoxNCDRhy4sIENvbm9yIERvb2xleSB3cm90ZToNCj4+IE9u
IFN1biwgSnVsIDA1LCAyMDI2IGF0IDAxOjExOjAyUE0gKzAzMDAsIEl2YXlsbyBEaW1pdHJvdiB3
cm90ZToNCj4+PiBUaGUgQ1BDQVAgVVNCIFBIWSBkcml2ZXIgdXNlcyB0aGUgQ1BDQVAgY2hhcmdl
ciBkZXRlY3Rpb24gaW50ZXJydXB0DQo+Pj4gZm9yIERDUCBkZXRlY3Rpb24uDQo+Pg0KPj4gVGhp
cyBpcyBub3QgY3VycmVudGx5IHRydWUsIHRoZSBkcml2ZXIgZG9lcyBub3QgbG9vayBmb3IgdGhp
cyBpbnRlcnJ1cHQNCj4+IGF0IHRoZSB0aW1lIG9mIHRoaXMgcGF0Y2guDQo+Pg0KPiANCj4gUmln
aHQsIHRoaXMgaXMgYmFkIHdvcmRpbmcgY2F1c2VkIGJ5IHRoZSBmYWN0IHRoYXQgaW5pdGlhbGx5
IHRoZSBkcml2ZXINCj4gcGF0Y2ggY2FtZSBiZWZvcmUgdGhlIGJpbmRpbmcgcGF0Y2guDQo+IA0K
Pj4+IFVwZGF0ZSB0aGUgYmluZGluZyBhbmQgZXhhbXBsZSBEVFMgdG8gdXNlIHRoZSBjb3JyZXNw
b25kaW5nDQo+Pj4gImNocmdfZGV0IiBpbnRlcnJ1cHQgbmFtZS4NCj4+DQo+PiBTb3VuZHMgdG8g
bWUgbGlrZSB0aGlzIG5ldyBpbnRlcnJ1cHQgaXMgb3B0aW9uYWwsIHNpbmNlIHVudGlsIG5vdyBp
dCBoYXMNCj4+IG5vdCBiZWVuIG5lZWRlZD8gVGhlIHBhdGNoIGhvd2V2ZXIgbWFrZXMgaXQgbWFu
ZGF0b3J5LiBJIHRoaW5rIHlvdXINCj4+IGRyaXZlciBwYXRjaCBhbHNvIG1ha2VzIGl0IG1hbmRh
dG9yeSwgd2hpY2ggd2lsbCBicmVhayBvbGRlcg0KPj4gZGV2aWNldHJlZXMuDQo+Pg0KPiANCj4g
T2gsIGl0IGlzIGluZGVlZCBub3QgbmVlZGVkIGZvciBwcm9wZXIgRENQL1NEUCBkZXRlY3Rpb24s
IGFmdGVyIHNvbWUNCj4gZXhwZXJpbWVudHMgSSB3YXMgYWJsZSB0byB0ZWFjaCB0aGUgZHJpdmVy
IHRvIGRvIHByb3BlciBkZXRlY3Rpb24gYnkNCj4gdXNpbmcgY3VycmVudCBpbnRlcnJ1cHRzIG9u
bHkuDQo+IA0KPj4gV2hhdCBtYWtlcyB0aGlzIEFCSSBicmVhayBva2F5Pw0KPj4NCj4gDQo+IFdp
bGwgc2VuZCBuZXcgc2VyaWVzIHdpdGggc2NoZW1hL0RUIHBhdGNoZXMgZHJvcHBlZC4NCg0KSSB0
aGluayB0aGUgZGV2aWNldHJlZSBwYXRjaGVzIGFyZSBmaW5lLCBwcm92aWRlZCB5b3UgYWRkDQph
IG1pbkl0ZW1zIG9mIE4tMSBzbyB0aGF0IHRoZSBuZXcgaW50ZXJydXB0IGlzIG9wdGlvbmFsLg0K
RHJvcHBpbmcgdGhlbSB3b3VsZCBtZWFuIHRoYXQgdGhlIGRvY3VtZW50YXRpb24gZm9yIHRoaXMg
ZGV2aWNlDQpyZW1haW5zIGluY29tcGxldGUgc2luY2UgdGhhdCBpbnRlcnJ1cHQgZG9lcyBleGlz
dC4NCg0KQ2hlZXJzLA0KQ29ub3IuDQoNCg==

