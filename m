Return-Path: <linux-gpio+bounces-16007-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B74A35C86
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 12:28:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4836216D2FC
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 11:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A672627E5;
	Fri, 14 Feb 2025 11:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e8f3A+Xc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2066.outbound.protection.outlook.com [40.107.241.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C16E261595
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 11:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739532496; cv=fail; b=a10yfbd0mPd9awqkRM6XOZNJYDSAl4SSr/HtZtc3uqcKwNe2fHozabDFm5IXCBNKbBeTqIg1OgYL24Py/QcuaUsasSS0OoJEo8Ab7BVOI1Ks/TQKss+nY1h3sM+69y/x8HUqJ36OtelCHJdoXtHeWCwLG7SU3lk7yOnKg4a0tQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739532496; c=relaxed/simple;
	bh=fIg8IqD+JvWQ6NxlCNL4V9TMlMYueEPlkFLZbCn83FU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IGD/qgdKPAmveTQKtbBW85KpajLXgrL0g6/XVI+Bt6g00G77E5c4Mie2DVwVlv7qWfj+xxBrRpDpgeGogJnVDeO+LKUJ9LZlmPUVy6tEEvvJa0vKoaH5VY/NrB3sAueaA5VCpA39bRv5xRzH4O8rRia2Vy0KMkOFkpzVztakSnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e8f3A+Xc; arc=fail smtp.client-ip=40.107.241.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMMAehxQi9xE1z520CFzxpxAsbklR3kEqgBJkdw2rcTPfp8oTuKIWuIUOt5KioEWppCC2iyJwoYALkjImucjIxwKQWmRh9R1eHCpwu01oMUZHjiy4YEj6dHi8qKgz8tuSoL+ySeAmSrCGF+uZgQv78bmZ98jB99D4ynC/Z55OBIUZQ+orp1jM3UxdGRfmeXXifhF0847BZTsoT/b/dmYkM4y6b12K4LTGvMm31GkOkGVlqw/ob8ziNtDBW/5Ue0GuD006loKdbPoCjMRc3y8NZz0c23FjWxEM4pztvmuyOnslPACKlfkGaGU2C5tQU2PkirpiHoNDuQC+5nK7OYkJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIg8IqD+JvWQ6NxlCNL4V9TMlMYueEPlkFLZbCn83FU=;
 b=n/LDe4DYa7RDYEV+wcgJSWnIWQlrmU0zPBU5AVJWqwhOutNnPHSvYGWdVUAKIM4QLrx4svq7jxQKhdzPQr17kC4xJ+OXCQBJ7V2866Yiot3/H5bFEzmOYDyiewAelL3kdH1Nj3FKxCG395cI0w0WAlEaQT5aGiMuZZbanROH1VMMIbll/roG3A1vW7G2Zuun0yxHyiBcS15zNKM3CkbbTDxLkIEq8kRvzLMDiOPw5H1lwSl2DFnpLUPe2uY6cxFTTacdHfIzbIgp+gP/ENtv7B1IHoN++klT70UxsZLkZNsEaFZ5qC2gpUYRRSw9iGh2zirCgVadlPh27l2ws3GQQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIg8IqD+JvWQ6NxlCNL4V9TMlMYueEPlkFLZbCn83FU=;
 b=e8f3A+XciKdoM0SkZJIrJhW64KFaKPpky4pEOs5Fne9uHgj5eEgxyrRInp0n02XAIl1ziJ+e+m4wI7mvG75ScO4odHxUsRRGmzYEy7q6od3peA0B+NcpIeQpNLvMlZAaXYSQQKU5YOcIyjC+qVhnPmTs89P2To6gPLvKrwzodB+Qmh2MKQr3vr/wx5B3cB+gnsYi9r/0RGm4IxzuLS52JUKxJlAdjOaQJqrToRTR9OYE4fHY3a7zPFGjZHyAYpMaC2oR5qy0MTrwp2CdeBGt0UzQO+UqH7mDyd8ulq0qRmK2G7Kj6PWlOdwlRgotuZH1p6q27yMFGTfJWfH420pXGw==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PAXPR04MB8509.eurprd04.prod.outlook.com (2603:10a6:102:210::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 11:28:09 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%7]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 11:28:09 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>, Johan Korsnes
	<johan.korsnes@remarkable.no>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH 2/2] gpio: vg610: Switch to gpio-mmio
Thread-Topic: [PATCH 2/2] gpio: vg610: Switch to gpio-mmio
Thread-Index: AQHbfmxEu6yEUXH7FUmZu2oDrYxS67NGodwQ
Date: Fri, 14 Feb 2025 11:28:09 +0000
Message-ID:
 <DU0PR04MB94966159FEE966ED235509B090FE2@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20250214-vf610-mmio-v1-0-6cccd0292e84@linaro.org>
 <20250214-vf610-mmio-v1-2-6cccd0292e84@linaro.org>
In-Reply-To: <20250214-vf610-mmio-v1-2-6cccd0292e84@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|PAXPR04MB8509:EE_
x-ms-office365-filtering-correlation-id: 0791f1c2-59f9-4fce-00f9-08dd4ceaa8e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T1QzUkprY2hSSzF6SVNuWlF6blNsd3BZTWV2bXJXUzhhRm1YM2kzL2tkRXJL?=
 =?utf-8?B?MC9ET2Zud3ppVDFaOWFjaW12bkhJU3UxNm1KbzJZdGJ6OEpIaTFJdjBucGNP?=
 =?utf-8?B?ZVN1TGJLTWxFUkFLbTI5dU01dHFSWjVvd1U4K21CMnFLa2VIS0lDMUt1S0hI?=
 =?utf-8?B?K2syU1Bxb3l0cUlicDc1ZUZxRGM4cGh1cDhGK2ZzMVlSc0FZcXZNa2ZWMi9N?=
 =?utf-8?B?R2tkNGliOGkwL2FVMHpnc1hGR0pvVm94QllVaTJsekZXWUpJWU12S1RSYkNq?=
 =?utf-8?B?djF5TGJSOE1STWVvaVE4TDhnRlhiUnRXMlRIT0NKNUxxVnIrUXFza0FscmtM?=
 =?utf-8?B?Ly9HdFNueXdycDBLNTVOVXEvbXhCZzZyNmh1NkQzRXFPaFBXb1VXK1dsU3pq?=
 =?utf-8?B?R0NjeUNLWWtneGp2eEc3K3pXZnA4TjVINkFvd2VxYVFQc0hJQnI4azN4dk5B?=
 =?utf-8?B?SnN0aS9TU3ovT3dpZU45aXZoMTJpbjRvc2VScUVnaG9JNzljKzlHWTVwZXRo?=
 =?utf-8?B?UkZwV0VRK2pHN1k1bE10YTVQQ1RtZG5PaVc1TDFveXJyZkpJbFllR2xLNDV0?=
 =?utf-8?B?cWl2WXgxWkVkc3RtbU4xN2x2TTY2VVR2eFdKdE1nRmNVZWVEUGdSeTZXU20y?=
 =?utf-8?B?czRLSkFTYXk4bDEyQURMcnd5L1VVR3gzZEdnbURpcGJCY3hYUG9LM29HT05K?=
 =?utf-8?B?cnc5dEtvUWRJZUg3T1p1d0loMHpMVjljTXpNbzdmYTZHSUlkb2hmazcxUDU3?=
 =?utf-8?B?R2hXbzdjTjFTS052aDJGdUFOWWcyMW5ub3FIOU9jajZqMExCZmd0SXE1UlZi?=
 =?utf-8?B?NDlkV285QnFBUlY5RS8xSkdTSVllZTl6eSsxMHhVempwT3U5MjRvTm5XSks0?=
 =?utf-8?B?WlFSaFVqZmNLbnVVNzY3NzZoUVNRbFl3VEhERDJ0Q2RDSStaVkFiYzlEUWRZ?=
 =?utf-8?B?ejVqWG1SSjdOSTRxY1VqdnpwL3pSbmJKcVVHMlFpNUcyMTRJMDZGcUJQbFVI?=
 =?utf-8?B?OXhaMXNVbW5ibHdqZXRkdXhQQXlpV3d2L0xMWWlmbFdJNUZyMG9ONTdOb1Yy?=
 =?utf-8?B?aEExaGNEQzh4dXE0bjFZSFUzNkFCVTdLZ3NTWkp2TXZlVVFZVzR3Q2NkekNh?=
 =?utf-8?B?U1dNOTBSMlZNWHZ0eEREUGpxZ0VtWFdMdnZXTVQ1d1hYb0VMcm1NMDF5RDZo?=
 =?utf-8?B?UmsvVmhnWWdNZ3JRL2Q2eHJMTjE3OVpZR1NUOEF3Y0ZsSjAzT0dqRlQ1SGRv?=
 =?utf-8?B?UkZ2Y1gxaE03K2pvM0piQ2JNb2FmdlhFbUpheUFwYkNYMzlJTHlKczVWVFlN?=
 =?utf-8?B?TTRsL0pQSkwxV0R0N2MvNC95bllHR3VUKzRUbkd6YVZhMHdrSTdsUG9wVEx2?=
 =?utf-8?B?cWRPSmhzNldBTCt1eU8ya2FYOEhDa25RTDQ5TFp3b3hDNi9tR1FESXFwcnpw?=
 =?utf-8?B?bmpWRWdCQkh5c1NtQzF3RnhjUnVqWVFNTFY5UG93d1NvQzZyZXgzdXhEek1C?=
 =?utf-8?B?d1llMXlBanFUYncrWkdIdjdpT2dhbmQxSTE2b0cxMHZxaW14cUNHQ1laUFZs?=
 =?utf-8?B?bzhSQmluV05udDZFQ3hCOEMwL0w4YVZQWnMwUXJyWlF0ZWdrZUd2N2R2ZGk0?=
 =?utf-8?B?NVpEdWdKZ1g5eFBrQ1dJdUcrcGt3b0VJR3JWRlNTYzdGT1FaZVNJV043Wm04?=
 =?utf-8?B?dHdaYzUzZk1RcUZVUjVneGZqeGcwd1RiSlJFYnNmbnZTTkZLRHA4b3ozSytD?=
 =?utf-8?B?aWRoOG80dlBQQklyUnNSM0w2dHVLcW5XZkVnS3ZhLzJQVVFyMEF0OERUZUQ3?=
 =?utf-8?B?Zlk2Y21Gcm4zTHhkV0dwajlVR1ppc3ZmK1Vpa1lNTDlqYUxnOG10b1ZCUHcx?=
 =?utf-8?B?eHBmalQzNUI0eUpBRmppaUxjZU9YSUcxcjBvSlN2bHRhNERoZTZacTlkOVA5?=
 =?utf-8?Q?mvhxyR/y+reUAY4fI0PROoKftSYg50qP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmdJWFVsUkRRNUgzSndybU1Kdit3NWZhR01aRkNoTW1lN3JMeTRsOHFQcFVq?=
 =?utf-8?B?Z2Zjcnc3K1ZuVlVYd1g5UW1JcklsZWZSSDVIS05ya2ZOUHFTOWQ0YmpDK1Zy?=
 =?utf-8?B?SFN4NkJlZytpTm9WTTN3QzY3MndjeG11TTFZdkVwR1hBb0MwVDVEWnpsSUI5?=
 =?utf-8?B?TkE3QTd1Z3Era08rREZTaU1qdVo3MjBsQVBXUHo5OU84clFQV1k3cEhybGhX?=
 =?utf-8?B?Q2xPUnVuYWY0eGoyakFSeWxCc0xIby9XL05NVVNBWjZMazRUYnAzb3hibktX?=
 =?utf-8?B?R0VJV3dRM1lzMzhZVjgrWjB3cGRSQUZkczhyWEplNHMzRVJiazMwYjUxU2ZC?=
 =?utf-8?B?MzI0MmlJY2ltUU9UeGE3S2VQZWcvVi8xSlJWRVN2b1BWOVU3NmxDdnozUzIz?=
 =?utf-8?B?TXBUQ0Z4dGhpWFhRMkg3WDk0VSs0dWZXSWdqMUpwaXh1WHRsU1V2dEhOVnl6?=
 =?utf-8?B?RU50dmFzV0JEa25oSzA5RytIRE5Cdm01TGh6U21UeVRHNldoNm5weklEMHBU?=
 =?utf-8?B?SUZ4ZnRCTk9kNnpDRjJZcWdKOFdIQW9oeHpDKzlCOFVOVjFPbUhWSllreCtj?=
 =?utf-8?B?NjVRY1BLMHNYK1lWSHRpMFBwUTlSQ2dxZjh4YkFHMG1DTU44TkF5OGpqV0tN?=
 =?utf-8?B?RkJ5QStUaU1JaHh6WUlRNStQcjNicmgwVUZWMFB5ZEh5Z2xLV1BqVE1rVnNt?=
 =?utf-8?B?VkZjOXo5VzFrblVqSUZHRS9xQmlUM1VOOUpocDRiUDNVdXdrTlRmNERCN1ZC?=
 =?utf-8?B?RmFHdXV6UnNicjNKZUlOVjlpSVI4bzU4TzVHMVA1VjNqN1ZwenRuVnhOdDQ0?=
 =?utf-8?B?VzdmbWduWXdnekxEWlRscW0vUnptQkIyK1Bnd2xmM0ViQXRLMW5jTmFqK3Zi?=
 =?utf-8?B?WlR0TWpITi9SeWZ3VXdTSy85Vjd2Vndvb0xaeER1dVR2RXNNNWhpbk1lMlFW?=
 =?utf-8?B?SEdYVXVybkswdmh0UjlRQjU2eUtlUFpZOEFnRzZjeDk0MXR0clFuQks1YWsx?=
 =?utf-8?B?S2JpdktPQ1cvRTU5MjJ0QTdtbmVleU04cW84MXEwNDEybE4yVjFlSlpwaXVK?=
 =?utf-8?B?SHZ6T1JWUVZJQzhrS05sNFBFYzM3RzM3T2IwM3luQ3FCTjFxNEtkaUE1VmdE?=
 =?utf-8?B?dUJhN3I1YkY1eGdkbnJmZFNlcmN5eFhRYnpBTHpuUjU1WE12T09SRi9jRU1S?=
 =?utf-8?B?ZjFEU1NvSUVmNEtSZGdPZytoTm80QTJkRE4rcmEvN0N3QVM2ZXRqMGx5azR3?=
 =?utf-8?B?cTdIWUJOclBDaitSZENsd1FEL0dMazNwQW80T1lMS2xFZUU3SmY3cUNQRHU2?=
 =?utf-8?B?U0U2Y1FFVzJkWHV3WjZHTEVLVW1DVXIwOWFKcm9oSU1lSUpjM3UvRlRoM0Rz?=
 =?utf-8?B?VkZIWjIvY3Y4VVhVMHVCVk1BbklWUndRa0FMMzdPekZjU05CMVc5QjBOem1P?=
 =?utf-8?B?ZElJNDUzTi9BbkcwakdBZVV4WXZXTjloL1phOUtYTEwzdzN1dlZ2QmZVQ0Jj?=
 =?utf-8?B?TmdFZ2o4Qk1SYmlVTzVBVCtuWWxiUkRSZk1WZndHQ1FOU3BqMUx6WUVTZWxS?=
 =?utf-8?B?bkhzZU1HRnE3V2J2N3p1dzZuSVFiYk9iRXBjY1hGQ0FhQWhLRjlXdkoxMDlG?=
 =?utf-8?B?aDY4bk9NMDJoZ2pFb3dJalB1dXZmRlpEV3NKd2l5aE1uUDdjaXBnbjVnTWVZ?=
 =?utf-8?B?Zy9ESFRPcms3alNSU3hEWFh4Vzg4MU1zQ09oM2RKdVhYd2NtdGIyVzdIY1VT?=
 =?utf-8?B?SjY4cWN3YkJMZE5udXc4eEtkSHZiVFhEOFVGWGZyZXhOYzBwd3ZETWdRK0JZ?=
 =?utf-8?B?WWRXUVlIZXlWUlgxdFFjOG1NcUpnMEpsNGp0QkF4UnBLV3I0WnZtaDRjWFd5?=
 =?utf-8?B?T3RuVWp6OWhMbWpRRWFlZXJOWUpaNFlrNWV3UVk0S2ZBbzZnNE5wOTRzSmlP?=
 =?utf-8?B?cy9LSlhJRGRMQzd4dkkxOWNvamRMblo0cXZ3NjZiSE9oeUNmVTNLUXVHclU5?=
 =?utf-8?B?VzN6QkYrSUF1bXJ6M0t1VG1OTkluYldoM0pEdFRwWG9nT1J5aCtyeDBIRVpa?=
 =?utf-8?B?YnpHQmJGZVlORll6YUprUHgzWnp2bHJTMElkMTFPd2lZa0JGZGJTQ2F4TkVk?=
 =?utf-8?Q?Ps/N9fBdASlyI08FHZKDlNqYz?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0791f1c2-59f9-4fce-00f9-08dd4ceaa8e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 11:28:09.5792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UK5wuFtiyEUPNuKHpQ58AM+eQHJJPKZI0/g+SCHftpgqZn46LtxU2MGZJW+ZbgOI6D8h1mlz4pOynIabMgZh9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8509

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+IFNlbnQ6IDIwMjXlubQy5pyIMTTml6UgNzowOQ0KPiBU
bzogSm9oYW4gS29yc25lcyA8am9oYW4ua29yc25lc0ByZW1hcmthYmxlLm5vPjsgQm91Z2ggQ2hl
bg0KPiA8aGFpYm8uY2hlbkBueHAuY29tPjsgQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rl
di5wbD4NCj4gQ2M6IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+IFN1YmplY3Q6IFtQQVRDSCAyLzJdIGdwaW86IHZn
NjEwOiBTd2l0Y2ggdG8gZ3Bpby1tbWlvDQo+IA0KPiBBZnRlciBhZGRpbmcgYSBwaW5jdHJsIGZs
YWcgdG8gZ3Bpby1tbWlvIHdlIGNhbiB1c2UgaXQgZm9yIGRyaXZpbmcgZ3Bpby12ZjYxMC4NCj4g
DQo+IFRoZSBleGlzdGluZyBjb2RlIGhhcyB0aGUgc2FtZSBzZW1hbnRpY3MgYW5kIHRoZSBnZW5l
cmljIGdwaW8tbW1pbywgaW5jbHVkaW5nDQo+IHJlYWRpbmcgZnJvbSB0aGUgZGF0YSBvdXQgcmVn
aXN0ZXIgd2hlbiB0aGUgZGlyZWN0aW9uIGlzIHNldCB0byBpbnB1dCwgYW5kIGl0IGNhbg0KPiBh
bHNvIGhhbmRsZSB0aGUgYWJzZW5jZSBvZiB0aGUgZGlyZWN0aW9uIHJlZ2lzdGVyIGJldHRlciB0
aGFuIHRoZSBjdXJyZW50IGRyaXZlcjoNCj4gd2UgZ2V0IHRoZSBkaXJlY3Rpb24gZnJvbSB0aGUg
c2hhZG93IGRpcmVjdGlvbiByZWdpc3RlcnMgaW4gZ3Bpby1tbWlvIGluc3RlYWQuDQo+IA0KDQpI
aSBMaW51cywNCg0KSSBkaWQgYSBxdWljayB0ZXN0IGZvciB0aGVzZSB0d28gcGF0Y2hlcywgbWVl
dCBzb21lIGlzc3VlLg0KDQpPbmUgcGluIG9uIGJvYXJkIGlzIHVzZWQgYXMgU0QgY2FyZCBkZXRl
Y3QsIG5vIG1hdHRlciBJIGluc2VydCB0aGUgY2FyZCBvciBub3QsIGdwaW9nZXQgdG9vbCBhbHdh
eXMgZ2V0IGluYWN0aXZlIHN0YXRlLCB0aGlzIHdyb25nLiBTZWVtcyBkcml2ZXIgY2FuJ3QgZ2V0
IGNvcnJlY3QgaW5wdXQgZGF0YS4NCg0KSSBjaGVjayB0aGUgY29kZSwgc2VlbXMgdmY2MTAgaGFz
IGFub3RoZXIgbGltaXRhdGlvbiwgcmVmZXIgdG8gdGhlIG9yaWdpbmFsIGNvZGUgbG9naWMgaW4g
dmY2MTBfZ3Bpb19nZXQoKToNCklmIHRoZSBncGlvIGlzIGNvbmZpZyBhcyBpbnB1dCwgbmVlZCB0
byByZWFkIEdQSU9fUERJUiB0byBnZXQgdGhlIGlucHV0IGRhdGEsIGlmIGdwaW8gaXMgY29uZmln
IGF0IG91dHB1dCwgbmVlZCB0byByZWFkIEdQSU9fUERPUi4NCg0KQnV0IGZvciBiZ3Bpb19pbml0
LCB3ZSBmaXggR1BJT19QRE9SIHRvIHZvaWQgX19pb21lbSAqZGF0DQoNClJlZ2FyZHMNCkhhaWJv
IENoZW4NCg0KIA0KPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlq
QGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncGlvL0tjb25maWcgICAgICB8ICAgMSAr
DQo+ICBkcml2ZXJzL2dwaW8vZ3Bpby12ZjYxMC5jIHwgMTAwICsrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgOTEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlv
L0tjb25maWcgYi9kcml2ZXJzL2dwaW8vS2NvbmZpZyBpbmRleA0KPiBhZGQ1YWQyOWE2NzNjMDkw
ODJhOTEzY2IyNDA0MDczYjIwMzRhZjQ4Li5hYjEwNGNlODVlZTZjZWYxNTQ5ZDMxNzQNCj4gNDYy
NWJjYzYyNWQ3NTE3OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncGlvL0tjb25maWcNCj4gKysr
IGIvZHJpdmVycy9ncGlvL0tjb25maWcNCj4gQEAgLTc1Niw2ICs3NTYsNyBAQCBjb25maWcgR1BJ
T19WRjYxMA0KPiAgCWRlZmF1bHQgeSBpZiBTT0NfVkY2MTANCj4gIAlkZXBlbmRzIG9uIEFSQ0hf
TVhDIHx8IENPTVBJTEVfVEVTVA0KPiAgCXNlbGVjdCBHUElPTElCX0lSUUNISVANCj4gKwlzZWxl
Y3QgR1BJT19HRU5FUklDDQo+ICAJaGVscA0KPiAgCSAgU2F5IHllcyBoZXJlIHRvIHN1cHBvcnQg
aS5NWCBvciBWeWJyaWQgdmY2MTAgR1BJT3MuDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cGlvL2dwaW8tdmY2MTAuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXZmNjEwLmMgaW5kZXgNCj4gMzUy
NzQ4N2Q0MmM4YWMzZWYzOWMzYmU0NjhkZDUxNzdjODVmNmI0NC4uODU4Y2VkMTdhZTVlNWYyNzI2
Y2NiODUyMg0KPiBjZDNlNGI2YTUwNDFkOTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3Bpby9n
cGlvLXZmNjEwLmMNCj4gKysrIGIvZHJpdmVycy9ncGlvL2dwaW8tdmY2MTAuYw0KPiBAQCAtOTQs
ODIgKzk0LDYgQEAgc3RhdGljIGlubGluZSB1MzIgdmY2MTBfZ3Bpb19yZWFkbCh2b2lkIF9faW9t
ZW0gKnJlZykNCj4gIAlyZXR1cm4gcmVhZGxfcmVsYXhlZChyZWcpOw0KPiAgfQ0KPiANCj4gLXN0
YXRpYyBpbnQgdmY2MTBfZ3Bpb19nZXQoc3RydWN0IGdwaW9fY2hpcCAqZ2MsIHVuc2lnbmVkIGlu
dCBncGlvKSAtew0KPiAtCXN0cnVjdCB2ZjYxMF9ncGlvX3BvcnQgKnBvcnQgPSBncGlvY2hpcF9n
ZXRfZGF0YShnYyk7DQo+IC0JdTMyIG1hc2sgPSBCSVQoZ3Bpbyk7DQo+IC0JdW5zaWduZWQgbG9u
ZyBvZmZzZXQgPSBHUElPX1BESVI7DQo+IC0NCj4gLQlpZiAocG9ydC0+c2RhdGEtPmhhdmVfcGFk
ZHIpIHsNCj4gLQkJbWFzayAmPSB2ZjYxMF9ncGlvX3JlYWRsKHBvcnQtPmdwaW9fYmFzZSArIEdQ
SU9fUEREUik7DQo+IC0JCWlmIChtYXNrKQ0KPiAtCQkJb2Zmc2V0ID0gR1BJT19QRE9SOw0KPiAt
CX0NCj4gLQ0KPiAtCXJldHVybiAhISh2ZjYxMF9ncGlvX3JlYWRsKHBvcnQtPmdwaW9fYmFzZSAr
IG9mZnNldCkgJiBCSVQoZ3BpbykpOw0KPiAtfQ0KPiAtDQo+IC1zdGF0aWMgdm9pZCB2ZjYxMF9n
cGlvX3NldChzdHJ1Y3QgZ3Bpb19jaGlwICpnYywgdW5zaWduZWQgaW50IGdwaW8sIGludCB2YWwp
IC17DQo+IC0Jc3RydWN0IHZmNjEwX2dwaW9fcG9ydCAqcG9ydCA9IGdwaW9jaGlwX2dldF9kYXRh
KGdjKTsNCj4gLQl1MzIgbWFzayA9IEJJVChncGlvKTsNCj4gLQl1bnNpZ25lZCBsb25nIG9mZnNl
dCA9IHZhbCA/IEdQSU9fUFNPUiA6IEdQSU9fUENPUjsNCj4gLQ0KPiAtCXZmNjEwX2dwaW9fd3Jp
dGVsKG1hc2ssIHBvcnQtPmdwaW9fYmFzZSArIG9mZnNldCk7DQo+IC19DQo+IC0NCj4gLXN0YXRp
YyBpbnQgdmY2MTBfZ3Bpb19kaXJlY3Rpb25faW5wdXQoc3RydWN0IGdwaW9fY2hpcCAqY2hpcCwg
dW5zaWduZWQgaW50IGdwaW8pDQo+IC17DQo+IC0Jc3RydWN0IHZmNjEwX2dwaW9fcG9ydCAqcG9y
dCA9IGdwaW9jaGlwX2dldF9kYXRhKGNoaXApOw0KPiAtCXUzMiBtYXNrID0gQklUKGdwaW8pOw0K
PiAtCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+IC0JdTMyIHZhbDsNCj4gLQ0KPiAtCWlmIChwb3J0
LT5zZGF0YS0+aGF2ZV9wYWRkcikgew0KPiAtCQlzcGluX2xvY2tfaXJxc2F2ZSgmcG9ydC0+bG9j
aywgZmxhZ3MpOw0KPiAtCQl2YWwgPSB2ZjYxMF9ncGlvX3JlYWRsKHBvcnQtPmdwaW9fYmFzZSAr
IEdQSU9fUEREUik7DQo+IC0JCXZhbCAmPSB+bWFzazsNCj4gLQkJdmY2MTBfZ3Bpb193cml0ZWwo
dmFsLCBwb3J0LT5ncGlvX2Jhc2UgKyBHUElPX1BERFIpOw0KPiAtCQlzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZwb3J0LT5sb2NrLCBmbGFncyk7DQo+IC0JfQ0KPiAtDQo+IC0JcmV0dXJuIHBpbmN0
cmxfZ3Bpb19kaXJlY3Rpb25faW5wdXQoY2hpcCwgZ3Bpbyk7DQo+IC19DQo+IC0NCj4gLXN0YXRp
YyBpbnQgdmY2MTBfZ3Bpb19kaXJlY3Rpb25fb3V0cHV0KHN0cnVjdCBncGlvX2NoaXAgKmNoaXAs
IHVuc2lnbmVkIGludA0KPiBncGlvLA0KPiAtCQkJCSAgICAgICBpbnQgdmFsdWUpDQo+IC17DQo+
IC0Jc3RydWN0IHZmNjEwX2dwaW9fcG9ydCAqcG9ydCA9IGdwaW9jaGlwX2dldF9kYXRhKGNoaXAp
Ow0KPiAtCXUzMiBtYXNrID0gQklUKGdwaW8pOw0KPiAtCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+
IC0JdTMyIHZhbDsNCj4gLQ0KPiAtCXZmNjEwX2dwaW9fc2V0KGNoaXAsIGdwaW8sIHZhbHVlKTsN
Cj4gLQ0KPiAtCWlmIChwb3J0LT5zZGF0YS0+aGF2ZV9wYWRkcikgew0KPiAtCQlzcGluX2xvY2tf
aXJxc2F2ZSgmcG9ydC0+bG9jaywgZmxhZ3MpOw0KPiAtCQl2YWwgPSB2ZjYxMF9ncGlvX3JlYWRs
KHBvcnQtPmdwaW9fYmFzZSArIEdQSU9fUEREUik7DQo+IC0JCXZhbCB8PSBtYXNrOw0KPiAtCQl2
ZjYxMF9ncGlvX3dyaXRlbCh2YWwsIHBvcnQtPmdwaW9fYmFzZSArIEdQSU9fUEREUik7DQo+IC0J
CXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnBvcnQtPmxvY2ssIGZsYWdzKTsNCj4gLQl9DQo+IC0N
Cj4gLQlyZXR1cm4gcGluY3RybF9ncGlvX2RpcmVjdGlvbl9vdXRwdXQoY2hpcCwgZ3Bpbyk7DQo+
IC19DQo+IC0NCj4gLXN0YXRpYyBpbnQgdmY2MTBfZ3Bpb19nZXRfZGlyZWN0aW9uKHN0cnVjdCBn
cGlvX2NoaXAgKmdjLCB1bnNpZ25lZCBpbnQgZ3BpbykgLXsNCj4gLQlzdHJ1Y3QgdmY2MTBfZ3Bp
b19wb3J0ICpwb3J0ID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoZ2MpOw0KPiAtCXUzMiBtYXNrID0gQklU
KGdwaW8pOw0KPiAtDQo+IC0JbWFzayAmPSB2ZjYxMF9ncGlvX3JlYWRsKHBvcnQtPmdwaW9fYmFz
ZSArIEdQSU9fUEREUik7DQo+IC0NCj4gLQlpZiAobWFzaykNCj4gLQkJcmV0dXJuIEdQSU9fTElO
RV9ESVJFQ1RJT05fT1VUOw0KPiAtDQo+IC0JcmV0dXJuIEdQSU9fTElORV9ESVJFQ1RJT05fSU47
DQo+IC19DQo+IC0NCj4gIHN0YXRpYyB2b2lkIHZmNjEwX2dwaW9faXJxX2hhbmRsZXIoc3RydWN0
IGlycV9kZXNjICpkZXNjKSAgew0KPiAgCXN0cnVjdCB2ZjYxMF9ncGlvX3BvcnQgKnBvcnQgPQ0K
PiBAQCAtMzcxLDI0ICsyOTUsMTggQEAgc3RhdGljIGludCB2ZjYxMF9ncGlvX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ICAJfQ0KPiANCj4gIAlnYyA9ICZwb3J0LT5n
YzsNCj4gLQlnYy0+cGFyZW50ID0gZGV2Ow0KPiArCXJldCA9IGJncGlvX2luaXQoZ2MsIGRldiwg
NCwNCj4gKwkJCSBwb3J0LT5iYXNlICsgR1BJT19QRE9SLA0KPiArCQkJIHBvcnQtPmJhc2UgKyBH
UElPX1BDT1IsDQo+ICsJCQkgTlVMTCwNCj4gKwkJCSBwb3J0LT5zZGF0YS0+aGF2ZV9wYWRkciA/
IHBvcnQtPmJhc2UgKyBHUElPX1BERFIgOiBOVUxMLA0KPiArCQkJIE5VTEwsDQo+ICsJCQkgQkdQ
SU9GX1BJTkNUUkxfQkFDS0VORCk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIGRldl9lcnJf
cHJvYmUoZGV2LCByZXQsICJ1bmFibGUgdG8gaW5pdCBnZW5lcmljIEdQSU9cbiIpOw0KPiAgCWdj
LT5sYWJlbCA9IGRldl9uYW1lKGRldik7DQo+IC0JZ2MtPm5ncGlvID0gVkY2MTBfR1BJT19QRVJf
UE9SVDsNCj4gIAlnYy0+YmFzZSA9IC0xOw0KPiANCj4gLQlnYy0+cmVxdWVzdCA9IGdwaW9jaGlw
X2dlbmVyaWNfcmVxdWVzdDsNCj4gLQlnYy0+ZnJlZSA9IGdwaW9jaGlwX2dlbmVyaWNfZnJlZTsN
Cj4gLQlnYy0+ZGlyZWN0aW9uX2lucHV0ID0gdmY2MTBfZ3Bpb19kaXJlY3Rpb25faW5wdXQ7DQo+
IC0JZ2MtPmdldCA9IHZmNjEwX2dwaW9fZ2V0Ow0KPiAtCWdjLT5kaXJlY3Rpb25fb3V0cHV0ID0g
dmY2MTBfZ3Bpb19kaXJlY3Rpb25fb3V0cHV0Ow0KPiAtCWdjLT5zZXQgPSB2ZjYxMF9ncGlvX3Nl
dDsNCj4gLQkvKg0KPiAtCSAqIG9ubHkgSVAgaGFzIFBvcnQgRGF0YSBEaXJlY3Rpb24gUmVnaXN0
ZXIoUEREUikgY2FuDQo+IC0JICogc3VwcG9ydCBnZXQgZGlyZWN0aW9uDQo+IC0JICovDQo+IC0J
aWYgKHBvcnQtPnNkYXRhLT5oYXZlX3BhZGRyKQ0KPiAtCQlnYy0+Z2V0X2RpcmVjdGlvbiA9IHZm
NjEwX2dwaW9fZ2V0X2RpcmVjdGlvbjsNCj4gLQ0KPiAgCS8qIE1hc2sgYWxsIEdQSU8gaW50ZXJy
dXB0cyAqLw0KPiAgCWZvciAoaSA9IDA7IGkgPCBnYy0+bmdwaW87IGkrKykNCj4gIAkJdmY2MTBf
Z3Bpb193cml0ZWwoMCwgcG9ydC0+YmFzZSArIFBPUlRfUENSKGkpKTsNCj4gDQo+IC0tDQo+IDIu
NDguMQ0KDQo=

