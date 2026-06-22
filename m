Return-Path: <linux-gpio+bounces-38796-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MgSMNB4dOWo1nAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38796-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:31:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D976AF17B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:31:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=WZsUGHL+;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38796-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38796-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DCDB53010D38
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8A7292918;
	Mon, 22 Jun 2026 11:31:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023084.outbound.protection.outlook.com [40.107.159.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DA227A107;
	Mon, 22 Jun 2026 11:31:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127867; cv=fail; b=DGtaEYZ6s1CO9HGd6UbRMCOg4zmUB2dA2yxbpo0tIPcetupYzJQ6FCMJj3sQ0cIcqqEAWQ0PZom70NBlpiqcA0ny3MY2sAyR9xvaOcXHqQZs99eTh2uq5rh4yF0xs3TTliQzdcFlB5KND7HusrdUDl1n5ecN1oi1LGJdjG0OseI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127867; c=relaxed/simple;
	bh=+uZzcKhkgflxCqUXnp7SnMJ62oL+ApfSf26GpDjOhW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ErR1LzuzhyV+/r5/KcrEm+64ZGARMYn+jCN+N9H+T0lrsa8Z9Mx1tEHFQ/9MRDblpHIcJTS4jYABPNptJu1NwmUKyN+8qkuy2DRbCaKYTS67MqLOFMu/HLn4T2D5Is3GE6xlvX8yf5EtktyQp1dNM+EgaZu25U1VQc69dzUFTOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=WZsUGHL+; arc=fail smtp.client-ip=40.107.159.84
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghMwC/UxFSznPcTrAZKyi/I1ryNAwVYydzYGeTm5yp2Sc/I5h2AKz203nIyp00VhX6YnxX6HwC3Ire3KdpAS3u0Ph2AizoYVh37Jvp2plTTjbDr82NHRxDLH8LK3me0WOYE2P6AR8Rw3/FryRU3utC1hWx48HIIo0UBxrWVgXcTzPCoHdhV/uuylh501YZ4KH+c471hmMq71L70NnHRCwZDWg4QE+zHXhQQf+LtjozyLJ7uwLuOP61LmvJPgEp/cx0leFsRpSMU1g5wvrJczFXX3fxVl6nszGC7M7hmcK62q/6uu2YZiJDLRiL8dx2KvLQGkDlsTUeMyxFD7k3rREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNi+GsoOsNw50hrNAivj+lXJkMyX/U3s5zITOYPjwbU=;
 b=TPMQMyKJL2eMn8m6i7JCJVVyhoziWLfR18CkiuT+dG6W/xbzDELAJPb0zehDCu5FiMuII08RT8y46iCGflc8UnIV2LUkZJOOJjiUjqzOnaf+eHhiAE/AYcOOIo2ousRaXfs7AWznNSnSVpV9r3deGIYQm3OlQ8Bgq6kfJqwsPLxGY9+iTqAPgOOpriGEvJQAUF0K9PjbUut1D2MC9Vr2o31iO+Pe9fOlAK7ZM4Sext9xc0hSL1s8cldTxonLOoXXPPoW/WwN/PQT67t4tzT7SJXFUoGrL+JRQIF8XuuXqnVKMM3o8piQM3e+PAqrSuZB7+YxAoYq3aTYowAvwbnYfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNi+GsoOsNw50hrNAivj+lXJkMyX/U3s5zITOYPjwbU=;
 b=WZsUGHL+9LNSvkcFxwlnnmxGJSOk4rVa80a1i8+7Q0oWj/3w2kwrnzqew3e6s977w1oPeJB7vR5olFOlTeRVLBvChNVUoq0Q45WThejx8uEbmex6zruk+1nyb20Owh3fSHUHKWiEVaht9n3rTylmssF0xLl0BVRmtS/MGhbIbS2xV83Yq+c/q0PEV4obe6ZbVk6/L+Hj9S2cBXRF2IxdQAGSLa/0KckX+Y3fmW+joZSBq597ceLnzc9w3ODmwJGXefNdD39j59IZYbkKJR3uoAAJOSABQzABvqvdRTx67kXzRBsDQCXJOLqnw0hzjCsZrCU53uzW+Mj9I96Fqm5trg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6115.eurprd08.prod.outlook.com (2603:10a6:20b:2df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 11:30:58 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Mon, 22 Jun 2026
 11:30:58 +0000
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
Subject: [PATCH v5 03/16] pinctrl: airoha: an7583: there is no mux to enable the second i2c bus
Date: Mon, 22 Jun 2026 14:30:33 +0300
Message-ID: <20260622113046.3619139-4-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM9PR08MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0c9917-c202-4a3c-a984-08ded051bb1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sSIYhiDN+x9ns4bZTbghqse+QwW7nEx957kUyI/Aa76Dds8uWbcugev+6VaEBeJ8KxndaduOieB/SfTrZXUK23PvdL3KkYysXXEQxvIpCACvslQ+rqKWN1h4j7ryspBMCdCU9wFGiczVAFRAvMAIxbpA9KnA2l6Ior6csxwzUmaKqjBJ3NznUSBTUZFlG5I5IAAOEHZfvVJCSdmesMGWhUQJtGD5UW9r7a5J8F1ov5EsgqeqhbGLUh+B+CzxLpiasyVNkejM2DF0pOzk/BedCEOxgKt7eAo29kUIDPCAN1k6yjhnOXFly8hqkrvVutJoIcs3Vd3Uw9vWsFAcPXpCMGheOSDpNpZoybAcE4cH/oTyhEJU0qCVA0KaRYkk2Iil6qpjZrwBKG/z5tFiZMOc/hoyeDcePgBaXqc7DykLw9xu1Ld8Mn/SHcJAQoIWbKn3c4Ebh5qxmU94TebyoIyUO18WREmmW+pLbaFMxfDIA23duDeKwVhFg739BmzBGvSk0YgS+F1RqeQFpK/3BHncbHynsvJi0Vwadix39jqhPeJa1WdRLS9/+tqHJmPSkfhKo6v+ekdyL3MLZZVsEFsr1ANcDFOBEMRm3dAxrKir3McNBGbeZz0t5p4AwJ92gPX1sX0Fvh7QAZOeytUMOvPK8kAnDBxQhLboJ3HiOHVjQUVt42FXUab5gcCVZCRTillrONaVY4irgDxuOWY403A0/iA2RJOs+SF6pGyBVu2lvRyYkvo6sixObvbdu5rMO1BG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QpuLUmlSljnz2/7SaTsqi6dOgHnekJYkOZ6uLVA7AYcln6P5kDpov4sVhROW?=
 =?us-ascii?Q?/sGjrLhULIAk5D/K5d0pQudGcMWoNLPvdEG55loEqTQzn6r/phGY5/PyxqvP?=
 =?us-ascii?Q?MmqVbzY+GGxmFyKRF4Y+NUt5UPvDqv85X/YOQhwWDUQrKCuGKkzOewf5ZGLf?=
 =?us-ascii?Q?YEWkfJ/MEyh4WRfJ/zehrJY74RG/qZR2/fsH5RC7PmdV9Y721EP/7kkKX/WS?=
 =?us-ascii?Q?LWpLXfqbXeB52J1Xa3FXUz4HNuaheHHb1PO3xD4JAmdXDv4aq/UtSQTKo5LC?=
 =?us-ascii?Q?2USA3ERk/oN2t/yteBALxMJU3pK/ryE9hJIDCjK1JQN4Vks6o4fmWPe+T7t7?=
 =?us-ascii?Q?BDv4JN6G78bi1ryI/gWbasIPGe7Xvt7pc0P8ze5OYzGOsq8Icog7/4CA0gIz?=
 =?us-ascii?Q?1O/+nC6XHhPwxUNY/5lZmQtNZCBMkfQL6WVaJBEVHlg2ADZxbqLp7uZxIyfD?=
 =?us-ascii?Q?7eHcui5pv9vpUbggaEldn66OYr6l8HsknMzXoLE3Dl8CWfXwl9JKV1JbAAbP?=
 =?us-ascii?Q?ONXYLhmjhBvQhJBh6/wrLX797caenOEdx7kNZQ8M9IMR9HfVT7rrx2JaKBmy?=
 =?us-ascii?Q?win4zV/vUMVr+kQ0bRe+XUkmhUYebiK5oebnHsWyRgvbCb1fdgyoqibFs8bN?=
 =?us-ascii?Q?czfEt73pVd4CS7mKWr1HbsEY5zKnenG8ejNCpMgztbGuXQVMJhLHSNhZXM4x?=
 =?us-ascii?Q?CvbEqmzS5tFcuJ82zK93lbBHslNovreHCf8cTdPMiUbjJ0Maa1z/lPx0tr4v?=
 =?us-ascii?Q?mtBPq0hEoy0lrjvcm75DmmsoFkuZrlt1buD5npn9rImUvf5Jm4ak77MHMLZ+?=
 =?us-ascii?Q?ddbSirGThD4e0ipfgsI7+quIVelQOlO+V03gKpsj8IBHno1S3/fWcfLwpIVj?=
 =?us-ascii?Q?izRdQws7kSC63dGsAgQtefs2gR5nPRpQ1s1PXQnH3hfY35YxUu6sk3p7xd1u?=
 =?us-ascii?Q?qPo5ag/FrleIElS0/K7pWuKs7dG7+HOGiIu8/+ffMg/3MGfDyflOusOPt6cp?=
 =?us-ascii?Q?MCYjM0NxP0QbjU6Lmba2Nl77j/pfT+opVVetxJrIE8E08D9FU8I84stWnOCs?=
 =?us-ascii?Q?wPJJfgaVVSngnWyXpxTNS0js/YUK0Qv1DLC02LjF/R9AIIsiCS7XqqhU2zcn?=
 =?us-ascii?Q?g1lR6StgMdV0+rnDzSAN46g7oJVB+7rmXpwp9lwintPhKy1DB/19yjA+CPYl?=
 =?us-ascii?Q?qjv66CtQXwRpu9KJUfh9Iwudl2fvsQ52wryItlzXI9drASHvOYR9oofSAk6W?=
 =?us-ascii?Q?k2ywgpD0Er8+9mPJ755Ee+cDtu+PUWaBgPvtIXfQbXaSkSEmfUJ7hcKm/RSf?=
 =?us-ascii?Q?tynhNQ+LMdlqpx3XhOMRzdTlFuyLlgOqnYV0EId7oqEIZwyu64D2iHdwUUTt?=
 =?us-ascii?Q?/n177EJMFRx5wtsRXEkIQ8Ccl5GyOpYAIsw5zmiyCPQmdYWsbSPj1dAX5uJS?=
 =?us-ascii?Q?hn2Ck4VfI1keEGbdWyegGvv/2KVVklzR6TmCj+RwU9BJzeXs692hvnOcmtPv?=
 =?us-ascii?Q?pQAfCCsuU0sF/vtVYMP+3kBe7mBj31SqpQrEcAzrRauY6ttRN52FlzvE1cZB?=
 =?us-ascii?Q?63FRhd7FKLf0G5K7EPceMqqRZUNN0IKiMgGjl91TCb3mhyUJF5flD07ogaW5?=
 =?us-ascii?Q?YfPwPbWVwpLKEm33PYIik9BiB9IRyL9BA/ZNwuIc8H1PRaVV4EqcHETO3H96?=
 =?us-ascii?Q?7xYVPv3e9VIBRUOoGB4ZIS0rYSBAmvfyj9Bvu88zjV0XQPi52RYZEcPez06j?=
 =?us-ascii?Q?fm+wn6p6/eWZq51syLiUyWHTxZKMChU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0c9917-c202-4a3c-a984-08ded051bb1a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 11:30:58.5493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Ih+IbqQsdIkMZYqSbG3SJFUOvm7mVyiqkldlEDOQIfIhZZfzeEcWZqSRB/rFzDHULXQz9eJ5qMqaG/cwMDTcuI1sIETGV6ibmDQy5R1NGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38796-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10D976AF17B

In the AN7583 case there is no mux bit to enable the second i2c bus.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 4076bd0261d1..cad56ac3c061 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -1821,7 +1821,6 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("sipo", sipo),
 	PINCTRL_FUNC_DESC("mdio", an7583_mdio),
 	PINCTRL_FUNC_DESC("uart", uart),
-	PINCTRL_FUNC_DESC("i2c", i2c),
 	PINCTRL_FUNC_DESC("jtag", jtag),
 	PINCTRL_FUNC_DESC("pcm", pcm),
 	PINCTRL_FUNC_DESC("spi", spi),
-- 
2.53.0


