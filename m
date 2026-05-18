Return-Path: <linux-gpio+bounces-37007-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MtcBySGCmq62gQAu9opvQ
	(envelope-from <linux-gpio+bounces-37007-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 05:23:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB45565677
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 05:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B935301BCFA
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 03:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE5D3806A3;
	Mon, 18 May 2026 03:23:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2109.outbound.protection.partner.outlook.cn [139.219.146.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61E037FF68;
	Mon, 18 May 2026 03:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779074587; cv=fail; b=RCbTt7Z6GittxFOO3Za50tG5P2LnDJQhzRgbWz1pMXV/4ewAvwL8ChX/8RmIkoH9b2ADiXu2AroIPp5AfO+L9VBnQdSN9jyakTYn9B1wrE01aLAPotPemznLt18K9Mlqewfq2V0MFpRhjcwb/3XBcxm55BStU4reDYqFhOckCxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779074587; c=relaxed/simple;
	bh=CsSPNzYPRowao54yi8YWi5C54bFWFgqWAg6KKFEpELw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MNQcBvspcdqyvgDDNgr0lfoELHsN7ICbS2+SEOKsYqp8w39+cG/A39EFE68VzePUZ4pBkTt31ZObkOYEmvC1ArTzW7x2EHACKQGuZDUth6EZ9oXSARPUqvorSdc2nK0KKf6zVLzWzjH/Nqvx++kJ7xbQU3hcomcn2ebwwi0x5IU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.146.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPLnJYNfbmQlIQ2xmqK1EXCeNHK8cUeXf9C+OihGCNC/v2iJrFDUL7AeSk9QpLr0hN5JK+x4QrOUbnrHU3bwC7VMNS2dMvAnwDhJAnsJFKRBOBcbtVRh3PmTwy/hULwG0j3gwKANanENh/rvpAt5vP/htFVy2R8ecNrNBU9mkckmMqaKLjMImPcJ8/TRQxfb5cV8y25bsuANzyfbPUwPhhZwVTg+7SUII6iHmC84ROkp3+ab17gDt9zpxJLvueSsqA9whM70S8JkJwqEHRp3L4CWeO936t7Fj5BxrCnIwTAqYf93S7EbdMpGWv5IE/TzcI+IgmZp+JacB5zGfEQ7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIdo5vNBMNBAbrYGaFZJWnDdTE3nTZ+rWDCHwH+BWtA=;
 b=hdx3rJcjWemHnYWC+S1++DLTL/4Sb4+FIJ0TC9Nlh0ugDO8iZE5HBsuMv/i2YIa748+mR7RDq//hDzFCJKRPFfMq3r4woTfrKNoEfJ/K57I5AdaD5PwuMaBS5eMhwF22vfarJJBqiTdgkGVX9NQQX18HMyAaimMlATnshdGUbLUHVtU4+mday++AQLZ9/UzGGHJtZec3jYf2lmfCQuKu7eprgnwO8UkCdRTpGNPOBlf+smhGaIFRCbTeWrQimSS5s9QexJqU371mXEY6FnLlGL7LMaklwa9r5yTdZQHxtndnL4XS/T5idFKluYNaQkVI4ctHLg+cEiu+IfCYkT+5mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0548.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:10::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 02:49:47 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.20.9818.023; Mon, 18 May 2026 02:49:47 +0000
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
Subject: [PATCH v3 0/3] arm64: Add LECARC ACPI IDs for DesignWare GPIO, SPI, I2C
Date: Mon, 18 May 2026 10:49:33 +0800
Message-ID: <20260518024937.453714-1-thomas_lin@lecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
References: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SH0PR01CA0002.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::14) To BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0707:EE_|BJSPR01MB0548:EE_
X-MS-Office365-Filtering-Correlation-Id: 50271a74-51f2-40c2-d880-08deb4881faa
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|22082099003|18002099003|56012099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	85yvfTe3umrrcsEvGtcGD7Z6WGArSAFpB59wsO9/toCRr22V3mYmNYt3cP7yWZ8I8hnWfZTeGZMkFUJGTi38k2jT/bZKX2JsZbRvqoeNEyhJOWWGV78JJXN/jZIHvus1G5WrYqTT9BnPUemkxETjZSWmz0ybAli+2GbTWDBt88J49aTvp8mQWxU53DzK7U3oNVbVgIyQObDulU9V9mkyoITSjgGDsWXo5ibIn/OlsyQZbbqoCxsFoeGtw6cHWmJ74v/JrrBlC/GsBJP6/DonGAAFQ3m4uJ7J77kxX/7XbntPH9f4pa7emgmpkQLR8krMIZJRp1C+g21Cv/Qxe60j4LISXWgxxslyktl24q8nUtrTjUgEcG3xhb+yjx+GZJIPQxAZKAqIuocQKHWQ86b7+l8XxZpUGQgtLeNVqXWpJCwJ4nh4O7xAlgViC7FNHa3OeE3qCaEkLyV/IeJGh/yL7ObaclVU0VOPc6Bb/AD+FwEDC2fkiJGUOGQOBv5+dfTY8BqupNZHD86oFX+HrtJPhi13nuCmSkKu8IrybzAmazJudCEIfbLyfarH+cw6aw9ljExEFbVZmb2WQAv+mU8tfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(22082099003)(18002099003)(56012099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1I1UFErUVJiUVBhSnFaQVhZNVZDM0lmdHZJeEgyL1d1dE5zWjEyV3pUUE92?=
 =?utf-8?B?MDJHbVQ3QlIxRFFNbjd5N3NmOTNxMEdMRHYzVjF4Kzc0MWQ1WW9xSHJ2VVk4?=
 =?utf-8?B?ZmpVdHQxMTlsdk9vODlmMndQdXVXTVkwT0cxZXluWXJYbXcwNUNxeWwxMUIv?=
 =?utf-8?B?bmhPYm5pZkVXWkxjNzlMMFgxZ3UvcnBHVkpMYkFhTkR0dDRVU1VGV1pmUWVm?=
 =?utf-8?B?Um5TcUt6YllCN3NZZXg3a1V3OTdidXpyVEQzMXFSMisvTHpzcnhwN1VZaS8y?=
 =?utf-8?B?cVlsbGppZmFvSDVCdFk5a1hqdUR4YUZaL0hnSEk5N3NPbHFFRXJ5L0tLd1N2?=
 =?utf-8?B?ZTNEcTViSjgrYmRjcVB2MTNSakRQb09yN2N5aTMrSisvbndYZ0VtWjM3OWRn?=
 =?utf-8?B?UjhqVmNaamlvQW15dUx6QkpxdGM4dVl6clZoNUdxZ0ZsSmJoNXdHV2dkcXEx?=
 =?utf-8?B?YXNadFRhNWRCbjhWQnFxbHc2bnpsZnluclJpbUJyMDNaUTl3NE1jN0Z0V201?=
 =?utf-8?B?Vnd2NWhWQjQxTHRDVlNWdDZsNlp6dDlrZ1hsRUxWaTBzN2FTb3lLZnVpYzZr?=
 =?utf-8?B?N0VaWGp0S1FWbysvV1Zycy9YczgxTVVsdjA3aEZjdnc0YVRHdEJvQmtLczRs?=
 =?utf-8?B?dnhITGhnN2pPa2xSRTFIRnpXajc2ZytxZ3VjN1RIalB4eWc4a2w5enZBcGhN?=
 =?utf-8?B?bER0VjBCWUQ2OG4wTjRER0hQNFkyNlpQZUxJOXhIS2xueWs3WThqTHdYaS94?=
 =?utf-8?B?L0duZXRpbStSWUIvTmVBTXdDS0lZZkF1VFlTakgvUXdGNmIxbTc1THZJRjVF?=
 =?utf-8?B?K0ZBVEFsOW5ubGxvdnpJTW9ad3lzS1VTZ2ZtdHd1RWZqa2toTnVZR1Bnclk1?=
 =?utf-8?B?NWN6M0M0aU1jOXB4bkplcEIraFZsV0pVTmsxTC9OWXNDaG5KVWs2UTQ0M2J3?=
 =?utf-8?B?YTlheDZQZ1NoOFBXOSt4KzA3cEZ3OXlWUkdFUEFSRHpQeGc1aUFvV2ZiZE81?=
 =?utf-8?B?WHlqamlVVnJzd3ZmMzdDSkppcHRXKytFZ3dpMEpYUmN3eEhsV3F0bTFCR3BM?=
 =?utf-8?B?SmlEL0VvejFiZzlzbmdhVS9MTUZaakZGNzVpWkpTOFJNYWRCUnllTEhXbGZo?=
 =?utf-8?B?eTcvbExxVnBwN2NoeFBFL21NVEIyU2IwZkVFbEV3RFVEek9aNnRkemNORGEz?=
 =?utf-8?B?RDRrSzFYc1lRQ05iTW9FeHlZSDBZa2I0bHFzWEV0Z25rdFljK2oyWGJLUW9D?=
 =?utf-8?B?N0tZTVdmM01CWmFkeGJkOHhab21MWFdjSGtPTENuWTNFdjdGWGhrcjVMSXdE?=
 =?utf-8?B?MGx4TmpRYThOTmhmUlNKUC9HZjM3VnhWQm0zNlQwY2E1NjFqdi83NEhTT1dC?=
 =?utf-8?B?aWRRaG5POC9XdER5amt1c0lheHNaVUErVTVtTG1kUUlSem56aG1RUmVJb0ZW?=
 =?utf-8?B?amgzWlRKa2pvT05tN3QzOTVOSzlxNDhBYmVyM0NCYnlxTUxNZk9WRUJiSjhT?=
 =?utf-8?B?NW03ZmhTV25sQ2RPSXVTZ1FxRHFlQVdmU2FhWG4wanhlR09wZFlrL1hQMXM5?=
 =?utf-8?B?S2pWY2pTTUp1cTNKMjBydk5JVmRrbk54QXVRVVVoNSsxbFRVWTBBaGd3a2tz?=
 =?utf-8?B?bndLRklDSVZTVGdOWWxXTnZMMURXQlhSempDZXFQMDNXbXBjRVF3Vm50M3JX?=
 =?utf-8?B?a0gvNVMwbWhxeTZaNnhFcXFBR0t0NFJ3LzF5RitadDJZMUhWNVhmYjdaQytL?=
 =?utf-8?B?bitMRlE3OFoycUJrUUQrdnl2ZnZxZVVKUWZBNkY2TGRhTEtjbldzaitLcVBF?=
 =?utf-8?B?dUJrdjNXRmxBVFRTMXNIc1dCOWhYSi9zb0YweVdQcnJsdklzbE9LZ3ZaWnFy?=
 =?utf-8?B?TCtNMlFPanMxWHhuKzFpSCtJQ2VVQlFaZjN0eS9jd2ZBM0U5N3hUNVRqSkNi?=
 =?utf-8?B?MFl3dVpvZG9rbmJCNTVwc0RSV3p1T0JKelFhOFRoRXkxMUIzVnJ4RmpOU01X?=
 =?utf-8?B?MDRBaWVuNzNzOUNoMm5ZODh2ZGR6bVBZaStEV01FUkh1VnozVjF5UXdvR2ZF?=
 =?utf-8?B?eUQzVjR4VUNWUkNMcFlMcVZTd2cyQ0xINENCbDJoeGNIbC8zdVNLdDdXTHpj?=
 =?utf-8?B?RUx0Z0FsZ291cVhOL0xhLzNVL3lwdUZpeU1HTGtjUHpMQm9DMGZMZVM4RC9L?=
 =?utf-8?B?SnQzd214V1lMcG9raXBVejlOdGR0akhybzdNbkdyc3ZXbndqZlJNcnE5eFYw?=
 =?utf-8?B?VGNsYlcxVjlQRTZBZU9DSW9kbFpURnU2QUJDazhKVUhvQkczTDlJQU1lYmVq?=
 =?utf-8?B?MW9QOWRoRGY1SllrcTNYOFJRVWcrUm41cnRPR09Fcm1ERGM1QXRJU25jczBm?=
 =?utf-8?Q?bnriAhtBsKazPKaQ=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50271a74-51f2-40c2-d880-08deb4881faa
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 02:49:47.6966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: voabJJhuD+Lo8TG39i0xA5KAinJ6n4BkIreMa0FBex+B3IL6x5eALVeuV6Qx5QZwvjkRq+t7sjNTmgRMFId+vxCl2SRD9jvVl2HWZBn8QNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0548
X-Rspamd-Queue-Id: BAB45565677
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	TAGGED_FROM(0.00)[bounces-37007-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lecomputing.com:mid]
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

- Revised subject lines to match subsystem style guidelines
- No functional changes
- All the comments from reviews has been fixed

Changes since v2:
- Wrap long commit description lines to 72 columns
- Fix code indentation in spi-dw-mmio.c: use tabs + spaces for alignment
- No functional changes

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


