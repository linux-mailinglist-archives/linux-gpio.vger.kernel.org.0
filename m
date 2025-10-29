Return-Path: <linux-gpio+bounces-27857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB1CC1D516
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 21:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 199FF4E5348
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 20:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9E1312823;
	Wed, 29 Oct 2025 20:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cv7CPLfd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013053.outbound.protection.outlook.com [52.101.72.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7E22FF171;
	Wed, 29 Oct 2025 20:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761771146; cv=fail; b=ZJmG0hh2hET6mA+XzYpDe/0OEp9yjZN26VTvMzfl5xYuDFi26VTvcFFfwu+qEwmiYoTiHQPAAjWpREW70wT+sQJImM8ZjA5LhQ9yGc2cUrvxDJXOSEhILEQKj/bAsQPa7QuGm04jkq9xgJfp9oOe1nJQxZnMn/VSjxE5bparE0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761771146; c=relaxed/simple;
	bh=blakPIgysbjjhpioqR7ve71uJAS0svQcbARnkS3vHqA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AbkJw0q6JnesYTuKu2Kg6GTeFW7JzilUpZ3048uOJyno7Ialcw8kJ+EYAzUv1hT+Y0jURpyVTlzXSKxXZvSiEZpGiVXYaT1anbcd2MFYyCRhseTK3BN3WowDeMyNpkW56eU1v8OBOrPia2dQc8Qg5BdOXqwsKGIyx1irfatOyu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cv7CPLfd; arc=fail smtp.client-ip=52.101.72.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXWPjTc3qVmn8hD/8nEHsSXLxhYR9MJcabZzX92sxkytbLKRmaUOzD9Ye0k4NmIzQY9HKKp6EuUqw0UZhLSuwpEWq/bEvNSSSTwdJKEwuM1LefylzYDp8Zzs/C0cG2x9lGFFCWeE8B8OVSDU3TW5ZWpHv+Ay5cG1zJFHPszDai4IBvPD65xfMTkrC8cfKz+/FPNn+phALgyUzv8/7nEFMGgvBDIit53w4jrRvbL0JWKSWTc9Th54WYYmlho82Xj4PFBGpp0Vy0jhNpy8fw4yMiALwOh13lYwGEE0Dgo6wTP2u3O3Uk8T7/gRPBx8vkZUNIhVAJPyKigpmvFhhBUf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blakPIgysbjjhpioqR7ve71uJAS0svQcbARnkS3vHqA=;
 b=EaqLALUrkwXCF3SGav1e4JAmvFU9A+10evXl8vgjwT82hCQFV8j+SQPY1Bqz4jKsIoIrRUMMmemy9U64iygXOR//o2hWgmark3hckkpbBCsmVs4Nvmv+sgfBJP676457FQ6fyZiUgdb+/UyZWW0etCj95+DwPap/ByiSevnw3iKkR0JatjUHniasJe2S8Ih2W+APADopjdSWPrakTMcwFBHCFWsxGugLESvV0RWgPkuTesjqI4oimOlPGvPmTUBpAqlb3Z13XVB7yCoCNIIckZmL9RipUcdhks1c2Zi/ZREhQrUdzypcZniHJmC2L7GqT1o4Ns/fm8iLB+Hyd8co7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blakPIgysbjjhpioqR7ve71uJAS0svQcbARnkS3vHqA=;
 b=cv7CPLfdKrP6NiGJH7uGjvsp/AatMx2SSXQkBe4xNFci8c5ez4W58nAU0HjWIBoJZ0M/vEl6Jouev/yOjjwO+bybTiBvBMI9YgOIMAgaJUSOpR0anTNGa9WmD3Renw1Sl7AcyprYPCwdNHFw+axgMG2x3Q8LdkxnNMV5oaqIhfNl5Rd5zF3XOO9dNpojDioGBy69tSMNflcTbsl6Kqa1mk15vnMIAFNfgGrFsAinABBC1yBcFnwR/ExHjS0pyvlyfWHaZMnKDqVhmoq51vOF2s9ClugnxWswDSlg4ECYnUnhuVzs0JHilqw6knFiMfXaKfyNvOKBAfnwDD01hfRaPA==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM9PR04MB8275.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 20:52:20 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 20:52:20 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Randy Dunlap <rdunlap@infradead.org>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan
 Corbet <corbet@lwn.net>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v4 3/5] docs: admin-guide: gpio: rpmsg: gpio over rpmsg
 bus
Thread-Topic: [PATCH v4 3/5] docs: admin-guide: gpio: rpmsg: gpio over rpmsg
 bus
Thread-Index: AQHcSRXrCJ0/oV8BDkCkXGMWmNXxMA==
Date: Wed, 29 Oct 2025 20:52:20 +0000
Message-ID:
 <PAXPR04MB918593CC07C246CADA458E4689FAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251029195619.152869-1-shenwei.wang@nxp.com>
 <20251029195619.152869-4-shenwei.wang@nxp.com>
 <0b5feeb5-87b6-4f26-b9df-a23159b977e7@infradead.org>
In-Reply-To: <0b5feeb5-87b6-4f26-b9df-a23159b977e7@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM9PR04MB8275:EE_
x-ms-office365-filtering-correlation-id: c57419b6-1cb8-4a3c-5c2d-08de172d0dd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|38070700021|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?dGMyZnBTTHozUzZVL0xJdnFnTDhWSTYyZWxHbTN3UFgyUDF5Z0JVcGxWRE9h?=
 =?utf-8?B?WEpCcnppQjJiSlRQZmxNaVdVVDQ4Vk5YUGJkYW5SNVlBYkhEbW1zR2JvR0xW?=
 =?utf-8?B?L0NFbmpyNGJITVVVZDF0R0F0cFM3Q3dJRkFkeVRoNXg3UjBrSTg2a2VCVVZ2?=
 =?utf-8?B?eE5YbFU4VHd4OURXZzRIalpDVDdHZmpEdzMrQjFPQVdQM1BHOXdwekF3OGpj?=
 =?utf-8?B?ZHlzTnZPSndMdVFtb3gybENVRDZ0R3FUa0szZkRWcjF2ZFhSZGphWldFc0Qy?=
 =?utf-8?B?dUx1ckZqOHVQT1pycmVFd2RYNXRaNEpOVXFTVWMrUGpOejBmN0s0bjgyT29N?=
 =?utf-8?B?bDlMaHgvS0Z1empEbzdIc2FxQlFTc0xCUFVvbzFxUjMrZzBZVDBZNFFHcEpv?=
 =?utf-8?B?bUd1TGFVRUdnK1BYMzRMekZNOEN2OHA5OVdabmE1WGQ1QkFjdzk0dy9nYjJl?=
 =?utf-8?B?WTBXSUQ1U0dlc1BKL0ppTzNtUzVDanFaajdRWEJ6bXh6TXQyK29qNDhWTjhJ?=
 =?utf-8?B?L2UySDg4ckpEZkJ5a25oalpmQUM5Q2NmbS9NMkZlNDlBQzFEMHdLNXpmcGxK?=
 =?utf-8?B?bWZRTHIzck5ocFlRYzQxWTVUWThsU05IdENCam94VHZyOUJLc1lDQUR2UmU2?=
 =?utf-8?B?K0JUWU1pcmx0WU9XTHlGRlNvTkFwSElURGRrR01ybUxidTY3OFlQV0tLbnlt?=
 =?utf-8?B?ay84bnFmZTZWVmZsQVhRbXhIb2dsMHVyWE9NeWFIdFVjTGs0WExGZU9DeC9u?=
 =?utf-8?B?TlFUK00rWmlzdGdRa0c2WnVFZDIrZTRBRTdDVGpSM1VZM3N6YXd1cG9VL0xH?=
 =?utf-8?B?R1M5ZUtZTk5TdjczNUhtN1BSeGRvZWhtcDcwUGtEdmo3ekdpT3NFQzRFR2Mw?=
 =?utf-8?B?T3pOMWhTdmNLY1M5c29CTG04dFMwSjY5RkZyK2k5TWRTY1VaeENXWi9ZOHdG?=
 =?utf-8?B?QmJVd2lOWWRJSWE0ajlmckJCUlNHeHVJUTZDMUJucDVTSTN1TE9yLzdPWFFG?=
 =?utf-8?B?UTNiTG9hK1I2Y2JKYmJVNUFyTnZ2MCszbHdiU21aNStCanR5SlJUbzlBSlZY?=
 =?utf-8?B?WVZUUDgvV0F0TTFjd0FGdXQvZkJxK1VtdFFHTmdNSGpob0RwdnJuakpocHp2?=
 =?utf-8?B?V1VIc3U2eWdxbjJyMkV2SHUzODV3c3k2L3l2eGFjVjlIQm94SnhLdENHUEZB?=
 =?utf-8?B?cjF6eVpXckdQQmRxWUlHQzkvKzlEYVFQcDBQN3BlUThUYmJ2SFZXY0NCcGRy?=
 =?utf-8?B?Z1hGMnZyQXNUVEtqUU0wTS9jRzRSaTJMT3UzV3I4dHR4LzRBQTZBbXVpTlN5?=
 =?utf-8?B?Yi9mZjhvZkNhSEVVZ1NGbTNCRjlnZzNqSzBuQkc1WWlFR0NIYXNXY2xsVktI?=
 =?utf-8?B?WlZqMjFYb3RHUytBaTFGNzV5dXBaVkJiU0hRSm1zT0lWQ09IMWNvNHFIOXVP?=
 =?utf-8?B?WnZrTVY5c0twK0MweFVkYUdZVWtiQW5PdWhUSHRURHZuN2lUcXlSeVlUME4w?=
 =?utf-8?B?elo3VnI1TEp5K0ZML053T2ttYkM5SHBYd043ck9ZMFNrcEc2ZXV0SVN1cnpD?=
 =?utf-8?B?VzZXRVhWd2xYc21EV0dwMmNYQTNxU05ZaU4yOElqZXc0bjQvaXBjT0cyUVRG?=
 =?utf-8?B?bGYrc1J5U0ZyeTYzSlp3RWlXRFpzSnpWa3k2TlVLM0lyMUdQMENkMHl5bGpI?=
 =?utf-8?B?R2o3MWplSEcwODlEdklTY0xTMm42bERnV1VuNVRoclZ0WnhuVFZiSEcwZ2Zj?=
 =?utf-8?B?Vm9Ya3FLMFJYcXg5S0liMlk2RnkwWUNSTG1UN2ZBUFBDUGlhejc2QklXenFm?=
 =?utf-8?B?eEZEdkRxdXByS0o0b1FvOW5oSGdvR1JFcUY4SEJEUlF0VndPRVJYN1FvSHFE?=
 =?utf-8?B?bTgyRnMwSnJkSkNBalpsdElMdmtRdXZjMlFjdGEyUlgyQzRPSk0wa0NlTHF0?=
 =?utf-8?B?eFZqcmxUMUZ4eDFnODJMZVlLZ1RPaytNdzZwdXd5NDV2SXhkTnk1bXRjMm1t?=
 =?utf-8?B?TzJsYm1jbVhXRHFvcDA0Tll2WUZqWUxJZDd0NTRYZDYzaFBvbVV3ck44d2pk?=
 =?utf-8?B?eks0cGJqOWI4blc0SGtnRlBHbnVjNFY4REpqQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWlOMXE0eU9SbFlOcy9kcUl4b0FvRnMxOXJVbmhTbnBKNXNjT0lCM0dlODdO?=
 =?utf-8?B?U0lqQ0ZNVkxseFdNWFlES3BOUWRNSm02SFBvYzN3SmxoVXpYZXRkSzJDZlhy?=
 =?utf-8?B?MFA4bEtIQUd5d092bS9WeGo1WXBqanJlWUhKM1JIUjU1Ums2SVdsTGZjSGlN?=
 =?utf-8?B?Y3BUbG8yVEl6NFJzVXlnVzFlSDlwRlJ2SE9SVytqNUgyOVBUa3FRRW15ODhP?=
 =?utf-8?B?eTZ0VllCZGhoT3JVTzVUcGFWYVRvUnBCNnF0RUtKdzYyaXh6VWRrZ0tOMDhr?=
 =?utf-8?B?VW1YRnpOZGRva0ZDS0V0RDhnbENaVHA3Z0ljYm9qY1VCTUIwQ1hPMUlvRUU5?=
 =?utf-8?B?eGRWSWpWWFVLbHlPaHhHUHN1aFc4SWk2M2h5QklqWDc2NExjS053aXNoV205?=
 =?utf-8?B?UW82M0RHWndaOE9aMGNJNXpMVTZGSjFKM3huVEdYeFRWa3ptc01VQ2JCK21F?=
 =?utf-8?B?dFZLWmZPZnd3ZzVBWXdxcDMxWXRqeW1DcnFVejVCZWRuWDFJTENSVVQvamNo?=
 =?utf-8?B?Vm8wMmozRHk1R1psZ092bWx6aS9VVTFPYmVHZ2lLLzFFSTc5N0M2VkNXOXph?=
 =?utf-8?B?N1BNN2FtQUI2eWtRRmVXK01FYzBsNS9KdURkWGtXWnJwSGMxSHpuSWxjd2V0?=
 =?utf-8?B?enJWdTNEd2liYVlmRGdhNmVYaDMvS2lnRzRLcVdPUVVUd2FKKzJCdWFyV3Bn?=
 =?utf-8?B?STUwV1RvSXJEZXNDc280RzN2MURsYjlVVHZaTi9NTXJBcmFMTXhoMkcyaEJr?=
 =?utf-8?B?MXpuTzFsMGtNWlp5NWpGVkNZUnRWd0NNMmVCRUhRajdTZ0QzTWtKUGlmR3pL?=
 =?utf-8?B?K0MyckFBckJEL1BtNXljNlJlZjlOOG0wUzhwWDU1TGNzaDA3a2I1cW5CK25h?=
 =?utf-8?B?TURIU3lmNzlreGF3QnJobXlXWm5qSGxCWVFjRWc4dHRsZnE1OG9WYjJzcE14?=
 =?utf-8?B?M0craEtraDExWVFiUUw4V29tb3FiRnhXKzRiZ1p0dTQ3a2wxcWcraEtGTk9B?=
 =?utf-8?B?N0dZczRoWmhoSjZCT0czL1BQb0gvWW5JNmdwc0RpTHNLUjEweWxwTmRzcC9V?=
 =?utf-8?B?VGtqMThLT2d5QTZCbithMUM5bDNRT0RjMkY3TVVlUkJsMzlSNDNZeFJUeTJs?=
 =?utf-8?B?U3RaV3NGM1lEMjhwa3c5VFV5eFNmT0d0NE83cmhEeFo1dzhOQkJuZ05MY3Yx?=
 =?utf-8?B?M1JpazFXN1JtWTdldnN4WkdmcUN2a3pMcjh0eVRqeERLVWt5ZVVKSzU4UzYy?=
 =?utf-8?B?WkxZZ1ZjUWkrM1JzVzlwVnFBZW5GUG1VVnJTZkx3cTlSZjFOa3Q3QkRBYTZ4?=
 =?utf-8?B?cW1hbnVOb3ZNYVhZeVRsUG95YW1XU3RBSFN1YmY4eENiRHk5L3R1a0F2Z0hW?=
 =?utf-8?B?M2c1NVVrd2pJUUVuOStSWEowM0IyZTVadEJla3dsaFBqSExDVjB3enVLWUVu?=
 =?utf-8?B?ZnR1OE94dkk3QVYrYTdwd08xYVZNSC9QT1dKbTZJRDRXVzJPbzB2bVBHckVo?=
 =?utf-8?B?YnlQVmM5ekpJTjdiRWRwMUlqWU9YRWZLV0h0cUtDWkFUdXVnSURFeWdOcGpM?=
 =?utf-8?B?VEhmbGMyYkNpbWYwdllGaFRvZi9rUU1NOTVoc3puNWVOdEM2VjI1ZWhUOXBt?=
 =?utf-8?B?SjkvZGpBNHl6ZnV6amx1dmYrYUY2UXdmSk9ndkdhR0lhQjdpZmlaR05wUHB2?=
 =?utf-8?B?UndFWjV4M2xPTWJvRkd4T2NmeWZkNUltTDlBRDNDT0JTUnQzYmxuVUk2OFk1?=
 =?utf-8?B?OVBXbXNTWDdDcFE5T29KQjNSTnNNekVaT1paU0VzUnhobzNWamVFRk1PL0c5?=
 =?utf-8?B?aDJmK0orMUR3MTg4enRESmwyN3FYVC93UGtRWlF2bGNvVzQveGRRZTFuNXRu?=
 =?utf-8?B?TytEc243Y3RRbXYvVHJhRDR6VFRoSjZYcG13Z1JUOVh4MGZBcUlWdllIUEM1?=
 =?utf-8?B?bFpDdkJqUGFOdXNpRFpxdTl4Mit4Wm9iOXpKay80dVZDRWgzb2Q4NmxvSnVl?=
 =?utf-8?B?TEFzcmZ6Ulc5N1NDS2dVMUgvN3hBd1VUSVNHV1Q4Y1NMUTlHQWErS1UwY0ls?=
 =?utf-8?B?MWhPdHBYMlIzVWhsQWVhYktEV3ZWN09WOUhHcEhlTkhaUkhmWUxzTG1Sd2NJ?=
 =?utf-8?Q?PPig=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c57419b6-1cb8-4a3c-5c2d-08de172d0dd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 20:52:20.5471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZV3tOO33gordi1JPYJgZR3t6z+yBBu9GO3r8iLoRiQY1a+wjhAjMJjD/4IetktJjnxceFv1tqfzFJJsfkCNLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8275

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmFuZHkgRHVubGFwIDxy
ZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyOSwgMjAy
NSAzOjQ3IFBNDQo+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPjsgTGlu
dXMgV2FsbGVpag0KPiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsgQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD47IEpvbmF0aGFuDQo+IENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+
OyBCam9ybiBBbmRlcnNzb24gPGFuZGVyc3NvbkBrZXJuZWwub3JnPjsgTWF0aGlldQ0KPiBQb2ly
aWVyIDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+OyBLcnp5c3p0b2YNCj4gS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25v
ciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBTaGF3bg0KPiBHdW8gPHNoYXduZ3VvQGtl
cm5lbC5vcmc+OyBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+DQo+IENjOiBQ
ZW5ndXRyb25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0
ZXZhbQ0KPiA8ZmVzdGV2YW1AZ21haWwuY29tPjsgUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+
OyBsaW51eC0NCj4gZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LXJlbW90ZXByb2NAdmdl
ci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gaW14QGxpc3RzLmxp
bnV4LmRldjsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gU3ViamVjdDogW0VY
VF0gUmU6IFtQQVRDSCB2NCAzLzVdIGRvY3M6IGFkbWluLWd1aWRlOiBncGlvOiBycG1zZzogZ3Bp
byBvdmVyDQo+IHJwbXNnIGJ1cw0KPiANCj4gSGktLQ0KPiANCj4gT24gMTAvMjkvMjUgMTI6NTYg
UE0sIFNoZW53ZWkgV2FuZyB3cm90ZToNCj4gPiBEZXNjcmliZXMgdGhlIGdwaW8gcnBtc2cgdHJh
bnNwb3J0IHByb3RvY29sIG92ZXIgdGhlIHJwbXNnIGJ1cyBiZXR3ZWVuDQo+ID4gdGhlIGNvcmVz
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhw
LmNvbT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9ncGlvL2dwaW8t
cnBtc2cucnN0IHwgMjAyICsrKysrKysrKysrKysrKysrKw0KPiA+ICBEb2N1bWVudGF0aW9uL2Fk
bWluLWd1aWRlL2dwaW8vaW5kZXgucnN0ICAgICAgfCAgIDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDIwMyBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2dwaW8vZ3Bpby1ycG1zZy5yc3QNCj4gPg0KPiANCj4gSSBkb24ndCB0
aGluayB0aGlzIHNob3VsZCBiZSBpbiBhZG1pbi1ndWlkZS9ncGlvLy4NCj4gSG93IGFib3V0IGlu
IGRyaXZlci1hcGkvZ3Bpby8/DQo+IFRoYXQgbWF5IG5vdCBiZSBwZXJmZWN0IGVpdGhlciwgYnV0
IHRyYW5zcG9ydCBwcm90b2NvbHMgYXJlIG5vdCB0eXBpY2FsbHkgYWRtaW4NCj4gbWF0ZXJpYWwg
QUZBSUsuDQo+IA0KDQpIb3cgYWJvdXQgcHV0dGluZyBpdCBpbiBEb2N1bWVudGF0aW9uL3N0YWdp
bmcgZGlyZWN0b3J5Pw0KSSBzYXcgYm90aCByZW1vdGVwcm9jLnJzdCBhbmQgcnBtc2cucnN0IGFy
ZSBpbiB0aGUgZGlyZWN0b3J5Lg0KDQpUaGFua3MsDQpTaGVud2VpDQoNCj4gPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9ncGlvL2luZGV4LnJzdA0KPiA+IGIvRG9jdW1l
bnRhdGlvbi9hZG1pbi1ndWlkZS9ncGlvL2luZGV4LnJzdA0KPiA+IGluZGV4IDcxMmYzNzk3MzFj
Yi4uOWM4ZjQ0NDEwMzhhIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3Vp
ZGUvZ3Bpby9pbmRleC5yc3QNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2dw
aW8vaW5kZXgucnN0DQo+ID4gQEAgLTksNiArOSw3IEBAIEdQSU8NCj4gPg0KPiA+ICAgICAgQ2hh
cmFjdGVyIERldmljZSBVc2Vyc3BhY2UgQVBJIDwuLi8uLi91c2Vyc3BhY2UtYXBpL2dwaW8vY2hh
cmRldj4NCj4gPiAgICAgIGdwaW8tYWdncmVnYXRvcg0KPiA+ICsgICAgZ3Bpby1ycG1zZw0KPiA+
ICAgICAgZ3Bpby1zaW0NCj4gPiAgICAgIGdwaW8tdmlydHVzZXINCj4gPiAgICAgIE9ic29sZXRl
IEFQSXMgPG9ic29sZXRlPg0KPiBJZiBzb21lb25lIHRoaW5rcyB0aGF0IGl0IHNob3VsZCBiZSBp
biBhZG1pbi1ndWlkZS8scGxlYXNlIGV4cGxhaW4gd2h5Lg0KPiANCj4gVGhhbmtzLg0KPiAtLQ0K
PiB+UmFuZHkNCg0K

