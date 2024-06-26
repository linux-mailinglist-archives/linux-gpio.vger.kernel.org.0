Return-Path: <linux-gpio+bounces-7740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 557A99198A4
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 21:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 095892828CE
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 19:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9431922F8;
	Wed, 26 Jun 2024 19:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G61Qab84"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A567191499;
	Wed, 26 Jun 2024 19:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719431983; cv=fail; b=iGyVfEK/5IJcbgBQTzRcJIffi6oXtz2wkPr99VDcN+J1BL0JZgqWwSWu1ng6s3lSh/CEKLMU+VjWA3fYsLyxKKSVDkoVLS6t70SdPSDa93E2dLGA4BofQMaU5dfz9H6A87FhiKw7CY0BO31TZQ4S06af8IOfycAceonet3hRTig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719431983; c=relaxed/simple;
	bh=FHHUoqxX3fWDQoo2c4zy/A0ncvF9Tiu+JPpskQnHtZs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hP2a44PlolUAhVfQoDZD8KtmMETZ8Lddyi85t9u1vN0NZs5lu5lLJkNKSZRoJhf74p86APZl0ixQm17hcnyj0pa+52KIBuOzVY4pj0eFI+JhkwpgneNSqqnxZyqoyJFXoxUW3WIK4HdpYgkOK1LhhEpq42hOref5FO0ydPymBas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G61Qab84; arc=fail smtp.client-ip=40.107.243.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mmdsdigd1Ht4C/Ngk0UUKJLK+fPAGFlp6D4qUveZSM4U50pgDyX4HrtyORXKSLZ4DiuGE/csIiUlq8NJvnr8wG/7wuPraas1IV1hV7zOgLW2kpxn3yrbYru3wM6m5z6ek+IUGW1m9kOOMLdfZbaXh+gaVGRMe5z1gbfgpwFCJ6zlOvOye1LWtfjtzpKnICXLquz/U36nlnJPu8h5UF1uw+cc0DuxNHCSi/g8Bt5e+qpVyHcoJr1Mt6sINLbwWq0fHTk/3GEXCz1nfDN8MCWRTzmeddNGMnVDwziq+LVqLU9ywIl3T72KIxwwrFA2/w990uu4txJdDr6Nb0Ww3/iWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHHUoqxX3fWDQoo2c4zy/A0ncvF9Tiu+JPpskQnHtZs=;
 b=AgH7xDPAg6rN6UEjO1yK0sIr6vc2VpWFESCc6eUhIUdBUihvLm7CWwT82Jsf6KU8YPk+VOusztsvzZcymomisgDGookOlDRD1mGppVCjJWu0jKm32+6wG9QzMPGkKA3sGdXKUf0cfApqzxge0Pg3uxrMgBS3ma5mH6zXjlAaWc3KOKkSYdAmfXISMVemqIjTZ30WkZaVSkJZTsLM5n4TcbxO33FsoTENAPRSkKozwhA1tpMMqfRJMTRK3S5pgEpNY6Y86ekg99wqzhF1I7IHCfZUY3QshMCP2u/84S+L5mY/0cVy4lZPXAqWhWQRNl4XtjNOxb2I8qW9ItpYte945g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHHUoqxX3fWDQoo2c4zy/A0ncvF9Tiu+JPpskQnHtZs=;
 b=G61Qab84JnrCK2pQPHgwPyQNdzZJV10zvKpCfvj9IUIdsU/gVijjRwhYJvFrxDD5a04k7VJL1oUIi+/UP9Ej78cA8jQZqnEnLyYMh2373CVHyolnu0TfefKGYNHY9QiVHLUXL7UvaiqDXh2ryuWYBa9LvUJwm65i0CyMINPKy+1nRhM7ZuJvJRWD3TCBjdVXils2cjYJSIJxbOU91nm9C4PoPhN41xLBK65RF6rg3F7ePM5qIC3lBdcJ33jr59W4TIatQS3chywKnlM18/2Ln6yF7B0B2Z049qG4T1gYlREVxf/xgbYIEeg24+rhRD1k/zMUVPxiXkDAwfV4nt9ObQ==
Received: from PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 by MW4PR12MB7031.namprd12.prod.outlook.com (2603:10b6:303:1ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Wed, 26 Jun
 2024 19:59:37 +0000
Received: from PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d]) by PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d%7]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 19:59:37 +0000
From: Asmaa Mnebhi <asmaa@nvidia.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
CC: Shiji Yang <yangshiji66@outlook.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko
	<andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Mark Mentovai <mark@mentovai.com>,
	=?utf-8?B?TMOzcsOhbmQgSG9ydsOhdGg=?= <lorand.horvath82@gmail.com>
Subject: RE: [PATCH] gpio: mmio: do not calculate bgpio_bits via "ngpios"
Thread-Topic: [PATCH] gpio: mmio: do not calculate bgpio_bits via "ngpios"
Thread-Index: AQHaxp4vrmshrWYuwESVGOzheqoT1bHaJKDggAAG/gCAAAFHoA==
Date: Wed, 26 Jun 2024 19:59:37 +0000
Message-ID:
 <PH7PR12MB7282028713977D608DBC046FD7D62@PH7PR12MB7282.namprd12.prod.outlook.com>
References:
 <TYCP286MB089577B47D70F0AB25ABA6F5BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
 <PH7PR12MB7282BBF9E42265E18CB72E09D7D62@PH7PR12MB7282.namprd12.prod.outlook.com>
 <CAOiHx=nssvX-VYySmpLZ8bvBmitT87bX2AYspdkH3y9iWTB+kQ@mail.gmail.com>
In-Reply-To:
 <CAOiHx=nssvX-VYySmpLZ8bvBmitT87bX2AYspdkH3y9iWTB+kQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7282:EE_|MW4PR12MB7031:EE_
x-ms-office365-filtering-correlation-id: 3c4afd06-2d90-4f21-b6cb-08dc961a81f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230038|366014|1800799022|376012|38070700016;
x-microsoft-antispam-message-info:
 =?utf-8?B?cWFFdEpGZjJoeDZBWWZ4alhJY204UC85bXVtNDhJVGpHUzhrYll4SFB1WTI4?=
 =?utf-8?B?SERRaGFhd2FPNzhwUnJNKzJjaEhPT3ZlWUtVNWJqZGlWL0hWeTliWlBGUURU?=
 =?utf-8?B?b0tKQ2xnRGhLVzAzR0tVWWNFN1JxOG1LaVpBNDV4SWtzQzdoQk1MMGZJTEd3?=
 =?utf-8?B?WmR6dzlVR2QrdzdLdDJsWXErRHprTFhvcitvOVFIZFdPYmVCVk5KUFpEeTc4?=
 =?utf-8?B?NFMrRy9DK0QwQXFBSWV2bTJpeGp6K2tiMktpWUQ5QkVSSGJ4UnJpaGFPOWEw?=
 =?utf-8?B?NnNsR2RkYkJDQzlOcEQ2VzY4K3d2SHF3ekNNMEJpVncyMlNBRHdSVHVMcUVx?=
 =?utf-8?B?ZlRDZzh6QWQvaXFQSHVPNUlNSzdtSFNjbkVoYUc5OTRRUkhxc2lFK1BTZkdp?=
 =?utf-8?B?YlVLd2k2VG93d0ZWOVRSOHIyNDVzeUJpdlFRRzVMVGN1bUZmZWl4OFdmdkZB?=
 =?utf-8?B?Nkl5TmgrazZkbVdOOFhiVkt3dmZQZmJvS3Njb2Rna1BkYUx5UTk4N0dhU0lL?=
 =?utf-8?B?R3NrcU9OQ1M1a3J1NjNqaDR1RnJVZzVoK0RsUmVjOEkwUEo1NWE5a1pySlBp?=
 =?utf-8?B?VUZFa0dMK1g2TWVHWVREbGZRYUhyUFk5MXphMUdqY0cxMWxjOWwxdy9JaFpi?=
 =?utf-8?B?K0pCelhnSGFEdUUyNEI0Qk1NTUhlYTFyeUFKazgwcjBZakNRM3RlUlJYMFZM?=
 =?utf-8?B?VG1DWklJdnFZTEtxVFZWWTVibG8vU2U2aHpFSk9ObngvUEVWZHRYWm1uT3VE?=
 =?utf-8?B?WURsdnNObWJzczBUdjBKTFN5TGY2ZGpwbEpUc2h6bnhsOHFpbDVkd0c5eDdW?=
 =?utf-8?B?ajN3ZWpDMndBN001MXFjZXRKNDNFa3Z5WDhjeFduNHdjaTl3bnFTSUJ5eGJt?=
 =?utf-8?B?WWFTZUxpSTRuWTZlb1FGUkU5d3d1OWcrQjBKUUxSRjdCQUErT0hlbkRkeHgv?=
 =?utf-8?B?bEozUUxJblE4WElMVFFYQ1VNbytkNDRiTHE1MWpUelJMUjhVTUxIN09QVEVv?=
 =?utf-8?B?UGJ6K1RaU2l2bDh2SXJwbi9kTnFMSmhkZG1GVnUwOUplV1NvVVYxYmZSQ0lu?=
 =?utf-8?B?N2pKM1dJVnRCUnArdVZWUzByUy8wbG0wcHRDN2tVWTYxT20xT0Y1enpOd1Nm?=
 =?utf-8?B?MUFxM2NCS3dLeCtWbXVTaUNmcHB0MUJWYm5DVkIwaFdub2kvWUdsTk1zdGZH?=
 =?utf-8?B?Qk9HRUVSbU1VdzBqSkJmTVA0RGNjN1hhYm8vRWl5b09mZkJwdWN6Mm5qMk1u?=
 =?utf-8?B?NUg1bGdzSVIzeGVpOWtGUXZydnVBSVJGMEwrazJjMk9YM2VuME5aTFZGY2Jn?=
 =?utf-8?B?dnJ4VzByWlo3Wi80cHpoMlQ2S1JUbUR1MHk0WG1tTDVZR1UxUnZQODk5UkVD?=
 =?utf-8?B?M3IxM3JFR0RGN21IWE0zbGRkMkRUTWJWUURjc2RBSU5aaHhsL0QrVWh0d01R?=
 =?utf-8?B?SWYvMVVlNm9jS0JxOSs4UGZjclB0MWVDZnRuVHZjZnFyRVFScU9HL2NzbTRa?=
 =?utf-8?B?SkdCVEorUEJDc2s1VmRrY1NTWVZneWN4QTlmU1IvWktnbVlZcHVneW0wcFlM?=
 =?utf-8?B?bW5la3NsbXAvRnJPZllNMFFRRXBtUXpQSi9wNXI1WkdHL2xPVkMzc2NINGZS?=
 =?utf-8?B?YVJ6YkhwWGUvOWZFQXhVWnlRTy9EZ01QR2phYUNndmN3MlFQYzhYVE02c2ZO?=
 =?utf-8?B?Y1VZMXg2Y1ZaYTlaL2EydWRLdVVpUEcvVUMxUTQzQmR0Und2UFNrWS9scGxR?=
 =?utf-8?B?WCtaK2h5Mi9ZR0RqUjhRV3l3aDNXVDJhMEgwQlh4WDMzcG9SaGZua2tvYVRN?=
 =?utf-8?Q?uQTKipr/0+loTowP/cBQKuW3QEWZeRFBUrhCU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7282.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(1800799022)(376012)(38070700016);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZFR6Z3dwL1ZGN2NzL1REaThUeFhNcXZqSGdZOXpmZHViN2dBY0ZSM2s0Rlk0?=
 =?utf-8?B?Ylc5OHdqRFg4OG1rUkNvajB6MDNPZXBTekdYMzArUW05ckJYaFp5bW1NUytm?=
 =?utf-8?B?Y1N4L0hwY3M0RUh6VWdFWGR5czdzeW9meFgvVXpJRFpTNVRqYlVjdFVoUXh0?=
 =?utf-8?B?VFZ5U0RURWdyVGljRVNVU0laMnJ6eTQ4dHBVWDhSV0l4Q1FDWjJTSmViaFR3?=
 =?utf-8?B?OVlORG5OU3hJOEh6Y2JxZ2lVRTdDZzJYN0xHZXlQTWQ4TkN2T0Z6bWRpOUFy?=
 =?utf-8?B?MDNNc0pPeGlUTVp2b3NUak1qOEJTcUpmb0R1ODBZN1BLZ3dMMUVydDBNWjZF?=
 =?utf-8?B?TmhDeGJSVHFIL2RsRS9ocGJTaWRTTHVjeGhkYXdTVlFtVDN5aTJtWHFxSXJu?=
 =?utf-8?B?RC9IYmZRVnBpYXMwSFhRY2t6RWpROC9sNzZ1ZVhaUDI3OFRMZ0RmcWZOTmdz?=
 =?utf-8?B?WDRzeTducEhFYXIrK0ZOSE9pczRpQlhIZ1NKZDh1VVN6cHFUbDh6ejNLOWRk?=
 =?utf-8?B?Ym9LcmZKR0pQZDNySWVlWHlrMXFhQkUrc25LZUdDWUE4bVROSHFDWFVMaGo2?=
 =?utf-8?B?eENNbXhVSEZvWUVKOElZcjVaZ0kwQWZmUGh2NWJ0K1h4L1dldWxrbGFQTi9t?=
 =?utf-8?B?Q0hBejN1V3ZqckNMREJhZVcyR1ZSWGZ5Z0JuMHh6YTZVU2lVRGhSZFBoZDZY?=
 =?utf-8?B?WE83cm8rVkZQSW1zZU15UXg0bWlEcm5YWU8rOVBBbTd3MmRQb3Vla2xGYXR6?=
 =?utf-8?B?WFBSYUZmZDVMTnJIWWtWRGwxb1VZdDVPTWVrQjloallSNkR6YmpSR1kyV1p5?=
 =?utf-8?B?N3hBRlVsQ1RoWFpWTStQalE0QnJ0MUZ5QzRMRkRXQVg4ZEVUY1BIek92Y1hC?=
 =?utf-8?B?dW92M2JDeWRNSlFNeHpaUmlLa1p0SGlmR25FNjZqeW5OV3UwVC84MTBCQ2dC?=
 =?utf-8?B?dHh5V3d1VW5Id2dPekZFUkUyNGZnRFBSSjFpL0VzL0FjWitEZ3NlMm40WEVC?=
 =?utf-8?B?akF1Zkw0Q0tlWGw0dHF2ZTNFQ3ZqekpweTg0OGtTRnFrUktwOUlqOG5Gdk51?=
 =?utf-8?B?WjV3N0E3ZVUxWjdVTG5Jb1NsbTBzUE9xRG5PT3cyTDg4NUFjaGFtV0JpSk9u?=
 =?utf-8?B?dVlXdVRmZ0ZKU2VwbEZEaFAzbUZuaHdXVWY3VDdVQlBTcmF4Sk55WTlaVXBP?=
 =?utf-8?B?bUtBTVNoTXozNHNmM2p1VkZrMVBtVGZISXVnNzZpemExQkNmNVUyTzhIZG0y?=
 =?utf-8?B?Q21ZZCt4ZnRwOU1WbkFoMzc0RWx5Sm5ZZ0VDMkxlTm9EUlJpVllEOTFoaXo2?=
 =?utf-8?B?Z2xCSFl5M1dMcFp1Rk1oK2RiM3A1UnpNTkMzOEtJTlBTcnZCd0pIdDJheVBV?=
 =?utf-8?B?WFlTMEQvY1pvT1JFNUJrTU5qOUxYQ1c4Uk51RGhaK202MDllY2htTXJabkMz?=
 =?utf-8?B?RTJ0WDdRWi9GRDBrRnFhNXdtaGNPL0o1b1paU2hqVEg4UXhFOTY3aXdGcFJV?=
 =?utf-8?B?VFN0ZFlqUkh0SUFOaHUzaWptUGIrVkEvTkVtem1yTE9nRzYrNFRKQTFZOSsy?=
 =?utf-8?B?eG04dDlMeFBDVHpnbVptSHk3WHZEWG4vWUxHeG84d0Vsc2pzLzNVWXBNcTA4?=
 =?utf-8?B?bTNHZU1MOGM1dGllUWJnaHBLamlaYVVJZzd1Q1lQb2ZrTFB5U2Z6UWtORGc5?=
 =?utf-8?B?WnhMOERIb3JnYVJmcS9JVUg5QXZicE8wbFdQaUtFRmwwQVk2NkZVYzlEakR6?=
 =?utf-8?B?MkpGV1VPdXYvSzIwTWcyNldRZ3REUTNIbExhc09MK3BUV25ZNDY5TEFBNW9I?=
 =?utf-8?B?OFBxZjNtZHgxQUZBRnFQakRKSkJSZEhuWlNuTGpBMERGcEdTbDE4VG9ELytY?=
 =?utf-8?B?aDRvbEV4Z0pkYUwwQWpPbG1QTXRyc3FybndYUjRWdVl2SDVYSElLR3lsc1ZE?=
 =?utf-8?B?VkUvMXgrWEszdnFHdTRDaitQelo5V3l0VTFydEdpSmpoQTR4ZTdsVmJ2VXNt?=
 =?utf-8?B?dlFRdmJrQ1RscU5oYjJMSUxaZUJ4cnFpNXkwSjlnQkh6NUxVUjFEbWF2TzN6?=
 =?utf-8?B?dE81eFJudmRZSEp6NjdPVlVzaFlETGxOWDlGYkV2M3VDK1k3engwcXdadEVp?=
 =?utf-8?Q?sVus=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7282.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4afd06-2d90-4f21-b6cb-08dc961a81f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 19:59:37.3035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L4Y3g/ne4NTAjBOBNrf/isfzZNqxP27b8i7ht3mN/YcC+rM/9JNjukr1KRpm7zfLID5nkhcrjWWhhWwkP4glhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7031

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9uYXMgR29yc2tpIDxq
b25hcy5nb3Jza2lAZ21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMjYsIDIwMjQg
MTE6MjEgQU0NCj4gVG86IEFzbWFhIE1uZWJoaSA8YXNtYWFAbnZpZGlhLmNvbT4NCj4gQ2M6IFNo
aWppIFlhbmcgPHlhbmdzaGlqaTY2QG91dGxvb2suY29tPjsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5l
bC5vcmc7IExpbnVzDQo+IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz47IEJhcnRv
c3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+Ow0KPiBBbmR5IFNoZXZjaGVua28gPGFuZHku
c2hldmNoZW5rb0BnbWFpbC5jb20+OyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsg
TWFyayBNZW50b3ZhaSA8bWFya0BtZW50b3ZhaS5jb20+OyBMw7Nyw6FuZA0KPiBIb3J2w6F0aCA8
bG9yYW5kLmhvcnZhdGg4MkBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGdwaW86
IG1taW86IGRvIG5vdCBjYWxjdWxhdGUgYmdwaW9fYml0cyB2aWEgIm5ncGlvcyINCj4gSW1wb3J0
YW5jZTogSGlnaA0KPiANCj4gT24gV2VkLCAyNiBKdW4gMjAyNCBhdCAxNzowMCwgQXNtYWEgTW5l
YmhpIDxhc21hYUBudmlkaWEuY29tPiB3cm90ZToNCj4gPg0KPiA+IEkgYW0gbm90IHN1cmUgdGhp
cyBjaGFuZ2UgaXMgbmVlZGVkPw0KPiA+IFdoZW4gSSBpbml0aWFsbHkgc3VibWl0dGVkICIgZ3Bp
bzogbW1pbzogaGFuZGxlICJuZ3Bpb3MiIHByb3Blcmx5IGluDQo+IGJncGlvX2luaXQoKSAiLCBJ
dCB3YXMgc3BlY2lmaWNhbGx5IGJlY2F1c2UgSSBoYXZlIGEgMzJiaXQgcmVnIGFjY2VzcyBidXQg
b25seSAxNg0KPiBncGlvcy4gSW5pdGlhbGx5LCBJIGRpZCBub3QgYWRkIHRoZSBlbHNlIGFuZCBz
byBBbmR5IHN1Z2dlc3RlZCB0byBhZGQgaXQgd2l0aCB0aGUNCj4gcm91bmR1cF9wb3dfb2ZfdHdv
IHRvIHN0YXkgYmFja3dhcmQgY29tcGF0aWJsZS4gSWYgeW91ciBzeXN0ZW0gaXMgYSAzMiBiaXQN
Cj4gYXJjaCBhbmQgeW91IG9ubHkgdXNlIDE2IEdwaW8gYml0cywgd2h5IGRvbid0IHlvdSBjb25m
aWd1cmUgdGhhdCBpbiB5b3VyIERUUz8NCj4gDQo+IEJlY2F1c2UgdGhlIHJlZ2lzdGVycyBpbiB0
aGUgZGF0YXNoZWV0IGFyZSBzcGVjaWZpZWQgYXMgMzIgYml0IHdpZGUsIHNvIGRlZmluaW5nDQo+
IHRoZW0gYXMgMzIgYml0IGluIHRoZSBkdHMoaSkgaXMgdGhlIG1vc3QgbmF0dXJhbCB3YXkgb2Yg
ZGVmaW5pbmcgdGhlbSwgZXZlbiBpZg0KPiB0aGV5IG1heSB1c2UgbGVzcyB0aGFuIGhhbGYgb2Yg
dGhlIHJlZ2lzdGVyIGZvciBncGlvcy4gQW5kIG9uIGJpZyBlbmRpYW4NCj4gc3lzdGVtcyB5b3Ug
Y2Fubm90IGp1c3QgdXNlIHNtYWxsZXIgYWNjZXNzb3JzLCB5b3UgYWxzbyBtdXN0IHNoaWZ0IHRo
ZSByZWdpc3Rlcg0KPiBvZmZzZXRzLiBTbyB0aGlzIGNoYW5nZSBicm9rZSBleGlzdGluZyBkZXZp
Y2V0cmVlcy4NCj4gDQo+IEFuZCBhcyBvdGhlciB0aGVvcmV0aWNhbCBhcmd1bWVudHMgYWdhaW5z
dCBkb2luZyB0aGF0LCBsZXNzIHRoYW4gMzIgYml0DQo+IGFjY2Vzc2VzIG1heSBiZSBpbmVmZmlj
aWVudCwgb3IgdGhlIGJ1cyB3aGVyZSB0aGUgcmVnaXN0ZXJzIGFyZSBtYXkgcmVxdWlyZSAzMg0K
PiBiaXQgYWNjZXNzZXMuIEFuZCBmaW5hbGx5LCB0aGUgY2FsbGVyIGV4cGxpY2l0bHkgcGFzc2Vk
IGEgcmVnaXN0ZXIgd2lkdGggdmlhIHRoZSBzeg0KPiBhcmd1bWVudCwgc28gd2Ugc2hvdWxkIGxp
c3RlbiB0byB0aGUgY2FsbGVyIGFuZCB1c2UgdGhhdCwgYW5kIG5vdCB0cnlpbmcgdG8gYmUNCj4g
Y2xldmVyIGJ5IGNoYW5naW5nIHRoZSBhY2Nlc3Mgd2lkdGggYmFzZWQgb24gdGhlIG51bWJlciBv
ZiBncGlvcy4gQXQgbGVhc3QNCj4gbm90IHVubGVzcyB0aGUgY2FsbGVyIGV4cGxpY2l0bHkgcmVx
dWVzdGVkIHRoYXQuIExpa2UgZS5nLiBtYWtlIDAgYSBzcGVjaWFsIHZhbHVlDQo+IGZvciBhdXRv
bWF0aWNhbGx5IGNhbGN1bGF0aW5nIHRoZSBudW1iZXIgb2YgYml0cyBiYXNlZCBvbiB0aGUgbnVt
YmVyIG9mDQo+IGdwaW9zLg0KPiANCj4gSWYgeW91IG9ubHkgdXNlIDE2IGJpdHMgb2YgdGhlIDMy
IGJpdCByZWdpc3RlcnMgYW5kIHlvdSB3YW50IHRvIHVzZSAxNiBiaXQNCj4gYWNjZXNzb3JzLCBJ
TUhPIGl0J3MgdXAgdG8geW91IHRvIHBhc3MgYXBwcm9wcmlhdGUgdmFsdWVzIHRvIGJncGlvX2lu
aXQoKSwgYW5kDQo+IG5vdCBob3BlIHRoYXQgYmdwaW9faW5pdCgpIHdpbGwgZml4IHRoaXMgbWFn
aWNhbGx5IHVwIGZvciB5b3UuDQo+IA0KDQpJdCB3YXMgZGVmaW5pdGVseSBub3QgbXkgaW50ZW50
aW9uIHRvIGNoYW5nZS9oYWNrIGEgMzIgYml0cyByZWcgYWNjZXNzIHRvIDE2Lg0KSSBhZ3JlZSB3
aXRoIHlvdSB0aGF0IGJncGlvX2JpdHMgc2hvdWxkIGp1c3Qgbm90IGJlIGNoYW5nZWQuIE1heWJl
IHRoZSBlbHNlIHN0YXRlbWVudCBpbnRyb2R1Y2VzIGEgYnVnL2hhY2sgaW4gdGhlIGNhc2Ugd2hl
cmUgbmdwaW8gaXMgYWxyZWFkeSBhIHBvd2VyIG9mIDIgc3VjaCBhcyAxNiB3aGlsZSB0aGUgcmVn
aXN0ZXIgYWNjZXNzIGlzIGEgMzIgYml0IGFjY2Vzcy4gSW4gdGhpcyBjYXNlIGJncGlvX2JpdHMg
d291bGQgYmUgMTYgd2hlbiBpdCBzaG91bGQgYmUgMzIuDQoNCkhvd2V2ZXIsIFNoaWppJ3MgaGFz
IGEgYnVnIGFuZCB3aWxsIGJyZWFrIG90aGVyIGNvZGUuIE15IHZlcnkgZmlyc3QgcGF0Y2ggZm9y
ICJncGlvOiBtbWlvOiBoYW5kbGUgIm5ncGlvcyIgcHJvcGVybHkgaW4gYmdwaW9faW5pdCgpIiB3
YXMgbWVhbnQgdG8gZml4IHRoZSBmb2xsb3dpbmcgcHJvYmxlbSAodGhhdCBzaGlqaSdzIGNvZGUg
d2lsbCByZWludHJvZHVjZSk6DQoiIGJncGlvX2luaXQgdXNlcyAic3oiIGFyZ3VtZW50IHRvIHBv
cHVsYXRlIG5ncGlvLCB3aGljaCBpcyBub3QgYWNjdXJhdGUuDQpJbnN0ZWFkLCByZWFkIHRoZSAi
bmdwaW9zIiBwcm9wZXJ0eSBmcm9tIHRoZSBEVCBhbmQgaWYgaXQgZG9lc24ndCANCmV4aXN0LCB1
c2UgdGhlICJzeiIgYXJndW1lbnQuIFdpdGggdGhpcyBjaGFuZ2UsIGRyaXZlcnMgbm8gbG9uZ2Vy
IG5lZWQgDQp0byBvdmVyd3JpdGUgdGhlIG5ncGlvIHZhcmlhYmxlIGFmdGVyIGNhbGxpbmcgYmdw
aW9faW5pdC4iDQoNCk15IHYxLT52MyBwYXRjaGVzIHdlcmUgb25seSBjaGFuZ2luZyBuZ3Bpbywg
bm90IGJncGlvX2JpdC4gUGxlYXNlIGNoZWNrIG15IHYzIHBhdGNoOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzIwMjMwMzA1MDM1NC5ISDlEaEpzci1sa3BAaW50ZWwuY29tL3QvDQoNCkFm
dGVyIHYzLCBBbmR5IGFza2VkIG1lIHRvIGFsc28gY2hhbmdlIGJncGlvX2JpdHMuIFBsZWFzZSBz
ZWUgdGhlIHdob2xlIHRocmVhZDoNCg0KPiA+ID4gPisgICAgICAgcmV0ID0gZ3Bpb2NoaXBfZ2V0
X25ncGlvcyhnYywgZGV2KTsNCj4gPiA+ID4rICAgICAgIGlmIChyZXQpDQo+ID4gPj4gKyAgICAg
ICAgICAgICAgIGdjLT5uZ3BpbyA9IGdjLT5iZ3Bpb19iaXRzOw0KPiA+Pg0KPiA+ID5CdXQgdGhp
cyBkb2Vzbid0IHVwZGF0ZSBiZ3Bpb19iaXRzIGluIHRoZSBzdWNjZXNzIGNhc2UuIENhbiB5b3Ug
ZXhwbGFpbiB3aHkNCj4gPj4gaXQncyBub3QgYSBwcm9ibGVtIChzaG91bGQgYmUgYXQgbGVhc3Qg
aW4gdGhlIGNvZGUgYXMgYSBjb21tZW50KS4NCj4+DQo+PiBJbiB0aGUgc3VjY2VzcyByYXRlLCB0
aGUgYmdwaW9fYml0cyB3b3VsZCBhbHNvIGJlIGVxdWFsIHRvICJzeiAqIDgiIGFueXdheXMuDQo+
PiBUaGUgYXJndW1lbnQgIiB1bnNpZ25lZCBsb25nIHN6IiBwYXNzZWQgaW4gYmdwaW9faW5pdCBp
cyBzcGVjaWZpY2FsbHkgZm9yIHRoaXMgcHVycG9zZS4gVGhhdCB0ZWxscyB0aGUgZ3BpbyBsaWJy
YXJ5IHRoZSBncGlvIHJlZ2lzdGVyIGFjY2VzcyBzaXplLg0KPiA+aWYgKCFpc19wb3dlcl9vZl8y
KHN6KSkNCj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gZ2MtPmJncGlv
X2JpdHMgPSBzeiAqIDg7DQo+Pg0KPiA+SWYgaW4gdGhlIHN1Y2Nlc3MgY2FzZSwgd2UgbWFrZSBp
dCBkZXBlbmRlbnQgb24gdGhlIG5ncGlvIHZhbHVlLCB3ZSB3b3VsZCBuZWVkIHRvIHJvdW5kIGl0
IHVwIGFueXdheXMgdG8gdGhlIGNsb3Nlc3QgKHBvd2VyIG9mIDIgJiYgbXVsdGlwbGUgb2YgOCkg
d2hpY2ggaXMgdGhlIHNhbWUgYXMgInN6ICogOCINCj4+IEkgd2lsbCBhZGQgYSBjb21tZW50IGlu
IHRoZSBjb2RlIGluIG15IG5leHQgcGF0Y2guDQoNCj5JIGJlbGlldmUgd2Ugc2hvdWxkIHVzZSBv
bmx5IGEgc2luZ2xlIHNvdXJjZSBmb3Igd2hhdCB3ZSBuZWVkLiBJZiB3ZQ0KPiByZWx5IG9uIG5n
cGlvcywgdGhlIGJncGlvX2JpdHMgc2hvdWxkIGJlIHJlY2FsY3VsYXRlZCBiYXNlZCBvbiBpdC4g
VGhlDQo+ZXhwcmVzc2lvbiBkb2luZyB0aGlzIGlzIHZlcnkgc2ltcGxlLiBTb21ldGhpbmcgbGlr
ZSByb3VuZF91cChuZ3Bpb3MsDQo+OCk7DQoNCiBOb3csIGlmIHdlIHdhbnQgdG8gbm90IG1vZGlm
eSBiZ3Bpb19iaXRzLCB3ZSBjb3VsZCBnbyBiYWNrIHRvIG15IHYzIHBhdGNoLg0KbmdwaW8gaXMg
dGhlIG51bWJlciBvZiBncGlvIHBpbnMgc3VwcG9ydGVkIHdoaWxlIGJncGlvX2JpdHMgaXMgdGhl
IHJlZ2lzdGVyIGFjY2VzcyBiaXQgdHlwZS4gVGhlc2UgYXJlIDIgZGlmZmVyZW50IGVudGl0aWVz
Lg0K

