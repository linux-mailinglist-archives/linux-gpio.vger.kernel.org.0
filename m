Return-Path: <linux-gpio+bounces-27774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 550BFC18300
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 04:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49B3D19C861A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 03:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B76C2C159D;
	Wed, 29 Oct 2025 03:35:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022103.outbound.protection.outlook.com [40.107.75.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333484502F;
	Wed, 29 Oct 2025 03:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761708956; cv=fail; b=OBKUD6+V38Gqj+nm0RxWcpV6QwIAZlPCVkiqz/N9UCmcE4t0gg4rl118QkfOTEhoq8dCi/gNwXv9oBefPqEVwa7vNAuXfa5UVibLh35h3qR5q9IquKxxFYgXaiDP6tXE46gze/aasnLWLTqDul5P5u0tDrnpr8NhVhNhVjuUMmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761708956; c=relaxed/simple;
	bh=nDd3Zx8rw1AFozwtlUdQwG2XxwRAxkAn6S9bkBcDz08=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B3JZbkUhrl5z/+JYg4dsaj1owZwoswah1H/g0xEMfO6SsQ3+jjC9CDyFBJKSf+t6atPYDNIAQJmiRsOa8ZfklAtxxQJ4tOGsedL+3e7qZBoW6T4iZDMmOGsYKTZF1CNBlRgcFctA/Xqge13mGhtPIV5sI1NgVMK7/0VdMs4H+I8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWZuSGBFMV+3vg8ZSGm+hKMtA/Baslc3KyupJyAosT17/Uyko1ivoPgXRJviOXEFYBIS5wIYBssjClPVZMf4YE2+o7OfDLDZWQLmtcvX4X0Cde/s52S9w8F0RGbUTrDISMPOmQGGAUnYqsoxKQgLLi9RmL2FgRrf1/m5AgJ0MannhrTMAaRF6iRH2BdCkcRwLTnywS+lw6oEL0bW4SWzxblX8RRJth8b3czEJcc8ZXq52mfMJR37j3fXnNSPC5PxUPB3PtO2HotbHY6Xx8G5rrmpSQ6md/vCF3JPF2OSZQDteEQgDlmC+G40PfyTci6nRmcWxm/5hSFDwtzkwJdEJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDd3Zx8rw1AFozwtlUdQwG2XxwRAxkAn6S9bkBcDz08=;
 b=ev2qEQHEjF8/a7sQSBL08UMJro3fIx0WSDOCfeNLCHrEWErObYsbGnc/ELWjL0gs3Zh7j7dZjyu38bJ9elKN1JeGvHHWs1aQjsFvwGwtIMWe4PIaB7na93RCzhvF5vh1Y9j5sWzmdlkqv5PcaPqrTxdyC9oYa92ngr/VLxMEy3QyIghGkIqqRu+jC74WnbDLFy+eWIZAO47QAWF7g2fEG9HI9j8TimP0Y+DGI1FTy39lqhDZBPqYcXzpGwX3swQwOKVwvXmvXCO0SddRlVJzRKOOXIt1PAtrw9F1c9HCh+7TZZoa0lV0vEnwm6yyto4M+o+/27IIKbvH2BTx4mFARA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by TYQPR06MB8201.apcprd06.prod.outlook.com (2603:1096:405:373::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 03:35:49 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 03:35:48 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "sfr@canb.auug.org.au"
	<sfr@canb.auug.org.au>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIFBpbmN0cmw6IGNvcmU6IGV4cG9ydCBwaW5jdHJs?=
 =?utf-8?B?X3Byb3ZpZGVfZHVtbWllcygpIHRvIGZpeCBidWlsZCBlcnJvcg==?=
Thread-Topic: [PATCH] Pinctrl: core: export pinctrl_provide_dummies() to fix
 build error
Thread-Index: AQHcR9IHaZ867jmm0U6XcNpmbKn/iLTXUJmAgAEdr/A=
Date: Wed, 29 Oct 2025 03:35:48 +0000
Message-ID:
 <PUZPR06MB5887C2D161EA5CB13A41462EEFFAA@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20251028061345.3885632-1-gary.yang@cixtech.com>
 <CACRpkdYdQa4=4JvBWJcRv0X_A0PnkQpZQQ8NTPzF0ntdt9qX=A@mail.gmail.com>
In-Reply-To:
 <CACRpkdYdQa4=4JvBWJcRv0X_A0PnkQpZQQ8NTPzF0ntdt9qX=A@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|TYQPR06MB8201:EE_
x-ms-office365-filtering-correlation-id: 6e4d4dca-9c11-47fc-3762-08de169c406f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Mk9zZVZ4S3FnaUNWQWVFS2piVElTV204ZDhZWW0xY3NpVUhTSnEvWnNmemFQ?=
 =?utf-8?B?QnJIRlBlcG5ObTkzREVnbnFDcVBIdktQSm5PTllkTHgxMkZsQnY5TXJXN0ha?=
 =?utf-8?B?WUxUUGZWbkFrNXJmcmhRcEJqbkwrYmJ3U1BPZmVsSmtGNkIwZFFrQ3dZR005?=
 =?utf-8?B?K04xMlZTYzAzejlyYkdqMmFkRzhlYU9ndFBKZ0J0S1E3aS9iUFlXS3JDdm80?=
 =?utf-8?B?T1RjWVI3MXFYS3pQWDR3VXhSeVBjSlJjTUJvY2xPcmpJdUpIUGI0dGVWZkxC?=
 =?utf-8?B?QXV4YWZoUFZVbkord1FyZzArNWVsQ2Q0NWlEU3VrQnY5aGt1NnN6UmdwcHJF?=
 =?utf-8?B?OUFJRDdVYUxqNy9QR0FLR0N6Z290NExaUHNYK2ZvZ3FPMXZjaXpZN1RBQXZt?=
 =?utf-8?B?cU1LY2pJMzE3THFYdEh0L2VPRHQ1WDdsRUh6TFVXR0txWTdqNVFydWJabGha?=
 =?utf-8?B?VmJ5SmpNREZGZmdiOTg1WHF2N2kzRElsVDc4OUZEQWNmcklwVitkQ2RaSGtE?=
 =?utf-8?B?a0lPTm1vZFhubDJJSW5HWEVvbDBGWXAzMDVxRjYra3l2ZytkSnMxM284V0lv?=
 =?utf-8?B?SWorNEJmQWhKRkFvZjdOOTVTYUhrYVIzMnZWRkhCWS83Z3k4RS9KU1A4QWRN?=
 =?utf-8?B?L3BtOWpCOEVnQjNORjVyY01lYTNSN29QRDRqckNiT2M4bEhaalBETWJjRHFL?=
 =?utf-8?B?V3M2N1lYcHlzY3l0RCthM0pNUW5Ia3NFQUVZT0pmTGd3NmhJOEh3UVFyKzVl?=
 =?utf-8?B?Q2pJeXpVWklqTTE2aSs5eEZPTWFLZmxHQTBhWEtHY1NNZVgwZXZaMk00QTAv?=
 =?utf-8?B?YjNDdjdKaU50K3gxMUV5YzVXOU83MnZaaFY4QlNBc3VwbG9JMmZhdjY0NDFk?=
 =?utf-8?B?TFJPUzAxblYrUkc4M2VMell6RXorV3V3dnhSa090bjVscEJmdUJicUNBVGs5?=
 =?utf-8?B?MUZPWlo3WDdMUVp0cHVIeE9mNjB2NWRHMDhWcVQ4cEFzdEVvOG9EZnhzMUt3?=
 =?utf-8?B?dWYrZXBCSndGbEFIY205TlNVcjlyYVYxakF2VmRkdW1IM2VXQXhRYWphV0VK?=
 =?utf-8?B?MGk5SFB4a2JJL1VKdDZzS1F2S3lINFR4WmRFTmsrRmlPZ1VjN2RJUktaVVhG?=
 =?utf-8?B?M0YwcGRseDVLUDR4eXI1N1ZxQk5jWjRsUmprTVNtTVE5OUo2RExhZ2pvd0VU?=
 =?utf-8?B?MkN4ZThDVmFHeDNFdjJCK0QrZ1h1c2VZVXZUNG9JT2xFOWNzb3VOV0xQeSti?=
 =?utf-8?B?dkpoVHZ4VVFMMi9EVVBQVERMTStDV3l4Q2dsenZIYUZmUHh0Ynh1OG5xdDg0?=
 =?utf-8?B?ZTA2dnVGM2ZDK3hucXhSZm5hVGV1RzhiVlV2NWE3aVRISDFYUXRaSVpEeWh4?=
 =?utf-8?B?LzZCcHhTZFp3dnRiWkx1MTk0RzRMdVhWWDVmdGg0TWNsYjZUZm04QnY3a2VC?=
 =?utf-8?B?VjNLaCt3NU5TK2JabHIzeFNoQVdRd1podVJMSFZxbHlBeXRkYnVYaThVRmFl?=
 =?utf-8?B?WWtZZG9vT1JucjBBM0JsMThsNFBiSXZZdStDOFZnSjIzVFBiL2dZTzF1RGJT?=
 =?utf-8?B?Nm92YzZpcHE5Y1FybktQaXJXQ2cxSGcwM1hIMWkwWi8rbFVBYXlPOU9Zdyta?=
 =?utf-8?B?cFdQRzloLzZMYytUbkVUTVZ2L3NmdnQ5NTROb0U3R0Rod3RIN1c0WVc3ak05?=
 =?utf-8?B?TXI1UnJQeHB2dlZuZlpJVXlWd0tacW9pcTJzNHBMTFVFb3JIaEtqRGpyZnpU?=
 =?utf-8?B?LzI2Z1cxZkdVclVwRE94MjhVdHd4NENrTjc2UzVJTUFBaE9uUGdtU2UzUFhw?=
 =?utf-8?B?K1d2T2pPUXA5aGxwM01mM242cUs1QWRLN1ovUVRET3hxdFc2KzZvbHNLMmR3?=
 =?utf-8?B?QU1EdVZGSUx0T0tKS0h5MTNEU3hWbUY2SmtsN0kwNDhjTTlMQzFJbUdFbjVj?=
 =?utf-8?B?YXVzSU9rOTdib1VqUlV2UjM1RGNJK05oWTgyb3E4VkhCOElDSFJTOGdkbHIw?=
 =?utf-8?B?Zzdaam1LL2tSOXJZSlpGak1sRFA3M1FmVERMdTdySWduaWdvMTR2OGxuL2pO?=
 =?utf-8?Q?4lnhhE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TzY0MzlqTHhTUUVMNkRkZDBzYUgyOFhic2ZSaEJ4YkNnU0p4OGQrL1M1OSt4?=
 =?utf-8?B?ZGtkUzdwdS83ait2c3h2bnBucXJnckdLMDlmOGhHWlFnNWx0SUxiSzVabm5u?=
 =?utf-8?B?dy9hckNTc0FvWTFTcVViSUdYLzdqem1ObFhlMytPNGsrdW0zYXBTMFNmb1Jv?=
 =?utf-8?B?SXNSRFpJcWEyNll4T2FNR04rWENXa2paYjVKaEd6MlZyVEJQU1hhU0lsSnk0?=
 =?utf-8?B?bjFhT2N1a0c5L3U5RUxFWGJ5UHpKUC9QcXU2bTd1OEw5Y3N4MnR5N09OTkVN?=
 =?utf-8?B?elJ3TGY1bGFjUFdYME83NGU1b0llN3hyUVlCOHFiYkVVc091SURVLzh5bU9Q?=
 =?utf-8?B?dGNzZ05SSTROZHpwY2g4dm9EczBBU21CUVBsNERzMEV6WmxNaHUwckFqOFlZ?=
 =?utf-8?B?Q2lEQVh6RU5CWlc0YWE0ZDlYR0w2Rk9pekFaNW1WWVdkZmpacXR6aDhHaFNE?=
 =?utf-8?B?ZU1sSXdvZ29RV1ZHbTRHR0U5cHhwaE1taG9NVUIvNmpEb0VtdDVjYVpYVm4w?=
 =?utf-8?B?TE1yQUloOGwrdFpyZUsxNDQxOTV6QlZjWjZRMi9MUkdqNHFlMkJSWnBNaGVO?=
 =?utf-8?B?ZklMZW5rbGlhRDZycUdKVUVjMnorSWRQL2NMZ0dHOXZpbDlmb1FJa1ZQTGdW?=
 =?utf-8?B?UERIZWJTVUxhaUozMHFUeVNpQkFwT1JwR1hsNDUvL0lGZ2doSGdRMGhQbGFR?=
 =?utf-8?B?VUpZMjlmR1FDWGVGbmhtckNWTzhJeXpVS3orTUluejQ0MkF0UXcxQ1Fnc01t?=
 =?utf-8?B?emJWbVBQNWxXYndVckg1aG8xNG8rWkJuOTA2L1RGOTZXR2VSTzJWNjRZUlgy?=
 =?utf-8?B?SGdvVTd2UnlRVGJLRVZ1T0pBNHowRUMwWStjU3RUbDR5WitZY2JscEYxWSt6?=
 =?utf-8?B?dW9zaDl1SEtVQkNIRC9yOTJ0VXowaTdEZVFCTktTWGh6c2NDREhZREtFelh4?=
 =?utf-8?B?MEd4QW51bzhnSjkrV3NKTWZRTldyVXNqK1E3Mks5UHdYUUhhdkRObVlwQmhJ?=
 =?utf-8?B?S0dyUDE5WnN2VXdaZGNGSy9PcEdYS3IyRGpJVW5NSDhDMUI0ZXNsVW9oeHJY?=
 =?utf-8?B?c1pzZHQ3cjYzYlAvY29NNmhlMkRZajdEc3ZNMUovOEpFbHNnSmQvdjZvQzZ4?=
 =?utf-8?B?dGwxT1pmZzUva2U1MHo3QXI5YUpkTmJNUGhUNk9OMUJUV2RjelBkR0lSTW1s?=
 =?utf-8?B?Ym82R2ZUSWRTZG5wbFZUZmlFemlRekpCSlhmeUV6K3FxcnpidkJ0OFJNdEJR?=
 =?utf-8?B?bXBrTUl5bSs3aC9RZUJrRDlCdkxOc01ucllkTzJxTitFODdRZlRESWFWamIw?=
 =?utf-8?B?Z3ppaDBvTmxsSG1Kb2lPYmltUkZENklVTlltb2l6YWhFaFBpS2dvQ0xpNm9t?=
 =?utf-8?B?RWllOTR0amNzVzFJK0tZWmNQU3hqd0NjaWxESlRpb3Jub0cvOU9ObURCRy9S?=
 =?utf-8?B?aGRJckxwVmJwbkVCb1h3YjdlRmk3bjlYUlVSZzNMNVN3eFVJSjNhR0pnUCtj?=
 =?utf-8?B?aFVyYmJWanRFSE1Cc3pzcjVXaGhndWhHRUNZdi9XRmQwL0RXZ05FeDJYRVFu?=
 =?utf-8?B?TytDaTRGYjlOakFPWXg3RUhuTGJWTm01RUQzTWVaZ1FYdUQwVngySUoxTmZX?=
 =?utf-8?B?WnJHMmRVS1NEd3ZubEtTYXM4N3doUlJ1THoweTY5SDk3R2VWVkd2UzNRbk5H?=
 =?utf-8?B?Qll0aWxiK29CYUwyY1dPejBDcnZiNUpnZGM1TVl1cENwa1B3M2I2VDlhc09m?=
 =?utf-8?B?eWRjRzVoaERHVEV0Z05FN0RGck9lcFdySDBwb2ZiaGltRDRpZmxXK0pIOHZH?=
 =?utf-8?B?WW45VjcwU2N6SS9nb29SY2ZTMnJIcUN2clNlZTR2VjdoMlZTS21nYTZZN3RK?=
 =?utf-8?B?WW9TZzhZaWRFdno5NXVFMk5lQWtMUk5iTnlwN0JhaHBBQldUNk5OY21EY2E4?=
 =?utf-8?B?QlAxVERNSWdMazZHbHZhREk5UnBMUnI3eGx6ODNaZlZkYVUrUFR3dVRqbmJy?=
 =?utf-8?B?THQrd2tqMEtGOXBvUlhqRGtZajFPQWIxMjdoWWluNEtzQmRSZEU3dFlUVjV4?=
 =?utf-8?B?ZUpmWlZnR2NvZU9aT3k0c1JkWHRXTXRPRXNTZURlMytxaTNGazVmaFJMSHpG?=
 =?utf-8?Q?5E+QmjhdZ5Ohsj7/24er4IsoK?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4d4dca-9c11-47fc-3762-08de169c406f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 03:35:48.4479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: etgIsBaAFl6TmiSJAjVe1Az+vGP/zzg+6tUwXpJfRXohAAVbthrRSwBqT+3NZTSb5EQSXaI9VXz05XhTHRTOrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYQPR06MB8201

SGkgTGludXM6DQoNCkZpcnN0IFNvcnJ5IGZvciBidWlsZGluZyBtaXN0YWtlcy4gV2UgYWx3YXlz
IGJ1aWxkIGNvZGUgd2l0aCAteSBvcHRpb24sIGFuZCBpZ25vcmUgLW0gb3B0aW9uLg0KDQpXZSB3
aWxsIGRvdWJsZSBjaGVjayBpdCBsYXRlci4NCg0KPiBFWFRFUk5BTCBFTUFJTA0KPiANCj4gT24g
VHVlLCBPY3QgMjgsIDIwMjUgYXQgNzoxM+KAr0FNIEdhcnkgWWFuZyA8Z2FyeS55YW5nQGNpeHRl
Y2guY29tPiB3cm90ZToNCj4gDQo+ID4gSWYgYSBwaW5jdHJsIGRyaXZlciB1c2VzIHBpbmN0cmxf
cHJvdmlkZV9kdW1taWVzKCkgaW50ZXJmYWNlLCBhbmQNCj4gPg0KPiA+IGlzIGJ1aWx0IGFzIGEg
bW9kdWxlLCB0aGVuIGFuIGVycm9yIG9jY3VyIGFzIGZvbGxvdzoNCj4gPg0KPiA+IEVSUk9SOiBt
b2Rwb3N0OiAicGluY3RybF9wcm92aWRlX2R1bW1pZXMiDQo+IFtkcml2ZXJzL3BpbmN0cmwvY2l4
L3BpbmN0cmwtc2t5MS1iYXNlLmtvXSB1bmRlZmluZWQhDQo+ID4gbWFrZVsyXTogKioqIFtzY3Jp
cHRzL01ha2VmaWxlLm1vZHBvc3Q6MTQ3OiBNb2R1bGUuc3ltdmVyc10gRXJyb3IgMQ0KPiA+IG1h
a2VbMV06ICoqKg0KPiA+IFsvaG9tZS9nYXJ5L3dvcmtzcGFjZS91cHN0cmVhbS9rZXJuZWxfdXBz
dHJlYW0vTWFrZWZpbGU6MTk2MDoNCj4gbW9kcG9zdF0NCj4gPiBFcnJvciAyDQo+ID4gbWFrZTog
KioqIFtNYWtlZmlsZToyNDg6IF9fc3ViLW1ha2VdIEVycm9yIDINCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEdhcnkgWWFuZyA8Z2FyeS55YW5nQGNpeHRlY2guY29tPg0KPiANCj4gSSBqdXN0IGRl
bGV0ZWQgdGhlIGNhbGwgdG8gcGluY3RybF9wcm92aWRlX2R1bW1pZXMoKSBmcm9tIHRoZSBTS1kx
IGRyaXZlcg0KPiBpbnN0ZWFkLCBiZWNhdXNlIEkgZGlkbid0IHVuZGVyc3RhbmQgaXQuDQo+IA0K
PiBCdXQgaWYgeW91IG5lZWQgaXQsIHB1dCBpdCBpbiBhIHNlcmllcyB3aXRoIHRoaXMgcGF0Y2gg
YmFzZWQgb24gdGhlIGxhdGVzdCBkZXZlbA0KPiBhbmQgYW4gZXhwbGFuYXRpb24gd2h5IGl0IGlz
IG5lZWRlZC4NCj4gDQo+IFRoZSBvbmx5IG90aGVyIGRyaXZlciB0aGF0IHVzZSBpdCBpcyB0aGUg
UmVuZXNhcyBkcml2ZXIgYW5kIGl0IHVzZXMgaXQgbGlrZSB0aGlzOg0KPiANCj4gICAgICAgICAv
KiBFbmFibGUgZHVtbXkgc3RhdGVzIGZvciB0aG9zZSBwbGF0Zm9ybXMgd2l0aG91dCBwaW5jdHJs
IHN1cHBvcnQNCj4gKi8NCj4gICAgICAgICBpZiAoIW9mX2hhdmVfcG9wdWxhdGVkX2R0KCkpDQo+
ICAgICAgICAgICAgICAgICBwaW5jdHJsX3Byb3ZpZGVfZHVtbWllcygpOw0KPiANCj4gSSBkb24n
dCB1bmRlcnN0YW5kIHdoeSB5b3Ugd291bGQgbmVlZCB0aGlzPyBUaGUgU0tZMSBoYXMgcGluY3Ry
bCBzdXBwb3J0DQo+IGFmdGVyIHRoaXMgcGF0Y2ggSSB0aGluayBhbmQgc2luY2UgdGhlIGFyY2gg
Y29kZSBpbiBhcm02NCByZXF1aXJlcyBEVCwgaXQgc2VlbXMNCj4gZmluZS4gQnV0IG1heWJlIHRo
aXMgaXMgZm9yIEFDUEkgYm9vdHMgb3Igc29tZXRoaW5nIGxpa2UgdGhhdCwgc28geW91IHdvdWxk
DQo+IGhhdmUgdGhpcyBkcml2ZXIgYnV0IHRoZXJlIHdvdWxkIG5vdCBiZSBhbnkgZGV2aWNlIHRy
ZWU/DQo+IA0KPiBKdXN0IGV4cGxhaW4gaXQgaW4gYSBwYXRjaCBhbmQgd2UgY2FuIGFkZCBpdCBi
YWNrLg0KPiANCg0KUGxlYXNlIGFsbG93IHVzIHRvIGV4cGxhaW4gd2h5IHdlIHVzZSBpdC4gDQoN
CkFzIHlvdSBrbm93biwgdGhlcmUgYXJlIHNvbWUgc3RhdGVzIG9uIHBpbmN0cmwuIFRoZXkgYXJl
IGRlZmF1bHQgc3RhdGUsIGluaXQgc3RhdGUsIHNsZWVwIHN0YXRlLCBhbmQgc28gb24uDQoNCkdl
bmVyYWxseSBhIGRldmljZSBtYXkgaGFzIHR3byBzdGF0ZXM6IGRlZmF1bHQgc3RhdGUgYW5kIHNs
ZWVwIHN0YXRlLiBUaGV5IGFyZSBpbmNsdWRlZCBpbiBEVFMgZmlsZS4NCg0KU28gRFRTIGhhcyB0
d28gbm9kZXMsIG9uZSBpcyBmb3IgZGVmYXVsdCBzdGF0ZSwgYW5kIHRoZSBvdGhlciBpcyBmb3Ig
c2xlZXAgc3RhdGUuIFdoZW4gdGhlIGRldmljZSB3b3Jrcywgc2VsZWN0DQoNCmRlZmF1bHQgc3Rh
dGUsIGJ1dCBzZWxlY3Qgc2xlZXAgc3RhdGUgd2hlbiB0aGUgc3lzdGVtIGVudGVycyBzdHIuIA0K
DQoNClRoZXJlIGlzIHR3byBwaW5jdHJsIGNvbnRyb2xsZXJzIG9uIENJWCBza3kxLiBPbmUgaXMg
dXNlZCB1bmRlciBTMCBzdGF0ZSwgYW5kIHRoZSBvdGhlciBpcyB1c2VkIHVuZGVyIFMwIGFuZCBT
NSBzdGF0ZS4gDQoNCldoZW4gZW50ZXIgc3RyLCB0aGUgc3lzdGVtIGVudGVyIFMzIHN0YXRlIGFu
ZCBTMCBkb21haW4gcG93ZXIgb2ZmLiBTbyB0aGUgcGluY3RybCBjb250cm9sbGVyIHVuZGVyIFMw
IHN0YXRlIGlzIGFsc28gb2ZmLiANCg0KVGhlIHNldHRpbmdzIGZvciBzbGVlcCBzdGF0ZSBhcmUg
bG9mdCBhbmQgbWFrZSBubyBzZW5zZS4gDQoNCg0KQnV0IGlmIHdlIHJlbW92ZSB0aGVzZSBzZXR0
aW5ncywgdGhlIHBpbmN0cmwgY2FuJ3QgZmluZCBzbGVlcCBzdGF0ZSBhbmQgY2FuJ3QgY2hhbmdl
IHN0YXRlIHdoZW4gc3lzdGVtIGVudGVyIHN0ci4gDQoNCldoZW4gcmVzdW1lIHBpbmN0cmwsIHBp
bmN0cmwgY29yZSBtYXkgdGhpbmsgc3RhdGUgaXMgc3RpbGwgdGhlIHNhbWUgYXMgYmVmb3JlLiBT
byB0aGUgc2V0dGluZ3MgY2FuJ3QgYmUgYXBwbGllZCBhcyBleHBlY3RlZC4NCg0KMTM2NCAvKioN
CjEzNjUgICogcGluY3RybF9zZWxlY3Rfc3RhdGUoKSAtIHNlbGVjdC9hY3RpdmF0ZS9wcm9ncmFt
IGEgcGluY3RybCBzdGF0ZSB0byBIVw0KMTM2NiAgKiBAcDogdGhlIHBpbmN0cmwgaGFuZGxlIGZv
ciB0aGUgZGV2aWNlIHRoYXQgcmVxdWVzdHMgY29uZmlndXJhdGlvbg0KMTM2NyAgKiBAc3RhdGU6
IHRoZSBzdGF0ZSBoYW5kbGUgdG8gc2VsZWN0L2FjdGl2YXRlL3Byb2dyYW0NCjEzNjggICovDQox
MzY5IGludCBwaW5jdHJsX3NlbGVjdF9zdGF0ZShzdHJ1Y3QgcGluY3RybCAqcCwgc3RydWN0IHBp
bmN0cmxfc3RhdGUgKnN0YXRlKQ0KMTM3MCB7DQoxMzcxICAgICAgICAgaWYgKHAtPnN0YXRlID09
IHN0YXRlKQ0KMTM3MiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQoxMzczDQoxMzc0ICAgICAg
ICAgcmV0dXJuIHBpbmN0cmxfY29tbWl0X3N0YXRlKHAsIHN0YXRlKTsNCjEzNzUgfQ0KMTM3NiBF
WFBPUlRfU1lNQk9MX0dQTChwaW5jdHJsX3NlbGVjdF9zdGF0ZSk7DQoNClRvIGF2b2lkIHdyaXRl
IHRoZXNlIHVudXNlZCBzZXR0aW5ncyBpbiBEVFMgZmlsZSwgd2UgaGF2ZSB0byB1c2UgcGluY3Ry
bF9wcm92aWRlX2R1bW1pZXMoKSBpbnRlcmZhY2UuIA0KDQpEbyB5b3UgYWdyZWUgb3VyIHNjaGVt
ZXM/IFdoYXQncyB5b3VyIG9waW5pb24/IFBsZWFzZSBnaXZlIHVzIHNvbWUgc3VnZ2VzdGlvbnMu
IFRoYW5rcw0KDQpJZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zLCBwbGVhc2UgbGV0IHVzIGtub3cu
DQoNCkJlc3Qgd2lzaGVzDQpHYXJ5DQoNCj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoNCg==

