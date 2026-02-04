Return-Path: <linux-gpio+bounces-31454-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IT9sA9mjg2ldrQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31454-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 20:54:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FA4EC464
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 20:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5B3030138AF
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 19:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36C5267B89;
	Wed,  4 Feb 2026 19:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="i3wJfQrD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07EB217F33;
	Wed,  4 Feb 2026 19:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770234819; cv=fail; b=SEFiJcB+eixbYzdZzSiPQIfAzAxzIM2zZAfrvrMDOU6QBIx+ZG/lnv3u/86tTrMovippHTbTJLExphTLo35S+ehtQacs69IMEOst8GYQkhP5b3aKK6YMF3P9CyLZ1VaJ8+zc5bXDDgGsLocHWrfVNKwzwDuURa4Ra75MpKQFfeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770234819; c=relaxed/simple;
	bh=tj9LG8Q5uYsntL6YYBPhtmRw5SepC7/Sb7hsGTWIaVQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dN8ZAQ+4781/4addHNvbhCFztBpbWglWBrIppC8Jw62sgNo85Qe3sZGMWhVS/rOAtFJkf+MSIORmxHM1WE9cqKj9DZ4QmT19y/tshk7bYUOivelGwdcCFBxVglc5Qz0S85Ypg2iWjfDReRfPaqVEnDFMmV+sjUZzc10hOzQxsXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=i3wJfQrD; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvzV+MRmo7kUFB4h8lyZaxtULCXbQSk+EbWF/tOUUG9v+tBYIJ2QBdSWXooccmEf72zKwkncawikerbNiPPSb6jvfcn0tRVXIyvJjcDYVXHZ5RDqw7+tAdAPichLvX2cuYEcAX9jV+D97mcvew4vzgN1s1Wb867V2UTeYhFD1228xS/zBLaEczcobZMzZx2gUBUcZLnAuvOygHOKunL59ZDKDt94qXYWIvc5QRo+SeUqotWh/jEIAmWwdR1jhnAsnnIzMA5MdECo+l37YS9PGnxkjlP+7i4VElR6fX7GCGY/G7rZ2H2OzliBLUugmSqsZE0k1CKczCemhxEkapc8DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tj9LG8Q5uYsntL6YYBPhtmRw5SepC7/Sb7hsGTWIaVQ=;
 b=vWKe4N7Uw2WgZx8rCqHQXqfpl0v43E773XvjVAnN+Kmvojp33NZQ9qBzv2C45HikGIkOn/phd1qonOqgXyYErw7BGvvVf/ExdDKjMFN04e5XSfD8CYyWF8Uj3POm28RxXvHBxtz0E945iUreeC0xETGpM02nhyD29pD/uQYFRUxeHbIPN/+HkEfQa/DrQdaEGPZSzd+803HqyilDSOfOkWvQS3bpU/n5AxUuMvguSmHnxa1j6C/VwezuqEnSF8kPDsZAbeSmlL/hiatZG92NikCOZL26cjuSI5lmvY2gyTzeuo3KQWY8YC2+WxdWiHfg41FqYmxBk9W6f9JGxwIy5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tj9LG8Q5uYsntL6YYBPhtmRw5SepC7/Sb7hsGTWIaVQ=;
 b=i3wJfQrDN0alyVRu+rVrwwnVBqFS05sNLS/qOvKWzk/IdUVstT4gHCOG3U/SEsytK+iEwLNElNJti+HEq+O+61qSq3BMd8A4sAUWh21Ivi0wDxYCIJPrxIuPsTKK4gkUqKbn80PX7cOjNkO/9r82DvqsfbX3H0l3nYGJ27WDa48=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by OS3PR01MB8906.jpnprd01.prod.outlook.com
 (2603:1096:604:17e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 19:53:36 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4%5]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 19:53:36 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij
	<linusw@kernel.org>, Clark Williams <clrkwllms@kernel.org>, Steven Rostedt
	<rostedt@goodmis.org>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rt-devel@lists.linux.dev" <linux-rt-devel@lists.linux.dev>
Subject: RE: [PATCH] pinctrl: renesas: rzt2h: fix invalid wait context
Thread-Topic: [PATCH] pinctrl: renesas: rzt2h: fix invalid wait context
Thread-Index: AQHclgDidzvSxDQ7dU+ZxhSvET4V57Vy6O+AgAAKCNA=
Date: Wed, 4 Feb 2026 19:53:36 +0000
Message-ID:
 <TYRPR01MB156191EEA4542FC6DC6BA9A488598A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260204180448.529313-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260204191423.9mmBtJOn@linutronix.de>
In-Reply-To: <20260204191423.9mmBtJOn@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|OS3PR01MB8906:EE_
x-ms-office365-filtering-correlation-id: f6d51b9c-6f76-4478-8176-08de642715a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NXpDNnpBLzFoYzdmaWd6OUNORUMwejRBTkhRdlI4c3VtUzVUcjB2dUpLWWtQ?=
 =?utf-8?B?c3loRFFOTTIva0dlNXRhMCtiMVdEbUd6T0dseDFyTlBPSnJ2eWVtdDVPRmpn?=
 =?utf-8?B?TEw1S1RIVlVRbjkxYzRoR0ZNN3FPSHN4eGwva1NRdFhFbjVCbDgvVmhVMTBk?=
 =?utf-8?B?RXMzNzYzSDJUOTVLUmlPWTh1aC81eC9zTXc3M2RBS3BLaENsK093eHVFMEFH?=
 =?utf-8?B?c1UyZzJyK3NqemVKd2lTaUxVemJaNmo4NlVhRElvMk0yQWJFVXVScDUwem1j?=
 =?utf-8?B?dDIxNzFZclQ1YkU2cVVPNXhscjBsd0NnUkxZQmd5UFhYWitrazd3U2lnOTVZ?=
 =?utf-8?B?RUROYWE3YmwxNnNBbWhiUXJ3cHdvM0VDZzRaU0lLVW1Xa21nUlQ0QUhkRHJD?=
 =?utf-8?B?eHlOdERSRUtjK3ZxejZpN01HTTd2Z2lCQlNKUCtOL2J3dDJsMFVkaTJ6TVE3?=
 =?utf-8?B?TXNkNlBqMlg4TXBGSHd2dVhzOHJUczFnek51Y3poVHhqbEpoMXlKUHBBYitO?=
 =?utf-8?B?dUpudjRDRHRsSzZJZWlLZFI4NWFtZ3hZWFZjOWg2eXZ5TzUzU3dPMXBQSkhy?=
 =?utf-8?B?cVduUUZqMERPZUhPQkV1U0FHc2lkMGZqMkxrenYwb2QraHpRVTczajdSVXYy?=
 =?utf-8?B?cEJtU0lLa0pISlFFMk5QY2lseVpqaUtkeUFnOEZSVXVnelRlNHFBcFRaOU9k?=
 =?utf-8?B?TWhaMVZWSm8yODB0b1N0NVAwNnZDS2NVSVFiNGE3MFBzOWRmZUJUZTVVbEtp?=
 =?utf-8?B?ME9yYW51Myt5MEgvd1ZkajRTanFrK0hrNjI2dytDTU1weFFtVUZ1Qzk2aXFy?=
 =?utf-8?B?eFMwKzZVbms3K0JlK1VNb00xTWdCWGJMVjBnOFlRMmZRUjFyQ1NvR3FrbHg5?=
 =?utf-8?B?Vjg3VnY2akswRnFsNTY3dDRMdm14TVdyQTlOT0xESnpZRXVzRkF2OGJaZjNW?=
 =?utf-8?B?Sk8rbzdOZ2dydVFFRVhJTEpzSzJFSkJzUHFRK2w5cWN0cGpxOHp0ZG9tcUFi?=
 =?utf-8?B?dTJ2U2RsWjRnbVRPckRKdkNkdU9kR1dob09ZN05qV1BCOFdMY3d5cmF2L3BH?=
 =?utf-8?B?Q3UveVhtY3E1aXJRTjBOR3VDNE5tb1RjSXBWNGVUQUsxbFpPTUk3OFl0Y3VQ?=
 =?utf-8?B?cjAxRVJhSGNhM1NVMzY1bUdUeHFROVJHc2E4NDJoeStoaU9PaVljTTQ0ZW1P?=
 =?utf-8?B?bVZ2bys4dW1vb1VqNTlGWldpeGhzNmVjRjBLWGxjY296Rm5TMWNlSm4rcXZ2?=
 =?utf-8?B?QzFaa2EzamhYTmVPaWpCMXVCTnBCOVVET0hLNjZnQXNnejMyL284b09lWnFz?=
 =?utf-8?B?dkM3cGNoVTdxWmxEWWdmclE2d25lY1R3Zmx2NGtQZGhxdTZBK05MTTVoMGh5?=
 =?utf-8?B?VHFWUGJxVkR6allTdE1tWkltdUVSb1k1eGwwcDU1VTdKSlJwcG5lc3daYVlH?=
 =?utf-8?B?T2I3QmVyTmFYeXpiS0h4THp2Rm5ndDI1YkRrOW5xbnR0MUtST3psTDZYWVVr?=
 =?utf-8?B?RzRCMnZyQUJUVmc4Um5SS3NTRGNKZldEdk5KY084dWZDODYwZS9GRkI0S1U1?=
 =?utf-8?B?Z1hBNUFkdGdmTGpuSmFzMFVLSXRHK0RHd3pKMVdFOVYwcWlKcHF5c0NwcndY?=
 =?utf-8?B?aDM2SGl3cWVGaUxOSFBqeHZYUTFoUFZtU2pBY1I4WmlDbFpJNFo3RXVqRW1Z?=
 =?utf-8?B?MnBiTUE1eXFmYmlnSXNtbjhBb2J0WjhobksyR0ltTHFzbFdIN0tDVkxtMklt?=
 =?utf-8?B?YlV2MmhnOEp6aHJNZittMTBmdTJKQjB5cTJRM29OciszSHlpK3FPbGUyYUVw?=
 =?utf-8?B?c1R2OGtlT08vREwzdkM2R0xQZFc5cHhIblRXSk5YQjlDU0haeEZDVEsrSzJ6?=
 =?utf-8?B?Tk9WMGpXWDBGTkI2bTF4WWNVK1RGQ2RxeEIxTGpLT05Fb2FHT2djYUlaS29Z?=
 =?utf-8?B?ZlpKRHJKZnI0cFFuZG5QL0pacUpSQVpOV01SV3FHb2JnOUU2U3BmV1owM2tL?=
 =?utf-8?B?T0RDdkhvb2s4YzFRRU10TytaK2JGaFJYL245c01QNXZOTGhmdUtjK0NLOGlo?=
 =?utf-8?B?T0dReFZLcEJOTjlwRDhMakY2eVlFaDRJRThNdWVSK1hoVkFkZ09NM1U1QWph?=
 =?utf-8?B?VU1ZeUZXRlZJMHVCK2M4SEMvZGtPZmY1cTkvWlJlbENWQmhtdXpnQlJZREdM?=
 =?utf-8?Q?Q/fbFqVfmmrPTLSjtQ64MHk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QU1yN3YyOWprZzhnU0lsd3R1V2lwTVYzREVDb3pySFNLa3ZtM051SnpYSW5p?=
 =?utf-8?B?cWQ5WTFTT3gwSEMvMFVQUXBTQmZCSXdwZHVCMGZEd1M0YVNuTE81c09Yd29t?=
 =?utf-8?B?azJFd1NCVEZ6QllYdFJuWThTOFNyRUJjekxuMTl6cG1Nd0FJeU84MHlBMDRs?=
 =?utf-8?B?aGZzWDlXcXpIcEZWbWQ2c3oxcDkyRjFVS0hPTVB2MzdnSmtYY2E5VHpqZmdL?=
 =?utf-8?B?b1lhQ0J0NWk0MlMzVWhEdkdya1FnMG1aRWsyWGxuMlJFbTl3ZFgxdFkvNmho?=
 =?utf-8?B?Zkg2MlNMcHJjTXJSek1xYkdFMEVGZUFOZFpOejdwRjVtSEtsa1UvOEFyUWVq?=
 =?utf-8?B?N28xdU1SYmtPL1FBZEZKci9mWFBsR0h4SWR3bkpzQ250Ni9vcXNoRmRnemd4?=
 =?utf-8?B?bWJGaExISCtndmhBNEdNdWpSdm9VMHZtZlVVR2liVnRLZm1GSXFZOHUwUlpj?=
 =?utf-8?B?Z203Nm9HYXRROUczWmZiM1VqbVA3M1N6d1RDbVRRSmtUd3FqemNJa1dsdG40?=
 =?utf-8?B?ZzU3UGdJSnNnMUEvc3ZndGNjaWlPUjZzMTNoMll4a0hGTU1BODVMTEU2WHNr?=
 =?utf-8?B?VGQ2UWlkZXB3eUhLOWNpQnU5anJIbERxemNpZ0tvWUN6RUoxV2pXWnp4eDdm?=
 =?utf-8?B?MDJ4WGlObW4rQ0FkTndRRittRUdGcVcrNnhPenl5K2ZjclB5Y1pVWlMwaHEw?=
 =?utf-8?B?QW9qSGMvU2EwODVMdlk5SlcxUmVQdklHOG40VktGaXh2cmVGdXptcWVvSEpR?=
 =?utf-8?B?L2VxcUxLdHlLejlTUVo2dit0NFVpWkU5U1h5YVN4ZVJ5Yy9yVUpyVkZ2NVdM?=
 =?utf-8?B?QlBYaCtIall3VnBCTXBVVWlhaGhEQkg0aFpLS25yTWQwajhMdWkrcTVuTDNl?=
 =?utf-8?B?cE5JbGxUdjF4NE1TVzNncEtxMFU0TEZnWDlxMkcyS3BJeDhHT0d2a3MrN0Zr?=
 =?utf-8?B?V1JkM1RNQ2k3OE8xWUVkVWhRU211SHA0b2R5Z0h1RVFBY3JpOVNKKzNoaEdQ?=
 =?utf-8?B?Rm03K0hPa253WERmRFZiSzR1UDlhdHNqZnNIbVJ3UVBGckZZVURZWmlQRGQw?=
 =?utf-8?B?cEczRkhFMEs5OEdnQkRndXhrRzY5a0xrRTNTUUZjdGFzbDUreU82WTRBMnZN?=
 =?utf-8?B?SG14TlRtdnhGRHZhTk4vZkNraExsY3dIcG1ua1VWN0FwSUxSWEZFT3U0SmNl?=
 =?utf-8?B?bklLdlhaYUJPc3VBQU9mencwVmVZLzBJeS9DVDZrNEN2MldnWW1vRTBxRXFl?=
 =?utf-8?B?d1B6R0k3cnFva3RZaGszUFpCejltMDIxN0MzRFB4b0xYaG1za3AxakhGeWwy?=
 =?utf-8?B?aXIxYUQ0bzBER2ZlME5nSDg5aS93ZDZ5UW15enhNOTFoUEE0NUNLaElGOC9Z?=
 =?utf-8?B?MmxJSW83NEVQNUxmeEFoenRML1d2ZTFhRDl6QjZ6K1RJWStxU0c2VU03U3o4?=
 =?utf-8?B?NEpQbmZ0Qndla09ySlE2YmJzdUZKQlBMQWdZdEt1NzFleGF1NXdiVzVwTC9Q?=
 =?utf-8?B?RkkydHlmSUdTbzRjUHczUEd6eVNhd2Rib09CdlZ2bDBVN1BtR2FUWktMd3BL?=
 =?utf-8?B?dlhtdmJJdVVTdERmbnpGZzZvY292djNsVFRCOXo4V0VYVVczd3V0NlZSWmlo?=
 =?utf-8?B?Z3lHUEduWGQ0YjFXTE8zakNGMFNBazVWbXZHWWdqS3lZU3llaGhUZ1pIMWxW?=
 =?utf-8?B?UnB5WlZCODV3c2NCQWk4cS90UDRCdjI1eCthOVNSajRXMFNIL24rdUJqbU9p?=
 =?utf-8?B?M2VzMUpkMEpKMVBFdnlWakcvb29ORU5MWWJHekFJYjgzV1NSTjVkUDE4czBL?=
 =?utf-8?B?OVBoZENYZjRaRzh3V3hMTjY2Wk5xN1h4SFNwYzQ1eEVUTmR3b2pQbGlxOTc3?=
 =?utf-8?B?SzMyV1VUOGtuUDJkM0ZQb2pOckgvTWE4Y2NlVmorT0Rab0U4dS9XUWhOSjVX?=
 =?utf-8?B?Y1RYejJhVGtKR2dkMmpGUkRpMWNmbUNTNEErQXZueUVrNjZhTlpocVRrNGlI?=
 =?utf-8?B?T3UzU1BvcFlxMWEya3dpbTdpR3h1K0NqTHN5UmhBdkluYVVkb0ZMbGpYd0xY?=
 =?utf-8?B?NzI0SlhodGtYbm5YeFZ1UHlMaDBEMHhtUTRZTlQvbmpFYk84TFBKZHJKa2Z1?=
 =?utf-8?B?cy9qQVBWelBYU0JXQlVFVlZmd1UvejZXTTNEZUJxa0Y0U0tJeVlraE9ldVNq?=
 =?utf-8?B?Mng5TVI4QlRRY3A4WXNOVVdWKzlwVHpwUEVVZHRkek9Tb2EvZVoyRUhnZEp5?=
 =?utf-8?B?a2RvY1VBUXdURkhrclJCRVZBSkx2bWdtdXAwdDYyNFNycG1vSC9UU2hkY3RH?=
 =?utf-8?B?VHNzVG1QZGZrZkxhaHJGd1R0TjdMMmdKYlBpTWJudGlZZmd2cWlqSlc1bk94?=
 =?utf-8?Q?XN12SWyPiFC8Y81sluAE1WJiKY8Wh2a2JcJI2?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15619.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d51b9c-6f76-4478-8176-08de642715a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 19:53:36.2244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MJoObeMoTk7vFGa9kCXWHmaure5AecJi/UhIIub9piZIkQpRolZIKtue+6UTVEV2QIJpygDRR1J3Jb4V8s73wVaU7kxPpRri3T+FPyC98gnQUHqgDNORJMHF8Ciem+nS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8906
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31454-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,renesas.com:dkim,TYRPR01MB15619.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 42FA4EC464
X-Rspamd-Action: no action

PiBGcm9tOiBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yIDxiaWdlYXN5QGxpbnV0cm9uaXguZGU+
DQo+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgNCwgMjAyNiA5OjE0IFBNDQo+IA0KPiBPbiAy
MDI2LTAyLTA0IDIwOjA0OjQ4IFsrMDIwMF0sIENvc21pbiBUYW5pc2xhdiB3cm90ZToNCj4gPiBU
aGUgZm9sbG93aW5nIGludmFsaWQgd2FpdCBjb250ZXh0IEJVRyBpcyBvYnNlcnZlZCB3aGVuIHJ1
bm5pbmcgd2l0aA0KPiA+IENPTkZJR19QUk9WRV9MT0NLSU5HIGVuYWJsZWQuDQo+ID4NCj4gPiBU
aGlzIHNlZW1zIHRvIHN0ZW0gZnJvbSB0aGUgZmFjdCB0aGF0IF9fc2V0dXBfaXJxKCkgdGFrZXMg
YQ0KPiA+IHJhd19zcGlubG9ja190LCB3aGlsZSB3ZSB0YWtlIGEgc3BpbmxvY2tfdCBpbnNpZGUg
Z3Bpb2RfZ2V0X2RpcmVjdGlvbigpLg0KPiANCj4gRnJvbSB0aGUgYmFja3RyYWNlIHllcy4gSXQg
aXMgbW9yZSB0aGF0IHRoZSBpcnFjaGlwIHVzZWQgaW50ZXJydXB0IGNoaXANCj4gbmVlZHMgdG8g
YmUgYWJsZSB0byBtYXNrIGludGVycnVwdHMgaW4gaGFyZGlycSBjb250ZXh0IHdoaWNoIGl0IG5l
ZWRzIGENCj4gcmF3X3NwaW5sb2NrX3QuDQo+IA0KDQpXb3VsZCB5b3UgbGlrZSBtZSB0byByZXdv
cmQgdGhlIGNvbW1pdCBtZXNzYWdlPyBJIG9ubHkgYW5hbHl6ZWQgd2h5IGl0DQpoYXBwZW5zLCBJ
IGRpZG4ndCBpbnZlc3RpZ2F0ZSB3aHkgaXQgbmVlZHMgdG8gaGFwcGVuLiA6RA0KDQo+ID4gcmF3
X3NwaW5sb2NrX3QgaXMgYSBzdHJpY3RseSBzcGlubmluZyBsb2NrLCB3aGlsZSBzcGlubG9ja190
IGNhbiBzbGVlcA0KPiA+IGlmIFBSRUVNUFRfUlQgaXMgZW5hYmxlZC4NCj4gPg0KPiA+IFN3aXRj
aCB0byByYXdfc3BpbmxvY2tfdCB0byBmaXggdGhpcy4NCj4gPg0KPiA+IFsgICAyMC42NDE4MDld
ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gWyAgIDIwLjY0NjMzNl0gWyBCVUc6
IEludmFsaWQgd2FpdCBjb250ZXh0IF0NCj4gPiBbICAgMjAuNjUwOTY0XSA2LjE5LjAtcmM4LW5l
eHQtMjAyNjAyMDIrICM0MTcgTm90IHRhaW50ZWQNCj4gPiBbICAgMjAuNjU2ODkyXSAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IFsgICAyMC42NjE1MTddICh1ZGV2LXdvcmtlcikv
MjM1IGlzIHRyeWluZyB0byBsb2NrOg0KPiA+IFsgICAyMC42NjY4NDJdIGZmZmYwMDAxODJkNGFi
NTggKCZwY3RybC0+bG9jayl7Li4uLn0tezM6M30sIGF0OiByenQyaF9ncGlvX2dldF9kaXJlY3Rp
b24rMHgzYy8weDE1MA0KPiA+IFsgICAyMC42NzY5MjhdIG90aGVyIGluZm8gdGhhdCBtaWdodCBo
ZWxwIHVzIGRlYnVnIHRoaXM6DQo+ID4gWyAgIDIwLjY4MjU2MF0gY29udGV4dC17NTo1fQ0KPiA+
IFsgICAyMC42ODU1NzJdIDQgbG9ja3MgaGVsZCBieSAodWRldi13b3JrZXIpLzIzNToNCj4gPiBb
ICAgMjAuNjkwNzAxXSAgIzA6IGZmZmYwMDAxODBiMzk4ZjggKCZkZXYtPm11dGV4KXsuLi4ufS17
NDo0fSwgYXQ6IF9fZHJpdmVyX2F0dGFjaCsweDEwYy8weDIxMA0KPiA+IFsgICAyMC43MDA0ODBd
ICAjMTogZmZmZjAwMDE4NmY0MWE2MCAocmVxdWVzdF9jbGFzcyl7Ky4rLn0tezQ6NH0sIGF0OiBf
X3NldHVwX2lycSsweDEwYy8weDc0MA0KPiA+IFsgICAyMC43MDk5NTJdICAjMjogZmZmZjAwMDE4
NmY0MThjOCAobG9ja19jbGFzcyl7Li4uLn0tezI6Mn0sIGF0OiBfX3NldHVwX2lycSsweDEyYy8w
eDc0MA0KPiA+IFsgICAyMC43MTkwNTddICAjMzogZmZmZjAwMDE4MmQ0YTY5MCAoJmdkZXYtPnNy
Y3Upey4rLit9LXswOjB9LCBhdDogZ3Bpb2RfZ2V0X2RpcmVjdGlvbisweDQwLzB4MjRjDQo+ID4g
WyAgIDIwLjcyOTEzNV0gc3RhY2sgYmFja3RyYWNlOg0KPiA+IFsgICAyMC43MzI0NTBdIENQVTog
MiBVSUQ6IDAgUElEOiAyMzUgQ29tbTogKHVkZXYtd29ya2VyKSBOb3QgdGFpbnRlZCA2LjE5LjAt
cmM4LW5leHQtMjAyNjAyMDIrICM0MTcNCj4gUFJFRU1QVA0KPiA+IFsgICAyMC43MzI0NTldIEhh
cmR3YXJlIG5hbWU6IFJlbmVzYXMgUlovVDJIIEVWSyBCb2FyZCBiYXNlZCBvbiByOWEwOWcwNzdt
NDQgKERUKQ0KPiA+IFsgICAyMC43MzI0NjRdIENhbGwgdHJhY2U6DQo+ID4gWyAgIDIwLjczMjQ2
N10gIHNob3dfc3RhY2srMHgxOC8weDMwIChDKQ0KPiA+IFsgICAyMC43MzI0NzldICBkdW1wX3N0
YWNrX2x2bCsweDcwLzB4OTgNCj4gPiBbICAgMjAuNzMyNDg5XSAgZHVtcF9zdGFjaysweDE4LzB4
MjQNCj4gPiBbICAgMjAuNzMyNDk3XSAgX19sb2NrX2FjcXVpcmUrMHg5MTAvMHgxNTk0DQo+ID4g
WyAgIDIwLjczMjUwOF0gIGxvY2tfYWNxdWlyZSsweDJmMC8weDQyYw0KPiA+IFsgICAyMC43MzI1
MTddICBfcmF3X3NwaW5fbG9ja19pcnFzYXZlKzB4NWMvMHg5NA0KPiA+IFsgICAyMC43MzI1Mjld
ICByenQyaF9ncGlvX2dldF9kaXJlY3Rpb24rMHgzYy8weDE1MA0KPiA+IFsgICAyMC43MzI1Mzhd
ICBncGlvY2hpcF9nZXRfZGlyZWN0aW9uKzB4MzQvMHg5MA0KPiA+IFsgICAyMC43MzI1NDddICBn
cGlvZF9nZXRfZGlyZWN0aW9uKzB4ZDgvMHgyNGMNCj4gPiBbICAgMjAuNzMyNTU2XSAgZ3Bpb2No
aXBfbG9ja19hc19pcnErMHg2OC8weDE0NA0KPiA+IFsgICAyMC43MzI1NjVdICBncGlvY2hpcF9p
cnFfZG9tYWluX2FjdGl2YXRlKzB4MTgvMHgzMA0KPiA+IFsgICAyMC43MzI1NzRdICBfX2lycV9k
b21haW5fYWN0aXZhdGVfaXJxKzB4NjAvMHhiMA0KPiA+IFsgICAyMC43MzI1ODNdICBpcnFfZG9t
YWluX2FjdGl2YXRlX2lycSsweDM0LzB4NWMNCj4gPiBbICAgMjAuNzMyNTkzXSAgaXJxX2FjdGl2
YXRlKzB4MmMvMHgzOA0KPiA+IFsgICAyMC43MzI2MDBdICBfX3NldHVwX2lycSsweDJkOC8weDc0
MA0KPiA+IFsgICAyMC43MzI2MTBdICByZXF1ZXN0X3RocmVhZGVkX2lycSsweGIwLzB4MTgwDQo+
ID4gWyAgIDIwLjczMjYyMF0gIHJlcXVlc3RfYW55X2NvbnRleHRfaXJxKzB4NTgvMHhhYw0KPiA+
IFsgICAyMC43MzI2MjldICBkZXZtX3JlcXVlc3RfYW55X2NvbnRleHRfaXJxKzB4NzgvMHgxNjAN
Cj4gPiBbICAgMjAuNzMyNjM3XSAgZ3Bpb19rZXlzX3Byb2JlKzB4MzQ0LzB4YjQwIFtncGlvX2tl
eXNdDQo+ID4gWyAgIDIwLjczMjY1N10gIHBsYXRmb3JtX3Byb2JlKzB4NWMvMHhhNA0KPiA+IFsg
ICAyMC43MzI2NjZdICByZWFsbHlfcHJvYmUrMHhiYy8weDJhYw0KPiA+IFsgICAyMC43MzI2NzVd
ICBfX2RyaXZlcl9wcm9iZV9kZXZpY2UrMHg3OC8weDExOA0KPiA+IFsgICAyMC43MzI2ODRdICBk
cml2ZXJfcHJvYmVfZGV2aWNlKzB4M2MvMHgxNzANCj4gPiBbICAgMjAuNzMyNjkzXSAgX19kcml2
ZXJfYXR0YWNoKzB4MTE4LzB4MjEwDQo+ID4gWyAgIDIwLjczMjcwMV0gIGJ1c19mb3JfZWFjaF9k
ZXYrMHg3Yy8weGRjDQo+ID4gWyAgIDIwLjczMjcxMF0gIGRyaXZlcl9hdHRhY2grMHgyNC8weDNj
DQo+ID4gWyAgIDIwLjczMjcxOF0gIGJ1c19hZGRfZHJpdmVyKzB4ZTQvMHgyMDQNCj4gPiBbICAg
MjAuNzMyNzI3XSAgZHJpdmVyX3JlZ2lzdGVyKzB4NjgvMHgxMjQNCj4gPiBbICAgMjAuNzMyNzM2
XSAgX19wbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIrMHgyMC8weDJjDQo+ID4gWyAgIDIwLjczMjc0
Nl0gIGdwaW9fa2V5c19pbml0KzB4MjAvMHgxMDAwIFtncGlvX2tleXNdDQo+ID4gWyAgIDIwLjcz
Mjc1OF0gIGRvX29uZV9pbml0Y2FsbCsweDdjLzB4NTMwDQo+ID4gWyAgIDIwLjczMjc3MF0gIGRv
X2luaXRfbW9kdWxlKzB4NTQvMHgyM2MNCj4gPiBbICAgMjAuNzMyNzgwXSAgbG9hZF9tb2R1bGUr
MHgxODFjLzB4MWVkMA0KPiA+IFsgICAyMC43MzI3ODldICBpbml0X21vZHVsZV9mcm9tX2ZpbGUr
MHhkOC8weGZjDQo+ID4gWyAgIDIwLjczMjc5N10gIGlkZW1wb3RlbnRfaW5pdF9tb2R1bGUrMHgx
ZTAvMHgyZDANCj4gPiBbICAgMjAuNzMyODA2XSAgX19hcm02NF9zeXNfZmluaXRfbW9kdWxlKzB4
NjAvMHhhNA0KPiA+IFsgICAyMC43MzI4MTRdICBpbnZva2Vfc3lzY2FsbC5jb25zdHByb3AuMCsw
eDQwLzB4ZjANCj4gPiBbICAgMjAuNzMyODI0XSAgZWwwX3N2Y19jb21tb24uY29uc3Rwcm9wLjAr
MHhiOC8weGQ4DQo+ID4gWyAgIDIwLjczMjgzMl0gIGRvX2VsMF9zdmMrMHgxYy8weDI4DQo+ID4g
WyAgIDIwLjczMjgzOV0gIGVsMF9zdmMrMHg0Yy8weDJkYw0KPiA+IFsgICAyMC43MzI4NTBdICBl
bDB0XzY0X3N5bmNfaGFuZGxlcisweGEwLzB4ZTQNCj4gPiBbICAgMjAuNzMyODYwXSAgZWwwdF82
NF9zeW5jKzB4MTk4LzB4MTljDQo+IA0KPiBQbGVhc2UgZ2V0IHJpZCBvZiB0aGlzIGJhY2t0cmFj
ZS4gSXQgYWRkcyBubyB2YWx1ZSB0byB0aGUgZGVzY3JpcHRpb24uDQo+IA0KDQpJIHdpbGwgcmVt
b3ZlIGl0Lg0KDQo+ID4gRml4ZXM6IDgyOWRkZTMzNjlhOSAoInBpbmN0cmw6IHJlbmVzYXM6IHJ6
dDJoOiBBZGQgR1BJTyBJUlEgY2hpcCB0byBoYW5kbGUgaW50ZXJydXB0cyIpDQo+ID4gU2lnbmVk
LW9mZi1ieTogQ29zbWluIFRhbmlzbGF2IDxjb3NtaW4tZ2FicmllbC50YW5pc2xhdi54YUByZW5l
c2FzLmNvbT4NCj4gDQo+IFNlYmFzdGlhbg0K

