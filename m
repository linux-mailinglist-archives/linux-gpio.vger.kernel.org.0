Return-Path: <linux-gpio+bounces-22545-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C7AAF04E2
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 22:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A28DC4E34F6
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 20:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5974C2EBDD0;
	Tue,  1 Jul 2025 20:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="eof/T6Wy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2106.outbound.protection.outlook.com [40.107.243.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A2B2F0C5C;
	Tue,  1 Jul 2025 20:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401684; cv=fail; b=ZFJlBfinRtEfrmZRg79njSuqD9XFJfeBHiHnfoh0pBCZgB1jza1mUcj3QrTXFc/lPwLZVbJj3tJzJMOfj574MW/eAwMhD8N3eFD1o6sIZRthaTETjLYvm9kh/9VkSrai7GfK5rI/C8ZoCqV/WrRXrzgOj/wSqdio5iEC5fTiX7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401684; c=relaxed/simple;
	bh=j/+Qky+fPOazs6K3HBXW5y+0plotmY96K3xa4zO52Uk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hBKBOu80OmS4I7/qRggEtz4VrcWcmiAK6Ezeq6idhWpSw2h0LYj6pRpSrQOHkIYsOU+daMMokYnoIYMJDERiYIpIlO0yEZ/FOPvCfE+KfqZlW7qdNTOtXThf7U+3dRilblbBeDr2CVhzr0Ro//6WUnoMDGOnw483TVr0KekcmyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=eof/T6Wy; arc=fail smtp.client-ip=40.107.243.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOGWgUvpbxNoRg3czvjEbI00zyvJBxU8DMfZH3R2rFDqfqc12pcit6gTcc60yTNZpVnZuoWj5n4bL5IUCj/RbXdcEWee4H/Hxrk8OaOKcYjtzcDfEUsEssZp5NhyR45MT/lHZP/2frVatBwOQ4WEGbaGvWLa3c6kQzS3GtrpIxYXO+agdmF4WaAtzQsNLoL4Hh7cVOKloflbBAPnhYTW0IbP8QixaRGzdiR7HUhf12GIFKK4fWY/bd42IffrOoau7V/Bjye1du+Bfdb3tzsBzbHt/pfCu77fzNPxx7+xYm+nSzSun0rsEt/CYyFcMj4+liYUAMKo6Fy27UC12esPgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCh3w3rY8JdMlzOwVY1oKEt3qSDu4NfQ8QQCpWbtIUM=;
 b=mQMOrkxLIKZyWGco3aTQ/uZ9wjR9kqzp22uPazdn+XH35FugrpNCoMPrHiVLTHpZBcFGAi4vfMCL5KYzw/LkEgTOSClr5N8X6C5LIkoK1NTdqSuqDWyAEnHs6yjIBqcx5mNyAQDiUxhManISQXZkKW6/FLVaxGsmazOoKFPUMbXCKay2QmsKc+poxs6+6m7BmEOEAMyGbChyumrEHiCVgEIuTzXCshzG0ZmQNImlbaix4bgjqIEbLA4yJXfW7j14w1dykhMpqcyPKEqorO+n/EaPITg+bClGOg7yu6K2apFacDwflnVY9W6SOFh6n6nFXX8fK3gMWvzWLG3n3jUuEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCh3w3rY8JdMlzOwVY1oKEt3qSDu4NfQ8QQCpWbtIUM=;
 b=eof/T6Wyyk2+Zt5Hj4CqVIG3VNNBJ9Oz/6o7eOQ+nwi6L6yh71bpNxY7tYNlPvRhacoLrkbddhlC7OjQ3FAbywXfySIwEhvUyVSIwja763OZmjwvBSJwbvFcTQkORYZgBFEjBXOaVl4fWntClNUz6Ru0B9EV3B6IX4P65uHXk37xgDxT71rZ5ySisaxPVLn5Wi8XQyYmyPi1SCpJqyPzsjM2qHfHQPH3l+si0sHN5Kic3r5nEJG6T3Yi4qu7aAYJqRmIZ/2ZF8jyJf29oLroGicOGYhIfoRGwA3f13b6pgaPnimAhddhyz5ufUlPYB8RMBwmPqSl91K72rRCk4OtVw==
Received: from DM6PR14CA0047.namprd14.prod.outlook.com (2603:10b6:5:18f::24)
 by MN6PR18MB5468.namprd18.prod.outlook.com (2603:10b6:208:472::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 20:27:58 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:18f:cafe::a2) by DM6PR14CA0047.outlook.office365.com
 (2603:10b6:5:18f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.31 via Frontend Transport; Tue,
 1 Jul 2025 20:27:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 20:27:56 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 01 Jul 2025 13:27:32 -0700
Subject: [PATCH v4 08/10] arm64: dts: axiado: Add initial support for
 AX3000 SoC and eval board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-8-11ba6f62bf86@axiado.com>
References: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com>
In-Reply-To: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com>
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
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18250; i=hshah@axiado.com;
 h=from:subject:message-id; bh=j/+Qky+fPOazs6K3HBXW5y+0plotmY96K3xa4zO52Uk=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZES+iS3RNSiGO95QiQMpliCrxdGU+VjJ/T876
 g1ba8Jo4HeJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGREvgAKCRDxWHMRoTLV
 +yt5C/9xM5tw4tC0FlLWmMgxP0nm8ZSGDzTZE8ac3EUISUGiXbmb4vPE7Y2s2RIgZlFn/BnurpY
 eyDYq2O1Qo6bgsWG6jvDc7lL+G4bfzAOjMr0sIylURvRUSh2S/PdgaPWJ/sbeIeUShp0U8MXqAB
 VLbIs4mq8s3aU0GanihWRs08ozrqyplJpHeauQIUhmtc1f/DAhTrMb+mtuYLCOuMo8/QodZOoDX
 Q5wdHlL4Klvu2xUkecTz34mKMm9INuFTKkAfIdUF7n2StFHepruM8K0schHpz2eiPJwk3xYUwim
 bv4+a4WB8PlayUvcDKZEZoe32HS7uyZcdX4NCxAkCOCxpM3wSTV1pha3dSfD00PW07/2WLmGmEh
 EhErHCOmE4nQlTEKuuQmNnywPVYOUHWSJgqFw+uEGBlue44VDXiPP/NtkaJfcIycAxsuY0/qUbD
 SCRzJSoBj+y2Nuq+kptqDYaHnihqMqTS0/C0W+FxZgn8gLbC/NeVFZtXdgcte/l8uuN7Q=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|MN6PR18MB5468:EE_
X-MS-Office365-Filtering-Correlation-Id: 136597b2-c018-4bd6-f9e3-08ddb8ddc475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|82310400026|36860700013|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHJLNXVPTUVOMEtFUmFsYS9YaHZTOGxyeVgxRDRMdXhsZVNaTGZHZ0Z4bmUz?=
 =?utf-8?B?dmNqclB4VlRZOTIrZEJQRVFZUDRlNWlTSUJWb3lqa3UrYitKTzBlZlk4V3dG?=
 =?utf-8?B?dDEzQnJuWTBkK0IyRVArRHMxV2lBWU5EakdCdTNOU2dxcHlidFI0dGZ5UVg4?=
 =?utf-8?B?RHY4dkRuU0svalVZYzRtTlU1Zm9tNU5qZzN1eXE5NGQ5enlzRDJxdkdLaU5w?=
 =?utf-8?B?dDI1alFjWlBTVlpFaktKQ0tTV01iVlpJWWs1a0lDNUphanc0VFdCa1hwejdi?=
 =?utf-8?B?VmlYcmc4RmJZUk9CVXRraThRMEhJZ1E4QktzNnhpc3RqZThGS0tXOXREa3Z1?=
 =?utf-8?B?TW1wNlFHYUlHWDRtYVJmb1JML2pGbzg5NkZoaXFPYWhpYWVQNkdUdVRZUnhi?=
 =?utf-8?B?b2xYRytXcGdnSFpFaTZUWlIzeE9iQjhuUU93L3NtcnBBbDNxNXRNNTlOOEFs?=
 =?utf-8?B?a3hBRHIxNnpPaXJWdWJxOHRseC80dmIvOEtPT2l6UCtpQWRHak9HWnM2N01U?=
 =?utf-8?B?RXFZUmQyYmRueTFrNjg3YmlWWERtSVRRckk0ajJTdHhNeDFMM2w0ejRWRTRN?=
 =?utf-8?B?U1J2TVk2M2JZdnB5Sjk4c09CVzluTDlGNC9qRnkyZGRpS3M0cjNHa2ZRV1lx?=
 =?utf-8?B?UTdoMmNRbnVlN3ZYZVJBQjloQnZDaEh2aHdySHpvT2ZHekhTSXJqMzQ1enkz?=
 =?utf-8?B?ODJXZzkyRXFjZlkva1VkMTlYdEVEYnZieTI3VCtqTENsVFVOZ0ZFNEpjOC9Q?=
 =?utf-8?B?TkpDb2NCSXFVYnNrVEt2eWwwOW11NHNweEpnR25kLzdoWXFkQXpXemloVk9X?=
 =?utf-8?B?Q3ZzRTZCS0wzOCt6YUgyN3VkVURJNlFQalVMWDM4SzUrVkE1QVdYejZGRkww?=
 =?utf-8?B?dXdraEgrbGs1VzltVnBSaER6ejFGZWxMMlFEK25TK3VIU2hVL3NUL1BpR1Ex?=
 =?utf-8?B?bkkzMUZJc0dKRzdVWnE4ZC9VVjNQbFNpQ09kRWtVT1IvMzU2c3VaVHA3SVNj?=
 =?utf-8?B?aG9lME1JekpYSThSUlR5emI3WVlhdGxCcWRkS2hBdTNkM2ozbVJPeE5KbUNC?=
 =?utf-8?B?Qkk3eit2UzRvcktBdDBJNUVKeUhvRTJoZG9BVlBRUEtpRVgvc05aY05iNjRY?=
 =?utf-8?B?eHBwWkRzS0xqZ2Z3bjZFSGJIRFEyQWtWTjE1Vlc4U1FQVFB2OVZPdEx1aE1v?=
 =?utf-8?B?cmpYZnpzeUd6TzgraGRJeDF1Z0daeGxrblF0ZEM5dlFFY0ZoR3Iwclpyd0FY?=
 =?utf-8?B?dXVKYTZqQ05yTFFSMkZJdmlBaWxNeTB4WjJpeGlIOS9VeHBmVVRrRlhtYU9H?=
 =?utf-8?B?eW0rejBEaWFUN2NNMEp4RkFReTR2NWNkR29QODQzTXB6djY0Ulg5ZFFHdkhh?=
 =?utf-8?B?UjZnZFJXMXF6UzIwNEVmTDhIMzlWRVUyZERnTDlrcDdRSTZWL3hlYVRwV1g5?=
 =?utf-8?B?a3JYYS9oNDkxQmdBdUdTVEkvcWFtVFpyc1BJVFF3Z3BSc1paQzlldEJDOGVk?=
 =?utf-8?B?bjFNdFFLWjRuRENpSTdta0ZlRzNEN3BGdmVGQ3lDYWlwenhVM3lnQzEwT1E5?=
 =?utf-8?B?NTg2dG5aUXdsV0R1Q0R2NXZZd1JJOWNLbTE3TjBpalBFaTJDWkxVUVhNSWxP?=
 =?utf-8?B?KzRzMEMxUm53YzBtYk9JQytSQWtVV1pZK3EybjRyYnRmTXg0K1IrbGMwL1Qv?=
 =?utf-8?B?U0dBNTZTakpLaHR1dE1hUHVPdEpGbXhuU0hkOVJKMlRYNm54V1laRWp4UzdH?=
 =?utf-8?B?bEwxODJQV2w4L2FwbzU1a3c4NFJZOTliQjlnM3BHaTBIQ3NuZXRLczRoT0NK?=
 =?utf-8?B?VnZGRFV4SFRvZDhrYVZlR0VleUVXT1NnRWhRbGpCZjBrak05b0lBaU9wYksy?=
 =?utf-8?B?b053UEp4WG9FTkRNUlFKZExESVlrZmkyRnpFNytrUlRKK05vdk9aOERyczU2?=
 =?utf-8?B?USs3b00xL281ZVhBU0FkSkRZYS85TnhCSERkNUV0QTZGS3FoeWVqYmtZeUVq?=
 =?utf-8?B?eDREYk1LdnlvODNvU3YvZUxVTVgxQ3ZjT1VYYnBIanBjVDN2UTl4R1VwTC93?=
 =?utf-8?B?SzBlN1dXaEduQ25ZU2Fra09YMHI0bVF3bnNOUT09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(36860700013)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 20:27:56.7246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 136597b2-c018-4bd6-f9e3-08ddb8ddc475
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR18MB5468

Add initial device tree support for the AX3000 SoC and its evaluation
platform. The AX3000 is a multi-core SoC featuring 4 Cortex-A53 cores,
Secure Vault, AI Engine and Firewall.

It adds support for Cortex-A53 CPUs, timer, UARTs, and I3C
controllers on the AX3000 evaluation board.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 arch/arm64/boot/dts/Makefile              |   1 +
 arch/arm64/boot/dts/axiado/Makefile       |   2 +
 arch/arm64/boot/dts/axiado/ax3000-evk.dts |  79 +++++
 arch/arm64/boot/dts/axiado/ax3000.dtsi    | 520 ++++++++++++++++++++++++++++++
 4 files changed, 602 insertions(+)

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc22b17308554e502f8207392935b45..47dd8a1a7960d179ee28969a1d6750bfa0d73da1 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -9,6 +9,7 @@ subdir-y += amlogic
 subdir-y += apm
 subdir-y += apple
 subdir-y += arm
+subdir-y += axiado
 subdir-y += bitmain
 subdir-y += blaize
 subdir-y += broadcom
diff --git a/arch/arm64/boot/dts/axiado/Makefile b/arch/arm64/boot/dts/axiado/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..6676ad07db6129f8b333b0feffee705d272517c2
--- /dev/null
+++ b/arch/arm64/boot/dts/axiado/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_AXIADO) += ax3000-evk.dtb
diff --git a/arch/arm64/boot/dts/axiado/ax3000-evk.dts b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
new file mode 100644
index 0000000000000000000000000000000000000000..92101c5b534bfac8b463adaa1c4f0d4367d01e21
--- /dev/null
+++ b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2021-25 Axiado Corporation (or its affiliates). All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "ax3000.dtsi"
+
+/ {
+	model = "Axiado AX3000 EVK";
+	compatible = "axiado,ax3000-evk", "axiado,ax3000";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial3:115200";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		/* Cortex-A53 will use following memory map */
+		reg = <0x00000000 0x3d000000 0x00000000 0x23000000>,
+		      <0x00000004 0x00000000 0x00000000 0x80000000>;
+	};
+};
+
+/* GPIO bank 0 - 7 */
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gpio2 {
+	status = "okay";
+};
+
+&gpio3 {
+	status = "okay";
+};
+
+&gpio4 {
+	status = "okay";
+};
+
+&gpio5 {
+	status = "okay";
+};
+
+&gpio6 {
+	status = "okay";
+};
+
+&gpio7 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts/axiado/ax3000.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..792f52e0c7dd42cbc54b0eb47e25b0fbf1a706b8
--- /dev/null
+++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
@@ -0,0 +1,520 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2021-25 Axiado Corporation (or its affiliates). All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/memreserve/ 0x3c0013a0 0x00000008;	/* cpu-release-addr */
+/ {
+	model = "Axiado AX3000";
+	interrupt-parent = <&gic500>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x0>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x3c0013a0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x1>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x3c0013a0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x2>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x3c0013a0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x3>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x3c0013a0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache0 {
+			compatible = "cache";
+			cache-size = <0x100000>;
+			cache-unified;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			cache-level = <2>;
+		};
+	};
+
+	clocks {
+		clk_xin: clock-200000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <200000000>;
+			clock-output-names = "clk_xin";
+		};
+
+		refclk: clock-125000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <125000000>;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-parent = <&gic500>;
+
+		gic500: interrupt-controller@80300000 {
+			compatible = "arm,gic-v3";
+			reg = <0x00 0x80300000 0x00 0x10000>,
+			      <0x00 0x80380000 0x00 0x80000>;
+			ranges;
+			#interrupt-cells = <3>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			interrupt-controller;
+			#redistributor-regions = <1>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		/* GPIO Controller banks 0 - 7 */
+		gpio0: gpio-controller@80500000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80500000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio1: gpio-controller@80580000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80580000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio2: gpio-controller@80600000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80600000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio3: gpio-controller@80680000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80680000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio4: gpio-controller@80700000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80700000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio5: gpio-controller@80780000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80780000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio6: gpio-controller@80800000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80800000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio7: gpio-controller@80880000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80880000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		/* I3C Controller 0 - 16 */
+		i3c0: i3c@80500400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80500400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c1: i3c@80500800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80500800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c2: i3c@80580400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80580400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c3: i3c@80580800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80580800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c4: i3c@80600400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80600400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c5: i3c@80600800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80600800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c6: i3c@80680400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80680400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c7: i3c@80680800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80680800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c8: i3c@80700400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80700400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c9: i3c@80700800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80700800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c10: i3c@80780400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80780400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c11: i3c@80780800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80780800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c12: i3c@80800400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80800400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c13: i3c@80800800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80800800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c14: i3c@80880400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80880400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c15: i3c@80880800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80880800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c16: i3c@80620400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80620400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		uart0: serial@80520000 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x00 0x80520000 0x00 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+
+		uart1: serial@805a0000 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x00 0x805A0000 0x00 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+
+		uart2: serial@80620000 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x00 0x80620000 0x00 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+
+		uart3: serial@80520800 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x00 0x80520800 0x00 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
+			   <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
+			   <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			   <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};

-- 
2.25.1


