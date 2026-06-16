Return-Path: <linux-gpio+bounces-38531-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kZJGOU3PMGpFXgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38531-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:21:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A18D68BD9A
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:21:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=s2sGEKr9;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38531-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38531-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42AB0311E2BF
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1533C3C81B2;
	Tue, 16 Jun 2026 04:20:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021138.outbound.protection.outlook.com [52.101.65.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FDD3C8738;
	Tue, 16 Jun 2026 04:20:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781583607; cv=fail; b=M5gwxUV0vtspS1x1fc57elnWTPvaX8RW7XHDnHPjW/mpvKsKM/MExtKjJxpPUEDTpBPlcWhMNiSqHYv5m356QIt5ykFrSpcuxcSD0yaDFhvbRgN9rUBveuDrmOq7j5JCIelF2IfAOR6cdIAOwPBWrJ3Wed8XqHx6k3YKDwIV5b8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781583607; c=relaxed/simple;
	bh=5KQj6q+MpOzVE4myLDMv+nmHKjegoWdIPWcWcgAmh1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MaDM8dWuEomdAoDCVzsteAjSqkgAVjGVCNjKM6KbtNt3dqMoxNuCUo4qFZJsVmgoXbgUce9QOxO201q+cS5DJkdj0ePaF/fbaZ7W+I7rmM6eNGV249Eu6ici/1JZxuHN1kPtdONxkRoeK7nKEzxQ+YID/hS24Wj+X1htO84nCFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=s2sGEKr9; arc=fail smtp.client-ip=52.101.65.138
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgMkEbo1qwl6TYt+u7ATAn8yW/ll/CNZL/kSbXLqA+l9swlBRPWQ0x8Ik2WCQUk91I/LpsyaDL/N3s5sJNp+SH30s3BWqjGBx6xi8pE0bhAHMjr+E6EyhNp0u8zpuEHp+jvRDz39s44rbG9AywEHRisn8ixM3c6uConGv5KtxqpJ10S/SX7XCuutuDRUHj0ZFncSylgSZGBwF5sg1ONs2TPgi5YIrIi1jT4QOCtPy4atNfkNvgMGi02xK5OklldOZXC7E4ZByFEU/hijh2JAkMeSeZBNWz+Zc+zI0hp6OxQQa3wGAIEew26EYYA8x+lbQJ6CN62X6IEt3rhu5aVzJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuhwFMoSnGWiixivEEK5jNoGfJdAxYBb39Rky5491S8=;
 b=BhaupARdxL8k/m1uiMErtIQ4QHdb4VtQTtYDrRAnx1DhVk3vd9xU2YxeXvKYNYvusOKGlS5rdhgzce6QUWEHJfW0hvHNoQlqYH/zROg3OHi8N6aB5EmzqVu4NS1nIPdgsCxTpObYHNytFI5W8ZaoZ0ETrRLO+4qivhm03eRjLVJsaKhc0pNgpIDAhjheZNIC5ZV9oJ8xNs4r9MzWucxlY5hp00T6x0Q3D9c91EJVHZtn/VXDLlMSKhl8UG+lguO/8qntHnsKeaywgfXNf7CD1M8eS/bYSUt8D8b+PzJ9PCIFwTQhPM/O3fTg1GbaSK58/Uwl/N6qakfaRKne4MYtUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuhwFMoSnGWiixivEEK5jNoGfJdAxYBb39Rky5491S8=;
 b=s2sGEKr9qWDHQdZNhHGfHDjt34kqJ09RXg/8lXXI6UNK8bDlVIyZkIikIuNzsKSx6KgkVhWcT27wMtEMNKlNk1SRtEBSYGe8rlbRfGIRA0k+O5l4+SuhHH+CjLa6GwFWTiOUi5vk3zWVmcsVFyWI1Fwdjtak4WyCyHIPjxc1uJWigCyIPNwyscqgMUFzhaiOvnJoHjqvw7N+Hjurb2ykcI77IZgHSpZehx+0NwDeaAImGB8tmYYdw7vkH85bQDYjrrcehXzFniUDTrVRutKNVMbqutWAP6rv4muFxSb2FM8a4Tpa5dFTRYlLjWRh+kFMlQwj5tCPrJAhcg8f05ZEAA==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 04:19:57 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 04:19:57 +0000
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
Subject: [PATCH v2 04/12] pinctrl: airoha: an7581: fix muxing of pcie_reset pins
Date: Tue, 16 Jun 2026 07:19:31 +0300
Message-ID: <20260616041939.2587012-5-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 05ff864f-7459-44e3-9cef-08decb5e8641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|38350700014|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	s6HJ5OQ0w4MD/IfpTRtWJm4LMtdEqYTjEssptmr1Md+pWDjO2nrUwr2ivDBVo0MY77ka5uI6msEjSCZgl2DP7J5wbbeaVmFAE3gIw2fC4gH5PHmug50vwOQXdyeArcnT+WlK1m9m8rUhFiWtuUrL/e2Apqu6QEqyO3aVoXAnTJTK2p02+IAgftzL9V5RyQ+1juFHemuYycvSoKzsibeqbbAtEi6VezXrIoMJVJqz0+pwng6qPnu3iiI4mrv1KAajioLjAQa7IiiZ3RAf+8JACTU5fNRgu0ks7TVH90a8Zu8QetcNZosQF9nqQJeyurmh9Z4obCDLrgL1IYygR6OTAP69pdQu9tw5eHsLr9BbEiKu3+ZAaQvxTIHF2jlP9+py3ywttI3SHBQiF+zepStx1inntzkklvW0jW/AREKQ8bcGlPrD7hULob2bkuCGlsZI8Q28lsBlrIxL3dZOhdRIZViA7LTgdvRCxrCjrE41SaTJ2ZTx6s2BpXhaiv9AcGxDoe1fxVhNBUGaJ/q7TnsVs35QKa5MGyb7eY7ZV/nV+NfDmpzlzo5CrFanmWf2SSikifHAnDOn0avIUd2gmfzFw0Z3JhABX5EKgFyRQCxHuuRFGQzsJ4IgoLDTWq2z8l8LmhlQh6vB58qfP+yI8H0V5qLYoUJ013NhVgKdO4sSW+w1wOlu9mQ6CGNfTjqXpEecsmCeq3t1U7r2lfwXw1rP1eOhcMXFQMjqDMMtZdXMoLWz7L00mVE3JI626Ixk/XktH4AofIzfgbff/Bl7fd4kdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(38350700014)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cv7ueOrWAdVGsrNHkmUhebGWMfbWMlErESFWyClqZrVmD6C4xnH5RBdylG8W?=
 =?us-ascii?Q?5bQImyMW5+KaUvA2QE3nND4D6ie2YHApa51vvG3y0pUO3XhXrXknkjhkVJfu?=
 =?us-ascii?Q?HbQqchIFMuBhLvShl9emAUSs8M2oEfMPf6OfXvBCS2W9/YBIp6b9xG+m6fcb?=
 =?us-ascii?Q?grpFPnWHsQUZriuBDHEY975wOpzUlLVcs2ufejVrlTBp2B8N2YIXeK5KxH+h?=
 =?us-ascii?Q?s+wbRIhEgkwWRcWsC6aePnEiQQrtFIDGUesdSSzSa5ejN6jncys6Cw4B072o?=
 =?us-ascii?Q?XpJycqlSErNuM2jNdh3QF+U3IXqurPAvanev97b7Ux3JlWfiyYBkpVJMX9a6?=
 =?us-ascii?Q?2FgQpqb+eNcUOyq7cdzgZ3upR8o2z4DI2Wf+zvI9foucnt0uSyIlrb3I6b7a?=
 =?us-ascii?Q?Z6821Pz199ngNwd33fIazvkYXhG7TnLjfdMwY6ZN8/rUMwgWpJWiRig0iDsq?=
 =?us-ascii?Q?fx34zcaNF/6hg2k9MDOEZc8wMYZUHW3gVf+JYl5OUeXeH0GhP+4CITegBhrO?=
 =?us-ascii?Q?yIhfogdnvqrG5kGa3kjN3M3eACuYy09KtCY4RqoVjcth/ficp0hKsFcnbJGA?=
 =?us-ascii?Q?ccjp/Fnm8ZzfFexFA/uCweVEpZ5iY/oo3i7/xfPLmpExNGbRlX3ZR2PnQrcF?=
 =?us-ascii?Q?u9Kzadd1H0bMn1dCR72Kc81iU63/9aRLfDIp41G8hLHnT/H4dzy+IGEyyPRf?=
 =?us-ascii?Q?owuGsWJb5AiTtMQds0qlDQ7tG8x/9cdEuW8fArIVf7+Koq64Psuk0d9ouc5O?=
 =?us-ascii?Q?Gm4+/fXaNC2Zw7QZfw8/C2WHXKEDTXmssWPqxYPNtkjsDUyVU717O3ucG94+?=
 =?us-ascii?Q?onjaxTeupSHdNPt/Qf8O4Aia0YxeulEjE1NISESIFAmbNBobCrVz0lzkTq9p?=
 =?us-ascii?Q?DsASM0Ww83D1Uqr2bR5nx6CaMlCu9nYWnbnoX5f4pvaHPq6eSIrXkrDfLuYM?=
 =?us-ascii?Q?T0UGoH5+i7wcK7C7912mjhLRTCt6m/PMoAzI8Hq60BD28+LDHEsgjT67rrHD?=
 =?us-ascii?Q?ovsWu6StjfExhnpUY6prG7/X4l69iiq4j9pCyX7ePMXGCvoCMZf5h5m+6jSO?=
 =?us-ascii?Q?VztVXqMGXb3UgSvFr0CPGcrkTvWYVlANU/VoT6dE8zf8Hkblyj31xzDtvi5r?=
 =?us-ascii?Q?AE7Po22ZW3g1Zgzb+iYcJcH9PtK845QNnmn7+7V58DGy8pid7pxRTiZI4l+F?=
 =?us-ascii?Q?eyqdWvCT2wj7pEu31Oce4td7Yu7wczuqYszw6bFiBSZp0R3Dsy0GqgdAt0gP?=
 =?us-ascii?Q?yvCHL8aedJy2GMU8r24nVl63CLHXWX2zVk42FkoxrwMaD4Jri6//GacaegbA?=
 =?us-ascii?Q?6UGyT1XiLDA31IfmTDLVxqM47mYAmGKu1o9sUZ5P0+aJsJPVYQU1rOCos+Xk?=
 =?us-ascii?Q?bzoSrsdF59QbFc7RhAZj7r60sCp8Y27rsGI9/AHB6HlgPDILgmNkHYXdJZud?=
 =?us-ascii?Q?NCIUB+ZHlXTpPfUNkcBnBVflx6vRc1SS5k5f45r+LXYuqyAEWUs05CeerZtu?=
 =?us-ascii?Q?8Iqf+72fhaNFa2uQCxOza3QH/PUf2rp/+3hZq/L4rM0WpGpGaWk5w7yOjqPQ?=
 =?us-ascii?Q?BBRwJY1ZQsBjq5w3BoqK/AxmZ6msElupebfYO1HsNhPlNITLjnmWUQ1gSCgr?=
 =?us-ascii?Q?EjhIWfcKtIUZllsbCN+UoIkCmYXhtmVk3S9lH0o4qq0q5v47EVmqv18FfOtn?=
 =?us-ascii?Q?SM5G4J/jrSiVbELXTLBx4BTmZVGZpuRc6CO0dhDgevG1CGKNgoZ9VDCeE9Zj?=
 =?us-ascii?Q?t7zDKq4FeO+trVq0oXZaZiPypUek/sA=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ff864f-7459-44e3-9cef-08decb5e8641
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 04:19:57.4252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQ70Sh3+hBOsn3pMU45GNM2QdtPc32M9wMAoUDrrshfTNGOd3JrryQNN4njbXE3mfs30vIHfliISlVBzzJqS3GmZSMo4jXIIMH+Q/UZJbGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055
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
	TAGGED_FROM(0.00)[bounces-38531-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A18D68BD9A

In the an7581 case
 * gpio44 and pcie_reset0 shares pin 57,
 * gpio45 and pcie_reset1 shares pin 58,
 * gpio46 and pcie_reset2 shares pin 59.
but current driver treat them as different pins. This is wrong.

Also current an7581 pinmux implementation have following issues:
 * pins 57--59 can't be set as pcie_reset, current pcie_reset code will
   sets pins to gpio mode instead.
 * there is no proper way to set pins 57--59 to gpio mode.
 * pins 57--59 can't be actually set as pwm pins. These pins must be
   muxed to gpio mode as well.

This patch fixes above issues.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 89 ++++++++++++++++++++-----
 1 file changed, 74 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index cad56ac3c061..97b6d46ccb2b 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -466,12 +466,9 @@ static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
 	PINCTRL_PIN(54, "gpio41"),
 	PINCTRL_PIN(55, "gpio42"),
 	PINCTRL_PIN(56, "gpio43"),
-	PINCTRL_PIN(57, "gpio44"),
-	PINCTRL_PIN(58, "gpio45"),
-	PINCTRL_PIN(59, "gpio46"),
-	PINCTRL_PIN(61, "pcie_reset0"),
-	PINCTRL_PIN(62, "pcie_reset1"),
-	PINCTRL_PIN(63, "pcie_reset2"),
+	PINCTRL_PIN(57, "pcie_reset0"),
+	PINCTRL_PIN(58, "pcie_reset1"),
+	PINCTRL_PIN(59, "pcie_reset2"),
 };
 
 static const int en7581_pon_pins[] = { 49, 50, 51, 52, 53, 54 };
@@ -554,9 +551,9 @@ static const int en7581_gpio43_pins[] = { 56 };
 static const int en7581_gpio44_pins[] = { 57 };
 static const int en7581_gpio45_pins[] = { 58 };
 static const int en7581_gpio46_pins[] = { 59 };
-static const int en7581_pcie_reset0_pins[] = { 61 };
-static const int en7581_pcie_reset1_pins[] = { 62 };
-static const int en7581_pcie_reset2_pins[] = { 63 };
+static const int en7581_pcie_reset0_pins[] = { 57 };
+static const int en7581_pcie_reset1_pins[] = { 58 };
+static const int en7581_pcie_reset2_pins[] = { 59 };
 
 static const struct pingroup en7581_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", en7581_pon),
@@ -882,6 +879,7 @@ static const char *const an7583_pcm_spi_groups[] = { "pcm_spi",
 static const char *const i2s_groups[] = { "i2s" };
 static const char *const emmc_groups[] = { "emmc" };
 static const char *const pnand_groups[] = { "pnand" };
+static const char *const gpio_groups[] = { "gpio44", "gpio45", "gpio46" };
 static const char *const pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1",
 						 "pcie_reset2" };
 static const char *const an7583_pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1" };
@@ -1405,6 +1403,45 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
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
+	AIROHA_PINCTRL_GPIO_EXT("gpio44", GPIO44_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio45", GPIO45_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio46", GPIO46_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET2_MASK),
+};
+
 static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 	{
 		.name = "pcie_reset0",
@@ -1412,7 +1449,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1421,7 +1458,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1430,7 +1467,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET2_MASK,
-			GPIO_PCIE_RESET2_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
@@ -1483,6 +1520,24 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
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
@@ -1524,9 +1579,12 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio41", GPIO41_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio42", GPIO42_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio43", GPIO43_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio44", GPIO44_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio45", GPIO45_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio46", GPIO46_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET2_MASK),
 };
 
 static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
@@ -1803,6 +1861,7 @@ static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("i2s", i2s),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("gpio", gpio),
 	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
 	PINCTRL_FUNC_DESC("pwm", pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
-- 
2.53.0


