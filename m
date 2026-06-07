Return-Path: <linux-gpio+bounces-38038-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VzNdEem4JGrS+gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38038-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:18:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DD064E913
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:18:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=OoK704P+;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38038-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38038-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F462301D039
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 00:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FB723BD17;
	Sun,  7 Jun 2026 00:17:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62E8233933;
	Sun,  7 Jun 2026 00:17:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780791438; cv=fail; b=g3gasiqNbfHPMQa1ETaIAnmUdRCI+hN3ZziVjseRiDeLl/2wSpM7zhhwGoNHocnpu/FklxT7txCSgIBSU5LotHUeWyOi/36UXP0MGzDiQQzyhQ06nZJ6eKf6D9CmPIj/03mnyM9WYrtmuc2THp33EUpy/kBK+BfrgY9dsQ3azMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780791438; c=relaxed/simple;
	bh=qPjnGdFWzJltqEPlJrVHe112XPYlWJQ0b/t1sEkAiGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QeiKhHDlZKd7svImfoeqEsRjgercPVd7nAG5CC+7f1dcebVcBTUhuZMFD6gq7p4Tkp+cEkWcf0IlFai6Aa6R/dtk+vbuvMcIzW0aFsplIuyVYX/AdP2zOAJb5iNjvGsGuIX2xEINFtCLeLdohwadz3Leul0G4hNMp42Bi88yWSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=OoK704P+; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fM5TNVdQZE6hR73cVVeZ7DtydUNRbHt7HULInYBxIg3xSv2j0orJuEZkubPLqZ5+hoygAXNlD8bf96Ua+VtbvqAqKVgWP5v6nHtu0jvhPig0+JPyIN03iEDGOVDY46Ol/QFh267hVlPKTR+YN4SCzLbE2CHuUGkedkojBExYgRDoXpO0f0SXWP3rorsde3lZQ7ZgrE37KeCxy5UI9mig2FgLctbKhmwl3zTC0cGtp9bh2gkUFN/Xt1UhkXVQeJ//P35ew38thcSvZguDsm0vNOwrh6OPPebWVb9tuO7jBnq8lgvrGLDbyFaw1t4oidhIY8q08YVs7Jun8jdzeO9b4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVl7qtt/yqlCvitZM8hlPGBCH6582+BTLitnDe3e1z4=;
 b=LxaPsXFSaU2udHjRT1v/TVJuvmTQasj5i/1gOM+AyPktuIHSn3ldPZZv3lnGOBbVNXkuoMRRfagK2w6mAO8b8HQ8xU6aTxWZIFfUvxzYI/nSuCfVMoPB/J1aLfW8WG3bPWhELyW3qolcIOu6NduRk8TErHh32CjYSXBsSJjcoEGmtWmZXb+twSxOKRIiud6TTbx5eL0NsJGlfhEbqWXAvanktOUxxs7+eJeD8wcegeAEMANeMx9LXKu22oIF54+PzpDOR4+bMI5Sh9MmEzh34brpIOQfmQAEyNqScAiXJ26jQWpLJiTUAcQI5Ky4ZWwrKebSfbxkRwycrvJ4UpI9vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVl7qtt/yqlCvitZM8hlPGBCH6582+BTLitnDe3e1z4=;
 b=OoK704P+36MS4A1mEemqPuHsNSMeoBV9sJ5FuWS2LtvvFaRu8nQttvOMmi2tvQhBQzEUgRbcMzPcGycYwWN3fVg0BGHh8CZMUlIYXtEzC8H7B3TsaQLx247LU2GJF+miyqZvSxhyMkxPun1fpe9wjK7wIw2qFWKj15vTqwjWAPCVg3fYA6epfo6ZtqaPt584welt5ClwNdytDEuKzz982PouuGjS4WQBkKle+PU2j3ZV4vSMSJx0gNLQVcCGznvK6naEXmizXV2oZ9H4r4VGSGN5IBRmDSMg5/fPDCMymtHGe+n2+Y72rqO2gdu2tDHmN1ce9jSSF17K6LfmqogL8Q==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:09 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:09 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Markus Gothe <markus.gothe@genexis.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 05/18] pinctrl: airoha: an7581: fix incorrect led mapping in phy4_led1 pin function
Date: Sun,  7 Jun 2026 03:16:41 +0300
Message-ID: <20260607001654.1439480-6-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBFE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::319) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|MRWPR08MB11707:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da1495b-bcfc-4225-e2e8-08dec42a1d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	FsQ+vTVAJ8qkughFBm6YZBdljCBX9EoPX+Uoa+lilnOhdG7R+eKPGHc1b+Vd40C9s7q8QjnmfBP/gM+CHH8xMLpcoTztafGfw6y3sYQqz0aVOHQckTcGygPV9Hx56FkeWZcZr+flE1U5EzKpPPRs7SYMQoRgU7gEwFQjH8bOU9VCngKkaRNvp2HnFN+Wcbqpw8rvpdPQvd+efkepL4G9oAFVFl2hthTYq4voNPNLF1h894lWvJ+CWJSHnmqAM/BDX2pY8fCK/lsVInj+QKkSPI2RMxADTiN3SZnp9//9IdF86jAGLvcAfEkC1w03WwpGyXR/8SH5D7akwaF+lVpuFZfELMx61bfwdPEnJ/fwGwHPbNy4tBiSeO0XaVQ85X/yhCaz5zacLV6VAuNDAz/Vji0sfIjHXRH8IUxoXIHpwse7Xg8138i1QzcC7+LIiyqb47bt+c8Y4+Q0w4V1zfsEI8PfUNGduzhz1tZR14lMXJ6q/0SsXcdYldK94YHlySV7FSeVHKZzZGevn07+HQKVfXCrfeWfNusw4bKtkJUql8JpPS9DHI61lpH2iYh1TYToABXw1snfSY41pONWC5vkOy4cqZQtv+MrmdhiNx91O/WceRjZ4C0HZu0hnKlomw+cyU/6Poid9TbkrCsrDa7TFZ2NLVCqZrbla0+G1Pc61NtRXdI6oC09CpN2YB4mx8O8kn2TidG6E5cxdN2YU6VY2FpsvYdBPShyKAocyhEMgWYBRD6Uznkq7QHI8IXMbbrMoRNII9o2TCHcaeqhFPom+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t6b+DUZ/Mt/wcX6l8ZcltbAMy2MmqQUGhdUFi0ZMDSEpyeiQqwNeTWZmqlGV?=
 =?us-ascii?Q?lIqlf1H4w+qBEUrtmTp/8GDsKJxq+Wi/tMZmcUQODzZ7cvjI4lGerg/tH2cI?=
 =?us-ascii?Q?nmDaDm5a1TTlNb679LI4zX6tlOvQ0cYnMFx+2T5Q/a1987XLg0rinR53usBH?=
 =?us-ascii?Q?T7SFg1JZrt5fxdjgS75boylm5XkvOTQQr4WNUQlrBlqbYaybAtHH6pVn7fiG?=
 =?us-ascii?Q?Uvic8ZcQOPPPhD4+8WX2WmZwYSBjjA6s6YcjHVsYmB1yQB0x5d+8egXyMA/n?=
 =?us-ascii?Q?P1/WDxqKVR36AdXAUWTdKZojENgNeSPCGZJSaaAq1FGtmks+rgW+lnpjt1YV?=
 =?us-ascii?Q?izfVsskBDc/CpxFWNq9ZsA0bSqndZvcPZozCMHcIGA8xNU5NHPmK8YjCFge/?=
 =?us-ascii?Q?1y2bAJRl+r1P3GRXtFG8YxwISUfHPmWFPYW80/Ojs2+9Lpu+6sZd6v3quQTP?=
 =?us-ascii?Q?Gbm7C/STV9mg2cYWi0V+tUpjv+tjJ78Bm3D+NshNOOrUrUuljIEAcXsWJwNF?=
 =?us-ascii?Q?rtgPufAUm8pfIH4AeGNxwo2GJrOO5oPXYrAkca81+R3WY0EyKVhpyTR2rA1e?=
 =?us-ascii?Q?K75zr6iO1s1U2OWJbPbR3Nh8EjNpDN9W9tJmaAyg73+SnItpWpo4wMS5Hnqx?=
 =?us-ascii?Q?3BnaLzKEwyH3pZHD5F70hXs2FYs3sXUc4raEAQPYnF676blH9LCIXHDlJCBs?=
 =?us-ascii?Q?a1fyBmwV41JSiNkZjx7nF5gK3Uc4hJB4Bct3euURsYTJIjwF7ab9at5eO2Qc?=
 =?us-ascii?Q?w2C/zUB4nir5GXf8I422pr52JFjCsdMH6Kd40TmfTiBgBFWV0RLDZzr8c7Rn?=
 =?us-ascii?Q?Xbw9blMkthTx4q9auQvRJB82EJ2+wYS8Ze2XFuuglGmoas0xkkyLOf1QTTrY?=
 =?us-ascii?Q?Subq4/RDv2nW41z2U7j6AY5/in/Heoi6NLggUUAvb1cjf69cMWfVFw52oWwQ?=
 =?us-ascii?Q?y44+/3WSj/fpbLhYuXzevBWeTlTotq5RvT/wZ95eDtpflvXC6HrgxLkOUGsZ?=
 =?us-ascii?Q?LCxCMWFSyReMHflLT7r2dCYArATlumVf5eRxQZ7WXrGQ4Mv+tcmDjyYzok5G?=
 =?us-ascii?Q?4Lf6kEvD1C4FdlJ6bRDskQQeXTHFJdr1vxsFK94mHXd/JSD8uagTOSIJgBKw?=
 =?us-ascii?Q?DwcDB3oiwUxIwtErFUyIlkZNRqshWmzInBlt1sGGQcKE9OTFslKUKXfQYv7L?=
 =?us-ascii?Q?TGwkJJeQhnoe1Q4Tiew7ERoPQbyLfwBTIQUpUyEkg6OkvST7BG702sSkYi/5?=
 =?us-ascii?Q?OgKgxgvBCmfKtEK1kjucdZ71l1oNMml3ZAyO1PfGVk5kbypDTWYz32ZGZKZk?=
 =?us-ascii?Q?lbDL41wOXAiOAzGWB6ms7UJ1vdVToiy/8q8S2pG7c0bFBkCp7Kj3O65wEvD0?=
 =?us-ascii?Q?Av97e1SUQEVb4O9CL2HfX3YzSBETPx/Wq/2+Hg2U35mB65d3YrfYUQH3SVyP?=
 =?us-ascii?Q?sQBWYM67kvKek7uY6Ck4gkEvyS/gdnJP26fAJY0VdSyM9DiMCSNChFQujEaW?=
 =?us-ascii?Q?pkNV9kRXW2JvkjA0AGoLl5Ef8KbEBpqfXshL/QMV+J2eglNbRjFkqfXKtt69?=
 =?us-ascii?Q?UBDDz4XwtDt+nODhxp+MUO8I/oX/bNqaqTi9la8m0281Hw+fY5bGzdq4p2aA?=
 =?us-ascii?Q?aQgVPhuZzD1c6WcmfQfNVEAhVu+vy2/GtnnvIEAMe9mYYg+O+4hc1OaOHNQH?=
 =?us-ascii?Q?K4G2u7zSTTfegUUiki+C2h4oWVTLJF1ZboIqnS5x1UqHA5B7cUqg2WXsody7?=
 =?us-ascii?Q?BS10GhFBm5opHPAvAOkWGIPVLseB68w=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da1495b-bcfc-4225-e2e8-08dec42a1d89
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:09.7647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNrZokJyYXha/TS5nGIM6MmUsZ+XtayxYCWOm+4s8URItcsCemyLkdkcBITFWKFYl/jdssaTkf8yxR0zEpkGEj9SFEMu2miKJ9pimDyzL1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38038-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:sean.wang@kernel.org,m:lorenzo@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ansuelsmth@gmail.com,m:brgl@kernel.org,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:srherobrine20@gmail.com,m:markus.gothe@genexis.eu,m:mikhail.kshevetskiy@iopsys.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03DD064E913

phy4_led1 pin function maps led incorrectly. It uses the same map as
phy3_led1. PHY{X} should map to LAN{N}_PHY_LED_MAP(X-1).

Fixes: 579839c9548c ("pinctrl: airoha: convert PHY LED GPIO to macro")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 34eef79d058f..9497f5110f61 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1622,13 +1622,13 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 
 static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
 static const struct airoha_pinctrl_func_group an7583_phy1_led0_func_group[] = {
-- 
2.53.0


