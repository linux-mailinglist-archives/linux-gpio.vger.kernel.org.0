Return-Path: <linux-gpio+bounces-39058-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f2ZtFN0xQWqmmAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39058-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:38:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 991176D418E
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:38:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=apogI8Iw;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39058-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39058-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9531B301456A
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 14:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281823ACF15;
	Sun, 28 Jun 2026 14:37:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023110.outbound.protection.outlook.com [40.107.162.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90189347537;
	Sun, 28 Jun 2026 14:37:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657474; cv=fail; b=ge14PWO2hMBHEqALpZqOxudHeIE9gc5xJ/WNpGx638UHGRp1vC6mvt5yKmzyJ+IEC+locDeocbyC+lFLXRDBq0Ml3xepuDBVDHed4xPxkbF+LvMUShfSpTfTRcHc3c8dqGYau7Jd1j3GElXbG/X+TH2zdBpVjuYSQwy/0p3X1EQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657474; c=relaxed/simple;
	bh=qx+5IuuW+YeiR6qmr5HAuWrBsg98REy71WUc3IXsKTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZA/iDKEbt7uKl2PArV1xKoBd/2fTJbwbU2aBrbHzSkJSuWfQaV0SEBTbgITTXZh2vaUbZufk4WHxs1YPDPJ4gqxdSwIBDp5vfE8934LrfH5MnR2FORxBFwdIBGvpzOfbm+hyW9g8YPU6raDOzu5VdBJ1jEiKllwWxhsx8GNCP4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=apogI8Iw; arc=fail smtp.client-ip=40.107.162.110
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iw5Eou8Hv+3D/mTgBPw3D/bnOQJ50qnlE4+3RI4s60dpqPFrf0+6aBg8cL/mFg1KZ0zUcL+C3oPvQV0XrKooWC+GXHoWLIDFHkhBIZ932bgMUGZk96PwLZzWW9LgoCBJFZWAuvspO8qcdqdvluadqAFebK/J2uFJDrfclkRMWX3pc/pZOpXqn3BP9gFk229XnTwtAQqIeQ1CT0Ys1aNAKQsC6FNsrGBhXeBlXH++FIKYIb30OhF4iDfI1XfRX0wm5nQPLVbRv2x4xp3B9mTP6l1UisUIOiOeUy0fUvvpY6DrswC8iblm+7mzl92DuiRKG5KqNY13x4+iQnp63hyk9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=;
 b=S7TWK1h2gV3X8ghgeuyYbnDYJ+mqIEnFCHTsvlHWTK8LnmujsMX0X0UEkfvOJdGrSXdFITalQL9sUOa4YEkz8Vtni2HbBoDlEb9+GqjuR37mNwi5+ljMTBMEKLUWSqmbMntyxtiWVMfa4C5anVsUAX8UKlo3mPbAWX9qcgFJHw1KiUhahXH5Q/HbSKdlezQIxxFpDoBZaxIWptrsltqboea9IBl+Bm/FgY/rVti18trRJBo0PJ1nhfG/EmpkUpgaiPivBIEx03RHaX1fXQ8u3bqUR4Cgch8WV9ge6/yC9xfhQIKWc0m/UrMevsRc8Kkhx5tsUtsvavRCDA5jbTrReg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=;
 b=apogI8Iwo2c5LFle1b5E4s2xmiub25/USWQ5Mc3h2uF/QrD7DH44M6gDUan5qH2Kt5NSW6GXKO8bnT0VcMIN9C6xx24NtnJVKkBtwYRpa/gPJwQ3Z7cH4lEGFFh0KNmxJ9kD6l6r/frmMDJyHMmNg0jGWzeFgZ1CFboTFh1WMHHrMLU2ioyA7G1XmSnmTcl3Em3FV3lKxPO6dQ3agZZrBnikZvbEd7ANTbyF2ttq9liUT+ZLVkj53yTGJRMnEew2vR8SilcRPmIZll+jch05fjj3YEMXRf475kBFCfRojcgttP7rkenFsFmgJsauaxS8Ka/gq7YV+9xEIhcidsSn/w==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10009.eurprd08.prod.outlook.com (2603:10a6:20b:64b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 28 Jun
 2026 14:37:49 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0159.007; Sun, 28 Jun 2026
 14:37:49 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v6 02/17] pinctrl: airoha: an7581: fix misprint in bitfield name
Date: Sun, 28 Jun 2026 17:37:18 +0300
Message-ID: <20260628143733.273651-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0006.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c05b83-b3d9-49a7-d097-08ded522d3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	xGGjsjEMHnwwNXZIjjLYXWDCuJ/uYcG16GXK2qNf0sWBKTqEAMKBVcPUxd82Tk6KU6KN0W1T0DGFhtnUvthITO2KypYheT4qrQiCegQW1a3IEJsjGmEDawSoQNBqH+Lv9ULZaTfFHKy+a3Zbx/r8OCghARfqbt5FcqtYfXSvlmlHfAiH/hdnehreNI+q/4Vo+x/7MC0QXdXhtt0EczVl7IxVpjb6HlRRRvT7Dn8HymAY0JS9X36zs23qYWsQ88GcYpYFQKJniw9IcnhYmqtz1GoL4a69KGAjmmV70/IWeE58z5GjZuRbDAjEgBp1EMEanVhnID1nXgLE+KxKRtHJpnKTB0YwCwK/f8/Bls65EQ3IocUFRSR5q9XwwdTWSOYaiPCwF8lcgI4FkaHHdmbuEKt+HzFg+P1DQWbX5F28Xz80Es3botK8UMYXVpuTBmKkvem4lGJzEXcgFnEvTz+k4+9RNRKZSF5irJsdMpGD2rvA1pxKCB5ZwBWOGS8OnyxUYyUf8EXHk4VL7NHeqAE6hfISD+W8EBeDdAq8DCqECSGf8lpm7E29cniCSljDnoO13/u2Iq/kFXgsK4iaovwg6U6a28gGIglqfSAgYoYj0IdZWLPVPI4SYln84xDOajyRWUbn9W1Gbgxb82BY087VLch09l242dXDoxFyH1ZloBRewUDGPZzrDKJIys/VFCbYcZarjqnsn3tTysAdmJZdHtWaWGDB+qyvhLVhn9EexwQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M4hlISslL8+Ctr+yB0Jc+VI/+owyeIQ9lMugtm/Q4kVNHtB1ZNAUqZJdIdH0?=
 =?us-ascii?Q?+EcgQ2smn+8IHRuPpqMo6usZMgXwHPBZQmILdkaEIrg6s2lfHxyUsrpAU1zj?=
 =?us-ascii?Q?xjcyGE1uBr/5mnfN4kW4DX6aUK3vjYVjuWD75Cj6PdRDbQw7hH99bJcuzYRB?=
 =?us-ascii?Q?QLMgoH4gRLeOhWhDWyF6D+JR+85kPjHQtSNmCW/tDkCYJU7D3FrNfBjp4N0f?=
 =?us-ascii?Q?Tq9mTXCKoTKPbCbqZzr/uWhJUrkSzwEU4XlkrbTWoJpKfS8e1dHxTbytJK4d?=
 =?us-ascii?Q?WZqgrFQirSmVrueHPH0MGGM3UuTxpXq36HO7yQdKJHhriVaIWE7CgHMDEHem?=
 =?us-ascii?Q?icmVb5Dd5oSJu4kUigk1Mkex81yJT+UGYYLW3aisHMTsoz+5omUH1d+kLG0U?=
 =?us-ascii?Q?j0nJsyW/Ars3qrEAkj+/uN2ouXyfti4Bjs3qcqAbeNZ7StONpCMaXgaV30vH?=
 =?us-ascii?Q?11n+jcGCEv6IxqRi7ys6rjovOw7EHTMZ/Inh6n/mJtzYbHQ9qL3ATtEVpGuu?=
 =?us-ascii?Q?wbjhbW7oTs1YYO67RKbGk5LClTaMOV0G69uNoLAfSbfMeY2l3gCYZ2bBtE2z?=
 =?us-ascii?Q?4TgytmzXH6IHKge2jc2IfpMIitsFVwpSgBg2wIOtxk2Rya1GhV1bF50EEAQV?=
 =?us-ascii?Q?56eYLb6ATD2wM2lUCD+q5ktLW7p6z7U2GqzbhEnFVMp215j17n3de+jaSlbj?=
 =?us-ascii?Q?9+xYBPLFDYaw62RcJyIbH5uwKa6EElqVoFv+4evZWUR1gdAXypeVAxk4/eee?=
 =?us-ascii?Q?nirkipNUusRxpzxwiYZJbZs37fWtDDbGZA2SENjUFPCn4/BFsY2Va8QxRoe5?=
 =?us-ascii?Q?Re2ucLO4zF1CJCRPh2z+q3dhj7rhA2Z3gA7ut1yZJoCmNVW3xe3GrM3bHjr9?=
 =?us-ascii?Q?tLPkE5algloNLrr9PmwUusumzM7XoJ6v3MtRXQEYSu2aFc3yTAYt+W0ZyG2p?=
 =?us-ascii?Q?AgJDnrqt5+16Bw/SNxlknkzYF1YCMKdMjEf1bKasEzyZjXruh1YF53cqBJvH?=
 =?us-ascii?Q?1oK7gz1HidJ6EFvF2HfiFy1K6wgqTdEIFc0FfNx0S+jroatNAVxbd9wx4+U0?=
 =?us-ascii?Q?gMjtAm+uovSIElaKPPPKS2IVZDP4clJJzj8wq08PXGQpwZamwD5UB3X477V/?=
 =?us-ascii?Q?ezCDomjganxkELHfYBkTzZ5Zj8bmPM7b+xa5BWz2uyuc7IWWXi9Xr/qbQn8q?=
 =?us-ascii?Q?N7m3R9emP3J/bJ+INN7AMEIoJk1kiT7QqU/+41A+i+VRtBsDRP1hfWYkqe30?=
 =?us-ascii?Q?fIcsq04xQI/YH1EvoNZm0GtoZOgU2yZUOg/UCIJQPdL8Y9eqgIwb/X3lHWVk?=
 =?us-ascii?Q?L+y9Imn1bnQKi0y9wHTTgs4yzsR5Nx22hupr3NPK6AN64erTSLSpF9UvuKCp?=
 =?us-ascii?Q?Eu6DzjMfBf+pQwOuQfMi/7otJ9/oCeFEw9Nzr2sOwy9h8kkppRB+lbtmSQYO?=
 =?us-ascii?Q?17+bKH03aBD7R4BWx6uh1NwB9bjLZfx7A5pk3cWcS0gfbR6MDx0wl20h40TH?=
 =?us-ascii?Q?nEguDsOHOOYK3lzyjIm+90mpCCCfLlrVvoL2uF6ICMNhJGXdp/H/GyfJEcUb?=
 =?us-ascii?Q?b+yC816D1Uy3k87Pv/KUdFSM/1hTplyEh0xumFPzND9daThdSabls+GQur9u?=
 =?us-ascii?Q?ldQhhCRTg5q4npy9+16UDcCxL8Hj6DmF+0dw6nZVBPq9azIIelN/OqeI1s0c?=
 =?us-ascii?Q?ksSCbnjaOB7y/iOYf8jwWSwS9YfxnlrKn3vBLlWbH5KQkNaj5fJe32lZMd7H?=
 =?us-ascii?Q?HkpJQmDFFE0oPkKYXexk5Pp4enmREL4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c05b83-b3d9-49a7-d097-08ded522d3b4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2026 14:37:49.2118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnmEuh9oD3dPuRmH4G5PFRwJKEyYT561ONAe9nSufnsjw6Vl+pXrj3uvIL9E6Njv3clUYO+Y43Tf8FQv5u2tKJg3P0m7hGoDLzABoLABsig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39058-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 991176D418E

Fix misprint in bitfield name of GPIO_2ND_I2C_MODE register

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 04b4424c688b..63c82268aa82 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -49,7 +49,7 @@
 
 /* MUX */
 #define REG_GPIO_2ND_I2C_MODE			0x0214
-#define GPIO_MDC_IO_MASTER_MODE_MODE		BIT(14)
+#define GPIO_MDC_IO_MASTER_MODE_MASK		BIT(14)
 #define GPIO_I2C_MASTER_MODE_MODE		BIT(13)
 #define GPIO_I2S_MODE_MASK			BIT(12)
 #define GPIO_I2C_SLAVE_MODE_MODE		BIT(11)
@@ -1026,8 +1026,8 @@ static const struct airoha_pinctrl_func_group mdio_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE
+			GPIO_MDC_IO_MASTER_MODE_MASK,
+			GPIO_MDC_IO_MASTER_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
@@ -1051,8 +1051,8 @@ static const struct airoha_pinctrl_func_group an7583_mdio_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_SPI_CS1_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE
+			GPIO_MDC_IO_MASTER_MODE_MASK,
+			GPIO_MDC_IO_MASTER_MODE_MASK
 		},
 		.regmap_size = 2,
 	},
-- 
2.53.0


