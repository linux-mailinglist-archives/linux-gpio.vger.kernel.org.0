Return-Path: <linux-gpio+bounces-31915-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJErKJWNl2me0QIAu9opvQ
	(envelope-from <linux-gpio+bounces-31915-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:24:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ADA163277
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31C6C303F7F3
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE87532BF2F;
	Thu, 19 Feb 2026 22:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PZKqbMdY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDC632B9BC;
	Thu, 19 Feb 2026 22:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771539843; cv=fail; b=RIaj8p+6c9krmMkyp/nQaRklTluvJot0MnCuNtLbU0xVD9T44JC7JJtpGi1AFY017luktpmbpHTB4Giysld06ftCjpMxZQMVTPMZynvspMxFMk6NKAOEq2pRsN/4PpZ6n9IKotM5vkhWDhGkYTnD5vd62dL9MfGi4fZRsFTL4Wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771539843; c=relaxed/simple;
	bh=R+sFjmiU24arthVzr8KSPc7GoQZUvHpvfgrliX83zYY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Th4lTBM4HCyGLaLzRNGY0zq8tWIcw6TzkPibiykeiybIn9TMuL9B7MAqKB1j+6/V57SkN0kMmNP2PrcQvXaBjEwODjqRHqlQiKQQ0Wr093cC8MzcoBqnTAceF6IJPfhAB1Jp12lkUkzABFQmWy0Y0y/U3ItMsh2iBN0EvC3jwZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PZKqbMdY; arc=fail smtp.client-ip=40.107.159.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBZd28aVuTTbco1FlQwmTSNCPjDQ5w1cIIVIE0rWdMR0AiAugIOpgpcr1+5LnG7Za/SGmV7kQh7zLB6TL7FKcgb8VpufW0FTqMjMyVUQ/a023UXnqkxmleXbg9AqSGM434tL/Zzvnv+1pgyOVjGlbKbSoCCP4xZcO0ntaWX0WqWPCzB58XlZgSViUxeUz7Q8hrLoDCfLJKMBlBGRN5yNJgFwVLR2WzJB76gm1f99eBPqU0azxVHpcH6Kjw9tbpgIxSL/DkadNhScYYdi4fpXJXhtD1HQ0+wCRiSPPYfGBkXNfurKpagrifT2enkbrkLfB/BuYZ/Yb5Zeask78uBtfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+scYNF5xd6xXB+7r0j5hCGjS868yaJZfaEBtEEMZbKg=;
 b=taZ7KG8yucUAN51oZ2SXzq5P8/jIqRbev5RI/rqHHiwxEGR12CzxrZVYAH2nkI7DGy80uL8P38wT5XaEoEy6JWfSed7KzxWsCmRAFeKSgjed8O6syNkQt1rQGc3sK34F4nfZwMQ9PEuSaUFfXt52mL1SF8NTKXXQMdsQSo+N9wTOHgdITXFdF+B/6Unl4fkA5wW6pXx2XgYPDCryoGdaQUX1EDWA8faXmKNzQcURXpQrwCRQmsL/FIFbeO49yqD14TgOtCzFGcgzzfZvrVuGtqQtj+V5xVEyGZjVY0g/zCvf8VrK2JiV/dFFtW3VCuUCEv8svd8uMGxwQYJqhoghcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+scYNF5xd6xXB+7r0j5hCGjS868yaJZfaEBtEEMZbKg=;
 b=PZKqbMdYJSP2K0CJ27rG+Sj67LFcy6KnbO4u1vKBWCNxZpsEIvYmXODDHk/2LaOkqzT6kBSGPC5M+F0JK6ebKKlWbT4LW8gHGCrpdbck1MpxjnCT3HIK9/HCLGfoK5IRJdFi0hLqVzRZSo0OMnmscuD8EZWFCsHB17AMEyLec5gXIJQLUFDUoY5RSaDsC4RD44f5vo+IVWICxuIXnwNBxuwkMUF4gvHmxWyfonp4XHZwVrhOl1pqM939iXKZV+B0l1lQq1jUIm7wIsLZDZJZ+nA9Gy9IdVdlQJgeL5ByrjRa8Z6aQkv1NNhyP1TPJHaaHA5d3FkDrP6nErAKSN4TWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by FRWPR04MB11281.eurprd04.prod.outlook.com (2603:10a6:d10:19e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 22:23:56 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 22:23:56 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 19 Feb 2026 17:23:41 -0500
Subject: [PATCH 1/5] mux: add devm_mux_control_get_from_np() to get mux
 from child node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-pinctrl-mux-v1-1-678d21637788@nxp.com>
References: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
In-Reply-To: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771539829; l=6437;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=R+sFjmiU24arthVzr8KSPc7GoQZUvHpvfgrliX83zYY=;
 b=bq9QcpC8vF765JWX2elUc7f8zclMQQVi/j/DFqNp2qgjXQdk7LduFuI2LSizmizsFuxkGdlTL
 YdTd2AhaZXuBbl3J4sP6MsH6BfLCCHn10i7ZZGQt1HZZOiFc5LG6rmo
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH3PEPF0000409D.namprd05.prod.outlook.com
 (2603:10b6:518:1::50) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|FRWPR04MB11281:EE_
X-MS-Office365-Filtering-Correlation-Id: 65072447-83a8-4222-bac5-08de7005921c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnloWXNxUFlodFZTRlpGNHV0VGFCT1J4OCtSRWo5ZWR3NzB2aTRVZzBMY3h3?=
 =?utf-8?B?V2l1aGZTeGZBa0FwWG40U3RkY0NXNU1qOGNYMWRrdU9VVGZULzBnNXY1QkdW?=
 =?utf-8?B?bUdRU2dxRXMxeEI4VmtKYkY2Tk53Y2FBUHdsN1U1VTVlbmVOaXhTY2NPay95?=
 =?utf-8?B?WEQ5bE8yUjlMUnh6a3RBQzZnMXhiUUNtQTNlR2tZeVduZUFSMmVQeDFOUFFR?=
 =?utf-8?B?UTVxa2JCN0FMUHp0Ui9VOGdNY3MwY0xENzh3OXAydk1xL0EveElya0s2RHpo?=
 =?utf-8?B?QmluMzZvNjNMR2xKSyt2bHNaekJIeGFmRVdBcVpDTXBscjZhU0RVK1A0M2cv?=
 =?utf-8?B?cG5sc0JqSmhYOE9URFlDTFBtZFdtak8yK1FsR24xeWZYVnRZdzNMTmhaS2Vt?=
 =?utf-8?B?Mk4vcUpRZG5BYjRsVWhXU3cvWWhnUnBHVmdXcnh5bWtUcWVLQzVvS2R3aXBV?=
 =?utf-8?B?dFdSWHFnWk94bHdUZTE4cGdmS3Y5WGRuQU9TVk9xc0J0N29tN3BNdS9GNXdE?=
 =?utf-8?B?b01YYVBEQkZhQVYyclUxL1NmaDhpUVNVTHVlejBwK0ZNdnNnNEoxTXMyUlZY?=
 =?utf-8?B?TW5JRm5JS3I0TDFybkZ6bjlRazBuajFXM2krdHN1T0RoNWpnZnlXSFo5V2Rw?=
 =?utf-8?B?UVlCR2xsWlNINEtSVHBkeHl0azlzeVBWZ2d5Sm52WTNtNzYvQ3YrMVY4Ylo1?=
 =?utf-8?B?c2hGQTBqcUZsdlpUeEczTHJHNDh5TDlXbkhjYVJFK2RzSEFIMnBzc09rZ0po?=
 =?utf-8?B?WnpiQ2NjbmV4RkhvcmhCSWpBUmFhNUJRRkg3OWpUN2grcGxWc1pabTd2RGZT?=
 =?utf-8?B?QjFoUncrdGdVbkJIZTZOaDNYZDh3U01aNk5BNHNHdUxCVVdBaGVPL3V4Vkt5?=
 =?utf-8?B?ZHpDQTdtQlNVMHNUY0RpR0hiQmlDNjJuWFlJSHFGbHF5VHMyTFhxUEFsZW1I?=
 =?utf-8?B?UG5JT0Exb0dXamVrc0I1eTh4ZFp5Zmk5R00xcHBiTjRWY1hWWUlZV1NxUFc4?=
 =?utf-8?B?UEJMelIycVc3MitOYSs5Vy81UVVXTWxCUEU0elBkV2xzNFlzT2VFbWkvdElk?=
 =?utf-8?B?dkZSKys1Rzkyd0lBcDVGVWYvazQ2U3k2S2FOdFIrVi9uZkJtcmRsREQzOFI3?=
 =?utf-8?B?WEgvTXh5U1N3Mjh6QmM3ZFVpdDBtTGxJZ3ZtNkVzT3FhVklNdXNuOTlRVkMw?=
 =?utf-8?B?bWgxazh6cS92Z3g2Zi9WanV1MHNLM25JcXZWL3l4c3R4M2pxb2c5Sm8yVkNN?=
 =?utf-8?B?cFhRa0x0bGlFODRvaTdFWkpxTVJVSmNLcUtrcnRhNDEwOXFmS1pYSGhBYjdw?=
 =?utf-8?B?b0N6QUQxaWt4dVhDUms4aS83a0lLU3JxbTBvZUVSbDlmaUV5TUxLYzV2NDVH?=
 =?utf-8?B?QXJ6S1RjWkI3WXFUZFhaK21wMTBPSGFsVkZLYzBjQzVCOXJEMzJCRy9DYXZJ?=
 =?utf-8?B?YmNCaTBxdDNBbGlnOEdpOUVEQldMeURIVzFpMUNLTWtBZHNUajZUNmN0aVNK?=
 =?utf-8?B?cjRXZzhHaXpGcld6WXM3NzRVT085enZqYlA3YmFwOHNSOHdPRHBFYlEzcTlT?=
 =?utf-8?B?Z05NeVpVS2VwcE1GYjZNcUQzODBsdUVOb1Rrb2dXcFNNQUhqc09DdUV5ME4x?=
 =?utf-8?B?Ty9oT0V0NzI2eTgydkZTazgwenBXaWFET0tQSEtKZFkzanFITkcxdlp2NjFz?=
 =?utf-8?B?TTRxNnBudFlkOTZ6Z1o2Q3pucERLUDFhdkR6eHVFNjVsdXFjVnpIdDN3dXRJ?=
 =?utf-8?B?WDFTdWkxOGJyWUVEMTdkSHBJZmlYOWpTakVjTklkN3oxM3BXa25Da2p4a1p2?=
 =?utf-8?B?eDNBdHM2SzgxdThFajhEL3QvRjhJS0Z1cll0QmlzRXdKNTJJQk9aV0R6cERG?=
 =?utf-8?B?TDc4LzZQN1FYM2k1aGVvenZOSUs0TzNFb0IvY2FNcEVKSnVlZW5pOTB4TUxR?=
 =?utf-8?B?b3dYZjlKVGFKN1hNWGdFRkgzMTNsWE8ybmdGd1FCdFdoeUdUbHppekp4VjMw?=
 =?utf-8?B?SGZvV2pHL3lIbk1DZEppUGQwcUlXR01yWDV5WjNWUDFTS1RFODZxaXBMY0Zw?=
 =?utf-8?B?aFVvbEN3ZFpFclREdURWYUxKQm1vS0dBS29VNDVSTDgwT2RNd1RDd1BKcmxE?=
 =?utf-8?B?L3E3R2tRZytpNjQ4bjhoUFdqVTBJeXhsYkQwdTBsZjdkYXVtODIrK08vNFcy?=
 =?utf-8?Q?NExBKdcGU+YwQ1vBYL877js=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVYxQTgxRHpxOTFWVTRoL1J2REFSSThZb2tGdk1HVFhpWEx6ZGNoZmd0TlZk?=
 =?utf-8?B?K1FweWVydXp5RTh1WmdrZ010aUJ6b2tyc0NXcTcxYnJVMzhkdVZvbTJ5N05o?=
 =?utf-8?B?RHgybW9jY0o4NHRCRWVURkRnSFJDVkFSY0t3d0ZBSUI4WkYxRnZhUHlPZnlV?=
 =?utf-8?B?UUtyNWxGcldLQmxZV25kck5DSENNWUdHTzdFc3pNS2dYNVpDbTlXa0gzb3JD?=
 =?utf-8?B?YmJWZXI2UWMyU2xkL2VsOUVEbFVPMzYxT0ZxTDdtN0FDa0RhbEFPTFBNc2VL?=
 =?utf-8?B?b0VPVmp3WEZVMGprOE9hSk1MYlQ1MGFKdDQzYmJ1Y1c1cGxmOFZzTHdiQU1K?=
 =?utf-8?B?ODFRdUJkdXpHYVAyU3dtekJMbk9vU2kzMUZTWDZ1eVBQcDlPTnlMUUVjOTBy?=
 =?utf-8?B?YjBDaXIzRFE4Nm9PaDRha0VHTEw2ZjBsdVEzU1NQb2dNR20yQTNONG12RUdr?=
 =?utf-8?B?Z1lUeGlja0dML0xQY2wydm02dWVZTXhFcU43Z3JvTS9EWTR0N3pYOFRDVHEr?=
 =?utf-8?B?YkdVVkg2TTFNNjJOazVTV3YxVWt2UDlHeEIwS2V3ZUpaMUlEbDMxdlArTG1r?=
 =?utf-8?B?SGVyTSt5NzdEa2x6T2FLQlhWbU1OVlB5Y0V6RlBEZGJGMzJEQ2pKeFo2Ymgw?=
 =?utf-8?B?N1ovNTkySC9SR3Y2VmZNYkRkSVI2QXNtQmNRQ1puTUx5c1U0UzE2SjNQYzhO?=
 =?utf-8?B?WnZJZ0VQa01lL3ZtWElubml4ZW1rcXdENitWWmF4UzUxSGhvZ2JRSWJzMlZB?=
 =?utf-8?B?Mmo4Vmt1RzVsdnpZV1BrTnZiV1Eyc09nQjZKb2toT0NWSlRId01FenNGZGsr?=
 =?utf-8?B?VmJKclJKeGZNU3RRSGdyOFU0TUU2RnNQMTZCbUNhL20yZ2dTZkswamZCekdj?=
 =?utf-8?B?dFhPSjk5RkFzdUFyVCtNRitLOFhuMGhEWDFUcE9uNFhjS0ZZbWRrdXUvT1JI?=
 =?utf-8?B?VkhzeE5ueUxpWEdjYWs1UitVNmRTcW9rZnlEeTFGVFFtcFdyMUVDOHpBUEpU?=
 =?utf-8?B?THkyUzFuQ1BUaitLQkFCMjlwTERsMTltbWNueHNIOThHOFhZUmdDZkN4dGs1?=
 =?utf-8?B?c1pkbEM5ZkNVZVh5T1puS3FicHJSL25mR0dKU2VTdFMvRVp5S0tWK0xPUEhP?=
 =?utf-8?B?czdFcjVES1RNVnZKS081VmVmajRzTy9hQ1I3V3NTUXA2QVhVMW5ybEZMN042?=
 =?utf-8?B?L0l1SW02cmhRQ1M2cUpjUW8yYXpyb2U4OHE5dWlPdmhlb3VidS93UjRPcWZH?=
 =?utf-8?B?dXJnUVVpbWpnL0hxMmdTaVNCN3B1TGRaY1pyZUJ5VUR5cDEzUlBHdW9yMzBm?=
 =?utf-8?B?cnhzei9kMTJnZzQ3SUJTVFF4a3dRMW43WGJXRk9mN0ZlQmw4UlRvbk05Misy?=
 =?utf-8?B?S0ZhNEF4ZDEyK0NkOUUwNExJRjdCeWJoV2N6NGYzakxRQ1orMlRRZmFPcDRz?=
 =?utf-8?B?Yzh2azlaMG9VUXNsSnFhVHZZaDNaT2ZxQVZ5NWJUV1FWdU1sYXYxZTJRd3dH?=
 =?utf-8?B?RkdQbWVmSkEyWHZzYi9kWkpwbjlHL3NTUGNOejZLVno4SDlZWGtaUklRZVZN?=
 =?utf-8?B?K0NWdXc4c0xhYmIxTzdiNkhHWDRML2trbXVRRzlGTU9EelFmb0lPYVRwRDJ5?=
 =?utf-8?B?akN2Q3NybzA4ZWZFb1B4TEI3ZFJidEY0M1JsMVNMYlNWbXAzVy8yZlBPT0JG?=
 =?utf-8?B?NEZGdmQwLytxcTJoWHhwZDUwMEhmYUwrb1pzVjRTaFdpWURKM0lWZXE2bGtq?=
 =?utf-8?B?REdzWFVqTWZrVUx1VktGNVhaaE9RYzMrcVFoRUFmWnZuYlloTm9MamVoeHlT?=
 =?utf-8?B?bU1vSUpCYm83bXdyVXg2QnJ6QXhJT2F0WUZmRllYS3hsL1Q1OGFISVF1Szh4?=
 =?utf-8?B?RUxJc29pTGFYa3lIMzVZRGhBUDhUUzZPQmRmU1FheHFCVnRGdUd5TnhpcTBV?=
 =?utf-8?B?VWtlRzY2bVJYTkRBb0J5R1BrZ2F4dFJSZTJmNENIeXZNaGw5b0NzekEwNmRV?=
 =?utf-8?B?djVqN0lTWUt2dmNINWhBeG93bFdBOTZMQzJQajNBWkJMdHhPRk1nM2RhTkpu?=
 =?utf-8?B?clNWeGJJZ3hNcks0YStKa20rNytxMzZNMDNyNGo4cWVGRTlYMUVTMmFiOWFR?=
 =?utf-8?B?aUFVemtiR0FmWThaRE1rWUZMZi9IMmh5L1U5T05DeHp6VGxEODFyTGpQaTVC?=
 =?utf-8?B?b00rZVBOWEtzRktsU1hGcmQ5a01oZ2N3a3psZmZuOVdHOThteE50bGNSNGRN?=
 =?utf-8?B?L0E3NXJ2WHFseWRGUnhhZDNia1BReWxkTTZiSVJrRGxkL3ltV2xJQXNOTmFt?=
 =?utf-8?Q?6oT+uNZda9/P59H+GE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65072447-83a8-4222-bac5-08de7005921c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 22:23:56.3485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3FBcQwi7oLrPovjdcCB/8ZrHtsnCw6xujj4O+JZzlaAkYDkcyOKSOthEfYGu4DaIOehv8zGAac1Wln3I+Ef+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11281
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	TAGGED_FROM(0.00)[bounces-31915-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 31ADA163277
X-Rspamd-Action: no action

Add new API devm_mux_control_get_from_np() to retrieve a mux control from
a specified child device node.

Make devm_mux_control_get() call devm_mux_control_get_from_np() with a NULL
node parameter, which defaults to using the device's own of_node.

Support the following DT schema:

pinctrl@0 {
    uart-func {
            mux-state = <&mux_chip 0>;
    };

    spi-func {
            mux-state = <&mux_chip 1>;
    };
};

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/mux/core.c           | 40 ++++++++++++++++++++++++----------------
 include/linux/mux/consumer.h | 16 ++++++++++++----
 2 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index a3840fe0995fe0125432d34edd8ab0f2cd1a6e9a..bdd959389b4ee1b0b8a7367fadf2c148c8f2f0b1 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -522,13 +522,15 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
  * @mux_name: The name identifying the mux-control.
  * @state: Pointer to where the requested state is returned, or NULL when
  *         the required multiplexer states are handled by other means.
+ * @node: the device nodes, use dev->of_node if it is NULL.
  *
  * Return: A pointer to the mux-control, or an ERR_PTR with a negative errno.
  */
 static struct mux_control *mux_get(struct device *dev, const char *mux_name,
-				   unsigned int *state)
+				   unsigned int *state,
+				   struct device_node *node)
 {
-	struct device_node *np = dev->of_node;
+	struct device_node *np = node ? node : dev->of_node;
 	struct of_phandle_args args;
 	struct mux_chip *mux_chip;
 	unsigned int controller;
@@ -617,7 +619,7 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
  */
 struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
 {
-	return mux_get(dev, mux_name, NULL);
+	return mux_get(dev, mux_name, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(mux_control_get);
 
@@ -641,15 +643,17 @@ static void devm_mux_control_release(struct device *dev, void *res)
 }
 
 /**
- * devm_mux_control_get() - Get the mux-control for a device, with resource
- *			    management.
+ * devm_mux_control_get_from_np() - Get the mux-control for a device, with
+ *				    resource management.
  * @dev: The device that needs a mux-control.
  * @mux_name: The name identifying the mux-control.
+ * @np: the device nodes, use dev->of_node if it is NULL.
  *
  * Return: Pointer to the mux-control, or an ERR_PTR with a negative errno.
  */
-struct mux_control *devm_mux_control_get(struct device *dev,
-					 const char *mux_name)
+struct mux_control *
+devm_mux_control_get_from_np(struct device *dev, const char *mux_name,
+			     struct device_node *np)
 {
 	struct mux_control **ptr, *mux;
 
@@ -668,16 +672,18 @@ struct mux_control *devm_mux_control_get(struct device *dev,
 
 	return mux;
 }
-EXPORT_SYMBOL_GPL(devm_mux_control_get);
+EXPORT_SYMBOL_GPL(devm_mux_control_get_from_np);
 
 /*
  * mux_state_get() - Get the mux-state for a device.
  * @dev: The device that needs a mux-state.
  * @mux_name: The name identifying the mux-state.
+ * @np: the device nodes, use dev->of_node if it is NULL.
  *
  * Return: A pointer to the mux-state, or an ERR_PTR with a negative errno.
  */
-static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
+static struct mux_state *
+mux_state_get(struct device *dev, const char *mux_name, struct device_node *np)
 {
 	struct mux_state *mstate;
 
@@ -685,7 +691,7 @@ static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
 	if (!mstate)
 		return ERR_PTR(-ENOMEM);
 
-	mstate->mux = mux_get(dev, mux_name, &mstate->state);
+	mstate->mux = mux_get(dev, mux_name, &mstate->state, np);
 	if (IS_ERR(mstate->mux)) {
 		int err = PTR_ERR(mstate->mux);
 
@@ -716,15 +722,17 @@ static void devm_mux_state_release(struct device *dev, void *res)
 }
 
 /**
- * devm_mux_state_get() - Get the mux-state for a device, with resource
- *			  management.
+ * devm_mux_state_get_from_np() - Get the mux-state for a device, with resource
+ *				  management.
  * @dev: The device that needs a mux-control.
  * @mux_name: The name identifying the mux-control.
+ * @np: the device nodes, use dev->of_node if it is NULL.
  *
  * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
  */
-struct mux_state *devm_mux_state_get(struct device *dev,
-				     const char *mux_name)
+struct mux_state *
+devm_mux_state_get_from_np(struct device *dev, const char *mux_name,
+			   struct device_node *np)
 {
 	struct mux_state **ptr, *mstate;
 
@@ -732,7 +740,7 @@ struct mux_state *devm_mux_state_get(struct device *dev,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	mstate = mux_state_get(dev, mux_name);
+	mstate = mux_state_get(dev, mux_name, np);
 	if (IS_ERR(mstate)) {
 		devres_free(ptr);
 		return mstate;
@@ -743,7 +751,7 @@ struct mux_state *devm_mux_state_get(struct device *dev,
 
 	return mstate;
 }
-EXPORT_SYMBOL_GPL(devm_mux_state_get);
+EXPORT_SYMBOL_GPL(devm_mux_state_get_from_np);
 
 /*
  * Using subsys_initcall instead of module_init here to try to ensure - for
diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
index 2e25c838f8312532040441ee618424b76378aad7..6300e091035323dd6158d52a55a109d43ef120aa 100644
--- a/include/linux/mux/consumer.h
+++ b/include/linux/mux/consumer.h
@@ -56,9 +56,17 @@ int mux_state_deselect(struct mux_state *mstate);
 struct mux_control *mux_control_get(struct device *dev, const char *mux_name);
 void mux_control_put(struct mux_control *mux);
 
-struct mux_control *devm_mux_control_get(struct device *dev,
-					 const char *mux_name);
-struct mux_state *devm_mux_state_get(struct device *dev,
-				     const char *mux_name);
+struct mux_control *
+devm_mux_control_get_from_np(struct device *dev, const char *mux_name,
+			     struct device_node *np);
+
+#define devm_mux_control_get(dev, mux_name)		\
+	devm_mux_control_get_from_np(dev, mux_name, NULL)
+
+struct mux_state *
+devm_mux_state_get_from_np(struct device *dev, const char *mux_name,
+			   struct device_node *np);
+#define devm_mux_state_get(dev, mux_name)		\
+	devm_mux_state_get_from_np(dev, mux_name, NULL)
 
 #endif /* _LINUX_MUX_CONSUMER_H */

-- 
2.43.0


