Return-Path: <linux-gpio+bounces-22681-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D3AAF66BB
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 02:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A420D524C5F
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 00:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8AA1DB346;
	Thu,  3 Jul 2025 00:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="BuGD8Ruk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2131.outbound.protection.outlook.com [40.107.212.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FD6188000;
	Thu,  3 Jul 2025 00:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751502176; cv=fail; b=CKMoHvTvfvugCRcPxdIu2VQQVyp+m0cjQgqzEhaVhGRhQC7VRZslbhRQiMVoH2ELgMp9q1KA6/fxdGa+EfbeN7Y2/3kWiZD/n9rXIUMs538B8waOyAb6kzgzjnwPsZBIV+VPHxM8eKzU6O14E3XMK576hkAkszZQogx5HvY7RH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751502176; c=relaxed/simple;
	bh=GYTfWwydoEqjOb5pm/+K+xUxE68sq0M+YWOMHMJ7pb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T+VjSMI7MsVJIOdBQns+ZulnbauL+sRtg4cNBgLTC+xQl6NDtpVV1hUYegpPeMGFRjWGBwwesZbdz8SuiaGOlVUlh5K9VIwhfZvTyc/c59iRelZbE56U93D5CJJE7SYGrh9DSrfBIAAo+RyK10+v0QGD7p8tZM/I3JV4jaNmD9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=BuGD8Ruk; arc=fail smtp.client-ip=40.107.212.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbAQzKwRr+i6QP8T0P4+HyUWZsYOW7JA/ovptYo1wz3nPLJtyqIRUfUYuVJ99xpMM5uIxg4s/3ufWX7AL4a+6t4avekjKQEV0hYeedy0LI8FxxxTP2dapIg6OfnI57M06nllUkSJEAmhzgdXewM+lO4tBczkSuybG8Uc46z5F50RsnX02g6qgG6JnU5GJRzfw0UafNzP8r4D12AjHip8EmfXzaRtARtN7F/Cqh7E1TmjiWpK37+53mKYT31LrWVe/JSpZA+fBLu/h+8s+V822Day6/V+QYk2vHL1DPxe4pzE/A+beLAjW18o6fyKZ5eBiVnvH7v1N6SwRjl7S6eCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/RlS2B/u8t10UcGCVxLrdmGRS3VhEcVQs+BmdJwEfk=;
 b=CkhVM0JTuYjzKtjPYpfPeVOKBR6TKX+wR9xn3ykCmZQHH/AqqUDRCx0MEWX1KlF5I1OXVZIBs8dA6L0dPfDhkVYw6Qaodq5sUSfr9JMLXEDE+RPjeDqJM+pvcPMXhckFw9iRLiFtKXIFaqi8O0OKsA0UOdITF3JdeiUxjvtZ3YQEbmyPwg8dRmFqSx2rG3nx5Rpyc3RUT9f3Nvih7DJ3xTsbcxUCZtynUC0c/uKc9PN+SquS2n5csjifk+zmMmILE9bTZcm4f5pjBTPhnpK5keLnveHwLAvS8BZTqY+ukRfq4/ALqtZv5Yrw+aRZCyKjvJAkjfXys1S/YRB6xfRHSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/RlS2B/u8t10UcGCVxLrdmGRS3VhEcVQs+BmdJwEfk=;
 b=BuGD8RukUySLmwi5j91lb/gFfwulwO6tZ4Bvnd+oNXt2bd0IiViiZ3Xqi6yIU5XH/96EIIFZCCJ5Ho3FYni8UbyAWcVUpzo2Z98A5eMsN9V6tJ7Llb2N01VNtvh4ycbjV83UA2QDMpOpAoukgx0nBnj7st/0F6+HAGnHMPvpLgqgSoo326Ic0pz684PEglZYQ72GSboGFdrQTnXsUDQsopFdVAcobLagi0ghf1Xt6SfWrdB35PUdTDVq6bmHe+5hcTjFRFef7emtWOzktKPQ8kSH9bOi3/2f+Lb4+hnJyh9VtSvxqenh6Ud+enXNF7fOWRkaVEkty1LFK1sI1X/5WA==
Received: from MW4PR03CA0115.namprd03.prod.outlook.com (2603:10b6:303:b7::30)
 by CO1PR18MB4780.namprd18.prod.outlook.com (2603:10b6:303:ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 00:22:50 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:303:b7:cafe::bc) by MW4PR03CA0115.outlook.office365.com
 (2603:10b6:303:b7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.32 via Frontend Transport; Thu,
 3 Jul 2025 00:22:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 00:22:50 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Wed, 02 Jul 2025 17:22:38 -0700
Subject: [PATCH v5 09/10] arm64: defconfig: enable the Axiado family
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-9-6ade160ea23b@axiado.com>
References: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-0-6ade160ea23b@axiado.com>
In-Reply-To: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-0-6ade160ea23b@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; i=hshah@axiado.com;
 h=from:subject:message-id; bh=GYTfWwydoEqjOb5pm/+K+xUxE68sq0M+YWOMHMJ7pb8=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZc1T0dkb/CItGSBf75zPU+IKht90TIAG0bN2I
 hLXgECiXIGJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGXNUwAKCRDxWHMRoTLV
 +8aJC/9+HK7ieNqIwb1nn/iIIt4zLvRrgFqPtEGDa6dBMswl+c9Eui9+p1KrmkCgR1aH+9ruQIr
 pv/fzt2c2IoOCMLjtVhHWKoy8p72bXHfueVPYeiQzQ1tRYwyB6lgF7rM8q7qpSaoAwbxf43fzDY
 tVL0wWYUYWsxkXuejvqrSM8F1/C4nLG0yY9GU12XBcgb/JEtqlY3LuZjcgdHOdkLuoUuTOxbK8W
 f2ShrAwz+C+eBbFyrGnoYTN65LiGk6ZkyoiEpuxHasXabGkKMqshsziJs6l0vIq5k3J8giLhYFK
 LjrLkuf0M2G5yr1oSaFHqBLpw3c35Ng9Ft4wngmLh/gpTkrUHqBUUPlNyZ0elZyyDpnzzaKpoCZ
 VralO9UCOfWhYxsjG0WZmjFEWwE0UAqf4gb64UbaSI/11UlcsPEJ2WQlm0obZBnlnzlYQH1EC8H
 KnRAWEHnGzw/MDWO5TR2EmHU7KjxF1Yo3o0FrlSL46oeEXEXK9iet2pa3XW8zjIF0jhcI=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|CO1PR18MB4780:EE_
X-MS-Office365-Filtering-Correlation-Id: f620161f-d6e1-4b79-a7e8-08ddb9c7be8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnRJSXcwYktOTU5UNHI5dDc5NTFUUkJEc09JRGRhSlBrUUNWaG83R1pnYnhI?=
 =?utf-8?B?YXd4SkhTd0J3MGdRd2xnSytyUWZhQTJWNW5SOEIxb0JZWUxxUTZkWHVvNXoz?=
 =?utf-8?B?WEhzaG1jdFJsWVhzSEp2OGRvOFAvK0hycC9Wc2NIOFRtN0FWU2R3THp2M09w?=
 =?utf-8?B?enR4TkM4S1o1Uk5jc0lrT2dtdjFoYlU1dmZJVjNDbCs4UTZDbmluRVhBbFo5?=
 =?utf-8?B?SjBKSjk0c0hKdzRNRGU1YXdvQ1d3QVBZY3ZIQzF4ZEM4WHNSMDludDdEdGFW?=
 =?utf-8?B?aWRlcnVZOXpzUEVWdktsZkJqSjRBQ2NtenZmQlBvSjM2UndQWWJRcGZvUlFu?=
 =?utf-8?B?c1Nsa2JDbGdpUldnV05hNitoeWNoMGZHenJIL2VxU0dzejlpd0FEeVVKMGxH?=
 =?utf-8?B?a1lqUDRyak83WUtJbnYwWEkxZjhpSkhib2FhMEZRa2pwODIreWhpeng2cDVa?=
 =?utf-8?B?SGZveTJsOWwzYlhQa0FWUzF0TzN6Ui9BVlZaQWhQOXl2WXMwQlU5bml6UmFw?=
 =?utf-8?B?RXBiNmRBVlRJdlQrbmNpdU9QOXFFOExSY1pXVTN5N3Z4aHY4REMvK0x4TzFJ?=
 =?utf-8?B?VFR2QXVIYnJlczJBL0FmYWNTVjc0YUFES3MzbEwwT2trWm5UNjdJOThYdkxU?=
 =?utf-8?B?MzZEWHpRK2dwSEVLWGhyMnRhbjAzTGc5ZEROVGNnTGhyNVk5aStTZEdrTG41?=
 =?utf-8?B?UEMwRkZYNWc0dVpjRXl2SStJTTdkUWlpZkZyL2djNzFpNnRGd3VYd2ZBcUQ1?=
 =?utf-8?B?VFlJUzNzYnB2cEx3d0FaWWlZZDNTdnVqNkdSSXlTWUhaSWk2aHJ1MlpmM3A5?=
 =?utf-8?B?REpiQ0YyelB3WTJ6QWpzMm5GME8zWDFTZWxvOXhxa1BTNVE2akd6ay83UHh4?=
 =?utf-8?B?N2NINkQwNzRvQmJ1SEZwRDlCeTlqZ2ZvT2RIL2FJWW5BclB3RUZmQmRESzI1?=
 =?utf-8?B?L2VGWTdZcHdPL0VGbEp2eEU2cUY4Yi9EVEVvOFVRaFpaWHpQM3c1ZmVGM1Ni?=
 =?utf-8?B?RWVMMDlrd2xQcGh1d1hYRU9aQ2JoT3krZld0R0RuNHdkWFQrVlFjVXg4RjhG?=
 =?utf-8?B?dTByc0VmVUtIOHBUeXJHY2NsM09wOUR2YksyYndhdDRiSU1UQWIveVRzYk5Z?=
 =?utf-8?B?Qk9aS09zTHhHTlFPQ2RqeVJsRWdhc0lEZGZGMTFoTVhYVTFicVRuMzQrZHQz?=
 =?utf-8?B?ZzVNKzZxSVRwNUx3OWZQOTk0VFh3M0U4ckdNbWI2RVRBMmJVdzVFVDJ5SENm?=
 =?utf-8?B?YVlKTUFaYjVzWUN3L1VURG5iRjJmK3A3b3RsZmRmSzFFenJ5VVVVcnRwM3Uw?=
 =?utf-8?B?UDViaXBsM2tCclVDZ0k3MU0xam9KMUp1MzhCekRwZ2dlcytRNmdHbW9zS2ho?=
 =?utf-8?B?NFowU2pCVGpvejNpRkNSSEczOER4R2lWOTJCL2RxUVVwR0pkRkJxaTN3RmRo?=
 =?utf-8?B?MzZTZmVBbDJpNFNkN1VwRkJsVnhLUndzUjd4TUkyRlZ6dHJkVEwxUnVsbytH?=
 =?utf-8?B?ZU9nOWgxUGh4ZTBOR2FlOUJjaHM5cWord1hOL2tHRHBaK0RGVmF6VkVRNGZT?=
 =?utf-8?B?eXg5UkZ5VE5tR20vYmloRHNnRFV2V3NGdFd4c0ZrdjA2bmJQSjQ0ZjZQeWgr?=
 =?utf-8?B?c09FK0d5cjYyUU54ZGVuU0lzeDRtMW9pTUY5c1NLMlkrRTlweldxQ21yU01h?=
 =?utf-8?B?a0Z6aHhqVlVVd1RVNVRyRitwVG9QdnJpSmY0a2F2WnFKNWpiVFZpQklkN1lD?=
 =?utf-8?B?UzU4dldCblBBbHVwb0ttU0VsN0l4R3FOSWZFK0VZVU9hb2w4UE5xT3hmQWtH?=
 =?utf-8?B?SnZvWmpXU3VKLys5WHZDaVdlMHpPdXJuUFNFMEVPLzE0eFNkQ1B3alF6Zndu?=
 =?utf-8?B?eHhZTWxIMmRDRDdRNm1nWjlUczhPZFkzNmxKeWdLN1llTnorK1BERDJBeFpZ?=
 =?utf-8?B?OTU1UDV4dkZxaVJJM0RsVzJEQnkxbmZ5OWdlL0RVWUo3WEVOS1hIcmhvdlhQ?=
 =?utf-8?B?cndEelhtdXdmTERoTXRaU1lHTDNoTDUvTUd3a1ZIVjR3elVOcDJsRlhaT1Vq?=
 =?utf-8?B?QVVuT1FKa1NBQzhnQ0JTS3VtbXEwK015eUFOQT09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 00:22:50.2126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f620161f-d6e1-4b79-a7e8-08ddb9c7be8d
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR18MB4780

Enable the Axiado SoC family in the arm64 defconfig.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91b79770639d3eb15beb3ee48ef77..96268ade08aff844ad833c18397932a059db5499 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -38,6 +38,7 @@ CONFIG_ARCH_AIROHA=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
+CONFIG_ARCH_AXIADO=y
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM2835=y
 CONFIG_ARCH_BCM_IPROC=y

-- 
2.25.1


