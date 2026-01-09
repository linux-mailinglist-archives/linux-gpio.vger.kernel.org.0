Return-Path: <linux-gpio+bounces-30342-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB9FD09CEE
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 13:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44D1730EAAEE
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 12:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4150935B149;
	Fri,  9 Jan 2026 12:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MDX6xyGg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EADB2EC54D;
	Fri,  9 Jan 2026 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767961590; cv=fail; b=UyZ6YBrYOBb4RGR7EzZoNprRcoybVIu0vwi/Ftgk70CD3w+vF3oG7t2xZPNKDX4fhJu6EoAg0i3Sx4RyOt2mDSVIq1Z8z8Hof864bZ36w+8ZvmeaCG6cdkbSKGjXYRpWmDpV7keohs7nNLyn8rp6cNjX4fTgv1Sivpnq5/Sn5mE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767961590; c=relaxed/simple;
	bh=BOa9OBlc3lcaUfDy7G4lJwkhKlZK32RdPZgXirktc4M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b3Rx+9oyC+uvtc2Ls8SwqJBdXrfctMo8QjxGfZ/f2VenWS48bKY85nf9WuJsfqdsti3y7P/av5JR597C+/NzMjf0/4TB2pO7K3fjDbfxPx/LPUt2XEtA5z82pQwZH9kGBgeauxpaPBWOzI7tLqSZ3l7wcwtC0JIMjaorl8QVrRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MDX6xyGg; arc=fail smtp.client-ip=52.101.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjE/hj+T/kTsAAVDYIGLNjyb4Lur0fk56wL9I+MSPyMsq7OLqdNaluiyRkMJMPpecWogOcOBgYF59rd2Be4EsRfmWcaWYIxCKKm1Z/R8PT3+5BjShjtuEpoti3SgMy6lK7zUjIDjiYkAQSgozYGhF++zSRVeEETQbwPqZMJINAZ0V25iteRxCvx7oMRJqZB9LLX2AJIq8BXJlQ6NyJDfoimNDDySS8QU0X3RiqCu/3FUOlXpCb9rTmrLbURie2GvVQeC4U3znDHKheinNSdrklnnd6bbiLFMs0sHALbLQtY/3yJRzRSKWq6Vi/I1EA9lC/NtEIZnSTbVgFflxYMBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOa9OBlc3lcaUfDy7G4lJwkhKlZK32RdPZgXirktc4M=;
 b=G47tmnp7Or2VSyy9QzKH+ph9lhutzLFc8rl+2q5YiY9rzbNTs7n6IWU0PuI6D68PNK4vVzQV1cMmg3W5t89ma6Ar4Sv6BqBhu9SYGJ6F8hCHdKFsPDKlFKumBhj+I5/kI0RpaR+m2PFN4F2juj8lEYLjZZOLkXOqsINTYwU5rCcSjcYxNgdsjSwEcWQUqB9dsRfN2nU/kXIrLgNGCBwbSasconAcLHbbbvAJcHOZPVGA56Q0YxmrlY2I1nyiVnkXpimk5H247AIaxR1dpY4RmF0rCyjMHMwRID5KudAj4aWZThP6hSZZeG/ElNFBTg3Xitq8k/8B1XpQKhv3OXEhZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOa9OBlc3lcaUfDy7G4lJwkhKlZK32RdPZgXirktc4M=;
 b=MDX6xyGgY6MzshSoglAKu4RodbA4CYBFiItVZrEKvmP2S2Ew323ETqsb/fhKdBTz5pGxWrf6wx+g1i1OWLYi3EsRibh2lFCVug4q7x/IthKgDBl5SMb8QIfl2SG5lwIdgbkf4iybd5eTEoyGaCl4VW92upVXNaVd+I2+jYVPdxg=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by TYWPR01MB10708.jpnprd01.prod.outlook.com
 (2603:1096:400:2a4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.1; Fri, 9 Jan
 2026 12:26:21 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::606d:1c5a:2899:5ea6]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::606d:1c5a:2899:5ea6%4]) with mapi id 15.20.9520.001; Fri, 9 Jan 2026
 12:26:21 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 4/8] pinctrl: renesas: rzt2h: add GPIO IRQ chip to
 handle interrupts
Thread-Topic: [PATCH v2 4/8] pinctrl: renesas: rzt2h: add GPIO IRQ chip to
 handle interrupts
Thread-Index: AQHcZfhdZsIwObSoc0SAQeXjJaQ2kbVIvSyAgAADA2CAASyhgIAAB4KA
Date: Fri, 9 Jan 2026 12:26:21 +0000
Message-ID:
 <TYRPR01MB15619BBF26CCC5EC9BB46BF148582A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251205150234.2958140-5-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdX_ezZMYc3BRJRLFVwir6NPnxNUPw1Z0+oQDZjx_unJjA@mail.gmail.com>
 <TYRPR01MB15619ED191A00BDE5087CF1DC8585A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
 <CAMuHMdW+0Kg9fP933WU3ewp9DjkFEgi+P-G9gYN8EbER2gQLBw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW+0Kg9fP933WU3ewp9DjkFEgi+P-G9gYN8EbER2gQLBw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|TYWPR01MB10708:EE_
x-ms-office365-filtering-correlation-id: 4e04d36d-d738-4af1-4b95-08de4f7a4c45
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TVM0OGlEbGIvWHAxM2M4MmVtTjgyWExoZ3FBQkNVVXBoL1ZQbSthcHg0dUZx?=
 =?utf-8?B?Y3hNNHVqZnVjUDlWWDJDanBMd2NZWVZsV3dLbzF1SVhyRXk1QkpoVURkQ0J1?=
 =?utf-8?B?T2FkdXlGMUxDSmUxRXh3RnR0OGovWFBSWUgxazNmYnM0QjAxd0haTk1mVlcx?=
 =?utf-8?B?ckF6OHI4ZVhqVTE4TkM2TnNPaUhPOUNVQ3JSMkZkbE1UOXk0R0MzWlpvaytu?=
 =?utf-8?B?OHNwTTI1RjF6N1MwRFRoZ0F6S1B2YmV0bytHSE1yYUsrQVprRjh6bjUzanZW?=
 =?utf-8?B?eGpaRlNBMUc0WWUxcCt1ZDlZYUtCWHFBQzdHeTlXaTBHZTVjeFYyQmhsSXli?=
 =?utf-8?B?ZmovelJJNmpZTWpwTzFIVkoweS9sUHRnUGhaTG5pK3VmeSt4ZTNhOG53WEor?=
 =?utf-8?B?VGFCUTQwbit0c1hnVCtDQVJMLy9wZVBabEhWZm5nN0VMbjczMGpOdk1lMXM1?=
 =?utf-8?B?SkZvbm5vdzhkc25UWTcvRnlWblVRcWtLRi9PSkJSb0xKWURLUE9PTHlPLzZM?=
 =?utf-8?B?VVo4OG5NVDB0c1U4YlZraFNWcld0YUlXTXR2d25DOWsvS3hCTmF6cnNma2NY?=
 =?utf-8?B?Wk8wbFk2WmxVRDd4UTJ4NlZ0WjRjUzdkNktOVldDS0YrUkRtRkpKTFZrWnMv?=
 =?utf-8?B?SXNOcCtvNUJpYXVJSzFkUUE0SjJSNjM3ZHNUOXdrWnFIeWxHTHBmTHdqUHBm?=
 =?utf-8?B?WUltdjRVNUlIWkVreFJGVFpCeis0aXQvUVVHRXMrbFI0MGcrU1pqSVpZT1ly?=
 =?utf-8?B?cUo4b0VZSCtzeVFhWkU2K1U5YWNYQ0locVpLSmZkK3pod2IxOXltdFd1OHpw?=
 =?utf-8?B?SHN3Qjc4cFVEWmFkMTgvdUUyNW5nWFJKR0szQ0ZNUDV1eTNldVlzVDVWejdp?=
 =?utf-8?B?SEQvWGwzQWZ1Z0dsc0xOWEYvbWtRRFRITnIxdWRQNTNCUC9yRUlQRW95R1Yv?=
 =?utf-8?B?SXZIWVg2T0Fxd0dQbTkrY2dTbU1xNGlpbktmTWEraTNTZ3RseU5qbmI3c2l5?=
 =?utf-8?B?d1Eva0ZrWVVSYyt4ZmNxckQ4YTY4MTdHRm5JTE5YbytDdFVIWVpFS0tKT05F?=
 =?utf-8?B?SVY1OHJpbHllNE81eGk1amtQaCtFZGIvdndJK1B4bGo4WGhPNlBBRDBUUVI3?=
 =?utf-8?B?bHkwcEpBVEJOSFFBUkhpSHVuQllGa2NoNktjWjRpYXBpK0hBbWVIbzdyOVdM?=
 =?utf-8?B?RU81WHJMU1FWZ3lQTEJ5UVY3aWJlZGFncWN5UU41OUs1MHhNa1VsOWp0dkg4?=
 =?utf-8?B?MFB6WDdscDI2ZXo3bjNvMTQ1aEhCZ3loZ3M3bXQzQStPajNLREduZis1OUZa?=
 =?utf-8?B?MkZiekdUYmVsa2ZwSmI3TEtrSlRxaC9Ub0V3b3pBcFR2MGpyTk5QdXNKNy9H?=
 =?utf-8?B?YUZwZzRCcEdSS0FXREpGNUx4K0ExbjFyQVVjOVpCb3VCTlRoVUZaVUVkU2lK?=
 =?utf-8?B?a1BWOHNJUldlR0IweTN4ckI1a0tzbHpzTUVpa2lRd2kzTTJzUnZFbVgvZXdQ?=
 =?utf-8?B?YytVVlVkWmFjYXR0blMrTG9yVXZiR1lyZHVzb2VLTVFEQUNMQWU4Z3dtNjlm?=
 =?utf-8?B?dlAyN2lEOTVvLzJTcWw4ajRVazREek5RbEZBS216b0dHeEx2UnFqczJ3VTg2?=
 =?utf-8?B?TkRGeVBlZU1lK0dGcTVZZno0d3BYZnNLUGsxODRmQ2FyRHQwS2dvV1JNSkhJ?=
 =?utf-8?B?TU1RZTlwVm53VjF6LzUxOUVoUUkvQWJNWXhyd2k3Sk50WjE1aDFKZTBqQ2dY?=
 =?utf-8?B?TGxSUmZnRVZxM1BkY01vOEhvQU13Wm1HbFNGV2pkSlhxZTFJVzZCVnlOVm9F?=
 =?utf-8?B?SzcxanljNWxrL1pTdC9vc054Mm5QNlk5YS9SYUhyVmlWZGFxMGlHT2xDcE1p?=
 =?utf-8?B?RkU5WEhCYmZycG83NFJFa2FuMXAwckRwZ3dhc1BBNjRFYkxic3ZucWw0TnZ5?=
 =?utf-8?B?dHpzT2dNS2V3NTBjYnJtLzdLeHIzK09IM2VrTWZzWVdvaXhVQ25VaXBZMHYw?=
 =?utf-8?B?T2NWTCtRTHczUDBRR2JCTEtHZG5iMFJFdXJlTnZYTDFhcVYwWUxsdTNyZG5Q?=
 =?utf-8?Q?q+hA/z?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SC9vUkhlR1czNVRaT2xwMDhJRHA1TlZIclZPS3FmdkpwcVM0MnIvVjdldjBM?=
 =?utf-8?B?T3FyRjJEcm94d3JkN01ZSWdvLysrZVdWMm8xd3lEU2JmMkN6cTdKMnkvbFY2?=
 =?utf-8?B?TDB3akIrekZMMXlFQjh0SkZ5VkhNK0xwL2g3OVFQMlc5MUJ0ZmZ2TUYyenU5?=
 =?utf-8?B?MTY5S3pMMnltWkUwN0l6WWRTWjZzay9tdG5CZlNzUVIxd1pDYUptc2NiOTdV?=
 =?utf-8?B?dWNwazhQVHVsYmlZOHVlWEFleXBCWFNyMmF3ZG9LT3FUaWYwc1R2OWRlem1S?=
 =?utf-8?B?U1N1bGwwaW1aUVppdlhRK0tiTnhNMFZzS2h2cjlDYTdqMm5PbUNOTk1CMFZG?=
 =?utf-8?B?TzdoRk1rai9vblM4bkhwSk0zQ2tOZzI2RWo0SXN2RlVMMDZXN1VLVlpGYUJY?=
 =?utf-8?B?NDN2cHNab0g2aDBOQXczaEZnaXlvOWJwN3dJOHZ0dmV3KzNIQzdIa3VHbWsx?=
 =?utf-8?B?eUtLUWpGczBiTWZCMTcyZ3NYYlUxM1RxdFNJRE13Y2dHaEdxSm5iK1pmRnll?=
 =?utf-8?B?enBROGEyZ0FQbTN4M1VwajIwbDRzSDZYb3RnVE5JMDFSeUZZOE9UU3JEbWQ2?=
 =?utf-8?B?cE96NlZ3TlcyYmJqWWNlam1KRk1leGs3YjJ1QkIyTEI2M24vZG45MGlSdzkz?=
 =?utf-8?B?bGd5aDZobDdEN1N3VDdDb1pkSGJyZ1BzdENYdFRTMmgxNXVVSTU1NVhlaWFO?=
 =?utf-8?B?Sk0rYnBQcGtCTU9qaUlWdnJ4Q2RxTm96VzRzVllXSTEySHgxdVlCUlF4R1cw?=
 =?utf-8?B?MklqQXJRQVNaZXlWVU1aeHBBUGcyMy9tZGFnWnJqMTZuNXFMbjR2ZGhkYmg5?=
 =?utf-8?B?YTVXTlIxbHRub01yYmNDQVAxTWVHamttcUNHWWdrUUY3VGVKUUl3bEZWQ1hM?=
 =?utf-8?B?cnJyUTdVS1BtZXNaUmQ5L3UvTXJPR1YvQkVhRnJSUWFNV2tqbFZ5TmdXSVRF?=
 =?utf-8?B?V0E5d0ExbVlEL3BvQ282aUNlOUt0SERLMjg3YTRvazVaVnZUcFdrZlFFS1VT?=
 =?utf-8?B?NVRQYmpqN25ydUhSazlRYnlMcmZKdFhaWUpDTCtNOGNrNER6V2tUVGFCaHgy?=
 =?utf-8?B?MnM4bHhscVBTay9WQjNiZjI5Z0lFUXJtZENiVW91YjVNOTUvWHpqNDBpaG9v?=
 =?utf-8?B?RkJCRnVsK3psMXhvaDY2N0JIVE1xSlRXM2tLZndscTdXNW5TRStqS2g1c2N3?=
 =?utf-8?B?UHUzci80NU0vdVphM3VraURKM0F3L1NoUkc5UDhzUTZEc2dHSHZXNm85WXFx?=
 =?utf-8?B?cy9rWTFTUzVnbnBnQXNqN3JtYVVXTldXaCtibm5ZTEtpWk0vMkVRTDk4N3BH?=
 =?utf-8?B?a0owMXljQkJVT0ppSXRuN3Z0NytRU0dJU1R4c3ZGR24zVnNJaG41Q0xKckJK?=
 =?utf-8?B?bUl1L3NGWDQ5VFdWbllsVFR1aW50dTdCTGppWUlLalFtQlZqN0dGZi9oOHNJ?=
 =?utf-8?B?Vmx4dCtzVmFudmQ3Y1RMU1duTXNQbFNhR1BmUktaTmlsYlZRV2NSeHF6NWdV?=
 =?utf-8?B?TEtXTFV2Szl2Y3RKVWdpZlNwdktiQWRpYlVPMEs5QkMyMUtEbGpmUXVUWWhP?=
 =?utf-8?B?aDlEcUJNZS96Y2dPaDZ5aXVqaytBYVlVSkVBS1Y2NzJza0NKN3ZnK2dtc3Q2?=
 =?utf-8?B?M3huMmhVbHZaWWpUUUYzenNTWEpVR01nb0tmRXR0Z0Y3Z1N5WGtvUnY1QXJT?=
 =?utf-8?B?UW92Q1E1UDRudnFYN0dnekdmUTVjRit0TXZiRXUrcWQzdDBuWWFpS3lSQmFN?=
 =?utf-8?B?d2pGd3VmRnNPajJ4R3FJVWN5Z1lHLzQxUzJRaTVMeGxPZTAweWVCWkh4bHBG?=
 =?utf-8?B?Rzc0ZEk0V0hnL3JVSnVUcnkyTW9TNkRNQnpZaEhvWFB4MGtiMEU1VnFkZDBw?=
 =?utf-8?B?Y3YvOXkzQnhycVc2UmREWDNLWEpBSlUzWFU4bnU4OXVuYVlCTCtqWlpiYTdP?=
 =?utf-8?B?RGlJUWowcHJXWUIwNVFFU0lCTFYwRXN5ckdWTXVGVUpFK3A4YkhETlBLRjZr?=
 =?utf-8?B?MFZnOHVzY08weUsxbDV2UzJ5QWtUdmR3Z2lNdk9qQVFRU1BKYW5qUlFkWXdV?=
 =?utf-8?B?UDBueXZOWjNGQytGU2djZGJKa0hYUlBrYXRkR2c3MXF0a3ZuQVdkSjhVaWNh?=
 =?utf-8?B?dm13Zzg3Wnlqam43NDQ3cU10UUt2VlhSaFJGd1o4WnRBcmJyK2JvemRSSm1Q?=
 =?utf-8?B?ZnpRc0pYUUQ3a3UxV01xekZMcFN4bUVteVVKTmgzcFdiYU1aRGVVS2E0MkxK?=
 =?utf-8?B?bjFBSEV5UGJXQjl6SCtwQUpHc244VTREUGxSTkV6TGl5ak5wM2o5bk5Pb3Ax?=
 =?utf-8?B?ck5RSE1EbURweUZtaUZqZ1I4dkZuejl1L2JBUUJ2TmFjUmVEc2ZDWlF2dDNF?=
 =?utf-8?Q?5FnsiyIj41HUyryU6N829RTJf85syvAW9OEK2?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e04d36d-d738-4af1-4b95-08de4f7a4c45
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 12:26:21.6905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vdKsmT8YVCLDuddHgJdIE/l52ncBhd7Catm+OEckfDjdmA2L+fMPCZ5pIxsNLwSprEZPgsQi6ttuXF0YA/He3jePyeqEVhAPx9CNLuOmDekSZILvf92wp3MSB7ZNZuvH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10708

PiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50
OiBGcmlkYXksIEphbnVhcnkgOSwgMjAyNiAxOjM4IFBNDQo+IA0KPiBIaSBDb3NtaW4sDQo+IA0K
PiBPbiBUaHUsIDggSmFuIDIwMjYgYXQgMTk6NTYsIENvc21pbi1HYWJyaWVsIFRhbmlzbGF2DQo+
IDxjb3NtaW4tZ2FicmllbC50YW5pc2xhdi54YUByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBG
cm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiA+ID4gT24g
RnJpLCA1IERlYyAyMDI1IGF0IDE2OjAzLCBDb3NtaW4gVGFuaXNsYXYNCj4gPiA+IDxjb3NtaW4t
Z2FicmllbC50YW5pc2xhdi54YUByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+IFRoZSBSZW5l
c2FzIFJaL1QySCAoUjlBMDlHMDc3KSBhbmQgUmVuZXNhcyBSWi9OMkggKFI5QTA5RzA4NykgU29D
cyBoYXZlDQo+ID4gPiA+IElSUS1jYXBhYmxlIHBpbnMgaGFuZGxlZCBieSB0aGUgSUNVLCB3aGlj
aCBmb3J3YXJkcyB0aGVtIHRvIHRoZSBHSUMuDQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBJQ1Ugc3Vw
cG9ydHMgMTYgSVJRIGxpbmVzLCB0aGUgcGlucyBtYXAgdG8gdGhlc2UgbGluZXMgYXJiaXRyYXJp
bHksDQo+ID4gPiA+IGFuZCB0aGUgbWFwcGluZyBpcyBub3QgY29uZmlndXJhYmxlLg0KPiA+ID4g
Pg0KPiA+ID4gPiBBZGQgYSBHUElPIElSUSBjaGlwIHRvIHRoZSBwaW4gY29udHJvbGxlciB0aGF0
IGNhbiBiZSB1c2VkIHRvIGNvbmZpZ3VyZQ0KPiA+ID4gPiB0aGVzZSBwaW5zIGFzIElSUSBsaW5l
cy4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIHBpbiBjb250cm9sbGVyIHBsYWNlcyB0aGUgcmVxdWVz
dGVkIHBpbnMgaW50byBJUlEgZnVuY3Rpb24sDQo+ID4gPiA+IGRpc2FibGluZyBHUElPIG1vZGUu
IEEgaGllcmFyY2hpY2FsIElSUSBkb21haW4gaXMgdXNlZCB0byBmb3J3YXJkIG90aGVyDQo+ID4g
PiA+IGZ1bmN0aW9uYWxpdHkgdG8gdGhlIHBhcmVudCBJUlEgZG9tYWluLCB0aGUgSUNVLiBUaGUg
SUNVIGRvZXMgbGV2ZWwNCj4gPiA+ID4gdHJhbnNsYXRpb24gYW5kIHRoZW4gZm9yd2FyZHMgb3Ro
ZXIgZnVuY3Rpb25hbGl0eSB0byB0aGUgR0lDLg0KPiA+ID4gPg0KPiA+ID4gPiBXYWtldXAgY2Fw
YWJpbGl0eSBpcyBpbXBsZW1lbnRlZCBieSBwbGFjaW5nIHRoZSBlbnRpcmUgcGluIGNvbnRyb2xs
ZXIgb24NCj4gPiA+ID4gdGhlIHdha2V1cCBwYXRoIGlmIGFueSBwaW5zIGFyZSByZXF1ZXN0ZWQg
dG8gYmUgd2FrZXVwLWNhcGFibGUuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IENv
c21pbiBUYW5pc2xhdiA8Y29zbWluLWdhYnJpZWwudGFuaXNsYXYueGFAcmVuZXNhcy5jb20+DQo+
IA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6dDJoLmMN
Cj4gPiA+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yenQyaC5jDQo+
ID4gPg0KPiA+ID4gPiBAQCAtNjQ0LDE0ICs2NTAsMTk0IEBAIHN0YXRpYyBjb25zdCBjaGFyICog
Y29uc3Qgcnp0MmhfZ3Bpb19uYW1lc1tdID0gew0KPiA+ID4gPiAgICAgICAgICJQMzVfMCIsICJQ
MzVfMSIsICJQMzVfMiIsICJQMzVfMyIsICJQMzVfNCIsICJQMzVfNSIsICJQMzVfNiIsICJQMzVf
NyIsDQo+ID4gPiA+ICB9Ow0KPiA+ID4gPg0KPiA+ID4gPiArLyoNCj4gPiA+ID4gKyAqIEludGVy
cnVwdHMgMC0xNSBhcmUgZm9yIElOVENQVW4sIHdoaWNoIGFyZSBub3QgZXhwb3NlZCBleHRlcm5h
bGx5Lg0KPiA+ID4gPiArICogSW50ZXJydXB0cyAxNi0zMSBhcmUgZm9yIElSUW4uIFNFSSBpcyAz
Mi4NCj4gPiA+DQo+ID4gPiBJc24ndCBTRUkgNDA2LCBhbmQgRE1BQzBfSU5UMCAzMj8NCj4gPg0K
PiA+IDQwNiBpcyB0aGUgU1BJIG51bWJlciwgYnV0IHRoZSBJUlEgcGFyZW50IG9mIHRoZSBwaW5j
dHJsIGNoaXAgaXMgdGhlIElDVSwNCj4gPiBub3QgdGhlIEdJQy4NCj4gPg0KPiA+IFRoZSBJQ1Ug
aGFzIHRoZSBTUEkgaW50ZXJydXB0cyBpbnNpZGUgdGhlIGludGVycnVwdHMgYXJyYXkgaW4gZGV2
aWNlIHRyZWUsDQo+ID4gc28gdGhpcyBpbmRleCBpcyBhbiBpbmRleCBpbnRvIHRoYXQgYXJyYXks
IGFzIHRoYXQncyBob3cgdHJhbnNsYXRpb24gaXMNCj4gPiBkb25lIGluIHRoZSBJQ1UgZHJpdmVy
LiBTZWUgcnp0MmhfaWN1X3BhcnNlX2ludGVycnVwdHMoKS4NCj4gPg0KPiA+IFNFSSBwYXJ0aWN1
bGFybHkgd29ya3MganVzdCBmaW5lIGFzIGl0IHdhcyB0ZXN0ZWQgdXNpbmcgdGhlIHVzZXIgc3dp
dGNoLg0KPiANCj4gVGhhbmtzLCBJIGhhZCBmb3Jnb3R0ZW4gYWJvdXQgdGhhdC4NCj4gDQo+ID4g
SSB0aGluayB0aGUgI2ludGVycnVwdC1jZWxscyBkZXNjcmlwdGlvbnMgaW5zaWRlIHRoZQ0KPiA+
IHJlbmVzYXMscjlhMDlnMDc3LWljdS55YW1sIGFuZCByZW5lc2FzLHJ6djJoLWljdS55YW1sIGZp
bGVzIG5lZWQgYWRqdXN0aW5nLg0KPiA+DQo+ID4gTXkgYmFkIHRoYXQgSSBkaWRuJ3QgY2F0Y2gg
dGhvc2UgbWlzdGFrZXMuDQo+IA0KPiBOcCwgdGhlcmUgYXJlIG5ldmVyIGRpcmVjdCB1c2VycyBv
ZiB0aGlzIGluIERULCByaWdodD8NCj4gDQoNCkkgdGhpbmsgdGhlcmUgd29uJ3QgYmUgZGlyZWN0
IHVzZXJzLiBQZXJpcGhlcmFscyBpbnRlcm5hbCB0byB0aGUgU29DIHVzZSB0aGUNCkdJQyBkaXJl
Y3RseSwgd2hpbGUgZXh0ZXJuYWwgb25lcyBtdXN0IGdvIHRocm91Z2ggcGluY3RybC4NCg0KSSB3
aWxsIHN1Ym1pdCBwYXRjaGVzIGxhdGVyIHRvIGZpeCB0aGUgZGVzY3JpcHRpb24gb2YgI2ludGVy
cnVwdC1jZWxscyBhbnl3YXkuDQoNCj4gPiA+ID4gKyAqIFRoaXMgdGFibGUgbWF0Y2hlcyB0aGUg
aW5mb3JtYXRpb24gZm91bmQgaW4gVXNlciBNYW51YWwncyBUYWJsZSAxNy4yLA0KPiA+ID4gPiAr
ICogTGlzdCBvZiBtdWx0aXBsZXhlZCBwaW4gY29uZmlndXJhdGlvbnMgKDUgb2YgNTEpLg0KPiA+
ID4NCj4gPiA+IDMtNiBvZiA1MQ0KPiA+ID4NCj4gPiA+IEhvd2V2ZXIsIHRoZSBtYXBwaW5nIGlz
IG11Y2ggZWFzaWVyIHRvIGRlcml2ZSBmcm9tIHRoZSAiSW50ZXJydXB0IiByb3dzDQo+ID4gPiBp
biB0aGUgdmFyaW91cyB0YWJsZXMgaW4gU2VjdGlvbiAxNy41ICgiTXVsdGlwbGV4ZWQgUGluIENv
bmZpZ3VyYXRpb25zIiksDQo+ID4gPiBhcyB0aGVzZSBtYXRjaCB0aGUgb3JkZXIgaW4gcnp0Mmhf
Z3Bpb19pcnFfbWFwW10uDQo+ID4NCj4gPiBEbyB5b3Ugd2FudCBtZSB0byBjaGFuZ2UgdGhlIGNv
bW1lbnQ/DQo+IA0KPiBJIHRoaW5rIHRoYXQgd291bGQgYmUgaGVscGZ1bCBmb3IgdGhlIGNhc3Vh
bCByZXZpZXdlci4NCj4gDQoNCkFjay4NCg0KPiA+ID4gPiArICogUlovTjJIIGhhcyB0aGUgc2Ft
ZSBHUElPIHRvIElSUSBtYXBwaW5nLCBleGNlcHQgZm9yIHRoZSBwaW5zIHdoaWNoDQo+ID4gPiA+
ICsgKiBhcmUgbm90IHByZXNlbnQuDQo+ID4gPiA+ICsgKi8NCj4gPiA+ID4gK3N0YXRpYyBjb25z
dCB1OCByenQyaF9ncGlvX2lycV9tYXBbXSA9IHsNCj4gPiA+ID4gKyAgICAgICAzMiwgMTYsIDE3
LCAxOCwgMTksICAwLCAyMCwgMjEsDQo+ID4gPg0KPiA+ID4gcy8zMi80MDYvLCBidXQgdGhhdCBk
b2Vzbid0IGZpdCBpbiB1OCwgYW5kIHdvdWxkIG92ZXJmbG93IC51c2VkX2lycXNbXSwNCj4gPiA+
IHNvIHlvdSBwcm9iYWJseSBzaG91bGQgdHJhbnNsYXRlIGl0IGluIHRoZSBjb2RlIGluc3RlYWQu
DQo+ID4NCj4gPiBTZWUgYWJvdmUuDQo+IA0KPiBPSy4NCj4gDQo+ID4gPiA+KyBzdGF0aWMgaW50
IHJ6dDJoX2dwaW9fY2hpbGRfdG9fcGFyZW50X2h3aXJxKHN0cnVjdCBncGlvX2NoaXAgKmdjLA0K
PiA+ID4gPisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBjaGlsZCwNCj4gPiA+ID4rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgY2hpbGRfdHlwZSwNCj4gPiA+ID4rICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKnBhcmVudCwNCj4g
PiA+ID4rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgKnBhcmVudF90eXBlKQ0KPiA+ID4gPisgew0KPiA+ID4gPisgICAgICAgIHN0cnVjdCBy
enQyaF9waW5jdHJsICpwY3RybCA9IGdwaW9jaGlwX2dldF9kYXRhKGdjKTsNCj4gPiA+ID4rICAg
ICAgICB1OCBwb3J0ID0gUlpUMkhfUElOX0lEX1RPX1BPUlQoY2hpbGQpOw0KPiA+ID4gPisgICAg
ICAgIHU4IHBpbiA9IFJaVDJIX1BJTl9JRF9UT19QSU4oY2hpbGQpOw0KPiA+ID4gPisgICAgICAg
IHU4IHBhcmVudF9pcnE7DQo+ID4gPiA+Kw0KPiA+ID4gPisgICAgICAgIHBhcmVudF9pcnEgPSBy
enQyaF9ncGlvX2lycV9tYXBbY2hpbGRdOw0KPiA+ID4gPisgICAgICAgIGlmIChwYXJlbnRfaXJx
IDwgUlpUMkhfSU5URVJSVVBUU19TVEFSVCkNCj4gPiA+DQo+ID4gPiBPciAhcGFyZW50X2lycSwg
Y2ZyLiB0aGUgY2hlY2sgaW4gcnp0MmhfZ3Bpb19pbml0X2lycV92YWxpZF9tYXNrKCk/DQo+ID4g
Pg0KPiA+DQo+ID4gVGhpcyB3YXMgZG9uZSB0byBtYWtlIHN1cmUgdGhhdCB0aGUgcGFyZW50X2ly
cSAtIFJaVDJIX0lOVEVSUlVQVFNfU1RBUlQNCj4gPiBvcGVyYXRpb24gYmVsb3cgY2Fubm90IHBv
c3NpYmx5IHVuZGVyZmxvdy4gVGhlIHNhbWUgY2hlY2sgbWFrZXMgbGVzcw0KPiA+IHNlbnNlIGlu
IHRoZSBjb250ZXh0IG9mIHJ6dDJoX2dwaW9faW5pdF9pcnFfdmFsaWRfbWFzaygpLiBXaXRoIHRo
aXMNCj4gPiBleHRyYSBpbmZvcm1hdGlvbiwgd2hhdCB3b3VsZCB5b3UgbGlrZSBtZSB0byBjaGFu
Z2U/DQo+IA0KPiBPSywgcGxlYXNlIGxlYXZlIGl0IGFzIGlzLg0KPiANCj4gPiA+ID4gIHN0YXRp
YyBpbnQgcnp0MmhfZ3Bpb19yZWdpc3RlcihzdHJ1Y3Qgcnp0MmhfcGluY3RybCAqcGN0cmwpDQo+
ID4gPiA+ICB7DQo+ID4gPiA+ICAgICAgICAgc3RydWN0IHBpbmN0cmxfZ3Bpb19yYW5nZSAqcmFu
Z2UgPSAmcGN0cmwtPmdwaW9fcmFuZ2U7DQo+ID4gPiA+ICAgICAgICAgc3RydWN0IGdwaW9fY2hp
cCAqY2hpcCA9ICZwY3RybC0+Z3Bpb19jaGlwOw0KPiA+ID4gPiArICAgICAgIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnAgPSBwY3RybC0+ZGV2LT5vZl9ub2RlOw0KPiA+ID4gPiArICAgICAgIHN0cnVj
dCBpcnFfZG9tYWluICpwYXJlbnRfZG9tYWluOw0KPiA+ID4gPiAgICAgICAgIHN0cnVjdCBkZXZp
Y2UgKmRldiA9IHBjdHJsLT5kZXY7DQo+ID4gPiA+ICAgICAgICAgc3RydWN0IG9mX3BoYW5kbGVf
YXJncyBvZl9hcmdzOw0KPiA+ID4gPiArICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyZW50
X25wOw0KPiA+ID4gPiArICAgICAgIHN0cnVjdCBncGlvX2lycV9jaGlwICpnaXJxOw0KPiA+ID4g
PiAgICAgICAgIGludCByZXQ7DQo+ID4gPiA+DQo+ID4gPiA+ICsgICAgICAgcGFyZW50X25wID0g
b2ZfaXJxX2ZpbmRfcGFyZW50KG5wKTsNCj4gPiA+ID4gKyAgICAgICBpZiAoIXBhcmVudF9ucCkN
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5YSU87DQo+ID4gPg0KPiA+ID4gRGVz
cGl0ZSB5b3VyIGNsYWltIHRoYXQgdGhlIGludGVycnVwdHMgcHJvcGVydGllcyBhcmUgb3B0aW9u
YWwsDQo+ID4gPiBJIHRoaW5rICB0aGlzIHdpbGwgYWJvcnQgcHJvYmluZyB3aGVuIHRoZXkgYXJl
IGFjdHVhbGx5IG1pc3Npbmc/DQo+ID4NCj4gPiBJdCB3b24ndCwgaXQgd2lsbCBqdXN0IHVzZSB3
aGF0ZXZlciBwYXJlbnQgaW50ZXJydXB0IGNvbnRyb2xsZXINCj4gPiBpdCBjYW4gZmluZCAoR0lD
IGluIHRoaXMgY2FzZSkuIEkgdGVzdGVkIGl0Lg0KPiANCj4gT0ssIGxvb2tzIGxpa2UgSSBtaXNy
ZWFkIGEgY2hlY2sgaW4gb2ZfaXJxX2ZpbmRfcGFyZW50KCkuDQo+IA0KPiA+IGludGVycnVwdC1w
YXJlbnQgaXMgaW1wbGljaXRseSBhbGxvd2VkIG9uIGFueSBub2RlIHNvIGl0J3Mgbm90DQo+ID4g
dXNlZnVsIHRvIGFkZCBpdCB0byB0aGUgYmluZGluZ3MuIEFuZCB3ZSBjYW5ub3QgbWFyayBpdCBh
cw0KPiA+IHJlcXVpcmVkIGJlY2F1c2UgaXQgYnJlYWtzIGNvbXBhdGliaWxpdHkuDQo+ID4NCj4g
PiBCdXQsIHdpdGhvdXQgSUNVIGJlaW5nIHNldCBhcyB0aGUgaW50ZXJydXB0LXBhcmVudCwgdGhl
IHBhcmVudA0KPiA+IHJldHVybmVkIGhlcmUgd2lsbCBkZXBlbmQgb24gdGhlIHN0cnVjdHVyZSBv
ZiB0aGUgZGV2aWNlIHRyZWUsDQo+ID4gYXMgaW50ZXJydXB0LXBhcmVudCBjYW4gYmUgc2V0IGF0
IGFueSBsZXZlbC4NCj4gPg0KPiA+IFdpdGggdGhlIGN1cnJlbnQgZGV2aWNlIHRyZWUgc3RydWN0
dXJlLCBpdCB3aWxsIHJldHVybiB0aGUgR0lDDQo+ID4gaWYgdGhlIGludGVycnVwdC1wYXJlbnQg
aXMgbWlzc2luZyBvbiB0aGUgcGluY3RybCBub2RlLg0KPiA+DQo+ID4gV2l0aG91dCAjaW50ZXJy
dXB0LWNlbGxzLCBubyBvbmUgd2lsbCBiZSBhYmxlIHRvIHJlZmVyZW5jZSB0aGUNCj4gPiBpbnRl
cnJ1cHQgY29udHJvbGxlciBjcmVhdGVkIGJ5IHRoZSBwaW5jdHJsLiBBbmQgaWYNCj4gPiAjaW50
ZXJydXB0LWNlbGxzIGlzIHByZXNlbnQgdGhlbiBzdXJlbHkgaW50ZXJydXB0LXBhcmVudCB3aWxs
IGJlDQo+ID4gdGhlcmUgdG9vLg0KPiA+DQo+ID4gSSB0aGluayB3ZSBjYW4gbGVhdmUgdGhlIHBh
cmVudCBkb21haW4gZmluZGluZyBhcy1pcyBidXQgd2Ugc2hvdWxkDQo+ID4gIGd1YXJkIEdQSU8n
cyBpcnFjaGlwIGluaXRpYWxpemF0aW9uIHVzaW5nDQo+ID4NCj4gPiBpZiAob2ZfcHJvcGVydHlf
cHJlc2VudChucCwgImludGVycnVwdC1wYXJlbnQiKSB7Li4ufQ0KPiA+DQo+ID4gc28gdGhhdCBh
biBJUlEgY2hpcCB3aXRoIHRoZSB3cm9uZyBwYXJlbnQgaXMgbm90IGNyZWF0ZWQsIGV2ZW4gaWYN
Cj4gPiBpdCBjYW5ub3QgYmUgcmVmZXJlbmNlZCBpbiBhbnkgd2F5Lg0KPiA+DQo+ID4gV2hhdCBk
byB5b3UgdGhpbms/DQo+IA0KPiBZZWFoLCB0aGlzIGlzIGEgYml0IG1vb3QuIElmIHlvdSBkZWNp
ZGUgdG8gaGF2ZSBhIGNoZWNrLCBJIHRoaW5rDQo+ICdvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLCAi
aW50ZXJydXB0LWNvbnRyb2xsZXIiKScgaXMgdGhlIHJpZ2h0IG9uZS4NCj4gDQoNCk9rYXksIEkg
d2lsbCBzdWJtaXQgVjMgd2l0aCB0aGlzIG1vZGlmaWNhdGlvbiBhbmQgdGhlIGFkanVzdGVkIGNv
bW1lbnQuDQoNCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90
cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4g
cGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNl
bGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVz
dCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==

