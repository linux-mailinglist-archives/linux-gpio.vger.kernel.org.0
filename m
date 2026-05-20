Return-Path: <linux-gpio+bounces-37191-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMEKJiqFDWonygUAu9opvQ
	(envelope-from <linux-gpio+bounces-37191-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 11:55:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 116E658B2EA
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 11:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD93630914C6
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 09:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF04D3D0BF6;
	Wed, 20 May 2026 09:46:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2116.outbound.protection.partner.outlook.cn [139.219.17.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2089A3D16FC;
	Wed, 20 May 2026 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270403; cv=fail; b=oAS/sL9F9PllbKC02fOSTwN/Y5B5CJHOSepDUT3sW/b1P0EoN712o55bsvGUaSibl0L5nSPET1vxqHAon/IIToFgl6PYdojtSca4mK0KlUQdP0XKzPkPNTjHky3S052bryI3F3jtJMrRYYbnkrYwTZnHwj3mrNCCOgAXVBLdAhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270403; c=relaxed/simple;
	bh=yH4gugd4chL53NIUS+snnawU5ZZXykbf4HfPBK0hTVY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=k9KSGDC/GUjzJvYMboYQspIRSMGRamSVNPcWmR8gwKf8XLFvp+tQ/DTl9LykBw+whtuZnIgpwxXnPuG7y2u391uNHmF30YAdyYHBatZgvg3RtFc0N89dWra3zIFQGLm4l+jTo6Gmhjg8Cqut0mNzJRSTQAfRvznXMhMIDcs9QpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.17.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdNBSsNAG+Ocz9DAsM6Ktr45Ke2wcnYm1a3YFVLF0IVYtm3eHxL06x0PV7W+gq3BfQJVrp9Vf4WjMvr/OmxzDxKXiUW0TRGsbXUth1Usc970SJaScxn8uJYNeFO3SkWna78gO4OslQyN0DD180BG+6kE/U6ZO2BDljZtHb7IqiDqQri+a5pz/IJ0IbLm5a1+hKhvwGx7xrNnI9412NCfdWlP+TDu1V26n/O3YlaJoDHWievjJy88jHC2Xyo/GUJl4qYwkboPOyNh71s/VaOvwnGoz8t9Xcuc7UjkkdGjCn2M9hN/KqZPl+AlXxvPqDQH0dqfDz4sITIgI3M9mWnKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8wt02QAEOydDPsuM2zswZdFvvi0kfgobqbVYo+U4JM=;
 b=kbP+znQq1dq4Ftmcx/YN2N9kdEiAlShtNJSPshNU+ZFBCfmILCjZIH4LQaMpwZNg48gWyJePpoh7p9MaXCBxSkVjve+QtYPrUtk2/U3ooLvTE1AHM5mWw+Wbp0xZAtQjWB0fvuaEP96ihCarvvoTUsXe5YwJ7i9PWY4VNpzh+FvFU1jwIM/taR90yQfEOJO07uNEw3HlE9t0CBoZhkDElbYTdj0GzfAakZoM6mt5f1AxFr1H7Ud/O5511A3oyQ7oEM4t6Y6YWXiP9ECkMUwywImrFWN3BAujA8H4TlixXkL4U40QlgJL1PLdyxz3fxgcz21QsA2vVsXpQB4R1KCnHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0755.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.15; Wed, 20 May
 2026 08:11:51 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.21.0025.023; Wed, 20 May 2026 08:11:51 +0000
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
Subject: [PATCH v4 0/3] arm64: Add LECARC ACPI IDs for DesignWare GPIO, SPI, I2C
Date: Wed, 20 May 2026 16:11:33 +0800
Message-ID: <20260520081140.637637-1-thomas_lin@lecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZQ0PR01CA0024.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::19) To BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0707:EE_|BJSPR01MB0755:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c5c4881-bbaa-4c33-750c-08deb6477251
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|56012099003|18002099003|38350700014|921020|5023799004;
X-Microsoft-Antispam-Message-Info:
	sKXod2jtZGOhO50GKkoQJQRAvlQVLdC9dSuNIzImCoHWiixUkJEo71RFNAm5wakQYaDBe1SAIBh5Y1IfIG5pil55WjPGikJSXfb4WSbnt2GTWyvEGLbtbyMS3bCq3BQKC2XmKoiL22hYpVuScFlw08ssAZX4Wa7kwU6YNIICqpoFtC4IhLruLHW40hZR5ooo6pmkjaVE+f7bbKOT6sxkm71olxTRoJL/dr1w5Af+6q29ra3osyq39vQoh7OBptZHR6J/uDmZ13KkaG1Wz4ZT37KbSrp2aD9o7HfnnTRozZPzn0k+M+J1RMP2+kx9LHUxMz7HErj1svTupXU5vuM+qJn4ZaWFvP4MRFHqp5q/Hmld5C1QbsN4X4CjhbtH7PIRJXbkONR65LUoVnOldxorkQenDODMLTB2P9P0GKn5qqmSI9+UzrZE0w2CKtY5G28zpS7b3NWER9TgjD9LAqijCIEX6z4MtBAc2tiMkwzb8D8ev1Qa62q5GYv+mJQFpWITgjsQTYkiDD0Z5YXr9uDcfCilNsHx0xz9CUHdbCIwrLyVvahlvXh7saqghKQh/OLeZA/31KR5y718iiolUtSPww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(56012099003)(18002099003)(38350700014)(921020)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTVnSVp3bDJVWlJ2TCtTZTNtNE9ZeVBVTG4yT1dUcnB3VC9BbTZWSWxrVnBU?=
 =?utf-8?B?TkRDTTRHSUt5b09BSTlscm9EYzExQ3M4YkNOa1RaWlI4cUUzMkMxc0FCaHdj?=
 =?utf-8?B?d1NBUjA2T3ZYQzlEeDc2TkJOMjltZjlXWExnVG41MFhRbURNSXNlT0IrSVhK?=
 =?utf-8?B?WW9BOUsxSklCQWlqWm1qU1hRdTBEOXYrQkFSS3I4UUx0d1hLbmU0NjhJTTFB?=
 =?utf-8?B?RE1SMHFkYnFoVzB5YXJ4ay80S0h2MjNUT2FBZFZIYVhWUmlxQ0NDT2hXMlRV?=
 =?utf-8?B?RXlIQThWeWpJckpxTU1XdGJMV3A1M2pBOU1LQjlUWFBQanI5a0VZZnk3UEtD?=
 =?utf-8?B?aWlyMnFQeWd1L1NMUHhpTjJSUmNpa0ZYVEswUnFKQzQ0aEJrRnB3d0RYMFZr?=
 =?utf-8?B?UTVFbG16WnhzRWxuZmZrSWh6b05BZ056QnVMNkpZclYyb2VtVzZMVG5qQkhB?=
 =?utf-8?B?VFpGWjExcGg0YlIzYzcwMk1OVXdteDF6bkJZcC9hdk9QL0ZrZUdwMXdNUGVJ?=
 =?utf-8?B?RHczT0hvd0ZMZGtMcXhhN3FidWlPQzlVdUo4M21mMFlBaTBST1N0dkJGV1hZ?=
 =?utf-8?B?Y0poUFF5NFQvNmxESDhVcjhwd2pFS3FHWmIxV01VMlhPRUV4Z2NaZ21adHFh?=
 =?utf-8?B?UlNZZytRaUxDbDBIQTRBYmRHcFJMYzc3WGVWYW5ETE1ETXV1dGJybHdNSzRM?=
 =?utf-8?B?bzd4Z0JEUkd3dkFiM2Nrd0dLQjZGaVQ0U0Z5dnB5Ny9MSEE1WTBZNXBmcFQw?=
 =?utf-8?B?V1JCUlNocHZNejlQWnE4T0tyd2ZoVUVwVFVmWmcyWnI3eGs0OVNWazRpd0lM?=
 =?utf-8?B?bU1hSFc0TlFtNmlydW1WUHd0SEVIS3dQTFZwOWFkWTNHY3NKUitmSWQ1Skgz?=
 =?utf-8?B?SDIxb1NUdk13aEFIeDlKL2wwdDJpZm45Q25ZemVMdjBZc3AvQ2V4REUramNq?=
 =?utf-8?B?aG9xTnF3cG1mbCs1VnhSU25IenZZL1NNb1BTNnJtQURnaWZ5ekJZY0JSaG5x?=
 =?utf-8?B?bGN2TFpVVjViZStPRURTMjIwODY1ZUQxRmo4Riswbm9ENDU2aFEwUCt2cHhq?=
 =?utf-8?B?VUNteWxjdzBOSXQrM0NjTW5iQ1JteFhRUUxES2ZXL3RwQVQraEZOUEF0QUVP?=
 =?utf-8?B?ZzZ4ZDRWNmhrRkJZdkw2aitPYWJoK1JyWkpsbnljaS9YbVdjL1VCOURoRE91?=
 =?utf-8?B?dlVIbVlyN3owMkpJNm80bmEvUEl5ejhhOFJqVloxeXZjQnhSQWc5YjAxK2dh?=
 =?utf-8?B?clN5c2JBUGhiNjJjd3V5eGs5eVduOHZzc3BjdUJUY1p5ZFRUd2hKVHFoZ2ZH?=
 =?utf-8?B?bks0VmVYZmtiVy8rcTJhenVCR1JFUkdPc2FXZjBnU21XL0I2Wk1UY1JKTlIz?=
 =?utf-8?B?OXVLbitnMm5RbHZNV3FlUE5RUjg2TkhFY3VhTk51TlNBUDcyRDhhSC9KSHg2?=
 =?utf-8?B?dVhCd05kSXFNVkJtS0ErRFpWL1BCMHdQbldhbnhFekZJMTAwZThxWjkyT1px?=
 =?utf-8?B?b2tNNUZubkhOTm1kNmRzK2ZROGwwZ0Y3STNKbkszNWptek5yOUpLc0pzOHRW?=
 =?utf-8?B?QmlmTENpN0RsYUwvQ0JNWVBHSFo4a1JDZEEyU2Y4YzdNb1lpUnVZdTlGUjZO?=
 =?utf-8?B?allkdysyOEtGc1JqbkRmNVlLR3o3c3c2cURQc1FuNFIvRllwOE94Mks2R0Vn?=
 =?utf-8?B?UzdDMWhGYzlqaDB2SnVlMTJFa3R6RFVZSWhYOWlDdTZadnhLY2VzeWdhUzR0?=
 =?utf-8?B?U3pTM0xCb05TNDdSUGlqN1V6U1EzK0NmYi9Jektacnd2cldiSHFhU1FYTjMv?=
 =?utf-8?B?S3J2TlFaMHlQL2RYN3NlazZHWFk5SUh0WWx2WVpyOGpZcHVuME1MMmZLNXJy?=
 =?utf-8?B?c01UMTR5bGZybW1XZEcrSExGaDdjMkx3T1Z1NDgwL29aV2ZYWGFyMG9HZG40?=
 =?utf-8?B?bXViZUdRQ0MzRVhURWFPRXJtM2RyL0R4U0o4UWFsV1pYcjhEVWdoZ0Zsekth?=
 =?utf-8?B?R0lIQlZ6VG9IbWF1VU9TWTk3RzdqcWxQUkw1QzVpTFVmKy9DNkJLbXFmdHEx?=
 =?utf-8?B?SDc2N1dPb0xlcVIzYWp6NFcrUndCWE45ZDZTRTlvUnEyUjBNeHh6VENBcUVE?=
 =?utf-8?B?L3VVSzc1MTFJMFBHTjBHeCthNGNPUktsVW9UQlpYV1RvbGJDUzNuOVpmZE1F?=
 =?utf-8?B?OC9KaENhZHNwdGlZLzNHOXI4Qkd2WWozTTZTMTQ3RWFETkVmZ2NrNUhrZ0Yw?=
 =?utf-8?B?N0NEdE5WRVlPcDZQYnNSVG9MbktETXFEY1ROaS9DbnBvUEVVMjk3YU9XakxZ?=
 =?utf-8?B?WlA0ejcwQ3hsTGJXWHdDdFl5U2dReGoraktTNk1HS0I2WGtDS3BNY3h4bHVw?=
 =?utf-8?Q?WQzBlGTg1FnAQE9Y=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5c4881-bbaa-4c33-750c-08deb6477251
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:11:51.2514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rpoCh4+llJVsIg5yDyN6otvsRMz/IyfhTD/4W1zw9SrDniRwL9SnSGYarg0crh8NJHyO0kVysAzXTbaCUiJ3cbsiiMEAOvqQp55BpoJd9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0755
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
	NEURAL_HAM(-0.00)[-1.000];
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
	TAGGED_FROM(0.00)[bounces-37191-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lecomputing.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 116E658B2EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

- Revised subject lines to match subsystem style guidelines
- No functional changes
- All the comments from reviews has been fixed

Changes since v2:
- Wrap long commit description lines to 72 columns
- Fix code indentation in spi-dw-mmio.c: use tabs + spaces for alignment
- No functional changes

Changes since v3:
- Start a new thread for each revision

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


