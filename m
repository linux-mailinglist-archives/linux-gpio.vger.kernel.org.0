Return-Path: <linux-gpio+bounces-36807-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DyaErJIBWp0UAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36807-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:59:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE85053D7B1
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 761A53025700
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 03:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CD13A9624;
	Thu, 14 May 2026 03:58:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2118.outbound.protection.partner.outlook.cn [139.219.17.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F823A6F1C;
	Thu, 14 May 2026 03:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731111; cv=fail; b=eQBAAbwddpR9/4dJOTSNBiHoLsj6S/wS/HavxZpaTexH6V+XNBxVeQEEP7681Hl3TUWMlLSjsPnbOJDQAOlMaGgz3hJs6nZUjbppQvtf3ov5oVzfXvgQBgLDv/pWMF+ehjRJsZQXzikXWKg7EwbnDgazeDZYPr/Jj88SWJ1CBe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731111; c=relaxed/simple;
	bh=DMFSGvmzjB22HGsQklKUpqo0BMrqae3id+XHJzI5/Yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UJNtVEE3KV/mTpGKo3mFCy+wYDlf4/GAfmyYC5nP6a5TB4K+s+Z4f76LtGe8/NZS5vd00vY50F+78f+58AUg7Nk3WoyXcflZ28mQN30JGJzMSVwGEN25hfk0m5SLYKbvtM5BHAIBMyvIL2YAamHuUhCAy3uCx1yaVVXDxeeIAOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.17.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fc9qapATVSNDBMc1tqepb+Frp+yEbM0WyrBl/zqGtuZlfR6ztfDra4OQ8PcNEHXICjy0fDPLhb0xRLcHkZXi3eaByVfjg4RugjA/F5KeMH66A9qPGWc9gd9Q5fBwRhpF6xsQ0WIN5nSJt6cje0MseYIP3/nXHZTMmOm0gJYPQJj4eRAzPOEM/+rrtERA7Dp0XjxGmda6j8e+FFI5WnVTYnisJHhCvFauZxmMK4BsWQeT7mYGyyDVTFPnxzFfKz73bZZ981oKGZeF3mz5mqmO7X2zFYA4mx25VeHlqev0C/pjdreuvDdesio9iaOlmyDrjvjdAHqRRs/6CIc0BvWQqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjFmoGtxp1015bXAb5lhGlLRx5FGNB5vqi4MAYCLRIU=;
 b=OSjkvsb0ztRFHEKp3La38AZ6/Q9uUrdv6lwygfohUXnJu8/e20mn7U0DuC0pNr7jtRgRkdyOzKz8iRFvETHNk79rCsHGIuzlRSI73wNb7V5PLD55QrHZ8btvuXx9r3uJizYmnkA0FxGHqymscRz1panYmuWxvl4pU3DxmGze3lhsk3vgTC1o63Sce4H9NqW0Sms/7qas18hC0TJoX8idNADaJGrCPWedsXpSm/Hu6ghLfd0r5xHp+Qp4C03N9Loq+RYqS2/qULkFer9jX5rt8CgOSfiMFLOqAdCqkC8gICevbzi6eqN+CfBPClhuexgvs1JRw4CjOOFH5q5AXXnycw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0515.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 03:43:31 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.20.9818.023; Thu, 14 May 2026 03:43:31 +0000
From: thomas <thomas_lin@lecomputing.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	hoan@os.amperecomputing.com,
	linusw@kernel.org,
	brgl@kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org,
	broonie@kernel.org
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	lucas_hao@lecomputing.com,
	puntar_liu@lecomputing.com,
	jihua_tao@lecomputing.com,
	stan_xu@lecomputing.com,
	lumin_liu@lecomputing.com,
	notics_zhang@lecomputing.com,
	braden_zhang@lecomputing.com,
	harold_wu@lecomputing.com,
	will_zhang@lecomputing.com,
	aurora_jiang@lecomputing.com,
	ryen_lin@lecomputing.com,
	andy_jiang@lecomputing.com,
	thomas <thomas_lin@lecomputing.com>
Subject: [PATCH 1/3] Add ACPI ID "LECA0001" for LECARC SoCs that use the DesignWare GPIO controller with V1 register offsets.
Date: Thu, 14 May 2026 11:43:15 +0800
Message-ID: <20260514034319.3507315-2-thomas_lin@lecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
References: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0067.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::34) To BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0707:EE_|BJSPR01MB0515:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c181c39-b1ca-44df-d4d3-08deb16af79d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	BzUH7+S24b00rRuHKWqiF8hn9SHm6+LfZFDpQxpWKma5DJ0DQtugj/JMc1fcOu5NeDR5ilGrUNvzVr2anWUPOqFctBz62u96PtPXBOigZGM0vUeBSnQWsh2+8ct3eFV80Hx8R11TJDJ7lKhlgww5kkr2yk8m8n2Ohi0QzAq9JZUj1INwab1oGyQzz5cq9oup/4r+DUYEEDg+9+R1WJlSb9H+GzA36XFfSJyz+hBczlVlMMZNodtptGi1RHOtYhKdxtpX8W1txHfnNaWwc5wSl+aEvpg9G2SBul9mROVhhlSiZWxpaKAJPI9Kq3RZJ9advgXP0Hx/d7JvPZWaVJic882CXPZU7scT5DWAsU33j+9nqqgY9ErBoa5r7MUP+oQODu89/FkALV++2qlV4OcG+2qXltg7Mv75kbOu5mPrlPX4B6UaLI+8eG1IOLpkqXCivWXF1AXUD7xoKgphHzhyU7+SZ5R5Kbm/80yRVarw6DwTTMF+8G8hnslSN0JimYPtgtTFD1qqihDhW0+2WNgFA+yjDXJhx9jNQpDOfOCq0WerYM57ox/yRCVCDlPA1Cwv4wEdgw1XKxnclCpBwQJzAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ol1+C2oB/CvDTiAxua6kOV+XccAT3n8jinkd3RTPpp1DAL1UKjLepY79Gh3u?=
 =?us-ascii?Q?KbQ4nYRZdSgHlv+WTCcXthlCynzgkP/TIbh4q5ZCXcM1jZSw4+sDOANBv79+?=
 =?us-ascii?Q?cVwwAF/f45ZNGCW1NaL/Ghcnmc6c4SbK0sA3lmE4iQZ6+2j4BXG5ZyBVgYDd?=
 =?us-ascii?Q?4kOaAgs6emZYFpGhO8btWxux4REjGy5KhZpxUdGm0mtIuOdZWszsEOSKRk6h?=
 =?us-ascii?Q?3FQwJiAKP1p8yRiuNhwa+vdPy+P9NnnnVdnj8+qRf3j1izaGRQkMdDpVYZJ3?=
 =?us-ascii?Q?sbUCm0hRw0xHz6UYgMYiXmW7P4T4XXMyD8cTRTVrZm8GvG95Xxhgx44h1m6P?=
 =?us-ascii?Q?p+Ymv40+hUYtNY8yjW0kSgjAX/1pwwoL2VrpnVxAY1mHmoLXR4odqZTe1dP4?=
 =?us-ascii?Q?OUKET4B3On1/m/E6L4rZuY1jLVfK8ErlxyLX8SrGFc9Kud38G/YcW8q9VZxS?=
 =?us-ascii?Q?P9snjUq0CeiyVpGEl8jAveseyFQRS6J8lMLqNnAA5D5tY/MCCEcDgZVqSqqr?=
 =?us-ascii?Q?AUg/HHBoYvn9J2pq24DIrgPWUnk5M9N6wJGXY8voe/brruy8K6pZ5xU/DgA8?=
 =?us-ascii?Q?nqg94gmYaQ9eVRKx++1Gy5g75kyzhdS9uX2CUDqZCca/MLRWZxPyTbJJ0wjj?=
 =?us-ascii?Q?Qc5Yh7yguTB226lUaZ0xzV+gelklsib6srw301RaqsvOBtvBIFKx5K+FKBLc?=
 =?us-ascii?Q?boJTaL6pK05+uXrROFGCBZgjSf/mSNmLfhwBT/R1Iea1pvHMYYnoFG3cMSYz?=
 =?us-ascii?Q?TcOJU/7RVl7h626MALTt0qYQBKltwE5vknSUT1hgR2fCQLFLt1kAL+8lzYND?=
 =?us-ascii?Q?eP0qSmMsTV41aqeurD5kou6G5enAnHw3kGJj9o4XZVHcKsD1XMBOBj3zkOaj?=
 =?us-ascii?Q?cWDSvF1QJ67g1MZH/4BDWBpKN1sJNLH6ovqTlaYq0jqw7cCXZItvvWifIcfc?=
 =?us-ascii?Q?RGMyexcEY6G2No98psfHfRK0GPhMTIwlTX98IYR5h43BwOlWbzTGFE2aQDTf?=
 =?us-ascii?Q?9okg76e/41ojB0l5MbHUVVrMeuBylX7JgCKMvcO/QmtGIeRdKA/TVFA1aocd?=
 =?us-ascii?Q?gWyaD6IyqP4+OU6ATNVRVgN79j4MudNZfNHWmGU9y5G5Pz/CByarM5YaXoBx?=
 =?us-ascii?Q?6ouhisaVTmDywEhFdq0HqaESzJJT2o8O3yPCeuPRcSkSdtvaMFu3K0NnU7vy?=
 =?us-ascii?Q?qQKlOJLp/5fUIIxUlpRGgsEVCFaeD7duBDoFF3spVjzVyqNUJ3i83h5qs5iy?=
 =?us-ascii?Q?f2ZzRsOiM3Wrr2g36vuQHq4VT9IatZrAal9PqQ4gS5dhHi/G/72VYx2Fx83V?=
 =?us-ascii?Q?otgjotCzzbKp6OUBhmryqatgO/ZuCx0fIbOpgSmt+Rmq2lZpYgPKSO17jnLC?=
 =?us-ascii?Q?VTbZ1lq3K3W6g8PHnu1Dx+3uy5TgKZKeldpHrt7x3vVPLa/Vttg/Fz8KX1PW?=
 =?us-ascii?Q?KoYGIAoOgJubH7xf2JWWPz8oVMrlhzzgv5QYoFRyI53QpJzhnLeuBhTakont?=
 =?us-ascii?Q?MQpwbwFtFvqa98MB1UTdLfp9LLJDPqGNYrHYKGOLsx8fMwlfbQuGkWnLz2n2?=
 =?us-ascii?Q?Yvbu/mzd7MiFsGPLgpCNaS9KW2fb+qrMHDfbfSLp7pRXgpPcoGkGoktYCPwy?=
 =?us-ascii?Q?biEJBsn/eZRMo8rQBF+iO/pqzclTcP69ImhjBOFuBggEXJfG2r7tYTO7tjZu?=
 =?us-ascii?Q?ei/UxTC5TFbQa1IW9KdNEG9M25auWCh/ELCJToegxSE5+ctAhJrrqVdfJcZy?=
 =?us-ascii?Q?n8+y8hIMLKemTOsuLuHNGLJQl6U+2fs=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c181c39-b1ca-44df-d4d3-08deb16af79d
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 03:43:31.4387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwDq9q7FqWQUv2k1F7LkyDimCdVyHKsZsDFFot3U61K04Pvl8U7YrzVqc4P5D2zMS6YuhP7KIXK5TcBcG+hiow82Qw3LjHLrEgLkGrpIUY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0515
X-Rspamd-Queue-Id: DE85053D7B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[lecomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-36807-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lecomputing.com:email,lecomputing.com:mid]
X-Rspamd-Action: no action

Signed-off-by: thomas <thomas_lin@lecomputing.com>
---
 drivers/gpio/gpio-dwapb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 15cebc8b5d66..c1f3d83a67c1 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -694,6 +694,7 @@ static const struct acpi_device_id dwapb_acpi_match[] = {
 	{"APMC0D07", GPIO_REG_OFFSET_V1},
 	{"APMC0D81", GPIO_REG_OFFSET_V2},
 	{"FUJI200A", GPIO_REG_OFFSET_V1},
+	{"LECA0001", GPIO_REG_OFFSET_V1},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dwapb_acpi_match);
-- 
2.43.0


