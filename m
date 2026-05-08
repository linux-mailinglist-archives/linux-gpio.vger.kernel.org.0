Return-Path: <linux-gpio+bounces-36441-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKOcGr+n/WmEhAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36441-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 11:07:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E20DC4F40AB
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 11:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D98A3019444
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 09:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F6737D12A;
	Fri,  8 May 2026 09:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z7TDXUZq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010058.outbound.protection.outlook.com [52.101.69.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87A11F37D3;
	Fri,  8 May 2026 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778231225; cv=fail; b=rp9wzxFviKj2pux2/yACsVWHg4cwokjxDHNZwGE7r19dYWaK3qIWMghOOQ5G3Saw/LeEKi96dmumGgPYeFwUP+A6Znw2pf9zXreukZRGEFVMILS8oLeOZ+ZnXxNOhjLCnE7uUAprXf9ms6Ij6gmKkfLknOTIgx/Hjdtlg6mhMOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778231225; c=relaxed/simple;
	bh=b7KNTT8pxDoW6bqqCTPw4zEKR02pqfeL+VZ2O22FZSo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bo2McSysNhiSkR1bnQ2VYOAg35Ar6yntS67lPhfVchXYcVJ3Y7DXeLEEV8rXWYjLFeAhN39jvkbRKsAOtYM8xXKNc96tpeJpLaPJMGgT4ks+6Agmf771R61nud4hhotAF4cTXhc7yQflTB6MgU2OYJgC7kdavlQnc8jv1GWU4Cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Z7TDXUZq; arc=fail smtp.client-ip=52.101.69.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hp1j+yhJJTsBUbC6L596QUmDo8np1iQzF5iJ+Mm4FQ+rxEQCACFJQNkDrq4NhWUh9JBZyzdZdccUyqTJxfyvlFhABvapzp4+1vkb0UrdhWKAZ3dVsqz9lKWIItnqmi8zacqNNczRtvyYk0gZ/9znB596+8QYz3c3OERAE2j0cqvA97C4G8NymUeFb6Q6sp6huujNhC0+mkE0YFtkiUGpoWcEw6IRs/IpP2KZLZRKLqGTgZbLF830PNLKF2ATCHzGhqp+IeoIDrqVa0/bJFLCS4YPvOXIEkyJIt/ifVOCB3hjato7OX7zcQMnHF6VWYPaSNZJBhYJxYGsoO5pn07qlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSqaXzmZsDru7FTwU7VVGbm8yg50jMZ73W2FDpsImWE=;
 b=Wpy6hya4lPbwB0NXPkZGfqMvXpoj1jsxwgN7EOq4EOJlx6cY3A9shSF1vvr0o0tbj8D+0hpim5GSnnKVjeg0X6o4HCbzgYKmx+5lumwSjnuG5A+KfxGUAoZTHvDIoaz3e4OqFTBDARDHtRniC+KUeMPaCVERTLFtEEaK/bukT2pkjAxnINAVI+5lzb/rtLRdI/LeYc0KXEQ9jAYfm8DEwkGwYbpKMMJwsCf45XTWKq2YXYv5I+JdKuWtuUENPZQkK/gZEUvh+au/ARnxSIV6QVoWAtiGLeGfxDDc1RqEhDdKMEmWLg6IqBSekvXajiAJVckkpsPuFXBAO2QJKz2R0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSqaXzmZsDru7FTwU7VVGbm8yg50jMZ73W2FDpsImWE=;
 b=Z7TDXUZqZJSek0YAEFn5FV1EvgiMpPTZB4c6qg78cc11FtIepDog3+gR+preEeqcKIMg31UvgOzNofn3++1Z3LoKP/KSEx5D0RGEXDSKnFOyREipW1/nkkZe7mZFILo/Tv8hIJ3SDNRg2zigGPTUsLMqlwdPBBY9I6OvNWpUuDkbPKXRDd7WR+TxbGGyD3kxNUVaXks7yCbDLE0QN/DPm13kK1N+yfT+N/DfOWQpFDEjOrlDYUHpeMj0VovJU8IweNkE3WCxvW5U1iCvppgJsk7debNMNZHtXMmNegXpSmWW5T7vfHaj4Bpw+vQbgz0rmaziOgWkrfgnfzfy8EMuaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by VI0PR04MB10781.eurprd04.prod.outlook.com (2603:10a6:800:26c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 09:06:58 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 09:06:58 +0000
Message-ID: <704e9e7b-0f45-4ed3-a686-9e20056eab2a@oss.nxp.com>
Date: Fri, 8 May 2026 12:06:48 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/7] pinctrl: s32cc: implement GPIO functionality
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>,
 Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
 <CAD++jLnk4q7L_cFzz+1gKkAqwhv=TW1_XSepuii7b_PHF7EPqQ@mail.gmail.com>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <CAD++jLnk4q7L_cFzz+1gKkAqwhv=TW1_XSepuii7b_PHF7EPqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::7) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|VI0PR04MB10781:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e96515-5848-431f-5ec1-08deace12879
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 O7iPFY6pvG546Qdo7RNg42/Pa/xgCX3jJa37vG9VmkvGFLW2ZTYuJCFiowN46MgZFG85MfjXFChpXnXaayJjcUsdR4ha/cYj10ZH3Hyj/mCkDXHVKtW/NLkn7yysMWtzQ/kTkWPMx1O+ohbmMkJjixM2y33V1oy6w73wY7ft8WJScTOrm1ZzdtmlffARYvjfIDwTeVOs4D5HS6yuhoKLwHXMTxxGMp+HfGC9fGNFqkR2r0FygFUMQN25zbjBamR3MQ+zA8xzOmgOLWge1MIhvSnb1LEPho21MIdag7VBzuW1vQBn487XYUEq82xUUJcvJyDv7d1MXlo+dLD+5CMPEMDim8QftdYTSsFosRI/1ptub6x1tp4H7ZNRYYCi6hHd073J9gdedwsRNCAXv8FOUmDqreM6NEylFx8JLL0vrYBCNKqXMYEJ8sZ8z3u28pNNHlwYYdgQlSPLRf7P82sXF3AqdIfg9Kg7TYDewizPCR5Wh2pGAR/yYWb7Ttpn3E6N57fGVcGmNzc1ZmL6djYV85Nyb4ugvoEhWF9eyCP9pNUYUob6eYVyfOIK2+i+dwTWQPgwUnIjuBFOLZKl5aonOkTBz9QSQT5qsAwnx4bZiz75pMQTacfe4djFyD4QFtLlQ2bIoJwh2mK/02Rj7hjmOw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SHYyT0ZWTlJUWWQwSU0rNDlscXBTMnFSZlhzL2FMUTI3WWRqdnhsR2lIeXVF?=
 =?utf-8?B?d2hpZ09LOENyN295MDZIVm1INHRmUDVGTXZqV1VISmpzZjA2Q2x2SDd2dW9u?=
 =?utf-8?B?Tm92VFNNYndud0orNkNWMVVySk9SZGpKTHJMYjlZQjk2a3pqOXRQNUJSNjdj?=
 =?utf-8?B?dEVPb1Q5Y3Rib0NHNjlYdWZtMERrc3dPbG12QTkyMk9kemQ0NUFVdThvQmQ3?=
 =?utf-8?B?TzlMYnM3cUp1YTJ0b0d3em5LNjI3cmY5STY4SnFRTXc2Y2NBamppTHFpR3FG?=
 =?utf-8?B?SEwyVjF0NjlPS1k3K2Jmb1hILzBuaStQYmp3V2d2NmFHV2dJMGFhUnhaWDlM?=
 =?utf-8?B?MlNyTGp5V3grb2FlVlR4ZldnNGhiNmpkOXVRVkFWT2lxbEN2VjQ2a211eUFY?=
 =?utf-8?B?UHNUZitsOW9za2tCb0J4RmVWNFk4d05XYlpieWQ3TG5VaFdiVlRhbmlJRjdB?=
 =?utf-8?B?QTdxaVhhMFZPemsyYXIwMHFCRC9RWWZFd1lyUmVNL0Vkck5WVGNEcjRFM0ZS?=
 =?utf-8?B?ZDEya3RrLzRFUzdXZnp1eXJXV2xoNC9oSEhMYThjMjRDSkgxOEF5bXVWeFA1?=
 =?utf-8?B?NnFMYXg3TzdCZVZBOFRsOU56a1gzK1I0WmlJYkNyeTBtbVFXVUxOUjJxQ3F5?=
 =?utf-8?B?bHVieDcybHlYTm10VFFSdU4rVCtTMkQrREpKNjhzRlZkYVgxdEl6YlZhZUxq?=
 =?utf-8?B?NEhGNUpUMHphdlB6N0t6WWxDcXY5NTNDcGNSbHVyUUxEalVibWxtaFczNDRr?=
 =?utf-8?B?Q3gwd2NlaWM2VlI3MEhIRXBoZzA1YXNRVkV3c2JJU0JCTGJ5UmVjSEZWUzFK?=
 =?utf-8?B?di9BYjUzZDFOWks0WWdBYW1wMTlySkd5dVBwd1JxbWtRMnlocEJhRGordVIx?=
 =?utf-8?B?NTJsbjdEK2hwUFJmVWtzUWxUeXBGMXRQMjFiRkxHTTJUeW9GUWlmVkwzVk9C?=
 =?utf-8?B?a2VydUo3dVhRUWxtVWNIa0J3RitNSnFOZjY0NnZNc21VbHZEREJwaGgzQUxF?=
 =?utf-8?B?U0Y4YXZnaTN0KytoNDB4Y2JoWnYza2xDbHBoSjNndjcrRTRYZUZtUjBQNUNi?=
 =?utf-8?B?emM4Y0Nib2FmQ1Q1N1IybUpRcFFVTTZjdGZQSGt1S1pIQS84dWQ0d0dVNXpB?=
 =?utf-8?B?R2I0SWE0MUJFcHNXTUNlNytKczg4d3ZKOFZZZmx1UXZBdXh2N3YvS1hmL0F3?=
 =?utf-8?B?bVc4dlN4Z0FzM3c2TUxOdm5QejBvdDN1NjV2bFcwQ2FXdEFEWlEvLzV4Z0E2?=
 =?utf-8?B?SU40Y21WU041WHMyQ1BoRGRueGRNb0dQQ0x3VWNXMnI0bVFiYUZnRjdjYXpO?=
 =?utf-8?B?OWZjMEI2NDI3WGpHdVNCY3NKWGM3SXU4a2l4ejFLVEtub3UwOUppenVCRmlk?=
 =?utf-8?B?VXMrbWUrQzU5MFU5eklKNE5rWlRNamswWXlocitPM2VmRHl6RDUrbkRqWEM3?=
 =?utf-8?B?YkxtaVVRVzQzaWNEWUhyZkRseG11VGY4L0gyL1N5Si9zdDZyeHJYR0dGK2xx?=
 =?utf-8?B?R1NhTjlhU0VjOFZzWVBoaXVuQlNnWlQzT0dQSVdnTHBLYzhsSUx6U3graHYx?=
 =?utf-8?B?UWJoUHJUcjBsRjRTNlo1QURjWG9td0cxRkIvUHAvU216Q3VKMjc2NVB5RmlP?=
 =?utf-8?B?SkI3cjZXRXRCSG9OM09GeUxwNmt0ekNHamxsMmdrODhqRDdYZ1hYcWVOdHB0?=
 =?utf-8?B?UlBHUmFCWGxtTEF0cDlNTjZPNC80ZzRoQ3QxcXZYWmVWRnBaS1dCMlFpa1dE?=
 =?utf-8?B?NFNNUkNMOVRmZHVUb2gzd2xXUWwwTXF4N3dCQWFrTVg1SDUxWGVORTU5dG1V?=
 =?utf-8?B?emE5bHFKRFgyWW9nYWJ5UE1aV1BWd1BkblV6bFFoZXFFMXI3ckFGNHpWc0JK?=
 =?utf-8?B?cjFyVWdNM0JWK3hKTWdQZGV5VG9JZzRGN2t1WVUvUjlUbndYTUdRTER5dzBJ?=
 =?utf-8?B?UFMxRHh3MHpaTkoxYTd5cE8rUnpNUDdXWFgxRFIxbUVlbU1mYytnaUdvSndm?=
 =?utf-8?B?elJqNHhleXlKb1NhV3AwTkZRM1NFaHREM2poY1Qzc3A0RHhQWDM1VTNoK3Ft?=
 =?utf-8?B?SSs2dnVDQ1A0VUc0aDBTN0hrSHpLV2tIQWFVa1p6RWZ1ZS9QZEpwME0wNWNS?=
 =?utf-8?B?dXg3TDc0WXR2U0wwWVYxTi9ZckR6OXluRkkxSTFPSm8rT1YyQ1BwMEQ2QUJo?=
 =?utf-8?B?UldxRld5YitvRUxTR2NFdlBUdjFuK3N5Qm5WZDFSWnJWTHpWUVdDU05BSUZa?=
 =?utf-8?B?dGFrek5qVzVwdkJMbWVJY3JoVWFQRkxLOGl3Nm92ZklGMnI4RnJKWDVnS3Ba?=
 =?utf-8?B?SzBLNjlUSHc4WWw3eEpUdWZQSG9UWkpLMXU1UmdOM2xQVEFOWThGOWFHNk90?=
 =?utf-8?Q?4bE0gu1XIy/RPLAYTpdxbo88qTXij/VRRkl4J?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e96515-5848-431f-5ec1-08deace12879
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 09:06:58.7134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Auj8TAc084n7RoCgnuOfvMy0WZ8E9BNtGiCs+J/sDiTrQvHkC1niFBcpvhlRNTxYe/4wMPyy1zHZSTAM3LbALSjEfo0RyvF+CxsbLWKWR41UZKU1Fjj/+Lud7AdknArL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10781
X-Rspamd-Queue-Id: E20DC4F40AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36441-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.nxp.com:mid,aka.ms:url]
X-Rspamd-Action: no action

On 5/5/2026 3:46 PM, Linus Walleij wrote:
> [You don't often get email from linusw@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi Khristine,
> 
> thanks for your patch!
> 
> On Mon, May 4, 2026 at 3:12 PM Khristine Andreea Barbulescu
> <khristineandreea.barbulescu@oss.nxp.com> wrote:
> 
>> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>>
>> Add basic GPIO functionality (request, free, get, set) for
>> the existing pinctrl SIUL2 driver since the hardware for
>> pinctrl&GPIO is tightly coupled.
>>
>> The updated SIUL2 block groups pinctrl, GPIO data access
>> and interrupt control within the same hardware unit.
>> The SIUL2 driver is therefore structured as a monolithic
>> pinctrl/GPIO driver.
>>
>> This change came as a result of upstream review in the
>> following series:
>> https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristineandreea.barbulescu@oss.nxp.com/T/#m543c9edbdde74bdc68b6a2364e8b975356c33043
>>
>> Support both SIUL2 DT layouts:
>> - legacy pinctrl-only binding
>> - extended pinctrl/GPIO/irqchip binding
>>
>> Also, remove pinmux_ops which are no longer needed.
>>
>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> 
> Same comment about GPIO_REGMAP here.
> 
> Maybe this has been brought up before so it's just sigh rolleyes,
> but my memory is short.
> 
> Of course gpio regmap conversions can be done later, after this,
> but the problem with such things is that they tend to end up on
> the back burner and never actually get done then.
> 
> Yours,
> Linus Walleij


Hi Linus,

Thank you for the suggestion!

I think the gpio-regmap model could fit the SIUL2 PGPDO/PGPDI
data path, so the get/set operations could potentially be
refactored in that direction as a follow-up.

However, I don't think the current driver is a good fit for
a full gpio-regmap conversion. Direction and GPIO mux are
handled through MSCR/pinctrl state (IBE/OBE/SSS), and the GPIO
logic spans multiple register regions across two SIUL2 instances.

A conversion would require stronger separation between
GPIO and pinctrl, leaving mux restoration entirely
to the pinctrl subsystem.

Would it be reasonable to keep the current approach for now
and revisit gpio-regmap later if needed?

Best regards,
Khristine






