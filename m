Return-Path: <linux-gpio+bounces-20455-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD85AC0553
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 09:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C55A99E1B67
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 07:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA40F221FD1;
	Thu, 22 May 2025 07:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Vf0vBD3h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2060.outbound.protection.outlook.com [40.107.103.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365FC846F;
	Thu, 22 May 2025 07:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898010; cv=fail; b=qx4yZdzMDPWc97NCfgxm40nArcreLX/N7wE7urnszt8FoVNA436Ukbp6k7ZPWiJn9vXNj6RtbWClL/Y/3YtCkeWe7rGsXDO4cCMZoosWGuqUQMIjOU/h88RMx7Q3k2qh3J4CpFTrYxDX/It/pbIgPB2Q4o6jk39qCsrMer2fYII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898010; c=relaxed/simple;
	bh=KNA4y8PXYggcC5TwWXWNJl2WbJEDv3TXLar/yePwUqw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=gL2v/kDYwfwrhsM6gAzA5FtkSHbszwtiFCsKq3ThY3jm+snZ0e6Z6E+DTJQ5phhAVIzXTqqZCKy5L/jvjt/Dq3pVEgNxmFLjZwl8uBi8k0RbStxz9vuIzxKIxF6g8RywWRFWLa4yMf8ae/pmERn5EN8GfFgeJ/NIQEZ8lJeL8ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Vf0vBD3h; arc=fail smtp.client-ip=40.107.103.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1klazqGGXYHbhzHO/BF1b1T0EcNRlXdm0fndB+weka5kKniTyiWzkZ1EJNYbRw1jeZiyZB7s72kIMYEr7Ix3G/VjYUPMwFaMYeKSJkwpaGj+YGg6LcawYc9nsVjIx5g+LRPxO9Qttqmxtca/u8WPrYuGD5S6Wv4cpu8byFG3ISq/r4miUVWXpRHDbdrZ6cB4g02+PHRWrcLkE3qii/T/IKocOoh7R62Gt0gKL83Xno0FuOHQ4tJ0EKBq7v4R56C9QffL1j9I1+2HNl84rTV9kXE4Mpc+Y4U1fbfltgMnyQvpCmKUtyvabT6ytcwlwuFsjdE1c1KjDkF+kkRYsd7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+GcS4IifT4Oez3RU34UkrycTnE/pT3fu4xV67mpALw=;
 b=yOyu7qq1EnUvJwT81aSRT8wUrpzRSXHhj/sO3Iwse6J2btzsqgzd8q2gVEn2LV2GMtE9HODJvXeydkFMvMrkG2S79glSWvdvQYgoLmMpmZk70vnoCGOoXFR8cQh1v0aspgmScWqptP9Un/rzKuQPDRs3LIn+AJaREscwYOfpJstvd4aG8x2FEVFklp7V2yeGlTGbGaHXu6f/kUkNq01P6ReT3Vi21yuIrwBiD8CsEx52azVh4ocic/fM/HMtJ8mMcQopVtnGqlDvgDPyT/tXPSKCLrpNvSFvD4oN4S90WIfk264kEYCGksY9z4WrLbo7+M51PF2EG652V7NfE8UH1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+GcS4IifT4Oez3RU34UkrycTnE/pT3fu4xV67mpALw=;
 b=Vf0vBD3hHwznFZX8TaUMf0JiRw/1mnw/VNbMaHb3L2GopCb5+QJzdltYGabnL0z6LZKcYWH0SX3993XlQEAuRzNIWKO+J21OQmtJvx3jOttQrzoSngrTx/fVQCHe47o3siLHfwrAzmlTTvyCbvj6cUV16dKSoEHGLp64VWUl9nNzln5hmu+6Xp4XWK179jJbrTGMohv3Jd78lYlFquhEXKxKt/ehXVGw1Z8vFLsE89ULbaGeOc713jz1m0/Y4aP/E2cJ9iWDZQXXKTWhatqodba+bixxc+S7QhpdXIxKD//BJCpChJFtry4BK74/P0x3/W4Kzg56Pw75VSosACTyZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7033.eurprd04.prod.outlook.com (2603:10a6:10:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 07:13:24 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 07:13:24 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/4] gpio: select GPIOLIB_IRQCHIP for various entries
Date: Thu, 22 May 2025 15:11:49 +0800
Message-Id: <20250522-gpio-fix-v1-0-98ceae7c4c3c@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADXOLmgC/x2MQQqAIBAAvyJ7TrAlIfpKdLBttb2oKEQg/j3pO
 MMwDSoX4QqbalD4kSopDpgnBXS7GFjLNRjQoDUWUYcsSXt59cnOEi2OePUw8lx46H+1H71/XzM
 qmloAAAA=
X-Change-ID: 20250522-gpio-fix-bea5cc4ace8f
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747897923; l=1003;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=KNA4y8PXYggcC5TwWXWNJl2WbJEDv3TXLar/yePwUqw=;
 b=KagsTUf5uexG9XOwcs44cCA1dUd74ZeyDf9Ru7zlYexni7qtLjY49yNSKLuLe1WO43/SbYHrv
 98zZY8qoHSvDDymoV6+vc8mmo59P/PxHOahDq7l06neqc9uesqaZi5g
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: fcbd002d-14ab-4006-e6ff-08dd9900243c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0NueWhXYU5YcDIxdVhIbVlVWENrNlh3OUp3RkVjV0phOG51R1ZCWjEvYVpQ?=
 =?utf-8?B?UDRQRkpJa1ZiOTBNZVpZV2xnS1h5d3BmTjUyT2NWS09LckNtUEg2MEUyMkpS?=
 =?utf-8?B?OHRRUmdqRGd3MjY4V0ZHdjJaYzBYWHYyN1owSVpQUWRNTWY0RFZ3RWd4NHpK?=
 =?utf-8?B?bm40eFpOcHVyaUcrSnJqZVdlN05Ic2kydEM2ZkQ0a1VYVkpOMDlFbjVYZ0M3?=
 =?utf-8?B?cG4xVDBlRm1KSVIvN0xjNlVmWldzbG4xaDFOR1IvenQwdVZ1QVNxckV0SzdX?=
 =?utf-8?B?OG51RmxkVUdWN1B5SjU0UUJKNFk1Z29hdHlRb0RDeXVaVjhUTlpaa0M1Q2xJ?=
 =?utf-8?B?RGlUdjc1SEtMcjF0K1E2R2ZLTjRjUmdjdUl5WFRmc0hxdUVYZHNvci94NFhr?=
 =?utf-8?B?ZXc2UzR2Mno1dkdwZG5OVnJicnlhMHBYWTBzVUN5bWlUNmJMTnBzaWxQYmpy?=
 =?utf-8?B?Mmg3T0hGYkphR09ORlRZcWdhdlNoWnd1N0syQjhRUHZwbjdMZ2ZLTEJocGp4?=
 =?utf-8?B?MUMyK25PdjFhNUNKOTJCcnFxbytkUkp1a1JEMnZFS0lxVG1kUEFDNmppc0I0?=
 =?utf-8?B?d0ljMHpBSzdJb0JnQk11eHBLNVJST2VZL05DVGNML2FzekZNaTE0YkdzTzhC?=
 =?utf-8?B?RVdqcjNlaXFjZCtjanV5ZFQ4NnJlczdMcGVkRDMzcGFGeFNDcjUvT0VyU05w?=
 =?utf-8?B?ZGo2WHdMRERkTlVtb0RXOVE1UlZzRXpPRXZjcXBYTUJTa1ZicU5SbHFpOE9S?=
 =?utf-8?B?QWNncDNpc0I2ZG5TZnZFemFRaWVRM01tMHVPNS9aRGJXaXRoRHZ6eG5zQlBM?=
 =?utf-8?B?SGNoVTlBRXh0dDBNbWNoc3ZicWxyREh0L0hYcm5sZkFWamliNHRMdHhDajg0?=
 =?utf-8?B?SXhLb2p0a3dNVlNJeWhZeTZQeHRPY0lLUlB3L0dOSDVwRUpYUzJoNldTZUI3?=
 =?utf-8?B?TzhiUVV4cmFicFdSeEduVHBBS01sYjFPSUo1VkhPR0g3WDZwMnVzVVlXazdV?=
 =?utf-8?B?K2ZVY1FXSzVVVkdwT3B6M2hOU25qNERaMXpiNm9qZW42R0E4NzRuUDdzbEFo?=
 =?utf-8?B?UEIyS0RuZjRvRVZvYW52OTAzVnpjb3N2Wml5dGFFSWhLRzZiRStUN3dmU1NF?=
 =?utf-8?B?SWpjeWJZQm5qVWlBczJ1ekpCOXRCdjdONUllc2k0OTgyQ1cxWFNueVN0Ykp6?=
 =?utf-8?B?ZkhzOE9wc2ZKNUF6TVRNK0FFalRVYWZvaVRYUkJITUVHZ3FSTmxEWGFKRnpB?=
 =?utf-8?B?aVZwY1hjWU00MXZlODZ6Rk1SNnlFSnQzZ2F6ekIxQnV2aklIK2swbmRBUjVG?=
 =?utf-8?B?cXJtdm5PRWVhYjFrbXJKUTA5UExNOWFreGxJSlJJcjA4c2pmaVZkOS9QMEcy?=
 =?utf-8?B?R0NMT1JBbTl6L2M3NDNOakJNaXJQdGV1UXh2R1BZMzRyTVlnbnBWeWdUaC85?=
 =?utf-8?B?bGxKMkR2N28vTlZDN1kyT3pIL1lRbHVJTUJ2MFcwUGdFcDMyejhsdUNjUmRy?=
 =?utf-8?B?ZFhJZ1QvWFN0UXpVdm9UckE4V1ZWUXIzVEZXSDdPMkRVdHZ2TVFvaHFpL0JM?=
 =?utf-8?B?Q21MeE1EbjA1UHNvL0ZjVUU5THFFN3BhdmdwZW85bEdPaDNmM3IyeVorS2Fy?=
 =?utf-8?B?MVM1ZDl5OWMrWEYwZkJvYnljSlJ3R0V6blFWNnFuaUZHTXQ2R3FwcWxqck9p?=
 =?utf-8?B?ejFmZUNNU3FXRXpRdi9wUnE2K3hDRmpWVjl6eCs4R0NkRDBLR1VLM3J6Rjlt?=
 =?utf-8?B?WnhxOWlILzlSbTBxcEUvYk1RS1Ixb1NDdlhoU202V000U1F6VVJCOVc5a0da?=
 =?utf-8?B?YlBkUWl1YmFpaDBUN2N1TkJuRE9WZjBhWGg5dWtmL0g2ZUNJMzY5VEZKZFpw?=
 =?utf-8?B?cVBxVjlQQVBWQTFqSjgzR1QvZVora2pIY3VZRUFUUllLQkpJbzZpOXdjTW93?=
 =?utf-8?B?ckhSdHNOTG9TeEdMSEEvK00xMFN4czdiVnpaMkQyL1orNGQyUDVXb2V2M3N1?=
 =?utf-8?B?R2dhOVNUV0RBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHBBWDV2UHE0VUxFazlMRDY5L2gwZ09SNStaOWZ3WUVFYmRqZVc3c0NxRGZs?=
 =?utf-8?B?bHNmd1FJNHdsMy8va05XMlVaV2hjSllzdDJMWnpCVExqZ1dSL0Fyb0xBekpx?=
 =?utf-8?B?N25HM0RYdEltR2dvSEZsVFJJdUxPK3FqY2tyQ1AwamZITlhjclRWa1lsUkpQ?=
 =?utf-8?B?MmdyaEZjRnRuUW9pZlQyVHNmRDdoWktuL1Ftc2syUWM0MDJVbkZjVXJXdkM0?=
 =?utf-8?B?MnRTMFJXU2ExWlFRVm1naGJyaVRKYmxScGtJcGY3ZEt0cjM3SkdLZlVKTUxR?=
 =?utf-8?B?TzVvZWc2ODRpRDlNNitBdHB2dU96d1d3ck9pbUozK0M4ZGtXaXJER2R1Tkpi?=
 =?utf-8?B?U1FOb1pESFM0cnUzcWlIQ3FSVzVJVDRHdjhEOVcvK3hvY0tYYzM5WmprTmhD?=
 =?utf-8?B?bWJWYnNiUkpKL1JwTkNlUFE2cGpYSWdFT1VNVVA4VDFPMGlGMkpvbVdBWTVm?=
 =?utf-8?B?QmZnL2t1NGtra0JvM0dlY3hYT0xjbFgvYmNVSFNwUjV2V2E3aFFMTHhqbjE4?=
 =?utf-8?B?RUVsSWJ2Nzd3SGI0T2N0OHUxY243akdKOGFvd1VhbnRqanM1NkpIVGNKbi9u?=
 =?utf-8?B?YURCZ29SeWtnMDhJZUdnVmRZb2RLai8zejN1RXdXb25QNEFxaGVHemhBYmFD?=
 =?utf-8?B?ck9EbEJYL0tIcVBKTDFERjZlUll6TGwxazNUVDMzVDRjenF2eHhBZDROajRn?=
 =?utf-8?B?UU9mWXNhOXF6UENpQ3VNK2NlOU9vTzhBYkxXdEdUazh2RTJrOENPVEpwV3JS?=
 =?utf-8?B?Z1I2cVNtSjFxWStSWUhxSkNMc0E5K2cxS3cwdmNVRGtJb2NCSmVDRThXWWMw?=
 =?utf-8?B?SEF4WHNxVnNLS0Q2Uk12WkR0aUhLOEdqZ3hJWVNXWjBabm1aTXB2K0NvbXhF?=
 =?utf-8?B?MWpTMmpEay9JVU1mS01pTVgzcUxPcjJod1JxeWhIQzJjZ0RyT1ZmZTBOZGlP?=
 =?utf-8?B?NkdmQ3NrY2FqelU5R0JCd1lzVjZKdzVzUkFRTTJYMTM1UktQNlRKVGxoR29s?=
 =?utf-8?B?UThWL0h4WW5Zd3FUQjBzR1JEbGtEVmgzME1ERmpzTWRUM1FyTmIyRE5LL2ZD?=
 =?utf-8?B?bXpaa3NhMW9LMURCdVdoV3JVVE50SnRnZDYzMk8xN3JTU2lvaUp2Y0NpN2ph?=
 =?utf-8?B?Wk5VVHRvd2NqOG1nM2ttejlxOEU2V1pMVkRHSW5KSVpRbHppMTZUQldxc2Fy?=
 =?utf-8?B?ZytuZFdkTUNyUlB2Sm9tbSsveXNSc3MySWtpNWU4L05sQnhnNzBJdFNGUjBW?=
 =?utf-8?B?NTI4RWI5c1lwQXpsUDFhNTlvOGFNT1FmNzlJVkpoZUxySWJFcjRnM09YRUhr?=
 =?utf-8?B?L0VmWWNVOS9MOHpwclpiL3U0L01acmN0Vlhwa2JoRU9nNy80SCtORmx3K3JP?=
 =?utf-8?B?aW85TUlhR3RJeGVqVUhoRUp2MWZROWpNZzVnOE5NRmpmY0NRSGJtTksyTTM0?=
 =?utf-8?B?ekJ3dUpDME4yblVxWXBDWHdQNCs4VCtqLyt2cWtJam1xOG9wNHV4OEt1ejVk?=
 =?utf-8?B?cENJMklDMy96SkE2aDJKOXN5djJSdkhOMmliYmNINlErbWpLMGhMNlp5RzJ0?=
 =?utf-8?B?emRwWEU0TUNNVjhpVVNwS0gzV291VlVVUlc1ZTR0ZXR4YllMVWdtNXNySDl1?=
 =?utf-8?B?ZTR1ZTZrdERud3p0M0tTNzJHb05FK2psb05DdU9FZmJBVjdjTjlJZGg2cjN3?=
 =?utf-8?B?VkpuMlNQaHBuZ2YyTU9RVERxemo1MG0xVjRrY25JL0JSTXc5RDJ0bHhzNnZI?=
 =?utf-8?B?Njkya0JoTDZrK2crd2luNTZsOEtYaGtzVXlkODl4dUFyU0pnbjFFc3FuMVMx?=
 =?utf-8?B?NnpzS213Uzc3dUFvc1UvWGNwOTNhb3hzcW9Tb1M2ZzI1M3FhZjFzSllnZUE2?=
 =?utf-8?B?eERaS0xjb0tZdkVXOGFqb3RTZ1h0akxHdzhYVVBwRVdNZmpNR1o0R2doMGFV?=
 =?utf-8?B?MW9BYzZETTc4cGtkVVlkemthcUhWQzNFSGp0QVBwUTJiVU82MFRndHBUYiti?=
 =?utf-8?B?bVVTdGZpWmZFSG9obHZ5amlHcXlndjNFWTRicWNNRmE5Yk9pTHVwOGo4Qlp6?=
 =?utf-8?B?eXltZ0JmVzh4Yzhwd05qcGllcWVkTlVhQTNhZU8wREVpaGYySlBRN3pSRnUw?=
 =?utf-8?Q?2w864eMtErD7wij+hoL0PlAJf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbd002d-14ab-4006-e6ff-08dd9900243c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:13:24.5625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xFxgpF/jyQjF9NhL4sRag8KxpnCoq+3bCjbEcGKiT3r0GsXy2XtVyYBosnxuGqBkywG25eO3QW09lRGhdqf+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7033

There was an effort to make irq_chip immutable for several drivers,
but kernel test robot reports build errors for:
gpio-mpc8xxx
gpio-pxa
gpio-davinci

Thanks to Bartosz for helping on this.

To avoid potential build failure with random config, select
GPIOLIB_IRQCHIP for bcm-kona, grgpio, lpc18xx, timberdale.

Build pass with:
 for i in `ls arch/arm/configs`
 do
 echo $i
 make ARCH=arm $i
 make ARCH=arm zImage -j32  > /dev/null
 done

And build with arm64 defconfig.

Hope all is good now.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (4):
      gpio: bcm-kona: select GPIOLIB_IRQCHIP
      gpio: grgpio: select GPIOLIB_IRQCHIP
      gpio: lpc18xx: select GPIOLIB_IRQCHIP
      gpio: timberdale: select GPIOLIB_IRQCHIP

 drivers/gpio/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
---
base-commit: 4e9d73034196ac8ab496bb47583197b36ba13327
change-id: 20250522-gpio-fix-bea5cc4ace8f

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


