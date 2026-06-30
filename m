Return-Path: <linux-gpio+bounces-39215-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kv6vGwK/Q2ppgQoAu9opvQ
	(envelope-from <linux-gpio+bounces-39215-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:05:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D60E86E4980
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:05:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=sJfkCa5I;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39215-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39215-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD962301A7E5
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 12:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4EE4192F2;
	Tue, 30 Jun 2026 12:54:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FA1416D18;
	Tue, 30 Jun 2026 12:54:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824067; cv=fail; b=ZKImw171fYhHIkbAxbzKDFQnXYTaoy49biANIbR2mxo7YxTmNrh+DKwWKKJkdB6QD7OVDvTO6MObCgrSMWQjRSF8lSZe5hdTVqpXZPssGrnvPneFnFqxN+aIyVJoQoQvMoWyvFHrzI6dsFUu+8Mzt3Wd/RaR7RjJbYJnhcLggwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824067; c=relaxed/simple;
	bh=7RzMio+kRBAnJqq25DmE1ySEaJ/ZxWHzRl5XaYNa5GQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jm8jw22YpqDqc4yjndaEkt5boOKRQR3JOJ3ShBo0/9f63l3CqcZI6HFeiOcpenuiejlGygNLrOauHvD8KIEPYp6CwZeNKTF8DQPOJifXvKRlLhdxfHNXkIIXwBNTf0Rg8BdcqzLnNH56wBBjxeMmId2Rz14EgxeNenLA4I75bJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sJfkCa5I; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uViHjOTLP7S9Ni9wmHiKSQnhR+7SCas+usUcOi8qKNUE04zxk/cScVe4y3AdMZ3UgPdjKapG0SPxKseZ+6HCWPfYO+3XS0oy4xYmFzYsvXQQ1SektXJHUdrnkNJTp9zb3Gkb8RkdKyizaq+tINnPZ8tXM8JN97pcv+ONh2djPSPx81HotKYZhKunEHWrYZgSQfl6AvXGP+J6NEXHsdVXusx4bT6+GLcWzqq0WHCGyIMnijrMW9V8CVEwpiDnkqqqLmWDGQO6bX2R2Jxw/LIVZsawnqMNv6vLBuV4QiRUr1G0fP438zwuWHR41yW46GTh/bK5TtGlmf+k6plj1VmtBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCMIJRsRzjlZpYofvhN33meP83W9N4cRLSSNzva0XEc=;
 b=iTeqX9h3lGa7Y2MwOAiNhh5i/fIoCmJzLxtA94tZmB0ljyt3tEQh1sSXyIJITOmW1a0VCRb3BwFysB+Jw5/cxV7oj6xHzrt59V/DqPfv4Il8pW+xUr4qcDiDE12ut56bvcSENfhwswrP6X8H+F2RNQkDaRA1RM+ZKtYPJdrMAyb+uAsTM0cDrpUS54/u1fZhbShm5CUp40D+4eJHderzMpIjEy7m0QnCuMRvZOgfNenT41OntNx+zFoUkb1wj1AvNWiUjFr/w0K49lYKiu5YsLKVOxoMM/VmRWF1GbbdkkDzh5V45dpOC2dYDJVh+/5yymQyjA44tzU3/OQZsiN97g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCMIJRsRzjlZpYofvhN33meP83W9N4cRLSSNzva0XEc=;
 b=sJfkCa5I4dTK5tGFgpiFluZRpm1S3y9Bjv+3C1XH8/9Ygf+SoHxncdcSKWlGWn+YpAzfbLza7iAtNh7dDRayovzlwwvbQ9u7Fhja8GNTYJjVtDOjn/rjp/u5TzALzmJf4lTOGaRGs/gC2llzvk7RE84nmZgOD0tKlOZ2YYGszniU7fEpNXECSlIrKT8y69ap4FMw3sjRJQhBOoxhkbwmoWYnt0bGzqCK4AE+Vgk2nZiG6leuwpVSCagdMKmEkLYW1iwl0TxMLoMp9l7G3ldl1+SQrcEeK+xptotMLsSjLQi3GUODqGjAWEMY6qbbrZBqSdLQXfq0CpuUKwZk74FZXQ==
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by VI2PR04MB10883.eurprd04.prod.outlook.com (2603:10a6:800:27f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:54:14 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 12:54:13 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v12 6/6] arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl node
Date: Tue, 30 Jun 2026 14:54:03 +0200
Message-Id: <20260630125403.546375-7-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::19) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|VI2PR04MB10883:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce07e45-10c7-4056-2e01-08ded6a6afee
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|19092799006|921020|3023799007|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
 kJXuOhmkU0vhzHKpaMyh0XB5bgxbawtQ1ZDTr8hDT8fEu2vrC1+hAzCeBWi50yyHJZN1SaEpf2zQN+Kn2KaLcu75/dafOXSM5kCVowH8HvJHdfqkRNUlWX0ZEKSQXMSiv5aC3DBxqJg/qQ/oUGhe5hQhit1REmx6UPXn2Mb9RSLMVWSaYvpb7oDoan3X95BMuzDzR+QfvlPXSTBmpFc8rWCZDibiEHcWeARnv2FO/6I+Z2g/2peQ0DQOpfJJZ9mZSSnE5lgk7AtFk9nYB3cWo0Gf+eDFz9j+IY8eLvJDHswabSFt+s3otvYuU97c5vIP/BFr8rnZaO4TG1vk/cBmujR5q/vvKCZ9x3AUhihV+cYh1ihdGqh+u+UlGIPTqFOMTNniYgDsYl8PN5ZJA/Yh30vCLrX/PStC/Fx15xWV3bSX8RkLvPEincnw83XUEymg8a6bsxVTqjoTpTxdl9n1SDBXBUNfr1izpEVl25Jfkuhz5yg6rEfaMh1d7jAgUot7ouY9NaxA/9UkKRe/LCvF6ozKI6LrabhB5u6e9SHjBpkoBN6OwxbYfKMFB/4hkNi6tg1pxnhTSlm9lkMfUGzBfZSN81UgaxnoVDGN0rY1iKd+3h/89aWPCQ5um0JTd3KjDxIrmu+Te7qhmOhwJS3VxKShnFMbhy6qPdsEL9y2c7qUTW3BXQSLCINd6ZDC3jfRmuiuS/BeWxuFfEK37cFdVA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(19092799006)(921020)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Q2U5T1NaWnNydkVYeUoybmEyZ0owL1JWc0QrcDYvSGZqd1hTMW4xRzFKd2xH?=
 =?utf-8?B?Mks2eHNsMm1kRWRYamFzeFNjM2MvdTF0VFVMZTNhZmNKWTdORjJFaUhuS2oz?=
 =?utf-8?B?Nzl5VWovSGtVRS9vZ3pEb1B5Q3FFRjltanRLaGdOMHdoNUkyS1puSlVMTHZV?=
 =?utf-8?B?b29nVGM0MzVFdWF5YTBtZUI0enVuRFdmZ0s1VG1QbHhsNWFITVRTNUVsRm9j?=
 =?utf-8?B?TGRBYUxycmNVditoWmM0eWtPNmRRTHUyUGl2YVluNjRBRFpSNGQyc0c5STh0?=
 =?utf-8?B?YkdSKzYzcTZzK1B4QlhWbXZlT3Q0WiswTXYveWl2MjBrNFVwOHR6NHErcVA1?=
 =?utf-8?B?SjhEeFRWeXVqTGRQNkhvSTFmei9mM0RNVmxXdm9RSFRKVG5CSzJUK2NqdkNL?=
 =?utf-8?B?SEdMSGVhRmE3NDZzVEZuTFVOQ2I3bUNxK0REY0paOS9jcEtQeFo3dFVXaGc1?=
 =?utf-8?B?Vi9LaU1TL3V5WWJUZjJHdnVWTVp0L2ZNcnBCR0JYcWt4dXZxenpyVWNZV0Zt?=
 =?utf-8?B?b0ljc2RXVGVHSmdtUlR1MWJmdnhxL3IwdjhlLzJNb2RsYVNVNTR6MDl6RzE0?=
 =?utf-8?B?VVVHdUlOQnZUNVNwc2UxTkRrdlZDSC9QZHpnSnBxWUNSdytkRFJNQXRrdDA4?=
 =?utf-8?B?KzNhUmM0UjYzNHdpWnpOcVVYcktsSnJ6UnQ3eGxEVnNJQmRBaXhicEJxdHZE?=
 =?utf-8?B?Q2x6L2FVS2h1b3NFRXJBVnA1RjJwaHpDMHZQVnVZQ281OGZYZUJ6aUxFTUlX?=
 =?utf-8?B?V1gzdlJFSXNDbDZNellGNDU0bEVhcUExbVlKdlVDU1BPUS84SmZGSEpEZnRs?=
 =?utf-8?B?b2t6TVp1bzdVWkZJSisrRmNJY09UU1pERUpEaEp0NjFOMVRnYUVIVWpFNlpv?=
 =?utf-8?B?ME11V0R5Nmo4Ni93ZFRnajlSRU5CU1AxTlNYNjNUUDBEZXpCMUlSaVV3bHQz?=
 =?utf-8?B?NnEraW9FNERUZCtwWldRNTdseTA0dHFpMzQyaEN3NnlvY29ad0NsWGxEeWVE?=
 =?utf-8?B?Y2c2RW0zVzY3cTk3MUtUS0tKRThQK3pHVkszRHVIOW1aUXlZSXp2R1JSdVRN?=
 =?utf-8?B?U0ZCMExVWVNmL2Y0c0dhbER4cjIvSGw0S3pheHZFUlZZWG1tNnc2MmRSM3Rt?=
 =?utf-8?B?Q29raFQ0TVpuVDd5VnRFWnRTblorZm4xcUtSdlFRbmZaSlRVYk5GenI2YjdN?=
 =?utf-8?B?U1Z6SmtXeU5tSTNYejZqS0lRd1hoWncxamozNDdZN3ZLV1RKQXd2emxWSXI5?=
 =?utf-8?B?ek1uL3hBU2JNMjBnTjZsUGo0MXdjOGV3OXBTenFYYWhreng3U2JoNDBncTZm?=
 =?utf-8?B?NW1WNmFGMjFaRFZqdzMzQ3FHS3Bmbk8vdmN0cVMrZEhLNXYxNjZUcmdJdThw?=
 =?utf-8?B?N1ZuYTdsSnNJUUZVZHNldUdhdnp4SzRmQUhzNVVseDVDU09nd3NLSGdsWVlk?=
 =?utf-8?B?QXlqZlBFeGI2TEJzeVRyZnM5d1VFSmlGdzN5R3k3OC9kYVA5UDVCMDdFQ1Az?=
 =?utf-8?B?K0g3T01DL2YvbHJGZ292RHdLSkVnV09UcjNtTHhLdktQWTVMaTRFVm9WRDdZ?=
 =?utf-8?B?T0ljOHlweDA1d0s4aGpnanp5WUg3L0RzOVN0OWRYbk1sdjI3N3hhQW9ScmJL?=
 =?utf-8?B?TjZXNE5VMHQ4RUtrbVZaQ0Uycm43SnZtek9VM00xKzArdGJJSFNQc013djhR?=
 =?utf-8?B?RTVSajNRL1dFUDhsS1FhVGNDMVI3OVVXTGE0QVVQYnp1K3dRd3JSWkViZnE2?=
 =?utf-8?B?dmZXTFdsTXcrOGVwRXNySk01U0ZJUlQyWnQxRGtPdTYxQUhJK3FFRnJQdEFR?=
 =?utf-8?B?a3BsQ1pZWnN2ZFVZeDdtRTlsN0FnQ3A4blFOTk55OHlEVWk0UnhnUG5YbU1Q?=
 =?utf-8?B?YW8rNE9OU3FwaTRZT3EzNEVWcGhaZldBL3kwc1duWGROazgveXpidHYza3dM?=
 =?utf-8?B?TmlnQ2FoalhDUWF3RDd6VzdDNSszejR4VzRpTjhuYTgzWldUbWlTTFd3aFJE?=
 =?utf-8?B?S2VtQWd4bmR3a3JWclNUbkVqcm9wdDFpSXBubmZFd0tKSlNyQkgyMmVYUWFV?=
 =?utf-8?B?SG83VjRVOWVPei9ZYXVSTlF0cVBpb3YxUnNuVFlXQngyakFLSyt6Y2FyNjhN?=
 =?utf-8?B?WDc5d2o1MTRUWjB2ZzJpd1BMRkNmczRFcDhCQ0ZGdmE1dldLSytQeUtJTlI5?=
 =?utf-8?B?MDkycUVyTXhVVjJLYU1vWXBwL2ZpUUZMUjZ3clZ5NXZoY3BsV1M1andVSUhJ?=
 =?utf-8?B?Y3ZMSUJ2TXUwdWhZb2xYbTMzZEhpQXlCVXFSMXhBYWZ3WUk3eGlERjNtUUth?=
 =?utf-8?B?STQ4V0U0R3JhN0Y3QWRuaWlmNjRlUWhidVR3WHM4a3RGR0NPKy9pbm8vNmdD?=
 =?utf-8?Q?zdl/QYU118Fm/vtSX7LZ530xApfV/7BREhGVf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce07e45-10c7-4056-2e01-08ded6a6afee
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:54:13.8790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: th5jSKmKLgCqmyA3ewGdFenmei97SB+iAMhCp5SrI3+65yeZapBiE1IhsV+KcH+DgZEaPMrnAD/BeoN8EoZLBiBVrMB9+Aw9FyWL2Fe1vKYmJUmSjVdYdkoALz0+2va2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10883
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39215-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email,oss.nxp.com:mid,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D60E86E4980

Update the SIUL2 pinctrl node to describe the additional register
ranges and DT properties used by the updated SIUL2 driver.

Besides the MSCR and IMCR ranges used for pinmux and pin
configuration, the SIUL2 block also provides PGPDO and
PGPDI registers for GPIO output and input operations,
as well as an EIRQ register window for external interrupt configuration.

The driver supports both legacy pinctrl-only DTs and
extended DTs with GPIO and IRQ.

Reflect these resources in the SIUL2 pinctrl node by adding:
  - the PGPDO and PGPDI register ranges
  - the EIRQ register range
  - gpio-controller, #gpio-cells and gpio-ranges
  - interrupt-controller, #interrupt-cells and interrupts

Keep the hardware description aligned with the updated SIUL2
driver, where pinctrl, GPIO data access and the EIRQ register
block are described under the same device node.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 21 ++++++++++++++++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 21 ++++++++++++++++++++-
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 809019ea0e29..8dc0c5d9f368 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -135,7 +135,26 @@ pinctrl: pinctrl@4009c240 {
 				/* IMCR119-IMCR397 registers on siul2_1 */
 			      <0x44010c1c 0x45c>,
 				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+			      <0x440110f8 0x108>,
+				/* PGPDO registers on siul2_0 */
+			      <0x4009d700 0x10>,
+				/* PGPDI registers on siul2_0 */
+			      <0x4009d740 0x10>,
+				/* PGPDO registers on siul2_1 */
+			      <0x44011700 0x18>,
+				/* PGPDI registers on siul2_1 */
+			      <0x44011740 0x18>,
+				/* EIRQ window: DISR0..IFEER0 */
+			      <0x44010010 0x34>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 102>,
+					<&pinctrl 112 112 79>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 22e80fc03f9c..129d6ad8e5c6 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -193,7 +193,26 @@ pinctrl: pinctrl@4009c240 {
 				/* IMCR119-IMCR397 registers on siul2_1 */
 			      <0x44010c1c 0x45c>,
 				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+			      <0x440110f8 0x108>,
+				/* PGPDO registers on siul2_0 */
+			      <0x4009d700 0x10>,
+				/* PGPDI registers on siul2_0 */
+			      <0x4009d740 0x10>,
+				/* PGPDO registers on siul2_1 */
+			      <0x44011700 0x18>,
+				/* PGPDI registers on siul2_1 */
+			      <0x44011740 0x18>,
+				/* EIRQ window: DISR0..IFEER0 */
+			      <0x44010010 0x34>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 102>,
+					<&pinctrl 112 112 79>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
-- 
2.34.1


