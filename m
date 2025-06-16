Return-Path: <linux-gpio+bounces-21610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A544ADA630
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 04:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AA163A7593
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 02:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD65214A4F9;
	Mon, 16 Jun 2025 02:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="oWlLOnMR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2099.outbound.protection.outlook.com [40.107.92.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC013594C;
	Mon, 16 Jun 2025 02:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750039788; cv=fail; b=u4xm+m6NUEun63OQ2pwDewB7TJNleS/c0WEdwWUS+gSVPprtiErB79qQqE+P1LCxaODDHN7ZUTHkGmXbbArfRm2l4qcdMd4TxUlZRId/ncLUgB/UW29hTy312ZoYmCONfrKBjA5WntEwYqkmqzE/QneoyJ3cI2LFT8+8xuvvcCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750039788; c=relaxed/simple;
	bh=tuqkjYRAPSl5a9pVl1yDCU01If5YSe4237FHtHfNPW4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WhLg74pZkeTE2K3wZe37J/rwNCK16t1RcelsAHSk8NlJADZs6xPIH4ucDpiK580lyDxJpUo3iaflQ4AXIqRjJaNZsYubV5Cqf/ionePa9VIQmBnr65BCwy3nyZvSmAaqrWcbFM1lW93dbGC+R4BvbCeURTqXIg3LLyW9P0cxH1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=oWlLOnMR; arc=fail smtp.client-ip=40.107.92.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iinXnb6ewJ5KVTiY4dEObtlhCEPfBBk10F0hZF+IxwhqfLDjfVIgcOeS0C4mcS52lBn5z6g6CgbAdf79qjXO2fq5rNF6a6MfHF1Lwz5mwNT0RFayCdB4vJHb+ZS4BiHmdmmB9fp+iMIvEU0rfRWf55Fw9gdLYY1fBGX9pFMsH6E1PtbCUSS8qm29Iqchx9pmxxLEbN6v24+RKXhqE3RXPR/SSiBlaOh5Mj2Mcs4ZxR54LYQNG7/SMwtmpoeqYWieB8mwdzL3tF8xsEcepkhS52kb38s5YSyEBG6o56Zuvd95MSM6NVmkuSgS0G7EwWsUnuqLZ7uY6oOEDueb0UkOvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuqkjYRAPSl5a9pVl1yDCU01If5YSe4237FHtHfNPW4=;
 b=qre2Dpx8CGQbO4mFPu1MbzpI1Y9dqnQqSxuBT+4ytFBJGH2keVj1cRygy8ytMyrK6jQup83SStJJgR7F8ewq8UapziSMHHFtI2wyFLcFWGt3IYKWK/NQO9j2JT0Wt0jMKA+CRa1XY3y7mbcWXTPnO1JQqjgYq0tsLZaxLg4sxT+ABJKlKW8bDu4WaR4GRXZI2+JGO2D7KXi4r1/iowtbVgH4Lb3mGx/Z6RIl+x51ZdlYLDvKm6ZShO+tnDJRAVvXcHqLJ02ZIfO+zGadDDy8Wb7+3fzpYK28jFbFVPd5b2P7gGz9/lfmUy89oEqYiQ41H0ZHkzVPhZReGlrybF6f5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuqkjYRAPSl5a9pVl1yDCU01If5YSe4237FHtHfNPW4=;
 b=oWlLOnMRTRy7kvUK813n05zPI/dzgf3v8POZXSYM2pdO60UXMxiK8z14BmUs+q9G4xxEhoaYheuz6Mddy5FBAw+LtJuzp+p1XF3+PKGCtRVUD0qKTGtqKsrW0aCVnh3C+n83ChXbqDe5AzpaFibgszuhlEAz58XhKeM8J23q7kHfO1dPJsNHzy2pZYG6x7+ht+s+Lr+2zKuiktwwNXVtq1tkIphhw5kM8Pf2Tpka1B4xdbWV/gjn2kXmB7SNIUNqtvu90n7pC9WlWxmuQQnqv3MrBYbGdTPCEfbxGA7zYPLx/09OE8WEa9LTaLOdE9xm5OMMZWtFsDwE99zCbXrDzg==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by CH4PR18MB6140.namprd18.prod.outlook.com
 (2603:10b6:610:228::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Mon, 16 Jun
 2025 02:09:43 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8769.031; Mon, 16 Jun 2025
 02:09:42 +0000
From: Harshit Shah <hshah@axiado.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/6] dt-bindings: gpio: gpio-cdns: convert to YAML
Thread-Topic: [PATCH 3/6] dt-bindings: gpio: gpio-cdns: convert to YAML
Thread-Index: AQHb3ZKw8W+lAWOWJUGyIStI3BwOqLQDhqWAgAGFfGg=
Date: Mon, 16 Jun 2025 02:09:42 +0000
Message-ID:
 <IA0PPFBEC4B1F8E15CB49F4696E860FCC97D570A@IA0PPFBEC4B1F8E.namprd18.prod.outlook.com>
References:
 <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com>
 <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-3-327ab344c16d@axiado.com>
 <174995610418.3364372.5364960681855010915.robh@kernel.org>
In-Reply-To: <174995610418.3364372.5364960681855010915.robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|CH4PR18MB6140:EE_
x-ms-office365-filtering-correlation-id: ed0d838b-3a83-4d38-a15f-08ddac7adbbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?TdWbj6S6f+H1ksYvumZ0tBcH6v3pLxmeX9N47DVCqmywWZmlAlZIgahv6q?=
 =?iso-8859-1?Q?GPmmlO3VtzB6REaUxptde9pontql6ypmAPGeDyDBtm7QHP97r0vnSP4DJf?=
 =?iso-8859-1?Q?2NyVyTKIBBrHqvYXeKwmCp9p3hH4YmKZaIfUrBgZBV/4WhaSfdG81yDHWl?=
 =?iso-8859-1?Q?+FR3sYxT3kZA2AMoNYwiK0ZseRFLxQVNzMQFTC2NTmCAdCfn8gKwO3+1u4?=
 =?iso-8859-1?Q?G48iMr7bptwC7IYKZMGJftTa4/dbbT3iFnyA7Uh4Pgfl1dpqsCi/3DHDX5?=
 =?iso-8859-1?Q?y4Xh279mTzADK4pQICa414U8eiUM3mC7Gg5k1X4p9OkJmpqCiD+ZlMlwmP?=
 =?iso-8859-1?Q?RVJhw7xuwCs1ajcPqOy+ysxEa/Mmu+9o4RmXmX3jcIW9UyLb6nYj0tNl64?=
 =?iso-8859-1?Q?kopze5npcCNpAnKDABEHnadFAGC8VztSDnOP5o5tv5JmIRvmXH8f96noKg?=
 =?iso-8859-1?Q?KHvrcynErJwvyZ8vQuMp4aB27EhVURI3eKo5BipYxLGkxsio2X2hnE+qtS?=
 =?iso-8859-1?Q?tv7w6Ojck0DqTTpDSF96l+b8QRaGsqkASIrsLqKbwfgGmbdYI2a87iERWy?=
 =?iso-8859-1?Q?d+Q5+bi3B7gduVCm6Q56nfHhimNMizZnoR8+8DyEfgqF4RrZqBhFsvek+y?=
 =?iso-8859-1?Q?H0LK8LKJ0JFG8q2byaOuG1hBAvwMaM/UiCrV31K64h9fAO3fGfQ2w59yPH?=
 =?iso-8859-1?Q?ImY2cYKxOqNwx/Q/XN8k2Nukt3fiLoLOdBNJqVwRPOVt8+lUlGGWh4bWzb?=
 =?iso-8859-1?Q?snaV82lxhlpTpgK9NBTdfSSpHkgMp8mcuC2tFJlaMVV3UnQWoyeZUcjKFy?=
 =?iso-8859-1?Q?7xOo+WO8fY1TuG+3ht3Qc1NJDEZIPcsJDmX+hJMFnS70u462HXGChN0w2k?=
 =?iso-8859-1?Q?d81IGToWJwBqQ9SAZhaW54PVSomg/Ia/qbf+wCLerVqvnK09xgJDoHhO1m?=
 =?iso-8859-1?Q?gUm1L9bkavN7omuRfgZUwFZzeEOjW4f4avSbkS8zg/vpdd7LP1AwYMEVJd?=
 =?iso-8859-1?Q?2sVFibdkPryCICqippcSagnmedttbVO1rs3PDl5Yu2q9ZckESnqAuA6g8U?=
 =?iso-8859-1?Q?p/b8r7VC3ibX4mCOKrgHpZvTRRJxBnKUguIa1MTWlWrNTM1A7eQMSyIeY+?=
 =?iso-8859-1?Q?kmW+LN3ebOHAra/9F5D3Gf0Qalc87f5syUk3AbWf3nkyvfY9p561B6JU8T?=
 =?iso-8859-1?Q?7kcBmWutjhU5cvkoh9uSN2bwGYlTcXmzEiVQRDjrizygY+mqBd+2CZ/25c?=
 =?iso-8859-1?Q?cuosn4uuP5XSSpMD7IgXj+TIGM4cvBaOXDNgrZS0pF3/yRpfNDQrXK8GQz?=
 =?iso-8859-1?Q?o20CruP5Y+ADBJ5CnBBA8OjEMHZLRP2cmX6YjuGIcmT+4RkPZIdrTA3pb0?=
 =?iso-8859-1?Q?l2la4gqWZLXqD2uPVQVhtjhrZiRLwwsLEOJb51c4zq55LUSHPYB9ciwIbB?=
 =?iso-8859-1?Q?tU1SCdXcRZKqr8aDRGv4/kWQ5h+HFVmnVYZ72aeeCNbKGfdn8QHPTEuxRY?=
 =?iso-8859-1?Q?JeSkusWOiRcaOEJTSTNor3zui3t4B6R6MUXemPCsrACg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ccERSNWthzZSTWufNFoqqgUwQuf6KlvRZMJriiIYW3sBBpkeycK4oyW/6b?=
 =?iso-8859-1?Q?z1h6uoXXPd/higOvJ2pSUSKV4vFHf0XGJgRzV2HE/IqhzouW9C7qjAu0Wi?=
 =?iso-8859-1?Q?mgBudHSBSX1rwQLcwX2TQIw00uRF6/fiiTTAvmr8d4HhmuQmnL8VOXpAzS?=
 =?iso-8859-1?Q?gUWy6qMExqIYxULuk8JFYFbFM53XUl1+KyfvMcvX3KVr7jKDjg3bJeltY9?=
 =?iso-8859-1?Q?0PU2OJ9LyG0PepM2e+g/JEi6vFVXJeRXyLyDSxFaJcCj/r76EJcZn8gJwV?=
 =?iso-8859-1?Q?7ljxTPI7aCsxJVn914ENP1dBoSQquTFscPXJxINYBItsKgktyJPxAeFwW6?=
 =?iso-8859-1?Q?BWS5ntPAozwHVGG/msWuGXjPyfUekm7wb564xF9E2aBQZvkCpmIm3lrmq9?=
 =?iso-8859-1?Q?32gUFCP6/AcWPVTsFX9HTwOqgsOV47DyyhuXrKeFvzHDgzwb/nep01p7ah?=
 =?iso-8859-1?Q?HVgmREaDWb0dqlgn9Dv2H6rWTwwGEZkiiwHSBdXO4HW+DC1l1oal/BX0cm?=
 =?iso-8859-1?Q?/5WFCbO1BFx+qpzYHeV9pIPhiF9zoDqBiKcmuCdkGwV+7+ytdiXmAAg8Lw?=
 =?iso-8859-1?Q?mm+JKTPgK9gsXpN0QM4aXbkIePcvVyPqPCaxW6O9r75J8rk2qllKPIH3jX?=
 =?iso-8859-1?Q?CwyLd7A9L6B1FO7tRiXB5DjucKTozbysqDrUaH2paJhu8h4yQ0zOtbDRRb?=
 =?iso-8859-1?Q?990HWjeAyV3Y6oraZk7tq6+j7eCaiTq/6cdII8ZKrDWWWMJTpIkm3CbfxD?=
 =?iso-8859-1?Q?p43Qo34t5vMf1GB1CAUvEbY/+DFU49bwBLhSoq5dyNFqzb9kSSagB8uSY4?=
 =?iso-8859-1?Q?NxV4CyND0Ozl7QDYpVCjmoXEeKKUax8mJd9onKot6DZMiWe7IaXBsnzA43?=
 =?iso-8859-1?Q?msPKS3d9apoN8H9Qv/+eErIMkcvGTsrIn5LFzxIQFfr4e7qg71qci0eUHc?=
 =?iso-8859-1?Q?gFyyyFVDGn9mlgTrb7s+fETz3kr6os5pWK4DuF9EbCv/vF6+XA48dCGQrM?=
 =?iso-8859-1?Q?abUwpaHVDGTtVolkbKDGcwb70gXnDYLvf8en4R1PP9INa4uBbAlTEDXC97?=
 =?iso-8859-1?Q?fiO2iGryIwQOn4zhuvuzx2EmOoancPJWZp3VKyyYKxaiIBCmUgSQGTshJy?=
 =?iso-8859-1?Q?7Hp7XxtCLE+crvkkUMezuXczg/Qd+ZaiE6EsZKSsatwJnvgDij+VDOdEyX?=
 =?iso-8859-1?Q?LPnmYPa+Hqpc3/qxbuETL9bBQua/hZJQXdPnoS87u464AwMPoZyxE9/JjU?=
 =?iso-8859-1?Q?UrY+9Puhqa0B2YbBntdgzb1OyaL7Ca2sFddobIhvoqp44P+S+V2zdFe44q?=
 =?iso-8859-1?Q?sWAxLuYKYKAeUc2tS6cbvTqBP6YHu5SHoCQ6KqF7A8AoJe49Qgi3ZHq9zq?=
 =?iso-8859-1?Q?IjG+sWtRA3+n8c6BXjzVJeGJIXs4h3nqO6t+nPLXjnuM63YG3wLpwcppCN?=
 =?iso-8859-1?Q?BFpWYzRzcn+UM0LwEAEJYAJevZSITdlTJfzszcDelEfd0soBk/FIeftNb9?=
 =?iso-8859-1?Q?rFV9EPI/J5BifxiumTx64X8gBHA/6xEvC0UG0ij9Q56gY2R0WMSyBUMu7e?=
 =?iso-8859-1?Q?yGxa6lbnAJwTMfU9GTFB8JI1u0U5s60rITxc9VIL0KFa7LAmi5fW79cR93?=
 =?iso-8859-1?Q?92xuzwzf8Go2O3rwJHeOjSfCKtl1qj+CzO6v3V6hYB9DcOdC4J+12R1+XC?=
 =?iso-8859-1?Q?K89IZxQxXdvgLaqMLbg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0d838b-3a83-4d38-a15f-08ddac7adbbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 02:09:42.8502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DfullSC4y27ITSLaEqxKX8EEB0iA6iOQUu+5JKzAonjO6I7JqGgiNWdo85VOK6moKt4xTEbveOIUQIfz2/KaCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR18MB6140

=0A=
=0A=
> My bot found errors running 'make dt_binding_check' on your patch:=0A=
=0A=
Hi Rob,=0A=
=0A=
Thank you for the review.=0A=
=0A=
I have verified that the dt_binding_check is passing without errors. Howeve=
r, check_patch.pl is giving warning about the DT binding docs and includes.=
=0A=
=0A=
checkpatch.pl: dev/null:10: WARNING: DT binding docs and includes should be=
 a separate patch. See: Documentation/devicetree/bindings/submitting-patche=
s.rst=0A=
checkpatch.pl: Documentation/devicetree/bindings/gpio/gpio-cdns.yaml:-1: WA=
RNING: DT binding docs and includes should be a separate patch. See: Docume=
ntation/devicetree/bindings/submitting-patches.rst=0A=
=0A=
I am unsure about how to split files as suggested, could you please advise?=
 =0A=

