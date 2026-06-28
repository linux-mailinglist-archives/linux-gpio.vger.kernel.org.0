Return-Path: <linux-gpio+bounces-39070-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q3XtEDoyQWrGmAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39070-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:39:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 475FE6D41D4
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:39:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b="LQ3gea/z";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39070-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39070-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B1A0E3010D2F
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 14:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B6D3AFAF4;
	Sun, 28 Jun 2026 14:38:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023110.outbound.protection.outlook.com [40.107.162.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DEB3ACEF0;
	Sun, 28 Jun 2026 14:38:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657502; cv=fail; b=bvp1U+Zxbo4rEq5nvjDDHhrfSbVPQWM6BZ5YqBKIRp9rAdOcQcCULG2G/Z1c8kpuH83qDnof0h1DQsJi8c44U0rE+MbbcFubSqk+xlOt0cUn0YEWG38gJhuC4wQtUTG6AVqmJ4aIeFt8/oALcw4m/ybWgXUU5VqqMSwQvFDhd5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657502; c=relaxed/simple;
	bh=2KDoXf3oE82a6hWPHuLUnLftfP6k8CIEjNLQ2noqkaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qZAWNh67t8HSInGOWvPR14A3/m1bvRmkeHertyHYBaEvWA2fVP/1U7rX0AFEMLTHBqvlPSRZ1zM0evggdu57c/cA/SlllmwpopDmzELLrqYD4mjpwdpRpGoqDGw8y798Pyx4N/KPaDU28fKnyOH/rOOopzSfakxe64cxdX/LLwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=LQ3gea/z; arc=fail smtp.client-ip=40.107.162.110
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wr1894EIfVtj0orLdDFIw5CxAx+0wc+RJ+AJz6ZDqbzpAiGnccxrFHnRZQtnjMe2s/VJEz6UdFIRUJWX57Z+BXgS+BShVsE0zEVcRONoaHk1m4JOhtwGrqJzhyZ7syPPnduFN98SwiK+qlnZgofYQ+uRwKFfF5YLKxzr2PKxDYT0qxo3nOh+3nFuuSDAJfOv2AyEVukMBbCo5bNQDQ4fazkaAKJt+HMtOKejRQ+4fW3rFv3614AQXETcuo88FB0l0UisSK9lYQzctEPdSChi8qE6dBfxiBrb2GjWG3HUm1r2r5YNZ7UybxUvQPO8LC8M4tpATqfVpmCV0ioUUTXXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9O+MEMswwJzUlOWbTKDKMXZqGYXppDrvRdePnMw9lM=;
 b=qOtV05Ko1iUvycnR4bcwAcRMbnWqj0HW765BqmbICdtu95fFN/Urt+B45aKbOz/R0btff+MPUU6eXebsKYyeDXvoI43uKpJV5SHhm8DvqvFc18b47qSAoK3kWstzKDQs63qFehHrRqgMKkX+T+RhEr83urWh28f49lb37MWJ6OwHzX+nYfK90xRsxJosKkEDJ0UOvU6rrvhMUMr578itDA19hjRi0GuhBTRBCguQZ3ALE60buS6NFyQZvvAGMLzQZcfF2w+6obLS0QbgD7M6rKPOwkrXrz49WT8oU2c6i2wQBQ98hVkfn9xAtmmloyGaDMrsPa5KXuXlmoTrUcPi6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9O+MEMswwJzUlOWbTKDKMXZqGYXppDrvRdePnMw9lM=;
 b=LQ3gea/zDjWqHUpmht4sPXC9gz1Gnfv2AEugBye09/bI5Gs+73bU5oCFVfOA9tSHJ9Rt0pYHykml3kBeI/GHYDkbP+V1z7fgjC+dv/d63JqZZFaTB6H2UG0ow5Dup1oFS1r4ASB+46gNbJR29lhNaJQ7zUcd/bROMBUDRT4shMTBBqJqVruh12bLU5JfID5a3nB1Dl96KHEtlFTvT8vLhEoSIdIGzeHpTJe97mDt/4k2ge5ekXbUmOOdf7yzKOOSnlU0ESVLE/NxBew7dEvG7qwVchB2TJKUDah6WdQdy1Y/vy52UJKNOsnHUBP5Fv0LA2NYWT+uMwYtaZAVtJo11A==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10009.eurprd08.prod.outlook.com (2603:10a6:20b:64b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 28 Jun
 2026 14:38:01 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0159.007; Sun, 28 Jun 2026
 14:38:01 +0000
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
Subject: [PATCH v6 12/17] pinctrl: airoha: an7583: add support for npu_uart pinmux
Date: Sun, 28 Jun 2026 17:37:28 +0300
Message-ID: <20260628143733.273651-13-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 6354d923-0699-4996-4cc5-08ded522db1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|3023799007|11063799006|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	OJbd/iZFYG0QIkE8OkGpckQ1aTT0Q3t9FHg6RAvfH8ZhZvF1q1gzY7Ze/xVmboUxTY+2uoo24BldxxSY23HM0N6wSv7zAzKHbx91OqPIgSMI4gfr7cngbLqnUAClGTb6NYS/gDUcnQ6JOfV5qcEeH4QJtzv/yG+uZfoi9E6BNfZyq5G7AahDZ7A06fU71hYXL3namKEBAeaRb8IHC+9KilnR2ZeKGJnSxAJlIBPXuMKpxDF3aJ1j87useouJVjDXbdWXNyxtGVzQkOQyDnhldS+GuCZ9A/seOKNbhN/JHglo57Cm0YVdP0/mdaYA+4FNU53cCpCscMoRCnptqJcQoe+jmrMG+tULLpVnmg8vs4ovL2+7ENZzyCRaDYbAUsKkUZQY2IbTFycWk0RZZMa9x+aozg0kZ7RlVEn5g3cP/DLt6l+q6XYVNadc65sctE9kaLuev3/Od+KmME7ujg5d5KpfKSAkagm0pMRIz7BqLpdTdQjuvpatBxxv9b0ZOPl1jXlCynBQCsqFwDO7wNBObVZeAmCtTIUijQG6+a1X+uj3UEB04paePWj84OjDF6KVVNIT55Zrb1Sbfa4paEzwVcuMDuoRDA9TqNTnTqYVVsqTpqDtacqycQ47gYJO46+aQ4bYnrKr3B+dSvtvlrdskwnsOc815L9MqKuWiBOkKK4CJdUYGyV3Aqh59YccRiK4LYbnUXm4Wy9tlID+/mxARK6YQMjVFxS3b9a5vo9pnZucvmCpLCCUEp7VEAfTJdYv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?feUji9G0j4Z0iTSJANB32WQBRlO1HmNK1tt3cbgE3SW54CdLdPbx+Eledyqj?=
 =?us-ascii?Q?71iQ6FUSiViaRghLR8xeS1vhEAL5vANGmmo7SO00/ERAkMo8vT9yqnaD369S?=
 =?us-ascii?Q?6jHGjDrT3yplGlSs6lm0OGDLHKpSqi46EEj5AwvG2piPskIqABSDGqpzKqfc?=
 =?us-ascii?Q?9IwelMrcaq3hsmBcqwmIdHD8euAkk+tyWDaKorvPs2+9uOh3wNNuCE9bbkr0?=
 =?us-ascii?Q?4zIBwElVtnBb2YLp14u+Z8zfxWnzXVpPdqlOSQED2pIR1n9ZN3QE6SyMyyE8?=
 =?us-ascii?Q?A5XbeNqJS8M0YT5GzFQzz5TQIqUTlohYAa6UwMLATQ5pizhasD7FQjlw3Seb?=
 =?us-ascii?Q?DIkioE5xq3BNosmWM6LtYoh3mpEvaEPxxq90UrDr2NJ4RVvZfTahxcGfyXaS?=
 =?us-ascii?Q?yc6U5J2FcejjGS9XIO7LcjTf6PwM6P9PJ0VhVYOUeNSkWIbLDyh4PMXMvyEc?=
 =?us-ascii?Q?S4rDS83risZu2BA5o1b2YXaZclvkc/Zlqhm8wL2NygUJ15BcFP/k55lGY40g?=
 =?us-ascii?Q?e7Y6xqKn5RoTINr3wWMYVz8IFCjRuyt9NaQV+SnbBhwVhICnReGT8K4fSo3/?=
 =?us-ascii?Q?EwN2iOeAw8D7d+V/FQjoZ/O7TzMvUQ/+Gs7aJ98nYecrfFtFYZu8478mKqNJ?=
 =?us-ascii?Q?tnvij1IUOBnpLp6hvUoRcMB0Hn1gDy0XLcbGOO6JqlCqBP3A/c1s0sci5yc4?=
 =?us-ascii?Q?q66YIy4T9PazpBsKLqbGfWF4rplJUnMsJ4AQ5lioyjmTVpTv27PKPiWuwXCA?=
 =?us-ascii?Q?xNXJqGq4B7waW7hWqtS7P2AvVqocra+U+AJYciHEnhG6qsAph4o7Yp0BjDlG?=
 =?us-ascii?Q?Y2Q7inKs1ep1rF2hM9IIjSUWTLbVIqZLwKcxQYFTq6Yy7QBu+sQPe0ZgkwVU?=
 =?us-ascii?Q?avi/mUTjeHkQWHGbcmYP4Qf1VK6jzWsh53Jt6mX7YQsVXfs9yrrIzZa04o3h?=
 =?us-ascii?Q?fPFeMqJfiAzZMA+pS7+cEz1qg52hMz9L7zuxlsNrA/EQVDG19Aa3YMqE9jD3?=
 =?us-ascii?Q?V3trUd9seINOuGQinYq/3l1xwiHSBh5uaLodVJzbwHnuFQ/qrdHTi9VmZMSs?=
 =?us-ascii?Q?lan7oqy/J9UeEJSXNSDCbWwSvIbhtD+1V2dVRGn/n0hB0Jq6FtSbz3ayY/tm?=
 =?us-ascii?Q?O+AgMn/Y7m4JRy1NAM3e9pf4J3IbUHl3l7xbjv9P1jqbzdiY8nghKdRsRY3c?=
 =?us-ascii?Q?p7XpDpai6pkLxTEUsZuc6CzHvb/bNUnAr46y3qovl4rqLgXAa/cXXyztJbyP?=
 =?us-ascii?Q?Qu3RLEIvgCPTNeYvvgafaiqKfNwjvXR+xUdx+2QVmEY5RhB8xZAq1LfRxSmh?=
 =?us-ascii?Q?pgWSwfMlHUibKCqnO4ASNdhHkNXI99FA/2ucqt7fBGqVBSzGpkLOkTMinkXF?=
 =?us-ascii?Q?ATL0MY8bDN3f9bquBaCYa8ty3BywIT+VuHi+OE7FzGLMoqPjTjp12B6a2lKy?=
 =?us-ascii?Q?vaKjSwKzuM3+BTaIiRExBRu5qKs4ouStoa+D6qrW7nP/jNQv3NAtTb7SBHTX?=
 =?us-ascii?Q?N7hYlYHFHWll6Lv8nTs20yyPwMlDi45+VE3mHuDeMW6zmNk/qi1EdyTeVysD?=
 =?us-ascii?Q?Ksx+SA8lpz5lEJW0RElCUt6qHUuBsQdVVNPNzLBJuLckUZvn9m7oeHFXWaoA?=
 =?us-ascii?Q?IzAy6hidqVs0B0ND15XQkG70XCQgymhQpJGc6BlHtxSjDWr/2urmwOnVsTBX?=
 =?us-ascii?Q?PiJQVb2OiMuyCQofUiytMBx4T2EsB2nnyACp/U5JBDVZH1o+O+61hQ5yEE5N?=
 =?us-ascii?Q?uANRIRw9KmlYICR1LH2QQ15ySbPYoUg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6354d923-0699-4996-4cc5-08ded522db1a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2026 14:38:01.5894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUVO1CPrinoLY5gCBTFqSGcDqSLpIzqz2dR8nfK7AiKLcmrBwWJ0Pp2JMHjIu87YHVeRGMWbFDj/wIhL4UkySPYkDlLlIjzbCJQST3nO61A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10009
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
	TAGGED_FROM(0.00)[bounces-39070-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 475FE6D41D4

Add support for uart pin function for npu_uart pin group.
Also update device tree binding schema.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../bindings/pinctrl/airoha,an7583-pinctrl.yaml      |  2 +-
 drivers/pinctrl/airoha/pinctrl-an7583.c              | 12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index bedcb6374f1a..0a217429b2cb 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -115,7 +115,7 @@ patternProperties:
                 groups:
                   items:
                     enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
-                           uart4, uart5]
+                           uart4, uart5, npu_uart]
                   maxItems: 2
           - if:
               properties:
diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index b0b1dbbb4d76..9b5c7ea5e547 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -68,6 +68,7 @@
 #define REG_NPU_UART_EN				0x0224
 #define JTAG_UDI_EN_MASK			BIT(4)
 #define JTAG_DFD_EN_MASK			BIT(3)
+#define NPU_UART_EN_MASK			BIT(2)
 
 #define REG_FORCE_GPIO_EN			0x0228
 #define FORCE_GPIO_EN(n)			BIT(n)
@@ -569,7 +570,7 @@ static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
 static const char *const mdio_groups[] = { "mdio" };
 static const char *const uart_groups[] = {
 	"uart2", "uart2_cts_rts", "hsuart", "hsuart_cts_rts",
-	"uart4", "uart5"
+	"uart4", "uart5", "npu_uart"
 };
 static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
 static const char *const pcm_groups[] = { "pcm1", "pcm2" };
@@ -754,6 +755,15 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 			GPIO_UART5_MODE_MASK
 		},
 		.regmap_size = 1,
+	}, {
+		.name = "npu_uart",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_NPU_UART_EN,
+			NPU_UART_EN_MASK,
+			NPU_UART_EN_MASK
+		},
+		.regmap_size = 1,
 	},
 };
 
-- 
2.53.0


