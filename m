Return-Path: <linux-gpio+bounces-31919-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPgTL+WNl2lv0QIAu9opvQ
	(envelope-from <linux-gpio+bounces-31919-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:25:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F27E1632CA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1A9E30789DF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9483101DC;
	Thu, 19 Feb 2026 22:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K/iW9H3a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013036.outbound.protection.outlook.com [40.107.159.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B7832C312;
	Thu, 19 Feb 2026 22:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771539853; cv=fail; b=b6eYIFSHYs0V7tNFppwSxa6GIPVjCMgdPpcZ6v2Zo46fvHSXxVO18TqEuWOM1PHigReaElodroA8DahtKSeF67b33saQjd2bmEvLEdBu2HdXL1vkR3SH0I87siGYDsT/T2yNGrsveIz4jkaMgMIIJmMM0S8sEAjq+t3t5czwpgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771539853; c=relaxed/simple;
	bh=Mrv8690NFbwq9YfxxVKxVjG1LaSA8D856X2XcXjhNwk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mMjvjUfQGGV69lUpvGs6rVAJ83KfnDeU5N1OxE2lDROkgXDEKZjqE2r6i/OIJy9LR60ljRPAnW8+U6nqk9avD6VMCnwOMx+tzwkwwDMnaWWiRyCX6kLSp07wAXA+pkJSUqtpPzEuLsd0mIZue7b5OvOwqG0zmeWwXlGXgaGG0hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K/iW9H3a; arc=fail smtp.client-ip=40.107.159.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dw3Tu1x2/AthWKEpOvzTbZuzGYX0uIrUVMjiJShlzfS117jfQNaBnoDMSKyjG/JEQ8RDZewtskT/4tGAFnE4Bq/4Gon1FLD8K/zH90wViuLaRLUjw6/F4Llg/45olduoMj/XxrQmxfXNRkOwKpRyXOqp/THFIGM+nJtXR4TFGiJKzOtBqKYPGMcRu47a2D2FEew8Wuuvnj5sk0yGp9fPPh2IuyWol0yQMKDHjlL9DlZ2ICxOoAeox+3W4DNs9RFqvfRDxHnnx3APymQ9jMu5tyqI0kuOLoov9BJ/QsMtx7D3MwHxNOyv46ZrCy2sid3rGgcEC17ybAaTZfi0HQmMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAZEuhxh8s28UGQs2QC8rTuQc3uiuIlfeoBBY97q8+I=;
 b=LINX+LNXJxEK0Z16l9Vp1k1C+qbMkUTOZgPh6Khx/rua/zImO9bF/nYf8KmpsBeXMpdhd+QhN5b+vDvQfCuKQoS4NhzWhI708VOyMph7v+Hd73/Sffx+wyVPULSlwi3oNAlYd+yvJ7/+ElXtIb5e6MKYkZZ56jmVjZmu0v6TcLbfd+LrJ+ZTjlc3DWtbCo8yTxBdMlO0Ox4qiwdw7MwEcaYdTBefzMTTPbmJIlI8HWAJOk0Vbvt9VBa8XbpfMKfOUURKWOBgmdv5R8WAmK9Y2xVbNsCu7h52Kpe/KpihfYSyvXVVXxt5n1Ra7EOqZElZeX0VaAWxz4OHVwm6ds+VmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAZEuhxh8s28UGQs2QC8rTuQc3uiuIlfeoBBY97q8+I=;
 b=K/iW9H3aW6YaOQb+ytmWCy33G3xD6J/zzlxM4FyoaH5CJFGVodk5cDQLv5/xwkTM/nx1opPH9csC5yavYrxGMhrSDqs+XgeGWs1RFzVhRRf5TI9rOiqzFC7AK7ahz5ifAumu3k2nOZgV888M+79M8FBhTDa76AWQDbhhyNMPOMbvD3y5g5rS1Yn8FIbiLMBCxO7pShqnKWCO5gLEru95pD8EbOK2dS//lYMAgE+TXSBxpIxWvPqQEG4EuucoMCs+t9VK6ET7rW7H4CDN1vz3ozZ2/GzxE3IVA5GXDlrhu2YgI/wBhC5nYILwlEme1b2+Kh3kLchTqACwV8+Cb8XhNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by FRWPR04MB11281.eurprd04.prod.outlook.com (2603:10a6:d10:19e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 22:24:09 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 22:24:09 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 19 Feb 2026 17:23:45 -0500
Subject: [PATCH 5/5] arm64: dts: imx8mp-evk: add flexcan2 overlay file
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-pinctrl-mux-v1-5-678d21637788@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771539829; l=1688;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Mrv8690NFbwq9YfxxVKxVjG1LaSA8D856X2XcXjhNwk=;
 b=QgIzvyWNyyWe8JEHU2GLl2f855xvRxTTRyFY5rxL8BcjM4sDouFWgXt6DrKZdZPU+XylZosa+
 RTWzSYoZ7oTCJDhVH+0hcIW1u6iFEwA1RkmnQFEoEO0BhNOkBPaAIUc
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
X-MS-Office365-Filtering-Correlation-Id: d74f02ec-e9d0-4514-c63f-08de70059a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWc4V3BueGVZZTg3VHIyM05wWmg2VE41T0VBV2lQQisweHdzTWVyZzRMZ3hX?=
 =?utf-8?B?dFpPaVp3TzZ5TE44L2U4T1NKbE1TUUhFTmVHdFo3WUNDaXdlb1VZbnJpSml3?=
 =?utf-8?B?Tmp6bFRrUG02Um9wSjhGdG1sU2hTOTNCMldnYmEwQ0pJN0RUWmwyMkJVUU1Z?=
 =?utf-8?B?TTlwZkNpQy9JSFBoK3B2dlBWMko0cUt4Uk5aaUY4aGx6RkJINkZVZ3VRVTk3?=
 =?utf-8?B?aFJXdUp5aHN2dGs5TElRQTVGMXlIMFZ0Yy8rWUREdHp1emt5ZExiM1QzalMx?=
 =?utf-8?B?K294bzFFWmFLakZJMSszRU1GNXlsLzlUMEdTNFpTREc3WDhTUmRwaE1mdFVt?=
 =?utf-8?B?VXU1dnVuMkw2V3RLT0N5WjF5cUo2Rkd6bmZEUnhsdFN2a2R3R3JJN3ZWdjZ6?=
 =?utf-8?B?V0dwaWNCOHB2WjRWQk04R2dubEVTdWVBSERSSzdNbHJ5MmN4MmVnZDZnb1pz?=
 =?utf-8?B?RSsxUVFGZFNueEhKVmxqWmxyNC9Tbml1NDZkWnVXZGdLczB2MEIyejhlRW5w?=
 =?utf-8?B?WnN3dXcyT3poaFp5M1A4aEtybk81Yy9nZGhKOUI2OFBqWmxuUFlWa0dLY1BI?=
 =?utf-8?B?dVZUTHJCb1ZVSk1TQ05Wd1VtcWZBazJXTmZtWTNDTE01Sm9Odm12Yk5oRWxn?=
 =?utf-8?B?Y1BiVnQ3MEhIR3FsLzhWZEdpZ09GTUh1OHU4dkRQeEY1VjJIbkpDNVB6VWti?=
 =?utf-8?B?UjhIamJra0RtdmN2N2JhK1I1T0xQTzhyZXhXdm1UOHlOdzczdUtqV1FUTDhH?=
 =?utf-8?B?d0V5bTFnODZaUHlveUhuQ0c1V0JOWjMxbGpuVFQzWml6eFZEcG1wL09ubUdB?=
 =?utf-8?B?SDEzOFZUYUU1N0o5YTg2ckI1bVQ5dmNKREo4dGlCY2dxSjZ4MHdEMUhiT2hL?=
 =?utf-8?B?dThPZkphNnZlQnJRekRFNEh3aHBaVjFzZWE1VDdUbjNPajhNTFdCajd4eVZB?=
 =?utf-8?B?RnA1UDgvT1A3RFVqNFlsVW1FRjlmSFl5Ny9uVGg4Qm54a3RYRnNxNzlJRXJh?=
 =?utf-8?B?U2Z2K1RLMnNXNlZoQURDWGhDWkFGQnVLU3I1bWZzYzAzdjBCdVNBU09UejVT?=
 =?utf-8?B?UjlUZ3Z5U0JId1NZc1I5bEM3MUJqNm51cU5FRkY1Z21GSHBkMHlGa0czdmJG?=
 =?utf-8?B?d0pWWklrUUovRE5FZlhFRnJQWDJoZXFYRThLaEdHWFZpR1dvQUpDLzVTVDMv?=
 =?utf-8?B?WHh1K2hqT1ExODRtMUIrei85cFFlRE93Wlk4dGNsTXJhUm5lMVpzK2Vjelhm?=
 =?utf-8?B?U0U4dUJSSG53eW1WY1NxY09wNkRPcDRIN21BMEZWK29wMDZ4Z05CbDBTWldC?=
 =?utf-8?B?TGxqZEs4Z2IyWjhqNmN0cS9HZDhqTHdDWkJpL0cwYkJiZjJkeWtUU0xaQ3Nv?=
 =?utf-8?B?WFRBVk5EVGVDN1VTQ2tMRTNadDE5N3ZqM2dydmVKK056eHI5Wmh4dmorUW5o?=
 =?utf-8?B?V0orVzk1TzBNRTRCSE1uYXFoRHc3SlZkc09zOEF2d1NOazFuaHhmYlhneXp4?=
 =?utf-8?B?aGpYMTN5L2dhLzRtdDljRzZWMmxLeU5FM010WkxoYmxpcVVnS0Zocjh4Wngr?=
 =?utf-8?B?SGphQ3MrNUFnVFJXSGFoWTllREZpcGoybkE4OTlIWWxxeC9adVRDMVJGN2Zn?=
 =?utf-8?B?NTlrYysyWTJadmJOU1hSa3BPTnlveDQ3ejhwOVVmWmU1c0FzbWpkMGtzTjhu?=
 =?utf-8?B?aFNLeUlkTk5WM3NvKytIZUJWV3k0OStrbUJWSWhrRGxXMitUZUpjOVFqOEZX?=
 =?utf-8?B?VGR0K0k0ZWhHcVJ3eUZybGdzU0xtTlNqZmRUQlljVnFwVlYxUHJ5WHNsK3Jm?=
 =?utf-8?B?cnN5RWdBRUFkRllrSmMwNktDN3pnRGkwdE1aREwyZnBocnVPN2ZFaUhhY0hV?=
 =?utf-8?B?a0Z0R2J6M3RRY1p5b1BoZHhadlBYZGIyN1ZHTXJMVS9wbzdKbktCMkcvN0p5?=
 =?utf-8?B?Y05maytTZ25WNktCa0FleTJCU0cxdGRYWjgwbm54ZmFaU1NkNThzM3AzM2Ir?=
 =?utf-8?B?V2ZBOXMzTXdhVDd6MHJmMkVDSVBRR21MWlNCc0ZscmdwRFZVUHQyUW01ZHNB?=
 =?utf-8?B?YWNYSjZCeklqdUxGSjQwbjkvZDdHa1MrNjV3ZnRIdTBwTUdPWEVxODNDVVFh?=
 =?utf-8?B?V0xEWnlIZTViZUsyK3FLVnVnOE42MWs5VlNQbkVMQzlTVE1oMDFwUWczTEYx?=
 =?utf-8?Q?ABUf7Nhx6QiaN3tfM2rh+xY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3ZwNGxiUStMZzNiSFdxVThwYUsvMzRyNnorY3I0d29GVi9OQUExWkJlUGw0?=
 =?utf-8?B?QXNwdnFsYWYvRFZhQnZCTGRvSDc0REsySlpyTVBFOGwvNnhSRHlIMHppd0Q4?=
 =?utf-8?B?cTRrb20yVW5tb1ZwZDFFSWo0L3RoNGpNKytrMTJyL3BHc1dJM0h3enllZmx0?=
 =?utf-8?B?dUtRMWM1SXlnYXRmWjdCblhQanNuUHkvNk9UNm0xeXIzWDdtL3BkamY0RHJS?=
 =?utf-8?B?MjdKUUhEWU81ZHNiczRjandDdkhTK2hkSUl5SVVlY1ZyNXFoTnhXb05iRzdk?=
 =?utf-8?B?SWFveEVlQ0VlMjU2cWFqTkpnVWMxSDlQWUZUUHIycTFMRThKcHBlZFRkejRv?=
 =?utf-8?B?eklDa1dOMng4L0ZwUiswaytPVEh5d1N5dTVLczVxbVpLSCtQVDhjalFNRHFz?=
 =?utf-8?B?Y0M0Y1UwS05QOUtOMHF4M0lmdzFVZlZSajgxN1Yvd1F6K3E0WmkreGI3QVZE?=
 =?utf-8?B?ZStITVlpaWNLSHA0NEhQazlTZGE4VWlTVDVUSlBmdmVkV0NaeGd3YTNYRlFJ?=
 =?utf-8?B?YUFTZHQ2SlNKbTluMzFDNVlwZS9xUkJ6dHVTa1pFQWU0VExJMlVlMHUySnVw?=
 =?utf-8?B?MTNjWTA4UUdmRGpLY29sWWFDcVhqeXdVNU5xMlpLWWd4WWdIYWFUeURqNkp2?=
 =?utf-8?B?ZWc4TXR3WURqVTByNVdkc2k3NzIwZTVHVStrMGFJbi9vSCt6QitqL2ZVUnpY?=
 =?utf-8?B?NXhVMmhEMWlDdTFLSGpYcXJrMGZySEdhVWZpTjdHcjB0akZiSzF1ZCs5Slpu?=
 =?utf-8?B?WXJOSnAybUVKWncrTUQzYkN3Z3R0SHRIaUJCWUh5UjJaWFNlcldvdDZIYmtl?=
 =?utf-8?B?bjFtNDhvcGE0cjJaNk9LaDJPS1ZwajVxa1I2ZmMrMlBqWkl0TFRkTml0blly?=
 =?utf-8?B?RXlkUGQwRG5WZ0JvMkxKZ3lISFJIZFRoc1hTeHBESm1WbHU5ajNlUXNJck85?=
 =?utf-8?B?ZVhaYTRDaG5LV2ZmUnpwVVBIYWgzZ1RXeXQxODFIM0tHUlNwL1J3MUY3aHBH?=
 =?utf-8?B?ZUwyZ1dWYUd5L1FLcnJ3eFdTMDBVVnJMc01vazZZOUExNmk0YS9FVGFFOW9h?=
 =?utf-8?B?MEg1MG5FdzhTVXQycFpsdFd1cWxmblZsVGttOXlDZTlxYTQrKzlhRUlFMjlG?=
 =?utf-8?B?bm92Mm9rSXZWdjhMQ2lMbEgzamdBR2gzaUhBUFBySkZFeGI0QkhaM3JUS1ly?=
 =?utf-8?B?ZUdMTXZVeVdHcFo2QndmYjVKVHdXTUNEbGdGRk12YmZ3M3RNRDVxUmNVcWFu?=
 =?utf-8?B?R0xxYmN4NElEdGxWQVN0RTNGK0V4YXc4aFpPVnhLL1dOTEVENCtpU3hGOEIx?=
 =?utf-8?B?VXRWaGlTRDdCU3FCcUdZVFVmZ2pEMjA4K09HbzNndEN3My82M09zdUdJa0lh?=
 =?utf-8?B?YzR1Y2FHYldyTDdnWlVaeGRjaXN5KzM1NnBYV2laWmlUSzJMNG1xYTRwMlZr?=
 =?utf-8?B?M2d2YXRZY2QzV1N1OFRCcWtaWjg0MVovbUpiQnJzaVRDUWRpSWZvZDNQUU1Z?=
 =?utf-8?B?cHhjZmhHUmhNL0Q3ZzcvUlFqSGkrVlg2UnBOdjVUU09MY1U1a0g5U3dNTWl4?=
 =?utf-8?B?UlRTRWFuTTQ3WTVIREYzcGgxV0hwNi8wTHhJVmlleE92M3F5Mmd1c2w5aEVk?=
 =?utf-8?B?elBUWFVZQ2F6TjVRWXlmaitCaERkQ00xSGVBU0t4Y0pnM1p3aGZieEJkeUQ5?=
 =?utf-8?B?ZUs3ODVHc0FiQXRzc2FIdy9sb3JLNWJKZGRqMGF6cTZYbWR4ck14bjFHRzNs?=
 =?utf-8?B?bzhRS3FPMkRDaW55Z1J3Z2Q2OWxPNFNZTmdYYUJyTzFxa09IYWVVVTNKd3Jm?=
 =?utf-8?B?NXRtWVdWdWpEeVZVajlQelZoWnNIemlpTHN1d1hoOHBkZFRDaUphU3Z0NVpr?=
 =?utf-8?B?emRlWUc3UitnYzFxMzYrQU1LSmZDT3h3bXVYYjFxOFh2SU9TRHVReDR1R04w?=
 =?utf-8?B?YlpyZzJCVWJsM1N3aTZ3MVA1UlByQmc0c3AxSkJtNU8vOE9wQjA1S0p2N1h2?=
 =?utf-8?B?MXdYb2x0ckZVNEtodnlOdlNZZFo2cWdXMkV6ekppcGUzd2tuNUxrampDaEls?=
 =?utf-8?B?V3pVdm5ISko2aWlRckpBQ0xKNkdDczlqeGF1M1ZLak84QlBKMXZYRGYrekp2?=
 =?utf-8?B?WUdhbWdDNi9lelI0dGtXWXkveitYRlNkenVXQUJPT09OT1pSemdNZWdqUCtU?=
 =?utf-8?B?WHpZWS90M05nMFRHV1hoWW4rOHJJdnlyVjdDSVhsNjBYcFphV2RwdjNzZDRn?=
 =?utf-8?B?dTBEaFN2RUpXNFhPeHI4bnVaS1lobTRENFJHT0RDUDloNHBLOUkyYWpMTmo5?=
 =?utf-8?Q?oADig2NysHuF4xBUI4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d74f02ec-e9d0-4514-c63f-08de70059a2c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 22:24:09.8464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gxm3VcIFFeVlFncq3AzhFICo+96gr716vkaUSuId/QPdb3qFeao/WBcw7kJE1J99vMSGiYt5au9DK3Pjez0hWg==
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
	TAGGED_FROM(0.00)[bounces-31919-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 5F27E1632CA
X-Rspamd-Action: no action

Add flexcan2 overlay file, which enable flexcan2 node and disable micfil
node.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile                 |  4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 700bab4d3e6001fe6cf460fcb09cfe57acc77e36..bd377191a68a6167d5f9a65184d19c789a4223ee 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -233,6 +233,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
+
+imx8mp-evk-flexcan2-dtbs += imx8mp-evk.dtb imx8mp-evk-flexcan2.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-flexcan2.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..f7d2674c45f72353a20300300e98c8a1eba4a2a6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&flexcan2 {
+        status = "okay"; /* can2 pin conflict with pdm */
+};
+
+&micfil {
+        status = "disabled";
+};

-- 
2.43.0


