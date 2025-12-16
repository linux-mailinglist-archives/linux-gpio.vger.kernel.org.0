Return-Path: <linux-gpio+bounces-29606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F26CC157F
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 08:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCC713029BBD
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 07:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3283016F2;
	Tue, 16 Dec 2025 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="uaBYcZmw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023079.outbound.protection.outlook.com [40.107.162.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A608326059D;
	Tue, 16 Dec 2025 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765870799; cv=fail; b=Nw6FWsISFMuPG08xXRYRy4CT3Md6TxqkktQS2er5FxH7Ggpar8OxGSH6rrrVRZTUilafndCGsxWZTVvMrqkiHcFZUauP9xZs2qd4rH9bPfdHuu0LkDCAhaR2Cg2O3e924TNwBbpqzHPQyhfrEu0Exqn53gAqdO/oyfTF3bdr2W8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765870799; c=relaxed/simple;
	bh=U1sLhPP8N/60I6Mgmkwdj6HVE1FGnpukJQRIhs3SSuA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=SRjEKP8PI9kM6sfXCM4Gh3Ag0d84R+t0DxL2h3t9+mS82xgkNno6b7R6ZkqZn0zQGH9a80lxTf9P0Y8bfqCiOveFtzu5J4Z37psvYn8OJaA2qAU8y3bQO/90o6ZeseR9bb0K24P4IXlzM5Tcrj+42S2FSasl8TrvPo9fwQjvXFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=uaBYcZmw; arc=fail smtp.client-ip=40.107.162.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJddbskvecIKd64lQUhNZh4ekri6f4NBexWBC6bwlm22dvutZtv1ml/aL7wMeDgsV8zMkXhVRcShqK31/eZEjOONrw1COHBZheacYrX8FZinrJze5BQ0FdGxZI5csHT2KeDFESWegVBiR7OVDowiGZfdj+3gZiQHYXbweiBcljJXzNGTZU290M3CtVOywqybyWNxfwOUN+DvsJTq28aQOAOAnVrhV3O1EIu54zZ5yXsXzQvDBG4CO6QufckJVoAuinbxE1ttv5JtqwdAytjzaVKrub8mpxU4IcfDr091dC+qvG+WRvPqXHWOXinv6NDT+RBpEXeXCVdU0xD11oDWXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6mQC/8p1BuRx0PA73t3AG02gXfuvuqmy7BYJY+6NRw=;
 b=AjnqgOMO7em3wBvv6dzkFRAt43ofB+h3tyBW121gS7r4MrTIqXoMZkNdPpQjudgu+J/KtEW1XxjYG1yTNORPk7Jlc8bnhltF6PejJDvB66yT62lklqwIjLQd+wzzg9b4kR/G+M3ASILffEEgatqutVaXb4Ki+92JYqwsRVsjTJmnvG/Ve4KXq9mvoEzmFLj+6U8z431sRrKfXkivyxUqfVRZD8jzb/xfApBxONUhjmS5irmFID1F4puK5DBBNFZcCki0dQyF8aMoShP912EI3UxudGzwPR1/TlWlxMiKfrZ0tmPV4YBdzbdMMhK/zjmHem7LW20s707Ivv2JFDgaYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=eilabs.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6mQC/8p1BuRx0PA73t3AG02gXfuvuqmy7BYJY+6NRw=;
 b=uaBYcZmwQPvhQvnqq2r/fvYTlf+vBunzLzNUvGaaWuriKK4z/KY5SZXiZV5qC95Ujyxs+yBr5qX+da6mPAUGbjc9RJslB0CJsG0ZZ/keuQrhxwDRdAAYDb64zDDshQzGpWK5ldADo2CvujMi5Qpchie9kKW988i2+PryCRDUatJFHp57qRgTUxMtFTh67ClU5cy3MqjeqvrbxGDxKodIFQ7P3SwXeZaN9in8OvPyV+qzh5iorp7qNbtn0lo2q/HcOQMSuzlT+apLt2IVzqVqMq8FWvPUuGvBdFzqjIBW+i0kSpp4y0b48euswolVn2HMIhQFx23jaMBqSjYt92R9xA==
Received: from DU7P251CA0024.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::11)
 by AM8P195MB0786.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 07:39:51 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::3b) by DU7P251CA0024.outlook.office365.com
 (2603:10a6:10:551::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 07:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 16 Dec 2025 07:39:51 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 16 Dec
 2025 08:39:50 +0100
From: Jan Remmet <j.remmet@phytec.de>
Subject: [PATCH v2 0/3] gpio: pca953x: Add support for TCAL6408 TCAL6416
Date: Tue, 16 Dec 2025 08:39:32 +0100
Message-ID: <20251216-wip-jremmet-tcal6416rtw-v2-0-6516d98a9836@phytec.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALQMQWkC/3WNyw6CMBBFf4XM2jFMhfpY+R+GBW1HGSOPtA1IC
 P9uJXHp8pzknrtAYC8c4JIt4HmUIH2XQO0ysE3dPRjFJQaVq5IUEU4y4NNz23LEaOuXLkj7OKF
 15MzxYE6az5DWg+e7vLfyrUrcSIi9n7ejkb7211R/myNhjlw6Q0ZrV1h7HZo5st07hmpd1w9d1
 l3nvgAAAA==
X-Change-ID: 20251211-wip-jremmet-tcal6416rtw-cd1db73b86e9
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Levente_R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>
CC: <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	<devicetree@vger.kernel.org>, <upstream@lists.phytec.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61F:EE_|AM8P195MB0786:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db7d65a-5ece-42ea-7e78-08de3c764c0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWQ1aTNvSTFOSzBvOTB1dTdjbXRrMlJ1MFVaWFFWbVJkRC8wWXNuUlhiMkVs?=
 =?utf-8?B?WG82TG8vcGhDdWV3L0FIQTA4M3lUNGs2S0RleFZ2eFVvTW9IUlVHYk1DcXdU?=
 =?utf-8?B?UkYyOElCa0k4RUFCczlZOGJyM0lOQ1VnaTVZaXJ2d0t2MnVLNElWSGJFN0lZ?=
 =?utf-8?B?R21VeStsZVAyOUp3SVRVVm56UWlTN3VsTkkwblNuNisyNnhWd2VRZmoxdjdC?=
 =?utf-8?B?dXRua3RBNVgyNlJyK3dCUExWT2hpUVdybi9oNEYwZDRmbjd2aFhLdFFlOUtR?=
 =?utf-8?B?c05taGRTQWV4UW1hOU4yTjh4TzhxalJvZk1iOElYNDZsSUYvMEkrZ3Z6ZkR1?=
 =?utf-8?B?QTkvUXpoK2VjbHVGay9tTDMzTUV4em1IeDVCV25NeFYyK29IR1hPbm1DRm45?=
 =?utf-8?B?K0gyYzZhN2dJSTAvOE9uQXdWVU00UWFQVFV3dEU0enorVHA3ZzdRUWhiZGlG?=
 =?utf-8?B?Z3lJSU4xazhZUjFzY3dIcFdzdFNEUHhYUzdDaSsyZHV3ckJ2aFNIbUpuNDhQ?=
 =?utf-8?B?YVgwbUwzNkMva2cwYUJCL0JoTkxjb0k2TWxrYmk2WjlycWg4OThJa05jMGl0?=
 =?utf-8?B?OUVGRWFPR1JPYmJiQVltVmtkdEdPNTh6TjV4U25Hb0gwd0o3ek1PN1V2VkZh?=
 =?utf-8?B?K2lrNjFic0ZmNVVkdFRvcG96dmtBcXQ0R0hNdWZtUzF3VzVxL1JIdC9NY1Y0?=
 =?utf-8?B?WGQ1WG5Yd09FKzRKeWhUMGJxSWhUdXVWYkE3dmlaUmEyemxwMWdRMjBSOTJl?=
 =?utf-8?B?dzVoZmx0OGpuVDd4WE1oTjh1bC9Xa0FQZnZXQnBCUzJiUm5XWDNwYkV4UEpW?=
 =?utf-8?B?aTJQbTB1TUJOVnUvOWxnTVdsbWZxNE9GUkhvdGZ5WTY2cGk3SUUvckt3NEpT?=
 =?utf-8?B?V2t2Z25aenI4ekNOL0tVdVlKMjhxOUQ2TktCU1JveXc2NU5MYUdiclY4OGRZ?=
 =?utf-8?B?K2dJeXdRMEFWc21QY0txRzNYTVE3U1ZIdmlWbU5rNTJ0RmJCNllxaUpjckFI?=
 =?utf-8?B?dUROTzBKQTZiZDdZdThXeFpHTVBTQlp2aUNXVDI2MHpKQUZZMW1NbE1BUDNM?=
 =?utf-8?B?UXFiZDRnUElScnFzUVhoOFNEc0RpRUU5MStzR05CejlJN3R4MUcrL3FiQkVo?=
 =?utf-8?B?LzA3NWxNckNzMkd3K0tpVkJmREltYTg0RWtSV2R0eGs0SFZkUGYxN1NQRE0y?=
 =?utf-8?B?VVRTWmJsZTlSamZzOGVOdDZNSE14OUZZZDBEUUNqK3ZOYjNGZXdML0RqbTlh?=
 =?utf-8?B?UmVmcnJOcGJTdlRzU0xOM0xCYzVNYWxhRjM3NjVQTW55bWhpU01IYU1FZ3R6?=
 =?utf-8?B?cWV6b2NXb3NKRC81Skk4MDNGUElIYzY2ZStjNm1VVXBnc212dElLeE1WNW1w?=
 =?utf-8?B?UjdObk5tekJJK1VrRUFjZ0VJdGJVbTRxK0ZDRkFLVUZGRFFVNnZobk9GeWVj?=
 =?utf-8?B?V2ptamZla21LRU9EeHViY3lRTXp3SnJScHkxbHZZMERZZTVNN3dRUU9zSVR6?=
 =?utf-8?B?ZmJYTXhKMXlNaUd5UkZrK3c5dlpVY0lmYnNTNHQrR0pvYng0K1ZkaC9GNjFE?=
 =?utf-8?B?UVhMTDFzREdHK0Rwd0UwYjZuWmxZNFNNM0FlelNJaTloQmM4MzFIL1JtVkpV?=
 =?utf-8?B?dTk0S011VGdzbHNscmlIQWJEOGI5MHFLcjU5cGQvMUtBL3FZYUhRbiswVHc4?=
 =?utf-8?B?eEJXYVpkZUhHYnFJNXpnTk5qNGx1UG9FVm1nYXZUTTNSbWo5OUdTa2dlcUcv?=
 =?utf-8?B?bmgvem83K1J1N3JVbzFySjRyODdnRkFVUWcwSnorU2RaODJCck00b0hpbkFr?=
 =?utf-8?B?aksyZ2JsYzVmbi9CZERyVlY1NThXQzZFc1BaMTB0WUpxdmhFQWcyNXZqRE43?=
 =?utf-8?B?TzZ0bkhWRFBVNWRHNEQrVE9ncHh2UkthZnJGelcvQU52bGpleWY0WXhHRUdt?=
 =?utf-8?B?azdmRG9tMm1lalZCRjZPN3VVaUlrczlMOTFETFc4NENodmQxUFFLWGF5SDJa?=
 =?utf-8?B?TzlSZCt0YkxOVEpUcTZxZGgxVkxBUGJ4YVkwNHZXNFBRaXhScTRGWlhxaXh2?=
 =?utf-8?B?MWJMUkVBNHZGYnZsTGNMTElvaHM4NG95bUsxa0gxVUVwK3VzNWVscXVzMG12?=
 =?utf-8?Q?daY43p4/gZ26pL4oxRUPZv9CQ?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:39:51.2383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db7d65a-5ece-42ea-7e78-08de3c764c0f
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P195MB0786

Add two compatible. They share register layout with nxp pcal6408 and
pcal6416

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
Changes in v2:
- reordered patches to first add the used compatible.
- Update commit message with comparison to the NXP variants
- Link to v1: https://lore.kernel.org/r/20251212-wip-jremmet-tcal6416rtw-v1-0-e5db1b66d4cc@phytec.de

---
Jan Remmet (3):
      Documentation: gpio: add TCAL6408 and TCAL6416
      dt-bindings: gpio: gpio-pca95xx: Add tcal6408 and tcal6416
      gpio: pca953x: Add support for TCAL6408 TCAL6416

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


