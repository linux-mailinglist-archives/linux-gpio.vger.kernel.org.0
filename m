Return-Path: <linux-gpio+bounces-38614-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CdsHLPElMmrDvgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38614-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:43:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A48D696789
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:43:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=JLV11IBN;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38614-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38614-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7529A31D97B7
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 04:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E450D31B82B;
	Wed, 17 Jun 2026 04:37:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023121.outbound.protection.outlook.com [40.107.159.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0AE31A807;
	Wed, 17 Jun 2026 04:37:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671059; cv=fail; b=CA9hUU08U1jRQavizZSYAaSKuqfBWgLqCa9sdKQM+/8uk5S16pDJBKPj6VE/VgpWRIdrfSqobPlYSotHiWAHEYcF6H+biOBnMuvvsNxOxUMNi+pb5TQQNxbs/eSZjpGpAfpSVnUZtqlPaAA6gPtsHJhGFC0CUcIn0B8HgksIXlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671059; c=relaxed/simple;
	bh=bHWT4kit8S55Be7fHoCC0rpSyzOJZ+kVaojRuh3BBOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DquRd0XjjqZz6L0syu4QzO+VP1pqkRQt6Bg/eyf2x8njAjqkHyVHqZBuh0u2brwWrbj6+aWuOSM/pelcwKm1YpcxwxlUaB4oIXoAmJrBUoIu33JYlTA1y3DDKwlGrDkFggYtESQ1PIcZILQMkY4jdpaXBzh6XEG+Tyo6+MG0XI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=JLV11IBN; arc=fail smtp.client-ip=40.107.159.121
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcSqJ/hZ7MxKw55h+GL6/AIJvHwDcER3UXH59FChgECWwXeFhoPhJSbBvWYljJqKHVwxy+4OFlLpGg05LHKLHJRE/xY03j9uAlTwRpWguG0kNvPRWha7s3N3VstNp3Rjc5A1zGszHU8qH+TIBsVA1FzfsrZ0zjoPtzEi7lsP2ircg9UCbApHlp4QyY6SJe0s74CtCTZTs0iQZlC1CRoKe/1SVNqh8p1T/GUEBgsTtb4xBOQUGGogi//8TqPn9/zlaU1aMPl66FsoBDeuNiU9SqJ3yMy/7NxJjakiZIfD3n7n/I6NhZc2Se242FZ/5iH6H3cYSvLk8JQZ6nauVZwD6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jm6ygMX8R8yh4P12lg7I0hU5YmvVHA64BmVBOhvlHVk=;
 b=QyKic1MP9v8SvlhWQLff14QWDiUQoy4rQwYyGoOpSh3gUOVcDGY74Xie8I3Ml0y10yczpymMEN9Ho1FwteLdPBS2cvb+PSL+Ldbqk7tjMgrt/S3dKfLK7+o/8xmz1Kb2jO4B3Fq8pGC38XaB60AQulT2+37Ne6shXYzZ+5Qs1H+KeVW3dOYDAJtNCMF4PMKmjcv59/sPI4dnv5FIB0fRIMSRlWqDlttnC4WuiZOwu/RaI9QVYf1ZdC6TEhjf6S6bWf7AyxyWqabzdjIcNjlF7F6Np7WUSglssYG9d/Gcja/FZaESXBvowNR6BE9SmyeYpVkJnC4YwyIYHcJDUPHqsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jm6ygMX8R8yh4P12lg7I0hU5YmvVHA64BmVBOhvlHVk=;
 b=JLV11IBNt2ARv1AJtirjgF04YuulYASI41FgItvz+fMRnxW1Q/m+ZFh7GTq3INSa9dR7fWYQ/7vprUPJeiNz40AIy+1IE4s4m7J7+XiVGQBtVzxZXioxMiYQO6ran+/I/Lt9m0a6CRWHiXLH9DbYY6vMmtT/0VQZULJOFZXkP15X/mfDf6rKgIywoxT1DKSO1TBF0uCxSXGzKLuHg+qXv52CkEutBaxxeeKgaom28o0bC/Hc/4hb9gHPtpUD4g5oTasAb4H7xNFFxgbjPiRBybnbeVLLf5RSeUtR/4YNmn/bP1pTMVAPr66smpDbBH0Ukc+h+8mnTwNUAJArXIxTgA==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV2PR08MB10384.eurprd08.prod.outlook.com (2603:10a6:150:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 04:37:16 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Wed, 17 Jun 2026
 04:37:16 +0000
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
Subject: [PATCH v4 11/14] pinctrl: airoha: an7583: add support for pon_alt pinmux
Date: Wed, 17 Jun 2026 07:36:51 +0300
Message-ID: <20260617043654.2790253-12-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::11) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV2PR08MB10384:EE_
X-MS-Office365-Filtering-Correlation-Id: a1942ae1-8744-43a8-e5b3-08decc2a1c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ThAwsMroa/LH3AAsd3gg0u2zvVLKUbRmte0Uq9OKvWcgGQYlGVD/+iL2YvRofsTrHTI8D+vIAYWc2LzuCCQNnvVSDjuRVMV2q8wi5Q72xYt52a4pIDgfJ0113s+B8SfwT6b2VU6UU5/56zkamrqk7TMNoSG213Qt1A30q2aI9Jt0yu3GPCeedZ9mxiY5LKzlaBBo0eQCJ83+j4QiJ2bQLpcrcEmIdlhh4VJHZinNMXiFq2CmkXmxD540RDmYT0/lQ3n7b5E9urDHlnJ46BpZ5tFf4ZoM4aKEIGEBf+OyIudZoG/c06WIVKxW7admOGCWwJIsJodih7dNalAtk9W1QX/aT6KIMW3/fI/8UQPJx2fYRmskK06BqTYcBzsoz3ZppdCN9ZSiKoKGOQWsz7+gG7Mxv+7a55bF+9vYNqTl1cbJSAhGmG2zqEsk/OET6ir6Zv19OI3GGIluO0N5eImlL14FVhgD03wc26AGVPKDFbIrX/+M+Arki9nHEaXxrCxis1XHggF1Q4dXeUSE+8he8WHTCYbYkVPBKU7+NgLTqxxsNZbYcOg4Yos0wZEjOdIE3wqtE4fasBKnhJ9hWXS2ELBqBmP2HB1F/yUFY3YcJtjX99IRi9jlJdz3Q7d/PCGrcUmO1rzo8QOULoySfVMOW+poqKBM9aZJ1w6RLDpLYQy1XrmHoC06w3GYZRxbazHRTvtrpX3J2c7xZSdQRHUbET3rvi6YA4vfi16Kd77NR5+Pn2vfPwUkubJjcMq3w5c0hdb0LEG1H1ByPAfbX4hUvg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EGfoGnQId2xQ6yFLzKHKJdSDcSs4w9FqTfkRYf4F0dcO2a1iVaRJSR7KBp53?=
 =?us-ascii?Q?7To123krmazypWhMH/TOL/9E6zRUgvuY7rxVfMyIfkI1rVxHssLE53lj21u6?=
 =?us-ascii?Q?1coF14c/7CuaQ8OrvyHGT3Gw4ahEct4n0uDQ48WZTdbE/jYOoO9u4PDRktCg?=
 =?us-ascii?Q?DzeXOU/C/XgnR7pBGSUpoSvAWlNdNpOFqcwwyGO2qETT2c+Hp1H+ATt1KeOR?=
 =?us-ascii?Q?/K6tQY9bS0Fs9hCgU+218EbKteal3S9yqiLC/8dKIRuCIw4fUEo1CvvdbiPn?=
 =?us-ascii?Q?izpniCYK1G2nNkohI0790cgmLwp/7W+ub+zTfeukVyrrpgj+Wt6E3DLDtLji?=
 =?us-ascii?Q?2f7YKgQlQNGAvfoNMUa1MvvXOJqcfFE/+5zkEt7UESFy4faXS3++47ow+7ov?=
 =?us-ascii?Q?07sNERernmIK9z65E/rMOK5KavIsDSyeOuKRky82xF+0txHZumHx14N3b1hz?=
 =?us-ascii?Q?9B5YoBnxJfivNwkghX+2fI781xIhmPjUZTd7vkiywxhBAcbbDouBMCfPKL8i?=
 =?us-ascii?Q?NAqLbD3BWMCdvD+VOKrP991LkVuqp/Ww0iE5fj3A2gzbB4YziFS59HzuKumF?=
 =?us-ascii?Q?Igzz+QbTrIuXdjWM1jyImcq6PXP3QWk82F1rqj77cpYZF96PJnCCAScjrbil?=
 =?us-ascii?Q?xYabcm4PKd/2+dfKxx9jGl+6ZnoJO+uvlYy4/rWV132QP9c+RH10xDMEp4Tv?=
 =?us-ascii?Q?qeTZasV5K8aryhx2JXhBC21/y4eTW/pybS7hyFUvdWVSmVvnPeAFObBkvOAs?=
 =?us-ascii?Q?aGNfFAaD3Zr0/WLWOxhy9SgB/3rd2RDwtYx3EumLskrh/A2QztkjvpahqndV?=
 =?us-ascii?Q?Fb6FlGiW8i5zLCV8plQcnQrAkoaO/TOLk6p20bwU3zqldvDEvZzXWgU2VHV1?=
 =?us-ascii?Q?gAQVbe5LF4gVBispCmuoovMN+wJSz8egqhrMCROncKUekaydpP0HCxy4aclj?=
 =?us-ascii?Q?Olr8n5KYUmh0pCb+kVVlA1Xnw4exBtlh0qyKxb+yDbOjt//RcDnrmZX39Aou?=
 =?us-ascii?Q?oyNpJG4xhvWCA+AjNK0mdsSljaeUKEo1m8dZdwtRXEwMtJbgrSA+CHbRlf50?=
 =?us-ascii?Q?qeFdnGPL8UpbUEPNtxiEadDI/j4lfqCO10m6FqgilksUBcJfv1e83VcGzzA3?=
 =?us-ascii?Q?Lr27c/7Y54NsHaUzhD9FRVlsgEytsF9HFNFXZI0xxOBGhYogntOyAPCeQqGI?=
 =?us-ascii?Q?y5djPxM9YGX9yld9usjDhz+tTb5T+Iz86O3iczX9KBBRTZnDk+5INx+Ylozk?=
 =?us-ascii?Q?wFmtJMEdy74nlEhfODUpaWtLRJE9uyPCV1O47QKVlsiB8c7uV6ClE432EPhv?=
 =?us-ascii?Q?OEheReCNGq/S1XWPUPAMg2VNj0JwB0q5wd/IHVzWaA65hbDn313U2Fd1mjqr?=
 =?us-ascii?Q?5Autf0T7QAYgLNrqpPnorE43F0m7X+MuHRFQLypZUFrFuTwrT/EfRHu/hQix?=
 =?us-ascii?Q?3K3vHCc/yZ3U4fvNm4IrxVhRaH3EgGwfJqQkj1abXfPgn+GeZk331X+VFrKv?=
 =?us-ascii?Q?2Zhwx30g1BBvQAvqEt+f063NCYVIRogRovkjpUxDY2KJWBscUWvvIlrz2omR?=
 =?us-ascii?Q?MJMq1PZFsvBjOspf3y777+NRL/Dr1cum95eTOT2zPmPpF1MWZ6IglNv9tbvL?=
 =?us-ascii?Q?UUIxOVhA9KhmxEP7uzVE94gT9432xCuHGWzzIHSmalm9ZGgWoHQlyYkA6Vts?=
 =?us-ascii?Q?rKMxekdiYJm0YY6rrsMX5m1BtpEVIaKtJL5uOGDkg39CCzo4FjoyhLuAyV+h?=
 =?us-ascii?Q?Ni2FOyArx8zyD8uRss8IXQlqiMRDb9w=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a1942ae1-8744-43a8-e5b3-08decc2a1c21
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 04:37:16.7061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PG4g2FJqLiYnHlixt98QS+pxeQ8DXs9rrqWl7sgXlqlxE+QTCelrORW2w7hqonm4bA4fvTCXj2nJp4Hzz0H8DgYpcJKrb118B/BEY0dvFic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB10384
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
	TAGGED_FROM(0.00)[bounces-38614-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A48D696789

add support for pon pin function for pon_alt pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 959eed06fead..6e1746ac0ce5 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -38,6 +38,7 @@
 #define GPIO_SPI_CS1_MODE_MASK			BIT(0)
 
 #define REG_GPIO_PON_MODE			0x021c
+#define GPIO_PON_ALT_MODE_MASK			BIT(27)
 #define MDIO_0_GPIO_MODE_MASK			BIT(26)
 #define MDC_0_GPIO_MODE_MASK			BIT(25)
 #define UART_RXD_GPIO_MODE_MASK			BIT(24)
@@ -391,6 +392,7 @@ static struct pinctrl_pin_desc pinctrl_pins[] = {
 };
 
 static const int pon_pins[] = { 15, 16, 17, 18, 19, 20 };
+static const int pon_alt_pins[] = { 36, 37, 38, 39, 40 };
 static const int pon_tod_1pps_pins[] = { 32 };
 static const int gsw_tod_1pps_pins[] = { 32 };
 static const int sipo_pins[] = { 34, 35 };
@@ -479,6 +481,7 @@ static const int pcie_reset1_pins[] = { 52 };
 
 static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", pon),
+	PINCTRL_PIN_GROUP("pon_alt", pon_alt),
 	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
 	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
 	PINCTRL_PIN_GROUP("sipo", sipo),
@@ -562,7 +565,7 @@ static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pcie_reset1", pcie_reset1),
 };
 
-static const char *const pon_groups[] = { "pon" };
+static const char *const pon_groups[] = { "pon", "pon_alt" };
 static const char *const tod_1pps_groups[] = {
 	"pon_tod_1pps", "gsw_tod_1pps"
 };
@@ -629,10 +632,19 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
-			GPIO_PON_MODE_MASK,
+			GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
 			GPIO_PON_MODE_MASK
 		},
 		.regmap_size = 1,
+	}, {
+		.name = "pon_alt",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
+			GPIO_PON_ALT_MODE_MASK
+		},
+		.regmap_size = 1,
 	},
 };
 
-- 
2.53.0


