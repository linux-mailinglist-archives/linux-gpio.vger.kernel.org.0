Return-Path: <linux-gpio+bounces-23649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5782EB0E4B4
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 22:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 318577A415C
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 20:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CF028640A;
	Tue, 22 Jul 2025 20:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="rKz+fZ0D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2104.outbound.protection.outlook.com [40.107.96.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C737F2857FA;
	Tue, 22 Jul 2025 20:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753215378; cv=fail; b=VFmLCy3wi6dwEy5aISC8RxEDAfgm9MxUqc+q4AQh7E/jKqAVXTQFlz0gOtfulTAEFk0aioTv3G/rn0vDtG2xUjuckcdzYbTQCjOi4hOEjvezQN+tSFCjEu9O7yVzVxw9M7e1sn4VacUaVN4Fax9x6YdZ1rNsD5280kXThFtAXQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753215378; c=relaxed/simple;
	bh=4q9NF9Q5KkScu0ssMxhhdfOxufMmPkNyc5YFfIX/q7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEwGQH5AfX3q4hCdZeNFsnqhUAU/uZgSI1yLaTSvXbd4O7jngBUfm7HV1fppTWMZCfE1C1GqrtNm0ASocb25DWhrACl97+L1YAMLU7fZJR0t7v49O5N/l4IOz6UbaBZnVdP5hIyzULr6XaVmCxBRJxRQgRkh/ZzJyLIh7CLx7Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=rKz+fZ0D; arc=fail smtp.client-ip=40.107.96.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxxEOI/sJ9QuR6uzthTq0Ps/Aqbfs7bJQKZf8cDG0JxEsCPlrT1jaFGl/PEvGTamM0bc67YdyLvddfl/I2JVSxSxiNS2a29dXN1WUGO7SFIm3xvEQ25FuoJRan8lfZlkZBNZWoC/FO8mxGJBsBBsiVW6mISfojmYuU6vxzJnGFaXFEt1iUCw1DkThSCxa8Tk/OszGjacCHNku1J59gX4Fn0/0o2oALrrMqmBhZmP51ydkN/1HwMBEaLMsp2YiZJEFGE+tJ8Ctz9iSlpQ6RPS4QbnhhXcmhCGsmvBlkU4UidpFCLVL4mZ0Nc5ugjZFf6wUWLAhmaNA2xq1TroV5FQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2WfnhP06WI6OPEd5FqkdEoK9R0f4JgdBqGcKNbpiA8=;
 b=p33ETQDF6CkIYwOY0RY3zfhv7jGnp6neTGX4/xXlcfMjZTpkgfqWGSFebR6ZmejhywPAGLmCRgJ0oBLUvsR00lc/GredPo0IiHf6mpnXVtd/d2V3MdZozRTHPBw6QABKFYyrOFnPKSzK3nU8LL1Gof36Js2S2J/YVFL8k90ptwN83HW5+XJyVa6D5s8CMN5NoD/OJgKb01mAofILw4E15MaUrcPuLKYXoPuK/vhudoM3QTLcXbp8tY3KL0C5/5gwxnSWE9XG4dZh6HyyDmDCg45ZZKYSQpSrXe6+ojg3xPw4SjT96XxzSXDMv3Qt6HI5+YNlVueWzMCfvxEGqZGobg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2WfnhP06WI6OPEd5FqkdEoK9R0f4JgdBqGcKNbpiA8=;
 b=rKz+fZ0DIx3aM6y3JFTGboDoKF0p4MlTKJzIwQce1OqdRYRgu1udqzOztZW+nLJ77+obIZ50igO4AH0AkHKORaLpauZOdgL7hus6/psIk4GdosFIyhJl9S2OlT1V74tQX2yKnflsiw/rv3c2CrJoIMitQCVazlsXZze1tI5sdVebz+JZXpyi8QxRoFH6Z2/8RUoJwcZEZXAmM7Q94HORVBPwoctK8PUkxJodCHu+kvHhItEFx7QBdUiypFX+vYxYKnaVWgZH9BnlBDBQgWqjI5vrtZMJkHMz8GxQEqMZB/VyL0IC/wez9bxINAQxgwq2RCCEWpnIUx/Gfy8N8GMHFA==
Received: from CH0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:610:b0::20)
 by MN0PR18MB5899.namprd18.prod.outlook.com (2603:10b6:208:4c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Tue, 22 Jul
 2025 20:16:12 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:610:b0:cafe::36) by CH0PR03CA0015.outlook.office365.com
 (2603:10b6:610:b0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 20:16:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 20:16:09 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 22 Jul 2025 13:15:32 -0700
Subject: [PATCH v6 04/10] dt-bindings: gpio: cdns: add Axiado AX3000 GPIO
 variant
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-4-543979a60ccf@axiado.com>
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
 linux-i3c@lists.infradead.org, Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=hshah@axiado.com;
 h=from:subject:message-id; bh=4q9NF9Q5KkScu0ssMxhhdfOxufMmPkNyc5YFfIX/q7c=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBof/GDIY0LQL7f59hS7oSO8AS0j15UV2jDDk2ex
 Q+m1hwyFCmJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaH/xgwAKCRDxWHMRoTLV
 +15mC/9W/qP4beY1+5fVPxD87lLQq11UnJechJX0ZIwItMD6q7/ic4enmmcCyX9cVgK2xR/Ae7s
 lPawRdSvr8Mz57NS84OshVg0X44JPDcKymnF0HQMe6C123+9+t0cscezexTiXSdRFSXSrJ1axne
 0LRetRbg6SvrP69RaXYU1uwJm74AALNS2s5yEkwix8eVbLnqqAXJsmtvdr6SKJXqL1wwQgRwSB2
 6HPLXWxSY7MGaYpbCteA6alyM6Ew3NMZQvhNZT8EsAUJUp6Pch6ofCmcbva5CNy/5JhIKqZsclQ
 mc5H2W8vTol1zyD7R0gYQHImDOdFrjJaJnwropS4ZSnyEhEflgtsC0xDaAhqrjukXCcdLCyE0A6
 yMc1uZHECzSEfynsNxfsTHgvGc3QIfIGabwcCjxVDQtBom1X0hDBwUooAQChisfsJk+KPTGVnC8
 K87pRg2H+xwNTJplrcBhCnt0H+hq0rRutRqLZ+yZ6dN5e6Hz62L+IK1FxE3Yn/bwbm2jc=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|MN0PR18MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c8b3502-7c1e-4ea4-cffb-08ddc95c998d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHMzdzhZQmdyN0d4aHRIOUNmQld5eXVWR2thWlB6RHFwVDdqZ0h3OTFzb1JR?=
 =?utf-8?B?SXF6a1dPRThyTmVXQ20wUFdILzhITFJpRDYyNmpnOWFtbG1RdEJVcmpLak9Y?=
 =?utf-8?B?T1VRdnB5NC9Dam1xeDFFSnczMzNPRTVxOEpuUThGOVpaOUNVU0JldHA4SlNo?=
 =?utf-8?B?RWxkSXBqRnpoWkdFdFdSOG1IdGQvV2k1eGt1SzVjcTlYSThNU3RpblBUY2tj?=
 =?utf-8?B?YmdudDErQ0tTRG1pNEJNa09nUG9CRVRLaXRUaDBmNVdnNWRYQ3NlaGM1RTRP?=
 =?utf-8?B?RVlxNmdWK21qWCtYbWMzSXAzRm4wZDBwenhlMm5aM2FNUmV4UXhUUnFvUEhn?=
 =?utf-8?B?U3dBQnZjM1l0SlI0WVo4cHV5NGNBVDdqQlJSN3FtNGc2SVAybWxyTTlMQnNM?=
 =?utf-8?B?VEVvNFdCV1lmaExjZjNyUGJ1UWdDRlNJRC9wU3RJN0swMGFYK1dZL0N3b3Y3?=
 =?utf-8?B?VGc2MHdISkEzcWdEVWZxTGV4RzBpcDN6MzNSSnVHZm1DeTRUc1BvVEh5Z1VR?=
 =?utf-8?B?TVRrcURXai85bXg5SzFINGIxd0pMWWxEcGREcHE4eVI0bHFLaUJtZTB6YmhG?=
 =?utf-8?B?M0MrZk5UcVczSWgvd05UU2x1ZTJsSnFyNk1xcVRNWTJGb1B5ZGJyZVc0TG9t?=
 =?utf-8?B?VnlkWCtIVTZMcnhVdXJqYjE0cEoyOVVaTUR4SFVtbHRkeVpvUHZGZkRrU1VM?=
 =?utf-8?B?bkNsSyt3VmpDUmlvQXN5MnRHRFVNdXVvSWcwR0JEMEs0bk5zK1R1ekxDeEhS?=
 =?utf-8?B?VVg3SDJtTEZENW5tZXp3OWxKZnY3TEt1S2hzaDdabnlzUi9oMGpwUjJUTU52?=
 =?utf-8?B?NStoeXJuZEI5ZzVWa3JkbEF4VmpWRVJDQ2pCOHpHbzFCZ1F5YUhQRkpYYzhE?=
 =?utf-8?B?VWNsSnBNbXVJOWZuU3NMbDljd2IyQmJ2MUt5WGtROFRzT2ttZ1IveUkvY1NX?=
 =?utf-8?B?NTQwek9wN20xWTVCa1B0M1BhKzFKd3FkbkhhZHBrdURVTlU5VXRZRkZyeWlF?=
 =?utf-8?B?aFRRWm44WlNEbTUyc25KVDVsQm9FMVltWVBHMHJxY2ZFQ251TzlYZUpOcGRZ?=
 =?utf-8?B?U3hpZVV6dUx0VHg1QUs0cXJCVmNSVGcvdmd2b2lza2QyQTRQdTdMdm1RNkU2?=
 =?utf-8?B?bkY5cTRteUwrbmhaZGxIMEZsNmdOV0VCVE9DWjlxNTU1YWl5bWRoSzhZanZO?=
 =?utf-8?B?bURsWHNkY21PTlFjVWppSk1sMXNKMkNLeEVvNm4xY1Q3cUVtQXVHZWUzMjYv?=
 =?utf-8?B?eFNLR29iMWRUdDdoWnlGcFdzck5EYzBaQlFxdWh2WW96MWF1MFdRN3djSUV4?=
 =?utf-8?B?YmY0YmFtWW1jWFlNZ1Mzc2tMemo2bmlwVUxkaVozRUUxVnJPR2NlaE45ejRX?=
 =?utf-8?B?UkVRN0EweklqUEdselRMNnFxV1gwK1I3SVc0b2tDb2ZMWjlwSzVLeW1WZVlJ?=
 =?utf-8?B?Mmg2azRWZU9RL2NMM0NTUXBGTGpVVVduWjlXNW4vdmdhVWRuN3MwcjNMUG5T?=
 =?utf-8?B?bjR3OE5rYmNGMDVsQkxGa1FwdmxNWjBCQTY2V3Vka3Z1SDVvWkdvYVFRejM2?=
 =?utf-8?B?RHFNNXFLV0ZzbEgxNVdQdWpyWXVSclAvOCtOUFZCYVNVNUpHUFM3dlJheEMz?=
 =?utf-8?B?U0NlWHdUb3pFaUwvYzhZQU5ybDFhVXROZFgzUnFrYy9rVUIzNlcwZnVZbWlL?=
 =?utf-8?B?K2hkZGlWL2wzYnFMS24xTGZwVHZXR2F1b2NLaWZWaVkwbUN4Y29rbVBveHdM?=
 =?utf-8?B?QTd6dlBtRXBlOW5LM2FZUnQwTGgybWEvL3orOUJuSGZxVmpRNG5oMksxOWJR?=
 =?utf-8?B?ampRamJaNkZ3aHhyWEo3b0Fxek5FWVJTVi9wK0d6R1ViS0tLdU9JR0FjWGRk?=
 =?utf-8?B?dHlZb1dUaUZyTks2OVI1MFFCaDZFazdKSGUyV2NLK0tLdndQdWxveSszZGZF?=
 =?utf-8?B?RG5GaG8xcjZVQksydTdlOU1FTE5tQ2liV1hDKy9YK2g3WHdqZlZxNjlKOHAx?=
 =?utf-8?B?alFZV3ZGT3U2cFoydjNtTnB3OExuOXZDUW9nYkhYOFNOWE9PaUE1NXhBT0p5?=
 =?utf-8?B?eTA2WEFTZGl0a0tLTjJsR0VvdWh2bWVWNGdlUT09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 20:16:09.9476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8b3502-7c1e-4ea4-cffb-08ddc95c998d
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR18MB5899

Add binding for Axiado AX3000 GPIO controller. So far, no changes
are known, so it can fallback to default compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/gpio/cdns,gpio.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
index f1a64c17366500cb0e02a0ca90da691fd992fe7d..a84d60b3945952a1991492064ae6494df91c966f 100644
--- a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
@@ -11,7 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    const: cdns,gpio-r1p02
+    oneOf:
+      - const: cdns,gpio-r1p02
+      - items:
+          - enum:
+              - axiado,ax3000-gpio
+          - const: cdns,gpio-r1p02
 
   reg:
     maxItems: 1

-- 
2.25.1


