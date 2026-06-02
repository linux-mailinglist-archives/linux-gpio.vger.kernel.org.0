Return-Path: <linux-gpio+bounces-37798-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIFGKwiOHmodlAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37798-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 10:02:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E58962A0B3
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 10:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7142A300F5D3
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 08:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC303BD25E;
	Tue,  2 Jun 2026 08:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wC+LLAvd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765DF3BCD34;
	Tue,  2 Jun 2026 08:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387316; cv=fail; b=eLoEhs+yl7nAxyS2xkRcAjpandat8Tu2EhkoSmEIh5NThqGWHyoY31TVlJF6oNFHGzP0CfYAf5Ptcu96URY4TvUuNg6Opz9Q4QjvckDfrL8hcX3eN/56nB5dPGnBL96N+BDfIT6+3ACwQhifV7NmIZYQ/XxO11vvXC4fJ0YKMA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387316; c=relaxed/simple;
	bh=w9PoeiOsYoWDZhB3rQXw8Du6ksODl1FkPix49/rg6fk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dZy+CZg4w6eDoKTuNgtyii2xNAv/FXCXLK5WTqMlJHXYbJYuaH56L9DNVC7pn4ihGWfOSRxCTyV/OR/e5rIPZ+Dm5A6CaXGGect7wgr3If/dfKQaVuL3uJPw1lOk+BPIF+TuqIZMUf3g+0h/UWgcQemYjbpG6rZmxI2tWZ+h8JE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wC+LLAvd; arc=fail smtp.client-ip=52.101.66.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKUY1d4wX+TlvA/OFT2rqs0XO9LZGXvFNGiPyJczWRtRsvZBBHjaunaerCgrSDqF2/lchi6tq8MKtE6QD0MsgA283Ymq0A9vUu7ME9Ys0Rr4nSel8m6jYzjq/4KUohnqGqVwUjHM/yWxXlh3kIcz1NVIgsd6AOFi2I/uXT2sEzvT29ccnHc+FOqiF/aoc3JcMpjRa0CZRcqFLMDERZ/aVBTrdTd3zCtOqCJ9X0vIuK9aKe+XCmnC0/qQIduTbC7JYSDKnbMRm+x1wQEYDSjclBn0nVr7ZLD5ERRcK2Uh6tv941fZlhKrE2UwYqI7ZHS2PS7GP7dHwVlzZkWDU56vHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYFEtQjfosERBO/nV/GeKD6ChQX+dOij+9NlzHV0DiQ=;
 b=HF46kG7eFxp2SSlS8a7Vc18Zm0njXOAr3nfXkFGqDF+WWqB8w9UOswiv5WE4j7vON2H8V0HRy39/amLKMFYoKa6bK2JtYUkK46mo3osDIZdOnNJA1PPlmh4o1n6LRcCWz4h605p639iSYuyY0EL2fUeHFcx9mvXiJTWiUgUan1/sEtoHeGvbVtDAD+AZDzHBaVNhf6wn6F8qXarc2CryYW+FN+dtpEEdip/cwX7Dvmnm0guO3VECuZUHRA7raqc449ZZcvX7RD2GPrwbtFv68zessUvHSJbvlaw4MQF+HsKJyrWrhEsdtYdY9zlnHF0hmGsALbXWY/4rmUfDPXnUHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYFEtQjfosERBO/nV/GeKD6ChQX+dOij+9NlzHV0DiQ=;
 b=wC+LLAvdVqcHvrlhqF85tIi0xoTClLuQ7OUWUUN04KHZnq6UfxPSYJ78/8Dv3/n38YjfHHdb5wLUyAxLuxC+53HTtnPRdACFFuPSUsbf7/lVIrNfAzyIBnDH+A4FNqcFcVgjgWPiwckj4DoiI/b8+n7SNQg+yBlje6PgEwZZacog8Ym2UyWvGrN+r/P6gVlB99WRmF4grmsZ6Op0UvEhdHKNeGiFnnMmTG6Hayi4BMCCYVmZTiWk2olx/sH2UGEwVTPwSZovVO3VmqVCqWnqn5gXsEBuRTMqGER3GVt2CGrMOrVOBwuW9zxEiMv5d04l+v4SXJP+7Zk2V80bPnKBmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by VI1PR04MB6830.eurprd04.prod.outlook.com (2603:10a6:803:132::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 08:01:45 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 08:01:45 +0000
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
Subject: [PATCH v10 1/6] pinctrl: s32cc: add/fix some comments
Date: Tue,  2 Jun 2026 10:01:27 +0200
Message-Id: <20260602080132.3256239-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602080132.3256239-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260602080132.3256239-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::10) To AM9PR04MB8179.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 5efff04c-1fde-4f9b-8edd-08dec07d3088
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|921020|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 M2s4s5tvzxHI6E35QSjkcOn34cUl4RQ9jdGHlktDHi/T0NqtXwhFM+WQIHLLmF8kb3/3Wr/erK/bZd56zz8b/WPimPcPSy6Qy2HZ8oBjtp0FQZgDINCnh+3PKm3XkGF+QXnlkf2nEQEyGBiL2VQvPb3vYEc2ZGg2tRuKsMjJ0bWosUBBCcYRdsOy8x2+0nAe+/rzKFD9H/soOlBw4eBRZ7fVJqYNzcmoPfwI4+H1ZH5sHkNJO3Cv+pYhcz3bLeZik9DgcIpld6MvOYzJSbegi2M44K+BqaWSnTyMWfvXWyrYf9yWlTrJlCO7pwLchQ6z0sro2g0HkPE8Z+ucjFmoUfCl6D7Sa1rnNr96RAIzSIAh0+fMDzIxNIRiw2SL7nrAsZWKCjmXgc0WRW9n2GmJqVa7w9srrIbXkGP6GnDzBbekCwC9p1sjFsPLhdUz6eRqfdB/KmtdWYABxDbK3TnQVInBsI3x4IaazOcJYyq5yl/eGjfjt+DzcXkofRXkglhN+g7XWq+dzOkbdTtc2Iivvcqmz52Tpv7+wdqwsNbAIbZYOD5jObXsi29h0g4W+gNjX7JCIQccHjYiRe6ekxu5OCag4CMjjCscR1onLFgcJq+ba5RFP4ClYCVYYzLgd6ce/EI+hwB2bhatxfCRQ6s1NX6zV7ov+3JdNkl48qlNX7TpabBPaPJnKyiJZG08oesmTh1e24BGeXXJ6b+o0LpAvvz58QjnxlaQxL/SrjhjJHs=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(921020)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NkNxYXpWQU9VR2d5RFpLS3ZESkp3cG1FUWhrRlV2YXdISHdwVE5jSUxrYWZj?=
 =?utf-8?B?VVBvUUFBZFhaa0NseTVOcjVpQS9mYXFBYXFVRDdBMTVFME14Umg3RytUSi9M?=
 =?utf-8?B?K1ZKby9LMWRCN0pZWndLY1F2WDZ6SVhvOWhILytkdlpGdzN4MCsrc25UVmoy?=
 =?utf-8?B?b0ZZbnpOaDg5ekZvWTdJSmh2Z3RJa0pHOFpkSjBQY3NzS0pDWTI2ZkM4UjZn?=
 =?utf-8?B?OUU4T0ROT29RamxhNEl3ZjlYWTZmaTV3YmhyaXkrWjI1eTNOVjVZdW9ZTzMx?=
 =?utf-8?B?MlZ2dWNVUmpNMHVlY2pYdlBqR2tVUUNnM2VXem1ielhFMWtkUEtiOXdiWGgy?=
 =?utf-8?B?SFVycExHYXFwMjVXQkRiWUNtMzZzRGRqRDhSd3ZOK3IwcTZObWpZVGRTeC9l?=
 =?utf-8?B?T0gveHBQWDIrb1YwOVFWMkR3SGYraVNOZDdtdmtQQ2RMZzluWDlkN3V1enFs?=
 =?utf-8?B?V0ZXckMwczNEMnhlRjA1M2ptYVdwSWVOQkpBTk8yV3l0eHZoWHJWQnlFbDF0?=
 =?utf-8?B?T0w4WGN4RndHdHNtTjE0cVNsY0dFVEcxaC8vQTAxK2NJOUUwTGxTNm9KaXVS?=
 =?utf-8?B?NTE3U2V1NWtXOUFTMTdham90WnYyOVFPVm5haHVDaUdFWU5FZE9MaXVWNWk1?=
 =?utf-8?B?c2gweHp1Mm5PVW5iK210c2h5ZzhWcXlmemg2Zmk0MmdFdXpsa3ZhWEt0RzNr?=
 =?utf-8?B?cm5TZWVDeWZSZmdaQ0tuUHJTSTI4dThlR21CTUNzRm1CVWFUeHUxZVB0clI0?=
 =?utf-8?B?bW9nWGN0QllYM0lSUDVrQXN4N0lsMENYTUF0RmVTOUlvQU9PK2tYTkxuOFRn?=
 =?utf-8?B?cG8ycFNXUVN0Z2xZNlgyZHhWUmlXOG4xcGY1eWhhWHJRSGYyKysyckZPSUFr?=
 =?utf-8?B?ZXVJcXNscFR0SWNFMmw1MFZLNVRkVDZ6RnUxOVJOeFRvbXp6NGs4ang4Z3h0?=
 =?utf-8?B?MDY1U3pRVUlSeWlVSEhtbWcxdW03STBqQTlFbmk0c2FBUjFBblR4eVl6bUNV?=
 =?utf-8?B?b09neGZnYVUwdUNsNWRPcWVCbWpoK2o2dW1UdWt0MzJRR1JhMUVvQjI2djZG?=
 =?utf-8?B?T3dGa3hjeHR2WUpmUFFjSXRkU3JLUndBWlFaVnd1b2pWbndCaVRXWnJBS0RZ?=
 =?utf-8?B?RnR1TW9NbUNPRDNyOXdDU1VLVVd3QTJ1NDBYdTRBYlEyd2MvaTI5akxEb3pz?=
 =?utf-8?B?VE1vbEtqQWdqRkVXYWFQWU5zR2xqVkp6czlKTWRZWE50R2pNbW9rUU1FaHl5?=
 =?utf-8?B?UjdDYXJkajNnRGpwZmt3VGZ0WWQzblJSLy9nS1N3WXlTUjhuOCtpQ0VEZGxV?=
 =?utf-8?B?Tko4QlJIZVFyZnF3R3FPWTU2YW1KUlR6MCtlUnF1ejRjdlJzbUhRdXhDZ0tD?=
 =?utf-8?B?MXMycDJzaWRmazRvb01MOFNjZFRHWnVQWHdsSTVVb3FrejBjbU9PTXRJb2Iz?=
 =?utf-8?B?YkYrVGxLWUxMSDVLcFl4SG0rZEU1VnZHdytZUHZyMG8rNWM4Y3BIZUhKL3lm?=
 =?utf-8?B?NzM0aTZMWXk5emFyWkIvU0ZDR0RRR0RYbmZ5VzhYWmtzMitmWkQzYmdKeXJG?=
 =?utf-8?B?M0NuT1h1Wi9XN0J1V2Q2cDZDK2Z0Y3l6YjFYMEhhc1B1REFtUmgrTUxoSTIv?=
 =?utf-8?B?MXNUbmZ5UkFPVEQwYzBnOWg3eXUzUEsrVUxkSFduS0t0VGZSZ3lxbzJTTzIr?=
 =?utf-8?B?T1hRc3dGRnB4Z0VnWW5hZzRJM2lnZXUxUDZqb3lKZlE3Vm9wMU9mL216UVRV?=
 =?utf-8?B?dTVQVmdOcmVTdzRDcTJ5VmIrS2hwNTQwMm92NVExb2tMdkMvUmlhN1lQOG9r?=
 =?utf-8?B?TGlnV1NSbDBqY1VTWWtJODJ5Qll3cGZOZEZyQkJvOEFDa2NUdm00SlAybENC?=
 =?utf-8?B?VmNRTml1NlZzWkIxVUFvU0VaT1FYQWJwSU9pVDQvMEN5VWd6dGhGYlR5UGlD?=
 =?utf-8?B?REEzdnpIMDZKRmF1ZzU5UlJzdHg0SXV1VFV4MGw1ZFMzRFlMdnpKZVU2akJG?=
 =?utf-8?B?aVVwU0o3akxPWG96bDZnYk9Kb1Y2c3EvaS9ZaWYxNnk3YTRGYkNmdzczMG5P?=
 =?utf-8?B?WktaWTAxOWRYbjVnTFF0QzJHa0tybHYzbnpTSjljblFBajFUR2VRMExtV0FG?=
 =?utf-8?B?RTZ6cjAwRGZ5VVdKOXZxTnQrVm1nT0FmU1NUdldKZlVlUk9DYlJoOHlIZm9R?=
 =?utf-8?B?UXpiaVVhdXcwM1JWWmJzUjhOU3BJYXFYaTdIUFVqRzZuZVo0dTRiTlNsdWhP?=
 =?utf-8?B?dEYrR0FPZjBWeTZpbGY3bDhnMnd4TlRuR1BmUlpad1hJRjJKM0lkeFdpbFlV?=
 =?utf-8?B?SVIybFRYQUVkTzZMN3R4bEkzbmYyZjUwNjFoOWhKV09nZWhIU1lzSEpuZXlk?=
 =?utf-8?Q?baDUBFfXozWCX6C96jQXJk9r2YjeOAuguXldv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efff04c-1fde-4f9b-8edd-08dec07d3088
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:01:45.3133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLgySP1vp8pebWN1hCvkbFryBV9IEUBvkyQ1gE3MzvURfHvbndlmPSMILFdS9GS2KALSCWPZjai7i2SG5CUXtcN57IGCETeUMvu3BmJgaBCgJi1LUGaXxRvoUUcBSkPO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6830
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37798-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:email]
X-Rspamd-Queue-Id: 4E58962A0B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add/fix some comments and print statements.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index fe7cd641fddd..4f88c24e62a2 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -60,6 +60,12 @@ static u32 get_pin_func(u32 pinmux)
 	return pinmux & GENMASK(3, 0);
 }
 
+/*
+ * struct s32_pinctrl_mem_region - memory region for a set of SIUL2 registers
+ * @map: regmap used for this range
+ * @pin_range: the pins controlled by these registers
+ * @name: name of the current range
+ */
 struct s32_pinctrl_mem_region {
 	struct regmap *map;
 	const struct s32_pin_range *pin_range;
@@ -67,7 +73,7 @@ struct s32_pinctrl_mem_region {
 };
 
 /*
- * Holds pin configuration for GPIO's.
+ * struct gpio_pin_config - holds pin configuration for GPIO's
  * @pin_id: Pin ID for this GPIO
  * @config: Pin settings
  * @list: Linked list entry for each gpio pin
@@ -79,20 +85,22 @@ struct gpio_pin_config {
 };
 
 /*
- * Pad config save/restore for power suspend/resume.
+ * struct s32_pinctrl_context - pad config save/restore for suspend/resume
+ * @pads: saved values for the pards
  */
 struct s32_pinctrl_context {
 	unsigned int *pads;
 };
 
 /*
+ * struct s32_pinctrl - private driver data
  * @dev: a pointer back to containing device
  * @pctl: a pointer to the pinctrl device structure
  * @regions: reserved memory regions with start/end pin
  * @info: structure containing information about the pin
- * @gpio_configs: Saved configurations for GPIO pins
- * @gpiop_configs_lock: lock for the `gpio_configs` list
- * @s32_pinctrl_context: Configuration saved over system sleep
+ * @gpio_configs: saved configurations for GPIO pins
+ * @gpio_configs_lock: lock for the `gpio_configs` list
+ * @saved_context: configuration saved over system sleep
  */
 struct s32_pinctrl {
 	struct device *dev;
@@ -974,7 +982,7 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 					    ipctl);
 	if (IS_ERR(ipctl->pctl))
 		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
-				     "could not register s32 pinctrl driver\n");
+				     "Could not register s32 pinctrl driver\n");
 
 #ifdef CONFIG_PM_SLEEP
 	saved_context = &ipctl->saved_context;
-- 
2.34.1


