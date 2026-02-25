Return-Path: <linux-gpio+bounces-32189-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WM//D0U3n2m5ZQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32189-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 18:54:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E49B19BD0F
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 18:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A7FD30390B0
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 17:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4716A3ECBE8;
	Wed, 25 Feb 2026 17:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K3SPTGNd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012026.outbound.protection.outlook.com [52.101.66.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F80126ED59;
	Wed, 25 Feb 2026 17:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772042048; cv=fail; b=OYMXnKsDMLn5GeBXXZQY6sjwoheFQnd73/BxSVZoZN2RiTQtEcJKCHP9n/OU08z/4k3cqWZmzatsOZukdFctZbdWWiA71cEHl9s1Ov7S0StSere14BPGoTG/Oe2WKHi7HiqmH+UqzC/GD5D5Ee5kfkSn+qSy8E/beCkUrt788M4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772042048; c=relaxed/simple;
	bh=AV35Ti8nrGpbfO/+ioRREscgkRFu+y/TWa4hOfidllk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jMSdaNhULz5L0JLczQCD9Y+RSnXGDF/khi4bM93hf9/cdMvfqU0clXXXZY/9x2kdSgepZeaS3e5qpTi+WPt9W+T62BRBcFskk5oWPsPqWGtJ23rgvf3je+VWZr5rko04gSvIICmWmbAin5bxYuhG3ygX/MhtQ/Os18vQZKjKkxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K3SPTGNd; arc=fail smtp.client-ip=52.101.66.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEb9POyIF51cCGIAy5BWUQybD1w8DsUoR3swvbA1G2URUh0iQe70lFVU/dC7pDBdfbqa17xIHHcUwNrvJq31ygJGFtQYeouZGuYjXw3d3LrGOOAF1DquKEAomZ3rFfCTrpmXSXZ+ajN8E6LVViziIUSjElRMSuJnVaIa/5Cotlrawm04/TP+2EVXAdrJt5G2oOVFpD2sAlVIyaBCkt3QW4XuWWunewprDnzi0bh8i43G2oVWHZgARSEcV6YayxjBbG7TP5KYXyPN+5qc0c3QKBv7/XTrSaNLcOAsdM7IsNntv9sj2dmSOtB0LJjRCy8JP7E+VHTbQYVKcuuYbjt+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AV35Ti8nrGpbfO/+ioRREscgkRFu+y/TWa4hOfidllk=;
 b=UN8518fsKG2OX7Ayx/6euDVNeWZn0mnoWgd6w5lFPdqW3/lTDKRc2VHxnmVk1TXYtDIzOVSLQ7JFKn9+/guGsYPjbCCDl8HVZrjgoURBlThWl6U5Sr8D74Co60gktAQ2JIcFWoZcvKzADXtU/ZLgkzT1exGLEsvzf7ScL9exG7VLc4V4DCk0/AzDpvBSdQQ6mgF2GOme4rxNvycSLf59+H2UYGxpYrbWo9o/xa6GDhRtUSuzTUu5qSbTxbck/SSVC+yolvj9BDDbgJp3lK0OawiHccELDmSrYyms5LvVqiBS9/BYH6K2RA1AHrArE7L6DAPrcmCeVD1lsghktwyV4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV35Ti8nrGpbfO/+ioRREscgkRFu+y/TWa4hOfidllk=;
 b=K3SPTGNde1CyHnuUy/SBRUjusKYCeT4oXMNcsiqb8L6swo3yG0kwSEZ/6eV5HMLxZLRVJogqUZngwlrHHK+LdBWO0NXQoOC6a31I1cfCdRxxwHIvFoWtA3P/Z02xkwMM1CWHupGMzWtZEWF0AfsQEuREcU7Mz99UfHmMbzUcGK3at0Dn+/6FRG/XHNk1Ks+GXjx3FJpVadT27rKp+gm59zydq2yQxnWd8DcNMH3th8jXQmUdbwK66FLBEhNrP9y8pub1j0hmpVWazasBZ/lHsEBlsMbe3Uzuno3sp+Aj7TywTMBcQcSuebg3Rr4eR+mmoCMLouBVlsiUrH3AL3lnbw==
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by VI0PR04MB10164.eurprd04.prod.outlook.com (2603:10a6:800:243::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 17:54:01 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 17:54:00 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Arnaud POULIQUEN
	<arnaud.pouliquen@foss.st.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcpn+4JcX/ljIUHEqcgkqHkfnngQ==
Date: Wed, 25 Feb 2026 17:54:00 +0000
Message-ID:
 <AS8PR04MB917652D63DB090D22129D3D78975A@AS8PR04MB9176.eurprd04.prod.outlook.com>
References:
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
 <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com>
 <PAXPR04MB91851D3DA6A92669CB5926A18974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkw-8ERXy3v8Sv55Cpq=+41Toez3EjLMbENAkavvr8STeQ@mail.gmail.com>
 <PAXPR04MB9185B68BC640D940534E44098974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <d4c8f7dd-c0a8-4721-9750-47429637d8c1@lunn.ch>
 <PAXPR04MB9185BB6443B9E1E407F409D68974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <ndozoc6qdrpv3xuktumsah56im5rbtg6iwerq3xi2xkcuyewpx@szswqvojleg3>
In-Reply-To: <ndozoc6qdrpv3xuktumsah56im5rbtg6iwerq3xi2xkcuyewpx@szswqvojleg3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9176:EE_|VI0PR04MB10164:EE_
x-ms-office365-filtering-correlation-id: a7a1bddf-c4f0-4c96-0eca-08de7496db6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|38070700021;
x-microsoft-antispam-message-info:
 f4JLDKIVrxBJOc8LKUAxlb8gn53F2xSxT/nZvON++hIWSwBKpc8DaVriFhnoHYFdKbq9vufWtZPzWJvdwG9CW4gx6tK262S2V5Gu85GrzZLZENU9TzWIbup5rbywRRdLyVkikWIRWGFrhYuo9zon3RFTaaHq+wLJcwfZl4Kr/OWpC3vpt82/t3KMXZeGYeiBALMbTXmHpphj7QPG2PT4egrVD/dY3+T/nLthj/ts9NWDtTFX0blMbGd+CmaZiGWSEJ3TpvKaO86jjUwxQO6QHaPCAaMiT6DuUPRKLo987lXSUY8jcl5Nkokyo5yRtLsNA8FePxMr1obPQBBYrOV3jbCeWjkzvjW+ERBM1p1eyL+oSImwqoC2rP+kWAimmsii8SfYTY8RpAwNKdiGSXkqVSQQl+Xy2XJuGKmc2QFTJ85iS4XptWxbtzWVcAW5r7fpp0ya0dIjl8eh2zfrxDfhh80MtSSopJaRtPEghClrdEqFWSWoqNLFRVeSQgm5VR5zDE3gO7V3gL2XtbWxCllvvjjKPDNgQFhWe38RG5S0Icf4v8F+GpB208UF2thFOjYEAh5BalvewbTePrImh1D98VUFPGN+onB7KkPbzA68v8T95OM1sAKeHdfir8qgw8CRUF4WBd4k3BtEsjuAP5xPr/EhG804Hc9sZjUlRR8FlYBggpf0SLQn3iEwWLyhZ2UAFrm7+mEqW7k2Kb46DxTIul6siZY0faxKilIBfLxygADfQ+ERTBzDQz5KhlY+Wcaq6oN9ToBeKfzILvmsU7UPf0eesgYcgjufqdMLFx/X/pU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ekxmKzR4Z0gzQTRpdVdjSUo3c1Y4dkphQlRmZXl4cUU3KzVUSFRGTnMxa1pC?=
 =?utf-8?B?YkFoeGNMMUJSV2xyNzN5MFZFZjVZVlQ2SFkvVS9hdmhlcU8xSWhwaEJ0T3dK?=
 =?utf-8?B?NmpEbExhS3libmkyVXZ5ckJuMWlidTd3eGRZZG1iU1JzZ0ZIUzRteTBzNjBL?=
 =?utf-8?B?dnhzOXRWVEkrZEkwSnFURE1OR1loSDlReWtpWE04dlEvK1hLRnA3OXhEZ1RQ?=
 =?utf-8?B?eWdpaUxJU3ZmUXl1S3BoRVBIb0hYU1R0RmJQc2h3VmRRVlpGSHI5WmxGeUE3?=
 =?utf-8?B?T1h4a3ptS1o5K2VSblRRTTEva1phT0RNbUxidlVTU3YxWjRhWEFkb3dMSDBt?=
 =?utf-8?B?S09LS0NHUEMzRDZOUEtFVFdxcGRQQ2QzaTJyVHJTM3ZzRXR2QjVVbi9Jb1Mr?=
 =?utf-8?B?cCs5Wlg5U3k3d1p6YTMyVG9vdSttR05ia2c1QXhHTHR6ZGxZMktUMmp1bVRi?=
 =?utf-8?B?M1JpNlY2UjVQWFE0YlUxbWFPM2VrbXpWUkZJYmtKOUwyTWJPR2hFTDdRMis3?=
 =?utf-8?B?SGhQMlMyVndZRnFOeDk0MnhmbDYvbCtpcXFBQlpnM2pSZTV0OUtmQUVwUTFl?=
 =?utf-8?B?cWQrNmszRmR1SU9RUDA3MWtDME1oeWtlUEVjQ1kvQk5FMTh5U2hLUVpINkU3?=
 =?utf-8?B?ZnhvWjVkcEx5SThFNkV6YlNNWitaWXRqZ09kR0pPSnQrRVZSZllzeStkaTdE?=
 =?utf-8?B?SytGd0dOSk5xTkJBVGQxN1lyZVlTTUFWSGdPUy9adDNiTkdnWVJJY3o0TEp5?=
 =?utf-8?B?Q2ZXTVI5OWRkWWhDRThta25NMEovU1RoaElnTXdOQnd1ZXhCc3lmZytwbWdW?=
 =?utf-8?B?RnB3a3FoSlFLbStVSEVlSWdmVENkTkt3Ulp5UGY2NklwMkNMeUNvUUlMMXcw?=
 =?utf-8?B?M012WnRFbEp6TVNCV2cwNW9jbGdPZzMvTGVvdmVJVUlCd1JWb21NVE9DR3dq?=
 =?utf-8?B?SVRrQURHUjdESEp1U0NHZ1FoZXEyRDQ3d2JNV3oyKy9sZm1YcGRSSXpuSDFX?=
 =?utf-8?B?a0VRdEpUT3RjVm16ODBiRnBhM2RQSVZIcmtjTjNPbmEzWGdVVi9mcEF1OTV5?=
 =?utf-8?B?NGxPa1EvN3B0UjE3TG14ZzdQMm5SUHhSdTZ5Mk5reXlwM1dFYU1Va0ZGSHdF?=
 =?utf-8?B?dGpmUFZPM3lhSGZ1L1lDOWdHajFtSjhPZEthNkljWU9VZnRZWndQN0Z4ZU9H?=
 =?utf-8?B?dTFRaXo4eE9QT0RYN3lCeUZSQ3FlbWZVeVFuWi9ySG10RDhFeUtjYmZNRkU2?=
 =?utf-8?B?UGM2S3ZNNFZnd0htYks4YVpWa0FxRjltTnpGY01yYVJIRVFvVVk1TlVvM3NW?=
 =?utf-8?B?RTM0VHlMa3UrdktGalowd3NCOVF4QVNZM3RGUjBad0FrN3FqbjhBK3UyY1dY?=
 =?utf-8?B?cFM1L2VKNWIyWVE4SlZqWm5ENE53NlMxUk5FdFpLOFBYT1Fia092QjhiR3NY?=
 =?utf-8?B?UVY3dmJoKzZRV3hvZUtzRSt3cUQ4cFFUc2xzT0pRYytBcEdoUUd1V25tL2ZO?=
 =?utf-8?B?RThGU1NqQ3YzT0tSVkMwcnNjbFduTERIMWMzb3lobDRvTTB6UVRVZkdpNFh4?=
 =?utf-8?B?OU5hVjN6dU1JNlArdnpGV3N3N2xpSkdUU0szYSswOVltRXJ1V250bUJrZWNU?=
 =?utf-8?B?Z1R4RENlZ0JPMTBNRWxOeHd0OUJTTHZrdE5mV1dwVkJVWUJ2Z3pldEJ3RlJ2?=
 =?utf-8?B?aEsyTUkrbklQdk1KaG9xeFVndklVZVQySTRGYW80cHY5NXpMYVhabWZjQnNa?=
 =?utf-8?B?VVZveG9QODFEck9vRnFsbkNKRCtHQXBvTFZIZlg4UFM5TUI4UG1SOTBXRG1J?=
 =?utf-8?B?Y2Nra2NVN1pRajY4NUJOSklEVmZjM0d0MTBUeUttT2dwdlF1UVY5c0FWMFNP?=
 =?utf-8?B?Vm5Va1BFL2d1VEUwZU84eGgzMWhBR2g2QXFaT01MTis4YTFiQkdMWVhoQXJH?=
 =?utf-8?B?Z1JMbnMrNjArNy8xUG9VUCtKMDRVSS9kZVFoaFBrelBqWFNoUHhkT3hudWor?=
 =?utf-8?B?WG53VlhBWkNhb29lNFZlQVpZNkFpWFB5cjZHdUJ1VlVmUjlUSlJ0eDhBd0Zq?=
 =?utf-8?B?Y21mTFBpUjA3ZU43aTJqVDlqQkN2TCtZK2ZvRkdHUWZkZ1oxSEI3czE4ZVNv?=
 =?utf-8?B?S05GdjRyRDNUMVlQOVVBbFI2bmhQSFJFNFVHNEJLbTB1NTdkM28vUy81NE1Y?=
 =?utf-8?B?YWx1MjhoRjM5UFNyKzZVbXpUYzJLdEpqdFpOUDIzeHhHLzFWMDQwKzBXVDRX?=
 =?utf-8?B?M1VPbG5oTGd5UDhSNmNXalB5Z1V6RWdDVGNmOWlwUDBURWlPSTBYSkN2bGt3?=
 =?utf-8?Q?LnhK3R8acwCjoLhfOJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a1bddf-c4f0-4c96-0eca-08de7496db6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 17:54:00.7869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gUg92/VIRLwyWQH1y/hAte9MuEHzAGJOoq7qY0Lo9HgzN+KobJWe8Pk98em3Qfem7M7/4PoV9QgogMkASBchZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10164
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32189-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,linaro.org,foss.st.com,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.969];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E49B19BD0F
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmpvcm4gQW5kZXJzc29u
IDxhbmRlcnNzb25Aa2VybmVsLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyNSwg
MjAyNiA5OjUzIEFNDQo+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPg0K
PiBDYzogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPjsgTWF0aGlldSBQb2lyaWVyDQo+IDxt
YXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz47IEFybmF1ZCBQT1VMSVFVRU4NCj4gPGFybmF1ZC5w
b3VsaXF1ZW5AZm9zcy5zdC5jb20+OyBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz47
IEJhcnRvc3oNCj4gR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz47IEpvbmF0aGFuIENvcmJl
dCA8Y29yYmV0QGx3bi5uZXQ+OyBSb2IgSGVycmluZw0KPiA8cm9iaEBrZXJuZWwub3JnPjsgS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5DQo+IDxj
b25vcitkdEBrZXJuZWwub3JnPjsgRnJhbmsgTGkgPGZyYW5rLmxpQG54cC5jb20+OyBTYXNjaGEg
SGF1ZXINCj4gPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+OyBTaHVhaCBLaGFuIDxza2hhbkBsaW51
eGZvdW5kYXRpb24ub3JnPjsgbGludXgtDQo+IGdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC1k
b2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBQZW5n
dXRyb25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZh
bQ0KPiA8ZmVzdGV2YW1AZ21haWwuY29tPjsgUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+Ow0K
PiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtcmVtb3RlcHJvY0B2Z2VyLmtlcm5l
bC5vcmc7DQo+IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC0NCj4gaW14QG54cC5jb20+OyBCYXJ0b3N6
IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENI
IHY4IDMvNF0gZ3BpbzogcnBtc2c6IGFkZCBnZW5lcmljIHJwbXNnIEdQSU8gZHJpdmVyDQo+IE9u
IFR1ZSwgRmViIDI0LCAyMDI2IGF0IDEwOjQzOjA2UE0gKzAwMDAsIFNoZW53ZWkgV2FuZyB3cm90
ZToNCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJv
bTogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPg0KPiA+ID4gU2VudDogVHVlc2RheSwgRmVi
cnVhcnkgMjQsIDIwMjYgNDoxNSBQTQ0KPiA+ID4gVG86IFNoZW53ZWkgV2FuZyA8c2hlbndlaS53
YW5nQG54cC5jb20+DQo+ID4gPiBDYzogTWF0aGlldSBQb2lyaWVyIDxtYXRoaWV1LnBvaXJpZXJA
bGluYXJvLm9yZz47IEJqb3JuIEFuZGVyc3Nvbg0KPiA+ID4gPGFuZGVyc3NvbkBrZXJuZWwub3Jn
PjsgQXJuYXVkIFBPVUxJUVVFTg0KPiA+ID4gPGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20+
OyBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz47DQo+ID4gPiBCYXJ0b3N6IEdvbGFz
emV3c2tpIDxicmdsQGtlcm5lbC5vcmc+OyBKb25hdGhhbiBDb3JiZXQNCj4gPiA+IDxjb3JiZXRA
bHduLm5ldD47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93
c2tpDQo+ID4gPiA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBr
ZXJuZWwub3JnPjsgRnJhbmsgTGkNCj4gPiA+IDxmcmFuay5saUBueHAuY29tPjsgU2FzY2hhIEhh
dWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgU2h1YWgNCj4gPiA+IEtoYW4gPHNraGFuQGxp
bnV4Zm91bmRhdGlvbi5vcmc+OyBsaW51eC0gZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBs
aW51eC1kb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBQ
ZW5ndXRyb25peA0KPiA+ID4gS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZh
YmlvIEVzdGV2YW0NCj4gPiA+IDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBQZW5nIEZhbiA8cGVuZy5m
YW5AbnhwLmNvbT47DQo+ID4gPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtcmVt
b3RlcHJvY0B2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBpbXhAbGlzdHMubGludXguZGV2OyBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+ID4gPiBkbC1saW51eC1pbXggPGxp
bnV4LSBpbXhAbnhwLmNvbT47IEJhcnRvc3ogR29sYXN6ZXdza2kNCj4gPiA+IDxicmdsQGJnZGV2
LnBsPg0KPiA+ID4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2OCAzLzRdIGdwaW86IHJwbXNn
OiBhZGQgZ2VuZXJpYyBycG1zZw0KPiA+ID4gR1BJTyBkcml2ZXINCj4gPiA+ID4gUGxlYXNlIGV4
cGxhaW4gaG93IHlvdSB3b3VsZCBkZXNpZ24geW91ciBnZW5lcmljIHJwbXNnLWdwaW8gZHJpdmVy
DQo+ID4gPiA+IHdoaWNoIGlzIGRlcml2ZWQgRnJvbSBncGlvLXZpcnRpbz8NCj4gPiA+DQo+ID4g
PiBXZSBoYXZlIGFscmVhZHkgc2VlbiB0aGUgdmlydGlvIGNvbW1hbmRzIGFyZSBwcmV0dHkgbXVj
aCBpZGVudGljYWwNCj4gPiA+IHRvIHdoYXQgaSBzdWdnZXN0ZWQuDQo+ID4gPg0KPiA+ID4gWW91
IGNvdWxkIGp1c3QgcmVwbGFjZSB2aXJ0cXVldWVfYWRkX3NncygpIHdpdGggcnBtc2dfc2VuZHRv
KCkgYW5kDQo+ID4gPiByZWltcGxlbWVudA0KPiA+ID4gdmlydGlvX2dwaW9fcmVxdWVzdF92cSgp
IHRvIGJlIHRoZSBjYWxsYmFjayByZWdpc3RlcmVkIHdpdGgNCj4gcnBtc2dfY3JlYXRlX2VwdCgp
Lg0KPiA+ID4gVGhlIHJlc3Qgb2YgYmFzaWMgR1BJTyBoYW5kbGluZyBzaG91bGQgbm90IG5lZWQg
YW55IGNoYW5nZXMgYXQgYWxsLg0KPiA+ID4NCj4gPg0KPiA+IENyZWF0aW5nIGVuZHBvaW50cyBh
bmQgY2FsbGluZyBycG1zZ19zZW5kdG8oKSBpcyBvbmx5IGEgc21hbGwgcGFydCBvZg0KPiA+IHRo
ZSBwaWN0dXJlLiBZb3UgYWxzbyBuZWVkIHRvIG1hbmFnZSB0aGUgc2VydmljZSBhbm5vdW5jZW1l
bnQgZnJvbSB0aGUNCj4gPiByZW1vdGUgc2lkZSBhbmQgaGFuZGxlIGFzeW5jaHJvbm91cyBub3Rp
ZmljYXRpb24gbWVzc2FnZXMuIFRoYXQgZW50aXJlDQo+ID4gZmxvdyBpcyBhbHJlYWR5IGltcGxl
bWVudGVkIGluIHRoZSBleGlzdGluZyB2aXJ0aW9fcnBtc2dfYnVzIGRyaXZlci4NCj4gPiBSZeKA
kWltcGxlbWVudGluZyB0aG9zZSBwaWVjZXMganVzdCB0byBtaW1pYyBncGlv4oCRdmlydGlvIG92
ZXIgUlBNU0cgd291bGQNCj4gZXNzZW50aWFsbHkgbWVhbiByZWludmVudGluZyB0aGUgd2hlZWwg
d2l0aG91dCBhbnkgcmVhbCBiZW5lZml0Lg0KPiA+DQo+IA0KPiBJIGNhbiBhYnNvbHV0ZWx5IHNl
ZSBhIGJlbmVmaXQgdG8gdGhpcywgdGhlcmUgYXJlIG11bHRpcGxlIGRpZmZlcmVudCBycG1zZyBi
YWNrZW5kcw0KPiBzdXBwb3J0ZWQgaW4gTGludXgsIHNvIGEgZ3Bpby1ycG1zZyBkcml2ZXIgY291
bGQgYmUgdXNlZCBieSBhbnkgb25lIG9mIHRoZW0uDQo+IA0KPiBJIGRvbid0IHNlZSB0aGlzIHRv
IGJlIGEgY2FzZSBvZiAicmVpbnZlbnRpbmcgdGhlIHdoZWVsIi4gSW5zdGVhZCB3ZSBjb3B5IHdo
YXQNCj4gbG9va3MgdG8gYmUgYSB2ZXJ5IGZ1bmN0aW9uYWwgd2hlZWwgYW5kIG1ha2UgaXQgZml0
IHJwbXNnLg0KPiBUaGlzIHdpbGwgcmVzdWx0IGluIHNvbWUgImR1cGxpY2F0aW9uIiwgYnV0IHJw
bXNnIGFscmVhZHkgcHJvdmlkZSB0aGUgbGlmZSBjeWNsZQ0KPiBtYW5hZ2VtZW50IGFuZCBoYXMg
YSBjbGVhbiBzZW5kL2NhbGxiYWNrIGludGVyZmFjZSwgc28gdGhlcmUgc2hvdWxkbid0IGJlIGFu
eQ0KPiBpbnZlbnRpbmcuLi4NCj4gDQoNCkludGVyZXN0aW5nIOKAlCBjb3VsZCB5b3Ugd2FsayBt
ZSB0aHJvdWdoIGhvdyB5b3XigJlkIHN0cnVjdHVyZSB0aGUgZHJpdmVyIHdpdGggdGhlIG5ldyAN
CnByb3Bvc2FsPyBJ4oCZZCBsaWtlIHRvIHNlZSBob3cgeW91IHdvdWxkIGxheWVyIGl0IGNvbmNl
cHR1YWxseS4NCg0KVGhlIGN1cnJlbnQgUlBNU0cgc29sdXRpb246DQoNCiAgICAgT24gUmVtb3Rl
cHJjICAgICAgICAgICAgICAgICAgICAgIE9uIExpbnV4DQpHUElPcyAtPiBSUE1TRyAtPiBWSVJU
SU8gPT0gVklSVElPIC0+IFJQTVNHIC0+IEdQSU8tUlBNU0cgZHJpdmVycw0KDQpUaGUgVklSVElP
IHNvbHV0aW9uOg0KDQogICAgIE9uIFJlbW90ZXByYyAgICAgICAgICAgICAgICAgICAgIE9uIExp
bnV4DQogICAgICAgICAgR1BJTyAtPiBWSVJUSU8gPT0gVklSVElPIC0+IEdQSU8tVklSVElPIGRy
aXZlcg0KDQpZb3VyIHByb3Bvc2FsOg0KDQogICAgIE9uIFJlbW90ZXByYyAgICAgICAgICAgICAg
ICAgICAgIE9uIExpbnV4DQpHUElPcyAtPiBSUE1TRyAtPiBWSVJUSU8gPT0gVklSVElPIC0+ID8/
Pw0KDQpUaGFua3MsDQpTaGVud2VpDQoNCj4gU2ltaWxhcmx5LCBJJ20gZ3Vlc3NpbmcgdGhhdCB0
aGVyZSdzIGEgZmlybXdhcmUtc2lkZSBpbXBsZW1lbnRhdGlvbiBvZiB2aXJ0aW8tZ3Bpbw0KPiBp
biBaZXBoeXIsIGl0IHNob3VsZCBiZSBzdHJhaWdodGZvcndhcmQgdG8gdHJhbnNwbGFudCB0aGlz
IHRvIHRoZSBycG1zZyBpbnRlcmZhY2UuDQo+IA0KPiBSZWdhcmRzLA0KPiBCam9ybg0KPiANCj4g
PiBUaGFua3MsDQo+ID4gU2hlbndlaQ0KPiA+DQo+ID4gPiBJbnRlcnJ1cHQgc3VwcG9ydCBkb2Vz
IGhvd2V2ZXIgbmVlZCBzb21lIGNoYW5nZXMuIFRoZQ0KPiA+ID4gdmlydGlvX2dwaW9fcmVxdWVz
dF92cSgpIHJlcGxhY2VtZW50IHdvdWxkIG5lZWQgdG8gc2VlIGlmIHRoZQ0KPiA+ID4gcmVjZWl2
ZWQgbWVzc2FnZSBpbmRpY2F0ZXMgYW4gaW50ZXJydXB0IGFuZCBjYWxsIHRoZSBlcXVpdmFsZW50
IG9mDQo+ID4gPiB2aXJ0aW9fZ3Bpb19ldmVudF92cSgpLCBzaW5jZSBycG1zZyBkb2VzIG5vdCBo
YXZlIGEgc2VwYXJhdGUgbWVjaGFuaXNtIHRvDQo+IGRlbGl2ZXIgaW50ZXJydXB0cywgdW5saWtl
IHJwbXNnLg0KPiA+ID4NCj4gPiA+IEF0IGEgZ3Vlc3MsIDkwJSBvZiB0aGUgY29kZSB3b3VsZCBz
dGF5IHRoZSBzYW1lPw0KPiA+ID4NCj4gPiA+ICAgIEFuZHJldw0K

