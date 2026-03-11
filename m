Return-Path: <linux-gpio+bounces-33176-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGveDGO+sWkwFAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33176-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:11:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFCC26919D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59D3E3212746
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B03327C08;
	Wed, 11 Mar 2026 19:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ehDq3nit"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013007.outbound.protection.outlook.com [40.107.162.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE80366560;
	Wed, 11 Mar 2026 19:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773256130; cv=fail; b=fKIPslVqMzbv4O6KgIiRe4026BgcJQ3c111BfK2gfypxqklmVeTePq6B3Gv5NBnOjxDD35OrtReo7G/Q++Q0+Cv5rvrHVpynhmvoTpQf31kWrj8OttqYC2swGsxCKnq8pVkktE/+Nm4gme0TbYcwBgfC+qRmrOEmyXz6Yp3tn7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773256130; c=relaxed/simple;
	bh=W406vAQ9hbVfuSOoxNewScz0NBbuWf3R1tv7KK5AxoM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IRvlNac7mC6V51nyo+i1c2A1FpzMCgyh8Yvu7tb4xsAcne2T9J5BSk140dWD6Gu5SBYBZFi/Tgj4ty1qDmMaEbrN/uVjo9UXclF+M4cve4V6VYGvfMLUjupixAG/Xg1mJjltuy1Md18oWYag4Y++kHFErb5PnZuEFsM2/oQ4ZK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ehDq3nit; arc=fail smtp.client-ip=40.107.162.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAysi8WGKPbqcj86L7b1aXD3VzjM9LeorNNf1hPQCa5krTVgV4FGC+pVRtLs+mvLCMH8jd30T9ZfoNDzJ5lHpZjUpF9i03mbEPjUyDopwSl5SXj0ucXpFzO0OKgqzyR3Xocsfs51e1b2U+YhxxThy4FgBu68pEwKfX0Imbercx5io2064ZajnsMsfwzo2CA66sf9Z/dCoi6BN/RfYEOcPBONum1QbQdiXJtE6acnTeAdjPqWvAeYokU6ISe3KdOdW7Exy40jnddBAn7/GkiJVUFPcxaRKWpM/o7pGgKQBUL5zeR9B0S2THB+CScVhT7zG3y96+h1cASBoxufQPOXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvmDrWNtbXdLEXEGiq7O6SJEAJWBYNrLpfWeYdTU5Fc=;
 b=AlN1rYrJN+Srtx62POewGkR/1YyI9mX4AU0qky9zxp7anKQtch16bestfdYPZyNh1+lFM/dfO1iLt9yq1knyBL9xyKNFo7HecQPBGPq46mDsy/czz9YhRCoJ1f3t6IpIKcejJfoYvz27wjhsIw6PCmlIVpyIPepc3TWv/YAOXQPRoklCO6ydxCYEW1jSZMZ/VkiGruyAdX8z7kmAPdGwfbZaLnZ3KgU/CzIfwEu/D4ivlKaHbvLbkL5A3IV0EspTmn1l39Gz+HYvT1GqojkAwlQYkKmjb3OwYezZdC9akW/bmjGwwDyNbkk2YUYy6n6fh9xwdSYlNLPttIoUnT6sgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvmDrWNtbXdLEXEGiq7O6SJEAJWBYNrLpfWeYdTU5Fc=;
 b=ehDq3nitl8LwI0+ebnNd88j2xJAtdbDPKWN33GtvgbWcTPAkWGVwFuKwUz3ASoTuNUDjWh5ta/cbCg+YA3RPXw0SC/5sk2NQCaXBuS8HEeCUGaKig3MSwlVGygtDhBlwETjuJ2+WAsC4VpT4smco6npsKcOnfl6IYhiqOreJLEk4yupRTEYeOjnenXJlOV6q57kavI2WPPeC6dSluUwBPoAV6WeSvNOkzGiJBwoFGVwGTdkm+VvBR2U3jM9kpcw+WuKqsKl/iLhyk3dXKvuNAAZ6Ui07dzQOkLVhYlbUM+Cb8GghABD9MyeRo9dnR9LCRW3YgF5TLBrN+TRiqaJhyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9121.eurprd04.prod.outlook.com (2603:10a6:102:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 19:08:40 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Wed, 11 Mar 2026
 19:08:41 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Mar 2026 15:08:15 -0400
Subject: [PATCH v3 6/7] arm64: dts: imx8mp-evk: add board-level mux for
 CAN2 and MICFIL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-pinctrl-mux-v3-6-236b1c17bf9b@nxp.com>
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
In-Reply-To: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773256101; l=2112;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=W406vAQ9hbVfuSOoxNewScz0NBbuWf3R1tv7KK5AxoM=;
 b=iNpKlYgNcj3TPFPHJG99wSGAvKqSzQ4M1ZoPAMBs8TSbkPa+0JkouCiYgqZrrTXBY2+48G+fs
 z8zF/80YIygBzqpHvjvKnF5U7QRI11fvJs26TnaNZJ/2J9cAfmpmc0k
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA9PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:6e::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: c29b4483-db63-4723-d255-08de7fa19bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|19092799006|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	V2oj2K9BgzOBfQgMckybol9l37vUX/mfrbQdkjxddm6MBOVymKoBrNv7g1u+QbpDooRZSaKDR6/J46T84YRikWDBwB4TGrw9DANZjTuqQFRNdVAWMmo4T44vSIq//fY8AiyEH+2gS/ovuD3HEi8j3C2/+byS6xY0WyX27S0nxs2/HGBR3NAquHRxJmMp/3lQNlkeb61RvXFMO3AHWe2OcwmCuC4sdh3Tfi7mpH3HaESte84BhDtxdtxGKoxOWGIao6yxlXAjrf80VTC95xu+atnn4FJ1WKFx+XkDbRaZqAnPfqcGz6VNzre0auib5KbnnxqexHhySNLbmPy2IEy26PaUAB4/UqLa32zGRRXoHpFTCoTVqUU0gvqmjCFTbHvrTjtT6PZ9hd5TjpCkPM5wgggbprO9xBZeg25vRKTUOJrihfOeHiTPeNx6cs/5qMM3/HnJeEudTPeR3Ve49QMcrvTO5ELdfbELwcKFK1PvlFe+1wHLZTNW/JhK2uqO4FUH7toxnvPQze250zk2WRfPt2bLidQ5jaa/M897V1jYG+LdtModSx8P4nk6aHMwtlWMG1Gq4dvI5emQZqLG7laHkwiGCJzalS2gmvNR8zt58SOnr4+DViYDbvLMTZqxJ57rpOxl8NmgeMoe678NnLzYYWxg3RNjgYr64KzhMMeAoZNpr+JyqKn44Svke6wB/DSHgQbc/qWNAkjqY0h5ZPQSDeHfO6bylHgt6bLWksZ0Tzx4bW4FAUlVwStVelKrIVfOpNdzCES9Hy4nM0C6oJrSyB9+xVSCyk26SFShsfrhoME=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(19092799006)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnJWVkR3Zkp1emtzQWZKK3ZJRUN6RDJWVXMyQWkya2tiRjB0M0J4Y1dnbXR3?=
 =?utf-8?B?LzlGc2Z0NnJwVFp5K2NUbXowY2tTekZ4RWFEeDVyUWZFTCswdG50UDZGVGlX?=
 =?utf-8?B?YXZNdmNGQmVJR1ova2xEU1NLU21CQzZRd09GZVVYMytnTElodUtzVmR4WmVi?=
 =?utf-8?B?WFR6ZzIyb1c1NUdvY3cxMjhzS1NiZEExTUk0WEFvaE11cmE2d2lhU3VPSjdS?=
 =?utf-8?B?dnNvT0MwalNEVGM2QW9IRS9mblZvWk5hdjdzd3E0c0c5UW1SWUV5RWo3eFhB?=
 =?utf-8?B?VEE2WXRHNGZpZHMwWUVFMU5XZ1ZENVZBTVNJMEY1cWo3UHMrQ3JZREZTQTNE?=
 =?utf-8?B?bkx1bFRPKzkwK2NaUkY1YWY1WDdseWllK3RWbnFjd0ttZUJsYVdTZW8ydEhJ?=
 =?utf-8?B?R2oxR1pTQTRNMFJ6MWhRMlJyV0lJZUVPUzlCamdkeWd6eGRLR0NHeUtKc0xo?=
 =?utf-8?B?VWt2eEN5VjFDRk0reVdzZzhiSjNuOG5wd0ZvMGV0K3RwWW5nMnVOY01OVlcr?=
 =?utf-8?B?RGpNbjZ1TlFudEM0dDQ5dzN2ajY3aVRQa0Fla2tpU3Jidjk3bHFLZStVL2lQ?=
 =?utf-8?B?dUFEVnZiMU5EQ1IwQllNVFhpb241Wlh4ZDNpMTAyUElrWW1mOEhOUmVMTCt4?=
 =?utf-8?B?b0tQSDFKWURLMmRBYnpGNHNhQWVJV2pGYUpBY1hkdzZqU1RLQXZYVWNjN242?=
 =?utf-8?B?S1duQWFMOVA5RFFmR1VCOVdTNjhDaTlrMVJiK2Z0Yy9CYlUyM2RVNDZUY3Zz?=
 =?utf-8?B?S2RDa1FTbEVHazFnQU9kajN1dzk5dmhZVzdOUjcxbVlsMS82N3VOT1JtaXNU?=
 =?utf-8?B?bTdENnZ2cGUvVGFyaElQcFB6LzBxaGtTSFBVRTVnYjhnUUZlMW5YRko3MkVa?=
 =?utf-8?B?MTk2UFpRVGFrdG5hcGM2ZDJVaGRjYkhYRkVodjRFWU9uVHZoc2NhOVVyVWQv?=
 =?utf-8?B?N0oxZzlHTnQwRHVLNU1NMVplSWszSVNuMDZmbUI1V1dxZzlSTkpJK0daUDQv?=
 =?utf-8?B?dlZ1TDJLK2R3K2lmdVV0SGRmNkllUVRFdU1HN3U3VG5LMi9wMHEyRFFCZjE2?=
 =?utf-8?B?RTJzSUszdjlhdXlRY3ZDOFIyTGdvekcyWkdzQ0JPMGdQYjdENXRGYUVoMXRq?=
 =?utf-8?B?SE1uVmtxL2g1eDdvYit1QjJZdDV0d0dqMmxRRnV1bFdROVJlOEcyNTRoSHY2?=
 =?utf-8?B?OUc5NkVCQ1Y4SEJGL0w0MWhBVXFoM3RUdVo2a1RiOFMvVm9LVURpSUJXYlYy?=
 =?utf-8?B?YWhiS21PenhwR0pnS3BERFVRTHJHNGluNGpncVdEZHM2S0FjRFhSeWVYVlUx?=
 =?utf-8?B?eWl4eUltcys1MmhtTFFUZnRVR1pCRHhBZXFPdnY5UXBwOXAzYkxTQkZic0pL?=
 =?utf-8?B?Q3l3S1pXYjZZbGE1ODZxbmlIYkJUUi9taGp1RlN4Qy93MVRUbkwraXJrZktP?=
 =?utf-8?B?TkRiN3czZS9FT29ERzNkbXArMjBhK0xuMUNud2MzN01JUUoyRTVmNVFOT2tx?=
 =?utf-8?B?MjF2a01VY214a1A3emdML2pHUzZvVVBvbUVZN0FtRVFuZXR1WTBsSlNoMFhr?=
 =?utf-8?B?OVBYUjFoZlJMclErbC9oWndDQ0ptaFJicFdsVi9BdnlJSHgwakdYeEVLNllU?=
 =?utf-8?B?ZDFvQ0VweEMraUE3a0NnVWhCV01yVFpEKy9JZjZoSCswQ0VQTWpXZkp1aXhq?=
 =?utf-8?B?WkVhK3Q3OTRYMEhBNEFiRWxaeGNVNE4yS1pyNWl4NVJPUHNaclNtakgxYnox?=
 =?utf-8?B?Umx0Q1UyVkxicDRmUTFlenZlQzQ0bW5NL0M3N0FBeUsrWGQ2OGJlOTM1RER5?=
 =?utf-8?B?ZUJZeGdCMWNoOWt3OVNHZlR2NlhIUVZkaDVuTjNMT1JBT1R3ZVNJYi9mL0ZU?=
 =?utf-8?B?ei9Vd3oyVjRGd0ZHSGE1K0dVK2Rob0tvTFJtUFZXdVJsUFlvTjZzb3V2Ynha?=
 =?utf-8?B?SDRBUTErV1lXNU5NYVBPV2JpcDBjcWRLYUlhN0pTOXAvNE02YWZRc0VYZzhW?=
 =?utf-8?B?VnhST3plYmRpSWxBaEkzVGJHM1E1akxvc29Zd3BvTWYza2JZTitLTS9vbFJj?=
 =?utf-8?B?OXowcGxLQlpPdTVpSk1UU0ZSeVFnSEhVVjBrL3lUNjRrM0VOWUtYOGtzWUxa?=
 =?utf-8?B?clJvekhBNUNMS3ZxNTVVMmZFMXkyOWEwRVljV1JybjFjM3U0Ynk1aVpYSDN1?=
 =?utf-8?B?VWszaHJISTlVRXRwSXMvQVFYMStlQ1hNTWVyUUtLVjBPTGI1Q09iNWVjc2RG?=
 =?utf-8?B?WDlxemJHOWxpQmt2Y2JlKzRpb3R2UWlweDlBdllrZG4vTm1pUmJ6bVRhVzRt?=
 =?utf-8?B?RWw1ajlydGk4U3NQRDY3RitDUUVyMlZ2RDNBRG5jVGFaT3Z6c2t4Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c29b4483-db63-4723-d255-08de7fa19bb9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 19:08:41.4449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Gow9UTfJulQ8zRpSl2+4E7a3RjdmRH2uC1flxvLfC9XmIO7a2gqCcxv3zC57myabPEiUzvK+cmUs6LDcywEJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9121
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33176-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid,2.98.90.0:email]
X-Rspamd-Queue-Id: 7DFCC26919D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The board integrates an on-board mux to route shared signals to either
CAN2 or PDM (MICFIL). The mux is controlled by a GPIO.

Add a pinctrl-based multiplexer node to describe this routing and ensure
proper probe ordering of the dependent devices.

Previously, MICFIL operation implicitly depended on the default level of
PCA6416 GPIO3. After adding the pinctrl-multiplexer, make the dependency
explicit.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- none
change in v2
- update commit message to show why need update PDM MICIFL.
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index b256be710ea1281465f5cecc7a3b979f2c068e43..1341ee27239fd41a26117adc9023524ce50420a7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -50,6 +50,25 @@ status {
 		};
 	};
 
+	can_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pca6416 3 GPIO_ACTIVE_HIGH>;
+	};
+
+	can_mux_pinctrl: pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can_fun: can-grp {
+			mux-states = <&can_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&can_mux 0>;
+		};
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0xc0000000>,
@@ -446,7 +465,7 @@ &flexcan1 {
 
 &flexcan2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan2>;
+	pinctrl-0 = <&pinctrl_flexcan2>, <&can_fun>;
 	phys = <&flexcan_phy 1>;
 	status = "disabled";/* can2 pin conflict with pdm */
 };
@@ -712,7 +731,7 @@ &lcdif3 {
 &micfil {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	assigned-clocks = <&clk IMX8MP_CLK_PDM>;
 	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <196608000>;

-- 
2.43.0


