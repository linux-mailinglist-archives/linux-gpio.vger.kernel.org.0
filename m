Return-Path: <linux-gpio+bounces-35813-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKH5IY9b8mkFqQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35813-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 21:27:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A5A499C69
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 21:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA098302296B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 19:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211B337BE87;
	Wed, 29 Apr 2026 19:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mklDYJCo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013016.outbound.protection.outlook.com [52.101.83.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF4A34E777;
	Wed, 29 Apr 2026 19:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490776; cv=fail; b=aTDCikvN/WIyf5JVzi/D+eaA3fycuWJFXKISNSnF6+YDfcoEGS+kDwKE5UfI/B5RfUaUcDDYRuA3TiEOIo9at6WFh0RzUjkvZ4Xa++fE75egR8wV0hT2J7lOSgNk0OYSCu1XTevRypD0secrkIiEGUy757MTi9GOx2Mf6QkOigc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490776; c=relaxed/simple;
	bh=DrJrxb6p/3eJqIY1iqoI3hGTQk7UylxWzQztUTCGoWQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q+33tsC3Pd4ueWt7NKrsiz12MG6J07mGvhj0KHz9tK1ZSuz6hRupdP1LToaqRoSuhZMcoMJqf/YlPDrkkEKdQakYvGHvQBf6Y42di+T5xXhQsvP+UzOCjl0AqxRSzqrJi6xQfSEjyV/3LQI8JGkt/fBSDs7Q2Uz2jhYAQXzkn8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mklDYJCo; arc=fail smtp.client-ip=52.101.83.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggExVuJxxZgnrGktKhjurswdnTyrGjRHfnTnWJwKE3d6vJ+qJOkEiJwwDVz6ipDEg6V0eJC499OCfl5uYKY/Al4FVN2UWARpXXnNbp8UE3b4Ut7OsOIaZjPVNQk5In4OGfiX3pOtvFX+SiF3T5GVAdHFYlJDsI0xMvehprSncKHE3JhhMHEqPLNnMurY2n+JssnGSkeMOAW4GRxyuI0mBqBTptvIcxNjAVdADELuC3cq9OOSNJs+yFvOxxfHP0RLkj+ISkPVB0NGKsTcjiyOeRAaRBmqQN4s87iXQaJIeNVtcC+52Bki8aafQ9kn+530funugqtOATmnFew6xNp2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrJrxb6p/3eJqIY1iqoI3hGTQk7UylxWzQztUTCGoWQ=;
 b=fa4Wq+1kM5o/1CIbJvf+5dTH6UJK9ybtSOgxnKuyjInlHJnpUVpI7ZO1xSmBZzEbPImiI3z3oyEYeWfNT33dRVYKu2nGjE3ToR5u8g0ZZQe3hNd10FjxjgaGeqJsGsZcg3MmXP7kcrJUI+1dF7qOamXaGBAtpFfgPcD+K0Bhg+Gxa4psWEHBH04UjO97e5i0I07sPBv5IatHg8NtnsXaYNuWflXbEFi0l/4HX8l8v26KAYtvjOiaqJdE02jQt6gMVN2WGcOffkJcoK7iyTkz6Iw4yCW1d0++JHAbmugbKSQTS5NmrD3wHN+uEb3s+b2BjGoo5wgUb7H32ImRNc5Gvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrJrxb6p/3eJqIY1iqoI3hGTQk7UylxWzQztUTCGoWQ=;
 b=mklDYJCox/vARAaYbcsAGI1q3xYfnLFf4IkyJnsZ5OpHwOaOJe1LEbfvg2V4sZhogu2Tiz3Um36g7pZWUDXQPg+dUjMWpGWDO4alPeZWV4qCOsOaSjftSFWgPqn2RzRX1pusotE7nzQroDs4SyOgx/k0pTIHyhBOPoekcVI4jwa0hCOhqqdiJdtawoEgPiq1kt8Ql/YQUydmGQqBlasiKT4fd89CimMM4icc8LNnAbil8Orj6+CdKB7iB0h7mnaO5pd33qttUQ3MPzPt9D2DS7is4lJOn9viTHjKFTQ/PG8h/Orr2bOER+2umwH9b7+WzQwohdR/Oaguj85T7JMV9A==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU0PR04MB9672.eurprd04.prod.outlook.com (2603:10a6:10:31d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 19:26:09 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 19:26:08 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "Padhi, Beleswar" <b-padhi@ti.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHc2A4HfEbusLUFzkmaQPaOkaV23g==
Date: Wed, 29 Apr 2026 19:26:08 +0000
Message-ID:
 <PAXPR04MB918585D7D864F499CFE8179D89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <29485742-6e49-482e-b73d-228295daaeec@ti.com>
 <PAXPR04MB918568939EC7DAEB4BB6C8F989372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <32c119af-96ad-4da0-86f2-cdc4ba57ef0b@ti.com>
 <PAXPR04MB9185C7741DCC422212F952CD89372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <8c8cefaa-7d9e-4b73-b92f-40cb52b37f2e@ti.com>
 <PAXPR04MB91858D4F2549FA068D7ECCC289372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <a067452a-9a8d-45ea-8bef-b44f851da7b2@ti.com>
In-Reply-To: <a067452a-9a8d-45ea-8bef-b44f851da7b2@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DU0PR04MB9672:EE_
x-ms-office365-filtering-correlation-id: 4ee2f8eb-8f56-4e96-0724-08dea6252a69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|22082099003|56012099003|18002099003|921020|38070700021;
x-microsoft-antispam-message-info:
 lK4ZMBinOOrXVIV5btwfIgRZE3WDz+pkt/BRChzpMOw6yjkoKhVIDeSRL2mo2f0D9O4EsRzoTmVMxcl9S6sJHtkWChdZ/nu9hZmTK0M4LW1swSnIM6lObNzd1Eg4P8XMD+9A/2twqzQ5CpZVH8pU1uOvHNDSXf0Tv/uqgBboHS7KRrdrY/twmxBdeF9XwzbXc+QfSDCQLEWVKTNASyZVejHY7kxURxIDOv+OAo1P7eXO+tGaBAmoJkMk+X5UWxHTVWVk55Cg46Cb5OZYoLqtC+E2n7kzuaMfP6h33MCh0zchgm+9ltZcT25ogdHOLLZL7osgJ1cW+h5kH+Hb7UEjE8l9OjoMX57BQVz27IhJi7mDxToaJcAsbIOBytECvlXvkfUR94auEg8AuwajMlTdZZqaxrOK0eEGYVXn6ahRMsu9VoALTr5he3nYvRkCF3Th/amWLTPLGNO7IvDc5oMyV6CTqHcAGSh0Yk7BS0nkOuO3n7rWEg1xn8ZmpSsYLhu7BPm0N4xfFLQqlaKHxCq7NobojxeVAvBkG9IgsFqW5iGf8TLH0mjvCT0g3tY4cuyjsJb6wY1EZxXIiUYQASyabRfgSVTuebYqOnGu2/ZnDmoMKeqNnAA+TJwbalSvzXFYpmBWS+GMsoGfJTFENjtwj64JtqHoJc9hK5TuLui3zbiQkS/Z2Q7bJT3G17su3HDZzjdZENiP+AL5X1dNh/EAFmp0VXRi6cr/oKM5YSeRGtM22bTDIeC5I6LmlKPUaFgi2XCfKikGCkhronkUoLFTlfEkhsibuKhcTZOcffdaF9GjtkznNDZGShvnCDGKpU4F
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(22082099003)(56012099003)(18002099003)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ak5aV2RpUHA1MDZGNXBvMmdyMzJGV1J5U21IWCtmY29wSFp2a1gxc1VBQlJJ?=
 =?utf-8?B?K0MwM0RTclQ3eHJJcjlBZnJiNW9HdTBVbDBVQXkramFJcDMyWWZmS2NjMG1H?=
 =?utf-8?B?UFpXeVNzTzFERllEUzEzTUxGWXRJOElnbHJweUVnNVVaa2RhL0o0Z0EwcW4v?=
 =?utf-8?B?SExwbExKM1dzdmp1c1Jtd1FjSnArbTZiQm9lVUhuNFFhOHlyVHlraEt6NWlN?=
 =?utf-8?B?VHM2S0JLb2UzWTVZdlVaMkhVdXo1RHAvSWU4SUpsTU04ZGdVUEt0QitRSC9w?=
 =?utf-8?B?MGp1ZmZsWXhxSkN2Y3M1SlZ1SkpqOU9YeXR5KzhGcEE1NVd3aWR5dG5STGUz?=
 =?utf-8?B?TjFTSkQ5ZlZyT0hpTXQvYVJoRFhBV0s1VDFBUDFDV1BxbnVrR05taFgvK1RY?=
 =?utf-8?B?T0h6dFdXLzhSVmJtOWYzVkh3bEdqOW9sT1EyUXNSZmVpK3g3WVFncWQrTzhC?=
 =?utf-8?B?MmJ2eHNBMDZ5akY1T0ZBdmlGeldDdElaZTZWTk0xL1JncFUrV1Yzang0a1F4?=
 =?utf-8?B?Tzc0YVlwSHNnL1MvMCt4bVgvdEwzYjVmMVRTa3pWUWZPSjBwMHhweHN4cXZl?=
 =?utf-8?B?Y2JBeC8yaFlYRWN1U1d3bmZwYWQzUW9Wa3N2Zyt2cWxhcWFBZDFWR3lzVi9V?=
 =?utf-8?B?VGFtMXpvTEVMZEgrM1hDeXVhbzdFTWJVU0pJVzVEMGFLdThrNzhwdEFiSjFp?=
 =?utf-8?B?am0yNGNaV2x4R2FDOWViRHdYRkJSQUVFUnVieXhHUGZFV3IvYnh0Mm9JbmZM?=
 =?utf-8?B?VG9nVHRwTFhxVUZ4WWhpaUk0T29iem5ZM3VnRmlBQUt5OXl5bTRESWdrbm0x?=
 =?utf-8?B?TnlZRnhWU1hHZDl0WHVtVTAvSUJTRXZLSWp4dUEwUmZGQ2ZVZEJCNktQcWhH?=
 =?utf-8?B?WEJKdHIrR2k5MzZjQmVpU1BvaHcxNSsrT1E1dmF5VWJKWGpnMFI3Z1RPMHRM?=
 =?utf-8?B?Q3g5QVN3TzJONDVLd0lJaHdlL0FvWWtTOWkzK1c4QllCL3Y2d3YyaEE2OUh2?=
 =?utf-8?B?d2taek5TTG5pWU94Nnh6QXlZM05rdXVQN0FjYTdsNDJWaDJQT1VmajBrTjl4?=
 =?utf-8?B?TjF3Vi9aRzhWeVJMVzVPVEZncXZJRTFTWGxZc2o2c3RUL25iU2xHK3J3ZWVp?=
 =?utf-8?B?eFlaVmlOaDE4QnlRN05xcFB1Wk1VWmdvM0pySEhjcGE3ZGpab05ZbjBPN0du?=
 =?utf-8?B?L3R5N1plTXB0QlhCU01HOGNHSHdCNng3RktZOE95TUdRUWRFVk5vV214YWpI?=
 =?utf-8?B?V25EZXlYamdHWmZWRTNqOFIvMVgwZ3RueVlIQzFMWldVaEFrSVRXaGh1c2py?=
 =?utf-8?B?alIzMXBkM1FoUnB1anFGaHQwMStIVW9aSHhnWjRVc1hKVmJrcmpZUEh3aDc2?=
 =?utf-8?B?MUxWNDJNUW9zS21NUVRUa1V1L2FMSjhtTlAwSmVNdi9xbFhTTU1kZ1dEK2hM?=
 =?utf-8?B?MU85UjAybUxQWG9ROEk3eTRjL2xpbUVhUVYxWkNqdkZReG1XS3hESk4yUmtH?=
 =?utf-8?B?eTNHSDNrS0wxV2RJZGpkZE51YkJRc0JHU2w1WnNXRlB3UlplWjBTL3RrUmFD?=
 =?utf-8?B?TkVSQWxMclRHaEhKRzF4R2IwMElMd1FQdVZ6bE5WNm5rK1BkbmFkVnhzSzMy?=
 =?utf-8?B?cGdyYnUzVEh5dWcwazk2R3d0a2pOZXdsaXVRREIrMFE0Z0FzbUxzNlVwY0p6?=
 =?utf-8?B?ejQ4Z3J6WGsweFlqZHdTR2ZnQlZtRnhvOWE5OWZ2R3RWMUJvb0tPSGZVWC9i?=
 =?utf-8?B?NkZMRldTeEFJSEZaUjNNUUVnbVRia1hpeFFIS3lNeHZEbHRqTDJzT0QraEUz?=
 =?utf-8?B?WHRMamNYcUlXV0NQY0dHNXJZU0xiWnFZMmM5TldOMnBPb2Urc1VLajN6bnQr?=
 =?utf-8?B?WmgxeXY3WjJQMHoyTThDTG55YW0wSFAyNWV6elB3OWZEeU1mUmg4eW4wVit3?=
 =?utf-8?B?NDJaM1BaQmZQT2pON1dOM0FqbjI4QVUyVzRnajgxUW5UMkI0bmRRY0Z6MVlv?=
 =?utf-8?B?MWRseDhEUDRFbUtZWVhNN0pwZUVtUHdsbS9pYmtGcjZ1OFZyTHI4U0pJOTlS?=
 =?utf-8?B?dlVVejBERnFLbHc3bG1nelVnYmpwODRoUlQyUlRkK3lDcmhUVFpqaXN1L1VO?=
 =?utf-8?B?ZzFFOWw3SkRkTTFKZ3Rva1RrZ2ZZczdkeW9zUmxwdGQyOG12bXJJaVlUdmYy?=
 =?utf-8?B?RzJBTHBySkF2bG1hQjc1N081ZWZ4d3RDUW5LWEk3c0pYMnpMMDZaWUlFNVUz?=
 =?utf-8?B?Z2dueE9pQk8wT2ptRlc5LzkvTWZOTHhMOEpRZjJadDlheXUzSENkaVFndjh3?=
 =?utf-8?Q?zkHt1fT4TrtE9uK5+q?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee2f8eb-8f56-4e96-0724-08dea6252a69
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 19:26:08.8527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yj0TgFgCnMZcPRaRPIQxQPQOj7TJP4NYGN7qmklIdpYhPgJBZlIJVDs0S9cSqlYiwRz6Z1rH0ppowCFh/x8QpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9672
X-Rspamd-Queue-Id: D5A5A499C69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35813-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,bgdev.pl,lunn.ch];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGFkaGksIEJlbGVzd2Fy
IDxiLXBhZGhpQHRpLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAyOSwgMjAyNiA5OjM2
IEFNDQo+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPjsgTGludXMgV2Fs
bGVpag0KPiA8bGludXN3QGtlcm5lbC5vcmc+OyBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGtl
cm5lbC5vcmc+OyBKb25hdGhhbiBDb3JiZXQNCj4gPGNvcmJldEBsd24ubmV0PjsgUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyemsrZHRAa2Vy
bmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IEJqb3JuIEFuZGVy
c3Nvbg0KPiA8YW5kZXJzc29uQGtlcm5lbC5vcmc+OyBNYXRoaWV1IFBvaXJpZXIgPG1hdGhpZXUu
cG9pcmllckBsaW5hcm8ub3JnPjsgRnJhbmsgTGkNCj4gPGZyYW5rLmxpQG54cC5jb20+OyBTYXNj
aGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+DQo+IENjOiBTaHVhaCBLaGFuIDxza2hh
bkBsaW51eGZvdW5kYXRpb24ub3JnPjsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LQ0KPiBkb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBQ
ZW5ndXRyb25peCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFiaW8g
RXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjsgUGVuZyBGYW4NCj4gPHBlbmcuZmFuQG54cC5j
b20+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IHJlbW90ZXByb2NAdmdl
ci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0tDQo+IGtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsgQmFy
dG9zeg0KPiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD47IEFuZHJldyBMdW5uIDxhbmRyZXdA
bHVubi5jaD4NCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2MTMgMy80XSBncGlvOiBycG1z
ZzogYWRkIGdlbmVyaWMgcnBtc2cgR1BJTyBkcml2ZXINCj4gT24gNC8yOC8yMDI2IDEwOjA2IFBN
LCBTaGVud2VpIFdhbmcgd3JvdGU6DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4gRnJvbTogUGFkaGksIEJlbGVzd2FyIDxiLXBhZGhpQHRpLmNvbT4NCj4gPj4gU2Vu
dDogVHVlc2RheSwgQXByaWwgMjgsIDIwMjYgMTA6NTMgQU0NCj4gPj4gVG86IFNoZW53ZWkgV2Fu
ZyA8c2hlbndlaS53YW5nQG54cC5jb20+OyBMaW51cyBXYWxsZWlqDQo+ID4+IDxsaW51c3dAa2Vy
bmVsLm9yZz47IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz47IEpvbmF0aGFu
DQo+ID4+IENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPjsgS3J6eXN6dG9mDQo+ID4+IEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29u
b3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsNCj4gPj4gQmpvcm4gQW5kZXJzc29uIDxh
bmRlcnNzb25Aa2VybmVsLm9yZz47IE1hdGhpZXUgUG9pcmllcg0KPiA+PiA8bWF0aGlldS5wb2ly
aWVyQGxpbmFyby5vcmc+OyBGcmFuayBMaSA8ZnJhbmsubGlAbnhwLmNvbT47IFNhc2NoYQ0KPiA+
PiBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4NCj4gPj4gQ2M6IFNodWFoIEtoYW4gPHNr
aGFuQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ow0KPiA+PiBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9y
ZzsgbGludXgtIGRvY0B2Z2VyLmtlcm5lbC5vcmc7DQo+ID4+IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtDQo+ID4+IDxrZXJuZWxAcGVuZ3V0cm9u
aXguZGU+OyBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBQZW5nIEZhbg0KPiA+
PiA8cGVuZy5mYW5AbnhwLmNvbT47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0N
Cj4gPj4gcmVtb3RlcHJvY0B2Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7IGxp
bnV4LWFybS0NCj4gPj4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGRsLWxpbnV4LWlteCA8
bGludXgtaW14QG54cC5jb20+OyBCYXJ0b3N6DQo+ID4+IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2
LnBsPjsgQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPg0KPiA+PiBTdWJqZWN0OiBbRVhUXSBS
ZTogW1BBVENIIHYxMyAzLzRdIGdwaW86IHJwbXNnOiBhZGQgZ2VuZXJpYyBycG1zZw0KPiA+PiBH
UElPIGRyaXZlcg0KPiA+Pj4+IE5vdGhpbmcgZXh0cmEgaW4gbXkgb3Bpbmlvbi4gcnBtc2dfY3Jl
YXRlX2VwdCgpIGp1c3QgY3JlYXRlcyBhDQo+ID4+Pj4gZHluYW1pYyBsb2NhbCBlbmRwb2ludCBh
ZGRyZXNzIGZvciBMaW51eCdzIHVzYWdlLiBUaGUgZmlybXdhcmUganVzdA0KPiA+Pj4+IGhhcyB0
byBtYWtlIHN1cmUgdG8gcmVwbHkgdG8gdGhlIHNhbWUgZW5kcG9pbnQgYWRkcmVzcyB3aGVyZSBp
dA0KPiA+Pj4+IHJlY2VpdmVkIHRoZSBtZXNzYWdlLiBUaGlzIHNob3VsZCBhbHJlYWR5IGJlIGlu
IHBsYWNlIElNTywgYmVjYXVzZQ0KPiA+Pj4+IGN1cnJlbnRseSB5b3UgYXJlIHNlbmRpbmcgYWxs
IG1lc3NhZ2VzIGluIHRoZSBkZWZhdWx0DQo+ID4+PiBTaW5jZSBycG1zZ19jcmVhdGVfZXB0IGNy
ZWF0ZXMgYSBuZXcgbG9jYWwgZW5kcG9pbnQgYWRkcmVzcyBvbiB0aGUNCj4gPj4+IExpbnV4IHNp
ZGUsIGhvdyBpcyB0aGUgcmVtb3RlIHN5c3RlbSBleHBlY3RlZCB0byBsZWFybiBhbmQgdXNlIHRo
aXMNCj4gPj4+IG5ldyBhZGRyZXNzIGZvciBjb21tdW5pY2F0aW9uIGlmIG5vIGFkZGl0aW9uYWwg
bG9naWMgaXMgYWRkZWQgb24gdGhlDQo+ID4+PiByZW1vdGUNCj4gPj4gc2lkZT8NCj4gPj4NCj4g
Pj4NCj4gPj4gUmVtb3RlIHNpZGUgbGVhcm5zIHRoZSBlbmRwb2ludCB3aGVuIGl0IHJlY2VpdmVz
IGFueSBtZXNzYWdlIGZyb20NCj4gPj4gTGludXggZnJvbSB0aGUgZHluYW1pYyBlbmRwb2ludC4N
Cj4gPj4NCj4gPj4gTGV0cyBzYXkgcnBtc2dfY3JlYXRlX2VwdCgpIGFsbG9jYXRlcyBhIGR5bmFt
aWMgbG9jYWwgZXB0IG9mIDEwMjYuDQo+ID4+IFdoZW4geW91IHNlbmQgdGhlIG1lc3NhZ2UgZnJv
bSB0aGlzIGVuZHBvaW50LCB0aGUgc3RhbmRhcmQgcnBtc2cgaGVhZGVyDQo+IHdvdWxkIGhhdmU6
DQo+ID4+DQo+ID4+ICAgICAgIDg1IHN0cnVjdCBycG1zZ19oZHIgew0KPiA+PiAgICAgICA4NiAg
ICAgICAgIF9fcnBtc2czMiBzcmM7IC8vIDEwMjYNCj4gPj4gICAgICAgODcgICAgICAgICBfX3Jw
bXNnMzIgZHN0OyAvLyBycGRldi0+ZHN0IChlLmcuIDQwMCkNCj4gPj4gICAgICAgODggICAgICAg
ICBfX3JwbXNnMzIgcmVzZXJ2ZWQ7DQo+ID4+ICAgICAgIDg5ICAgICAgICAgX19ycG1zZzE2IGxl
bjsNCj4gPj4gICAgICAgOTAgICAgICAgICBfX3JwbXNnMTYgZmxhZ3M7DQo+ID4+ICAgICAgIDkx
ICAgICAgICAgdTggZGF0YVtdOw0KPiA+PiAgICAgICA5MiB9IF9fcGFja2VkOw0KPiA+Pg0KPiA+
PiBSZW1vdGUgc2lkZSB0cmFja3MgdGhlIGR5bmFtaWMgZW5kcG9pbnQgYnkgcmVhZGluZyBzcmMg
PSAxMDI2LiBBbmQNCj4gPj4gd2hpbGUgc2VuZGluZyB0aGUgcmVzcG9uc2UgaXQgZmlsbHMgdGhl
IGhlYWRlciBhczoNCj4gPj4NCj4gPj4gICAgICAgODUgc3RydWN0IHJwbXNnX2hkciB7DQo+ID4+
ICAgICAgIDg2ICAgICAgICAgX19ycG1zZzMyIHNyYzsgLy8gNDAwDQo+ID4+ICAgICAgIDg3ICAg
ICAgICAgX19ycG1zZzMyIGRzdDsgLy8gMTAyNg0KPiA+PiAgICAgICA4OCAgICAgICAgIF9fcnBt
c2czMiByZXNlcnZlZDsNCj4gPj4gICAgICAgODkgICAgICAgICBfX3JwbXNnMTYgbGVuOw0KPiA+
PiAgICAgICA5MCAgICAgICAgIF9fcnBtc2cxNiBmbGFnczsNCj4gPj4gICAgICAgOTEgICAgICAg
ICB1OCBkYXRhW107DQo+ID4+ICAgICAgIDkyIH0gX19wYWNrZWQ7DQo+ID4+DQo+ID4gVGhpcyBl
eHBsYWlucyBob3cgcmVwbHkgbWVzc2FnZXMgd29yayBpbiB0aGlzIHNjZW5hcmlvOiB0aGUgcmVt
b3RlDQo+ID4gc2lkZSBjYW4gc2ltcGx5IHNlbmQgdGhlIHJlc3BvbnNlIGJhY2sgdG8gdGhlIHNv
dXJjZSBhZGRyZXNzIG9mIHRoZSBpbmNvbWluZw0KPiBtZXNzYWdlLg0KPiA+DQo+ID4gSG93IGRv
ZXMgdGhpcyB3b3JrIGZvciBub3RpZmljYXRpb24gbWVzc2FnZXMgaW5pdGlhdGVkIGJ5IHRoZSBy
ZW1vdGUNCj4gPiBzaWRlPyBTaG91bGQgdGhlIHJlbW90ZSBzeXN0ZW0gbmVlZCB0byBhZGQgYWRk
aXRpb25hbCBsb2dpYyB0byB0cmFjayB0aGUgc291cmNlDQo+IGFkZHJlc3MgYmFzZWQgb24gdGhl
IEdQSU8gaW5zdGFuY2U/DQo+IA0KPiANCj4gWW91IHNob3VsZCBhbHJlYWR5IGhhdmUgdGhlIHRy
YWNraW5nIGxvZ2ljIGluIGZpcm13YXJlLiBIb3cgZWxzZSBhcmUgeW91IHNlbmRpbmcNCj4gdGhl
IG5vdGlmaWNhdGlvbiBtZXNzYWdlcyBmcm9tIGZpcm13YXJlIHdpdGggeW91ciBjdXJyZW50IHYx
MyBpbXBsZW1lbnRhdGlvbj8NCj4gQXJlIHlvdSBhc3N1bWluZyB0aGUgY2hhbm5lbCBhZGRyZXNz
IHRvIGJlIGFsd2F5cyB0aGUgc2FtZT8gSWYgc28sIHRoaXMgaXMgYSBidWcNCj4gYW5kIHNob3Vs
ZCBiZSBmaXhlZCBpbiBmaXJtd2FyZSBiZWNhdXNlIHRoZSBhZGRyZXNzIGlzIGdlbmVyYXRlZCBk
eW5hbWljYWxseS4NCj4gRm9yIGV4YW1wbGUsIGlmIGFub3RoZXIgY29yZSBhbm5vdW5jZXMgaXRz
IG5hbWUgc2VydmljZSBmaXJzdCwgdGhlbiB0aGUgY2hhbm5lbA0KPiBhZGRyZXNzIGZvciB5b3Vy
IGNvcmUgd291bGQgYmUgZGlmZmVyZW50IGFuZCB0aGUgZnVuY3Rpb25hbGl0eSB3b3VsZCBicmVh
ay4NCj4gDQoNCkluIHRoZSB2MTMgaW1wbGVtZW50YXRpb24sIGFsbCBHUElPIGluc3RhbmNlcyBz
aGFyZSB0aGUgZGVmYXVsdCBlbmRwb2ludC4gQXMgYSByZXN1bHQsIHRoZSANCmZpcm13YXJlIGRv
ZXMgbm90IG5lZWQgdG8gdHJhY2sgdGhlIHBvcnQgaW5kZXgsIHNpbmNlIHRoZSBwb3J0IGluZGV4
IGlzIGVtYmVkZGVkIGluIGVhY2ggDQptZXNzYWdlLg0KDQpXaXRoIHRoZSBuZXcgYXBwcm9hY2gg
eW91IHByb3Bvc2VkLCB3ZSB3b3VsZCBjcmVhdGUgYSBzZXBhcmF0ZSBlbmRwb2ludCBmb3IgZWFj
aCBHUElPIA0KY29udHJvbGxlci4gVGhlIEdQSU8gY29udHJvbGxlciBpbmZvcm1hdGlvbiBpcyBk
ZXJpdmVkIGZyb20gdGhlIGNvcnJlc3BvbmRpbmcgRFRTIG5vZGUsIGFuZCANCnRoZSBwb3J0IGlu
ZGV4IGNvbnRpbnVlcyB0byBiZSBlbWJlZGRlZCBpbiBldmVyeSBtZXNzYWdlIGV4Y2hhbmdlZCB3
aXRoIHRoZSByZW1vdGUgc2lkZSwgaW4gDQphY2NvcmRhbmNlIHdpdGggdGhlIGN1cnJlbnQgbWVz
c2FnZSBwcm90b2NvbC4NCg0KSG93ZXZlciwgaW4gdGhpcyBtb2RlbCwgdGhlIGZpcm13YXJlIHN0
aWxsIG5lZWRzIHRvIGFkZCBsb2dpYyB0byB0cmFjayB0aGUgbWFwcGluZyBiZXR3ZWVuIHRoZSAN
CnBvcnQgaW5kZXggYW5kIHRoZSBjb3JyZXNwb25kaW5nIGVuZHBvaW50IGZvciBub3RpZmljYXRp
b25zIGluaXRpYXRlZCBieSB0aGUgcmVtb3RlIHNpZGUuIEFtIEkgDQp1bmRlcnN0YW5kaW5nIHRo
aXMgY29ycmVjdGx5Pw0KDQpUaGFua3MsDQpTaGVud2VpDQoNCj4gSW5zdGVhZCwgeW91IHNob3Vs
ZCBoYXZlIGEgbWFwIG9mIGVwdCB0byBwb3J0IGlkeCBpbiB0aGUgZmlybXdhcmUgc2lkZSB3aGVu
IHlvdQ0KPiByZWNlaXZlIGEgbWVzc2FnZSBmcm9tIExpbnV4IChqdXN0IGxpa2Ugd2Ugd291bGQg
bWFpbnRhaW4gaXQgaW4gc3RydWN0DQo+IHJwbXNnX2dwaW9fcG9ydCBpbiBMaW51eCB0b28pLg0K
PiANCj4gVGhhbmtzLA0KPiBCZWxlc3dhcg0KPiANCj4gWy4uLl0NCg0K

