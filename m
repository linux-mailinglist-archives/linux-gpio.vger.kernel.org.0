Return-Path: <linux-gpio+bounces-9921-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37980971FD3
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 19:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D35CB2261F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 17:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8833B16E895;
	Mon,  9 Sep 2024 17:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pORiRXtS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51FE1531E6;
	Mon,  9 Sep 2024 17:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725901395; cv=fail; b=euHYDW8Ltf9OIq7B2vA5oLzfPkW4GqLHfcud+dmsBjZXAT6qDpA3/Nl9kAWDI59m/OyR5VT8u/hcni9sngIycQP5MqJz7kS9mDJbFcaZGUSzZxT2jwqxj6osHUHckK2w5qxXJvsN+HWn/st3QweNv9NNfLRNkLS6c1Mv4XaSmB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725901395; c=relaxed/simple;
	bh=ibip/6eHABVeinkbBMO1yAKm9exZ964yij1ak6YFACc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ECY7AQNzNtvhiSc3nVpPW+yqNA2PeB3XPBdIpsO+YOSZsT7MApuq5CNPrLDPlgPDqmRIazlbZ4KFjtJ4eYaxrNTA0KvTdkdhn2Ft1mc/nDEYFq8OIRnuMi1sf6Rdvsr0Le/Z9aQb4aMhaJ6uj8KzAAW2shKGaHGxOuGuriyMjTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pORiRXtS; arc=fail smtp.client-ip=40.107.244.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDc4qgD7EELM8pAEJqvw/WlXQ2EXPp8DIP8Ij/b1QnlT/Jh98/m8lwZztUDoPZha/Cw1JdYSCAqD2l3JHUkGBZpGJt9LAWlfDJr9jMNI2lxCasaCBM1ZeU5PomLI2cKWZXDkEz5OtBAgiNw+h6xXBIFaK0XCxvXzZP3LM9uYnErf+5XdmtBoaLctqD6m6aAm4DX5nZ5iKOO+pTMVk7oY943Wh+7Q15zHOI7wDWxh4wvf2Xa2306pXt/uiKbj+7UiowkDDqXH/P12Cq5G2HmVejVLk/BTHcokF7ImXW196G9OK8I0CUlYKSuYQVCmvIvCs6xkV1FbJpF/zjKWnP6pIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mh90kGoOmb5PKB71fv5QwkiF38rKOvH0Y8t44s8Fo24=;
 b=fwXY0b9poSfwxhvOFbGJm+UzXqOzhE8GOeeLJTRhLS3an2ZO1c/63NxuFG82BlLe+er57K/l2zIf2jSo1S0aOjqJstIOZB/7cxYytn66r8ysbx7VqyktFq2Nv1gI9tunk1OIBfsvjiup7XpfGWXHp43whyIzVfrZjdhLeSrns/t0dtzNcJBOEPhKNKMDACtv1+qQ9bdrKgQyEfBJlT8TbZIEBxwP9v/PaL5Md8NcUzmB4gTyKWmmi9RMJ2k+mLMNJie5LmEYfS+bxfmCGEl697rDASplf2MP2E+2pg2f+GEWSh2tsuWistWHYUbeE5UtDTNAm6kqWYyv8cShABtykw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mh90kGoOmb5PKB71fv5QwkiF38rKOvH0Y8t44s8Fo24=;
 b=pORiRXtSUCDoCbYshnXgVbDaoDMXEbbAEM3gAxyeI6lS5rT3Dzp2vJutrb9Y747+1SIE7J3Q9gLp8QUwq1livjsNIMcqBK57Ck2DINCUbKiuAy1cYusfUWtui9cw2aQfl517bxycmq/rFgMxggfwl8aVIQ27ByP5wyausXC/Uy4=
Received: from LV3PR12MB9260.namprd12.prod.outlook.com (2603:10b6:408:1b4::21)
 by LV8PR12MB9230.namprd12.prod.outlook.com (2603:10b6:408:186::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 9 Sep
 2024 17:03:10 +0000
Received: from LV3PR12MB9260.namprd12.prod.outlook.com
 ([fe80::e5c3:25dc:f93:cb99]) by LV3PR12MB9260.namprd12.prod.outlook.com
 ([fe80::e5c3:25dc:f93:cb99%3]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 17:03:10 +0000
From: "Thangaraj, Senthil Nathan" <SenthilNathan.Thangaraj@amd.com>
To: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>, Linus Walleij
	<linus.walleij@linaro.org>, "Simek, Michal" <michal.simek@amd.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, "Buddhabhatti, Jay" <jay.buddhabhatti@amd.com>,
	"Kundanala, Praveen Teja" <praveen.teja.kundanala@amd.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "saikrishna12468@gmail.com"
	<saikrishna12468@gmail.com>, "git (AMD-Xilinx)" <git@amd.com>, "Potthuri, Sai
 Krishna" <sai.krishna.potthuri@amd.com>
Subject: RE: [PATCH v5 2/3] firmware: xilinx: Add Pinctrl Get Attribute ID
Thread-Topic: [PATCH v5 2/3] firmware: xilinx: Add Pinctrl Get Attribute ID
Thread-Index: AQHbAEyJrT3v9unufkywBhnPEm58+rJPsvOw
Date: Mon, 9 Sep 2024 17:03:10 +0000
Message-ID:
 <LV3PR12MB92605EC32BE4F5AFA2949359E2992@LV3PR12MB9260.namprd12.prod.outlook.com>
References: <20240906110113.3154327-1-sai.krishna.potthuri@amd.com>
 <20240906110113.3154327-3-sai.krishna.potthuri@amd.com>
In-Reply-To: <20240906110113.3154327-3-sai.krishna.potthuri@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9260:EE_|LV8PR12MB9230:EE_
x-ms-office365-filtering-correlation-id: 95e3d8f0-9782-4993-93fd-08dcd0f1487d
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TsAeiKO4daqY3ItDT32FILg7TDnP8lZ57Kfvy7xA2K6+3vahIvhuDbM1vTtH?=
 =?us-ascii?Q?ALRKev1tzmTWCYhJRaEk+D0JL1PVDJarlGamt6NnEoSzc7X+QVrs6FAfHcar?=
 =?us-ascii?Q?BarWIR9LH91NG1aqrCR3VPb1KHynyv/FbuIIn3dmuPOqx816kddWQohHPH0h?=
 =?us-ascii?Q?h9Hh94rvY4o0uzfBJhNDAFU1j/RYa+o4L2OevJPrszb1YfIVjs0JH16m/8+K?=
 =?us-ascii?Q?JPoJj5zNIBZSincKWBPcgB8jUnBs5Yw+2eb1v1oqJq6WM9ggf8vIEivJuhDG?=
 =?us-ascii?Q?kqeoiGXhpxmZJE6RtLA6XYEKu50rHjinmWkVAX+N4KbL3dAaCoBrge7Zox7a?=
 =?us-ascii?Q?YwnNYyrfpQ5lU4WdHRn/zF03TDQuwa05ZwC6X9FIZVQx73tFHuGaYqFn9EE5?=
 =?us-ascii?Q?Uh8Nugv3qolbnHVirGkC8w4ZF9r+g+0LJ9TfuFV+vJIhTL6m0nOHaFnVtVKV?=
 =?us-ascii?Q?9/XUtMYkL9l2wNZSDHbwovr+t99KBc232xBhQ4rv4xEHdlmwAhiFEJvO+oEP?=
 =?us-ascii?Q?vkiNimf/Ojz7KKSXlb8bah+TJjVLRQPhgiGsxpBoFHt+V5Vcfa4n5g2cnnEG?=
 =?us-ascii?Q?ekggFzBwZgUOYA4b9zvaDAYJIZDQPWcTGG10L/CvzKuMbx1tPj4ZDgTW2UNG?=
 =?us-ascii?Q?vDk5M7joVxCbhlXjDeFMO5wpdUmoQSgCOqZqg9txW1o98npukbDT8L+zeP0Z?=
 =?us-ascii?Q?1g2MlTiwcYRP/QS+JM9Azjo3LG19hNLCZf2+anAZuotS+xN70SkogyyS/mMk?=
 =?us-ascii?Q?6e89B1kxlLibtbeFf6h0ASuQrkglkuMbi98PDOJ4Sfkui+2zToI1SjWYv8TI?=
 =?us-ascii?Q?n2xVeAfl3axfr4n3Za7MSVGBUksuVlNKmX8Sllh2y6I6lPv6rzJiSF1TOm+C?=
 =?us-ascii?Q?G3q2hPdkhsgFSq1S0JocSlMrFHHGrZYtbrrYbBtKKUeWFvCGNTGeC2cOXgcJ?=
 =?us-ascii?Q?sVMhWcOmF5dpIBjSCCRgWmsJMo8Y67Adf2aq9j26kE2I38fm7sIsXrdoEVMS?=
 =?us-ascii?Q?X4BKsLPTqryrrZFIXzrfi3HmEEnIDM7QyAu6+43rfv+gGVa/DTGpLQquURUD?=
 =?us-ascii?Q?p39CXW3+IlGkOHiq/OHlintm/632q98W8ZROvRWnn0opK6FN2zt5jeulNbHe?=
 =?us-ascii?Q?csN3v0T0NVMjVZtxsG1BwSnjYhq7wCgp+wwCyIaKRd5VqsOznN2dmKB7ds9H?=
 =?us-ascii?Q?WZ1muBbG5BaIeY+9fARoRHbsOm5gOrfnxj6l3KxEDLw8/Ip4cLmZjipNw0S7?=
 =?us-ascii?Q?BaH2e1yU50iUfRSsaJTJXcH06Rv3WgUsQs+ymhOy23StUw9y3i0tjIHJkkcN?=
 =?us-ascii?Q?Y33qC/JLlqWpBdhi7IrBAjkaDQ9EScqCxUfeIprWf+cx+ykO+GnkJGwEakhH?=
 =?us-ascii?Q?6VphCQNkoQ0L1mfs+i2ZxwooRuYj+vd9cHLHrHvz8/lcYqJn3yvTwAQAUBGs?=
 =?us-ascii?Q?G4xY07iZwA8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9260.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?S1KfsJV4+zVl/+plN2LetxO1p+WCQQ8XrTcem1XSdspbgSF0jynX02D6aO4Z?=
 =?us-ascii?Q?yEhXkwatTMXEzTAsiAxbRQeFzgSJ+/dxRplvbEw3RUjcnRzD1h+KiY1nwode?=
 =?us-ascii?Q?3qLnmNwNsyn9lCCPo9+wVHxumwvvVpOlD+rUdVvRF6LdXrVaDzE4StOWsZme?=
 =?us-ascii?Q?ETpqBNMHuVpIUBIFgwceCvz9liCckD1gBmKsUITNubsFXpXapeqrKeChpnf/?=
 =?us-ascii?Q?g4w5WMnotGEoywL+v8byLz60kCaSsH9LADWGvrit424rI0Zb63/eXTzTF2cB?=
 =?us-ascii?Q?BjNTi0L/mzZB1mns+xNZL0Trp4KJTMkKgkXokq2QJrV2sNP6eT3FU+igHykv?=
 =?us-ascii?Q?VzBuCfoNs9ibqQ/qynEZSA9EdQJrsaBYzFT5TmsZ+c6raN/NOxilQ6O+AbsW?=
 =?us-ascii?Q?YMJxQJyzJF+7LM6wMpmJz+ZCdUZJSd/eeQhwssxqvmjL/wc0a51eEzfiQ/za?=
 =?us-ascii?Q?u2RoXZ9aKfOdQ3lIllsSI5TUoxTWFHEoeKH+3w8v8rbp4cK8H0pNLYz+g2kh?=
 =?us-ascii?Q?siQ6xzNodEffM/4NU5lTvXm5HtglFkLaQzj0FmHB3VVzcdw4XfzgYSWlS0UU?=
 =?us-ascii?Q?NSs3N/1yky77dqaXvSfHT25dRtWesb2veUy7C9BBgSNMZH8pH5u0crbRy+0w?=
 =?us-ascii?Q?bHahxxti/vD9ywZLm0LWgLpK4tsq/AQHDEWEKhVNhgzSJt3JZcEcNp7/wAni?=
 =?us-ascii?Q?cRGAqBzwUPAKoFttUc+bJ8AwUMWtNib+hZls0O8Y23W8/CRgiZw2GOu5yHxX?=
 =?us-ascii?Q?wkrm/7+MLwNGzgnQWRk6GL1RgqfytgVBBCmdk4keMiXo5AQJQoXncLxJU1hb?=
 =?us-ascii?Q?FGx+fNKB3H5xxFozrHQAjXMJuCR84US6XrtGfKj8jSMRXxTDnkaH6BlzEGeV?=
 =?us-ascii?Q?9fH7XGE0xoqdmKZvtz863OJcs6ZSACKUOqhuVgPFgV3U4U6At8YxFrbeCHKU?=
 =?us-ascii?Q?4rmq8D2SrE+ZpceRMhHb0OfyNh3VeaFgB7HA/4WX4fZ/voDBCXQ4bKVY2XNy?=
 =?us-ascii?Q?p7F70O2mcFR/Cw7tv3pvCl/xqPh1OFptPPJqE179iB8/y+X2jTx3Kw85wSkn?=
 =?us-ascii?Q?WpuX3mGI3I7qVzwkfhbbdD6mKHM9LrZhfZaTCpjtuyKh9+IksUcVR9q/vRT5?=
 =?us-ascii?Q?qe8zZ4fV9T4L/UPGVATPgDTLWNyTzW6z20OPzXa0vxKdQeoxzwP71zsMKxZd?=
 =?us-ascii?Q?1ZvNMTeobMmjzD2jawFs2vJpPB3g/+zmN0jV3wR8HBI3c09HCSogl/7GP+8R?=
 =?us-ascii?Q?4Iwj33so24/OoEhDkj9XjTh07h13PZ9eIwMcPbdtz5K37pwC6SxlFKpNsoAz?=
 =?us-ascii?Q?2sa2KjtNgS4EqM1LbKXU2AAA892lifXqXU5Jx7KL2JIekdyZ25kBFwbRV/Xp?=
 =?us-ascii?Q?kS0q9zNv9TMWGRiYjKO/ZLHnYGVTa3PaxSH/cFFOrko7qu7rskROpfbG+ymD?=
 =?us-ascii?Q?etMOGdFubEw8i+1gUfzQ8pdK4ZyYj0+cboXFlbtTq62mxhOuQXlgzs0ScOek?=
 =?us-ascii?Q?5HEmiEiXsGpgcrwowK3M8Kt+MVj8qjLkAbX6hm6voGfBAAypjx2sgonzSej8?=
 =?us-ascii?Q?c1IGAQ3FQALfzSb7/40=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9260.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e3d8f0-9782-4993-93fd-08dcd0f1487d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 17:03:10.1149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YT9SwOpxi8ZAtxrFCb7P8cNpJNenKK66TzAxElenatMReQclUIYmt5+r8onl8EMqMC96EqSwTk+h1uoGhvIIIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9230

Hi Sai Krishna,

Please find my review below.

Thanks,
Senthil

> -----Original Message-----
> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On
> Behalf Of Sai Krishna Potthuri
> Sent: Friday, September 6, 2024 4:01 AM
> To: Linus Walleij <linus.walleij@linaro.org>; Simek, Michal
> <michal.simek@amd.com>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> Buddhabhatti, Jay <jay.buddhabhatti@amd.com>; Kundanala, Praveen Teja
> <praveen.teja.kundanala@amd.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>
> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; l=
inux-
> gpio@vger.kernel.org; devicetree@vger.kernel.org;
> saikrishna12468@gmail.com; git (AMD-Xilinx) <git@amd.com>; Potthuri, Sai
> Krishna <sai.krishna.potthuri@amd.com>
> Subject: [PATCH v5 2/3] firmware: xilinx: Add Pinctrl Get Attribute ID
>=20
> Caution: This message originated from an External Source. Use proper caut=
ion
> when opening attachments, clicking links, or responding.
>=20
>=20
> Add Pinctrl Get Attribute ID to the query ids list.
>=20
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> ---
>  include/linux/firmware/xlnx-zynqmp.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/linux/firmware/xlnx-zynqmp.h
> b/include/linux/firmware/xlnx-zynqmp.h
> index d7d07afc0532..3b4ce4ec5d3f 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -238,6 +238,7 @@ enum pm_query_id {
>         PM_QID_PINCTRL_GET_PIN_GROUPS =3D 11,
>         PM_QID_CLOCK_GET_NUM_CLOCKS =3D 12,
>         PM_QID_CLOCK_GET_MAX_DIVISOR =3D 13,
> +       PM_QID_PINCTRL_GET_ATTRIBUTES =3D 15,

Any reason why do you need to skip 14 and use 15 here ?

>  };
>=20
>  enum rpu_oper_mode {
> --
> 2.25.1
>=20


