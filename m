Return-Path: <linux-gpio+bounces-31290-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKGqFQpAe2nECwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31290-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 12:10:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 031E7AF70A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 12:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 697C53005A99
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2759385EC7;
	Thu, 29 Jan 2026 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BRY4tn3P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010058.outbound.protection.outlook.com [52.101.229.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A128E3859C2;
	Thu, 29 Jan 2026 11:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769684997; cv=fail; b=LZJwnrXX8whDmbl+cVzu5lre/vZDT06h+XutgnDiy5HpX2LTBSPDScnVmqV+oCZSCuEJ/K3C5RN/cODATN0w3ge4aGh4XPDqprOjlhk+3YnAW4hVUaFY/2F9yv9xG8OTsVWqqCwf36gRwhzRd5Bgd+KFcbs/7PVtSp27PDXVG0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769684997; c=relaxed/simple;
	bh=fMKvBcZnwNOn9hYwVNT1R8B/k9f01As72QLNc/xdCXQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PDRJpqsmAwVo2Z/rBnOYVxqd15AlSzbHJvagDMR+IO3k+w7nJd0yM0Pt9kyO1pwh9x2twg0IbaL9wX4ebF/gndTZUG3nHzc50/k0QvEl1h0Wfl/BUHWhXO4MiHQd/HIoJe6ACipPnx69GJWuoJ1Z5ax2XkUYUC1un4hv0SDWh50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BRY4tn3P; arc=fail smtp.client-ip=52.101.229.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcpnIeiNXLnDsHJofh/nKb/YdRgFAjPNIKQ4YNH1R4D5yan/G/5Bi/hnVNMxyoW+j4RrHP9iXb91yx69aws/X59dcwBOpxkkOd5hpLihAMmXGJRv3+Lr6bVZa2I3dhKtvI1sf6/swvZOCRl40W35u9bI8VWSZnopMCFeyLuWfmmYgdeXqqkhZYVLJoTkkri9jGg7zQ1lsyrpFnXOTxFeWe3+gFS8doQDbkuYYnJVsThEYorI1eBsZE89aVpqywSmvpAVyrQ2qxV55t7t1uPcFh2M1rGPgheIa593QH1tCPwHWz4GvR0U4JIPoxN/YyohUyCn4Ybk199rlaUuLIYSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMKvBcZnwNOn9hYwVNT1R8B/k9f01As72QLNc/xdCXQ=;
 b=QzDIqckn/Kaazgcxk7RZsap48vjeLxf68ag04KPUPmY5N8UDUmhF3ZLbPD1vOTEdQnU72RAm9EybIcNesy2TriHLOUHGFR3NtYeIlGXRJsGjDVD+Q7/NB0cEezFnweU2YDg3Xlw3Sn2QUnusAnMKi/WE2Mfv1fe/5fTii/BxnJTsmQzRpfraVke1Q6DjXuSxqCNr/vVd301Sh25Y//waxBcAaQl8vWZeZ1jgaMwNNpyQKkleOd1YXSE75QoCpwZr9IBz+mr+uz/+O/Xoza7MAh6noruMNWcsCCh1X9O1y/ZcY/Mb0+JYoRI5z3ZlrWfvXMKWgwDYUMd7SwOZOtHyXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMKvBcZnwNOn9hYwVNT1R8B/k9f01As72QLNc/xdCXQ=;
 b=BRY4tn3PHpV6VXODLF2MDkhJn0bZR19LCG88HWwpb6zhcAkCjKJj4WTMtpRiKHxPudmn0kKY1BVuaD6PJpxiqvc9+oYTy0s940DAsu3WFl1OU1Jq2R9K+IxfaBdwan8a6k/uKQXma7llEA1w2XrkA9B2Zt3VMOjAWrBMpiE64c4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB15611.jpnprd01.prod.outlook.com (2603:1096:604:3c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 11:09:49 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 11:09:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, magnus.damm <magnus.damm@gmail.com>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 0/9] Add Renesas RZ/G3L PINCONTROL support
Thread-Topic: [PATCH 0/9] Add Renesas RZ/G3L PINCONTROL support
Thread-Index: AQHckQ7mFMfKP704nkSMqDIloaC4X7Vo/Ovw
Date: Thu, 29 Jan 2026 11:09:49 +0000
Message-ID:
 <TY3PR01MB113460F1278B804F17481BF14869EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260129092504.95418-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260129092504.95418-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB15611:EE_
x-ms-office365-filtering-correlation-id: e71ccbaa-f12b-4a3a-6c25-08de5f26eb7c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?c3NreDB3dnN1WTlTY2V2N3NTcDNCcU5uNUdwbHQybFFiOGlyczdPVm9XSUtH?=
 =?utf-8?B?NnhJdDVSdFBnTXNDVWc5QktrWHJHekxWREU5TXNKUHVicGVNczRiU1ZRUUtk?=
 =?utf-8?B?aG13TGt3VTNUSkQxOVRHQWFWSGJpTU94NXdBeGYzWnZQWm8vN0huT0FOM0Qw?=
 =?utf-8?B?YXpwTzhaRTZoQ3R0UllIT2NKMFdubjIva2grQlRKZDFhbVNidWRBTlQ0U1lV?=
 =?utf-8?B?ZUdHYW82YnE0VklzeUlReWJVVHNNOVNZd2xHenVOTGlWL0tnK3Z1QkpZV0xz?=
 =?utf-8?B?aStLdXlYWjRhZ0Fwd2s2ZXRFUlJKMmtZYXFkUW1JNEdCKzVzWHY4TFRaQ2VJ?=
 =?utf-8?B?ZWl5dHE5aTNEeXUvNHBrOFVOMkIwQUdtc2sxZTlVb3UrTXp3THl4SnFzM1Zp?=
 =?utf-8?B?KzZWYmlXVGh2VythVFU0K3RMVnJ6Njl5S01wR21DYkJaWC9sV1VYWkN3MG1E?=
 =?utf-8?B?QXM4NFBGbVNHVnAzKzlVSmJQYStHSXg3TUdNZCt4bVRoSys4bmd4bmJLOUxU?=
 =?utf-8?B?TkNCYm43VzU5MWVrcjNodTl6L0puUEhoV1hoTmo1NFhTa2ZwalVlQ3R0QlNi?=
 =?utf-8?B?VTBWWUNxQVljVXR5VmFnc0ttd0RzVmV6ZHBwQ3czTkNnaGFHdkJ1dkZleE0v?=
 =?utf-8?B?dmpxQmxVSnRJMDA2V0JtTVBIcTZrbzFsaERoSnJqL3FTWk9RdVpnQkd6SVdT?=
 =?utf-8?B?VXZkMG9BY3NJMXl3QXBKb0RzZzM3b1NYQmttNTVxMDdXVlJSODBLSjhRaEhX?=
 =?utf-8?B?Snp2a2dpY1dQNVRqQVRmclVLeC9vU3FtOXRUaEROUEhtYkN3UEpXZ0V1cjhY?=
 =?utf-8?B?a0tQQjdlaC9xQ0JkWTFSUEwvdnMyYWNERXBraUNGN0FJZ2dYWFBaYUhocWdj?=
 =?utf-8?B?T1loN0I4Q3dOUlpRZlVqOUthbmtTTTBvQkFNSkZlR3c5K2pKb3QyY0RFNFZD?=
 =?utf-8?B?azdGa25kRmRyOWJnZzZUVlpQY3ozVytTRWtiSUxjYWQrc20wUGRqaGx5MEdD?=
 =?utf-8?B?WlEyV1VraGh0T081SDNvZDI1YXJzQUdBS1FySTNUWWlIaGJmOWhXSWdPNkcz?=
 =?utf-8?B?OVFLZEZIMDVPUUlDbXhMWm5Hb2xwNFJoT1VCMDQzeWZ0RGdGSk5vUDJtOSs0?=
 =?utf-8?B?emozWnNnSTF5cmdYOFNtRVR2SjRtc040QkxvU0V4YXBBWTlvSEJiNzM0STE0?=
 =?utf-8?B?aWFuWUZhQ2wxNE9rNTdtL01XL01SMnl2anBpMkJUdEUrdXRiK2ZBK0JickdB?=
 =?utf-8?B?K3FRajBUT1dML0gzQWlpUDVyc1BrOE9halFmR0JLRUtzU0pSU1NoRGk4NFZl?=
 =?utf-8?B?bSttRHZXWGMrd0lPeW0yK0wvUTlpcnV0TmlrNUxtR2owUXk4SHpaVnh0UWZD?=
 =?utf-8?B?dkUrUytUTzVZem82K0JlenlpOGd2elBBZXpMbkwxTnIreWkxN1BmbkdxVGZZ?=
 =?utf-8?B?aFRWcVFwQytISFYyR3Rwb1pIbEFaZTZ4K0Vja0haUERWZUFndzNXeG8wcmFL?=
 =?utf-8?B?VFVGcGxJYnVFZWZMVitkVjNibE9VY3R2VWRlQko5V2Nqb0ZBeVZtU3J6Si9Z?=
 =?utf-8?B?K0FSVkN5UE1vUFppY1d0V25rZGVmd254azYxck9KZ1pJT2FKeTF6V3YveUFL?=
 =?utf-8?B?VVhUTzdQSGNaZ1FydXRTNDRQc1NOelpKSW5uR29tMFBsOUZmT2NQRDFEMDV0?=
 =?utf-8?B?SlI5c0ZTYWY0czRjMHZjeUlIYjY3SlBJTy9tSFJmM09pd2FPRnA2OXIreTJX?=
 =?utf-8?B?S3RMa0NTVzdkeVorclVtOEt4OFptbS9BeE1manJhK0pvSVcwZWJLNE5DVy81?=
 =?utf-8?B?cEVweS9ZampjZDEwVkdmc2VaMkl1czl3Zmg3czhWTHhPQlhqU0x2SCt1ZGth?=
 =?utf-8?B?dDJYSXVjcDdkd0NxQVU2dk8yTnA4b29mZHM4THA0dTdQaXBsZnNPcEVnb3Zy?=
 =?utf-8?B?S0RzTVhFcnR0RTFJQWtvaXAzMFZpTEprMW1Lb0loN0lReEl0aFhYM2ZRNGdE?=
 =?utf-8?B?VFN3QjU3R1RpOVNsandXZjQ4TFpKTkJSWHNZMThYd2YrdmUyU2QwSzRvcUY5?=
 =?utf-8?B?VWl5QTh6SFRycWJVM05TYUY4WDFHTE0za0t0UDZNQmluQk4wcVJReGRySHBD?=
 =?utf-8?B?czNBWTlvVisrMHJaNnFQWVN6TDM4MTh4UzUyYTVwWi9wT0E5TjR2ZkcvZEIz?=
 =?utf-8?Q?KyxdvKdzJjHSwYfeLVaTL44=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y2NjdHErS1Vwb29VaXVFNkV0NDFVRU16SllrWm9GQnEzMlN2SUtVQzA2YmFj?=
 =?utf-8?B?bUo2ME5zejhoM0FmQUJGdyswK1lXWXd3K2NybllENFRKMmtyTkRzMm9WSlZw?=
 =?utf-8?B?MzEzVFcydHA0N2RXaitJSFhQSGo1MGIySmh4Z3F3OC9aakhkU2FjMFdsVHRX?=
 =?utf-8?B?aXU5SzJxYjRGampQRWt6bEg5QU5nRWYyNFhxKzFHRlpZZUVyeHc5VHZhUVA3?=
 =?utf-8?B?WnVjY0NhamZuZlZtUjRQZ2JEUzdpZTFISklpTThEcEFWTkV4ZUIweDFDL3BC?=
 =?utf-8?B?N2NGdE1xMkVuYkxQeG9GS2xvTDUvOU5yczBrQVhWVWQvZnE0d1N4RkFCWjdS?=
 =?utf-8?B?Q1V2K1BhbU5xL0ZLV2w2dGw4MWpCTzJJR2V1ZEZlbFloVW5aKzdic1NTZU1C?=
 =?utf-8?B?Zk8yU2o4RFNrcHJlakFEa25NdjVHU0hrb05QeGhQd1NsamsycnVnVmI5UG1Q?=
 =?utf-8?B?cDltZXNEUWZuYlEycyt3eERTWGh0N3FLM25jSzV4QTBlZUROLzJMSldhZDcz?=
 =?utf-8?B?bmgxLzkrTGQzaER1dHZ6VlFrclIrc2xUQ1M5b2VyMnFXajduZG9KVjdmNVkv?=
 =?utf-8?B?cDJoamhMLzVZNm1yazNKSys2alZ5RHZ1T0twT0lYM2pZZHdyVzRNVXc2WnhC?=
 =?utf-8?B?ajgxMENUcTFNaW1qbEVLSDFEZWJNZE5wL1ZueUdsditCUU5jd0pLcTU1VmdK?=
 =?utf-8?B?OUhxVk54YUgyaGFwN1ZaMVpPOVF4aEI0NGxSOUF6Wk9GMmQyL2U2ZXpSc1RQ?=
 =?utf-8?B?NVJONDZac09Nc3FVcmpvNitjS3Y4aUFMSnF4K08yeXgvWmMvNTR5U0lseERM?=
 =?utf-8?B?ajhGZ1JWejF3cXhuK0dodTFaN1BjUWJ2bFA1TkxYRVRHRkJpR2EzRlNZdkJS?=
 =?utf-8?B?WW4yUGlBMXJzQ2tOTmxuNWJyN08vd3h5ZGloa0FWTmF3RzY5MFNqcGx3RTds?=
 =?utf-8?B?VmxPNm1nWUgzczNYSm45OVRaVjQ2NnJJUktaU3EvQTRBc3AzYkpqZSttUVFG?=
 =?utf-8?B?QWNVY2sxVmhhc2RmbHlaZEJlSkF3TUdOd3BZZjFnRHhGamlmdE9NNFRDcFZn?=
 =?utf-8?B?bURPelY3UGdXcmd0YjI5SEtPK2l2ckZuQllkYjV5NHBPZXNldDRJaHRObzFK?=
 =?utf-8?B?RGFMSXBDR2lnemRTYXF3ZmZDenJOVUcyQVJhd0JWVXpzSnJkTGhIVkQ2d09Z?=
 =?utf-8?B?citNay8vaTFnK3pMTXZjUnd4OE5ZV0lxclpQanZ0Nmd3WUFlQ3Y2UVRWMEF4?=
 =?utf-8?B?RzQyQjV2MHk2Sk1yNFROcStRTVJrTUhaMk54dDdGK2NSODRYUHRBZ1UrZHpU?=
 =?utf-8?B?N0Z1dWZkNVA0WGdNUFZ5K2R3NjZ4NGhhOTM4cnRuUklseTVOajBCWllmTWYy?=
 =?utf-8?B?T1VYaisrcmN3aEQySkp0azJQUHdId1lkcjIybHRQOEJxZUVOVDQ1THU4OHMz?=
 =?utf-8?B?c09tQlNRYWNTYUxGMWRSdmZFZG1JcWtzTko0aGhiV045OGRycU10c1ZRM2hp?=
 =?utf-8?B?VWN2YmZFQUxicnA2bEl2ZVJ3eGJHUVp2aHpiUHBTVmFlbVdLUjI1QkV2bnVx?=
 =?utf-8?B?WlhNSlpIaWNCV0xpbDR6MGd4Q2Z2NjJocTNGNTBhUTZmczcyMnY3T09nN3ZL?=
 =?utf-8?B?THdSS1M3dUdrcVFYQWxyYzZqVmRxa3FPeUZHa3MwUExKa0NPZmYvMmFWdEdE?=
 =?utf-8?B?a09uUFZsbFZSNTlGQmJTb0VYUVR3U0xjUk1SbDQ3MnhrMk5OOGNvVjljeHVU?=
 =?utf-8?B?SG5DT0FGdjZRekRuSnlqRXhjU3VnM0lHWWhkSmVNekYzcm1DeGR4VnhFck5B?=
 =?utf-8?B?RHVITVpabWtIaURIUi92RHd1RFNHWjdQZWhZNjJuSlJiVUFNTkU2eE90ZDhM?=
 =?utf-8?B?UlZxNHhBYTJtU0l3MzVrQ21aZVVHVjVCaXRreU8rL0pvLzhpMGI1ajBZVENM?=
 =?utf-8?B?UENoMXBHWStzekxkb3kxWlp6RHVQd214aTlPNGE4MDY5MXFhRDNKVCtyOFVq?=
 =?utf-8?B?ZVFNYUZMMU52NEt1cHVIcE1qRW53ZjFXWVVYVmU1b2RkQ1N2S3l5RGcxVVFh?=
 =?utf-8?B?ZEVGOU50UFJxU3MzVnhYZldubW5uQUd0VGc4c0hwbFJva1RJajRONGpDWDJu?=
 =?utf-8?B?bTlLbHJWQnJJY3V4c3FwQ2xScTU4NTZvYndQQzZwMnVGTDNQSFJHRTVUd0JI?=
 =?utf-8?B?cnRrejk4N003UlppdFVKaEY2VERyd3l4S2RZaCtZZHczN0xNU2ZaaE5ldGtO?=
 =?utf-8?B?QURqalZIOURDWGdhc0FST1IwQjg2Vjc0dU95ZTVQRmE1Q0xFRWxTMkxqUEFu?=
 =?utf-8?B?YWpwTUY1eFpkOFROMloyb1cxUnJ1ZE9Tb084L2ZiTUZkcHpWM0xHUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e71ccbaa-f12b-4a3a-6c25-08de5f26eb7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 11:09:49.6819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /N93tQJ0F8jd4E7fXl2xKrxC6rG1/vhunUxFoVvZ9PrtLVeM3vU/DF/K9E/T0F25pn4Q25UdVFzEwV2nWFXgWQJUKGTrPC1OfhcM3TZelwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15611
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31290-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,kernel.org,baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,baylibre.com:email]
X-Rspamd-Queue-Id: 031E7AF70A
X-Rspamd-Action: no action

SGkgQWxsLA0KDQpTb3JyeSBmb3IgdGhlIG5vaXNlLiBJIGhhdmUgZGlmZmljdWx0eSBpbiBzZW5k
aW5nIGNvdmVyIGxldHRlcg0KYXMgdGhlcmUgaXMgc29tZSBkZWxheSBpbiBnbWFpbCB0byBzZW5k
IHRoZSBjb3ZlciBsZXR0ZXIgfjQ1IG1pbnMuDQoNClNvLCBJIHdhcyBmaWd1cmluZyBvdXQgd2hh
dCB3ZW50IHdyb25nLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPg0KPiBTZW50OiAyOSBK
YW51YXJ5IDIwMjYgMDk6MjUNCj4gVG86IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmU+OyBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz47IFJvYiBIZXJy
aW5nDQo+IDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtl
cm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+Ow0KPiBNaWNoYWVs
IFR1cnF1ZXR0ZSA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+OyBTdGVwaGVuIEJveWQgPHNib3lk
QGtlcm5lbC5vcmc+OyBtYWdudXMuZGFtbQ0KPiA8bWFnbnVzLmRhbW1AZ21haWwuY29tPg0KPiBD
YzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPjsgUHJhYmhha2FyIE1haGFk
ZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRldi0NCj4gbGFkLnJqQGJwLnJlbmVzYXMuY29tPjsgbGlu
dXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9y
ZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGJpanUuZGFzLmF1DQo+IDxiaWp1LmRh
cy5hdUBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAwLzldIEFkZCBSZW5lc2FzIFJaL0cz
TCBQSU5DT05UUk9MIHN1cHBvcnQNCj4gDQo+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gDQo+IEhpIEFsbCwNCj4gDQo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFp
bXMgdG8gYWRkIGJhc2ljIHBpbmNvbnRyb2wgc3VwcG9ydCBmb3IgUlovRzNMIFNvQy4gVGhlIFJa
L0czTCBwaW5jdHJsIGhhcw0KPiBPVEhFUl9QT0MgcmVnaXN0ZXIgY29tcGFyZWQgdG8gb3RoZXIg
U29DcyBmb3Igc2V0dGluZyBJTyBkb21haW4gdm9sYWdlIGZvciBBV08sIElTTyBhbmQgV0RULg0K
PiANCj4gRG9jdW1lbnQgdGhlIHJlc2V0LW5hbWVzIGFzIGFsbCBTT0NzIGhhcyBtdWx0aXBsZSBy
ZXNldHMuDQo+IA0KPiBEb2N1bWVudCB0aGUgYmluZGluZ3MgZm9yIFJaL0czTCBTT0MgYW5kIGFk
ZCBwaW5jdHJsIGRlZmluaXRpb25zIGluIGRyaXZlci4NCj4gDQo+IEFkZCBwaW5jb250cm9sIGRl
dmljZSBub2RlIGFuZCBhZGQgcGluY29udHJvbCBzdXBwb3J0IGZvciBTQ0lGMCBhbmQgR0JFVEgg
bm9kZXMuDQo+IA0KPiBOb3RlOg0KPiBTb21lIElQcyBuZWVkcyB0byBzZXQgdGhlIHJlZ2lzdGVy
IElQQ09OVF9TRUxfQ0xPTkVDSCBpbiBTWVNDIHRvIGNvbnRyb2wgdGhlIGNsb25lIGNoYW5uZWwg
b2YgdGhlIElQLg0KPiBQbGFuIHRvIGFkZCBjbG9uZSBjaGFubmVsIGNvbnRyb2wgc3VwcG9ydCBs
YXRlci4gVGhlIElQJ3MgaW52b2xpbmcgY2xvbmUgY2hhbm5lbCBuZWVkcyB0byBkbyB0aGUgc2V0
dXANCj4gYXMgcGVyIHRoZSBiZWxvdyBmbG93DQo+IA0KPiAoMSkgU2V0IFNZU19JUENPTlRfU0VM
X0NMT05FQ0ggcmVnaXN0ZXIgYXMgbmVjZXNzYXJ5DQo+ICgyKSBTZXQgdGhlIFBXUFIgcmVnaXN0
ZXIgdG8gYWxsb3cgd3JpdGluZyB0byB0aGUgUEZDX20gcmVnaXN0ZXIuDQo+ICAgICBBZnRlciBz
ZXR0aW5nIHRoZSBQV1BSLkIwV0kgYml0IHRvIOKAnDDigJ0gKGluaXRpYWwgdmFsdWUgPSAxKSwN
Cj4gICAgIHNldCB0aGUgUFdQUi5QRkNXRSBiaXQgdG8g4oCcMeKAnSAoaW5pdGlhbCB2YWx1ZSA9
IDApLg0KPiAgICAgU2VsZWN0IHRoZSByZXF1aXJlZCBmdW5jdGlvbiBmcm9tIEZ1bmN0aW9ucyAw
LTE1Lg0KPiAgICAgKEhlcmVhZnRlciwgRnVuY3Rpb24xIHNldHRpbmcgZXhhbXBsZSkNCj4gKDMp
IFNldCBQRkNfbSA9IDAwMDFiIGFuZCBzd2l0Y2ggdG8gRnVuY3Rpb24xLg0KPiAoNCkgU2V0IHRo
ZSBQTUNfbSByZWdpc3RlciB0byDigJwx4oCdIChpbml0aWFsIHZhbHVlID0gMCkuDQo+ICg1KSBT
ZXQgdGhlIFBGQ19tIHJlZ2lzdGVyIHRvIHdyaXRlLXByb3RlY3RlZC4gQWZ0ZXIgc2V0dGluZw0K
PiAgICAgdGhlIFBXUFIuUEZDV0UgYml0IHRvIOKAnDDigJ0sIHNldCB0aGUgUFdQUi5CMFdJIGJp
dCB0byDigJwx4oCdLg0KPiANCj4gVGhlIGNsb2NrIGFuZCBkdHNpL2R0cyBwYXRjaGVzIGRlcGVu
ZCB1cG9uIFsxXSBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwMTI4MTI1ODUw
LjQyNTI2NC0NCj4gMS1iaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbS8NCj4gDQo+IEJpanUgRGFz
ICg5KToNCj4gICBkdC1iaW5kaW5nczogcGluY3RybDogcmVuZXNhczogRG9jdW1lbnQgcmVzZXQt
bmFtZXMNCj4gICBkdC1iaW5kaW5nczogcGluY3RybDogcmVuZXNhczogRG9jdW1lbnQgUlovRzNM
IFNvQw0KPiAgIGNsazogcmVuZXNhczogcjlhMDhnMDQ2OiBBZGQgR1BJTyBjbG9ja3MvcmVzZXRz
DQo+ICAgcGluY3RybDogcmVuZXNhczogcnpnMmw6IEFkZCBzdXBwb3J0IGZvciBzZWxlY3Rpbmcg
cG93ZXIgc291cmNlIGZvcg0KPiAgICAge1dEVCxBV08sSVNPfQ0KPiAgIHBpbmN0cmw6IHJlbmVz
YXM6IHJ6ZzJsOiBBZGQgT0VOIHN1cHBvcnQgZm9yIFJaL0czTA0KPiAgIHBpbmN0cmw6IHJlbmVz
YXM6IHJ6ZzJsOiBBZGQgc3VwcG9ydCBmb3IgUlovRzNMIFNvQw0KPiAgIGFybTY0OiBkdHM6IHJl
bmVzYXM6IHI5YTA4ZzA0NjogQWRkIHBpbmNvbnRyb2wgbm9kZQ0KPiAgIGFybTY0OiBkdHM6IHJl
bmVzYXM6IHI5YTA4ZzA0Nmw0OC1zbWFyYzogQWRkIFNDSUYwIHBpbmNvbnRyb2wNCj4gICBhcm02
NDogZHRzOiByZW5lc2FzOiByemczbC1zbWFyYy1zb206IEVuYWJsZSBldGgxIChHQkVUSDEpIGlu
dGVyZmFjZQ0KPiANCj4gIC4uLi9waW5jdHJsL3JlbmVzYXMscnpnMmwtcGluY3RybC55YW1sICAg
ICAgICB8ICAxNiArDQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzLmR0
c2kgICAgfCAgIDEgKw0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NC5k
dHNpICAgIHwgICAxICsNCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNTQu
ZHRzaSAgICB8ICAgMSArDQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDhnMDQ1
LmR0c2kgICAgfCAgIDEgKw0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA4ZzA0
Ni5kdHNpICAgIHwgIDEwICsNCj4gIC4uLi9ib290L2R0cy9yZW5lc2FzL3I5YTA4ZzA0Nmw0OC1z
bWFyYy5kdHMgICB8ICAxMyArDQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDln
MDQ3LmR0c2kgICAgfCAgIDEgKw0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5
ZzA1Ni5kdHNpICAgIHwgICAxICsNCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEw
OWcwNTcuZHRzaSAgICB8ICAgMSArDQo+ICAuLi4vYm9vdC9kdHMvcmVuZXNhcy9yemczbC1zbWFy
Yy1zb20uZHRzaSAgICAgfCAgOTIgKysrKysrDQo+ICBkcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA4
ZzA0Ni1jcGcuYyAgICAgICAgICAgfCAgIDYgKw0KPiAgZHJpdmVycy9waW5jdHJsL3JlbmVzYXMv
cGluY3RybC1yemcybC5jICAgICAgIHwgMjg1ICsrKysrKysrKysrKysrKysrLQ0KPiAgLi4uL3Bp
bmN0cmwvcmVuZXNhcyxyOWEwOGcwNDYtcGluY3RybC5oICAgICAgIHwgIDM5ICsrKw0KPiAgMTQg
ZmlsZXMgY2hhbmdlZCwgNDY1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pICBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9kdC0NCj4gYmluZGluZ3MvcGluY3RybC9yZW5lc2FzLHI5YTA4
ZzA0Ni1waW5jdHJsLmgNCj4gDQo+IC0tDQo+IDIuNDMuMA0KDQo=

