Return-Path: <linux-gpio+bounces-37797-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEZPMeuNHmodlAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37797-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 10:01:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 698DA62A0A3
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 10:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 30F0E3009CE0
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 08:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0893BB126;
	Tue,  2 Jun 2026 08:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fFkfbeDW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65591C8603;
	Tue,  2 Jun 2026 08:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387304; cv=fail; b=hIczlPgNiEznVVPclkuvtpcZF3UTGoP9YHM0SdZ0HCQaVKYdhNJZYsoVe4+CmSoNfrp5f3h8+wo5PIHCHGj1Y5LOp9rTq+0zrsFwxafvMIe5BlSu4D2N3Lpl3gV6mL9ZpXpIia1kEZdXbfOPqOPkb/ZlGDNkvHVwUmTNoic04rI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387304; c=relaxed/simple;
	bh=BzpyxT6yosecgttR/0D6vZmRISHQBF0ltDA94EJTVIg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=iqaED2iWtSHBs3xfz2+EEH0wfreY9GQ39hvc8WQOl40Uz9b5xmiNJ18MUFZ20S3fu4UaH9klpBsDPkf7TQmVleO8RRTLORj9BNGA2PhQHZdPZyqnHxfomvufxH++DD2jz47rqAV+IGjkYsCpqEqcKZFs9DTnzdLQ9b4XTdo+g1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fFkfbeDW; arc=fail smtp.client-ip=52.101.70.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDnv9p1N3WUvZnKD8jZ9OMTvtbrnYasES3a0fB27Ls9kqyDqSXBxPMWPFNsJ9k8jv1fPilUr82lWB3Ugdn7HqhJsAYeNRmCiOUpgk45rifOdBfataAJjghRrsiLEJZncZF2QbPdArP1PQQqqf8T+6CJoMbuYcozZ9Bzme/dWNJ+z2of5LBgQkAeYcybqSdXzOg4waNWLlfEGUFXcO0KAoph8F9Vnun34yiPyUSeuxKc7/sOgC2EKarvnitmf2yXkhgBEh6Kr52xqMCO/DS9PsYsNRAQcDqkUgnQmSvJ3al2DOUhgr1gAs6l8eXe8fgUtGLE+0ZkaccBcpu7H8zUhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYea9y1X5gO018LcGKVGFTyKxI0IYhdfQbQiPh3YVRg=;
 b=pN99fD508Try/i8TX64C+qa7C7YxnpYz+X1eSjoxbTzb+ztUILWUbldQ25yJjfU5Ruq/2hfqrHOEik4k/zMHJR+hYO+uQpf/y+UcvjoyWHvOR8npT3cluLu5+VGt/W5ncaJOgXvRmy1lDGqxajBIPu6cNp00Sd6zhiXHy8/jO0qVhJxzXBAKmsLxClhquaoXDHhCmoYijafaPMwW0Lu3Ag/WAAhLwqDPUhc4QilPlXM/gbyjP2ynLAQ8X9PfMF0gwj2FRUOUl9XK/i4fLLfsAPyq9iUbf43vHUYoeK2k233zsRH/i9gEwTnNSdOtnCscdaf6QIQEpXJmu/jBXUVGbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYea9y1X5gO018LcGKVGFTyKxI0IYhdfQbQiPh3YVRg=;
 b=fFkfbeDWdpqBiqehHRz0yeqOr3+hwIU5F+gBcppVGcGyWs21CTq61imh9P0n11UEcsAKCa9JS9KHYZnW4Rlvq2NNYEgGnEmXo22oQ+nQpZYXHEGISEblqbbaYGChh4t3/1tdO1XsT5Z2kA9mTRMIdgU2Vjfn2ojlGWwbtYGhjUxN8bUkIri5+EikOii5qzevgmLMBaK/eYvdXbJ8C9gVC1JSLQ5tpXghoTMrGLQ1cDS28VoMDBqI1qA2/3PB32Y7z02sxnp0U1GZyNyKEXimr5F31C3s7pmDtBMhj/Y79+2VXhLB/YjDhOGCt5+8P2iy7v+TJViGmmdvbxBT/Sq1Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by VI1PR04MB6830.eurprd04.prod.outlook.com (2603:10a6:803:132::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 08:01:34 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 08:01:34 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v10 0/6] gpio: siul2-s32g2: add initial GPIO driver
Date: Tue,  2 Jun 2026 10:01:26 +0200
Message-Id: <20260602080132.3256239-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::11) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|VI1PR04MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 431e2721-4089-4f35-bed4-08dec07d2a1c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|921020|6133799003|3023799007|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 0Z8bqzQyOaCgAySqdmRNS6ySqpgAeQA55yxI/uQk+VdTLEjWplHHi72+HGHsF9j3HZYsyycFCiutcOOIUbO6Kncwn2OlF78zEYCPIcSUJd6N2mxqFzXk1YZjyRrmZ1HVcsseRc8TxxY8XHwTn1SZbYGNkDHIiGU1kbv9XnMIrx5oggctB2wiDkqEOjnC8q4preHGdB1YzVoszsfiB/Jg0gAKPK6T4StHwGmn6pVHY28ROhmycyDn0tM2uKiEdNemGRh3fetK5vZPgQD/38lRGQjYZaXwWsJslObEy4ZrYe7d/YTVOmkF9brB8cabCvsjC2vGliEc86cjVshsG19qEKMYWpTFQDsuN/di3KikJb6in9sBaEMsXUL/76rheQno2mYl8e51RkUwbp8Aq5OVySa81e6MUtGTZvDNb1SjbuvcvDIa9NcwUq3Xn/6ISGdCetSUnDiU1MVYYYw4CiVBRIQRMK4sGZOYXTnPq2DNycWPwDBlSlHsT1YfFr/gWrOQ7maQ7dI4vCegp9UZ+lYk4e3esqVPZDhjOGtIlravBKMnhdNzH7y0H4DlwbwgpUIimdRFkU5GzGkMZ693xvzXEa3WGbQGYpmdXQ90g8CH4Zn1AMnJEzMWxD7VHtazRp2bH6bXi2RQW8T3wvCuqsLkQQu5521+cUh6DfdqGAvEs3U4C2SHUKnuIEI/sYeWUhcgAoVvwTsd/33+L8XNjQm03Q4sZYBF3p+71f1mc5SALgo=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(921020)(6133799003)(3023799007)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SlpnTGpjK1VFUDZUM2J3S0puRkRlWTgzUENsTldrU0g4cVlwRDlaQ20vUVFi?=
 =?utf-8?B?ZTJjV0U1S3JtaXhuQkwwd041cnQ1Q2wvNE05YUgvRzNWbXBaY0lYTEFXRzNx?=
 =?utf-8?B?Um9ybDlnWTg5VUxOL0NsM0pTRjJ5UzVoSzNwb1QvRDlyeHFFNWxOVmpqV1l0?=
 =?utf-8?B?TkFIeG5CZmU1TEZjQnlKangzakM1YXhaUllKZHM2aUlkN2h3S2FMS1p2MzVr?=
 =?utf-8?B?cXhhNEU2RzFLT0JheTl0Z2owS3ZrVi9BYWxZby9SYldoOVh6RzNIajRGTjI2?=
 =?utf-8?B?R2VOUHVYK3pQcDBIeWgrSGhYbUZqcVRvSG5CRTJXOTFYbTlSMGdVUjE1UEF0?=
 =?utf-8?B?aDNLeTRjQ0RsQUl2MkpsN0VHckFBVkZFclR6SFlGeFQ0Z1dpeFRDZ3hidVhO?=
 =?utf-8?B?Y3U5REQ1eWluSXhIWDFxQ0hMVmEwMzV4NGMyeUZCR3BRYXlOdVRDYXBxU1pq?=
 =?utf-8?B?ZHVNWlpZUEM5NXJqN2UyTStaQnBTdjZwQVg0OGRYSGZFeUdrSDMwVVFNRXUw?=
 =?utf-8?B?VlVBNnFCM0oxNVVYWW5jNlNHRnJIVE1pNjk4eENaQ0RHYm9QWXpOS005Wm5o?=
 =?utf-8?B?UzJGd21VYUVYYkJPaWJkdmxpVFM5MGR0ZEhDdTBBK2VvN3MxeGwzYWdmeDVB?=
 =?utf-8?B?cWl1RUowcEJHK3RibWROaHBjMlNBa0dsZC9MaWhzTjBKdjRTemx4L0EvNzVx?=
 =?utf-8?B?Q3U4MmkvclpWMk9aNnVEZmFhTWZrNFFEUFQranBTM0tKYmRGcndaRUF3SmNE?=
 =?utf-8?B?NFlTU3hObVl2Vm9ramt2SktOemc0a2hxUXBuZXF0TmJLTlkzbllpSVNWd2dO?=
 =?utf-8?B?ZkJmYXU3NmxKemNpeWUzd1VidlduaGRMTmRKYVdmR2VhZ3RYdlIvZzBoTWpN?=
 =?utf-8?B?N05ld01QMnI0Y01GZmQxc2gwYnhoaDlCYW96NTNBS05DeUJXQmpaUVlkTEJZ?=
 =?utf-8?B?ZXdLb0FDd2tsODBVbUVFa3R4bkkwMjlHcTdoa2w5dmtlenRrR1RvaGJKOGZH?=
 =?utf-8?B?MC8zNVNQZ0ZZZ3A0SVZEZ0NDK1JFTjY4alRXRmcxSUFMTStvaWxwZndXZ3pH?=
 =?utf-8?B?VGVjOEhPZGthcGdyOHR5Znk3SmtObnpoZ1lLM1pIM0Z4dXBQcCtZN1JWV3g5?=
 =?utf-8?B?b3pTREtDZlZzNzlkMmcyeDlua1lhWEZnZEovc3BuVFo3MThBeC81TzNxMmI3?=
 =?utf-8?B?dEZnUEd6a2EvY3dUcGV1c0pmUzFuR0l6WTBLWXFLUHJPTjh2YzVKbjk4WDhV?=
 =?utf-8?B?RXRSYUlKNittd3paVWhCZDJURCtVNEQ0Mzhsb2oxSFVDYzVtWGljM0RaV0Ex?=
 =?utf-8?B?SmVMNzNTa01QVEoxTU1hQmlQaVZGdSt5YWZkbHJJVVdkU1pqa1lQQjJJSnFs?=
 =?utf-8?B?K0lqRHU4bUo0cVlwaGZUbEp6bS9DOWVIMnNjckNNa0YvSWhGcEtVdnhaVmEx?=
 =?utf-8?B?TUdFdlV4WmI1aEJCcm43TXUzRnpoWmdQZmdMZm5BOEpFQjFDUCtmVUxCNHhW?=
 =?utf-8?B?SGh1Qy82Y2JpTHZ4OHJZWlhXbmEwSkhMZ0ZobDJZUmhiRjdNR2dTUEFEQ1hk?=
 =?utf-8?B?aVdmMVdrTTErMkZLdWcxdDVxYWVrLy9JUng4UVV1bm5uVmRKNitFTHFhRTI3?=
 =?utf-8?B?djFra1JjYmEvbUVyY2VUeFFQTUhkR28xanVIcE95UEFYcy84SVJoZnVibHRR?=
 =?utf-8?B?M3V5RFdWTnVvMDgvbGx4VnJ2NDRRbG5hVGphMTR0ZkY0dFpjU2gvRUhCbFZH?=
 =?utf-8?B?M0pGeDF4R1VCRWY2QUl1d1k1ZmpVRGtWMUJNaklZQnhJdFVwa3ZtQWJyL292?=
 =?utf-8?B?Y0VRYUVOak5sVHFsRXpnMThJQVhwTjZuZVVuOTBHb3ZkSTc3SzZXVUVFNjZE?=
 =?utf-8?B?dDVrZ0VETVV1R2t6VkdKN1RBSlREQjRJbUpJQ1JOQ0YwdlJLOW1sRWkvK1FC?=
 =?utf-8?B?VWgrbXJJdGFldWoxcE94cHp1dWhhbEI2RDFxQmpkeVNkSzVWbWF2UWYzbm1R?=
 =?utf-8?B?WU9RaXhyNlg5ZEhyUHhTTVh1dEFIN3JqcjdzeitFOXVYSXR0RVA0ZTRGOXd0?=
 =?utf-8?B?VytDU3U0Ris1R1lOaWZQOUM2Yk0yR1BFcElvOXVxclVnb0dTVmZMWFl4Nmg5?=
 =?utf-8?B?RTFKR096aHlWOUhwUVB4TWw0RFhiR1BvMWRxVnYvMVNQOEJOWWVYSVJyVG5N?=
 =?utf-8?B?WGhnbHl3OG92UXhPYXp3UGZDNG1WL1pWS0tzOXg3TXJIUkxuN3M5YWFET0p0?=
 =?utf-8?B?ajVqekYweWlaM2pvR3VweHlQcWR4aHQ5eXFpVlByRGZjSkJhMWpubDl0dWh3?=
 =?utf-8?B?cStBUXFaZ1p3RmFRalUwbms3TUt5OU5tVHpVRUhkVCtKNWtMbGtFWXpLYUNW?=
 =?utf-8?Q?UyVDqr1pOFPyrou/QEjmRJs7aGnak9rhpPl+L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 431e2721-4089-4f35-bed4-08dec07d2a1c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:01:34.5411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CiwB2vsfE3q3pOcCpDZirUXDNCTsvvbWMuFgOplvYmLlZpxc2ooy2//kE4jmkmFzKu5KAnPEr+yHB5TQuLwBbRrun0ZjfdI6KfMsBCt2feuGochgWEGcfPBFZGiXmm5p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6830
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37797-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 698DA62A0A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds support for basic GPIO
operations using gpio-regmap.

There are two SIUL2 hardware modules: SIUL2_0 and SIUL2_1.
However, this driver exports both as a single GPIO driver.
This is because the interrupt registers are located only
in SIUL2_1, even for GPIOs that are part of SIUL2_0.

There are two gaps in the GPIO ranges:
- 102-111(inclusive) are invalid
- 123-143(inclusive) are invalid

Writing and reading GPIO values is done via the PGPDO/PGPDI
registers(Parallel GPIO Pad Data Output/Input) which are
16 bit registers, each bit corresponding to a GPIO.

Note that the PGPDO order is similar to a big-endian grouping
of two registers:
PGPDO1, PGPDO0, PGPDO3, PGPDO2, PGPDO5, PGPDO4, gap, PGPDO6.

v10 -> v9:
- implement GPIO via gpio-regmap backed by a regmap for
PGPDO/PGPDI register translation
- remove the successful probe message from the driver
- switch back to a single compatible string for both the
legacy and extended binding layout
- update binding: GPIO/IRQ properties required only
when extended reg layout is used
- remove unnecessary return value checks for MMIO
regmap operations
- replace kernel-doc style comments with regular comments
- solve relevant sashiko.dev findings
- rework GPIO request handling to preserve pinctrl ownership
- use __free(kfree) and no_free_ptr() in GPIO request path cleanup

v9 -> v8
- remove the SIUL2 syscon child nodes from the
device tree and DT bindings
- remove syscon child handling from the MFD
and pinctrl drivers
- remove the MFD driver and use a single monolithic
pinctrl/gpio/irqchip driver
- add a new compatible for the pinctrl+gpio binding
while keeping the previous compatible for the legacy
pinctrl-only binding
- update bindings to include the PGPDO/PGPDI and
IRQ register regions in the DT node for the
pinctrl/gpio/irq binding
- add IRQ-related entries in the bindings to
document the intended hierarchy; IRQ support
itself will be added in a future patch series
- update DT nodes to match the new hierarchy and
compatible scheme
- fix dtb warnings
- reorder commits: bug fixes, API changes, DT bindings,
driver implementation, DTS changes
- split commits further to separate minor
style-only adjustments

v8 -> v7
- remove all ': true' lines from properties in dt bindings
- remove NVMEM MFD cell from SIUL2 in dtsi
- remove NVMEM driver and configs
- expose SoC information via syscon cells SIUL2_0
and SIUL2_1 in MFD driver
- add SIUL2_0 and SIUL2_1 syscon nodes in dtsi
- add patternProperties for "^siul2_[0-1]$" for syscon nodes
- update example to include syscon cells with proper format
- remove `reg` property from pinctrl node in dt binding
- update Kconfig help text to reflect new syscon structure
instead of NVMEM for SoC information
- squash deprecated SIUL2 pinctrl binding with new MFD binding
- dropped "nxp,s32g3-siul2" from MFD driver match table
- fixed commit messages
- fixed dtb warnings

v7 -> v6
- fixed MAINTAINERS wrong file path
- add unevaluatedProperties, change siul2 node name, remove
  jtag_pins label in the device tree schema
- change compatible definition in schema
- change node name in dtsi
- mentioned binding deprecation in commit messages
- split mfd cell conversion commit in two: one for the
  previous refactoring, one for the mfd cell conversion
- removed Acked-by: Linus Walleij from commit:
  "pinctrl: s32: convert the driver into an mfd cell"
  because of changes to that commit
- deprecate the nxp,s32g2-siul2-pinctrl binding
- add NVMEM MFD cell for SIUL2
- made the GPIO driver not export invalid pins
  (there are some gaps 102-111, 123-143)
- removed the need for gpio-reserved-ranges
- force initialized pinctrl_desc->num_custom_params to 0

v6 -> v5
- removed description for reg in the dt-bindings and added
  maxItems
- dropped label for example in the dt-bindings
- simplified the example in the dt-bindings
- changed dt-bindings filename to nxp,s32g2-siul2.yaml
- changed title in the dt-bindings
- dropped minItmes from gpio-ranges/gpio-reserved-ranges
  and added maxItems to gpio-reserved-ranges
- added required block for -grp[0-9]$ nodes
- switch to using "" as quotes
- kernel test robot: fixed frame sizes, added description
  for reg_name, fixed typo in gpio_configs_lock, removed
  uninitialized ret variable usage
- ordered includes in nxp-siul2.c, switched to dev-err-probe
  added a mention that other commits will add nvmem functionality
  to the mfd driver
- switched spin_lock_irqsave to scoped_guard statement
- switched dev_err to dev_err_probe in pinctrl-s32cc in places
  reached during the probing part

v5 -> v4
- fixed di_div error
- fixed dt-bindings error
- added Co-developed-by tags
- added new MFD driver nxp-siul2.c
- made the old pinctrl driver an MFD cell
- added the GPIO driver in the existing SIUL2 pinctrl one
- Switch from "devm_pinctrl_register" to
  "devm_pinctrl_register_and_init"

v4 -> v3
- removed useless parentheses
- added S32G3 fallback compatible
- fixed comment alignment
- fixed dt-bindings license
- fixed modpost: "__udivdi3"
- moved MAINTAINERS entry to have the new GPIO driver
  together with other files related to S32G

v3 -> v2
- fix dt-bindings schema id
- add maxItems to gpio-ranges
- removed gpio label from dt-bindings example
- added changelog for the MAINTAINERS commit and
  added separate entry for the SIUL2 GPIO driver
- added guard(raw_spinlock_irqsave) in
  'siul2_gpio_set_direction'
- updated the description for
  'devm_platform_get_and_ioremap_resource_byname'

v2 -> v1
dt-bindings:
- changed filename to match compatible
- fixed commit messages
- removed dt-bindings unnecessary properties descriptions
- added minItems for the interrupts property
driver:
- added depends on ARCH_S32 || COMPILE_TEST to Kconfig
- added select REGMAP_MMIO to Kconfig
- remove unnecessary include
- add of_node_put after `siul2_get_gpio_pinspec`
- removed inline from function definitions
- removed match data and moved the previous platdata
  definition to the top of the file to be visible
- replace bitmap_set/clear with __clear_bit/set_bit
  and devm_bitmap_zalloc with devm_kzalloc
- switched to gpiochip_generic_request/free/config
- fixed dev_err format for size_t reported by
  kernel test robot
- add platform_get_and_ioremap_resource_byname wrapper

Andrei Stefanescu (2):
  pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
  pinctrl: s32cc: implement GPIO functionality

Khristine Andreea Barbulescu (4):
  pinctrl: s32cc: add/fix some comments
  pinctrl: s32cc: remove inline specifiers
  dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources
  arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl
    node

 .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      |  83 +-
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  23 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  23 +-
 drivers/pinctrl/nxp/Kconfig                   |   1 +
 drivers/pinctrl/nxp/pinctrl-s32.h             |  32 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c           | 732 +++++++++++++++---
 drivers/pinctrl/nxp/pinctrl-s32g2.c           |  46 +-
 7 files changed, 836 insertions(+), 104 deletions(-)

-- 
2.34.1


