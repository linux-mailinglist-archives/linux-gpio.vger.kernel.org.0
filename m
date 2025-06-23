Return-Path: <linux-gpio+bounces-22026-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C10AE4BE0
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 19:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65A5E189DE69
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 17:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09412C08DD;
	Mon, 23 Jun 2025 17:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="ueedHtoE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2131.outbound.protection.outlook.com [40.107.236.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04D02C08A5;
	Mon, 23 Jun 2025 17:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750699731; cv=fail; b=lAh4CnPd4ZMyKeMyT3DTGzXV5kN9UA6c58Z2KWS6RPHfCp3dp93sluxJeuDp0syausFmmeSvRURID5iqNLvaC5MLySaLAauiJrVTU9a90M0CXK5PL2EHCeWs7UoTtxPTt2kQwqcy/M9VqBKbRtdXBW3pFgMY7Z/2cpmf+3Umbi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750699731; c=relaxed/simple;
	bh=VZNBO2tpnaQiJHYXLC9Vzwt0SiEeDdPJxtAAGdh4crU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U2DioqhRrNmKih3MtbGvV3+uNd3pzhnqvO6QXX3pMdLUzMHdmCwqibtuvhN3qRcHLpV+0ayLApgUnqfLwH6Fm5hfLvC418nFnqhxnBpdgBOWoKKCnqZEyYnNXHJY1BPuc69wMawIc6TryyvP5LhyMdmdOrovbYIq/6wqCzLIKvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=ueedHtoE; arc=fail smtp.client-ip=40.107.236.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpDNTtOkOLivD0quutymyUl4duny1P9fXU/yI1rLPr3S+VTqE+mdq2iRazZJC/Ws+w79b570+8xTMzLeejX9nIlyjlBLduV0QaycqqqpPL8PmCWKd6oH2gWx2CB1wly0lqUNnIILyAtbbt9uiWTaUdNY0/SDjOn69yTd7KoSmA4oeLVSAY7sVglvMkVzyNSsovNRit4cSmMDZ48lhalTwlQMLNMW2Pce7seLpB9sScXb/d0OEWpbENbx7+4EQusHdWvj+1SkyduuJ8PQ17lWU56Z7ItbH+2JAQ90gmVFO4Sq6hFNgXBB91fgYxIH2+ylP/3fWJqYVaEMNLK+/e1Qcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFoA89QVcaYYLnB2RN6cerZ9zp2Bddf4tdx0csqDBII=;
 b=P84ESejkL5sOkiwJCkAkL1yb9vFEPqePdu1uYuHiAPQ9tcaIWZfpN286vcMZ98cd6sAcTjRb85IR07RCCHGCx9MJl9CK3dMRj8JTXt/fb8o/dyseOYb2mZfWqd3tOQGb+MAAIUVPUA2gwH1RjfqK+WN2gYLlTxhPVE7BDDjj0iuRzzh6rSFdl/h91X2PZ/rMQu619DKwlpgY3W1gTGEKrrFt+fwqRmXd33s40AFPZtov5qq3oDibo9c0yxEUXO3/KHILDBBfohJxdRklGWnpouRojjSxehcZhXcdCcQm3jAUVkPkixrjO137IDHFKFvj832DJBRVIyURnSVlYegbRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFoA89QVcaYYLnB2RN6cerZ9zp2Bddf4tdx0csqDBII=;
 b=ueedHtoEB/PRm+mPtaYy0MhGO1c9XGYMp7RRuxQ7tbXTSiWRJ9ORi9BLm6gycCJDU5icgMgr/bAngfurX98msXHygFBajGphXBl4jusv0BoyY+F5qaS0TwF3HfY9+RylmA6L+MXINWMKp9D19SoP79R/p49o8/TPmmj06Nzpg4i12b0YLLbuTKbj3hgczGEloM6WDQ0t8QS6KexXb8SbzTbEQF8zBD1wPhYkAlQeqDFgMu9NkUIintHLmGeXdFG4FGucjx5DhHUjyQWcH7y49Drrib34Ek6XumnFC4AThfNsATSVdzlxPoMw5/SbuOEzI1pxdZNAZSpcDO8RE9nhFw==
Received: from BN9PR03CA0102.namprd03.prod.outlook.com (2603:10b6:408:fd::17)
 by MW5PR18MB5176.namprd18.prod.outlook.com (2603:10b6:303:1ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 17:28:45 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::45) by BN9PR03CA0102.outlook.office365.com
 (2603:10b6:408:fd::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Mon,
 23 Jun 2025 17:28:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 17:28:43 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Mon, 23 Jun 2025 10:28:18 -0700
Subject: [PATCH v3 7/7] MAINTAINERS: Add entry for Axiado
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-7-b3e66a7491f5@axiado.com>
References: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
In-Reply-To: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=845; i=hshah@axiado.com;
 h=from:subject:message-id; bh=VZNBO2tpnaQiJHYXLC9Vzwt0SiEeDdPJxtAAGdh4crU=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoWY68agcMfoF1HR8s42HjPFRWHlx5UPLmAuzIz
 oWrCf7kuBaJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaFmOvAAKCRDxWHMRoTLV
 +y2CDACBHXAot5e2BzYNwzIkzx15/tS2PoB5B7W2CE6CFhkHGZ+Wry0wzRlxfMJ/Aug3OF0oZW5
 djb0YBi/zsld+VnZVCONDd3c2WavmNp3CkVq3k+IqOniAmeag/ST6b/j4WK4eWVAtzPFe2GhyIR
 +6Y81Gb5bpqvGi1JNZw+D1cUJieM/5x+p1XRjjhUhOpQAZIDpInSkfShF/iM9u/wCEl0UJ8qX+O
 b4PMTyxpAzz/hMIgxieEz5VFjYpfK4Si8btF/dUcXuAluywupRK3ArEMLLuNNDTY4RpOGryxAGj
 Ujtqn/tmRJKgJ4b2etJO7wCao0yvgiB7Yg5XpVbuVeBmAZNUV9DZIeEXgd65BrBiEo7pOp4pbcC
 Z1jTNKTi8FJcDkoohYehsljhwGnI2b9wZtZwVB31fco5bb3/WUDH+OhVc152hKkZEhxF/B+OktW
 A0jpYiMEloiHv1OkMdZrAUnJ78FH8wHNaOp8nhrfW3vMm4PVz38wMBkJpy4iOO97Pgo2g=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|MW5PR18MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd5b12c-8abe-4958-0859-08ddb27b67b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVA0Q0diZDJOK0FDd1lYLzVHMDEzRGR4RTBFMEhtY01ISDVMTUlMMzFHZU96?=
 =?utf-8?B?N2VGbmgvWTRpeDVtWHlFUUZhdXZIRmtxVGFwTkIvQWR4QXh0OUxta0ZFYmpP?=
 =?utf-8?B?elZOTWV1aEhBNk9RbjJGd003dnd6aTRUWU1iTnV1OUkzTm42OEROMFUzeDhp?=
 =?utf-8?B?bmVXY3N0RCtYOWZFYmJYNmtZcld2NHp0N2x4V2s0MUVpKzlBc0RzdlROWXBz?=
 =?utf-8?B?MUo2ZmRJWnpvdEZNYVpOVXNvaWl3OUZIM1AwQU0zZ2pBR1dQY3VIOVhJc1Rh?=
 =?utf-8?B?TVpEZ0JEYnpOUjFkWE5xdFk2blMwRHF6VkUvREsrMVhVSzZyWlFHMG1aWUVt?=
 =?utf-8?B?cVpnVk1NampRTWt4RHoza2VQYWVuQVRUem9hYzQxYUpxT3Q4VVgrNE9qd01z?=
 =?utf-8?B?bldMaFVnMktScXNXcitDaklGTmhTY0lWTFFMSjBwcTJnazZxYnV4ajh0SGU1?=
 =?utf-8?B?aldnbVdPTzh6L0s4cGxtazk1MU5LMnVEWVZtbzVtUEJvTXZTa1Q3dkg3V0dJ?=
 =?utf-8?B?ME1KbStMdmJ3c01xMXFkbjl2ZlBpV1JrMXVVYWtWZEdwZ09oRlF0clRwSG5y?=
 =?utf-8?B?QlpYNWVIMG5KTDZxYnNvcFQ0ejZzVmtKTXE1TTF6SjV1eE13UHQ2bVRuc2s2?=
 =?utf-8?B?dFg0RTZjNFpwVzFnTW9OOFFKY3hwLzVndDBpTThRd1dhMU1QZVUxUE5pK3Ur?=
 =?utf-8?B?bFRaUWxYN2pFeldOWFJ3QjV1eG5SUEpXbU9ERllZUzlnak5pQTh5ekpHeFNW?=
 =?utf-8?B?aHpUTVRLaGxQUXhoMlphUzBacUFXUGZtMy9Mcmt2MmQvZGNlMHRlNkFueEQv?=
 =?utf-8?B?d20xQzlTV0pGU0NzekVhZkVSL1lESUpGNUlCK2ZrZmQwdWFhclFMOFc5alF5?=
 =?utf-8?B?S1ZOcjlTcUtqMklWNDM5U2pmK0NyU0Q3clRtc0RValFrVjFEOVRyTHJSUlM4?=
 =?utf-8?B?ckxVaDZicmFUT1l5TGJkZUE2KzlSejR5c3hGUUVrNUYzZDRtUjlDcnRQalZE?=
 =?utf-8?B?cGtVMythUlBrLyt1Z0dZOUxjTU5MQjFLaXhlV1BLREpqL1lUc0FTd01wcXdH?=
 =?utf-8?B?aEpxQXhLcjdpTE1LYk5VejRZVCtHb0FnVEFyRTFpclZHZjlDZzh0M0QzSDFI?=
 =?utf-8?B?LzVSZ3lDR28zazd3QlBEMllXY3JPb2VONDcvNnBtWWxzQVgxRXlBZHcrNEV5?=
 =?utf-8?B?NVNTYTc4czk2ZDRia2JrRExVWG5TT3B5dFJzUHRISWJMV1lqbUtKYUtHTjZr?=
 =?utf-8?B?QlhRbDRpYmhRRzZHM3loSm9keGYrekhVbWV1STdMQ0NGMkc5M3hwTnlNcWpZ?=
 =?utf-8?B?bWJ3Qll1elg3angrQUNBeEtCb281RyttUTJDNVBYNjNxY2ZzVlEwVUo3MHhv?=
 =?utf-8?B?S3hteHRRdWtMZ1RmcFpyT1hFREVTUDBQenRvM005RFpLVlFLWU5Oa25ZL0pD?=
 =?utf-8?B?WDU0WEVzQks5QlV5S1ZEbkMya1dQTm1FbXg0dXBicFEwc3VBNzlCUmI1RTk3?=
 =?utf-8?B?QjZLaHRCSVVqQVZLNFc5Q2grSFovNWhVc3ZvQWlXK1N4bzh3MS9aZjhla3lK?=
 =?utf-8?B?YTNFOVRvcFNSMEt0Ukgxa2wrU0RLazM1Z1ZzUENFVGdhMG1SRFRNTG0vSmw3?=
 =?utf-8?B?NjlFSk5mWU12NnJqVHk4SUNycXBwYk54VUhCUUR0YmpXWU00NVZ1V1VJNjB0?=
 =?utf-8?B?RWZLbFQ5UFRybkxHZUFuWEVqbmIxQk5aNU1OU3ZyTnJZem1JVjRkZENLcktp?=
 =?utf-8?B?VlFFMG45SkZVaW04MXNRdFdCRU5LVjNDZDBJTGI3Z3REWDVJeitLOWltTk92?=
 =?utf-8?B?VXNjazNWYnRjdTZWYWNuNVpqVHRBRmtaRXRBdzMyb0NKbTU4S1FDMnpjd2xV?=
 =?utf-8?B?b1ZUZ3dtZkFJWVh2T1c5RFFteWJpWkhmRDhXNENxeUJIYnExT21LVTI2MzNS?=
 =?utf-8?B?dW1ydE5XQXNaTDh1MGIyd3JMMHoya3ptd21xWWRkeC9oeTdoS2lvSlh6TXNI?=
 =?utf-8?B?dGhydnpqRTZVS0V0TlFZTi9YU0k0dExZaTQ1VENUZ2RRVjVpSTQxNEVDanRS?=
 =?utf-8?Q?A3aY0x?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 17:28:43.5347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd5b12c-8abe-4958-0859-08ddb27b67b6
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR18MB5176

Add entry for Axiado maintainer and related files

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c1d245bf7b84f8a78b811e0c9c5a3edc09edc22..7a04bee308cda1d8079ef61d1c0c68bafa89fa12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2414,6 +2414,14 @@ F:	arch/arm/boot/dts/aspeed/
 F:	arch/arm/mach-aspeed/
 N:	aspeed
 
+ARM/AXIADO ARCHITECTURE
+M:	Harshit Shah <hshah@axiado.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/axiado.yaml
+F:	arch/arm64/boot/dts/axiado/
+N:	axiado
+
 ARM/AXM LSI SOC
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.25.1


