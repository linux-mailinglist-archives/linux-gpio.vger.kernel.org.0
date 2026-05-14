Return-Path: <linux-gpio+bounces-36806-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHKyBlpIBWp0UAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36806-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:58:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF0153D725
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACDA2302A1A1
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 03:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCAD3A719B;
	Thu, 14 May 2026 03:58:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2121.outbound.protection.partner.outlook.cn [139.219.17.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E683A71A2;
	Thu, 14 May 2026 03:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731091; cv=fail; b=QYgVPjxMW0Ppwp8dPsoWFPOp37IfNC3peo8iM8eK+RAxA0IX6KS8M4TiaADsuuYVFpkcVkLlQ438uuwjMVvlHtJoO/k/3MJPI1vzzNwvnLlw9eTKr6oUhTDWpzZMcgdOVYHSmxXDteCbyyTDB1iJ7lAXjH+FAtwXbzuyxfiSGvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731091; c=relaxed/simple;
	bh=FHPF++DRUYVoGsPazjJbAYwRawqMx07V1FHs+nXuR7k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cWoH+imj/bXJMtOBNwCDDp4GQ2B+heOjTBz0ped5LFIIWlnyckN2xhbp+cImrKQFsPZ/1itKRKQOPHv3mEUPmwBtfHiEtLcR0mHpzFByS9a3H80l5BCo/q0DEVT6M9pnn7H03mfXEAOSAhiUbBZFpbOtkmA8TI2uY1bLwwFx+4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.17.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUxSd6g+q202xbWTt8F307cVZeHXMm98LUCVbhE0MQGzoNhujs4zfOzHGXRqEqsZ4FRsVLjx5hnF8cdfX5P7G6d6ZRqkWnwjLo8AqvVuIyck5gfu8THvgS0VxSGdApqpw1SNxKLOJh0ado+WzOMhL3nUZTK3efxDyg244J1v2y/HZ/U+OQaNTLj6ISiLDZCqMswir3OwhdqJA0LG23LQVRnIgGNPuFHgizkJhILNBJ5GVZTENaQCGK4fY0UzLJh5SIGEHG2oeA7O/cgy6SLAebKYULLE+EgcJ7bTmnRKbp1qK7yjrtOgEYDnjgoKwOkf8LgBupTfSUjmBHMzl3r8DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39yXbCAU+KSZGbjeSwnMYYVVmtBP3m/KzUYaBH2SUQg=;
 b=bk22ycXiPAZtXWLPWRv6fm7WebQmyvUHvud1SVQpRgR0ypRvz5ttYCpC2srYMxEsxANKdrGA/qXwnkVVWX00nFuy5/PR/vmXxN1dKElAw0nqDtE6Mn/6QFjc75k7y81WGzbf29KGsGV19p7gMbsXuYlL4qqJq4NPRp2v/UYik55coRYZlGoZFg3fMGw9fNivsD8JXHl6xHroakZum/SWH2cjQVkjbnSv0LTRGuLiLAd6TR8nKRZyjVhh3BC3hF1Z/R8e4dycYTMidyo2P1EvD2pJZhuvWmir7IAUmQz8SrgxGUX3Liiv4txzffYj0mg0t4e4O6KiRzIEhB/hMuqGnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0515.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 03:43:28 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.20.9818.023; Thu, 14 May 2026 03:43:28 +0000
From: thomas <thomas_lin@lecomputing.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	hoan@os.amperecomputing.com,
	linusw@kernel.org,
	brgl@kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org,
	broonie@kernel.org
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	lucas_hao@lecomputing.com,
	puntar_liu@lecomputing.com,
	jihua_tao@lecomputing.com,
	stan_xu@lecomputing.com,
	lumin_liu@lecomputing.com,
	notics_zhang@lecomputing.com,
	braden_zhang@lecomputing.com,
	harold_wu@lecomputing.com,
	will_zhang@lecomputing.com,
	aurora_jiang@lecomputing.com,
	ryen_lin@lecomputing.com,
	andy_jiang@lecomputing.com,
	thomas <thomas_lin@lecomputing.com>
Subject: [PATCH 0/3] Add LECARC ACPI IDs for DesignWare GPIO, SPI, I2C
Date: Thu, 14 May 2026 11:43:14 +0800
Message-ID: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BJXPR01CA0067.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::34) To BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0707:EE_|BJSPR01MB0515:EE_
X-MS-Office365-Filtering-Correlation-Id: b31c13df-a601-41b0-56f4-08deb16af5d2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	PUYV0mEZ9Fa1R2QmtmVYt3KqqbAJ4bej/6T563utM8eHsLniDm/tcjacOxyixYI6O4bj7m6rXGtw1cFMieEYIAeWyjXrXsoZUIKEz8OXOHs/jnmm0YjEqxPAE6hVq7ONmSkkIo0nvdgh9uSLQbVjI4VFJgwJIsBPuPxtjItCZ6C2MLopbLosfwXCexHsmwNhJiI1zSUfkIDlkPnJOPDFdK4vEQkC7r0z/yDrW160RISjQa6DV9HNo0p9dbojKhksQGA2eTTf876SG6GSp6EEwLd5f4le45CWEiH8e2bdvG3fy2nXD60h0eC1UEE+N/zwdyDNGRmp9YcjRvpv8ffZLlm8QlIMQt7uKB85NtAfmrZp+z+oywvFTyqWRmbR2c71vGc92Sq67WDt6kqJvo7JYkvtX4ni89LBfFW9mjPwUzc8z7Bv+KRiXWzZK36eEgk3kWTIW7FJtHW4gteHMpjmY9UEHe5nLWy8fRbCD7O38kZlWkY7ONvp5GJN8xZVsSpyz4o4aMHH6u4/7/nQk7W8gDmXI9VVvwdcnChTmyJu973pAtSThnoBuuOeCNaoWvetCkZ82AuYD++O9iSJMx7J3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3ZSaXYrVTcrd3pjVGtIeEJaSURLbTNwVjREeWdlRXF1OGIxYkpGVys4Zk52?=
 =?utf-8?B?QXJ1djhPVGEyQXJvT2VmTXVEaHEza0ZwYVRFaE9nc3UvNUVGdHdpNElJVW1v?=
 =?utf-8?B?eDVvQUZmc3M0Z2l4V1VOM0MweWY0QlJNOVRCckNQeWpiTHpIMUFvYU5ObXFL?=
 =?utf-8?B?ZXZoa1VOY2ZtdGE3bHB3N2g3OXNmSm1ibUxjK1ZBbElkNmNBNlBSU3lvWW1U?=
 =?utf-8?B?MkE5blhNOWlXcVFJUjNvQzRXR1E0Q2RkL1RCeVVkMUxJSXA5WThQNEZCZUNu?=
 =?utf-8?B?MVNaMjVnOFU5Tk8xejNiczByUWM4MkxsUlI0L1dta09UaXVqd3YvRWFNVE5W?=
 =?utf-8?B?MmhBeks5QlUzUjlVWFMxMkZZcTIzV0pPRzNCc01MeVo0SklFZVdEMVYwSEk3?=
 =?utf-8?B?eWx2S2c0dnRyQ2orUU9aQnBpUVRjYVp6TjJZMDRBMTVlblVjZ05JME5VOFVq?=
 =?utf-8?B?eE8zVFJPRTlKVnA1aWFSYVE1bVpDQTFiK2xWSHozS1VzMmtRWDIwNVVsOVBS?=
 =?utf-8?B?VDNDKys2ZVZFVkE5Zjl6c0pIc0M2b2Z2RlNPNFpXVzlyK3JiZEVzMG9TcWM1?=
 =?utf-8?B?T2hJcHZUbUVXNDM3Qkx6Sk0yZkRIbWlPQUdkSlQyaEw1dUpkU25mdWJ1UGxn?=
 =?utf-8?B?ZTVEdzRIQVRVd3MzMUNzU2tvaDhLVzgvczZOTy9ndXByWncrVkcyTDJCVEJS?=
 =?utf-8?B?YWJJM3ZKSFd6OCtzVnNxUk0zRTBqbStYYlRlTU1ZZmd4VHhiYkozS2loRVo1?=
 =?utf-8?B?Sm1XQ0s0MU9teDU2WVhGZFVoOG1NRWI1eGNJQ25DeWNtMWtOcjNRM3NDa1VY?=
 =?utf-8?B?TVJkU21ERWJEeUFBSllpMnZNMStpZUZVSmNIWjl4UWVvL0RhZzFEeitiZkhp?=
 =?utf-8?B?WVBIUFVQdnhJbDhBN2IyVDdqdDd0SG1QUlVxTGNRMzFhK3UyeG5oVjI5bFFj?=
 =?utf-8?B?SEJsbXBVU1dzRzgycEg3a3BTdlgzOGFweHp3S0xHTXlvRERiNDBZSXUrMHNi?=
 =?utf-8?B?aDBieE1Zd1AySmFWNVdxSFIvTk9zZ0pvczRwSndJRktrWTNRSVo0SHJFRklU?=
 =?utf-8?B?bGxFRW5UWTJnUjZxRC9STE9ranpsSk5ncGRuVzQvSDVGUXpKVTV3TGVlSlJK?=
 =?utf-8?B?OURqSjlDMFBJVFA0YTY2UXk2VldRUDdPT1BGYmJUZkpLeFhYMWU3SG5yZCti?=
 =?utf-8?B?aEVzaWRwUGcwWENNS0YySVRGbFh5Qks1azlyTldJdk5nZkZ2SEY0MjFHWngv?=
 =?utf-8?B?cnZIMjhNUVF1cC9OZ1p2Z3BCVzJIc2o1WXlNQXhsaUFsQS8vcnQ5YkhJRXR5?=
 =?utf-8?B?WlRaZFAwMFJCc1ExaWJ0ZWVVdCtyT1o0Nk00UVgvWmdhWWdzQWlYZjRKYVUr?=
 =?utf-8?B?MjV3SndMbkVqcUJtazZsd1lkMG03NnVIK25pRktkcngyUEtPL09UN2NZQXlY?=
 =?utf-8?B?Y2JJOC9VUncyRmlFMkFGcVFWelB3TXRudXdETW5xL0ZpekN1dmk0aXdWZjNN?=
 =?utf-8?B?Ly9HQXYvSm1xK0crUHY4TVhkSHF4blFuNDl4cFVVejlFbHRsWU4xUVJRRUZa?=
 =?utf-8?B?anNXNWJTYjRjZ1JRSmFYVE5NM0pyRXRod1dnNFQ5UGZyUCtEd2xHSXc2Yk5E?=
 =?utf-8?B?QksyVXUyMXhLeEpTU0FrSW5NOHh4VERqSjlZRElwYUhSdlVQNGZjK3QxQ3lk?=
 =?utf-8?B?cFBWU1lLaktJTE12YlBzMlNJNVJsUFk5bUQ3UWR3K08vVmFlRHB6eitXTHVm?=
 =?utf-8?B?OWZZSmxGTlB6MHF6QURpY2R0K3JlS1Fxby92K01rcnp0VEpKd01OMXJSRVBZ?=
 =?utf-8?B?TDQ1clFnRy9JWXhSWUN6bTVqbk5uczlZb0hGQUtiS2RwOXk3N1I5ZmMvMVBF?=
 =?utf-8?B?K3BYVlR5MERXOWt1TzF4cEZUY2JUOWRXazhCVVFsRVF6M0htVHJEbXVxSEFO?=
 =?utf-8?B?YXpKeFNuZTdrNnhZSUNaakVPZ2NGRUFVWnJaZFp2SDZTdXRvc3B2ajR5bWxp?=
 =?utf-8?B?ZGxXSjFudjdMMjBnU2hJbFpGcEx1YU03T0ZGRXM1RzhWRmdPZVhOWW5TYndp?=
 =?utf-8?B?bHdvSnh0VXZNWVRnU2RZOHJrd21NcXYwRFVtb0xYbnJyekduSUhSclJhM3Vm?=
 =?utf-8?B?a1ZicEozc1hZdW5qam51OFUrMlB2RVpqYUhxUVJhaU5BclFwalNmWDhCNUJC?=
 =?utf-8?B?MzZZS3VjV3VvdnRDN3hzWVdTMG83SWtVdGhYTHh1RzZYOEdBbTQrT1Era3hz?=
 =?utf-8?B?Mkh1QlVLaFFCZW0vck1zNGthc3hyM2pySDZMTkdIbVZuK0NXSDFJMW95SzFJ?=
 =?utf-8?B?V0tuejd5ZFBaM3cyRTZjUkxhYXdDZktMUlJOcmZJOFd0SG1JbjJNNzFGemsv?=
 =?utf-8?Q?NXKKWsL1avffCHYM=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31c13df-a601-41b0-56f4-08deb16af5d2
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 03:43:28.5116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HrtYM6i/3q6K1eQDAwxP+eeR1EywDi+YXY8BtjLSSdmcX8U1Izz+lZRJ98BPAnBtaYIkCPv8+Aqa0STzVwE2niJ/1KWRXAokgVZTD51DV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0515
X-Rspamd-Queue-Id: CDF0153D725
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.983];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[lecomputing.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36806-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lecomputing.com:mid]
X-Rspamd-Action: no action

This patch series adds ACPI identification for LECARC SoCs that
integrate Synopsys DesignWare peripherals.

LECARC platforms use the following ACPI HIDs:
- GPIO: LECA0001 (V1 register offsets)
- SPI:  LECA0002 (requires custom init function)
- I2C:  LECA0003

The patches are independent but share a common dependency on the
ACPI description file (acpi_apd.c) for SPI and I2C. To avoid merge
conflicts, they are submitted as a single series with the following
order:

Patch 1: GPIO – add LECA0001 to dwapb_gpio ACPI match table.
Patch 2: SPI   – add LECA0002 and dw_spi_lecarc_init() to spi-dw-mmio,
                 plus corresponding entry in acpi_apd.c.
Patch 3: I2C   – add LECA0003 to DesignWare I2C ACPI match table,
                 plus corresponding entry in acpi_apd.c.

All changes have been tested on LECARC evaluation board with
kernel v7.0.0-rc7. No regressions observed on existing hardware.

Rebase from v7.0.0-rc6 onto v7.0.0-rc7.

Please apply.

 drivers/acpi/acpi_apd.c                     | 12 ++++++++++++
 drivers/gpio/gpio-dwapb.c                   |  1 +
 drivers/i2c/busses/i2c-designware-platdrv.c |  1 +
 drivers/spi/spi-dw-mmio.c                   |  9 +++++++++
 4 files changed, 23 insertions(+)

-- 
2.43.0


