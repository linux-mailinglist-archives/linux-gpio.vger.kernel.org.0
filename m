Return-Path: <linux-gpio+bounces-8235-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A1A9332CD
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 22:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D21091C22CD3
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 20:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FC81A0AE0;
	Tue, 16 Jul 2024 20:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="Hupw1JC7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01rlnn2056.outbound.protection.outlook.com [40.95.110.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ABB19DF8C;
	Tue, 16 Jul 2024 20:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.95.110.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721160876; cv=fail; b=RUfdV1iT1RmuvLUtUQkTngWWrRylQPDu+HJV0dUF8OtrdFuLGNNlf6qaLUIIeuIgK0yYi/BRgF6O3pfq+W8F6yu3xya+tPrsQnZwUZKDK7xjWd0dZD4yma7a4wKCWgkehjdn9ZfVid1oYtZn4cAKzHPE7KOvd/SaBfeLKWArTRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721160876; c=relaxed/simple;
	bh=G9NGDftL1EOHo2qjUrTeDi6R9NrHLKsFeKZlkHH6BvA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ijbL7kTgGfWdPwpkoYbO8r0trodUtEAIIiqQYV5CDoiPoWx93QWAf9btuivHNuaTQ/Z116A+ou0AAVShw4dMpieqglZVieRGSLWjdVTAG676B2qgdUndfroW+esyXgkfG/iv5CupRPi12P8Y8JixR0KFDj6aZV7wJ2aX5lm7O30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=Hupw1JC7; arc=fail smtp.client-ip=40.95.110.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6k46hreCAg/sd/H/L6hwUuriRwBGLmE75fCHqP0090ILu7LLxmFgpkIr3UYfJvPH5ct1hVSA84wgJUbQtX/1NgSwzR48RP7dj5D6pdaMaKSjKFkEGL5xyufG4kONiHIuoj20jWAFlb5+fVWTF386+U1NBttpoZfdGqTJFkR8WLXJ0+4oiprk0pMiBpV8GzTS0seQOzIHR1iOMZ4J6UCjv0jUppu3LcZv76v81H0MBUBIOurlvv4g/k7HbKAMEtJbgOf3UNtlo9BEyKk4HWtPJ8VpkyucZll2cT43vOldvFSn49qE0VVKC8TvkYByDVMJEdWVPTDdBEs49S5twKQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNyXVIH1vWcYHuG2ZGybX3XrURrJRSfQ70LKDZhl3VI=;
 b=vmYdaroLyalPpxB3Jb121rLBdUoEwDlqVNdizjOCWTD1ZssVb1oWEBrJWovgYMuhIRVqekHvCbFZs7s+aba7d42NzqIQ3fxcZb+LyjYsMfRw8eKE4lxCa0mtVMI7QM4Hv+yLFL5TckAA3XyqshWIUXhSVJQSyy/tP3tscfRBLxCOJ1J8yGQy+NCGRazK7C0R/NHBmztWY+e/GAWCpgA+SZVXFiu8pn2YCKYqG+YDsfIkizA1TO9WZOmILYwVJcXPblZxRqcqsDKg9X/v654XkW0vbjbY7Bu12P9wC+rmA2KMUBX+zqCzkhq6JrLkHcmaFheDxXQBai7my3o/WlSoSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 175.98.123.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNyXVIH1vWcYHuG2ZGybX3XrURrJRSfQ70LKDZhl3VI=;
 b=Hupw1JC77R4iopGzPXkadZPKyu0jaF0DPI1pPICDeLznFvTOEJWcizbVoLrCSQs8iowQ8ngn5tmXF05H7m7LAdn1RXRg9/0wtup5KXyiJHDMaY8j8glNaCh6pfC5P80Qim3aILXEj7mvYpaYtuG8YGi7c/NTP2unGnqhpNyHBL8=
Received: from SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16) by
 OSQPR03MB8748.apcprd03.prod.outlook.com (2603:1096:604:275::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 19:40:14 +0000
Received: from HK2PEPF00006FAF.apcprd02.prod.outlook.com
 (2603:1096:4:1:cafe::17) by SG2PR06CA0184.outlook.office365.com
 (2603:1096:4:1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Tue, 16 Jul 2024 19:40:13 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 175.98.123.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 HK2PEPF00006FAF.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 19:40:12 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 03:40:12 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 17 Jul 2024 03:40:12 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 5714E5F617;
	Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 4515DDC0BCE; Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
	<joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
	<benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>, Tomer Maimon
	<tmaimon77@gmail.com>
Subject: [PATCH v2 0/7] pinctrl: npcm8xx: pin configuration changes 
Date: Tue, 16 Jul 2024 22:40:01 +0300
Message-ID: <20240716194008.3502068-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAF:EE_|OSQPR03MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: a01f4d4a-9270-4605-9d10-08dca5cf1c10
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7093399012|82310400026|48200799018|61400799027|35950700016|376014|7416014|921020|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TU4vKzMrVWRJeUxqWWNVZkF2UDRCeVVHdk91eUgzdnBBaC9zMEJrSXBvQ3NU?=
 =?utf-8?B?bS9nZkJXWW51cVQ5QUgyK2VhdWR5N1dGMnp6SExpc1FBdVo0UFNLd21qUUZX?=
 =?utf-8?B?SE40bENDOXpHeDRRNmhNdnVTQUVKaVpTYUFkQXJmSHA3cjF0VDYyOUI5T3BC?=
 =?utf-8?B?aVpEYnlVV1VGendtQmdoUXZoK0tQcjhBYzhFRXljZXI4SWdoZ2w2U09mVDJQ?=
 =?utf-8?B?ay9aY2g5N2FxVWw0OTlsVEdiY3BkekZTUWdRYk1lZUlZaThRTDhqQ3NpTVdQ?=
 =?utf-8?B?OXVOZkFOcjJuUWR2dVZTM2szdU8wYlAxcklncFZsVDdLRTM4R1JQL21qSDlD?=
 =?utf-8?B?OVQ1VlJBcWQ2akZ5c3Z3YTliWUNRUmk0SmJLT0VhTUp0azBSS0UxL0twams2?=
 =?utf-8?B?U3pxc2dTOStDeW1xK0lZaDduMHo1cDF2cmQ2S2FLbDdINmpoc3RnaWJiRUky?=
 =?utf-8?B?UTBBWHRaS21xNlg4Nm5rdFdhSjdTQ0pPMmRxWWpWYTR1dzcrRzdoS3VMQ0Na?=
 =?utf-8?B?N2pubktxbjROQm5Qcyttd1Zjcys4Skwyd3lzMFhva1l6Z2JUTkJnMndhT1RU?=
 =?utf-8?B?U1djbTRRV1VicXA5Yk9kdm91QUtyN21YQ2dCYTJrRUZUd1FpMHV2WHJJV01L?=
 =?utf-8?B?enlJU1Jpd0VJcTRlT2dmQkNPbFZQRGtPUzIyYi90S3FWcGhKY3EwUkkzT0hS?=
 =?utf-8?B?d0VGMjZPVXNkb2ZjMHM2UkQwYmQ4SW9kUE96MmRhYUNFazdvT2tYNldreDJS?=
 =?utf-8?B?dCtjNlBIVkd6Tk1aMDJvVmJLSFYxMWtUMkx3VnU4ZVQvd2hVVjdDaUZTNGlo?=
 =?utf-8?B?T2lPSU5LUlRicGg3SWdwY2d6bHFrd0Jvc3VaSGliejV6dFlLcWpCVmd6UWRO?=
 =?utf-8?B?OFI1eFZqajRMNXNYYkxlYlRQTnRnZFE2cVVDMm9ENjVWM3RLbWp1TVZJeS9h?=
 =?utf-8?B?anJjYlMrL01wN3Q4dU5IR01kVjlYdUtqWnhNbWpZRWZLYnlLcUlhSmkrRzB5?=
 =?utf-8?B?MFlUM0srQitaZ2d5WGxNejZlbk9xZGFMeWlxL1cvNm5pSEJHV0J0N2pFWXBj?=
 =?utf-8?B?a1Z6STNZTHp4UWxtN01KL3h2b3Vqck9wRlFMOVoya2tLeUZ1OEFMSjlBdkZ1?=
 =?utf-8?B?QWY3SHdVRUIyL0tRbS9ldVlNVStpK2xvTmVoQXF1VGpPWW10Y2RHYWtScktS?=
 =?utf-8?B?YWoyL0cwd1lURDhXSWRYUi9QWWVLUHcvZDJuVFROR09mY2dzd3Z1WjJ2SmU5?=
 =?utf-8?B?b1ZhZTErVjRkR0Z2MmtaSWdvemdPcStmN09YQjlyMmRmNUxlNkEzbThwT1dk?=
 =?utf-8?B?aC9QRDF5UE1HSDhUcjFhSGlMbElSaHRPc2JoUTh4M09tY3hkNVoyMU01WFBv?=
 =?utf-8?B?V1BISjN1QlE1UXljL01DYlB5c0NwSE1iemNaWUtyNUhGVWhrd0pUK2NVSjln?=
 =?utf-8?B?WmJ2UGtabzNKdEdCeFN6L0JnTEFxUVlPdEZNbTZobGpmTkc3M0xTU1ZBdzFO?=
 =?utf-8?B?UzVUdzZ6TkZ4dERTZVlYSnZMendIZnJoamhpSFA5enNiVHFsa2llajBoTWtz?=
 =?utf-8?B?bWRpNDNXNGY4N1lZb05mNjZIeUNMN3hRTzBDSkZaN0YrTjZPU3VXbm5wOG4v?=
 =?utf-8?B?YkM4YWlKK3ppMXBBQVF0QVJwdXJ2K3dweTFjQU41cHhhY2xBallzM0w0YXBT?=
 =?utf-8?B?MklPUnR6M2hDbnBzTXhuM3dZN1VkZmZvUzVZbG9HZ2FzTGozbDNRdytyRjVD?=
 =?utf-8?B?R2YzYzQzL3EwTW1kR0FhVDBrRG8xNEpNSkdzeTVXK3pENmZ4bFJrdExzMDlI?=
 =?utf-8?B?VVVGZHB6MEVBRm41OW9weUlzNmUrU2ZMMGJOOG9Ic0ZpTmRucEoyNXlkd2JF?=
 =?utf-8?B?Z1FYRDlzN09HTDNxU0VCazNaMUNmZUVORTY5SjZnMVBIRCtKdDA3Y2hnbVh1?=
 =?utf-8?Q?V0b2rHsB94GE2fTeYCmix2RdXs7fwT0t?=
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(7093399012)(82310400026)(48200799018)(61400799027)(35950700016)(376014)(7416014)(921020)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 19:40:12.6963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a01f4d4a-9270-4605-9d10-08dca5cf1c10
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FAF.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8748

This patch set addresses various pin configuration changes for the 
Nuvoton NPCM8XX BMC SoC. The patches aim to enhance functionality, 
remove unused pins, and improve overall pin management.

Addressed comments from:
- J. Neuschäfer: https://www.spinics.net/lists/linux-gpio/msg101303.html
- Jonas Gorski: https://www.spinics.net/lists/linux-gpio/msg101304.html

Changes since version 1:
	- Squash the non-existent pins, groups and functions.
	- Remove non-existent groups and functions from dt-bindings.
	- Modify the commit message.

Tomer Maimon (7):
  dt-bindings: pinctrl: npcm8xx: remove non-existent groups and
    functions
  pinctrl: nuvoton: npcm8xx: remove non-existent pins, groups, functions
  pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
  pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
  pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
  pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
  pinctrl: nuvoton: npcm8xx: modify pins flags

 .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 70 +++++++++----------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c     | 64 ++++++++---------
 2 files changed, 65 insertions(+), 69 deletions(-)

-- 
2.34.1


