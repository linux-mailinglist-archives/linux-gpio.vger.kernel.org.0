Return-Path: <linux-gpio+bounces-22540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17341AF04CC
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 22:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D8CE1C07A52
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 20:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDF82EF9A6;
	Tue,  1 Jul 2025 20:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="hAT5RjbZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2099.outbound.protection.outlook.com [40.107.93.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E192EF2B5;
	Tue,  1 Jul 2025 20:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401675; cv=fail; b=fKAknl0T2TgLZU49gAB8++D6aNX3B1o0u60UA22Ia0jvn1NqM774IyVqnzDBaM5IakPDlmmDH9FiZ9aJCQy3zKWo6TOqS0a9ZJUQqTbz5yRmydxH9whb2rTXwGW/U3XB4OwtBIKq5MlScce0eWcQwYhiNbTwz6Kpsu3BfFsH75s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401675; c=relaxed/simple;
	bh=IjNBX8Z8FuIWhDqWI8fnbI+l0zLnHqnW4aN9UfKpX58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVXgELdu0NryWl9MQZRDQovei8oC/VEwOe0S3aP66AXEYfCaCRLr1bNsnqJrNdT4Xb2k/80ZFULIbTMQCmjYuJjGSV1eHzr6Rzd9ZLX0Q+rl6zA341qlrP45kQyty+KpF57R/ecWj64FyFza2fvJUWR4CXOWDa5PrpCFdlMgwtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=hAT5RjbZ; arc=fail smtp.client-ip=40.107.93.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgfu5W4i0+SmK36OG3aAVUFNZz1BIC4AxettKtwZKbNBjPJ5a/+wskWI/CCB9RvNFa9CNydmAGzROfwz1U1O1FFqeeZy/gBkd/5lYTeRD0eIEsmY0ikPDts2064eBhAwm7RcNLJNftwTIbj/6SC95HcpJOMTl2uyd/jM/rsB6uQuye7ZBwPFLEoz9YEoiHcInffm8zfToeq69pwAjP8F74O27SRW9Dfd0kQrXyja4/27gfz+S9adSmldrHGHxcDbNF7UwSyjXNpLq579V3xuIXEUyJbgm5adDALWhlwJGeiuys2f4ysDnCV7EYy/KNsE3T7YjA8wgcnj6snWxBZrMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQzx4/1anHz5cL2s4XIn8rQ1WxU2HjJxs+Ki6DJuXOk=;
 b=rSNttmrWg2RdDpeNy9HKE4t1HftjJzlhxdr6IwhXQpVzPLd4QqFaxfnXi/XAZXqsbHNV+ef/dgBM6RulXXOSJu5sM5xPqIUqxJ9Zfjik5M8PcWyBhqVXQH06d4MD69BNACih2ZElgqjbrPiz3IjjDQBHDCcXgKkbYjsJeTqoyeSpa8cAAmx7W2SUMxNXe9N3UPgAva22Ykg4pJnMNpGOcAZhqAdLPUualAcuI7fipnKYdlWM0SetKISfW9YqsNsXM9EaA7ACbMHHhzR/Z+XiV5u42P6ldEi6e5FO6H0vo6t7BmK8tkLSo7aAOhYAqgwRmEC63UcmMXKidFrndPPfkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQzx4/1anHz5cL2s4XIn8rQ1WxU2HjJxs+Ki6DJuXOk=;
 b=hAT5RjbZnTn04f2Ory9jj2uLzPBoZxh7GigDjk4ijg03gjU8vstlv4aWrnh7rEtLDszbpYRYYfRE8VUymoCMFygyxbR8RzQgO/4/4ZWix+RGDqIyl0/sABR4X2ndcehzv+RF2zEMGbZJ5mhZB/o8/sOJ6cJW2OKG6anu81e85k82FcIqLG+9WXXhX1hZvxWiIBF7f33RbuK/0i8sKNYSarS6l5hNqduZHUAZ0tnlKEoWyXa0B59d7ff9nAyIgIbG28LgXn/RpRCJXSlyh+vs8glA2E219BYxQLUyBzEFUK/fV4Y5fX96q/M90ZeksTEyO2/Wu7POp4rKzUiqHngugQ==
Received: from DM6PR14CA0038.namprd14.prod.outlook.com (2603:10b6:5:18f::15)
 by DM3PPF17CE793AB.namprd18.prod.outlook.com (2603:10b6:f:fc00::68d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 1 Jul
 2025 20:27:51 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:18f:cafe::58) by DM6PR14CA0038.outlook.office365.com
 (2603:10b6:5:18f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 20:27:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 20:27:49 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 01 Jul 2025 13:27:28 -0700
Subject: [PATCH v4 04/10] dt-bindings: gpio: cdns: add Axiado AX3000 GPIO
 variant
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-4-11ba6f62bf86@axiado.com>
References: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com>
In-Reply-To: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com>
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
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019; i=hshah@axiado.com;
 h=from:subject:message-id; bh=IjNBX8Z8FuIWhDqWI8fnbI+l0zLnHqnW4aN9UfKpX58=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZES9x8HBzSaDIDh1O8SJfyfEE3tlrRfOsLxgI
 GLP0stdY66JAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGREvQAKCRDxWHMRoTLV
 +zDvDACBimoO9DeIjDfsE/MKdtkaulFujenOp4Zk7xP/m0PF5HAynBW9LuKGQLyoT7BYKYgHta6
 UiVBbQsamIgE4Wg2g8whdWj+h826JiKh9Z5IQ5oAa3A6st6yK8VNr4xXEFpz6H1ywydmpF4TgbO
 4ULVX0pr+uPn2gGV+ljFQdAJJYk5oCUO7CJpKV9uitf5aB5NUYw67+mndebIlrXCBfEC7eDLR9V
 tyOu7PAp/X8kkT/7NQE1xhErLDoT7mJnfABZpfSmo/TV7ei8yl+7FQirsrLKmcirINRQKEJPw3C
 6Zc0O/20tNZEbZpHlA33TKjjI3mVrrYWo/IOmO+wppyZwxQ4x6xV8aAxtMxZ6BFBOlwS6umHuUs
 foChGScvW9DxE3O7TidXT4E5w62NauDYs7oqi0XyYEobGeEHaXQnZeVNKNShgpVp1wMl7kRPku4
 RYaqA2EHr0t4/lO8oXvz/mTC1EgN+faq3yqtmx5a+1tscbam2INfq7OI5eataTjkqwSX4=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|DM3PPF17CE793AB:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e09e2ee-1ec0-45ee-f6a7-08ddb8ddc068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VE5UMHhvcXY4cHk5aVMreWN5dGtnVUM3bkRUL3VNd1ZtTUFZc3FJQ1NBdzEw?=
 =?utf-8?B?Skx0Ni91OUI2QmpaaTZEdEdyem1VTXBZYXdHNm1kWEUyQW5INkhuYWR3bmV1?=
 =?utf-8?B?bmdPKzk0TFZZMUwvQ1NEOUpSRnhoSlFNZTNsbis1Z2lzRWtnNU9hYVl5bmJU?=
 =?utf-8?B?NUpUWjNGVURxVDNZUjZrYjZ5N0hBWUJ5QUNlQ083QUY3QlcvSkIvdi9xZ1Nu?=
 =?utf-8?B?M0pUbGxtZSsvK1VhVXpsZnQ3L3Y1MjRDMDM0WUkyQzI2c0F3QmYvdHQ3d2Rj?=
 =?utf-8?B?M25ROGFwNnV4bVYzNHBmSnRmUUNWQ3Q2dmlEOUw5NXVmemhWbXEzWGtuQVY5?=
 =?utf-8?B?SmRFK0lwejFLRmFsMFBLZWZtNWt6QzEyMThBUjJRZVgyYjJvVEo4a085Zmts?=
 =?utf-8?B?d1FaUDU2bWlQejJqOVAyL3JXOTdkNk05eHdGa1cvczF0aWVkVzNMV2xZOGNu?=
 =?utf-8?B?NUNOcGVERXdiSi9CMzNTdDhEMUhkNHRKTnd5MTc5UGJCZ3ZZY1RZdVZSSGUw?=
 =?utf-8?B?bFpSZ2ZBS2FZQklGU2VJRzQ4WXFlaXJ3K0krdE9qbFFoa1pKYUpnTmpkay9W?=
 =?utf-8?B?ZVVYVmh4NFVwZ2RVeGgwb05LWWI1bkpNTEdkVGhlQWxKb1N2NTRWaENWYjQ5?=
 =?utf-8?B?MDVmK2VUcDdwOWV4RlZJNlQyZWFXOW5yMDNYUnc2SlF3azkrZ2tjbTJ6UnNY?=
 =?utf-8?B?WGMzRnlUYlJVTi9oOGRFQytMeVFjazcySDhkSXVNRzh4WGhRQTViWDYzVVNp?=
 =?utf-8?B?Q0lBc0R4SUpPaEpZTWMzalA2RTdTalJPN2xXaVAxa0tSQ0I4Zlg1REp2RG8x?=
 =?utf-8?B?MzRmMmdYRk9CY3Flb1BLWGJISFVzTndGenpyMXdoN09pNjZaSXJUWEFIdjRS?=
 =?utf-8?B?V09aQmlPamJNU3pjZmxFVWlaOExsQVVBcElobXZHdVJoVlEyNU50bHhVcDJB?=
 =?utf-8?B?TE9yZVFEdXJnVEUzRGJET0RkVHQxSW16Qk1CeGNqdUJLdmQyS1ZRVUJnWk5I?=
 =?utf-8?B?bThBeW42UFF6Z0tyd1lBVkc2OU44bTVod3BUbVBZSDduSXd4dkptYWducXZL?=
 =?utf-8?B?amhHb1lzYkhkTnhvcFJMVnhFMnQvNktIaFJSMXA1ck1LSngreU56a1ExNmdX?=
 =?utf-8?B?WlhoSXlhY0MwWlpJT0pjQTdRUlJTdi9nL2NldFVlSkRsUTB0STY3Tm91dnNv?=
 =?utf-8?B?ZDNSeVIySFRjdVhtckNvSjdxVzgzeTNLWEUzR2U2c3ZxdVJXekIyam1ST3c3?=
 =?utf-8?B?WW90WGNLU3JhZjArMUxsZkJnNGx0N3hpL3kxMkR0YndoUjQwbVkrOTJyN1Fk?=
 =?utf-8?B?SStzRTNxcU1kSWFFTHhYR1dWOFJTbGI0MmNhUG5jdWhXZkQ4dUxwNFZFeVB3?=
 =?utf-8?B?OEk0OTM2TzBYVW1xV2JLbkpPN25KUmtEZysxQjB0ektZenBjK0FqQm5pc3Bi?=
 =?utf-8?B?RE53T0pCWk1vS0NyTG9IU0d6dzZZRzVRdk4wa2xvd2VOUllIWVhmUHcxOFN2?=
 =?utf-8?B?ZU9mT0JXakNZcUlZdklsZU56TzhiNTFQUXczdmIwY3ZyRG8vT0pYRk5kUFY4?=
 =?utf-8?B?Y2tKRDkyVjRnZHJxSTdlWXN4bUl2SkVMd0gxQ2VSNlZhUVVJUlBJUVJzckVH?=
 =?utf-8?B?RngxYmJlMUVUWnhqRm5VNEdLTGNKaVpJYlhFOUh4MXpQWGgrWDhJL1VGSzdo?=
 =?utf-8?B?Rk9KeDNEaUE5THNsMHBORTExKzgxK1RURDlTSHYxS1R5V2FXU2FkVUlaRk0w?=
 =?utf-8?B?U0syVVdRWVAvWVlmNDZMYUxqbXFnS2p2MStTTW1IL0lPYlhQRHVvRDg5cFRV?=
 =?utf-8?B?OW8xR2ZRUjNMODJRQmZlalowUlIzRi9JOXRLSzZkcnRFeU1hMk5MUll1VWUv?=
 =?utf-8?B?bk9PUDVESnR1cHRBbXgzcXhvcGNNWHhPZkw1UGFZK3o5TEthOXdNem1aaUdw?=
 =?utf-8?B?VXZZeHdrc3d2Qk1aNzluWFNCK1JWeU9WU3RHVUFmRTVCQ1hheWZDRko0Nkgx?=
 =?utf-8?B?dlZweDBZeXdHKzM0QnZXazB5UVNCejk3djJ3UVg2Z0RCMmNuRUNXV1FzRTJD?=
 =?utf-8?B?R0ZlQVVadzU3U1RhVEhZVG9ONzFBcDh2c3pSQT09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 20:27:49.9788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e09e2ee-1ec0-45ee-f6a7-08ddb8ddc068
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF17CE793AB

Add binding for Axiado AX3000 GPIO controller. So far, no changes
are known, so it can fallback to default compatible.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/gpio/cdns,gpio.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
index f1a64c17366500cb0e02a0ca90da691fd992fe7d..16c311a252921ba65d2f9f1b34a07a4a940432f3 100644
--- a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
@@ -11,7 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    const: cdns,gpio-r1p02
+    oneOf:
+      - description: Cadence GPIO controller
+        const: cdns,gpio-r1p02
+      - description: Axiado AX3000 GPIO controller
+        items:
+          - const: axiado,ax3000-gpio
+          - const: cdns,gpio-r1p02
 
   reg:
     maxItems: 1

-- 
2.25.1


