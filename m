Return-Path: <linux-gpio+bounces-37803-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAL2NUORHmodlAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37803-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 10:16:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9612B62A587
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 10:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BFE9C304F53A
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 08:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBB43C13F5;
	Tue,  2 Jun 2026 08:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NoXidZcF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8921B3BCD0B;
	Tue,  2 Jun 2026 08:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387333; cv=fail; b=DxObR1zVPSM2pJy+UDA4yW76h6e6a+2Pr8KCfrr8jZDu6M1xij0BweCJXrJaLF11aoeJ9KLcK9+hEge7GDpVJP9+SYQNNtpzlv6mp2512xMLV0QiTCQ/gn8YMvtcincmfd9mASFJEEw/AlMgibbhsRdD4TJo8ZSPrHUTW5mCdiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387333; c=relaxed/simple;
	bh=S7swCwZ7lOG+VHwMik343otu/2rnMABiENrAp+ZteTE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ML26W9XDYcGTUg+asL11Mf5/1oWRGXHItJgTQKLg+at3eUtuW106xyRj2iBsX1QOOLOP/AmJpXKDCP59A/OnOvTaCs36ER/eFap0N8RtPxSkGxCle4YcxIwBjIZF6cDTTNQLmqI8tO1GytcnPg1lt5/lZMqDHg0M2n+N1Qv9+eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NoXidZcF; arc=fail smtp.client-ip=52.101.66.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4Fv0sMkuD/wsDTJP0PTb5oeNGC3qs3E8yEDCWn2hEu2lqVhD3NW7f7syZOdwwOmgCjC2nLO1BSEIsAyDYXezn8wPXFHrlCIMRZhp/ir6iouvqX23cDc9W+GbLlDeSN/Y9c4gsswLatnS5AoM2DJIG3Yrrax1TCM3r55/TDyZiRHvsUxNNp6RI4aq3LGM4ZWuZ+1stfvGCga4Lr5/Yzw0gSc/wflc3Z7D4pi2Z+SbvnC989a8dATkeG9M52APG5sV4VKOEDc6d2RVXOYTDQGo/jqLNWOMwLzDcJ0ATLXYySPQUK90xzave8TeIpqEQqKdEwvP1Uu5alSiXkYauuEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7K2qfy7hoslASI73wn79MiDWsqT0yM1g3SvwyMobcv4=;
 b=V1ZZaaf247erL/b9tdW/tw8H0Rwkz7rUFWgUrgJFiKy/Mn+W1dwxjNQTqU4N5X2DU/pnoR4p+Mcco8G80BQO9TP45k9xtrgUkxyHMEgCmDemdUlegArffknyZnWo1B7NG/ZsEqoS6d4ewYARFMn4iu6Ptn93gG8lDRfUpy/PCE32m/WIvx06jy0MR1iD3yodntBEqMmTC4YzQQ+azbBrnJJ+tKlhtqF86k0D11BifmdAhOYZD0xnaWo7fnOg+JiL3Hu78aazn512eVgsoeXnSDLMVL65Wxqw13FUWtgPSe1SrdOzdu1hBF4dMpnHHqPQBtzYg2LkdD248+thihGG1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7K2qfy7hoslASI73wn79MiDWsqT0yM1g3SvwyMobcv4=;
 b=NoXidZcFVA1BOJQBS+1MmP8iYfFB5iotRT9QP8JDiov0QAACsU2mejTgv3nNynHqrgOterHkjNm5Y8dbZrTXZ3iSSVnOb9tvMV7C/umh/nmn2UWXDYEd+iCdptuaE4Wx+hWpZfP82bGUcBz7UHxIbZSZ/oTh7GNRIGui6daLT/wT6PO3bWj6NU2wu/nvw0KZv4hi87F+9xZ9Nz01M07pAFjLfzCjWYbFjf4Z0V7uhtpGqw+v3as5ZBkYqKoClsPnaCguESGfCBbwDfZ0OAcRNvPlYS7haMU1fVDRgwPJbh3hgEbOYafXjgvx4lw7yGs75zGzCI3OUqXRoIRw4tXHWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by AM7PR04MB7189.eurprd04.prod.outlook.com (2603:10a6:20b:116::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Tue, 2 Jun 2026
 08:02:01 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 08:02:01 +0000
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
Subject: [PATCH v10 6/6] arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl node
Date: Tue,  2 Jun 2026 10:01:32 +0200
Message-Id: <20260602080132.3256239-7-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602080132.3256239-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260602080132.3256239-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::14) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|AM7PR04MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: f429ebf6-bdd6-4396-519f-08dec07d39fc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|921020|56012099006|3023799007|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 n4zPvGMEnoIaZob8QL2nzOFILZWAXEba7i1Sd7wRfKOaTguNhdWnsOFi82y7Q31FPx1ze9PlvFWireqHb+ysHEaxOgvnzNv8yIJB0aHvd4kkgKR+4U2JKr/2lkCdf7GlRzR0ff2Sya6La7XZpXWCqseX8V72YToTpGPjK1qB/dNKQmquaK/XDSjBM9woYFFIPK3zS1embEJanF0Bw9t2dNON+qpBXsJQuOer/4zoNMPKn3uiDBVWM7qO2sXlB5y8y0xdCPfqsvnlqNDfN9N7XRgGgXuh/C22MdhGcO/3b+kaQ8T4Zl0LjiNc2CsgGE9EXKTi3xPzai89c5b+ljnhlJcCN/wUNXLxYdN+notmvolB47o57m7OqxEW8DVbmyOfJ1KVmi2nbFB5uUhUA6+eYYaqA9f5AzBD1SNtR4dY+3dDEPVWCR/fwlXQEM8zrZj/tPJnh7fAmC8hQByqSRM1zS3q/f+q5afSWR5JquLP+pT3IiTVk0jh9l9SnYmbYv8nP6QFjSoH3AtI4kuxMjmiwq3EHYjd+TW70NaDQmRDHDEqSJqueEELi+BqM4LojjtkotdxLHmk7fgQPLAlw/sclS6u1litCQ1L9mFIN1lv3k29Llql/LtN2W/vFYc7mNFwrWwzhTCg8Xp7hE9c7qRI+XALOtH5L+bzz4IUOepJFZJJk7Ysr+Hsx2ODxOQXrdlGfyhSd2LfqirAShDr7Zuu4iwaQY0LRf/q90oX6DPn8bE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(921020)(56012099006)(3023799007)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?d1dDSkh1dWtTTmFnM3NUcVpuWTBBcGR3U2VnV3lPL1RNcHNXb2l0TTU2S3Z1?=
 =?utf-8?B?Uy8wSnFaK040ZzF5RmlPeUtxQUtLYjZFTDFyVFRNQU1Cclg0djVoelhyUVBE?=
 =?utf-8?B?bzBvZXhPNitRRG85KzlVRk5NYjlOMWdycDhjUnVzeVNTK29PT3B3cktRaGE0?=
 =?utf-8?B?dk1aemhWMmdreFJxckdsNEtUc3I0ZS9ERHY3bnpTWUkzMXBkY1VEQVFkZW9V?=
 =?utf-8?B?YnhhRmUwalhTNHFXZnAvWlpGM2ptLzErMWNZa2VNUmlaRmhQT1ltbURyd3Zs?=
 =?utf-8?B?eDlPY1drcmxJZ2hCNkxCWG5TcHByZzMrUHVPdkwrNTU3bWV4cGRhUmRsNFlZ?=
 =?utf-8?B?N0E0TGZSVnlaVTRGdjV2V2pFSmErL3Z1TFFEam1HZVdhK3A4NFNTY2s2Nm9H?=
 =?utf-8?B?UUoxbkIrUmRSUE9iQTlDc093NUxReEJnN2xXY0NKbWFLSnpJUFdBcGx4MmVR?=
 =?utf-8?B?NEhOd2ZJN2xQNnhVZk0vcWlkS3MzSDFnb1RYTmVzcDE5M3dGamIwbVlsUGV1?=
 =?utf-8?B?VGZIYVBDQSt1cUhKbzJVSU5UcFhGeTNuNG9IRkpNZUZTUnk1UUR4akpMK0Zu?=
 =?utf-8?B?K29nbHVZTUhYaHRMUjE2WHFmZTlHa1kxSFZDZCtwejAwYW13UHNoOUFLcGhJ?=
 =?utf-8?B?NkZUT1pBV3NSbWZpRzRCY1F0VzBqTWJ6bCtYRXJjb3AzelB3alpQVXZCMEpt?=
 =?utf-8?B?dFErV3ozeVZtaWljMkFVMGswQ25sY2t4cklaSEx6azV2LytaSHFsUVMzOFFk?=
 =?utf-8?B?bFlHd240N01Fb05UdVVONkpjaEpCcXRVZE0xRHNYVXF2OStXSXZtNUJNUXI1?=
 =?utf-8?B?VE1CbThNNnZzODVwenRNck1OMnkxRFkrK2tUSUdKMGVHVjZmb2V5aHlsOC9V?=
 =?utf-8?B?RCtDMkZqZ0hsamJaTmdNcG9BeGdaTzYxWmdrWXA5NmNHZTJCU1B0VUVuMG9J?=
 =?utf-8?B?U2JOTzNiUkgzSVdXY0taU0E0aHlaWnlwdUdFRlRmeTZpWjVUK1ZGRWlyRHZG?=
 =?utf-8?B?dmN2RHAwbHM0SzBKRDdSdHpNODR2QXBZNjJaOHNLTHZTNHN2TXVJZkszUjRZ?=
 =?utf-8?B?NlQyRFUwUmdWbjV1QkZxN0xCRFR3cHlsdGtPV2pvZFlydCsyRnpEa2xxS3dn?=
 =?utf-8?B?T0k5TS94UXlDdXZZYjJtb3JCOGVjSXNqdzQwcWdJUG44bVBvT3JlazZib3ZR?=
 =?utf-8?B?a0F2MDg5NVBMTVVtckZYVDZpNmdTRWd1c0RVRGwwVnRnQkp0Y2VuSkxwRHpa?=
 =?utf-8?B?RVgwN010dTBqMzY2L0IzRHRYWVY0M3c4RnQ0L3JMV0g5RWxNTllHd1UrSVFx?=
 =?utf-8?B?UWY3UkhTUGlhYWV6YzBidVArNXBHOERyU1FHZ0R5Z0dEeG82amFZdUxaYWpX?=
 =?utf-8?B?VWh4Z2FsSGRYTTArTmtkTjltMmt6eU0rRzgrU0FQRmpJMFlsOHArNFhYN3Qr?=
 =?utf-8?B?MGcvTkZUeXBDdXVJU2toa1M4TXpiZXJrRXpEWnRGbHBiSDJiYlcwTFkrOVZR?=
 =?utf-8?B?anN5QlhDbmkwdXNSUFRPREE4Y3dLbllWbUJsMklvc1BuQ0QwTHB4OFVCQTF5?=
 =?utf-8?B?dVBxcWtORjRmZGhYdGY3SmlNUjBWcFhXN0FkQTB5ZWJVZ09EYitUNitCWEpX?=
 =?utf-8?B?MzlXRzFqTklZZUxjVzNLbmFqcTZtN0JQOEFoN0NmWmtHU3FDNFFyOW9LVi84?=
 =?utf-8?B?bzNPOFZldHVXZDlFSE1aZDg3UkNrZy9UR3REdnJRU2owQ0o4V1VNRkZZTTcw?=
 =?utf-8?B?T2VjdXBCTjJ1bWtPZkRJa0hmbDhyMkxwZ2NmZEJSSlNqWFdwejNxbFBCKzhj?=
 =?utf-8?B?NGZzYUEvNUJYM1ZYM0JrRmtWblJROVlrYUIzNEJnWGR1TklpNmxzNm9LOW5T?=
 =?utf-8?B?K2RnS1dmTkN0bjhZQ1lhY2ZLZlNHR3dUZjBPK1JWU0xzSXRDTDFaR1NkcCtQ?=
 =?utf-8?B?UmVSelluV05YellCYjhxM3hDM3IxdnNEekMvNzNCanVWVVg4eTFLaGx1TmpT?=
 =?utf-8?B?N3BnWFhhUmR1M2VjKzRqV1F6Z1J0dFBleXdxakZraFVTRnc3MWFxSnBiVXcy?=
 =?utf-8?B?WDlmRDdKbW84eXkrTWh4ZnE5WlNiSGVZVEJzMGM5SFVtSUdGVzNRMnU3Yldx?=
 =?utf-8?B?RGkwNVpjYWYxVC9YWnhpbzNUQWpHcFNYb2VGQ3lmeCtxbVZEYUgzdG1ZSHVp?=
 =?utf-8?B?dTRUbk9iN1BQN2xQbWNvYUNWc3UvSm1NQUx2QXRSVFZZb0lQUGxVdGhTbUtI?=
 =?utf-8?B?RDliajZKdkpiYVNvVDNwSVNhd3VBeGlLcFp4NTJ6c2VzMHpYenBDUHdvQ3do?=
 =?utf-8?B?eDdlSmErb0YyT2M0TUVwNEVXb3o5ZTF5azF6QkVkVXZRUnhTVy90NzY4Zkd0?=
 =?utf-8?Q?JN4kObfijT9lEL4nho7DP0CVIxTOqebIn4Ayu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f429ebf6-bdd6-4396-519f-08dec07d39fc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:02:01.3090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3iAzb5l9lDs3glBLiOuHtt0GXP/O/Tf2eUYahwIw9wu8ZcBnHd2wBcPvE5tv+y+HX/2c31xbz4dnyrLDIbui7ypJCCslwolRJL4qks4CYnOll64n22PGl0M1orbyb5j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7189
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37803-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,nxp.com:email,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,4009c240:email]
X-Rspamd-Queue-Id: 9612B62A587
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the SIUL2 pinctrl node to describe the additional register
ranges and DT properties used by the updated SIUL2 driver.

Besides the MSCR and IMCR ranges used for pinmux and pin
configuration, the SIUL2 block also provides PGPDO and
PGPDI registers for GPIO output and input operations,
as well as an EIRQ register window for external interrupt configuration.

The driver supports both legacy pinctrl-only DTs and
extended DTs with GPIO and IRQ.

Reflect these resources in the SIUL2 pinctrl node by adding:
  - the PGPDO and PGPDI register ranges
  - the EIRQ register range
  - gpio-controller, #gpio-cells and gpio-ranges
  - interrupt-controller, #interrupt-cells and interrupts

Keep the hardware description aligned with the updated SIUL2
driver, where pinctrl, GPIO data access and the EIRQ register
block are described under the same device node.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 23 +++++++++++++++++++++--
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 23 +++++++++++++++++++++--
 2 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..f21c8d19bcfe 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -3,7 +3,7 @@
  * NXP S32G2 SoC family
  *
  * Copyright (c) 2021 SUSE LLC
- * Copyright 2017-2021, 2024-2025 NXP
+ * Copyright 2017-2021, 2024-2026 NXP
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -135,7 +135,26 @@ pinctrl: pinctrl@4009c240 {
 				/* IMCR119-IMCR397 registers on siul2_1 */
 			      <0x44010c1c 0x45c>,
 				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+			      <0x440110f8 0x108>,
+				/* PGPDO registers on siul2_0 */
+			      <0x4009d700 0x10>,
+				/* PGPDI registers on siul2_0 */
+			      <0x4009d740 0x10>,
+				/* PGPDO registers on siul2_1 */
+			      <0x44011700 0x18>,
+				/* PGPDI registers on siul2_1 */
+			      <0x44011740 0x18>,
+				/* EIRQ window: DISR0..IFEER0 */
+			      <0x44010010 0x34>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 102>,
+					<&pinctrl 112 112 79>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..f5825881fd69 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2021-2025 NXP
+ * Copyright 2021-2026 NXP
  *
  * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
  *          Ciprian Costea <ciprianmarian.costea@nxp.com>
@@ -193,7 +193,26 @@ pinctrl: pinctrl@4009c240 {
 				/* IMCR119-IMCR397 registers on siul2_1 */
 			      <0x44010c1c 0x45c>,
 				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+			      <0x440110f8 0x108>,
+				/* PGPDO registers on siul2_0 */
+			      <0x4009d700 0x10>,
+				/* PGPDI registers on siul2_0 */
+			      <0x4009d740 0x10>,
+				/* PGPDO registers on siul2_1 */
+			      <0x44011700 0x18>,
+				/* PGPDI registers on siul2_1 */
+			      <0x44011740 0x18>,
+				/* EIRQ window: DISR0..IFEER0 */
+			      <0x44010010 0x34>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 102>,
+					<&pinctrl 112 112 79>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
-- 
2.34.1


