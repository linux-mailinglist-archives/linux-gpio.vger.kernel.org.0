Return-Path: <linux-gpio+bounces-10271-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E5B97CA71
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 15:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43780B23123
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 13:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46EB19F110;
	Thu, 19 Sep 2024 13:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LAulT4G9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013022.outbound.protection.outlook.com [52.101.67.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B67619CD17;
	Thu, 19 Sep 2024 13:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726753745; cv=fail; b=eGZl0sCi3eWPUZWjO9JBc3kJBnOAEQnTpDwV7ud2FE/0IeP6bjv5FCuveN0EORDbmyRcUHluX13CttC2LgDAkSjSF25hcz5ijxflB/Dc/nJKN98eUsNe+9wa3gQpeis9Ya0XxIlO0MYoHNa5MzPBoFLwDRT+p9sxk1eVUZg7H9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726753745; c=relaxed/simple;
	bh=WK4Owj4Y4Cm9P4MpXmjHW4vYZ5KrqTdjByDfuUp5bwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d+qDmyGPqgjLmA4T0L0lP2fyvjMZNsBSb4LiK7ih5eOId6twS+tjV3yx7BmnaJsSAeLheA6FGl1MC5s3cMMSh33o3++I9lyj2LGQ05DIVWwR/7Hxhd8OrMaVMmdZOkR3yCWrUWWBqz0Cxb396H0u8yQPFjYk1rgcz/bcq+LDFG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LAulT4G9; arc=fail smtp.client-ip=52.101.67.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3RTtupFJhDBM5slP9UfkwO8XkY2GekZeQ171kDvc/BX44yVys1CMYyD0Bp7L0FXt/hKeclPO0p4URT8YnZqCuXjdVMRjqMC7nA2SCDbJUwLjthdX3tNQmelzRAW0SEm4b+jmVEtpwE+PwjBT9goe62+lOyjP7V9sZO0DxzQ7UaFlg1uc1eQSyTAVj6OijuBrXVg5Az7SyQdhF9guZ8OJPeSgRZHccMOZ8f72wwiQzZMYjommFOlbRwZDULdfnYC70uSsvaua+cppl5ya7U96WbQp2BEmUhwBiJfyVlp7M3TUiRxfjarDhCwp7N0LEZttzu6BV7qXnBeNcTaVKL6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEHYVemPzQDfpMdhfbuzyQ4zV5E9zOILEQA8q0JwEiU=;
 b=GBl22elodIIPnPrOGf7yhuAzioodqVBfhuXV/1C2ZvuOmgJJF12qBwV9qq8GuxV6wCII5oTtepbYTTP/qTHQbRz6J6J5TCu97tQpiIYhsxG7W25VF9sWZed8wr4Er4gNWQ/gd+nUJR5ovQFbkTBm/rAqKJPUZKoaOiMkA2OXxz2Wq11DYp8T+WqHFVAnCnNKucGE6LgKvmBvhmpYIckihvhShicxYH3Ya5Kjg86m0frgaBISsamiMFplPusSpmsgCWRbsAvvHUM+qCMYemu3SyYNdX/AQ0rTGque71NrTXiFR7b5VhsKjc+TDjhwjxZwpJ6TuebygOtpTetl1z0OYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEHYVemPzQDfpMdhfbuzyQ4zV5E9zOILEQA8q0JwEiU=;
 b=LAulT4G9v1KEzUWcvfStcaEZjMsl6ugV8dSWuyn8uHknzWq5mBcFy3wQI3ukLxyYn+AzZBYTyp6Gb7gy7IMoA59es77Spzufd6QWikX9BuVMEylJSbYZS3jV6yN1lj1uaRUFVhmEKI0bPr/zZxvI548JKOn0b4fCyE0tfQpEUgTlBGOAEyA5KE8P/vd1zWsJVCcYF03h1rV0BlkspMiL+m7THS2HO8jYwlOseL7uLEPQJZg+B2h+eecpyeQRoNIs15COzLNF/pziBup42Rm5Z/wNgnuu2+5+ksNp9Jx2w4XpqYoy6a4FmNtt4G6fuuugR3z6tBotv4ervrXIH9HlQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by VI2PR04MB10267.eurprd04.prod.outlook.com (2603:10a6:800:225::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 13:48:51 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 13:48:50 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 1/4] drivers: provide devm_platform_get_and_ioremap_resource_byname()
Date: Thu, 19 Sep 2024 16:47:21 +0300
Message-ID: <20240919134732.2626144-2-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0109.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::26) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|VI2PR04MB10267:EE_
X-MS-Office365-Filtering-Correlation-Id: 43152e2d-79fa-4372-2929-08dcd8b1cb04
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUVnL0NqZkRaNmk2ZDBEVU1FMDBHWWNydDlEZWY0bEV5eWNMQ2hpUFBOT0hN?=
 =?utf-8?B?UEViMHk3VUR3c2tDVWJwa1NvMy9Wa1lZczZpbVliUGd5cHk2ZWZLSklhOC8r?=
 =?utf-8?B?YW5tRXRFYnhYcnFSN0NRbG0zS09zR1J3eEhRbDZCdU9VQ3MrZW5aOVBReWR4?=
 =?utf-8?B?dThDT1ZxZkVNeFZTNm5wSXRza1dPMmlhSUxXK1c5bmhNb2MrNXZidlB3Kzdq?=
 =?utf-8?B?MmVMaDZURHZVbUh0UGdXVkdsdkhMaEYwMDk3MUZBMHkyekxMYnU0RVN6UmVy?=
 =?utf-8?B?Wk53Wi9VenFlS3FQSGpudXpvQUVQRkZIQWNIYTFvT0VPdTM3T0U0OFRMbTFJ?=
 =?utf-8?B?SzhrRTUxNkNXME1MSXNaWGgyeGRRVll5OVV5QnJTNUtnc2JHakdpZ1RJRlc3?=
 =?utf-8?B?WW5JZWYzUU5ZWVZMcWN4TFZQQ2N0U1VCRThOcUZNRVhYdkIvMXFveFNxWDln?=
 =?utf-8?B?ZDJHM21YRW9pY3lYSHZMQndqM2pDM0FoZUdNZVFZS3NRMEhqcWlodGdJajdB?=
 =?utf-8?B?L2M5RzllaG90OXB0M2QzamdTU29MUlNsN0hpZHNTcEphMEkwWTR1RklKaVVM?=
 =?utf-8?B?eXBxUTc3YjI1RjFKdGk2dTM2Ly92bG56RTVKOGE3a1BZbEFXc1JnR3ZDck1i?=
 =?utf-8?B?eGRIMDRzdVl3WEQ2RDE2YjV5emN5YWxzSi91bERXOTZXNHpaZlFmMnozNTM3?=
 =?utf-8?B?QThkVDc2UDVDRCs2N1Z4K01aWENZQVpzZXJ4ZUtSem5haUNKYVU5RGU0TWJ1?=
 =?utf-8?B?MlFKTCt2N0s5eVVBSW9jZU0rdWd4eFY2ZlFiRXFuZWx4MlRjS0FYbk5WcFJK?=
 =?utf-8?B?UVNSMVkxb1JxMjBrZFI2dlpleWVaeUxvQjhtOXMvdjJpcHRSQjdPZWVzRVdh?=
 =?utf-8?B?TXNGTHlEM0w3ZER6bUdEMjV2YlZHanBaSlF4YmZuQVFqLy80Q0ZrRmsvZVVP?=
 =?utf-8?B?dVUva1o0Q2lCZkMrV3hwQkRtOXkrMldGalB6VHNOcnYzU0Ryanh3ZHc3YTNC?=
 =?utf-8?B?cFlWaEsvd092MXdFRC9WdHhxRTQ3bG16dndLV0ljcCtNand1VlQwN2Q3YkJR?=
 =?utf-8?B?Um8yZnRSQ3VLMU9GekVYdTdVVUxwckhmUG0wckpCZEd1NTJWY25IdzlqTDVV?=
 =?utf-8?B?MnUxalU1c28weUl0eVZzVzRScTVaNzY1UDVCTWJ3ZUV0Q2xSSGJHaW1rNlpC?=
 =?utf-8?B?QitUSUluQzIyQ1V1b0tuV29Nak9Kb3l1OWdXRGxVWnRoK3pRN2dEMUI4Smph?=
 =?utf-8?B?dVdGdkkzdE1mczNVblBZS0l2Ylh1cVNvY0orYVk3M2ttY0IvUmZaTEhLL0p6?=
 =?utf-8?B?MytOcm9pTTQ4aHhBYlFPclVXUjZpc3AyYXVpeHcyVmo0cVJ5Y24xSDZma2xI?=
 =?utf-8?B?Q0dUcEd2T1NobmpEdW9QTkRxVDFLbWhoRFo0VVJTbFlyTnNIc29ERnJEZWVN?=
 =?utf-8?B?REI0KzJqbFFndFVib0RQVUZQRXJ3TWhNeTBGMEpNb2F1Z2Q1bTJNbnNYVVl5?=
 =?utf-8?B?c2N6TUFBTDhMVVlvR0FmMG5kZW9IZWFVNVdINFM5V2lzSmFwVVVRRTBQNVpQ?=
 =?utf-8?B?blhQUElqV0VjZytFcGxZckcydHNWTTZldFUzTVNhOXFzZC92RjByZjVPTnMy?=
 =?utf-8?B?b2oyZ0N0cCtYWTdXQTlrSU1jdkNqQzRsYW5HK3U1WlhsbXF4R09sVGJTaFNt?=
 =?utf-8?B?SGs3MzZWUmxoQ2JvYXpONnkxRnNWaUR0RHZIdFNKOWJyUUc1STFNMnhNdGVY?=
 =?utf-8?B?L2l6NDM5bnlGU1MxVXdSeXVHOUdjN0lic0dPSisyc1VoWW9FeGN3S29RVWJu?=
 =?utf-8?B?VGplRFlxcTJnbU04bkZLR0d5YUpjaXBWMThhUnJXZVMxczU0bkNmZDBwL0Nq?=
 =?utf-8?B?amxkOFVYSWRZUDlEcFNjdGpValErWFJXb2F4bHhOVkVxaUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0NMbFVVK2s3NmYreUJzN1VNNzNCbTloYzdmME9yZS9qRUpxSjdsaE1XWGl2?=
 =?utf-8?B?UnFtbVR5K3BiNDJSbmRIQ3NnRUtFZERBVHo2Y0c3OEJ2OCtCZUVPY1Y0Mkc4?=
 =?utf-8?B?eUJYRG1PbVllaHBwME05QmFUWTFDOExZZlQvdjhKV1dzMVFGNDJoU3k1TlhC?=
 =?utf-8?B?c2xpTjU2Qk5KWFZhdWZwUU5rQXBRY1cxYWtLdDR0MERLSnpSRkhnbndoYnk1?=
 =?utf-8?B?dmFydXo3aXYzRk9lTGJxUTd3d2lnbmhUa2Y3bmYzM09EWjJXcWZBVXNYTzVl?=
 =?utf-8?B?cVpmQW1PK1lrRlN0MkFxZ3p0U1ZDL1RBSlhuUUR1MlVnRVhzdHJ5eU5PaTV2?=
 =?utf-8?B?YnNXMDBnaTVoMmhCNWYvY3lYaVYzWUltZjRDSThUdUI0QVJDTFNEd0RRUWpv?=
 =?utf-8?B?clVmNFJWMElGMjhKSkJGWUNzSldPdGFCMkNpWnp6cGhUTWJPekZEVDRBVXVu?=
 =?utf-8?B?UDhjNUQvc2M2RTFlY3dycUx0bkZyRzlDaXpPSlQ0blNqL21kRUIrUnpkWWQy?=
 =?utf-8?B?Q3RkWGRwSFFqS2NMQi9SQ2Z3VmRLcW1TU1dvVlBNM2JRNkhOeWVZUFpYZ2Vx?=
 =?utf-8?B?dHN2YzRnR0tSdktGdDg0WjRpN0c4NUdOMlVvM2xUanFEZEpTYllPWklQa1dQ?=
 =?utf-8?B?R2cvU2phUmJHTURnZjBGWlFIUUFGeFFXVFNjMk44ZkJEVXVld0hWMUU5MVJM?=
 =?utf-8?B?UDg1dm1hTW54VjREdWVZbmpjVkhRcCs1WkFzRG84cHVBNGdyUjBKYWU5VjVO?=
 =?utf-8?B?QnZ6QlRvK3VSQjFleDQrNUdvV2dzOUpndEpmR3lLbVh5UDlscFcrZXVaNG5y?=
 =?utf-8?B?UWlud0NYYXpCeTNyaHNSUnFQMGVBSHNBL1YyMytYYk44NmVZTjlPLzVMTGFN?=
 =?utf-8?B?OTlORmlqUXRWT3BOcksvR0syWlJ1U3hOY1grOVlrQ096YTRXdFFBNTR2Tlpa?=
 =?utf-8?B?U1JucWpudUlidzJiTUlMYUJCWDhjVFkwV3VUa09lREdOdEZLclFjb2Y1OEU2?=
 =?utf-8?B?cTh6cjVqc09DNDgvSDBMdE52LzJQSSt6dXJ2dWlLYWxKQlA4aFZRR3ZwTm82?=
 =?utf-8?B?N21MUHVyK1JFU0ZJSFJoaFJZdFI2Zi91Q2tuNE94R21OZ0xvZE5ZM2VLWmMy?=
 =?utf-8?B?YlhhTTViMlBDYWZoLzJiZzVudHZidGYrbzgvZmJQSVNpanRaSDF3SEkvREJ6?=
 =?utf-8?B?Sm1USThibStHamlHTGx3Z1FIczZGbUR0U2RqVkVQcmFPbGNjR3RTaVhHVjUz?=
 =?utf-8?B?emlzQ1Vxck5TazRDcnJ5WjZLTDJrcHBvbGFRYk84ZGNSOFlMeWpiR052cHVD?=
 =?utf-8?B?dHYyMnhOYm9BZllGUEhrZW9DdDRPY0I1YUx1em9UQTBGeXRiVU9SYkQ1TFFD?=
 =?utf-8?B?N3JQVndpLzR3ajFYczQ2OVNjZWFGdG9UcnhjSkV5OGJOQzlLeTgwTDNhNVlt?=
 =?utf-8?B?VFpMU0Fwc0hlVTNJNTkzSmRBY2tlY1JHMkJMUUhSY1FWTUgxNGtVQWptWEZX?=
 =?utf-8?B?Y1JTQWJjNjA5alRSTnZ3RDFEZmtxU2EyNVovbGs5R1hTeVdGN2c4U0xqY3pN?=
 =?utf-8?B?QUpnTmJKVmM0UkUrSjE0dkVOd0hmTUU5WmpzaVh6Vm9XVWZSMDBVVGl6M09l?=
 =?utf-8?B?QUFMMkNHcG9JTU4xdURDWjFMN3JkNzhySE83RHRvL2pkRDNyWjJTdEExZmNF?=
 =?utf-8?B?N2lxaVEvUW1EcVFhOVdrajVVNjc1T3JEMGN1M1ZDYUV6L2hkWElUTFZvbGdj?=
 =?utf-8?B?MHI3QWM4ZzVuSUxJS1RGbE9VZzBQNU1TOEVaNGxtOXU2aUprZm05aUMwMjFT?=
 =?utf-8?B?ZGRkU3dSY1JMNzE3cHhyL1g2YjdLazNZYnRXZXBOTFczYW5mYS9ON0NKdUlG?=
 =?utf-8?B?d2dFOHo4aGdkeXNUZ096c2k2RlU2MTZTNlNSeVBKcmRVcm9wV2J0VzJVdUlU?=
 =?utf-8?B?MlJ6UlFlNkFsb0dXL3dTZmIzcENMeEZkMysrQkNvN1d6MlJnTTgvUnNiN1Y0?=
 =?utf-8?B?c01qVXkrVEZ5MGRZT0ZqVjVBVjN4R01hUGk3R045S1lPdVRUT0F4ZytuanNV?=
 =?utf-8?B?VmxHemoveVIvQ1JLeU9QdVYzb3N0SnRPbm1Bdkd4akQwUGFYZVlaTUU1UGtF?=
 =?utf-8?B?eWFHb2lrNEZ6S3gyOGR2UjNLYVVzMG9tQ0hZRTNwNFQ0OWRtM1l3WFZvUU5p?=
 =?utf-8?B?OHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43152e2d-79fa-4372-2929-08dcd8b1cb04
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 13:48:50.8422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Md9XLRUwzCxo7ePUyx4nV86hJZb+0NzUWMcNYQINp2hG1LTn/eFp+VuEp0GI+qyfTjmxegFfecnFd7xWu3qQ5yUO9OLzU93LIUFrADcvLwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10267

Similar to commit 890cc39a879906b63912482dfc41944579df2dc6
("drivers: provide devm_platform_get_and_ioremap_resource()")
add a wrapper for "platform_get_resource_byname" and
"devm_ioremap_resource". This new wrapper also returns the resource, if
any, via a pointer.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/base/platform.c         | 27 +++++++++++++++++++++++++++
 include/linux/platform_device.h | 13 +++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 4c3ee6521ba5..da6827f9462a 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -108,6 +108,33 @@ devm_platform_get_and_ioremap_resource(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(devm_platform_get_and_ioremap_resource);
 
+/**
+ * devm_platform_get_and_ioremap_resource_byname - call devm_ioremap_resource()
+ *					    for a platform device and get
+ *					    a resource by its name
+ *
+ * @pdev: platform device to use both for memory resource lookup as well as
+ *        resource management
+ * @name: resource name
+ * @res: optional output parameter to store a pointer to the obtained resource.
+ *
+ * Return: a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure.
+ */
+void __iomem *
+devm_platform_get_and_ioremap_resource_byname(struct platform_device *pdev,
+					      const char *name,
+					      struct resource **res)
+{
+	struct resource *r;
+
+	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	if (res)
+		*res = r;
+	return devm_ioremap_resource(&pdev->dev, r);
+}
+EXPORT_SYMBOL_GPL(devm_platform_get_and_ioremap_resource_byname);
+
 /**
  * devm_platform_ioremap_resource - call devm_ioremap_resource() for a platform
  *				    device
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index d422db6eec63..ab7f33f3c426 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -68,6 +68,12 @@ platform_find_device_by_driver(struct device *start,
 extern void __iomem *
 devm_platform_get_and_ioremap_resource(struct platform_device *pdev,
 				unsigned int index, struct resource **res);
+
+extern void __iomem *
+devm_platform_get_and_ioremap_resource_byname(struct platform_device *pdev,
+					      const char *name,
+					      struct resource **res);
+
 extern void __iomem *
 devm_platform_ioremap_resource(struct platform_device *pdev,
 			       unsigned int index);
@@ -83,6 +89,13 @@ devm_platform_get_and_ioremap_resource(struct platform_device *pdev,
 	return ERR_PTR(-EINVAL);
 }
 
+static inline void __iomem *
+devm_platform_get_and_ioremap_resource_byname(struct platform_device *pdev,
+					      const char *name,
+					      struct resource **res)
+{
+	return ERR_PTR(-EINVAL);
+}
 
 static inline void __iomem *
 devm_platform_ioremap_resource(struct platform_device *pdev,
-- 
2.45.2


