Return-Path: <linux-gpio+bounces-9153-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1792495EC3D
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 10:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9715A1F21074
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 08:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A3D13D504;
	Mon, 26 Aug 2024 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ggA3M5JV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC67F13D8A2;
	Mon, 26 Aug 2024 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724661780; cv=fail; b=gqe+bkbVsxj/39fe7nEVthiXcvelyo5hVEcdRbmT4wTx+iLmkAHFFzPUjX1dtTSYkTJmiiIHDDZ8krnX+vaZcHSsJdL70hF96+WL8yHx1xm4Z9yv4Ul2eEFjcvoSgjj7JqtcxaH0oKq6sNns74aNgQx+OwjBIiLx2an5WqqBYcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724661780; c=relaxed/simple;
	bh=cU6A+yNjr75y0CvxdiYHAAM7UOLAa9Z8tXU+de67hg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZWhTYHxPSj5BWHJYXxHTYYCZXuvloivc2LUZiLvFhsRTWrbRoDtpPDnVdmxYpBNgpwST8ww1K8G1w6HeKWIK8jkv4Ygywb1KxDwX1B16t20bCx3XAi7uRvksmrCBmas/E1UXbfNf5qCVeuEs4HHKavJk6b1BRo0HFoQxLt5QSUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ggA3M5JV; arc=fail smtp.client-ip=52.101.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhZt+yMKaItWT76/yiRf5Pan7C4sWw3+o1YWeK4Jkw7EtSl0JSLsHRE54kcHRJhxODDoGkDBTy3uW7WI/uh1JZwHcuhrrrDR4CHI3BHHG/Nj6v1yl0EWKOEVswrgqeFrYhYQHDEa0b5Dk91AZmVXhDHBnUb/xO/O1xW83072VUu8PHqqVMKNHfRxS29IhKPa+9NHkWgMoBe64qAfHB71d7xqJVRBIuxUHTyG43YkiaMWuJlyYhHirrlF0d81oEbLHeHa9mOFd4+xRV5Yn46tSb2t/O1h1xa5MkE5nADsBClPZsrZEsj3egRe+6d0FnBEk8IgtXTg/n1f9TfuGpIMKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReMTfYB6XlnXjTuva12Bx5ElDSxWV5lyjVfoopXhl6A=;
 b=JhnvD006k974Yr/6mD4N0limOHBNwXgy9Z8SpA3V7hiohiJetdR+CLyHN/9l0zAZ3WA15cbaolx+qApIxHVf+Q+YfEsHdubAch7NYQAwVY1hC3Q1hXd4qLSjwQA9YGJd02Qiw3HCBhayP3/DEyb0o+IfKsAdt1YSQ1IPHGncmszsJCEdqwOD/Y/SZvWBUdBrt/BB26FT5erM94xmW1jZ3l98s8WPLGAw507FENsRZgE+HLLVtX9k1a1Lv7P3VEPjzZk30NAYsDpN546VdEhoht2SbbTxCIWvzyMyF0uwwKFJ9FgUpgHpBTYb7KgjtAD75YXewVoBf8hwGgOeTaaO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReMTfYB6XlnXjTuva12Bx5ElDSxWV5lyjVfoopXhl6A=;
 b=ggA3M5JVWdB55kYazmQvsbqhdTpzrtpEp8DqWoYKtmdAO3y0s6xwwuap4UjwzX1SqHp+m3RL8RMonQkuUy5NV7egMNJ5/8HXM9Gs+i6bD1GvxINNvh+sPA2/OUDM4LQjrPH78jXHSv2oSID39vqfPYRpCPidX+QdbeFh+7WpkNgTu0XYhjlh4n7PmRlubkPV7kbaNVc/iVKp1slmmX6zATCOCT9y0UyMTJsmoyTUFV6yyBvewx2xy85vRzA4L7nHkrJCEk7w3aQfaD1AD6zGtD3tft+qGpd6oDiywEBn5yhcMVDKZvoaQxTnEJQZs9FWGwgnEFd6IX+7zIVD4h6Oqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PAXPR04MB9680.eurprd04.prod.outlook.com (2603:10a6:102:23e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Mon, 26 Aug
 2024 08:42:53 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 08:42:53 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Phu Luu An <phu.luuan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH 1/3] dt-bindings: gpio: add schema for NXP S32G2/S32G3 SoCs
Date: Mon, 26 Aug 2024 11:42:08 +0300
Message-ID: <20240826084214.2368673-2-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com>
References: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0043.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::10) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|PAXPR04MB9680:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f9a210-f00b-44bd-6675-08dcc5ab131a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1VNc00yVGh3UzJXTmZkSTJHSlpkeE94eXR5WDdveHRhcWI3NEQrdHZ0ejF6?=
 =?utf-8?B?LzdkaUpDamd6bmwvRTZiY1A4ZVpkMFFVM25TZ1hSRllQRUtPcjQ4dWVtNk1V?=
 =?utf-8?B?K3BaWkxSbzV4NGxzUWFWNzFKVklEV0F5Zm9LM1V0WDY5bnh4U2JMTVAxb2Ey?=
 =?utf-8?B?RHNkeEJhb0tHSVNmNmtrcERlSFZpSVB0Zi8wYjlaUlFiUFVxM3VVZVA1WU9Z?=
 =?utf-8?B?L3dkajFOU014NytITlc1RlMyclhQNk1wdkc4a2wrWFVQQjdyRlg5bkhaZWlj?=
 =?utf-8?B?RU05OHF5eWIxVUpwc3JWMVFzNCtEdWVleGFCZDc2ajVQNzVPVndtbnAwYUVZ?=
 =?utf-8?B?OHRTZ0pBb1JBMXRhamJqTERnSWI1TmEwRmg1Qk1qRjJ3bmJTNi9acGM2R3pM?=
 =?utf-8?B?R09RNGVUZ3k0LzJhaFpPeVZOM2ErdElJQ3VTeGd0ZE01bzRPRGdYaEdjcDlj?=
 =?utf-8?B?eExaQ0FYYWZTRWJKUjkrSFRjNWVzd3ZjL21WOERpSGFOYk8vd0w0UU1jRE9D?=
 =?utf-8?B?c3EyOG44WTEzL2srK3NhbUhvOFdud2E4N2MzSTJ4SDF4dFJmWkpjRGZKbkVr?=
 =?utf-8?B?U3ZpdU0wSlpvbTlxWDZPVjZoMkZuUkR1dFk2MlNDQ3JiTFJGOTc0dXlvVjFX?=
 =?utf-8?B?STAzVEtlbmQ3OUthdVZ2R2R4Rk1zMitWaStVZnAxSWQrL3VRRlMxbzd6N2ZM?=
 =?utf-8?B?VGhpbmtoSmNIa0FCT1Z2cjNPeDUzWEFZeUVCUWR0dXdsM3Y0MzRJd1FWRUU3?=
 =?utf-8?B?YlRxWlpsZ1ZyVjA0TkNqQWNvNjBodTAyL0ZEZEJ2blNReEpTUkxlcDd5L3Yy?=
 =?utf-8?B?N0lMMXRRWlViSVB6YzdMZUNRVDlDamloVURieDBJbHBlL01RNGxybDVmZXpa?=
 =?utf-8?B?WENKbzkyaEtlSWVIS3YxNTI2UDdqdkxOVzdIbXkrZGFqV3g5OHBkSGhjOFBL?=
 =?utf-8?B?a0xGMWhVaVF2dG9OYjhwb0ZaNzhxM3JFNk82RFdueHUwZk5nTk1wd3YyQWNZ?=
 =?utf-8?B?OFYrVGFjaC8ybmRNM1dvb0JQZytkMWcxWE5DK2M3bEs3S1VXYkdzS003aDc1?=
 =?utf-8?B?UEFqbFUvemhDR0dZcitaQjFNV2NrSGlRcDBlQml1WStFVmtscnAwcDVYUUk4?=
 =?utf-8?B?Wk5RdTRCeFdEWGp5ay81RFVoTGgvTUQyUjZwc3ZtOE1YcTRXMjc2TW03N29t?=
 =?utf-8?B?TWVIUWhxVEg0Ym1XRVptTUpKY0srWGxhWTF5NG1PY25WTi9oZUxNYkt3TE43?=
 =?utf-8?B?blYyWktrR00yWW84azFHcS9XVUpUUVFyN2oySkYyZGhmTyswdlZCVG5IOTQ1?=
 =?utf-8?B?c3hRbzFMVHkyVHltcHZUdGc2U3pGQVdyazVIaU9qdUJrN2tlY1VhY2phb2R5?=
 =?utf-8?B?U1lXWisyQ01yR25Id2l5QndKdWZrYzFnekdzQU1ML1J5V1M2QnhtREppbU95?=
 =?utf-8?B?eUZ5UysvYUJVUWZoRm1INlBqbk00RFY2RlNkWVlZd0F5UFFrL3RvQjZVQTNn?=
 =?utf-8?B?OVJhaWVKbVo4YkYySGZVR3piemQ2aDNmdWZZUS9GRGl2TzVKZlMvUzhIYWlK?=
 =?utf-8?B?YTVoTEtEWDRWdVRzNmVpZ0NaaVJYaUVNOUpEUFFpKy80MTE5enlsTnJ2QTY4?=
 =?utf-8?B?RllycS9xUi9xYno2MzlEYXBjVDd3M25EQUxZR0pUU0MxcXVwT05NRlJJaWJk?=
 =?utf-8?B?MW1rVCtTbEovTDR1NU42ZTQxZ0RpcEJJcitVYVZyYkl1TFRNdXZzMEJFQVE4?=
 =?utf-8?B?WWhvSHB0K25ZMzNFaGhuLzVJWE0wQ3d5M2dBVGl1dHVPMHNzRWJ2TGlkbVdw?=
 =?utf-8?Q?ubUu7iBFmGVaDyfaVRs2oynnaRe52FbcWHoeg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGg5cGsrRzYwbFVTYmhXc3Bxa0FBQlFJa2Jsb2Y4TzRrT3lWeDR3dXhwNXhT?=
 =?utf-8?B?VW5tdGZFOHFUUmRtakdUNXZOanUwWHVkbWtEbVNhUnBCQ2pMdE14RDJJRUxp?=
 =?utf-8?B?OFVIS3JBSXBVaWVhU1dLSUxDekVPQklXNFhmNUtwUUlCbXRFQ1MvZnVBWi9D?=
 =?utf-8?B?WlBFcDlOZ3RiZU9kOUUrMDE4SE1jckkyeVI3YnRGZ1lxV01BQ2VBdlNnOGdo?=
 =?utf-8?B?Q2cwQmtxVTRJMDliRkpBYXRnYkJPRHZXVGQrWDZYT3c2MjJmWGdSWlpyUnR1?=
 =?utf-8?B?T0Mzem1CYTM5K01Rc1hVdnl2ZHFiVWZnVG5lQUI3a0lXbmhiYnljL0hNUThu?=
 =?utf-8?B?SFhUdE5hZUhtdFZFem9OcjRuTjNScWJQRmpzbXl6WlhlS1dDSzMwMmpmWXhK?=
 =?utf-8?B?V0MzRlJVZWtFMHhrdzZqRXJtcHpseUJIMjlOa08va3JHMVpOWldmaldoOGJ0?=
 =?utf-8?B?Y2R1U3ZYSVVvZUJGZjhCTzZ5SkZ5NTEwQnpSNUc4ejlGV1V1V1RQQUVZeW1T?=
 =?utf-8?B?UituUnE4Tm1JQmlxbTFTdm9DeFNBcktFTU12Z3JsRTdQNlNHVUZVS2xzbXBr?=
 =?utf-8?B?YnlTNTMrdmRtdTZUTVJsNHZ1QkpDYnFzR3BaM1k2VTNubHNrTFBzSldCT1RE?=
 =?utf-8?B?Szh2WXZ3em53SjZvcmZ2Z2tVeEppSzBCWDkzcVBXSVMza3cyWkhKVStuMTRL?=
 =?utf-8?B?TWwyeWwrbzJVaGNiZlh3RWt5c0ZXZUxIc3AvcFlneEFhd056SS9sbWlYSVJL?=
 =?utf-8?B?WWt2WjBkanYrNTNEM0xpVGlJYnpWQ1drTVpwa0N5SUQ0SDNOb3NmWElIVkhP?=
 =?utf-8?B?S3Z1YklQU2t4OCttTkNYSGZScTZYcGFVOTR0dC8rQTQ3NFBlV0VxWEdqRTY0?=
 =?utf-8?B?amUyNjh4NU1kNVRueE1lWkE2ODg4YzJIR3BrSDE0Ri9YdWV3TCtFZU92M1FR?=
 =?utf-8?B?b0tEemkvVFpMNk9PdFNlNUlhQjVXaDhFWE1DNllQbERkU3gyUVIyWEFDVnFZ?=
 =?utf-8?B?L2EvVHE1Y3ZicjlNWk1vSTluN0NjMWRDdldjanBEaVIranBBbmZtM1hsWE5H?=
 =?utf-8?B?UTlKU0NnZ1lZd1M3aG96UWlIbitPakYrRGlQazZHUlZ2R2NGcWpUMmlOUDZs?=
 =?utf-8?B?RW5qUVY2TVZLdkJlajJuMkZPNEVGblV4cC84ZjZma2UydXF3NVdDamh2cUhS?=
 =?utf-8?B?WEVVYlBWQURRN2tvZDJNL3JEWXRWdXBnNStlUHJSWmMxZHpTMDg3Nnl3b2lY?=
 =?utf-8?B?T1NQYzU0cm9lYy92RDRDN0pxQnRIR0pCbnpoZ01xZlhZSHNoVEMzNTN4R2s1?=
 =?utf-8?B?Z0tBc1hQMmNDa1ErTEp2aExlamdMYzFSeHdZcDNMUkpLYjN1V1NrK1o2ZGM3?=
 =?utf-8?B?RXZIYStrUGtSZUxidWtwWUgvM09HOFRaZnY2cENqTCtadTBjZXpuZjlmZ0t2?=
 =?utf-8?B?OVBHcWQ5UlpicVhCZHJmZWtQRGRXam1oWHZGUitJYUw1bndMTUZIYklINmxk?=
 =?utf-8?B?MWpOazMvTklKTVJQU3NvVFFtVXJXZmdsSDhGNHBvWTV0YVBnT2I2SDNtUFlu?=
 =?utf-8?B?Z1pvcDNCWjh0YW9sNmpxT1FtcTcyTi9yb3ZsVjRQNHAweFpUL0VEbTFja2Uy?=
 =?utf-8?B?eHZwcDA2eFBHYzJYN3JFck9UcTdCNGhPUWZSbXhkTjhnc0o5aGROV2VoYlBK?=
 =?utf-8?B?MFN1bFI4bjk1WEY5VzAxcXViaExJMjlkby9xK0VCck1vMjltZ1pGWjN2STVx?=
 =?utf-8?B?N25vU2paQWJ4RTFhRWlGanNFd2tmMmNUQ2NXc21qVEZ5UTVxbjRabUp1dzF0?=
 =?utf-8?B?Z213M0hxZ0Rla0tWcVNNa2JENDB1Zjk1QUJJYVRSV1NHQjQzSmtXM0NiQTl6?=
 =?utf-8?B?bFdiKzV4aXVPM2R6S2FNZTFvK0VIcUIzRDV0YWZVVnQvK0VzY05tYXRDMU1i?=
 =?utf-8?B?cFVMS01TeG5vN2VJQm1iNnpXZzluaUlxc0crSlZaaGF1VHFhc1EwbFQ3SkEy?=
 =?utf-8?B?TDRTRTQwbVZaNWVKbDV3cUU4T2hqd0ZiYlRMR3Q1Sm5ueFFlQ0pQbkRQWEZD?=
 =?utf-8?B?WGdMQjQ3NkUrOWxMaXVlMG02cEFNZXB2V3dYNmFCNEtiTDBmM2E1Z2gvNWhD?=
 =?utf-8?B?cWNZeXBQUUxPUVJQNjF2TzZzc1cyeGduOHkwZjlMSXdPbHRxL2dFRGE4c3Rk?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f9a210-f00b-44bd-6675-08dcc5ab131a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 08:42:53.3860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYuhcTBLD+vEvHo48RIMyiXYcVVfMwIp1Rivn0K/b5N5O939pU592r5z+s1nohnQVy9tkBzWhzGycEoWe5iVd7W3jwFt6Pg5kLG+IvYtFY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9680

Add the DT schema for the GPIO driver of the NXP S32G2/S32G3 SoCs.

Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 .../bindings/gpio/nxp,gpio-siul2-s32g2.yaml   | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,gpio-siul2-s32g2.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nxp,gpio-siul2-s32g2.yaml b/Documentation/devicetree/bindings/gpio/nxp,gpio-siul2-s32g2.yaml
new file mode 100644
index 000000000000..fba41a18d4c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nxp,gpio-siul2-s32g2.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
+# Copyright 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nxp,gpio-siul2-s32g2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2 SIUL2 GPIO controller
+
+maintainers:
+  - Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
+  - Larisa Grigore <larisa.grigore@nxp.com>
+  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
+
+description: |
+  Support for the SIUL2 GPIOs found on the S32G2 and S32G3
+  chips. It includes an IRQ controller for all pins which have
+  an EIRQ associated.
+
+properties:
+  compatible:
+    items:
+      - const: nxp,s32g2-siul2-gpio
+
+  reg:
+    description: |
+      A list of register regions for configuring interrupts,
+      GPIO output values and reading GPIO input values.
+    items:
+      - description: PGPDO (output value) registers for SIUL2_0
+      - description: PGPDO (output value) registers for SIUL2_1
+      - description: PGPDI (input value) registers for SIUL2_0
+      - description: PGPDI (input value) registers for SIUL2_1
+      - description: EIRQ (interrupt) configuration registers from SIUL2_1
+      - description: EIRQ IMCR registers for interrupt muxing between pads
+
+  reg-names:
+    items:
+      - const: opads0
+      - const: opads1
+      - const: ipads0
+      - const: ipads1
+      - const: eirqs
+      - const: eirq-imcrs
+
+  interrupts:
+    description:
+      The port interrupt shared by all 32 EIRQs.
+
+  gpio-controller:
+    description:
+      Marks the device node as a gpio controller
+
+  "#gpio-cells":
+    description: |
+      Should be two. The first cell is the pin number and
+      the second cell is used to specify the gpio polarity
+      0 = active high
+      1 = active low
+
+  interrupt-controller:
+    description:
+      Marks the device node as an interrupt controller
+
+  "#interrupt-cells":
+    const: 2
+    description:
+      Refer to ../interrupt-controller/interrupts.txt for more details.
+
+  gpio-ranges:
+    description:
+      Interaction with the PINCTRL subsystem
+      Refer to gpio.txt for more details.
+
+  gpio-reserved-ranges:
+    description:
+      A list of start GPIO and number of GPIO pairs which are unusable.
+      Refer to gpio.txt for more details.
+
+patternProperties:
+  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+    additionalProperties: false
+    type: object
+    properties:
+      gpio-hog: true
+      gpios: true
+      input: true
+      output-high: true
+      output-low: true
+      line-name: true
+    required:
+      - gpio-hog
+      - gpios
+
+required:
+  - compatible
+  - interrupts
+  - reg
+  - reg-names
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gpio: siul2-gpio@4009d700 {
+        compatible = "nxp,s32g2-siul2-gpio";
+        reg = <0x4009d700 0x10>,
+              <0x44011700 0x18>,
+              <0x4009d740 0x10>,
+              <0x44011740 0x18>,
+              <0x44010010 0xb4>,
+              <0x44011078 0x80>;
+        reg-names = "opads0", "opads1", "ipads0",
+                    "ipads1", "eirqs", "eirq-imcrs";
+        gpio-controller;
+        #gpio-cells = <2>;
+                      /* GPIO 0-101 */
+        gpio-ranges = <&pinctrl 0   0   102>,
+                      /* GPIO 112-190 */
+                      <&pinctrl 112 112 79>;
+        gpio-reserved-ranges = <102 10>, <123 21>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
+        status = "okay";
+    };
-- 
2.45.2


