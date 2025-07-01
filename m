Return-Path: <linux-gpio+bounces-22537-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60993AF04C2
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 22:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75E2C1C076D2
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 20:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2735F2EE974;
	Tue,  1 Jul 2025 20:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="VofvPvTi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2090.outbound.protection.outlook.com [40.107.244.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D262853FD;
	Tue,  1 Jul 2025 20:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401669; cv=fail; b=I3sBUIYQqULthRPlGraOV6GPBw1eXocladKsRjWlnB5h5d0j89WeJ97PSCa9Dks4OAr4bb3fEhAQRWRRvKMPtjurwEXeI4kfu87/BQKr0IuDNY98gZmI4XfFimeQEzRfQSpWcYdf5qWPQnmYz+bFKM1EtRCRaEBH/2m3S03cesI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401669; c=relaxed/simple;
	bh=dU3R0Cq2JeKz3cpUIN1kKX9cfR4a4KivymrSCRmERpM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c6qPv+E/aVZXNlL2Uk/iNrgGkzoSG8V5TL45tyhtVd9hur0k5Z+t3FloaQZEGE7W0JO+Dd7g5E2SqGw+5Lec0Yzc7wW7gL95otvZgqK7BiznMZiFYwxr8HlSRRvErG5MyTJt36J2TYN+1K5Jt0Cp7LP9y0VjL4oS7G6S2/cBdmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=VofvPvTi; arc=fail smtp.client-ip=40.107.244.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSTENgWpXz3K6nylTkqOvn0r5O0MxBMNvM92HzHNhOJj9I2+NtJcDi+0a70Q7nMLhHgEYP1endv5H7/tPQD2dn688nKWflDEncx2/e3yGFXonBe+SMyXtLsH9Yc27L7OI3DZSOG8jQnjcYFqmGIP86puWlk34cM5U1hxqsPNJzzL0IGe5zDpSejJAPaAUx7G0gNUXB2HLz3pKd5p3I7sPHJL0MFVdv6C9ZpAPcWn0ng6WmHidHyo1gn5bZgKSUmtAkRd4pVFwyQ31WUOoV+fuOdRcSrtmI9mFp8qFM2YJgzyrcqEMjOL514F6vuceK6PCkU0LZbjWjK/0PtYBkcWPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+fqKCrIaLEtcafY7E9gHwdoKQ+TalKDweEvlSk/VEw=;
 b=xvlur6R6Eb1XsxkploJyLoI5CA5WX3JJhoyLN53/3+QFMyipPBNI1SxSnteHGzBebJfSYALekQ+zamEfdEb01f2VogwNpMrr/o1wfYCd3ZOejMJo74KIkVn5+YAvNiCb+vs1eQoe4OWwngysNG0EGp6T+IcQKWZIfPKETEhIOV9wF+1rwq8VXreGTBWxSYGqQHQCzQVGriD4iW8LdiNzdH/kW8o3YuqIMSmr/PpnbG5ttblxueptIb9wI9d5eExh8nEi9hY6yqUyd0i4uHFGuv186xuI185auBpWHNjQAWVwFRkFSqRMlX8vt6s8aqrsusGNCZ8vrZaQg2ZdiquohQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+fqKCrIaLEtcafY7E9gHwdoKQ+TalKDweEvlSk/VEw=;
 b=VofvPvTiTcmf5KbDzGTSQ5BgyAIK0DSz+X9jftSV3K7GlqFnIKNSUsPZjglI9CsHXmaqDDkXAZOvFBafuGt/PxGyMJb52aK3FVyClz3HdHwmX44fkxHJrnKvvOLyswwoS/TC1VjvZa9s4HFmOTTJe12UFK75fhSLCWIPuoINOQNPnao7KdDSii4zsWmejFAdX8XhJL1k1Y1UvwOIKkavYYUc3ZgXWLBJ+TdoLTsg/mwMPftbmR+7w2vJO7TV/hRMsQLP92p+FPsPj5nzF0S/4n9t4Rx18OXuXDB1jSX/7jJ+i4y4H1Wy1d2+6zaI4fs19s06/EwkpppJroQqWPWVjA==
Received: from DM6PR14CA0048.namprd14.prod.outlook.com (2603:10b6:5:18f::25)
 by PH0PR18MB4638.namprd18.prod.outlook.com (2603:10b6:510:c5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 20:27:44 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:18f:cafe::91) by DM6PR14CA0048.outlook.office365.com
 (2603:10b6:5:18f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 20:27:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 20:27:43 +0000
From: Harshit Shah <hshah@axiado.com>
Subject: [PATCH v4 00/10] Axiado AX3000 SoC and Evaluation Board Support
Date: Tue, 01 Jul 2025 13:27:24 -0700
Message-Id: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK1EZGgC/53NSwrCMBSF4a2UjL2SV9PqyH2Ig5uHNqBNSWpQp
 Hs31YniqI7CCdzvf5DkoneJbKsHiS775ENfhlxVxHTYnxx4WzbhlNdUMQl482hDeQSlFFIwgL0
 Fl/F8xbEcgw4YLaTrMIQ4AtOt0hI3FtGQgg7RHf3tFdwfyu58GkO8v/qZzb9/pzIDCoI3qIWUh
 im7ewNrEy5kbmX+6deLfT77ktWUW9Eq1v744sPnYrEviq+FUwobuWHH+sufpukJ+Y1+Bq0BAAA
 =
X-Change-ID: 20250614-axiado-ax3000-soc-and-evaluation-board-support-1b86b4a9daac
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 linux-serial@vger.kernel.org, linux-i3c@lists.infradead.org, 
 Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5283; i=hshah@axiado.com;
 h=from:subject:message-id; bh=dU3R0Cq2JeKz3cpUIN1kKX9cfR4a4KivymrSCRmERpM=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZES8TCG4FfZX0vTc5vwBazx6UbC3RC020MujV
 phYfQK+kduJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGREvAAKCRDxWHMRoTLV
 +wWmC/0UIIlAR21yu5gGPw2vEofr0Te3/lmwdJEBhGkA8wMxuPLHgLAg7HpE4f8MwGbdI9s/OTZ
 cN660DKuM7bA61NaAZAI8M8naOgfkggxo6ZIMMAgYQu6YiT1uJ1K+Q/aMH8t6gvPYKF3ilzBNhE
 evQ1FFjAfRGG0vZRXB+UMy6/lbO+eaJGetcZ7MI3PWQBT3spOEtPob2PL5J/bOF9vUt0AwXb51a
 V66Ncxu6j4np3WVSsWhM95rpVVXFKj//HYw9yFpNdMZo3jEiU/M3TrfmvkQaPRhunyMK+bQe23n
 lTzs6V6TaTt9PLMDj7fLA/Ctxzok/RzQ0gX3cQymKpfaQAplRpVJcmXOAmCyNPl3xN28WVoE8mW
 0gVTFOl/FJmLNzIG/QDtvzGsj98HzmqdtYGeKF9EIZDvNd42Uqz+BC935FbquUIIwFjweln5gTw
 4UFPaaQ2E/Qyrk8VBlpiO5dyg9M7dQfebG8s1iyhIzergALS4I+viI0McelfvNLqY7tIU=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|PH0PR18MB4638:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7c0aab-df2f-4023-f1c3-08ddb8ddbc4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUs1L3kxYWNCd3NFdEhVQlRqTzQ3ZldTcUR4OFA1SGl1VU9iUGxHWnNYMEVl?=
 =?utf-8?B?SXVmSm10cTZxMG56LzdtMDhTUGVmZ0d1RlY3SHB3cExZSUJLRUJ0dlZpV1lW?=
 =?utf-8?B?MVpqQys0a2QrR3U4RWZEblJ1Z2x6QWxYaXEvZjdzVDVKOXdmU0U3Rmx5R1FH?=
 =?utf-8?B?cWJwalNkaE9PWllLNWxhWXZmZnlEd2ZpQUVwQTBWM25KN1oyVnBxQ0pucWRL?=
 =?utf-8?B?enJieFMxcFg0d09UNVhYN2R1SjhVcEVsbVFyUjBSVDVrSUQ5VSsxZGhqNHRF?=
 =?utf-8?B?NS80Yi9UTHR3bFB5amI5TEV2TjNVUExrdmoxbmFhd1hLODdvY2dnaVhVR3Vv?=
 =?utf-8?B?RzNTZkdTSEFzcHFYTlJuOUhNZTUwbkVaYm91RnVkNkJHMklkRlFtSDJZejN3?=
 =?utf-8?B?TFpWeGErOHc1Z09nQ1FPc2Z1QVkvZ1M4MDl3NnpBeFBwcytPNVJ0MmJ2b2xE?=
 =?utf-8?B?czBJZjBKLy96WUxEeHBHbFlHdWl4VURnTkFvRVZQY1VFbDQvR1pORHdIT0NK?=
 =?utf-8?B?M05rT1F2NGM3ekJsTFYxeWs5cmtXMmRBQTdNbDIvaDgxditMTFNQdnNPb0Nl?=
 =?utf-8?B?aFJISWxKSkc4VytJK2MyNUk1N3JOZGFRejNyRXJJWENpN2QzRi8xZ200b3Uy?=
 =?utf-8?B?dThmeXNkK1BuTHRZVkU5YVVjWXN2cHpqS0VGNys2U3ZFZS91UjdqWjlrTzlE?=
 =?utf-8?B?dThXcVJKSlV3anNrVE8rcC9qdXpyWjJpWEhMOFpLdU44ZERWSmlvOTA1Wi90?=
 =?utf-8?B?UnFkSHZlTTJ4NzFUNHFuSjB5eFZDYThNMFdZalR4ZTlWRHk1OGJEaE11LzNR?=
 =?utf-8?B?OUcxMnJkUkFBRldURzJENm55YUZGbDFEUmMrdzhoNWlTc0haTWxmb0JjSmlC?=
 =?utf-8?B?R3oyQVIrK1lrQVNhdSszR2RWeWhnWGwrc1NNMm9yYlRCZ3lCNm41TFVkUWRF?=
 =?utf-8?B?Ym84by9HMzFPTElGbVFGK0o5QStHcW1BRnI5RU9kb3M5NWZEMk5jMmlxUmFy?=
 =?utf-8?B?UWFWaTArVENxK1MyQlptUFhGVFc4NHc3QVNONGFSUkQ3MGpZYzJKMnZzMUpF?=
 =?utf-8?B?Vk5ZanBMWnIwZjAzUkhiVmNRNWYvS1cxQWt1T1pJVkpOS3l5ZWIyaG9TS2lw?=
 =?utf-8?B?Z1c3NzBVOXlIcmxLZTlQZkRuMmV6ZzdxRVBWdUdVRE9INkt6NUFHQmwzRDk1?=
 =?utf-8?B?eVoxTVlUZ3kxa2tOaFNPVFVrMGFpQlhjZnNGcEZYenowTjRwVXlqRE1jYnp4?=
 =?utf-8?B?L3U3Mmw4UVJuVVlJZXF1NURXaDB0bHAydzdKSmt2dDlYT3luU29tNjJrUWFp?=
 =?utf-8?B?OGNCOFh4cU5Jbm9haGk4eGJyUkpUSzhBUlBJSkJPeTZjWUNGMlJmMVp3Vnkx?=
 =?utf-8?B?R0xJT3NjaW9kVzBHbzBNanpwV0pLMnoycllrd1VLZm1sMVQweUtuc0czZlJ3?=
 =?utf-8?B?NUMrU21KbmxyMWFzdmNodmprVloxSllJR0JteERYek5PRjZFU2VXbURoWUxN?=
 =?utf-8?B?cURITU42bXJNSUFmYUduSVUwMk5NY0xpVllkM0tGd0pGNzdCeGFhZGVocTFw?=
 =?utf-8?B?UGVzRU5ZNE1teGJqb2I5RTJKdXRtNXRzbDgrcVpvS1FtTFZRZnYwOUxKVXBx?=
 =?utf-8?B?QStha0FDVTBEYVE3OTBKWkdYUjdZaXhpaDdaOERwcjRzU3RsOU9EM3h3QlRO?=
 =?utf-8?B?VFNCK29kb3RZV0tvYkFFSDR6d0hWR1RmS0R5YUltSnJDbVZKbVVKUUhGaTFi?=
 =?utf-8?B?WDJFZ3NYaHROUHYvYjdxeUhkcUZVZzlPWFVtQkhxTlBta0R4Q1F2em1vb3RS?=
 =?utf-8?B?L2dQT2ptQ2p5Q0IyU0wzN2pZUUN2QkRad0p0N25OelNXeWE3Zko1TjdnKzJ6?=
 =?utf-8?B?RjZ4ekxBelNsZUt4SUJsVWlKMWlYSkljV01nMkd5RS9kc2xwZWxXZmpKd0ll?=
 =?utf-8?B?Ukc0TXF1MlV3a000NU9RY1J0MGdsakFQUzVYdy9YWGVjNGNWQXB0bjNVNU1D?=
 =?utf-8?B?NEFjUVVOcE93VGlNVndvR1prQjhld1R6bVJwNG1zaWlqRjd1bWFrOWpNblBI?=
 =?utf-8?B?bEVVcTB6ejJkUUJzUG9IRlZxS0RuamEvWUFJZz09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 20:27:43.0414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7c0aab-df2f-4023-f1c3-08ddb8ddbc4d
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB4638

This patch series adds initial support for the Axiado AX3000 SoC and its
evaluation board.

The AX3000 is a multi-core system-on-chip featuring four ARM Cortex-A53
cores, secure vault, hardware firewall, and AI acceleration engines. This
initial support enables basic bring-up of the SoC and evaluation platform
with CPU, timer, UART, and I3C functionality.

The series begins by adding the "axiado" vendor prefix and compatible
strings for the SoC and board. It then introduces the device tree files
and minimal ARCH_AXIADO platform support in arm64.

Patch breakdown:
  - Patch 1 add the vendor prefix entry
  - Patch 2 document the SoC and board bindings
  - Patch 3 convert cdns,gpio.txt to gpio-cdns.yaml
  - Patch 4 add binding for ax3000 gpio controller
  - Patch 5 add binding for ax3000 uart controller
  - Patch 6 add binding for ax3000 i3c controller
  - Patch 7 add Axiado SoC family
  - Patch 8 add device tree for the ax3000 & ax3000-evk
  - Patch 9 add ARCH_AXIADO in defconfig
  - Patch 10 update MAINTAINERS file

Note: A few checkpatch.pl warnings appear due to DT binding conversions and
MAINTAINERS update. The binding conversion and includes were kept together in 
patch 3/10 due to their close relationship, but we are happy to split them if 
preferred.

Feedback and suggestions are welcome.

Signed-off-by: Harshit Shah <hshah@axiado.com>

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
To: Arnd Bergmann <arnd@arndb.de>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: soc@lists.linux.dev
Cc: Jan Kotas <jank@cadence.com>

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
Changes in v4:
* patch#1
 - add acked-by Rob
* patch#2
 - add reviewed-by Krzysztof
* patch#3 
 - remove description in "ngpio" (Krzysztof)
 - add reviewed-by Krzysztof
* patch#4 (new)
 - add binding for ax3000 gpio controller
 - backward compatible with original binding
* patch#5 (new)
 - add binding for ax3000 uart controller
 - backward compatible with original binding
* patch#6 (new)
 - add binding for ax3000 i3c controller
 - backward compatible with original binding
* patch#7
 - add reviewed-by Krzysztof
* patch#8
 - update compatibles uart -> axiado,ax3000-uart, i3c -> axiado,ax3000-i3c, gpio -> axiado,ax3000-gpio (Krzysztof)
 - add space between nodes (Krzysztof)
* patch#9-10
 - add reviewed-by Krzysztof
 
- Link to v3: https://lore.kernel.org/r/20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com

Changes in v3:
- patch#3 
 - Update with the original filename (Krzysztof)
 - maitainer and property name updates (Krzysztof)
- patch#4
  - removed defconfig (Krzysztof)
- patch#5 
  - update nodes to alphabetical order, remove redudant nodes (Krzysztof)
  - add fix clock nodes (Krzysztof)
- patch#6 
  - enable ARCH_AXIADO in defconfig (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com

Changes in v2:
- update patch#2 to fix the yamlint,dt_binding_check error
- update patch#6 to update path mentioned by kernel test robot
- Link to v1: https://lore.kernel.org/r/20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com

---
Harshit Shah (10):
      dt-bindings: vendor-prefixes: Add Axiado Corporation
      dt-bindings: arm: axiado: add AX3000 EVK compatible strings
      dt-bindings: gpio: cdns: convert to YAML
      dt-bindings: gpio: cdns: add Axiado AX3000 GPIO variant
      dt-bindings: serial: cdns: add Axiado AX3000 UART controller
      dt-bindings: i3c: cdns: add Axiado AX3000 I3C controller
      arm64: add Axiado SoC family
      arm64: dts: axiado: Add initial support for AX3000 SoC and eval board
      arm64: defconfig: enable the Axiado family
      MAINTAINERS: Add entry for Axiado

 Documentation/devicetree/bindings/arm/axiado.yaml  |  23 +
 .../devicetree/bindings/gpio/cdns,gpio.txt         |  43 --
 .../devicetree/bindings/gpio/cdns,gpio.yaml        |  85 ++++
 .../devicetree/bindings/i3c/cdns,i3c-master.yaml   |   8 +-
 .../devicetree/bindings/serial/cdns,uart.yaml      |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   8 +
 arch/arm64/Kconfig.platforms                       |   6 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/axiado/Makefile                |   2 +
 arch/arm64/boot/dts/axiado/ax3000-evk.dts          |  79 ++++
 arch/arm64/boot/dts/axiado/ax3000.dtsi             | 520 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 13 files changed, 738 insertions(+), 44 deletions(-)
---
base-commit: 8c6bc74c7f8910ed4c969ccec52e98716f98700a
change-id: 20250614-axiado-ax3000-soc-and-evaluation-board-support-1b86b4a9daac

Best regards,
-- 
Harshit Shah <hshah@axiado.com>


