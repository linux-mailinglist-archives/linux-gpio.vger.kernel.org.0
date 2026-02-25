Return-Path: <linux-gpio+bounces-32197-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFIgO2mMn2nYcgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32197-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 00:57:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9009A19F337
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 00:57:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95B1C30F29E2
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 23:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52291387571;
	Wed, 25 Feb 2026 23:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Nn1FCUF2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013038.outbound.protection.outlook.com [52.101.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A571387560;
	Wed, 25 Feb 2026 23:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772063735; cv=fail; b=peryyICgeygXmktGRuYmey+OnIaLMPu0WlVtQdSJsI04Uh11WsdT0F+1iU52BBpBvcGdW5D5YL0SPRhSLgUTkYQonnNl6iM+9U5NCo7p3Z8mvbP6IrlkmQYWAkdzg9s4tZlTSN2SSecvTwRZax8OcxLRP+xa3WpuIzuPWfu1uwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772063735; c=relaxed/simple;
	bh=cUCrV+VjWKFme90gpKEqsUHbiwllcC5zrPNOFnhNp7w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dXvzzQnC/qPO+gIVii1+Uq7vZIlB57NvEtAiz95Qpu4Kx+Y543BQOHzNbvYAIJM8ni/tEtNvX08Yw+fhAgeXds6NOy8jLzkpCMBcZ1yeOv4iKH1U9HdqxlevcS1YDHw5B3ueIfFLu4YWZCt+2/lG3K6pGKtrCENo+xiF6SBE68g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Nn1FCUF2; arc=fail smtp.client-ip=52.101.72.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywh9WP7J74FCa9EmLMAqU1HSPXGUDs1aZ+0ATucHdShxiB5iKcQE5b4wBoo4uTtnkhqhpkq/PlIUfPGXvbWkdNDf1rivSLZmYcc1WfwEqzGdi5JEnDt5Uoy5Qbac/kyEtPnLn0A4+MFe2yzDZRDdPlhBbsWpxSqd05vhwBPaFNRjypeM+pLv8iZSQzlVyzpTa1bqfLdRWpP+FU58e+Yz7cuOH+J+RuG8MQhSJqAn6dhXPutjOVAMlWM44gNgnKFNxovHgPXK6o48z81PGOV7XsIaNVA7slCrRMWbt5uZck8Yiq5v8EM8fTsNTTbuJ1KaqIa04EqzHUveixpKb6I26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaU97uZ34DB3mjNSBBFZhVarWGOtf9EcMRYmHYUCoqU=;
 b=nO69ppSqGIAGWJnfE6kofiS35fp8Ov6Jx8y37Pf+T+GePzL63h/GSn5XJFfBlnj1UN+KZRkTJx45xerjdZaZiZLkGf3Dm7HFG2NalXm+LaxbGdwUhbxB5+ShPEPlSpPyMvsAYBVxcnHESJiGkuPHqHdgNpZQKxuAf5mgTk/f6W2RXHjguLFq8IP5JCcd1zEUzvjj5C5bDBU95BM/qIYeQK6ksf5vTqzJY+wzx217GyuGtpkGKltdVl5N9A4vq87tYKCDimJutcTdet7wqRclsoI8qYMYapTEVO069Exs9YtBEVvwvsVvKSCK53uAzNJVweu6gzgjjaWEcSpEGwqz6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaU97uZ34DB3mjNSBBFZhVarWGOtf9EcMRYmHYUCoqU=;
 b=Nn1FCUF2YM+ooE6jGUGYYx8MS8B2Ji+6HrXpCGBzcrzfOB3gvakTJOPZWvtGwAlh40/pbR4qvf9fH/UgHr7ieg7MPUy5+dVI5WvM6b2E8GxWqrhcH8scSjsoXUYeVW6mlqOptGWJ50wOorNPVon/r1IOIGj4m3U4P5F/GL5gHakzGc3wvE7nVZdQ3IovizNwAUIPlO8CPFgWzP4rHSogyniDfqfuB48P9hxUg55U60m5eiFnGj9fxImrC/8sA5y1VE+RjRmMfQETzPVxV4jIUNDA7c8IYaHxCTqxLu/6+FcWnVg57UFFEuIM/RGGCRzUfjob8UKE5hI+WwRejMaCYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8771.eurprd04.prod.outlook.com (2603:10a6:20b:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Wed, 25 Feb
 2026 23:55:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 23:55:30 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 25 Feb 2026 18:55:08 -0500
Subject: [PATCH v2 4/6] pinctrl: add generic board-level pinctrl driver
 using mux framework
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-pinctrl-mux-v2-4-1436a25fa454@nxp.com>
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
In-Reply-To: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772063713; l=8758;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=cUCrV+VjWKFme90gpKEqsUHbiwllcC5zrPNOFnhNp7w=;
 b=iJDZu349WEhfulumMK03S+jOAlXrNVHUFBgkTt+tDEk+65ihfNuykP+7Jm/cFc7muCk29tl2k
 TbfDGdXAj+hAReWUWQJsZG15FDmeV9x03D6r3sUs/uDNPcYZ3Y51LY7
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f2e70fa-59c8-4cae-e341-08de74c95b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	mXa1QvpwvB71OoPas6kZn907tLftxIsJdS+VjvPO8oG2TvSlSJYIAtrWoGKkQC66IZj4MxlGsc/OBhhqEvnnP2gsHw88biQm3tDowcS1L6Z39NIsM2PmeLCgUlpqdyMkxCgBBYLyKBCZObUpqaiY9u/73imkfJ01tv/VQIaN9tLZ40jMHdBgjJwFQx9bTvedK1m1niR9DSZv+n1/6DmMC0SkMqFLiLdGvEbZjct8tWhqhsUydOCU/3W6ZSXbDBBshu/RLKcZ32rg4NyKCW8FK4FG8BvrmI1w8IQ9EhhVXK6Y6D3l89f5HYrsf8QxY+pUZ7JyNLmLlDxKCLAO0D6i3Pk1B0VcbrOZacJZnEXUb14ZSuCp97cbw4u8QVazFe8FV28UOlqHcFfxRQ7GIwCqqd3ZcRT55sIRoTQfFwCjjseu5IimzP01IGjNU3Y46qzkdr4BVKJkYSPdBidMzjv/1Jbx6PLRqOmw5k3SsEoRg/Aakr7QPlN6ZW1i1towN8hGgs7irfY08O4DEoN0A/buVyxZiOXMWqBnXswF0lGJFI/2eNvR2yCu29A0mO7bLFvye05hSDiNYMfs0p/UO/5JefaDBOHO3x6xTScKBDQeq1UyzqVOI4gHikcVwdJfQNp5sx8Ee+oryPz6T4czqgN/QhFtwJKQ1lUjZF/pSAyvBU6x2lzXhih8797K7dgzWTr2cpT17gcffCC2Q/rgKT26U98sen4OQi0nOgDBI/jZV6HXbD3r1GCTfR/SQUDHRcUIUiLuc0llw39f13KIRavowJCYv8kp5d5C19XcDt0r5kc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3c5M0k5MFo1cklLMC8wMlZBaUZoNXpuUU02VE0vWnZlZ3VXSzdnVDVPTm1r?=
 =?utf-8?B?dGowMUFOVVcxTHVydkNJZ0ljOGVodDYyaWJrYVFwa2JEeWlNb1orTFg0aGIv?=
 =?utf-8?B?YXdoTG1GWEVNVHowMGJpQVVmR081b2JzS09PdjlpRjVQSllZY2JxWlVzMVFu?=
 =?utf-8?B?TnBlU1dtM3pKemlxN1gwYTZVYjdEcWIzSTAvVTFlL2xwNjRHVVBrY2c2THF0?=
 =?utf-8?B?Y0N5a2E3eWE2c2NUejhSanM0Um1QTWtLdEhESEdyZ3p5ZmxmeCtRSVViQkVD?=
 =?utf-8?B?NXB2VTdwYm9DYXpwRTJzVExYWDFLUFB5MWpyZTJXYXl6TWlObDJNNHhpR09Z?=
 =?utf-8?B?emh6ZWJGOTB2Vm5DaTQwY3l5Y3lHYjR4dUJnRnljZE9SYnh2NWJrYzNEeVpa?=
 =?utf-8?B?NHUrNmZKWEY0YXNmYnpkS2ppZWhNTFo2WTVOV0o0TElWUXN0K25lQWJhbXhy?=
 =?utf-8?B?cnRvZCtEazNQY3U4dTYrTW9lT2RYeFJ3L3RaYTJXSXJEK0w5TVZWOUdhdGhB?=
 =?utf-8?B?ekpPcUVJRmpDckVpN1Y2a2lFUGVBR3c1dlNzUnNMZEt2VGtGeCtXSVZmWmNM?=
 =?utf-8?B?aVN2UDAraE5pWHpqTWlVejBza1hTY1BidG5BQjM5azdVQ204eEtCSW1LaUxI?=
 =?utf-8?B?NnROUTdDbmhlS3dWNXlLMDdlZFBNTW5KYi9VZVRwbkgxQllSUXV3KzZVcFV3?=
 =?utf-8?B?NEkyaTN1bEF3Sm56N0N6WVc5QmRDaWJYZEdKdDRVdUtCd3dJeGJyTkhsbjJr?=
 =?utf-8?B?WkV3M3FFMlh6N3l0N1IxNEtlckVEWkN1a1czdmxwQlZNY2FXUEUwWmdTdGdJ?=
 =?utf-8?B?L2Y4L3lFT2xqdW54aGlmeWFUNkpIV3dmTFFWRUVJRm5LY01jdGtPWWpFcXhK?=
 =?utf-8?B?MDZEeVpmL1BGT1lrZkY1eDZXUS8vQm94WUNwQTMvYnZpMjNGNCtPVlpRUVR3?=
 =?utf-8?B?anovU0JuaWdaQVJWemNMQUd1b0hpT3BDRDN2NjQ4YTV0Tm1ncThJOU1mY0Np?=
 =?utf-8?B?QzJ0YTR4eGQ5SE9qWEQ1NUhJYnpKRkJVYTFZZkFVaHorcFFEVHoybFNWN3Va?=
 =?utf-8?B?RXlQeEVKM1lRUnZlMTJVOERKUFZYc1N1QjVYR05YTTIwbDlzV241N1MwTC9X?=
 =?utf-8?B?K1U5d1M2NjMzSElEVEdFUy81Y3hyQk5uNDhhYzhIMnFvUDJCeW5hOGp6TDNk?=
 =?utf-8?B?aUlnMGZpM0lnY1RYTjZPem5FMUdEQ0Q0aWk3a1p1ZUVHamVuTytDZXBsamN1?=
 =?utf-8?B?Z1Rzems2NytDNG1qQ1Z2bFN0U20yTE9xMVRUS0lTZUlXN2pwaVYrVFdVNW85?=
 =?utf-8?B?ak9oVW1SVURudi9OUDlDOG9pbExtS2lGUWdaV0N3S2R1WEhyZWZkYzBJWld6?=
 =?utf-8?B?UjZ6Q2FsZXRYZUxhcGFwellRN3ZmWDN5dThsMm1GYTNQbVhDeCtLclk5d2J6?=
 =?utf-8?B?UDhWNjJVSENhNm9XRUx5bWZIV25uKzZZbC9zUDRzU2wzM1RvZWlWaGtpajhR?=
 =?utf-8?B?eFhmZDltYzdjSEIwU1RDWmlUYlN2ZWRBM0Z6R296b3JEV202SGpNekVXbDls?=
 =?utf-8?B?dGVtMnNXUTkxRkRnY0RVWXdDblMvNTdmVTJnZjVJZ0VmWmZOQnYwTWVDMTlI?=
 =?utf-8?B?akVKL3NaaVNzalhvNmNvNmg1cWFKUk0xQi9vMUlNU2JaVElkcWx1Q1Mwazl0?=
 =?utf-8?B?Nk1GM1haa2Nta2tEeStjKzlWVE5ZZFgyc3pzNkgrdFRqQStOWUNJRWZNd3Bu?=
 =?utf-8?B?MkhCa3RjbThKMFIwQXVaVFdqNy9qTmM3QThuYXU5cUtkVlRub25ZaXlrcU5m?=
 =?utf-8?B?RmxqVG5XWTMxc2ZZSVp6SlRtSXQ3N1YyaUZZRXlSelc1dENUMDBUUVZib3Z1?=
 =?utf-8?B?TytxREdmYitiMXUxRFRwWkZLMyt0T0E0RHQrV2pDVkw4dVovalJ4bldhc3Ft?=
 =?utf-8?B?ajNVTkhwU2gxWmpiMXVHWlF6ZSs2bm1wOXdNMnE4Vm1ZVTZFcnJoNUIyZDcr?=
 =?utf-8?B?OWVCTXJVWjBZdHRQUzZVRFZsSUowajJ1Y3ZGR25QVjBRWisydWlXQ1ltcXV5?=
 =?utf-8?B?NGJhV3V4dUp2MHd0R09ITnNIZGpwdVJkbHBZcmVYK0NEakh0eVJDQWF6VVZn?=
 =?utf-8?B?WkpRRkphTVdYbmVBR1QzYmRSNTJkZU1YdU9pVzFtMmJQUGVMWXJSOFV3Ykgx?=
 =?utf-8?B?Qm51NXJ2YTZNOFBVTEJmZ0ZvNkhRa21odUtKL3AvcXJJd0owbjdjcTRxcDY4?=
 =?utf-8?B?TENWQzNiN0dMakF1Z3hnMGJlUGdQZVh2dE93SUdFZnRtbzNtV2h6eVRpWDVp?=
 =?utf-8?Q?Xrmbsxo2yC5T7HTC0h?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2e70fa-59c8-4cae-e341-08de74c95b6b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 23:55:30.6207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifXIqrJOEZD+K8bOMxrihdfyUveHAfxkaM4nhUkSwLccT/EwIZBHJnLPqhWcpXuAi/PHynml224ku5aIWre9sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8771
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32197-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9009A19F337
X-Rspamd-Action: no action

Many boards use on-board mux chips (often controlled by GPIOs from an I2C
expander) to switch shared signals between peripherals.

Add a generic pinctrl driver built on top of the mux framework to
centralize mux handling and avoid probe ordering issues. Keep board-level
routing out of individual drivers and supports boot-time only mux
selection.

Ensure correct probe ordering, especially when the GPIO expander is probed
later.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2:
- fix copywrite by add nxp
- fix if (!*map) check
- add release_mux to call mux_state_deselect()
---
 drivers/pinctrl/Kconfig               |   9 ++
 drivers/pinctrl/Makefile              |   1 +
 drivers/pinctrl/pinctrl-generic-mux.c | 241 ++++++++++++++++++++++++++++++++++
 3 files changed, 251 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index afecd9407f5354f5b92223f8cd80d2f7a08f8e7d..0657eeeeb587fa5e68dc3c1e00be35608e243b80 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -274,6 +274,15 @@ config PINCTRL_GEMINI
 	select GENERIC_PINCONF
 	select MFD_SYSCON
 
+config PINCTRL_GENERIC_MUX
+	tristate "Generic Pinctrl driver by using multiplexer"
+	depends on MULTIPLEXER
+	select PINMUX
+	select GENERIC_PINCONF
+	help
+          Generic pinctrl driver by MULTIPLEXER framework to control on
+          board pin selection.
+
 config PINCTRL_INGENIC
 	bool "Pinctrl driver for the Ingenic JZ47xx SoCs"
 	default MACH_INGENIC
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f7d5d5f76d0c8becc0aa1d77c68b6ced924ea264..fcd1703440d24579636e8ddb6cbd83a0a982dfb7 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   += pinctrl-equilibrium.o
 obj-$(CONFIG_PINCTRL_EP93XX)	+= pinctrl-ep93xx.o
 obj-$(CONFIG_PINCTRL_EYEQ5)	+= pinctrl-eyeq5.o
 obj-$(CONFIG_PINCTRL_GEMINI)	+= pinctrl-gemini.o
+obj-$(CONFIG_PINCTRL_GENERIC_MUX) += pinctrl-generic-mux.o
 obj-$(CONFIG_PINCTRL_INGENIC)	+= pinctrl-ingenic.o
 obj-$(CONFIG_PINCTRL_K210)	+= pinctrl-k210.o
 obj-$(CONFIG_PINCTRL_K230)	+= pinctrl-k230.o
diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinctrl-generic-mux.c
new file mode 100644
index 0000000000000000000000000000000000000000..978cbc4f82a0b3e56dd83ce24426d4e764262a6e
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-generic-mux.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generic Pin Control Driver for Board-Level Mux Chips
+ * Copyright (C) 2026 NXP
+ */
+
+#include <linux/cleanup.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/mutex.h>
+#include <linux/mux/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/slab.h>
+
+#include "core.h"
+#include "pinmux.h"
+
+struct mux_pin_function {
+	struct mux_state *mux_state;
+};
+
+struct mux_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctl;
+
+	/* mutex protect [pinctrl|pinmux]_generic functions */
+	struct mutex lock;
+	int cur_select;
+};
+
+static int
+mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+			  struct device_node *np_config,
+			  struct pinctrl_map **map, unsigned int *num_maps)
+{
+	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
+	struct mux_pin_function *function;
+	struct device *dev = mpctl->dev;
+	const char **pgnames;
+	int selector;
+	int group;
+	int ret;
+
+	*map = devm_kcalloc(dev, 1, sizeof(**map), GFP_KERNEL);
+	if (!*map)
+		return -ENOMEM;
+
+	*num_maps = 0;
+
+	function = devm_kzalloc(dev, sizeof(*function), GFP_KERNEL);
+	if (!function) {
+		ret = -ENOMEM;
+		goto err_func;
+	}
+
+	pgnames = devm_kzalloc(dev, sizeof(*pgnames), GFP_KERNEL);
+	if (!pgnames) {
+		ret = -ENOMEM;
+		goto err_pgnames;
+	}
+
+	pgnames[0] = np_config->name;
+
+	guard(mutex)(&mpctl->lock);
+
+	selector = pinmux_generic_add_function(mpctl->pctl, np_config->name,
+					       pgnames, 1, function);
+	if (selector < 0) {
+		ret = selector;
+		goto err_add_func;
+	}
+
+	group = pinctrl_generic_add_group(mpctl->pctl, np_config->name, NULL, 0, mpctl);
+	if (group < 0) {
+		ret = group;
+		goto err_add_group;
+	}
+
+	function->mux_state = devm_mux_state_get_from_np(pctldev->dev, NULL, np_config);
+	if (IS_ERR(function->mux_state)) {
+		ret = PTR_ERR(function->mux_state);
+		goto err_mux_state_get;
+	}
+
+	(*map)->type = PIN_MAP_TYPE_MUX_GROUP;
+	(*map)->data.mux.group = np_config->name;
+	(*map)->data.mux.function = np_config->name;
+
+	*num_maps = 1;
+
+	return 0;
+
+err_mux_state_get:
+	pinctrl_generic_remove_group(mpctl->pctl, group);
+err_add_group:
+	pinmux_generic_remove_function(mpctl->pctl, selector);
+err_add_func:
+	devm_kfree(dev, pgnames);
+err_pgnames:
+	devm_kfree(dev, function);
+err_func:
+	devm_kfree(dev, *map);
+
+	return ret;
+}
+
+static void
+mux_pinmux_dt_free_map(struct pinctrl_dev *pctldev, struct pinctrl_map *map,
+		       unsigned int num_maps)
+{
+	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
+
+	devm_kfree(mpctl->dev, map);
+}
+
+static const struct pinctrl_ops mux_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+	.dt_node_to_map = mux_pinmux_dt_node_to_map,
+	.dt_free_map = mux_pinmux_dt_free_map,
+};
+
+static int mux_pinmux_set_mux(struct pinctrl_dev *pctldev,
+			      unsigned int func_selector,
+			      unsigned int group_selector)
+{
+	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct function_desc *function;
+	struct mux_pin_function *func;
+	int ret;
+
+	guard(mutex)(&mpctl->lock);
+
+	function = pinmux_generic_get_function(pctldev, func_selector);
+	func = function->data;
+
+	if (mpctl->cur_select == func_selector)
+		return 0;
+
+	if (mpctl->cur_select >= 0 && mpctl->cur_select != func_selector)
+		return -EINVAL;
+
+	ret = mux_state_select(func->mux_state);
+	if (ret)
+		return ret;
+
+	mpctl->cur_select = func_selector;
+
+	return 0;
+}
+
+static void mux_pinmux_release_mux(struct pinctrl_dev *pctldev,
+				   unsigned int func_selector,
+				   unsigned int group_selector)
+{
+	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct function_desc *function;
+	struct mux_pin_function *func;
+
+	guard(mutex)(&mpctl->lock);
+
+	function = pinmux_generic_get_function(pctldev, func_selector);
+	func = function->data;
+
+	mux_state_deselect(func->mux_state);
+
+	mpctl->cur_select = -1;
+}
+
+static const struct pinmux_ops mux_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux = mux_pinmux_set_mux,
+	.release_mux = mux_pinmux_release_mux,
+};
+
+static int mux_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mux_pinctrl *mpctl;
+	struct pinctrl_desc *pctl_desc;
+	int ret;
+
+	mpctl = devm_kzalloc(dev, sizeof(*mpctl), GFP_KERNEL);
+	if (!mpctl)
+		return -ENOMEM;
+
+	mpctl->dev = dev;
+	mpctl->cur_select = -1;
+
+	platform_set_drvdata(pdev, mpctl);
+
+	pctl_desc = devm_kzalloc(dev, sizeof(*pctl_desc), GFP_KERNEL);
+	if (!pctl_desc)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &mpctl->lock);
+	if (ret)
+		return ret;
+
+	pctl_desc->name = dev_name(dev);
+	pctl_desc->owner = THIS_MODULE;
+	pctl_desc->pctlops = &mux_pinctrl_ops;
+	pctl_desc->pmxops = &mux_pinmux_ops;
+
+	ret = devm_pinctrl_register_and_init(dev, pctl_desc, mpctl,
+					     &mpctl->pctl);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register pinctrl.\n");
+
+	ret = pinctrl_enable(mpctl->pctl);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable pinctrl.\n");
+
+	return 0;
+}
+
+static const struct of_device_id mux_pinctrl_of_match[] = {
+	{ .compatible = "pinctrl-multiplexer" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mux_pinctrl_of_match);
+
+static struct platform_driver mux_pinctrl_driver = {
+	.driver = {
+		.name = "generic-pinctrl-mux",
+		.of_match_table = mux_pinctrl_of_match,
+	},
+	.probe = mux_pinctrl_probe,
+};
+module_platform_driver(mux_pinctrl_driver);
+
+MODULE_AUTHOR("Frank Li <Frank.Li@nxp.com>");
+MODULE_DESCRIPTION("Generic Pin Control Driver for Board-Level Mux Chips");
+MODULE_LICENSE("GPL");
+

-- 
2.43.0


