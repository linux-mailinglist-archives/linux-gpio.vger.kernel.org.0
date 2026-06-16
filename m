Return-Path: <linux-gpio+bounces-38551-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qNjjL5bpMGqaYgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38551-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:13:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A56568C688
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:13:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=eU1VDEZ2;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38551-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38551-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97F7D3035F38
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE973DA7D4;
	Tue, 16 Jun 2026 06:11:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021101.outbound.protection.outlook.com [40.107.130.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A0F3DB322;
	Tue, 16 Jun 2026 06:11:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590269; cv=fail; b=oruQRIp/GDiybPlxC4Ky4eD7h+2mXTVHlgCa54RDIrWRZO/2qJPyiwpLdLuPeoyrQ7noAJzwo7j4UcJRxp6yRJTi/cj2TmahBS4SYLeMTXg+zwA8znkMzk3wuejVtl2xFDasJMHfkYNvixA/cOb1HhQq+JP0N8vlitJtzOozTPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590269; c=relaxed/simple;
	bh=bHWT4kit8S55Be7fHoCC0rpSyzOJZ+kVaojRuh3BBOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ugxp8n3ajFs4Y1KwbHoVcxza+lrrl6di5XMsyF7b0bJfgmvXX18OUqzvn02eOFRPSkv8mzNvwGiyOpOjUTsR3or5zy9zsEynr/xI0CKL8mWL7szE5AFl4pwKpmhGvllof7cVpbqOviFRpeean+flqz8ZoutgHKhphfBDfRLtHHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=eU1VDEZ2; arc=fail smtp.client-ip=40.107.130.101
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=az7/TvMS7olBoBgVjW20hNN1vrjxb/Kgydtp54L3LO1VpxSUP8fqzqeZRkGUbcqHo9wmcNJIAkM3p1Iik1fdXa0qBsjBEmUqp7zIN87cMQ8jAODzSt8ijx8rT5sx1AMmGgYslo/pkQIk1zf1vPCFTXujG2VJjw6b++ANu32j+VCR4gssfCTuUZSRN+y4VIi1HRXe0M7zAb+vAHqaA26yKGakf2xOH1/ohRV1rzxGf4KEbX5rv8TCh/ldXPYidf9xvjnptivVdG7nXdEshsdfkjhtRnM4S1YvsexMoy4fEatgLdELeTwwIoo8GdhlPZ879qBESqLHPbUOoHJl9optmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jm6ygMX8R8yh4P12lg7I0hU5YmvVHA64BmVBOhvlHVk=;
 b=Xh8z+9tnc18TyxFx7ZAGGjCHhVVfe5zTmbh8gxTqSmcxAqKdDnoRVpXbKCglpOQMDwVwg17eTAjEepSVVxLkvi9KCYnaqwy5zfHdHDtEAYP+7/l9HBDdhnMJcQxDOxv77yOK1BVCkJmDLWyclKlXkuyYJdeEmmlDe52X93OXNBjzCpVq7DoYfh9puSPE5qYtSBmIpLWr6qbHzjDhwN/HJG/rczy0amyYTn8cGQRx6xvi2Q/JdxxJ1l3dKpsO8mK+TGvIDzIfpKyc8257NZoKWDZ411fL80u+CnBweagxq6YMS+3JEDrT9ReI23DHhh7GpCOxqJjfA2PtWd85jwarXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jm6ygMX8R8yh4P12lg7I0hU5YmvVHA64BmVBOhvlHVk=;
 b=eU1VDEZ2VYP0TXUtoD3lRX3hqjB3vmDA/M3sAuXpFzJQz5w+Lv6ftcBZBJ+mapvNTv8Kib28osGgc9QfTRdQMVWgRaYPz3herE1HBdKdk10yLFiXlsbDrbzp+3l9paKY1OzXx9bBrFPVgTf/kya+GTRpnD7eG7Tp9beDsJ81L280vYFZ6boG6BC+Ep4M2h/0YARb/mQfyNqvjS5dFUPs7enOtfh38GSwyFzJOZE/CMNvcrZVHMxs3pULTXiVHvCbbP+DU7Hk3DgpNr2ld4ywcGd7zGBm2tFL9j2kQCfe1UEZz/lZpgOhmK2L3a7Ng7+V0LhIX0Z8VvlFpvECehFMVw==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6206.eurprd08.prod.outlook.com (2603:10a6:102:ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:10:54 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 06:10:54 +0000
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
Subject: [PATCH v3 11/13] pinctrl: airoha: an7583: add support for pon_alt pinmux
Date: Tue, 16 Jun 2026 09:10:27 +0300
Message-ID: <20260616061029.2630777-12-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616061029.2630777-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260616061029.2630777-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF000167ED.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::672) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: 31954d02-a12f-443b-df53-08decb6e062c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	oUQ+GHxU0WrTSwTT87hlOuy6wDXtIz/m4Xo0Nq5NztPPUkDe8MQLoLqVfSlZxv3eEoIA4BbAzmc8kiCXiQVAOIKiXiHaE5pUJogSj0bao3faHBKwN35DnBGUZ8NNlGrIIrJf9jzrpMLmTFqrxfgAF1TuWazimmSMr2flMRyk9VzI5TIpKDQBjZMlddimBfxRR8qF2iOfeovOfbxAeSnX9XGwxAfBMsJu7J/iZWDZN8Kq2Nq7Hz378fnI6739gpEGnKcevKOA7Ic5RUDdNAf/w9Y81WbT1lqLD0I9sAgbhNFtKSTVaY7Wn39tYfONpp0EuHDXOHFerScBjTd/2yEyPHMtFgorT1nKkpd3qyt7lnOAuz6npPDreiFRGGFZDHTlLTxJQhGnpPExmiEtKLNt9H3YVZ4/YOLKrq2NsWG+yWdvl+qEyzd5Sp2pL3OWZtAUpBDL2wnTNcVtLaEAbQkQRX2EnwFvVlZ3n4SDKn62sJj6+kemIrKuVGUUfl/UlA3fSnmCkzvLQ0+CQmhxhnsaIqo7X4WTxVPnGnIIesutKYrMt1TaIGCU/FlgXZ7vJooDcf/bGBdWpCJJ69A3LNlmlrCi6hbYaajOOBdAm5bnBqxMqgBTYilNN5U5hBARG2qU3XAyPlWERwBY3KG/uUCgBwvJh2mZhu+CyQ1RU9Sg5nOLIKHwN64OYUhdE7RX/5lpwl8D8gn2kfqFhtmC/6/naJCZdxAN9TBYbytZIgVu2U49rFNVLueB2ebwnMmpEf/5WMjWdjrzC9rJnd53pLKwEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YMhdt9tdRfeTtrqjIVSqNvxi8bl2pGwPPD4WXmK0OMrCbaQGKyQQzh9Beuf3?=
 =?us-ascii?Q?wHY2Q6PkCf4F3xpuK9PFALgCPwA5AkSpwX60bNKwbGLjTjXO3CBR6HsRqqxL?=
 =?us-ascii?Q?rSvrNr1a8qe+QseN+bVElDbeSimsvENMK9XBCZMNeCOwPuls3QtaAUQFmghy?=
 =?us-ascii?Q?8I6aiGPHVcEvEFLD8hIstHU2eaUjLiRHFRNkPHSOeEmd/+4Xw3Cr/iFLxNp0?=
 =?us-ascii?Q?D75huLR3pAe67LNAWFPofG2aXca8wuUR+Xl1P5q1jiOgWqWwRaTmR/+Nv9CK?=
 =?us-ascii?Q?5Cxt/y2iogZHBIwkThmgicMni5MMa/hOzhOf8kfP4mT8cCF6pCoDbSpm6ccE?=
 =?us-ascii?Q?Kc/pbLQO/aBEijz7Jk2Cgv5leuuuOA/QPyJpnrwF557VNXxkz7K9oSKO+2Bi?=
 =?us-ascii?Q?Q83yXE3m1WvQ2OyM0CQUCJIHJ20nXyULJie7Er0ntquKnOpkFVu8HFTRS7IT?=
 =?us-ascii?Q?0hBd9wgFY98PwQJ/WC8J0BYh7cQT0K8inj4zcy33MtqLtwjfTZ+GSOHL6EA+?=
 =?us-ascii?Q?uOeoO380sl1/Ve445by5DLoNS+AJb7PFHV+aYftwLhPEkDlSBsrUZygoeVDW?=
 =?us-ascii?Q?9HsuwsCtibjux9OKTGTbAX1XigsE0r194/c6zUYePQnci6HREUFPRgnfrHIl?=
 =?us-ascii?Q?82aeTs1n74NUY2I2pPKd+1jADYE6Szp6fQfbqWT5x5JLoCNiMM9YDjXXWxMQ?=
 =?us-ascii?Q?6NwUdSBvt4yZg9/aQoBCb1cnin+oASmORnylSqpjy5ttmtrlSb/HemjE27gb?=
 =?us-ascii?Q?BPzNlClbgpS7Dmpq1UsHS9SzpYmQoR/nm5WS9xxbhV7locEG5MJSwgcAH31F?=
 =?us-ascii?Q?MeuLexEONO/N5TVvCu+6kOl0Uj/40r1PpsNuc962lP+4xMd346LFQ/E9bpd/?=
 =?us-ascii?Q?IO9Pws4H8y5UL6m3mq6hTtFXLjMptR36lJ7bLtNoNUHGF0f7M0wooksBTmxi?=
 =?us-ascii?Q?ng89OhvtZXNaiDydZoU4jKUGi5kgmqVVBZNwnQbBCISosOGyUy7OZBLTk1h2?=
 =?us-ascii?Q?8yKt4chdsXNP8N+xUwO6B6yekzmH2XDs4X2I5LcP2epQ5g6eOmUkwXn8rTBF?=
 =?us-ascii?Q?Ym+a41go7L6VqLTmZvh7jGN9zM+QRxo5pSzKlCNbfd5SydoZJaa77FsbmTlh?=
 =?us-ascii?Q?xf5mOyQAxhTprLyElUalYoZXZSGcC4ftl0QGoN+4rlH1+Ov7t2PpnUf3WCM5?=
 =?us-ascii?Q?ZYkZu1nh1Db+O2zI2fGSTjWdlx4HkNjxmVJDEtQvR9UJ8xUdzAESFZELjUWD?=
 =?us-ascii?Q?k9E163nCCbhgAGhPxRemzXO1FOIW4TCNUZEBdNY7vV9vR+pSDP4CZXvrBIcX?=
 =?us-ascii?Q?K6TuTko8MScmcewXLDap4qfHLLuser0/u85Oh6uKGFX+kPEQ1/X9NaRmg00z?=
 =?us-ascii?Q?XBZa9hSYXbEYJpqg7s5bdN0rG1Vc2DCG3Eez9bukxdAAeuP0ykesxsHoc6zK?=
 =?us-ascii?Q?JunyVZTWz2ZOeoaDTO4S25I6NCXZqNV3di0WPwbc3lKrOa/+L9G9oobZ+jY7?=
 =?us-ascii?Q?DUp81HRDnFe9x6nMhBF2NXhHCZR4PYHiRbFwF27xQtMYBb71qVatVD2z+wGw?=
 =?us-ascii?Q?GTy11PuTnzq4GtTIyyfhb4+rhDJbywmOGS+akUizJp9D+4uvdkL7vqHGl+eQ?=
 =?us-ascii?Q?qyswcqK87xxCWI7VYNdpIl4RDmK/FkQvSvDaLAwK9GRZKy5KGTBTQHOnXNyg?=
 =?us-ascii?Q?35HTn2wW0oikOetAJt+jBeqoGl0mbzdIfFv9l2yySMMFqD86Zj4IuJvjVtw3?=
 =?us-ascii?Q?PbOuHnog8/uIW+Ada4EV25spGxCJ4WA=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 31954d02-a12f-443b-df53-08decb6e062c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:10:54.6160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzBWsH1v0NvfhtB8GxkUP/zh95xmh0HL38TIC8waFoWhAK4d8HIMyyKnfpar4LDm4/zL8+Dmrm95/GBB0SFTvho3egm3loOQt4rpomG1SdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6206
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38551-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A56568C688

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


