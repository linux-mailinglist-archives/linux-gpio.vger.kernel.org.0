Return-Path: <linux-gpio+bounces-36924-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNjJBEgMB2oLrAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36924-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 14:06:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E41B54F0EA
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 14:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3082D312D5EF
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 11:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D28D47CC8E;
	Fri, 15 May 2026 11:37:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2101.outbound.protection.partner.outlook.cn [139.219.146.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27A843CEE9;
	Fri, 15 May 2026 11:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845030; cv=fail; b=snZhfZjlsCGQZ4jOfe2R6+8zN1xb2jWZf5hU0mRCHjaN0c+94KDjILpJ/lc/zbh8Sv3kBC1ImFbHhw0VvFfe8DLLaPOADREiEkNI50ZsUyNGsqSwKWbWeq8q0lbwuo9maxXchBmcp0H2GLe3OGuvCjZgzD8WrQtNAC6YzUmdJ+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845030; c=relaxed/simple;
	bh=VjaJzuUL992XSKdvVsLBWyoGkavkc/M3Jsdzf10G05E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YRbfDV3MD+6VafXXKAbJjlGlO1miUJ/iBqAgLW2fuhrbns7+GZdbOGTfUAAqH3+SQOeMuOvqrKGGzjqCqiQy0T/Q4ovkhGSIc0LILoYUP5AumBKA6BzQDx7wEBi+2LFqZMUBya3Rz+huflLLWC0n2BDiSw/u2nGUoEqNs/KGzgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.146.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Shq0vFJp5qMWidgvzRuExcfCx7HTyXVOFg7xHAy6Z37tDEEdgtmYncJKUr/jQIXna0HUtRYLULN7w+hIJNPDAFkB0YzbZtzxMZgM91Lnsb6Du60oeRljtV+C+ulEhI/GujdaGhdRwFhkVrhfMA/hoOHKbv3UgwXvw4uH3YuPIJJHiNxlHSrNL4Bhiaokd/xgwGsM2buubieo5mZb3L7LPaokmITw0Z20FCesnpG5L8OYu9k9ZM3GU3P4b59bvR+zGGsUjVslolJfT09YvxfmHxJT7WDgEXQBz6zc2t6yIR7OA+M5YrxrAXndkOMlLb3qgkQjqANTVlTAq3+a6Ig0MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZT1JV6Ej2zk+P3JgAMvVP6YV46koQY03MRA+ZeXw6U=;
 b=YmmT46mJ2G/q0rPDKG6PVxDQL1Ijl8WNGa8MdfOCpq6Iu50++Xt+b9EWhSriSDoOTbeH/x1QQsvXjvRuFB34NirPW+GUhUfF1Xfg1lbrEhBcl7PWIMg7esKEkbGg0A7vl48As+vfjnJXQSngDT9wqPX1zXQnzY8YPoTOOUMRTqgYea27GMOWrMfioxpvDCH8XGlC24DVqtR+Ug5gjAs6slrm5xH0nuXuPN/N9k0SlQ28dELZCiXbcf9pbBwHzEwqdPl5Br/sKdH+jJZRe+JkBxOgcTwsZBVK7hPv0qwTtGcqW6dkV3MM9iXF1ntagsWdBqtDujwI1rqlTZpXebYuww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0547.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.30; Fri, 15 May
 2026 11:03:33 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.20.9818.023; Fri, 15 May 2026 11:03:33 +0000
From: Thomas Lin <thomas_lin@lecomputing.com>
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
	Thomas Lin <thomas_lin@lecomputing.com>
Subject: [PATCH v2 0/3] arm64: Add LECARC ACPI IDs for DesignWare GPIO, SPI, I2C
Date: Fri, 15 May 2026 19:03:17 +0800
Message-ID: <20260515110322.2883310-1-thomas_lin@lecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
References: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: NT0PR01CA0033.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::10) To BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0707:EE_|BJSPR01MB0547:EE_
X-MS-Office365-Filtering-Correlation-Id: 16113eb3-306c-44fd-720f-08deb2719a5d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|18002099003|22082099003|921020|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 xzhWUcNjMRtO6SdSI7PqvcwLknmBB3MNwR2LOFXpkS6/dXktiDqSDlbFnoEc6bLrquBAA50RLDCiMiabc72Hq0/ORgRBPTZSAZ0x81jBwPCF5Ts261jOlatxMj8DGlqTAjgfPMfZXhYlKeU92X8TJiOX7onZftQ9d2K5G2gKOkycIPRZUWS5EHDpxCC5PBk0b842ir9J8HNm8lvjzDkbH8GUO6SHsCKRgXYvZQ9MrwGME+TgFVorQ/1+Q3NdplRS7j/TdNt1KrX8gUzGVVZ0D3NYWYJKpqPGwx6rgoVXcEu5oDB/sRSuFRN9SAvqBeFwBVMQBs1YbhXCRkrjB+HYkWWgUhAioP/LRarow2x/OLPAyyTzWetcOe+3R2FnujGA8Eoo9bV+ofbYZi9h4WQyg2e2/ArCzpYxqTdlmWfbPys2gooilOZtnJVjzu6sCa+vz7Fa6e54+sNBZUUaalnqg7b/l5uyMkWFKt5XBmn3wNV7m8LagohPC7ItX0yBgZEEs3F6+d5B4bnGq9Mb0JmiadlzX/1qfVxHDuwPofRJeB7Ey4Vhm02nvB8PsIiV3y9iAzot+faWzffIyvqBzrLllA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(18002099003)(22082099003)(921020)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?U2NjYVFsSGhDZGlPSFd5Z2RzMVlVcTVvN3gyTDl6L2RCdXQ3VU43dGJOS0Fr?=
 =?utf-8?B?MDBlaWpCdmpyZWREcmxCVjVtSHBWanorODFmYkZqeThXeWlMTDhoWlFxdEtW?=
 =?utf-8?B?UVIxSStzWVBXQk9iUUZjTjhORkNRSm5ETWNtN0ZVdGhTK1BmaGkrZE5OUWxa?=
 =?utf-8?B?eXQ2bjFMOEVXbDZkR2xwcTdQV29UK0ZHcldZN25Ha0pDK1VWWUxRbGhyQWds?=
 =?utf-8?B?S3F2aFprWDZxT2ZzUHFJSXI1MndZUHFzd3VvS2EySTR4MmFadlZIRFBHWkhi?=
 =?utf-8?B?YkdML3R6RFdLTGh1cFd3UHpuVmtxUnFUZGN4SlpyUWJqZVBzZ0pMQ0ljWlhO?=
 =?utf-8?B?VHo3cytWeWt3Q3JqVzN4cnhRN3ZPeXFsb0RJeENFek5yc0hvSmwrWnFRRXRH?=
 =?utf-8?B?UlhGZ0U4bEMwR1pXZ2xOdTY2ZmxFOWxPZnk1UjJrTEVBTHZDRzkxRndvZlB6?=
 =?utf-8?B?djNzNHlIaUl4WWk1bm5DSVBLQU5Qdk8zQ2FXMVI0cVlZaWxmMHVLdmpIUU1H?=
 =?utf-8?B?RVkvWjY1OTR3SXhQMHgyREN0Q1ZXNkVSNVFZTkJQbHR6bzl2Qy9HcFRPMFZp?=
 =?utf-8?B?aDNJcEhUbkN6YVhwd1kxb2Ftak5NYm9iRk05bFZhajFhS0N6blNxTlh1SnlY?=
 =?utf-8?B?cEpMbmJ2S0p1bmFJSC9ONk5XQjM5WDBsNC9pb2dPR1V4SmhnMllPNGJBYlcz?=
 =?utf-8?B?cnNpc1hFQnFPMmZzUDNvQkJBU1Z3eU94ckY3b1ZBa0tiZTA5UXB4NEdPcnJT?=
 =?utf-8?B?WkVDQmtaZjREQXNrSnJDRlNLbkFpUW15OXRsVkl4TmJBcVRZLzFHcWtpS05m?=
 =?utf-8?B?M0g1bWNNSXN6NjhMVVF6bk1DY1RrM3RVcmgzK3E3VDdYOHJjZnZ5VktWNXJW?=
 =?utf-8?B?UGc3TjdYS0x6SE56VXdDRWNYd2tQQzNqUWVsOGtESlRyMCszdzREcW9Dc3dI?=
 =?utf-8?B?RkJValFsb2k1b0xhV2xEZ2swVW90SEFyMmk4Q3BUbldZRWhndVEvRXpTQmwr?=
 =?utf-8?B?b2NjWGFCdGt2WGlGTmNHK2RXbmZsYlV5UmFUOFlwVzI3WVBkNVUrQ2piZEZG?=
 =?utf-8?B?Sk5Uc1dPUG1ueVhzcGk3cDlGN1JFalpUZEdtWmNXMm5pcFlqSkJYSkJrUzYy?=
 =?utf-8?B?OGk5UjUyM3lSTm1vZXBOSGF4UFpDQUF3TVR1Z3IvbmhLZlNmQlY5dmNQMzk2?=
 =?utf-8?B?aSsvNnI1ZUE5MUFIZ3RqNGFqYk1rTFhheTVUVXJaMm5KcU9keHZ6ZnJuakNP?=
 =?utf-8?B?bmlFNEVkWkxSZE1zbTFkSFR2UW0xeUQzeGxWMGZsVGN6L0xsTG5DenA2NnFv?=
 =?utf-8?B?WjRKT01TVU1FOXFLVC9vSkJLNm5WTHc4MW1BVGVhQlVKWGpwTTBQZ3Z2UlVa?=
 =?utf-8?B?L3lxNXJaT0N5ZVdTbkNIdmxFT1JuSFIvdmlCN2d1ajNnblpRKy9ldVlMRkhZ?=
 =?utf-8?B?bERjZE1lT3MralNQRmtvcXA2SEZIK2xZVDFzR2ZuSzY3cHpQQ2hFMy9EWGIx?=
 =?utf-8?B?SjhUc3hyU2FkbTZjbmhvWmVDeVdYU0dKanRHRmFpSUV0Tkt2K1QyaHBpK3k4?=
 =?utf-8?B?elg4eWpOMGRtTFdaNjhpem02OTdDUHNUNEZNRVE4WkJaeVN6YXdVaVVTQlls?=
 =?utf-8?B?NklwbWx1S1haNVVOcVNaT1JtL0VlQ0lYaDRLcjVlSVY5ZEM1M2FWNkFXbWNi?=
 =?utf-8?B?RTNaY0NmZ241dnQ0bk4wUGIzRVY3Z2x5QUMwTkduRTBNOVJ0Ly92enltUTlV?=
 =?utf-8?B?YnNXSWFna3BSVmh5dllONGlMODVHQjlycXFTcHIyYkJwUi9WdmRGMnlmL1d0?=
 =?utf-8?B?ZUVsdWptVzNhYXhqNVY3WFcrTnIxUkl3TEdBM2JUb1pUVFJEaXJUakxOMTFK?=
 =?utf-8?B?TUNkTHdoaWZDU1RHRkt4UE8xVXBPK3dRMmR3aklUT0wrK3RXeW1rVmRKc1ZQ?=
 =?utf-8?B?UVh0aktobjh3VWRIa1JHQ1pFWERQd25IWS9TUkVrWkZBR3N5K0cyVmx6MFJm?=
 =?utf-8?B?Qm1BU1NMdlB3UFJyaEhQM284L2w3UHlHeEwydERma01BM1g1RmxIWkc4MUJv?=
 =?utf-8?B?VlNWd1paQkNpWFdlMzZITzFhZmRHd1NhcVpBcXZFMFlTYm5ZcGtwblpyUm5W?=
 =?utf-8?B?cWIrdFJIcWpjSmlWWWVGNjZYaDVxdDdjZ1l4M3BSZlVVbHZHUGtBR0hvdDBx?=
 =?utf-8?B?eXpQT0VoWHlkZ09FM0FJTGJnWmpoRE5jV0lwaEF0NWtXS3V5aUE0a0VSZmdN?=
 =?utf-8?B?cXNONXJwYW5kdFYxQ21zREhWdFd1VTI1aUhDU21aRXBHNU0xTzg5K0w2S3Bx?=
 =?utf-8?B?WlptNW9ZUVMzNFNVM245ZGlvcnRQRmhnNEhJb1VFVCtOcjAyMUxDQlVJK1dn?=
 =?utf-8?Q?PhOkA19lAN0EDOkg=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16113eb3-306c-44fd-720f-08deb2719a5d
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 11:03:32.7881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LX9qIc5amIFZVKNGFLxY3n7KAcNnVmrlbqnLYH9blVeh+buR/WmSTG1843ipF7EtzHjgQJs2I8o2/H9QNeL4iuhsddVSrdwHC67lvjEaJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0547
X-Rspamd-Queue-Id: 5E41B54F0EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.984];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_RCPT(0.00)[linux-gpio];
	DMARC_NA(0.00)[lecomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36924-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

This patch series adds ACPI identification for LECARC SoCs that
integrate Synopsys DesignWare peripherals.

LECARC platforms use the following ACPI HIDs:

GPIO: LECA0001 (V1 register offsets)

SPI: LECA0002 (requires custom init function)

I2C: LECA0003

The patches are independent but share a common dependency on the
ACPI description file (acpi_apd.c) for SPI and I2C. To avoid merge
conflicts, they are submitted as a single series with the following
order:

Patch 1: GPIO – add LECA0001 to dwapb_gpio ACPI match table.
Patch 2: SPI – add LECA0002 and dw_spi_lecarc_init() to spi-dw-mmio,
plus corresponding entry in acpi_apd.c.
Patch 3: I2C – add LECA0003 to DesignWare I2C ACPI match table,
plus corresponding entry in acpi_apd.c.

All changes have been tested on LECARC evaluation board with
kernel v7.0.0-rc7. No regressions observed on existing hardware.

Changes since v1:

Revised subject lines to match subsystem style guidelines

No functional changes

All the comments from reviews has been fixed

Please apply.

Thomas Lin (3):
  gpio: dwapb: Add ACPI ID LECA0001 for LECARC SoCs
  spi: dw-mmio: Add ACPI ID LECA0002 for LECARC SoCs
  i2c: designware: Add ACPI ID LECA0003 for LECARC SoCs

 drivers/acpi/acpi_apd.c                     | 13 +++++++++++++
 drivers/gpio/gpio-dwapb.c                   |  1 +
 drivers/i2c/busses/i2c-designware-platdrv.c |  1 +
 drivers/spi/spi-dw-mmio.c                   |  7 ++++---
 4 files changed, 19 insertions(+), 3 deletions(-)

-- 
2.43.0


