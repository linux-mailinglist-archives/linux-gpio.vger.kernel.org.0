Return-Path: <linux-gpio+bounces-20457-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD6AAC0559
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 09:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F87A4E3A5C
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 07:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D1022257D;
	Thu, 22 May 2025 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dwBejEIh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA6422330F;
	Thu, 22 May 2025 07:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898019; cv=fail; b=O11Tjfqjd/1pU8O5v+qm8+qbYxtGAAqd//tJdgbfMG2YtmT3+SbdG9HNsxmepmojEZnD707ugwf0Yz8b2dbetjCTUXAaAbU5ZtrcWTtVOIWlL4WOXmQkWB23YXWAW/knikj9O25eIoMJf2oZhXQzeZF36vjy+wd/6omKuqhZQBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898019; c=relaxed/simple;
	bh=v9kOTIyggsxH2pFV11yilyhSxYyVIXGUXZ07FXiv4kY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Vq1v3+OKq7Kis90mrJ8VOfWqJZOmxiwt71Ith594VhR6iTy6rgPCT7kFmzmFeMhZ+pHacXJ9xa6zXwYbZYZKctX+feIDCno5rayllVAirJ/QsZ3eNIVXOT6FkEENIYqSNRQc2sG5zs8tXnTlElGTMBrYC5GKmLYJZKDsKCDLsI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dwBejEIh; arc=fail smtp.client-ip=40.107.20.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9T1bYSPv5dirao0lRvTqEF9oSzie6xKJBOktQv2DnSI59OUOdAmEl5zMCYo0VZQY5dCV7TdCPOd88Zy68VEKnHh78BaXPr289Iw/T9DF8KT6bsrRpnIy8Bp/Ii4dWMVk/DE2vbBHIKkj2uXsYUc75oG0BhLQvuX4i4ffkKMzWHjmIguf0LQxjgPAz/WlKhyIi8CVmT3Q6GY57ZYVAcruP8pvsm6vrngb40/FTICRVpd4FsKzx2haFIsqY5MO+HChDzee7CjUKDQmCVv/8xuyAVUdx61VDIHJNjv8NESl2Dj2kwJjnSPVmJh0xYMpeXchEWwNpqdBOlKvOFTgACTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+HV6gpSLM+oOAqEXICpK99i2mwcfTuwdhoTCgbRvMM=;
 b=zGmvF0mxF6vplRTkflWe0xtLgNNAyJ07MeacaX/KT4BP6lK3vx+HjrPfVu77vNms4oVTw1RP1+iOTFH/Osqxg7H9QT5uZa/TWBKEece1PdLYdaZwe+9kERcv5hTnjtsuzQbTd9XtYlt92uxLRIcEGR6ZvsqQwQg5GA7qBiZLfvkL/kgbS0xOg01MPuoNg0LI0eXGXobcP/sZ2n6moD7td+kgrAGpLjHG3yBqQMmu2ib+9rnXT7kOnPk8okgKk2DfhVxxAcGi+wd3E8oiSIYv5NjTUVOCd5VT5JeVuV6mRjTXZu9iFbVds5ria5Gylx5AwcmP3j+dI57BkpX2G//pMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+HV6gpSLM+oOAqEXICpK99i2mwcfTuwdhoTCgbRvMM=;
 b=dwBejEIh4f++EcJJOaXB/U5EH7ZRGS9WTgSI0mKYbMa7E9zIdNpPtUigEbu6mDK+dR4TozVzkCW2e+xW/BDYbOgt/kBlPm6idk8d0S7r7JY4uHEwCgx6BbEsb5ScdXNUnso/zREYVecIsdqQZU5wxfYIONc83lh2X15lcGS9O0Bf7/qh8vqUEg4UfPA3LSwLToatK5bXfqsA7NV+pai1G2FrpI/64ZsnYqvuy2NBphtlS/DM8cyXvqRzDrnHUa2dU0Ny0o5R5/hwTk5JB8WFsNtwkQhG4MQuPQTAl+j3I0dk9o3WYKhoXhF7kLqM1crWjpMb8gYhoNVQWlSACsyT2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7033.eurprd04.prod.outlook.com (2603:10a6:10:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 07:13:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 07:13:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 22 May 2025 15:11:51 +0800
Subject: [PATCH 2/4] gpio: grgpio: select GPIOLIB_IRQCHIP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-gpio-fix-v1-2-98ceae7c4c3c@nxp.com>
References: <20250522-gpio-fix-v1-0-98ceae7c4c3c@nxp.com>
In-Reply-To: <20250522-gpio-fix-v1-0-98ceae7c4c3c@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747897924; l=861;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=sV2JaUuhKlQFUk+nnIFhtI3ojnlccq8LLXL6CPIF8cI=;
 b=ks+KZ6UtukJRvvudyFzOxsZvnKf6F3RMIA6Nk3ZAWgDwDATAlgCkiyhnm/yY5SrM0p5jTJFKV
 Y1B+qRXcRLjCwmUdc9YvI8lriaJwtgpWubtSQ7KpYZY+jpiblx7qxl1
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c3aeaaa-4ed0-4b81-bbc1-08dd990028d0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZE16bFJqeXNnTTNEd2RnSjFBVTlMbGhUK3RxcmM2UEUwNmo1ZnR3S0lPdmJK?=
 =?utf-8?B?a0xnRUt3QmhPZUpwTkIra1IxQUNwSnNkSmFQWXRyWUhtNGZyYno3OXByUzlu?=
 =?utf-8?B?ZW5MOXIxaDlPVlp6aG0xM3VEaFFyS3ZLeXpvOXpoVis1NHBmRVd0UWhPY3p1?=
 =?utf-8?B?TjUzQkhzSWN1aVU5dk1SS09ad29KNysrVkVRY3V2R2EwRnZNeVc4UXJTQXdG?=
 =?utf-8?B?TXV0MFpFb0JiekZsUzdweXMvUVMxc1pOQ05nQ3Zka0dxZG4xNmp1Z25sK2Z5?=
 =?utf-8?B?cGNNNGZUOHNzU0dQdDZwbDI4ajk3OVdIaXdFTTVsa3M1Ky92eDZzbFM5M2Er?=
 =?utf-8?B?d0NqNU9WWFVtT3pGMUs3SVJSa1RYQXZWNGU0VDdRbkphRk1QLzEvSWdwd212?=
 =?utf-8?B?ZE53Zzh4eEtSOC9YQ25kbCsxTlRGTmZNWEhIdW5YQzBwSGN3dkRMVHNNV051?=
 =?utf-8?B?TmFxMFROK0xQb0hBOU9PV0NVQ3E1VjJuM2ljbzdCRmFLUnUvcG9KblVFVk1u?=
 =?utf-8?B?Rm5qNFVDOE1jTGJSMVI1QVBDclVPRWltSU9QOExJeUtzajRLOUlDSFJGUEpS?=
 =?utf-8?B?WDBsa1dqTFdaalQxc1h0b1piejExSE9IS21wK0VsTUJ3SHZWU0JMZHJJb1gv?=
 =?utf-8?B?WWdsYVBlL3B6aUUzSDV3K25qSVdRNjhKcVhIQXljV3hjZ2kxZk5PRjNHWEly?=
 =?utf-8?B?QmNYMnY1VFJCNDZCMXFwWm9ZUGl5MWZqeEtwd2NLM2x5T1Y2YUVyVHAyekVl?=
 =?utf-8?B?ZWFmUnlXVjBaWEpzRlNaZmRJSUo4MkpNeDRxa0lBYU5iRzZKdGovMWZSdnV0?=
 =?utf-8?B?VGNoaE9VSFdZTlJxc1ZRR1FBT2I3WTRpWittQ3VOMGJZczlmS0VyZlI4UE1L?=
 =?utf-8?B?NkwySHFkRkY0bko1VUdWMEZTcVJUcS9XZ3JPS0xVakxxQkxUVU5KVnJvbmlh?=
 =?utf-8?B?aW9MTkVYMU1iR2ZqVzhzRmVTTDFMaEJRZ2Nzdi9Dd1EzM2NQQjFuNTRFemVt?=
 =?utf-8?B?SnBmN1JLK01xdjlGSDRTL2ZUQldJVHhldmh5YkRqRnk5TE9IcFhBQW1IbFBs?=
 =?utf-8?B?YXVVMlhjZ1JRT0RVTGhkNlJOWGl4SnlKQU9QTHdzazd0bURPRVJpU2Q4b0Z1?=
 =?utf-8?B?Rjk1amlzMTBmWVZQUmUreThxWlRkRE9LZm55QkpPc1ltbi9DdGdPV0FKeW5U?=
 =?utf-8?B?N1FXL2t6ODJpOUhGZVBXT1R4UFptV200ODljRU5MOG1IOTZKTlRURE1iZTQz?=
 =?utf-8?B?TS9Db3Q5NHByZitDbDEweWZudjhJYUtZajhQeVpDZHR1aUFQY2ptNU5sRjEr?=
 =?utf-8?B?NjZlUFlJaDhmRW4xSWc2ZVA0L1Z2cloyMkpUczVRMXNROGlmQnVvTHU3YkRz?=
 =?utf-8?B?a24vSVB3dEN0QmJrQmd0b1BldHlsUmptdFU1ZnNjQmZtSTg3cWJVeDBNbDh6?=
 =?utf-8?B?RlEzUFNFZ2xNNFhmUUQvWldnc2pWVEY5ZnlEOSt2TlVScXRqbnJzUXROcGxG?=
 =?utf-8?B?VXdoc3RYNktmYzI1WE5yUU5lc0lyNlVrNDNyVG1KYU5IN1NhWUFYdWFaZ01y?=
 =?utf-8?B?VlVyeFhicElvYUp0WXgxcmZ1SENyQ2FMY3BwZUFFTGJwQ3llUGtSbU1pZ280?=
 =?utf-8?B?MXFycjBScUdBTk5TL1RlOXhTZm9EQ0NoV3lDV2hiRml2dGVyUlAwR0FMNUhY?=
 =?utf-8?B?L0dtTjdYUmVyaWxqR3c3SERuWmxSdENwTVNKdWk5OVF0SHAveDcvUzNpTFUw?=
 =?utf-8?B?WVY4T0l6RHJLUEN4c0lCOTBmT0FITVhTWWptVjlWaXozMGhaM3RuOTFGOXA1?=
 =?utf-8?B?cDdNb0thcUVJa3h1ejNRaDdKbmc4Q0U3Z3JDUnBtRWw0SHRXVDJ0WWdVRkxI?=
 =?utf-8?B?UXlkR3AxKzdlbTdpT1JCWVdiZlk4eVhIR2duY1JvWjNCYlU2OTJpVEU3R2RD?=
 =?utf-8?B?UFRHVTk0Vi9Ldk1VWU00bkp5aDZPZzVKVlBvYW0rRnZpa3plM0U3Qm04ekNm?=
 =?utf-8?B?enFPcXNqS053PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFR2c3ViNmt5WWo0SUVZY0VSZDNBVXZqRzBhc09FOXFubEU4dGJKamdPTWlU?=
 =?utf-8?B?UUIxVkk5cW5BRFZaWkxTZjRJMHBGR2ErbkFlcCsvakVxbDZsKzg2MVhjSjMv?=
 =?utf-8?B?dXo2UlR0QTJoY00rNWFFVnB3djdueE1FVDlyU2VZWnBxVDhRem5nTlR4TFk3?=
 =?utf-8?B?eUtZUWZOS1c2ZWx3SHRNQTlYUERJclE2M1M4eFZEODBvbUVIZVhOM3dtdldE?=
 =?utf-8?B?Nnl4OFg3bWE5OGx4NE40OWZwc0hXMUsyQ0xFSVFlaTdOcGRwVUl6ZlZqenM4?=
 =?utf-8?B?M3dKanZBcWN0T3EwOFhwb3NxclV4OGdienRYSW9GUmZTM1YvbkI5UWxmYVdq?=
 =?utf-8?B?bzlPYVZRbU5oOHNhMis2WDZMOCtsK1pKNko5ZFFFencvaWpvKzFZMm9lODZO?=
 =?utf-8?B?Rm4vNFVscDhCWnZ5YnlQNnN0djk0RXF5eUVMY080MUZ1bDU4QzkvMW55QXgv?=
 =?utf-8?B?MXNDU3o5Z2piVmYzbjgybWhJeitSZzR0MWQrYXVzM0plSzh3bzZWb3J2ZE1j?=
 =?utf-8?B?RndTd00wbW94UXNLZWF4K2FTakNqYWM5N1h5YWRTWFlCVW1qZDNQVXkzdHAr?=
 =?utf-8?B?aW9LaWxXeHJOYWtDS3YyaGxQSC9DNFhQTVl3a2tkN3l1UWZ1L3VYNmtnLzZP?=
 =?utf-8?B?QzJnTngxY044cnlldjRLd1pRTEtPOHBkWkVVV1UyN3I2VUlKK290ZWZwZ2Er?=
 =?utf-8?B?SWNKQjhhd01mNXRKU0wzZ05FUzJyZjdCZzcxcUxxTkVVdUwzWkYxdi9LQ1dE?=
 =?utf-8?B?TW4xRk8weVdoRlZQOE9lS2ZxQVh0N1B1a0Q5VHRXMG93Zmtxa2ZSSzJKMjJa?=
 =?utf-8?B?a05HcENZUzFnYVhZM2hvZ2lmN3ZORDRiRFFtNDlRUGpKZVhqQk5pZVpFdytZ?=
 =?utf-8?B?emdaTFFXRmNLM0RMN0dGMWRBMGdEUkRaVHdKbDZ3cHlPblhzRHJrRHpraXhV?=
 =?utf-8?B?c3BaaCtGNzFKNXA0dWtDWUZzRi9xdzZ3UkpJRk1TZkxRaW94VDJualdndUFM?=
 =?utf-8?B?UGxPdDBDUG82OW5vQjhHc2hPL291bjg1T0VkaHJFUjRkK0N1aWRNVEhQK0Rk?=
 =?utf-8?B?SDJwd2FzQnJ3bDZQaklNY1Fxa2RVYUh6V3VBUjNsejNvT2FzRHR0WHpFV2Yz?=
 =?utf-8?B?R0t2Uk1vU05QNk9xcWdPWUl2blljUGJST0JGdDNlY0IwVDhhNmthSHEyV2ZF?=
 =?utf-8?B?ZFJ3SFJybUdVV0s5ZTNNZHc4TTdEY0xxcFFMR1R6L3dJQzgyVktlcFFKeTRP?=
 =?utf-8?B?ODRPb2F0Rm9UMnQ4emNVbFJPUUwvQzVRUk9CQTMrTC9rbi9LemxFaThKTmpm?=
 =?utf-8?B?Skc3YTR2NDZJcHBtTUdGSjBlK1NNak5KK1dJQTdsME1MYUdGSHFrZjNqeGJv?=
 =?utf-8?B?ZUhQTFQvRkt4eVBWYThEaVBJaUQ1aWZTait1NVBiV2E3SmxLdG5ZTHdDRXRC?=
 =?utf-8?B?RTNQZ3p5dlVoSHNoT3Rrby9pS3NKVTlQU1Y0ZUNEQmVYN0oyWS9XYUxGRVR3?=
 =?utf-8?B?S1phY2IvZ2dWRk1UZjBheVFzcFhRRWEycENaOFRLRnU1R3oyK0xZNHdDRTRB?=
 =?utf-8?B?b01MOFZ4YStBZjB1TzJEbjZqZU5hc2tRVlpycXJMOTZkTnpwd3FJUGxsOFpv?=
 =?utf-8?B?cG9nTWlobWNtLzladXBMWnZVSmZLSnZHUVg0ZWJqYzhPcDhBbWo4UVkrMHBi?=
 =?utf-8?B?OU4wbmg2SjJwSCtRM2lhbGpvWE9ZL2RYUEFmUkZudmpZRXdnenZ4eUNlbk9J?=
 =?utf-8?B?b1FPOVFha29YenNiVGZIZFNQSU1nUmEvUmRWSVlkYkI2UWlzbDUzNnFVbXFr?=
 =?utf-8?B?V09tYXpIT08xdDg1ZWtPQ2QzYm83eFYrWUlvYjJXalBibjJCdk80bGlheDAr?=
 =?utf-8?B?eVZwTFMydHR6cStTNXV0VEx5Z3pRMzZvRjBsRklGY053M0pmNk0xc3NjVEdO?=
 =?utf-8?B?bUtyZHcxOStpeDBIWENxeFU1cmZDNm5JQ08wK2dNdXd4MXNRTCtqalRJU3Rk?=
 =?utf-8?B?eHdPQ1QzcFN2a2MyTzVzMVdqM1dOM1NvU1FaVDc2aFUwcGJETitmZ2tVa1hZ?=
 =?utf-8?B?MFM5SkZ3Mk5iMlM3MUNKZFJlUUhPVlZPejZ4aG96ZGxjYWZUbjI3dk9UTXBh?=
 =?utf-8?Q?LY82xUvPOiTHIWzyNCr/CT1JB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3aeaaa-4ed0-4b81-bbc1-08dd990028d0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:13:32.7255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KcaJEPAGLcrOZ6Tm9x4nJNbg26xw143JKvPLfVpR6QWoOL3LeflfxByXt5U71AnbbPCF7IlpDqwiJBx/9Dzlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7033

From: Peng Fan <peng.fan@nxp.com>

This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
are only built with GPIOLIB_IRQCHIP=y. Add the missing Kconfig select.

Fixes: a30be40bf1d4 ("gpio: grgpio: Make irq_chip immutable")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ac0c646451a549f6db4d58c2fa4aa8270c9513e9..2ff53b00cf7c956acc9d995e4cf07da1587a4035 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -354,7 +354,7 @@ config GPIO_GRGPIO
 	tristate "Aeroflex Gaisler GRGPIO support"
 	depends on OF || COMPILE_TEST
 	select GPIO_GENERIC
-	select IRQ_DOMAIN
+	select GPIOLIB_IRQCHIP
 	help
 	  Select this to support Aeroflex Gaisler GRGPIO cores from the GRLIB
 	  VHDL IP core library.

-- 
2.37.1


