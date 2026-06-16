Return-Path: <linux-gpio+bounces-38537-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V8ChFeXPMGpfXgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38537-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:24:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F4068BDE0
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:24:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=OoNFPZ1G;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38537-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38537-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7844E31827A8
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B25C3C8738;
	Tue, 16 Jun 2026 04:20:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022136.outbound.protection.outlook.com [52.101.66.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0D93C8C7D;
	Tue, 16 Jun 2026 04:20:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781583621; cv=fail; b=aed/5YVcON1/jX8opONXvJK5H58iBsEGsUmfcU3CULcL+KCcRMeU2OZIiC0UfapjM+ge0GxTbM4OTblmNOND/584bUA/F/nO+cqldxZ0AXi0OVLicO7tTs8rHMpp4cBl88ZI1uVXE8moarHkPFIosbSudocPtaq0fQ7gpVCCrYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781583621; c=relaxed/simple;
	bh=z32XZyoNh0TVA5C37dby+yHKDiE+G3vUwvw/cXKZzTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UK1s6EjGRgPSKA+m9+OwAEW1PIYoUzCewmn4YKlTQWxThC0iBmN6W5CbqCnA1gXSjG7ajKlnskOYAR0k3b2ORuC0+mR7dc63LeSXJf02/FjfOSGZV8VEUMT6ORZT0fXRfXTTpAKZvKgJ6vMciXjd/dOzLKaxF665NRBcXYnGrM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=OoNFPZ1G; arc=fail smtp.client-ip=52.101.66.136
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHCYa6BimNYQcBpV0AEQ2N0O5RdQbeoh9REkX77cii/EMQx7aDbnXB7E1Ti7IvGoOEJvNCHtK2goF3YxZIeuqLI+IskYMPGdlOfJFXOQJji38BnLwCVQLuzBiLd1Z/mkb+aC8Cfc6+7BK/fCJA69+u31eynmIsMdNffjQAxaME5KKXd77HMquFqc49L8jThpuwBKKYZ7vcZznHI6jBgZnWBOmCtH4+72Scz5x35tYhxDe797H+r9L5VMZWuXmychZgO5go2kqvQhGx9OKD2HtompSPgj59WGJSHYp2Ufd6HWJHu0iKPmNSzwu6fd/ipQC4ajV6qsnGxrsYRBtiAIjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkj85rFxZBUCpaHp5Q9WPZYIWAC7XmWUoE77v8yrWOw=;
 b=bknqoH3V+tFJR6KsAzGMXGOQCmMxkIWcDw1kPFjIddxIwtgU5driUQG/qO9GgnuUS/Fl4rnmh14pCLZkhVZlUP+8pHOMwrAKJXemZLY4D6XqoQKHTeyOQpVXaXvxo/3aBOIWd8TOwPQRof+MjDTld4xv7SZXdhZyXSm/OGKGWd0Iz22RItDaJOvezXYXOkh0HFutxNn9n+peGLEaSz6Ur2DypAxfQrV0B3wokQMjivQ8zlYMaTw9Eziz8JGme2n7TthkZnSVvYe9vvWmpcghB8j0hXI9VmYjT2COkmNJ8jj8fD2g5DmuAnLjPTmCiGcDCkq7nzgEdzo8hN/ZoYEOew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkj85rFxZBUCpaHp5Q9WPZYIWAC7XmWUoE77v8yrWOw=;
 b=OoNFPZ1GwnaUtB8poY5HjT4pXiESXqSQb1wYxYI1qBDBNbbgYrRoggo7CmGH14j2lvxJCRiN3DRWUmaBcDgQNLTrBTgR7V7wXXYpVO8Idpa+C1/54ZYx/eYKvowai1CigCb7wXquil4ME+6VNvjh4BppDwvN3Mj+x2jUcIKoHQCrzThXkSSYMwp5g/8E9bP28lLq04lYrJVNgji/gKgrlwguLhSFTD6kJV4wKAIF3c+WXHTCPGisLHHgWjGVp32IzqtuH0zM/ZelaA6QxEPoQ0O++47Dj12d+hLftij96YgBCZkkywXseIwNLxXl/JZlW396csu2tGRUFH3dqzCerQ==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 04:20:01 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 04:20:01 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v2 07/12] pinctrl: airoha: split driver on shared code and SoC specific drivers
Date: Tue, 16 Jun 2026 07:19:34 +0300
Message-ID: <20260616041939.2587012-8-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616041939.2587012-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260616041939.2587012-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::11) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB10055:EE_
X-MS-Office365-Filtering-Correlation-Id: 1001a026-a0c5-49c2-36fe-08decb5e8878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|38350700014|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	en+C6MQj+2a3muOvXdZraL7vFF0hTaszydDb4YJxMpQJtBOqSzN3bw1b76R7jk/EhtJwBlNmdJ+xqvhl7AhttX96tLznBRH2Lx3RsbAjB+9dAifpLbWqsXqJVBzRFpwuQ7DR3WjYVC4ZnFkFV8MgAACtNRcnJ+YZXPSMdt5Ay/faEo0Khls96+Ev0IVBs+cNY8woBJFHV/2qFAV+PfSNzQTkJW7WPQVESnPB+Wk0VGOOCx25UmOEY7yxBBwkjBpQi70goLaZLAtjceTnZASNRZ6MSfVqHZo/oiJvw28mtbmoH0ducjNhVwUqZTQanU+g47/qE9qPV1Dsmdg4elAym4bL6wBOMagWhMnA0++VAgWxkva5skRfxlf6hMZ3NoLx2bvt+KsHFRHPX4voyV9V1aJFX1Ke0g+nkzn+CEDupIZX0pvHRY7TpqCu1SfxnLtlDbNlsL3naJzwuMxWtWb1+OZqSFHiOyu9/ltqza+cH68za3U75J3kQxr9QXNeNIhc9BId1YF7v9IynLXU7cAP7Uf1fCakufE7zoiItxNgwecATLx2W15e8+9D8IxMB09UMhN53q+1OEJj7FSwi4uDUVMdvwUHF01LSsYDRczKqtHE9DA6tRGEaoI9g726iUzNsTQq8vJKhBox0SpWZGrN3YTY0S9grdD6wF9CZPVoMqeZQsccQnGcwvW+0jBmBujrBAc7PsT6SZ5dIxTbs04vDu6wMSOVF0FPVRbqjfrN6A1gAqWE1/ASwOn6KMoWmveBi6fyqrtYfVuvZ43KoSCDJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(38350700014)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WBTMz3OC2b7L47sg9M1r02QCf85Awc0vEjLr0A0xy8WujbvVCLbwuvgZZ4eC?=
 =?us-ascii?Q?AFde60aATAOBqu7COCGNmLjAtOe4D+5oyVZVTWTt6bDSxy0iPUDGiygF2elv?=
 =?us-ascii?Q?RPhQcN4Qsef7GF5ajmpRoeBqzQGn3pV+Vo/970w+4uBiyG5neQjtA0r/A40I?=
 =?us-ascii?Q?zppiKzbvUd5w39NMKCVBDSPT8vTto0V1e4STX/DvU+qAbRIrUVKHpCbPQK0x?=
 =?us-ascii?Q?2oU2LNI6C12dw1+fQ/JFj/WoqILUxguGddR4Eb7ni3bwhuQvdEALouqbRf81?=
 =?us-ascii?Q?Mg3EN34MqHiwS8htOv+bgO1GkEyGi6uZiWK301tY6sBO1DV4l53QXC5GxbNw?=
 =?us-ascii?Q?knN0JeBWd4Y+U7JU4qMXQvUIHf6PiGMKqj8V0g3ojbjpk5RgldHpoli5ddlU?=
 =?us-ascii?Q?PmJakhlnZg+vVgCNH8x25/IUqoRL/PrS20X33nLoGAUhqP317sdhZX8X91ZS?=
 =?us-ascii?Q?P5pyClFIXHNXXUAab7QbodHyM3o0tXzhJTn5i6Gnk1CCaeSm60zNVVWOyvPN?=
 =?us-ascii?Q?q28SM0LUnUjrFzBYwDDvDK5nQyjZzzrdhf0ik/Ydsd04ZxWb6J8B3e097Dro?=
 =?us-ascii?Q?iXUICk53yGi+IvEcsQ4ZX6N9UJbRGqyWBgfMIQHn1ZB3933WQ+IAplyK62RQ?=
 =?us-ascii?Q?+QRsLomW8GVogLkFY0bLZuA0sDI5bvVNVXUEyvfVW1ibYnW3W74M6klCGCF6?=
 =?us-ascii?Q?59xvrMRZMuuVonXW2UKDJrOt1fxRbQaKVoCPZHuApkF5dO6GZQ47Qsz5YxY8?=
 =?us-ascii?Q?DIxRHIPgB8KiuxHP5GqbIyAWZ0GLCiixYp93bteUTCuY1PyyLIbVnGJyF5US?=
 =?us-ascii?Q?GWDOqov799s4cgwPs8sn+jeU5IJyJ88WxTR53MH31QQqAjJZnM185K1JyoZi?=
 =?us-ascii?Q?0Yv5nc7nX3Ws5auRF2vbNhGupjif9XInChm56v7Gsg15LRg+mnzOZObWZM8a?=
 =?us-ascii?Q?EFSZBPkc4aKEC71YeSQ1B49nWxr4euJKc0yZ6N1fsn8q4MFCvcmkriFL+NvL?=
 =?us-ascii?Q?SSZ5TzH0TjcD5nt1roL5iTRuKzBFPN+s3dt8IAGBocN6E5EMudQoAufKb4Zi?=
 =?us-ascii?Q?PUr4TN9Gz5dQzCvgmJI3Eyy9MV7H0y4QKwt+283vqHKk0Ao931u9yI7czsUo?=
 =?us-ascii?Q?6STr68t8Cm7jLuWvEmPfzOCpKWWXSudx3KV5KE9ODIiSErUwM7Swpka+mE1/?=
 =?us-ascii?Q?QwuifQJGnI6IZsLGDA5R7DJVtvnO09xSGB6sw6Km0WcF3SO3Vxa9GmNyAcri?=
 =?us-ascii?Q?fdfVeggDWoTZ98cJbRv8D58gYC1zdNc4wz3tcstfhPM3jCed+ea2/80p6VY6?=
 =?us-ascii?Q?dlDADAJoCz/k+4AbTQklhtCAbKXuZwEXMSo3aYwQiLR33qapf/IZ7TPcjAD9?=
 =?us-ascii?Q?2iskGNWUnv9mU5vKiJldVCdG8zWQ3slgOnKFbSkaceA3rjqiG74RGOvr4tLU?=
 =?us-ascii?Q?pjmivyjudiW9uMx1Wltb6jesH2gMQw5dwda3yuBJDLo1Q+opPqlZLUZy8Rdb?=
 =?us-ascii?Q?WucFOvN/JrktBnsKgJS1sbQWhkV4bhPl9wekYyrnBKeBNA38Gq7LWYv5Ol0E?=
 =?us-ascii?Q?2FF2RTg7i0N4Q2asQ6dJfFF0jevAXn6V6xQYk8Z40ohRHDFFaIjCvjjge1E9?=
 =?us-ascii?Q?3ZgiaywI6WCNRT3QAZVT/jZCEIwO3IEdH/szIJjpS94qTuzVFt3Id75FFVrC?=
 =?us-ascii?Q?I4Vkry1DUQUUGy24MBDk7w+sg/yQdUp9QMqFPsjWB0i0vS4OWd+dmyel1j/Y?=
 =?us-ascii?Q?BfI1riDP8OyA1+tjaelyM8CdVWqApSA=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1001a026-a0c5-49c2-36fe-08decb5e8878
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 04:20:01.3467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7KNxFGLAsJ+2Cv6fu7yZGS937iJal95vnWto3l4jPYLiy2zEAQwHtFoK2TcUPEMAtVG8hTTMPUQLfyyks9kdF5fLAACif+FyDx0+ZdS+P4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38537-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,genexis.eu,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:benjamin.larsson@genexis.eu,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp,genexis.eu:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20F4068BDE0

Split combined an7581/an7583 source file on a
 * shared pinctrl code (pinctrl-airoha.c)
 * an7581 specific pinctrl driver (pinctrl-an7581.c)
 * an7583 specific pinctrl driver (pinctrl-an7583.c)

No functional changes.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/Kconfig          |   18 +-
 drivers/pinctrl/airoha/Makefile         |    5 +
 drivers/pinctrl/airoha/airoha-common.h  |    2 +
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2360 +----------------------
 drivers/pinctrl/airoha/pinctrl-an7581.c | 1472 ++++++++++++++
 drivers/pinctrl/airoha/pinctrl-an7583.c | 1453 ++++++++++++++
 6 files changed, 2950 insertions(+), 2360 deletions(-)
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7581.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7583.c

diff --git a/drivers/pinctrl/airoha/Kconfig b/drivers/pinctrl/airoha/Kconfig
index 03adaeae8fc3..08038a5b11c6 100644
--- a/drivers/pinctrl/airoha/Kconfig
+++ b/drivers/pinctrl/airoha/Kconfig
@@ -3,9 +3,9 @@ menu "Airoha pinctrl drivers"
 	depends on ARCH_AIROHA || COMPILE_TEST
 
 config PINCTRL_AIROHA
-	tristate "Airoha EN7581 pin control"
+	tristate "Airoha pin control"
 	depends on OF
-	depends on ARM64 || COMPILE_TEST
+	depends on ARCH_AIROHA || COMPILE_TEST
 	select PINMUX
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
@@ -13,8 +13,20 @@ config PINCTRL_AIROHA
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select REGMAP_MMIO
+	imply PINCTRL_AIROHA_AN7581
+	imply PINCTRL_AIROHA_AN7583
 	help
 	  Say yes here to support pin controller and gpio driver
-	  on Airoha EN7581 SoC.
+	  on Airoha SoC.
+
+config PINCTRL_AIROHA_AN7581
+	tristate "AN7581 pinctrl"
+	depends on ARM64 || COMPILE_TEST
+	depends on PINCTRL_AIROHA
+
+config PINCTRL_AIROHA_AN7583
+	tristate "AN7583 pinctrl"
+	depends on ARM64 || COMPILE_TEST
+	depends on PINCTRL_AIROHA
 
 endmenu
diff --git a/drivers/pinctrl/airoha/Makefile b/drivers/pinctrl/airoha/Makefile
index a25b744dd7a8..cfd68c45ae0f 100644
--- a/drivers/pinctrl/airoha/Makefile
+++ b/drivers/pinctrl/airoha/Makefile
@@ -1,3 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
+# shared code
 obj-$(CONFIG_PINCTRL_AIROHA)		+= pinctrl-airoha.o
+
+# SoC drivers
+obj-$(CONFIG_PINCTRL_AIROHA_AN7581)	+= pinctrl-an7581.o
+obj-$(CONFIG_PINCTRL_AIROHA_AN7583)	+= pinctrl-an7583.o
diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index b0c48653a0e2..abd4d2fcd227 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -198,4 +198,6 @@ struct airoha_pinctrl_match_data {
 	const struct airoha_pinctrl_confs_info confs_info[AIROHA_PINCTRL_CONFS_MAX];
 };
 
+int airoha_pinctrl_probe(struct platform_device *pdev);
+
 #endif
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index a5bcf158d711..6f7e65b7792b 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -7,367 +7,6 @@
 
 #include "airoha-common.h"
 
-/* MUX */
-#define REG_GPIO_2ND_I2C_MODE			0x0214
-#define GPIO_MDC_IO_MASTER_MODE_MASK		BIT(14)
-#define GPIO_I2C_MASTER_MODE_MODE		BIT(13)
-#define GPIO_I2S_MODE_MASK			BIT(12)
-#define GPIO_I2C_SLAVE_MODE_MODE		BIT(11)
-#define GPIO_LAN3_LED1_MODE_MASK		BIT(10)
-#define GPIO_LAN3_LED0_MODE_MASK		BIT(9)
-#define GPIO_LAN2_LED1_MODE_MASK		BIT(8)
-#define GPIO_LAN2_LED0_MODE_MASK		BIT(7)
-#define GPIO_LAN1_LED1_MODE_MASK		BIT(6)
-#define GPIO_LAN1_LED0_MODE_MASK		BIT(5)
-#define GPIO_LAN0_LED1_MODE_MASK		BIT(4)
-#define GPIO_LAN0_LED0_MODE_MASK		BIT(3)
-#define PON_TOD_1PPS_MODE_MASK			BIT(2)
-#define GSW_TOD_1PPS_MODE_MASK			BIT(1)
-#define GPIO_2ND_I2C_MODE_MASK			BIT(0)
-
-#define REG_GPIO_SPI_CS1_MODE			0x0218
-#define GPIO_PCM_SPI_CS4_MODE_MASK		BIT(21)
-#define GPIO_PCM_SPI_CS3_MODE_MASK		BIT(20)
-#define GPIO_PCM_SPI_CS2_MODE_P156_MASK		BIT(19)
-#define GPIO_PCM_SPI_CS2_MODE_P128_MASK		BIT(18)
-#define AN7583_GPIO_PCM_SPI_CS2_MODE_MASK	BIT(18)
-#define GPIO_PCM_SPI_CS1_MODE_MASK		BIT(17)
-#define GPIO_PCM_SPI_MODE_MASK			BIT(16)
-#define GPIO_PCM2_MODE_MASK			BIT(13)
-#define GPIO_PCM1_MODE_MASK			BIT(12)
-#define GPIO_PCM_INT_MODE_MASK			BIT(9)
-#define GPIO_PCM_RESET_MODE_MASK		BIT(8)
-#define GPIO_SPI_QUAD_MODE_MASK			BIT(4)
-#define GPIO_SPI_CS4_MODE_MASK			BIT(3)
-#define GPIO_SPI_CS3_MODE_MASK			BIT(2)
-#define GPIO_SPI_CS2_MODE_MASK			BIT(1)
-#define GPIO_SPI_CS1_MODE_MASK			BIT(0)
-
-#define REG_GPIO_PON_MODE			0x021c
-#define AN7583_MDIO_0_GPIO_MODE_MASK		BIT(26)
-#define AN7583_MDC_0_GPIO_MODE_MASK		BIT(25)
-#define AN7583_UART_RXD_GPIO_MODE_MASK		BIT(24)
-#define AN7583_UART_TXD_GPIO_MODE_MASK		BIT(23)
-#define AN7583_SPI_MISO_GPIO_MODE_MASK		BIT(22)
-#define AN7583_SPI_MOSI_GPIO_MODE_MASK		BIT(21)
-#define AN7583_SPI_CS_GPIO_MODE_MASK		BIT(20)
-#define AN7583_SPI_CLK_GPIO_MODE_MASK		BIT(19)
-#define AN7583_I2C1_SDA_GPIO_MODE_MASK		BIT(18)
-#define AN7583_I2C1_SCL_GPIO_MODE_MASK		BIT(17)
-#define AN7583_I2C0_SDA_GPIO_MODE_MASK		BIT(16)
-#define AN7583_I2C0_SCL_GPIO_MODE_MASK		BIT(15)
-#define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
-#define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
-#define GPIO_PCIE_RESET2_MASK			BIT(12)
-#define SIPO_RCLK_MODE_MASK			BIT(11)
-#define GPIO_PCIE_RESET1_MASK			BIT(10)
-#define GPIO_PCIE_RESET0_MASK			BIT(9)
-#define GPIO_UART5_MODE_MASK			BIT(8)
-#define GPIO_UART4_MODE_MASK			BIT(7)
-#define GPIO_HSUART_CTS_RTS_MODE_MASK		BIT(6)
-#define GPIO_HSUART_MODE_MASK			BIT(5)
-#define GPIO_UART2_CTS_RTS_MODE_MASK		BIT(4)
-#define GPIO_UART2_MODE_MASK			BIT(3)
-#define GPIO_SIPO_MODE_MASK			BIT(2)
-#define GPIO_EMMC_MODE_MASK			BIT(1)
-#define GPIO_PON_MODE_MASK			BIT(0)
-
-#define REG_NPU_UART_EN				0x0224
-#define JTAG_UDI_EN_MASK			BIT(4)
-#define JTAG_DFD_EN_MASK			BIT(3)
-
-#define REG_FORCE_GPIO_EN			0x0228
-#define FORCE_GPIO_EN(n)			BIT(n)
-
-/* LED MAP */
-#define REG_LAN_LED0_MAPPING			0x027c
-#define REG_LAN_LED1_MAPPING			0x0280
-
-#define LAN4_LED_MAPPING_MASK			GENMASK(18, 16)
-#define LAN4_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, (_n))
-
-#define LAN3_LED_MAPPING_MASK			GENMASK(14, 12)
-#define LAN3_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, (_n))
-
-#define LAN2_LED_MAPPING_MASK			GENMASK(10, 8)
-#define LAN2_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, (_n))
-
-#define LAN1_LED_MAPPING_MASK			GENMASK(6, 4)
-#define LAN1_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, (_n))
-
-#define LAN0_LED_MAPPING_MASK			GENMASK(2, 0)
-#define LAN0_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, (_n))
-
-/* CONF */
-#define REG_I2C_SDA_E2				0x001c
-#define AN7583_I2C1_SCL_E2_MASK			BIT(16)
-#define AN7583_I2C1_SDA_E2_MASK			BIT(15)
-#define SPI_MISO_E2_MASK			BIT(14)
-#define SPI_MOSI_E2_MASK			BIT(13)
-#define SPI_CLK_E2_MASK				BIT(12)
-#define SPI_CS0_E2_MASK				BIT(11)
-#define PCIE2_RESET_E2_MASK			BIT(10)
-#define PCIE1_RESET_E2_MASK			BIT(9)
-#define PCIE0_RESET_E2_MASK			BIT(8)
-#define AN7583_MDIO_0_E2_MASK			BIT(5)
-#define AN7583_MDC_0_E2_MASK			BIT(4)
-#define UART1_RXD_E2_MASK			BIT(3)
-#define UART1_TXD_E2_MASK			BIT(2)
-#define I2C_SCL_E2_MASK				BIT(1)
-#define I2C_SDA_E2_MASK				BIT(0)
-
-#define REG_I2C_SDA_E4				0x0020
-#define AN7583_I2C1_SCL_E4_MASK			BIT(16)
-#define AN7583_I2C1_SDA_E4_MASK			BIT(15)
-#define SPI_MISO_E4_MASK			BIT(14)
-#define SPI_MOSI_E4_MASK			BIT(13)
-#define SPI_CLK_E4_MASK				BIT(12)
-#define SPI_CS0_E4_MASK				BIT(11)
-#define PCIE2_RESET_E4_MASK			BIT(10)
-#define PCIE1_RESET_E4_MASK			BIT(9)
-#define PCIE0_RESET_E4_MASK			BIT(8)
-#define AN7583_MDIO_0_E4_MASK			BIT(5)
-#define AN7583_MDC_0_E4_MASK			BIT(4)
-#define UART1_RXD_E4_MASK			BIT(3)
-#define UART1_TXD_E4_MASK			BIT(2)
-#define I2C_SCL_E4_MASK				BIT(1)
-#define I2C_SDA_E4_MASK				BIT(0)
-
-#define REG_GPIO_L_E2				0x0024
-#define REG_GPIO_L_E4				0x0028
-#define REG_GPIO_H_E2				0x002c
-#define REG_GPIO_H_E4				0x0030
-
-#define REG_I2C_SDA_PU				0x0044
-#define AN7583_I2C1_SCL_PU_MASK			BIT(16)
-#define AN7583_I2C1_SDA_PU_MASK			BIT(15)
-#define SPI_MISO_PU_MASK			BIT(14)
-#define SPI_MOSI_PU_MASK			BIT(13)
-#define SPI_CLK_PU_MASK				BIT(12)
-#define SPI_CS0_PU_MASK				BIT(11)
-#define PCIE2_RESET_PU_MASK			BIT(10)
-#define PCIE1_RESET_PU_MASK			BIT(9)
-#define PCIE0_RESET_PU_MASK			BIT(8)
-#define AN7583_MDIO_0_PU_MASK			BIT(5)
-#define AN7583_MDC_0_PU_MASK			BIT(4)
-#define UART1_RXD_PU_MASK			BIT(3)
-#define UART1_TXD_PU_MASK			BIT(2)
-#define I2C_SCL_PU_MASK				BIT(1)
-#define I2C_SDA_PU_MASK				BIT(0)
-
-#define REG_I2C_SDA_PD				0x0048
-#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
-#define AN7583_I2C1_SDA_PD_MASK			BIT(15)
-#define SPI_MISO_PD_MASK			BIT(14)
-#define SPI_MOSI_PD_MASK			BIT(13)
-#define SPI_CLK_PD_MASK				BIT(12)
-#define SPI_CS0_PD_MASK				BIT(11)
-#define PCIE2_RESET_PD_MASK			BIT(10)
-#define PCIE1_RESET_PD_MASK			BIT(9)
-#define PCIE0_RESET_PD_MASK			BIT(8)
-#define AN7583_MDIO_0_PD_MASK			BIT(5)
-#define AN7583_MDC_0_PD_MASK			BIT(4)
-#define UART1_RXD_PD_MASK			BIT(3)
-#define UART1_TXD_PD_MASK			BIT(2)
-#define I2C_SCL_PD_MASK				BIT(1)
-#define I2C_SDA_PD_MASK				BIT(0)
-
-#define REG_GPIO_L_PU				0x004c
-#define REG_GPIO_L_PD				0x0050
-#define REG_GPIO_H_PU				0x0054
-#define REG_GPIO_H_PD				0x0058
-
-#define REG_PCIE_RESET_OD			0x018c
-#define PCIE2_RESET_OD_MASK			BIT(2)
-#define PCIE1_RESET_OD_MASK			BIT(1)
-#define PCIE0_RESET_OD_MASK			BIT(0)
-
-/* GPIOs */
-#define REG_GPIO_CTRL				0x0000
-#define REG_GPIO_DATA				0x0004
-#define REG_GPIO_INT				0x0008
-#define REG_GPIO_INT_EDGE			0x000c
-#define REG_GPIO_INT_LEVEL			0x0010
-#define REG_GPIO_OE				0x0014
-#define REG_GPIO_CTRL1				0x0020
-#define REG_GPIO_CTRL2				0x0060
-#define REG_GPIO_CTRL3				0x0064
-
-/* PWM MODE CONF */
-#define REG_GPIO_FLASH_MODE_CFG			0x0034
-#define GPIO15_FLASH_MODE_CFG			BIT(15)
-#define GPIO14_FLASH_MODE_CFG			BIT(14)
-#define GPIO13_FLASH_MODE_CFG			BIT(13)
-#define GPIO12_FLASH_MODE_CFG			BIT(12)
-#define GPIO11_FLASH_MODE_CFG			BIT(11)
-#define GPIO10_FLASH_MODE_CFG			BIT(10)
-#define GPIO9_FLASH_MODE_CFG			BIT(9)
-#define GPIO8_FLASH_MODE_CFG			BIT(8)
-#define GPIO7_FLASH_MODE_CFG			BIT(7)
-#define GPIO6_FLASH_MODE_CFG			BIT(6)
-#define GPIO5_FLASH_MODE_CFG			BIT(5)
-#define GPIO4_FLASH_MODE_CFG			BIT(4)
-#define GPIO3_FLASH_MODE_CFG			BIT(3)
-#define GPIO2_FLASH_MODE_CFG			BIT(2)
-#define GPIO1_FLASH_MODE_CFG			BIT(1)
-#define GPIO0_FLASH_MODE_CFG			BIT(0)
-
-/* PWM MODE CONF EXT */
-#define REG_GPIO_FLASH_MODE_CFG_EXT		0x0068
-#define GPIO51_FLASH_MODE_CFG			BIT(31)
-#define GPIO50_FLASH_MODE_CFG			BIT(30)
-#define GPIO49_FLASH_MODE_CFG			BIT(29)
-#define GPIO48_FLASH_MODE_CFG			BIT(28)
-#define GPIO47_FLASH_MODE_CFG			BIT(27)
-#define GPIO46_FLASH_MODE_CFG			BIT(26)
-#define GPIO45_FLASH_MODE_CFG			BIT(25)
-#define GPIO44_FLASH_MODE_CFG			BIT(24)
-#define GPIO43_FLASH_MODE_CFG			BIT(23)
-#define GPIO42_FLASH_MODE_CFG			BIT(22)
-#define GPIO41_FLASH_MODE_CFG			BIT(21)
-#define GPIO40_FLASH_MODE_CFG			BIT(20)
-#define GPIO39_FLASH_MODE_CFG			BIT(19)
-#define GPIO38_FLASH_MODE_CFG			BIT(18)
-#define GPIO37_FLASH_MODE_CFG			BIT(17)
-#define GPIO36_FLASH_MODE_CFG			BIT(16)
-#define GPIO31_FLASH_MODE_CFG			BIT(15)
-#define GPIO30_FLASH_MODE_CFG			BIT(14)
-#define GPIO29_FLASH_MODE_CFG			BIT(13)
-#define GPIO28_FLASH_MODE_CFG			BIT(12)
-#define GPIO27_FLASH_MODE_CFG			BIT(11)
-#define GPIO26_FLASH_MODE_CFG			BIT(10)
-#define GPIO25_FLASH_MODE_CFG			BIT(9)
-#define GPIO24_FLASH_MODE_CFG			BIT(8)
-#define GPIO23_FLASH_MODE_CFG			BIT(7)
-#define GPIO22_FLASH_MODE_CFG			BIT(6)
-#define GPIO21_FLASH_MODE_CFG			BIT(5)
-#define GPIO20_FLASH_MODE_CFG			BIT(4)
-#define GPIO19_FLASH_MODE_CFG			BIT(3)
-#define GPIO18_FLASH_MODE_CFG			BIT(2)
-#define GPIO17_FLASH_MODE_CFG			BIT(1)
-#define GPIO16_FLASH_MODE_CFG			BIT(0)
-
-#define REG_GPIO_DATA1				0x0070
-#define REG_GPIO_OE1				0x0078
-#define REG_GPIO_INT1				0x007c
-#define REG_GPIO_INT_EDGE1			0x0080
-#define REG_GPIO_INT_EDGE2			0x0084
-#define REG_GPIO_INT_EDGE3			0x0088
-#define REG_GPIO_INT_LEVEL1			0x008c
-#define REG_GPIO_INT_LEVEL2			0x0090
-#define REG_GPIO_INT_LEVEL3			0x0094
-
-#define AIROHA_PINCTRL_GPIO(gpio, mux_val)			\
-	{							\
-		.name = (gpio),					\
-		.regmap[0] = {					\
-			AIROHA_FUNC_MUX,			\
-			REG_GPIO_PON_MODE,			\
-			(mux_val),				\
-			(mux_val)				\
-		},						\
-		.regmap_size = 1,				\
-	}
-
-#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)	\
-	{							\
-		.name = (gpio),					\
-		.regmap[0] = {					\
-			AIROHA_FUNC_PWM_EXT_MUX,		\
-			REG_GPIO_FLASH_MODE_CFG_EXT,		\
-			(mux_val),				\
-			0					\
-		},						\
-		.regmap[1] = {					\
-			AIROHA_FUNC_MUX,			\
-			REG_GPIO_PON_MODE,			\
-			(smux_val),				\
-			(smux_val)				\
-		},						\
-		.regmap_size = 2,				\
-	}
-
-/* PWM */
-#define AIROHA_PINCTRL_PWM(gpio, mux_val)		\
-	{						\
-		.name = (gpio),				\
-		.regmap[0] = {				\
-			AIROHA_FUNC_PWM_MUX,		\
-			REG_GPIO_FLASH_MODE_CFG,	\
-			(mux_val),			\
-			(mux_val)			\
-		},					\
-		.regmap_size = 1,			\
-	}						\
-
-#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)		\
-	{						\
-		.name = (gpio),				\
-		.regmap[0] = {				\
-			AIROHA_FUNC_PWM_EXT_MUX,	\
-			REG_GPIO_FLASH_MODE_CFG_EXT,	\
-			(mux_val),			\
-			(mux_val)			\
-		},					\
-		.regmap_size = 1,			\
-	}						\
-
-#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)	\
-	{							\
-		.name = (gpio),					\
-		.regmap[0] = {					\
-			AIROHA_FUNC_PWM_EXT_MUX,		\
-			REG_GPIO_FLASH_MODE_CFG_EXT,		\
-			(mux_val),				\
-			(mux_val)				\
-		},						\
-		.regmap[1] = {					\
-			AIROHA_FUNC_MUX,			\
-			REG_GPIO_PON_MODE,			\
-			(smux_val),				\
-			(smux_val)				\
-		},						\
-		.regmap_size = 2,				\
-	}
-
-
-#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
-	{								\
-		.name = (gpio),						\
-		.regmap[0] = {						\
-			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
-			(mux_val),					\
-			(mux_val),					\
-		},							\
-		.regmap[1] = {						\
-			AIROHA_FUNC_MUX,				\
-			REG_LAN_LED0_MAPPING,				\
-			(map_mask),					\
-			(map_val),					\
-		},							\
-		.regmap_size = 2,					\
-	}
-
-#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)	\
-	{								\
-		.name = (gpio),						\
-		.regmap[0] = {						\
-			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
-			(mux_val),					\
-			(mux_val),					\
-		},							\
-		.regmap[1] = {						\
-			AIROHA_FUNC_MUX,				\
-			REG_LAN_LED1_MAPPING,				\
-			(map_mask),					\
-			(map_val),					\
-		},							\
-		.regmap_size = 2,					\
-	}
-
-
 static const u32 gpio_data_regs[] = {
 	REG_GPIO_DATA,
 	REG_GPIO_DATA1
@@ -404,1922 +43,6 @@ static const u32 irq_edge_regs[] = {
 	REG_GPIO_INT_EDGE3
 };
 
-static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
-	PINCTRL_PIN(0, "uart1_txd"),
-	PINCTRL_PIN(1, "uart1_rxd"),
-	PINCTRL_PIN(2, "i2c_scl"),
-	PINCTRL_PIN(3, "i2c_sda"),
-	PINCTRL_PIN(4, "spi_cs0"),
-	PINCTRL_PIN(5, "spi_clk"),
-	PINCTRL_PIN(6, "spi_mosi"),
-	PINCTRL_PIN(7, "spi_miso"),
-	PINCTRL_PIN(13, "gpio0"),
-	PINCTRL_PIN(14, "gpio1"),
-	PINCTRL_PIN(15, "gpio2"),
-	PINCTRL_PIN(16, "gpio3"),
-	PINCTRL_PIN(17, "gpio4"),
-	PINCTRL_PIN(18, "gpio5"),
-	PINCTRL_PIN(19, "gpio6"),
-	PINCTRL_PIN(20, "gpio7"),
-	PINCTRL_PIN(21, "gpio8"),
-	PINCTRL_PIN(22, "gpio9"),
-	PINCTRL_PIN(23, "gpio10"),
-	PINCTRL_PIN(24, "gpio11"),
-	PINCTRL_PIN(25, "gpio12"),
-	PINCTRL_PIN(26, "gpio13"),
-	PINCTRL_PIN(27, "gpio14"),
-	PINCTRL_PIN(28, "gpio15"),
-	PINCTRL_PIN(29, "gpio16"),
-	PINCTRL_PIN(30, "gpio17"),
-	PINCTRL_PIN(31, "gpio18"),
-	PINCTRL_PIN(32, "gpio19"),
-	PINCTRL_PIN(33, "gpio20"),
-	PINCTRL_PIN(34, "gpio21"),
-	PINCTRL_PIN(35, "gpio22"),
-	PINCTRL_PIN(36, "gpio23"),
-	PINCTRL_PIN(37, "gpio24"),
-	PINCTRL_PIN(38, "gpio25"),
-	PINCTRL_PIN(39, "gpio26"),
-	PINCTRL_PIN(40, "gpio27"),
-	PINCTRL_PIN(41, "gpio28"),
-	PINCTRL_PIN(42, "gpio29"),
-	PINCTRL_PIN(43, "gpio30"),
-	PINCTRL_PIN(44, "gpio31"),
-	PINCTRL_PIN(45, "gpio32"),
-	PINCTRL_PIN(46, "gpio33"),
-	PINCTRL_PIN(47, "gpio34"),
-	PINCTRL_PIN(48, "gpio35"),
-	PINCTRL_PIN(49, "gpio36"),
-	PINCTRL_PIN(50, "gpio37"),
-	PINCTRL_PIN(51, "gpio38"),
-	PINCTRL_PIN(52, "gpio39"),
-	PINCTRL_PIN(53, "gpio40"),
-	PINCTRL_PIN(54, "gpio41"),
-	PINCTRL_PIN(55, "gpio42"),
-	PINCTRL_PIN(56, "gpio43"),
-	PINCTRL_PIN(57, "pcie_reset0"),
-	PINCTRL_PIN(58, "pcie_reset1"),
-	PINCTRL_PIN(59, "pcie_reset2"),
-};
-
-static const int en7581_pon_pins[] = { 49, 50, 51, 52, 53, 54 };
-static const int en7581_pon_tod_1pps_pins[] = { 46 };
-static const int en7581_gsw_tod_1pps_pins[] = { 46 };
-static const int en7581_sipo_pins[] = { 16, 17 };
-static const int en7581_sipo_rclk_pins[] = { 16, 17, 43 };
-static const int en7581_mdio_pins[] = { 14, 15 };
-static const int en7581_uart2_pins[] = { 48, 55 };
-static const int en7581_uart2_cts_rts_pins[] = { 46, 47 };
-static const int en7581_hsuart_pins[] = { 28, 29 };
-static const int en7581_hsuart_cts_rts_pins[] = { 26, 27 };
-static const int en7581_uart4_pins[] = { 38, 39 };
-static const int en7581_uart5_pins[] = { 18, 19 };
-static const int en7581_i2c0_pins[] = { 2, 3 };
-static const int en7581_i2c1_pins[] = { 14, 15 };
-static const int en7581_jtag_udi_pins[] = { 16, 17, 18, 19, 20 };
-static const int en7581_jtag_dfd_pins[] = { 16, 17, 18, 19, 20 };
-static const int en7581_i2s_pins[] = { 26, 27, 28, 29 };
-static const int en7581_pcm1_pins[] = { 22, 23, 24, 25 };
-static const int en7581_pcm2_pins[] = { 18, 19, 20, 21 };
-static const int en7581_spi_quad_pins[] = { 32, 33 };
-static const int en7581_spi_pins[] = { 4, 5, 6, 7 };
-static const int en7581_spi_cs1_pins[] = { 34 };
-static const int en7581_pcm_spi_pins[] = { 18, 19, 20, 21, 22, 23, 24, 25 };
-static const int en7581_pcm_spi_int_pins[] = { 14 };
-static const int en7581_pcm_spi_rst_pins[] = { 15 };
-static const int en7581_pcm_spi_cs1_pins[] = { 43 };
-static const int en7581_pcm_spi_cs2_pins[] = { 40 };
-static const int en7581_pcm_spi_cs2_p128_pins[] = { 40 };
-static const int en7581_pcm_spi_cs2_p156_pins[] = { 40 };
-static const int en7581_pcm_spi_cs3_pins[] = { 41 };
-static const int en7581_pcm_spi_cs4_pins[] = { 42 };
-static const int en7581_emmc_pins[] = { 4, 5, 6, 30, 31, 32, 33, 34, 35, 36, 37 };
-static const int en7581_pnand_pins[] = { 4, 5, 6, 7, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42 };
-static const int en7581_gpio0_pins[] = { 13 };
-static const int en7581_gpio1_pins[] = { 14 };
-static const int en7581_gpio2_pins[] = { 15 };
-static const int en7581_gpio3_pins[] = { 16 };
-static const int en7581_gpio4_pins[] = { 17 };
-static const int en7581_gpio5_pins[] = { 18 };
-static const int en7581_gpio6_pins[] = { 19 };
-static const int en7581_gpio7_pins[] = { 20 };
-static const int en7581_gpio8_pins[] = { 21 };
-static const int en7581_gpio9_pins[] = { 22 };
-static const int en7581_gpio10_pins[] = { 23 };
-static const int en7581_gpio11_pins[] = { 24 };
-static const int en7581_gpio12_pins[] = { 25 };
-static const int en7581_gpio13_pins[] = { 26 };
-static const int en7581_gpio14_pins[] = { 27 };
-static const int en7581_gpio15_pins[] = { 28 };
-static const int en7581_gpio16_pins[] = { 29 };
-static const int en7581_gpio17_pins[] = { 30 };
-static const int en7581_gpio18_pins[] = { 31 };
-static const int en7581_gpio19_pins[] = { 32 };
-static const int en7581_gpio20_pins[] = { 33 };
-static const int en7581_gpio21_pins[] = { 34 };
-static const int en7581_gpio22_pins[] = { 35 };
-static const int en7581_gpio23_pins[] = { 36 };
-static const int en7581_gpio24_pins[] = { 37 };
-static const int en7581_gpio25_pins[] = { 38 };
-static const int en7581_gpio26_pins[] = { 39 };
-static const int en7581_gpio27_pins[] = { 40 };
-static const int en7581_gpio28_pins[] = { 41 };
-static const int en7581_gpio29_pins[] = { 42 };
-static const int en7581_gpio30_pins[] = { 43 };
-static const int en7581_gpio31_pins[] = { 44 };
-static const int en7581_gpio32_pins[] = { 45 };
-static const int en7581_gpio33_pins[] = { 46 };
-static const int en7581_gpio34_pins[] = { 47 };
-static const int en7581_gpio35_pins[] = { 48 };
-static const int en7581_gpio36_pins[] = { 49 };
-static const int en7581_gpio37_pins[] = { 50 };
-static const int en7581_gpio38_pins[] = { 51 };
-static const int en7581_gpio39_pins[] = { 52 };
-static const int en7581_gpio40_pins[] = { 53 };
-static const int en7581_gpio41_pins[] = { 54 };
-static const int en7581_gpio42_pins[] = { 55 };
-static const int en7581_gpio43_pins[] = { 56 };
-static const int en7581_gpio44_pins[] = { 57 };
-static const int en7581_gpio45_pins[] = { 58 };
-static const int en7581_gpio46_pins[] = { 59 };
-static const int en7581_pcie_reset0_pins[] = { 57 };
-static const int en7581_pcie_reset1_pins[] = { 58 };
-static const int en7581_pcie_reset2_pins[] = { 59 };
-
-static const struct pingroup en7581_pinctrl_groups[] = {
-	PINCTRL_PIN_GROUP("pon", en7581_pon),
-	PINCTRL_PIN_GROUP("pon_tod_1pps", en7581_pon_tod_1pps),
-	PINCTRL_PIN_GROUP("gsw_tod_1pps", en7581_gsw_tod_1pps),
-	PINCTRL_PIN_GROUP("sipo", en7581_sipo),
-	PINCTRL_PIN_GROUP("sipo_rclk", en7581_sipo_rclk),
-	PINCTRL_PIN_GROUP("mdio", en7581_mdio),
-	PINCTRL_PIN_GROUP("uart2", en7581_uart2),
-	PINCTRL_PIN_GROUP("uart2_cts_rts", en7581_uart2_cts_rts),
-	PINCTRL_PIN_GROUP("hsuart", en7581_hsuart),
-	PINCTRL_PIN_GROUP("hsuart_cts_rts", en7581_hsuart_cts_rts),
-	PINCTRL_PIN_GROUP("uart4", en7581_uart4),
-	PINCTRL_PIN_GROUP("uart5", en7581_uart5),
-	PINCTRL_PIN_GROUP("i2c0", en7581_i2c0),
-	PINCTRL_PIN_GROUP("i2c1", en7581_i2c1),
-	PINCTRL_PIN_GROUP("jtag_udi", en7581_jtag_udi),
-	PINCTRL_PIN_GROUP("jtag_dfd", en7581_jtag_dfd),
-	PINCTRL_PIN_GROUP("i2s", en7581_i2s),
-	PINCTRL_PIN_GROUP("pcm1", en7581_pcm1),
-	PINCTRL_PIN_GROUP("pcm2", en7581_pcm2),
-	PINCTRL_PIN_GROUP("spi", en7581_spi),
-	PINCTRL_PIN_GROUP("spi_quad", en7581_spi_quad),
-	PINCTRL_PIN_GROUP("spi_cs1", en7581_spi_cs1),
-	PINCTRL_PIN_GROUP("pcm_spi", en7581_pcm_spi),
-	PINCTRL_PIN_GROUP("pcm_spi_int", en7581_pcm_spi_int),
-	PINCTRL_PIN_GROUP("pcm_spi_rst", en7581_pcm_spi_rst),
-	PINCTRL_PIN_GROUP("pcm_spi_cs1", en7581_pcm_spi_cs1),
-	PINCTRL_PIN_GROUP("pcm_spi_cs2_p128", en7581_pcm_spi_cs2_p128),
-	PINCTRL_PIN_GROUP("pcm_spi_cs2_p156", en7581_pcm_spi_cs2_p156),
-	PINCTRL_PIN_GROUP("pcm_spi_cs2", en7581_pcm_spi_cs2),
-	PINCTRL_PIN_GROUP("pcm_spi_cs3", en7581_pcm_spi_cs3),
-	PINCTRL_PIN_GROUP("pcm_spi_cs4", en7581_pcm_spi_cs4),
-	PINCTRL_PIN_GROUP("emmc", en7581_emmc),
-	PINCTRL_PIN_GROUP("pnand", en7581_pnand),
-	PINCTRL_PIN_GROUP("gpio0", en7581_gpio0),
-	PINCTRL_PIN_GROUP("gpio1", en7581_gpio1),
-	PINCTRL_PIN_GROUP("gpio2", en7581_gpio2),
-	PINCTRL_PIN_GROUP("gpio3", en7581_gpio3),
-	PINCTRL_PIN_GROUP("gpio4", en7581_gpio4),
-	PINCTRL_PIN_GROUP("gpio5", en7581_gpio5),
-	PINCTRL_PIN_GROUP("gpio6", en7581_gpio6),
-	PINCTRL_PIN_GROUP("gpio7", en7581_gpio7),
-	PINCTRL_PIN_GROUP("gpio8", en7581_gpio8),
-	PINCTRL_PIN_GROUP("gpio9", en7581_gpio9),
-	PINCTRL_PIN_GROUP("gpio10", en7581_gpio10),
-	PINCTRL_PIN_GROUP("gpio11", en7581_gpio11),
-	PINCTRL_PIN_GROUP("gpio12", en7581_gpio12),
-	PINCTRL_PIN_GROUP("gpio13", en7581_gpio13),
-	PINCTRL_PIN_GROUP("gpio14", en7581_gpio14),
-	PINCTRL_PIN_GROUP("gpio15", en7581_gpio15),
-	PINCTRL_PIN_GROUP("gpio16", en7581_gpio16),
-	PINCTRL_PIN_GROUP("gpio17", en7581_gpio17),
-	PINCTRL_PIN_GROUP("gpio18", en7581_gpio18),
-	PINCTRL_PIN_GROUP("gpio19", en7581_gpio19),
-	PINCTRL_PIN_GROUP("gpio20", en7581_gpio20),
-	PINCTRL_PIN_GROUP("gpio21", en7581_gpio21),
-	PINCTRL_PIN_GROUP("gpio22", en7581_gpio22),
-	PINCTRL_PIN_GROUP("gpio23", en7581_gpio23),
-	PINCTRL_PIN_GROUP("gpio24", en7581_gpio24),
-	PINCTRL_PIN_GROUP("gpio25", en7581_gpio25),
-	PINCTRL_PIN_GROUP("gpio26", en7581_gpio26),
-	PINCTRL_PIN_GROUP("gpio27", en7581_gpio27),
-	PINCTRL_PIN_GROUP("gpio28", en7581_gpio28),
-	PINCTRL_PIN_GROUP("gpio29", en7581_gpio29),
-	PINCTRL_PIN_GROUP("gpio30", en7581_gpio30),
-	PINCTRL_PIN_GROUP("gpio31", en7581_gpio31),
-	PINCTRL_PIN_GROUP("gpio32", en7581_gpio32),
-	PINCTRL_PIN_GROUP("gpio33", en7581_gpio33),
-	PINCTRL_PIN_GROUP("gpio34", en7581_gpio34),
-	PINCTRL_PIN_GROUP("gpio35", en7581_gpio35),
-	PINCTRL_PIN_GROUP("gpio36", en7581_gpio36),
-	PINCTRL_PIN_GROUP("gpio37", en7581_gpio37),
-	PINCTRL_PIN_GROUP("gpio38", en7581_gpio38),
-	PINCTRL_PIN_GROUP("gpio39", en7581_gpio39),
-	PINCTRL_PIN_GROUP("gpio40", en7581_gpio40),
-	PINCTRL_PIN_GROUP("gpio41", en7581_gpio41),
-	PINCTRL_PIN_GROUP("gpio42", en7581_gpio42),
-	PINCTRL_PIN_GROUP("gpio43", en7581_gpio43),
-	PINCTRL_PIN_GROUP("gpio44", en7581_gpio44),
-	PINCTRL_PIN_GROUP("gpio45", en7581_gpio45),
-	PINCTRL_PIN_GROUP("gpio46", en7581_gpio46),
-	PINCTRL_PIN_GROUP("pcie_reset0", en7581_pcie_reset0),
-	PINCTRL_PIN_GROUP("pcie_reset1", en7581_pcie_reset1),
-	PINCTRL_PIN_GROUP("pcie_reset2", en7581_pcie_reset2),
-};
-
-static struct pinctrl_pin_desc an7583_pinctrl_pins[] = {
-	PINCTRL_PIN(2, "gpio0"),
-	PINCTRL_PIN(3, "gpio1"),
-	PINCTRL_PIN(4, "gpio2"),
-	PINCTRL_PIN(5, "gpio3"),
-	PINCTRL_PIN(6, "gpio4"),
-	PINCTRL_PIN(7, "gpio5"),
-	PINCTRL_PIN(8, "gpio6"),
-	PINCTRL_PIN(9, "gpio7"),
-	PINCTRL_PIN(10, "gpio8"),
-	PINCTRL_PIN(11, "gpio9"),
-	PINCTRL_PIN(12, "gpio10"),
-	PINCTRL_PIN(13, "gpio11"),
-	PINCTRL_PIN(14, "gpio12"),
-	PINCTRL_PIN(15, "gpio13"),
-	PINCTRL_PIN(16, "gpio14"),
-	PINCTRL_PIN(17, "gpio15"),
-	PINCTRL_PIN(18, "gpio16"),
-	PINCTRL_PIN(19, "gpio17"),
-	PINCTRL_PIN(20, "gpio18"),
-	PINCTRL_PIN(21, "gpio19"),
-	PINCTRL_PIN(22, "gpio20"),
-	PINCTRL_PIN(23, "gpio21"),
-	PINCTRL_PIN(24, "gpio22"),
-	PINCTRL_PIN(25, "gpio23"),
-	PINCTRL_PIN(26, "gpio24"),
-	PINCTRL_PIN(27, "gpio25"),
-	PINCTRL_PIN(28, "gpio26"),
-	PINCTRL_PIN(29, "gpio27"),
-	PINCTRL_PIN(30, "gpio28"),
-	PINCTRL_PIN(31, "gpio29"),
-	PINCTRL_PIN(32, "gpio30"),
-	PINCTRL_PIN(33, "gpio31"),
-	PINCTRL_PIN(34, "gpio32"),
-	PINCTRL_PIN(35, "gpio33"),
-	PINCTRL_PIN(36, "gpio34"),
-	PINCTRL_PIN(37, "gpio35"),
-	PINCTRL_PIN(38, "gpio36"),
-	PINCTRL_PIN(39, "gpio37"),
-	PINCTRL_PIN(40, "gpio38"),
-	PINCTRL_PIN(41, "i2c0_scl"),
-	PINCTRL_PIN(42, "i2c0_sda"),
-	PINCTRL_PIN(43, "i2c1_scl"),
-	PINCTRL_PIN(44, "i2c1_sda"),
-	PINCTRL_PIN(45, "spi_clk"),
-	PINCTRL_PIN(46, "spi_cs"),
-	PINCTRL_PIN(47, "spi_mosi"),
-	PINCTRL_PIN(48, "spi_miso"),
-	PINCTRL_PIN(49, "uart_txd"),
-	PINCTRL_PIN(50, "uart_rxd"),
-	PINCTRL_PIN(51, "pcie_reset0"),
-	PINCTRL_PIN(52, "pcie_reset1"),
-	PINCTRL_PIN(53, "mdc_0"),
-	PINCTRL_PIN(54, "mdio_0"),
-};
-
-static const int an7583_pon_pins[] = { 15, 16, 17, 18, 19, 20 };
-static const int an7583_pon_tod_1pps_pins[] = { 32 };
-static const int an7583_gsw_tod_1pps_pins[] = { 32 };
-static const int an7583_sipo_pins[] = { 34, 35 };
-static const int an7583_sipo_rclk_pins[] = { 34, 35, 33 };
-static const int an7583_mdio_pins[] = { 43, 44 };
-static const int an7583_uart2_pins[] = { 34, 35 };
-static const int an7583_uart2_cts_rts_pins[] = { 32, 33 };
-static const int an7583_hsuart_pins[] = { 30, 31 };
-static const int an7583_hsuart_cts_rts_pins[] = { 28, 29 };
-static const int an7583_npu_uart_pins[] = { 7, 8 };
-static const int an7583_uart4_pins[] = { 7, 8 };
-static const int an7583_uart5_pins[] = { 23, 24 };
-static const int an7583_i2c0_pins[] = { 41, 42 };
-static const int an7583_i2c1_pins[] = { 43, 44 };
-static const int an7583_jtag_udi_pins[] = { 23, 24, 22, 25, 26 };
-static const int an7583_jtag_dfd_pins[] = { 23, 24, 22, 25, 26 };
-static const int an7583_pcm1_pins[] = { 10, 11, 12, 13, 14 };
-static const int an7583_pcm2_pins[] = { 28, 29, 30, 31, 24 };
-static const int an7583_spi_pins[] = { 28, 29, 30, 31 };
-static const int an7583_spi_quad_pins[] = { 25, 26 };
-static const int an7583_spi_cs1_pins[] = { 27 };
-static const int an7583_pcm_spi_pins[] = { 28, 29, 30, 31, 10, 11, 12, 13 };
-static const int an7583_pcm_spi_rst_pins[] = { 14 };
-static const int an7583_pcm_spi_cs1_pins[] = { 24 };
-static const int an7583_emmc_pins[] = { 7, 8, 9, 22, 23, 24, 25, 26, 45, 46, 47 };
-static const int an7583_pnand_pins[] = { 7, 8, 9, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 45, 46, 47, 48 };
-static const int an7583_gpio0_pins[] = { 2 };
-static const int an7583_gpio1_pins[] = { 3 };
-static const int an7583_gpio2_pins[] = { 4 };
-static const int an7583_gpio3_pins[] = { 5 };
-static const int an7583_gpio4_pins[] = { 6 };
-static const int an7583_gpio5_pins[] = { 7 };
-static const int an7583_gpio6_pins[] = { 8 };
-static const int an7583_gpio7_pins[] = { 9 };
-static const int an7583_gpio8_pins[] = { 10 };
-static const int an7583_gpio9_pins[] = { 11 };
-static const int an7583_gpio10_pins[] = { 12 };
-static const int an7583_gpio11_pins[] = { 13 };
-static const int an7583_gpio12_pins[] = { 14 };
-static const int an7583_gpio13_pins[] = { 15 };
-static const int an7583_gpio14_pins[] = { 16 };
-static const int an7583_gpio15_pins[] = { 17 };
-static const int an7583_gpio16_pins[] = { 18 };
-static const int an7583_gpio17_pins[] = { 19 };
-static const int an7583_gpio18_pins[] = { 20 };
-static const int an7583_gpio19_pins[] = { 21 };
-static const int an7583_gpio20_pins[] = { 22 };
-static const int an7583_gpio21_pins[] = { 23 };
-static const int an7583_gpio22_pins[] = { 24 };
-static const int an7583_gpio23_pins[] = { 25 };
-static const int an7583_gpio24_pins[] = { 26 };
-static const int an7583_gpio25_pins[] = { 27 };
-static const int an7583_gpio26_pins[] = { 28 };
-static const int an7583_gpio27_pins[] = { 29 };
-static const int an7583_gpio28_pins[] = { 30 };
-static const int an7583_gpio29_pins[] = { 31 };
-static const int an7583_gpio30_pins[] = { 32 };
-static const int an7583_gpio31_pins[] = { 33 };
-static const int an7583_gpio32_pins[] = { 34 };
-static const int an7583_gpio33_pins[] = { 35 };
-static const int an7583_gpio34_pins[] = { 36 };
-static const int an7583_gpio35_pins[] = { 37 };
-static const int an7583_gpio36_pins[] = { 38 };
-static const int an7583_gpio37_pins[] = { 39 };
-static const int an7583_gpio38_pins[] = { 40 };
-static const int an7583_gpio39_pins[] = { 41 };
-static const int an7583_gpio40_pins[] = { 42 };
-static const int an7583_gpio41_pins[] = { 43 };
-static const int an7583_gpio42_pins[] = { 44 };
-static const int an7583_gpio43_pins[] = { 45 };
-static const int an7583_gpio44_pins[] = { 46 };
-static const int an7583_gpio45_pins[] = { 47 };
-static const int an7583_gpio46_pins[] = { 48 };
-static const int an7583_gpio47_pins[] = { 49 };
-static const int an7583_gpio48_pins[] = { 50 };
-static const int an7583_gpio49_pins[] = { 51 };
-static const int an7583_gpio50_pins[] = { 52 };
-static const int an7583_gpio51_pins[] = { 53 };
-static const int an7583_gpio52_pins[] = { 54 };
-static const int an7583_pcie_reset0_pins[] = { 51 };
-static const int an7583_pcie_reset1_pins[] = { 52 };
-
-static const struct pingroup an7583_pinctrl_groups[] = {
-	PINCTRL_PIN_GROUP("pon", an7583_pon),
-	PINCTRL_PIN_GROUP("pon_tod_1pps", an7583_pon_tod_1pps),
-	PINCTRL_PIN_GROUP("gsw_tod_1pps", an7583_gsw_tod_1pps),
-	PINCTRL_PIN_GROUP("sipo", an7583_sipo),
-	PINCTRL_PIN_GROUP("sipo_rclk", an7583_sipo_rclk),
-	PINCTRL_PIN_GROUP("mdio", an7583_mdio),
-	PINCTRL_PIN_GROUP("uart2", an7583_uart2),
-	PINCTRL_PIN_GROUP("uart2_cts_rts", an7583_uart2_cts_rts),
-	PINCTRL_PIN_GROUP("hsuart", an7583_hsuart),
-	PINCTRL_PIN_GROUP("hsuart_cts_rts", an7583_hsuart_cts_rts),
-	PINCTRL_PIN_GROUP("npu_uart", an7583_npu_uart),
-	PINCTRL_PIN_GROUP("uart4", an7583_uart4),
-	PINCTRL_PIN_GROUP("uart5", an7583_uart5),
-	PINCTRL_PIN_GROUP("i2c0", an7583_i2c0),
-	PINCTRL_PIN_GROUP("i2c1", an7583_i2c1),
-	PINCTRL_PIN_GROUP("jtag_udi", an7583_jtag_udi),
-	PINCTRL_PIN_GROUP("jtag_dfd", an7583_jtag_dfd),
-	PINCTRL_PIN_GROUP("pcm1", an7583_pcm1),
-	PINCTRL_PIN_GROUP("pcm2", an7583_pcm2),
-	PINCTRL_PIN_GROUP("spi", an7583_spi),
-	PINCTRL_PIN_GROUP("spi_quad", an7583_spi_quad),
-	PINCTRL_PIN_GROUP("spi_cs1", an7583_spi_cs1),
-	PINCTRL_PIN_GROUP("pcm_spi", an7583_pcm_spi),
-	PINCTRL_PIN_GROUP("pcm_spi_rst", an7583_pcm_spi_rst),
-	PINCTRL_PIN_GROUP("pcm_spi_cs1", an7583_pcm_spi_cs1),
-	PINCTRL_PIN_GROUP("emmc", an7583_emmc),
-	PINCTRL_PIN_GROUP("pnand", an7583_pnand),
-	PINCTRL_PIN_GROUP("gpio0", an7583_gpio0),
-	PINCTRL_PIN_GROUP("gpio1", an7583_gpio1),
-	PINCTRL_PIN_GROUP("gpio2", an7583_gpio2),
-	PINCTRL_PIN_GROUP("gpio3", an7583_gpio3),
-	PINCTRL_PIN_GROUP("gpio4", an7583_gpio4),
-	PINCTRL_PIN_GROUP("gpio5", an7583_gpio5),
-	PINCTRL_PIN_GROUP("gpio6", an7583_gpio6),
-	PINCTRL_PIN_GROUP("gpio7", an7583_gpio7),
-	PINCTRL_PIN_GROUP("gpio8", an7583_gpio8),
-	PINCTRL_PIN_GROUP("gpio9", an7583_gpio9),
-	PINCTRL_PIN_GROUP("gpio10", an7583_gpio10),
-	PINCTRL_PIN_GROUP("gpio11", an7583_gpio11),
-	PINCTRL_PIN_GROUP("gpio12", an7583_gpio12),
-	PINCTRL_PIN_GROUP("gpio13", an7583_gpio13),
-	PINCTRL_PIN_GROUP("gpio14", an7583_gpio14),
-	PINCTRL_PIN_GROUP("gpio15", an7583_gpio15),
-	PINCTRL_PIN_GROUP("gpio16", an7583_gpio16),
-	PINCTRL_PIN_GROUP("gpio17", an7583_gpio17),
-	PINCTRL_PIN_GROUP("gpio18", an7583_gpio18),
-	PINCTRL_PIN_GROUP("gpio19", an7583_gpio19),
-	PINCTRL_PIN_GROUP("gpio20", an7583_gpio20),
-	PINCTRL_PIN_GROUP("gpio21", an7583_gpio21),
-	PINCTRL_PIN_GROUP("gpio22", an7583_gpio22),
-	PINCTRL_PIN_GROUP("gpio23", an7583_gpio23),
-	PINCTRL_PIN_GROUP("gpio24", an7583_gpio24),
-	PINCTRL_PIN_GROUP("gpio25", an7583_gpio25),
-	PINCTRL_PIN_GROUP("gpio26", an7583_gpio26),
-	PINCTRL_PIN_GROUP("gpio27", an7583_gpio27),
-	PINCTRL_PIN_GROUP("gpio28", an7583_gpio28),
-	PINCTRL_PIN_GROUP("gpio29", an7583_gpio29),
-	PINCTRL_PIN_GROUP("gpio30", an7583_gpio30),
-	PINCTRL_PIN_GROUP("gpio31", an7583_gpio31),
-	PINCTRL_PIN_GROUP("gpio32", an7583_gpio32),
-	PINCTRL_PIN_GROUP("gpio33", an7583_gpio33),
-	PINCTRL_PIN_GROUP("gpio34", an7583_gpio34),
-	PINCTRL_PIN_GROUP("gpio35", an7583_gpio35),
-	PINCTRL_PIN_GROUP("gpio36", an7583_gpio36),
-	PINCTRL_PIN_GROUP("gpio37", an7583_gpio37),
-	PINCTRL_PIN_GROUP("gpio38", an7583_gpio38),
-	PINCTRL_PIN_GROUP("gpio39", an7583_gpio39),
-	PINCTRL_PIN_GROUP("gpio40", an7583_gpio40),
-	PINCTRL_PIN_GROUP("gpio41", an7583_gpio41),
-	PINCTRL_PIN_GROUP("gpio42", an7583_gpio42),
-	PINCTRL_PIN_GROUP("gpio43", an7583_gpio43),
-	PINCTRL_PIN_GROUP("gpio44", an7583_gpio44),
-	PINCTRL_PIN_GROUP("gpio45", an7583_gpio45),
-	PINCTRL_PIN_GROUP("gpio46", an7583_gpio46),
-	PINCTRL_PIN_GROUP("gpio47", an7583_gpio47),
-	PINCTRL_PIN_GROUP("gpio48", an7583_gpio48),
-	PINCTRL_PIN_GROUP("gpio49", an7583_gpio49),
-	PINCTRL_PIN_GROUP("gpio50", an7583_gpio50),
-	PINCTRL_PIN_GROUP("gpio51", an7583_gpio51),
-	PINCTRL_PIN_GROUP("gpio52", an7583_gpio52),
-	PINCTRL_PIN_GROUP("pcie_reset0", an7583_pcie_reset0),
-	PINCTRL_PIN_GROUP("pcie_reset1", an7583_pcie_reset1),
-};
-
-static const char *const pon_groups[] = { "pon" };
-static const char *const tod_1pps_groups[] = { "pon_tod_1pps", "gsw_tod_1pps" };
-static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
-static const char *const mdio_groups[] = { "mdio" };
-static const char *const an7583_mdio_groups[] = { "mdio" };
-static const char *const uart_groups[] = { "uart2", "uart2_cts_rts", "hsuart",
-					   "hsuart_cts_rts", "uart4",
-					   "uart5" };
-static const char *const i2c_groups[] = { "i2c1" };
-static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
-static const char *const pcm_groups[] = { "pcm1", "pcm2" };
-static const char *const spi_groups[] = { "spi_quad", "spi_cs1" };
-static const char *const pcm_spi_groups[] = { "pcm_spi", "pcm_spi_int",
-					      "pcm_spi_rst", "pcm_spi_cs1",
-					      "pcm_spi_cs2_p156",
-					      "pcm_spi_cs2_p128",
-					      "pcm_spi_cs3", "pcm_spi_cs4" };
-static const char *const an7583_pcm_spi_groups[] = { "pcm_spi",
-						     "pcm_spi_rst", "pcm_spi_cs1" };
-static const char *const i2s_groups[] = { "i2s" };
-static const char *const emmc_groups[] = { "emmc" };
-static const char *const pnand_groups[] = { "pnand" };
-static const char *const gpio_groups[] = { "gpio44", "gpio45", "gpio46" };
-static const char *const pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1",
-						 "pcie_reset2" };
-static const char *const an7583_gpio_groups[] = { "gpio39", "gpio40", "gpio41",
-						  "gpio42", "gpio43", "gpio44",
-						  "gpio45", "gpio46", "gpio47",
-						  "gpio48", "gpio49", "gpio50",
-						  "gpio51", "gpio52" };
-static const char *const an7583_pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1" };
-static const char *const pwm_groups[] = { "gpio0", "gpio1",
-					  "gpio2", "gpio3",
-					  "gpio4", "gpio5",
-					  "gpio6", "gpio7",
-					  "gpio8", "gpio9",
-					  "gpio10", "gpio11",
-					  "gpio12", "gpio13",
-					  "gpio14", "gpio15",
-					  "gpio16", "gpio17",
-					  "gpio18", "gpio19",
-					  "gpio20", "gpio21",
-					  "gpio22", "gpio23",
-					  "gpio24", "gpio25",
-					  "gpio26", "gpio27",
-					  "gpio28", "gpio29",
-					  "gpio30", "gpio31",
-					  "gpio36", "gpio37",
-					  "gpio38", "gpio39",
-					  "gpio40", "gpio41",
-					  "gpio42", "gpio43",
-					  "gpio44", "gpio45",
-					  "gpio46" };
-static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
-						 "gpio2", "gpio3",
-						 "gpio4", "gpio5",
-						 "gpio6", "gpio7",
-						 "gpio8", "gpio9",
-						 "gpio10", "gpio11",
-						 "gpio12", "gpio13",
-						 "gpio14", "gpio15",
-						 "gpio16", "gpio17",
-						 "gpio18", "gpio19",
-						 "gpio20", "gpio21",
-						 "gpio22", "gpio23",
-						 "gpio24", "gpio25",
-						 "gpio26", "gpio27",
-						 "gpio28", "gpio29",
-						 "gpio30", "gpio31",
-						 "gpio36", "gpio37",
-						 "gpio38", "gpio39",
-						 "gpio40", "gpio41",
-						 "gpio42", "gpio43",
-						 "gpio44", "gpio45",
-						 "gpio46", "gpio47",
-						 "gpio48", "gpio49",
-						 "gpio50", "gpio51" };
-static const char *const phy1_led0_groups[] = { "gpio33", "gpio34",
-						"gpio35", "gpio42" };
-static const char *const phy2_led0_groups[] = { "gpio33", "gpio34",
-						"gpio35", "gpio42" };
-static const char *const phy3_led0_groups[] = { "gpio33", "gpio34",
-						"gpio35", "gpio42" };
-static const char *const phy4_led0_groups[] = { "gpio33", "gpio34",
-						"gpio35", "gpio42" };
-static const char *const phy1_led1_groups[] = { "gpio43", "gpio44",
-						"gpio45", "gpio46" };
-static const char *const phy2_led1_groups[] = { "gpio43", "gpio44",
-						"gpio45", "gpio46" };
-static const char *const phy3_led1_groups[] = { "gpio43", "gpio44",
-						"gpio45", "gpio46" };
-static const char *const phy4_led1_groups[] = { "gpio43", "gpio44",
-						"gpio45", "gpio46" };
-static const char *const an7583_phy1_led0_groups[] = { "gpio1", "gpio2",
-							"gpio3", "gpio4" };
-static const char *const an7583_phy2_led0_groups[] = { "gpio1", "gpio2",
-							"gpio3", "gpio4" };
-static const char *const an7583_phy3_led0_groups[] = { "gpio1", "gpio2",
-							"gpio3", "gpio4" };
-static const char *const an7583_phy4_led0_groups[] = { "gpio1", "gpio2",
-							"gpio3", "gpio4" };
-static const char *const an7583_phy1_led1_groups[] = { "gpio8", "gpio9",
-							"gpio10", "gpio11" };
-static const char *const an7583_phy2_led1_groups[] = { "gpio8", "gpio9",
-							"gpio10", "gpio11" };
-static const char *const an7583_phy3_led1_groups[] = { "gpio8", "gpio9",
-							"gpio10", "gpio11" };
-static const char *const an7583_phy4_led1_groups[] = { "gpio8", "gpio9",
-							"gpio10", "gpio11" };
-
-static const struct airoha_pinctrl_func_group pon_func_group[] = {
-	{
-		.name = "pon",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_PON_MODE_MASK,
-			GPIO_PON_MODE_MASK
-		},
-		.regmap_size = 1,
-	},
-};
-
-static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
-	{
-		.name = "pon_tod_1pps",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			PON_TOD_1PPS_MODE_MASK,
-			PON_TOD_1PPS_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gsw_tod_1pps",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GSW_TOD_1PPS_MODE_MASK,
-			GSW_TOD_1PPS_MODE_MASK
-		},
-		.regmap_size = 1,
-	},
-};
-
-static const struct airoha_pinctrl_func_group sipo_func_group[] = {
-	{
-		.name = "sipo",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
-			GPIO_SIPO_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "sipo_rclk",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
-			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK
-		},
-		.regmap_size = 1,
-	},
-};
-
-static const struct airoha_pinctrl_func_group mdio_func_group[] = {
-	{
-		.name = "mdio",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MASK,
-			GPIO_MDC_IO_MASTER_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_FORCE_GPIO_EN,
-			FORCE_GPIO_EN(1) | FORCE_GPIO_EN(2),
-			FORCE_GPIO_EN(1) | FORCE_GPIO_EN(2)
-		},
-		.regmap_size = 2,
-	},
-};
-
-static const struct airoha_pinctrl_func_group an7583_mdio_func_group[] = {
-	{
-		.name = "mdio",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_SGMII_MDIO_MODE_MASK,
-			GPIO_SGMII_MDIO_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MASK,
-			GPIO_MDC_IO_MASTER_MODE_MASK
-		},
-		.regmap_size = 2,
-	},
-};
-
-static const struct airoha_pinctrl_func_group uart_func_group[] = {
-	{
-		.name = "uart2",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_UART2_MODE_MASK,
-			GPIO_UART2_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "uart2_cts_rts",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_UART2_MODE_MASK | GPIO_UART2_CTS_RTS_MODE_MASK,
-			GPIO_UART2_MODE_MASK | GPIO_UART2_CTS_RTS_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "hsuart",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
-			GPIO_HSUART_MODE_MASK
-		},
-		.regmap_size = 1,
-	},
-	{
-		.name = "hsuart_cts_rts",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
-			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "uart4",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_UART4_MODE_MASK,
-			GPIO_UART4_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "uart5",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_UART5_MODE_MASK,
-			GPIO_UART5_MODE_MASK
-		},
-		.regmap_size = 1,
-	},
-};
-
-static const struct airoha_pinctrl_func_group i2c_func_group[] = {
-	{
-		.name = "i2c1",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_2ND_I2C_MODE_MASK,
-			GPIO_2ND_I2C_MODE_MASK
-		},
-		.regmap_size = 1,
-	},
-};
-
-static const struct airoha_pinctrl_func_group jtag_func_group[] = {
-	{
-		.name = "jtag_udi",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_NPU_UART_EN,
-			JTAG_UDI_EN_MASK,
-			JTAG_UDI_EN_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "jtag_dfd",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_NPU_UART_EN,
-			JTAG_DFD_EN_MASK,
-			JTAG_DFD_EN_MASK
-		},
-		.regmap_size = 1,
-	},
-};
-
-static const struct airoha_pinctrl_func_group pcm_func_group[] = {
-	{
-		.name = "pcm1",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_PCM1_MODE_MASK,
-			GPIO_PCM1_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcm2",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_PCM2_MODE_MASK,
-			GPIO_PCM2_MODE_MASK
-		},
-		.regmap_size = 1,
-	},
-};
-
-static const struct airoha_pinctrl_func_group spi_func_group[] = {
-	{
-		.name = "spi_quad",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_SPI_QUAD_MODE_MASK,
-			GPIO_SPI_QUAD_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "spi_cs1",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_SPI_CS1_MODE_MASK,
-			GPIO_SPI_CS1_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "spi_cs2",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_SPI_CS2_MODE_MASK,
-			GPIO_SPI_CS2_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "spi_cs3",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_SPI_CS3_MODE_MASK,
-			GPIO_SPI_CS3_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "spi_cs4",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_SPI_CS4_MODE_MASK,
-			GPIO_SPI_CS4_MODE_MASK
-		},
-		.regmap_size = 1,
-	},
-};
-
-static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
-	{
-		.name = "pcm_spi",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_PCM_SPI_MODE_MASK,
-			GPIO_PCM_SPI_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcm_spi_int",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_PCM_INT_MODE_MASK,
-			GPIO_PCM_INT_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcm_spi_rst",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_PCM_RESET_MODE_MASK,
-			GPIO_PCM_RESET_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcm_spi_cs1",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_PCM_SPI_CS1_MODE_MASK,
-			GPIO_PCM_SPI_CS1_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcm_spi_cs2_p128",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_PCM_SPI_CS2_MODE_P128_MASK,
-			GPIO_PCM_SPI_CS2_MODE_P128_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcm_spi_cs2_p156",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_PCM_SPI_CS2_MODE_P156_MASK,
-			GPIO_PCM_SPI_CS2_MODE_P156_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcm_spi_cs3",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_PCM_SPI_CS3_MODE_MASK,
-			GPIO_PCM_SPI_CS3_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcm_spi_cs4",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_PCM_SPI_CS4_MODE_MASK,
-			GPIO_PCM_SPI_CS4_MODE_MASK
-		},
-		.regmap_size = 1,
-	},
-};
-
-static const struct airoha_pinctrl_func_group an7583_pcm_spi_func_group[] = {
-	{
-		.name = "pcm_spi",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_PCM_SPI_MODE_MASK,
-			GPIO_PCM_SPI_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcm_spi_int",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_PCM_INT_MODE_MASK,
-			GPIO_PCM_INT_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcm_spi_rst",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_PCM_RESET_MODE_MASK,
-			GPIO_PCM_RESET_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcm_spi_cs1",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_PCM_SPI_CS1_MODE_MASK,
-			GPIO_PCM_SPI_CS1_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcm_spi_cs2",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			AN7583_GPIO_PCM_SPI_CS2_MODE_MASK,
-			AN7583_GPIO_PCM_SPI_CS2_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcm_spi_cs3",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_PCM_SPI_CS3_MODE_MASK,
-			GPIO_PCM_SPI_CS3_MODE_MASK
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcm_spi_cs4",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			GPIO_PCM_SPI_CS4_MODE_MASK,
-			GPIO_PCM_SPI_CS4_MODE_MASK
-		},
-		.regmap_size = 1,
-	},
-};
-
-static const struct airoha_pinctrl_func_group i2s_func_group[] = {
-	{
-		.name = "i2s",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_I2S_MODE_MASK,
-			GPIO_I2S_MODE_MASK
-		},
-		.regmap_size = 1,
-	},
-};
-
-static const struct airoha_pinctrl_func_group emmc_func_group[] = {
-	{
-		.name = "emmc",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_EMMC_MODE_MASK,
-			GPIO_EMMC_MODE_MASK
-		},
-		.regmap_size = 1,
-	},
-};
-
-static const struct airoha_pinctrl_func_group pnand_func_group[] = {
-	{
-		.name = "pnand",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_PARALLEL_NAND_MODE_MASK,
-			GPIO_PARALLEL_NAND_MODE_MASK
-		},
-		.regmap_size = 1,
-	},
-};
-
-static const struct airoha_pinctrl_func_group gpio_func_group[] = {
-	AIROHA_PINCTRL_GPIO_EXT("gpio44", GPIO44_FLASH_MODE_CFG,
-				GPIO_PCIE_RESET0_MASK),
-	AIROHA_PINCTRL_GPIO_EXT("gpio45", GPIO45_FLASH_MODE_CFG,
-				GPIO_PCIE_RESET1_MASK),
-	AIROHA_PINCTRL_GPIO_EXT("gpio46", GPIO46_FLASH_MODE_CFG,
-				GPIO_PCIE_RESET2_MASK),
-};
-
-static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
-	{
-		.name = "pcie_reset0",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_PCIE_RESET0_MASK,
-			0
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcie_reset1",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_PCIE_RESET1_MASK,
-			0
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcie_reset2",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_PCIE_RESET2_MASK,
-			0
-		},
-		.regmap_size = 1,
-	},
-};
-
-static const struct airoha_pinctrl_func_group an7583_gpio_func_group[] = {
-	AIROHA_PINCTRL_GPIO_EXT("gpio39", GPIO39_FLASH_MODE_CFG,
-				AN7583_I2C0_SCL_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_GPIO_EXT("gpio40", GPIO40_FLASH_MODE_CFG,
-				AN7583_I2C0_SDA_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_GPIO_EXT("gpio41", GPIO41_FLASH_MODE_CFG,
-				AN7583_I2C1_SCL_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_GPIO_EXT("gpio42", GPIO42_FLASH_MODE_CFG,
-				AN7583_I2C1_SDA_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_GPIO_EXT("gpio43", GPIO43_FLASH_MODE_CFG,
-				AN7583_SPI_CLK_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_GPIO_EXT("gpio44", GPIO44_FLASH_MODE_CFG,
-				AN7583_SPI_CS_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_GPIO_EXT("gpio45", GPIO45_FLASH_MODE_CFG,
-				AN7583_SPI_MOSI_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_GPIO_EXT("gpio46", GPIO46_FLASH_MODE_CFG,
-				AN7583_SPI_MISO_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
-				AN7583_UART_TXD_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
-				AN7583_UART_RXD_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
-				GPIO_PCIE_RESET0_MASK),
-	AIROHA_PINCTRL_GPIO_EXT("gpio50", GPIO50_FLASH_MODE_CFG,
-				GPIO_PCIE_RESET1_MASK),
-	AIROHA_PINCTRL_GPIO_EXT("gpio51", GPIO51_FLASH_MODE_CFG,
-				AN7583_MDC_0_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_GPIO("gpio52", AN7583_MDIO_0_GPIO_MODE_MASK),
-};
-
-static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
-	{
-		.name = "pcie_reset0",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_PCIE_RESET0_MASK,
-			0
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "pcie_reset1",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_PCIE_RESET1_MASK,
-			0
-		},
-		.regmap_size = 1,
-	},
-};
-
-static const struct airoha_pinctrl_func_group pwm_func_group[] = {
-	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio28", GPIO28_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio29", GPIO29_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio30", GPIO30_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio31", GPIO31_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio39", GPIO39_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio40", GPIO40_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio41", GPIO41_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio42", GPIO42_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio43", GPIO43_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT_SEC("gpio44", GPIO44_FLASH_MODE_CFG,
-				   GPIO_PCIE_RESET0_MASK),
-	AIROHA_PINCTRL_PWM_EXT_SEC("gpio45", GPIO45_FLASH_MODE_CFG,
-				   GPIO_PCIE_RESET1_MASK),
-	AIROHA_PINCTRL_PWM_EXT_SEC("gpio46", GPIO46_FLASH_MODE_CFG,
-				   GPIO_PCIE_RESET2_MASK),
-};
-
-static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
-	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio28", GPIO28_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio29", GPIO29_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio30", GPIO30_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio31", GPIO31_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT_SEC("gpio39", GPIO39_FLASH_MODE_CFG,
-				   AN7583_I2C0_SCL_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_PWM_EXT_SEC("gpio40", GPIO40_FLASH_MODE_CFG,
-				   AN7583_I2C0_SDA_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_PWM_EXT_SEC("gpio41", GPIO41_FLASH_MODE_CFG,
-				   AN7583_I2C1_SCL_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_PWM_EXT_SEC("gpio42", GPIO42_FLASH_MODE_CFG,
-				   AN7583_I2C1_SDA_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_PWM_EXT_SEC("gpio43", GPIO43_FLASH_MODE_CFG,
-				   AN7583_SPI_CLK_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_PWM_EXT_SEC("gpio44", GPIO44_FLASH_MODE_CFG,
-				   AN7583_SPI_CS_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_PWM_EXT_SEC("gpio45", GPIO45_FLASH_MODE_CFG,
-				   AN7583_SPI_MOSI_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_PWM_EXT_SEC("gpio46", GPIO46_FLASH_MODE_CFG,
-				   AN7583_SPI_MISO_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_PWM_EXT_SEC("gpio47", GPIO47_FLASH_MODE_CFG,
-				   AN7583_UART_TXD_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_PWM_EXT_SEC("gpio48", GPIO48_FLASH_MODE_CFG,
-				   AN7583_UART_RXD_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_PWM_EXT_SEC("gpio49", GPIO49_FLASH_MODE_CFG,
-				   GPIO_PCIE_RESET0_MASK),
-	AIROHA_PINCTRL_PWM_EXT_SEC("gpio50", GPIO50_FLASH_MODE_CFG,
-				   GPIO_PCIE_RESET1_MASK),
-	AIROHA_PINCTRL_PWM_EXT_SEC("gpio51", GPIO51_FLASH_MODE_CFG,
-				   AN7583_MDC_0_GPIO_MODE_MASK),
-};
-
-static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
-};
-
-static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
-};
-
-static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
-};
-
-static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
-};
-
-static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
-};
-
-static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
-};
-
-static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
-};
-
-static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
-};
-
-static const struct airoha_pinctrl_func_group an7583_phy1_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio3", GPIO_LAN2_LED0_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio4", GPIO_LAN3_LED0_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
-};
-
-static const struct airoha_pinctrl_func_group an7583_phy2_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio3", GPIO_LAN2_LED0_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio4", GPIO_LAN3_LED0_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
-};
-
-static const struct airoha_pinctrl_func_group an7583_phy3_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio3", GPIO_LAN2_LED0_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio4", GPIO_LAN3_LED0_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
-};
-
-static const struct airoha_pinctrl_func_group an7583_phy4_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio3", GPIO_LAN2_LED0_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio4", GPIO_LAN3_LED0_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
-};
-
-static const struct airoha_pinctrl_func_group an7583_phy1_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
-};
-
-static const struct airoha_pinctrl_func_group an7583_phy2_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
-};
-
-static const struct airoha_pinctrl_func_group an7583_phy3_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
-};
-
-static const struct airoha_pinctrl_func_group an7583_phy4_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
-};
-
-static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
-	PINCTRL_FUNC_DESC("pon", pon),
-	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
-	PINCTRL_FUNC_DESC("sipo", sipo),
-	PINCTRL_FUNC_DESC("mdio", mdio),
-	PINCTRL_FUNC_DESC("uart", uart),
-	PINCTRL_FUNC_DESC("i2c", i2c),
-	PINCTRL_FUNC_DESC("jtag", jtag),
-	PINCTRL_FUNC_DESC("pcm", pcm),
-	PINCTRL_FUNC_DESC("spi", spi),
-	PINCTRL_FUNC_DESC("pcm_spi", pcm_spi),
-	PINCTRL_FUNC_DESC("i2s", i2s),
-	PINCTRL_FUNC_DESC("emmc", emmc),
-	PINCTRL_FUNC_DESC("pnand", pnand),
-	PINCTRL_FUNC_DESC("gpio", gpio),
-	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
-	PINCTRL_FUNC_DESC("pwm", pwm),
-	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
-	PINCTRL_FUNC_DESC("phy2_led0", phy2_led0),
-	PINCTRL_FUNC_DESC("phy3_led0", phy3_led0),
-	PINCTRL_FUNC_DESC("phy4_led0", phy4_led0),
-	PINCTRL_FUNC_DESC("phy1_led1", phy1_led1),
-	PINCTRL_FUNC_DESC("phy2_led1", phy2_led1),
-	PINCTRL_FUNC_DESC("phy3_led1", phy3_led1),
-	PINCTRL_FUNC_DESC("phy4_led1", phy4_led1),
-};
-
-static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
-	PINCTRL_FUNC_DESC("pon", pon),
-	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
-	PINCTRL_FUNC_DESC("sipo", sipo),
-	PINCTRL_FUNC_DESC("mdio", an7583_mdio),
-	PINCTRL_FUNC_DESC("uart", uart),
-	PINCTRL_FUNC_DESC("jtag", jtag),
-	PINCTRL_FUNC_DESC("pcm", pcm),
-	PINCTRL_FUNC_DESC("spi", spi),
-	PINCTRL_FUNC_DESC("pcm_spi", an7583_pcm_spi),
-	PINCTRL_FUNC_DESC("emmc", emmc),
-	PINCTRL_FUNC_DESC("pnand", pnand),
-	PINCTRL_FUNC_DESC("gpio", an7583_gpio),
-	PINCTRL_FUNC_DESC("pcie_reset", an7583_pcie_reset),
-	PINCTRL_FUNC_DESC("pwm", an7583_pwm),
-	PINCTRL_FUNC_DESC("phy1_led0", an7583_phy1_led0),
-	PINCTRL_FUNC_DESC("phy2_led0", an7583_phy2_led0),
-	PINCTRL_FUNC_DESC("phy3_led0", an7583_phy3_led0),
-	PINCTRL_FUNC_DESC("phy4_led0", an7583_phy4_led0),
-	PINCTRL_FUNC_DESC("phy1_led1", an7583_phy1_led1),
-	PINCTRL_FUNC_DESC("phy2_led1", an7583_phy2_led1),
-	PINCTRL_FUNC_DESC("phy3_led1", an7583_phy3_led1),
-	PINCTRL_FUNC_DESC("phy4_led1", an7583_phy4_led1),
-};
-
-static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
-	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
-	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
-	PINCTRL_CONF_DESC(4, REG_I2C_SDA_PU, SPI_CS0_PU_MASK),
-	PINCTRL_CONF_DESC(5, REG_I2C_SDA_PU, SPI_CLK_PU_MASK),
-	PINCTRL_CONF_DESC(6, REG_I2C_SDA_PU, SPI_MOSI_PU_MASK),
-	PINCTRL_CONF_DESC(7, REG_I2C_SDA_PU, SPI_MISO_PU_MASK),
-	PINCTRL_CONF_DESC(13, REG_GPIO_L_PU, BIT(0)),
-	PINCTRL_CONF_DESC(14, REG_GPIO_L_PU, BIT(1)),
-	PINCTRL_CONF_DESC(15, REG_GPIO_L_PU, BIT(2)),
-	PINCTRL_CONF_DESC(16, REG_GPIO_L_PU, BIT(3)),
-	PINCTRL_CONF_DESC(17, REG_GPIO_L_PU, BIT(4)),
-	PINCTRL_CONF_DESC(18, REG_GPIO_L_PU, BIT(5)),
-	PINCTRL_CONF_DESC(19, REG_GPIO_L_PU, BIT(6)),
-	PINCTRL_CONF_DESC(20, REG_GPIO_L_PU, BIT(7)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(8)),
-	PINCTRL_CONF_DESC(22, REG_GPIO_L_PU, BIT(9)),
-	PINCTRL_CONF_DESC(23, REG_GPIO_L_PU, BIT(10)),
-	PINCTRL_CONF_DESC(24, REG_GPIO_L_PU, BIT(11)),
-	PINCTRL_CONF_DESC(25, REG_GPIO_L_PU, BIT(12)),
-	PINCTRL_CONF_DESC(26, REG_GPIO_L_PU, BIT(13)),
-	PINCTRL_CONF_DESC(27, REG_GPIO_L_PU, BIT(14)),
-	PINCTRL_CONF_DESC(28, REG_GPIO_L_PU, BIT(15)),
-	PINCTRL_CONF_DESC(29, REG_GPIO_L_PU, BIT(16)),
-	PINCTRL_CONF_DESC(30, REG_GPIO_L_PU, BIT(17)),
-	PINCTRL_CONF_DESC(31, REG_GPIO_L_PU, BIT(18)),
-	PINCTRL_CONF_DESC(32, REG_GPIO_L_PU, BIT(19)),
-	PINCTRL_CONF_DESC(33, REG_GPIO_L_PU, BIT(20)),
-	PINCTRL_CONF_DESC(34, REG_GPIO_L_PU, BIT(21)),
-	PINCTRL_CONF_DESC(35, REG_GPIO_L_PU, BIT(22)),
-	PINCTRL_CONF_DESC(36, REG_GPIO_L_PU, BIT(23)),
-	PINCTRL_CONF_DESC(37, REG_GPIO_L_PU, BIT(24)),
-	PINCTRL_CONF_DESC(38, REG_GPIO_L_PU, BIT(25)),
-	PINCTRL_CONF_DESC(39, REG_GPIO_L_PU, BIT(26)),
-	PINCTRL_CONF_DESC(40, REG_GPIO_L_PU, BIT(27)),
-	PINCTRL_CONF_DESC(41, REG_GPIO_L_PU, BIT(28)),
-	PINCTRL_CONF_DESC(42, REG_GPIO_L_PU, BIT(29)),
-	PINCTRL_CONF_DESC(43, REG_GPIO_L_PU, BIT(30)),
-	PINCTRL_CONF_DESC(44, REG_GPIO_L_PU, BIT(31)),
-	PINCTRL_CONF_DESC(45, REG_GPIO_H_PU, BIT(0)),
-	PINCTRL_CONF_DESC(46, REG_GPIO_H_PU, BIT(1)),
-	PINCTRL_CONF_DESC(47, REG_GPIO_H_PU, BIT(2)),
-	PINCTRL_CONF_DESC(48, REG_GPIO_H_PU, BIT(3)),
-	PINCTRL_CONF_DESC(49, REG_GPIO_H_PU, BIT(4)),
-	PINCTRL_CONF_DESC(50, REG_GPIO_H_PU, BIT(5)),
-	PINCTRL_CONF_DESC(51, REG_GPIO_H_PU, BIT(6)),
-	PINCTRL_CONF_DESC(52, REG_GPIO_H_PU, BIT(7)),
-	PINCTRL_CONF_DESC(53, REG_GPIO_H_PU, BIT(8)),
-	PINCTRL_CONF_DESC(54, REG_GPIO_H_PU, BIT(9)),
-	PINCTRL_CONF_DESC(55, REG_GPIO_H_PU, BIT(10)),
-	PINCTRL_CONF_DESC(56, REG_GPIO_H_PU, BIT(11)),
-	PINCTRL_CONF_DESC(57, REG_GPIO_H_PU, BIT(12)),
-	PINCTRL_CONF_DESC(58, REG_GPIO_H_PU, BIT(13)),
-	PINCTRL_CONF_DESC(59, REG_GPIO_H_PU, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
-};
-
-static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
-	PINCTRL_CONF_DESC(2, REG_GPIO_L_PU, BIT(0)),
-	PINCTRL_CONF_DESC(3, REG_GPIO_L_PU, BIT(1)),
-	PINCTRL_CONF_DESC(4, REG_GPIO_L_PU, BIT(2)),
-	PINCTRL_CONF_DESC(5, REG_GPIO_L_PU, BIT(3)),
-	PINCTRL_CONF_DESC(6, REG_GPIO_L_PU, BIT(4)),
-	PINCTRL_CONF_DESC(7, REG_GPIO_L_PU, BIT(5)),
-	PINCTRL_CONF_DESC(8, REG_GPIO_L_PU, BIT(6)),
-	PINCTRL_CONF_DESC(9, REG_GPIO_L_PU, BIT(7)),
-	PINCTRL_CONF_DESC(10, REG_GPIO_L_PU, BIT(8)),
-	PINCTRL_CONF_DESC(11, REG_GPIO_L_PU, BIT(9)),
-	PINCTRL_CONF_DESC(12, REG_GPIO_L_PU, BIT(10)),
-	PINCTRL_CONF_DESC(13, REG_GPIO_L_PU, BIT(11)),
-	PINCTRL_CONF_DESC(14, REG_GPIO_L_PU, BIT(12)),
-	PINCTRL_CONF_DESC(15, REG_GPIO_L_PU, BIT(13)),
-	PINCTRL_CONF_DESC(16, REG_GPIO_L_PU, BIT(14)),
-	PINCTRL_CONF_DESC(17, REG_GPIO_L_PU, BIT(15)),
-	PINCTRL_CONF_DESC(18, REG_GPIO_L_PU, BIT(16)),
-	PINCTRL_CONF_DESC(19, REG_GPIO_L_PU, BIT(17)),
-	PINCTRL_CONF_DESC(20, REG_GPIO_L_PU, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(19)),
-	PINCTRL_CONF_DESC(22, REG_GPIO_L_PU, BIT(20)),
-	PINCTRL_CONF_DESC(23, REG_GPIO_L_PU, BIT(21)),
-	PINCTRL_CONF_DESC(24, REG_GPIO_L_PU, BIT(22)),
-	PINCTRL_CONF_DESC(25, REG_GPIO_L_PU, BIT(23)),
-	PINCTRL_CONF_DESC(26, REG_GPIO_L_PU, BIT(24)),
-	PINCTRL_CONF_DESC(27, REG_GPIO_L_PU, BIT(25)),
-	PINCTRL_CONF_DESC(28, REG_GPIO_L_PU, BIT(26)),
-	PINCTRL_CONF_DESC(29, REG_GPIO_L_PU, BIT(27)),
-	PINCTRL_CONF_DESC(30, REG_GPIO_L_PU, BIT(28)),
-	PINCTRL_CONF_DESC(31, REG_GPIO_L_PU, BIT(29)),
-	PINCTRL_CONF_DESC(32, REG_GPIO_L_PU, BIT(30)),
-	PINCTRL_CONF_DESC(33, REG_GPIO_L_PU, BIT(31)),
-	PINCTRL_CONF_DESC(34, REG_GPIO_H_PU, BIT(0)),
-	PINCTRL_CONF_DESC(35, REG_GPIO_H_PU, BIT(1)),
-	PINCTRL_CONF_DESC(36, REG_GPIO_H_PU, BIT(2)),
-	PINCTRL_CONF_DESC(37, REG_GPIO_H_PU, BIT(3)),
-	PINCTRL_CONF_DESC(38, REG_GPIO_H_PU, BIT(4)),
-	PINCTRL_CONF_DESC(39, REG_GPIO_H_PU, BIT(5)),
-	PINCTRL_CONF_DESC(40, REG_GPIO_H_PU, BIT(6)),
-	PINCTRL_CONF_DESC(41, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
-	PINCTRL_CONF_DESC(42, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
-	PINCTRL_CONF_DESC(43, REG_I2C_SDA_PU, AN7583_I2C1_SCL_PU_MASK),
-	PINCTRL_CONF_DESC(44, REG_I2C_SDA_PU, AN7583_I2C1_SDA_PU_MASK),
-	PINCTRL_CONF_DESC(45, REG_I2C_SDA_PU, SPI_CLK_PU_MASK),
-	PINCTRL_CONF_DESC(46, REG_I2C_SDA_PU, SPI_CS0_PU_MASK),
-	PINCTRL_CONF_DESC(47, REG_I2C_SDA_PU, SPI_MOSI_PU_MASK),
-	PINCTRL_CONF_DESC(48, REG_I2C_SDA_PU, SPI_MISO_PU_MASK),
-	PINCTRL_CONF_DESC(49, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
-	PINCTRL_CONF_DESC(50, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
-	PINCTRL_CONF_DESC(51, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
-	PINCTRL_CONF_DESC(52, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
-	PINCTRL_CONF_DESC(53, REG_I2C_SDA_PU, AN7583_MDC_0_PU_MASK),
-	PINCTRL_CONF_DESC(54, REG_I2C_SDA_PU, AN7583_MDIO_0_PU_MASK),
-};
-
-static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
-	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
-	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
-	PINCTRL_CONF_DESC(4, REG_I2C_SDA_PD, SPI_CS0_PD_MASK),
-	PINCTRL_CONF_DESC(5, REG_I2C_SDA_PD, SPI_CLK_PD_MASK),
-	PINCTRL_CONF_DESC(6, REG_I2C_SDA_PD, SPI_MOSI_PD_MASK),
-	PINCTRL_CONF_DESC(7, REG_I2C_SDA_PD, SPI_MISO_PD_MASK),
-	PINCTRL_CONF_DESC(13, REG_GPIO_L_PD, BIT(0)),
-	PINCTRL_CONF_DESC(14, REG_GPIO_L_PD, BIT(1)),
-	PINCTRL_CONF_DESC(15, REG_GPIO_L_PD, BIT(2)),
-	PINCTRL_CONF_DESC(16, REG_GPIO_L_PD, BIT(3)),
-	PINCTRL_CONF_DESC(17, REG_GPIO_L_PD, BIT(4)),
-	PINCTRL_CONF_DESC(18, REG_GPIO_L_PD, BIT(5)),
-	PINCTRL_CONF_DESC(19, REG_GPIO_L_PD, BIT(6)),
-	PINCTRL_CONF_DESC(20, REG_GPIO_L_PD, BIT(7)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(8)),
-	PINCTRL_CONF_DESC(22, REG_GPIO_L_PD, BIT(9)),
-	PINCTRL_CONF_DESC(23, REG_GPIO_L_PD, BIT(10)),
-	PINCTRL_CONF_DESC(24, REG_GPIO_L_PD, BIT(11)),
-	PINCTRL_CONF_DESC(25, REG_GPIO_L_PD, BIT(12)),
-	PINCTRL_CONF_DESC(26, REG_GPIO_L_PD, BIT(13)),
-	PINCTRL_CONF_DESC(27, REG_GPIO_L_PD, BIT(14)),
-	PINCTRL_CONF_DESC(28, REG_GPIO_L_PD, BIT(15)),
-	PINCTRL_CONF_DESC(29, REG_GPIO_L_PD, BIT(16)),
-	PINCTRL_CONF_DESC(30, REG_GPIO_L_PD, BIT(17)),
-	PINCTRL_CONF_DESC(31, REG_GPIO_L_PD, BIT(18)),
-	PINCTRL_CONF_DESC(32, REG_GPIO_L_PD, BIT(19)),
-	PINCTRL_CONF_DESC(33, REG_GPIO_L_PD, BIT(20)),
-	PINCTRL_CONF_DESC(34, REG_GPIO_L_PD, BIT(21)),
-	PINCTRL_CONF_DESC(35, REG_GPIO_L_PD, BIT(22)),
-	PINCTRL_CONF_DESC(36, REG_GPIO_L_PD, BIT(23)),
-	PINCTRL_CONF_DESC(37, REG_GPIO_L_PD, BIT(24)),
-	PINCTRL_CONF_DESC(38, REG_GPIO_L_PD, BIT(25)),
-	PINCTRL_CONF_DESC(39, REG_GPIO_L_PD, BIT(26)),
-	PINCTRL_CONF_DESC(40, REG_GPIO_L_PD, BIT(27)),
-	PINCTRL_CONF_DESC(41, REG_GPIO_L_PD, BIT(28)),
-	PINCTRL_CONF_DESC(42, REG_GPIO_L_PD, BIT(29)),
-	PINCTRL_CONF_DESC(43, REG_GPIO_L_PD, BIT(30)),
-	PINCTRL_CONF_DESC(44, REG_GPIO_L_PD, BIT(31)),
-	PINCTRL_CONF_DESC(45, REG_GPIO_H_PD, BIT(0)),
-	PINCTRL_CONF_DESC(46, REG_GPIO_H_PD, BIT(1)),
-	PINCTRL_CONF_DESC(47, REG_GPIO_H_PD, BIT(2)),
-	PINCTRL_CONF_DESC(48, REG_GPIO_H_PD, BIT(3)),
-	PINCTRL_CONF_DESC(49, REG_GPIO_H_PD, BIT(4)),
-	PINCTRL_CONF_DESC(50, REG_GPIO_H_PD, BIT(5)),
-	PINCTRL_CONF_DESC(51, REG_GPIO_H_PD, BIT(6)),
-	PINCTRL_CONF_DESC(52, REG_GPIO_H_PD, BIT(7)),
-	PINCTRL_CONF_DESC(53, REG_GPIO_H_PD, BIT(8)),
-	PINCTRL_CONF_DESC(54, REG_GPIO_H_PD, BIT(9)),
-	PINCTRL_CONF_DESC(55, REG_GPIO_H_PD, BIT(10)),
-	PINCTRL_CONF_DESC(56, REG_GPIO_H_PD, BIT(11)),
-	PINCTRL_CONF_DESC(57, REG_GPIO_H_PD, BIT(12)),
-	PINCTRL_CONF_DESC(58, REG_GPIO_H_PD, BIT(13)),
-	PINCTRL_CONF_DESC(59, REG_GPIO_H_PD, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
-};
-
-static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
-	PINCTRL_CONF_DESC(2, REG_GPIO_L_PD, BIT(0)),
-	PINCTRL_CONF_DESC(3, REG_GPIO_L_PD, BIT(1)),
-	PINCTRL_CONF_DESC(4, REG_GPIO_L_PD, BIT(2)),
-	PINCTRL_CONF_DESC(5, REG_GPIO_L_PD, BIT(3)),
-	PINCTRL_CONF_DESC(6, REG_GPIO_L_PD, BIT(4)),
-	PINCTRL_CONF_DESC(7, REG_GPIO_L_PD, BIT(5)),
-	PINCTRL_CONF_DESC(8, REG_GPIO_L_PD, BIT(6)),
-	PINCTRL_CONF_DESC(9, REG_GPIO_L_PD, BIT(7)),
-	PINCTRL_CONF_DESC(10, REG_GPIO_L_PD, BIT(8)),
-	PINCTRL_CONF_DESC(11, REG_GPIO_L_PD, BIT(9)),
-	PINCTRL_CONF_DESC(12, REG_GPIO_L_PD, BIT(10)),
-	PINCTRL_CONF_DESC(13, REG_GPIO_L_PD, BIT(11)),
-	PINCTRL_CONF_DESC(14, REG_GPIO_L_PD, BIT(12)),
-	PINCTRL_CONF_DESC(15, REG_GPIO_L_PD, BIT(13)),
-	PINCTRL_CONF_DESC(16, REG_GPIO_L_PD, BIT(14)),
-	PINCTRL_CONF_DESC(17, REG_GPIO_L_PD, BIT(15)),
-	PINCTRL_CONF_DESC(18, REG_GPIO_L_PD, BIT(16)),
-	PINCTRL_CONF_DESC(19, REG_GPIO_L_PD, BIT(17)),
-	PINCTRL_CONF_DESC(20, REG_GPIO_L_PD, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(19)),
-	PINCTRL_CONF_DESC(22, REG_GPIO_L_PD, BIT(20)),
-	PINCTRL_CONF_DESC(23, REG_GPIO_L_PD, BIT(21)),
-	PINCTRL_CONF_DESC(24, REG_GPIO_L_PD, BIT(22)),
-	PINCTRL_CONF_DESC(25, REG_GPIO_L_PD, BIT(23)),
-	PINCTRL_CONF_DESC(26, REG_GPIO_L_PD, BIT(24)),
-	PINCTRL_CONF_DESC(27, REG_GPIO_L_PD, BIT(25)),
-	PINCTRL_CONF_DESC(28, REG_GPIO_L_PD, BIT(26)),
-	PINCTRL_CONF_DESC(29, REG_GPIO_L_PD, BIT(27)),
-	PINCTRL_CONF_DESC(30, REG_GPIO_L_PD, BIT(28)),
-	PINCTRL_CONF_DESC(31, REG_GPIO_L_PD, BIT(29)),
-	PINCTRL_CONF_DESC(32, REG_GPIO_L_PD, BIT(30)),
-	PINCTRL_CONF_DESC(33, REG_GPIO_L_PD, BIT(31)),
-	PINCTRL_CONF_DESC(34, REG_GPIO_H_PD, BIT(0)),
-	PINCTRL_CONF_DESC(35, REG_GPIO_H_PD, BIT(1)),
-	PINCTRL_CONF_DESC(36, REG_GPIO_H_PD, BIT(2)),
-	PINCTRL_CONF_DESC(37, REG_GPIO_H_PD, BIT(3)),
-	PINCTRL_CONF_DESC(38, REG_GPIO_H_PD, BIT(4)),
-	PINCTRL_CONF_DESC(39, REG_GPIO_H_PD, BIT(5)),
-	PINCTRL_CONF_DESC(40, REG_GPIO_H_PD, BIT(6)),
-	PINCTRL_CONF_DESC(41, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
-	PINCTRL_CONF_DESC(42, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
-	PINCTRL_CONF_DESC(43, REG_I2C_SDA_PD, AN7583_I2C1_SCL_PD_MASK),
-	PINCTRL_CONF_DESC(44, REG_I2C_SDA_PD, AN7583_I2C1_SDA_PD_MASK),
-	PINCTRL_CONF_DESC(45, REG_I2C_SDA_PD, SPI_CLK_PD_MASK),
-	PINCTRL_CONF_DESC(46, REG_I2C_SDA_PD, SPI_CS0_PD_MASK),
-	PINCTRL_CONF_DESC(47, REG_I2C_SDA_PD, SPI_MOSI_PD_MASK),
-	PINCTRL_CONF_DESC(48, REG_I2C_SDA_PD, SPI_MISO_PD_MASK),
-	PINCTRL_CONF_DESC(49, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
-	PINCTRL_CONF_DESC(50, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
-	PINCTRL_CONF_DESC(51, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
-	PINCTRL_CONF_DESC(52, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
-	PINCTRL_CONF_DESC(53, REG_I2C_SDA_PD, AN7583_MDC_0_PD_MASK),
-	PINCTRL_CONF_DESC(54, REG_I2C_SDA_PD, AN7583_MDIO_0_PD_MASK),
-};
-
-static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
-	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
-	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
-	PINCTRL_CONF_DESC(4, REG_I2C_SDA_E2, SPI_CS0_E2_MASK),
-	PINCTRL_CONF_DESC(5, REG_I2C_SDA_E2, SPI_CLK_E2_MASK),
-	PINCTRL_CONF_DESC(6, REG_I2C_SDA_E2, SPI_MOSI_E2_MASK),
-	PINCTRL_CONF_DESC(7, REG_I2C_SDA_E2, SPI_MISO_E2_MASK),
-	PINCTRL_CONF_DESC(13, REG_GPIO_L_E2, BIT(0)),
-	PINCTRL_CONF_DESC(14, REG_GPIO_L_E2, BIT(1)),
-	PINCTRL_CONF_DESC(15, REG_GPIO_L_E2, BIT(2)),
-	PINCTRL_CONF_DESC(16, REG_GPIO_L_E2, BIT(3)),
-	PINCTRL_CONF_DESC(17, REG_GPIO_L_E2, BIT(4)),
-	PINCTRL_CONF_DESC(18, REG_GPIO_L_E2, BIT(5)),
-	PINCTRL_CONF_DESC(19, REG_GPIO_L_E2, BIT(6)),
-	PINCTRL_CONF_DESC(20, REG_GPIO_L_E2, BIT(7)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(8)),
-	PINCTRL_CONF_DESC(22, REG_GPIO_L_E2, BIT(9)),
-	PINCTRL_CONF_DESC(23, REG_GPIO_L_E2, BIT(10)),
-	PINCTRL_CONF_DESC(24, REG_GPIO_L_E2, BIT(11)),
-	PINCTRL_CONF_DESC(25, REG_GPIO_L_E2, BIT(12)),
-	PINCTRL_CONF_DESC(26, REG_GPIO_L_E2, BIT(13)),
-	PINCTRL_CONF_DESC(27, REG_GPIO_L_E2, BIT(14)),
-	PINCTRL_CONF_DESC(28, REG_GPIO_L_E2, BIT(15)),
-	PINCTRL_CONF_DESC(29, REG_GPIO_L_E2, BIT(16)),
-	PINCTRL_CONF_DESC(30, REG_GPIO_L_E2, BIT(17)),
-	PINCTRL_CONF_DESC(31, REG_GPIO_L_E2, BIT(18)),
-	PINCTRL_CONF_DESC(32, REG_GPIO_L_E2, BIT(19)),
-	PINCTRL_CONF_DESC(33, REG_GPIO_L_E2, BIT(20)),
-	PINCTRL_CONF_DESC(34, REG_GPIO_L_E2, BIT(21)),
-	PINCTRL_CONF_DESC(35, REG_GPIO_L_E2, BIT(22)),
-	PINCTRL_CONF_DESC(36, REG_GPIO_L_E2, BIT(23)),
-	PINCTRL_CONF_DESC(37, REG_GPIO_L_E2, BIT(24)),
-	PINCTRL_CONF_DESC(38, REG_GPIO_L_E2, BIT(25)),
-	PINCTRL_CONF_DESC(39, REG_GPIO_L_E2, BIT(26)),
-	PINCTRL_CONF_DESC(40, REG_GPIO_L_E2, BIT(27)),
-	PINCTRL_CONF_DESC(41, REG_GPIO_L_E2, BIT(28)),
-	PINCTRL_CONF_DESC(42, REG_GPIO_L_E2, BIT(29)),
-	PINCTRL_CONF_DESC(43, REG_GPIO_L_E2, BIT(30)),
-	PINCTRL_CONF_DESC(44, REG_GPIO_L_E2, BIT(31)),
-	PINCTRL_CONF_DESC(45, REG_GPIO_H_E2, BIT(0)),
-	PINCTRL_CONF_DESC(46, REG_GPIO_H_E2, BIT(1)),
-	PINCTRL_CONF_DESC(47, REG_GPIO_H_E2, BIT(2)),
-	PINCTRL_CONF_DESC(48, REG_GPIO_H_E2, BIT(3)),
-	PINCTRL_CONF_DESC(49, REG_GPIO_H_E2, BIT(4)),
-	PINCTRL_CONF_DESC(50, REG_GPIO_H_E2, BIT(5)),
-	PINCTRL_CONF_DESC(51, REG_GPIO_H_E2, BIT(6)),
-	PINCTRL_CONF_DESC(52, REG_GPIO_H_E2, BIT(7)),
-	PINCTRL_CONF_DESC(53, REG_GPIO_H_E2, BIT(8)),
-	PINCTRL_CONF_DESC(54, REG_GPIO_H_E2, BIT(9)),
-	PINCTRL_CONF_DESC(55, REG_GPIO_H_E2, BIT(10)),
-	PINCTRL_CONF_DESC(56, REG_GPIO_H_E2, BIT(11)),
-	PINCTRL_CONF_DESC(57, REG_GPIO_H_E2, BIT(12)),
-	PINCTRL_CONF_DESC(58, REG_GPIO_H_E2, BIT(13)),
-	PINCTRL_CONF_DESC(59, REG_GPIO_H_E2, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
-};
-
-static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
-	PINCTRL_CONF_DESC(2, REG_GPIO_L_E2, BIT(0)),
-	PINCTRL_CONF_DESC(3, REG_GPIO_L_E2, BIT(1)),
-	PINCTRL_CONF_DESC(4, REG_GPIO_L_E2, BIT(2)),
-	PINCTRL_CONF_DESC(5, REG_GPIO_L_E2, BIT(3)),
-	PINCTRL_CONF_DESC(6, REG_GPIO_L_E2, BIT(4)),
-	PINCTRL_CONF_DESC(7, REG_GPIO_L_E2, BIT(5)),
-	PINCTRL_CONF_DESC(8, REG_GPIO_L_E2, BIT(6)),
-	PINCTRL_CONF_DESC(9, REG_GPIO_L_E2, BIT(7)),
-	PINCTRL_CONF_DESC(10, REG_GPIO_L_E2, BIT(8)),
-	PINCTRL_CONF_DESC(11, REG_GPIO_L_E2, BIT(9)),
-	PINCTRL_CONF_DESC(12, REG_GPIO_L_E2, BIT(10)),
-	PINCTRL_CONF_DESC(13, REG_GPIO_L_E2, BIT(11)),
-	PINCTRL_CONF_DESC(14, REG_GPIO_L_E2, BIT(12)),
-	PINCTRL_CONF_DESC(15, REG_GPIO_L_E2, BIT(13)),
-	PINCTRL_CONF_DESC(16, REG_GPIO_L_E2, BIT(14)),
-	PINCTRL_CONF_DESC(17, REG_GPIO_L_E2, BIT(15)),
-	PINCTRL_CONF_DESC(18, REG_GPIO_L_E2, BIT(16)),
-	PINCTRL_CONF_DESC(19, REG_GPIO_L_E2, BIT(17)),
-	PINCTRL_CONF_DESC(20, REG_GPIO_L_E2, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(19)),
-	PINCTRL_CONF_DESC(22, REG_GPIO_L_E2, BIT(20)),
-	PINCTRL_CONF_DESC(23, REG_GPIO_L_E2, BIT(21)),
-	PINCTRL_CONF_DESC(24, REG_GPIO_L_E2, BIT(22)),
-	PINCTRL_CONF_DESC(25, REG_GPIO_L_E2, BIT(23)),
-	PINCTRL_CONF_DESC(26, REG_GPIO_L_E2, BIT(24)),
-	PINCTRL_CONF_DESC(27, REG_GPIO_L_E2, BIT(25)),
-	PINCTRL_CONF_DESC(28, REG_GPIO_L_E2, BIT(26)),
-	PINCTRL_CONF_DESC(29, REG_GPIO_L_E2, BIT(27)),
-	PINCTRL_CONF_DESC(30, REG_GPIO_L_E2, BIT(28)),
-	PINCTRL_CONF_DESC(31, REG_GPIO_L_E2, BIT(29)),
-	PINCTRL_CONF_DESC(32, REG_GPIO_L_E2, BIT(30)),
-	PINCTRL_CONF_DESC(33, REG_GPIO_L_E2, BIT(31)),
-	PINCTRL_CONF_DESC(34, REG_GPIO_H_E2, BIT(0)),
-	PINCTRL_CONF_DESC(35, REG_GPIO_H_E2, BIT(1)),
-	PINCTRL_CONF_DESC(36, REG_GPIO_H_E2, BIT(2)),
-	PINCTRL_CONF_DESC(37, REG_GPIO_H_E2, BIT(3)),
-	PINCTRL_CONF_DESC(38, REG_GPIO_H_E2, BIT(4)),
-	PINCTRL_CONF_DESC(39, REG_GPIO_H_E2, BIT(5)),
-	PINCTRL_CONF_DESC(40, REG_GPIO_H_E2, BIT(6)),
-	PINCTRL_CONF_DESC(41, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
-	PINCTRL_CONF_DESC(42, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
-	PINCTRL_CONF_DESC(43, REG_I2C_SDA_E2, AN7583_I2C1_SCL_E2_MASK),
-	PINCTRL_CONF_DESC(44, REG_I2C_SDA_E2, AN7583_I2C1_SDA_E2_MASK),
-	PINCTRL_CONF_DESC(45, REG_I2C_SDA_E2, SPI_CLK_E2_MASK),
-	PINCTRL_CONF_DESC(46, REG_I2C_SDA_E2, SPI_CS0_E2_MASK),
-	PINCTRL_CONF_DESC(47, REG_I2C_SDA_E2, SPI_MOSI_E2_MASK),
-	PINCTRL_CONF_DESC(48, REG_I2C_SDA_E2, SPI_MISO_E2_MASK),
-	PINCTRL_CONF_DESC(49, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
-	PINCTRL_CONF_DESC(50, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
-	PINCTRL_CONF_DESC(51, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
-	PINCTRL_CONF_DESC(52, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
-	PINCTRL_CONF_DESC(53, REG_I2C_SDA_E2, AN7583_MDC_0_E2_MASK),
-	PINCTRL_CONF_DESC(54, REG_I2C_SDA_E2, AN7583_MDIO_0_E2_MASK),
-};
-
-static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
-	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
-	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
-	PINCTRL_CONF_DESC(4, REG_I2C_SDA_E4, SPI_CS0_E4_MASK),
-	PINCTRL_CONF_DESC(5, REG_I2C_SDA_E4, SPI_CLK_E4_MASK),
-	PINCTRL_CONF_DESC(6, REG_I2C_SDA_E4, SPI_MOSI_E4_MASK),
-	PINCTRL_CONF_DESC(7, REG_I2C_SDA_E4, SPI_MISO_E4_MASK),
-	PINCTRL_CONF_DESC(13, REG_GPIO_L_E4, BIT(0)),
-	PINCTRL_CONF_DESC(14, REG_GPIO_L_E4, BIT(1)),
-	PINCTRL_CONF_DESC(15, REG_GPIO_L_E4, BIT(2)),
-	PINCTRL_CONF_DESC(16, REG_GPIO_L_E4, BIT(3)),
-	PINCTRL_CONF_DESC(17, REG_GPIO_L_E4, BIT(4)),
-	PINCTRL_CONF_DESC(18, REG_GPIO_L_E4, BIT(5)),
-	PINCTRL_CONF_DESC(19, REG_GPIO_L_E4, BIT(6)),
-	PINCTRL_CONF_DESC(20, REG_GPIO_L_E4, BIT(7)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(8)),
-	PINCTRL_CONF_DESC(22, REG_GPIO_L_E4, BIT(9)),
-	PINCTRL_CONF_DESC(23, REG_GPIO_L_E4, BIT(10)),
-	PINCTRL_CONF_DESC(24, REG_GPIO_L_E4, BIT(11)),
-	PINCTRL_CONF_DESC(25, REG_GPIO_L_E4, BIT(12)),
-	PINCTRL_CONF_DESC(26, REG_GPIO_L_E4, BIT(13)),
-	PINCTRL_CONF_DESC(27, REG_GPIO_L_E4, BIT(14)),
-	PINCTRL_CONF_DESC(28, REG_GPIO_L_E4, BIT(15)),
-	PINCTRL_CONF_DESC(29, REG_GPIO_L_E4, BIT(16)),
-	PINCTRL_CONF_DESC(30, REG_GPIO_L_E4, BIT(17)),
-	PINCTRL_CONF_DESC(31, REG_GPIO_L_E4, BIT(18)),
-	PINCTRL_CONF_DESC(32, REG_GPIO_L_E4, BIT(19)),
-	PINCTRL_CONF_DESC(33, REG_GPIO_L_E4, BIT(20)),
-	PINCTRL_CONF_DESC(34, REG_GPIO_L_E4, BIT(21)),
-	PINCTRL_CONF_DESC(35, REG_GPIO_L_E4, BIT(22)),
-	PINCTRL_CONF_DESC(36, REG_GPIO_L_E4, BIT(23)),
-	PINCTRL_CONF_DESC(37, REG_GPIO_L_E4, BIT(24)),
-	PINCTRL_CONF_DESC(38, REG_GPIO_L_E4, BIT(25)),
-	PINCTRL_CONF_DESC(39, REG_GPIO_L_E4, BIT(26)),
-	PINCTRL_CONF_DESC(40, REG_GPIO_L_E4, BIT(27)),
-	PINCTRL_CONF_DESC(41, REG_GPIO_L_E4, BIT(28)),
-	PINCTRL_CONF_DESC(42, REG_GPIO_L_E4, BIT(29)),
-	PINCTRL_CONF_DESC(43, REG_GPIO_L_E4, BIT(30)),
-	PINCTRL_CONF_DESC(44, REG_GPIO_L_E4, BIT(31)),
-	PINCTRL_CONF_DESC(45, REG_GPIO_H_E4, BIT(0)),
-	PINCTRL_CONF_DESC(46, REG_GPIO_H_E4, BIT(1)),
-	PINCTRL_CONF_DESC(47, REG_GPIO_H_E4, BIT(2)),
-	PINCTRL_CONF_DESC(48, REG_GPIO_H_E4, BIT(3)),
-	PINCTRL_CONF_DESC(49, REG_GPIO_H_E4, BIT(4)),
-	PINCTRL_CONF_DESC(50, REG_GPIO_H_E4, BIT(5)),
-	PINCTRL_CONF_DESC(51, REG_GPIO_H_E4, BIT(6)),
-	PINCTRL_CONF_DESC(52, REG_GPIO_H_E4, BIT(7)),
-	PINCTRL_CONF_DESC(53, REG_GPIO_H_E4, BIT(8)),
-	PINCTRL_CONF_DESC(54, REG_GPIO_H_E4, BIT(9)),
-	PINCTRL_CONF_DESC(55, REG_GPIO_H_E4, BIT(10)),
-	PINCTRL_CONF_DESC(56, REG_GPIO_H_E4, BIT(11)),
-	PINCTRL_CONF_DESC(57, REG_GPIO_H_E4, BIT(12)),
-	PINCTRL_CONF_DESC(58, REG_GPIO_H_E4, BIT(13)),
-	PINCTRL_CONF_DESC(59, REG_GPIO_H_E4, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
-};
-
-static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
-	PINCTRL_CONF_DESC(2, REG_GPIO_L_E4, BIT(0)),
-	PINCTRL_CONF_DESC(3, REG_GPIO_L_E4, BIT(1)),
-	PINCTRL_CONF_DESC(4, REG_GPIO_L_E4, BIT(2)),
-	PINCTRL_CONF_DESC(5, REG_GPIO_L_E4, BIT(3)),
-	PINCTRL_CONF_DESC(6, REG_GPIO_L_E4, BIT(4)),
-	PINCTRL_CONF_DESC(7, REG_GPIO_L_E4, BIT(5)),
-	PINCTRL_CONF_DESC(8, REG_GPIO_L_E4, BIT(6)),
-	PINCTRL_CONF_DESC(9, REG_GPIO_L_E4, BIT(7)),
-	PINCTRL_CONF_DESC(10, REG_GPIO_L_E4, BIT(8)),
-	PINCTRL_CONF_DESC(11, REG_GPIO_L_E4, BIT(9)),
-	PINCTRL_CONF_DESC(12, REG_GPIO_L_E4, BIT(10)),
-	PINCTRL_CONF_DESC(13, REG_GPIO_L_E4, BIT(11)),
-	PINCTRL_CONF_DESC(14, REG_GPIO_L_E4, BIT(12)),
-	PINCTRL_CONF_DESC(15, REG_GPIO_L_E4, BIT(13)),
-	PINCTRL_CONF_DESC(16, REG_GPIO_L_E4, BIT(14)),
-	PINCTRL_CONF_DESC(17, REG_GPIO_L_E4, BIT(15)),
-	PINCTRL_CONF_DESC(18, REG_GPIO_L_E4, BIT(16)),
-	PINCTRL_CONF_DESC(19, REG_GPIO_L_E4, BIT(17)),
-	PINCTRL_CONF_DESC(20, REG_GPIO_L_E4, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(19)),
-	PINCTRL_CONF_DESC(22, REG_GPIO_L_E4, BIT(20)),
-	PINCTRL_CONF_DESC(23, REG_GPIO_L_E4, BIT(21)),
-	PINCTRL_CONF_DESC(24, REG_GPIO_L_E4, BIT(22)),
-	PINCTRL_CONF_DESC(25, REG_GPIO_L_E4, BIT(23)),
-	PINCTRL_CONF_DESC(26, REG_GPIO_L_E4, BIT(24)),
-	PINCTRL_CONF_DESC(27, REG_GPIO_L_E4, BIT(25)),
-	PINCTRL_CONF_DESC(28, REG_GPIO_L_E4, BIT(26)),
-	PINCTRL_CONF_DESC(29, REG_GPIO_L_E4, BIT(27)),
-	PINCTRL_CONF_DESC(30, REG_GPIO_L_E4, BIT(28)),
-	PINCTRL_CONF_DESC(31, REG_GPIO_L_E4, BIT(29)),
-	PINCTRL_CONF_DESC(32, REG_GPIO_L_E4, BIT(30)),
-	PINCTRL_CONF_DESC(33, REG_GPIO_L_E4, BIT(31)),
-	PINCTRL_CONF_DESC(34, REG_GPIO_H_E4, BIT(0)),
-	PINCTRL_CONF_DESC(35, REG_GPIO_H_E4, BIT(1)),
-	PINCTRL_CONF_DESC(36, REG_GPIO_H_E4, BIT(2)),
-	PINCTRL_CONF_DESC(37, REG_GPIO_H_E4, BIT(3)),
-	PINCTRL_CONF_DESC(38, REG_GPIO_H_E4, BIT(4)),
-	PINCTRL_CONF_DESC(39, REG_GPIO_H_E4, BIT(5)),
-	PINCTRL_CONF_DESC(40, REG_GPIO_H_E4, BIT(6)),
-	PINCTRL_CONF_DESC(41, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
-	PINCTRL_CONF_DESC(42, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
-	PINCTRL_CONF_DESC(43, REG_I2C_SDA_E4, AN7583_I2C1_SCL_E4_MASK),
-	PINCTRL_CONF_DESC(44, REG_I2C_SDA_E4, AN7583_I2C1_SDA_E4_MASK),
-	PINCTRL_CONF_DESC(45, REG_I2C_SDA_E4, SPI_CLK_E4_MASK),
-	PINCTRL_CONF_DESC(46, REG_I2C_SDA_E4, SPI_CS0_E4_MASK),
-	PINCTRL_CONF_DESC(47, REG_I2C_SDA_E4, SPI_MOSI_E4_MASK),
-	PINCTRL_CONF_DESC(48, REG_I2C_SDA_E4, SPI_MISO_E4_MASK),
-	PINCTRL_CONF_DESC(49, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
-	PINCTRL_CONF_DESC(50, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
-	PINCTRL_CONF_DESC(51, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
-	PINCTRL_CONF_DESC(52, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
-	PINCTRL_CONF_DESC(53, REG_I2C_SDA_E4, AN7583_MDC_0_E4_MASK),
-	PINCTRL_CONF_DESC(54, REG_I2C_SDA_E4, AN7583_MDIO_0_E4_MASK),
-};
-
-static const struct airoha_pinctrl_conf en7581_pinctrl_pcie_rst_od_conf[] = {
-	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
-	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
-	PINCTRL_CONF_DESC(63, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
-};
-
-static const struct airoha_pinctrl_conf an7583_pinctrl_pcie_rst_od_conf[] = {
-	PINCTRL_CONF_DESC(51, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
-	PINCTRL_CONF_DESC(52, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
-};
-
 static int airoha_convert_pin_to_reg_offset(struct pinctrl_dev *pctrl_dev,
 					    struct pinctrl_gpio_range *range,
 					    int pin)
@@ -2910,7 +633,7 @@ static const struct pinctrl_ops airoha_pctlops = {
 	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
-static int airoha_pinctrl_probe(struct platform_device *pdev)
+int airoha_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct airoha_pinctrl_match_data *data;
 	struct device *dev = &pdev->dev;
@@ -2988,87 +711,10 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 	/* build gpio-chip */
 	return airoha_pinctrl_add_gpiochip(pinctrl, pdev);
 }
-
-static const struct airoha_pinctrl_match_data en7581_pinctrl_match_data = {
-	.pins = en7581_pinctrl_pins,
-	.num_pins = ARRAY_SIZE(en7581_pinctrl_pins),
-	.grps = en7581_pinctrl_groups,
-	.num_grps = ARRAY_SIZE(en7581_pinctrl_groups),
-	.funcs = en7581_pinctrl_funcs,
-	.num_funcs = ARRAY_SIZE(en7581_pinctrl_funcs),
-	.confs_info = {
-		[AIROHA_PINCTRL_CONFS_PULLUP] = {
-			.confs = en7581_pinctrl_pullup_conf,
-			.num_confs = ARRAY_SIZE(en7581_pinctrl_pullup_conf),
-		},
-		[AIROHA_PINCTRL_CONFS_PULLDOWN] = {
-			.confs = en7581_pinctrl_pulldown_conf,
-			.num_confs = ARRAY_SIZE(en7581_pinctrl_pulldown_conf),
-		},
-		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
-			.confs = en7581_pinctrl_drive_e2_conf,
-			.num_confs = ARRAY_SIZE(en7581_pinctrl_drive_e2_conf),
-		},
-		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
-			.confs = en7581_pinctrl_drive_e4_conf,
-			.num_confs = ARRAY_SIZE(en7581_pinctrl_drive_e4_conf),
-		},
-		[AIROHA_PINCTRL_CONFS_PCIE_RST_OD] = {
-			.confs = en7581_pinctrl_pcie_rst_od_conf,
-			.num_confs = ARRAY_SIZE(en7581_pinctrl_pcie_rst_od_conf),
-		},
-	},
-};
-
-static const struct airoha_pinctrl_match_data an7583_pinctrl_match_data = {
-	.pins = an7583_pinctrl_pins,
-	.num_pins = ARRAY_SIZE(an7583_pinctrl_pins),
-	.grps = an7583_pinctrl_groups,
-	.num_grps = ARRAY_SIZE(an7583_pinctrl_groups),
-	.funcs = an7583_pinctrl_funcs,
-	.num_funcs = ARRAY_SIZE(an7583_pinctrl_funcs),
-	.confs_info = {
-		[AIROHA_PINCTRL_CONFS_PULLUP] = {
-			.confs = an7583_pinctrl_pullup_conf,
-			.num_confs = ARRAY_SIZE(an7583_pinctrl_pullup_conf),
-		},
-		[AIROHA_PINCTRL_CONFS_PULLDOWN] = {
-			.confs = an7583_pinctrl_pulldown_conf,
-			.num_confs = ARRAY_SIZE(an7583_pinctrl_pulldown_conf),
-		},
-		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
-			.confs = an7583_pinctrl_drive_e2_conf,
-			.num_confs = ARRAY_SIZE(an7583_pinctrl_drive_e2_conf),
-		},
-		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
-			.confs = an7583_pinctrl_drive_e4_conf,
-			.num_confs = ARRAY_SIZE(an7583_pinctrl_drive_e4_conf),
-		},
-		[AIROHA_PINCTRL_CONFS_PCIE_RST_OD] = {
-			.confs = an7583_pinctrl_pcie_rst_od_conf,
-			.num_confs = ARRAY_SIZE(an7583_pinctrl_pcie_rst_od_conf),
-		},
-	},
-};
-
-static const struct of_device_id airoha_pinctrl_of_match[] = {
-	{ .compatible = "airoha,en7581-pinctrl", .data = &en7581_pinctrl_match_data },
-	{ .compatible = "airoha,an7583-pinctrl", .data = &an7583_pinctrl_match_data },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, airoha_pinctrl_of_match);
-
-static struct platform_driver airoha_pinctrl_driver = {
-	.probe = airoha_pinctrl_probe,
-	.driver = {
-		.name = "pinctrl-airoha",
-		.of_match_table = airoha_pinctrl_of_match,
-	},
-};
-module_platform_driver(airoha_pinctrl_driver);
+EXPORT_SYMBOL_GPL(airoha_pinctrl_probe);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_AUTHOR("Benjamin Larsson <benjamin.larsson@genexis.eu>");
 MODULE_AUTHOR("Markus Gothe <markus.gothe@genexis.eu>");
-MODULE_DESCRIPTION("Pinctrl driver for Airoha SoC");
+MODULE_DESCRIPTION("Pinctrl common driver for Airoha SoC");
diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
new file mode 100644
index 000000000000..355d557dbdce
--- /dev/null
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -0,0 +1,1472 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Author: Lorenzo Bianconi <lorenzo@kernel.org>
+ * Author: Benjamin Larsson <benjamin.larsson@genexis.eu>
+ * Author: Markus Gothe <markus.gothe@genexis.eu>
+ */
+
+#include "airoha-common.h"
+
+/* MUX */
+#define REG_GPIO_2ND_I2C_MODE			0x0214
+#define GPIO_MDC_IO_MASTER_MODE_MASK		BIT(14)
+#define GPIO_I2C_MASTER_MODE_MODE		BIT(13)
+#define GPIO_I2S_MODE_MASK			BIT(12)
+#define GPIO_I2C_SLAVE_MODE_MODE		BIT(11)
+#define GPIO_LAN3_LED1_MODE_MASK		BIT(10)
+#define GPIO_LAN3_LED0_MODE_MASK		BIT(9)
+#define GPIO_LAN2_LED1_MODE_MASK		BIT(8)
+#define GPIO_LAN2_LED0_MODE_MASK		BIT(7)
+#define GPIO_LAN1_LED1_MODE_MASK		BIT(6)
+#define GPIO_LAN1_LED0_MODE_MASK		BIT(5)
+#define GPIO_LAN0_LED1_MODE_MASK		BIT(4)
+#define GPIO_LAN0_LED0_MODE_MASK		BIT(3)
+#define PON_TOD_1PPS_MODE_MASK			BIT(2)
+#define GSW_TOD_1PPS_MODE_MASK			BIT(1)
+#define GPIO_2ND_I2C_MODE_MASK			BIT(0)
+
+#define REG_GPIO_SPI_CS1_MODE			0x0218
+#define GPIO_PCM_SPI_CS4_MODE_MASK		BIT(21)
+#define GPIO_PCM_SPI_CS3_MODE_MASK		BIT(20)
+#define GPIO_PCM_SPI_CS2_MODE_P156_MASK		BIT(19)
+#define GPIO_PCM_SPI_CS2_MODE_P128_MASK		BIT(18)
+#define GPIO_PCM_SPI_CS1_MODE_MASK		BIT(17)
+#define GPIO_PCM_SPI_MODE_MASK			BIT(16)
+#define GPIO_PCM2_MODE_MASK			BIT(13)
+#define GPIO_PCM1_MODE_MASK			BIT(12)
+#define GPIO_PCM_INT_MODE_MASK			BIT(9)
+#define GPIO_PCM_RESET_MODE_MASK		BIT(8)
+#define GPIO_SPI_QUAD_MODE_MASK			BIT(4)
+#define GPIO_SPI_CS4_MODE_MASK			BIT(3)
+#define GPIO_SPI_CS3_MODE_MASK			BIT(2)
+#define GPIO_SPI_CS2_MODE_MASK			BIT(1)
+#define GPIO_SPI_CS1_MODE_MASK			BIT(0)
+
+#define REG_GPIO_PON_MODE			0x021c
+#define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
+#define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
+#define GPIO_PCIE_RESET2_MASK			BIT(12)
+#define SIPO_RCLK_MODE_MASK			BIT(11)
+#define GPIO_PCIE_RESET1_MASK			BIT(10)
+#define GPIO_PCIE_RESET0_MASK			BIT(9)
+#define GPIO_UART5_MODE_MASK			BIT(8)
+#define GPIO_UART4_MODE_MASK			BIT(7)
+#define GPIO_HSUART_CTS_RTS_MODE_MASK		BIT(6)
+#define GPIO_HSUART_MODE_MASK			BIT(5)
+#define GPIO_UART2_CTS_RTS_MODE_MASK		BIT(4)
+#define GPIO_UART2_MODE_MASK			BIT(3)
+#define GPIO_SIPO_MODE_MASK			BIT(2)
+#define GPIO_EMMC_MODE_MASK			BIT(1)
+#define GPIO_PON_MODE_MASK			BIT(0)
+
+#define REG_NPU_UART_EN				0x0224
+#define JTAG_UDI_EN_MASK			BIT(4)
+#define JTAG_DFD_EN_MASK			BIT(3)
+
+#define REG_FORCE_GPIO_EN			0x0228
+#define FORCE_GPIO_EN(n)			BIT(n)
+
+/* LED MAP */
+#define REG_LAN_LED0_MAPPING			0x027c
+#define REG_LAN_LED1_MAPPING			0x0280
+
+#define LAN4_LED_MAPPING_MASK			GENMASK(18, 16)
+#define LAN4_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, (_n))
+
+#define LAN3_LED_MAPPING_MASK			GENMASK(14, 12)
+#define LAN3_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, (_n))
+
+#define LAN2_LED_MAPPING_MASK			GENMASK(10, 8)
+#define LAN2_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, (_n))
+
+#define LAN1_LED_MAPPING_MASK			GENMASK(6, 4)
+#define LAN1_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, (_n))
+
+#define LAN0_LED_MAPPING_MASK			GENMASK(2, 0)
+#define LAN0_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, (_n))
+
+/* CONF */
+#define REG_I2C_SDA_E2				0x001c
+#define SPI_MISO_E2_MASK			BIT(14)
+#define SPI_MOSI_E2_MASK			BIT(13)
+#define SPI_CLK_E2_MASK				BIT(12)
+#define SPI_CS0_E2_MASK				BIT(11)
+#define PCIE2_RESET_E2_MASK			BIT(10)
+#define PCIE1_RESET_E2_MASK			BIT(9)
+#define PCIE0_RESET_E2_MASK			BIT(8)
+#define UART1_RXD_E2_MASK			BIT(3)
+#define UART1_TXD_E2_MASK			BIT(2)
+#define I2C_SCL_E2_MASK				BIT(1)
+#define I2C_SDA_E2_MASK				BIT(0)
+
+#define REG_I2C_SDA_E4				0x0020
+#define SPI_MISO_E4_MASK			BIT(14)
+#define SPI_MOSI_E4_MASK			BIT(13)
+#define SPI_CLK_E4_MASK				BIT(12)
+#define SPI_CS0_E4_MASK				BIT(11)
+#define PCIE2_RESET_E4_MASK			BIT(10)
+#define PCIE1_RESET_E4_MASK			BIT(9)
+#define PCIE0_RESET_E4_MASK			BIT(8)
+#define UART1_RXD_E4_MASK			BIT(3)
+#define UART1_TXD_E4_MASK			BIT(2)
+#define I2C_SCL_E4_MASK				BIT(1)
+#define I2C_SDA_E4_MASK				BIT(0)
+
+#define REG_GPIO_L_E2				0x0024
+#define REG_GPIO_L_E4				0x0028
+#define REG_GPIO_H_E2				0x002c
+#define REG_GPIO_H_E4				0x0030
+
+#define REG_I2C_SDA_PU				0x0044
+#define SPI_MISO_PU_MASK			BIT(14)
+#define SPI_MOSI_PU_MASK			BIT(13)
+#define SPI_CLK_PU_MASK				BIT(12)
+#define SPI_CS0_PU_MASK				BIT(11)
+#define PCIE2_RESET_PU_MASK			BIT(10)
+#define PCIE1_RESET_PU_MASK			BIT(9)
+#define PCIE0_RESET_PU_MASK			BIT(8)
+#define UART1_RXD_PU_MASK			BIT(3)
+#define UART1_TXD_PU_MASK			BIT(2)
+#define I2C_SCL_PU_MASK				BIT(1)
+#define I2C_SDA_PU_MASK				BIT(0)
+
+#define REG_I2C_SDA_PD				0x0048
+#define SPI_MISO_PD_MASK			BIT(14)
+#define SPI_MOSI_PD_MASK			BIT(13)
+#define SPI_CLK_PD_MASK				BIT(12)
+#define SPI_CS0_PD_MASK				BIT(11)
+#define PCIE2_RESET_PD_MASK			BIT(10)
+#define PCIE1_RESET_PD_MASK			BIT(9)
+#define PCIE0_RESET_PD_MASK			BIT(8)
+#define UART1_RXD_PD_MASK			BIT(3)
+#define UART1_TXD_PD_MASK			BIT(2)
+#define I2C_SCL_PD_MASK				BIT(1)
+#define I2C_SDA_PD_MASK				BIT(0)
+
+#define REG_GPIO_L_PU				0x004c
+#define REG_GPIO_L_PD				0x0050
+#define REG_GPIO_H_PU				0x0054
+#define REG_GPIO_H_PD				0x0058
+
+#define REG_PCIE_RESET_OD			0x018c
+#define PCIE2_RESET_OD_MASK			BIT(2)
+#define PCIE1_RESET_OD_MASK			BIT(1)
+#define PCIE0_RESET_OD_MASK			BIT(0)
+
+/* PWM MODE CONF */
+#define REG_GPIO_FLASH_MODE_CFG			0x0034
+#define GPIO15_FLASH_MODE_CFG			BIT(15)
+#define GPIO14_FLASH_MODE_CFG			BIT(14)
+#define GPIO13_FLASH_MODE_CFG			BIT(13)
+#define GPIO12_FLASH_MODE_CFG			BIT(12)
+#define GPIO11_FLASH_MODE_CFG			BIT(11)
+#define GPIO10_FLASH_MODE_CFG			BIT(10)
+#define GPIO9_FLASH_MODE_CFG			BIT(9)
+#define GPIO8_FLASH_MODE_CFG			BIT(8)
+#define GPIO7_FLASH_MODE_CFG			BIT(7)
+#define GPIO6_FLASH_MODE_CFG			BIT(6)
+#define GPIO5_FLASH_MODE_CFG			BIT(5)
+#define GPIO4_FLASH_MODE_CFG			BIT(4)
+#define GPIO3_FLASH_MODE_CFG			BIT(3)
+#define GPIO2_FLASH_MODE_CFG			BIT(2)
+#define GPIO1_FLASH_MODE_CFG			BIT(1)
+#define GPIO0_FLASH_MODE_CFG			BIT(0)
+
+/* PWM MODE CONF EXT */
+#define REG_GPIO_FLASH_MODE_CFG_EXT		0x0068
+#define GPIO51_FLASH_MODE_CFG			BIT(31)
+#define GPIO50_FLASH_MODE_CFG			BIT(30)
+#define GPIO49_FLASH_MODE_CFG			BIT(29)
+#define GPIO48_FLASH_MODE_CFG			BIT(28)
+#define GPIO47_FLASH_MODE_CFG			BIT(27)
+#define GPIO46_FLASH_MODE_CFG			BIT(26)
+#define GPIO45_FLASH_MODE_CFG			BIT(25)
+#define GPIO44_FLASH_MODE_CFG			BIT(24)
+#define GPIO43_FLASH_MODE_CFG			BIT(23)
+#define GPIO42_FLASH_MODE_CFG			BIT(22)
+#define GPIO41_FLASH_MODE_CFG			BIT(21)
+#define GPIO40_FLASH_MODE_CFG			BIT(20)
+#define GPIO39_FLASH_MODE_CFG			BIT(19)
+#define GPIO38_FLASH_MODE_CFG			BIT(18)
+#define GPIO37_FLASH_MODE_CFG			BIT(17)
+#define GPIO36_FLASH_MODE_CFG			BIT(16)
+#define GPIO31_FLASH_MODE_CFG			BIT(15)
+#define GPIO30_FLASH_MODE_CFG			BIT(14)
+#define GPIO29_FLASH_MODE_CFG			BIT(13)
+#define GPIO28_FLASH_MODE_CFG			BIT(12)
+#define GPIO27_FLASH_MODE_CFG			BIT(11)
+#define GPIO26_FLASH_MODE_CFG			BIT(10)
+#define GPIO25_FLASH_MODE_CFG			BIT(9)
+#define GPIO24_FLASH_MODE_CFG			BIT(8)
+#define GPIO23_FLASH_MODE_CFG			BIT(7)
+#define GPIO22_FLASH_MODE_CFG			BIT(6)
+#define GPIO21_FLASH_MODE_CFG			BIT(5)
+#define GPIO20_FLASH_MODE_CFG			BIT(4)
+#define GPIO19_FLASH_MODE_CFG			BIT(3)
+#define GPIO18_FLASH_MODE_CFG			BIT(2)
+#define GPIO17_FLASH_MODE_CFG			BIT(1)
+#define GPIO16_FLASH_MODE_CFG			BIT(0)
+
+#define AIROHA_PINCTRL_GPIO(gpio, mux_val)			\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap_size = 1,				\
+	}
+
+#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			0					\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
+/* PWM */
+#define AIROHA_PINCTRL_PWM(gpio, mux_val)			\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_MUX,			\
+			REG_GPIO_FLASH_MODE_CFG,		\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap_size = 1,				\
+	}
+
+#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)			\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap_size = 1,				\
+	}
+
+#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
+#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
+	{								\
+		.name = (gpio),						\
+		.regmap[0] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_GPIO_2ND_I2C_MODE,				\
+			(mux_val),					\
+			(mux_val),					\
+		},							\
+		.regmap[1] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_LAN_LED0_MAPPING,				\
+			(map_mask),					\
+			(map_val),					\
+		},							\
+		.regmap_size = 2,					\
+	}
+
+#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)	\
+	{								\
+		.name = (gpio),						\
+		.regmap[0] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_GPIO_2ND_I2C_MODE,				\
+			(mux_val),					\
+			(mux_val),					\
+		},							\
+		.regmap[1] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_LAN_LED1_MAPPING,				\
+			(map_mask),					\
+			(map_val),					\
+		},							\
+		.regmap_size = 2,					\
+	}
+
+static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
+	PINCTRL_PIN(0, "uart1_txd"),
+	PINCTRL_PIN(1, "uart1_rxd"),
+	PINCTRL_PIN(2, "i2c_scl"),
+	PINCTRL_PIN(3, "i2c_sda"),
+	PINCTRL_PIN(4, "spi_cs0"),
+	PINCTRL_PIN(5, "spi_clk"),
+	PINCTRL_PIN(6, "spi_mosi"),
+	PINCTRL_PIN(7, "spi_miso"),
+	PINCTRL_PIN(13, "gpio0"),
+	PINCTRL_PIN(14, "gpio1"),
+	PINCTRL_PIN(15, "gpio2"),
+	PINCTRL_PIN(16, "gpio3"),
+	PINCTRL_PIN(17, "gpio4"),
+	PINCTRL_PIN(18, "gpio5"),
+	PINCTRL_PIN(19, "gpio6"),
+	PINCTRL_PIN(20, "gpio7"),
+	PINCTRL_PIN(21, "gpio8"),
+	PINCTRL_PIN(22, "gpio9"),
+	PINCTRL_PIN(23, "gpio10"),
+	PINCTRL_PIN(24, "gpio11"),
+	PINCTRL_PIN(25, "gpio12"),
+	PINCTRL_PIN(26, "gpio13"),
+	PINCTRL_PIN(27, "gpio14"),
+	PINCTRL_PIN(28, "gpio15"),
+	PINCTRL_PIN(29, "gpio16"),
+	PINCTRL_PIN(30, "gpio17"),
+	PINCTRL_PIN(31, "gpio18"),
+	PINCTRL_PIN(32, "gpio19"),
+	PINCTRL_PIN(33, "gpio20"),
+	PINCTRL_PIN(34, "gpio21"),
+	PINCTRL_PIN(35, "gpio22"),
+	PINCTRL_PIN(36, "gpio23"),
+	PINCTRL_PIN(37, "gpio24"),
+	PINCTRL_PIN(38, "gpio25"),
+	PINCTRL_PIN(39, "gpio26"),
+	PINCTRL_PIN(40, "gpio27"),
+	PINCTRL_PIN(41, "gpio28"),
+	PINCTRL_PIN(42, "gpio29"),
+	PINCTRL_PIN(43, "gpio30"),
+	PINCTRL_PIN(44, "gpio31"),
+	PINCTRL_PIN(45, "gpio32"),
+	PINCTRL_PIN(46, "gpio33"),
+	PINCTRL_PIN(47, "gpio34"),
+	PINCTRL_PIN(48, "gpio35"),
+	PINCTRL_PIN(49, "gpio36"),
+	PINCTRL_PIN(50, "gpio37"),
+	PINCTRL_PIN(51, "gpio38"),
+	PINCTRL_PIN(52, "gpio39"),
+	PINCTRL_PIN(53, "gpio40"),
+	PINCTRL_PIN(54, "gpio41"),
+	PINCTRL_PIN(55, "gpio42"),
+	PINCTRL_PIN(56, "gpio43"),
+	PINCTRL_PIN(57, "pcie_reset0"),
+	PINCTRL_PIN(58, "pcie_reset1"),
+	PINCTRL_PIN(59, "pcie_reset2"),
+};
+
+static const int en7581_pon_pins[] = { 49, 50, 51, 52, 53, 54 };
+static const int en7581_pon_tod_1pps_pins[] = { 46 };
+static const int en7581_gsw_tod_1pps_pins[] = { 46 };
+static const int en7581_sipo_pins[] = { 16, 17 };
+static const int en7581_sipo_rclk_pins[] = { 16, 17, 43 };
+static const int en7581_mdio_pins[] = { 14, 15 };
+static const int en7581_uart2_pins[] = { 48, 55 };
+static const int en7581_uart2_cts_rts_pins[] = { 46, 47 };
+static const int en7581_hsuart_pins[] = { 28, 29 };
+static const int en7581_hsuart_cts_rts_pins[] = { 26, 27 };
+static const int en7581_uart4_pins[] = { 38, 39 };
+static const int en7581_uart5_pins[] = { 18, 19 };
+static const int en7581_i2c0_pins[] = { 2, 3 };
+static const int en7581_i2c1_pins[] = { 14, 15 };
+static const int en7581_jtag_udi_pins[] = { 16, 17, 18, 19, 20 };
+static const int en7581_jtag_dfd_pins[] = { 16, 17, 18, 19, 20 };
+static const int en7581_i2s_pins[] = { 26, 27, 28, 29 };
+static const int en7581_pcm1_pins[] = { 22, 23, 24, 25 };
+static const int en7581_pcm2_pins[] = { 18, 19, 20, 21 };
+static const int en7581_spi_quad_pins[] = { 32, 33 };
+static const int en7581_spi_pins[] = { 4, 5, 6, 7 };
+static const int en7581_spi_cs1_pins[] = { 34 };
+static const int en7581_pcm_spi_pins[] = { 18, 19, 20, 21, 22, 23, 24, 25 };
+static const int en7581_pcm_spi_int_pins[] = { 14 };
+static const int en7581_pcm_spi_rst_pins[] = { 15 };
+static const int en7581_pcm_spi_cs1_pins[] = { 43 };
+static const int en7581_pcm_spi_cs2_pins[] = { 40 };
+static const int en7581_pcm_spi_cs2_p128_pins[] = { 40 };
+static const int en7581_pcm_spi_cs2_p156_pins[] = { 40 };
+static const int en7581_pcm_spi_cs3_pins[] = { 41 };
+static const int en7581_pcm_spi_cs4_pins[] = { 42 };
+static const int en7581_emmc_pins[] = {
+	4, 5, 6, 30, 31, 32, 33, 34, 35, 36, 37
+};
+static const int en7581_pnand_pins[] = {
+	4, 5, 6, 7, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42
+};
+static const int en7581_gpio0_pins[] = { 13 };
+static const int en7581_gpio1_pins[] = { 14 };
+static const int en7581_gpio2_pins[] = { 15 };
+static const int en7581_gpio3_pins[] = { 16 };
+static const int en7581_gpio4_pins[] = { 17 };
+static const int en7581_gpio5_pins[] = { 18 };
+static const int en7581_gpio6_pins[] = { 19 };
+static const int en7581_gpio7_pins[] = { 20 };
+static const int en7581_gpio8_pins[] = { 21 };
+static const int en7581_gpio9_pins[] = { 22 };
+static const int en7581_gpio10_pins[] = { 23 };
+static const int en7581_gpio11_pins[] = { 24 };
+static const int en7581_gpio12_pins[] = { 25 };
+static const int en7581_gpio13_pins[] = { 26 };
+static const int en7581_gpio14_pins[] = { 27 };
+static const int en7581_gpio15_pins[] = { 28 };
+static const int en7581_gpio16_pins[] = { 29 };
+static const int en7581_gpio17_pins[] = { 30 };
+static const int en7581_gpio18_pins[] = { 31 };
+static const int en7581_gpio19_pins[] = { 32 };
+static const int en7581_gpio20_pins[] = { 33 };
+static const int en7581_gpio21_pins[] = { 34 };
+static const int en7581_gpio22_pins[] = { 35 };
+static const int en7581_gpio23_pins[] = { 36 };
+static const int en7581_gpio24_pins[] = { 37 };
+static const int en7581_gpio25_pins[] = { 38 };
+static const int en7581_gpio26_pins[] = { 39 };
+static const int en7581_gpio27_pins[] = { 40 };
+static const int en7581_gpio28_pins[] = { 41 };
+static const int en7581_gpio29_pins[] = { 42 };
+static const int en7581_gpio30_pins[] = { 43 };
+static const int en7581_gpio31_pins[] = { 44 };
+static const int en7581_gpio32_pins[] = { 45 };
+static const int en7581_gpio33_pins[] = { 46 };
+static const int en7581_gpio34_pins[] = { 47 };
+static const int en7581_gpio35_pins[] = { 48 };
+static const int en7581_gpio36_pins[] = { 49 };
+static const int en7581_gpio37_pins[] = { 50 };
+static const int en7581_gpio38_pins[] = { 51 };
+static const int en7581_gpio39_pins[] = { 52 };
+static const int en7581_gpio40_pins[] = { 53 };
+static const int en7581_gpio41_pins[] = { 54 };
+static const int en7581_gpio42_pins[] = { 55 };
+static const int en7581_gpio43_pins[] = { 56 };
+static const int en7581_gpio44_pins[] = { 57 };
+static const int en7581_gpio45_pins[] = { 58 };
+static const int en7581_gpio46_pins[] = { 59 };
+static const int en7581_pcie_reset0_pins[] = { 57 };
+static const int en7581_pcie_reset1_pins[] = { 58 };
+static const int en7581_pcie_reset2_pins[] = { 59 };
+
+static const struct pingroup en7581_pinctrl_groups[] = {
+	PINCTRL_PIN_GROUP("pon", en7581_pon),
+	PINCTRL_PIN_GROUP("pon_tod_1pps", en7581_pon_tod_1pps),
+	PINCTRL_PIN_GROUP("gsw_tod_1pps", en7581_gsw_tod_1pps),
+	PINCTRL_PIN_GROUP("sipo", en7581_sipo),
+	PINCTRL_PIN_GROUP("sipo_rclk", en7581_sipo_rclk),
+	PINCTRL_PIN_GROUP("mdio", en7581_mdio),
+	PINCTRL_PIN_GROUP("uart2", en7581_uart2),
+	PINCTRL_PIN_GROUP("uart2_cts_rts", en7581_uart2_cts_rts),
+	PINCTRL_PIN_GROUP("hsuart", en7581_hsuart),
+	PINCTRL_PIN_GROUP("hsuart_cts_rts", en7581_hsuart_cts_rts),
+	PINCTRL_PIN_GROUP("uart4", en7581_uart4),
+	PINCTRL_PIN_GROUP("uart5", en7581_uart5),
+	PINCTRL_PIN_GROUP("i2c0", en7581_i2c0),
+	PINCTRL_PIN_GROUP("i2c1", en7581_i2c1),
+	PINCTRL_PIN_GROUP("jtag_udi", en7581_jtag_udi),
+	PINCTRL_PIN_GROUP("jtag_dfd", en7581_jtag_dfd),
+	PINCTRL_PIN_GROUP("i2s", en7581_i2s),
+	PINCTRL_PIN_GROUP("pcm1", en7581_pcm1),
+	PINCTRL_PIN_GROUP("pcm2", en7581_pcm2),
+	PINCTRL_PIN_GROUP("spi", en7581_spi),
+	PINCTRL_PIN_GROUP("spi_quad", en7581_spi_quad),
+	PINCTRL_PIN_GROUP("spi_cs1", en7581_spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi", en7581_pcm_spi),
+	PINCTRL_PIN_GROUP("pcm_spi_int", en7581_pcm_spi_int),
+	PINCTRL_PIN_GROUP("pcm_spi_rst", en7581_pcm_spi_rst),
+	PINCTRL_PIN_GROUP("pcm_spi_cs1", en7581_pcm_spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2_p128", en7581_pcm_spi_cs2_p128),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2_p156", en7581_pcm_spi_cs2_p156),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2", en7581_pcm_spi_cs2),
+	PINCTRL_PIN_GROUP("pcm_spi_cs3", en7581_pcm_spi_cs3),
+	PINCTRL_PIN_GROUP("pcm_spi_cs4", en7581_pcm_spi_cs4),
+	PINCTRL_PIN_GROUP("emmc", en7581_emmc),
+	PINCTRL_PIN_GROUP("pnand", en7581_pnand),
+	PINCTRL_PIN_GROUP("gpio0", en7581_gpio0),
+	PINCTRL_PIN_GROUP("gpio1", en7581_gpio1),
+	PINCTRL_PIN_GROUP("gpio2", en7581_gpio2),
+	PINCTRL_PIN_GROUP("gpio3", en7581_gpio3),
+	PINCTRL_PIN_GROUP("gpio4", en7581_gpio4),
+	PINCTRL_PIN_GROUP("gpio5", en7581_gpio5),
+	PINCTRL_PIN_GROUP("gpio6", en7581_gpio6),
+	PINCTRL_PIN_GROUP("gpio7", en7581_gpio7),
+	PINCTRL_PIN_GROUP("gpio8", en7581_gpio8),
+	PINCTRL_PIN_GROUP("gpio9", en7581_gpio9),
+	PINCTRL_PIN_GROUP("gpio10", en7581_gpio10),
+	PINCTRL_PIN_GROUP("gpio11", en7581_gpio11),
+	PINCTRL_PIN_GROUP("gpio12", en7581_gpio12),
+	PINCTRL_PIN_GROUP("gpio13", en7581_gpio13),
+	PINCTRL_PIN_GROUP("gpio14", en7581_gpio14),
+	PINCTRL_PIN_GROUP("gpio15", en7581_gpio15),
+	PINCTRL_PIN_GROUP("gpio16", en7581_gpio16),
+	PINCTRL_PIN_GROUP("gpio17", en7581_gpio17),
+	PINCTRL_PIN_GROUP("gpio18", en7581_gpio18),
+	PINCTRL_PIN_GROUP("gpio19", en7581_gpio19),
+	PINCTRL_PIN_GROUP("gpio20", en7581_gpio20),
+	PINCTRL_PIN_GROUP("gpio21", en7581_gpio21),
+	PINCTRL_PIN_GROUP("gpio22", en7581_gpio22),
+	PINCTRL_PIN_GROUP("gpio23", en7581_gpio23),
+	PINCTRL_PIN_GROUP("gpio24", en7581_gpio24),
+	PINCTRL_PIN_GROUP("gpio25", en7581_gpio25),
+	PINCTRL_PIN_GROUP("gpio26", en7581_gpio26),
+	PINCTRL_PIN_GROUP("gpio27", en7581_gpio27),
+	PINCTRL_PIN_GROUP("gpio28", en7581_gpio28),
+	PINCTRL_PIN_GROUP("gpio29", en7581_gpio29),
+	PINCTRL_PIN_GROUP("gpio30", en7581_gpio30),
+	PINCTRL_PIN_GROUP("gpio31", en7581_gpio31),
+	PINCTRL_PIN_GROUP("gpio32", en7581_gpio32),
+	PINCTRL_PIN_GROUP("gpio33", en7581_gpio33),
+	PINCTRL_PIN_GROUP("gpio34", en7581_gpio34),
+	PINCTRL_PIN_GROUP("gpio35", en7581_gpio35),
+	PINCTRL_PIN_GROUP("gpio36", en7581_gpio36),
+	PINCTRL_PIN_GROUP("gpio37", en7581_gpio37),
+	PINCTRL_PIN_GROUP("gpio38", en7581_gpio38),
+	PINCTRL_PIN_GROUP("gpio39", en7581_gpio39),
+	PINCTRL_PIN_GROUP("gpio40", en7581_gpio40),
+	PINCTRL_PIN_GROUP("gpio41", en7581_gpio41),
+	PINCTRL_PIN_GROUP("gpio42", en7581_gpio42),
+	PINCTRL_PIN_GROUP("gpio43", en7581_gpio43),
+	PINCTRL_PIN_GROUP("gpio44", en7581_gpio44),
+	PINCTRL_PIN_GROUP("gpio45", en7581_gpio45),
+	PINCTRL_PIN_GROUP("gpio46", en7581_gpio46),
+	PINCTRL_PIN_GROUP("pcie_reset0", en7581_pcie_reset0),
+	PINCTRL_PIN_GROUP("pcie_reset1", en7581_pcie_reset1),
+	PINCTRL_PIN_GROUP("pcie_reset2", en7581_pcie_reset2),
+};
+
+static const char *const pon_groups[] = { "pon" };
+static const char *const tod_1pps_groups[] = {
+	"pon_tod_1pps", "gsw_tod_1pps"
+};
+static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
+static const char *const mdio_groups[] = { "mdio" };
+static const char *const uart_groups[] = {
+	"uart2", "uart2_cts_rts", "hsuart", "hsuart_cts_rts",
+	"uart4", "uart5"
+};
+static const char *const i2c_groups[] = { "i2c1" };
+static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
+static const char *const pcm_groups[] = { "pcm1", "pcm2" };
+static const char *const spi_groups[] = { "spi_quad", "spi_cs1" };
+static const char *const pcm_spi_groups[] = {
+	"pcm_spi", "pcm_spi_int", "pcm_spi_rst", "pcm_spi_cs1",
+	"pcm_spi_cs2_p156", "pcm_spi_cs2_p128", "pcm_spi_cs3",
+	"pcm_spi_cs4"
+};
+static const char *const i2s_groups[] = { "i2s" };
+static const char *const emmc_groups[] = { "emmc" };
+static const char *const pnand_groups[] = { "pnand" };
+static const char *const gpio_groups[] = { "gpio44", "gpio45", "gpio46" };
+static const char *const pcie_reset_groups[] = {
+	"pcie_reset0", "pcie_reset1", "pcie_reset2"
+};
+static const char *const pwm_groups[] = {
+	"gpio0",  "gpio1",  "gpio2",  "gpio3",  "gpio4",  "gpio5",
+	"gpio6",  "gpio7",  "gpio8",  "gpio9",  "gpio10", "gpio11",
+	"gpio12", "gpio13", "gpio14", "gpio15", "gpio16", "gpio17",
+	"gpio18", "gpio19", "gpio20", "gpio21", "gpio22", "gpio23",
+	"gpio24", "gpio25", "gpio26", "gpio27", "gpio28", "gpio29",
+	"gpio30", "gpio31", "gpio36", "gpio37", "gpio38", "gpio39",
+	"gpio40", "gpio41", "gpio42", "gpio43", "gpio44", "gpio45",
+	"gpio46"
+};
+static const char *const phy1_led0_groups[] = {
+	"gpio33", "gpio34", "gpio35", "gpio42"
+};
+static const char *const phy2_led0_groups[] = {
+	"gpio33", "gpio34", "gpio35", "gpio42"
+};
+static const char *const phy3_led0_groups[] = {
+	"gpio33", "gpio34", "gpio35", "gpio42"
+};
+static const char *const phy4_led0_groups[] = {
+	"gpio33", "gpio34", "gpio35", "gpio42"
+};
+static const char *const phy1_led1_groups[] = {
+	"gpio43", "gpio44", "gpio45", "gpio46"
+};
+static const char *const phy2_led1_groups[] = {
+	"gpio43", "gpio44", "gpio45", "gpio46"
+};
+static const char *const phy3_led1_groups[] = {
+	"gpio43", "gpio44", "gpio45", "gpio46"
+};
+static const char *const phy4_led1_groups[] = {
+	"gpio43", "gpio44", "gpio45", "gpio46"
+};
+
+static const struct airoha_pinctrl_func_group pon_func_group[] = {
+	{
+		.name = "pon",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PON_MODE_MASK,
+			GPIO_PON_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
+	{
+		.name = "pon_tod_1pps",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_2ND_I2C_MODE,
+			PON_TOD_1PPS_MODE_MASK,
+			PON_TOD_1PPS_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "gsw_tod_1pps",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_2ND_I2C_MODE,
+			GSW_TOD_1PPS_MODE_MASK,
+			GSW_TOD_1PPS_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group sipo_func_group[] = {
+	{
+		.name = "sipo",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
+			GPIO_SIPO_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "sipo_rclk",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
+			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group mdio_func_group[] = {
+	{
+		.name = "mdio",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_2ND_I2C_MODE,
+			GPIO_MDC_IO_MASTER_MODE_MASK,
+			GPIO_MDC_IO_MASTER_MODE_MASK
+		},
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			FORCE_GPIO_EN(1) | FORCE_GPIO_EN(2),
+			FORCE_GPIO_EN(1) | FORCE_GPIO_EN(2)
+		},
+		.regmap_size = 2,
+	},
+};
+
+static const struct airoha_pinctrl_func_group uart_func_group[] = {
+	{
+		.name = "uart2",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_UART2_MODE_MASK,
+			GPIO_UART2_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "uart2_cts_rts",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_UART2_MODE_MASK | GPIO_UART2_CTS_RTS_MODE_MASK,
+			GPIO_UART2_MODE_MASK | GPIO_UART2_CTS_RTS_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "hsuart",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
+			GPIO_HSUART_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+	{
+		.name = "hsuart_cts_rts",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
+			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "uart4",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_UART4_MODE_MASK,
+			GPIO_UART4_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "uart5",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_UART5_MODE_MASK,
+			GPIO_UART5_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group i2c_func_group[] = {
+	{
+		.name = "i2c1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_2ND_I2C_MODE,
+			GPIO_2ND_I2C_MODE_MASK,
+			GPIO_2ND_I2C_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group jtag_func_group[] = {
+	{
+		.name = "jtag_udi",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_NPU_UART_EN,
+			JTAG_UDI_EN_MASK,
+			JTAG_UDI_EN_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "jtag_dfd",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_NPU_UART_EN,
+			JTAG_DFD_EN_MASK,
+			JTAG_DFD_EN_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group pcm_func_group[] = {
+	{
+		.name = "pcm1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM1_MODE_MASK,
+			GPIO_PCM1_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm2",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM2_MODE_MASK,
+			GPIO_PCM2_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group spi_func_group[] = {
+	{
+		.name = "spi_quad",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_QUAD_MODE_MASK,
+			GPIO_SPI_QUAD_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "spi_cs1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_CS1_MODE_MASK,
+			GPIO_SPI_CS1_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "spi_cs2",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_CS2_MODE_MASK,
+			GPIO_SPI_CS2_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "spi_cs3",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_CS3_MODE_MASK,
+			GPIO_SPI_CS3_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "spi_cs4",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_CS4_MODE_MASK,
+			GPIO_SPI_CS4_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
+	{
+		.name = "pcm_spi",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_MODE_MASK,
+			GPIO_PCM_SPI_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_int",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_INT_MODE_MASK,
+			GPIO_PCM_INT_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_rst",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_RESET_MODE_MASK,
+			GPIO_PCM_RESET_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS1_MODE_MASK,
+			GPIO_PCM_SPI_CS1_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs2_p128",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS2_MODE_P128_MASK,
+			GPIO_PCM_SPI_CS2_MODE_P128_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs2_p156",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS2_MODE_P156_MASK,
+			GPIO_PCM_SPI_CS2_MODE_P156_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs3",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS3_MODE_MASK,
+			GPIO_PCM_SPI_CS3_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs4",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS4_MODE_MASK,
+			GPIO_PCM_SPI_CS4_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group i2s_func_group[] = {
+	{
+		.name = "i2s",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_2ND_I2C_MODE,
+			GPIO_I2S_MODE_MASK,
+			GPIO_I2S_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group emmc_func_group[] = {
+	{
+		.name = "emmc",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_EMMC_MODE_MASK,
+			GPIO_EMMC_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group pnand_func_group[] = {
+	{
+		.name = "pnand",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PARALLEL_NAND_MODE_MASK,
+			GPIO_PARALLEL_NAND_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group gpio_func_group[] = {
+	AIROHA_PINCTRL_GPIO_EXT("gpio44", GPIO44_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio45", GPIO45_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio46", GPIO46_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET2_MASK),
+};
+
+static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
+	{
+		.name = "pcie_reset0",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PCIE_RESET0_MASK,
+			0
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcie_reset1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PCIE_RESET1_MASK,
+			0
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcie_reset2",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PCIE_RESET2_MASK,
+			0
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group pwm_func_group[] = {
+	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio28", GPIO28_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio29", GPIO29_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio30", GPIO30_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio31", GPIO31_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio39", GPIO39_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio40", GPIO40_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio41", GPIO41_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio42", GPIO42_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio43", GPIO43_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio44", GPIO44_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio45", GPIO45_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio46", GPIO46_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET2_MASK),
+};
+
+static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
+};
+
+static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
+};
+
+static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+};
+
+static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
+};
+
+static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
+};
+
+static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
+};
+
+static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+};
+
+static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
+};
+
+static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
+	PINCTRL_FUNC_DESC("pon", pon),
+	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
+	PINCTRL_FUNC_DESC("sipo", sipo),
+	PINCTRL_FUNC_DESC("mdio", mdio),
+	PINCTRL_FUNC_DESC("uart", uart),
+	PINCTRL_FUNC_DESC("i2c", i2c),
+	PINCTRL_FUNC_DESC("jtag", jtag),
+	PINCTRL_FUNC_DESC("pcm", pcm),
+	PINCTRL_FUNC_DESC("spi", spi),
+	PINCTRL_FUNC_DESC("pcm_spi", pcm_spi),
+	PINCTRL_FUNC_DESC("i2s", i2s),
+	PINCTRL_FUNC_DESC("emmc", emmc),
+	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("gpio", gpio),
+	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
+	PINCTRL_FUNC_DESC("pwm", pwm),
+	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
+	PINCTRL_FUNC_DESC("phy2_led0", phy2_led0),
+	PINCTRL_FUNC_DESC("phy3_led0", phy3_led0),
+	PINCTRL_FUNC_DESC("phy4_led0", phy4_led0),
+	PINCTRL_FUNC_DESC("phy1_led1", phy1_led1),
+	PINCTRL_FUNC_DESC("phy2_led1", phy2_led1),
+	PINCTRL_FUNC_DESC("phy3_led1", phy3_led1),
+	PINCTRL_FUNC_DESC("phy4_led1", phy4_led1),
+};
+
+static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
+	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
+	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(4, REG_I2C_SDA_PU, SPI_CS0_PU_MASK),
+	PINCTRL_CONF_DESC(5, REG_I2C_SDA_PU, SPI_CLK_PU_MASK),
+	PINCTRL_CONF_DESC(6, REG_I2C_SDA_PU, SPI_MOSI_PU_MASK),
+	PINCTRL_CONF_DESC(7, REG_I2C_SDA_PU, SPI_MISO_PU_MASK),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_PU, BIT(0)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_PU, BIT(1)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_PU, BIT(2)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_PU, BIT(3)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_PU, BIT(4)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_PU, BIT(5)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_PU, BIT(6)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_PU, BIT(7)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(8)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_PU, BIT(9)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_PU, BIT(10)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_PU, BIT(11)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_PU, BIT(12)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_PU, BIT(13)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_PU, BIT(14)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_PU, BIT(15)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_PU, BIT(16)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_PU, BIT(17)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_PU, BIT(18)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_PU, BIT(19)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_PU, BIT(20)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_L_PU, BIT(21)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_L_PU, BIT(22)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_L_PU, BIT(23)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_L_PU, BIT(24)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_L_PU, BIT(25)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_L_PU, BIT(26)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_L_PU, BIT(27)),
+	PINCTRL_CONF_DESC(41, REG_GPIO_L_PU, BIT(28)),
+	PINCTRL_CONF_DESC(42, REG_GPIO_L_PU, BIT(29)),
+	PINCTRL_CONF_DESC(43, REG_GPIO_L_PU, BIT(30)),
+	PINCTRL_CONF_DESC(44, REG_GPIO_L_PU, BIT(31)),
+	PINCTRL_CONF_DESC(45, REG_GPIO_H_PU, BIT(0)),
+	PINCTRL_CONF_DESC(46, REG_GPIO_H_PU, BIT(1)),
+	PINCTRL_CONF_DESC(47, REG_GPIO_H_PU, BIT(2)),
+	PINCTRL_CONF_DESC(48, REG_GPIO_H_PU, BIT(3)),
+	PINCTRL_CONF_DESC(49, REG_GPIO_H_PU, BIT(4)),
+	PINCTRL_CONF_DESC(50, REG_GPIO_H_PU, BIT(5)),
+	PINCTRL_CONF_DESC(51, REG_GPIO_H_PU, BIT(6)),
+	PINCTRL_CONF_DESC(52, REG_GPIO_H_PU, BIT(7)),
+	PINCTRL_CONF_DESC(53, REG_GPIO_H_PU, BIT(8)),
+	PINCTRL_CONF_DESC(54, REG_GPIO_H_PU, BIT(9)),
+	PINCTRL_CONF_DESC(55, REG_GPIO_H_PU, BIT(10)),
+	PINCTRL_CONF_DESC(56, REG_GPIO_H_PU, BIT(11)),
+	PINCTRL_CONF_DESC(57, REG_GPIO_H_PU, BIT(12)),
+	PINCTRL_CONF_DESC(58, REG_GPIO_H_PU, BIT(13)),
+	PINCTRL_CONF_DESC(59, REG_GPIO_H_PU, BIT(14)),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
+};
+
+static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
+	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
+	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(4, REG_I2C_SDA_PD, SPI_CS0_PD_MASK),
+	PINCTRL_CONF_DESC(5, REG_I2C_SDA_PD, SPI_CLK_PD_MASK),
+	PINCTRL_CONF_DESC(6, REG_I2C_SDA_PD, SPI_MOSI_PD_MASK),
+	PINCTRL_CONF_DESC(7, REG_I2C_SDA_PD, SPI_MISO_PD_MASK),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_PD, BIT(0)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_PD, BIT(1)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_PD, BIT(2)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_PD, BIT(3)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_PD, BIT(4)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_PD, BIT(5)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_PD, BIT(6)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_PD, BIT(7)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(8)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_PD, BIT(9)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_PD, BIT(10)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_PD, BIT(11)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_PD, BIT(12)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_PD, BIT(13)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_PD, BIT(14)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_PD, BIT(15)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_PD, BIT(16)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_PD, BIT(17)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_PD, BIT(18)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_PD, BIT(19)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_PD, BIT(20)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_L_PD, BIT(21)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_L_PD, BIT(22)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_L_PD, BIT(23)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_L_PD, BIT(24)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_L_PD, BIT(25)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_L_PD, BIT(26)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_L_PD, BIT(27)),
+	PINCTRL_CONF_DESC(41, REG_GPIO_L_PD, BIT(28)),
+	PINCTRL_CONF_DESC(42, REG_GPIO_L_PD, BIT(29)),
+	PINCTRL_CONF_DESC(43, REG_GPIO_L_PD, BIT(30)),
+	PINCTRL_CONF_DESC(44, REG_GPIO_L_PD, BIT(31)),
+	PINCTRL_CONF_DESC(45, REG_GPIO_H_PD, BIT(0)),
+	PINCTRL_CONF_DESC(46, REG_GPIO_H_PD, BIT(1)),
+	PINCTRL_CONF_DESC(47, REG_GPIO_H_PD, BIT(2)),
+	PINCTRL_CONF_DESC(48, REG_GPIO_H_PD, BIT(3)),
+	PINCTRL_CONF_DESC(49, REG_GPIO_H_PD, BIT(4)),
+	PINCTRL_CONF_DESC(50, REG_GPIO_H_PD, BIT(5)),
+	PINCTRL_CONF_DESC(51, REG_GPIO_H_PD, BIT(6)),
+	PINCTRL_CONF_DESC(52, REG_GPIO_H_PD, BIT(7)),
+	PINCTRL_CONF_DESC(53, REG_GPIO_H_PD, BIT(8)),
+	PINCTRL_CONF_DESC(54, REG_GPIO_H_PD, BIT(9)),
+	PINCTRL_CONF_DESC(55, REG_GPIO_H_PD, BIT(10)),
+	PINCTRL_CONF_DESC(56, REG_GPIO_H_PD, BIT(11)),
+	PINCTRL_CONF_DESC(57, REG_GPIO_H_PD, BIT(12)),
+	PINCTRL_CONF_DESC(58, REG_GPIO_H_PD, BIT(13)),
+	PINCTRL_CONF_DESC(59, REG_GPIO_H_PD, BIT(14)),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
+};
+
+static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
+	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
+	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(4, REG_I2C_SDA_E2, SPI_CS0_E2_MASK),
+	PINCTRL_CONF_DESC(5, REG_I2C_SDA_E2, SPI_CLK_E2_MASK),
+	PINCTRL_CONF_DESC(6, REG_I2C_SDA_E2, SPI_MOSI_E2_MASK),
+	PINCTRL_CONF_DESC(7, REG_I2C_SDA_E2, SPI_MISO_E2_MASK),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_E2, BIT(0)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_E2, BIT(1)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_E2, BIT(2)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_E2, BIT(3)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_E2, BIT(4)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_E2, BIT(5)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_E2, BIT(6)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_E2, BIT(7)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(8)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_E2, BIT(9)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_E2, BIT(10)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_E2, BIT(11)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_E2, BIT(12)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_E2, BIT(13)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_E2, BIT(14)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_E2, BIT(15)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_E2, BIT(16)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_E2, BIT(17)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_E2, BIT(18)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_E2, BIT(19)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_E2, BIT(20)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_L_E2, BIT(21)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_L_E2, BIT(22)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_L_E2, BIT(23)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_L_E2, BIT(24)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_L_E2, BIT(25)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_L_E2, BIT(26)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_L_E2, BIT(27)),
+	PINCTRL_CONF_DESC(41, REG_GPIO_L_E2, BIT(28)),
+	PINCTRL_CONF_DESC(42, REG_GPIO_L_E2, BIT(29)),
+	PINCTRL_CONF_DESC(43, REG_GPIO_L_E2, BIT(30)),
+	PINCTRL_CONF_DESC(44, REG_GPIO_L_E2, BIT(31)),
+	PINCTRL_CONF_DESC(45, REG_GPIO_H_E2, BIT(0)),
+	PINCTRL_CONF_DESC(46, REG_GPIO_H_E2, BIT(1)),
+	PINCTRL_CONF_DESC(47, REG_GPIO_H_E2, BIT(2)),
+	PINCTRL_CONF_DESC(48, REG_GPIO_H_E2, BIT(3)),
+	PINCTRL_CONF_DESC(49, REG_GPIO_H_E2, BIT(4)),
+	PINCTRL_CONF_DESC(50, REG_GPIO_H_E2, BIT(5)),
+	PINCTRL_CONF_DESC(51, REG_GPIO_H_E2, BIT(6)),
+	PINCTRL_CONF_DESC(52, REG_GPIO_H_E2, BIT(7)),
+	PINCTRL_CONF_DESC(53, REG_GPIO_H_E2, BIT(8)),
+	PINCTRL_CONF_DESC(54, REG_GPIO_H_E2, BIT(9)),
+	PINCTRL_CONF_DESC(55, REG_GPIO_H_E2, BIT(10)),
+	PINCTRL_CONF_DESC(56, REG_GPIO_H_E2, BIT(11)),
+	PINCTRL_CONF_DESC(57, REG_GPIO_H_E2, BIT(12)),
+	PINCTRL_CONF_DESC(58, REG_GPIO_H_E2, BIT(13)),
+	PINCTRL_CONF_DESC(59, REG_GPIO_H_E2, BIT(14)),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
+};
+
+static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
+	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
+	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(4, REG_I2C_SDA_E4, SPI_CS0_E4_MASK),
+	PINCTRL_CONF_DESC(5, REG_I2C_SDA_E4, SPI_CLK_E4_MASK),
+	PINCTRL_CONF_DESC(6, REG_I2C_SDA_E4, SPI_MOSI_E4_MASK),
+	PINCTRL_CONF_DESC(7, REG_I2C_SDA_E4, SPI_MISO_E4_MASK),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_E4, BIT(0)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_E4, BIT(1)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_E4, BIT(2)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_E4, BIT(3)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_E4, BIT(4)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_E4, BIT(5)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_E4, BIT(6)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_E4, BIT(7)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(8)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_E4, BIT(9)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_E4, BIT(10)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_E4, BIT(11)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_E4, BIT(12)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_E4, BIT(13)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_E4, BIT(14)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_E4, BIT(15)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_E4, BIT(16)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_E4, BIT(17)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_E4, BIT(18)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_E4, BIT(19)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_E4, BIT(20)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_L_E4, BIT(21)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_L_E4, BIT(22)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_L_E4, BIT(23)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_L_E4, BIT(24)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_L_E4, BIT(25)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_L_E4, BIT(26)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_L_E4, BIT(27)),
+	PINCTRL_CONF_DESC(41, REG_GPIO_L_E4, BIT(28)),
+	PINCTRL_CONF_DESC(42, REG_GPIO_L_E4, BIT(29)),
+	PINCTRL_CONF_DESC(43, REG_GPIO_L_E4, BIT(30)),
+	PINCTRL_CONF_DESC(44, REG_GPIO_L_E4, BIT(31)),
+	PINCTRL_CONF_DESC(45, REG_GPIO_H_E4, BIT(0)),
+	PINCTRL_CONF_DESC(46, REG_GPIO_H_E4, BIT(1)),
+	PINCTRL_CONF_DESC(47, REG_GPIO_H_E4, BIT(2)),
+	PINCTRL_CONF_DESC(48, REG_GPIO_H_E4, BIT(3)),
+	PINCTRL_CONF_DESC(49, REG_GPIO_H_E4, BIT(4)),
+	PINCTRL_CONF_DESC(50, REG_GPIO_H_E4, BIT(5)),
+	PINCTRL_CONF_DESC(51, REG_GPIO_H_E4, BIT(6)),
+	PINCTRL_CONF_DESC(52, REG_GPIO_H_E4, BIT(7)),
+	PINCTRL_CONF_DESC(53, REG_GPIO_H_E4, BIT(8)),
+	PINCTRL_CONF_DESC(54, REG_GPIO_H_E4, BIT(9)),
+	PINCTRL_CONF_DESC(55, REG_GPIO_H_E4, BIT(10)),
+	PINCTRL_CONF_DESC(56, REG_GPIO_H_E4, BIT(11)),
+	PINCTRL_CONF_DESC(57, REG_GPIO_H_E4, BIT(12)),
+	PINCTRL_CONF_DESC(58, REG_GPIO_H_E4, BIT(13)),
+	PINCTRL_CONF_DESC(59, REG_GPIO_H_E4, BIT(14)),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
+};
+
+static const struct airoha_pinctrl_conf en7581_pinctrl_pcie_rst_od_conf[] = {
+	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(63, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
+};
+
+static const struct airoha_pinctrl_match_data en7581_pinctrl_match_data = {
+	.pins = en7581_pinctrl_pins,
+	.num_pins = ARRAY_SIZE(en7581_pinctrl_pins),
+	.grps = en7581_pinctrl_groups,
+	.num_grps = ARRAY_SIZE(en7581_pinctrl_groups),
+	.funcs = en7581_pinctrl_funcs,
+	.num_funcs = ARRAY_SIZE(en7581_pinctrl_funcs),
+	.confs_info = {
+		[AIROHA_PINCTRL_CONFS_PULLUP] = {
+			.confs = en7581_pinctrl_pullup_conf,
+			.num_confs = ARRAY_SIZE(en7581_pinctrl_pullup_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_PULLDOWN] = {
+			.confs = en7581_pinctrl_pulldown_conf,
+			.num_confs = ARRAY_SIZE(en7581_pinctrl_pulldown_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
+			.confs = en7581_pinctrl_drive_e2_conf,
+			.num_confs = ARRAY_SIZE(en7581_pinctrl_drive_e2_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
+			.confs = en7581_pinctrl_drive_e4_conf,
+			.num_confs = ARRAY_SIZE(en7581_pinctrl_drive_e4_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_PCIE_RST_OD] = {
+			.confs = en7581_pinctrl_pcie_rst_od_conf,
+			.num_confs = ARRAY_SIZE(en7581_pinctrl_pcie_rst_od_conf),
+		},
+	},
+};
+
+static const struct of_device_id airoha_pinctrl_of_match[] = {
+	{ .compatible = "airoha,en7581-pinctrl", .data = &en7581_pinctrl_match_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, airoha_pinctrl_of_match);
+
+static struct platform_driver airoha_pinctrl_driver = {
+	.probe = airoha_pinctrl_probe,
+	.driver = {
+		.name = "pinctrl-airoha-an7581",
+		.of_match_table = airoha_pinctrl_of_match,
+	},
+};
+module_platform_driver(airoha_pinctrl_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
+MODULE_AUTHOR("Benjamin Larsson <benjamin.larsson@genexis.eu>");
+MODULE_AUTHOR("Markus Gothe <markus.gothe@genexis.eu>");
+MODULE_DESCRIPTION("Pinctrl driver for Airoha AN7581 SoC");
diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
new file mode 100644
index 000000000000..07a86aae3459
--- /dev/null
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -0,0 +1,1453 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Author: Lorenzo Bianconi <lorenzo@kernel.org>
+ * Author: Benjamin Larsson <benjamin.larsson@genexis.eu>
+ * Author: Markus Gothe <markus.gothe@genexis.eu>
+ */
+
+#include "airoha-common.h"
+
+/* MUX */
+#define REG_GPIO_2ND_I2C_MODE			0x0214
+#define GPIO_LAN3_LED1_MODE_MASK		BIT(10)
+#define GPIO_LAN3_LED0_MODE_MASK		BIT(9)
+#define GPIO_LAN2_LED1_MODE_MASK		BIT(8)
+#define GPIO_LAN2_LED0_MODE_MASK		BIT(7)
+#define GPIO_LAN1_LED1_MODE_MASK		BIT(6)
+#define GPIO_LAN1_LED0_MODE_MASK		BIT(5)
+#define GPIO_LAN0_LED1_MODE_MASK		BIT(4)
+#define GPIO_LAN0_LED0_MODE_MASK		BIT(3)
+#define PON_TOD_1PPS_MODE_MASK			BIT(2)
+#define GSW_TOD_1PPS_MODE_MASK			BIT(1)
+
+#define REG_GPIO_SPI_CS1_MODE			0x0218
+#define GPIO_MDC_IO_MASTER_MODE_MASK		BIT(22)
+#define GPIO_PCM_SPI_CS4_MODE_MASK		BIT(21)
+#define GPIO_PCM_SPI_CS3_MODE_MASK		BIT(20)
+#define AN7583_GPIO_PCM_SPI_CS2_MODE_MASK	BIT(18)
+#define GPIO_PCM_SPI_CS1_MODE_MASK		BIT(17)
+#define GPIO_PCM_SPI_MODE_MASK			BIT(16)
+#define GPIO_PCM2_MODE_MASK			BIT(13)
+#define GPIO_PCM1_MODE_MASK			BIT(12)
+#define GPIO_PCM_INT_MODE_MASK			BIT(9)
+#define GPIO_PCM_RESET_MODE_MASK		BIT(8)
+#define GPIO_SPI_QUAD_MODE_MASK			BIT(4)
+#define GPIO_SPI_CS4_MODE_MASK			BIT(3)
+#define GPIO_SPI_CS3_MODE_MASK			BIT(2)
+#define GPIO_SPI_CS2_MODE_MASK			BIT(1)
+#define GPIO_SPI_CS1_MODE_MASK			BIT(0)
+
+#define REG_GPIO_PON_MODE			0x021c
+#define AN7583_MDIO_0_GPIO_MODE_MASK		BIT(26)
+#define AN7583_MDC_0_GPIO_MODE_MASK		BIT(25)
+#define AN7583_UART_RXD_GPIO_MODE_MASK		BIT(24)
+#define AN7583_UART_TXD_GPIO_MODE_MASK		BIT(23)
+#define AN7583_SPI_MISO_GPIO_MODE_MASK		BIT(22)
+#define AN7583_SPI_MOSI_GPIO_MODE_MASK		BIT(21)
+#define AN7583_SPI_CS_GPIO_MODE_MASK		BIT(20)
+#define AN7583_SPI_CLK_GPIO_MODE_MASK		BIT(19)
+#define AN7583_I2C1_SDA_GPIO_MODE_MASK		BIT(18)
+#define AN7583_I2C1_SCL_GPIO_MODE_MASK		BIT(17)
+#define AN7583_I2C0_SDA_GPIO_MODE_MASK		BIT(16)
+#define AN7583_I2C0_SCL_GPIO_MODE_MASK		BIT(15)
+#define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
+#define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
+#define SIPO_RCLK_MODE_MASK			BIT(11)
+#define GPIO_PCIE_RESET1_MASK			BIT(10)
+#define GPIO_PCIE_RESET0_MASK			BIT(9)
+#define GPIO_UART5_MODE_MASK			BIT(8)
+#define GPIO_UART4_MODE_MASK			BIT(7)
+#define GPIO_HSUART_CTS_RTS_MODE_MASK		BIT(6)
+#define GPIO_HSUART_MODE_MASK			BIT(5)
+#define GPIO_UART2_CTS_RTS_MODE_MASK		BIT(4)
+#define GPIO_UART2_MODE_MASK			BIT(3)
+#define GPIO_SIPO_MODE_MASK			BIT(2)
+#define GPIO_EMMC_MODE_MASK			BIT(1)
+#define GPIO_PON_MODE_MASK			BIT(0)
+
+#define REG_NPU_UART_EN				0x0224
+#define JTAG_UDI_EN_MASK			BIT(4)
+#define JTAG_DFD_EN_MASK			BIT(3)
+
+#define REG_FORCE_GPIO_EN			0x0228
+#define FORCE_GPIO_EN(n)			BIT(n)
+
+/* LED MAP */
+#define REG_LAN_LED0_MAPPING			0x027c
+#define REG_LAN_LED1_MAPPING			0x0280
+
+#define LAN4_LED_MAPPING_MASK			GENMASK(18, 16)
+#define LAN4_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, (_n))
+
+#define LAN3_LED_MAPPING_MASK			GENMASK(14, 12)
+#define LAN3_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, (_n))
+
+#define LAN2_LED_MAPPING_MASK			GENMASK(10, 8)
+#define LAN2_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, (_n))
+
+#define LAN1_LED_MAPPING_MASK			GENMASK(6, 4)
+#define LAN1_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, (_n))
+
+#define LAN0_LED_MAPPING_MASK			GENMASK(2, 0)
+#define LAN0_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, (_n))
+
+/* CONF */
+#define REG_I2C_SDA_E2				0x001c
+#define AN7583_I2C1_SCL_E2_MASK			BIT(16)
+#define AN7583_I2C1_SDA_E2_MASK			BIT(15)
+#define SPI_MISO_E2_MASK			BIT(14)
+#define SPI_MOSI_E2_MASK			BIT(13)
+#define SPI_CLK_E2_MASK				BIT(12)
+#define SPI_CS0_E2_MASK				BIT(11)
+#define PCIE1_RESET_E2_MASK			BIT(9)
+#define PCIE0_RESET_E2_MASK			BIT(8)
+#define AN7583_MDIO_0_E2_MASK			BIT(5)
+#define AN7583_MDC_0_E2_MASK			BIT(4)
+#define UART1_RXD_E2_MASK			BIT(3)
+#define UART1_TXD_E2_MASK			BIT(2)
+#define I2C_SCL_E2_MASK				BIT(1)
+#define I2C_SDA_E2_MASK				BIT(0)
+
+#define REG_I2C_SDA_E4				0x0020
+#define AN7583_I2C1_SCL_E4_MASK			BIT(16)
+#define AN7583_I2C1_SDA_E4_MASK			BIT(15)
+#define SPI_MISO_E4_MASK			BIT(14)
+#define SPI_MOSI_E4_MASK			BIT(13)
+#define SPI_CLK_E4_MASK				BIT(12)
+#define SPI_CS0_E4_MASK				BIT(11)
+#define PCIE1_RESET_E4_MASK			BIT(9)
+#define PCIE0_RESET_E4_MASK			BIT(8)
+#define AN7583_MDIO_0_E4_MASK			BIT(5)
+#define AN7583_MDC_0_E4_MASK			BIT(4)
+#define UART1_RXD_E4_MASK			BIT(3)
+#define UART1_TXD_E4_MASK			BIT(2)
+#define I2C_SCL_E4_MASK				BIT(1)
+#define I2C_SDA_E4_MASK				BIT(0)
+
+#define REG_GPIO_L_E2				0x0024
+#define REG_GPIO_L_E4				0x0028
+#define REG_GPIO_H_E2				0x002c
+#define REG_GPIO_H_E4				0x0030
+
+#define REG_I2C_SDA_PU				0x0044
+#define AN7583_I2C1_SCL_PU_MASK			BIT(16)
+#define AN7583_I2C1_SDA_PU_MASK			BIT(15)
+#define SPI_MISO_PU_MASK			BIT(14)
+#define SPI_MOSI_PU_MASK			BIT(13)
+#define SPI_CLK_PU_MASK				BIT(12)
+#define SPI_CS0_PU_MASK				BIT(11)
+#define PCIE1_RESET_PU_MASK			BIT(9)
+#define PCIE0_RESET_PU_MASK			BIT(8)
+#define AN7583_MDIO_0_PU_MASK			BIT(5)
+#define AN7583_MDC_0_PU_MASK			BIT(4)
+#define UART1_RXD_PU_MASK			BIT(3)
+#define UART1_TXD_PU_MASK			BIT(2)
+#define I2C_SCL_PU_MASK				BIT(1)
+#define I2C_SDA_PU_MASK				BIT(0)
+
+#define REG_I2C_SDA_PD				0x0048
+#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
+#define AN7583_I2C1_SDA_PD_MASK			BIT(15)
+#define SPI_MISO_PD_MASK			BIT(14)
+#define SPI_MOSI_PD_MASK			BIT(13)
+#define SPI_CLK_PD_MASK				BIT(12)
+#define SPI_CS0_PD_MASK				BIT(11)
+#define PCIE1_RESET_PD_MASK			BIT(9)
+#define PCIE0_RESET_PD_MASK			BIT(8)
+#define AN7583_MDIO_0_PD_MASK			BIT(5)
+#define AN7583_MDC_0_PD_MASK			BIT(4)
+#define UART1_RXD_PD_MASK			BIT(3)
+#define UART1_TXD_PD_MASK			BIT(2)
+#define I2C_SCL_PD_MASK				BIT(1)
+#define I2C_SDA_PD_MASK				BIT(0)
+
+#define REG_GPIO_L_PU				0x004c
+#define REG_GPIO_L_PD				0x0050
+#define REG_GPIO_H_PU				0x0054
+#define REG_GPIO_H_PD				0x0058
+
+#define REG_PCIE_RESET_OD			0x018c
+#define PCIE1_RESET_OD_MASK			BIT(1)
+#define PCIE0_RESET_OD_MASK			BIT(0)
+
+/* PWM MODE CONF */
+#define REG_GPIO_FLASH_MODE_CFG			0x0034
+#define GPIO15_FLASH_MODE_CFG			BIT(15)
+#define GPIO14_FLASH_MODE_CFG			BIT(14)
+#define GPIO13_FLASH_MODE_CFG			BIT(13)
+#define GPIO12_FLASH_MODE_CFG			BIT(12)
+#define GPIO11_FLASH_MODE_CFG			BIT(11)
+#define GPIO10_FLASH_MODE_CFG			BIT(10)
+#define GPIO9_FLASH_MODE_CFG			BIT(9)
+#define GPIO8_FLASH_MODE_CFG			BIT(8)
+#define GPIO7_FLASH_MODE_CFG			BIT(7)
+#define GPIO6_FLASH_MODE_CFG			BIT(6)
+#define GPIO5_FLASH_MODE_CFG			BIT(5)
+#define GPIO4_FLASH_MODE_CFG			BIT(4)
+#define GPIO3_FLASH_MODE_CFG			BIT(3)
+#define GPIO2_FLASH_MODE_CFG			BIT(2)
+#define GPIO1_FLASH_MODE_CFG			BIT(1)
+#define GPIO0_FLASH_MODE_CFG			BIT(0)
+
+/* PWM MODE CONF EXT */
+#define REG_GPIO_FLASH_MODE_CFG_EXT		0x0068
+#define GPIO51_FLASH_MODE_CFG			BIT(31)
+#define GPIO50_FLASH_MODE_CFG			BIT(30)
+#define GPIO49_FLASH_MODE_CFG			BIT(29)
+#define GPIO48_FLASH_MODE_CFG			BIT(28)
+#define GPIO47_FLASH_MODE_CFG			BIT(27)
+#define GPIO46_FLASH_MODE_CFG			BIT(26)
+#define GPIO45_FLASH_MODE_CFG			BIT(25)
+#define GPIO44_FLASH_MODE_CFG			BIT(24)
+#define GPIO43_FLASH_MODE_CFG			BIT(23)
+#define GPIO42_FLASH_MODE_CFG			BIT(22)
+#define GPIO41_FLASH_MODE_CFG			BIT(21)
+#define GPIO40_FLASH_MODE_CFG			BIT(20)
+#define GPIO39_FLASH_MODE_CFG			BIT(19)
+#define GPIO38_FLASH_MODE_CFG			BIT(18)
+#define GPIO37_FLASH_MODE_CFG			BIT(17)
+#define GPIO36_FLASH_MODE_CFG			BIT(16)
+#define GPIO31_FLASH_MODE_CFG			BIT(15)
+#define GPIO30_FLASH_MODE_CFG			BIT(14)
+#define GPIO29_FLASH_MODE_CFG			BIT(13)
+#define GPIO28_FLASH_MODE_CFG			BIT(12)
+#define GPIO27_FLASH_MODE_CFG			BIT(11)
+#define GPIO26_FLASH_MODE_CFG			BIT(10)
+#define GPIO25_FLASH_MODE_CFG			BIT(9)
+#define GPIO24_FLASH_MODE_CFG			BIT(8)
+#define GPIO23_FLASH_MODE_CFG			BIT(7)
+#define GPIO22_FLASH_MODE_CFG			BIT(6)
+#define GPIO21_FLASH_MODE_CFG			BIT(5)
+#define GPIO20_FLASH_MODE_CFG			BIT(4)
+#define GPIO19_FLASH_MODE_CFG			BIT(3)
+#define GPIO18_FLASH_MODE_CFG			BIT(2)
+#define GPIO17_FLASH_MODE_CFG			BIT(1)
+#define GPIO16_FLASH_MODE_CFG			BIT(0)
+
+#define AIROHA_PINCTRL_GPIO(gpio, mux_val)			\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap_size = 1,				\
+	}
+
+#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			0					\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
+/* PWM */
+#define AIROHA_PINCTRL_PWM(gpio, mux_val)			\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_MUX,			\
+			REG_GPIO_FLASH_MODE_CFG,		\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap_size = 1,				\
+	}
+
+#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)			\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap_size = 1,				\
+	}
+
+#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
+#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
+	{								\
+		.name = (gpio),						\
+		.regmap[0] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_GPIO_2ND_I2C_MODE,				\
+			(mux_val),					\
+			(mux_val),					\
+		},							\
+		.regmap[1] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_LAN_LED0_MAPPING,				\
+			(map_mask),					\
+			(map_val),					\
+		},							\
+		.regmap_size = 2,					\
+	}
+
+#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)	\
+	{								\
+		.name = (gpio),						\
+		.regmap[0] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_GPIO_2ND_I2C_MODE,				\
+			(mux_val),					\
+			(mux_val),					\
+		},							\
+		.regmap[1] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_LAN_LED1_MAPPING,				\
+			(map_mask),					\
+			(map_val),					\
+		},							\
+		.regmap_size = 2,					\
+	}
+
+static struct pinctrl_pin_desc an7583_pinctrl_pins[] = {
+	PINCTRL_PIN(2, "gpio0"),
+	PINCTRL_PIN(3, "gpio1"),
+	PINCTRL_PIN(4, "gpio2"),
+	PINCTRL_PIN(5, "gpio3"),
+	PINCTRL_PIN(6, "gpio4"),
+	PINCTRL_PIN(7, "gpio5"),
+	PINCTRL_PIN(8, "gpio6"),
+	PINCTRL_PIN(9, "gpio7"),
+	PINCTRL_PIN(10, "gpio8"),
+	PINCTRL_PIN(11, "gpio9"),
+	PINCTRL_PIN(12, "gpio10"),
+	PINCTRL_PIN(13, "gpio11"),
+	PINCTRL_PIN(14, "gpio12"),
+	PINCTRL_PIN(15, "gpio13"),
+	PINCTRL_PIN(16, "gpio14"),
+	PINCTRL_PIN(17, "gpio15"),
+	PINCTRL_PIN(18, "gpio16"),
+	PINCTRL_PIN(19, "gpio17"),
+	PINCTRL_PIN(20, "gpio18"),
+	PINCTRL_PIN(21, "gpio19"),
+	PINCTRL_PIN(22, "gpio20"),
+	PINCTRL_PIN(23, "gpio21"),
+	PINCTRL_PIN(24, "gpio22"),
+	PINCTRL_PIN(25, "gpio23"),
+	PINCTRL_PIN(26, "gpio24"),
+	PINCTRL_PIN(27, "gpio25"),
+	PINCTRL_PIN(28, "gpio26"),
+	PINCTRL_PIN(29, "gpio27"),
+	PINCTRL_PIN(30, "gpio28"),
+	PINCTRL_PIN(31, "gpio29"),
+	PINCTRL_PIN(32, "gpio30"),
+	PINCTRL_PIN(33, "gpio31"),
+	PINCTRL_PIN(34, "gpio32"),
+	PINCTRL_PIN(35, "gpio33"),
+	PINCTRL_PIN(36, "gpio34"),
+	PINCTRL_PIN(37, "gpio35"),
+	PINCTRL_PIN(38, "gpio36"),
+	PINCTRL_PIN(39, "gpio37"),
+	PINCTRL_PIN(40, "gpio38"),
+	PINCTRL_PIN(41, "i2c0_scl"),
+	PINCTRL_PIN(42, "i2c0_sda"),
+	PINCTRL_PIN(43, "i2c1_scl"),
+	PINCTRL_PIN(44, "i2c1_sda"),
+	PINCTRL_PIN(45, "spi_clk"),
+	PINCTRL_PIN(46, "spi_cs"),
+	PINCTRL_PIN(47, "spi_mosi"),
+	PINCTRL_PIN(48, "spi_miso"),
+	PINCTRL_PIN(49, "uart_txd"),
+	PINCTRL_PIN(50, "uart_rxd"),
+	PINCTRL_PIN(51, "pcie_reset0"),
+	PINCTRL_PIN(52, "pcie_reset1"),
+	PINCTRL_PIN(53, "mdc_0"),
+	PINCTRL_PIN(54, "mdio_0"),
+};
+
+static const int an7583_pon_pins[] = { 15, 16, 17, 18, 19, 20 };
+static const int an7583_pon_tod_1pps_pins[] = { 32 };
+static const int an7583_gsw_tod_1pps_pins[] = { 32 };
+static const int an7583_sipo_pins[] = { 34, 35 };
+static const int an7583_sipo_rclk_pins[] = { 34, 35, 33 };
+static const int an7583_mdio_pins[] = { 43, 44 };
+static const int an7583_uart2_pins[] = { 34, 35 };
+static const int an7583_uart2_cts_rts_pins[] = { 32, 33 };
+static const int an7583_hsuart_pins[] = { 30, 31 };
+static const int an7583_hsuart_cts_rts_pins[] = { 28, 29 };
+static const int an7583_npu_uart_pins[] = { 7, 8 };
+static const int an7583_uart4_pins[] = { 7, 8 };
+static const int an7583_uart5_pins[] = { 23, 24 };
+static const int an7583_i2c0_pins[] = { 41, 42 };
+static const int an7583_i2c1_pins[] = { 43, 44 };
+static const int an7583_jtag_udi_pins[] = { 23, 24, 22, 25, 26 };
+static const int an7583_jtag_dfd_pins[] = { 23, 24, 22, 25, 26 };
+static const int an7583_pcm1_pins[] = { 10, 11, 12, 13, 14 };
+static const int an7583_pcm2_pins[] = { 28, 29, 30, 31, 24 };
+static const int an7583_spi_pins[] = { 28, 29, 30, 31 };
+static const int an7583_spi_quad_pins[] = { 25, 26 };
+static const int an7583_spi_cs1_pins[] = { 27 };
+static const int an7583_pcm_spi_pins[] = { 28, 29, 30, 31, 10, 11, 12, 13 };
+static const int an7583_pcm_spi_rst_pins[] = { 14 };
+static const int an7583_pcm_spi_cs1_pins[] = { 24 };
+static const int an7583_emmc_pins[] = {
+	7, 8, 9, 22, 23, 24, 25, 26, 45, 46, 47
+};
+static const int an7583_pnand_pins[] = {
+	7, 8, 9, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 45, 46, 47, 48
+};
+static const int an7583_gpio0_pins[] = { 2 };
+static const int an7583_gpio1_pins[] = { 3 };
+static const int an7583_gpio2_pins[] = { 4 };
+static const int an7583_gpio3_pins[] = { 5 };
+static const int an7583_gpio4_pins[] = { 6 };
+static const int an7583_gpio5_pins[] = { 7 };
+static const int an7583_gpio6_pins[] = { 8 };
+static const int an7583_gpio7_pins[] = { 9 };
+static const int an7583_gpio8_pins[] = { 10 };
+static const int an7583_gpio9_pins[] = { 11 };
+static const int an7583_gpio10_pins[] = { 12 };
+static const int an7583_gpio11_pins[] = { 13 };
+static const int an7583_gpio12_pins[] = { 14 };
+static const int an7583_gpio13_pins[] = { 15 };
+static const int an7583_gpio14_pins[] = { 16 };
+static const int an7583_gpio15_pins[] = { 17 };
+static const int an7583_gpio16_pins[] = { 18 };
+static const int an7583_gpio17_pins[] = { 19 };
+static const int an7583_gpio18_pins[] = { 20 };
+static const int an7583_gpio19_pins[] = { 21 };
+static const int an7583_gpio20_pins[] = { 22 };
+static const int an7583_gpio21_pins[] = { 23 };
+static const int an7583_gpio22_pins[] = { 24 };
+static const int an7583_gpio23_pins[] = { 25 };
+static const int an7583_gpio24_pins[] = { 26 };
+static const int an7583_gpio25_pins[] = { 27 };
+static const int an7583_gpio26_pins[] = { 28 };
+static const int an7583_gpio27_pins[] = { 29 };
+static const int an7583_gpio28_pins[] = { 30 };
+static const int an7583_gpio29_pins[] = { 31 };
+static const int an7583_gpio30_pins[] = { 32 };
+static const int an7583_gpio31_pins[] = { 33 };
+static const int an7583_gpio32_pins[] = { 34 };
+static const int an7583_gpio33_pins[] = { 35 };
+static const int an7583_gpio34_pins[] = { 36 };
+static const int an7583_gpio35_pins[] = { 37 };
+static const int an7583_gpio36_pins[] = { 38 };
+static const int an7583_gpio37_pins[] = { 39 };
+static const int an7583_gpio38_pins[] = { 40 };
+static const int an7583_gpio39_pins[] = { 41 };
+static const int an7583_gpio40_pins[] = { 42 };
+static const int an7583_gpio41_pins[] = { 43 };
+static const int an7583_gpio42_pins[] = { 44 };
+static const int an7583_gpio43_pins[] = { 45 };
+static const int an7583_gpio44_pins[] = { 46 };
+static const int an7583_gpio45_pins[] = { 47 };
+static const int an7583_gpio46_pins[] = { 48 };
+static const int an7583_gpio47_pins[] = { 49 };
+static const int an7583_gpio48_pins[] = { 50 };
+static const int an7583_gpio49_pins[] = { 51 };
+static const int an7583_gpio50_pins[] = { 52 };
+static const int an7583_gpio51_pins[] = { 53 };
+static const int an7583_gpio52_pins[] = { 54 };
+static const int an7583_pcie_reset0_pins[] = { 51 };
+static const int an7583_pcie_reset1_pins[] = { 52 };
+
+static const struct pingroup an7583_pinctrl_groups[] = {
+	PINCTRL_PIN_GROUP("pon", an7583_pon),
+	PINCTRL_PIN_GROUP("pon_tod_1pps", an7583_pon_tod_1pps),
+	PINCTRL_PIN_GROUP("gsw_tod_1pps", an7583_gsw_tod_1pps),
+	PINCTRL_PIN_GROUP("sipo", an7583_sipo),
+	PINCTRL_PIN_GROUP("sipo_rclk", an7583_sipo_rclk),
+	PINCTRL_PIN_GROUP("mdio", an7583_mdio),
+	PINCTRL_PIN_GROUP("uart2", an7583_uart2),
+	PINCTRL_PIN_GROUP("uart2_cts_rts", an7583_uart2_cts_rts),
+	PINCTRL_PIN_GROUP("hsuart", an7583_hsuart),
+	PINCTRL_PIN_GROUP("hsuart_cts_rts", an7583_hsuart_cts_rts),
+	PINCTRL_PIN_GROUP("npu_uart", an7583_npu_uart),
+	PINCTRL_PIN_GROUP("uart4", an7583_uart4),
+	PINCTRL_PIN_GROUP("uart5", an7583_uart5),
+	PINCTRL_PIN_GROUP("i2c0", an7583_i2c0),
+	PINCTRL_PIN_GROUP("i2c1", an7583_i2c1),
+	PINCTRL_PIN_GROUP("jtag_udi", an7583_jtag_udi),
+	PINCTRL_PIN_GROUP("jtag_dfd", an7583_jtag_dfd),
+	PINCTRL_PIN_GROUP("pcm1", an7583_pcm1),
+	PINCTRL_PIN_GROUP("pcm2", an7583_pcm2),
+	PINCTRL_PIN_GROUP("spi", an7583_spi),
+	PINCTRL_PIN_GROUP("spi_quad", an7583_spi_quad),
+	PINCTRL_PIN_GROUP("spi_cs1", an7583_spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi", an7583_pcm_spi),
+	PINCTRL_PIN_GROUP("pcm_spi_rst", an7583_pcm_spi_rst),
+	PINCTRL_PIN_GROUP("pcm_spi_cs1", an7583_pcm_spi_cs1),
+	PINCTRL_PIN_GROUP("emmc", an7583_emmc),
+	PINCTRL_PIN_GROUP("pnand", an7583_pnand),
+	PINCTRL_PIN_GROUP("gpio0", an7583_gpio0),
+	PINCTRL_PIN_GROUP("gpio1", an7583_gpio1),
+	PINCTRL_PIN_GROUP("gpio2", an7583_gpio2),
+	PINCTRL_PIN_GROUP("gpio3", an7583_gpio3),
+	PINCTRL_PIN_GROUP("gpio4", an7583_gpio4),
+	PINCTRL_PIN_GROUP("gpio5", an7583_gpio5),
+	PINCTRL_PIN_GROUP("gpio6", an7583_gpio6),
+	PINCTRL_PIN_GROUP("gpio7", an7583_gpio7),
+	PINCTRL_PIN_GROUP("gpio8", an7583_gpio8),
+	PINCTRL_PIN_GROUP("gpio9", an7583_gpio9),
+	PINCTRL_PIN_GROUP("gpio10", an7583_gpio10),
+	PINCTRL_PIN_GROUP("gpio11", an7583_gpio11),
+	PINCTRL_PIN_GROUP("gpio12", an7583_gpio12),
+	PINCTRL_PIN_GROUP("gpio13", an7583_gpio13),
+	PINCTRL_PIN_GROUP("gpio14", an7583_gpio14),
+	PINCTRL_PIN_GROUP("gpio15", an7583_gpio15),
+	PINCTRL_PIN_GROUP("gpio16", an7583_gpio16),
+	PINCTRL_PIN_GROUP("gpio17", an7583_gpio17),
+	PINCTRL_PIN_GROUP("gpio18", an7583_gpio18),
+	PINCTRL_PIN_GROUP("gpio19", an7583_gpio19),
+	PINCTRL_PIN_GROUP("gpio20", an7583_gpio20),
+	PINCTRL_PIN_GROUP("gpio21", an7583_gpio21),
+	PINCTRL_PIN_GROUP("gpio22", an7583_gpio22),
+	PINCTRL_PIN_GROUP("gpio23", an7583_gpio23),
+	PINCTRL_PIN_GROUP("gpio24", an7583_gpio24),
+	PINCTRL_PIN_GROUP("gpio25", an7583_gpio25),
+	PINCTRL_PIN_GROUP("gpio26", an7583_gpio26),
+	PINCTRL_PIN_GROUP("gpio27", an7583_gpio27),
+	PINCTRL_PIN_GROUP("gpio28", an7583_gpio28),
+	PINCTRL_PIN_GROUP("gpio29", an7583_gpio29),
+	PINCTRL_PIN_GROUP("gpio30", an7583_gpio30),
+	PINCTRL_PIN_GROUP("gpio31", an7583_gpio31),
+	PINCTRL_PIN_GROUP("gpio32", an7583_gpio32),
+	PINCTRL_PIN_GROUP("gpio33", an7583_gpio33),
+	PINCTRL_PIN_GROUP("gpio34", an7583_gpio34),
+	PINCTRL_PIN_GROUP("gpio35", an7583_gpio35),
+	PINCTRL_PIN_GROUP("gpio36", an7583_gpio36),
+	PINCTRL_PIN_GROUP("gpio37", an7583_gpio37),
+	PINCTRL_PIN_GROUP("gpio38", an7583_gpio38),
+	PINCTRL_PIN_GROUP("gpio39", an7583_gpio39),
+	PINCTRL_PIN_GROUP("gpio40", an7583_gpio40),
+	PINCTRL_PIN_GROUP("gpio41", an7583_gpio41),
+	PINCTRL_PIN_GROUP("gpio42", an7583_gpio42),
+	PINCTRL_PIN_GROUP("gpio43", an7583_gpio43),
+	PINCTRL_PIN_GROUP("gpio44", an7583_gpio44),
+	PINCTRL_PIN_GROUP("gpio45", an7583_gpio45),
+	PINCTRL_PIN_GROUP("gpio46", an7583_gpio46),
+	PINCTRL_PIN_GROUP("gpio47", an7583_gpio47),
+	PINCTRL_PIN_GROUP("gpio48", an7583_gpio48),
+	PINCTRL_PIN_GROUP("gpio49", an7583_gpio49),
+	PINCTRL_PIN_GROUP("gpio50", an7583_gpio50),
+	PINCTRL_PIN_GROUP("gpio51", an7583_gpio51),
+	PINCTRL_PIN_GROUP("gpio52", an7583_gpio52),
+	PINCTRL_PIN_GROUP("pcie_reset0", an7583_pcie_reset0),
+	PINCTRL_PIN_GROUP("pcie_reset1", an7583_pcie_reset1),
+};
+
+static const char *const pon_groups[] = { "pon" };
+static const char *const tod_1pps_groups[] = {
+	"pon_tod_1pps", "gsw_tod_1pps"
+};
+static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
+static const char *const an7583_mdio_groups[] = { "mdio" };
+static const char *const uart_groups[] = {
+	"uart2", "uart2_cts_rts", "hsuart", "hsuart_cts_rts",
+	"uart4", "uart5"
+};
+static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
+static const char *const pcm_groups[] = { "pcm1", "pcm2" };
+static const char *const spi_groups[] = { "spi_quad", "spi_cs1" };
+static const char *const an7583_pcm_spi_groups[] = {
+	"pcm_spi", "pcm_spi_rst", "pcm_spi_cs1"
+};
+static const char *const emmc_groups[] = { "emmc" };
+static const char *const pnand_groups[] = { "pnand" };
+static const char *const an7583_gpio_groups[] = {
+	"gpio39", "gpio40", "gpio41", "gpio42", "gpio43",
+	"gpio44", "gpio45", "gpio46", "gpio47", "gpio48",
+	"gpio49", "gpio50", "gpio51", "gpio52"
+};
+static const char *const an7583_pcie_reset_groups[] = {
+	"pcie_reset0", "pcie_reset1"
+};
+static const char *const an7583_pwm_groups[] = {
+	"gpio0",  "gpio1",  "gpio2",  "gpio3",  "gpio4",  "gpio5",
+	"gpio6",  "gpio7",  "gpio8",  "gpio9",  "gpio10", "gpio11",
+	"gpio12", "gpio13", "gpio14", "gpio15", "gpio16", "gpio17",
+	"gpio18", "gpio19", "gpio20", "gpio21", "gpio22", "gpio23",
+	"gpio24", "gpio25", "gpio26", "gpio27", "gpio28", "gpio29",
+	"gpio30", "gpio31", "gpio36", "gpio37", "gpio38", "gpio39",
+	"gpio40", "gpio41", "gpio42", "gpio43", "gpio44", "gpio45",
+	"gpio46", "gpio47", "gpio48", "gpio49", "gpio50", "gpio51"
+};
+static const char *const an7583_phy1_led0_groups[] = {
+	"gpio1", "gpio2", "gpio3", "gpio4"
+};
+static const char *const an7583_phy2_led0_groups[] = {
+	"gpio1", "gpio2", "gpio3", "gpio4"
+};
+static const char *const an7583_phy3_led0_groups[] = {
+	"gpio1", "gpio2", "gpio3", "gpio4"
+};
+static const char *const an7583_phy4_led0_groups[] = {
+	"gpio1", "gpio2", "gpio3", "gpio4"
+};
+static const char *const an7583_phy1_led1_groups[] = {
+	"gpio8", "gpio9", "gpio10", "gpio11"
+};
+static const char *const an7583_phy2_led1_groups[] = {
+	"gpio8", "gpio9", "gpio10", "gpio11"
+};
+static const char *const an7583_phy3_led1_groups[] = {
+	"gpio8", "gpio9", "gpio10", "gpio11"
+};
+static const char *const an7583_phy4_led1_groups[] = {
+	"gpio8", "gpio9", "gpio10", "gpio11"
+};
+
+static const struct airoha_pinctrl_func_group pon_func_group[] = {
+	{
+		.name = "pon",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PON_MODE_MASK,
+			GPIO_PON_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
+	{
+		.name = "pon_tod_1pps",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_2ND_I2C_MODE,
+			PON_TOD_1PPS_MODE_MASK,
+			PON_TOD_1PPS_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "gsw_tod_1pps",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_2ND_I2C_MODE,
+			GSW_TOD_1PPS_MODE_MASK,
+			GSW_TOD_1PPS_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group sipo_func_group[] = {
+	{
+		.name = "sipo",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
+			GPIO_SIPO_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "sipo_rclk",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
+			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group an7583_mdio_func_group[] = {
+	{
+		.name = "mdio",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_SGMII_MDIO_MODE_MASK,
+			GPIO_SGMII_MDIO_MODE_MASK
+		},
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_MDC_IO_MASTER_MODE_MASK,
+			GPIO_MDC_IO_MASTER_MODE_MASK
+		},
+		.regmap_size = 2,
+	},
+};
+
+static const struct airoha_pinctrl_func_group uart_func_group[] = {
+	{
+		.name = "uart2",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_UART2_MODE_MASK,
+			GPIO_UART2_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "uart2_cts_rts",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_UART2_MODE_MASK | GPIO_UART2_CTS_RTS_MODE_MASK,
+			GPIO_UART2_MODE_MASK | GPIO_UART2_CTS_RTS_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "hsuart",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
+			GPIO_HSUART_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+	{
+		.name = "hsuart_cts_rts",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
+			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "uart4",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_UART4_MODE_MASK,
+			GPIO_UART4_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "uart5",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_UART5_MODE_MASK,
+			GPIO_UART5_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group jtag_func_group[] = {
+	{
+		.name = "jtag_udi",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_NPU_UART_EN,
+			JTAG_UDI_EN_MASK,
+			JTAG_UDI_EN_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "jtag_dfd",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_NPU_UART_EN,
+			JTAG_DFD_EN_MASK,
+			JTAG_DFD_EN_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group pcm_func_group[] = {
+	{
+		.name = "pcm1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM1_MODE_MASK,
+			GPIO_PCM1_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm2",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM2_MODE_MASK,
+			GPIO_PCM2_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group spi_func_group[] = {
+	{
+		.name = "spi_quad",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_QUAD_MODE_MASK,
+			GPIO_SPI_QUAD_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "spi_cs1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_CS1_MODE_MASK,
+			GPIO_SPI_CS1_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "spi_cs2",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_CS2_MODE_MASK,
+			GPIO_SPI_CS2_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "spi_cs3",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_CS3_MODE_MASK,
+			GPIO_SPI_CS3_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "spi_cs4",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_CS4_MODE_MASK,
+			GPIO_SPI_CS4_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group an7583_pcm_spi_func_group[] = {
+	{
+		.name = "pcm_spi",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_MODE_MASK,
+			GPIO_PCM_SPI_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_int",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_INT_MODE_MASK,
+			GPIO_PCM_INT_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_rst",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_RESET_MODE_MASK,
+			GPIO_PCM_RESET_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS1_MODE_MASK,
+			GPIO_PCM_SPI_CS1_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs2",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			AN7583_GPIO_PCM_SPI_CS2_MODE_MASK,
+			AN7583_GPIO_PCM_SPI_CS2_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs3",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS3_MODE_MASK,
+			GPIO_PCM_SPI_CS3_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs4",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS4_MODE_MASK,
+			GPIO_PCM_SPI_CS4_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group emmc_func_group[] = {
+	{
+		.name = "emmc",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_EMMC_MODE_MASK,
+			GPIO_EMMC_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group pnand_func_group[] = {
+	{
+		.name = "pnand",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PARALLEL_NAND_MODE_MASK,
+			GPIO_PARALLEL_NAND_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group an7583_gpio_func_group[] = {
+	AIROHA_PINCTRL_GPIO_EXT("gpio39", GPIO39_FLASH_MODE_CFG,
+				AN7583_I2C0_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio40", GPIO40_FLASH_MODE_CFG,
+				AN7583_I2C0_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio41", GPIO41_FLASH_MODE_CFG,
+				AN7583_I2C1_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio42", GPIO42_FLASH_MODE_CFG,
+				AN7583_I2C1_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio43", GPIO43_FLASH_MODE_CFG,
+				AN7583_SPI_CLK_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio44", GPIO44_FLASH_MODE_CFG,
+				AN7583_SPI_CS_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio45", GPIO45_FLASH_MODE_CFG,
+				AN7583_SPI_MOSI_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio46", GPIO46_FLASH_MODE_CFG,
+				AN7583_SPI_MISO_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
+				AN7583_UART_TXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
+				AN7583_UART_RXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio50", GPIO50_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio51", GPIO51_FLASH_MODE_CFG,
+				AN7583_MDC_0_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO("gpio52", AN7583_MDIO_0_GPIO_MODE_MASK),
+};
+
+static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
+	{
+		.name = "pcie_reset0",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PCIE_RESET0_MASK,
+			0
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcie_reset1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PCIE_RESET1_MASK,
+			0
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
+	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio28", GPIO28_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio29", GPIO29_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio30", GPIO30_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio31", GPIO31_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio39", GPIO39_FLASH_MODE_CFG,
+				   AN7583_I2C0_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio40", GPIO40_FLASH_MODE_CFG,
+				   AN7583_I2C0_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio41", GPIO41_FLASH_MODE_CFG,
+				   AN7583_I2C1_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio42", GPIO42_FLASH_MODE_CFG,
+				   AN7583_I2C1_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio43", GPIO43_FLASH_MODE_CFG,
+				   AN7583_SPI_CLK_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio44", GPIO44_FLASH_MODE_CFG,
+				   AN7583_SPI_CS_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio45", GPIO45_FLASH_MODE_CFG,
+				   AN7583_SPI_MOSI_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio46", GPIO46_FLASH_MODE_CFG,
+				   AN7583_SPI_MISO_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio47", GPIO47_FLASH_MODE_CFG,
+				   AN7583_UART_TXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio48", GPIO48_FLASH_MODE_CFG,
+				   AN7583_UART_RXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio49", GPIO49_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio50", GPIO50_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio51", GPIO51_FLASH_MODE_CFG,
+				   AN7583_MDC_0_GPIO_MODE_MASK),
+};
+
+static const struct airoha_pinctrl_func_group an7583_phy1_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED0("gpio3", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED0("gpio4", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
+};
+
+static const struct airoha_pinctrl_func_group an7583_phy2_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED0("gpio3", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED0("gpio4", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
+};
+
+static const struct airoha_pinctrl_func_group an7583_phy3_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED0("gpio3", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED0("gpio4", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+};
+
+static const struct airoha_pinctrl_func_group an7583_phy4_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED0("gpio3", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED0("gpio4", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
+};
+
+static const struct airoha_pinctrl_func_group an7583_phy1_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
+};
+
+static const struct airoha_pinctrl_func_group an7583_phy2_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
+};
+
+static const struct airoha_pinctrl_func_group an7583_phy3_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+};
+
+static const struct airoha_pinctrl_func_group an7583_phy4_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
+};
+
+static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
+	PINCTRL_FUNC_DESC("pon", pon),
+	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
+	PINCTRL_FUNC_DESC("sipo", sipo),
+	PINCTRL_FUNC_DESC("mdio", an7583_mdio),
+	PINCTRL_FUNC_DESC("uart", uart),
+	PINCTRL_FUNC_DESC("jtag", jtag),
+	PINCTRL_FUNC_DESC("pcm", pcm),
+	PINCTRL_FUNC_DESC("spi", spi),
+	PINCTRL_FUNC_DESC("pcm_spi", an7583_pcm_spi),
+	PINCTRL_FUNC_DESC("emmc", emmc),
+	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("pcie_reset", an7583_pcie_reset),
+	PINCTRL_FUNC_DESC("pwm", an7583_pwm),
+	PINCTRL_FUNC_DESC("phy1_led0", an7583_phy1_led0),
+	PINCTRL_FUNC_DESC("phy2_led0", an7583_phy2_led0),
+	PINCTRL_FUNC_DESC("phy3_led0", an7583_phy3_led0),
+	PINCTRL_FUNC_DESC("phy4_led0", an7583_phy4_led0),
+	PINCTRL_FUNC_DESC("phy1_led1", an7583_phy1_led1),
+	PINCTRL_FUNC_DESC("phy2_led1", an7583_phy2_led1),
+	PINCTRL_FUNC_DESC("phy3_led1", an7583_phy3_led1),
+	PINCTRL_FUNC_DESC("phy4_led1", an7583_phy4_led1),
+};
+
+static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
+	PINCTRL_CONF_DESC(2, REG_GPIO_L_PU, BIT(0)),
+	PINCTRL_CONF_DESC(3, REG_GPIO_L_PU, BIT(1)),
+	PINCTRL_CONF_DESC(4, REG_GPIO_L_PU, BIT(2)),
+	PINCTRL_CONF_DESC(5, REG_GPIO_L_PU, BIT(3)),
+	PINCTRL_CONF_DESC(6, REG_GPIO_L_PU, BIT(4)),
+	PINCTRL_CONF_DESC(7, REG_GPIO_L_PU, BIT(5)),
+	PINCTRL_CONF_DESC(8, REG_GPIO_L_PU, BIT(6)),
+	PINCTRL_CONF_DESC(9, REG_GPIO_L_PU, BIT(7)),
+	PINCTRL_CONF_DESC(10, REG_GPIO_L_PU, BIT(8)),
+	PINCTRL_CONF_DESC(11, REG_GPIO_L_PU, BIT(9)),
+	PINCTRL_CONF_DESC(12, REG_GPIO_L_PU, BIT(10)),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_PU, BIT(11)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_PU, BIT(12)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_PU, BIT(13)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_PU, BIT(14)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_PU, BIT(15)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_PU, BIT(16)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_PU, BIT(17)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_PU, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(19)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_PU, BIT(20)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_PU, BIT(21)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_PU, BIT(22)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_PU, BIT(23)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_PU, BIT(24)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_PU, BIT(25)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_PU, BIT(26)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_PU, BIT(27)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_PU, BIT(28)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_PU, BIT(29)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_PU, BIT(30)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_PU, BIT(31)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_H_PU, BIT(0)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_H_PU, BIT(1)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_H_PU, BIT(2)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_H_PU, BIT(3)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_H_PU, BIT(4)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_H_PU, BIT(5)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_H_PU, BIT(6)),
+	PINCTRL_CONF_DESC(41, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(42, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
+	PINCTRL_CONF_DESC(43, REG_I2C_SDA_PU, AN7583_I2C1_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(44, REG_I2C_SDA_PU, AN7583_I2C1_SDA_PU_MASK),
+	PINCTRL_CONF_DESC(45, REG_I2C_SDA_PU, SPI_CLK_PU_MASK),
+	PINCTRL_CONF_DESC(46, REG_I2C_SDA_PU, SPI_CS0_PU_MASK),
+	PINCTRL_CONF_DESC(47, REG_I2C_SDA_PU, SPI_MOSI_PU_MASK),
+	PINCTRL_CONF_DESC(48, REG_I2C_SDA_PU, SPI_MISO_PU_MASK),
+	PINCTRL_CONF_DESC(49, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
+	PINCTRL_CONF_DESC(50, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
+	PINCTRL_CONF_DESC(51, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(52, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(53, REG_I2C_SDA_PU, AN7583_MDC_0_PU_MASK),
+	PINCTRL_CONF_DESC(54, REG_I2C_SDA_PU, AN7583_MDIO_0_PU_MASK),
+};
+
+static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
+	PINCTRL_CONF_DESC(2, REG_GPIO_L_PD, BIT(0)),
+	PINCTRL_CONF_DESC(3, REG_GPIO_L_PD, BIT(1)),
+	PINCTRL_CONF_DESC(4, REG_GPIO_L_PD, BIT(2)),
+	PINCTRL_CONF_DESC(5, REG_GPIO_L_PD, BIT(3)),
+	PINCTRL_CONF_DESC(6, REG_GPIO_L_PD, BIT(4)),
+	PINCTRL_CONF_DESC(7, REG_GPIO_L_PD, BIT(5)),
+	PINCTRL_CONF_DESC(8, REG_GPIO_L_PD, BIT(6)),
+	PINCTRL_CONF_DESC(9, REG_GPIO_L_PD, BIT(7)),
+	PINCTRL_CONF_DESC(10, REG_GPIO_L_PD, BIT(8)),
+	PINCTRL_CONF_DESC(11, REG_GPIO_L_PD, BIT(9)),
+	PINCTRL_CONF_DESC(12, REG_GPIO_L_PD, BIT(10)),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_PD, BIT(11)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_PD, BIT(12)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_PD, BIT(13)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_PD, BIT(14)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_PD, BIT(15)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_PD, BIT(16)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_PD, BIT(17)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_PD, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(19)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_PD, BIT(20)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_PD, BIT(21)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_PD, BIT(22)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_PD, BIT(23)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_PD, BIT(24)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_PD, BIT(25)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_PD, BIT(26)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_PD, BIT(27)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_PD, BIT(28)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_PD, BIT(29)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_PD, BIT(30)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_PD, BIT(31)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_H_PD, BIT(0)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_H_PD, BIT(1)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_H_PD, BIT(2)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_H_PD, BIT(3)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_H_PD, BIT(4)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_H_PD, BIT(5)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_H_PD, BIT(6)),
+	PINCTRL_CONF_DESC(41, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(42, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
+	PINCTRL_CONF_DESC(43, REG_I2C_SDA_PD, AN7583_I2C1_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(44, REG_I2C_SDA_PD, AN7583_I2C1_SDA_PD_MASK),
+	PINCTRL_CONF_DESC(45, REG_I2C_SDA_PD, SPI_CLK_PD_MASK),
+	PINCTRL_CONF_DESC(46, REG_I2C_SDA_PD, SPI_CS0_PD_MASK),
+	PINCTRL_CONF_DESC(47, REG_I2C_SDA_PD, SPI_MOSI_PD_MASK),
+	PINCTRL_CONF_DESC(48, REG_I2C_SDA_PD, SPI_MISO_PD_MASK),
+	PINCTRL_CONF_DESC(49, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
+	PINCTRL_CONF_DESC(50, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
+	PINCTRL_CONF_DESC(51, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(52, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(53, REG_I2C_SDA_PD, AN7583_MDC_0_PD_MASK),
+	PINCTRL_CONF_DESC(54, REG_I2C_SDA_PD, AN7583_MDIO_0_PD_MASK),
+};
+
+static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
+	PINCTRL_CONF_DESC(2, REG_GPIO_L_E2, BIT(0)),
+	PINCTRL_CONF_DESC(3, REG_GPIO_L_E2, BIT(1)),
+	PINCTRL_CONF_DESC(4, REG_GPIO_L_E2, BIT(2)),
+	PINCTRL_CONF_DESC(5, REG_GPIO_L_E2, BIT(3)),
+	PINCTRL_CONF_DESC(6, REG_GPIO_L_E2, BIT(4)),
+	PINCTRL_CONF_DESC(7, REG_GPIO_L_E2, BIT(5)),
+	PINCTRL_CONF_DESC(8, REG_GPIO_L_E2, BIT(6)),
+	PINCTRL_CONF_DESC(9, REG_GPIO_L_E2, BIT(7)),
+	PINCTRL_CONF_DESC(10, REG_GPIO_L_E2, BIT(8)),
+	PINCTRL_CONF_DESC(11, REG_GPIO_L_E2, BIT(9)),
+	PINCTRL_CONF_DESC(12, REG_GPIO_L_E2, BIT(10)),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_E2, BIT(11)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_E2, BIT(12)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_E2, BIT(13)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_E2, BIT(14)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_E2, BIT(15)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_E2, BIT(16)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_E2, BIT(17)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_E2, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(19)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_E2, BIT(20)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_E2, BIT(21)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_E2, BIT(22)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_E2, BIT(23)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_E2, BIT(24)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_E2, BIT(25)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_E2, BIT(26)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_E2, BIT(27)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_E2, BIT(28)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_E2, BIT(29)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_E2, BIT(30)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_E2, BIT(31)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_H_E2, BIT(0)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_H_E2, BIT(1)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_H_E2, BIT(2)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_H_E2, BIT(3)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_H_E2, BIT(4)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_H_E2, BIT(5)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_H_E2, BIT(6)),
+	PINCTRL_CONF_DESC(41, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(42, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
+	PINCTRL_CONF_DESC(43, REG_I2C_SDA_E2, AN7583_I2C1_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(44, REG_I2C_SDA_E2, AN7583_I2C1_SDA_E2_MASK),
+	PINCTRL_CONF_DESC(45, REG_I2C_SDA_E2, SPI_CLK_E2_MASK),
+	PINCTRL_CONF_DESC(46, REG_I2C_SDA_E2, SPI_CS0_E2_MASK),
+	PINCTRL_CONF_DESC(47, REG_I2C_SDA_E2, SPI_MOSI_E2_MASK),
+	PINCTRL_CONF_DESC(48, REG_I2C_SDA_E2, SPI_MISO_E2_MASK),
+	PINCTRL_CONF_DESC(49, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
+	PINCTRL_CONF_DESC(50, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
+	PINCTRL_CONF_DESC(51, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(52, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(53, REG_I2C_SDA_E2, AN7583_MDC_0_E2_MASK),
+	PINCTRL_CONF_DESC(54, REG_I2C_SDA_E2, AN7583_MDIO_0_E2_MASK),
+};
+
+static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
+	PINCTRL_CONF_DESC(2, REG_GPIO_L_E4, BIT(0)),
+	PINCTRL_CONF_DESC(3, REG_GPIO_L_E4, BIT(1)),
+	PINCTRL_CONF_DESC(4, REG_GPIO_L_E4, BIT(2)),
+	PINCTRL_CONF_DESC(5, REG_GPIO_L_E4, BIT(3)),
+	PINCTRL_CONF_DESC(6, REG_GPIO_L_E4, BIT(4)),
+	PINCTRL_CONF_DESC(7, REG_GPIO_L_E4, BIT(5)),
+	PINCTRL_CONF_DESC(8, REG_GPIO_L_E4, BIT(6)),
+	PINCTRL_CONF_DESC(9, REG_GPIO_L_E4, BIT(7)),
+	PINCTRL_CONF_DESC(10, REG_GPIO_L_E4, BIT(8)),
+	PINCTRL_CONF_DESC(11, REG_GPIO_L_E4, BIT(9)),
+	PINCTRL_CONF_DESC(12, REG_GPIO_L_E4, BIT(10)),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_E4, BIT(11)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_E4, BIT(12)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_E4, BIT(13)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_E4, BIT(14)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_E4, BIT(15)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_E4, BIT(16)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_E4, BIT(17)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_E4, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(19)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_E4, BIT(20)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_E4, BIT(21)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_E4, BIT(22)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_E4, BIT(23)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_E4, BIT(24)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_E4, BIT(25)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_E4, BIT(26)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_E4, BIT(27)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_E4, BIT(28)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_E4, BIT(29)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_E4, BIT(30)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_E4, BIT(31)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_H_E4, BIT(0)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_H_E4, BIT(1)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_H_E4, BIT(2)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_H_E4, BIT(3)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_H_E4, BIT(4)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_H_E4, BIT(5)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_H_E4, BIT(6)),
+	PINCTRL_CONF_DESC(41, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(42, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
+	PINCTRL_CONF_DESC(43, REG_I2C_SDA_E4, AN7583_I2C1_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(44, REG_I2C_SDA_E4, AN7583_I2C1_SDA_E4_MASK),
+	PINCTRL_CONF_DESC(45, REG_I2C_SDA_E4, SPI_CLK_E4_MASK),
+	PINCTRL_CONF_DESC(46, REG_I2C_SDA_E4, SPI_CS0_E4_MASK),
+	PINCTRL_CONF_DESC(47, REG_I2C_SDA_E4, SPI_MOSI_E4_MASK),
+	PINCTRL_CONF_DESC(48, REG_I2C_SDA_E4, SPI_MISO_E4_MASK),
+	PINCTRL_CONF_DESC(49, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
+	PINCTRL_CONF_DESC(50, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
+	PINCTRL_CONF_DESC(51, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(52, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(53, REG_I2C_SDA_E4, AN7583_MDC_0_E4_MASK),
+	PINCTRL_CONF_DESC(54, REG_I2C_SDA_E4, AN7583_MDIO_0_E4_MASK),
+};
+
+static const struct airoha_pinctrl_conf an7583_pinctrl_pcie_rst_od_conf[] = {
+	PINCTRL_CONF_DESC(51, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(52, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
+};
+
+static const struct airoha_pinctrl_match_data an7583_pinctrl_match_data = {
+	.pins = an7583_pinctrl_pins,
+	.num_pins = ARRAY_SIZE(an7583_pinctrl_pins),
+	.grps = an7583_pinctrl_groups,
+	.num_grps = ARRAY_SIZE(an7583_pinctrl_groups),
+	.funcs = an7583_pinctrl_funcs,
+	.num_funcs = ARRAY_SIZE(an7583_pinctrl_funcs),
+	.confs_info = {
+		[AIROHA_PINCTRL_CONFS_PULLUP] = {
+			.confs = an7583_pinctrl_pullup_conf,
+			.num_confs = ARRAY_SIZE(an7583_pinctrl_pullup_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_PULLDOWN] = {
+			.confs = an7583_pinctrl_pulldown_conf,
+			.num_confs = ARRAY_SIZE(an7583_pinctrl_pulldown_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
+			.confs = an7583_pinctrl_drive_e2_conf,
+			.num_confs = ARRAY_SIZE(an7583_pinctrl_drive_e2_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
+			.confs = an7583_pinctrl_drive_e4_conf,
+			.num_confs = ARRAY_SIZE(an7583_pinctrl_drive_e4_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_PCIE_RST_OD] = {
+			.confs = an7583_pinctrl_pcie_rst_od_conf,
+			.num_confs = ARRAY_SIZE(an7583_pinctrl_pcie_rst_od_conf),
+		},
+	},
+};
+
+static const struct of_device_id airoha_pinctrl_of_match[] = {
+	{ .compatible = "airoha,an7583-pinctrl", .data = &an7583_pinctrl_match_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, airoha_pinctrl_of_match);
+
+static struct platform_driver airoha_pinctrl_driver = {
+	.probe = airoha_pinctrl_probe,
+	.driver = {
+		.name = "pinctrl-airoha-an7583",
+		.of_match_table = airoha_pinctrl_of_match,
+	},
+};
+module_platform_driver(airoha_pinctrl_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
+MODULE_AUTHOR("Benjamin Larsson <benjamin.larsson@genexis.eu>");
+MODULE_AUTHOR("Markus Gothe <markus.gothe@genexis.eu>");
+MODULE_DESCRIPTION("Pinctrl driver for Airoha AN7583 SoC");
-- 
2.53.0


