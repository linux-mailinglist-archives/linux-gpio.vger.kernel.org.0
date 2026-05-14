Return-Path: <linux-gpio+bounces-36801-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFpkCkU+BWqmTgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36801-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:15:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAAF53D473
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC8823047262
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 03:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCD53126B2;
	Thu, 14 May 2026 03:14:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2095.outbound.protection.partner.outlook.cn [139.219.146.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6493C3F4112;
	Thu, 14 May 2026 03:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778728492; cv=fail; b=MGXIbiLBWSsz9vuaYLSm4NTy0JM33gD6R/OHjbAG1GeWPDkBBU8erBEn6241BsjbgPrCXyWzH6ziEWeUXFxlhj1bfLFFFauDdhjOoQxHwQgAeiM3DyTSAkVY0b7Cxg3pAxpzJmUAwc8S1lkMxB39aLF+vcrqOi/sodopKVrSlpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778728492; c=relaxed/simple;
	bh=JGSuNxzbGij48M8YZKUHlmoiF37bpzCQE2uGNAd6LIY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=n12efX6VhThujeI4sOBo0RMAxDU8tDMfT3+/sxM9tjxWpEut/hZxMydI83V7Vr+fNSa7BVtUqX7pKcoV5GJO2X4MgvkxBBlVQDLwGusMeXYG0bMsVSgdV+cIL3Lpt7O7p1e22zkNZCM+X0wKm97ibrUnG4ClR6MSxcNukqUOAZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.146.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5hol1zf5i1IKhcusHFMWYlLkXKZcDqzzW/vbxncxtVIJJfewiPjumyLo/2ZtNfS7RI9JHNMS+hUxn0k3NMC5WKC0fDz+fHe8EKXbcoj2cb8cTToZDS56S65w0FTO8n+orf+JExq3tP24CBkczqD8nkSVswlOzkpQQvNaJePwWk4j0wMCcO1cOuRPJOpzE8afebLlV6ruFUXhAJ9LiIZPAC4jwQSlgGq6l6atjr2WgranslBDz7BVmBOaCB22liufz/gQ32YAvxDzF0sHHj/UTydLjek7TmipghbS1B3U3sfd7GJJQyVxdpZgODkTt8hQzKezisYJkv/OKWvi+SKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aX++KP/OHARrDj1/OeBHMCqSQamrp+oS/xbpbX3nzI4=;
 b=ktGndK4GxxgQ1S24XFFnfJ9RzyZRdt8o0f3574Nj+5E8+17OMA1EteadAwkkHS1yMn25bh1KIpBK8FDLwWZ+5kqtp5p6fzneOL4AFxuvbIUX4Rw6RZOtWHQB/0Ji48ChPbQHU3GbpLZYcC31MBzK+wFMgg7vAIq/+BefBFV1WVJp6utxQCL8iIhsYRAE7+Ul/Ju71jOKKhJ3Yr9g4Nf0/pDy4XrCYPWdEcXA6QUVOEwUYnRsFEkEx+60j2v0M7ZIbj54lGZu9HeNqcjRjkpmTTyipJnRIB9HELzkWpffLA+x4nxZbhZpTqWQ2KK9frdMQbT1SeCWIyoO/AeDxVpfsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn (10.43.37.209) by
 BJSPR01MB0754.CHNPR01.prod.partner.outlook.cn (10.43.37.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.25; Thu, 14 May 2026 02:40:25 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.20.9818.023; Thu, 14 May 2026 02:40:25 +0000
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
Date: Thu, 14 May 2026 10:40:09 +0800
Message-ID: <20260514024014.3376511-1-thomas_lin@lecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZQ0PR01CA0018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::15) To BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0707:EE_|BJSPR01MB0754:EE_
X-MS-Office365-Filtering-Correlation-Id: 122e774a-b21f-41f4-e3c7-08deb162270d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZaiIqfjUfHNTRX2fuL/dRWEpXO4k/BQOKKr2WJem0A0TbDUkeftC6VorhcX9cIatkavo9spdw75E/YgTkf07HCCYyycKkkum/Mj3Blf0PjiFV4RNn1o6spvZGB9jT3iBelfYgdhJiMbGwp36kI44NWwZ+hh9DEJ+H4t4QliENgYxHbqjhqs5c9ViiSz9uffTD3e6Sb663Vug94/w5XbdjR+rIiO7rJMK0/qWzkHKrlIwxDCJ/UuYzK2n1AqDXEuUh4e8yWreGgXxHKO8Tek04EBiYVwlvMGCMbEkJ0bAIeD3gnHFO1Q7c+HduYB0MG/8Niuw1jQspCfJ/mTtryzp7CAoeuC/p/Vqaw98RYGoRGWpHbp+ALEn26EDhizlPVDcFxV4iuTCUw6YbFcukION4mjcCkcVpt8vRECFZuod9KdzEfNFOn9NKIUvnJ7PpIhWDx7jSusfChiXEMNXqtOjHjlcfALkQeAYn69tS2c/8V6gMNab3UHVjrbkELK48FVRtqgoTqAsJmcyxQ+RcPz3cgRHLqL4IX93pfoR9IjijRWbUsL1uoqgRJ8Cm+GYB8Tguu11o5w61WIKZVVBSdAe+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVZBVnVGSUlwZ1o4QTlmSHJ3Y0tqRkFHMHVHMHY3UkpvVnBoQUkzZ0Rsejh2?=
 =?utf-8?B?Z1VrM1FHTEkyZkg3TGd5c0lGVnRwQ1lkM2RHY1dkRDRmZUUzTXZaQkV4eUtO?=
 =?utf-8?B?YWVMOGh0V0JPSmRTTGhYY201WUg4VUVoaDAvWmp2a3dsdFBFUUIrVkR4Y1Rx?=
 =?utf-8?B?UHZscmFQRVFMUVlNdzFSN0o4TE1OOUNWY0Z5dEhvMnFndW1Gb0pEQURRODB2?=
 =?utf-8?B?SlRUOVVEQy80cmpsT2MwNEhHSlQydDBpZVlYdzdDZTNPUXo0WkZVM0ZZSnlX?=
 =?utf-8?B?R0padEJVQU9LZVNCVzFlVzA4Uk1HbGRTQUNwbCthaXdOeFhmMHFBQTZBeVlu?=
 =?utf-8?B?VG5uTlUxS095emJQeE9QVjRhN3AvYW43dEMwa2hua2R5MTBLOENXUzZrcXdh?=
 =?utf-8?B?blIxdXpJczJBaHJYWENkZi9NVTVMZnNZYzFwY3o1NEtHUDNFU0RYZzhtWkZ0?=
 =?utf-8?B?TStZeWRKTEJzNVJFZXBlSG5SeUdrbmtqcDRpa0lTUWVaQ1NldFhPRlRLOXZY?=
 =?utf-8?B?eEpnaHRNMzJGUUpCc0xOeU1rQXR0NGlJbHV5SDJpWDB5UW02bVg4NndhYWsw?=
 =?utf-8?B?M2dxdFNGS2RMNWNWRkd6MzFPek9aSmNLamVQblJiS2c2bVpobzE3UnlHTnZR?=
 =?utf-8?B?M1pXSE1IbnVYVWlGM014OG8va1B6YmlNZ1BVSzhuVHdTUHZkTHFlQytwYkZ2?=
 =?utf-8?B?T29UemU3aU1CVi92UUdjcHEyaFZsbXZGMWNMOUc4YTE4b0YxeitwVEQyVG0y?=
 =?utf-8?B?YzdsbENzY0JyZjJNVW1nK3djVEcyVk0zUEVBZjNJTmg0UmN1SUkvZStoN0NK?=
 =?utf-8?B?UjNRLzBINXZFV3cyUi90RWxEZ1FoMlJqQkZPUEdPVVNXV28vaXI4TFplZDhm?=
 =?utf-8?B?ei9Jb3ljaUxabTJteDYzbkY1bWVOTEJ5SGkrSlpPc3NmeEpMaGpXeGhQS2d4?=
 =?utf-8?B?dXdFTGUwUmprdWJ2ZHRqcFBCQjM1c2FNQ3p2ZENyNWF1Q1dYd1QxMW8vUmtX?=
 =?utf-8?B?VUZveDB0cEVTTzloZ3puWDNoZ3Q3NUhqTG5yMnVtb25QRTd4TU11Y1lxZUhE?=
 =?utf-8?B?QUVtQ0JaK0lobFlaeVJzZnovcTJKNUdlaFVsbitDeGszRTdDbkpBblp0L1hx?=
 =?utf-8?B?ZDc4T1pwOGRwbTUrWUFRci9HYWF5VCswcEZCZFBiNUZrdENpajBJdE1Ibi9j?=
 =?utf-8?B?VlJROWZmL1NxREJxUXBSVFJqb1hOUXd3bnJZc1hsWENvMkdUWTJYeWRlN0th?=
 =?utf-8?B?R0RwSGhJL2w4SWU2U3pyQm90U3J6Vi9kSlBGbUlWcU5yMDd0eHJpVXQ5RlE2?=
 =?utf-8?B?L1BoUVpCZFNES0kyMTVuTk9MZ081RC9WN2c1dS9TcmZHQ1NzTHB0NzFrbW9s?=
 =?utf-8?B?VU5tT2JnUWZJUlhUamVEeVpFVy9vSW1nQ2dXaExhRUVEUlVjZkgrUVV5WEtW?=
 =?utf-8?B?b1ZvMWxLajU1Nzd1Z2puQXhIMUJHTFdkMTNXUkhxS1hSdE91Tnc4c2xockFQ?=
 =?utf-8?B?MzkveWdNUHMxOGYySTVTNzBDanFSQzRlcUF6eWkzZURxUW5ncnUyNVBwT0Zq?=
 =?utf-8?B?V3VPMlJZdUpFYWNJdzlTUjhkbS8xTlIyeE41dW12cTZpNVdtVHFVUmRMdnJI?=
 =?utf-8?B?MXpQNkg2ZlNPdnVQMVRyN2QwOUI0ZGdLbW1iL2hpd0FCd2d4MXFVZHYrUDVV?=
 =?utf-8?B?NmV0ZlVGTUlySlRWSExtL1BvZzJucjZ2cW5xb3FnWkxMNFFVQmlpRzB2cGRJ?=
 =?utf-8?B?RGNaRmJLSS9WaVJSK1ZDcHZoZVp6eTJBTWVJaTNWbW5wL0k5UFdEYnFhMXZj?=
 =?utf-8?B?Q3dsMzZZMzlhbXJTYkovVWZhejJwZFhYUG9IYXZRelZreXhwZk84dU5PSi9V?=
 =?utf-8?B?WHJaT1IrOEJRTDMxalVyTGxHZlg4cXdwU2VBaDhHSkY5TTR0Sk5oeFgrcDZ3?=
 =?utf-8?B?WUZLUWt3RjREejNQeDRiOHJzdlNZWHdmZlZOUXVCTmw5M29tTy9sU0hXSWdR?=
 =?utf-8?B?UGM3NHc4YnVqM3ZzS2tkM2dZbTNqbitiL0xod2thZmVSM3JLd08wdmVhU3NR?=
 =?utf-8?B?Uk5VVDRaQmQ4SFpnL3M0ZzhNWk1HM2lWRlluQzczR1VrOWFhYmVleThYY3dJ?=
 =?utf-8?B?V29EZTJ1MWY2TVJTc2lwSWZqZHpadmtYbVdhVVhlTWlEOGczYndEY08zWlpV?=
 =?utf-8?B?dE5IZmVzZVRnU3BKY3BienRxRzJFOENyWVhkS3Q0eU1qK1MrMlZNQ2NEaFl4?=
 =?utf-8?B?QVpObUd6emtLc3Avb2cwbFpFdFF0RTU0ZGgvNkxnSnFGMUluR2djMms0Z2NG?=
 =?utf-8?B?MXJwSVBjVFhUeGdhK2xWRURHbVNpVXVmbTlTa0FiYnNFWjRtbytzVmJGZlRB?=
 =?utf-8?Q?ECKI6Sj/3VriPFI0=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 122e774a-b21f-41f4-e3c7-08deb162270d
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 02:40:25.5495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+iR+3UkZ/7gxbPaS7CulQKbrRzhBXlPZUEpYlivz7eDlBQN9c9zJLWZgo+0TxUxbkO7pSLY9Gl9oU3+XwHgXQnLG0kPs5BXirW+oUYJP7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0754
X-Rspamd-Queue-Id: BEAAF53D473
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	TAGGED_FROM(0.00)[bounces-36801-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lecomputing.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This patch series adds ACPI identification for LECARC SoCs that
integrate Synopsys DesignWare peripherals.

LECARC platforms use the following ACPI HIDs:
- GPIO: LECA0001 (V1 register offsets)
- SPI:  LECA0002 (requires custom init function)
- I2C:  LECA0003

The patches are independent but share a common dependency on the
ACPI description file (drivers/acpi/acpi_apd.c) for SPI and I2C.
To avoid merge conflicts, they are submitted as a single series
with the following order:

Patch 1: gpio: dwapb – add LECA0001 to dwapb_acpi_match[].
Patch 2: spi: dw-mmio – add LECA0002 and dw_spi_lecarc_init(),
         plus corresponding entry in acpi_apd.c.
Patch 3: i2c: designware – add LECA0003 to dw_i2c_acpi_match[],
         plus corresponding entry in acpi_apd.c.

All changes have been tested on LECARC evaluation board with
kernel v7.0.0-rc6. No regressions observed on existing hardware.

Please apply.

thomas (3):
  gpio: dwapb: Add LECARC ACPI ID
  spi: dw-mmio: Add LECARC ACPI ID and init hook
  i2c: designware: Add LECARC ACPI ID

 drivers/acpi/acpi_apd.c                     | 12 ++++++++++++
 drivers/gpio/gpio-dwapb.c                   |  1 +
 drivers/i2c/busses/i2c-designware-platdrv.c |  1 +
 drivers/spi/spi-dw-mmio.c                   |  9 +++++++++
 4 files changed, 23 insertions(+)

--
2.43.0

