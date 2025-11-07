Return-Path: <linux-gpio+bounces-28246-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC35C4018D
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 14:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0719E424D4A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 13:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7632DC76A;
	Fri,  7 Nov 2025 13:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="MK1S6F9V";
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="MK1S6F9V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022090.outbound.protection.outlook.com [40.107.168.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015CC2DCF5D;
	Fri,  7 Nov 2025 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.90
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762521966; cv=fail; b=KQsMYmDIBcRmv0xker46VOp0QCdcJhe8xLirEV+jQt7zyItvXEP7gLyTDG+8nIGnxERq13cuADU52Eu/lI10JAmxl4iUtomS7ep5u1W7fQTlABPPtbY1jL0rP+pL6bmbpWDYV/fIY/PKDgfQ5L+71LKQGfGi3ChznwaYK0SzghE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762521966; c=relaxed/simple;
	bh=Bid/7uC9orsvZc+Bpf2KhOiuIL1jHjBWRlAqcc0D3j4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r8aE3t4qjjskYB1/ZreQPIGVnpizeI+5vo84A/Y0xVs7KE6ODVKllLqUigRJnLTiNWOUmUr1jePKqaMaIsVBAxachaAXgezJY9bnWaVB43m06ZI26qxOmI9BApUdcfYSmX4KGQKbTKQKUwQS6JglbQuC/GvuEX7hKMgl7N41R28=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=MK1S6F9V; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=MK1S6F9V; arc=fail smtp.client-ip=40.107.168.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TK6NdxZ7KyX8NcBApjOljVIpy7jRRnUn/NsbYct9oAPv9j1hT6eqQrh0clw/9+vtIapR4Mb+vktAHUOkP3OSCTDbgKXMP3NACbx7Lpc1SusduzzHAvvuP+OsmtdQU+gwXDFKMI/0BJS//ABd6wRUiiBvNzOvsjo5+tYsNwH8yQQkzhtFz/OiDX0X5bAUJrP7K/mZbveMyaXfCUOrKvfrTRLGKqJD6DZKekhd47KRjc64vDhKpmKjdhrdPz77IWFGyg+TSiFHw9bcLUzggWfcW/Se1XGB4/ovgjrPXtnrICnFzI6RNLFH5U8C5WJP75i6wCzegoaoLsnHqnVq+0S+1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYpQdLG7tLBHVFvYdQ5eLKQZ4gslMlujxtnkn/ImgAY=;
 b=InuM43f4gsBdOEVxO2GSwQLohp900ncKrwPqEhA3IYGP8PXIyiUzyHzN7vsfVyKx/nMPZ/a7LRIZjoI+Tyz16JH+jbzHlhnWCTCXni3iMmczLa1vG5SczN36IgWzVVOD45J9SaiTQLE8FF8OJnIvlrbUzDOTrx2+/Y6gmIipOKw8Zaq4k1JNwu8pH2BsVgQkx4qJubPwRorv5n2fAKJ2yWaT3v5A9U28QBwjiOKc0McsdaDTszRiPo/IMqShP4CKiriTHdqkirslEduqrpj6IRjEGuCJzbETZ3CBeDAGaBg02HDtwThQGZw+KndTMCmIaXL48AueHPcbar2/jJbdiA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 194.38.86.34) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=pass
 (signature was verified) header.d=duagon.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=duagon.com] dmarc=[1,1,header.from=duagon.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYpQdLG7tLBHVFvYdQ5eLKQZ4gslMlujxtnkn/ImgAY=;
 b=MK1S6F9VC2yXV3n9h3tHouGk4Faczc3BnezF2Ph/TkAiN6j6+AQ+1uFeigDmawfSd355tjKoNCKN6XeFQJz1BEqZSGDQSzolx5GER979NlU0QrM+9TA57pYPiBcV/qj6/Ka9F3gROuicGbNgHP6DjkuxHc6ruLRO1BwqiAx8mdI=
Received: from AM6PR04CA0030.eurprd04.prod.outlook.com (2603:10a6:20b:92::43)
 by GV0P278MB1582.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:6a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 13:25:59 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:20b:92:cafe::67) by AM6PR04CA0030.outlook.office365.com
 (2603:10a6:20b:92::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 13:25:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.38.86.34)
 smtp.mailfrom=duagon.com; dkim=pass (signature was verified)
 header.d=duagon.com;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 194.38.86.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.38.86.34; helo=securemail.duagon.com; pr=C
Received: from securemail.duagon.com (194.38.86.34) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 13:25:58 +0000
Received: from securemail (localhost [127.0.0.1])
	by securemail.duagon.com (Postfix) with SMTP id 4d30C34fSnzxpG;
	Fri,  7 Nov 2025 14:24:15 +0100 (CET)
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010004.outbound.protection.outlook.com [40.93.86.4])
	(using TLSv1.3 with cipher AEAD-AES256-GCM-SHA384 (256/256 bits)
	 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by securemail.duagon.com (Postfix) with ESMTPS;
	Fri,  7 Nov 2025 14:24:15 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYr3oQ8R1GSue7pPaAVKRXUQYtzMhf0kXeExO0yJ5Y+fUyTRw04hesS642F0n5hjp0lNRX64/7Y/ixt5x6dPj9XKeUQnE/cOvOGxNbfKg0ZwYLibvZonivYJIOotd7SYfF/6q71BBLpNi36lZ4XaAIMCWixUii9xY4/kEE7TpUkkSG2mVBq0zdeJungvHRkkJjGxfLWWgllXoijhog2zt0m3ap8MYJ/oDD8f8ZFL9g6NdYx0p/o1f0lL3l6wZV4hH3xw/SljCnpcreXGM1sZgnIk9wZHaLnsfCCAJDTs3+vBjqOu2y+vjo5uEeSm79gHDV+2ROjvJyQywFGVTTdSuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYpQdLG7tLBHVFvYdQ5eLKQZ4gslMlujxtnkn/ImgAY=;
 b=Xaok6MYlKEBnnSMyImoHLW+/vn6k5Ep7zgQQ9PTqBIIHRwrPACn3cO78p6ec0P9EXIOWA1Cvb4dJpsrK+uLh0TnSglXZm5GRACfiug+l7abFbtPiGI6KX4hSc3I7AVph9UDlrbI4E4OCwSVf06NzSFOmsLSTkzUUF89HWxJJcEZG08K1ZOnIv0kNlnt8hxXM6K9NzZQpydhFJeHqqXz3vHm4sVl9oAQxia25bgZUtSFCjtmRgh0GYHsuuVB6PB+vHqFlwxbPYYIn4H4kddwCf2utimezAx4UFTbXyJNpFI5j5D8SnSF4TfujnDXmcck1nb0VaTkWvj9+Klg7dEasNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.79.222.204) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYpQdLG7tLBHVFvYdQ5eLKQZ4gslMlujxtnkn/ImgAY=;
 b=MK1S6F9VC2yXV3n9h3tHouGk4Faczc3BnezF2Ph/TkAiN6j6+AQ+1uFeigDmawfSd355tjKoNCKN6XeFQJz1BEqZSGDQSzolx5GER979NlU0QrM+9TA57pYPiBcV/qj6/Ka9F3gROuicGbNgHP6DjkuxHc6ruLRO1BwqiAx8mdI=
Received: from CWLP265CA0455.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b7::20)
 by ZRAP278MB0031.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:12::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 13:25:38 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:400:1b7:cafe::6b) by CWLP265CA0455.outlook.office365.com
 (2603:10a6:400:1b7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 13:25:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.222.204)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.222.204 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.222.204; helo=de2-emailsignatures-cloud.codetwo.com; pr=C
Received: from de2-emailsignatures-cloud.codetwo.com (20.79.222.204) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 13:25:37 +0000
Received: from GVAP278CU002.outbound.protection.outlook.com (40.93.86.7) by de2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 07 Nov 2025 13:25:37 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZR1P278MB1236.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:6e::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.13; Fri, 7 Nov 2025 13:25:34 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e%7]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 13:25:34 +0000
Date: Fri, 7 Nov 2025 14:25:31 +0100
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: menz127: add support for 16Z034 and 16Z037 GPIO
 controllers
Message-ID: <aQ3zS2qavNf1g2Rm@MNI-190>
References: <e6107389-ce76-66c9-b390-4ce79a19c0d1@duagon.com>
 <CAMRc=MddjpF_GbJW-n8c9OTnAmMqb=P7NFZXR=3tPSRoHe8Nyw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMRc=MddjpF_GbJW-n8c9OTnAmMqb=P7NFZXR=3tPSRoHe8Nyw@mail.gmail.com>
X-ClientProxiedBy: MA4P292CA0011.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::17) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|ZR1P278MB1236:EE_|AMS1EPF00000040:EE_|ZRAP278MB0031:EE_|AM4PEPF00027A60:EE_|GV0P278MB1582:EE_
X-MS-Office365-Filtering-Correlation-Id: e18eb5a3-6ea9-46ab-d988-08de1e01303b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TGVkMkcxVXlnSHFPeUVGWDJ6MnFqV1hvSG9lZVpZUnlkWGtGMzNnNTVrSjVv?=
 =?utf-8?B?dkRaSTJqUE5WSFExUDQ4VlVjMEo3SFJBRVB6ZjUxY0ttT0xWNGJrUlJmOE5m?=
 =?utf-8?B?bHRHOXJQWjc2SzVVYzQrNXVaU21lOWlqQjNzTWgrN0w1aUlIQzByRkdEakRF?=
 =?utf-8?B?ZXA2K3I0YXFJWnB2cEhTWEl0ZHZWZFVnNndRdXRrWWd6TmZ0RjJudzZBRWgr?=
 =?utf-8?B?N0lZQ0g3eEtNVjM0N0tOOHRFQnZ4YlZocDRZK0hhNGtOWHVhZ0daSng3V1hW?=
 =?utf-8?B?OGF6TXNuVmlNMTNFanAvdEtyNzFCUkZZZ2JzeThaY1A1Qkc5M1dYb3ljMU5E?=
 =?utf-8?B?TVd3ejZtM1lIQjY2a3Jpcmd6M0NNRVIxTkxIL05SM3V2UmplQ0Y5NzQzcytK?=
 =?utf-8?B?SlFKQ1pGU3BhMzMyMnpaWDRBZGUyUVhTaEY3cmhWYmFCU3ZGVldaQVZFcjBI?=
 =?utf-8?B?TkZxUnA1QmFyS3gxYUI5c3pDc2t1QmVaQWViaERqNE1VUDZtaXEwRUFOYy9r?=
 =?utf-8?B?cTFvM1NVOW5PcmlPL2xkaHpsemhzQlg1YmFpK2paemVZelVhT1RkRGZDODVH?=
 =?utf-8?B?Y05aTytsRmpLbnpMS1NWSWUzNFZEaG1lT3BxTEtlS0tpbVpiVHovaDVVRFp4?=
 =?utf-8?B?RVJkTEY0R0E5bC9xZnJhQlIrSk5yQWZvNkhXSEhmalE2cjdETWV3Q09ua0hu?=
 =?utf-8?B?cUxwTFBQZUJyOE53MEdwUXF4dWxEYSs0SUQxY2xVRHRMVU1ZQmh1a1I1ZDRY?=
 =?utf-8?B?OHBHQnFkWW9KZXFZSVVZaDFzMU1nR1U0OHRValNSRDVGK0JCVW9JMDc3Wklz?=
 =?utf-8?B?ZG9SYTBrOVVPb3RETmdiY0tNMDlaK3pTWUQxTWVkV2dLNlVRWVFyeXVIQ01C?=
 =?utf-8?B?dkxScVJHdkw2dlBuM1M5QmtLY1Vrb0YyWmM2VUk2QVJEMFdrSUJpblIzUXNJ?=
 =?utf-8?B?dGpPYUtwSTNZZ1N0ckd4NCtncERHUDBmeHZXMVBvcDFuR2FhWVYxeEFoQVE1?=
 =?utf-8?B?MTR2L2lVNkVWd296ZzBkTjgwd1pHaWhCU3U1OFh6SkptK3hSem9sMldGNnRE?=
 =?utf-8?B?dHQ2Q3BvMnlJRjBJeVUwVUFSRlBMdlViRFl2WjZiaWpSZUV5bWlZSDZOWGFY?=
 =?utf-8?B?REFWaXdmMm80c0JFa2pkV1J3dFlZS2RWNzNYcW5WWDZ3U3oxT1Y2YzJTbkI2?=
 =?utf-8?B?QTBELzRIakpydDJsVE1yM1kzS0RPWUx6WHhrbjZPSVN3SjlQVmFMcEkzcGYv?=
 =?utf-8?B?a1kweFI4R1M3OFZ4SVhUVjBxOVZld1dmSkZxQ1hWYVdXbXBGSTlxZ2NIY3ox?=
 =?utf-8?B?WFlVVEN3YllmREducmNuZXhQd0t6eGhZZm93Z1U4RXFzTU9RNEs3Z1RISThC?=
 =?utf-8?B?SXhxc044OEhoSDBzTWJHdEh1eTZ6S1BjT2E5cWRmVE03SWRLRDRIYzUzSk9t?=
 =?utf-8?B?SGhQU0F6MDNUQndoaHU4ZklpSXc3cFNUa21BeXc4YXV6NVVGVGtSWDh3OUZa?=
 =?utf-8?B?Y2Vzc2hPN3greEhPK3g4dUM5QWhuNFRoS25lKzdqSUYxS25GRTJDZHZEYU41?=
 =?utf-8?B?eUhlSVA5Z0liT1plVXROU1E2Y3k2eUtybnV1N2xtM1Y5KzZlYXAwTXE3L0dy?=
 =?utf-8?B?enJMQkxXWGJFZEYwOXhPbUxEMjE2ME45bE1yWlF5YXZkZFB3bHByZjFvdFcy?=
 =?utf-8?B?dXVPNUJONDlJMEZxRUZVWjJzWUprTnlWVWFMVUZRT2FqeGlIS0tNaSswa3F5?=
 =?utf-8?B?c20xNGU4aU93WGNXb2M2OWdZYXl2YUJZS3kyT2VmZEtidSt1Zk5Cenk3VXQ2?=
 =?utf-8?B?cnBOaEt5ZmZXaWNrdzc5QzdYcjBDSTNYQnFtMVE5OCt1RWNNT09PSXZmNUhX?=
 =?utf-8?B?S1ZaV0tvSSs5bzFVU0NDZlBYVVIwaFBjMTJUMmpCY2RXOXFVYyt5eTVtdU1M?=
 =?utf-8?B?U2ZPYkxUQjVSK3RXY2dTOExIMmlPRitCNkF0V0M3NVJBZEZ2Rm9Kb2RzZWp4?=
 =?utf-8?B?NW9wc2praDE5STdsMTVaWStqWVU4OFh4eEFOdWoxckdqcFVMVDdCdUMyQjFp?=
 =?utf-8?Q?1Kti4o?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1236
X-CodeTwo-MessageID: 8ca24699-b34e-4662-a525-360bc34b45cc.20251107132537@de2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 df1dc2aa-19a5-4c4e-82f4-08de1e0121c8
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|35042699022|82310400026|14060799003|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UFZIajhWa2lJeHkzRFIyZWFTK0JSanY3NWlhaG96MUUzejVoTE9ZY1F6dkhK?=
 =?utf-8?B?YTNGL1NFS0prcks2Y29vMlh0aGxpakQ0eGpiVVhyVFlVc014Nk9rNmJPSEx2?=
 =?utf-8?B?eEtQSzlxSjcyUzMwS25IWWRtQzFmbk1VbXpnbWlLU2pwYzJJOTNZVGhSM1RR?=
 =?utf-8?B?cjkxS01FNld5YXh0dlcrQkN1c1FKTzZwYVlsQTNQSGw5ZDRyQnl6MnJUM29N?=
 =?utf-8?B?MHlpRmhtU3phNEJWdGQvTWh6NU16blQ5RXBISmI4RjYvZ1h4ZldkN1dqM3FV?=
 =?utf-8?B?Z2wzYzV6NkRWcE0zSWVUeHcySmkzQ2duWmpJdzlOTVpnUUxxYUVETWRmeTEx?=
 =?utf-8?B?M2Z1bmxabG93ckxUZEhXdjRiTmRNdE8rNml5am1hWTIvSlQwMWRXdlVneWZD?=
 =?utf-8?B?RGhCTnVEeE1lUEVINWZWZEppSFlSeGx2SFYyeWd4N0x2NTkwbU1ZSmsyMjlL?=
 =?utf-8?B?MjlNTFhMcTZMWXpkOFJxUjEzOU9QTG5qWkhSL0tlZEpwcm5PRGpId0JGRUhs?=
 =?utf-8?B?aXpHbHFTZ0l2eElheTdHWkwzaWkyTmFrSjllYVhMRzdWYVp4K21leENZQWJt?=
 =?utf-8?B?aHNRWVZ4RXYyUWNvc0RZOG1lSmpjKzl1d0VQNjJoR1hNblFQTWJycGJYaUJo?=
 =?utf-8?B?Um40d0NTRFZhWERhTE9ndkdJVGwzb29Zcjl4NVNNM1FWdXc0dUlNdTJid1R3?=
 =?utf-8?B?ZWdmYlZQczZhTXB2OUlHU0lMNll0bGpyaGxPVE1iaGlIei8yQ0Irc3lkdC84?=
 =?utf-8?B?L1B2UGl2N1diSGpiMHYrRnBCUndQbDk2T0xlOVExRGZ3ZXZGU2phRGhZMGF3?=
 =?utf-8?B?ZkpVcW80WlZOd0VCaVJvdGpCSE9keE9GZ0RjaWtsWjRYdVZKaDJ6OHRKOG8w?=
 =?utf-8?B?aU84dWc3M2Vhc0RleUtTMGNEUUpXbGhsM25iY2V1VEJxTVMyRlF6SUlNQTdU?=
 =?utf-8?B?UWhJMWRQc2dxSE5xSnF1NG93M2xyV0JXQ3lIWjhmY2Vyaklocm9YdmN3VUxO?=
 =?utf-8?B?TFJhVjA3ODY5RnJYSkdsc01aYnlhWG1sYnFsNXZXemVKVU9jTCtYREh3R0Vp?=
 =?utf-8?B?Vy8xMVhTaU5ZSlpibGRhL25SMUdhNUhPUk5IaklBYWYxdU8vcHprdUJtc0gv?=
 =?utf-8?B?cWJVV1htQVQyQVVLRm01Vmx1eGN3REFNVG5qSTNOYU9hK1VjTzdOS1dqWkpr?=
 =?utf-8?B?bVptTVV6NWVtTWFQWGRTb3lYVFcwUVBzbjBNOE01WjdFN0xPVHdSdWZnRFpn?=
 =?utf-8?B?bmlmMG9iK2pJTkxHeURxOGdrZlRlak1Ccm1uVGl1NkpwZjJTNUViRVZPRzl0?=
 =?utf-8?B?ckFEY2RDWkl3Nks2bW9kRndMNVBTZS9YeVhzRmRjVEtteCtjY0p5ZUFMbktw?=
 =?utf-8?B?MkVPNDVKTElxdVJZa2dmYThIa0hBSDhUeGZCbnY2Q29YUTFFYXlWTlFjSzdC?=
 =?utf-8?B?SnArb0tpUXNkdTQ0VnlGaGlIRFRUb0t1RG1GeEJHMjVwVUxLZjdlVWV5Y0hp?=
 =?utf-8?B?eUNMRFNhQWFpYnhhSXNaR3VxTHV0b2hrRFBralN6am1sYjdDdUJxN3dEazJM?=
 =?utf-8?B?OFY3RXpLUTZLUnVMVHVweFpRQi9FMVhBWjNiL3hCbkRGWmhCWkhaRy80Vk9I?=
 =?utf-8?B?M2g0ZnVZSnJyVUxBVHV4Z3NUcFp3UzlDVms4UzRnMGRzK3lFTnYxK3JwUDFj?=
 =?utf-8?B?YWN0UG9JQXYwKzhRUVdSakZOKzhSa2pTZkRhYmY5ZXBWZWNObUxRUXVoVXFW?=
 =?utf-8?B?VVI1UHRDQWtlTEswWnpPcVIvQXh5VFhwaHIxN2w4WkZFSHpLQkN5R3lsVG9w?=
 =?utf-8?B?UDJJaUk5blBzVWw4Qlp0ZDNjR0ppR0Z0RFE5K1dONGVNUHM1TzdQTnFXRVV4?=
 =?utf-8?B?TXk1T1kyWUpEdHZLTStyTWQrSjNlVVZIdGxYaW45ZmVxNW1pVXJZb0RmY3dl?=
 =?utf-8?B?Zm8ra1ppcjhiL21GOC9tVzJHM3JNQmVwakFHOXFNOFdMbmtUWk5MS05lWnRq?=
 =?utf-8?B?bnhUVXhEVWlVbUtCNmNST1RlcS9pNU1NRm9sRXZIaXdDWkMzcWQ1TU4wODNu?=
 =?utf-8?B?V0tGZ3RXV1dpYVo0V0d1U3p0U2pDcGlvSVBJdGFNVnJZK2tHbXZSWCtEOXNU?=
 =?utf-8?Q?2/XA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.222.204;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:de2-emailsignatures-cloud.codetwo.com;PTR:de2-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0031
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ad28aa2-82b7-408c-0a7e-08de1e0123f6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0NrZzVmdlpHYTVDYkZQenc4cDFzcjFDcDBmeEJSMUYwaUlTL0RGb1hDUGNz?=
 =?utf-8?B?Q0RqYUk0YWZFcWtNVzdueVN1Y3NXRXBEZ045c3JDUll3UVU4c0lrUVllM3VV?=
 =?utf-8?B?QXdZeDlzUWZUdWtnMThkZnVEMllOR2xsOXJqNTRPUC84QVZ6VHhWVEhzL3g3?=
 =?utf-8?B?RUxPVy9XWUo4UEtYajVxb1ViOU9VWUF0TGt1RzFXSGxiSkVvTU9aTng2aDFv?=
 =?utf-8?B?cW1PdGxkNlByOWFnNkJoZk5Jb0E2NEp1bGliVm1TSDdPOUF5K1p4TzdqR3V2?=
 =?utf-8?B?S1JvTkRBa0VIOUdlamQ0TkFRSVpNN3NQeFQxZlZWUCtHVE5hVVIxaG1lQ1RW?=
 =?utf-8?B?Nk10R3JOcWNwZW9nbkh5UHc2OHFSdjR6NHgrR2p6UWg5cnB5Y0ovU0g3YllK?=
 =?utf-8?B?WXRjcWt4QW0yQjQva3hUVmpER2VncEhiclRLOHBKaWZITG8yZGlvOVVBNnJv?=
 =?utf-8?B?K3BvY1ZTa3lIajdicVhPZ3l5a2p1YkRwYXBaNXI0Z1NUYW9zN3JJRnF0aEpG?=
 =?utf-8?B?RkRuRHVGcVZSMlc0QWZEamxWYW5MM2hWb3p4dWloL2VUVktTaEptQVB1UVpi?=
 =?utf-8?B?TDkrc2xMTjBvcGtSTnNYUnJOWnpsdEpFcURZVmZtY1MvRURKOEN1MDZWUkll?=
 =?utf-8?B?djZNVGsxMjBWeDkwc3VkLzBONFQ4Z1kxclhZS0FkU2JVWmhMTUpBVmZyTU9h?=
 =?utf-8?B?YXl3N2hxNVdEMDdEdU41dnZpR0QyYWd2YXkxSFZqVE9xb1d5cU1JbksvN25Y?=
 =?utf-8?B?QmQxMVhxQk82WEN4OUErYWMzc1FrdHRGcUk5US81UHhHNWprcERTNVZNWnpF?=
 =?utf-8?B?aW10cXkzOXVHTVVGQnpwUytNMXJPSWl4ZlAwMEMvVmNGVCthM0FDd2tLblp6?=
 =?utf-8?B?UXlYY2p0LzlJZ3ZSaDYxSjRLRHc3cnVKWEdSd3owZ0o4N2IyRjdRdSs0TzhX?=
 =?utf-8?B?d3ZGVkowWTJpMXJ4THdYYnl3NEhTajZIcjhqT09zOXgrTTFaQjlnRWVBdUVJ?=
 =?utf-8?B?ZStXclloeE1LT25JMWZJdHRCWXpORU55VEhzY1RiOWw5aUlGQTNldVJRa2Ix?=
 =?utf-8?B?WlRrSlpiRzdLc2huYXlhWlc0M01haUdaLzBWcTJPSFVwREkwcVozNzBWSVYw?=
 =?utf-8?B?VldsYmRCcW40UWNiWXBwWGJ5cVJ1a2hBTHpWTk54OHMveUlmSG5HNm9JWHd4?=
 =?utf-8?B?VjhzWVc3TTF5R3ZJcEEvUHpuNkZVeUlOQy9OMGpvWnhxTHJFSTFrK2RiSW93?=
 =?utf-8?B?MUxUZkFaNjVhM2VscnJ6bktnSzB3LzZpZnQweXdUNzNNOU8yS3JST1JLZjF1?=
 =?utf-8?B?VHZ5KzRJcmdwcjVqbS96S3ZhNkJBTDE2NzRWRzdnRmNDeVNZTzRBS2VrOUky?=
 =?utf-8?B?b2E2WlM3SnM2dW42REk5dXZNTm9UTW1oa1k5WUNTT0lCeks4VjRLM3Jrd2d2?=
 =?utf-8?B?emhpa2xGYVFtdSsveWdUSTFnWXRyMXE5OHBiSlVSNmdQMGpGdUJEUXBUSE5P?=
 =?utf-8?B?RXcrendTTE5Uc2JGS0NBQyt3MzlSa0xGMVhuY3BwNFkxRkFRZEY2T2xmQVpm?=
 =?utf-8?B?VzVGaXRQMmt4cjZOaC8wSFBneTBUL3FwVWFNYVZrNVBWWVB5d08zaTU0OW1k?=
 =?utf-8?B?N1hTRVNIN1RRRVp5WG1PVHR0Q1pRTUs2Wjh2cDhSakcrYmd0WTU0OVBtcXdX?=
 =?utf-8?B?S3Y2OW85a1crMXczZkVGSDVWQllvd3FQSUFENkJSbkZQQjJGK1JwN0dkeHBN?=
 =?utf-8?B?Uks4c25WaUJFdTNtZlVTRE41V21oWktUVFFlM01Cck4wMmNEU3ZOazhtUmpp?=
 =?utf-8?B?ZDBDS2JtSTFoenVYWDkySWdoRWd5TjM5Qmt0NVQ2WEE3MlBaeVZycUlvZTRS?=
 =?utf-8?B?N2h5Q1FETmV6aXlXNmhQakNsbS9lME0zYzFiOGNwSC9NOE4rVS9XNVI5Rnd4?=
 =?utf-8?B?Mm9SVDljdlMyVHBVelUxRjY1ZmpsZ0s2T2VKcW5zamxZaHltdXNyZ0Nxa1Ry?=
 =?utf-8?B?VUU0T3JwMEZiVnZFSlFxWDZva0JpTStRdHZYNGtZK0psaVZuSFI0RGY2OUdJ?=
 =?utf-8?B?UVU3YXBzc09NYnoxSjMyUXVoSzhMYTlLMGt6UjY5Rk1oeEdjcThnbENuTVhq?=
 =?utf-8?Q?0/WU=3D?=
X-Forefront-Antispam-Report:
	CIP:194.38.86.34;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:securemail.duagon.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 13:25:58.3807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e18eb5a3-6ea9-46ab-d988-08de1e01303b
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[194.38.86.34];Helo=[securemail.duagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1582

On Wed, Nov 05, 2025 at 09:36:52AM +0100, Bartosz Golaszewski wrote:
> On Fri, Oct 31, 2025 at 11:08=E2=80=AFAM Jose Javier Rodriguez Barbarin
> <dev-josejavier.rodriguez@duagon.com> wrote:
> >
> > From 7655a73f3888a5d164d1f287ba1f2989bb2aadd2 Mon Sep 17 00:00:00 2001
> > From: Javier Rodriguez <josejavier.rodriguez@duagon.com>
> > Date: Tue, 28 Oct 2025 17:40:14 +0100
> > Subject: [PATCH] gpio: menz127: add support for 16Z034 and 16Z037 GPIO
> >  controllers
> >
>=20
> I don't think you used `git send-email` to send this, did you just
> copy the contents of the generated .patch into the email client?
>=20

My bad. This was my first time using alpine mail client instead of using
`git send-email`. Since your answer, I did some local tests and now I know
how to use alpine for submitting patches.

> > The 16Z034 and 16Z037 are 8 bits GPIO controllers that share the
> > same registers and features of the 16Z127 GPIO controller.
> >
> > Reviewed-by: Felipe Fensen Casado <felipe.jensen@duagon.com>
> > Signed-off-by: Javier Rodriguez <josejavier.rodriguez@duagon.com>
> > ---
> >  drivers/gpio/gpio-menz127.c | 36 ++++++++++++++++++++++++++++++++++--
> >  1 file changed, 34 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
> > index da2bf9381cc4..ec9228f1e631 100644
> > --- a/drivers/gpio/gpio-menz127.c
> > +++ b/drivers/gpio/gpio-menz127.c
> > @@ -24,6 +24,12 @@
> >  #define MEN_Z127_ODER  0x1C
> >  #define GPIO_TO_DBCNT_REG(gpio)        ((gpio * 4) + 0x80)
> >
> > +
>=20
> Stray newline.
>=20
> > +/* MEN Z127 supported model ids*/
> > +#define MEN_Z127_ID    0x7f
> > +#define MEN_Z034_ID    0x22
> > +#define MEN_Z037_ID    0x25
> > +
> >  #define MEN_Z127_DB_MIN_US     50
> >  /* 16 bit compare register. Each bit represents 50us */
> >  #define MEN_Z127_DB_MAX_US     (0xffff * MEN_Z127_DB_MIN_US)
> > @@ -36,6 +42,25 @@ struct men_z127_gpio {
> >         struct resource *mem;
> >  };
> >
> > +static int men_z127_lookup_gpio_size(struct mcb_device *mdev,
> > +                                    unsigned long *sz)
> > +{
> > +       switch (mdev->id) {
> > +       case MEN_Z127_ID:
> > +               *sz =3D 4;
> > +               break;
> > +       case MEN_Z034_ID:
> > +       case MEN_Z037_ID:
> > +               *sz =3D 1;
> > +               break;
> > +       default:
> > +               dev_err(&mdev->dev, "no size found for id %d", mdev->id=
);
> > +               return -EINVAL;
>=20
> You can return dev_err_probe() here, it's only used in probe(). But
> TBH probe() is so small I'd just inline this into it.
>

Thanks for your suggestions. I usually try to implement small functions for
improving the reading, but you are right. I've moved these lines to probe()=
,=20
using dev_err_probe() as well.

> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
> >                              unsigned debounce)
> >  {
> > @@ -140,6 +165,7 @@ static int men_z127_probe(struct mcb_device *mdev,
> >         struct men_z127_gpio *men_z127_gpio;
> >         struct device *dev =3D &mdev->dev;
> >         int ret;
> > +       unsigned long sz;
> >
> >         men_z127_gpio =3D devm_kzalloc(dev, sizeof(struct men_z127_gpio=
),
> >                                      GFP_KERNEL);
> > @@ -163,9 +189,13 @@ static int men_z127_probe(struct mcb_device *mdev,
> >
> >         mcb_set_drvdata(mdev, men_z127_gpio);
> >
> > +       ret =3D men_z127_lookup_gpio_size(mdev, &sz);
> > +       if (ret)
> > +               return ret;
> > +
> >         config =3D (struct gpio_generic_chip_config) {
> >                 .dev =3D &mdev->dev,
> > -               .sz =3D 4,
> > +               .sz =3D sz,
> >                 .dat =3D men_z127_gpio->reg_base + MEN_Z127_PSR,
> >                 .set =3D men_z127_gpio->reg_base + MEN_Z127_CTRL,
> >                 .dirout =3D men_z127_gpio->reg_base + MEN_Z127_GPIODR,
> > @@ -186,7 +216,9 @@ static int men_z127_probe(struct mcb_device *mdev,
> >  }
> >
> >  static const struct mcb_device_id men_z127_ids[] =3D {
> > -       { .device =3D 0x7f },
> > +       { .device =3D MEN_Z127_ID },
> > +       { .device =3D MEN_Z034_ID },
> > +       { .device =3D MEN_Z037_ID },
> >         { }
> >  };
> >  MODULE_DEVICE_TABLE(mcb, men_z127_ids);
> > --
> > 2.51.0
>=20
> Bartosz

Thank you, I will submit v2 with these changes.

