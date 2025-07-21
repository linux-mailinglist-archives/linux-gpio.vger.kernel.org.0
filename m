Return-Path: <linux-gpio+bounces-23606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9043FB0CCD0
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 23:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8CD0160B83
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 21:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D5A241680;
	Mon, 21 Jul 2025 21:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="nivuJSDC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2128.outbound.protection.outlook.com [40.107.243.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBE73FFD;
	Mon, 21 Jul 2025 21:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753134189; cv=fail; b=cG06vLwSSO7JBVK1cxcEnRoSia9g1fMrRxGIVAwESe6soEIEhynlHMXygoTLMllxpwiy1c5ywLo5k9YoSljXZUQvPRwmZCOO85tWSHkwvps1mznn1SAAQo5CA5r5sTFXkqX9LXnI5I47Hz0yVQwtaagXFDvOtRzTAaf43eUvRkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753134189; c=relaxed/simple;
	bh=NlwWMl2SQ3hPuIqBaQLUMiW8PAZG/vED3Lf8dDw7xNg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AEKQr0JswgQ9kiH+4jxDyyz/1IBTjm6KYMqFsaO5GSYiigUiMyZ4NlJ9+ZPV4XJJNqEYI3BS4zy/VY6mZhwj31gNT2FDDeumouHhTRxzdhmCc9nVuqJAKEmA5Ab++FpwXFdl8as+qnAq+hp8DdWc2u2DGAX6fknnh28Y7Ye7Ao0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=nivuJSDC; arc=fail smtp.client-ip=40.107.243.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDzMfCTBnC/+DXcnUXkxilg+1Wm6DfVi1PJpxNpYjmphUF0UK1GuZvygTz3KbwUPsxwrNHbP7Axvihflae6D7PhLU0BhfANpKmfiq4vkfO8ebUpPNVQFAmhXUC+14660KFMGM3aKxbAfxuDR9WVZap4uKjUIYbdkDwPmNy6Co/7gl86ro8T3HlypkdT6Qj9GfhhLRzmV6X/ejdAGbUee4C+ws23S0OA2co8zMBpXwCbfERcGLWlfy6roJc/yNIA9ULs4OoMdmg07hfN5DrWALEWRY0JWO8EyexNb8+0cJN9meCJ7PuZhZY1PqUnbbSaXD6pdknZDeRplCUCH95V4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlwWMl2SQ3hPuIqBaQLUMiW8PAZG/vED3Lf8dDw7xNg=;
 b=Hk8ZGXOLsb7H4rytu7h6l+kSqjhOjB5upB7jkKWRxG27iR04QLQzdj9s5N9IQvwNlyp0fc2HWHhW8L+wYV17JfUNVK/mkK9+oQectazZmg/6G3RpKXTwEH1/YAn9grSJxoFJUzW9ghmXxSvs1UsiAGHOuvf3+uSouXCKGAyGQsPnYKxJQnbEPav+9tZvY2RT1gJqUAqGEm8DPYiKskN4HkrqAI84EZfK7Po69n5ekaRFWz8Z0K8APMkC6DS2rcSExtNc2LgaJyw+Hp1D7mw0Bp/b4vIiQhaw1YoIEG32eFknVO/ePj0e60iFIIUn/bN0FjzXMQIbENpCDLhmG8Ym7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlwWMl2SQ3hPuIqBaQLUMiW8PAZG/vED3Lf8dDw7xNg=;
 b=nivuJSDCzXDvW9zNNmIfHW9r5MLUoGok5wXvgsQhG2SMKAxqIDkb4+T3Mat33UVgvwNPbX5AqrmXZFAvD5TU9n3weRNxMY77FtLYki7sT192/CapUaIL2czt05FWbyRRp0s09J7ehfb0Boe5+sdUhW/5HkTBshd0dyOkvO9LDzQfaXtfYcLg7hhm08npTRmfDUc3sTF6xxgv7AIPRhTkgMnJe0ficHoNDyE7j64ebpm1Uh5qLW9EQl8iSGCxKbk2+1zAVIGHKO6YzSAyzKrFIMG9tupTJjdg0NalLeJFFoOLM+tS/xn7aYh22BWiFh8kF00rSfSPF3/unh8qpP0QdA==
Received: from DM3PPFA3B1D0F56.namprd18.prod.outlook.com
 (2603:10b6:f:fc00::6bd) by SA1PR18MB5902.namprd18.prod.outlook.com
 (2603:10b6:806:3ed::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 21:43:03 +0000
Received: from DM3PPFA3B1D0F56.namprd18.prod.outlook.com
 ([fe80::8562:c877:9e70:3493]) by DM3PPFA3B1D0F56.namprd18.prod.outlook.com
 ([fe80::8562:c877:9e70:3493%4]) with mapi id 15.20.8922.042; Mon, 21 Jul 2025
 21:43:03 +0000
From: Harshit Shah <hshah@axiado.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jan
 Kotas <jank@cadence.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>,
	=?utf-8?B?UHJ6ZW15c8WCYXcgR2Fq?= <pgaj@cadence.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	"'bbrezillon@kernel.org'" <bbrezillon@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM"
	<linux-gpio@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
Thread-Topic: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
Thread-Index:
 AQHb7Ec2EpmYZb1fLEiBSh0CfO/MD7Q3Ee0AgABr+YCAAT0bgIACSq8AgAG6FYCAAGfHgIAAA0GAgAANggA=
Date: Mon, 21 Jul 2025 21:43:03 +0000
Message-ID: <4b86bf1c-ce46-4690-b5dd-db34fbfbe27a@axiado.com>
References:
 <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
 <b7322d03-2ff9-48a3-bdc6-0e95382ed83f@axiado.com>
 <e461e5ed-f512-4d3b-9903-8092dab7f81d@linaro.org>
 <06f00d05-b8ca-41fa-9e5e-9cee3cfcfae1@axiado.com>
 <7ddb77bf-173a-4117-80ac-d0f32bf067ee@linaro.org>
 <4f836d88-80a7-402b-9af0-f0d002e2145d@app.fastmail.com>
 <912dd9f9-34d9-4631-82d3-02eed03a52c9@axiado.com>
 <8783e997-8dd3-4321-8f7a-f160b0f8ad17@app.fastmail.com>
In-Reply-To: <8783e997-8dd3-4321-8f7a-f160b0f8ad17@app.fastmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPFA3B1D0F56:EE_|SA1PR18MB5902:EE_
x-ms-office365-filtering-correlation-id: 37bac5eb-2219-4a12-82f5-08ddc89f921e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RUdaM0ZPdkZwSlFxWDVnV0c1RnMzNytQc05lMmhvemxJZFQ0eVZRai85dW43?=
 =?utf-8?B?REREVEJhWnMvTGpsa3d0S1lmRWNjaElFZTdtTmRvZDVzZlFodlhkZi81QUxN?=
 =?utf-8?B?RUVXNmduRkF0Y1BUSjA0OE5oZHBrZjgxdkVoWGJZZHV0R0crZ1ZRazBtWlBK?=
 =?utf-8?B?N1g2WkNKclR1S2tuL1h3Zk0vdnVDVXdPbWREd3FTZS96K2lqSUQxMktiaDJ3?=
 =?utf-8?B?RFh6aXcrZ0h5TElEN0FnU3dqbkZzOGdZVUpIQ0RyNmVobmtlVUVKTnlUV08y?=
 =?utf-8?B?UzdNSVVVM2xBdlpxZnBpYnkyUDVsbEk2TGJDT1VTbUsxQVZxQ3RHQjhmVXpq?=
 =?utf-8?B?MUx0K3VLUHFOWW10QTlXL2hRNUpXcnJQUDEzcnU3RkJnSjNHNlQwZjJ6b3Vi?=
 =?utf-8?B?SVJlZlJDWkkySFhEZnltL1NjSlE3c3BlUmk5YXNaTmRTMGlrOWtlQ1Z3RWNp?=
 =?utf-8?B?cGxMTy93T1NCNWRjK3lVTWxnTStQK2kvK2ZXb3NaMStMSEMrbGZSaGJ5VlZ3?=
 =?utf-8?B?ZVNTdk5aQkxLc255SlloSTlDVll3dThaTndOTUdUeWlpdnlmc1BId3ZrbTJQ?=
 =?utf-8?B?Q3JKcEd3L0k5K1YxZFVNWWg4dW4vSXdRME04MCsxVk1hbDZHL0RDV0JocHJT?=
 =?utf-8?B?bFBCVmZnRXZ1cTRqNHVYMnZPWnBOYlhQVG5kdlpBY2k1b0ptOEt6M2NQQTZF?=
 =?utf-8?B?Ymh2dE5vb2FiYS9HSE5xbGQ5R0NnbEU0WjNzNlpIcjNvUDFjQVE4YWxhYVM4?=
 =?utf-8?B?TTFsSUJET2tSc3o5U0tlUUUvMnY3WmlxOEFkUHBJdWdLR1poYVBCRTkrdHpt?=
 =?utf-8?B?S1F0UVJLaEdCWUpSeWZDZE1lUWRwRm4zZE00TzNlMWduUWJteTZJc252QUdl?=
 =?utf-8?B?WkRST1I4a3Q5SXpxUmU4ZUhONjBkZHhHanVuazE0ZjFJbFZCMDloMHBrM1Nz?=
 =?utf-8?B?aGN2NVR3TkFudGZjQlVvTTJZWkNYUE1kbmRwWUJwRmZ2NFRHMm9xRVBDcmd2?=
 =?utf-8?B?SmpueG8vbnVpWTNTWE85ZERmSDh3QkJkaWtDTHJCU0ZwY3dHeFFYWThkc1Fu?=
 =?utf-8?B?UHFEMjN0OVZUR21KelhIQjFmdmxzWnFZQWszNzBCc1JQMFBpckF1TUl3ZFJE?=
 =?utf-8?B?R285UEdGU1RNL28wZzB0RGtQUUI5NkZCdzQ3dnNnNmMvUEZmWnBoVmdORzhL?=
 =?utf-8?B?L2xpblZodEpxM1Yvb2N5STZCK0tocDVFdDAwQVNKT0xLVGlTbGk0WjZvcVE0?=
 =?utf-8?B?UXhmNi9Eb2tyVTJIQ0dYSXRDOEQ4czBoeUd6SUtKcUZLeTVLWTlmdzN3WUxL?=
 =?utf-8?B?UzBWczljcnNiakhtK3RTWkxFVDBVQ1JiOXc0NldtSWJqOXhuN21ydkIzbzhE?=
 =?utf-8?B?QzAvbHVUa1NRVHRCMmkzQ3EyRERBRTBNWFlJL1BQZXZYbzgzeUY5T3dSdU5Q?=
 =?utf-8?B?OHp0bU5WN2xNc3NwV25uTlhlRXNiMzcwbWNIUDJwbjBVZUNlckYwNmVySjk4?=
 =?utf-8?B?d1ZkNGVnbWF0UnliMGJqem5nQ2ZFU2ZPV1BINS8yMW81cjlmUVk0WjFVN0xv?=
 =?utf-8?B?Kzh2SU5aS1ZzTWZ0Q0hjYkJRVDBUSEgwVjhGaXdHQUNEbEtjT2RTbnZuazVr?=
 =?utf-8?B?aWJCMFRwbjl1eVRwbURVMkR3MVM0a2JxaXFqSVpsUVJ6YnBwcW5iUXBKSUVw?=
 =?utf-8?B?SG9jVG8zS1BVaWY0Q0dOeW1TTEhLa1NmdkRsN3FkRGw3YUFITi9DeXJhRGI0?=
 =?utf-8?B?MEpkRGFtVmVySnVhRHRjUWhqcERybjdSZ2tibUpIZ1pPeDNLaGZRQmREMDNi?=
 =?utf-8?B?dTEvcXFqNXZlWnA1ZVc1RDhIYVBpbEduamhtREhSaXdRZ3NzdktDUUt5ZHhn?=
 =?utf-8?B?aHR3VmZPei9UcDVDdTQ5RU01RmhXeUxZalRZc3hMZGRPY1dRd3pEL1dCYXRv?=
 =?utf-8?B?djlQb1BLRGNBc3Z4d1JpMkE1Mk43cXpldlM0L3lzN3FURkp0VDRGS1N1b3g5?=
 =?utf-8?Q?hjNZFKLBLeTGl2BbvSxABfAK1Q3XMA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPFA3B1D0F56.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YTlNc0w5WitZa0dwR1hJTGNPYUZoaEdwN2ErMkIvK2k1OXNMZkVNcFptb01t?=
 =?utf-8?B?SGhIZ2Ztd2E0eHZBd1NXYyt2MHYrR0tCQW9Na3Byamk3enlrYUpyWHk1TmNk?=
 =?utf-8?B?MHVERWY0ODY2VCtCL00weExiVWpkQVhVN0MzR3MraFpNRFlyMmViUTBLNUVY?=
 =?utf-8?B?OFRXNzNhWVZSdHNNZ21UWWlYSTQzeXFTY0pBKys3dHE3KzIyQnkvWHlBa1ZH?=
 =?utf-8?B?aGlhZHRtK1NGUnJMeDRUbmw4R0tSVjF4YUo5V1paQVFQNzlSd2d0enJ1NC9Q?=
 =?utf-8?B?eUNlaURWdmhWN0J5THNXeXQzQUluNVZZdFN6YXE3ZzRISUVpOWZ3WXNYRmNr?=
 =?utf-8?B?b2V2Tzg3TDdvT3hHRFZLOExkZ1Avb0t4aUlscmd0N1Vvc05wYys5U2ZqY2Zy?=
 =?utf-8?B?TFhuZmFOLzNOSUppMGVZQUM0dklnVnNJRy9qcmhKK2daaEEvcWhiNE0rS29m?=
 =?utf-8?B?b0ZFclRQaThSMzJXemx5Z0dxbUFhalNHUXFMM2lEQXFkdDZkRkJPMjF5UmJH?=
 =?utf-8?B?aTYzOC8zMkVJT05Xb0YvSzhkQ2s2OHQwUVFTWUk2cGoraGZISTVvMHptU0l2?=
 =?utf-8?B?ZXdqaUtaYWZoSFJQalQrU29GNTlJWkE5ZnlTckxVL1c0R3ZqSlB3Q2ZyZE93?=
 =?utf-8?B?NWd2TzNGSkFXcmU5MDVmUVZJdS85bGFZRm92aUV1MkZkZEtpUTVRZk0yTEww?=
 =?utf-8?B?RXBFVlMya21kOEdhamlOK2J6SzhoMkJqaENYeUJFWHB1NUtKc2M5SW9jUytK?=
 =?utf-8?B?REJwcGs0S1lmYTB2RzZxRGxlV1Z1S0ZwUnRUeXpPR2EzL2pJUmxXRnZ3UWN1?=
 =?utf-8?B?NlcxcnJYRkpoa3Zqa2RyS3AwMHYyQjIrb2RKczNJVVFCbHVFNUlkV095TGJS?=
 =?utf-8?B?Mlo3UDVOZFZDSXF6Rjl1R2F6dTJWVXVialJqUGtlUjJDWk0zcEtIVDdocnRP?=
 =?utf-8?B?dzl3eHlVanc5YlViekV2ak1mcTlqajYyQlFObHR5dDFpMStSTllhQ3FKZk03?=
 =?utf-8?B?Y0U0cGFGd2ZlZTNvZTdDUEt1Y0Y1NmtYVEpXRTBGQ3k1REFhdTlaTXorcUkv?=
 =?utf-8?B?dWlUZlZjbEJJR3c2NmhNRHRNbzVrV3ljNjJQMUVqWWhZQys0RmpQK09zNWZj?=
 =?utf-8?B?Q1h0dkVHb2lrTnYyaDhMbDRnWkpjRko5NU1tbTdrU2ltRzNoSDRBQjd3Q2Nl?=
 =?utf-8?B?eFQ1Rjg5R0Z3OXpheGZ4dkFHV0dqbXFlUGhmeS9sbkh3MTJuWGhQVU9vMVVD?=
 =?utf-8?B?blRqU2NneW1Jc3RZaExyZk5yVXVpMWUycXloQ2Y0cWNFZTZ6aElTOXJpQXpN?=
 =?utf-8?B?dy9DN0dDSFUyUWZJRkxjRkJqSDRucVJuZHRiVTFNem5uVE9sM1g3ekY4VVl3?=
 =?utf-8?B?Y0N0cTg1d3FMbVU3dlZ5cU0zWU9JNXE0VzVEeUdzWE13eGdpUmtmYXRPK2x3?=
 =?utf-8?B?Q1lBOEVwKzhCQkd3dGRSbUh1SGtjOG1oNFVJZUFiVFAvbDRGcXBHT2c0Z0gx?=
 =?utf-8?B?RUZkZXJFSkRmL2U2OGFUV0dwSmVyUXZ3TTBrdjByby81M1FUd0d3RGd4UGRU?=
 =?utf-8?B?TklGUVZaWW1qTk01RkJBM2NJbC9Rd3pvZEdweDIrTkJsNW9JbWZSYTVyaUg0?=
 =?utf-8?B?dFdLcU1FZEZnU1lCaHpSaGRrQ3ViTXlsUENzVlA5akQ1Q2NCTlFqNFU3cHRq?=
 =?utf-8?B?QXF3NW9heEJ5TGRYNnpidzE0aHpXVUl4Z0ZhNURFMmEyTnpxZmJqWFV1Vkxn?=
 =?utf-8?B?dkZZVkVZOXdjSFNHLzNXNUxMdTM3bHBLVWhjVE1MdU51MTJiNm5vZWU4clpT?=
 =?utf-8?B?VldIVDM4ZHczQUdzWVZ5L3ZTMUwyd3BWbnIvVlZ1eXRxT1phTm5vZ0ZSQk56?=
 =?utf-8?B?T1p2WGowNXUyQnFIaSsxMWQ0ZkEzaE9XYzBVUERkUHhIc2k3cTI5M3pLQ1BK?=
 =?utf-8?B?Tk45ajVqaFY5a2VYV3M3b2ZvUnVwY1dPUEprQ0VkMlpwUVQrRjQ2VHFKMU9S?=
 =?utf-8?B?T0xoTzlRVVFuUkRQU29ETUFpeFN1Ty8xQnFzdDhES0ZxaVMrL3FDUDJFbHFk?=
 =?utf-8?B?amcwTGZVbUZhU05DblVvMDFxSDhENHh3ZWlueUV0MnoxY1EwVTluTW1icDNz?=
 =?utf-8?Q?igFk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCB4D3984663724D800F06585977461F@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPFA3B1D0F56.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bac5eb-2219-4a12-82f5-08ddc89f921e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 21:43:03.3252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VvJCmtct4LggKdtuNOeO3a+F6rdRfyeqe/CouaXA0HR/Je2pffBK40nvTSIYCOra20dZ91tJuBepXOG5GtPmbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB5902

T24gNy8yMS8yMDI1IDE6NTQgUE0sIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+IFBsZWFzZSB1c2Ug
c29jQGxpc3RzLmxpbnV4LmRldiwgd2UgYXJlIHRyeWluZyB0byBwaGFzZQ0KPiBvdXQgdGhlIG9s
ZCBhbGlhcyAoYm90aCB3b3JrIHRoZSBzYW1lIHJpZ2h0IG5vdykuDQoNCnNvY0BsaXN0cy5saW51
eC5kZXYgaXMgYWxyZWFkeSBpbiBDQy4gU2hhbGwgSSByZXNlbmQgdGhlIHBhdGNoZXMga2VlcGlu
ZyBpbiBUbz8NCg0KW05vdGU6IEkgY2hlY2tlZCBsb2NhbGx5IGFuZCBhYmxlIHRvIGFwcGx5IHRo
ZXNlIHBhdGNoc2V0IHRvDQogIHNvYy5naXQsIGZvci1uZXh0LCBjaGVja2VkIGxhdGVzdCBjb21t
aXQ6IDdkZmJmMzE3NmQ4ODZmZjlhMGM3Nzg2OTQyZDNhODk4MDlkMDY0MWUgXQ0KDQpSZWdhcmRz
LA0KSGFyc2hpdC4NCg0KDQo=

