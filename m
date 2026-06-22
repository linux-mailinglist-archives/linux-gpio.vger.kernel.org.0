Return-Path: <linux-gpio+bounces-38801-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 62H6LkAeOWpwnAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38801-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:36:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A476AF241
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:36:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=OPSytz8v;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38801-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38801-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB5D5308B449
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF734285C84;
	Mon, 22 Jun 2026 11:31:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021119.outbound.protection.outlook.com [52.101.70.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB0F292918;
	Mon, 22 Jun 2026 11:31:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127880; cv=fail; b=GgMohM8xpeOvVZfEqZVmbGZj/UgIyUKwKzYT4hpwsA7HRYJt9Ra3vgIebtD2fNiZaKiCXdk3QbImO9gQYWP6tnyDVpmlqrK2wSB0wNTK0/+2SlDU9zCPZaq5x/1xyRO0DLUYeeBuYJsSUZVg06RdasNC+WTC3z4nIJiSujdiX5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127880; c=relaxed/simple;
	bh=nYTPP7H+HfCc+o1CovK4reLfxkITfp85ALLHLic84dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oy+FsJuLhINMOnqadIUxlue97ZMh+LOlPu3fjHLkM944WmXr+ifOHZeWsFY7Kv7OaXjjkA4SES5kXNCJQLpAAMcxyZVCTjbFfsXRXDGz7Wd6+dGUZgxi1VC1VMiRwg8JoMX4vbAHoK8myoGpD4w886KJA9dED+4CrsztbeCPYKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=OPSytz8v; arc=fail smtp.client-ip=52.101.70.119
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9/nPj6Pj/LzVmIemr2yCasigwdnhOBJBzSmeE2K7IkdHEhX08Js0Fm5ELgRi9Q+nMzJ+ufAqnVuMV5R+LGqY+mdr1nlShITn6HuFu1IGqF0FbosaCvSKVhPdFprwsvhZOP1xVOxx6uZ7zv1U0n0WLxRulOwiNhkkMOD/PtPh+rp5/JJjVRwhJTy1akeeI3+YHq4D2kHQ0KwSnAvE+nIZd7B8WOqjLUyy39bZUKcFUJq8bMSv47BrW3mqzFiUwQOIrdqokcpfeJ/O+sZ5e7wUlfGZgDdVOr2ZCrLaCWHDhg3hplRGJIYK+OMjXvGUT9smvTjnn8CUYUkqCXbVCDbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1Hau7SIrmzMOW2cf8JjdiYs8LqR/zsesOtg5jYYljM=;
 b=XokCx8CIWl2V3Sd/4ad4FKZahZzN21W81wlaS6lPKB169E+/5cbwakSOYgDR/ugKmFM5rTUtZSZz6Hn+TC/ujmuZA6wT54fcLQyZwPnVLgDR9rTSYx0wbVvSnvlM84ZwFhemARq00X0MumVNQRkVMtfdxtoTRqahzXZHlU806KN2NacigZQfUrZm8EmThRt80CL+zHZt9UR439FPYuXhyVVuDKVxvijz9y8LRy7vN4gh7m7bVEVYNZVDRwx2dh+entFoFezu9kCuK4jX1GfFJWbGyJ4VQ4Xxsf3uPV/cVkGPVnjXZ8EKo5KA55x/844NDapdv/hRxoVBcPU5eG5ifw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1Hau7SIrmzMOW2cf8JjdiYs8LqR/zsesOtg5jYYljM=;
 b=OPSytz8vEmL6jfBJdAPCb+2kzX9SrM5ejph1Bad1gtjj8eVGpvwERu2UJc5POT7iDhMJDN0YF6I0vkZ2wg7ilkNLSGdD6nquVGsOCpmMnGApsVZexWu7yTI30EGUCGlz9bngd8T7F6EMkt098U3fVxGWNtlEtofCw32RhNnXvwfDUp8vpTJuu4ZCcuPoiFtpTlxgeY8uE0IY3c5e3RIUw4jYBv1lwMmg4OlZqWOt0exRMCqLhk2Tyqdz2stIK0pzw3UuESf7x1srD/l8jFacqbHiQLzpul7p5DgemQrZCRVrCYDTFOjoJ7vnaqC5PmQOEB9ZG3NZ7CdOOEcqFNlhXg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB8334.eurprd08.prod.outlook.com (2603:10a6:20b:556::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 11:31:10 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Mon, 22 Jun 2026
 11:31:10 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v5 11/16] pinctrl: airoha: an7583: add support for npu_uart pinmux
Date: Mon, 22 Jun 2026 14:30:41 +0300
Message-ID: <20260622113046.3619139-12-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0021.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::7) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: ec006785-ea5d-4fae-df90-08ded051c1fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0d9tjjcCxgt2Dw/1b9ScJpZlGqir228pLw7BHjBH/N6Go72TRUTDWwN8KjXq/mQZ3Lbodjdoafpqn4H2P263IuFd2g8gaUfmn/bmIszglDlt4x/fHooa+LRHQUVnPgw0B3YNQmSfxVdzvuflDstL8B9JV7oB4K4vAW7gibiws9AiIFTlRfGOBnsgEObLaBG2RXXejB0feuhvBWXXm9y0KmZI8p0PHTqU5LQf2oCMH3aNbg6fAyOh50W42RAYgv0xJqGdz+mX5tgZXk8S273jlN3RUNqDgGH47A1b90jyuKTlXjUsNoXgAIoRPvIAQofSpO9IZTtQmNmICMxBFDRVddT4NXuzDAwXGSB/2/Kf9mAc4rphXF0KZWF9Lg9ND+nrj9bJzmUFErinPuAyX17noKOgm3Y01LrWtrb2qVX5sOjUPy8SRNaRsyfmiaXIgcuj2aH7RqYWzFRK7sj9wx36HsxvD6TFgkXYLqM2fAXsIfIpS7TXel9kHN6+60sZwmjoAp0+vZMGxnYyKIdBbvpaHfXDvGRSx3OsA+Fjt7vB8SbZr5S43Vn7z/VoLm67bzcKAUBDdm7LL2vtzC0r9EdWcbudQ2vLVqIGnf30nXEqeQ5/g2Sa3hDbkOVP6rmcqu5P9RYLItqA0KPIjhLiZ7/qK+IEqU96BLFSidRHKhFFw6ZuyI7yWDR/+46rz8MewfLSX0DJQ4+TJpPQq+5FklMdvXenAx6Ny0FFtzZUKQ61udzuy+b4ksUlwd4pM4RmQWsR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zak/vE/PmfsvVHj62djFdsSKKGMmF9OBElItXjJuWEKuom+TKl4BwjmKLVpf?=
 =?us-ascii?Q?hk3neygJECD3n957Ljp251EOwo3xUMqKHX6/goHEFn4yFrcq17ujSezJdmof?=
 =?us-ascii?Q?zN5RX3jYax1UPHZOKfm0udRhyD9n+YYMFtnp7xYE13DjidKpd8OduWHjRYmu?=
 =?us-ascii?Q?SUnqlCiK955WMP09NszxgPRtBxCaXoDcwENAhKj3s/6ugdi+gnobXB4S2GkV?=
 =?us-ascii?Q?azWnHSnLl26zZh9/P6vsRreBh513SQ8LWMK7PX0+/lgatOCinjnR8Mw+rBDm?=
 =?us-ascii?Q?2tVvlqGzn56IgNdtynEACh63bMiDFcZvxyGYBhD8xWaFE6AoTvtR+F3+J8wF?=
 =?us-ascii?Q?sifkZZD0yEwDjTixGPTyY8DjPoWGxyd/EplYqpJ7B1n1NLGipXbDo14l5U8O?=
 =?us-ascii?Q?1hNK9gtAwKXrFyaToLzBIJkk69lDa+GEtdrv59PHTPcqQ3tgMlLin0mS2NwK?=
 =?us-ascii?Q?uIyBWDdIX+TwZN+ey/9cTuF+PLvVxl0BS6v6OOEuFQ2drK4l2FqKR3Z1ggGw?=
 =?us-ascii?Q?RT/wTFUQB88gJoFg/y9RoHyzokypx/sxMW82/PDxpa1GDc5fxFjRCGoEkzh9?=
 =?us-ascii?Q?Pql7VZAUz+S6ak7dUG1dguo33PSnhAAKkZNhmuZJ6Oi2ubPrfR4cE9udMALw?=
 =?us-ascii?Q?3c95NTAY9yf9YMMnvBlBqJ6Oz829Ygm7rcI+WU6DAT6ltA2+uRAH527zdG1T?=
 =?us-ascii?Q?xYUy6xAY8/yqELS7HBIO/lNelLb9wueqfh5+cx7z71QGsNUN5SPdIzIt5w/R?=
 =?us-ascii?Q?Jgzs8uYRT6j5ZrAbvlnJ3rjFJkK6+dz1tLysDKnd44M7SGothmpYScPF/OxY?=
 =?us-ascii?Q?ZvBNZRm+dcK9DzX+i60cDwc6p2TUrzAYdF7OwzPC3SAlPTrC9+xwqezSSolE?=
 =?us-ascii?Q?E+QeteXPJtlU5aCjQsiaRXYiYvzyKJl9jAZixlxoAaK6oRQLaAd6W+yQUcS7?=
 =?us-ascii?Q?doyHCmZaIpXyJrOC24v874NadGyMOAhatKctpyJ2PhIv6b8JNVRpNZ8gyooL?=
 =?us-ascii?Q?OreG6kgnfPXi1Z+7PbqsmhQHGLzxOqGolTpGKWdKs6on/FSXmaiduVhMjogx?=
 =?us-ascii?Q?+VB6KMzk+lHiCYsENrPz2gLnM8gSWcnggcFhe030wQuRoomyI3uvN5o9K8Fs?=
 =?us-ascii?Q?qezAG6qfANQVS9IMqF7R0OEWCyQE4MP+kAmZXAaOPeox8Bv24cRdECD0lKVK?=
 =?us-ascii?Q?31fSQXBQbjU3cXC6vkILvY0o0t3cbU5X1ubFa+jqSDUlSD0rT0bJxzj1Pv4a?=
 =?us-ascii?Q?zuWXkO3Rpw++VpQg2cGWIsQV4WKeX/qjxw24GLBjrfjtVhcwGV3L28T378el?=
 =?us-ascii?Q?rJf5GWEeOQ8sw/XQm2evxAvFJJ4kVAc36UzAnDjoeljOcBjt9wumOVlu5rwl?=
 =?us-ascii?Q?qa6BKswRwHN1cf6gmhB2b+K0h3oasL2jWA8sb07JUcuGpY0P96O64/gF1PRv?=
 =?us-ascii?Q?v3l1jEWgicrU5swovStk+eR9q8XHOAThffbBN73fS6AYXp568n5jJgmI4c2B?=
 =?us-ascii?Q?BoycxvfR0ZMNCdaSU4lsyIrA+WHRKsm6613+WCnQ7g/QiH3XQLTalxS2Kfxq?=
 =?us-ascii?Q?etDmXt3wxFvEpz35fXCjvi3Iz0pZ/yfsLLZKJqF5uQf6OqPW+Ltcw5BQ+mc0?=
 =?us-ascii?Q?IxLNjvvXs0J1HmmxbjRBet+vbZbgat6eolfCp1pCugcgVCJfio9Ap0b/lFJ9?=
 =?us-ascii?Q?z9jQyfD+39IvIqvVzBN1aSr3ZTP9PpzzYSAKdnpvh0LHo/NwDHYY8YqR8SPC?=
 =?us-ascii?Q?765Soez22ngan/2DcbVqTC4RlZoSFPQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ec006785-ea5d-4fae-df90-08ded051c1fd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 11:31:10.0517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NC2IUPMqpGytUYRbJUFIrfmgtLyhBK8iWfvjT8b0m8zLOLvdoAx0Yfm1IiJPAwH18FfiR2c+Gtocy+2QSwdTvFeBcVCpTDFmVPGxRPNNtB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8334
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38801-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13A476AF241

add support for uart pin function for npu_uart pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 2f2dbba50b76..0cac9a5646ff 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -68,6 +68,7 @@
 #define REG_NPU_UART_EN				0x0224
 #define JTAG_UDI_EN_MASK			BIT(4)
 #define JTAG_DFD_EN_MASK			BIT(3)
+#define NPU_UART_EN_MASK			BIT(2)
 
 #define REG_FORCE_GPIO_EN			0x0228
 #define FORCE_GPIO_EN(n)			BIT(n)
@@ -569,7 +570,7 @@ static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
 static const char *const mdio_groups[] = { "mdio" };
 static const char *const uart_groups[] = {
 	"uart2", "uart2_cts_rts", "hsuart", "hsuart_cts_rts",
-	"uart4", "uart5"
+	"uart4", "uart5", "npu_uart"
 };
 static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
 static const char *const pcm_groups[] = { "pcm1", "pcm2" };
@@ -754,6 +755,15 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 			GPIO_UART5_MODE_MASK
 		},
 		.regmap_size = 1,
+	}, {
+		.name = "npu_uart",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_NPU_UART_EN,
+			NPU_UART_EN_MASK,
+			NPU_UART_EN_MASK
+		},
+		.regmap_size = 1,
 	},
 };
 
-- 
2.53.0


