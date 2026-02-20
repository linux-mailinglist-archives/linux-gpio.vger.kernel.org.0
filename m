Return-Path: <linux-gpio+bounces-31975-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMoaK2aVmGlaJwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31975-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 18:09:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 527621699C8
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 18:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F6913048566
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 17:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2335530FF33;
	Fri, 20 Feb 2026 17:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KYPSA2oZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7950630E837;
	Fri, 20 Feb 2026 17:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771607389; cv=fail; b=FezcVfUGWkUgTYxOoKsYSIUL3SmifvH8K3/UNBgTq7EWauDbjyq1/nrxpY5zFE272lF+nLx1wDVOBg7zrsegAwLD9sNTUegKDS+rFNjjK1Z7f9vDR41SvRwq1lDbUHh3kfH/sWW2UD8m0Tc/a1A0iO3v7ZuPIb7RhbgFyhFncFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771607389; c=relaxed/simple;
	bh=hWv3CHiyfnezmDh3sZOhAnqZk2uNdjOJ8ia6KH00SVM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Zs6cMp5p2DxyHA7nG/Xf3rXjO8GRcag+ubQ+sqrKWzpnbzIPcvubhXTR4U7BeKFrCjtVWUOAnDxNsUWvHtc/9AGOJGcBgxQWj+dOFD3vHY2DbZvjJiR2FNkoTD+Co8cPEOyw1wKGO/gtxOeMdK3ikKRZEFtNVeZAcf9h4ehau8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KYPSA2oZ; arc=fail smtp.client-ip=52.101.84.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9Xvw7oXTSC+Kw38vhGQ43eq1hbGEtCocJ9FHCbtJZZ/jiVvrB25E7i9vhcpzTVJ6VRsD8dbd66pRF9C1Fbdvtbmh6NvSr08ZcAHIqSqMWVoU6KhHxmACx01yk1z+LpRjdEZXbgpbkkLN4hfdiVSWeQV5+FQO1EXQHBuEbuFPtvrRyj+XBOQ2fpARNZDYQWBKT9htAXPc8T2YwRNYXKQUm8l2DxVaPZy+hDgXceY/+BQfhjpt4n1hG9vn2eGKljUe39Pm6Y+1dWZ9mNlPKG/+U/RrQwMHNF2oYtq8VGX+X5fVNJ2TQcCIpSWg7/FZrlRTItC/MzDG5azWIk1Qxzd8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWv3CHiyfnezmDh3sZOhAnqZk2uNdjOJ8ia6KH00SVM=;
 b=kza3CAlugimP7vfXo3zE9Qy6/5XXPq9Cf0sSl8ZHXc1AOg1oVElDxumJgiRwNTP8pHsDMjypzOF2fVZyIj5cTWJGbR+8h26ErlZOAQYGuhe4Hynal0PXs9Kgx/0MeMtoRz3Q6oUoQgf1zIjemb7KE/S87rYMNCDmUYDlu28jQkATWMCjfd8asxMR5dE0G6/dUGOJ49navRSGiblI1phCjaCwSPS/nOxrdzWay+4xNbClIFSUsfXGTbUjmmJId/96pF3kUVzckICvzBXZs/Ko8CSFBXTc90r1b/Fo1SO8Z7lBxoFBf+1qb6Q4JQ0/tCXB1AOboaZgBU8t/mm6IxlHiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWv3CHiyfnezmDh3sZOhAnqZk2uNdjOJ8ia6KH00SVM=;
 b=KYPSA2oZRTO41/FkFUOmNrnvn+IbR9MWSWz4fwx+QYtAAwMeotUwtLUfZ9eyrif2lj7fQjMe+0gCcq6b+1BPXgWAn3exgVG4BrKhhIg2XzGaPIiWLBeCGTrItfgu7c1WGypTd+Iw/mCj/qZM16RaORZILNZqghh2fszTNkQImSy63+03xZVKzdplk67XL1cUJyhE2jPnfE3Y/euwiWyEqEOjgAfj0slRgfX5Xi36AtDptBjaUTn9aMWb3kNe8p2FJJzP4PtijPe0py/gdMrewMpowuuWgxvJ3Z77teJfGXS6aAEMTxTSUsVv8xSI5Zgufo0aIQEJpKQoaAHFYF6g/Q==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV2PR04MB12364.eurprd04.prod.outlook.com (2603:10a6:150:321::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 17:09:43 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 17:09:43 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Frank
 Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcoou03nd56nKeq0az+i4yGN2gcw==
Date: Fri, 20 Feb 2026 17:09:42 +0000
Message-ID:
 <PAXPR04MB91851BF97AEF1C5B728865448968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <PAXPR04MB918582EE33F7BD5C26259BB2896BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <7669d7dd-96a5-48a9-b051-875e9fbdad58@foss.st.com>
 <PAXPR04MB91858E7125B2A4F21DDB78FD8968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <c9d73e40-ab27-4403-9ff6-a3503568fe3d@lunn.ch>
In-Reply-To: <c9d73e40-ab27-4403-9ff6-a3503568fe3d@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|GV2PR04MB12364:EE_
x-ms-office365-filtering-correlation-id: c3486c65-5b5a-416b-bb92-08de70a2d724
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dG9CV0VQVjhqVlpGQW82eVJuUjMrV3NRZmpmNGxMSERyV3dTT1RQUWRKV1pt?=
 =?utf-8?B?Q2xBWmFZTkVEVnpvZnhLMTJBVmpENEY0K0RYNERkZVFkUnp6Q3lFTE9TdDU1?=
 =?utf-8?B?ZktHelVQTjNHTEhyMHVQNXh2VW1vSmRvYXpBeE5UM3ZnemxlQ2lreU9zTlhj?=
 =?utf-8?B?aE14NGcvT245bFBpVXRxQ3JDS2tJcFR5aU1yZ0xKWWhNK0Z1eUYzWGxVUk1I?=
 =?utf-8?B?cmVmVitnb0pWZ01sTmZGUkk3czVhdm45VGpCaE50Mmh2eWNXSjV6elpwU2dQ?=
 =?utf-8?B?bmdhaDdYV2x5cDhtVjRTWXpTNzl3MWVTRnliWDBIUUYrd2pJK2JlM0poaFls?=
 =?utf-8?B?QmR3M1ZpZWQyQVV2ZVI1MDMyOFU2Y0FnZzIwbkVURnc3c1lxSnA0ZVl6OHQ5?=
 =?utf-8?B?Smd4d3hIRmxoQ1IyeVFVTUZ3T2RLb1lKL1ZidC9kMUd1YUd1R0RBUW5IYnUv?=
 =?utf-8?B?SzIrWE85d3hic0lCNnJsUklJQ1hvN1AvcmJrQ1o3RWkyMktqSWQ4aGluQStq?=
 =?utf-8?B?UmZnb3JwenJTTFR5VlBoZE5yL0RYRHJBb0pBSUxhQWZpUGxqRlpRaTNxZWla?=
 =?utf-8?B?TERXMUllaDB3dWxXYk9TbWsyME9MTUpRYXJKNU5hRWJLbW16TnVuYS9wSDdt?=
 =?utf-8?B?Um9ubGFEUGUreFBiMll3V3NLM0FHRVZNU2JHY0t6cnFGaDRrT1pkSkFTeWNq?=
 =?utf-8?B?Q2xvYkVHWXNwTmUyTFFGaXZrZHgxTDlRdUJUWWhUcnBvMzFwZExQRUs2dkxZ?=
 =?utf-8?B?TnFUZTNLWkVjbEEydjNYd0wzbXhKdXA3NWcwRkR3YlBSVkpCYnRzdTRIV3g4?=
 =?utf-8?B?V2wxbTZEYzFWUWphdC9TMHRXQm5lV1YzSXdDZVFyMkFWeTBuV3RPT1A0S2p3?=
 =?utf-8?B?bmRPSnV3QW1tb1E1bkRSMDNEYnhVK0RFZkdtMHhtbHFnczJsU0ZiTTBOTE05?=
 =?utf-8?B?ODM0QUJoRVRtMW1mczM5Vm1HT1BiSFIxNFhDc1hybEd1K0pHWXY0VTBRR2Rk?=
 =?utf-8?B?TGNlVUxWQUdxM0RtakhwQUp2RU5OZ2pGb3NrcjV4bURwMXNtU1Z6TThFcnB2?=
 =?utf-8?B?a0U4djBNcERJUnJ2QTRPWlMyOS9kUm4xdUU3QUdYdW5nT2swNEVpR21FcCt3?=
 =?utf-8?B?ZTkxRzZoKzcwZU5oZXlHQzdWZzVYd1VjQ3E5eWJjVm55YjhkSm1DR05XVTkx?=
 =?utf-8?B?UlRGUFF4aTlIck9ldm1mN3VCMlkwTXg4Ync2VW9BaCtMSGFDeGl5S09nZFh5?=
 =?utf-8?B?bzVjbE8xK08wVW1yM1dTb1JLNjV3MFE0NTdGc2VwQjRhYXhySXViTStOQ1FC?=
 =?utf-8?B?b3pZRGx6R3B1QktCZjZjeTlaOXZHNnB5c2RRYnBqQWdnK0dLVUhLUHFacHdZ?=
 =?utf-8?B?U0ZVK1NQY1BJQVVCSGxzUVJITTZ4alRxMnJ1OHlpRHN0N0U0Lzg0WW5lZit6?=
 =?utf-8?B?YUxJRC9tSjlzS2hMbkVGejdjMDl0a3lIaG5Kc0xWRE1nZWNpbHliQzdGY0po?=
 =?utf-8?B?eVpzU05zR0hKREJRTUtrSmk0cWpOcHNFcjdRWVpERnRQK1JMWWIzclI0Zno0?=
 =?utf-8?B?RlpIVlU2YzRTU0Y3K0Q1L3M3blAvalY0ZUlCMStHd213S0hEWkhZUEYyM2Np?=
 =?utf-8?B?YlRRUDVaVW1vNGZRNnlUcFRVd1FiVXNFdmlkU0FIdEVMbUJ5dGdDZGIyTVFs?=
 =?utf-8?B?a1Q2U1NLNDcvT0hTbU1pUlE3d05SUVZnVXQ3b1pkdjNma3A1OUcyQUttTzB1?=
 =?utf-8?B?bndoRUJaTkppcmFWR000N0tvZHBzbUNkLzIvOFJPL25icEtuWkxaZ2F1Mkk2?=
 =?utf-8?B?Z0wzTnZ0cC9kd05GdmxMbGp2MzN5VWJnUGZqZDV2ODBSNkhtRjhzeUtoazZt?=
 =?utf-8?B?dWkxUTRBM1p6UDhnUzBXVHZHeGVTRjdKaFVrRTZtQk9LOURzbUhlL3dhcmda?=
 =?utf-8?B?RnA1MzNSMFFUbS9vcTV0Nms1SVRxdVlOQkdoQjlyWkpEMVA3N01RSjJvWGpY?=
 =?utf-8?B?cFVrL2VhczhlakhNMTFsU3F3bmc4UnFrQXpoZ21aVzZ4dGhQTTNMZFArOGFm?=
 =?utf-8?B?VGRXbUdHaVJlUndYY1YrVy9acUdhMU1SZXVMZ0xEMi9QTUlqS3MxM0NXbE15?=
 =?utf-8?B?Rk91eXNQL1h1RHJ4QVNSZE5hNWppdXQ4WWpwR0FiT0p2ZklUTU51VlBuenZi?=
 =?utf-8?Q?O17U+9tC3e06EcDcWNwe924=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S2FtUEtqMHNoQ25yUmJoNGtjTW9SSnlYeXEwQk9sdVhsZ0xTQU1zdVdWZnBm?=
 =?utf-8?B?V3ZWNWszUjBrbHVxbDNmcm1kWWpPVDE2VUNEd1AvRk0yY3pQY1JYUGxOd1lq?=
 =?utf-8?B?MmJIblErTWJneW14dURxUVFPaVRSVHIyK0lWMXY0L1VOVXIwTGZJTWhKSStl?=
 =?utf-8?B?OGExNC8rbDlKQkhkb3dTUFRrcnBVRHBIajdvdG5jalNYRGdPMmNWUlVoNnlm?=
 =?utf-8?B?ZCtkSTJKSzBFRitzQmpCeXlWSS9ZSTdmeFJNNmd3Wkg1d2srQzJEU3JWa1ZR?=
 =?utf-8?B?RWtGZDVSbHNUd0Z3T3d3Z0phTDJFNU1wamNUbDdFQzFrYjJFMEVybG9YZTZW?=
 =?utf-8?B?cHd1ZldSY3FKeHRJNVFMMjA5ZEp1RXBmTTNya2xZZXAzcytpTFkzUVFQZDJx?=
 =?utf-8?B?QWVYanZ1R0ZhM3gvOE5qOHdOdHIvOC9PL1hERGQ1UVduUU5YZ0NmUkxFNUhS?=
 =?utf-8?B?am9EMjRCZk12UkFCQ0JGekZBdmxia0lZVGZ1ZzlhczF6TVYwbVNuaXdXMzEv?=
 =?utf-8?B?VFJEZXkwdENlNEd6VDJ0UWNWUGpXR2MwSk9rZTMvelc4RlVuQms5Ymo1Q2dW?=
 =?utf-8?B?ZlhRWENwb3pNemlCc3AvNlY5azVOV3pWb0VMeFF3SFVsN0VZTUpHM1B6YlE0?=
 =?utf-8?B?VmtoLzBjcGIzUGR5VmNpTVJrVHZZR2hHQW5qVjVKNFU5STR0SlprWG1BZjdo?=
 =?utf-8?B?Rm53MXhCT094SDZjc0lnTzdnTURiWiszbHU4cUE1K1BqVUpOdjZCRUZtWUFh?=
 =?utf-8?B?RnlFK3A1cWJQOWxRcGFvT1prbkhLS1BwWG04VDRkUzAvRDExMkFPVVlZN3dM?=
 =?utf-8?B?MmR3M1RQTGY4Yjg5VDR0V3gyaFlmQ2JQN0F6M2RLSEpmU2NwV0E1UFFlR2h5?=
 =?utf-8?B?VXA4U0ZWeFRTejlpcVV1LzdZWFZ6UGZ6WFdiQS9HUWJQWDlQbXpQQUpxZFlk?=
 =?utf-8?B?V1htZ1VNYktqNXB0NzRPYmtWb3pWeENXUzRWVVVjVWpJRFR2UExCWDM4TWhI?=
 =?utf-8?B?UkRhQnB0UEsxb0d6N1Y2U1JZdm85MmZNZDI0RzZUS2pjYmFRaG4wN09lWEQz?=
 =?utf-8?B?emVEaWNyemVpOWJiRG8ycEc1TTc5TTk4MFZ6OWR3Umtha0JFK2R1amNuVjEv?=
 =?utf-8?B?MnU4RFlsQUszWVhuVzlLZnpYZjUwTURnczBPd2pKTnp0aFdyUUdkS1hML3ZX?=
 =?utf-8?B?Y01BT1Q0cURnSmJSM01aV0xDOS9VVVd1L2JsZ1prM2p5OWpJa0pVMytMWHZZ?=
 =?utf-8?B?MDBqVFNFSldtaWV3ajR6cVIxZG0zQlFnTVYyOWFwdjRFS1NDdGg3ZkZZOUZO?=
 =?utf-8?B?dWJRM3JjVHFFMS9vZ3dydjRGNXgwTUZza050Vm5QV2FHVmNMVHZoUXlTMzBM?=
 =?utf-8?B?UmF4cjVuTTVMRGh2cVJoRVI5MjZFeXlLUHZzUFovVzNQOEFWT2lUWnk3ZVVB?=
 =?utf-8?B?YXp5akdXQVM1STk4RnV1c3FzOFBmcmlzc29sVXlMa3JaQ0o4U3R2Uk8zYlE4?=
 =?utf-8?B?R1o2alB0QzJrNWtGUSt4akZDMFNzbjZSa2ZIUE1UMStHdXV0V0l3RXo4cE84?=
 =?utf-8?B?ajVxRjdrNGJQVjJwcnJxTEJsY3crcVBhZWxINDVPUVR0QjdpcXJCZVQ1ck92?=
 =?utf-8?B?YzB2ZW54d2xjY1NsdGtla2x2c3hPWHhqeFFjZHlsUk1Ca3Erb2NxNXVyTnpu?=
 =?utf-8?B?VFgxMWpNQXZxRHR2eDY3a1hMNTlScDQ2VVd2OWVGa2x0S3pFcTdld1RXdU01?=
 =?utf-8?B?TldiTWhub0hFQ0lCV3ZyeHl1T3BRRC9tYmp1VFQ1YU5GTm90QWdUeE82akJF?=
 =?utf-8?B?WjNudVpSNnllOHAzQ0tQck1JVGpvMlY2ODlGU2lQYjZ6ZlZDdGl4VWpKRndW?=
 =?utf-8?B?ZjcrUGI3d0xQQ1NyV3hXemdpOFNqZmp3WWdGVnNxYTQ5TmEvZnE5b3Nmc2F5?=
 =?utf-8?B?TEpXQ08vcWdrbDU3ay94U0RnOWttUXJ2RlNuaUJwTUxZNDRxR3M1dzFPWERp?=
 =?utf-8?B?d1NJVHVqaDJXcUp6TTNNZnhFTGJ5RnVEb2Zjc0RJaFFUaWtxSWY2blJnc2pX?=
 =?utf-8?B?bGN0RVZkSFhrVXJmNHFiT3lQUVJranBkaUZqNXVic0pUaTlzS2w3M1JRVS80?=
 =?utf-8?B?dHRhejl6WEV2cUdvd2F0R0lHQk5tendTMnFTMW1qT0FQeVBtK0ZkNVltL2pV?=
 =?utf-8?B?VnpPMUNJbWxkNDRRK2F6Vk1sS0pPKy9aV21EbzFqVUZQajdoU09rY3BGUHdl?=
 =?utf-8?B?S2d2ZTdFZG5RK1RETlZTMjR1UVJ0eFY5cnRUNGg3TjNYMHlocG04a0tKbzhC?=
 =?utf-8?Q?jBmSSiKCAfvFN3T3fx?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3486c65-5b5a-416b-bb92-08de70a2d724
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 17:09:42.9218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cOExrO0cJwR9cKmBBQf6/ywI5vxuAuvLrIfRSl1lSqfLukG66sy8OK27OkjBG7hoDGjDsPkJLkj31jAG9eRXDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12364
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31975-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
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
	NEURAL_HAM(-0.00)[-0.996];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 527621699C8
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IEx1bm4gPGFu
ZHJld0BsdW5uLmNoPg0KPiBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDIwLCAyMDI2IDEwOjE5IEFN
DQo+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPg0KPiBDYzogQXJuYXVk
IFBPVUxJUVVFTiA8YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbT47IExpbnVzIFdhbGxlaWoN
Cj4gPGxpbnVzd0BrZXJuZWwub3JnPjsgQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBrZXJuZWwu
b3JnPjsgSm9uYXRoYW4gQ29yYmV0DQo+IDxjb3JiZXRAbHduLm5ldD47IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprK2R0QGtlcm5lbC5v
cmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBCam9ybiBBbmRlcnNzb24N
Cj4gPGFuZGVyc3NvbkBrZXJuZWwub3JnPjsgTWF0aGlldSBQb2lyaWVyIDxtYXRoaWV1LnBvaXJp
ZXJAbGluYXJvLm9yZz47IEZyYW5rIExpDQo+IDxmcmFuay5saUBueHAuY29tPjsgU2FzY2hhIEhh
dWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgU2h1YWggS2hhbg0KPiA8c2toYW5AbGludXhm
b3VuZGF0aW9uLm9yZz47IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gZG9j
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgUGVuZ3V0cm9u
aXggS2VybmVsIFRlYW0NCj4gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0g
PGZlc3RldmFtQGdtYWlsLmNvbT47IFBlbmcgRmFuDQo+IDxwZW5nLmZhbkBueHAuY29tPjsgZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiByZW1vdGVwcm9jQHZnZXIua2VybmVs
Lm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IEJhcnRvc3oNCj4g
R29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0gg
djggMy80XSBncGlvOiBycG1zZzogYWRkIGdlbmVyaWMgcnBtc2cgR1BJTyBkcml2ZXINCj4gPiBF
eGFtcGxlOiAzMuKAkWJpdCBBUk0gdnMgNjTigJFiaXQgQVJNIChBQXJjaDMyIHZzIEFBcmNoNjQp
IENvbnNpZGVyIHRoaXMNCj4gPiBtZXNzYWdlIGhlYWRlcjoNCj4gPiBzdHJ1Y3QgbXNnX2hkciB7
DQo+ID4gICAgIHU4ICBpZDsNCj4gPiAgICAgdTMyIHNpemU7DQo+ID4gICAgIHU4ICBmbGFnczsN
Cj4gPiB9Ow0KPiANCj4gVGhhdCBpcyBqdXN0IGEgYmFkIGRlc2lnbi4gVGhlIHBvaW50IG9mIG5v
dCBhbGxvd2luZyBfX3BhY2tlZCBpcyB0aGF0IGl0IGZvcmNlcyB5b3UNCj4gdG8gZGVzaWduIHlv
dXIgc3RydWN0dXJlcyBjb3JyZWN0bHkuIE1heWJlIEFJIGhhcyBubyBpZGVhIG9mIHRhc3RlLCBi
dXQgTWFpbnRhaW5lcg0KPiBkbyBhbmQgd291bGQgbm90IGFsbG93IGEgdTMyIHRvIGJlIHVuYWxp
Z25lZCBsaWtlIHRoaXMuDQo+IA0KDQpMZXTigJlzIGtlZXAgdGhlIGRpc2N1c3Npb24gdGVjaG5p
Y2FsIGluc3RlYWQgb2YgdGFzdGUuIPCfmIoNCg0KTXkgcG9pbnQgd2l0aCB0aGUgZWFybGllciBl
eGFtcGxlIHdhcyBzaW1wbHkgdG8gaWxsdXN0cmF0ZSBob3cgbGF5b3V0IGRpZmZlcmVuY2VzIGNh
biANCmhhcHBlbiBhY3Jvc3MgYXJjaGl0ZWN0dXJlcyBvciBjb21waWxlcnMuIEnigJltIG1vcmUg
aW50ZXJlc3RlZCBpbiB1bmRlcnN0YW5kaW5nIGhvdyANCnlvdSB3b3VsZCBwcmVmZXIgdGhpcyBz
cGVjaWZpYyBzdHJ1Y3R1cmUgdG8gYmUgZGVmaW5lZCBzbyB0aGF0IGl0IGF2b2lkcyB1bmFsaWdu
ZWQgZmllbGRzIA0Kd2hpbGUgc3RpbGwgbWFpbnRhaW5pbmcgYSBzdGFibGUgb27igJF3aXJlIGZv
cm1hdC4NCg0KRm9yIHRoZSBycG1zZ+KAkWdwaW8gZHJpdmVyIHNwZWNpZmljYWxseSwgSSBjYW4g
ZHJvcCB0aGUgX19wYWNrZWQgYW5ub3RhdGlvbiBpZiB0aGF0IGlzIHRoZSANCmNvbnNlbnN1cywg
c2luY2UgdGhlIGtub3duIGNvbmZpZ3VyYXRpb25zIHdvcmsgd2l0aG91dCByZXF1aXJpbmcgaXQu
IA0KDQpUaGFua3MsDQpTaGVud2VpDQoNCj4gICAgQW5kcmV3DQo=

