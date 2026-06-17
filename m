Return-Path: <linux-gpio+bounces-38605-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /sBeE/0kMmqGvgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38605-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:39:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD38696733
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:39:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=luwitfdo;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38605-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38605-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CF193138CFA
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 04:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9F3314D26;
	Wed, 17 Jun 2026 04:37:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020139.outbound.protection.outlook.com [52.101.69.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCB3318B9C;
	Wed, 17 Jun 2026 04:37:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671042; cv=fail; b=M/L4a0CZzzv/FtpbjT0Bysmry4EC4AiKiURZCurSmXq0nUjZI+uBQzR0XQlBhFkoICqZ+dZdnLsdVReqFZ5f0gWJbhrGwgD0qI5V6IU34ttP9zFBNfrVpQorHkswK7vfB8sbQlA6r7dNKMiE3EEAUWO70BYDg2atuv0y36wWJ20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671042; c=relaxed/simple;
	bh=UTWVShyI31drAi4eiU9olxTU2OleWZwTMkmjPc75obQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=svfAi5xSgRO919rkjF33zHDA1KpqYxEaTCDieCbl4GDV4Pe+9LOXQxH2SCS9pgEBWTZY4YxZQ1u+dakvwPgMdoQg/SAI7TbNygA7y7CXPtZ25KMGJjRn/ZtgCUXZPEkUeZAzSTByHluK+Qc1P23fdD/veBwOd6ZshqdKbe8eykc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=luwitfdo; arc=fail smtp.client-ip=52.101.69.139
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CePv6BVbNkRBfD0Lf89OfSf6Bbo47vaR3qdcybH2Sqa+oicZRP9A2R5Igx7xHj4J5zL1cl0KjqSHyFZY36DWDXhkgeFyQwRnQEwEy3Xg7nnTplf/NQM9mQVhxI2A56TBBrjhE2NvA/tPov0qI0fq1nQPCQHTsodJedYupK9kPXamfv7tNEwTu5mZ3Az68R5SWfN5efFjlY82wVu4uC4Du/qMx5O/5+03z+zfQzTGI097/QIcdVQXkWq6WB7rPGpqIXVvRKyVErADKe+XM8FO2WflM2jF3TeDRgRWLYibL59ckM0CnMeq0MzKwL8M1NuB6vr7SBBSuW/iKoUFwFza1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NT08RFTpKeOwV02DEaPcZQL3TN6800VaL17ktJGgzM=;
 b=WmDDaYgQR+MF9BHXfqzFwONbbKcRcflV/PcrYi4Q39PU+TCR7KMIC9yXCh4OCTDRWPH7L7S2XRQvQlf+YR/VbtEc+lj/q2gR3MRou6BdUF9Veoxsj4nlpmAUoIA07uYLrw2TkysDZgAfPkXjrwNI0JUjSQIfewtqZuGyHVEo0YG2GsHk7tm2RIeGDMbhSnim2RqrpVh4WbNr5DCG3VHHDqHLzkbYPIF7yjKBueMl97hceEu/kHd98t6HnIEc0S9y81XLrwb6Dv9hnGcEwEAJEHERCp9BrcxbhLOOOqXPN9ugklIPZf+7K4/KzapKSzv62WrtYkTXHTYK3BZZ2Y055A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NT08RFTpKeOwV02DEaPcZQL3TN6800VaL17ktJGgzM=;
 b=luwitfdovrWe2P+vV4LwpODTjEcKChHhN0lpNqgGkwOfPbS/Qp03Ujyj90yKY4ZSQhFWnb48uINLfgVKOMJSKeHak/8M61mzf2JyhreCsBzMlXGKUkibKr5VeS+jPIQjt5xcE42FRz/KM2gtphzZUjGcIhuPOzXGHOHnw+ypoJYnp0VVHgV1/aliD7Eat9w+7/XI3QzFS5bkxuBPnRRia+6HC5KP7YmhmPufmnbUfBJgklE0RKhm1xPrRdEI9JtpUPvoyaONMsKQA5XjCntUCOxt4rSXJTasIfC1F4Rvk/Cd/hbtC1YjWuo1fBIGqQfo1yiNgUHlIEM8i3L5Oqc7Ew==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV2PR08MB10384.eurprd08.prod.outlook.com (2603:10a6:150:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 04:37:08 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Wed, 17 Jun 2026
 04:37:08 +0000
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
Subject: [PATCH v4 05/14] pinctrl: airoha: an7583: fix muxing of non-gpio default pins
Date: Wed, 17 Jun 2026 07:36:45 +0300
Message-ID: <20260617043654.2790253-6-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: dc20a39b-ac6c-4d19-e989-08decc2a1743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	S7CvRagt/qroQSh6DuQGFlBsh9xvSxBRB2dcIlksPDn8lj63ZfkJfYn7rlZzIoeYg7MvNx0VtUl8pCb6NSNB4oZ8aJ/AeHV5athfcljhbNCFSkxEtNNsgIIJwInyWQ6zg+yjJtbyvE/26Z6cIRQ0R10e9iyFLasFkefEDrovnZ3KdoHADPnYP8B4PQlREOMeeZDNrWXEdIEkyBlALiyqlXNtAxMrT4NlG6vxSKySfGhpGbdvcLIxrBfhuOWFJNpjrRLQSdYXtKYJC7T1sdGq4NSXrv8MA/tLBVe9n//DRWt94Z8zko/GbAMJrvvy8a/aq6pibStGXITt0vVT8IlT5OjPsgZlRTIJxpFP6jTbqGzJHxPtIWkfuWs6I9TMuN2Ltn7ELwvPzsTaEvu0BWnH4XO29ka3DbNxBeyy18rcinbu9QUkUk6aDyuT+CINke6zOBybWJLQOIgLLrPoWmc1kscF1g5i1Az2cC6DLT/hSNOrRjtNw1Qae4zYnSwZELL2naSiHvnWyuXKXDcwiLPHhJ0nnVizDqmYRSFxdlgxh5Ky/U0vd77WaJ7Ut4RR+QlPPcVIdgxOcDEQPoXc8fmSCqV+m4O3AjJom2wCm8Asa9Xml4+XZ41rKluPMFE1K41GeEU5/2ZixNO9vnQ7aAGt96titDjZZrp5Hf4130CgPvUU/WA4QOBP6e3MtPLWqLwZ80QmTgQbjuyMgi8hmSFi0Ol+ssaS2FDi1WqFxVX8oD+Q9t5ke4JxgRZGPpWWMiqmS/ZubG+e0pLLocRq+9Zvrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yA6GOOrhrjUzRNC7RNH0g480S8tvzOjHmXZT8aEVo5xNxfqfxnck6CcmtDFc?=
 =?us-ascii?Q?FApMsWPsskknMRf151MzO8oLEoiFzMAwBNix4ICSR5IUcORNvOsiA81vOmdV?=
 =?us-ascii?Q?U+gr+8G/BqgIEoYKY592Dn0uPS9lfZHsNHToNNDb2rAsZMMVumKcefy4fiB/?=
 =?us-ascii?Q?29COpYSF01A+pdA0sQtwGB+JMHo3qsddnWr21lNOADkfYgZSM00tYUr78b4e?=
 =?us-ascii?Q?zq3EYUVPGhNuxdK+ul0LZ2BvEDZiqiyuXoYn6FCWfneWAtrjq9DT31KvKjwG?=
 =?us-ascii?Q?Sfl4befvVR6wy1L+k6bfTFkzJeji5wo2ir3drYKOHPSPvKFsFGges0XLytJ+?=
 =?us-ascii?Q?19hRdPwYIKG/FO78Iqpnki9oiXZwsUsO1cJfvM/Eksigtl/zUszHzrRPvi7T?=
 =?us-ascii?Q?Szg7AMKsY9dkIKLYqbQlzututuR1WreN55FgALhkCGdYQfI5gTM81BMN1GeK?=
 =?us-ascii?Q?rjjiBB0yMBNqd2qEFpt+gPpx1E6hCgalk+WA+f5nASg/I9gCKJ+hM1YtFYdc?=
 =?us-ascii?Q?FJ6E6TwbaPGOzfWAyoOHsGNMqCwp/gMndWoP9mlTQdQuzSY5J1eyd/hsW9qu?=
 =?us-ascii?Q?gwAFEH6rNGBFx9kpO3DTQW0qEgLkR+yJF6LgDyn+imwDvMea176bSU8XOcvb?=
 =?us-ascii?Q?+ObGT7Z/7UsGup/h3Ysp1FEQmq+uhBGlerFvDiEtTSzriAw4fzCPkQmtv0nX?=
 =?us-ascii?Q?IdIv2XprkuR2keCeFBf9WWR/lb0Q7wexkuL2g3lPQGzfEdj5OKh0sM39krCy?=
 =?us-ascii?Q?7FX9iSGGaQWwufNJYj5+7Bi2x1jQ6aC/SXCaZvxVndyIp9DWu/g1AKyr8ygi?=
 =?us-ascii?Q?0qqv6/4uShe1ljuaKO0ee2MtbEuspDs+ZpnD5/6Jhj94uDffvBij2rdm0YjT?=
 =?us-ascii?Q?XM5X7wQxbbfek6zmLWeP4FCjmpG8IBLolCsalTkSXqrglaYE87sbrDgmuIjU?=
 =?us-ascii?Q?3ovdJfSl6HG/MyhEvgQ644kW9Hf9SHDW4AvG9GoZKgZ0vzXgBt4vyk6q7bZE?=
 =?us-ascii?Q?+ZAVrhYF7+m0JAw+kZz8SIjVf2DwrG7oGiHwyUK9KWkO0SOBSfm6rAh1PLIP?=
 =?us-ascii?Q?a699Sq+BLah/b7RVm3vV6ioOxEJCXY4MZ6ScHzLBob0EP34IxO6uxLUVqlGi?=
 =?us-ascii?Q?jPWXqTxlRg6DFi8jg1hr+eV/uWgwsbmNrrAQ8KAdBXZTZDXbs4O0hY8TC8SV?=
 =?us-ascii?Q?XIk6HA0l7z5liSRfxFDBogrd7YKWcJaHGc39P/5bPByNgCg3IFcbIw4Uh3+5?=
 =?us-ascii?Q?ZGLYKJ+SSiYjLGvvNVScZKnElq/euId6w2FKVlzjsfWay4hDMwzX1VlVkMUx?=
 =?us-ascii?Q?8WhWO2diTaPIPOMaJYxPVjV4oUV39H2l9hbzU/kH8S33vlfTRAUZWlR5nk+D?=
 =?us-ascii?Q?QLnT6ZL+Z/o0SG1Bb5v0AmjgXnrluQftpnffAXq3P7OmOe+0yz2FjoqjQBf3?=
 =?us-ascii?Q?QHugl3AklYoQ3npLzghCS+qoGxKLRww0GCnjxina5xhtcw1QfDoS8WHcfvCa?=
 =?us-ascii?Q?bTD/dA6lIwm7JKzSpkcaix/pJSSNQlpEaf4iYIIiywI06/CvlgsWsMD64oHw?=
 =?us-ascii?Q?F5Mzznnem9MbT8KiSnhnPdHusiCNrLVZ+3zYkldttltK44tMTuRWPU1NuoOG?=
 =?us-ascii?Q?udYQ7fPo/nJDzVjKrAVjcFExDpxLISFVyMUgWHrPEEYaqqwz2Xi72prad0yf?=
 =?us-ascii?Q?GptpIXX1vqrd4l/giSrVCZ/Kygf5RuqbulqLIDPfwcKNtd1RLUtLqGviYLsD?=
 =?us-ascii?Q?dpcjs3C5p0yTGrNd8t9OpqjEL2nI5b8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: dc20a39b-ac6c-4d19-e989-08decc2a1743
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 04:37:08.5851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myLbwq5wS1hAVXSdzqDX0XG8eQ/QFVqi/4QqqIet+rqGcOrwSBmjqJ+EJj3q8fhKf5jYFl4AS4RmGzigjA9DyBClWMpDbs/5SW1J4k+skqM=
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
	TAGGED_FROM(0.00)[bounces-38605-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 9BD38696733

Current an7583 pinmux implementation have following issues:
 * pins 51 and 52 can't be set as pcie_reset, current pcie_reset code
   will sets pins to gpio mode instead.
 * there is no proper way to set pins 41--54 to gpio mode.
 * pins 41--53 can't be actually set as pwm pins. These pins must be
   muxed to gpio mode as well.

This patch fixes above issues.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 100 ++++++++++++++++++++----
 1 file changed, 86 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 4bbda392625a..10499e708f2c 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -84,6 +84,18 @@
 #define GPIO_SPI_CS1_MODE_MASK			BIT(0)
 
 #define REG_GPIO_PON_MODE			0x021c
+#define AN7583_MDIO_0_GPIO_MODE_MASK		BIT(26)
+#define AN7583_MDC_0_GPIO_MODE_MASK		BIT(25)
+#define AN7583_UART_RXD_GPIO_MODE_MASK		BIT(24)
+#define AN7583_UART_TXD_GPIO_MODE_MASK		BIT(23)
+#define AN7583_SPI_MISO_GPIO_MODE_MASK		BIT(22)
+#define AN7583_SPI_MOSI_GPIO_MODE_MASK		BIT(21)
+#define AN7583_SPI_CS_GPIO_MODE_MASK		BIT(20)
+#define AN7583_SPI_CLK_GPIO_MODE_MASK		BIT(19)
+#define AN7583_I2C1_SDA_GPIO_MODE_MASK		BIT(18)
+#define AN7583_I2C1_SCL_GPIO_MODE_MASK		BIT(17)
+#define AN7583_I2C0_SDA_GPIO_MODE_MASK		BIT(16)
+#define AN7583_I2C0_SCL_GPIO_MODE_MASK		BIT(15)
 #define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
 #define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
 #define GPIO_PCIE_RESET2_MASK			BIT(12)
@@ -782,6 +794,10 @@ static const int an7583_gpio45_pins[] = { 47 };
 static const int an7583_gpio46_pins[] = { 48 };
 static const int an7583_gpio47_pins[] = { 49 };
 static const int an7583_gpio48_pins[] = { 50 };
+static const int an7583_gpio49_pins[] = { 51 };
+static const int an7583_gpio50_pins[] = { 52 };
+static const int an7583_gpio51_pins[] = { 53 };
+static const int an7583_gpio52_pins[] = { 54 };
 static const int an7583_pcie_reset0_pins[] = { 51 };
 static const int an7583_pcie_reset1_pins[] = { 52 };
 
@@ -862,6 +878,10 @@ static const struct pingroup an7583_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio46", an7583_gpio46),
 	PINCTRL_PIN_GROUP("gpio47", an7583_gpio47),
 	PINCTRL_PIN_GROUP("gpio48", an7583_gpio48),
+	PINCTRL_PIN_GROUP("gpio49", an7583_gpio49),
+	PINCTRL_PIN_GROUP("gpio50", an7583_gpio50),
+	PINCTRL_PIN_GROUP("gpio51", an7583_gpio51),
+	PINCTRL_PIN_GROUP("gpio52", an7583_gpio52),
 	PINCTRL_PIN_GROUP("pcie_reset0", an7583_pcie_reset0),
 	PINCTRL_PIN_GROUP("pcie_reset1", an7583_pcie_reset1),
 };
@@ -891,6 +911,11 @@ static const char *const pnand_groups[] = { "pnand" };
 static const char *const gpio_groups[] = { "gpio47", "gpio48", "gpio49" };
 static const char *const pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1",
 						 "pcie_reset2" };
+static const char *const an7583_gpio_groups[] = { "gpio39", "gpio40", "gpio41",
+						  "gpio42", "gpio43", "gpio44",
+						  "gpio45", "gpio46", "gpio47",
+						  "gpio48", "gpio49", "gpio50",
+						  "gpio51", "gpio52" };
 static const char *const an7583_pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1" };
 static const char *const pwm_groups[] = { "gpio0", "gpio1",
 					  "gpio2", "gpio3",
@@ -937,7 +962,8 @@ static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
 						 "gpio42", "gpio43",
 						 "gpio44", "gpio45",
 						 "gpio46", "gpio47",
-						 "gpio48" };
+						 "gpio48", "gpio49",
+						 "gpio50", "gpio51" };
 static const char *const phy1_led0_groups[] = { "gpio33", "gpio34",
 						"gpio35", "gpio42" };
 static const char *const phy2_led0_groups[] = { "gpio33", "gpio34",
@@ -1483,6 +1509,36 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group an7583_gpio_func_group[] = {
+	AIROHA_PINCTRL_GPIO_EXT("gpio39", GPIO39_FLASH_MODE_CFG,
+				AN7583_I2C0_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio40", GPIO40_FLASH_MODE_CFG,
+				AN7583_I2C0_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio41", GPIO41_FLASH_MODE_CFG,
+				AN7583_I2C1_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio42", GPIO42_FLASH_MODE_CFG,
+				AN7583_I2C1_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio43", GPIO43_FLASH_MODE_CFG,
+				AN7583_SPI_CLK_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio44", GPIO44_FLASH_MODE_CFG,
+				AN7583_SPI_CS_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio45", GPIO45_FLASH_MODE_CFG,
+				AN7583_SPI_MOSI_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio46", GPIO46_FLASH_MODE_CFG,
+				AN7583_SPI_MISO_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
+				AN7583_UART_TXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
+				AN7583_UART_RXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio50", GPIO50_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio51", GPIO51_FLASH_MODE_CFG,
+				AN7583_MDC_0_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO("gpio52", AN7583_MDIO_0_GPIO_MODE_MASK),
+};
+
 static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 	{
 		.name = "pcie_reset0",
@@ -1490,7 +1546,7 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1499,7 +1555,7 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
@@ -1635,17 +1691,32 @@ static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio31", GPIO31_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio39", GPIO39_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio40", GPIO40_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio41", GPIO41_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio42", GPIO42_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio43", GPIO43_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio47", GPIO47_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio48", GPIO48_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio39", GPIO39_FLASH_MODE_CFG,
+				   AN7583_I2C0_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio40", GPIO40_FLASH_MODE_CFG,
+				   AN7583_I2C0_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio41", GPIO41_FLASH_MODE_CFG,
+				   AN7583_I2C1_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio42", GPIO42_FLASH_MODE_CFG,
+				   AN7583_I2C1_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio43", GPIO43_FLASH_MODE_CFG,
+				   AN7583_SPI_CLK_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio44", GPIO44_FLASH_MODE_CFG,
+				   AN7583_SPI_CS_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio45", GPIO45_FLASH_MODE_CFG,
+				   AN7583_SPI_MOSI_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio46", GPIO46_FLASH_MODE_CFG,
+				   AN7583_SPI_MISO_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio47", GPIO47_FLASH_MODE_CFG,
+				   AN7583_UART_TXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio48", GPIO48_FLASH_MODE_CFG,
+				   AN7583_UART_RXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio49", GPIO49_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio50", GPIO50_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio51", GPIO51_FLASH_MODE_CFG,
+				   AN7583_MDC_0_GPIO_MODE_MASK),
 };
 
 #define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
@@ -1899,6 +1970,7 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pcm_spi", an7583_pcm_spi),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("gpio", an7583_gpio),
 	PINCTRL_FUNC_DESC("pcie_reset", an7583_pcie_reset),
 	PINCTRL_FUNC_DESC("pwm", an7583_pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", an7583_phy1_led0),
-- 
2.53.0


