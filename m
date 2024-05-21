Return-Path: <linux-gpio+bounces-6491-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6D08CA7DC
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 08:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D8B91C212DB
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 06:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAA443AB0;
	Tue, 21 May 2024 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="I2TxopRi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9EF225D4;
	Tue, 21 May 2024 06:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716272228; cv=fail; b=XotwZ4U1IkCojD+Rbc10GEOcBkmLr69yA/V7x6eD5zBWpmG81o2sXWiyar2PkQ6hzW2W8+/81zvrQOT197mymDQF1+PogjKhEiheIqiDnqpton9BGE2OgOWqEaSyVHOHtjfIA9TgmyuYlFMo8BLzW+yfxy97C+42PFechUDEzT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716272228; c=relaxed/simple;
	bh=IdSIu4WSeFnvsYoBfpMvGzM9/rJ16xptCh2VQULDStE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=LbxjKvF27hxLwVmvyL8ZRBbzdTwCvU7PQvy+n1SZ2enukVnqN6TsMrZApePsqanxzx0955m/0KO9nfMDAT1ti+Ozo5Agxkk3Pd8RK+Qzff1wKKmoEyvYOjuBD/H12RpFNDbvwEzSCPMjJ2iEuuQpntEpn7mPnvwLtpKv7ZXWUWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=I2TxopRi; arc=fail smtp.client-ip=40.107.21.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDHAxwZKGvSThov19Ymu/k+RqVVx+SLyb8sQ4OkwCaCZT8enymkvvGHrWjcS4qIWxErEbdksQ/OvOvNVETTjsYsJkXCJP8/78gNvZ7hgDAfTzUOtq85WC/HBHLbfWm9ypr2VUwcihrFDlrZBAQDP5eNIpduSkLAxyLzjrTlg1iydt1IAp7qFFjg0P1XjT54z08huY6AumtoiW3raGejmSs7EG/5rPu1XnlBZngKNdnXzqxNc2T7ZAKucI2uBNuMrBpTp7NF5VkUE3cpj5ubHm1MuXHp789vHvc/iyp44KnVsenthjSGqwZ4XVzpxmn0gZ48REwFcn1boloNHA8gmmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+R5UT6ywihKU+aH1dbeDMwP1O0X2AP5C4e52JWa8+8=;
 b=SEEmvpO9oEG04s1d5i5bPeWN97lcb2Ht7q1ngM0bvGtbUspPnybcIRW0Pon2+FEn9mav6MPsh+SKa0fzW7a7Su+NoPlEk+KsqDRDlLZwMVJmip6EcFkyMfkwbKwAnVDXu5f1h+0ETCWVVS/GHGHYD0IIq/mxrOiBZDPI2dPtUuCDyOmgXi771m4+8STnEaQXwJWEPrUjKG/9hdcyyN4o1rwwgWrm2XursHlfVFP+C9b1S5jEhm53zPcUuuugZ9IpceaCa7pm1xMefCtWkZFq1b/53tnfyZ/Q0FWZizrxU4f75uLNOfdOChwcp14/w89wHUoSmdBbTwJz/H9Ip+aW6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+R5UT6ywihKU+aH1dbeDMwP1O0X2AP5C4e52JWa8+8=;
 b=I2TxopRinqWpS7WmhxLq2PpmbBhtvYGXFVgT4p5mMcbMiHzzwW5rKX29FD7IXFrI8hmCDhLMUO0/JfG5N/QArx3kfba4jUxiV4UhoFM6jODQ1Sk8YILgVp6EVyU/KznUmYqVeXNfj6lJzhaUfBhcDETqNNJ7gZetfpV5BH6kvmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by GVXPR04MB10705.eurprd04.prod.outlook.com (2603:10a6:150:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 06:17:02 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c%6]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 06:17:02 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
Date: Tue, 21 May 2024 14:25:56 +0800
Message-Id: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHQ+TGYC/x3MQQqAIBBA0avIrBswycquEi3KxhooE40IorsnL
 d/i/wcSRaYEnXgg0sWJD59RFgLsOvqFkOdsUFJVUqsSA3t7xg2T3Rl5v43Gtm4mGo022jrIYYj
 k+P6n/fC+H8T4sONkAAAA
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716272771; l=2558;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=IdSIu4WSeFnvsYoBfpMvGzM9/rJ16xptCh2VQULDStE=;
 b=GtkzBn4jgkjNr2KU0qj35rBVCaOXd3QjQhkqAwCgSTZhpnKPLY5QsHwSkuqdytk0NIPedzsPT
 csS9+qiAYajCv2aMFpMmBZ9LokM6ckw+6vTKeV91yWRPX26Eelu8nrF
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0157.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::13) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|GVXPR04MB10705:EE_
X-MS-Office365-Filtering-Correlation-Id: fcdd7484-d87d-4c07-1cdb-08dc795da104
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|1800799015|52116005|376005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVZETlZoTiszOTZRczVXVndJTGJOWkZTQ0x0b29tQk40SVVsWFVLM2NUMmkr?=
 =?utf-8?B?WC9leFUwTGpYUVFVdzNpUjM1MFpkdUFhM3dEa0M3N3hyUkRYcVBkWE1qSnJT?=
 =?utf-8?B?TXpnQVhuKzdrZTI2bDliVm1CQkJ0enN1aWgydStES2ZhV0drVzRnQmYvNEhw?=
 =?utf-8?B?dHBrRzRQdWUyRHlRTWZIVkc4QU9IWEZDRWJJckdHWmpqY0x2a1ZoVjcraEww?=
 =?utf-8?B?am1QZWtBZHJJY1VJVmtETFR3TTNtV05Gay9WN21EMWs1K3R0enhpVU1HWWF6?=
 =?utf-8?B?L2pKbEdJT2V3WVEyMmFLZmZHTENDb1pmMWZZV2QySU0vODBtL09kaUdJNU5Q?=
 =?utf-8?B?QzBtaTNiZkdtWFVCcWlSbHJWY1B4SitERm41L1FSbHptRkFjTGNKQjFyb1E1?=
 =?utf-8?B?ZWgxTnFsQkVqRHdLbUVUOXBXTTB2TTM0ejNndEp4Ti91VEpPT0lvZ0Q5emsy?=
 =?utf-8?B?b3c1RG13Qm9GakMzU1YwQWx6VlAzTkN4UWNTUDhyV1gzM3NKckdhcW5MZmdr?=
 =?utf-8?B?WVhBc1pPT3paTkRLZldLZEtFZVRZYkVQNHBicW9EM1BhWktXTVYyVGhyZVd0?=
 =?utf-8?B?MnVzbFhjWHdVUmEwTUhkdHdxQjNXbEhMRDBlcXNMUUovK1pmcVMya3VOd3NW?=
 =?utf-8?B?RjJxREpIQS8xNTF1Rnk5anlpMUNyZGk2ME4yZWc1TDZzTGdLb3FRRm1PTDFR?=
 =?utf-8?B?TklEVnE4dE9EVXlDVTgzZFg1bVk2ZWRSdEQ2R21IRjBjb1N4Y2NkN3JPS1E3?=
 =?utf-8?B?bzRiYVZNckNWS0s4OUpjVjNKSnprUWQ5YUdpM0J0T1MxbEYwTWJkVWl4WDdH?=
 =?utf-8?B?aU5QUG5YcUtZcy80RTZ1VGIzL3ZSamdaNzc5L1NMTVh5UkMxeWJaNWNMek9G?=
 =?utf-8?B?V3dhMVN5UU1FcjB2WkN2Z1NSd0tKVmNPa3VOM2RBNytVNDdSWFVtd3pJV3pC?=
 =?utf-8?B?MThQMFdOSGlVV1hodnBHdEgvZ3lLMU1kaFN2OG1UbWtXWmJYaHFWRzQrM21Z?=
 =?utf-8?B?M1lPZjdxMklOdmZoYkcwTmJCcUJkbGFwZ2M4bnRlSzh1VWhEd2lFQVJyU3Zn?=
 =?utf-8?B?b0h5NlVnSWZyOW5Ma1M2Kzl4eENzT2t0cVNRZnEvTmUyK3dMRzgvRFBlaEdZ?=
 =?utf-8?B?QzViSkpJeHZuSkpDUVVzUHh6ZzFndW5ydE1MTWVQK0huR2hGQ04weVJiTVRl?=
 =?utf-8?B?U1VCanFUMVZzQm1RNGk1bVY0MVJkVTJXM1FiRTMzZ29aNlVNTDFUNDZuL1Bv?=
 =?utf-8?B?V2pJalRjcXBXbTBEdTNIWVBQb2hGdW5NTFFoV0VEbkVSLzFFWE0rS2l1OVJm?=
 =?utf-8?B?cUI3UktTTzJrWTE1Z09obXJhaGJMc0ZiSGljREROTDRYV3Z4MDZtWnkrSktL?=
 =?utf-8?B?amVJVXdPdTZWZ0Z4MXlxSzQxcmZIWm5ZbG1DTDNUT21tclZqTUxCdVcyUTRZ?=
 =?utf-8?B?ay80MkovSmRmZXdQS0M1ODRSelNVMHdKT1h3NE9pc293Rit1Mi9lVjI0ZFpp?=
 =?utf-8?B?cmR5NXp4Z1ZmbFJSd2VsUDdMTDJnckdjSEZFTWdWQWo1U1FwbzJXVVNnZGtJ?=
 =?utf-8?B?QkIrRkJ4Wks2L1NGREVsL293NXFQRis5a3dwNXdFcHNOVlh2ZlF5UDZITkV1?=
 =?utf-8?B?YnV3U1ZQU3JydlZWOGtaMTZZVnZBUmVkbVRGZlIzNXRVQmxhMEdSOG94TlJ2?=
 =?utf-8?B?MFNQczlrRlFaZkIwRElFNlh3MWplZTdsdmxqZklMMXd6ZGhMb1p3cnNaZDB2?=
 =?utf-8?Q?DAm3F3TEykCZZB07YZwtSIbGLzovxcjyJLSDADZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm4vTExiL3ZPVzVqMUFzN1Nxa0lhWGFCQS9mbXpZNUtCYWVmYk44THlFaHc1?=
 =?utf-8?B?TEQySUsvNFcwS2JJcWJKbFBWaEV0aGZXMXcyT1F1dDQ1d1Zxb1JKcmEvQUE5?=
 =?utf-8?B?c0lucEx3bjBGT3BoUkdEZ0NVVDBuQTQvQnYwbXVobU9HcW00dnNSeFZ5b3Fk?=
 =?utf-8?B?WDZJMjJPWkFYdGFGVTQ4OUNad2tFN0RvS0QyVnN5OWpQSlk0TDh2UVgybmYw?=
 =?utf-8?B?aHZlaUZpL25DMW43bTd6a0lPS1VvM21PMHp6SFhpaFZJSVQzTVBpbU1WbW5S?=
 =?utf-8?B?UjB3alI4YWNCV1g5WStNTGN1SUVhd0p1Q01MNGhqRmJJMGxONG9DS3NVVURF?=
 =?utf-8?B?d1pUTGVUbWdLR3ExeXBJblhHeFpiMjZqZHRjMk5MZS9XL3cyTWdGUHV3ZEM5?=
 =?utf-8?B?T0gzQ2tuR29EcmN2ek5JaEJQYjc4K0F4enc5U2NoclpUSlVTUjVKcmZjRDJE?=
 =?utf-8?B?UmM2c2pBc0hFOUFSM0MrOXFtVmR4NmN4cldqakgwbWZmbng4OHA2T1BkcU1N?=
 =?utf-8?B?dFlSNnZTZEYzMGp1aVZUTmFXUlRQVUEyNFZTT1NQYVp1V3lxSXlTS25nS3dx?=
 =?utf-8?B?RXNsYkpIbDU4L3NyN0NtZ2s2Qi9KSitRV0lIMkV0RWgwSDkxcytHeTk2NVVa?=
 =?utf-8?B?OWs4a01QRDhxL1lyS1lkYk9MNmVJYVBPYmZ5d3VLSHdabGpER2gvZVFNZmEy?=
 =?utf-8?B?YVBYamQrUUhpR1F1VE9ZaEFNZWdpdE9wNEJ0SFh2Yi9oei9CV3FPYU96VHJn?=
 =?utf-8?B?dGNPZkRYRW5CcGRKYjVFdWxOWnY5a3ZxR25SRWt4ejlLdTUvMmFod0NtWC9D?=
 =?utf-8?B?NW1OZUJKaEVMclI1NFhoWmYzUDY0bjg2SFkxM0lkVFFiK0NlTVVJaUdHeVhq?=
 =?utf-8?B?SVVHZ2h3T3Vhb2o3ZnBVdm1FZXFjY0NBaHZEaC9Ra2tLdkMwOGQ0Z0JYU1Jk?=
 =?utf-8?B?em44d3p1aDBFQmtqd0VDUWxjRW5mamwzNFpraWo1WTRLK1cxbU5neVlCVWgw?=
 =?utf-8?B?cG1wL0FYM3AzUncyY1haQksrR01kRzVoaW8ySGh3cUEvMmtwVE1jNUs0RDRi?=
 =?utf-8?B?TkJ1dXNGWkdlMHpqeHJzTDNvM2tVMEoxaDZDWEVUT1oxN2d4Nkwrek5pcG90?=
 =?utf-8?B?cXdNMW9qd0hXb1Bqbng4bzM3bjJsNmVQQmRZcVdvWGd2cXRtVDlmZVhHcDZq?=
 =?utf-8?B?ZytnaVBkQW1lQ0N6RENnUHpqZDJaVHQyK2RKUTIxbVJYNDlqbzlKQVJtSU5i?=
 =?utf-8?B?bWQvTGxZdzhrOUJkQUdxaDk0Y2EzaVVuYlh2czhOMWt1ck1hZGhPRzk2ZHBC?=
 =?utf-8?B?TWkrTTNWYnhnSWpWY2UwQ0hxVVoxZVNwaXEyeHY1ckcvbFhSdGgvdVNKcS9n?=
 =?utf-8?B?Z2xmVTVzMTFQaDdMSXdpR0hMeGplR0loYk5uTTBXTUtzbVUweHk4bG5OWVRG?=
 =?utf-8?B?aGlFYkVxS2hIMy8rNVRZSjA3Qm5zUjFrWFBXajduMnV6cGVjdm1hSTNMU2RO?=
 =?utf-8?B?cHVUSXhpa2RndEdDKzc1RG1sVEVjZkVTaThJR3pTNW8yeHM3KzZmMXd4Wk5D?=
 =?utf-8?B?REhKYVVBaHpjSkpOQ0RPd0RITlpYMk9lejI2dEJXRzFLblZlb203c2Y5ZE9w?=
 =?utf-8?B?MlJDU2x1VG45QUsrTjdQT2hJdFRHb2pwM3dIUytKM3VHblkzOFhHQjRKeFVi?=
 =?utf-8?B?QjJrQ0Z2a093ZmxTbXJFYWh6UC9OYXlwZzJUcjROTExUVjlxY0V4RjNpazZZ?=
 =?utf-8?B?NUF2cm12SzBzTkRvVHhObjNSUzFTNFRSTU1McFdrdGlLYTZQYWRSWlh3Y2t0?=
 =?utf-8?B?TlEybXM4Y25ObjJZaVZnZUl0VEgveWdSUzIrZHpQWjlsalBmczVVc3BXOE9C?=
 =?utf-8?B?dW1yUklMdXZRTXRyWHJaYXdHWEUvYUI3NDJmeVRIK3d4YUNodkZPUngzYmNX?=
 =?utf-8?B?UkVKRTErVllXZWVRdTh0TlhGa0JHa2tlb3ZyRWsvN05BQ09UVm9oQjdGU2pS?=
 =?utf-8?B?d1ZuTXBDa3N0ZHQ3QjVhSXl1b1hPMEJ6TDM1QTRkNm1uOEdtYUV4aGtoZlNT?=
 =?utf-8?B?VktTb1Y2RFB5TjBHSXk0RmhubUlic2NZRzc5MDl0dkJLS29CWWdsVHVDK1g1?=
 =?utf-8?Q?gA+Mc7QAdxFNUHAxkFvd268A0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdd7484-d87d-4c07-1cdb-08dc795da104
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 06:17:02.2687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlD7PBtfyc3gQSbrI2pIHZ97ZVkjv8+PRluW0Da66ehILVjNcWPZXJdYVG+sEbsh3sR++kkdFZYK8Qf4xPK97w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10705

All:
 There was a v6 that use generic properties, but at a late stage, NXP
 internals decides to switch to fsl,pins property to align with other
 i.MXs. Since new properties, drivers rewrite, I start this patchset
 from v1 with a new patch title. A RFC patch for binding was posted,
 since Rob said he is fine, so post this patchset out.

 Whether v6 or this patchset, patch 2 is a must and was not changed from
 v6.

 The pinctrl stuff has been pending for quite sometime, I would be
 apprecaited if any quick comments.

v6:
 https://lore.kernel.org/all/20240513-pinctrl-scmi-oem-v3-v6-0-904975c99cc4@nxp.com/
RFC:
 https://lore.kernel.org/all/20240520194942.GA1374705-robh@kernel.org/

Thanks,
Peng.

ARM SCMI v3.2 Table 24 Pin Configuration Type and Enumerations:
'192 -255 OEM specific units'.

i.MX95 System Manager FW supports SCMI PINCTRL protocol, but it has zero
functions, groups. So pinctrl-scmi.c could not be reused for i.MX95.
Because nxp,pin-func, nxp,pin-conf properties are rejected by dt
maintainers, so use 'fsl,pins' which requires a new driver
pinctrl-imx-scmi.c

The node will be as below:
pinctrl_usdhc1: usdhc1grp {
	fsl,pins = <
		IMX95_PAD_SD1_CLK__USDHC1_CLK				0x158e
		IMX95_PAD_SD1_CMD__USDHC1_CMD				0x138e
		IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
		IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
		IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
		IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
		IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
		IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
		IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
		IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
		IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
	>;
};

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (3):
      dt-bindings: firmware: arm,scmi: Add properties for i.MX95 Pinctrl OEM extensions
      pinctrl: scmi: add blocklist
      pinctrl: imx: support SCMI pinctrl protocol for i.MX95

 .../devicetree/bindings/firmware/arm,scmi.yaml     |   4 +-
 .../bindings/firmware/nxp,imx95-scmi-pinctrl.yaml  |  53 +++
 drivers/pinctrl/freescale/Kconfig                  |   9 +
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c       | 357 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-scmi.c                     |   9 +
 6 files changed, 432 insertions(+), 1 deletion(-)
---
base-commit: 632483ea8004edfadd035de36e1ab2c7c4f53158
change-id: 20240521-pinctrl-scmi-imx95-867bea9595cf

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


