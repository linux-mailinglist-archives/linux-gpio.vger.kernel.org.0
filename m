Return-Path: <linux-gpio+bounces-22756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B51FAF7FD9
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 20:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E22854E1E1C
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 18:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C112F5320;
	Thu,  3 Jul 2025 18:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="aqoM1vOf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2112.outbound.protection.outlook.com [40.107.243.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F10B2F5097;
	Thu,  3 Jul 2025 18:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751566879; cv=fail; b=mjsIWq5Mf6Xqj8G0we1HF73gmc/FWF+/DzuMJWJJktjveYsEB3Jqb4bYk5gGejRmKYDpjtLGx2UwZWCMGgn0Ax8s+7jzMcARZTN0tx8dvlpM6MLo1QcaN4JLamj0zYvdHBOQIHFcsDQq8FBgbTqgQ8jwn48S90nnacXvWlWpH6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751566879; c=relaxed/simple;
	bh=GYTfWwydoEqjOb5pm/+K+xUxE68sq0M+YWOMHMJ7pb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CSYESKXwhVBe6D6cRVawTfkRfyPKH/snR0tRXwPgKGQHazG0m1WcN6g2AXTP9t7ZYLSl+NIEwtQKQKc7p6MGhTdg+weojXMm3p22MbmgP4tQFWaklfap8NwmgKmMt/44t0c27UF9Xrle9/0UtwUmvr9YyJ7xUd5KARRsj2nglAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=aqoM1vOf; arc=fail smtp.client-ip=40.107.243.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4udleICaFkdNtOGW41XRC6a+OH0DwDZa7xlpSO9PShbi7wUtKsEAsEVS/vMtGU7FRCRVxZrTJYeENDT4p9yjkhVOJcMSOtW2tiSVElH+thcsQaLCHFvHDb77VGf3KzAtTfG3a+wIQgj+a4yq1FcfAIkJr7Vk6lGsQ89DpIQK2XliGJE9iqNnVUeuOqOU5DTZLO22f9I8ckAeal6JIGNUXUsI3WZtZE4E1fPg73aC6/SEqKFQOjxxGDZBhd+70jed3ANtZytOjiSfATrVOg7/QxCwYL5rnMcpvw+Gbnw11Yz8G35bIYOL/SatrXqZhcoyjA5Sz2cXrUY3z7WOHrPrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/RlS2B/u8t10UcGCVxLrdmGRS3VhEcVQs+BmdJwEfk=;
 b=MYPYDJhpvjSA+vg2vWJXfmaUGXUFcFNMtXoi7bCDJA6bxR9C2Q68mJTz+o4Qduk2aRETnT6jnvYsFPwySuCQSXFA641nZhKqzV5qtoRpVZZ/Vtm/Hk6eQvk1hhwxlsxMaN/pJuxzf89gKRvDM0quGNyHgv11Jy2rHk+hW7bGzWQeuLPZXLkkfkircKo6YDkDpq8ZWcMUeYrLOoMflum6hULWWTiXM72hBKgpn20alh/7VrYonm0H2H0TMIwWRcndm1ZMC5KeAZrm2gDHkTj7sLVA5c+oAn6quuA0TlBspxAhSc3xJex8uZHC5/tA/cB80aQ4puxPWfqrQJQteQ1Bxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/RlS2B/u8t10UcGCVxLrdmGRS3VhEcVQs+BmdJwEfk=;
 b=aqoM1vOft5YQkYwoTVypv6rTJBN3yHb3ppVF+u0CyXRQ1KC/ZxB7dxrO8T7UqYhen0QeMA4yUeG3nVl380K8cNuiY9M1A3kLq0dEI8wL8c/5Xl1oqhnbS1Q3WIocsBtYT13Gesr/r/Xm2qP8Rg/bg37e15n0Ua4Ij8l+cVl3izgPlzP3VHGwo+KYRKLzuJwY5H6IWm+o0b4pZG/Z8MU5KiiJb+UwXEcwWx6iQqfPdIcV29LfXJ/f0g8z5QcovnRaUyqRMia4yxr5DEy5JcZCMKeCUueyxpgQS+CKAxGJLdKiugbqDG4h8remEIwc3hARn3JJlRvwcC9ci93N670qaw==
Received: from BL1PR13CA0328.namprd13.prod.outlook.com (2603:10b6:208:2c1::33)
 by LV8PR18MB6046.namprd18.prod.outlook.com (2603:10b6:408:231::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 18:21:13 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::6a) by BL1PR13CA0328.outlook.office365.com
 (2603:10b6:208:2c1::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.15 via Frontend Transport; Thu,
 3 Jul 2025 18:21:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 18:21:11 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Thu, 03 Jul 2025 11:20:51 -0700
Subject: [PATCH v6 09/10] arm64: defconfig: enable the Axiado family
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-9-cebd810e7e26@axiado.com>
References: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
In-Reply-To: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
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
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZsoAUTxQFQf2QGbmk+aLL+eUYt+kM4G77djl/
 KzgVGHKpKSJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGbKAAAKCRDxWHMRoTLV
 +4DWC/99Y+dzOpXEEYkMG6715v9mLg7Zo2jn18ROJyYvldnBpB2WqNjXrmjuElIPxQ6FKqZBn/R
 BbxQRzgRC9YP3Z8RqaoJOg6VamhybSfGAqN9YO+Tx+B2cVWrg+JxvYJIZQxAPvTME3C+Jzu8vuz
 J3vLbjwr/bPMkgsH0JRzS6ICKPi4MaloRrN39V2P+/HXdeH1k+fWlQbW94ValCR8VCesUsbXLl7
 nfT294kaumrlGqNmLGJ+EZss7hqGr8L4SpIyNkrHOV4C87NUZXqREd7hP+pR9UzJi/9tnjdiKww
 OYRhtC1R92JWN2th8hipw9o7+nCFRAxwcB3KuLn+OJL5RHzHxRPGNWi7r5qyat3hk6YYl2ohAsw
 WVXMbQSNbVqIS60j5m9a4kYNrydSiX5+zMlLB0IfIzgiNSpWSCLk/FZdiCWx7vMXcmZ83el6fQl
 eMyg35dOStZuLcSZiI5BcRzL8U7W4KGhdkhg0Ase7pjlF2MiZHuQcA/WqIU677yhjXK6Y=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|LV8PR18MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c9948b-8eb8-4f9b-166e-08ddba5e64af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTMwNm1DOUdTQVpyK1Nid0h4cjZ4V2NQekdKaEJ1SktTOTRzcndYNWkvM0g3?=
 =?utf-8?B?WkhMdXBmR0RFQ1pNK2k3WVJpQ1hLcm5ESkxRTkN4V2FIMkFxM1c4eEZZY1FB?=
 =?utf-8?B?SkpOaTFLV3IrdEF2bTFibnZjM0lOdzZKRjhncTdCK21ibU5qTFZIOEQxd1RH?=
 =?utf-8?B?eTZORnZMWVdBQWoxNlFiM09aa3BDSlVQRng5S2tFekZWbEZHbkhvdkVBdnc5?=
 =?utf-8?B?eUIxUi90aWFId0xmUU9saEpUQmhxbWorbVhhQVFtVEx6cVZvaEpGMC9sM2tn?=
 =?utf-8?B?MjJDdERxa0NCZUtYcm1FNGIwbWcyVGNkeStpOUVDZVE1eHFOUC8ydWpnNUJQ?=
 =?utf-8?B?YXVSM2VoWE5aNUFhNy9tWkx3S0U0OHBXOXF1MllWNlh5UHZXT3BlbVhkWjRw?=
 =?utf-8?B?Zk5WTm9SVWk0RUY3eTUzMlhJeFJwUzlpcmMxWm1xczlWK0VhbTE3QmtEV1o2?=
 =?utf-8?B?eGo4MGJGS1loYjdWd2xZV1BjM1NUODAvby9tdThwVXBHUTRDRGFUYzdkQzlk?=
 =?utf-8?B?eEFHZFBYVGdxK2VnMW9wRkVYb0Erb2lUWjJtY2hLd1kzcVZKc2tQeHlyeWxG?=
 =?utf-8?B?cG1WVkh2WmwrM0kvdVo1SXJjMGZubWdPL1VBb0FXUmw2OVBDdXg5ZXg3dk1y?=
 =?utf-8?B?T3lzdjhZd1lwU29jb2RTbmV6UlF2amdzSjZQUVRkQzBVekhRbVZYZFJVSm4r?=
 =?utf-8?B?ZU9zVmhQU0lyWXJIMlhWRFQ3Z1RFRzA0V1BGaU8wc0xSdHhXSkZ5SlB1Rklz?=
 =?utf-8?B?cXlHazJIeURWWnE1Y2ZobERaeitBZ3lXSFpvaktDVW01dFhvNm9hWGhidTc4?=
 =?utf-8?B?cXZzT285RExRREk0UDBhVkRWMUN4UUkzYkJDN2lNQ0lWdWVyUEhlMW52TFdh?=
 =?utf-8?B?ZE5qbHQxNTZtTDlOMGhrLzA2b0VKcUh1UW1YZEhrNS9hc0djeWJRMVRJYzRr?=
 =?utf-8?B?aU1uOWo4Q1k1LzFHODdXUDBRR0RnVUdua0tPdEhpY0tITmlFdjd4QkloZndz?=
 =?utf-8?B?TlBhU2JSOCtNMW1VUXhETVBzd0EzNk5RbkcxUEI3VDdMakxWOEJ2cXROcHA0?=
 =?utf-8?B?VHYxemtaSDJtUENVck4vOVk5cThmLzlQU0xXaVdMUzhRRk1vc1BrYXE2bGhm?=
 =?utf-8?B?b0JTUzZrazFyZ25sNUcwNHBpb1djTGtReWFnK3hCNVZXUmdNSUdOUWhKak1T?=
 =?utf-8?B?MG9WNUVZdnlKZGc4RUxBeElMQk4zNzVUdzdUMUdVMnFOOHVvSWtMaEcyWUlN?=
 =?utf-8?B?Zmg3ZmhPaythcWhBc0lGbFpNRDNTbklOM3hpTW1oMHlOeFRDc1N1WjNUR0do?=
 =?utf-8?B?ZTM4Kzg3YS85a0NuRXltSlVzMWdibkNOZytQQ3hJak1SWkNGM3V5NHplMU5B?=
 =?utf-8?B?bTAzOWdudHpEZU81UERXWmEzZGQzVEptTnpPSkJkUWRsYm9KalN6ajBCQW84?=
 =?utf-8?B?WVNZN1huK0ROZFIxN0xSRGplVUtRTDVwREtDa253MmQyRkxLNlN1VVovTlRM?=
 =?utf-8?B?bHNHelhsTzcyVTZGWUoyK21qR0s0RGt5L0NKbEFQTHhYbFV2MmVsNWdLVFlX?=
 =?utf-8?B?UXo4VXN0UEVQb0MwZThZc2J5cVliR21rb0lHR3lLN3hYSUlGRUdLUFFQUmN3?=
 =?utf-8?B?akdHM1BjMHRoME5tc1lsSmRTYy82NGpVUHpOeWtVSnpZZzNMQXFFczlQa3R6?=
 =?utf-8?B?bk1wOEd1dXg5U2VQVXdnUGdidVJvdmtCaklzNmdwK3ExWEJoRmp6KzZUZG1v?=
 =?utf-8?B?WmY1SG9WZzU4VjhmVmZQZlZ4aGd5d3BTcXlTaC9pbVRHUEFtTG92Ullyb3Vp?=
 =?utf-8?B?M0JOVVVqWVpyajFDOEhwam1BUEtnVVRNc1R1bnBzWm9pRjB6UXRSalFCdjN1?=
 =?utf-8?B?OUM1dUs2VGdBTnJqTjdleENwZWtrQWxvZzZpbllYSTE5UGpLbkhaL3VYOGFK?=
 =?utf-8?B?b3A5WEhiV0ltclNkQnI3a21adWM2T0NTbjFJOGEzSkY4dzJSd0tPQ1huLzMv?=
 =?utf-8?B?bmFTWGJkRDdXL09vRUcrV3Y5dXlFd0ZUQlBZTHFQb2cwcGM3bWFIU2I5RVZi?=
 =?utf-8?B?UlFsSkxteFpQVkhZdmtKVFlFVEhWLzBPR2NwQT09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 18:21:11.7070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c9948b-8eb8-4f9b-166e-08ddba5e64af
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR18MB6046

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


