Return-Path: <linux-gpio+bounces-30720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D8AD39D1E
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 04:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32F683008D57
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 03:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E23322156C;
	Mon, 19 Jan 2026 03:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="mis/7Qz4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022116.outbound.protection.outlook.com [52.101.126.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8158229405;
	Mon, 19 Jan 2026 03:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768793834; cv=fail; b=Kv5PngK2X5gotEdAEDFj/gFQzssP/sUvN8RQ2+9BEPTAzN8467dRyVmwYlX9WI8Zcg6HYvXjiZF7IwiyrVGbzlbCUnyzE7QYexFEwZiwugCBVF2i6ez12ptyn9zBLf4ZXZxtHyIVKrszCd3qQdYkgfGJsTyPxIJMZZgUKs4spBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768793834; c=relaxed/simple;
	bh=T3Y7CSBYipTTsQfRb7YW2ja4GSFZUr0qkZvhtiEn0Tw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aGBXVh0GyNvgShAIfb95rLjvf/TVVL4myl016urMWfokpHnPlJ4zF1FahrnVagtwKMYMJ+KbJzr83iv8u9XU2rJyx8SrBequZZo4xxqaejDaSmQnOoJ6k+S25SrsmozkCGdhKADUB4WcVfrfD0UhoEJqa5furfcf0myUHp7k+vY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=mis/7Qz4; arc=fail smtp.client-ip=52.101.126.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSRzivM4KvNC9tCb7J8Kg3M8DnUx08UQoRMo4eOEYcQzTAgixhyBjOyFUPTVABbzzJ8/Sw3F5DFePzF36/LosqrRO7ILDN3vBHE7su2EHLN5bVPZDsjtp//b3vTG0iCEYVowC5H1Qgq9d+Ncev7LZi3jOjrgi1Cf9T8ga9o7r1yeDB1kK+3HWwgynetb9ow1bjzh7ztJwwyNkgGrGl5w0Od90MlHjisicjUfqhmL/JmBSSEPyxrJW/ElhjdeSdZB4oZqO8TqLEl68fsJJaf21OvR+4X8R1ZAbxSgMC4nk1bZ0QrmYsFzK9eOKRlm1khlH8T3Yg4WHxl04K9LZxPaBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocQo/HgJbo7tQm7fmwbd5SYrqg9b5kSNne9q7v8WkPY=;
 b=rjRaLcop51vhYigPr2eKZvKr7CYeZzuoE13yC2pFQRq+JLBVsOGsoVvKk2YXkd/A8gn7uDbVQ2vU3tgR/6QZdBklCUj3/htOjhg8E5Kkm4Qe3Xt02iOd1Xi01XarteIIAJ0VeHwpszClxMk8IvuGPx10bAU3MK+6UZIxcgDH7Ul5S+yXT0JZ6IXhQuokG7HlS6zXU5K6I7v2PrlUzY0W9R80GrMXOyQv4Mn4MNvOXRShoSAr+W6sb5XBpTVayu0Vu9EYxT2M3yAWC07C+ji+NsLgEw6JVdu5S1dPEl0VJBUV7RKdPkRbx3MFnAHUutrJGBFkqJeTh82gGZHuJw+0GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocQo/HgJbo7tQm7fmwbd5SYrqg9b5kSNne9q7v8WkPY=;
 b=mis/7Qz4bSRGjHEvJHJkhFuUGOl/cFRT7na+wsHdfim0TojosYraKsSmOlg1CGUfOf6UQoJyEJigK6+5u51IsVr36C1v2tmGXUH8cn8w93oEtSUZ+J6DjqLe2xYirGyY/WZpjlsoI/KjhbEiWtpQvBoo+7u8JylNEt1FY9CvsU6fUIouovNDCBcfd7m0Dm5lxhHMWnL273I57iy21LMpF2Qr37u08PABvq47CarxuTXzXqDcrTOwin+50CKJRh9OEHWjwl6ssraWDIZGkKNhMrAueFqzhL16aZbcopuLsuef2heF5wnVATfsKXpM4E4M0htH+fq2YnDn1tMqAKsfyg==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TYZPR06MB8300.apcprd06.prod.outlook.com (2603:1096:405:39b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 03:37:10 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%3]) with mapi id 15.20.9520.006; Mon, 19 Jan 2026
 03:37:09 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, BMC-SW
	<BMC-SW@aspeedtech.com>
Subject: Re: [PATCH 3/5] gpio: aspeed-sgpio: Create llops to handle hardware
 access
Thread-Topic: [PATCH 3/5] gpio: aspeed-sgpio: Create llops to handle hardware
 access
Thread-Index: AQHch6LbTxZfi00O+EG9xRc0ikvT8LVWgaEAgAI3VL+AAB3kMA==
Date: Mon, 19 Jan 2026 03:37:09 +0000
Message-ID:
 <OSQPR06MB72528801E014FB1CAFB410F28B88A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
 <20260117-upstream_sgpio-v1-3-850ef3ffb680@aspeedtech.com>
 <55fbb766-12b5-441a-b06c-d807097e5476@lunn.ch>
 <f94ea2f9d0d241509d256d87f02c6de2OSQPR06MB725219B6ED261DBB4E8BC33D8B88A@OSQPR06MB7252.apcprd06.prod.outlook.com>
In-Reply-To:
 <f94ea2f9d0d241509d256d87f02c6de2OSQPR06MB725219B6ED261DBB4E8BC33D8B88A@OSQPR06MB7252.apcprd06.prod.outlook.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TYZPR06MB8300:EE_
x-ms-office365-filtering-correlation-id: 7715060b-3c0a-4884-13e9-08de570c06c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?0LK6+jrrkuoPWQr36C5WGafzEJQfpcu1wG3LVTxVMOV9CCt1Vzxl71Do?=
 =?Windows-1252?Q?3VXJuePdNhBUMD74Yl/8Ct1XwsiqXxB8uTiIGKQOCKpePoOJKZMFLSNh?=
 =?Windows-1252?Q?xz0sB3zULm0CWj786TeCbvcgzJ4lXVIMB7gjvO3+LMyVDPfKu1e1d+6G?=
 =?Windows-1252?Q?Kco4yQhN0eraApAwUsJYqs2WHB6ZeNJGEjUr8rplY1EVb3zpsHnqFx01?=
 =?Windows-1252?Q?VM0fQfGSBvgrWWCCWmvMK2JTdDtNNIcCmADq2wUL5KsaM/sg8c+DYB0W?=
 =?Windows-1252?Q?5qSwEoQVge/eLhSa0dSEIt2bduP+CxYLoIYPZ329PEzOQgi+k643YiNT?=
 =?Windows-1252?Q?EgZ4INWsQHhCuqI/UL46AS/o5NPlRpFEy9vligNDnLEgry5aFzKTLSXF?=
 =?Windows-1252?Q?2HJULMmEWI1gKSMktyd30UpkiSsXM/djp7FCVPeNhHEgfNbzvDBVoD+R?=
 =?Windows-1252?Q?JHux1f3NWnBeXoc5xbIvdYrZK4GO+4amF3sz81bksJf2ub3/KymQCXVC?=
 =?Windows-1252?Q?smQcBHh3l3zOXtu1Is9sPQjgJTKSv/S3jJq7HK/aR8It81k2l+q3vxx4?=
 =?Windows-1252?Q?Ti2mINJZHVBdd8m8Rc9ex9G6z/xiE2rJP0RNDfZCKaNP2ytAsdgVbn8E?=
 =?Windows-1252?Q?XD/+4TmKQXSQ8cySV6aRTRS0jEcypMHzoHPIb5OBcLUY58zQCAe5fFFP?=
 =?Windows-1252?Q?vzUyoGomllVCyiTNMMmjqx+OZmfAvmoy+2M5l+uWm50cIP+h3oEWrEnm?=
 =?Windows-1252?Q?O7L6bJREIKaEZSIUFMxAQF0/yVTOZAK3VOwJEjHKGykm18xgkRxPaUpy?=
 =?Windows-1252?Q?EuVkGZZNDEEkkzVLfIkDYM/t9Arr/vHk0wA/A7UOXgJF+048nniug+F5?=
 =?Windows-1252?Q?E77HpDKl1oG90JXyRoIpBSg1DNge9kYKscEarWMP8TS7S8xRSbrv/Uve?=
 =?Windows-1252?Q?gvO+cndEX3U4WENObYUPGPr7RrSY0V/lEyvyYTug3j2syYjopHwpLFp4?=
 =?Windows-1252?Q?d5EJMFUhXQNnVjnnFJ0B7pIEREApAfad21uQzR8g/qFqkbPG4f58TuzQ?=
 =?Windows-1252?Q?NEkLyD8wl0/kydpXN85iM4d7FTNeL3h/Fvpen+mxnpmgAN5oQa7IQrEe?=
 =?Windows-1252?Q?t6ikkOeiMfWCfnI3mwO+DT67GKypi9cb2h8nbPJnE0Hr+87kDVTzXbiJ?=
 =?Windows-1252?Q?VRZQsNZjMhHf7TnEEAc3iB6NLgzhUTMTOsC3i5b0Q3OvKG4HNvvlepIY?=
 =?Windows-1252?Q?6UBbFwpOclRjpzW54o8/pP5YyQAUHu4q+c9moCb8DjiXt2XELNOOzeL4?=
 =?Windows-1252?Q?oT5LPrQEH587TcaHwIxWboikDmlDCJaRleYPJA25bHWSccOf7d+fQ9Gc?=
 =?Windows-1252?Q?vQIy3v2xXSurBKwCHtz5hrjT60Lba2i8aoqtUZaO2qFzrMkgeimnCVMX?=
 =?Windows-1252?Q?HB3KsK02SjVkQzDsRk9wELqu4bno7sjvyKXc8YUrbDPr/UWfcjadhFHK?=
 =?Windows-1252?Q?XxGt/K0ejtUqUdgudEj6vt/m2vLp2xGSFNHoE2u2l7nKnqdLYY82Ho6y?=
 =?Windows-1252?Q?KE6B/F74YYzvZtC/Xm3mWFRNCUs7b79iyH54Q2kRrc8uVmiwogoIZL32?=
 =?Windows-1252?Q?HZMV38vvcMVgj1NHtEXZIEipJcIbQVxPd2/fb0ULeGS/6TQsfxBhX1ja?=
 =?Windows-1252?Q?X1AZcvIgO5fdMjxS32R/X0ZzvFi4lVGY8zTVexS+C0gDudoJVqL+yXA9?=
 =?Windows-1252?Q?JUbwkMxLVVNyJOClHi8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?iTidZrq3Mu/FRWYTv9OrdQI+AoO+VK22a/H0SjES70CFtMg3KqKWg2R2?=
 =?Windows-1252?Q?W277RVyNwvOwjQ6yOpbhvqte3v2nSLPw1b9HO/5/P6fqdLHBbnQQgv6J?=
 =?Windows-1252?Q?T0vTfEpMXWqCFEGVbQyx82wlwcLYSijHYt7yfdB8QD7Qc6rHFsNxQ6uV?=
 =?Windows-1252?Q?B1FqNNAGwo6hH0iYz1Fu/IUIMdl++DOY3VIl9KYSq3htiHaQgwHN88sE?=
 =?Windows-1252?Q?ykSt+Jwzt0MB4E6OQOF6r3TslZ12wctScccuwx3m+ubTZz7YRsOA4tuX?=
 =?Windows-1252?Q?1Jl7pHBYL2AylE99grzQpd8dBw73m228PQg0aWd4+IpHehnb2zEYjsmO?=
 =?Windows-1252?Q?wiahhOANUVPEBbwbHUVAAMAow7Qc9bYs6Ishr40lXoSNWSG67K6X+Wy0?=
 =?Windows-1252?Q?pCkb1YtS+UN3+XnKztkyfF8SxqrlDicYTO9j4BDWtAKnnJko0kH57RDX?=
 =?Windows-1252?Q?MtvB0vVOVHsIGAtWMwtrWOdajKaaupfz5pANBn98H5tqjkMlNQZTclov?=
 =?Windows-1252?Q?BtyOXV2txazxcJZZ4HQJMg3JY36/vvlvlFn8z/vBVNHfms28HbrqzAuX?=
 =?Windows-1252?Q?Ey566Czp3/jcGF8N4C/9fLkvmRaNr/3WBGjfFpmjl9H7VVqvXgBJtPeX?=
 =?Windows-1252?Q?Co7khDTKDNXrIfWeTfIO655fSMx9IOhUIyjotzsy68MNFHDXtyI5FyeF?=
 =?Windows-1252?Q?dqiLo9rDbZqxnlsDmphlfcZiCvE5vyXFF215x2IOEzSazgqEBPJRwuNI?=
 =?Windows-1252?Q?AaqzRkb7rSoBhndOVm28Keaq6vI4WFh4RdQtlnBMynLC7EYQd4GIop/N?=
 =?Windows-1252?Q?p2CKpErQSO6TErnE9Kxm44yeZEbxM6BUKncTxpl+sFo3fEYMtD6FtIIQ?=
 =?Windows-1252?Q?/zkvfdPLzGjNNLlWhpMcy73xGyUxpuy0v8+HcIrOc3jhbJAgmzB8Sm/t?=
 =?Windows-1252?Q?i4ImAMh23oni3dqe0OfuMfkAUyLVq6+bhlpDtiPuopeQu5YpU/U39cC0?=
 =?Windows-1252?Q?YE5UVYBamF/q3QxgEVUAUh2Owpug37fNxUQAVIrwT8I352OQ+3/C6J5Z?=
 =?Windows-1252?Q?ot1wQX2LUaGSGEeZ0X6wlg6RxXaeKg/KuK0+v4VDEcwuDJYAqkPrBZTb?=
 =?Windows-1252?Q?cMcG2DMABQAUd2mM+mxNdZJaUqFo29FyHS5U7FluAP55dBvo3fC/+CKp?=
 =?Windows-1252?Q?Mcvzi9VlUYhfPl24xlLZ30m4mQfTdDCZWbitMv4+214KMvNH9ZpJH3Nq?=
 =?Windows-1252?Q?Noi+lTbmidWg6N29kg+NiuBjQLlDVFSEMQgk2VqsdYHiL7/M5h9Sr3B5?=
 =?Windows-1252?Q?n852wmbII+tVfYwohmMGsxh5QEn/052IPOCKuDJNAwoQKXSOhfikNvEi?=
 =?Windows-1252?Q?VONvXBj9uO5v7aZyIfc3z2agkxdjTZzWd/ZDE6s/zFK7Mfm6oeE4Jsv6?=
 =?Windows-1252?Q?S2iToAI+ZTFewJppxCMKFOnBsPnBLikGasBQC4103lS6e4xRDKX65dTC?=
 =?Windows-1252?Q?c4y0vq+Y/PVrzU5QOiW/pcbBES6BKLN+zBQiJBDXiWWt9Pbqp4JvoboP?=
 =?Windows-1252?Q?W89Y2zcitD2DXHSQqyFMeb6aZwufd9MlmbY8+SpMJVxS1d7I44ju/4Az?=
 =?Windows-1252?Q?7e+i8CnIOVYH3SN1NbI9QNPHglYVgzGakE0t8Bqo7pMi7WkCuTvzc9Y9?=
 =?Windows-1252?Q?1ZadMNbfkviGBIsEA/I2zsbejX6JOi//l+aS4NUoVcmblU/vBD6EYrom?=
 =?Windows-1252?Q?6YFxI6BRnBhGe2WdMjJfqMUG6HnrnhQSP1U39XrUDc77P/1Q4eYbErxs?=
 =?Windows-1252?Q?3ULVJf3/fRCSuymESuk+0OGegp6bev4FiCN1rld360ULRT/+ID5x3mSh?=
 =?Windows-1252?Q?lbxmwVhgLE0fnQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7715060b-3c0a-4884-13e9-08de570c06c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 03:37:09.8110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FNBymdgwPQT4IjJofCUJf1yIuW4r6fr88fI5FQyi0PWy7zqVZlNoupFzMarpMbOT1pykRDecolNtXxoKzUs6GnoGfXGajxa2/z9YxK4YGzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB8300

=0A=
=0A=
=0A=
> > > @@ -318,30 +278,25 @@ static int aspeed_sgpio_set_type(struct irq_dat=
a *d, unsigned int type)=0A=
> > >=A0=A0=A0=A0=A0=A0 u32 type0 =3D 0;=0A=
> > >=A0=A0=A0=A0=A0=A0 u32 type1 =3D 0;=0A=
> > >=A0=A0=A0=A0=A0=A0 u32 type2 =3D 0;=0A=
> > > -     u32 bit, reg;=0A=
> > > -     const struct aspeed_sgpio_bank *bank;=0A=
> > >=A0=A0=A0=A0=A0=A0 irq_flow_handler_t handler;=0A=
> > > -     struct aspeed_sgpio *gpio;=0A=
> > > -     void __iomem *addr;=0A=
> > > -     int offset;=0A=
> > > -=0A=
> > > -     irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);=0A=
> > > +     struct aspeed_sgpio *gpio =3D irq_data_get_irq_chip_data(d);=0A=
> > > +     int offset =3D irqd_to_hwirq(d);=0A=
> > >=0A=
> > >=A0=A0=A0=A0=A0=A0 switch (type & IRQ_TYPE_SENSE_MASK) {=0A=
> > >=A0=A0=A0=A0=A0=A0 case IRQ_TYPE_EDGE_BOTH:=0A=
> > > -             type2 |=3D bit;=0A=
> > > +             type2 =3D 1;=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fallthrough;=0A=
> > >=A0=A0=A0=A0=A0=A0 case IRQ_TYPE_EDGE_RISING:=0A=
> > > -             type0 |=3D bit;=0A=
> > > +             type0 =3D 1;=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fallthrough;=0A=
> > >=A0=A0=A0=A0=A0=A0 case IRQ_TYPE_EDGE_FALLING:=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 handler =3D handle_edge_irq=
;=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> > >=A0=A0=A0=A0=A0=A0 case IRQ_TYPE_LEVEL_HIGH:=0A=
> > > -             type0 |=3D bit;=0A=
> > > +             type0 =3D 1;=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fallthrough;=0A=
> > >=A0=A0=A0=A0=A0=A0 case IRQ_TYPE_LEVEL_LOW:=0A=
> > > -             type1 |=3D bit;=0A=
> > > +             type1 =3D 1;=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 handler =3D handle_level_ir=
q;=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
=0A=
> > This change is not obviously correct to me. It is not about=0A=
> > abstracting register accesses, what you actually write to the=0A=
> > registers appears to of changed. Maybe you could add a refactoring=0A=
> > patch first which does this change, with a commit message explaining=0A=
> > it, and then insert the register abstraction?=0A=
=0A=
> You=92re right =97 viewed together, this change is not obviously correct =
and makes=0A=
> the refactoring harder to review.=0A=
> =0A=
> While the llops interface is designed to handle bit positioning internall=
y=0A=
> (changing the semantics from passing a bitmask to passing a value), combi=
ning=0A=
> this semantic change with the abstraction refactoring increases review=0A=
> complexity.=0A=
> =0A=
> To address this, I will respin the series and split it into:=0A=
>                 1.            a preparatory refactoring patch that introd=
uces the llops helpers without=0A=
> changing behavior, and=0A=
>                 2.            a follow-up patch that switches callers to =
the new value-based interface,=0A=
> with a commit message explicitly explaining the semantic change.=0A=
=0A=
Follow-up clarification=0A=
=0A=
I=92d like to clarify this part after double-checking the logic.=0A=
=0A=
You=92re right that, when viewed in isolation, this change is not obviously=
 correct.=0A=
=0A=
In the llops-based design, the semantics intentionally change from passing =
a=0A=
bitmask to passing an offset plus a value. The llops helpers are responsibl=
e for=0A=
deriving the correct bit position internally. The same model is used on the=
=0A=
other side as well, so functionally this does not change the behavior.=0A=
=0A=
Thanks again for pointing this out.=0A=
=0A=
Billy Tsai=0A=

