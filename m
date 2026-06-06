Return-Path: <linux-gpio+bounces-38025-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zFQuNAeBI2rEugEAu9opvQ
	(envelope-from <linux-gpio+bounces-38025-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 04:08:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B5964C2E1
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 04:08:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=HrMBPzlf;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38025-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38025-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DA6C308B7CD
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jun 2026 02:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC78E26F2BE;
	Sat,  6 Jun 2026 02:04:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021103.outbound.protection.outlook.com [52.101.70.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C84283FC8;
	Sat,  6 Jun 2026 02:04:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780711455; cv=fail; b=a4JyZjUzdwJlXQnImDmbmUp9f1U9gomqp8b3yI2410BFWuraV0y3juDWYSy1xafro6pWgxQf8TjWcXQVAzIFD8yZX8biuAD1vdgwDDiKXsQHCbhzHJoc5rucAnkmrRFmt8d9CQW8loAvPFyaonIVV2WPcfz5XZLF9xHp8NvfbU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780711455; c=relaxed/simple;
	bh=9oOG8K7QRIPaleZL9ZtqFPUFewWNA09bbHhqigHInEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IP3rKA/ij93kEu7rsPquRtTHA0S4YbBjM2cCvaoYEHQSJy3YZFV6agXjqqaH9EEcViV2gQp3dCvJTi0+7V8HAq1hhQI/vW6KvpFEjUiBk4XW2xusDW9ZVAOf0N86ubDEg/iUFzDWJsBUyxnIxHOXHMqHWJX57EO/A0HJfdCy4bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=HrMBPzlf; arc=fail smtp.client-ip=52.101.70.103
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNkhyBAt5dQqM4g/mvurPcLyRx7Ytq0S7H7hh9Lnyl6bLVY3ivqYV6aczkV9oJhXtnU+E5E/U7BFUZMvHvRL/zjOWkr0kAUtwQeoic0PY/tdoHG5Uy8VactXwUI4W7APSIENeb9+Q80T5fQvuYOvkEhVb30FV/iNyrnnmFKErPzPAzrZcw8TZrihTl1UClpKJfw1K0WbwacGa6dSnlasDDNUe8qYlN5UBhxlTgFBA/bgt3Ojt2VMPbmJcGhYq1ZRBVFR3DRU8fi2Fn541UnZ6yiQ5PrJ878puqbQXEaJ0g6c9hxuCmh/08x90KLvVVnudS56XLN2Tg9Jr5RATKcfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoqzWqBgpOJboCPG/eb6fBd2AQ4JjLgDF5xasM7aoCM=;
 b=XNYosbTg9JvH1jWqJXXBbPOFVCS201uKElb1XQnr4PVrCDMnUatOxrOkREQRJQlHew74gqQ5ayUBYKd529YzjiJw/0YIM6E18IIjyeL688oRA9GcdIjXDN5BxS4fvpFnue4pPywV4Jnw+DTi/6TvWXqt+Qp7Bpe4b+p1unnlEuZNKL8zQCNkJCbPMXz6Y2EoCRyq1FTYV+mOWdXuau7+uX0LxNCXHTTu/+BuBKdsM41jy+fMbX1aBdmuYku6/eVYSnYyI6XkotiYsK4UaQ6S2pPD1SXZzgW9UeM4FGL07tV/EwC5SHSnzearwEMLogY0dqeEBYkpvF4wXtb0PpnI4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoqzWqBgpOJboCPG/eb6fBd2AQ4JjLgDF5xasM7aoCM=;
 b=HrMBPzlfrTPiN5G9Ni9v0l4XzAKJ9rcdBKL8PEkK9XxWIcsRl13cb+OfV8pEYu0sSvMQVd45TuYtoIOJ7v9h7RCnuIdZIXawx+1SkwBnSXrBBQC8Wu5m9hRRxyLgL5bzOu5tWJhtwMfrVMKzRnGpc3VJraZ/7MbkbWt+gHltLAoQ4PFcKF4OgTVisTPlGOGzkB7MWQcTj/KJwoIQHq2o8zECtXVtBZbtZDvor8O354z8UMW0mEqh7/U+8Vvh16sHfahunqnvsnxCIy499SvejdI54liqbBfNMUSoV5pEFjr06IE6VTPlz9OWkd7ssSqODSbXznral0tJac2jgGQ/Eg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DU0PR08MB9558.eurprd08.prod.outlook.com (2603:10a6:10:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 02:04:09 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.006; Sat, 6 Jun 2026
 02:04:09 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 08/11] pinctrl: airoha: an7583: fix gpio21 pin group
Date: Sat,  6 Jun 2026 05:03:39 +0300
Message-ID: <20260606020342.1256509-9-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DU0PR08MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d3022d-e9af-4279-8ee8-08dec36fe55e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|11063799006|56012099006|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	9vFYOhSXYIeCbiiHrEDuyo22dEZaH1cZqvKDS84LJhe82IFUdAcjPqyZWdQ9tlHBXLyufgEhZQnK37BKhHZyykXt2WxL09ZmXWR6WjtTuIf/F1v0HnA5Zqj2QDMUurQiZO/wpSA8NoBAM0eD3Bwo7kcKzmFSF3uEjPcjpoip5vNBroaFYYAxjY/T9Yln27tPQS+ZO0kXG9+d3sklWDz/iL4kxP8qibYaNVRLVxWYKlmRiO+ZK3gVLqwPH+NJLJefRcj1wu52zV4Bv3Zl7DWa+XQzJGVgjSnNeMIaUAHNuLZyX+o91Om1ucemJnlquAYmd+Id1kLieORMElgxuDS4+qEVtty34/Ao2Zc4Igr8bJAzQpVbBQeJHH+h0tlw3MEzqNWYrbI+1Pw/JEaLjQyes94ayALnSYBQMEa3Xdt06uSKkiyv37aWajLaRrZzqZpgnftSwhdba3rB7iKNp/Bv71NiWT4OzXGNLkYrPC3g/Ik3PdNIyZHAQThSIYY2+VcO0vxrluNwGJzQBjn0BXXLvjGXgxd9AWbYvUyWlcGU0bLuZqiPGGTsY6IuoL540XNksfDKhkJobiCDQxIJxyq0YXKXksWg2Orb0kKcriinigYcmAegPlzFCWB/uDm2qRnUJh2WePpIcSSy5syo3RUw0DSL9jkAzm8akkKGKxl9TCnW+v/sVeoA/SaF6nrcPfDqYvyXCULWoXVauaQVj34252DctGGFpqyavBKoPT751+WPlpaRMjxuEIa1jhq53766K/DzkwWAebvXZ69JfTyBbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hlvHDrAB02UpsmOhjOWhCkNP0Z4I2z1mH0B3OpnRC6QSLK5xgwg6V0a0HrM2?=
 =?us-ascii?Q?XwkA/BN5+SHDLPOYCLdgiyP5DFlOZvvTFeJQx6cRlPU4UH0AHSWuhJAXR1Fb?=
 =?us-ascii?Q?L0sBt8bMqNYGYpXjDa1C5P+xHGQPo1POBbLkI5sb89G0Sh+PwHYrus8gPZdF?=
 =?us-ascii?Q?2suMnRsbhreznfx/yTunUFClmhGJtht2JX88/tUaV1msb1yhhON1DY5JQxWT?=
 =?us-ascii?Q?BlSakqeZX+gwzJ7yEfO7VqsHJI87sfd6Sb+u9cgS8MixHAvxdWVl0CbmPT4p?=
 =?us-ascii?Q?p+4gq0SjX4WwlkOi3LPmMae7Q2kJbhcGU2BLZ867P0xdOuUEmTYzHpHhHELb?=
 =?us-ascii?Q?hcj3f0g0dYKC7d3OzxLgHD25P+q4+X7xJQNcXXFWOzrP4nEkuQCqU1U5m6iu?=
 =?us-ascii?Q?QDVFwhcVaUWg9tBV66gXmNqaH1V0nzNl/kaoEm3qKxKocH8AaP3EB6fxoyfe?=
 =?us-ascii?Q?1i5HGcwc+rWQlDeTtPxAOnFQH+MfeemkBp0KSjPHpzs/uWgEVHJAk8CJbNcs?=
 =?us-ascii?Q?YncWsTwUKHYHpqo/v/kD8XijjccBFR8G6J8KtG0KJV2LLzo0tEiBshHR/Zz9?=
 =?us-ascii?Q?VehpUk5vsG+AMJrDBFS2NLrXFSgmVlFeby7S7U/2HG3FtuvjaXEGYlX6KUdn?=
 =?us-ascii?Q?uCdQr+ymJuxjs3b90GiYpv7ZirtDLbKDvIwHzPlLhSKtFZHewcGTMbq08k5X?=
 =?us-ascii?Q?jxZ5Mjl0uhehH0yxc+OqhWCz00lAeDR7I5SRflTd0rp2Q17knJqwYqLjoGvG?=
 =?us-ascii?Q?Ab1jolrH/RigjG9uOloA3fAyZnebMCVprlv7ch1zhqwu2i6dOP/QZ/EHhTqj?=
 =?us-ascii?Q?5688uU/Ev+Fnt53k3ynFB4JJNjr4xjXtGbk4vVTM0gxE+2PAbYaMyjNflnqL?=
 =?us-ascii?Q?cp2vcLDlFpM2/+x/fOpilsL9ua9lsvyKOdsgn4Fymwka6avfnw9FIGEehYF2?=
 =?us-ascii?Q?Y7rVO/CElvsZbW0hSbvsCpYu0OwnBxDz5ZJU8Xm41JgLMJ8D/KTqitp1OdsV?=
 =?us-ascii?Q?CYTbimbvN7QYk+ld8//vcPVYfSsu+5E8hkuIf19J6NCh/5pk7YkQ/BnsCcR+?=
 =?us-ascii?Q?9y5g/Q+B0uv5BTY2BX1VbrXKC5k5kJ5m88wzPK3wvLNitH0klesMiBdXYsA2?=
 =?us-ascii?Q?VH0uVZk9CoRKj6BnJ0CjHOK80pE+kkgTueGABdVFeNscA0ZNgAkrsB1lgxlb?=
 =?us-ascii?Q?nOojzKacseKq7d+KbvRi6hYRmajq+RL8UknYZMh5+V01sGuw6bJWuIuQ3ncQ?=
 =?us-ascii?Q?eChG7YQK2rSn0fUxYjLuIQBi9foqwzNw+A9qGbhsWme8TKHBwfsSZKAnhYdy?=
 =?us-ascii?Q?VtVsJToAF+FsWYtj9cx6zLYli4PRdJ4ThMNEs3O5RQv0SoM2WO5yVWN8yHYe?=
 =?us-ascii?Q?offoCd0gbT6wsfA6LrFXHAQADG/l0F9WkiYlAmoulXqDowWFimEGrZvIzwAl?=
 =?us-ascii?Q?Y8NOQ6fQYWobB/VQoEJe+oKRYlBmC9KPrBeJiOS+2QZLvjvePJZfX3zD7LnZ?=
 =?us-ascii?Q?wG1pujrxNqxMoQ6K9i97sjMVX3vAigCesCxnS2iW76cJ4z242guGKOuIuce4?=
 =?us-ascii?Q?VyYD2tkCDAofr1WYDiu+hW8ehW3YDfanXEpd69qK6cmowqmBs1PY2IY4Nb5B?=
 =?us-ascii?Q?VZwew6bfaG0BpTqaI/Ux801LqA+AyfDVoNsBczyUqTR9FB52L6ro9T1WB2vN?=
 =?us-ascii?Q?IO0B34+R6cCDovJNj3k5S2fODKRGyag6vFS/AUOAbS/ylNEj6U5fNHbkeHTM?=
 =?us-ascii?Q?IkkHEv09JvshntlxW8PSQZpWNmOs5/c=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d3022d-e9af-4279-8ee8-08dec36fe55e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 02:04:09.1541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LO4Lg2ybxV8E54gzmXUfFKmpUGuIymgw8WCXgzUehP54em6oJHtf01oUxmKvbkQCOgFaDj/iVai+PEUd1S1+nZxGaRaPFqk4t9LSotgZ/mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38025-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lorenzo@kernel.org,m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:ansuelsmth@gmail.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46B5964C2E1

gpio21 pin group refers to gpio22 pin, this is wrong.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 15a541724349..9dce3ed6de17 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -748,7 +748,7 @@ static const int an7583_gpio17_pins[] = { 19 };
 static const int an7583_gpio18_pins[] = { 20 };
 static const int an7583_gpio19_pins[] = { 21 };
 static const int an7583_gpio20_pins[] = { 22 };
-static const int an7583_gpio21_pins[] = { 24 };
+static const int an7583_gpio21_pins[] = { 23 };
 static const int an7583_gpio23_pins[] = { 25 };
 static const int an7583_gpio24_pins[] = { 26 };
 static const int an7583_gpio25_pins[] = { 27 };
-- 
2.53.0


