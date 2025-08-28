Return-Path: <linux-gpio+bounces-25037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E140B39315
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 07:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 451407C16CD
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 05:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A781B2206BB;
	Thu, 28 Aug 2025 05:37:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023142.outbound.protection.outlook.com [52.101.127.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A3D823DD;
	Thu, 28 Aug 2025 05:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756359448; cv=fail; b=oGP8N0cEyOK8hKcoc0EO47C9ucJugWGja9NKzgCJjK45ORM3YOPzGkwuDklD3DvdqzfbnqxWSdSQlZEp5oa7cxWPvmFOxmfc1kxg7zU+6FqV4ek/EcKMN0ykZW5XUjtjzdrrgyim/S00NNGIL9niq602QseTYWZZAa6lR5oCxME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756359448; c=relaxed/simple;
	bh=pU8/NOfItHlqcmwgx2YQtcmIOjz85nCcMy6S8CbnUIE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oMly8AkLoXbI9Qwy51ZkVXqUL0SI39DPM/HwF//CkTwKDl31WICUP1tLEcLzk1QQQNMvBMqzEUkEFLP7OF+Ra7r9ss0G3rC9UM84U3jNpAGYVTfKm6Iu96zz5wNU1iwQHn2drjYWfkcWbCLoXWayE1LHpmk8D6XNCk66hrwsSOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uvr/LFmsS/3Ey69x+6OsJzOcIs9E5YI9R93fL/8q/gnvkHJQLgRhBCjSYIcUwSA0iAgblMD6XMeWSUaMa+OdDkkDZlwQ7hnSpqF0bIqF0BA6QLEC7Lux8dsG7fAtRkOTkrUTehnAhENLCcRXU7z7xnrCKw2r4fLsvYdE58b0XMUY7ZlRoXg/0vliqll43zSL7GXVHRnK+N5kVQhq29OXbShybYvZHxgEYvG5OPedv9wBAXFFHeXdduiE8OFqmWd0XwY/Hu2j7jP3sZLxVcYMcW+2WwoDQem6qex/F5qsPNyvb9riUIcox0qYUD4Bth4tn1A6CazEx8Q16M/Ws09NKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pU8/NOfItHlqcmwgx2YQtcmIOjz85nCcMy6S8CbnUIE=;
 b=Kdnx/QJdPZBwk3FCcl4BWVMUcZZYDSirSD8npQzkapR94tEJbI2fIUxx4V119BYuBjS8LwHqVKWZarXVQvPIPWIiynTVc7mNhYeBUnQAwMDZbCuF9LITulS57CaiFeOGZslfTDQZsMU2UzN40ltgX4hARY7k/xgTzNiIzq5DSgCtnye9Q0/vRJQjgvnafCgF8UFOGjOfvHTpEEUe/TIjJBKwJ5/buQ/dxUtcW1ANLEWICAtayPjOetUuRQhmgGOpzG9QEnFqJCkjs9VGjsi23/WeI04fMtYnGYCzS0RqJzr0OXjpRuIDlclzhhVMLbEbssPUNcrGKD9uFP6SFfzE+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by KL1PR06MB6517.apcprd06.prod.outlook.com (2603:1096:820:f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Thu, 28 Aug
 2025 05:37:20 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%4]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 05:37:19 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMi8zXSBkdC1iaW5kaW5nczogcGluY3RybDogQWRk?=
 =?utf-8?Q?_cix,sky1-pinctrl?=
Thread-Topic: [PATCH 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Thread-Index: AQHcFvw6Jst8WcIA+kKHV/WtkB0Of7R2KYOAgAEr/qA=
Date: Thu, 28 Aug 2025 05:37:19 +0000
Message-ID:
 <PUZPR06MB5887D9A879D16DC6A8C8ED58EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-3-gary.yang@cixtech.com>
 <0fa7e2cb-fa0b-4f9e-84d6-a4b2b3d8a4cf@kernel.org>
In-Reply-To: <0fa7e2cb-fa0b-4f9e-84d6-a4b2b3d8a4cf@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|KL1PR06MB6517:EE_
x-ms-office365-filtering-correlation-id: 5aefd638-3e52-4c59-2501-08dde5f4f4d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZVVMTGRwQlVOU090eXdoQkRzV05Pc1ZVNzJUME1tK2NMUFcxYjRSdzNPNWRY?=
 =?utf-8?B?ekpwb0h3YzBibTIySHN3SEVXWWg5WEprUlJ0UzRsaDhsSnh3UklrQTVSbFJK?=
 =?utf-8?B?OXAvRWZ5ZEk0YmU5ckcyZXRuaEhqSFJjMndTK1NTZkJFekt5VndMVHcrTW00?=
 =?utf-8?B?bW9QMFZpejQvZTRnb0RoczNEWmxncnhHVkFTVUszOUpVUXlISkorc0dhTDly?=
 =?utf-8?B?enh5VHdrRU90WVBLRHpnZnlKRFI4THJwSWNUWjc0UzZrV25JUW9UV20rL1lj?=
 =?utf-8?B?SGtsTmlsWWR0S1liMHAveGI3VG5TL0FTSWgxdTRwbDJMYm9KVlVMUWxmMnBX?=
 =?utf-8?B?ZisrMDlxOEEwMHdSRnBCQ04zYitZT3RiVC9Fb0UrR1ZyYU1QOHN4SlBvVjdS?=
 =?utf-8?B?S0ltbHkxd0hLOUNucjVRMzArckg1Ky9sWUI5OE1rTHZuZHcvYlZkYnFrV3d1?=
 =?utf-8?B?d2tMeTdvVHhYQnZCK3ZkWldFdUtva2gybFN3TG9TWFFVWTlyc2Job3VhV3k3?=
 =?utf-8?B?NjRqVDFkZW5GYXFOS1MvczM5QmNtR0ZjYVcyTk0wZ0duU3FoR2xyWGswNGRs?=
 =?utf-8?B?aU9FN25PRUN6ZU1MbkNwNVlGS0lCYkdJTEJnTXFUWTRBRVlSOHNEWmpKNXlO?=
 =?utf-8?B?L2QweXhwSSsyNlZUbDlGSnk5Mmt1RlRqeVdobGFwck81TWRROWVWVTlmMEtO?=
 =?utf-8?B?ZVRqZGF0STk0VXRkWU1DZVY0b25KOEdyeTMydTJFdDRSTmV3dHBTa2lsUUxN?=
 =?utf-8?B?aFViK2h6SXI0YVpuSmtHa3Q5OWMwNk1kT3Y3NHVRWmlhZkJ1aHpYM0hsQlMw?=
 =?utf-8?B?UjdKVjA2UkJWanZQM0xhbk1EK1FiMEZMQXh0R0V3blRkQm5neXQwOVBPa01X?=
 =?utf-8?B?NE1adzQ3eFovSHUxN0xqY2NsOTlEVG4vOThZcDhRRVlwWTBwRERlQktKc1hn?=
 =?utf-8?B?ajJiZlI0K2VFWlY1Smh3ZjhIamxYZkptY21vVGlmeWJXS2dVcko3VDJvWmlV?=
 =?utf-8?B?ak96T2tXa2FOdVZuL0ZOeUo1SmlveWF0MUt6WllyZk5XNllRRmgyY2w5ZEhp?=
 =?utf-8?B?YVZPMzJOR1ZVai9wUVB2YXJveXc5cnMwek9jR1d0TU9LN1Jxamg2NXRkR2RI?=
 =?utf-8?B?N1lHN1g4aStlVHJ3cFJraW5LQit4cC8xdlNZZlNhQWU2YnhFN0NzN1NnczBy?=
 =?utf-8?B?M2xaS2IzZ1ptc3M5dFdYQnhFa0lHNkxpSEZ4Z3JKUWc5aSt4L1ZRWElwODFv?=
 =?utf-8?B?Wm1WVEFHdkJQNUg4Umd2cXVEQWxiZTdMb3FyKzNVYjdndktadGpTdGxudnE4?=
 =?utf-8?B?cWhrb3loQ0pMUU85cnJTMHVUU0FaWjJNclphVzhSSUxMM3VzU0pCQzkvNDJk?=
 =?utf-8?B?ODFQYmZ5TVh5L2x2U0FWT2hNNWEvTVpIYWRSUDJvUnM2ZmlIMDJXNlg2Vm9Z?=
 =?utf-8?B?QWI2Y0VyUmZETlI2N21HYjVNNDQwR25MNzdUZis4MnpvOVhsMzZDenJ1bGls?=
 =?utf-8?B?bkxCZlgrMnNEWXlmNGNMVXlzWnlrMmhja0pJZVRzQU9vYk1vR2Q1aDUwQmNt?=
 =?utf-8?B?bWY0SFBpaGVkYjc0eFBmOGxobWx3MkxaMmxwTWlWc0pBdmxXVlhkWnVldzI2?=
 =?utf-8?B?WXh4aXpWcFJMajlGMlE2Uis4MWExQStLaE1xMHh0aWJ1QTFUYW1YQzBZaWRo?=
 =?utf-8?B?VU00RmgxNlJxdHFQbUFqblloTlNTdGw0Vlo0eS9UUm5Eek43UVpsK2pPVWNQ?=
 =?utf-8?B?MG5RYXFOUnpyTEp3T0tpNFhodzJlQnAwU1VGRHdSd0VKYjlEWGFKUnJxaUdS?=
 =?utf-8?B?eFZxYWFLMmF0WnZ2Qjc4blMwWEl6N2dmWTljbW1oVnp6bS9ZZFNucTBnT21S?=
 =?utf-8?B?Ums4ZUZ3cmZaQUJnT1lwRDNCRVF3Mit6M1JaS3ZvL3QzeHNaT1VSQ3REOVdQ?=
 =?utf-8?Q?XdN5D1Z8Q/4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?THltYmRoL3JJYmJHazhuTTV5TzBuYmxnZTFKUzVMbTFmdzB0bUs5WVcxdVFL?=
 =?utf-8?B?d1pSNXUzR1kvYzI0RytEZ1dvMktRQjBrUXN1UHNjY3oyd2p6bFQwdVlweEoy?=
 =?utf-8?B?bXVIa2lld0d0TnNyUCticzVxQThKbkVvalA3U3h6TzhyWFBhekpOZkZ6M3hG?=
 =?utf-8?B?K09GeGVDNWYzck5qVnA1cElmT2tpaWxrMmlQalRLaU5SUmZMeWIvYkZTUjNq?=
 =?utf-8?B?Z2U4UUkxOVZKdUo0ZUdUenNTRkQ0cU4xekRNMTNUVnVKNktUMDErTUU4WUQ1?=
 =?utf-8?B?RTVGbS9NZWp1eWxTZERjOURnZ2YwU250UjlFcUxSMVBnQzVPZlEvMHRmQW45?=
 =?utf-8?B?bXlGTlZFMGt5THd6WXZVaVlaaHlRMDFRNStvRlRqRys4bEdCdXh5MVp0WUJM?=
 =?utf-8?B?R2RCWWxoTDhZZzA5eno3UnZ6MmtZNjJSVW4vSUhGTnFoMjZ6MDdhUWZHOWoz?=
 =?utf-8?B?c2x4bFRueVA0d3dQSWFGTDNkWUZlMDZxTmpIMzFub0twQ09vWjY1Rm0wR2Zl?=
 =?utf-8?B?T3BhVHlRM3hVZlREZ1dnR25FbWhSUTNqcVY2NmQzaVRocmJqcTc5NVF0S2ZY?=
 =?utf-8?B?cWRjSU9kZFl2dG90d3A1YTRWalZvQzI3alNVSWN3TkhoWFZNVGdDV2ZQRmFx?=
 =?utf-8?B?SzJsKzZ5RmtaZUZQTzhzNTEvckJna2pyZmk1NzB0ZloyUnJBTmFZUXJkU201?=
 =?utf-8?B?QmU4a2RIZzVTY2VTYWcwYzFvaXVCbUM0dml1MFd2b01OM1VBdThZeHRML09B?=
 =?utf-8?B?MEpPY21NTSs2cTYwdE1NekgzdlZCUHFmNkNqVmZ2MWlHalNmaEdWM2MzTW43?=
 =?utf-8?B?SVA3QkpvZmtxeThlTDVkclJxMmlXTUl5emhiYm5XY2tDQm5HcTlmUkJqWnpH?=
 =?utf-8?B?bnJvQTZzb2szSUZUQVFqNWNRQXpnUk9OM3FRYjcwUFJTZ1ZEajhObGc1am1a?=
 =?utf-8?B?VGhtWUNCRm84amVFUVp2eVR0UGtSZEIwNUV5dlRtdERsU0VqNEZOWGZmUFZt?=
 =?utf-8?B?NWZ3c0JIdlo1OU0vbEd0RGVyTEJVK0FLYkZFdzNIYmlzbTJQdGxNYytGcEhU?=
 =?utf-8?B?S3BPZU4yclp0Uk1WZk9iZG5CdjdMSFZXTjZtcTFha2NEdy8wMkhhdDdsQmdq?=
 =?utf-8?B?Q25NMTFMbC92WlpNSWVLQWY4K1lqZmpibXVlTlNFOC9UUG1iWWRDNXIzTk8x?=
 =?utf-8?B?cm5ZV3VpYkkwak1xcW1tYks2dDM2NG9DTzF4VXVDUGFFa2lNc09tNGlnVmJW?=
 =?utf-8?B?dTFhcGJFdlFiRW5ZVytCK3I5RW9UNmVZZTFQQTBqb0lEOW1lUXVEaDJkMm1T?=
 =?utf-8?B?bmJVOUdMN1AwTXJLbkMvVjUydDRnbTdIWVpzVTk2QkU3c3VDZUN0RHFBTjdh?=
 =?utf-8?B?K1N6cFJjVlIvejJQYmF0UG9WMGNKcVN2dXlnVUxocXp1L0Fxcm1zamZxb0Uz?=
 =?utf-8?B?aWRqMHdVZXRETFI2K1dOY3pZZEdRSGducGFXbDN3Q2dCTndYa2MzRm9hYWI0?=
 =?utf-8?B?aXp6VmJFZXRUdWIwMTlNQkVUMDRENXZqdUUvV3JPYWhhRjkyVlE4MVhwZm5n?=
 =?utf-8?B?dStZeUtrYWczMG96U1M0L2Y1bUtnb2pHRlN6L1BodERlQ3VwdGhuL1NNN2JF?=
 =?utf-8?B?em1RQTRycjZmY1YvRlh6cXBCRGhYWVBaMSszdG9WamI3c2c5QUJVenVtNE9Y?=
 =?utf-8?B?TEhFeDBCaXV5VGNpRGZJbFlCOUJCdUVZYjR5WTlTb3hDNklocHZSYVRaenBB?=
 =?utf-8?B?R3RqcjRmNDdJcWMvMG1HaFZUakhlcUtiSXRHVERScHluWU1vdEh2d1dOZFBD?=
 =?utf-8?B?b2NTMU5pbmUxQ3Bha3QvTGZESm9CTDJrK1B1cDIzRTBBRExneWRBdmVaa0po?=
 =?utf-8?B?bExjNDg2dVFicXNiaytJZDN4NjJzamEycGw2bXhjakRMYkpnbGdSeEYrOFVD?=
 =?utf-8?B?U1IxNllOYlVSd0srZHJmTG9EYTNDVzZDMlhpRXdFSVUvNGVFd0FWQmc4VmNQ?=
 =?utf-8?B?SENGS0tIWk94SGNJYlV5OE90KzFzSmdzTkhiUHVwSmlkdXRiL2VQN2pBYkpW?=
 =?utf-8?B?MW03ZkNWd3BtMjk1UTNiQ2NDYWdLWVNFRGFzNzA3Q2g3L3V2Z2FqQmQzODZN?=
 =?utf-8?Q?zK1/bgQgqiRC0WT2G/4vGQzuN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aefd638-3e52-4c59-2501-08dde5f4f4d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 05:37:19.8460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MA/FQqXnlHuR4lBHOipewN5yrap3EZIRw8rrbXygtoUrV2D9tQMWrdy5hJVP9kcbopZKmPGt30v8Ks8qB0xMiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6517

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMNCg0KPiANCj4gT24gMjcv
MDgvMjAyNSAwNDo0MiwgR2FyeSBZYW5nIHdyb3RlOg0KPiA+IEFkZCBkdC1iaW5kaW5ncyBkb2Nz
DQo+IA0KPiBGb3Igd2hhdD8gRGVzY3JpYmUgdGhlIGhhcmR3YXJlIGhlcmUgaW4gb25lLCB0d28g
c2VudGVuY2VzLg0KPiANCg0KT0ssIHdlIHdpbGwgYWRkIHNvbWUgZGVzY3JpcHRpb24gZm9yIGl0
IG5leHQgdmVyc2lvbg0KDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBHYXJ5IFlhbmcgPGdhcnku
eWFuZ0BjaXh0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL3BpbmN0cmwvY2l4
LHNreTEtcGluY3RybC55YW1sICAgIHwgIDc3ICsrKw0KPiA+ICBpbmNsdWRlL2R0LWJpbmRpbmdz
L3BpbmN0cmwvcGFkcy1za3kxLmggICAgICAgfCA1OTINCj4gKysrKysrKysrKysrKysrKysrDQo+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgNjY5IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvY2l4
LHNreTEtcGluY3RybC55YW1sDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJp
bmRpbmdzL3BpbmN0cmwvcGFkcy1za3kxLmgNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL2NpeCxza3kxLXBpbmN0cmwu
eWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvY2l4
LHNreTEtcGluY3RybC55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAw
MDAwMDAwMDAwMDAuLjEwYTRhMjkyMTg4ZQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9jaXgsc2t5MS1waW5jdHJs
LnlhbWwNCj4gPiBAQCAtMCwwICsxLDc3IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAlWUFNTCAxLjINCj4gPiArLS0tDQo+
ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGluY3RybC9jaXgsc2t5MS1w
aW5jdHJsLnlhbWwjDQo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIw0KPiA+ICsNCj4gPiArdGl0bGU6IENpeCBTa3kxIFBpbiBDb250cm9s
bGVyDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIEdhcnkgWWFuZyA8Z2FyeS55
YW5nQGNpeHRlY2guY29tPg0KPiA+ICsNCj4gPiArZGVzY3JpcHRpb246DQo+ID4gKyAgUGxlYXNl
IHJlZmVyIHRvIHBpbmN0cmwtYmluZGluZ3MudHh0IGluIHRoaXMgZGlyZWN0b3J5IGZvciBjb21t
b24NCj4gPiArICBiaW5kaW5nIHBhcnQgYW5kIHVzYWdlLg0KPiANCj4gRHJvcCBkZXNjcmlwdGlv
biwgbm90IGRlc2lyZWQgcmVhbGx5Lg0KPiANCg0KT2ssIHRoaXMgeWFtbCBmaWxlIGNvbWVzIGZy
b20gb3RoZXIgeWFtbCBmaWxlLiBJZiBub3QgbmVlZGVkLCB3ZSByZW1vdmUgaXQgbmV4dCB2ZXJz
aW9uDQoNCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiAr
ICAgIGVudW06DQo+ID4gKyAgICAgIC0gY2l4LHNreTEtaW9tdXhjDQo+ID4gKyAgICAgIC0gY2l4
LHNreTEtaW9tdXhjLXM1DQo+IA0KPiBXaGF0cyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuPyBZb3Ug
aGF2ZSBlbnRpcmUgZGVzY3JpcHRpb24gZmllbGQgdG8gZXhwbGFpbiB0aGlzDQo+IGJ1dCBpbnN0
ZWFkIHlvdSBzYWlkIHNvbWV0aGluZyBvYnZpb3VzIHRoZXJlLg0KPiANCkNpeCBza3kxIGhhcyB0
aHJlZSBwb3dlciBzdGF0ZXMuIFMwIG1lYW5zIHdvcmsgc3RhdGUuIFMzIG1lYW5zIFNUUiBzdGF0
ZS4gUzUgbWVhbnMgU0Qgc3RhdGUuDQoNClRoZSBwaW4tY29udHJvbGxlciBvbiBza3kxIGhhcyB0
d28gcG93ZXIgc3RhdGVzLiBUaGV5IGFyZSBTMCBhbmQgUzUuDQoNCj4gPiArDQo+ID4gKyAgcmVn
Og0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyMgQ2xpZW50IGRldmljZSBzdWJu
b2RlJ3MgcHJvcGVydGllcw0KPiA+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4gPiArICAnLXBpbnMk
JzoNCj4gPiArICAgIHR5cGU6IG9iamVjdA0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAg
ICAgIFBpbmN0cmwgbm9kZSdzIGNsaWVudCBkZXZpY2VzIHVzZSBzdWJub2RlcyBmb3IgZGVzaXJl
ZCBwaW4NCj4gY29uZmlndXJhdGlvbi4NCj4gPiArICAgICAgQ2xpZW50IGRldmljZSBzdWJub2Rl
cyB1c2UgYmVsb3cgc3RhbmRhcmQgcHJvcGVydGllcy4NCj4gPiArDQo+ID4gKyAgICBwcm9wZXJ0
aWVzOg0KPiA+ICsgICAgICBjaXgscGluczoNCj4gDQo+IE5vLCB1c2UgZ2VuZXJpYyBwcm9wZXJ0
aWVzIGZyb20gcGlubXV4IHNjaGVtYS4NCj4gDQo+IFlvdSBzaG91bGQgYWxzbyByZWZlcmVuY2Ug
aXQuDQoNCkRpZCB5b3Ugc3VnZ2VzdCB1cyB0byByZWZlciB0byBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jZmctbm9kZS55YW1sPw0KDQpNYWtlIHVzIHN1cHBv
cnQgZHJpdmUtc3RyZW5ndGgsIGJpYXMtcHVsbC1kb3duIHByb3BlcnRpZXM/DQoNCj4gDQo+ID4g
KyAgICAgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgICAgICBlYWNoIGVudHJ5IGNvbnNpc3Rz
IG9mIDMgaW50ZWdlcnMgYW5kIHJlcHJlc2VudHMgdGhlIG11eCBhbmQNCj4gY29uZmlnDQo+ID4g
KyAgICAgICAgICBzZXR0aW5nIGZvciBvbmUgcGluLiBUaGUgZmlyc3QgMiBpbnRlZ2VycyA8bXV4
X3JlZyBmdW5jX251bT4gYXJlDQo+ID4gKyAgICAgICAgICBzcGVjaWZpZWQgdXNpbmcgYSBDSVhf
UEFEXyogbWFjcm8uVGhlIGxhc3QgaW50ZWdlciBDT05GSUcgaXMNCj4gdGhlIHBhZA0KPiA+ICsg
ICAgICAgICAgc2V0dGluZyB2YWx1ZSBsaWtlIHB1bGwtdXAgb24gdGhpcyBwaW4uDQo+ID4gKyAg
ICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLW1hdHJp
eA0KPiA+ICsgICAgICAgIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgaXRlbXM6DQo+ID4gKyAgICAg
ICAgICAgIC0gZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgICAgICAgICAgICJtdXhfcmVnIiBp
bmRpY2F0ZXMgdGhlIG9mZnNldCBvZiByZWdpc3Rlci4NCj4gPiArICAgICAgICAgICAgLSBkZXNj
cmlwdGlvbjogfA0KPiA+ICsgICAgICAgICAgICAgICAgImZ1bmNfbnVtIiBpbmRpY2F0ZXMgdGhl
IG11eCB2YWx1ZSB0byBiZSBhcHBsaWVkLg0KPiA+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9u
OiB8DQo+ID4gKyAgICAgICAgICAgICAgICAicGFkX3NldHRpbmciIGluZGljYXRlcyB0aGUgcGFk
IGNvbmZpZ3VyYXRpb24gdmFsdWUgdG8gYmUNCj4gPiArICAgICAgICAgICAgICAgIGFwcGxpZWQu
DQo+ID4gKw0KPiA+ICsgICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgIC0gY2l4LHBpbnMNCj4gPiAr
DQo+ID4gKyAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK3JlcXVp
cmVkOg0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKw0KPiA+ICthbGxP
ZjoNCj4gPiArICAtICRyZWY6IHBpbmN0cmwueWFtbCMNCj4gPiArDQo+ID4gK2FkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gKyAgIyBQaW5tdXgg
Y29udHJvbGxlciBub2RlDQo+ID4gKyAgLSB8DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvcGluY3RybC9wYWRzLXNreTEuaD4NCj4gPiArICAgIGlvbXV4YzogcGluY3RybEA0MTcwMDAw
IHsNCj4gPiArICAgICAgICBjb21wYXRpYmxlID0gImNpeCxza3kxLWlvbXV4YyI7DQo+ID4gKyAg
ICAgICAgcmVnID0gPDB4NDE3MDAwMCAweDEwMDA+Ow0KPiA+ICsNCj4gPiArICAgICAgICBwaW5j
dHJsX2hvZzogaG9nLXBpbnMgew0KPiANCj4gRG9uJ3QgdXNlIGhvZy4NCg0KT0ssIHdlIHVzZSBv
dGhlciBncm91cCBpbnN0ZWFkIG9mIGl0DQoNCj4gDQo+ID4gKyAgICAgICAgICAgIGNpeCxwaW5z
ID0NCj4gPiArICAgICAgICAgICAgICAgIDxDSVhfUEFEX0dQSU8xNDRfRlVOQ19HUElPMTQ0DQo+
IChQVUxMX0RPV058RFNfTEVWRUw0KT47DQo+ID4gKyAgICAgICAgfTsNCj4gPiArICAgIH07DQo+
ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9wYWRzLXNreTEuaA0K
PiA+IGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL3BhZHMtc2t5MS5oDQo+ID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjQ0NTUwZTQxMDViMw0KPiA+
IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvcGFk
cy1za3kxLmgNCj4gDQo+IEJpbmRpbmdzIGZvbGxvdyBjb21wYXRpYmxlIG5hbWluZy4gU2VlIHdy
aXRpbmcgYmluZGluZ3MuDQo+IA0KDQpEaWQgeW91IHN1Z2dlc3QgcmVuYW1lIGl0IHRvIHBpbmN0
cmwtc2t5MS5oID8NCg0KPiA+IEBAIC0wLDAgKzEsNTkyIEBADQo+ID4gKy8qIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgKi8NCj4gPiArLyoN
Cj4gPiArICogQ29weXJpZ2h0IDIwMjQtMjAyNSBDaXggVGVjaG5vbG9neSBHcm91cCBDby4sIEx0
ZC4NCj4gPiArICovDQo+ID4gKw0KPiA+ICsjaWZuZGVmIF9fU0tZMV9QQURTX0gNCj4gPiArI2Rl
ZmluZSBfX1NLWTFfUEFEU19IDQo+ID4gKw0KPiA+ICsjZGVmaW5lIENJWF9QQURfR1BJTzAwMV9P
RkZTRVQgICAgICAgICAgICAgICAgICAgICAgIDB4MA0KPiA+ICsjZGVmaW5lIENJWF9QQURfR1BJ
TzAwMl9PRkZTRVQgICAgICAgICAgICAgICAgICAgICAgIDB4NA0KPiANCj4gTm90IGJpbmRpbmdz
LiBEcm9wIGFsbCB0aGlzLg0KPiANCg0KRG8geW91IG1lYW4gdGhvc2UgbWFjcm9zIG5vdCB1c2Vk
IG5lZWQgdG8gZGVsZXRlPw0KDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YN
Cg0KQmVzdCB3aXNoZXMNCkdhcnkNCg0K

