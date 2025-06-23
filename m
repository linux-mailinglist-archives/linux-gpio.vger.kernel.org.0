Return-Path: <linux-gpio+bounces-22022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A553AE4BD2
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 19:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D17C3BAF98
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 17:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839F22BDC0C;
	Mon, 23 Jun 2025 17:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="o1BfcvJf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2092.outbound.protection.outlook.com [40.107.237.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9AA2BD02A;
	Mon, 23 Jun 2025 17:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750699723; cv=fail; b=W4i2bBE0uEeC9Wqz6V0UpDhemMABrBBBs/4/eqgBKUk+ayfgnhyIA+agw4eHtuE+uGmk6esXe4GtKEz0wpZzSv90w9ozvXomByj1MJpyqffH8UxtvrIphb/dmlaZlLLf9U10dZsOAchRGNdLn9KLoEREQU18WabjcX6ofXVok3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750699723; c=relaxed/simple;
	bh=k2bg1Idbmpr7InDb5GGMHb0LUKQqJAT8NkVZyKNijmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HAmqIa7jvz7gyNi2rEE1K8zm9OZ53qHERvSyw/f7c6f3UQM0Y9+pmHSmB7V3Wgps+WpoNdMDdWl9zgQb3aFyhXdlssQF7eRjjuRCv4m2qw4xv8K4Gyk7g9dwQrcmIkJ3nl31vfrPuUPUVJEqCXBnfupx9yKz6XVBZCY076/164Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=o1BfcvJf; arc=fail smtp.client-ip=40.107.237.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+kBqRJGeCFLnvAjbo44v7rxMZARo65KsFxKTgHirF+MSPqmPxrEEUu8kfpTwRZw6NbpRjW+3XP0BsbKEO+HcG5YW3bkqd+UQzG6Ybjf1YCqPqAvjvO9/6vbZ06SChXqOjQLxs/K8kZLwr3gDB1vZRFnKXHjMRIntlY/4UUgk7SgOTHKN5mc20Aj9zpcFlqlnT/ftSkXFUmAXgmaqXDXzNiYBhvxCjAFtQYgx150xDCtwLCYxlfngTdvhsDCTHhB+zg8CtwivfmYgqHTtxQ1zAKHZfgtcPss2xXU7IWbLitv+bWxnTaTNjqcGaF8Iuyb8yj7llgelUnsmH1luh72rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgF8+PR+/dKwRsE/gY6SrakSd+MSYhaWICfnygds71k=;
 b=OXBW7oukdrdhK86JCydZkKJFs6Y69cetMMD09fgVbcBTtZ19K96uHQRUI8A59H+yrMzUGHuXuHDQvq/E39Ym9LXi767Rkr+vTZHPxQlPWDsa71Da/8GjojX/606IJbct88aEeMM6nJpVDNzqE5uB3EYPWzGYK4DN8qXEcAl6vgcSCgXXmx7H8uLWMzzObPPtCTOCAc2BY4Kj1Fh9eHii4LYeSQdi6QKfCPlVzkPkxYJ/XyMUCb0rlv3bAorU8aoIfD65UZI4cCRGc9qiXX+vdL/SzMxQ9KTiRm/X4M5EUDPeWerV6wKXLawW2jBYPh18RQmT1NJT5+TjYZCUyYTkWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgF8+PR+/dKwRsE/gY6SrakSd+MSYhaWICfnygds71k=;
 b=o1BfcvJfzy0UJ1hnHi6kLrT3BD2m3ybFtp2Vby0vgn0P0GRhBHq3Wq5+X6yQPq0+Vp2CngHOZxAl8k/aa7h5mZfgfKPXRA0F34vq4D6TXnzLKoKgQwzMux1An8esh69DZcxhss8l4Ga0Sc6MxNWHbDQ+8mUIiEAcCyNdrow4dus0gcH7cTSXgWQdK+ul53gS9dBUUlAa/FzgohWBmzHR9WasqXJjC6c8IPOfxklbnmDlxGq5TkRRig6YpXFlS3SXYk5GMDskDGZ3h/PXJaJ4zAjM6Q1okSwq1mzn5Pd1qyMQ9hm+4F0rYlMm7BMrVAEkPWhoNqJOwKuCi4FK4sBSBw==
Received: from BN9PR03CA0109.namprd03.prod.outlook.com (2603:10b6:408:fd::24)
 by MW5PR18MB5119.namprd18.prod.outlook.com (2603:10b6:303:1cc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 17:28:33 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::43) by BN9PR03CA0109.outlook.office365.com
 (2603:10b6:408:fd::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Mon,
 23 Jun 2025 17:28:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 17:28:30 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Mon, 23 Jun 2025 10:28:12 -0700
Subject: [PATCH v3 1/7] dt-bindings: vendor-prefixes: Add Axiado
 Corporation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-1-b3e66a7491f5@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=831; i=hshah@axiado.com;
 h=from:subject:message-id; bh=k2bg1Idbmpr7InDb5GGMHb0LUKQqJAT8NkVZyKNijmk=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoWY65g6oXMXdZId9x/V+W88B4j3D2lBrz5dbv9
 +/Lf+ExTfCJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaFmOuQAKCRDxWHMRoTLV
 +zYmDACByVSnwRP1LAomhFm6oGzcK0YNmHf0kDJbGpdUSzCUq7cYDsQMAArJDk63QDtyTpq04aC
 K1AqxEzxCdzcIrTWzykImmBcY6I/0DPcLuxKLMeJg2ZnogEcnNpv4mUD5gtXhLL/rJ4ZTapY9kT
 2W03zcHo6gkYfEg8uRwK5lEsIZhylZiEqeMwLjHSeqnQQQvhSxJhEp7nXuvrQW0B4kCHcIZ2aK8
 zbNPhHyzryB+v7j1TwaQm0IpyAL0lE7rBzjjrQkhucF2SW8v+1/Wj0E4cmMShl+lSvPchOWVmTq
 cAsaPKU7IcRfJbrefbr1FUNT0UTCAl6N+n1MXgVRc137Yctt5ebmxU/Pg7DiG9zq7VEZB9LPU4w
 9NY7+tf7sUnkCDBy6ExcGzB/LZ2gfa+bKm6ZnFGCd3usZaynmBUbpvubyub7fmI3ENRBm7dCCFp
 wAz2tBnMJKa1+Nf9bV/O7L5gC2stuK8XxpCeVvhfs5kG3SSDtDJvSQzqjRA9TH5Pjo+2c=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|MW5PR18MB5119:EE_
X-MS-Office365-Filtering-Correlation-Id: 40242b69-7b99-4414-d41d-08ddb27b5fe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkxoK0U4b3Rad0dJcHloaExQa1pTUlJycy80UjVxNTQ4ZWFpdGtybzk4Q0d5?=
 =?utf-8?B?bGxmdG9VWGYrdXIzdmx4a2NzYldSTjRrTGxBaVhnaDE2VWdLdW9zL3dKY1dy?=
 =?utf-8?B?d0dkSHUwSW9iZ0xHME1IemRuYmNrTTd2MS81TEtTeXN3dnNpa2h1RlUwYUhi?=
 =?utf-8?B?NERWMlZtdWM5S09kOTd4blpOMS84S1dnZ28wMlpZM2d0eWROYzVnRkI1alNt?=
 =?utf-8?B?MGhpa3BmN0FhV0wzTmZsOG5xMExmQVhObktJYTliaXJOaU9jRU9nanpZS0NN?=
 =?utf-8?B?MUR2T2ZUVVhrZWdsZTh4TlFPUkZXQUhCZVJMVzRMRVFIa1g2d3ZKWFZ0eDBW?=
 =?utf-8?B?cTA1bDNRS3B4RzVCcXZ0ZS9EVjJvN3hVZmkyeUZ3NU1PbHQzOVpacS9xM3N2?=
 =?utf-8?B?NmcrUE5jY1Y5SkMrVFNtQ0g2c055OTl6SDJMRmtLWlFzTVBNc2J4cU5aRitJ?=
 =?utf-8?B?YW82RTVZamZSYkNHR1FHaVlQdTZzVFFMWER3R2lyekF2T3lpS0hrVVRRRVNT?=
 =?utf-8?B?b3dLZEV3UjZ6dXR5WUcrdm9GR29ZYzA3bkxSMUk0VWlmU0JUWXIyUER3V2t0?=
 =?utf-8?B?S0NYb3FlNmhBU29XeXVoQy9Jc1JkZHFpbU40THpmYVZ3YUhVSWd5L0FtSkZI?=
 =?utf-8?B?bUJ4aFB4b0ljU2gybHBBUGhFNE9BbG9LSkY2NHRpTmRSdzFLelZETEV5TVRu?=
 =?utf-8?B?OUNDL2FmS0Y0Ym1hcjhmQ092QTJNYUhad1ZIVS95dnB5T2tLYW9yU3NtRnVm?=
 =?utf-8?B?eWtmZHdJNmpsbzZMbTdvcm4yYWk0SmxSTlR1MEQzdjVUUGxnYmFpRzNzeDl4?=
 =?utf-8?B?N1dvV01OYUl3Z2VSQTlzaU9KUnFubjVrVE4rT0dvMFV0SVhoTm1NVmFVNzRw?=
 =?utf-8?B?Sjljem1hWitzbVZtQmdSQUdMS09td0lUcHBRYUtWRVFOZDNRWVpqbzk0TDly?=
 =?utf-8?B?ZlcrL1FycTBRSVJMV1pDZ3g5eHZ3eVJoWWFITFZzc0l3NkJEZUZ3UWp1V1B2?=
 =?utf-8?B?RVIzQXVKbEtrSkFmaDdtckJBMCswOEc1cDRJTzdxRXV1MkoyczVHRzZZaFZX?=
 =?utf-8?B?eTlHa1B2UVRNVjluZVI1S1RUWWRhQmRSNmN6OFJXU3Q0d2NkYWgyOVFSMFkr?=
 =?utf-8?B?NC9tL1RaZzM1UTFPaWpNMlMvYmVZcEhoZk1BdnZiN0N1eWtIcmlUTlpoWGtq?=
 =?utf-8?B?OE9yYnRyNE9FWGh0dmJFcUR2Unh3UzdrVktqbUdrWVpKL1hidmYvSlFQZkZE?=
 =?utf-8?B?cTN2RkdYeGdKSFNKOE1LNVJ0VDdMczRNZDBhZnJuc1gyVWk4c1VZVVlGUzFq?=
 =?utf-8?B?Q0FxYmR1WUtCZC8wQUJwWC9vR3pYYktTcG40cy9tTjExNUVyOWtManVLMGg3?=
 =?utf-8?B?dEhydnh5ZFZ3dWhLN0xSOExlUHNWMG1nSjlVclBiNTkvWXl2bytPS2JndXAy?=
 =?utf-8?B?T1k1YWY1REg1bG5XNWJQNGl2eUM1UkVHRFNSMklJcTFSZUJIZTdTWjJEeldl?=
 =?utf-8?B?aGhMUUVQTVJUdjJsRnlzUjZLQllSOXNUb1hieklUS0JrWlBldm10SU9VMTln?=
 =?utf-8?B?RFFzYWp1NjdscXRiMVNEM0FheGRxcmVuUHhjbU1Yd29qa3o0QzN4WmJNbWti?=
 =?utf-8?B?N01EV0tsMDFFdFV6eVAzbjhnb0xjTFhmV0xiMjVNRUNvQWMzZGxPNUcrb05Y?=
 =?utf-8?B?dm1zTWNiT1ptUERkWFUwZ3NrU3RNRXhaQ1V4V0ZOMHBQbHcvUE5ZQnYrWVZp?=
 =?utf-8?B?MzkvTU9MRkt1MzJWNEk3YVFKZmFFbWR0K1lUbG1xS0wydlhvbjV3enV5emtk?=
 =?utf-8?B?ai9wc1MxejFyckxlMUJVUGR3WFFZcW5lSWVGbnZhNC9ibEREMGl6YktJMDYx?=
 =?utf-8?B?YjJaRDYxQk9pcUZRVm1waFBjNUx5cnZJVHRoY3RlY3JoR3BaSjBvVGttNHI5?=
 =?utf-8?B?ZFU4bUZHZDMxRXhSYjU0S08yZWdibWZ1ZTMyRWtXR3hZR0VlQnZkaUdHb0M2?=
 =?utf-8?B?SllWa1BPYXJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 17:28:30.4089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40242b69-7b99-4414-d41d-08ddb27b5fe3
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR18MB5119

Link: https://axiado.com
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..5ada930c79e3b32ff1bf194ee66bb4bdb08d539e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -200,6 +200,8 @@ patternProperties:
     description: Shanghai Awinic Technology Co., Ltd.
   "^axentia,.*":
     description: Axentia Technologies AB
+  "^axiado,.*":
+    description: Axiado Corporation
   "^axis,.*":
     description: Axis Communications AB
   "^azoteq,.*":

-- 
2.25.1


