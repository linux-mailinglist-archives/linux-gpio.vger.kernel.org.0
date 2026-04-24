Return-Path: <linux-gpio+bounces-35452-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GTxzEmzK6mk9DwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35452-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:42:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A97F5458DB8
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D488330146AA
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 01:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE28B2BEC2E;
	Fri, 24 Apr 2026 01:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="K300MvX9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013007.outbound.protection.outlook.com [52.101.72.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208312BE7B6;
	Fri, 24 Apr 2026 01:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994818; cv=fail; b=hdKaIMWF6giv8X0HFSJ1Zr9+p2CO6gGRAOm4h8r2j5buFrRvJYU8Rous10VWk3ZSFjTW2gGkseUy4HqzbtaXT/RfLKK/G71xHv7oKylDotu883YR7RhOCHS9o449U1V4yb956lyYkEtIZHD0+nSUv+bW8aUwTpPHRaACfAeA0ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994818; c=relaxed/simple;
	bh=tqwAZAbm1xXBZMq+FS2vZRW8Ry34ghsQDncw4KuA/4w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ovm9lOkJXqX0SFRZhZXVBRRoaNzARMNmvxQhdJlx2pe8suN8RlTM/S832p1LlottiYi60qVRwyT25sE9Rv6/bkhaqT7/uAoHjJafw+tS4qHwVpxXHHDXgxvPdbIqqWur1uMPRXu8fvw5y24dIkrCx+z1RXtUF50fuFMKg8/pT7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=K300MvX9; arc=fail smtp.client-ip=52.101.72.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHggkUNZYkdzty1/jd53w/m1CjPF/Atk84QTKrfye70SpgKJAJCb9bCDO9BAmhZvCx2h+m4+LZCHJ+1dG1oisE2ecvb7Ya6LucCHeSRVy1u0qkT/ttuTrRwF1up+IGmd0G2mnwZkzg5AK/Qnq6FMModiVi3DoYKsTgISLi9iPy7vrTtfQMO6SsdC6JTut1oV+XK/wJyqIjHAhkDr4IKo845oSmx7KsMC4FP+twZP0X+LbeO9g5xm8ChKp+ceTkn5aeiS8nH3Fs8M/fZncDLK9Fa72DnY+Pa0c+oKqXDWcf6/NexkLwU7fTDEYccNE8PtuMyn4yXqUGUKzPivSNo37g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09BkqVNIF6Vem0C1TjyDSHBfBYFKTOtLVRkiaoEl6HU=;
 b=ee+7RjHLkfzWTqorDUI7R/YDa/Dl8umtaZ3cG2J4gnPJKeIZYMM4wLSfJhUxP+Sq9D+x4ODAJH58CvvKS7IVVSmm/4hIw7R7tAm7zelJdv+g9/tQMhDOi3I2Wh8j04aBc2WusBjaiZs2+FCLDYzLG4AmJudzTLUqL3DRE/jdtShkHSi2OhBFZFY5jhvavX+Ng2+P1BKi5JlksNdeLGcgUZRW9QazsXSEVph9GhPiGAed2rQIyTVW2iTTXF0MdmRG77o63oZZy4kjyTAP6eAHdfcrlRdPMheNo5qFGi33UTDhYN9qgNX8e67nKNJvJqP6/dqF7jyqHtlcygDOKdvUAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09BkqVNIF6Vem0C1TjyDSHBfBYFKTOtLVRkiaoEl6HU=;
 b=K300MvX9DnCHZsqaX/SnVaG4JZWRTbcUfX8qDfHa8Ujzz2o+F0LjAZKpWOhtMh90QynVrYj51BBXI/yDF/eOyZuNpRlWiwj32Or5/gfjReCFZmBB1FGbLA/Jb5fPvERvlr/+T4URjdDPOn1ep6e7AOaOT+knRk9KTFEdEChtp56MUsXArp7m4SCs6ici4gmWFBLc7Yqjnee5szLqhmcrDYV09TQ4/JR7tH/Y991vMvWw7HAFTQSHVhbxsb5+nYR39+dr47sbgwf1U/pWmpX2nSiyaYz7y11RGFGpSudZiGz5zBOIH7P2rX0USq6L9ddjaE0gGjSKlfRQQYtJ7L0tZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VE1PR04MB7455.eurprd04.prod.outlook.com (2603:10a6:800:1a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 01:40:12 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 01:40:12 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 24 Apr 2026 09:42:27 +0800
Subject: [PATCH v6 4/4] media: i2c: ds90ub953: use guard() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-ds90ub953-v6-4-7a84efbab316@oss.nxp.com>
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
In-Reply-To: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776994953; l=3323;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=wDpgp0zs1QklpvdTjPRwbQWwrPv5sdN6HH2vrTqJEG4=;
 b=LlyMPNZopaY/6EcOkyiqY6+TAqplY4mbKcV66OevkYYYcWclXERC9srwiw8UUAUG+wSl7NTkf
 9ESalBc4f4JA7T+1sdKVA4XYQLlEASjMpvx9T07FfWB85TRXgr3Zw+D
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0164.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::16) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VE1PR04MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d05b25d-59b8-498f-e6f1-08dea1a26d66
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|19092799006|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	1wFXZNfESbfGMqgyGFzGcxxAOeKmvdxsnXwOYkcCnK9zK0kACFHloInhmRqQ0qelkdJVYnXmQ60DKO2PirNTy3PmKHJ/QpGs8G1ap6xnb8tjQDwkPFDHB73XHZ3b2TaiakhaQWXJqcHszaxv4KJm3zlEhKnoRESO+tdxeq0L5KFSBtAzC9n2BhcaMjo1HtvQiybyR2Erm0R8k1nhvmusOpycydLW3LHAMNQr3vMKItJBDq4UUsBpqPVI4GV0z6Cy3ltuRfW5sgxx5glSZ/SYWh6iaxQzAWwiBRN3gIhRSBygUYH6R9xN6b3sccm3SdtGr0o4ZW0VO0NBMKhuDDCtsh9hgfqMYznAbkXnkLNgKkNmDirk1qup68BfWZF7U7Aqb4S9s9W7Qf2ziTAa5TcJ+2hOKZ5T3hE7kiLPoPi+7nD34/wT6MgD0wR8kC6SrDDCp1BcuBbpDJ8Rz4sOcBuPZ1pBCbErmdZkDtcN2UfmjT11CZ9Oar9yEpzmAiVbPVTogUbzZtdjZbcCwazTYKh6Z+qk8cu4lbtEG+6Vqb+G1nUxgzGG3xDeRUn8uZOctfWx38+44xcHLdH7SHye5qbitN+spDvyq1JolJUaqovzkSaChJGZi04chRqcSlGftclHbMtgpFMleYeQTWPvIMnx8di/e7kLTAJVYvEw/h2v257Oy45DFiyUYGFdJnyZJrNRAVaYFg2VUXKbJQXRGosYvhsmHPaXtclcYy+2K3bwSQNmcR+Go1GZ84EHS1lrpqumG1Z9W11bLQPuo0Hb3ZPv5+TKe+sS/wbZC2V4JC3cryY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(19092799006)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTBtVjd1NHNTQVZ2RnBxZ1VmMVI5RHFscUd6Z3ZDd3lhV3gvT3JuSWNDZmxV?=
 =?utf-8?B?Y3JwNzF5TlJ6dDZMcDBuZ1UzVHNKWUZuR3dZZ3ZkcGI1V2VjdDlXMzdBYVha?=
 =?utf-8?B?Vmo3RHZBVndyTWgybzZkemFKNjEraThKL2pnYldpekFEVElsdlREcE9wQnd5?=
 =?utf-8?B?QjBwOGRmcTNqdzdzM0lHczFRaFYxUmFwUXdDK3BJYjlIcDFzTGh1WFd6WWlX?=
 =?utf-8?B?eWsySW1INkpMZWxUWEdiZExqMXdFL20zMXFJTXlCcDd4YmpNV2F0dFp5OW5y?=
 =?utf-8?B?c3dNVzVYM0JFYzhLYjg2V1NnRkMva0lnWFViTXdtV3ExYUFXWDVBMlBvaWpZ?=
 =?utf-8?B?YmNhOE5ienhsaDg3bTJSNTUwdG9ENUpLOStQMHVJZGExeE1GcG82R2xGYmUx?=
 =?utf-8?B?a2NkUWdzanpHUHZHRnZkOEwrOGFTVVAwWHZLakgzak5RMVBEK1VQbWNrc1hw?=
 =?utf-8?B?RUh0VXlFYU5MYUdGS0gwVktaM2hJbjg4WTNDaWhibEI3ZHNibVFjTkhlUmFj?=
 =?utf-8?B?c2xic05iMHd4T2h0dlNGVzVWZVhTQ2JscXc5R29VUEpqcnhQMmEzN2pDNTFN?=
 =?utf-8?B?UUlTZm5zaUQ0eGVyK25MNk5Kdlc1TnYwRjFON0dSYWl1VmczSU85U1B2aEw1?=
 =?utf-8?B?WW42aFdQdEExdXNCRnVLTDAzZWhrcmJLOUcyaXk0RDBxb0k5cmZnNkZTbCtn?=
 =?utf-8?B?TjFnWDJnVTg2ejA1RDk3VlRYUzBsWVVNTWpTQTF3K2xNdDd3dld1UUlFUFBl?=
 =?utf-8?B?SUlLTXpJRHFBZlpsNkNIejYwMGZoK2dSS2duRWFUc2ozR1k3YXVUbTBBL1gw?=
 =?utf-8?B?d0NnSXhNZHB2ZmN2SXRYZDVueS9VSlp5MGJUdUcrZkxmMlM3emc0b1l1M0tB?=
 =?utf-8?B?MWVoZHpWVlkxeld2U21kZTBUVXdtRmsrbnQzUWNTdE9ZUzc0QXBnYzI0QjFF?=
 =?utf-8?B?STE0ZXFsNHNKZ09POE9pZWNsZVYxcnhHOVduNFNHZzFpOGgyVWJRSXB1SGpj?=
 =?utf-8?B?SHpRR1BOMzl3TStpUHB4Q05SbFpkZWVYTXpCYVgzM3BnbmVrOFZ0RkJxRU9G?=
 =?utf-8?B?MGpZa1R2MVdRNzhRRmt5bW05ZEtzWlU5L3FpMTdBMmR5emFRWXYzY3BzMnRu?=
 =?utf-8?B?VXNxR2J4Vm1mWHJyVXJoZEIvZFJZT1BpUXBxMFRHREdaUmxqYUY2b3JJd29n?=
 =?utf-8?B?NDEyMFNvalRjcVZEVDlpdk1ZdHE4STlhR3ZUdUN0OUdWQVpoeUM4a0FXWU44?=
 =?utf-8?B?OTVZdVFIdkxFenJPbUtmTC9hK2JCUzJicVM4NG5Ebi8rV3FtWG5jQVdlY2dS?=
 =?utf-8?B?b2JydWxub2VJWEJDbFVINk45QXJrZG5QQjlvN1NRNGg3VkNrSGdWVCtxWFFx?=
 =?utf-8?B?cEwvOHNrNVdQZWxueFRVWm5QU3JlbXAvTy9MSmZvVGh2UjhualZGcm00WWcv?=
 =?utf-8?B?bDd2TVpnbk5PTFZ3bTd4ZWljZE50TlhBdkoySmxFOXVESjR0NVFVaEFnNCs5?=
 =?utf-8?B?RHNzVklHWDdhcWR4NUpuQjlPeWp4ZjlSMGhUVmZHOUMrOGh0NEFCQkNWUDhk?=
 =?utf-8?B?dkhoa09od2xTVDQ2ZjJ1Uk9BOFFXWWhMSW90TExuY1dGMThXZ2FQZ2l1QzR6?=
 =?utf-8?B?Z2JYUHJaZC8yOWF1Tkw2bFc0cGtXcFk2elVKaVlHYmFTbzc3d0FodjRuL1hF?=
 =?utf-8?B?R1FSekVKK2JubWIxRmErSzhEOGZ4Q0R5QlFMU0NlNzVwOWhOR2x3a3hVVU9v?=
 =?utf-8?B?RTRjaWRnejV6RlpNKzdLRklQNTFVZ1dyMTVSQ3ZobHFFLzExK3NWVUJ1eDRx?=
 =?utf-8?B?STZBQ1dSUVpmTGZxd05aR0NFaXpJN3hPZU1QaVN3SzlBWnFxL1pab2N0cXdu?=
 =?utf-8?B?dHdmSkthUUU0ZEtqQ0dDSE1JNWJ3dG9SOG13OHdNZi92RWpvd0k3cVRhZ2dS?=
 =?utf-8?B?TGY0T25SS3dyeTNzYmpSY3J0QUxEdERVV0lmdWxNQnlNWXZvTFFHTXltVk1W?=
 =?utf-8?B?amRBMmhUZVhGT0NRMnFQNGVHelJlZ2lveU5EdE0yTnB2Ni9NV0p3Y0hUSWNn?=
 =?utf-8?B?ZHpUZDVRZ0tRTW45c2xHajVURmcyeXhpZTAyYW56bjBYMkdNWTkydVpjUzZB?=
 =?utf-8?B?bGtBK1A1NGd0R2ZMUkhXZWRsVjBwMVVtSk5MREc3N2prelF5Z3pWVm5tV1V6?=
 =?utf-8?B?Vy91c0pUbGNoVnlFSnlkYllTK1MvYWgxQ0FkSkdSNGRwUlNGMkNxdzZhN3p3?=
 =?utf-8?B?VjQyY21nL09RdW1rY0QrbkJXRXRpNTNMK25ibUxOaHdKM1BxNFc1VmlhZ1Ez?=
 =?utf-8?B?OCsvQzMzNFBkL2hkckk3QUhNaFAwYWFPRGFEWjUySGFjckxXSzlndz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d05b25d-59b8-498f-e6f1-08dea1a26d66
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 01:40:12.6509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uow1FgpajdVKxzMnnUASxWEr3BNSQIRJGTcS3GiuUbOHpSbuNPh1INuGrcT4DOVBGxOJxAFBfvpNkQ4Hum9QWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7455
X-Rspamd-Queue-Id: A97F5458DB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35452-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Use guard() to simplify mutex locking. No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v6:
- Replace label "err" with "out"
---
 drivers/media/i2c/ds90ub953.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index c37d9cbe88b9..a351d366cc3e 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -114,20 +114,18 @@ static int ub953_read(struct ub953_data *priv, u8 reg, u8 *val, int *err)
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_read(priv->regmap, reg, &v);
 	if (ret) {
 		dev_err(&priv->client->dev, "Cannot read register 0x%02x: %d\n",
 			reg, ret);
-		goto out_unlock;
+		goto out;
 	}
 
 	*val = v;
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+out:
 	if (ret && err)
 		*err = ret;
 
@@ -141,15 +139,13 @@ static int ub953_write(struct ub953_data *priv, u8 reg, u8 val, int *err)
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_write(priv->regmap, reg, val);
 	if (ret)
 		dev_err(&priv->client->dev,
 			"Cannot write register 0x%02x: %d\n", reg, ret);
 
-	mutex_unlock(&priv->reg_lock);
-
 	if (ret && err)
 		*err = ret;
 
@@ -186,18 +182,18 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub953_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out_unlock;
+		goto out;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when reading %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto out;
 	}
 
 	ret = regmap_read(priv->regmap, UB953_REG_IND_ACC_DATA, &v);
@@ -205,14 +201,12 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_DATA failed when reading %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto out;
 	}
 
 	*val = v;
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+out:
 	if (ret && err)
 		*err = ret;
 
@@ -228,18 +222,18 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub953_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out_unlock;
+		goto out;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when writing %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto out;
 	}
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val);
@@ -249,9 +243,7 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
 			block, reg, ret);
 	}
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+out:
 	if (ret && err)
 		*err = ret;
 

-- 
2.34.1


