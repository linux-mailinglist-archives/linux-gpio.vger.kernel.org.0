Return-Path: <linux-gpio+bounces-32196-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONP8KU6Mn2nYcgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32196-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 00:57:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5179719F31A
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 00:57:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B382430D5462
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 23:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64824387578;
	Wed, 25 Feb 2026 23:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FukuZ5SX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011006.outbound.protection.outlook.com [52.101.65.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5956387343;
	Wed, 25 Feb 2026 23:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772063731; cv=fail; b=IolRMP8KYnWYgbw9cRl8fF8Uwg1ZoQxZJ9xHyNDYpf3Mb0qYvkifc94DZwGTt+68gEVxRKPnaW3iNjnBuDwyDwQQnpoDYkuTQhQU5OYQL64NjFcKLjThmLaBebo9rKJgdLX93TFArLSupE99ZUf99nNj5UQ+9JCcnc3MN0egJY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772063731; c=relaxed/simple;
	bh=o3Eabt6YHmDFwC6shU4Pa4Ph5ynfQCQ49worcIk0aWI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rnykix1t4cGwcnqhlbhYKz9M8Z5RGdJSqsuCkMMh3Q+Rs8EqU8UOZzFkTEl9VywSBk6UYIb6R/JXDyHo47lAddMEyZ1prt61Uw7s5VNAREjXYcY60z36F8iAxGxx5/hKqQLOPkIcH9xUR1jSy1YvEHmhgtfuWORvA6jLc8s2+tY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FukuZ5SX; arc=fail smtp.client-ip=52.101.65.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0iCGVz9b1hpthGgNjNwG+YxnofkC0BxrnFwun9lLj8i+m/lpTHiZlx32178Uv8Ah4EZdHEoJAgGiQ1m6bH0oCpKgjsBRLAJKgPbh/Ng8Kr/qZXMr16GT00guAIdgLI/f0e529OcDoZIgHtcNLWmYuKro6BB3BkC2yNdl71BuVhDQYL6YYo/u+JuCJ12AGI3x8TLgZ6Z0+rcVJzzMfJcImDSzWPW7Fl9fjNntkM5N+CjbZjRXKL3lBYjE1scNakVsMjaF2cKkU77TKP5c5p4o8xm/r2pjmKCABI6PqYZntm9TJt11Yz7MfD4u5xuTOCajH/jhXgXnLjSm5RWWoSq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8h0u7nTX88xzaC/aqgJGgMgUsRBsXdbg2e+mBLzN19g=;
 b=Ds+odlg/L0NgZL3Ir+KJQp0tgX1AewOkCaGJc2wA9RWyaG2biOrnO7jRSyzWDNtGzQBT+WWSn9XED019oKvWfKk2CAb05H5m/HbOwmS0BRxweCMAmoMFjRYtMINeINDOdBgijFztwoJREatkhh2psc6tQf5dtrytUK3Jocc//dHy7gBE4Op7H9L3vZ5hzxFLY7gpsDUpLHDHZZJLiZqMS2TJ9wGHlZ92qQ0FnDT7uWc0zw/ChywEraPpZnFn9EnEk2Ltr/6u65fNgdnC/KwwpP1Y4j41YNhG7y1v5NkaxZ3sS+cc5NcnDzXgL0qwiM3EWdYTzTRAoU63ug/JisflVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8h0u7nTX88xzaC/aqgJGgMgUsRBsXdbg2e+mBLzN19g=;
 b=FukuZ5SXIXuDWj9ORbWDbaNgax685wbCsLzX3vmYFV7FOIrcmAxs2lRQ7SKypgQyX3EC81COejH1i8JN1xvZVNRAw/WNcM53DxUm4jzDy35Pld6wPhInA6vnb9eNI+cJSCT/m6zSo9y1b9R6IzDgn8oY7O+BjLYQIb1ovfaI6ZIRnUEq2CoGSZ7XVyoIIObUVUWt9FOST/LbEdryc347zqLcwAFnnX+5cceQxuEJqnpEukucc6TSXAH0fQVgNkBD2d4Hoqy16unB6SaxCsVi4xhkC5HWp6X7mvWUt10F7VAUqdjIu6A7uVHLWxNURfmW2pGApMGhQR7EXJL8H5XlMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8771.eurprd04.prod.outlook.com (2603:10a6:20b:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Wed, 25 Feb
 2026 23:55:27 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 23:55:27 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 25 Feb 2026 18:55:07 -0500
Subject: [PATCH v2 3/6] pinctrl: add optional .release_mux() callback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-pinctrl-mux-v2-3-1436a25fa454@nxp.com>
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
In-Reply-To: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772063713; l=2730;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=o3Eabt6YHmDFwC6shU4Pa4Ph5ynfQCQ49worcIk0aWI=;
 b=zJG+9/3JwbB5542BNwStz1ie1REDIALudkZuvmNnkJCHmJZBC/w/1waO/fIQ6BrCRO+jbgdxB
 9ki3KOHY6m7Dxf8Z+3aPd3HXAP2zZX0VH7KQGI+/Hn0DiTlIQF7HYjW
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d01901-110d-4e36-5d10-08de74c9595b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	lInvAiWRsQH8xT3Z701chOxDxzJ/Xqi0E0YBGb7JGphQwaR4I3kkOBJoswaYCocW7uf9HyZCteexL7hmxLV5ucOtCYNfdSxNoFSeFntk4ZYpqw13oPWE1ztenHafXSMgKSUkrLrA0hGUDq6T4TpL1ziSAeVStBc2kCHH6RPLELw3CKjdIUpdalEI9Woxu0y9aaAuayo/sW7pADl6vfU0zofKzbeNfoe2vtVOqR+38jMpJwjunUei4Nv+kFv/EbJFXO8Tnz8Az2eB8vzz42ODBhkXq/qx+jl/3jiZW5GnxG5Tgm7UG4dStytB6Gh8fmHjRyDFSggS5H7cF8FeoU8fvupAM9Qqk80Y9j/XnRCL48v5aJtYlC2NpKHXajHuWHuWtlnsUQkc1E7cqYKN85JyAjOwggEe7sF+ZvMfnVaw3Jcj4/u1oDtzbsQVSC1S3W4U/bbcZ8vEJwCzSr8AJMky/UdoZjZrQzALg/f46p9mvg0isqRjtBPVo43L8b4FlnR5B/p6wvRp7Qt5SBn2AnJtiSlVkeAZAOwvRkhcyw9Rob9aq8UZmYED5HMomrifKUTD4waNaqgcRR/cgFE+BVQJSGV7m7oiVGbZSaZ+0lQlefJ/0mHlUnRn6CuSv9M0fXWfciZo5/MZAl3VmBi2EyysvtyX3x41yltsqX/MWf4e84XQFd+w+QDXIS4aDeNY/ZjG2MKqIr1ArqkLHJXq9OWBTCmjR0oOolSP8Q7aDhywOCiv7xpfAmcDiTDoOLGLY8uicwL2Mc5RDYTXkt1byWKUW3Qxb4krUncQoQgqzkMynd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDRzQXFEd3A5UWZNMFN5OGFSQ25DdVBKYTFQNkdSczY1bFZORVpKby9WcmRu?=
 =?utf-8?B?dWNEdjNnTG9GQVdyWTVLZHhUaFJiT0RCVEVxdFhTdFNyeThoTEN1MzZBRFJM?=
 =?utf-8?B?U2FJWXV4aU9jdGV3YUh4dHRzRnhja05RU0MwRTQ0SDYzWjJHczFQNXpmY1ho?=
 =?utf-8?B?SStBSEhMM0VlN3RTanRCVTFrMWt6WFJ4Z0h3dDVwRzRFNWJXSThmYWJ1ejE0?=
 =?utf-8?B?ZzZqc1VZcnphL01QdXZPNEc1b0U4NVNSUEI5cTVKdjhwMGNGOXFTYzdMY1Yy?=
 =?utf-8?B?V2tpcng5T2hJbG5yT2htL0xUby9wRmNRQXk0VHVYZE1uYjBublVFUUFOdDgz?=
 =?utf-8?B?SE5JbGl4MVloeEtLaFpLeWNsREJocXJ0YzV4R2E3MUg4eVdUZ0ZxV2QycjdM?=
 =?utf-8?B?bUhXR1BsL0RXNno0RjJGZ0U3a01PNC9ZOTZtQWJnNllpUXlvRzk4eTk5UGN1?=
 =?utf-8?B?Z2FCU2ExMlVkREw0YWtyK3lndklqSUgxMWpXMzN5eTBOdTlIT1dvOTBBeUlt?=
 =?utf-8?B?em14L3cxSUt6Rk5CYkJzcWFIcmpYVmFacyt0c0hRZGRITkU0cHR2R21TS2Vs?=
 =?utf-8?B?ZTQvOU4vMHJqblhhd0YzdjFwN1k0WGxMRG1oYTFTcHVsZXNlVEpPYURORmpk?=
 =?utf-8?B?NTFCczlMV1hPV1ZOVy93ZkVEdFhwRFpvTytuNWp1YzMvZzNQT1VVYVE0WTF4?=
 =?utf-8?B?ekhzbmNHRWFCU2Q4OG5TdURkNDI2TGs3UFBWM1ZtV3piYUVVQ3Z6cHpJUkhx?=
 =?utf-8?B?VjE4NXRnTngyR2dJNDkxWDJWc1hrTlRtT3dyQ243a0tMdmxMa0gxYWpORGs1?=
 =?utf-8?B?RmdlVmROb0lqY1orRXJFY0h3aUlDejZMYnVnL0lPSDdZZUlRbS80KzJrdVgr?=
 =?utf-8?B?RFZoYW5SUDYxMTNlc0UwVUFnbDFBMzdLbWJUbGkvWE83YkhxVXF3SGFhRTZ0?=
 =?utf-8?B?c2ZLYzJMSEg5SDExUVQzSmpSeEtGOE9yOUNmK0dOMXNyVnRicVFTSVB0NVBn?=
 =?utf-8?B?R09lWjQveFcxNWJLODJrRTNra1IyNHpLNEdqRC9ESjFjdFB5YlBxUXJjWlNB?=
 =?utf-8?B?UU03czdyMFhycEZBRVlwOXFOdUFYbDFkbStudmx4bTc3MnRKRkRJQk1tLzIv?=
 =?utf-8?B?UmZRN2lYOEx5T3dFS0QxRU9uTURBbmFDb21XYmYweUdyMFVqL3FybUtjYnc1?=
 =?utf-8?B?RkxaZ2YxT0lkM0xIYWU4bDZhQ2JMQ2JFck9JTk5WczlGeUdmQnJYRFUvTHBz?=
 =?utf-8?B?YS9MN2NuNVFkTXJRNFhVNFozbXJzdVVBZHdpVEI3blloWlQ2VGRSa2s5OGpS?=
 =?utf-8?B?OGwzOUswelgzQkg1VUdmTnAyeG1vY0tuU3dKdkMwaS9oOGt2dlM5bUJxNTlJ?=
 =?utf-8?B?TWx6MnF6Wnk3LzZ1aUtodURmakJCQXhKSU9HK01HNHJOUzFVVFU5bTMyRG9a?=
 =?utf-8?B?RDRWZ0QzZVZxd0hqR0N1YkQ0Ty92dlJnUVYxb1NBTHdCZERrcDJGcUJxSVhn?=
 =?utf-8?B?d3dTbXdtU0FPVEtWYnRHaWl2V2svUXIrTEExQ3o4ZVdnck1KcDJZOEd2Zzc3?=
 =?utf-8?B?eGVmcHArRkpRSDk3RGlaUW0wZ1l5dU9vMXZ0bGtmbGxxRUZSQ2JNSGJuWnQv?=
 =?utf-8?B?ajRFcDU1Mk1GOHdIZEFGWFBxc3lYR0xqRkNHQ3lkN2xubFNSaUJTM0k0T213?=
 =?utf-8?B?YkpheS9Wc0FsMlNmcnM4RUFscUlFbjNiTGpKbFlVMGh2N3luN1hxNnRzVmhD?=
 =?utf-8?B?aFY5SWZqRWcvSE9JT2h5MFJrdE0xeFU5UFY3ZGRxY0YzZCtZaUxxVHRtUi9N?=
 =?utf-8?B?SWhiMEJjb1NicjZkcFlsempkaGtxaUwwTXVIZGJLS1JrL08ya2dScWJEUjVS?=
 =?utf-8?B?MmllTm5DZ3JUS3dxbnZKdkJvK1FUdDMzK1J2VGQrRUYwZXFIbXF1elNHRGFS?=
 =?utf-8?B?cW5HdHJzRjFhQVVISjJ0OFZLUTBLdVhNMGlPbTZaRjFMVHpRdkFzRndVYWho?=
 =?utf-8?B?RWJZM1NINlIzRStJN0lHQWxTeVorVGlLbGx4dndnai9XckIrWFlqYnRRbzBG?=
 =?utf-8?B?SWZCaVlveVQvckk0aU1oR3lhcXNvU1QwL3ZzVXJVaEl2bE1ncjlaSThMd0U0?=
 =?utf-8?B?ajUzRFhsa0toWmhPUFA0OTNmaURSMW8vSmVDRzF6VFJmZ0ZtekNxMElaOVF6?=
 =?utf-8?B?OWZyNm81dE1qOTlNendjR3k0SXY1L1hiZm1vWmViMmEvYzVtTnlaZDNWOG95?=
 =?utf-8?B?SHhJSlNBSGI4cnQ4NTh5blVXQWdFbHFwQ2QwYmJiYklYNUl3MCszMTdYNnJz?=
 =?utf-8?Q?QO3QxIx66RydHUPuEj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d01901-110d-4e36-5d10-08de74c9595b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 23:55:27.1268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IY1WFV874p4/AF7epYQSshsHifzPWAabvQBs/UWU8WrBVTVBK4VTTuZQVANN+7sGa4oPZHQUJSaOm7VH9w33QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8771
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
	TAGGED_FROM(0.00)[bounces-32196-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5179719F31A
X-Rspamd-Action: no action

Add an optional .release_mux() callback to the pinmux_ops.

Some devices require releasing resources that were previously acquired in
.set_mux(). Providing a dedicated .release_mux() callback allows drivers to
properly clean up hardware state or associated resources when a mux
function is no longer active.

The callback is optional and does not affect existing drivers.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pinctrl/pinmux.c       | 5 +++++
 include/linux/pinctrl/pinmux.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 3a8dd184ba3d670e01a890427e19af59b65eb813..c705bc182266c596c4e6c820f5e3ffcadbbb2838 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -517,6 +517,7 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 {
 	struct pinctrl_dev *pctldev = setting->pctldev;
 	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
+	const struct pinmux_ops *ops = pctldev->desc->pmxops;
 	int ret = 0;
 	const unsigned int *pins = NULL;
 	unsigned int num_pins = 0;
@@ -563,6 +564,10 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 				 pins[i], desc->name, gname);
 		}
 	}
+
+	if (ops->release_mux)
+		ops->release_mux(pctldev, setting->data.mux.func,
+				 setting->data.mux.group);
 }
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index 094bbe2fd6fd5ea3c5fdf5b6d6d9a7639700b50b..ad7f8c31655e10ae854f7c325f88d2a533dcb035 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -51,6 +51,8 @@ struct pinctrl_gpio_range;
  *	are handled by the pinmux subsystem. The @func_selector selects a
  *	certain function whereas @group_selector selects a certain set of pins
  *	to be used. On simple controllers the latter argument may be ignored
+ * @release_mux: disable  a certain muxing function with a certain pin group,
+ *      which set by @set_mux.
  * @gpio_request_enable: requests and enables GPIO on a certain pin.
  *	Implement this only if you can mux every pin individually as GPIO. The
  *	affected GPIO range is passed along with an offset(pin number) into that
@@ -80,6 +82,9 @@ struct pinmux_ops {
 				  unsigned int selector);
 	int (*set_mux) (struct pinctrl_dev *pctldev, unsigned int func_selector,
 			unsigned int group_selector);
+	void (*release_mux) (struct pinctrl_dev *pctldev,
+			     unsigned int func_selector,
+			     unsigned int group_selector);
 	int (*gpio_request_enable) (struct pinctrl_dev *pctldev,
 				    struct pinctrl_gpio_range *range,
 				    unsigned int offset);

-- 
2.43.0


