Return-Path: <linux-gpio+bounces-23648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EB2B0E4AF
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 22:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FA5B7A1C9A
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 20:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EE028541F;
	Tue, 22 Jul 2025 20:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="NHZHolMi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2102.outbound.protection.outlook.com [40.107.100.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EEB1D54D8;
	Tue, 22 Jul 2025 20:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753215375; cv=fail; b=uLE+V1gr5emkJo9e2soZGSQIwMoRYRbEfUZcTSMGoINzzBfkL8pUJEE0zN1X3Kj3N/KhuSShAEv1Lwt7QPSkxfa3Lsac+v1AORIlY4WPriOAJ0gUkJPvV1q/j6xQqBmUCra+f9qm9qjxPH77rp4L+YttBoLQzVeAqf08Iv5W7WQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753215375; c=relaxed/simple;
	bh=E7g7zwM3khteU7CmBbL0J4PJwdNaAOcmAfEOB0IRYCc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JqOIDMVEF69EU6gtTlRq4/WPTaXJHEaphp7T76J65+JvJEDet4DifZu8DsBx70GGi5egohkDJvZlVbOrsI+xTOfD3D0Ev858BXqSu0Bd2g+uz6Lp1FD90ir3EnnaiT2W7FZJZQaWl6ywESTZBNNJf2Mm9QcOXkxldGCDEccwUww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=NHZHolMi; arc=fail smtp.client-ip=40.107.100.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4kNlgMWp7iSalP3d3FRiTJy84cVfZPdr98S9fxdNF3uIotaX4vySALM4/V0umFl9YQe/jTNJHv3BJYy2KoTgaoX0641ahe40R14st20lS8s7tjqL1nHSzHMqVw0tI3dDbA031/R8wS4xHVqK9NkA0sTSlQs20m+eYiwm68fVBDB5XmEQm0Hs9qsX3ssCYPRbsG1cDeIZZ+oiG3OV7s3tX01XMeueb7Fq+zCYWOt46D8ZCa2PdBRTHJmh0t04ePXJG+LEHTkz9inWkbFiF93PXfXtNabGndqKWmzh7hL12hBlu6aiTfBW1qr5Lo66RLsJtKKJiQi8EhU5nbkFgzgRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuwJcCrK1ldQRPJ/A19dqZoF7lI6UWseoD2iQ606FMw=;
 b=v+bi3UrmvTJIPh474v679BUyo+KAq4a9IEGnxl1neHz8ltYsAUXVaK/0tjhmwwIfldkI9aVHFYFsRoZBNTs+HHeWAx2fBSnK1Lk0IcJF7oK8IPLsJiclqMb3KaRxWyqjfyI1sMaS1cNA/vcSkbs5auTWqlovCCBSGRVUN7p75WWaQP8ilgnLG/ixclTz2UU8jc8cQRt1yV5Z9wCecRSH52MnvcozQKlnmRKNWr6Z+8gVz48PxLv2AgvkNS0D11IsrSXfLbERg9WJnWB1/RSEbQpPdTBIruVlWzen7xqL6yGtXdmGKQSSGqTrLs0ur+9hWYOd5++vzw6wbEg0P+J8dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuwJcCrK1ldQRPJ/A19dqZoF7lI6UWseoD2iQ606FMw=;
 b=NHZHolMicm6nPTxigmEyB5XE5Xy1JHI2CW9987Ut62Xh889/PC2kTdP5SCcaJimLJ4HQNb33Ig03hYnQGT0Nmczh0Sh3yKVUAhqZKuOgzVHoetTEUePgGsKhBhH2aUVTs9FsqZU9L6Sd+iF+xMK37NfE8CcUCIee5oNwBa4wCKj/hGre2190ddNePc+G/tYXyV1z0KMGKC/3U6ZBphm2BVbMqz7vkOgxmUPDv6Xx6nUcV8VWabOmUOK7sT9MiagH/qYu0q9i7mV7U/rzqnWZeyw2YvdDyPZcqS5lIUOh0ni8NSrhqpKBb2Ho4ZFf/DiBDjMyjIxdr5NEBoeNzdJzFA==
Received: from CH0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:610:b0::19)
 by CH3PR18MB5984.namprd18.prod.outlook.com (2603:10b6:610:1e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.27; Tue, 22 Jul
 2025 20:16:05 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:610:b0:cafe::ec) by CH0PR03CA0014.outlook.office365.com
 (2603:10b6:610:b0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Tue,
 22 Jul 2025 20:16:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 20:16:04 +0000
From: Harshit Shah <hshah@axiado.com>
Subject: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
Date: Tue, 22 Jul 2025 13:15:28 -0700
Message-Id: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGHxf2gC/53QTU7DMBAF4KtUXmPk8c8k7Yp7IBbjeEItQR3Za
 VRU5e44ZUFQVmFlPUvzvdHcReEcuYjT4S4yT7HEdKkBnw6iO9PlnWUMNQuttFMIVtItUkj1MUo
 pWVIn6RIkT/RxpbEOS58oB1muw5DyKMG36C0dA1EnKjpk7uPtUfj6VvM5ljHlr0f/BMvvv6smk
 Eoa3ZA31naA4eUHeO7Sp1i6Jr323W5fL74Fp3QwLUK78c3K12a3b6rvDSNSY4/Qu41vf/1GwW7
 fVh/AE/aofd/ixndrX+/2XfWRAgMqJm38xse1v/8+WP2OfWhBccP67/7zPH8D3oWtZc0CAAA=
X-Change-ID: 20250614-axiado-ax3000-soc-and-evaluation-board-support-1b86b4a9daac
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6668; i=hshah@axiado.com;
 h=from:subject:message-id; bh=E7g7zwM3khteU7CmBbL0J4PJwdNaAOcmAfEOB0IRYCc=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBof/GCrVd9xrWSc5CIMB9TvKT5n8XVsjbbGRU9q
 XOJbTZPdPyJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaH/xggAKCRDxWHMRoTLV
 +2kNDACTj+OzstW3UqLa64T+Sl72YKb7HUU/MLfpIPlkcnEwAgxJZZBWvVwtsdUmctXawpwiv5B
 3lxEa/BnD0dfPH4czvoX2xtrUsREUHsE4/WaTB1cbqBH9OyXi1QSW82lsS4B3BYAublXW6cgQdv
 eZg6ZKQ38VCAdQCiWcH9aYcO5qJZHCKJEixIJYj6KgWKvFSgAGyhOOZVfMMdBhZgkFHBeDWjVlH
 4H7OIl/RYqAy8TCb6dZeSmdyeY4kFx2fa+xMiTfv1y1iWO7CRxaTsRor3xrnwohFbF5DWu5W6k/
 P7wPSdMm1LZSB6CjnJeVl64dIpxRrgBXoHORKi7qW1UoPz0+ARG+Ts340Ej5EcSeZfWA1eNNE+x
 DSqbjCUEwwMa5r0y/6zXh85aJ9vj9YO/P2R1UbRSoCq9aQD/78TaKzruhzsZ4TgqIde3w6NPGGa
 CE7aBFi8kgm+O9HkbDpHqVtY/FDP/UiiE88nHXVELOXgc3q2FrcIdqwiHBFDCQz1BTLZg=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|CH3PR18MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: db998bee-7441-4c57-4a36-08ddc95c9678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2dBWW9YUmZldDRiUHlENEx3a3kxZVQwMFNSYWRDc3FqOXc5YkQxaTJua3Fa?=
 =?utf-8?B?UDdaV2xLRmFkVXRrR0NiUzJUREg2NlRaMk43M2dCVnlFMTNqRlliSmNKTHVo?=
 =?utf-8?B?RUVhWE9JRG0vaXJ1c09aZnBFN0FCV1Vnd005UnpHMFBmUXp3RklhSXVHOXFC?=
 =?utf-8?B?YmF2UjJpcmFKN2kwckNMZTBidEdVUlJkMmZMcVUyMDhkdFB3N1JoMzBCditv?=
 =?utf-8?B?cm5maWhBV2ovV204RkZrRHp6MUtkYko4ckpvbW15TjNUc1RpSzhjUEkwL0tG?=
 =?utf-8?B?ZlpPSm9LVEZFUnlxNlhiOFg2OU84QmIrUnhRd3VhKzhQVERBZ1ZGZEQwNlpD?=
 =?utf-8?B?Z1V0QWZNT1FrbTJEWjE1cGpQb0VUd2FldlRXMXF3ZlpQTTFyaHNDS0lwRVhr?=
 =?utf-8?B?TkhKc0FQOGJLTUxEeUk4d3VlV1JwWWVBdFJITnVSK2xVWktDVU5HNVQrZ2p6?=
 =?utf-8?B?aDNKZTdLanR1OC9lVHc4WEhzQkNFV2FnOXd2QWFaYUtEaklDa2dDRG5uVUli?=
 =?utf-8?B?WTZ2c1NyckVqYXNzVGlyR2EvSzBkREZsTEYxMkhxKzZrVlFJaVJEeXFFNS9D?=
 =?utf-8?B?QzBNSExyeU5XaGZ6aFcyaGE1NzN2M2lhMjZhWTFLSnR5RW16MHQxODgwNFZ6?=
 =?utf-8?B?WllDN2xJOENKc0xDcGJ0ZEsxblhETzZPclRlVklTc2pjdGp3WkZyb2ZBSDla?=
 =?utf-8?B?QzBiQVVMZkttVEgrSlcxcmlNWmZtSW5NTWJoSERXWGJkUVkwK0dJMDBlcGFt?=
 =?utf-8?B?YVhRZmFTRFFOVVVXc2ZnVU53SjdhQzJUOENEdEVKUkJhZnRPVi9IR2FDcHVn?=
 =?utf-8?B?Q1RlbC93clF2R3lOUHRXbHlncjdGSmtKSTFlbVNabHo4R2c5WXFrVG5pa0FZ?=
 =?utf-8?B?bHJjN0cwNzhDT1VqaGJFVGtMRURVTjZVbTExNkNNWEJ4dE9wYkxTM1pXaWM0?=
 =?utf-8?B?clgxdjZlYWpJZVlaMjlMYjRFbE45eXJUMmJVc1g1dHNSejgyU3gxY0lBU25U?=
 =?utf-8?B?aGJ0RW9KTE9MMlVneFlFWEprSXJ1Sm5nenlUdDBRaG9aUnRIQURlOHIvVm5n?=
 =?utf-8?B?bnJqR2RKRzEvYjdiM2R5bXhzU2NsTTY2WTl2M0tGaGhqMkFxMllOSk5sMFVH?=
 =?utf-8?B?Njk2NTdpUXFxWHFVUnIybHVoTm1WaWlhS2NSUXZnT1RBRys4UGt1NmVibEdj?=
 =?utf-8?B?OTlUVXdTZVBGVHpxcjhvcmxQTXd6NTB3UU05SlFmdFRFMWkrWmVQNktxT0l5?=
 =?utf-8?B?QTRZRUhMTnoxeXlCWmhraVNPL3p2OUZ6MUZLK3NLdGRVM3pKQ2Mvd2dFdHpB?=
 =?utf-8?B?WDFUQUVuMC9VMy9iaHNoRFpEUzJxQmE0bjlEQjV6UWl2QVhGS2ZFSldKSHVa?=
 =?utf-8?B?VXBoaGNKT3I2dS9CTVhqRnViOUh4dGxkZm9TSERKTW5NWis0M0VuRmdUNWl5?=
 =?utf-8?B?RXZMdTVYdnRYTFhMeEdQcFFTdzV5eVg3cWNLMTlxRnZTWHBROHd6U0hrRzNH?=
 =?utf-8?B?VGs0dnZWSEtNQ2xpdzZnWlVQUDZsUkMwY09NcDdJTU1keXVpRXBDTEFWemRQ?=
 =?utf-8?B?SFl0bENCM29lcjZoOHNKRFdlTGYrN1JUUUZSZFJsbE56Y01UeEJTUVZwbmox?=
 =?utf-8?B?L05tNTgzaEpBLzExWjRGelI4RURoOVlia2Yyald4cm1hRkxWbVA3VkJaWjhB?=
 =?utf-8?B?dFNucnZlRWxrbWlheEVneHBaMzVIK1ZvSHBpaTBDWHJsdEo2bmNHQnpnUkdC?=
 =?utf-8?B?QmlmbjUza0xzVzFTSHVFK1cxOGVxQnNZM3dhVmh3UTlST29xb0tBTFJEQ1Iw?=
 =?utf-8?B?bjY2T3pZWUFHU3pML2ZOOGJhelJJdGMrdEFTWDBSY2ErdG82Q3JSb0tmZkEy?=
 =?utf-8?B?YnVVZXJUVGVPd2ZpdklsNTQydUl1cDdzNVRXdXFHZlhvWDNEdVZVOHU2dzBQ?=
 =?utf-8?B?QjBhT0pwTjlNU1FZdkdDNk96SjRIQ3ZmMEVmNXhUbXJYOWQ5NGV4dGxZRzNI?=
 =?utf-8?B?bWVlRG90ZmF6WUVvVmlSUDM5bTZXZUxvYjBXRndyemZkUjJYSlBHbkFBeWE5?=
 =?utf-8?B?bnU0MVdaV2F6MmRodzYyZGFQUXhwQkhxTk4zUT09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(13003099007)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 20:16:04.7823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db998bee-7441-4c57-4a36-08ddc95c9678
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR18MB5984

-------------------------------
Hello SoC maintainers,

This patch series adds initial support for the Axiado AX3000 SoC and its
evaluation board.

Change from v6
- Ran "b4 trailer -u" and add reviewed by Krzysztof

Add soc@lists.linux.dev in the to list and send this series again as per 
suggestion by Krzysztof and Arnd. Thank you.

Checked locally and able to apply these patchset to soc git.
(git/soc/soc.git, for-next, checked commit: 7dfbf3176d886ff9a0c7786942d3a89809d0641e)

Sorry for late request, please consider this series for the 6.17.

-------------------------------
The AX3000 is a multi-core system-on-chip featuring four ARM Cortex-A53
cores, secure vault, hardware firewall, and AI acceleration engines. This
initial support enables basic bring-up of the SoC and evaluation platform
with CPU, timer, UART, and I3C functionality.

The series begins by adding the "axiado" vendor prefix and compatible
strings for the SoC and board. It then introduces the device tree files
and minimal ARCH_AXIADO platform support in arm64.

Patch breakdown:
  - Patch 1 add the vendor prefix entry
  - Patch 2 document the SoC and board bindings
  - Patch 3 convert cdns,gpio.txt to gpio-cdns.yaml
  - Patch 4 add binding for ax3000 gpio controller
  - Patch 5 add binding for ax3000 uart controller
  - Patch 6 add binding for ax3000 i3c controller
  - Patch 7 add Axiado SoC family
  - Patch 8 add device tree for the ax3000 & ax3000-evk
  - Patch 9 add ARCH_AXIADO in defconfig
  - Patch 10 update MAINTAINERS file

Note: A few checkpatch.pl warnings appear due to DT binding conversions and
MAINTAINERS update. The binding conversion and includes were kept together in 
patch 3/10 due to their close relationship, but we are happy to split them if 
preferred.

Feedback and suggestions are welcome.

Signed-off-by: Harshit Shah <hshah@axiado.com>

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
To: Arnd Bergmann <arnd@arndb.de>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: soc@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: Jan Kotas <jank@cadence.com>

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
- Link to v6: https://lore.kernel.org/r/20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com

Changes in v6:
* patch#4
 - added missing blank line (Krzysztof)
* patch#5
 - add reviewed-by Krzysztof
* patch#6
 - moved enum of axiado,ax3000-uart along with xlnx  (Krzysztof)
 - removed description (Krzysztof)

- Link to v5: https://lore.kernel.org/r/20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-0-6ade160ea23b@axiado.com

Changes in v5:
* patch#4
 - remove description, add enum (Krzysztof)
* patch#5
 - removed description, add enum (Krzysztof)
 - moved to the first entry (Krzysztof)
* patch#6
 - removed description, add enum (Krzysztof)
* patch#8
 - add reviewed-by Krzysztof

- Link to v4: https://lore.kernel.org/r/20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com

Changes in v4:
* patch#1
 - add acked-by Rob
* patch#2
 - add reviewed-by Krzysztof
* patch#3 
 - remove description in "ngpio" (Krzysztof)
 - add reviewed-by Krzysztof
* patch#4 (new)
 - add binding for ax3000 gpio controller
 - backward compatible with original binding
* patch#5 (new)
 - add binding for ax3000 uart controller
 - backward compatible with original binding
* patch#6 (new)
 - add binding for ax3000 i3c controller
 - backward compatible with original binding
* patch#7
 - add reviewed-by Krzysztof
* patch#8
 - update compatibles uart -> axiado,ax3000-uart, i3c -> axiado,ax3000-i3c, gpio -> axiado,ax3000-gpio (Krzysztof)
 - add space between nodes (Krzysztof)
* patch#9-10
 - add reviewed-by Krzysztof
 
- Link to v3: https://lore.kernel.org/r/20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com

Changes in v3:
- patch#3 
 - Update with the original filename (Krzysztof)
 - maitainer and property name updates (Krzysztof)
- patch#4
  - removed defconfig (Krzysztof)
- patch#5 
  - update nodes to alphabetical order, remove redudant nodes (Krzysztof)
  - add fix clock nodes (Krzysztof)
- patch#6 
  - enable ARCH_AXIADO in defconfig (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com

Changes in v2:
- update patch#2 to fix the yamlint,dt_binding_check error
- update patch#6 to update path mentioned by kernel test robot
- Link to v1: https://lore.kernel.org/r/20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com

---
Harshit Shah (10):
      dt-bindings: vendor-prefixes: Add Axiado Corporation
      dt-bindings: arm: axiado: add AX3000 EVK compatible strings
      dt-bindings: gpio: cdns: convert to YAML
      dt-bindings: gpio: cdns: add Axiado AX3000 GPIO variant
      dt-bindings: serial: cdns: add Axiado AX3000 UART controller
      dt-bindings: i3c: cdns: add Axiado AX3000 I3C controller
      arm64: add Axiado SoC family
      arm64: dts: axiado: Add initial support for AX3000 SoC and eval board
      arm64: defconfig: enable the Axiado family
      MAINTAINERS: Add entry for Axiado

 Documentation/devicetree/bindings/arm/axiado.yaml  |  23 +
 .../devicetree/bindings/gpio/cdns,gpio.txt         |  43 --
 .../devicetree/bindings/gpio/cdns,gpio.yaml        |  84 ++++
 .../devicetree/bindings/i3c/cdns,i3c-master.yaml   |   7 +-
 .../devicetree/bindings/serial/cdns,uart.yaml      |   7 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   8 +
 arch/arm64/Kconfig.platforms                       |   6 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/axiado/Makefile                |   2 +
 arch/arm64/boot/dts/axiado/ax3000-evk.dts          |  79 ++++
 arch/arm64/boot/dts/axiado/ax3000.dtsi             | 520 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 13 files changed, 736 insertions(+), 47 deletions(-)
---
base-commit: 8c6bc74c7f8910ed4c969ccec52e98716f98700a
change-id: 20250614-axiado-ax3000-soc-and-evaluation-board-support-1b86b4a9daac

Best regards,
-- 
Harshit Shah <hshah@axiado.com>


