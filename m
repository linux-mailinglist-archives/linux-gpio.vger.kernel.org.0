Return-Path: <linux-gpio+bounces-23100-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE8EB00521
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D2C13B1324
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82329275B0C;
	Thu, 10 Jul 2025 14:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aIG7+AvX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73277275AE3;
	Thu, 10 Jul 2025 14:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157354; cv=fail; b=tdIveHawdLXRle0qa8dVh5owBiIeYpQuahp5vXcdeuxeEPAlc+gLqIrnDpo22mZiF5/auHtTmw7DjUwu4y4D4fR28IJLdH8CsbJkNBi1IY9s/TugAiIzpzmk1r7cxNMwLJxd1WaU9UGu4qF1r4EGv5mhndgqwLzDG0RPXaLscDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157354; c=relaxed/simple;
	bh=JSkNUoDiSehQIacxPyaMGjWvkD0rhvPQEl6CM6HyIn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XXrWZS6OIOAvQnDx4GIESFLgqkti1eV5UagNEocEnCKZgyFTpOmawOUcFwv5EGRH5sONhbqyTwnl7YK1b9fTVQFONgHj1zPu2TBqe0M8JBhJl0dJBC1QHc1GiD++4afx3RaO+hmTx7Y7npc9mFaHGfvJkCOYy1yT/EEu8H7ONUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aIG7+AvX; arc=fail smtp.client-ip=52.101.66.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8gX94oIUJuuH2hkAnIdMzdG5d0XWDm0Zo84cfY3+/9g5hkacASse+bMmbLIWjtp41gpMzEemrEDz2ACH0yqW8MFKhdCiGfQq/AaPj+WlHVQDPcJ5NwyWXd59n6FFWQVQiktt/hVexQO0K7jtD4/+td7rBTjcecJs3IaCaXG6rfnflQmX8nmXD0wR/TNnxmuwCYgPqSQcv5IGr1Gmzl5tBth22JbDaKO8UBtjYUOJQZiDuRRoINC/q9N3PaMah2h6eI8gYHTmBJwBjU0vZ3tyRw40gtJDWqo2JU8u6ER5zeAdcWfwtupDNgOhfAttf1XeBOqEnm9y73DPxIpOTSVvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+2DfRGHKqmnk+7n49QHgdc/zcyTB8NjrlRALHeMUTI=;
 b=nr+K6TolyYAtBbEOdW0GrI3PgOxYh/v+Yw4B/vZZEI2qt8ElIHP6RtNvTM7xZIhtRuF0rTNmKE7Pbj52nqFKniZYncbaTTzom4cnHCupvOJVuVcRN6mhV7KaFQLh3JXoi8TmcR7G7G9isgr4ROD/EHdA8UYB7ofEtlsCTrZAutJXwPXaDnJLPlS45ezLLi2aYrkIkCx2LJ1MP9dhvFZjhw5BwFZ8VqTPwnQI/zRJKNrZFtXsIXfH4ws+eBcJDwdJvuby5nHGi91njfg0Rx9Dj8fGX+hCfi0SaH5qiFPOt5TjhEAWvAE0SQRX2tpcqG7gWH7WbMbLMQ1vygfZ6Vk6Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+2DfRGHKqmnk+7n49QHgdc/zcyTB8NjrlRALHeMUTI=;
 b=aIG7+AvX3d4lD8Hp5w9PdouZ/JJQzMbDUTi+Yc41tZKyVjSEx+zKdt91odsdPO4oACZJMCsq527EAxDVm/2zr/daLTHtTJaxa9BjQx0ku/hROFLVfdRxPx59KKmaMzwTMVqunKGL9H3DvwK2150q/9vmamflk5GURQmyFPwZ/wzHAwpv+2CM+tFZw36WS9P8k7gotM74Q9j6M2ikHDv2W775VtOgd44EllYySHh6BdocC+bZLtA07fHpATyGL99nOXa7AwSg1C9IcZ4aMj7hNNxfKP22ssYgmfMbFeO7o69kfIWnBYwtZu8whlBAhbumcdXm3vaVxkF7aL2rN61gvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DU2PR04MB8952.eurprd04.prod.outlook.com (2603:10a6:10:2e3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 14:22:27 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 14:22:27 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chester62515@gmail.com,
	mbrugger@suse.com,
	Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com,
	lee@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	ping.bai@nxp.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	srini@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	s32@nxp.com,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	vincent.guittot@linaro.org,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v7 11/12] MAINTAINERS: add MAINTAINER for NXP SIUL2 NVMEM cell
Date: Thu, 10 Jul 2025 17:20:34 +0300
Message-ID: <20250710142038.1986052-12-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::16) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DU2PR04MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: e479ee9d-38b2-4261-ee5f-08ddbfbd3223
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFZnd3pOaWMvYy9YOFZYQ2NkQ3RreXloa25qWnRxOWdLd0oza1NOSkZwVEtM?=
 =?utf-8?B?VktCbHhtbEI4eURwb0xaeFNGVzBXZGlWT2JCOUNNZFJhblNRSEgvTVdzbGZV?=
 =?utf-8?B?N2tFNXVzTHRnNStKRGgyMTJrYmdFM2JqNEVXWTQrQ3hDWSs5c0lsS2YzWWZ0?=
 =?utf-8?B?MzNtWHpBRXJ2UjZzRDBHN0RxTy9IMElxV3I4MWJqa3RUd09qb3UzcVI1WDR5?=
 =?utf-8?B?RkdYOE1aNHh3S0tsSFp4eGFOSWJLRnRNZndGWmRUQzU5TzlFNTdqUlVFZmor?=
 =?utf-8?B?VitKQ2VTRFhYR2dsak5ZQ3dhZU1xNjAwZmp4VUxvMXRZV1o1QnpQWDdYL3F4?=
 =?utf-8?B?Zys2clBHYlZReU4xdjUwK3FaTlJ0UjdJaU10MHIvSE1HRER2eWMrZ3RtMEVO?=
 =?utf-8?B?VDFkMWtkdXE3SXhWREF0MGZzWjQzMFlUblZPcDV1OVFuR2c1cHZrUCtvbitr?=
 =?utf-8?B?MUNWZUhOWUE0WklBSnRKM1UyMkVRak1zVWova2dPSmZFQjB0TGFBMFpJVEFH?=
 =?utf-8?B?clpQUDhFVUVxY2tJdGZIRUJObWI2NGZYSGl3NjNtMHhTWURNdFVHQ0FyNkgv?=
 =?utf-8?B?dnh2RFlDSm1HckFRd1owZUFaY0pkOWtMeThEVFV4U0Z6b1I0QUtsWmFtZDVI?=
 =?utf-8?B?ZUVDNytiWTNObDUwQ2pKaW9UMWs1bDI3eGpNd0I0dHZ4aXU4UVJMNjZKMm9T?=
 =?utf-8?B?RE5aWEZKdDIrSXpybWRsLzRSczc5MXpqSnVrM0xkdndaWjN1TTZjZ0pST1JO?=
 =?utf-8?B?SXFXOWxOUUdFTHozSkFBRDkyUHFaYTdvS01IZHBFL0V6Z01VekhpY3ZOeklP?=
 =?utf-8?B?eUZEZFJSMnVaelYxQ0EwdUFuRDFqcE9PQVdWVzRiRVRsWDVrM1A0bXZjQ0Iw?=
 =?utf-8?B?aTgvRVpjaUlKaVFTRXNZSFBBYVU3bkhId0lxYkVPRGZ2d0NBUDVxMXYwV3ox?=
 =?utf-8?B?azFBYWJUQTdnVTQxNlB3UXVFM2ovNlFBd0xmeHJXSkxUUjk1L0NwWFdodjc4?=
 =?utf-8?B?YkxGd09DQmlVRXdVMGYwQzdwQWdoTDR2U2xsZk1mRWkvSDduOCtuWG5aRnZP?=
 =?utf-8?B?b2thMjIzc0FRbS85NXpjRVdQOXVLZllIWTI0UW14VW1leVZUbkVvWllmY1JW?=
 =?utf-8?B?VkdlcXphZzNvMld0Y0Q5NXBwWkx1QnFuZnVNb2tqM3lNZVZia0Q5amllYSth?=
 =?utf-8?B?MjA1aWdkUVlCeTZDOEpXRithSHRZUFNvc01Fei9KcFRIcmcyOTJnMHVETERw?=
 =?utf-8?B?eGRuOWJLUk9VbTRHRE10c050S3V1amtHVy84VTB4ejVWeFRKSHJKM1M5anZC?=
 =?utf-8?B?WlNQM2pHVE5kR0xHU05ENWZYQnFqTkJtOHBPaDQ2UUxyV3BGdlVjY3d6NGhK?=
 =?utf-8?B?bWlPQnVwL3h6Sk9kMjhQRzIyM2lMR3JIQWYyNjF2L2dVOGlpRklaV1ZGVjc1?=
 =?utf-8?B?ei9pZVJLa2UxUysyVUpGV3c3akh2Z1BuZldPc1ZTK1QzKzREemp5ajRVTTJQ?=
 =?utf-8?B?aVpraGxsRS9NVmhVNGJHUFZmak5sbDVwc3dUczAzOHFJRisxT05SQVF4dU5z?=
 =?utf-8?B?SnlZemM1QVJXM2FrRHZxTXRucDZYcDlSbGl0ZDVMbW1KVmtoVVVsSm1RdWdi?=
 =?utf-8?B?WC9Ga1hxbnF6Z29LNVk4Q3pUcjhvU08rR3dtMnJmZGZiQ2k2WmVJOWxyTWxp?=
 =?utf-8?B?UGsvVXg0cHJjZS9RZy9IUVdRRGxSc3BtTXBnYXJ6cm41ZFRBNm5qcmtTNFlY?=
 =?utf-8?B?OEVNSHNWSzlHcEl3d080UGRRc1FmM3NKN1JmbnBFdmZlcDQvQXhLbmJWa1BI?=
 =?utf-8?B?UTJHK0piN1JweGxScEZDMlA1dFY1ZnJCTUxNSHpyME55R0dDb0EvYWZHNVZD?=
 =?utf-8?B?cXZYZ3Q4dFlEYW83RkZPYm93T203Z2t3YWRtaUt1ZWkvQTFWZ3dyMHVxOTFx?=
 =?utf-8?B?ZzhpdVNpeVY5dklydE8vc3VDdjFVMXlMSFdQTDNjZXRVdktuWnYzN2J4MFVO?=
 =?utf-8?Q?i/G/XqWWws/x4zCX8SYMVDpHWd9x80=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGFNeC9PejdVQ0FueEsxQlh2M2dBUmRoVXZIUDZEY0orK24xVDFXeXJpa1dW?=
 =?utf-8?B?Zks3cjRERVZVdDBMZ2ZnRGZLZmFTWTRIaHNqWEk1V3ZnQ21MWXg0bjVZMEg1?=
 =?utf-8?B?bzFHYUtrc0NZZU9OWlFiODEvNDRLSlhpMlpDeG9FM2hOMXhtWFVkWUpCZlpJ?=
 =?utf-8?B?VWoyWk1McnJUeERhTU9nM1ZDQklNYmZRY3FiN1V3U0ZabkZUU1Bla2xlYnRr?=
 =?utf-8?B?dTJjbm93Q3ZiZ2NaK3ZKWXNKbCtmN2dqYmtITklVa3JOQjhVRHg5WmhHRWRG?=
 =?utf-8?B?bDFRMXNmejNIY2pxVWl1WURpeFVXekZhRWNjZkw1Sk1QUEh1ZW5jem1QNHJE?=
 =?utf-8?B?R3BROUlzL0lmckt6OFRMMXZyLzdsbWUydDZKcWFCYUw2dE9RODZtbXY2Y2VE?=
 =?utf-8?B?eXdBamNzZVlCRUlkT0VyUk9TSnk0RlhqRlc0TmlwK1d0R1hFaFRPSGdxeTR6?=
 =?utf-8?B?Zkl6UEhhemZWU2lOcDNINWkwZlU2ZXVtbStPTEQyckNJUi9sMEkzczFjVytZ?=
 =?utf-8?B?RkxIS1pFLzM5RWlrd08yVGFyV203UlRTWFpnRFlKd3A1L1AxQ3Y5eG9VUzJl?=
 =?utf-8?B?bm1kY3Q3WTRGa3Uybm53N1B0eWt6YlJaQjFCZ1cvNU8zOE1tZ2NyU005WVN1?=
 =?utf-8?B?MFpTVlpNbUVZTUpUSkRNejBYZ0hjZzhLS1AzUktVNDJzbk5pM3NvTW5VVlhP?=
 =?utf-8?B?dUJRQUV6eWVmSFJNSTdNV0FUSDhnNEFCZVNaRmZJUXA2YXUwS0xaVzYyNkJP?=
 =?utf-8?B?N2ZETkJLWVUwajlQZmdjeHJkZE5lMTBCYWdEVHkzaWVFcTcxN2xBdEN4dE8y?=
 =?utf-8?B?dEsyNkIyMVFjZnNEZjREMU9qS0U3QVBUZHJTOTdUWDNHUnp5NWdoNTFNWk9H?=
 =?utf-8?B?SXgxaU52Q29KS3kybCsrOWNESXRhM1RYS0x0cWhUQUVIQ2QrRTJIQmU1eU5G?=
 =?utf-8?B?Wnl4NEg0ZnkxSER2a2dhR0U0NFpXQjQyNXpXWVI1K3VBdnp3dUxLTlFTc1NK?=
 =?utf-8?B?M2hWM1JRdG5MRTQ2NHZtUXYrMExXZTVET1lBSjEzYlVYc3E4aWlqZ21yV3hI?=
 =?utf-8?B?K3NYcnFuandrd2ttQWRCdWY5NXdUZUQ4UzRJZFpnQmJ2Vkl0WUtXNTl0Nzd1?=
 =?utf-8?B?WW51ZlEySDA1UUxiL3Nta25HakFmSWlKTFVPWTBCK2tYTnZ1ZWs2VFBOYVcw?=
 =?utf-8?B?VFpCZnVzSFR1WkR2Y3BXc1hORDliWldzSkw4WUkxM2ZWK3FHNEVtQUxGUzkv?=
 =?utf-8?B?ZEYyRFZpT3hkZnJZZDF2aDMzUlVXZXdjSUV6Tmw0QlZXT2lZdytZS3ZLVnha?=
 =?utf-8?B?TkJoS1hoNXRkcGhjS2JWOUgrWlNSaWp5Ulo3SjZBbDdUZWxKWnU1U2tNVmd5?=
 =?utf-8?B?Y012UGFGeFRzcStDcFVySkFIRmx3aXNpVkgrWThHSTFQRWNwTFFLeUNuYWR4?=
 =?utf-8?B?R0dTZFV3ZkNZamVnTUJtVEdGdDI0aXIvMElJM3hyaVIxSEF0MXVCWHp4TVpv?=
 =?utf-8?B?NlFPbDZrRkpVMURaZWs4TDRNYmsrMmUyREViaHJtV3gxbEgzMWZXdEpRRkt4?=
 =?utf-8?B?YlJITUt4WFB4WVh3eERZd1JieHc0YzVsRmZuL3pRcE9YeW5VSTk5OXVCRzJQ?=
 =?utf-8?B?c2VzMEJweFlPY1c2UVlvcW5QeUVGSStnVW9DQStMN2sxc2xzT2hublNaODgx?=
 =?utf-8?B?SXpiVm5PL0NzUFo5VnczcjQ4b1dkQTZsSldaVnBWQjhveCt0dCtRMWlkeTNC?=
 =?utf-8?B?UFpJNGM1TlRsWHMvUHl6MnNyMjQrYWVnUzZCemo0SjJBY1FhQlpwUFZFbFhy?=
 =?utf-8?B?RXpGYnhkdHhnYVFWN0wrNktydVBpTkoza1JRRU53RXVNNWQwdWc4TGlkL0d2?=
 =?utf-8?B?aDhzdndrZWZhRDRRSVFsNG8rL2hMV21qZjNmenpESHFJUWxZZ3FnQkVRUkpk?=
 =?utf-8?B?RVMzYUFOZ3RkNVFrUzh1UjJaMjFkUVlyODR2ZGtyWXUyRzJkeXJteGNzVWFi?=
 =?utf-8?B?ZlJaN2pJYzdBNmFUbGt4SXhRK1FDemh2R210QlNWY2czM08rRGxMZXkwenRB?=
 =?utf-8?B?NEpZaEZFKzgyMXUrajU1OVJkcmp6dHhMVnlDa0l4M1BLd3VadjhKMzZ4ZHZM?=
 =?utf-8?B?SVhiUitxVDFFazdYL29pNkhmTVVnRjc4M2o1cUMrTzFJZHdWdUQ1cG5Ncnh6?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e479ee9d-38b2-4261-ee5f-08ddbfbd3223
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:22:27.0032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4hnlfAHAKAqd94eSIruOp71cmotCdrGzsBU7XhDyTpePWGkqYFrxt5xM0RLU2ajpG6JtNCb+pcTOmmpzFk56QBUEYW9numP0Wo+hpopb6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8952

Add the new NVMEM MFD cell for the SIUL2 module under the NXP S32G existing
entry. This driver exposes information about the SoC.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e9b54bbcdb8..2342471d2ac4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3003,6 +3003,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/mfd/nxp-siul2.c
+F:	drivers/nvmem/s32g2_siul2_nvmem.c
 F:	drivers/pinctrl/nxp/
 
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
-- 
2.45.2


