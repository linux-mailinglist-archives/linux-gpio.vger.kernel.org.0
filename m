Return-Path: <linux-gpio+bounces-39059-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0uJhAvIxQWqumAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39059-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:38:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9551D6D41A1
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:38:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b="3/8fByMb";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39059-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39059-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4852E301DE1A
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 14:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F339A3AB47A;
	Sun, 28 Jun 2026 14:37:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023110.outbound.protection.outlook.com [40.107.162.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619932E7366;
	Sun, 28 Jun 2026 14:37:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657476; cv=fail; b=MPu8D7VIG9hPrajjVkrZaxPkXlTh/lp9uIz8bcGzTwZeUJhP0VumrgKEjizZKx0UyAoYKDVAfaAAS8k0za8I03STzL2zsctYa7LmlXljILBYGy2NZAaKDVwwUwhNiRxCH1sCkqgg1JlSbMbrNa5eS1loJN3djtWcxibZMCA0PU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657476; c=relaxed/simple;
	bh=5Nlwu5Qy9j4jVSPYL7aV+3OUgJDHo1h0nuQo0bbS5l0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qlIY5Durb1FNcwVxlTM+pNJ74ZwxTd1Pp/OK7AiGx0h0KfGFU5ZdfGK3oJRs5S0radtUTVmCCtQWjTDmq0w0JixCf3vnKw6Ci6NqUekMHlYzPdYlikuhs2E5jMlbu8Oxv1qMm3+laeJYOgXocGchrHHu2AExEtacKJA5Tc2NFRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=3/8fByMb; arc=fail smtp.client-ip=40.107.162.110
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMqmw1V/QcNqR/YdjZL4jllcmr4tC0j79vZUdX/IqMmRgHAj6gj0VD2qp/egtPbUDs8V4y97GRPtYJlE8cTOlZ1AEsrrwCssg2vJVS5c9QkwJmxlWQvMzJ+4BnfI5wzMgu+/iBMhYA8tZOk6eJ6+SSjir91BsXtWatbW8dD6AhiD1PD1nFzaVEE7skWyf710gKj5qLv+ZlLPObXkipxdNpLC/lZYooHAVt9gJ8tFiwPceS4bGdDgLW/DF3JI5z/3QkubN/WqFomIoXsEek/YUuTWw0UVq4FISVyPSknPdu30x1mZGQhLoEzRa1TTzn6nEEnL7qTGiAfgMn/d4iE/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4NnpCR8m5Q61vaQYwB+tHmg7AS31l7ZOwCdkgSO3cM=;
 b=Obhx9KId6Jhbj43oclDhOCSKEilFPSndxqjN78soj7wWFcr+WaWMCCO+Omq9Snkyp4RJ1nSNKbmgGCzNk9o6kBi0S2WzDmwGfnHQSGNY1ovb+TIwHZPnA+3m9+qqrcMPQBLcAWx+A/ivj1j3uP9L6UkBt/OD/o5fvXW8lP/VEdMeBHe9WYihEk0nVTW06KjkHKJOK62nuZ74bPtAzvglOakKkM9JVjMO9yIlc1ZN+lPshqkKhxHP0wK+OF80LoC5cvtB2FzrKXd5E8d36ExRCXveu86uGrt5ofF1V89G2r8uWC3rv4oVv4/G6VzUGoCASfQ1Q/vd/JYSYG8JJskESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4NnpCR8m5Q61vaQYwB+tHmg7AS31l7ZOwCdkgSO3cM=;
 b=3/8fByMbqzQAswYueyhWJ3S2OWQCGJBXoTCk23/eHNrQ3EalqqWfRN6Z8lG2UIygWpKNu2ITiBdHosv+qtnzfDDhxbxfeBFgQkibveoMSLlnYZFgdWwl6nR9SqrQgfyekqKTRMICEICJY9Ac+YKLS65WRAc8i7DVl5PSkEHln/ysaZ5BrXwjL9y98PNxRuSMWJT0Pk4vBOWxqzeF1vNlqA8cQM42LIMYybR9DQ6GUg4/haNaiSDScpQjhMYtU7AtdQoSOgDbs6a+jIft7I6cmNQLVuWn7jjdiBl7HiDaY2q5ldXnDJseEBAma/xfbRgV93hdBzcQTrfwdO23vjCGfQ==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10009.eurprd08.prod.outlook.com (2603:10a6:20b:64b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 28 Jun
 2026 14:37:50 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0159.007; Sun, 28 Jun 2026
 14:37:50 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v6 03/17] pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
Date: Sun, 28 Jun 2026 17:37:19 +0300
Message-ID: <20260628143733.273651-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0006.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: 52f6f338-3817-46a0-f0fc-08ded522d473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	0H9/JRL+yt2n1I007FlkCqtJedVfVbh9B22tNVax5b90zdV3sNBN3XzHlYO3cN8n72usgewMjHzaZZ15zvGKMTB6ZdWwIBC9l2KOS8EJ0ywyhKYpuBvrqIgi/oOsQtdQ+PfQ/urww8WFbRZKzfvMz2AXehTVtnTk97tfDB+QKHIX/OgMZj9jW/a88m4M3ryXHqgdc5HWtpW+UQ+O5RWD9gnqULiQndC2c/wOdGAVEEy1oizPFp+bjMKQIjk0N2+aDvzD/EAU3v2lZfCT59dnb/6F68PJl3CWTO0FEwrbWYmuZIUDkveYI5RMXvEOdAe4xtVrDYmsnIeKEJ/TZGNWMeRb4nB2LDSlgYa++ga38k66LG55tNhxnT8jOmioI6Z2bzfurTHoMVBFs8sI0EieOywEwGncl16976vxJx1u81cpLUPqQVFvHO9kBmgseW97ZLFkeX+JtNoAs0pTp/yq5swcNtAFoSvxscuegRL8dnkJz99/zGSNx0IIYTxv+uHubWeJ6jUIY9NvW0DHN41JvN+aN52Rm2UVjZ5CPCv73AJyni5njhdKk7jnWZDibRvCyhYgRbc5bweieswsZH5WUDq6gIteP0S8npJB4J47ntcqp6Pn3kTaIJYpDq5cR8yXKg8uBTDm6qg9eV5eHa/yt0S8BRKjuKIwspKuCyddIbFlHIGkKXp8fl8uPxGppLRQ1+cV+7xknY2QdqEETuVKG5NWbqtDg5VYN7xk30FlDT06dfvn06zhsvYt5nqrYY3t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dvvZyVpvemKfRyzvCFTF/BMlEAU5i/Oj/n4nv/B/qgOTgPYK+fa5p9C6/daS?=
 =?us-ascii?Q?yXpnoOpsZoiLTXPn8B42AdMVRayEgJtQFqH+yX0lylJOtqgcqdcJ7V74XtMV?=
 =?us-ascii?Q?N/Kbtbe0wrKZi19cgzbs7cslQeF57tQBZ8w57sFYSV3V9RcmIpN0C6By2vcv?=
 =?us-ascii?Q?TG6iw/s2ps8AQUoCmbX4N9u0EVE/GqCAJ0k3aWj4fIV5hTEXRzNBWDRYz2/C?=
 =?us-ascii?Q?zJTMKlnVIzJ3ZZdzJLMk9ziwXdQsUZXyIvtVJS/L6E+YSKEhEboMQMd7BW9w?=
 =?us-ascii?Q?WaRCILRwYMKIkaesqEal63FTMkmnNkeQGCNpDa63OY2G4/3LIYbJTmoO0WtP?=
 =?us-ascii?Q?1xkftZiCPKn4D6wNQeMBlBKKSaVcTKCfveikWCOw0zCJI6sRL7M1JTvL3Yne?=
 =?us-ascii?Q?HeTKInHqhkDqC6dOzAH753uskGfZm7MoX7aG3boi93Yjcja5Gqa4GKI/VVj2?=
 =?us-ascii?Q?wSB12BrbOC9aj9pmVSgtAt/CIUivNXev/zxFB429HRYRQDKx73cRg2iYEpM2?=
 =?us-ascii?Q?DpDzUJZDxMSLUUyOQQJy2f0VTPQccZxENE/VaJnoifGhqsBXRZH9eB0VxKPb?=
 =?us-ascii?Q?waBMLJqDvX+SyBhSBYh6ubVcHhS4sJiSOhjB5dWH8yFrTOMkhIzJhgfpalG3?=
 =?us-ascii?Q?gmHCYiA3H1tH8il6cqoXzDl8dUZjnXwaRJ3tMtcx/qesUqXtsc1HqGkHMMZr?=
 =?us-ascii?Q?3OtQmTGdXGLT2HRkqXyBza+Dg2fpWHU3Juy5NOIxKIH+otHIxg1w6XX/HyB+?=
 =?us-ascii?Q?tyUCnELWIp39mVRY2Kwri0/wdr9YogzQRduGdrN5dFQZv7jnsS7xT8M+186p?=
 =?us-ascii?Q?zz7pB1XDE7scNunNdiEbJ+1Cb8drhUWe8TY+UvcbP3yAD7YHXpIUv1DaP27i?=
 =?us-ascii?Q?YLmssc6hDuNJi2ilmPF/ScCJFHdMSrTXv9llfip26D9+s++t9lS3DGEUxMN1?=
 =?us-ascii?Q?e1LucYlgT1g0/dpT47558L+pfswvtyUj4qoar3/Fa8R3xJ8CmlyLqCaJ3ASB?=
 =?us-ascii?Q?vP2XWPh8yj4tykDL+HEi9DJFbu0EZoM2zhXaGnB1GrjNbFDgCzadUcDq9poy?=
 =?us-ascii?Q?korqY20tBQKBd1kraQsnmMMN4x0PtroIu+W6QGf0j8pN86rCd9jQGD7qFclq?=
 =?us-ascii?Q?pXl5H0Pjz4ShbnJaWjhMotyFaNT5Kj31GTT5vij6z2SkTHrZk5UmRVz8/ILn?=
 =?us-ascii?Q?3uRZx7oXCZ4dY6fvpsm2i3dCmc1IHT8MXPjkrbDLcSTlBkcYzIgDKmiWjSW1?=
 =?us-ascii?Q?HjhA7CjWC2r8XPxaRjPyoPumW88Pep6fI4H6gpv8a0XLGd763bwijfgaoOL/?=
 =?us-ascii?Q?MzZVfOA9LmLmR1QGVTiYsSuPJwwvE196gjA3fB5ulJ8HyKvBHb/iBB2OfS0Y?=
 =?us-ascii?Q?sovUG87JTioIEpDqkA3oO06AfhTPOdYUlklUkIWsSMMcLavGjqBRJ9C07fVW?=
 =?us-ascii?Q?pY7DSG19gy4cRbljqKHQf0ca3vejQQG5prm9Tb9Ps7FPFn/7VWf0VerbaHXu?=
 =?us-ascii?Q?sYea4MuqHP5fJQPLV5h+2tzvJbYpSTkg042UQqRaOlzwOy1TPrmUHnW5/nV8?=
 =?us-ascii?Q?kKWUv5XwbuAoPgQ9LOhQe8yGl49O/05OzjdSMlYayd+EZZt9RpWbFXmCs9l7?=
 =?us-ascii?Q?8vR4F0iGyzjFRNcjYWlaKPMW5Gwj7dhYnbQvxis4o/yQUF7jmBz+OozTgPsE?=
 =?us-ascii?Q?KAfntKll0UB+jcokL6xpeZXBLqnYr8s6rpyb8aCl8Nxvg+vqvJCBgh21zgbi?=
 =?us-ascii?Q?htrTK4xorMohmwEBqCXFBaJzpPS7cXI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f6f338-3817-46a0-f0fc-08ded522d473
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2026 14:37:50.5182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZj6tYRqu4v+FFB7V825w13tQVrjQa0qa5gV6ovU2GkNtYwNvijDKPPbvgwZjcdUw6OBDyHAii9kmUUBB5TM+RrWNT8rdKKdf8D3q6xsHjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39059-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9551D6D41A1

I2C1_SCL_PD and RG_I2C1_SDA_PD bits are swapped, fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 63c82268aa82..4076bd0261d1 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -184,8 +184,8 @@
 #define I2C_SDA_PU_MASK				BIT(0)
 
 #define REG_I2C_SDA_PD				0x0048
-#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
-#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
+#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
+#define AN7583_I2C1_SDA_PD_MASK			BIT(15)
 #define SPI_MISO_PD_MASK			BIT(14)
 #define SPI_MOSI_PD_MASK			BIT(13)
 #define SPI_CLK_PD_MASK				BIT(12)
-- 
2.53.0


