Return-Path: <linux-gpio+bounces-29487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3649DCB8DBA
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 14:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 368CC3041CD5
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 13:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C02320CAB;
	Fri, 12 Dec 2025 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="o/sg3a79"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020076.outbound.protection.outlook.com [52.101.84.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3F1225779;
	Fri, 12 Dec 2025 13:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765544623; cv=fail; b=KdTXeTRTF23lNta10J1sd0znnCIQfogTncgMV+vBdGPOYy9hYvY2pJTW1Z91K0K2ny62KAxfxXwh5R7Hdlk8Uq0IXULrqf1VN1785seorOhewV62Vi6U6RWZciu84lRtoxEd4+VfGoiBEf66MFZ65edZAv7GhbNvB30zVfoyKjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765544623; c=relaxed/simple;
	bh=ggRv/RKqM7pQMDPmVor5G8V7NTDYqyeSFgQz0yYK4XM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=oszP4wwlvQQykzzl7arm7b2X/vZM92Mkn3rTyAx0+EoPVvsLTkoCKCDvICxToEFjfPVSA+BkfagyqVsenAdo9kGGr/J0LA9Z9D2IZp5QFkOscF0lJGFripJ0CE+9zLF0AAaYTyz2zw7dJolWWe06T7XnJuDUR4dKhnngfuq8En8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=o/sg3a79; arc=fail smtp.client-ip=52.101.84.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VA4eqvIMPIWytWJA6gE/XtXcQZdMljZVdKxXkBaYUW/gQIJ8eOEOQNY8tRL7ehPdlEyzsfs8CQVpLmCL7RLxaCk3R7mKhXSA9bunf3hXHw2CxWZBwZH5i4tJNWNpYG9atLOOrUoSUgl9JqGZ3l+XZmwaVKPTcJUmXdzTZlgx+UPwekx1MR0epvU5wgb1VMB6c6ZDb3RHUoKdGRrZtk5Nx9g8MAmczJkSUomgvWOs6e9Bm4zJ6BUFYowCcq3HX1P/qHkxS2rc+zicyQnHawI5XdvqA5K/0Ckwaq6iEIUUWWBFxCXMtsm64KsdW6POceHYdqoIBFMobiMA27LPp+KZgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBmewPyyqowbBaImbguZvb7gZHH3PlKVNSV0DBcgTd4=;
 b=YmPPRUznV6JZ2fmoleUARC57XlHRww5WLk8u6u/F7lrH7c99wxpq0pm3Y+qaPxKAmz0iVWa61XS4CLHQFeqRFOfNLrn1Y4MSfrBoqeukqj9DPRT7CdJHJNfl1nJ5x7bZHJXkRG5DQlCyroQdTGkebcvfS25jttUNvAi37r3fq3nCrFjYTxTkGus2aBDhc4I9GmFmUHSBi5YqhPSKLaF4e0nuphGvPXAJm/jz1hFP+VBxgCGwNLTWdq6mxp50cZkoYMp0GijbtYskzPGSFDm2t1ZtOu7U8HJRwlQg0z9GyCojMvX3uk5XntFsSJpzzL6I9Smft0oPZO8N4P5NOUqHWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBmewPyyqowbBaImbguZvb7gZHH3PlKVNSV0DBcgTd4=;
 b=o/sg3a79WOTXTh9zi0RH8lZ43V4zAzwlzMrMktukAvfoIVlOj3ulAPf4M1qC6lhr6IkZ3D2wYkx0x/AeTX2FKhl/ABp92c/Kds7E9X67OBzFPh0aR7nIvPA9CYotXIEOS9S7pFdg84ZdgB9Q53AwIBs8/iccHok7ix6Km5V13KsaCdp6yWmVkBTQux46nvMaBliywPVf+IWp7AZHsR21OQgvgDGprafKn37m3n43f3f1M+Jd5IbH+/3Eg7lYyb1bYkHzlMHzmxI6zpVYJ6nBsaP9/HFrBIQU1LWK+UIMdJyUInRJhYt505mF6IA0a8wN9aoco6h3UkYLD7j2xRkOpQ==
Received: from DU2PR04CA0211.eurprd04.prod.outlook.com (2603:10a6:10:2b1::6)
 by VI0P195MB3080.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:2d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 13:03:33 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::84) by DU2PR04CA0211.outlook.office365.com
 (2603:10a6:10:2b1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 13:03:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 13:03:33 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 12 Dec
 2025 14:03:32 +0100
From: Jan Remmet <j.remmet@phytec.de>
Subject: [PATCH 0/3] gpio: pca953x: Add support for TCAL6408 TCAL6416
Date: Fri, 12 Dec 2025 14:03:15 +0100
Message-ID: <20251212-wip-jremmet-tcal6416rtw-v1-0-e5db1b66d4cc@phytec.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJMSPGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0ND3fLMAt2sotTc3NQS3ZLkxBwzE0OzopJy3eQUw5Qkc+MkC7NUSyW
 g7oKi1LTMCrDJ0bG1tQA3U57NaQAAAA==
X-Change-ID: 20251211-wip-jremmet-tcal6416rtw-cd1db73b86e9
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Levente_R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>
CC: <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	<devicetree@vger.kernel.org>, <upstream@lists.phytec.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B96:EE_|VI0P195MB3080:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d85eb0-7322-40cd-3b9e-08de397edab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZU91SnR3cmxTZEh0eHBEckdmUFgvVXNBRzR4eHVqR0hZRHErWHJSdXpXRk9q?=
 =?utf-8?B?RDBhTVhKTm4rTnpITUFkU0hSekRBTkx3K0dpVWp5cSttREcrLzBVdVZtUjJR?=
 =?utf-8?B?dFFNVU5ITW16WThOZ0NiRWs1OG1Vc3RzUVE1MkxzWm1mS3hqMlpuQjdlTGZK?=
 =?utf-8?B?WnVJN3FGTDNIRVNuVDVldFI2WlJES2t2T1pqK0V6WlVicUs3MG1aQkRxa0lu?=
 =?utf-8?B?ODFXMHlKOHZ6RXcxT0xlSkNZMmt6RlE2aG1ya1IvdzdoSm1lU2dhSzZPUlVX?=
 =?utf-8?B?TXBvOTdQdEYvNGJJcFJrR043LzFGbjcxMkxIa0JnWE1vUWt6cWhWaGUvcnhS?=
 =?utf-8?B?SUpuT1Q2dFdUR3owcW84Z2RVOVZURE5FZUpTL0NmUGxpM3ZVa24wajVjYkto?=
 =?utf-8?B?UlZuMXJ4SVB2Rjk5aXNURTZvYS9yYkQ1aGUwc256djgva1BmTjRmWG5GUW5O?=
 =?utf-8?B?c2hzandPZ3F6QU11c3JkM25CbDQwZm0zbHkwT3hNcHMzSDdCOUMrdnhKbDla?=
 =?utf-8?B?NXp0UHhkUUpiQmduVXFqdGpJNkVDQmc0bHdkRGZNemdPT0xCRzBVaDZzRkwy?=
 =?utf-8?B?UkNXUWtOd1lMRm9KYlorUTh3Mm5FVnVtd3F2WCs1VndBbUh3a0xadlBQUllu?=
 =?utf-8?B?bEQwbE92cTR5Skp1VlBranIxNVNzYVlLbk9iWjJZOHpLb2pHUEVTcEo4Um1t?=
 =?utf-8?B?U2pyeUZWQmMrTjVRMWRIR1MraUpwRVdsYTF1VXMrTXo1cVVlYk9iMnpQbHJu?=
 =?utf-8?B?Nm9yakhpRGt6bVpGeVRYcVh0OWFyMFBUZ2ZxbGIrZ0ZWZGFlVTJWRGNhcHdw?=
 =?utf-8?B?Z0ljcnNUOTFVNmJqT3hNNTY5aFdFbTlwNXpZcTMxZ1dVZ2VBcHo0NTdZYjRS?=
 =?utf-8?B?MVdKKy9Na1phaW1yMHk1RkY1L1E5WDhDVHFEY0gyWnpSczhnMGZkV2dmVTZz?=
 =?utf-8?B?MnNXMG91QWRPcFM1YWpYcnRkcllISnVjV1MycGhpTWs3K1NzSWxhWE1mT251?=
 =?utf-8?B?WGZSMFNDRnR1YjFlQTNxVW0yQTZCcDFlRDRZdzNxZm03VHpqM1N1clA2cWt3?=
 =?utf-8?B?STRiTjlRNUxVMVZxek9HbFN4RFIrY1RqZ2R0bGJiZk5KdTUzdHA2b0dvWFlj?=
 =?utf-8?B?cXZ5WHQzaUtBVXZHd25zYzllY1FWUG5lSkhXenVlZExnVSszZGQ0RXNwVThJ?=
 =?utf-8?B?RUVsMnFoQUl1M0NIclNFczJUdU1OMm1hUlpGNUZYajBlOVd3K0hVc0JjK0R6?=
 =?utf-8?B?MGdkVVhoUWpXalhPYkFaYVR1Zk5FanZGZ0lLYzh5YjFuU20vdVRDM0RaZDZR?=
 =?utf-8?B?MS9oTDl0bDdycVdkbXh5MkJ2N1RqVXZ5a0ROQWdhUGZ2dVhtTkI3WjJaZnpE?=
 =?utf-8?B?QU1vSnFlYTN0VGtBbENKSEYwTlc5cVFvYVQ5RlcvMGc2ZGdlamdKek1mY0Z6?=
 =?utf-8?B?WHJjN3QwaTFFWG8rWFUwdURwZlo1dkx2eXQxaHRHRk4xVVQyV0NMUXNXTHpQ?=
 =?utf-8?B?Wm0rRW1JUzAvSyt0ZWpjV1NsNGpJb0FXaHN1Yy9Kd2h4RE9PWnFWTzRPS25P?=
 =?utf-8?B?ZHRNeldDRW9Wb2dIT212T0VxRFoxUzVlWU84WkVoRGhHZWFlNzErQzRJUHZM?=
 =?utf-8?B?R2pZSS8yYjN1eU42R3czL1g1S0VORXg5eE9CbDBZOXl4aUwvUG1ndWEzNGxw?=
 =?utf-8?B?dFlHeGx4NkQzV0hENzg0QXlpWXBVZ1ZWT3RZUEpMZkpYanJNbmhPeXNybXdu?=
 =?utf-8?B?Zm53OXl6dnBuaXhDcmNlSE5SenJDV2hVZExHSFIwMHZVSFM5QWROckQwVTM0?=
 =?utf-8?B?a25yUXRLaFFrN0I1L1kybzdUM0RJVFFvdkZPYWhvQzIvUUxPNXhNRXVrVGwr?=
 =?utf-8?B?RmZuYm1RWERxMCswYXlrOFNkNXA3QnBpOFpUTDZsTWJta25zUTdWVzZ1azlP?=
 =?utf-8?B?Y253VHhjcDc4U3locW0xZ1ZHekhGV012Z3A4TjRLbnVOeWZoNDh3Wk5rZWcy?=
 =?utf-8?B?ZTU5Q0FNbFpoRjVYenp2Yk04eGMzOXVITHhOS0s0eE94eGJxelBqRVMwTjRL?=
 =?utf-8?B?Y01mRG9EZmFTTW02K1FKN2FWSmlWNi9OU2RSNHcvOWxkSkVRVjVwTi9WN0xS?=
 =?utf-8?Q?l4Ws=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 13:03:33.0310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d85eb0-7322-40cd-3b9e-08de397edab3
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB3080

Add two compatible. They share register layout with nxp pcal6408 and
pcal6416

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
Jan Remmet (3):
      gpio: pca953x: Add support for TCAL6408 TCAL6416
      Documentation: gpio: add TCAL6408 and TCAL6416
      dt-bindings: gpio: gpio-pca95xx: Add tcal6408 and tcal6416

 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml |  2 ++
 Documentation/driver-api/gpio/pca953x.rst                | 12 ++++++++++++
 drivers/gpio/Kconfig                                     |  4 ++--
 drivers/gpio/gpio-pca953x.c                              |  6 ++++++
 4 files changed, 22 insertions(+), 2 deletions(-)
---
base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
change-id: 20251211-wip-jremmet-tcal6416rtw-cd1db73b86e9

Best regards,
-- 
Jan Remmet <j.remmet@phytec.de>


