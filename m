Return-Path: <linux-gpio+bounces-8513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7330494485C
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 11:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 185D9B297EF
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 09:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB066176AA4;
	Thu,  1 Aug 2024 09:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SRLbFn+C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61773170A3A;
	Thu,  1 Aug 2024 09:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722504633; cv=fail; b=tEl+tROO4RcE4JN2STDWBFtFO409ejLfQisOH2KA+xKNSmDuNt8adaGQ2Mj0Pwz/HVUf8U/jcTATJQ7jtKyTT2LZKdLSO62nROhyoG5iP34UNPsgfHN4xq1YshTR2WvMTcEDYdGT6bI5eMHJQzohdhX0OixSJU6cA5Zgm1Z8QY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722504633; c=relaxed/simple;
	bh=sH1vofAzthpbTl5kopjD5QBReZcj2zFTMUC9sr+LUM4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qtKiEcBOblI6UVr48o1wAwrXI2zS0A7RojDnBtiOGj4mkuYARgnsT/ioCU4zhdU3LI8inxEEHIUQDCB+x8XymiX5ZvD+zSKU1ySK5T6n/qI/qZGjb6s0L/RzBKBqMQe8+nikaowhOMn9GFXBIp3uj4DOjWr6zkYkKo0EdyvL4KI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SRLbFn+C; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XX+0nMGGYRvISqAHPay+zrAta9EwmE9XNOdhjbRwpxQbGrIIasn9QYDEPdrgVvnq+7OfH8kes35F+ub01pUMPBXwtUJmg8OPHI3KRF5S9SvAG4dymj1mVs36dUT/fM5rbSJyBZj+mQBln+Wh6Pq2Aft2fva5BhfiavGnqbYWex1iDmVBCTcZQYpMO8u4OTLYTFeAb4Li2T3voY6fT2/ulcPve8nkQRojq2vAgMNvhj8nUuxlHLQXvRUpz3HKSHgrZgjC+kmN7f6iGgqHN7m+LEMunl/ZZdjkFxxaVNule6IZ5B9BzlvXmdkKBNr+0DQssX/Q9l/DJXgcIj7ixY+7Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjS0uwQKkFBzGrgQB7/ZV2chTfSTOwMEk3hqEO7cN+E=;
 b=d5liNklE62EZH00NbfDn+qqxinhEdLse5MDcOgjp6eiGJ0GZXy9RVPmKb4RSOjN7AvByu6Dw8iqng3u6JZLabJN6/wmZIqEA2V+ZNO4yPrckT0brmqCqYpy8gr5CvTySNr/M66dyluQ4+tyXEhD4Lgv0oQo4WImU25h2f199yu7XLbVGF1iOguyqxLecL89H3O4VXwl/PtpByXYU8Qfs6lSz34eVk7zTpm9occVNGk3DjbitYGoKr5k6O1hZS7mXKLpHxVLwhKhD9ABxiYEdyef3qaxKDaDKCqxn7Y5fNPvWSleyddJD2PRVejX7Mu+TPfCtCCJdsDbe5+9oW7zGmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjS0uwQKkFBzGrgQB7/ZV2chTfSTOwMEk3hqEO7cN+E=;
 b=SRLbFn+CmGZu/Phhl6XKLoc6J2vzgaTP53dwgWnwayfQJTiXfbvlJ0lUF891E3R2OuzHztDZ7JOGpLfhBC+e9xuUnhs/vsTcCTThIjDiiFEXMS8VDyx7X5+F2N2XX/1/Z/bPVxPRHq/ABy2rcWYk+agQ6B3A7rO1CUkxDy2fgdNky/Y9HXKPTtSYc/C2XhKYTy8VsaRnzLahGesCnEi4Un8z+L6xmcInrV3hLw4lkPyyKuUrwzv6rr7ipaiKA6uSgroH7bqGjFwJloSxW+20emQu4hnyMFdgcHVALalP9mtzpxJ8pnXv27qKFbNLepBs6b4zvtz8+cWsBy4cLcGGEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by DUZPR04MB10039.eurprd04.prod.outlook.com (2603:10a6:10:4d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 09:30:28 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 09:30:28 +0000
From: haibo.chen@nxp.com
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	haibo.chen@nxp.com
Subject: [PATCH v2 0/2] few small change for gpio-vf610
Date: Thu,  1 Aug 2024 17:30:26 +0800
Message-Id: <20240801093028.732338-1-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|DUZPR04MB10039:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fcb952a-862d-42a9-d08f-08dcb20c947a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FLR9pN785bNfT+ARFZBpUXcZN33Ih+e7M5mZa9HhRBOfOEfMRJJU43o/bk5e?=
 =?us-ascii?Q?IKuoVe3ynU4j6nOdtjzF3Ovc68BRd445Uw2ZvEASO6lkiV/x+sEsRY5QPUVQ?=
 =?us-ascii?Q?Z6dkahJZ2sJpKrxGbq5j0+jpqI58FIUqYj7L0PKNMnG/4ifw87An2JO03oJ1?=
 =?us-ascii?Q?5ZTp4DVa0QOd2hwJHA4Uyivwx2DwZ7s86bKK+EW8R8j6sZpL4idVjXo88uXE?=
 =?us-ascii?Q?I3vkOCGan7xWCvuAb+ykFqSqADzdfO/cujFYDJAbu19JU9xDtT6PkxDqF2zl?=
 =?us-ascii?Q?PAFiLWdH4yGq8HDUthJGxR/oFLPjtXlAOgXuAqPhMfTepK7l5is/RagVbhf/?=
 =?us-ascii?Q?U5RDA0lh6f6O7WvnGKCPcY5BgdQWPlwKFueYsFyQ1xxY7dCcMo6SZd49btOC?=
 =?us-ascii?Q?yOZLojm91qgfllVUqFv30UQkEr5s5LrF1yNuTKaIgtvkcTWwNV9l3lRH7OFq?=
 =?us-ascii?Q?OccjRu0WfSWJMXjE8fIC9R/l6dbDDPRScFdEfHeVOHysFPqCYK/3nFaWRFHG?=
 =?us-ascii?Q?anvYtQmWJ3bCBJTcmy+VGygiEgZiuGdiFJl0n0ib8E9HJG9/SU8AVbx8yhOB?=
 =?us-ascii?Q?sbFUe/5QJpGI4asndHhJwYA7r0yBylS6UW1DIw2ERWAP5GCUNxDzJ6C3YZ1q?=
 =?us-ascii?Q?DoByKF3RTD4aHBMDRB6VT0dZElq0KQA+EGm51vE0ctlWKzkht1bFxeBIuXnt?=
 =?us-ascii?Q?wN1lbMhCckEmgVuysMxi7te4OMPmR71Qb8z42dCaFgZ7qvmxCsNt/yv3UKzI?=
 =?us-ascii?Q?PWjHiKqSrAurc5rLwFP2OmIHDOpb54psX3j1GLTLH/Wwux2umKw9/5V4+gDU?=
 =?us-ascii?Q?UkvC2b5pGHqNb5Jh8qhYtUjt2SAQyC2MsROgpBGWyxG5wE1xwDwEMVbwO4jc?=
 =?us-ascii?Q?LHjTEzvO4du5vVzD5y8IztlhX+aV30ZMag0mEv8dXQxwGAWOpfDZ1LaXFAqk?=
 =?us-ascii?Q?al6KYJqik7+L2PgvLA5LjijevCHkPaq0fH8OpQTjgx4uYGEQ6mfQWox2HEVx?=
 =?us-ascii?Q?RMhEUI63OdYLESi+w4x39jK7V0ph5R9M4er1inubGAeX0GDxlXH1r7DXvmXP?=
 =?us-ascii?Q?z8oc+nPPHcm8eoY/gcQjUNOFqMUclH4TOO6OXw0aBGBUc+i5JoNUF/DlgdmR?=
 =?us-ascii?Q?ct50btuGnr79xU+Aqd53xIjvWh85zTTr91uDEeQvH6puf65R1elSEkjR3mdR?=
 =?us-ascii?Q?fwKiT3tq+cDWAR48VHEohw7hvndJCYNC3guAUqTY1PvjboeSZe2lNkT1a5Qk?=
 =?us-ascii?Q?ljvo60MIBxcz10KimMlr0Y9EQb1Vqy7PpRVhGlsEiNFkxWQjmhr9/xY/Ljkn?=
 =?us-ascii?Q?s5UBuJb2q5esLd5nTWtDmb25WKPKWQ5luJleQf9oC2jMVguGZaH/NM4LLeBK?=
 =?us-ascii?Q?zBB9VBtAngAxAJ1KAwr6gL3tZ3zuybAkWP/VTuX7MTGYSJrWRQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?liDAOsr3qgHE8YQo1qlruJiFFHUp1nz2qrkQ/ng7JBpgCmbsXdI8IjXyuUMj?=
 =?us-ascii?Q?xz+99wyR6es1zvPcHY0jczs4pWN8cylP4pJMvEJC1NkGQz8l7kN4z23S0+du?=
 =?us-ascii?Q?2xxpyKfN3z0ZoFn/DBMwI8N+Av4vQ5zIbiFIRrL/xLDueRdr94xJta5krpXG?=
 =?us-ascii?Q?6TkKV5UoW6jUxxxNOvUwQATaDo6X623R6PA8S/nZpKCgYUfmfbpWEjQssA8G?=
 =?us-ascii?Q?CsMn36gHvfIXCQ0gWu/PkuR2W6Xg1fpC9qswgtj8yuHD0ct0FptDrLqWbQUY?=
 =?us-ascii?Q?GshHqCPkfaMwCt4r3mQsruV57p5AeA6GlDLZ7hrQWx3wau/yyzd2LjPLQD4L?=
 =?us-ascii?Q?P3vJJpdii2uZylt5ES4k+0Q1Pbed/ilJKCmXqXsLezy5VCHUmT8NXO+QK8vT?=
 =?us-ascii?Q?+zAKhUhtZb0IHqm6UZGz9HMZBb4oCwzPo+FMBRbIrmIXjBb9XzRlpvWaqwEl?=
 =?us-ascii?Q?v/EGohn5PAbyuo5jHjJhvectVB5nRhXHNvoaJP9935D1EQVkVCEdO24iZFVV?=
 =?us-ascii?Q?op17Jh4vi5hD9F5hcb/nbQVq+3rxyovXUlLWp6WwUynZO4yuq3D11hOw60bf?=
 =?us-ascii?Q?8DNtC8gZ1NY9YAxJgFwX0pGb9RjBaCA8zrTiYy3va5KePmEtUipIZ63orJ3G?=
 =?us-ascii?Q?Dg39fpGhIeNXoeoDnGc6TQulDg7Qq2hNsPHtB2+sHRiDbWtZ+vJUpAiFvM7L?=
 =?us-ascii?Q?LGPS9lgxZdEiH67yfJFk64o1vU2Pxgb1Wz2Q4UH65HdgPWp3hvofo3CFsx7G?=
 =?us-ascii?Q?NtI495L3V7SfY0pLTkKZopU/R4dNc3iKm8UFuAriSXTL1Z5bRENZnLaZPjnS?=
 =?us-ascii?Q?wTF6kbEmnXRpCBjiM7cEuODUp1tBowq+lgnzn2jjUU8rbeQlRMxj2dhmZB8/?=
 =?us-ascii?Q?NvMFbU9dFsTHAdysAasLyygs9Te5KrurTNEsR2GfXqxKdxMPj5rpfElVl/eZ?=
 =?us-ascii?Q?1u/VADiGVAUoXHL+Os1QvVRyGC8F44w+cicbZUDWArhYr0NRNZlN6VUfdyih?=
 =?us-ascii?Q?JdO61frK4sFA0YgbVvjh2YV+hF7r/DmVRt6vBHFylOU8iqKes0udUQC6nl/S?=
 =?us-ascii?Q?o7KvCPdMuDTBE1KffFzotNDgoYfYTQ/mTalFBITeSSbtJD66amfO1tG606nZ?=
 =?us-ascii?Q?P0dCHaYXiVBPgmdHiJvbJ3AJRR37/SzbfBq7jzfwFVz6jaM5rxxXK/dSf8Cs?=
 =?us-ascii?Q?yDfkYAc3c5Mw7Ep8vW9x7upRg5j4r7VCKkwa3E0R70sepHjarqhKmhtj4lcO?=
 =?us-ascii?Q?OBsRqLqUl8uL4gxcP7ftR8WzICpeLUVjmSdZBsLnofOYIC03gRLKc1CdRPrb?=
 =?us-ascii?Q?55XkFS3BFEbWtb2C6Od/mntUEkN1hZaxPJh/LA4YzzuiH841x/SNd/fJmvoW?=
 =?us-ascii?Q?gVQUYXg1NUu+giha38XCTVmgUhvuPXa+2rz547LkZPdgTluqxZSIeKs3L0/H?=
 =?us-ascii?Q?ll6KEBdwp9vPWGNiYKezOfgaBcwWCLhH2CANZz7VMZYsQ13Yjdk8yIgzelBq?=
 =?us-ascii?Q?/J+OnOrRy5oQ+2iSVWAdaksi7w877aNega0+3ueYLvG/wEfs/uBnEetGPpXX?=
 =?us-ascii?Q?d0g3p+22ARHt/RHNu1SHRadktA0XyPmDPP9A+ykT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fcb952a-862d-42a9-d08f-08dcb20c947a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:30:28.3506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hoiv8JfreBi3ZAEYEOCQt5v/gHXHlcwcPri/KgThKIBjpC/x4fnvo9T4fd8QcNzm5SXx7MASuUDniPehTdikQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10039

From: Haibo Chen <haibo.chen@nxp.com>

V2:
-add PATCH 1 to use u32 instead of unsigned long, to handle 32 pins
-only one difference from V1, use u32 mask instead unsigned long. 

Haibo Chen (2):
  gpio: gpio-vf610: use u32 mask to handle 32 number gpios
  gpio: vf610: add get_direction() support

 drivers/gpio/gpio-vf610.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

-- 
2.34.1


