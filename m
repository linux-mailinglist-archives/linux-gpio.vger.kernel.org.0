Return-Path: <linux-gpio+bounces-23650-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CF8B0E4B8
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 22:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CFBC1C87B16
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 20:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B7F286887;
	Tue, 22 Jul 2025 20:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="N3+iz8eU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2093.outbound.protection.outlook.com [40.107.243.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF40C285C9B;
	Tue, 22 Jul 2025 20:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753215379; cv=fail; b=V5ILYlOCjG3IhetEJWBxIYqZZAy/1iDLKdL8jx/C/YIrTq1fOxTRaLKzl7DruDwiVoW0hb2mHg1wrjdas0KOa7KgCkUl6lieDIPFGw2L16HcnY1ySw2HLKLlBi3N54UoKVU0we1BH+7lPPAj0tDBDwrMLXaJDyq0ozuWWIEwoRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753215379; c=relaxed/simple;
	bh=76okLidoJP6XC526Dh0oE+YzQ6GEuPrslK8PDO1ML0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eJUmixKRJeDuTS14Ju2N9ED/kZXigMaudaKw/iW1mqBqFwVspibZDcPDgSBm+CnBjHpYKaFh099iZ+eX7mriEQ1i2LTFRZ4NHNsnl3iQ7V5cWz1Ihxrb9lWMalRZGQPFbxerIqmppTg4AOcfGitgXogDWUb1sZd8LO//O8+nuDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=N3+iz8eU; arc=fail smtp.client-ip=40.107.243.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8Y1JJ16YeFhZnkNxygOfDCTK8iToJBF6BQTypRdK+8g33bKl7YuaEoi1PbOgETz6OYJ0PaLdE9duytbekKX641qzbizjjL7jAi0v0hqyTmOSkcHp9b6cfwsvIlNUTV0HzZPjZWaCLP1YogWFf7L7LML5VKLbF6/AQrhLkFAqMPqNuP7jzRRtXT9ymothwKCxGQ+orvfUc4T1FmjNI45XYX1o5ZeYWUMLq8fkzO1LfVEQBUbQGqXFB81q9j1n47dvLE0RhFDNDwohrwkFNdOaAncfFSl0+8XztgZkTxTFXeUkgtJhH1+N7h6Tqw91NqTbx4A/eqLJ+glu8FtELGPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fC1wGXkjTgm9sdaH+SO0MwS6z+c/SPQ7G2aTB/7FYSg=;
 b=M4nKtP8XKYmRvg3KQtwjbvwFxJglCmpgMQYJXo9w7uxY7qnRC+vu8Cer3jUgSqlEYIiKke8PJtSMecC1Ec0JacDjIUtNJpMHwfoC/UMBZX60u0z3bXixgondg6BWkzAJ7p3twiais2LKB/FjzujMa79/vuu2OmfEiVJ2XmX8gfzOLRPAcr55fh3vphVKGarfKqJghrfbaqdctId4tz1wc2rLv650Z+kkFRviqVo3s11HI1hj4C8+HG309Cqs0QeqggAr6GWekJ207bwtX/KSNL3O2M8BeH5JUIdMRD8dbXz9IPWqI9WlyT1kn5dmirXtwIHXQw/dd1/KYneamJwrfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fC1wGXkjTgm9sdaH+SO0MwS6z+c/SPQ7G2aTB/7FYSg=;
 b=N3+iz8eU4FJoxqTIVW8MTeJolRrq8EMAyB647XrWloPNd8qLt+IPdr+HOki7uJiTm18i11jTGaGLjRforQ9o9V84XU0h2SlSEtcB4B5/BIwW9xCWNfSqxwRJDgnN0TsggGsWAcc98K0WRAisBmedmcIN3y8Fnp1fSLEJOzBukn0RCYb5VmPDzLoZUpOIUj3j3RknE6mBYf07v8LMTpaO25i+l3HHx+jWlaNkomx2UsA/uvSnIdmq/EZ+Jzsh4L/RokoxgkiM1R10b4eqDJabSrUFpIJ9PxOeEwyySlxwQaGwoxsFvHXY7Fn8W18tGYLIUiwzGIb4T8qx6dpMHp76lQ==
Received: from CH0PR03CA0027.namprd03.prod.outlook.com (2603:10b6:610:b0::32)
 by DM6PR18MB3765.namprd18.prod.outlook.com (2603:10b6:5:26a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 20:16:07 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:610:b0:cafe::3d) by CH0PR03CA0027.outlook.office365.com
 (2603:10b6:610:b0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Tue,
 22 Jul 2025 20:16:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 20:16:06 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 22 Jul 2025 13:15:29 -0700
Subject: [PATCH v6 01/10] dt-bindings: vendor-prefixes: Add Axiado
 Corporation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-1-543979a60ccf@axiado.com>
References: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
In-Reply-To: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 soc@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Jan Kotas <jank@cadence.com>, linux-serial@vger.kernel.org, 
 linux-i3c@lists.infradead.org, Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=878; i=hshah@axiado.com;
 h=from:subject:message-id; bh=76okLidoJP6XC526Dh0oE+YzQ6GEuPrslK8PDO1ML0M=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBof/GCwQa4NYpANc4Ku8aztbBMhqKwPoQvzo0DH
 167owfXZfqJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaH/xggAKCRDxWHMRoTLV
 +3S1C/96ufpGpUQshz/06EaRgUH5+dPIwmignxArVMcYq3i8ia4aWNC1TWrnxWNoyL/Kg+oemQh
 AtmA3LE15sdOS87KprhqRdAS9cjErpTIaeUnbk/Gyjge0/O9rARXp6phOvujN3E3ZL6cjz63MM6
 Yek25qmb+myVEkWnfAn4vo2Wnv1KOj5PPxhmUCAg0K1Hjg6zIgOJUbv6WkV2Vvs314F6+POAabB
 05D3t8qNk9YR5oHxD8aKiOKi97DmIyG2l39V+EoONi5xMPMxq/ZENPKfHHSAxov5UEwfo1CXPiV
 lB6w9nP1wyM1pyI7CaSIdD2WWTEU1db1OEHSnzquK8MUUA8HqaC8E5AK5XzPa33eiMlWP8x3Sfc
 18KCC9OlUy+JlKEbzwk5Jws5iC8Vyx6DwzHmThqnJSmbLPccjhqrbvYAL7Hdje0ogcJY1D2UUoB
 LggYG4ShsBCV13jzb1FL16TFJZwSxgDsZPX2sWM+Yh4mngVFxL87lCpHgnuCSSRskCkzA=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|DM6PR18MB3765:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb914e7-0fe7-4a47-b500-08ddc95c9745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEtIQ0hqdStkQ3hzWFRiaXFrNEREU2lqTnRrM3ZrWmxwNEJ4aDNXcktXWnM3?=
 =?utf-8?B?NE5mNC9tbGx0OXduaFZjamFzMTh4c3JvTVNvaHRRSXhmdS9QZzFpVmoxUWdJ?=
 =?utf-8?B?cGdPY0FvY3luVVR3L2R1QkhiWTE4Q3VaOE1JOHYxcDIySjRBRTNBR3haRXl1?=
 =?utf-8?B?RTFwVGxGVWxVL2VqeWtxNVhPYWhCUnozcnk5SHp1NTdoYjBHZDFBWWVBS3NY?=
 =?utf-8?B?bVpaaE5PWm1uUnZLODRlOUhvQzd5SGJxOG9HcGVNcGFseGU3cGFQQlB0OWd1?=
 =?utf-8?B?bzNkRk9PWDNKQ3o4L21QZFdEZmZrSURkenloOGZXc1FIVmpoaDF5OXhITVdQ?=
 =?utf-8?B?K0Jud1RSYklBY3kzNDZCRmg0eUNxZmZhU2RyZkhacW5SMENCdHBmUTBubEVu?=
 =?utf-8?B?ZEpIc0M3Y2w1NWxVZjNaNjZQR1hueWhEV0I0VXNEajIwOTJicHd5dVU5SzFi?=
 =?utf-8?B?ZnA2Yit5eHZLYndYbnNQSVEzblRUYkI3SG1tc25nZTZpL01vR1FYQzh3QUhu?=
 =?utf-8?B?R0NqRGdIYzNXUVFEN0Z6T3lTdGNtT2h2ajVvR2h2M1AyMXBZY1VGUlNWR2VD?=
 =?utf-8?B?dndXOS9ZWGx6NDZBc09lSlJDSThjUzlyOXlmMVZyWFRmNzNwUlVrejJoOEZn?=
 =?utf-8?B?bnJRb2VnMTExeW8zYnBQMnZzZkdKNVdnRDRnYyszNldDWm83aDIxMmFnK3Jj?=
 =?utf-8?B?VXBmTE5ENWJlS2tNWENyVU9lMkRvSklxbDRjeHZhUldjSEg3K3BRUVgzd2Z5?=
 =?utf-8?B?YWNHT0ViOExqeVZYU1REOWVobEpnOUpjUCtOR2FPME9WRnV2NFVnTUZzaDMz?=
 =?utf-8?B?bjJqbXNmd2I4RUp1SkI5WTc0amc5c29IUXM4Y3E2Ym9YTHJrWVV6bjFjdi8w?=
 =?utf-8?B?UnVLWGJZT3hBZnR0UG14aHpUdDNlejM1cENnNFlVUlArTlo4TTJtZEFNMll5?=
 =?utf-8?B?TXhHaU41WUo0K2NSRHU2REZPSFFQSWk5ajFUMzJPZ3JDSjZnQVJrUGpqTitk?=
 =?utf-8?B?NlFEUG1zUXNrekRiY2FxWkpoV1NDWkVKelYvUnJRRCs4Yi90ajMzYjhlL2Fw?=
 =?utf-8?B?d01XMFVBK3NQWnRyWm95Sm5ZdktiOVRnZTlTZERtMUtGSjdrQk5KQUNITVQ3?=
 =?utf-8?B?QXFPdndiUXFVTG1BcFc4TjV2T2MrOXFlcXArZHJwcHFYWjJVeldzc3RQKzQ4?=
 =?utf-8?B?M0hWNHRGaFNQVmpDM2xhNmZDYnpROTRKTWo2amplNUZBNGtoRmFPdS93UXVP?=
 =?utf-8?B?MXp5TVFFbDFsalNDZjZmUWFNejdSSmpldWpyT1pCdDdTb09PTU5ZSC9VYitT?=
 =?utf-8?B?SndnTDZjM2RFUnFhRno2NjcwdkN6NWRYbmg2eUdidlEwRUJxYnJhNWxROFRB?=
 =?utf-8?B?OGI5MXI0T2JtNGxUckRtcnpHK2diaCtqRFpHVVB5UXJmLzJmdnk2c3lkOEdO?=
 =?utf-8?B?QWxaemZ5OW9WaVRiMmsxa2JVdDZDS3pMNmY2TzFPK25KOTZ2dzRBd2FkUkMw?=
 =?utf-8?B?eTlTWlB0Y3RRb2NnUFRtZDAwQzRzUUxIV2dnZlRyazVYenZrdWxtNERNRXIw?=
 =?utf-8?B?U0lsNWVYTHJHaHNkOUtVbjVZMFFWS09jR1VqVzNzcFRmbm1GTWpBMENVRkRh?=
 =?utf-8?B?aThKVlNIZDBzUlFBY2pDRkNrYzFZT2J1cklqL0tqNWpHaXlYOGtkd29md0Q2?=
 =?utf-8?B?VFFPeDZ4UUhPZk8yZzBsaXRvb2Y4ZEZLQysrRGFZcTBSUHR6ckFXV0lVRXBT?=
 =?utf-8?B?VE1uM0MyTmNiNUlMSGU0NmFxaVovUklYTjcwSmMyVXhLK0dBbGdscUthOWRw?=
 =?utf-8?B?UWNmaVhZczFZYWFVUzljVTcwOFMxSzg1NXBhSXN2N0M3ZmUyU1d0YnRTYS9J?=
 =?utf-8?B?ZUp3VXJreCtpUXpFeDNRNDhUVHprSUpPaFIzNExHV21lOHJ1SjdOdmowc0lH?=
 =?utf-8?B?eDdhRFRHSVZuSVZMM3ZXbzBpVnVaek0rTkRIYklyaUpDbndaMDI4eE0vWENx?=
 =?utf-8?Q?xzGhWra3IwyyiNTsnnE0by6jDBT37U=3D?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 20:16:06.1596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb914e7-0fe7-4a47-b500-08ddc95c9745
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3765

Link: https://axiado.com
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


