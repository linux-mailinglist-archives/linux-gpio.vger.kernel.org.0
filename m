Return-Path: <linux-gpio+bounces-38795-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7cW4IxMdOWoynAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38795-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:31:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 017826AF170
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:31:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=PB6EUS98;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38795-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38795-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BD2F302BBDD
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7945C2BFC8F;
	Mon, 22 Jun 2026 11:31:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020125.outbound.protection.outlook.com [52.101.84.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47058282F26;
	Mon, 22 Jun 2026 11:31:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127865; cv=fail; b=kVEu7Bl6ljRdG10upHGHyKiHvDZvIw0Q1sJUqRxzQ8StY3GhIExFSihzOv9r7c3OXDLZmKrsEsbAJ4sUx0b7EYxTS3ZnUqxAXUXWaxGlD2HTGuQ6kyv4eDtemyN/OP2/INpsu6mCiS1xSZtnfK/AFFq4pZwMxdUb4p2uu2nIVLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127865; c=relaxed/simple;
	bh=rvJoeHlaoo2V4ZnLX0anB9GBwV1dYUlgnHmaAmyqAmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QDgsm0KxqkjnWvUlO70DPrlZitk9b/F3qnDXOucdkhdWWdjcQxp43nv4APV0iTSxuo3XREJPQEEmDtUe5WxQqSSao8/xngWyvfDw4kZpPx1236ig7uVNrP9woWUjDzzKegmg3nQKKyb0pi0HNr5LH6NqLXdmQ4q430iEitFv/dQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=PB6EUS98; arc=fail smtp.client-ip=52.101.84.125
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svMcboKkd4DmCmdzwFIfMFlGAtxwgep8YU/F/FrjyQdlb/mNgDe/z4/MxAL+JqdsgsXXiH1MXffeYjTH0/VWapEIN/WLTlZ8KJkpkhtvYCR8x5Coy1ZCKd7EOCcxAwIv0c0oMh/SzB9mR96hHhtJP05AdCWQ7XHGPYsKolx7ORhNHR1deQoa7Mceu/Lp/KRbS21QkAOjASsJovUqDrMWMAEvHK8q5bpNMlXNQ87Na8BgfD95csaC1Y5NcjchGaM4ZvmXufRjX/nooyLjlo9M2X84/fGMK/yUirvSPbX+80JdBDuaauTw/J6suSaUQiEJ3FPm9r69kvzgI/RKmH3RBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQEub0GnytVJCPsHNZ0OxBfajHM3AROnXugEwDgWVtI=;
 b=PStfpI+nXXNYE7H7LmflTf8V72AdxNBIOay0ibDp+kBieKTC7PaEUUFcg+pE1s/kzDrRacE12omFeUtT9Wfwt/0/o0XrOyHZLLjtKwnjd8MakjZRhJj940eVLISmIzVqa6daHKT6Zss1GT/71EOBU2BezTG4rtamjfPw9qPMmW57Bmx93joEn908mL8qCndGlHSYSv0S5VW8lWzkT4gmAkkp6DovzNK9LsKlsbt3UTGPCEr/wIH74bZZUPbdKS6NrU22Nwx7Pbi98tXPJhj1m2dP7uSvpm3mHjGP3e4X9ZApJ+GL5gvZYUaSbXQOJ5u6L0yvnaVhMlZmIQAWhxPSeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQEub0GnytVJCPsHNZ0OxBfajHM3AROnXugEwDgWVtI=;
 b=PB6EUS98TBCubm/n20/o8A6rnyW/P584urxKz5DQSc03b/Cs/k2Pt7B/Xw5oKF0748HeKMh4R7fu9hRatTy0xARxHaZG+uYXxLADJnfdeBE9jbPGHbFXXLEXq/LxE2D6zVUTlpKlkbsp98F4Wn1kK/5lm2X1d3I5MpRQDDUQch/cRvuUCwNnzFYC99dgmQnaD5zByqN91UJfwJtHJBlFWkC2jX+k42NqAGvJih9ILHYkSA8TFqxCxtdi6J6EATvCbI5mBwEUA5A4d4TCrGOIAchyrFEnK+ixQx5xOsDs0PQ6+xDOXiNcgjiMOuwNFQggUuwIUXBFEIz+yetWUibFlw==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM0PR08MB11754.eurprd08.prod.outlook.com (2603:10a6:20b:743::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 11:31:00 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Mon, 22 Jun 2026
 11:30:59 +0000
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
Subject: [PATCH v5 04/16] pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
Date: Mon, 22 Jun 2026 14:30:34 +0300
Message-ID: <20260622113046.3619139-5-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM0PR08MB11754:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4f08bd-ed54-4ecd-1475-08ded051bbd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JmrzprBMLz2OxX83/4mvKz88Oky4DQWiEDUn/JyFRQbAkoP0nmBMc/8DPQm7qCsO+Y82nPBx2sH8pYz6dah5Yhlx7orUKFsofGqdiH7oVRYs7kxcwdg6n/7fXIZOvqKGm8C3kFEdSMvAufl97JpjhtHO6T/SfAmHb9zAEgKQZAaWvBMUzwgQ1PEFVbgvqHZwH/FDTpGd3dPf8wkMPwai3rLKEAL9iGxHpZI/MPCtz4tf22ghRBhAXFTvb4H2IPn2syP3akW9HMTakwxfhKiFp+x2m555Z2rWqB6CUzQJ/SYKy6x6S3FsAZ9nUTnY3KN1Suqz9sFovzBUh5nrC21z8xCuVb9/XAINtdab1pw0zD9v86y2Viocc1Dh2VecptnaopJdvS330twt8y6kGI2LcONT8Y3thger34YtmZJy/I7DRDwiyGnEJ/0h20+TMzRtQ+wgcCzVEbKfgzZDVZRbrv79DcL8AdRxFFF5Kn5CDoe/FW33BK+Z8k05g5RFDbjtTgsrOqPV/DOzY3OcwbX8qqqh5kRhNAs7wWz6m0/VB8t+o1/lU4ms5w9X3vQfjS0u0TQAMmVwjLRf3ePKfVBxkMAyaf8iMR23qZb4SU1aoqxLYXv7YQ41ABLod//jtb0ucn44gn/R2q541/52EjY+gTvUAzAXEIh1qXc8AxoacOhW+stbwL8IoxjIsCM/c5LVM/2wtRSKvGVXldL0gwcYjGRM5oQAqHb1Xz/LzhA1rX3flnRdGjDuYqmwq57pvVDu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x8/Bd8kKxLJGvXe2YUwQY0nHxAurhHa/8vWm7nYYybiQTkZ9de+ZOWh6Odmt?=
 =?us-ascii?Q?rU2jP8ShNVpnygDLCJaYPkRHZ85EWBCAao6XSf3mORT39Znn4qoN5lEEvfiU?=
 =?us-ascii?Q?6eKP6Xbagbl0G6eb+s07TcOKCyDl6ALQFDB6qQAfWSSTFbUHftifzV0pnCHG?=
 =?us-ascii?Q?x5/BC9tbZdTSnOQFDSFsJUNNwChGEHyduw1YAzYRrsurXBPbRdC7oowD5Hi6?=
 =?us-ascii?Q?KKlRYndHQB674WN+jfrsV5K1MeEr9d4jJjHo/uP/v9B1q9Bpg+4SH6Mbx9/5?=
 =?us-ascii?Q?uzxE06qQRlxaZdqWUDN9RBNHlEelvIvmpYypyCAeDZhJvrO1rBBsx0O8aG1X?=
 =?us-ascii?Q?cXZZueTVR8Zab2z+Vi5Mbb8oICt0DhGFGzjsrZHw2CJlfMUPVPZKb3hIPeHb?=
 =?us-ascii?Q?Z1tzUui3EL1dV1j6IQnK5UqwvghuuKx8UgmW7YPebI1lq7XawFNC7uiThWTE?=
 =?us-ascii?Q?/FSb3O53V4WQYAHaYZ3rRks7Gv1Bk05zafcB8bc72htqB+2eLhbOGnfXjzfJ?=
 =?us-ascii?Q?CF8SN5eMLrBAs7dmGaV8Y3KTnl3ABXyPNWW10ngUmrwV8+L0iufLQ6eKbnnH?=
 =?us-ascii?Q?dCqPwn2mUdiBEMK0FcZtM8qUpcs4aQqIsKh3eNtTylP5Tq7u5fTvOKMo5M+u?=
 =?us-ascii?Q?xm1fen9bfLli7JUzAs78Bb1TFXlorKIujHm4YUW+MzTGxDYjoOemoiA4Mo0F?=
 =?us-ascii?Q?a+SW1vJJXNB3GDPPshQqnHv/fLHEP4Q9hot/JlVj62EiBVu+fYYdMVUaHV0V?=
 =?us-ascii?Q?N+ag71yWj/eOsGiDXWJQFDipgDLQ2fr6967MszpZgWBiVL90psZ7DlMr7X2p?=
 =?us-ascii?Q?c1E7yBNcAoh5zHhNJTokVaHph5v0DK/ONyyElN7m6VEytVj/yoX9I60pNGqD?=
 =?us-ascii?Q?n8znBNM+5wmB54RvsWNKnUPrRYvU6Cx1UqN80NWHJtk3hOas4YcHXWAOOe/d?=
 =?us-ascii?Q?mJp0XAlzmOT2SjjJf+jP7asmzCgVobVkLQIiTeE/4syfyWgHVXZXCgjd4UxD?=
 =?us-ascii?Q?yNjbYuDlQx3ooAERpYffrf+UkQ57MdILFjWgT2LDJip9QzpUexW8MjiifrZO?=
 =?us-ascii?Q?Xs2wbppZLEF5G9iZeqV7mucW/SGG1WJHir8B3iy5KARchYa22shpF9HQ3who?=
 =?us-ascii?Q?Uab4NbLsbanc1h+gDiTphffIE0uV+TNq1m0QIpwqq7Cy1SyYAVjPVomK7JiZ?=
 =?us-ascii?Q?kGHBbBxKNnVqGaD2ce+hxJQgYconvRtkNIX+QM17KO3eaGlLLD5k+kx7WAmU?=
 =?us-ascii?Q?/aRF7Fju3S+RsCnB5NqkZnXT4KP6T2N+Z8O1y4QE9KXk1ZT9HPGk7OdaJWg6?=
 =?us-ascii?Q?ZTN9AEm7W2TCsyLKL/Waxl5spJWbv3SEUQr3oWSWOI7GqD74EVw09yUcJW1l?=
 =?us-ascii?Q?LWknXEbB4x2dGswrrv8loJR4i/UWHcrOcfTkEk2VnI72zh6yORnXuMnFjPHd?=
 =?us-ascii?Q?YW3iaNWSobeAFf6and8jIUjl1WFyxEj2Kb/J8lMNUdDCuvVbKw9fuHAkZx5L?=
 =?us-ascii?Q?3HcDKen8w6eIOILoxmAGoyvOJkeRYLpYhyVQItM+sZURST9fE2F+Xc+R3HGb?=
 =?us-ascii?Q?55csKg3/JGEiJ9jzukuIoMHYWXOsRypKaAf0XIr2mlTarenU1FGUus/AME0L?=
 =?us-ascii?Q?76nfzqsyDcPPn9iK278hXy6iC0qHIifzsv1ZCXAnPLl5SveevLXNmD8Q0Gm/?=
 =?us-ascii?Q?LrgBzzfEMFV5ekQ76DKuwwE4xF6NOz6aRigHTJAcnKrPteLcOzVdo4zM/D7h?=
 =?us-ascii?Q?7aB8JZ7OeeqPK3XWHa2VZk1RCey82rg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4f08bd-ed54-4ecd-1475-08ded051bbd4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 11:30:59.7082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IuO/qCbiac+sEkGQzJvNsrlUDCeGg4oWhs5vyEctvFNDF+2k6nsHwzcuaiXeYnZX/5EMaLyWS6U0g1pXLzSDzizl7Kh04oJw4jN3Hxk5Rs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB11754
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38795-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 017826AF170

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


