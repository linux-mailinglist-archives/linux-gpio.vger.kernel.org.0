Return-Path: <linux-gpio+bounces-38807-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KkS4EtIdOWpanAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38807-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:34:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B523C6AF1FC
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:34:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=ztetAAs0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38807-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38807-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4816E306413F
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589F73A4F2F;
	Mon, 22 Jun 2026 11:31:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021119.outbound.protection.outlook.com [52.101.70.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505233A5459;
	Mon, 22 Jun 2026 11:31:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127890; cv=fail; b=eXhtv7MhXJhto/w+W2iCHgONqt7tg2cX/vTWQPFJdQQft+IOrOhaoQs0lw1K9i6DTW+/0F+Kk+E//vF23Mg8rw0EM3zWFSP4+5EAlXOEDZKjiCSLgqq2LLU5N295j5zSQVLpB0Iqa9Ofei0QwSj3GpEOKRB7s+3tILmgGx5HENU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127890; c=relaxed/simple;
	bh=arIm1cMEWmoS3reEDNPRIsi4xAUIl40as11gDXRur/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SM+sr0Y5gtEcE3uA8L8igTTNKgCrqftRdEFMxG+YX7I7w21T5h1YfsVKK/UMpgUsSaLVDhHgYph/280OlrD06PtiRbPQjtBZmkiwWCcxiQYNKdwcH8B/wlEy87MCIvcnEcRf5S818xRa59gpp3BYDUzSrU2nzRhotfW8rxcJ3CY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=ztetAAs0; arc=fail smtp.client-ip=52.101.70.119
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDW+44nKcM69cKRF9sS7vgsXf4gipgqZ8lPYw1WKr3AIUFU48xDHsWfzeEyPPTo9lojQ+iMA2SAfQTjk9+5sMd+kwCziLWvvhC+mMgRY9LgFC57JOzcAietqcVXA7LzN3e/gd+tQBoPBTE0MMoBemzflHkBepSEnw2f4pkP3OZ2GyMoE6XylG4lXStHMNqKavmRdrDA1GtyifVQC1MQJU5kYgj61dVcKzVN9wlbswlWPTQGjsT/k75YXg0mXv9TlfheO/s5ZExnsPqNudochgSBMbHqNQVAZWT83olTxVDGagHaeloqGdlAf1mHZNWYrZFfrxGw24z9molhQLQImyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfeuBOYh0M9fCP2TPeoz3aB2E7hVycSy/jvVNMwSYCk=;
 b=fWUk42FBYmjFdlpraA3FVHOD91vgWESjp3nT1W+a6hFRMc4LxRgKImcRvszodnEMbfwksyjKtZUZ0CgeCwAhODrroNsEC1f2to7txcifmWwDfFb3ZzOflS7xPYsQ6SdxsZU5gkcy8kJMXKDzx1jY2up7nzukgrmMC5BQWl8H2IDSTJJYzzYoDDBdFuWNsduLkbyM9zmI/JcF6ouwh5cn6sB1nJGLqEOlkpa5E9+VWYsZNXkpP5+RZQJj9aHFfemAFvwvdUk6Kkh2yeW+BAMcvGvajfqJeanx0nfnHnzMeJWZQjp8FLpjP2/AgT5Q33Jok5+RPJBlxHjRrxoNYqOSAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfeuBOYh0M9fCP2TPeoz3aB2E7hVycSy/jvVNMwSYCk=;
 b=ztetAAs0gHGj7sdm3TjYqNrpgfEK/ou4IxOY6fl1k1+KKBh9/OlYHAQvLjelDHGOdc0J2JN/t2denBgNgYw0M+j1TiZFsKfqZ15FogcHLA5mpSAtHEKyxejm3KdByCUd93PA5Ex02O0uKlqELEcvNePEpkhXgR/dFUoJJOo8A1NMoOj+HZlUCYsrYCKdkvkA0RO9RtHzhiiiAPZz4uIBW93fhg7Uh2+BMy/o4nUJ3QIymUsfw+JQW9xAkKc683Xa0Et3DkcWgRS8ph/cOP8vx3Sy1S70lxSAzKCz5ZvXxpEYy2PZkuUK/2+uQdkdKUNSPePPsW9guMTlUHPmLXdlbw==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB8334.eurprd08.prod.outlook.com (2603:10a6:20b:556::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 11:31:15 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Mon, 22 Jun 2026
 11:31:14 +0000
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
Subject: [PATCH v5 15/16] pinctrl: airoha: try to find chip scu node by phandle first
Date: Mon, 22 Jun 2026 14:30:45 +0300
Message-ID: <20260622113046.3619139-16-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e493e32-f59e-41ec-13d4-08ded051c4e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	X5qNp7qC6VtUIYyEh+Yr7zOPSlhSyF7ko6oIuKEtGh0Wh67qoPCja9+ygR/KLtM5O4khR+3zmOBbl/tgcDa8mlQzEohpoo6SFmS5Gu+nXVyVNAZu0eXsamm+UparDrYDVGhN22vwBAEPhOZrsFBYrEpNsqve6QB7vtbhS+9HF+N333W8fqMYAaMQUTdoKy2+E/xTeWo/z+9BmVHTKpU5BCsW5DSTuq5WkdCj17iZiowqff9Q/KRVOf9N5BGWbRPqEJf0Gi4XmRUNR7gZGxYwOQ2GVAlEH6E3SjVyj67634WzC4thzJKt2PQRJaY3ghCCxwhzPrjDsstauYySCzsnYnymyWqHVrk4l5MisYrRFv3y9e3BmSTTuaHAukDqxFFkr8VD0BW9IcsyMZL105PmTUXjwxtCTlhIUCW5Oqgu818VsBoUqUwsXvQuGAtdsFOcJ5Iy1XLdbVrvuKiauYxQUc8ZxFIvoaqR5jQs781f7WheTv/tz35CZ2yJOAglnlQzZnTTVqr/nIeN3U6XRkqqbj86zK/rlMs8MzRuA6p4m4Sx50JI7MqjCdbAQAv1RaeLdLcrh86NZ8OmpwSfR/RonEB1wxEMsMxB+FvjcMei35RU0rbqdkBOcD9UHQBB60+Dv9QOz9wUobbKOdvceNa44FS6qUSlsGgyNfRxRUT7b15a5cNJScBaVnhG3nVH8ISF8URW22CCAI7pzDDdYAg74FO+EQ3YNKa/rgx81FpDFNlimUZ9bQuGbHide1mMAjQy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ql7GRfGPgb1VeJz5QmyyBRmIG/ge9YHOr1pzOjcAFjRcaktqD1vMkSabRFer?=
 =?us-ascii?Q?dLmJDgnTEFvrkHEED8ns19rurA+oTYYuyBgF+26Fa4UKpkSjVEvHTZsNkpv6?=
 =?us-ascii?Q?Ma/1xLbIbFWBZG7959vwHijf3ikgvhBFa0r7Eu+vZZMLIieVWuoX2FuEHB1I?=
 =?us-ascii?Q?AOVTk/HVsZ2GuXBh+fb1A+E48JXsQF6AQOUSKxYI0ogVRmOuAmbWGnylkuOt?=
 =?us-ascii?Q?pl2G2R68E4PQzcQ1VPMo1tq/kQEoLrdz6O262Q1wALJKNcQzAcSOvvsIWlz9?=
 =?us-ascii?Q?SFhGokQ+U3wQhrJgYfuDkPpyGhKB5K/ZBu+6GrZPsy4QxIQEpkpidNvby9lj?=
 =?us-ascii?Q?ChXLzb3KEG+A+Lq/cwZAWpmtO7BR6zvWrmwjTHadYYhJ5/VOfRpF3hhZYlyc?=
 =?us-ascii?Q?v7ii5o4S56vp95i7R+YM34kWZL9vJaRKqN/mcoWnWt6m/xt/0cgg+3UComZt?=
 =?us-ascii?Q?yY3WIGsDyF8+rNVMgo4mcwG0Rt/Q//U9cvYQKo2or/gmT2kCE7xhRP1QOxZs?=
 =?us-ascii?Q?4ys7xhWJfdtvwXc/oCuKX4j9oXQwZd8LTiXSjDY6p4KE0mEuLDkAT2bjp/vl?=
 =?us-ascii?Q?Xzx7gGHTMVkASILeInPQCaooyXyrSd39+2CEfDHNrK4XzHZhsarbWXKBdjCv?=
 =?us-ascii?Q?GfivV5x9FLQFntoCf4eD/IIpt0p+nryll1EEF4fjUTyK4VF5urFT56lxmdcc?=
 =?us-ascii?Q?HB/84TuTQKkUEAz3CI4cM5rQdYCwmXQ/odWL6N1Yy2iUdT7sE6lpA2dwDFzs?=
 =?us-ascii?Q?F1qAGB+K7vnV4rXkP1t4f95ULI1ZjH/cl8LP9EpnTQdWCxHVIOIYnRyGEHXZ?=
 =?us-ascii?Q?SQtwi2jOqNqiiHwJiI9RJXOMSshIPC/rzzEc5iPoAsC0XiYcLYs+8s2he7he?=
 =?us-ascii?Q?8wW/ytckF9nUUhGIEaFEccWXsLEoIP7B2TPEzoEgrBRaNZNvUHd+9m3NATYO?=
 =?us-ascii?Q?rm01/zWRiFQTR3x5em+bnE0xFQVUS8tjlrtMUI6jFWa4yptYiMBO9fcxbMfe?=
 =?us-ascii?Q?zaC5vcZdYG1zHTwOYe4Si9zK+ucGREU12qhGz+OZx5d5wpv3zgMHvbsnKKM/?=
 =?us-ascii?Q?BghOIXGsMNcE0ntyuBTfCv+XXL+1zTelWeQ5T5+n63I2tEokGVTM/VZAFpd1?=
 =?us-ascii?Q?FZtus9oOfS9zZRfKmhIeBcPKJFWHR4rNSyWZuincl+mSv4BK8CXpGfjwjf8e?=
 =?us-ascii?Q?MChn0n+RTzQ9C7CGzmT2rukMPo7KomP48gGcpWggjjR7UbR3Dz41hbHEzH1o?=
 =?us-ascii?Q?A/u9Dg9SvXrsI9dXJ21k8dLkSI2Qv7vKQCa5lWtFTPf+Y6uD99TtCP6lHBhN?=
 =?us-ascii?Q?PlmHjVt7tW2WWIpx7vvw00dnSrqf/DIts3rPylsTWXLYsOmvBzjOJAV1WqPr?=
 =?us-ascii?Q?J4YJUSFlIpH1wHQluCcV5LQ/JGcIRAoG2WcSzQgWBVyH2uE3EJ56DtqUbIWs?=
 =?us-ascii?Q?JKEuO+Ft5DaBAw+qz4JxrnRH7AYl+widWUKNYIEsdgR2tVqwkzvt8e++pext?=
 =?us-ascii?Q?/jgyNVIHEU7niYnv6ktyzdhHtBrGIo3ImeVZViNFSjCUshywz7JMC8dVO4F7?=
 =?us-ascii?Q?SX38F1hD0NeVrgk+QDX8uwAaxMqwc1Pwc3s2/hgE3Osk82Zb4pJGYFsovO47?=
 =?us-ascii?Q?Wok9/nLZKabZSJa9zot2Wxn3MGGKg5nMiJz6fp0VQiJ7cTa3hVFnONjjca5P?=
 =?us-ascii?Q?JKgrKex6m3i44WX+5KYD85aj5oDNNWSlKQh8osvEM9fAvkOSw41uOfP1Xgpa?=
 =?us-ascii?Q?xWDlZjCw8CNrQSZNV3mdHtBBmi7yDew=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e493e32-f59e-41ec-13d4-08ded051c4e5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 11:31:14.8982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QoYriYvM5Z39PRlaSHjP6pTjQakoyu5o3dA8WhbHatK3b+L9OFZRxggoYJrgkqQyD8HauoYkML1gtM8J8pgmCtNbH3bIacQggtt1ZzBrX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8334
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
	TAGGED_FROM(0.00)[bounces-38807-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B523C6AF1FC

The "airoha,en7581-chip-scu" is not a good compatible string in the en7523
case. Let's search chip scu regmap with "airoha,chip-scu" phangle first
and fallback to SoC specific chip scu compatible string on failure.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/airoha-common.h  | 1 +
 drivers/pinctrl/airoha/pinctrl-airoha.c | 9 ++++++---
 drivers/pinctrl/airoha/pinctrl-an7581.c | 1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c | 1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c | 1 +
 5 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index abd4d2fcd227..79ece49b0c48 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -189,6 +189,7 @@ struct airoha_pinctrl {
 };
 
 struct airoha_pinctrl_match_data {
+	const char *chip_scu_compatible;
 	const struct pinctrl_pin_desc *pins;
 	const unsigned int num_pins;
 	const struct pingroup *grps;
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 6f7e65b7792b..2513fe210e03 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -651,9 +651,12 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pinctrl->regmap))
 		return PTR_ERR(pinctrl->regmap);
 
-	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
-	if (IS_ERR(map))
-		return PTR_ERR(map);
+	map = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "airoha,chip-scu");
+	if (IS_ERR_OR_NULL(map)) {
+		map = syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
+		if (IS_ERR(map))
+			return PTR_ERR(map);
+	}
 
 	pinctrl->chip_scu = map;
 
diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
index 31bae9697826..280c1c44fd7b 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7581.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -1432,6 +1432,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 8e74fad32228..7348c948e315 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -1442,6 +1442,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
index d23aa8f826d6..9ef93d87d444 100644
--- a/drivers/pinctrl/airoha/pinctrl-en7523.c
+++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
@@ -1072,6 +1072,7 @@ static const struct airoha_pinctrl_conf pinctrl_drive_e4_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7523-chip-scu",
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
-- 
2.53.0


