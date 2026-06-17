Return-Path: <linux-gpio+bounces-38606-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y5jaLwElMmqHvgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38606-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:39:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C90696738
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:39:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=fwFR6WyW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38606-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38606-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B17EA313C2B9
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 04:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23300318EE4;
	Wed, 17 Jun 2026 04:37:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023121.outbound.protection.outlook.com [40.107.159.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD389318EDF;
	Wed, 17 Jun 2026 04:37:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671042; cv=fail; b=hqRllnDyq8jY8i5dZXBSneM+4E7G+ohM2V/hGrdFqG5jRMGO+PShq1hzeqdWGPfG0uajX/orDQQaqxtMj4Lhemv7ltOoUDA64dwDZIhMRAh2VxLjHzv4XX4XNRQDplt4uFoENTsmWZ2moATSDI2rtt/2ixwDa7j940dFu3pbNb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671042; c=relaxed/simple;
	bh=rvJoeHlaoo2V4ZnLX0anB9GBwV1dYUlgnHmaAmyqAmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U0qCPwVPN8nodVNeXC3Ez4bG+PDwCPrEWhrI37Eb8nKK8UasOk5w1sd4VWXggZFmqgwxYn8OpZHFj9TmkOdqdsgr6WnktDqkkq4oDAMxl9rYuzErA4uagqZE/1IK1ECm2iEeSq095Q6gq9318dyTr9Yu+DOEUK2xVr0t3/IupXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=fwFR6WyW; arc=fail smtp.client-ip=40.107.159.121
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSwkPO6q5P7k5zJFJLVzO9VnGPozaiCp87ZMpXZ0T2EMyioKNvCcqrcCyRybGoSTcbFL8Q0aFi6o+CCC2nuDG4Frk9UNhJFaisWUQ7rmCQe0NegewbtwB9RuRSwCY0aDuUeppZjeo5BjXiffRH0QHVzyN0wpsRSFOq+5LTRM7SdJ8eC+jI4bU5wxIiSC72AeuhGYVu/lbhKnXIMSFHMlcbZZkbX7BDFQBi8AQ/8uupUzjLkoAVJTKySgUetmTpR0M1DSf0Gq1N6+P84vCGGxgN9bYqYhnlPoZTZOimvOLpqd+kVaXeg2+RqkPtkk5lMe6d+F/UVJOvf74FAI5BYLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQEub0GnytVJCPsHNZ0OxBfajHM3AROnXugEwDgWVtI=;
 b=anYymfrw1OAu538JLMRZ8MaHrKoG82dG9+9tGeFrW97G75GTLtrJiPnRuen3/8aL3AGFHzFPRyCAhb32xElltv03tCmdbujDjJoaVVgqaWtefyz0S77bV/a6CvdQEOhTI/qRpi0DsdPfqfca8jJIAQkR0ihMgb5HyCi33ClELevgwwXvIR74PsZ9rAvrWBOKrzsAwtuaV54yLOWdAdO/aDM6/brrJCPaEEJMg5xHcGvsOdujPidVVljcg5ueLCgMYwgryVjCv+1+AN4AXlNolOdMukZCbV3Vx8Muf9RzuokDFujJ+U6H0TY9yUQGdJs9QHT7wFNtBBPHMpsC8tH8xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQEub0GnytVJCPsHNZ0OxBfajHM3AROnXugEwDgWVtI=;
 b=fwFR6WyWCzP0qOthqRITQzujGJCezIPBUy1uiMmBcfMJ2ukfzObMgK1nEkumeNvehtpz9uohY6YYmcRXOLhnt5Th/OQYp4gbmsTXHw9bbSK0rjGZusYe73BgadKgYwpzZsd3f3YNzz/Are2mmznzMz9O7vRtuUB87ih3y/sjSKD6VzbucX9PGnzybqxSu4qU2asaC3uoVoEoQtSGnH/RMq/4mbrP5g6XXag9YFh+/ZNnYrF7qK3QrrTL4Czk/HInQ+oaYFhvgKwZb1x/Np5zMBncLPiyLBHyNk//iRcC+RfadYth+wSt2/olE6bNAqzrcWujCDcinCPFc8LqeZ1ZAg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV2PR08MB10384.eurprd08.prod.outlook.com (2603:10a6:150:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 04:37:07 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Wed, 17 Jun 2026
 04:37:07 +0000
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
Subject: [PATCH v4 04/14] pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
Date: Wed, 17 Jun 2026 07:36:44 +0300
Message-ID: <20260617043654.2790253-5-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 477b61c7-9628-4fdd-5e39-08decc2a1682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	DYdd5CHk8LmTGSyt1YtZFPqi/hDNFx9JOcXRuTe3iwprSD1fSenz/dxIR6bXhHJWHrw2DAeiAap82PD0lmVR0RflW2SV7yR9Se73SMafAFF3Sysqq9JPYpEahbx7VujBMRDaRivkTo8SdTtFKp46GYz+X28HfHIIjall2ZyCZrj9Iz2WMPOevanMG0wWurKRvaWxSk5r/IrBcW5+p9pdM241ga1ZW4FEBwfDm/WxxVHAuf2T4eFP9jQ56HEh7oFEJBUTRSIMe59LbL5ZrNzYb1JFZt38Lz+KRu2rD0+m5QZ4focOSk/G8Jd8FdiiGaActDoSRiMiAj9f0aIpongPTPFjdhtxVg01LlzI8k1CpIu4tReyIrW8Fo/FCnw4qjHeBnV2NSnCXGnyFI6Jg1BlmFEK7GcqnjkWUj0YSwmgSPcpU+XWh9J9fiMgt80LuVEeBlyzkYcB4bZUKf8Nim5Pa9aB0KlLiJ/qL8imgzk6E7KVlTbbj/niG9NqV6KQ0oNfrb8HdBPmpBl9Wbaz/Ry21tnyilptRdy82Fz0vZuDf+DeaKV96VkDl0tLjoWGnFtpFOevHWlcE4snIKEidPk4s6vXtrW3uBDNSjszonChvwR4L+ZqNeYC2WJPXIj+ADL/FIwtdnXQ4p46921c00VSz5167BPa0kJ5PoST2c/SePwryOkROPp32PN8LQmG/Fc8NuQFkTHyJl9W0uTR660hQFat20BbcezT9zQj34oDjLTMigbKPVb3tOXsusVnf/DKKCFNoPI81IctFtTf4P+Tsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t+NhScQlNWS4agxWyRjIJBZSL5iLZQzeYwvjr2rFDxt2arFs2IUnlwRsH1gY?=
 =?us-ascii?Q?vjB+2WxHZNAqfeRbAPzDEc3bv0gRSLu+BgyIa1Qm+UjF8YOLzIqRCHcXvZTj?=
 =?us-ascii?Q?WyOFDBUhCb045JIDsI5KJFXHf5HNA6q2FeQ4WWfoBQccR3WZ4tXzf3AqJn2a?=
 =?us-ascii?Q?BTWV8iYYEVNL8DANTXlZ4l8nz9jNh1oMKa4vb4TjwCrISOxLApBu3K4+IOwZ?=
 =?us-ascii?Q?d1y952OFbV4qfTzwVZ+FccXQmRTmyncUhb7s3Tt4Tr7gbCYxyqNRS0SW4wYJ?=
 =?us-ascii?Q?47eAI7D3SckN5dovUiQHoYpKk7YSRcpCS27eF9f2xPg75ft2527ytieYY2Wc?=
 =?us-ascii?Q?gcsCi5ictdw9QuBdO/Mwbf/ug3wxpL0D/zLTVoGrkLYWIJeJseb8zt7Tde7b?=
 =?us-ascii?Q?/PKfxaFAODtg4krorvwi0cuatqLIOPsXQLGcM5Sc5sbofBnJ4k7nAxSIlx7O?=
 =?us-ascii?Q?JFr67oc8a32BTYwFNR/3JOJ3WjFGgCvvRNarYJbP+PA2CUZt2LApMs1Czs/H?=
 =?us-ascii?Q?E9gu0cmeUST5FA654g2FLRyaSV8NxCCd83XWIinGsP+W6C6XxqHx/ekVnbS4?=
 =?us-ascii?Q?+5oBunwIi2relH8qsFOljsPMfphhV0wby3LAarEZkoURFYgC8YsGiC6rP7sn?=
 =?us-ascii?Q?Phl7wfUM0UxF+dAs6p0x8wc84pFep92oeluHu95mGapHFkqPCF7hpMBeHdj+?=
 =?us-ascii?Q?rkFDZ8tC09quM0Z0N9SBhMwmkzgmftmMP4IayqHZyZqE+h6fwXpyb81KdP5h?=
 =?us-ascii?Q?u075kKHpEQU6QV4fUjShBBvl9K6Kts4wjzSHM87RVET2Qm4HaMstK50AXaUg?=
 =?us-ascii?Q?s04as9f7M3MUBNNopQrXWzpSR0JHnR8pKYIcdqmhCEaIQqZK41om6G3B//DB?=
 =?us-ascii?Q?AvyP7qgJRBb15OkFYSpRy2c8Awe6mwCIxD7bEasAed+RyH5n650OZws+T9TM?=
 =?us-ascii?Q?P81jExohf5Gq2KcmzX/R1cJ4zTG/75dSCv38UM2ob4iTzHZHMwxemSPxjfV6?=
 =?us-ascii?Q?qqVm10r1nhl4x6BfbsRtjutoGtWys4QTkhZcnknC+BgPvBuVct4uCXPvxxLy?=
 =?us-ascii?Q?vwx/3QKtKjg7TXD147xA8PWUUDzQ4HTjzceC8JZjwqo+p3PVG2zfABo/Znu2?=
 =?us-ascii?Q?hYv7ZMx0uGnkJfz9R30ErBEUz94aYLy7aSYE7pODbm5IZjGHBWYpIFo+MgLv?=
 =?us-ascii?Q?St+lk5l9dhASETj3NzGLj4wyhPKbkZoQNaRpcOb6pk27MSI0qoMkJuSIbfl9?=
 =?us-ascii?Q?OQr2T6OHNVE5G9UTvAMIn61YBat8hN8YpQ+yvhVzOrlSpKvZ/lbnN4dfZX53?=
 =?us-ascii?Q?CBv7zh5nEZ2r+ElAIjaHbdTQnMWb9/dZ62IVwPMFJmSndVqHH/dvymvl5n8o?=
 =?us-ascii?Q?mOxDxIWh47vPxTupI7ct80lvDaGWTGNfxUJc4oDw3DkXYBUWEAHLml0CC5PY?=
 =?us-ascii?Q?ly7Ijp+pxIpLMnaA5CfGr3cbPwC9L6I5wF7Yar2o+/tK5P6FuFOOBHiUlunk?=
 =?us-ascii?Q?lKZmclJR6W41rIB0gQSeSV1DHeCz9hnfuImAo9X8gd3Wa3Zo6Qp8j5KmQw4h?=
 =?us-ascii?Q?cgcdjky4ur84PwzzkUVruHfaAYtGKi2fXP+lmbw6k5YpMYj78zG6BvJqy5vx?=
 =?us-ascii?Q?9yKTTSFKDNwC0aEskRpSbrRaGo7pr8wViz8Btax0aq0Tt2U62DfIMl6uZOyw?=
 =?us-ascii?Q?gZZTGH6yG/S4LZtre2xgdfsPU4Fqsm8dQ5FkaodYtkw8WBlTdZhQlArYJS4X?=
 =?us-ascii?Q?e7kkqKwZEBVlmtPbY4EY2qyjA+NyxYs=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 477b61c7-9628-4fdd-5e39-08decc2a1682
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 04:37:07.2887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jPuo14/RbKi6yfbkG/HTOa7DtrtOoKmjBWuIJt0VOjyesMfYIwHY/0JGKxZEC99Ju++SqEtyjUmZCjcHDDSDDpiP0umCNghIpsfwCvHewo=
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
	TAGGED_FROM(0.00)[bounces-38606-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 62C90696738

In the an7581 case
 * gpio47 and pcie_reset0 shares pin 60,
 * gpio48 and pcie_reset1 shares pin 61,
 * gpio49 and pcie_reset2 shares pin 62.
but current driver treat them as pins 61--63. This is wrong.

Also current an7581 pinmux implementation have following issues:
 * current pcie_reset pin function actually sets corresponding
   pins as gpios.
 * there is no proper way to set pcie_reset pins as gpios.
 * there is no way to set pcie_reset pins as pwm.

This patch fixes above issues.

WARNING:
There is a contradiction in the Airoha documentation. AN7581 programming
guide claims:
 - gpio44 and pcie_reset0 shares the same pin
 - gpio45 and pcie_reset1 shares the same pin
 - gpio46 and pcie_reset2 shares the same pin
While AN7581 datasheet claims:
 - gpio47 and pcie_reset0 shares the same pin
 - gpio48 and pcie_reset1 shares the same pin
 - gpio49 and pcie_reset2 shares the same pin
The datasheet should be considered as a more reliable source.
Thanks to Benjamin Larsson for clarification.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 122 +++++++++++++++++++-----
 1 file changed, 97 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index cad56ac3c061..4bbda392625a 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -469,9 +469,9 @@ static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
 	PINCTRL_PIN(57, "gpio44"),
 	PINCTRL_PIN(58, "gpio45"),
 	PINCTRL_PIN(59, "gpio46"),
-	PINCTRL_PIN(61, "pcie_reset0"),
-	PINCTRL_PIN(62, "pcie_reset1"),
-	PINCTRL_PIN(63, "pcie_reset2"),
+	PINCTRL_PIN(60, "pcie_reset0"),
+	PINCTRL_PIN(61, "pcie_reset1"),
+	PINCTRL_PIN(62, "pcie_reset2"),
 };
 
 static const int en7581_pon_pins[] = { 49, 50, 51, 52, 53, 54 };
@@ -554,9 +554,12 @@ static const int en7581_gpio43_pins[] = { 56 };
 static const int en7581_gpio44_pins[] = { 57 };
 static const int en7581_gpio45_pins[] = { 58 };
 static const int en7581_gpio46_pins[] = { 59 };
-static const int en7581_pcie_reset0_pins[] = { 61 };
-static const int en7581_pcie_reset1_pins[] = { 62 };
-static const int en7581_pcie_reset2_pins[] = { 63 };
+static const int en7581_gpio47_pins[] = { 60 };
+static const int en7581_gpio48_pins[] = { 61 };
+static const int en7581_gpio49_pins[] = { 62 };
+static const int en7581_pcie_reset0_pins[] = { 60 };
+static const int en7581_pcie_reset1_pins[] = { 61 };
+static const int en7581_pcie_reset2_pins[] = { 62 };
 
 static const struct pingroup en7581_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", en7581_pon),
@@ -639,6 +642,9 @@ static const struct pingroup en7581_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio44", en7581_gpio44),
 	PINCTRL_PIN_GROUP("gpio45", en7581_gpio45),
 	PINCTRL_PIN_GROUP("gpio46", en7581_gpio46),
+	PINCTRL_PIN_GROUP("gpio47", en7581_gpio47),
+	PINCTRL_PIN_GROUP("gpio48", en7581_gpio48),
+	PINCTRL_PIN_GROUP("gpio49", en7581_gpio49),
 	PINCTRL_PIN_GROUP("pcie_reset0", en7581_pcie_reset0),
 	PINCTRL_PIN_GROUP("pcie_reset1", en7581_pcie_reset1),
 	PINCTRL_PIN_GROUP("pcie_reset2", en7581_pcie_reset2),
@@ -882,6 +888,7 @@ static const char *const an7583_pcm_spi_groups[] = { "pcm_spi",
 static const char *const i2s_groups[] = { "i2s" };
 static const char *const emmc_groups[] = { "emmc" };
 static const char *const pnand_groups[] = { "pnand" };
+static const char *const gpio_groups[] = { "gpio47", "gpio48", "gpio49" };
 static const char *const pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1",
 						 "pcie_reset2" };
 static const char *const an7583_pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1" };
@@ -906,7 +913,8 @@ static const char *const pwm_groups[] = { "gpio0", "gpio1",
 					  "gpio40", "gpio41",
 					  "gpio42", "gpio43",
 					  "gpio44", "gpio45",
-					  "gpio46" };
+					  "gpio46", "gpio47",
+					  "gpio48", "gpio49" };
 static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
 						 "gpio2", "gpio3",
 						 "gpio4", "gpio5",
@@ -1405,6 +1413,45 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
 	},
 };
 
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
+static const struct airoha_pinctrl_func_group gpio_func_group[] = {
+	AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET2_MASK),
+};
+
 static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 	{
 		.name = "pcie_reset0",
@@ -1412,7 +1459,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1421,7 +1468,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1430,7 +1477,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET2_MASK,
-			GPIO_PCIE_RESET2_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
@@ -1483,6 +1530,24 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 		.regmap_size = 1,			\
 	}						\
 
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
 static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
@@ -1527,6 +1592,12 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio47", GPIO47_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio48", GPIO48_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio49", GPIO49_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET2_MASK),
 };
 
 static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
@@ -1803,6 +1874,7 @@ static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("i2s", i2s),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("gpio", gpio),
 	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
 	PINCTRL_FUNC_DESC("pwm", pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
@@ -1895,9 +1967,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_PU, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_PU, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_PU, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
@@ -2012,9 +2084,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_PD, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_PD, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_PD, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
@@ -2129,9 +2201,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_E2, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_E2, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_E2, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
@@ -2246,9 +2318,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_E4, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_E4, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_E4, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
@@ -2308,9 +2380,9 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
 };
 
 static const struct airoha_pinctrl_conf en7581_pinctrl_pcie_rst_od_conf[] = {
-	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
-	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
-	PINCTRL_CONF_DESC(63, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(60, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_pcie_rst_od_conf[] = {
-- 
2.53.0


