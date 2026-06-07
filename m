Return-Path: <linux-gpio+bounces-38050-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JlDYF5y5JGru+gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38050-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:21:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F1C64E95D
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:21:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=WcuT8bJP;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38050-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38050-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D4343024EF9
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 00:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54952701B8;
	Sun,  7 Jun 2026 00:17:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021097.outbound.protection.outlook.com [52.101.65.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E8421767D;
	Sun,  7 Jun 2026 00:17:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780791466; cv=fail; b=mS+616ge7xkT7DeQvPFH9zxLZvzJenzyZcEgfuo3CBpk9QeG4kjNBgKuCCRTwg6lE0I4w8u3enZkFxUzetiWk7nB6EZGnrUZBpV5Kr8IopXQZ3QGdmelpUsyMrnAjjVjZHwKrKga3vN4YpHLcV380CpCpfetbeWT+E/8X17geqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780791466; c=relaxed/simple;
	bh=DLnuvjxhnxBtZN7Z3tTFie9XUthwUdoFxgn4TGgBvwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LT7T7wMj+IAEIVvSZWW64PTHpJHzE9X9HGmqFo9MXVDbQsnS8ZgeGCI9JSr0vfNXQnKXkMBwZM4IX5K6UuB1+aib4f63KA6/E23RVYsugCz6AnYM/9qDPKW6JBQLXGnU6sOPKVDeDIDM5oPXDMLBR48um5hmEGxLY5WeQLgeWV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=WcuT8bJP; arc=fail smtp.client-ip=52.101.65.97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBL5GYFOX7pOpF1bQjeRJxTR6BsLuIH4WoF3ooeSIJpuGhvN0LvImRAxaw4+IdTrh1090sEK0WOoQDPlgqUfuBmtUYdC7AbbXsRXnhntO/xoqG2IKc/1H8dcfLxmbHVTF4By3Y96oSEf0VriwzST/kbqrL1ZumW5uoA8ec5IPWnBipP1ST4JsN1tN0wI2DsqXSsfbvlzevmfxmy/6dTbtP2wh09xvVGLFHhffHTyGZffz2jGRsZJv4IkzgFdZAogNZuYoSzlzph+Xg6bnW4uVinYdlaCOhA2ntfL6NTZoUYF7rSUEoMYwgbWgqX9IO7m5fO3sn1iM33708OJf9v1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SWFiWtInG6bfuTwwIedZvPRXb811TE8E3BMzMlNqx4=;
 b=rawQmwaItwfOSLly65G064BBnnXT4slABYSOEvV7eTF6PDe75GeuQkHwaF6tMyC8kUY6eYQMSmsNGjCL5TD9Q3X3/Chzh6glqNm/J4Dwvd7FeWcz1xhFW+med//RefSTimDNKCOdhlnLGYZS4wCiZIZ7LBKDq9s0Vx/FK87Qqtdd/RLoYlnfG/a0w1jaVnchWZgTmmNDO8hhFvkQzub1FNxYShsGSddYdejA25pASEwhOTnwShrX/efkOR+t0kKHznpUkMqigWX6t+jD1pBQQ7jJ7YZUafZl5S9ArMGF6001aDhVVJto8V+dO+ryBnhX6igi68tTJccnUmNy10Tg3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SWFiWtInG6bfuTwwIedZvPRXb811TE8E3BMzMlNqx4=;
 b=WcuT8bJPZJHq4IgEXWedH2K2Gk+noSUcCVQuymVpjwJ3HT/xJOpQxdmWfjePWT5xp2pZinv8Iwx0udC4dyUlCaqEj8yo0xAoGd7jXaNH6XV7oFUOLljeuXumtO5CmRU3LShnsC+2VevZ1rQmnC3sbqOb6Z7QETEljn9iZjxeLcx72UrFJlK06lywFubNcba1L3sXjqc6zlGwY4tGs9cXplsyUWWX48Xf3z+/I4qO1aL4eChJJYuSAQ+d566mwlIHz19tC8FsIMedC5uZyXOuhCw7BfCqQVx2Bth0+JKM3LQ1UwiLfNUsnSsFQ3Qbo0P0R9PanhIIxSI0uc/VMDSP0w==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:27 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:27 +0000
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
Subject: [PATCH 17/18] pinctrl: airoha: prepare for en7523 adding
Date: Sun,  7 Jun 2026 03:16:53 +0300
Message-ID: <20260607001654.1439480-18-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 81a723d6-dedf-46c5-80dc-08dec42a2830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	kVyq+hhLFTSKPvGAJXL62GliJRy0JyRc5rnd8gmGW4g6RlI4FWa5JTRuqwGAccX8PMvV6zTRqtuKJ0E56ArMFEIJOBpOFgCnIkYFfCtGJ6xp67tIJwnaPgzG9UlsHT+HYF8eX98X2y0ZrOViZtV4+Dae3185svMo6ou48GYitKi4v6HKn/kXJ317zxF39uUJESJW6PYcHUg4oaWbwc79eEW4/gIqVcrp/dPdLqX+VhT+/JaxsrgPRxwez457fzo+RNgYaC/aHettPL1l1+fxWUmN/z5ETzGo6SIbayKdHvgoOAmfaYPTqeNDnYSpFWjHtmjJfkddxdoTSvaPKKQHD0yIkh+oA8vgEeGLD5wnpjxfPrjr6cCcrIE3/bJ3V+ZM+qdJvYgTy4/hyOMiOgAJAv0wyoPJCr5hh9qbY5HZHpiX+iEjFKIiBT2+WvB0sNrCgKyPLqqvIJDZU/LMRE4qss6jwxnT7GHEMawxsOTE1sEnTTxlxzgC+uVQ3i698Jw6hXUeT28rWEzVh+1oJDrmNkhS6zhFm7YrFsKtJZJa+IBMqSVUlXEN8YxuxuMCC2HNyybhrWsZ7PRES115pq0/Moe+axTlhh+W6eMHm4g99UDnhmntnVeKaAE2wQglFZ28WwMpudSDB4l2YlpXx6J/xF3RO2EdfATTcqrPpPqVOFX3jof6g/KFVR7wQ43f5gUl1jQVkYtpk2h19PHeiNb6JC8DTWBdDyZww6EykULbyJRe5ygdzdjMkTVVecK9i2BR5HcxqL3PVWsNQJA0xUl+1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?smwdDWlhNCRS1QQ33O75SoFmnJia1Yj6YwVrAt4oRQ88j2kyTmguICd7lKYv?=
 =?us-ascii?Q?RJwH3jy2kaLibV8hPP9MbtRqfKEMk9QvYA1HwmXE6QBwomKHMHluqd9ucy37?=
 =?us-ascii?Q?v7nZTlVK7eA1rjRVqAjua19NZKC/5UNnsKsMC/bXEg18rLYneRmpzMBo1djw?=
 =?us-ascii?Q?vzKEOREyAe3phZhGMzrlDY2iJCxxbgqh7p584nnQrloXSucrnMvKCECeg4Ae?=
 =?us-ascii?Q?IvAxRD9e3OdF5PlikKMCZS50hRpY55Ase8pxxKKA/qXulfMQiz9ocndiycs6?=
 =?us-ascii?Q?uQQWa9kAHenO5ywF1sjp/bzZ6E29DLpP3bEHG8Ce7gI3D6tALHgPa67XW2Qu?=
 =?us-ascii?Q?apatURk3TjASeyR9OOaRRbqNmjPRyt6N6URiJCnbcGcvFu5UPQRDQxuCqbWY?=
 =?us-ascii?Q?dcMYpSrhynW4Puv3WfSTL/4z4P1w3Zl9j0lhJMgtJJnJ3TgPopj4Z874WRSd?=
 =?us-ascii?Q?assHH04vRlm+dZbNMOGPCxYzAHuj+0aySKz1uK0xemB9O0yuc9oM4tyncbh9?=
 =?us-ascii?Q?SLOUCH3dxZx4C78O78XkUWJ0207PcaKUY9meuqoViZUqfbYaDnWkyNIqP81d?=
 =?us-ascii?Q?xHbNCL8ANiXRHsBLiTVX7DMT0IMuPCP+OBtNCQjcKluMMipqH/kKyp3sOoYL?=
 =?us-ascii?Q?QSz5du5d7HN4etSi1GXibAbI6js969kZc5D2U8nGkEap6CY8ETSrckDCQJJO?=
 =?us-ascii?Q?xU9p3wXmRzRqTw9K5gE1bk9vgKorgrtn57j16CVSK78T2JDSnl6NUKAwjCtA?=
 =?us-ascii?Q?Z9Zn6vp74fuW+M53+7Kf00MKPu+YhTa+Wvtkskp+hyxUh4bcNY0TqB8YRgpF?=
 =?us-ascii?Q?sH29O1tHensR2g0NsPqwfhvnH9VKSqRHbMc8JzlJzrmVKPLyecOs9KpoMcQ4?=
 =?us-ascii?Q?BqmWeUR7mAYrmL08gRKNRiK7bKZbCp1NC18d3O5K+RPVk33SdgXo5DymqkjF?=
 =?us-ascii?Q?Fm/uxhWyOiPjpSI6m2l92VPi1MWWzlAd0VQ5EniBOcRZQ0iUihfriY5AvJgr?=
 =?us-ascii?Q?HGyDYTWPtkqOcM3ZaHZs5Q/RAF55hqnOCQkb5O0ZYlaZYuvuUQBJl7pz967H?=
 =?us-ascii?Q?79/cVcw6ol6IfGP7uSmMnE3+74JCb5IYcXxyB8aDTsCqS6FR/jpDkUp6wnwj?=
 =?us-ascii?Q?zP+3BzdqlfuTC1DUH/dsDadcg7B7bLAUA3HJVyTW7TIIvf4iMVIRjEmTWgB1?=
 =?us-ascii?Q?9tjEs2Gy/jyfbAPOOwzh/vWG8TGd2wL4KDvp6UHiJKqOB/jqjwZuv3SYricB?=
 =?us-ascii?Q?zjPtKrnQ8seXE0mTtcE3oA/Y1fFt/vHa+reqvZUVKeGZjCS7ckX+Mu3+fUTP?=
 =?us-ascii?Q?qk30E0s2IdQvnEjYBXoi/XVq93Qf2T80uFMWiSyO94yH1fsPgwS5oB2m7cga?=
 =?us-ascii?Q?R85YS/UxxK4nRlGgIXT7atkdfYoq8Ii+ZCB6kfn6nD55I6Q3OJe1gRtk1A3Q?=
 =?us-ascii?Q?5UChefDgOBE2bivNngwMvULbxzpWzYGNocml4ZJhri3dn+lKxE4kvkZZ3Kg9?=
 =?us-ascii?Q?6+mh0tzwov2uignny0y4LYAqVbB3Rbv8yqT1C/BptXUu8WLBUn8AUYJOztQd?=
 =?us-ascii?Q?jBBFCcskJGx2JRRuW2iZMXpR53DtyTW2RNX3C7UkqIJenALfCeo7bOAlJ7r1?=
 =?us-ascii?Q?iSX2Z5YARoCHdTjtqobyhDcoVVZuoq0H1nOioSrfbKsXbqZ04v+L8J+MjMXd?=
 =?us-ascii?Q?5cWKlGLrHmgnjQT5pxuK4PAoqpMiT9lb+kR4Dw9G2WCyWzTbudkHZMbykpfJ?=
 =?us-ascii?Q?p21e+ZY3KxucmAB1J/5PRv6xzANyRAo=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a723d6-dedf-46c5-80dc-08dec42a2830
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:27.6713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3SA24H2Bo9cTC44QZDrpAW6udl7Xjenq1u++8eXafR8RY4rTd5aJbSh5WW3v5yheIUZqNruDzohRiUTLScpHg0bPwRk1ubml+WBsqiSR2D0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38050-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33F1C64E95D

en7523 a bit differs from an7581/an7583. It has different register
offsets and slightly different bitfield masks.

Let's adapt common header and existing drivers for the future addition
of en7523.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/airoha-common.h  |  42 ++++++--
 drivers/pinctrl/airoha/pinctrl-an7581.c | 138 ++++++++++++------------
 drivers/pinctrl/airoha/pinctrl-an7583.c | 132 +++++++++++------------
 3 files changed, 167 insertions(+), 145 deletions(-)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index 611194725757..f10cc7d20d15 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -56,7 +56,8 @@
 	}
 
 /* MUX */
-#define REG_GPIO_2ND_I2C_MODE			0x0214
+#define AN7581_REG_GPIO_2ND_I2C_MODE		0x0214
+#define EN7523_REG_GPIO_2ND_I2C_MODE		0x0210
 #define GPIO_MDC_IO_MASTER_MODE_MODE		BIT(14)
 #define GPIO_I2C_MASTER_MODE_MODE		BIT(13)
 #define GPIO_I2S_MODE_MASK			BIT(12)
@@ -73,7 +74,8 @@
 #define GSW_TOD_1PPS_MODE_MASK			BIT(1)
 #define GPIO_2ND_I2C_MODE_MASK			BIT(0)
 
-#define REG_GPIO_SPI_CS1_MODE			0x0218
+#define AN7581_REG_GPIO_SPI_CS1_MODE		0x0218
+#define EN7523_REG_GPIO_SPI_CS1_MODE		0x0214
 #define GPIO_PCM_SPI_CS4_MODE_MASK		BIT(21)
 #define GPIO_PCM_SPI_CS3_MODE_MASK		BIT(20)
 #define GPIO_PCM_SPI_CS2_MODE_P156_MASK		BIT(19)
@@ -91,7 +93,8 @@
 #define GPIO_SPI_CS2_MODE_MASK			BIT(1)
 #define GPIO_SPI_CS1_MODE_MASK			BIT(0)
 
-#define REG_GPIO_PON_MODE			0x021c
+#define AN7581_REG_GPIO_PON_MODE		0x021c
+#define EN7523_REG_GPIO_PON_MODE		0x0218
 #define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
 #define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
 #define GPIO_PCIE_RESET2_MASK			BIT(12)
@@ -108,11 +111,14 @@
 #define GPIO_EMMC_MODE_MASK			BIT(1)
 #define GPIO_PON_MODE_MASK			BIT(0)
 
-#define REG_NPU_UART_EN				0x0224
+#define AN7581_REG_NPU_UART_EN			0x0224
+#define EN7523_REG_NPU_UART_EN			0x0220
 #define JTAG_UDI_EN_MASK			BIT(4)
 #define JTAG_DFD_EN_MASK			BIT(3)
+#define NPU_UART_EN_MASK			BIT(2)
 
-#define REG_FORCE_GPIO_EN			0x0228
+#define AN7581_REG_FORCE_GPIO_EN		0x0228
+#define EN7523_REG_FORCE_GPIO_EN		0x0224
 #define FORCE_GPIO_EN(n)			BIT(n)
 
 /* LED MAP */
@@ -142,6 +148,10 @@
 #define SPI_MOSI_E2_MASK			BIT(13)
 #define SPI_CLK_E2_MASK				BIT(12)
 #define SPI_CS0_E2_MASK				BIT(11)
+#define EN7523_SPI_MISO_E2_MASK			BIT(13)
+#define EN7523_SPI_MOSI_E2_MASK			BIT(12)
+#define EN7523_SPI_CLK_E2_MASK			BIT(11)
+#define EN7523_SPI_CS0_E2_MASK			BIT(10)
 #define PCIE2_RESET_E2_MASK			BIT(10)
 #define PCIE1_RESET_E2_MASK			BIT(9)
 #define PCIE0_RESET_E2_MASK			BIT(8)
@@ -159,6 +169,10 @@
 #define SPI_MOSI_E4_MASK			BIT(13)
 #define SPI_CLK_E4_MASK				BIT(12)
 #define SPI_CS0_E4_MASK				BIT(11)
+#define EN7523_SPI_MISO_E4_MASK			BIT(13)
+#define EN7523_SPI_MOSI_E4_MASK			BIT(12)
+#define EN7523_SPI_CLK_E4_MASK			BIT(11)
+#define EN7523_SPI_CS0_E4_MASK			BIT(10)
 #define PCIE2_RESET_E4_MASK			BIT(10)
 #define PCIE1_RESET_E4_MASK			BIT(9)
 #define PCIE0_RESET_E4_MASK			BIT(8)
@@ -181,6 +195,10 @@
 #define SPI_MOSI_PU_MASK			BIT(13)
 #define SPI_CLK_PU_MASK				BIT(12)
 #define SPI_CS0_PU_MASK				BIT(11)
+#define EN7523_SPI_MISO_PU_MASK			BIT(13)
+#define EN7523_SPI_MOSI_PU_MASK			BIT(12)
+#define EN7523_SPI_CLK_PU_MASK			BIT(11)
+#define EN7523_SPI_CS0_PU_MASK			BIT(10)
 #define PCIE2_RESET_PU_MASK			BIT(10)
 #define PCIE1_RESET_PU_MASK			BIT(9)
 #define PCIE0_RESET_PU_MASK			BIT(8)
@@ -198,6 +216,10 @@
 #define SPI_MOSI_PD_MASK			BIT(13)
 #define SPI_CLK_PD_MASK				BIT(12)
 #define SPI_CS0_PD_MASK				BIT(11)
+#define EN7523_SPI_MISO_PD_MASK			BIT(13)
+#define EN7523_SPI_MOSI_PD_MASK			BIT(12)
+#define EN7523_SPI_CLK_PD_MASK			BIT(11)
+#define EN7523_SPI_CS0_PD_MASK			BIT(10)
 #define PCIE2_RESET_PD_MASK			BIT(10)
 #define PCIE1_RESET_PD_MASK			BIT(9)
 #define PCIE0_RESET_PD_MASK			BIT(8)
@@ -322,12 +344,12 @@
 		.regmap_size = 1,			\
 	}						\
 
-#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
+#define AIROHA_PINCTRL_PHY_LED0(variant, gpio, mux_val, map_mask, map_val)	\
 	{								\
 		.name = (gpio),						\
 		.regmap[0] = {						\
 			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
+			variant##_REG_GPIO_2ND_I2C_MODE,		\
 			(mux_val),					\
 			(mux_val),					\
 		},							\
@@ -340,12 +362,12 @@
 		.regmap_size = 2,					\
 	}
 
-#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)	\
+#define AIROHA_PINCTRL_PHY_LED1(variant, gpio, mux_val, map_mask, map_val)	\
 	{								\
 		.name = (gpio),						\
 		.regmap[0] = {						\
 			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
+			variant##_REG_GPIO_2ND_I2C_MODE,		\
 			(mux_val),					\
 			(mux_val),					\
 		},							\
@@ -449,7 +471,7 @@ enum airoha_pinctrl_confs_type {
 	AIROHA_PINCTRL_CONFS_DRIVE_E4,
 	AIROHA_PINCTRL_CONFS_PCIE_RST_OD,
 
-	AIROHA_PINCTRL_CONFS_MAX,
+	AIROHA_PINCTRL_CONFS_MAX
 };
 
 struct airoha_pinctrl {
diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
index 56c452e278f5..838c7ae62e3f 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7581.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -303,7 +303,7 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
 		.name = "pon",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_PON_MODE_MASK,
 			GPIO_PON_MODE_MASK
 		},
@@ -316,7 +316,7 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 		.name = "pon_tod_1pps",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			AN7581_REG_GPIO_2ND_I2C_MODE,
 			PON_TOD_1PPS_MODE_MASK,
 			PON_TOD_1PPS_MODE_MASK
 		},
@@ -325,7 +325,7 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 		.name = "gsw_tod_1pps",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			AN7581_REG_GPIO_2ND_I2C_MODE,
 			GSW_TOD_1PPS_MODE_MASK,
 			GSW_TOD_1PPS_MODE_MASK
 		},
@@ -338,7 +338,7 @@ static const struct airoha_pinctrl_func_group sipo_func_group[] = {
 		.name = "sipo",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
 			GPIO_SIPO_MODE_MASK
 		},
@@ -347,7 +347,7 @@ static const struct airoha_pinctrl_func_group sipo_func_group[] = {
 		.name = "sipo_rclk",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
 			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK
 		},
@@ -360,13 +360,13 @@ static const struct airoha_pinctrl_func_group mdio_func_group[] = {
 		.name = "mdio",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			AN7581_REG_GPIO_2ND_I2C_MODE,
 			GPIO_MDC_IO_MASTER_MODE_MODE,
 			GPIO_MDC_IO_MASTER_MODE_MODE
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
-			REG_FORCE_GPIO_EN,
+			AN7581_REG_FORCE_GPIO_EN,
 			FORCE_GPIO_EN(1) | FORCE_GPIO_EN(2),
 			FORCE_GPIO_EN(1) | FORCE_GPIO_EN(2)
 		},
@@ -379,7 +379,7 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 		.name = "uart2",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_UART2_MODE_MASK,
 			GPIO_UART2_MODE_MASK
 		},
@@ -388,7 +388,7 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 		.name = "uart2_cts_rts",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_UART2_MODE_MASK | GPIO_UART2_CTS_RTS_MODE_MASK,
 			GPIO_UART2_MODE_MASK | GPIO_UART2_CTS_RTS_MODE_MASK
 		},
@@ -397,7 +397,7 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 		.name = "hsuart",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
 			GPIO_HSUART_MODE_MASK
 		},
@@ -407,7 +407,7 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 		.name = "hsuart_cts_rts",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
 			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK
 		},
@@ -416,7 +416,7 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 		.name = "uart4",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_UART4_MODE_MASK,
 			GPIO_UART4_MODE_MASK
 		},
@@ -425,7 +425,7 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 		.name = "uart5",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_UART5_MODE_MASK,
 			GPIO_UART5_MODE_MASK
 		},
@@ -438,7 +438,7 @@ static const struct airoha_pinctrl_func_group i2c_func_group[] = {
 		.name = "i2c1",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			AN7581_REG_GPIO_2ND_I2C_MODE,
 			GPIO_2ND_I2C_MODE_MASK,
 			GPIO_2ND_I2C_MODE_MASK
 		},
@@ -451,7 +451,7 @@ static const struct airoha_pinctrl_func_group jtag_func_group[] = {
 		.name = "jtag_udi",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_NPU_UART_EN,
+			AN7581_REG_NPU_UART_EN,
 			JTAG_UDI_EN_MASK,
 			JTAG_UDI_EN_MASK
 		},
@@ -460,7 +460,7 @@ static const struct airoha_pinctrl_func_group jtag_func_group[] = {
 		.name = "jtag_dfd",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_NPU_UART_EN,
+			AN7581_REG_NPU_UART_EN,
 			JTAG_DFD_EN_MASK,
 			JTAG_DFD_EN_MASK
 		},
@@ -473,7 +473,7 @@ static const struct airoha_pinctrl_func_group pcm_func_group[] = {
 		.name = "pcm1",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM1_MODE_MASK,
 			GPIO_PCM1_MODE_MASK
 		},
@@ -482,7 +482,7 @@ static const struct airoha_pinctrl_func_group pcm_func_group[] = {
 		.name = "pcm2",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM2_MODE_MASK,
 			GPIO_PCM2_MODE_MASK
 		},
@@ -495,7 +495,7 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
 		.name = "spi_quad",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_SPI_QUAD_MODE_MASK,
 			GPIO_SPI_QUAD_MODE_MASK
 		},
@@ -504,7 +504,7 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
 		.name = "spi_cs1",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_SPI_CS1_MODE_MASK,
 			GPIO_SPI_CS1_MODE_MASK
 		},
@@ -513,7 +513,7 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
 		.name = "spi_cs2",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_SPI_CS2_MODE_MASK,
 			GPIO_SPI_CS2_MODE_MASK
 		},
@@ -522,7 +522,7 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
 		.name = "spi_cs3",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_SPI_CS3_MODE_MASK,
 			GPIO_SPI_CS3_MODE_MASK
 		},
@@ -531,7 +531,7 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
 		.name = "spi_cs4",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_SPI_CS4_MODE_MASK,
 			GPIO_SPI_CS4_MODE_MASK
 		},
@@ -544,7 +544,7 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 		.name = "pcm_spi",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM_SPI_MODE_MASK,
 			GPIO_PCM_SPI_MODE_MASK
 		},
@@ -553,7 +553,7 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 		.name = "pcm_spi_int",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM_INT_MODE_MASK,
 			GPIO_PCM_INT_MODE_MASK
 		},
@@ -562,7 +562,7 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 		.name = "pcm_spi_rst",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM_RESET_MODE_MASK,
 			GPIO_PCM_RESET_MODE_MASK
 		},
@@ -571,7 +571,7 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 		.name = "pcm_spi_cs1",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM_SPI_CS1_MODE_MASK,
 			GPIO_PCM_SPI_CS1_MODE_MASK
 		},
@@ -580,7 +580,7 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 		.name = "pcm_spi_cs2_p128",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM_SPI_CS2_MODE_P128_MASK,
 			GPIO_PCM_SPI_CS2_MODE_P128_MASK
 		},
@@ -589,7 +589,7 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 		.name = "pcm_spi_cs2_p156",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM_SPI_CS2_MODE_P156_MASK,
 			GPIO_PCM_SPI_CS2_MODE_P156_MASK
 		},
@@ -598,7 +598,7 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 		.name = "pcm_spi_cs3",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM_SPI_CS3_MODE_MASK,
 			GPIO_PCM_SPI_CS3_MODE_MASK
 		},
@@ -607,7 +607,7 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 		.name = "pcm_spi_cs4",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM_SPI_CS4_MODE_MASK,
 			GPIO_PCM_SPI_CS4_MODE_MASK
 		},
@@ -620,7 +620,7 @@ static const struct airoha_pinctrl_func_group i2s_func_group[] = {
 		.name = "i2s",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			AN7581_REG_GPIO_2ND_I2C_MODE,
 			GPIO_I2S_MODE_MASK,
 			GPIO_I2S_MODE_MASK
 		},
@@ -633,7 +633,7 @@ static const struct airoha_pinctrl_func_group emmc_func_group[] = {
 		.name = "emmc",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_EMMC_MODE_MASK,
 			GPIO_EMMC_MODE_MASK
 		},
@@ -646,7 +646,7 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
 		.name = "pnand",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_PARALLEL_NAND_MODE_MASK,
 			GPIO_PARALLEL_NAND_MODE_MASK
 		},
@@ -659,7 +659,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 		.name = "pcie_reset0",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
 			GPIO_PCIE_RESET0_MASK
 		},
@@ -668,7 +668,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 		.name = "pcie_reset1",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
 			GPIO_PCIE_RESET1_MASK
 		},
@@ -677,7 +677,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 		.name = "pcie_reset2",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET2_MASK,
 			GPIO_PCIE_RESET2_MASK
 		},
@@ -732,90 +732,90 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 };
 
 static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio33", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio34", GPIO_LAN1_LED0_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio35", GPIO_LAN2_LED0_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio42", GPIO_LAN3_LED0_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
 static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio33", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio34", GPIO_LAN1_LED0_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio35", GPIO_LAN2_LED0_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio42", GPIO_LAN3_LED0_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
 };
 
 static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio33", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio34", GPIO_LAN1_LED0_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio35", GPIO_LAN2_LED0_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio42", GPIO_LAN3_LED0_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
 static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio33", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio34", GPIO_LAN1_LED0_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio35", GPIO_LAN2_LED0_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio42", GPIO_LAN3_LED0_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
 static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio43", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio44", GPIO_LAN1_LED1_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio45", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio46", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
 static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio43", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio44", GPIO_LAN1_LED1_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio45", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio46", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
 };
 
 static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio43", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio44", GPIO_LAN1_LED1_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio45", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio46", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
 static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio43", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio44", GPIO_LAN1_LED1_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio45", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio46", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 4675cdf7727d..c47aca9f1077 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -284,7 +284,7 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
 		.name = "pon",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_PON_MODE_MASK,
 			GPIO_PON_MODE_MASK
 		},
@@ -297,7 +297,7 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 		.name = "pon_tod_1pps",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			AN7581_REG_GPIO_2ND_I2C_MODE,
 			PON_TOD_1PPS_MODE_MASK,
 			PON_TOD_1PPS_MODE_MASK
 		},
@@ -306,7 +306,7 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 		.name = "gsw_tod_1pps",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			AN7581_REG_GPIO_2ND_I2C_MODE,
 			GSW_TOD_1PPS_MODE_MASK,
 			GSW_TOD_1PPS_MODE_MASK
 		},
@@ -319,7 +319,7 @@ static const struct airoha_pinctrl_func_group sipo_func_group[] = {
 		.name = "sipo",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
 			GPIO_SIPO_MODE_MASK
 		},
@@ -328,7 +328,7 @@ static const struct airoha_pinctrl_func_group sipo_func_group[] = {
 		.name = "sipo_rclk",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
 			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK
 		},
@@ -341,13 +341,13 @@ static const struct airoha_pinctrl_func_group mdio_func_group[] = {
 		.name = "mdio",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_SGMII_MDIO_MODE_MASK,
 			GPIO_SGMII_MDIO_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_MDC_IO_MASTER_MODE_MODE,
 			GPIO_MDC_IO_MASTER_MODE_MODE
 		},
@@ -360,7 +360,7 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 		.name = "uart2",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_UART2_MODE_MASK,
 			GPIO_UART2_MODE_MASK
 		},
@@ -369,7 +369,7 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 		.name = "uart2_cts_rts",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_UART2_MODE_MASK | GPIO_UART2_CTS_RTS_MODE_MASK,
 			GPIO_UART2_MODE_MASK | GPIO_UART2_CTS_RTS_MODE_MASK
 		},
@@ -378,7 +378,7 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 		.name = "hsuart",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
 			GPIO_HSUART_MODE_MASK
 		},
@@ -388,7 +388,7 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 		.name = "hsuart_cts_rts",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
 			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK
 		},
@@ -397,7 +397,7 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 		.name = "uart4",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_UART4_MODE_MASK,
 			GPIO_UART4_MODE_MASK
 		},
@@ -406,7 +406,7 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 		.name = "uart5",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_UART5_MODE_MASK,
 			GPIO_UART5_MODE_MASK
 		},
@@ -419,7 +419,7 @@ static const struct airoha_pinctrl_func_group i2c_func_group[] = {
 		.name = "i2c1",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			AN7581_REG_GPIO_2ND_I2C_MODE,
 			GPIO_2ND_I2C_MODE_MASK,
 			GPIO_2ND_I2C_MODE_MASK
 		},
@@ -432,7 +432,7 @@ static const struct airoha_pinctrl_func_group jtag_func_group[] = {
 		.name = "jtag_udi",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_NPU_UART_EN,
+			AN7581_REG_NPU_UART_EN,
 			JTAG_UDI_EN_MASK,
 			JTAG_UDI_EN_MASK
 		},
@@ -441,7 +441,7 @@ static const struct airoha_pinctrl_func_group jtag_func_group[] = {
 		.name = "jtag_dfd",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_NPU_UART_EN,
+			AN7581_REG_NPU_UART_EN,
 			JTAG_DFD_EN_MASK,
 			JTAG_DFD_EN_MASK
 		},
@@ -454,7 +454,7 @@ static const struct airoha_pinctrl_func_group pcm_func_group[] = {
 		.name = "pcm1",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM1_MODE_MASK,
 			GPIO_PCM1_MODE_MASK
 		},
@@ -463,7 +463,7 @@ static const struct airoha_pinctrl_func_group pcm_func_group[] = {
 		.name = "pcm2",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM2_MODE_MASK,
 			GPIO_PCM2_MODE_MASK
 		},
@@ -476,7 +476,7 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
 		.name = "spi_quad",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_SPI_QUAD_MODE_MASK,
 			GPIO_SPI_QUAD_MODE_MASK
 		},
@@ -485,7 +485,7 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
 		.name = "spi_cs1",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_SPI_CS1_MODE_MASK,
 			GPIO_SPI_CS1_MODE_MASK
 		},
@@ -494,7 +494,7 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
 		.name = "spi_cs2",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_SPI_CS2_MODE_MASK,
 			GPIO_SPI_CS2_MODE_MASK
 		},
@@ -503,7 +503,7 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
 		.name = "spi_cs3",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_SPI_CS3_MODE_MASK,
 			GPIO_SPI_CS3_MODE_MASK
 		},
@@ -512,7 +512,7 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
 		.name = "spi_cs4",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_SPI_CS4_MODE_MASK,
 			GPIO_SPI_CS4_MODE_MASK
 		},
@@ -525,7 +525,7 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 		.name = "pcm_spi",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM_SPI_MODE_MASK,
 			GPIO_PCM_SPI_MODE_MASK
 		},
@@ -534,7 +534,7 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 		.name = "pcm_spi_int",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM_INT_MODE_MASK,
 			GPIO_PCM_INT_MODE_MASK
 		},
@@ -543,7 +543,7 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 		.name = "pcm_spi_rst",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM_RESET_MODE_MASK,
 			GPIO_PCM_RESET_MODE_MASK
 		},
@@ -552,7 +552,7 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 		.name = "pcm_spi_cs1",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM_SPI_CS1_MODE_MASK,
 			GPIO_PCM_SPI_CS1_MODE_MASK
 		},
@@ -561,7 +561,7 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 		.name = "pcm_spi_cs2",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			AN7583_GPIO_PCM_SPI_CS2_MODE_MASK,
 			AN7583_GPIO_PCM_SPI_CS2_MODE_MASK
 		},
@@ -570,7 +570,7 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 		.name = "pcm_spi_cs3",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM_SPI_CS3_MODE_MASK,
 			GPIO_PCM_SPI_CS3_MODE_MASK
 		},
@@ -579,7 +579,7 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 		.name = "pcm_spi_cs4",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
+			AN7581_REG_GPIO_SPI_CS1_MODE,
 			GPIO_PCM_SPI_CS4_MODE_MASK,
 			GPIO_PCM_SPI_CS4_MODE_MASK
 		},
@@ -592,7 +592,7 @@ static const struct airoha_pinctrl_func_group emmc_func_group[] = {
 		.name = "emmc",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_EMMC_MODE_MASK,
 			GPIO_EMMC_MODE_MASK
 		},
@@ -605,7 +605,7 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
 		.name = "pnand",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_PARALLEL_NAND_MODE_MASK,
 			GPIO_PARALLEL_NAND_MODE_MASK
 		},
@@ -618,7 +618,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 		.name = "pcie_reset0",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
 			GPIO_PCIE_RESET0_MASK
 		},
@@ -627,7 +627,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 		.name = "pcie_reset1",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
+			AN7581_REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
 			GPIO_PCIE_RESET1_MASK
 		},
@@ -684,90 +684,90 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 };
 
 static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio1", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio2", GPIO_LAN1_LED0_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio3", GPIO_LAN2_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio3", GPIO_LAN2_LED0_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio4", GPIO_LAN3_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio4", GPIO_LAN3_LED0_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
 static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio1", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio2", GPIO_LAN1_LED0_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio3", GPIO_LAN2_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio3", GPIO_LAN2_LED0_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio4", GPIO_LAN3_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio4", GPIO_LAN3_LED0_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
 };
 
 static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio1", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio2", GPIO_LAN1_LED0_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio3", GPIO_LAN2_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio3", GPIO_LAN2_LED0_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio4", GPIO_LAN3_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio4", GPIO_LAN3_LED0_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
 static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio1", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio2", GPIO_LAN1_LED0_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio3", GPIO_LAN2_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio3", GPIO_LAN2_LED0_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio4", GPIO_LAN3_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0(AN7581, "gpio4", GPIO_LAN3_LED0_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
 static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio8", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio9", GPIO_LAN1_LED1_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio10", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio11", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
 static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio8", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio9", GPIO_LAN1_LED1_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio10", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio11", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
 };
 
 static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio8", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio9", GPIO_LAN1_LED1_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio10", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio11", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
 static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio8", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio9", GPIO_LAN1_LED1_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio10", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1(AN7581, "gpio11", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
-- 
2.53.0


