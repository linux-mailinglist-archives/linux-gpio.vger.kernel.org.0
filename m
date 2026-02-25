Return-Path: <linux-gpio+bounces-32195-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGHcIfOLn2nYcgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32195-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 00:55:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E8A19F2AD
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 00:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A058A3034603
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 23:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0BA387568;
	Wed, 25 Feb 2026 23:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lvtmmF/c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011027.outbound.protection.outlook.com [52.101.65.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF37387376;
	Wed, 25 Feb 2026 23:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772063727; cv=fail; b=jRMcEGYDeB/pFmeMi9k6fov+i5Hm3X9mHf4XY6AEjizRTHM4NLSItquWUlC06SLlykljwxfkq8B2TpCPhY/anWLs2mdevED/etLdc8BbdEncvUSco/Apc6zcZugI8WJ/22he+HnOTmtUHKFagC3MRSgOX4jruLzIoaXrETObX4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772063727; c=relaxed/simple;
	bh=btWGdYkurNrw/wh5Mh8lqi8ZQLnjnCtGc+UyuUrAVzk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=g+mILM5PGABC/pMzM6+PF/pdD7LS2T1+l8BZdxNV5IC6x1TW/ql8WCpa79wBmGArU/lcSpHQHO9cVDSj9zByMtgsei4RO63cjB8nRVQRe3NB8yhWUNxUYPUlxB6Vs4/X7m9ScxfJbNUiXcaZrqefpimwa5ned5vc/36guXNp8Iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lvtmmF/c; arc=fail smtp.client-ip=52.101.65.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUh+3yHbO1sPNxI/jkzwEfXXHxB97NCGNWAIg/0+q/zLXix82RRsYSY2qPJLeSiJp0O6mUMKUmKK3xqtUJbigxEkxsR2r0TpAvEjLrbjTvqxeJx+wKj0Ni2PIMkfDWGMY0CzIvngWvKNBjHQK+v20xjMFDHQExzRAEdVrTLQ/RsJYf6XI0FO/F7FjAjKLaY5I7toA5ndIYxSMYbeU0FXGBI48RB/xNC5xTf+5vy6ZDnjlpZQwOZzIpe8oYELp5NKzX5/KJKPv8d0oWq1wV9r/tKTUlpPkpe0UqRJ6oAICQz1VjnRJAVUN8UNJHULuIuBEi4lSsxEJ8kicjPRjaxBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JH9RI7yi1dIyfNy+zFiYnbvdB4n3FyTSp1rg4J3sGI=;
 b=eXYLQeFGDTLiwQMwHhnqwUXWs7cKQCTJ7rm6Jpy8XOPuXvyZCtEDK8IIRiEDp7nvCPxJZr7u9AProukKxBSdAuhlif3Z+BysG3FDZL0NLYxd+dJOD8a7L3X2pkF01BqUisR9bEHkTI8OxqSWZmIKipMHE1hQ5if2oNiNilTvJy2njHff4ytAggz/I8Wz7vqtYmtNImfM739CLHW6V1GtF38r9sVgVlFo+cOF7Nro3d8gOP5Mi54Y8EIN7evG/56HY7fEfv+uxVsnqPTjv1knEtMyhO79JMa/ltVupfdSU/i4AgUBiSao2reShFLk8O1lLdHLt6WMyr1m8KPJ+OWS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JH9RI7yi1dIyfNy+zFiYnbvdB4n3FyTSp1rg4J3sGI=;
 b=lvtmmF/c3jmwLjqfQl1YcKg5SqOVWnLoG2JUN7BPKkUpNwJmZjX7VwmzcYD0uyuX6STZaVkvZUreb7m1zwkRzgfw3MiBqKhVQ+XerKbbXAwo/pqR6SURvlXQ4mBBuXpPeLovzHwuU1H/m1yC9MZdDVOW3GtkN93rmrm86Ht/G9qzVTA9YeyENvkTCfjdTp7Z2gble0AvUbB+on5gZw8i5a/O8SBxUCyHe4Kew1BtGlF7PtDTIzr2n4pQ0S1d7yliOUD/McL8WxU7DurhbK58cK4E/NzIoCFr3140cVkTmlZsmIAGRF7fL3bnwcWRqaf/5AFdD2MqORg8+k8s8hlNcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8771.eurprd04.prod.outlook.com (2603:10a6:20b:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Wed, 25 Feb
 2026 23:55:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 23:55:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 25 Feb 2026 18:55:06 -0500
Subject: [PATCH v2 2/6] dt-bindings: pinctrl: Add generic pinctrl for
 board-level mux chips
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260225-pinctrl-mux-v2-2-1436a25fa454@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772063713; l=4412;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=btWGdYkurNrw/wh5Mh8lqi8ZQLnjnCtGc+UyuUrAVzk=;
 b=3pkgWEYdsQVt6UMSP+VqPDmpXBTgHnJqpad8+cAhB45zVFwyJ4ufdrpUiLyLvOWveClH+ijCi
 dePsX5x1T58DKFGfIVw7KSigZR9UUytmTEXJJkf3vuRIscT9VPHn7/k
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
X-MS-Office365-Filtering-Correlation-Id: 1c7fce30-ba97-467d-0b9e-08de74c9574b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	XwL++BVItD2Bc7kwpY8uPjdvZc4DnWa3gvQe6nXKelkWk1QJY4tZOvWoSM1JPaUDre0uqQPisEQdNu9aqA4ZPpJIJdDoY5wDLS3RKeULoLnRkhJI3tzE9a/o5nue051GBgUYDmJweDY6O1qn6r7uxeB/2FMC+pVzpTl7L1ddFlxA/wbcKdwmMaHV1n0tyTKGEG2elaMw1rnlXzh0YLkXj6yGF2e5epN9kQgQJX9PYuAi5gmqKTmubCvbX/yLW+8qDAA+o1a1bRPznK8s056o67J9Koo7dMB2fnCiAOTX2+Gi3xnRICSkhT2RAkpMe6H5rCPN/jVpubH+6wuUVh1Zark23O5MKmhQnu3Sr1Mby9SiTUKq5ZQy/Q6Idng+/T6YsnBfYIu3XuO5LI0jOPDYQ8dbhYjOm/xiGyGuel/f7P42WdWmGimLGyhtoIMkHuMwatugMHzJjSLG5ZbXWfIZqYkrjiLg6bjGJHq/o5dPUl64kqRGFZsLnrjw3tLmXRvY5B4jrLjVvShHMVgscZishXaXsqZWDrPBVxBiADMEcAQIAHDNxd56RdNeAuLDIjOHn2HgjFrz2Z+UWY+ryvgAkqDklFdC+n0/QoH+0zp4EEF/2jYXBrG2lAUCx1V+qJIjBhheiUExi9SnIN7E8P/jg//SR5sr6SrzSxbR91JgoDMnZmnZOUJlUQ6TLoEqO3XlInvIiJU5dU3yWMvVRhg105biDLeSCDv9pTE40L4ueSfvf7Y2SYqbFhsjtMpJpb3VsE+IJt39zFoYVqAtS7P/VDajqVLqGN7+4pAcjMz4i1+ITB1dKhtTBtzBkMRvqqyt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTVJZU9OZ3NCV01xaFJRQ0xXTFNVOVZCRXUzaEZDTFJ1cnJEeDBKamZDa2VI?=
 =?utf-8?B?OEI3aXdlbmpFQ0dpYThKM3FIWGlqUkhlUnFPdVkrcVpVYUlxcGxwdWVURVFO?=
 =?utf-8?B?L2FBdlRQQTlUdTcrbWIvdm8xY2VBNk5maU9Wd3lxSkZob3pvRU9pdnlTT3o0?=
 =?utf-8?B?RGRYdXBiVTJkb1lrMUJURDduYUVHUkNKZHVFeTJxeFpKOWt6cm1uSmN4Vmtk?=
 =?utf-8?B?ZkVORStITnFydDJnL29BR2RIL0tKWS9uNXhjUi9uS3RIdnpzVW5Yc2M1Vm8z?=
 =?utf-8?B?TXFCY2pWSDR5VEJRTGZqaE1qdVJqaHdZdVBKWFh1eGxkdCthcStqSGpCRnRC?=
 =?utf-8?B?VFB4dnhqV0Rpc0lCWjdzZU5UYzhtVnFVUTFtMTR0OHE0OXNESU9ocFJjQ01N?=
 =?utf-8?B?RmlZZ2xCbHA3MWlFUmVGZFZBeXVlVzlKRXEvZ3YyRDduOTI1U2dZYlNRZGlK?=
 =?utf-8?B?V29iWENJQS8zMUY4U1BxR2VPSUJHOTh3SHNyM1pEdUptMFIva2pieGNVWkgv?=
 =?utf-8?B?c2RxdzJvRGJ0dGgwZkpSL0dBMmpqYXJsVDJmYlZYaGJNMVVkZ1IxM1dPKzFw?=
 =?utf-8?B?MXJZY0gwblJqdU4yWGNrNklEOG52WnlmeHh3bEMwd1V4WVFTbjRtKzlCSmI5?=
 =?utf-8?B?WnkrV3VhV09nRVN5T1NUREFqQy9RMExHTk00K3dJQkN5ZkNCcUVFUjZNeHlJ?=
 =?utf-8?B?bytEekhRNnVmb25YMVlBL3NJOUpURzZrU2VURW56RG9Xb2lzVDBVTFlhTzFZ?=
 =?utf-8?B?MVo1a3NJR01TTGZjNk4ycDhXMGk4bW5GMzJoVDk5UWtaL2Z3NGsyR3VnR29q?=
 =?utf-8?B?QVpTeGk0N21CT3c1VGJHTzl6dDVWWlQ2RVJuTktkR2JWVWlBelJDS0Z6SnVG?=
 =?utf-8?B?cFYvZ29xdFRERDV2RytrQjhTVVRQUkRPaEVEK0l3WjNPTWUxKzJlTHJ3M1VH?=
 =?utf-8?B?bU5rTHJhMVl0d2Z5aU9SOTU0a0I4bHBrckFxc2Z6SWpmT0M2cEZRQ1RSU3ZN?=
 =?utf-8?B?LzJxa2MwY0V3MFZaZzc0UGRCdG4vTC9McW9mYTNERFJhTm5EanVCR045SWJp?=
 =?utf-8?B?V3pJeU96b0JlV0pqVVZPeEtGdWRISWt2YzV0WnlGK3hpSXlNaHphRTdURTFz?=
 =?utf-8?B?bEpBZ0VFS2dTMFE3Uk9TeTNFZHhsRDR2TWkxQmpWVVFYdm9KU3MwZVk3ZjNJ?=
 =?utf-8?B?dGlreVdBUUorN1VPTmdkY2F2d3o5aWx4eWJWWVBMVEZPdENNQmlzQjJ2WGJP?=
 =?utf-8?B?TFZHRnZTMTZEeDhNdXh4dHBvNHZDK1RjR0kzcUV4c2dIbTE4azlTY2VJdGRn?=
 =?utf-8?B?aG8rTXVaQVZhOTE4U1NVOXlkSHNWdGhPbUcvanNwcmF1Y3NhTDFTOGVhSmRl?=
 =?utf-8?B?S1pxcEpFYTNqZGYzVHh6K0JmOG44WjN3UzFUL2V5Q3VXMWFkUEoxYnNrNzNw?=
 =?utf-8?B?NVJCbjVlWmI4RGpGcmhkK0YvTVJwVGxLV0FTQjU0UlErY3RmbTZUR1NjQXRx?=
 =?utf-8?B?eVpZekZ1M090UFZGQmVIa0N1YVA0ays3L1dlNForR3pnWm53Y0RoWG0rN0dl?=
 =?utf-8?B?SXJQWjIvVXNmdVYwN0l1WVJUOHU2bzcyRkRuY3FyRGZnWWY3b0VwUUtmWXg5?=
 =?utf-8?B?RUx0Qy9pSXJvaTI2Rno3WVVxelExQnloWkZ1ZzhtR3o2dWd1L0JlTXVxc0o5?=
 =?utf-8?B?T3ExZ1ZwbnpORk11SzIzaVBTVEhmQjV4eWdwbUJydURTUkdQRWpvSjQ2U3lT?=
 =?utf-8?B?VkVWMy85THo4Y2paY2VmZDI5c1ByRURQTERRTUdhOWExcUJlYUdDazhaN2dh?=
 =?utf-8?B?WUdUenZ2T1RWLzV0aytKdnRDTVBZeVdQVmd4Ym1kUkh4eHRUUTc4dU1yRkVV?=
 =?utf-8?B?MkoxUGNRYzNlajI4OFdHS3M4eVlFZWNqdnAyYlkwbFdxcG5tZlh0eGQ1NnEz?=
 =?utf-8?B?dkJJMmRLNGlIaExQNW84WksrT3hpUnVsN2ZOZXNlNnF5dmNYNHAzSXJmWmNV?=
 =?utf-8?B?aW91SlJjZHhuc0pEK0U0Nm1pNElvMUNCVXZYYVIvSlJOWXhUUk54N3J0QWpP?=
 =?utf-8?B?eXQ3SnNyMnRWVEd6eXp5Y05sV1JKa3BKWmZxZGhocVFUNlllTmtzSDk0R1VC?=
 =?utf-8?B?TjNHWDFCY2FiV3FuekN3b2hnM1h2MlRIdWhma1Jlc3FYSm1sRU9uaVBjSXo0?=
 =?utf-8?B?Y0NMWnZLWEZxVUpvaTVhQnFvVWhQTEVjQk5oRTYyRFlJYkJPd2tHbGdtTUhU?=
 =?utf-8?B?TUU4Nks3SDdTWnQvZDVjdGpxZCtoeXZvaS8xUHJOSkNDOTd3b0FudndSanRi?=
 =?utf-8?Q?TNTveH7XQi92PY3dHz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7fce30-ba97-467d-0b9e-08de74c9574b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 23:55:23.6478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWPTPa2k5eXotqtuIK3FETbeVRV0wPJp0qdCRRWOKFbAkNzVJcSjNTi4K6gO7LikqLLSEMTpJDJEjkczk6suSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8771
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32195-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 25E8A19F2AD
X-Rspamd-Action: no action

Add a generic pinctrl binding for board-level pinmux chips that are
controlled through the multiplexer subsystem.

On some boards, especially development boards, external mux chips are used
to switch SoC signals between different peripherals (e.g. MMC and UART).
The mux select lines are often driven by a GPIO expander over I2C,
as illustrated below:

	┌──────┐      ┌─────┐
	│ SOC  │      │     │    ┌───────┐
	│      │      │     │───►│ MMC   │
	│      │      │ MUX │    └───────┘
	│      ├─────►│     │    ┌───────┐
	│      │      │     │───►│ UART  │
	│      │      └─────┘    └───────┘
	│      │         ▲
	│      │    ┌────┴──────────────┐
	│ I2C  ├───►│ GPIO Expander     │
	└──────┘    └───────────────────┘

Traditionally, gpio-hog is used to configure the onboard mux at boot.
However, the GPIO expander may probe later than consumer devices such as
MMC. As a result, the MUX might not be configured when the peripheral
driver probes, leading to initialization failures or data transfer errors.

Introduce a generic pinctrl binding that models the board-level MUX as a
pin control provider and builds proper device links between the MUX, its
GPIO controller, and peripheral devices. This ensures correct probe
ordering and reliable mux configuration.

The implementation leverages the standard multiplexer subsystem, which
provides broad support for onboard mux controllers and avoids the need for
per-driver custom MUX handling.

Allow pinctrl-* pattern as node name because this pinctrl device have not
reg property.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2:
 - change descriptions for device, not for driver
 - add missed additionalProperties: false
---
 .../bindings/pinctrl/pinctrl-multiplexer.yaml      | 57 ++++++++++++++++++++++
 .../devicetree/bindings/pinctrl/pinctrl.yaml       |  2 +-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2b0385ed879b70b24ca9c39b098c3840d08d7482
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pinctrl-multiplexer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic pinctrl device for on-board MUX Chips
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  Generic pinctrl device for on-board MUX Chips, which switch SoC signals
+  between different peripherals (e.g. MMC and UART).
+
+  The MUX select lines are often driven by a I2C GPIO expander.
+
+properties:
+  compatible:
+    const: pinctrl-multiplexer
+
+patternProperties:
+  '-grp$':
+    type: object
+    additionalProperties: false
+    properties:
+      mux-states:
+        maxItems: 1
+
+    required:
+      - mux-states
+
+required:
+  - compatible
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl-mux {
+        compatible = "pinctrl-multiplexer";
+
+        uart-grp {
+            mux-states = <&mux 0>;
+        };
+
+        spi-grp {
+            mux-states = <&mux 1>;
+        };
+
+        i2c-grp {
+            mux-states = <&mux 2>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
index 290438826c507ec6725f486d18cf686aa7c35e67..20176bf3074757de30f208e69b968a6bd6125273 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
@@ -27,7 +27,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+)?$"
+    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$"
 
   "#pinctrl-cells":
     description: >

-- 
2.43.0


