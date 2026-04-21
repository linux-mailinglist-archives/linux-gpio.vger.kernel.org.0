Return-Path: <linux-gpio+bounces-35287-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CD+IF74W52lQ3wEAu9opvQ
	(envelope-from <linux-gpio+bounces-35287-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 08:18:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE58436D53
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 08:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D5833023525
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 06:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7388E384236;
	Tue, 21 Apr 2026 06:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="pUnXs5MU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022131.outbound.protection.outlook.com [40.107.75.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859EF35E947;
	Tue, 21 Apr 2026 06:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776752151; cv=fail; b=bThB2rBgcUIJSdjERfiEhRFTnWSqMUbT9Dh1mGXczBk1QJFVLBBBHq3sWjgjtauiFaZuAE4CzBUoGJFAf85htNJZ1docOAg/WRwQZ4Oe3+Q+w1/S5KzuiB2njn3BP2fjV6rNMjMvHjTKwLiVdhz+x/XvKZLYxJRSr2Hz2w4A1Kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776752151; c=relaxed/simple;
	bh=YMaw7sq7CixbWfFS4yCfkeE1HwS3YyocbNyjPV4vaHs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VBaBnmbzRb7XQ0oWz8MOCkdgNGGxa8bdIMMG8cynndSJGYDKJitSwaoSXZGkssGjf5JTWLxvU8uuS8gQhccHDj5UIP1BfB3TLUb6P1NpPAU3YJ+mOTg8IwuujxJcarV0mV6+fC15onDWP0QkUvp9QXxrQLuGS1rPa7QJVKjQahQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=pUnXs5MU; arc=fail smtp.client-ip=40.107.75.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLohACGXDTQvtk0cgoJjRVGl5l4G9J88x+OMwnX7IApGNMx3lfk2Mj4WNHPtyKm0dU1Ah2+tkRdVo/5Udx9dCVTcUcTtNigq0Zs41odOy9JYGKn+dbHIO/33aNm8UWWGu8Kr09rcUit+kiSxbmG3TLh9oprtMOeIiKOlv6vRiowp6/VQ2SWXux5qEKjk7f+vrgnG3BfleMWts5V7JZTPuOkw67Bp5bSRu9YUYCsCMnIvUhdUJbnOe8drwjhy7EsZeRaApYUt3CstckRIAFfswpFbSlgC12uIjPCu2f2+LciVDljIytfGlhVe6uV/vV3ur/1voSDcOEkucoGa7p3uzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yn1E4kh2SnRdvq2HlwS9bJ/p7ThTNtcr19dByzOmQMk=;
 b=henVgw+0Q4d1PilkAXqrp3g/9td4RHPTMiPCuHZxq2C9sWhRFf5j42rQQqPgD3I4siAe/T8M83tqc/0vn6loMJ+OPnEpIcY03l6PF1W7Ntz2AV4J1flIqyQJBn8BtzJZjejaOpOVZqFq0wLcrMN8gOET4HghlVsxevwBqfYQMJYmr9i9SDplnewRPA2VJVJtlYWJY0Y0E/t1n5nYrEemzQgzhTXqSj0CFXV47fKS3elIgWpH9KHf0qyFqWTypD3FG34vNpvMdMqhxn3bw5IjtA4gVAdQl+O1tOg7q2Mxnhfsfzhu6vyoJutRl9o7qOh7IrKsyFyL0k78YSlfatQ3kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yn1E4kh2SnRdvq2HlwS9bJ/p7ThTNtcr19dByzOmQMk=;
 b=pUnXs5MUcKb3YAyLzt84+tzqr11/mOU0s/fNzs1KDGJRlt7ye4cnUrzW3jSY70wpdY1RnON2fvH2PuPJllxvYtFEDDXUW2X0MkCI5Sbj0Y8voViy+8I/4cVmfQB4rEWQNYyAFHtU5P85m/nakOwcS7/NUzwL746YBu4P9TnGHw1iW5TRJsV1E3qEaUqy+0MHJiLeFlQse10Zd0KDR3eBJpQAeeKfxjwyXosdN9ghIG681BEs9KBm5ihsnwKBisoidTYPSe4CCNW5Qxfdb6vmpOquWFtR9ftgJSTQVvKGPVHHGMrSlCquK/E1Vkt99RLli6rLMJLR7RWPaf1+j7cOUg==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TY0PR06MB5633.apcprd06.prod.outlook.com (2603:1096:400:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Tue, 21 Apr
 2026 06:15:44 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 06:15:44 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Conor Dooley <conor@kernel.org>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus
 Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Ryan Chen
	<ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v7 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Thread-Topic: [PATCH v7 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Thread-Index:
 AQHczXLoc0DWafBAUU23YFhFi4LfGrXh15uAgACsm2SAAOlSgIAEIoHUgACZoACAAOZ7gQ==
Date: Tue, 21 Apr 2026 06:15:44 +0000
Message-ID:
 <OSQPR06MB725251546BFEB158F9AA1C4D8B2C2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260416-upstream_pinctrl-v7-0-d72762253163@aspeedtech.com>
 <20260416-upstream_pinctrl-v7-1-d72762253163@aspeedtech.com>
 <20260416-brutishly-saga-ba7168a4cd14@spud>
 <OSQPR06MB7252EB0C2A1A3313DE49406B8B202@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260417-anemia-borrower-fb90ac02b417@spud>
 <OSQPR06MB7252BD7967D2567AD6DA7A1D8B2F2@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260420-footprint-both-967ccd6c120c@spud>
In-Reply-To: <20260420-footprint-both-967ccd6c120c@spud>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TY0PR06MB5633:EE_
x-ms-office365-filtering-correlation-id: b280758e-5173-4a36-f532-08de9f6d6c0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 C1AEHJB7DX/4GbaiTJLpVg+wPktEet8INaZy7tDxKWCt2/HoOBs31Diz+QHVWVTkIEhe/2MMZKKS1sNfBkraPvTX98/WHneG4NpWO8p8ZkiQhjxNIlfyPozFHgjJSc2Hbxj2KcvWt3dsEezID0+bXjYzTWmXANfBQVW6fPEZrb8BUEl+s3OGKOj8PUyfl/Sp86a3wulpoZt5peZ1CCwa3Kcgqvrx4liTQxlFQFihSSK7mggEFWoyTl9yjacca5fnZPKVCF2XXMX9nlvNlcS+ig4fDA7m+L9dBY4VYKontvJreSD/WYn9xG7e590WSeG6NzoT0Hg5Z2NrjTbAEPR3KhogRr1jSrmao3LLGh47WiWzfcaqqMMlNiadWo47Q3kbdHYQLrGiOXZN0iXYvQqP8poRK8pymNC9h3XWbQ2EKn9SQnUbCmRUxx79g6XKUzNNzjnoijE+6lPgsDImmTaQmFp9mt2iOqfFAcA/Dgh/qwg3U83MB7WtUSfJG6p60pL3VsWW812e5qqT2AJSzApKWhn7Clo1e1BYSCRorZL2UTz26ULvHgpa1ugyWkWXjUxtINGRqNK1jd0Frxjk8kkwXVg24cdvfZZmzFrknEs97KjrZ0/AZPupMYXN7sQBFmqtjOGQ9Hqk1NNypVIjp8cV/7azff6qJVLllZBTkIWZItJRuFHEaeOLT6248naOa0QakNwpnMm2i9QrwPP8WNqIjbheeW+tvJTNg/2VrPnbft8sdoGluxlCRg2kNeoATSZ45tFinVF0hbwvCYQ0Dy6RQWukd8vnRnCnWBHdhNhQRvc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?V5jryo0FWAVllIAHqNDIIVkgRW1TVbt9hX/rPuzLuOL4UWknaNYdbC1s?=
 =?Windows-1252?Q?JHpSXoFDXRA/hrToXvhfN+TznhqkAVIDKQpRTsK2AFmdcuB7MOzq6yKw?=
 =?Windows-1252?Q?ZWtw67LFmDCglnCIjzDKRz2/lSCQZ89lwWWGRIlOl0o9qeweGZK8V2GX?=
 =?Windows-1252?Q?FDBvWCs1nnEMSk0XgqnuddYDAX7CVSJ/ARqwR3jzltsMsD6n0i4gg6oW?=
 =?Windows-1252?Q?bwcdfsv2piG8l6/iJ0NXmzfdCD37cCJiHRXWMBwPEOVuPjBaPYKCn2Kr?=
 =?Windows-1252?Q?usxNt2Rxc53aQw1j0UBq7i1g9TKSjrUgIkJTCT6HmD7QmmRHBWQT5r/B?=
 =?Windows-1252?Q?6WceXR7r831X1ZzNIBtU9cNGTURA9DPYpA/yhFd1/IwTyywgLEUI38xZ?=
 =?Windows-1252?Q?FsqaR1bFcnFjWwDWNbov5gvj46C9ku3F96TnkX8VjgXzPxU3fpI33l/7?=
 =?Windows-1252?Q?v97fbIsydLE/JZyXHSCenV7N5MgFTXw3y85vTyjFxhZQndXDU2JU6Esy?=
 =?Windows-1252?Q?jC5uX8BUeO+jWeE633WFF4/2pv+D9ebZGW1KZmAlTf2AMFMBOu2dZ14T?=
 =?Windows-1252?Q?hD6pWwf+iUMPGM/REM6DFuHhGm2EVRIrydmmDU6nH8GAmW9Y0eKIXW81?=
 =?Windows-1252?Q?YfTBK9jKkUQf7yuAQOxcACX7nRJ9XBQ6avKU0r+LH9lfyXFEucr6zn2a?=
 =?Windows-1252?Q?e32RdImOgKg78/5PV+pP6n70rDpyy0B/BEe4PAUbISnio1o0Mkzc/X7d?=
 =?Windows-1252?Q?jiIA7tGd6uxVHHWoOiv5CUGIyH26x3u0xJnwAom27N21SDCRUHJr7TTX?=
 =?Windows-1252?Q?xGlju89LbC7t2TfwhhRUa/I5OOwZkM9PtoKTBrxK4GbxRKdJf81RG+dL?=
 =?Windows-1252?Q?XINip28/LgQtTZQNw7CCRJFYIwELu/PsX/nA0j0IyMJUGr6co2iUnm/9?=
 =?Windows-1252?Q?uDeSfymMP4YsL4SMqlmk8s7qoVBYiIB0r5zqLaBfhYmCUUNAyFEtQbqG?=
 =?Windows-1252?Q?0XTZdBYTSBJJuB6X35XJ8f3K06gPpMSPkCElrCPDmXRUbfqINFF9l7qy?=
 =?Windows-1252?Q?bTdNgb08Ssf5SUJ/PWF5kS/88HtgtzoRWDDJtzoB4SBoLKAI09if+REP?=
 =?Windows-1252?Q?ac+M+r+oWuNBgsuKmqWUtZqpmADjWHMQ2Meh7zqLF4ItKNmcQP69jsb5?=
 =?Windows-1252?Q?x6Iyof1Z96ob+rV3rP+/AH0XgdLOCgDglVje43+PN2UMW1b+3+178KcB?=
 =?Windows-1252?Q?Ym4598L7b+ULBriHRwVvCtvsBTcFAmQbhxwHHFtwbiVnbGM/77RUxqvC?=
 =?Windows-1252?Q?PLhQhvPAy2+HB0+T64CBl8JkiLNT9WhHejHyKn0NYn05UZ9HnhHs01Hc?=
 =?Windows-1252?Q?M/6joXbaf5V+/MvciuUjUVdfY0hhHsBIxqK8Qnod+WzxAwrNuZxxTVLJ?=
 =?Windows-1252?Q?wi/GatEA8mdobRwG/KEuwQUipSkRsIgPVFEQkw0OUuskL6tpB7O9/yxt?=
 =?Windows-1252?Q?PNBUk3Te+3jQF7Z/s4kvoXVU4xzapcK8eDHtFs2y+Lb75ky03hCGM6qC?=
 =?Windows-1252?Q?ihSiRNpl9aO4aAS9jjvQKSOVhmy1Wcf7+vCqScqa2Vui0SuuNZgd7fFO?=
 =?Windows-1252?Q?0wHTuZBbFJ1con+ZUsMhJkrdh6P3DkKveXsherD0h0n046iUzp5DNLGv?=
 =?Windows-1252?Q?/Ou80TMN6QSdNuAocOs2KbVI2N5gGrinALwTyWmbrSv9MaTAC0Dl0kXe?=
 =?Windows-1252?Q?eBXeF/5RBQWgw+RAqUkF24i5NqOsQJSngMPjqnXK3JzKsr89H6MY9Q3x?=
 =?Windows-1252?Q?cE9Kgr3QuizrsJB2Pq57veQ8FB6E/laXTy7xMoVCftKrYTRxC6rl7yTY?=
 =?Windows-1252?Q?c/GsxDmYH9ZZaA=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b280758e-5173-4a36-f532-08de9f6d6c0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 06:15:44.5598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qW5mbgGICLQiDRgnPcMfMO5yatc/9moBOYckQvIPCo1J6EOya52a6rrhQ7LxNvU2QT8Xq7qAO9pHnmgFxpcLVRly5bsf4ueCHbJSt8PGLno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5633
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[aspeedtech.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[aspeedtech.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35287-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[aspeedtech.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BAE58436D53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > > > > > +    properties:=0A=
> > > > > > +      function:=0A=
> > > > > > +        enum:=0A=
> > > > > > +          - EMMC=0A=
> > > > > > +          - JTAGDDR=0A=
> > > > > > +          - JTAGM0=0A=
> > > > > > +          - JTAGPCIEA=0A=
> > > > > > +          - JTAGPCIEB=0A=
> > > > > > +          - JTAGPSP=0A=
> > > > > > +          - JTAGSSP=0A=
> > > > > > +          - JTAGTSP=0A=
> > > > > > +          - JTAGUSB3A=0A=
> > > > > > +          - JTAGUSB3B=0A=
> > > > > > +          - PCIERC0PERST=0A=
> > > > > > +          - PCIERC1PERST=0A=
> > > > > > +          - TSPRSTN=0A=
> > > > > > +          - UFSCLKI=0A=
> > > > > > +          - USB2AD0=0A=
> > > > > > +          - USB2AD1=0A=
> > > > > > +          - USB2AH=0A=
> > > > > > +          - USB2AHP=0A=
> > > > > > +          - USB2AHPD0=0A=
> > > > > > +          - USB2AXH=0A=
> > > > > > +          - USB2AXH2B=0A=
> > > > > > +          - USB2AXHD1=0A=
> > > > > > +          - USB2AXHP=0A=
> > > > > > +          - USB2AXHP2B=0A=
> > > > > > +          - USB2AXHPD1=0A=
> > > > > > +          - USB2BD0=0A=
> > > > > > +          - USB2BD1=0A=
> > > > > > +          - USB2BH=0A=
> > > > > > +          - USB2BHP=0A=
> > > > > > +          - USB2BHPD0=0A=
> > > > > > +          - USB2BXH=0A=
> > > > > > +          - USB2BXH2A=0A=
> > > > > > +          - USB2BXHD1=0A=
> > > > > > +          - USB2BXHP=0A=
> > > > > > +          - USB2BXHP2A=0A=
> > > > > > +          - USB2BXHPD1=0A=
> > > > > > +          - USB3AXH=0A=
> > > > > > +          - USB3AXH2B=0A=
> > > > > > +          - USB3AXHD=0A=
> > > > > > +          - USB3AXHP=0A=
> > > > > > +          - USB3AXHP2B=0A=
> > > > > > +          - USB3AXHPD=0A=
> > > > > > +          - USB3BXH=0A=
> > > > > > +          - USB3BXH2A=0A=
> > > > > > +          - USB3BXHD=0A=
> > > > > > +          - USB3BXHP=0A=
> > > > > > +          - USB3BXHP2A=0A=
> > > > > > +          - USB3BXHPD=0A=
> > > > > > +          - VB=0A=
> > > > > > +          - VGADDC=0A=
> > > > > > +=0A=
> > > > > > +      groups:=0A=
> > > > > > +        enum:=0A=
> > > > > > +          - EMMCCDN=0A=
> > > > > > +          - EMMCG1=0A=
> > > > > > +          - EMMCG4=0A=
> > > > > > +          - EMMCG8=0A=
> > > > > > +          - EMMCWPN=0A=
> > > > > > +          - JTAG0=0A=
> > > > > > +          - PCIERC0PERST=0A=
> > > > > > +          - PCIERC1PERST=0A=
> > > > > > +          - TSPRSTN=0A=
> > > > > > +          - UFSCLKI=0A=
> > > > > > +          - USB2A=0A=
> > > > > > +          - USB2AAP=0A=
> > > > > > +          - USB2ABP=0A=
> > > > > > +          - USB2ADAP=0A=
> > > > > > +          - USB2AH=0A=
> > > > > > +          - USB2AHAP=0A=
> > > > > > +          - USB2B=0A=
> > > > > > +          - USB2BAP=0A=
> > > > > > +          - USB2BBP=0A=
> > > > > > +          - USB2BDBP=0A=
> > > > > > +          - USB2BH=0A=
> > > > > > +          - USB2BHBP=0A=
> > > > > > +          - USB3A=0A=
> > > > > > +          - USB3AAP=0A=
> > > > > > +          - USB3ABP=0A=
> > > > > > +          - USB3B=0A=
> > > > > > +          - USB3BAP=0A=
> > > > > > +          - USB3BBP=0A=
> > > > > > +          - VB0=0A=
> > > > > > +          - VB1=0A=
> > > > > > +          - VGADDC=0A=
> > > > > > +      pins:=0A=
> > > > > > +        enum:=0A=
> > > > > > +          - AB13=0A=
> > > > > > +          - AB14=0A=
> > > > > > +          - AC13=0A=
> > > > > > +          - AC14=0A=
> > > > > > +          - AD13=0A=
> > > > > > +          - AD14=0A=
> > > > > > +          - AE13=0A=
> > > > > > +          - AE14=0A=
> > > > > > +          - AE15=0A=
> > > > > > +          - AF13=0A=
> > > > > > +          - AF14=0A=
> > > > > > +          - AF15=0A=
=0A=
> > > > > Why do you have groups and pins?=0A=
> > > > > Is it valid in your device to have groups and pins in the same no=
de?=0A=
=0A=
> > > > The intent is to support both group-based mux selection and=0A=
> > > > configuration, as well as per-pin configuration.=0A=
=0A=
> > > > In our hardware:=0A=
> > > > - `function` + `groups` are used for pinmux selection.=0A=
> > > > - `pins` is used for per-pin configuration (e.g. drive strength,=0A=
> > > >   bias settings).=0A=
> > > > - `groups` may also be used for group-level configuration.=0A=
=0A=
> > > > As a result, both `groups` and `pins` may appear in the same node,=
=0A=
> > > > but they serve different purposes and do not conflict:=0A=
> > > > - `groups` selects the mux function and may apply configuration to=
=0A=
> > > >   the entire group.=0A=
> > > > - `pins` allows overriding or specifying configuration for individu=
al=0A=
> > > >   pins.=0A=
=0A=
> > > > In most cases, only one of them is needed, but both are allowed whe=
n=0A=
> > > > both group-level and per-pin configuration are required.=0A=
=0A=
> > > To be honest, that sounds like your groups are not sufficiently=0A=
> > > granular and should be reduced such that you can use them for pin=0A=
> > > settings.=0A=
=0A=
> > The intent was to keep the binding flexible, but in practice the mixed=
=0A=
> > use of `groups` and `pins` in the same node is not expected to be used.=
=0A=
> > =0A=
> > Given that, I agree this flexibility is unnecessary and makes the=0A=
> > binding semantics less clear. I'll rework the binding to make the=0A=
> > expected usage explicit rather than allowing combinations that do not=
=0A=
> > correspond to a real use case.=0A=
> > =0A=
> > In particular, I'll split the constraints as follows:=0A=
> > =0A=
> > - For pinmux, the presence of `function` will require `groups`, and=0A=
> >   `pins` will not be allowed. This reflects the hardware design, where=
=0A=
> >   the groups are defined by the pins affected by a given mux expression=
=0A=
> > =0A=
> > - For pin configuration, exactly one of `groups` or `pins` will be=0A=
> >   required (using oneOf), so that configuration is applied either at=0A=
> >   group level or per-pin, but not both.=0A=
> > =0A=
> > =0A=
> > - if:=0A=
> >     required:=0A=
> >       - function=0A=
> >   then:=0A=
> >     required:=0A=
> >       - groups=0A=
> >     not:=0A=
> >       required:=0A=
> >         - pins=0A=
> >   else:=0A=
> >     oneOf:=0A=
> >       - required:=0A=
> >           - groups=0A=
> >         not:=0A=
> >           required:=0A=
> >             - pins=0A=
> >       - required:=0A=
> >           - pins=0A=
> >         not:=0A=
> >           required:=0A=
> >             - groups=0A=
> > Does this match what you had in mind?=0A=
=0A=
> It's an improvement I think, but I am wondering why you cannot do=0A=
> without pins entirely and apply pinconf stuff at the group level?=0A=
> Of course that may not be possible with the current groups, but if you=0A=
> made the groups more granular, would it be possible?=0A=
=0A=
Within a given group, it is not always the case that all pins share the=0A=
same configuration requirements (e.g. drive strength or bias settings),=0A=
so applying pinconf purely at the group level would be too restrictive.=0A=
=0A=
Making the groups more granular to match all possible configuration=0A=
combinations would not reflect the actual mux granularity and would=0A=
significantly increase the number of groups.=0A=
=0A=
For example, we have encountered a timing issue due to the PCB layout,=0A=
where only the eMMC clock pin requires a different drive strength:=0A=
=0A=
  # The EMMCG4 group includes pins AC14, AE15, AD14, AE14, AF14, AB13=0A=
  # AC14: clock=0A=
  # AE15: command=0A=
  # AD14=96AB13: data=0A=
=0A=
  pinconf_emmc_clk: emmc-clk-pinconf {=0A=
      pins =3D "AC14";=0A=
      drive-strength =3D <8>;=0A=
  };=0A=
=0A=
In this case, applying pin configuration at the group level would affect=0A=
all pins in the group, which is not desirable. Allowing per-pin=0A=
configuration via `pins` is therefore necessary.=0A=
=0A=
For this reason, `groups` is used for mux selection, while `pins` is=0A=
required to express per-pin configuration where needed.=0A=
=0A=
Thanks=0A=
Billy Tsai=

