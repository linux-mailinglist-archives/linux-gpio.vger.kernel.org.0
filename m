Return-Path: <linux-gpio+bounces-32194-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BRGLxKMn2nYcgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32194-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 00:56:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A43F19F2E1
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 00:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0449D308A419
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 23:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86316387363;
	Wed, 25 Feb 2026 23:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oJ0KN4Ic"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011034.outbound.protection.outlook.com [40.107.130.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE11387378;
	Wed, 25 Feb 2026 23:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772063724; cv=fail; b=XYR19nUCJO8H5NWv1d0RpdfUnIZGEf5nNwQ3BxcgpVnW0L94tLgho+D3IF9HCjRZHDI2NEF3d6reXo7OnmB32gPvHw1crQyX80YsqvG/bJUdjq9Qpu16+zxrvZ/ULlb30q6MXi3YSEb6hiOPdp1Apr5ijINqcgTnLJEukvCq5ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772063724; c=relaxed/simple;
	bh=R+sFjmiU24arthVzr8KSPc7GoQZUvHpvfgrliX83zYY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=q4DnD8ztxC51uUeg2YjpeEK/3ETd9x5eKsNwCYXIr6nd3Vz4LJpadRSLwVIPoe1+Zz50Fq9hFAg8W2kTZlknYDe7PZOw73nKXZeeKU+2I+yYjlrWg0hTcVHskODPgG8U8Iw67azdXcOrnaW+csFcqHXBgmb2m37VbUB5hczSqac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oJ0KN4Ic; arc=fail smtp.client-ip=40.107.130.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iw3yiTn0BdlmiCqDWwEY509SslMm+Vh116WkHgZFBnvOkpMgEpY2n9nY6f6O61xEim4+WB0HsoBDOlDzBp9YDTPmNt94EY9H1ur1ENqp2/AyNAESHDCxuO35ZjX85YcKGewZfliEdop2VOmaeeOvYwYXuK2WExv9WTbH+pnYJNSOxNCV74VmwpI7D4CCWRrEBRMa8HPS+W7JBiuvQWEsLkEB0Sd2v2D/Urd4ntY21Sl+ATJ94KPout371gzQpuTdOflmyhHzBl54DtXu2Bd9/FU+Bbd6Ei5hQ38PIjiBy1400nSYY5KPoEklijSKArh/R2IcCBHI7zYICxSd2craHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+scYNF5xd6xXB+7r0j5hCGjS868yaJZfaEBtEEMZbKg=;
 b=gBvKLAfXTAiX4EeESVQQsQwU7JYvLgRCQ4D02i2l6xHflFXOtWS+ieey87l+KPWMCChkQ09cceG3WhgdWoFCNHoh21qxMyQRRRFFjbgJ9mQJ+8yJLCIr3SngjqM29kggKMMeCa3Bx+Ea+GDNwPFRXUvmyMqMFRoyIASdBkliUjvFr+GROhOGsXw8RaO8FMXLsAR91+fw7+4pTf4t/xQBqu8lEk8gUllxWFdZnhPB3MyWmUgYj6J+Wr2GKB4eFTN8jmKgbSWCfmtxWCmivVlzHkDHt+VIgdj5ipup7SOjMta7WbuHgUq3PyLmmBPFux0d/ooU4izV/1D2lk5ktlN/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+scYNF5xd6xXB+7r0j5hCGjS868yaJZfaEBtEEMZbKg=;
 b=oJ0KN4IcVEYTrF3gqEFT91ZppHs+KmlVfv91pWkKgBNjEWsQ7NDnxRHcB2kxOOxrf/8bbW2LKEXXk3ZXuUrdrk94LFLqln6zSAn4CPxJ/1/vshsnxP9JAoe3hxF6ItXgXPjbbAaeHASnkQ9X5gAEEpiOZDJTF8bCL2P+Jket9sUJPQ0iUj34UwUw89vSTrw4lmOAIUopjnnCxcxErpKfnDQTBaT7vkYCuqVGOL4BZIUV957Qr6e+KlHFV8tG1HmX92Csx5GLHrzOJZ944t0XU31oxXNsJ20DxGLd+WZnIa+7I9231yO3Oho+91VAZgekeCzmC+UHhTyy/kadQtsIJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8771.eurprd04.prod.outlook.com (2603:10a6:20b:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Wed, 25 Feb
 2026 23:55:20 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 23:55:20 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 25 Feb 2026 18:55:05 -0500
Subject: [PATCH v2 1/6] mux: add devm_mux_control_get_from_np() to get mux
 from child node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-pinctrl-mux-v2-1-1436a25fa454@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772063713; l=6437;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=R+sFjmiU24arthVzr8KSPc7GoQZUvHpvfgrliX83zYY=;
 b=6NtvY/hCjTrdb3IuFV6qSSX0b9Auk8eeCsZuEkFMbld1bwBvu8m3Q4Zsygu1fSQoNB5NoSFoN
 wLG4Dv4YX7lC/VA5I423X3aBpFvev1vcgRZ4Ur15Aq3mtZuRLyoAyUi
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
X-MS-Office365-Filtering-Correlation-Id: 87a47117-3748-4e63-6618-08de74c95536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	DfSTUqu+OqWrnr53WuLc2r3IhHVFwfhFCVkL4ZHzJOanPCJBV1euquWzqx1xTlVYOwZfkLT1q1KhPsH+57OOhFETE1NUuj5BDVgKJLyPgyMMsd90qioZ6YlwAQ1f7PvOlCozH4duwRH1t90469Zn4Kbxcn7Gc53iVJBKyXtLGJRXtdwSwtSxzot3P7I9iZCEp1bnydNCGbagdPzNfpKmamIWsoNG5GTx/Xyy9YodofrORSY00T/FvrdxxLBY3sdTt4thvsgPHc7yPs9603KGkOhCGHk1qdDws8ROKZB0mdfYdY28lQ8+izPLF4yEPSADnZDYdvAMxry5HVBwlBs/V97ksbq5TW2JukczaO/QNldyo17E3zeeSe8L0lfwFiNW9icOHmMqqO51p3J67W8IiomG/gwSaeoB4WKcf99GdmXhQHjTC/S2hDTOjbHrGnxEr2+Mdv/OHqFgjy1jRD5KVQQL7H2PMVKSWD92ud52fnFojW8L7rX+o11/HQqLzva3KduPVPoQS414eCNblC7YBaqUtizX1KoRlrF2cwuqpYHPLe7A0RkRN7ls3T7eTmlx/TPye7pH9wXFA+m8Xh756aCc9l/qAW705yac1Qzdg4Jq1f2qUHC4LtNDUxEHKSQPJ6NJG0XPii0PvielOva1uye2X75EMXCwC1uCQVQru5CLNjMKB2PUxw0LpgCZ1bXsA/EhXj8JuZxBhkdTwpiAL4MqcOSIXUjT54pkZZFe+Utni6wL9WNqb6gOlQ5vGJu0QAGgohe2KePxJEeE+pdFGrs8V0K+S5bZpf7QeFByAW0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE44VTA5eDU2TlV0L3V2U1I4NDllbXlYSzd4RThoUEFNRGtEYmlrTndvMTlZ?=
 =?utf-8?B?Nm5UY29ZVGQ3bEdURXozRHpTejVPWk01ZFV4SVJuSkE0ZU5YMnlSTW5mUWlK?=
 =?utf-8?B?dFRIYURpY0FidkNsL3dXTy9JMmEvd1FObkViMDlvODZoMFFodjYrVkNYUEpI?=
 =?utf-8?B?NW5lSnFRVTN0cVU0M3FxdkpDZzNZUWRVRHdRZ3hBTVVsWkxQb05kKytVVTdj?=
 =?utf-8?B?UUEzQzdlUEltcGxlS2Y5VEdNaVozWFZQSGVOTGcvblE2SEJHcGE1Z3V1UzRm?=
 =?utf-8?B?aFFrTWN4bHNmTHNIZWgwNXZFV3ZJTnArWTdHSHpreEovZzdGNzZHaFVQUEZL?=
 =?utf-8?B?UnZuckkwTVNpMzZ4c1dLWTV5aUVLQnZaeS8wdlVqdk0zb3RVSUtOc2daWnlZ?=
 =?utf-8?B?ZkhXclhVZk5HL053ZkwybkJ1SDNmT2tMYmVTTGNOQS9aa1JTTHZPNlNsWXNY?=
 =?utf-8?B?MWE1MHJPWUpVQjBEL3djWnpxeVl6ZHkxdm5PY2dnVi85Qm94c0VLa3lSRWps?=
 =?utf-8?B?VFZ4TXE2S3pVTDk0V09pRWdXNDZMM1JkOUxwNXdhakp2STd3SWlHNkR6Mk0z?=
 =?utf-8?B?OWZBaFNjV0hLbkdyMzcrTTM4K2t4MVJZYm5RaFRKUFFYZm1KbkRERDZwQk56?=
 =?utf-8?B?a1VvZE9MSWNFdlFXeFIxZVZQRjZmZGZwUVJvUkRPSXRqSExXQ1hRWGRvcHY5?=
 =?utf-8?B?Y282OUFMSStkWUx0VStNcjVRcHc2ZXRmeUk2aloyMEZvMWlLNk9yZk1ZRit1?=
 =?utf-8?B?L1FPYnZmS243TW9kZVVzQ1FIdlVXckhYaG9CUGo3VzJEYVdXKzl4TTQyU0Rk?=
 =?utf-8?B?NXRtNHJqaE5ZWm9iL3FlVXBOcDdGbFJLd2RQQzRwTGg2V043V0RFV3MrZzlm?=
 =?utf-8?B?OCs3dlFzTURJTHQ2R2Q4b0tRdUdSK0s1cnh1anNhZTcvRDRqbnFOVE9DM1Jx?=
 =?utf-8?B?YVVqbDhmdU9seU1aWHBONUt2NXpVeWFUSEFkK0NZOW0wTEJLYVI2SERRbXJm?=
 =?utf-8?B?VGFkbzNmMW1PVFRpT2k4TFUwTUhSQ1Vkb0tyOWFQeGpvTUNRM3lmU0k5SUhr?=
 =?utf-8?B?UGl1NnhpQ0FoQlZCU2JsYWRDSnRXd3B2anlhTTUxRGFCaVRLaFVNT1g5QkVy?=
 =?utf-8?B?TlBlSktSS0FJa1hOSHl2SVJEay9KQzRreEhaWmhIYWlWQ3dISUYwMlhKMXRk?=
 =?utf-8?B?NGNaSHZiWFpOSVdIdWtXKzNBZW9yTGtpR0dnL0d3V1ZSR2RJWWFVOW5obEMr?=
 =?utf-8?B?ZVY4SDRDRlVudk5hK3ljMGkrZUJaVkt1eU9QZFRGdERZTXNCYjRZYVgxa1lX?=
 =?utf-8?B?VGEyZTBNK1N2MEpqYmF3VzMxdC9IWkU0bkZmcGZHS09nMUNHb3hzMHN1Y3dq?=
 =?utf-8?B?RHhNQUhIeWM5eTAxQmp1ZGtZT0RWNVVmanFING9VcDN6bENNTTcrR0t6WHpz?=
 =?utf-8?B?MkoyNlV3bjVUUDI4YUJ3eDRwbGZrQnlERFc2YkZxalZlNzl3ZkYwMjgzL3FQ?=
 =?utf-8?B?cEE0SUVwcFlMc2hIQzJtMmFVZmxScFhCeUt2WXkyTFRxYzJ6R0lJS2pER3Fa?=
 =?utf-8?B?NENEczRmRXNMWHNid3JRdjIzRm1VN1F3ak1vS0svM0lrZVlvb1M1bVJOQ3Vn?=
 =?utf-8?B?OUNFSVE2QlgwS1N1SisxS1YrNkNmVkNmZ3BVRjgySXJLL2tNN1RyY2ZRUlkz?=
 =?utf-8?B?aGRlMUdreXBsd0RBaXdFSnc2NmpveUVwbGhyTG8zSVE3SXdmR1JHNnh4U0k1?=
 =?utf-8?B?QjNJb1ZadFQrUzJnZnM3eTlUTFhTbVdtYjh5NlUrUkw4OGIyUUhUbkhnY2Vi?=
 =?utf-8?B?d0wzS1d5aE1NS29SWncwOVRJU0tKRGJvNndjZW5vYkE5K3pndkJ2MEFXQVl4?=
 =?utf-8?B?R1Y0d1B6V1FLUDMzQksyV0hKNjZtS3ZGR3FuUXJzNUNFVUpQQm81UGRWaUlH?=
 =?utf-8?B?R205d2VMWmJndkRCOGxvYmdOWExCUlpaVHUwVUYyL3R4RXVKVTQ4dVo1aDE4?=
 =?utf-8?B?V29CNnJOWi9jNFFLbGxpSk1vUjA1MS90WmZ0RXVHSCtwUmdRVm9xQWhYNmxX?=
 =?utf-8?B?cExQSldidWZJSElpc3U4eDhDRjh3RjBleDVvekZ3d2h5ZXZuOVdXd0YwcjRl?=
 =?utf-8?B?K3JBc1dEN05ra3Uxa2VqVTFCQ25mb1NLKzZNSEo0Qnl0NDl2ak9TcXFrOUQ2?=
 =?utf-8?B?cnExak5PWU9uVEY4MVZhdmszY0U4VE5LUC9pNWFIaDdlZmhxSnE0MUdRckd0?=
 =?utf-8?B?amdOUUpZWFE0T0tVczdjc25ybEVjV0dONzY2Q1YwL3FiTU4yeTltelJrMjM1?=
 =?utf-8?Q?GZ+GHFjoOL9EmH1gFx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a47117-3748-4e63-6618-08de74c95536
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 23:55:20.1903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IUG+FeXI4xqvPdjGa/I8Ts/2WfOqVjWoiME2YMF0hbMXIoKVrrxdBO57DtaMNTTd6SEwywrkHCcf5xu4TkgAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8771
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32194-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 6A43F19F2E1
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


