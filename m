Return-Path: <linux-gpio+bounces-21626-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E60AFADA894
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 08:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8DE13A9A88
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 06:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1046F1519B9;
	Mon, 16 Jun 2025 06:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dLhqRMJn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2067.outbound.protection.outlook.com [40.107.95.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699851494C2;
	Mon, 16 Jun 2025 06:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750056722; cv=fail; b=Aq6rw8C52Lk6Alkl7caGsikE72NIONsSFu9OD1hYDDWGDG1Gpr94jG/h3A7syDnQpt6dsx/s/FpbgJ/p86rZ8n9aggExAKCiRKZeENFJXFrMFMQXobwtjYPVaiCl+ocV2AbhGpcV3NmI5eJ9ohEBbC10uVgg6Ug7+G2TFIugNXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750056722; c=relaxed/simple;
	bh=raOhG2VLvabg7uV8AGblp4Ppix5ecxug9t3ThRPjnps=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZZLuF6IgPg+JGa2BVKHyHdGWZNiJ8cyUR5HY00t2hqjEIiYdg5YN1QPxk+ZQSiBhpLrVzdFgcAYtctJvDXmG+MP+fKOLN45n9ZXPmWEsyjNLJwrDaBtKVZPdHRS5K6BTz7nqP/nYQJ5qVqHvA61nxrx8g262WgKmnKIMKlv9Xk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dLhqRMJn; arc=fail smtp.client-ip=40.107.95.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXWOzXMjnR+SpWM6ZKXQ6/EQbugfg/iwrO07vkU61nfE7Ba6dncEOV3eMuInIu0XDZom0EYDvjx8atuhZY6nZehWTgax1CGM0xcNEwvApGbQW5DUY2W/aZqnlhMjvd3flHGZ/y/jllAGMmFOmUVbs+WQ1ZwwIZQy2J7Y9+XuL+oER35Q/5l6BkBc8o47TQogydvzFt54gRpkWYuB5YYSelcfke9Fn1rHXzj8R0XTaonI0X0ARkzRKzjfOYM4xS1W97hCp03/RbF/baCZRnJ6liVLS9pQcSdxjKd5sXK6++iEc728dOo9jtrHCP32NAyudniwT88VQEaCE8OjHDPl7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxN7e8eeZm3aKXg8EDN+fMueLGlfp14jo9xKVmCXsug=;
 b=tm8yZTp5aSKHgJ36ZUCvDMg+bFYPvgC+Yh6k7sfJFcJYqWnuy4KTl1nEf7mfn2y7TgYJUCaoVVZbrNfHKPM8kqdUKKf67eUL5StdGRuuthUWMvnEGPpIad52fm9SX9VZGRQRJSy2hh8lCz5NQ+B430Bup8zxV/VQDJbB9dX/TJujUtJCTrgL/q3ElmTr4Wy+AN51vWhlMwpEdFGgTGfIZNer9dkUVl6IZCmwi0UtBEF4hp+03BFAc9IUZ9hERjswHyQnBD8Tjod7ZpBzlNHANhk7+k7aueBUHkRYpRoFQNWzFGAw/gCek/0/47OrVRSa+H0AYL7aiSO7hy9p5bxRdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxN7e8eeZm3aKXg8EDN+fMueLGlfp14jo9xKVmCXsug=;
 b=dLhqRMJnq63vXAAKOHEOlB8ysQmjIBTYaBBh4h1HFLIcX2ehhsrxPwpl8fKwUxTLBN+A6pXUOO3aIqQnpAh1mvel8b0MH+Mgd6a+j8YGI4YeZNZBziis00VsF1vwE0KEJVPHzhOhKH5TeVUVZAXpStPVeDnUH9sowDG9Mr2g0YA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 06:51:59 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%7]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 06:51:58 +0000
Message-ID: <765a606b-3b87-4a08-8630-69a3c52ed138@amd.com>
Date: Mon, 16 Jun 2025 08:51:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: gpio-xilinx: Mark clocks as
 required property
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <8407ef56b11632c1a7abfce8a4534ed8a8ed56cc.1749809570.git.michal.simek@amd.com>
 <cbde9b9e2b0f9d12fdd1ba24fddb1543159357aa.1749809570.git.michal.simek@amd.com>
 <2fb10aee-6610-43f4-9d12-88a97e0f66e5@kernel.org>
 <9dc04095-e397-4a51-a75c-8a5577be197e@amd.com>
 <1fced39f-1077-4af7-9294-affb99860984@kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJn8lwDBQkaRgbLAAoJEDd8
 fyH+PR+RCNAP/iHkKbpP0XXfgfWqf8yyrFHjGPJSknERzxw0glxPztfC3UqeusQ0CPnbI85n
 uQdm5/zRgWr7wi8H2UMqFlfMW8/NH5Da7GOPc26NMTPA2ZG5S2SG2SGZj1Smq8mL4iueePiN
 x1qfWhVm7TfkDHUEmMAYq70sjFcvygyqHUCumpw36CMQSMyrxyEkbYm1NKORlnySAFHy2pOx
 nmXKSaL1yfof3JJLwNwtaBj76GKQILnlYx9QNnt6adCtrZLIhB3HGh4IRJyuiiM0aZi1G8ei
 2ILx2n2LxUw7X6aAD0sYHtNKUCQMCBGQHzJLDYjEyy0kfYoLXV2P6K+7WYnRP+uV8g77Gl9a
 IuGvxgEUITjMakX3e8RjyZ5jmc5ZAsegfJ669oZJOzQouw/W9Qneb820rhA2CKK8BnmlkHP+
 WB5yDks3gSHE/GlOWqRkVZ05sUjVmq/tZ1JEdOapWQovRQsueDjxXcMjgNo5e8ttCyMo44u1
 pKXRJpR5l7/hBYWeMlcKvLwByep+FOGtKsv0xadMKr1M6wPZXkV83jMKxxRE9HlqWJLLUE1Q
 0pDvn1EvlpDj9eED73iMBsrHu9cIk8aweTEbQ4bcKRGfGkXrCwle6xRiKSjXCdzWpOglNhjq
 1g8Ak+G+ZR6r7QarL01BkdE2/WUOLHdGHB1hJxARbP2E3l46zsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmfyXCkFCRpGBvgACgkQN3x/If49H5GY5xAAoKWHRO/OlI7eMA8VaUgFInmphBAj
 fAgQbW6Zxl9ULaCcNSoJc2D0zYWXftDOJeXyVk5Gb8cMbLA1tIMSM/BgSAnT7As2KfcZDTXQ
 DJSZYWgYKc/YywLgUlpv4slFv5tjmoUvHK9w2DuFLW254pnUuhrdyTEaknEM+qOmPscWOs0R
 dR6mMTN0vBjnLUeYdy0xbaoefjT+tWBybXkVwLDd3d/+mOa9ZiAB7ynuVWu2ow/uGJx0hnRI
 LGfLsiPu47YQrQXu79r7RtVeAYwRh3ul7wx5LABWI6n31oEHxDH+1czVjKsiozRstEaUxuDZ
 jWRHq+AEIq79BTTopj2dnW+sZAsnVpQmc+nod6xR907pzt/HZL0WoWwRVkbg7hqtzKOBoju3
 hftqVr0nx77oBZD6mSJsxM/QuJoaXaTX/a/QiB4Nwrja2jlM0lMUA/bGeM1tQwS7rJLaT3cT
 RBGSlJgyWtR8IQvX3rqHd6QrFi1poQ1/wpLummWO0adWes2U6I3GtD9vxO/cazWrWBDoQ8Da
 otYa9+7v0j0WOBTJaj16LFxdSRq/jZ1y/EIHs3Ysd85mUWXOB8xZ6h+WEMzqAvOt02oWJVbr
 ZLqxG/3ScDXZEUJ6EDJVoLAK50zMk87ece2+4GWGOKfFsiDfh7fnEMXQcykxuowBYUD0tMd2
 mpwx1d8=
In-Reply-To: <1fced39f-1077-4af7-9294-affb99860984@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::21) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 9227ea1d-d1f0-45ba-6c02-08ddaca24a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEx2VVBjT0R4cnBtSTl5K3BaZXhhUklmR2p3RkViSWJ4VUhUNGN3Y0JOa05l?=
 =?utf-8?B?R3djZHY2QUwzYnJZc0ZIQTM3eTZVWi9lMC9odWQ0TTlISWZPT2JvelVWNmFH?=
 =?utf-8?B?bHJ5QWlhVWxsZzQxUGVOZmUwR1pjdkJQM1V6STNzeUs4em9hcFVjVnlFcW1F?=
 =?utf-8?B?aEd2eElmcWRwaUhFNlVDb0FYZTN3UXNFbWt3QmU3emYwQkNQRnloeTdzeUNC?=
 =?utf-8?B?MWcreCsvYytaaktvbGxtQUFQYjN6eUdiOWU4clpiNFpSSjVQVkFpWm00LzV0?=
 =?utf-8?B?NWVNN1h0MElXVUphbGIybXhJU1VhdWZjZ2hDeWgwVXpXWjdQYXdvL3p6THM5?=
 =?utf-8?B?bkloNzZiWmttMHpoRmNvbGx1dFA3Z2phaTJZdXpjQjVsSmZLd0VWOCtxRHdZ?=
 =?utf-8?B?QnFCL3VKQWFhcE9QcTljSGtXRnJRMHFoSHVKemI3aUlwdHZvcmJkaC92UDBX?=
 =?utf-8?B?US83UWNuTXYrMFJKTXkvZG0rYVFYMm9FZFExUnpuTUlrUUVDSXZXY1RoejMv?=
 =?utf-8?B?SGRVU3I4WHNlVUlxZmYxUmlVOFlXdGt4bzBXMlR6T1ZZcXYrM2JzeTdwUW1S?=
 =?utf-8?B?UVYwamRTc1gwYS95V2M3THN5TXN0M1d5VVdqZ2w0cDlUWWMzT3pnWGFGNmV4?=
 =?utf-8?B?L3h3U2psUHJqazY2RlZ1K3RBNVVXNEpvS2cyL1ZacFlSOHFWYTZhSUJrVDA1?=
 =?utf-8?B?YnpUam9UTmovS0xJVE1IaEdwUTBlelJPdjdLWG4zb0hUT3F4SmFXWkk0MW1M?=
 =?utf-8?B?YlpHL0NLSjlmaHFoV1FCbkVrS1NBcmNjeFV4T0ZMK2xmaXBjT1BFd3pOMXdo?=
 =?utf-8?B?R1RZUWg4RllYdXJxOUNUTXJZTjZtSjNncUR0Q3FlVlNIbFpBRnM5TVc2K1dv?=
 =?utf-8?B?WEIvNTQwNmtBRElnOGJsK1ZyTnFCVDdpTkczNHZFSXBUZHpLT21kWlZNdDhk?=
 =?utf-8?B?SlM4SHRDZTgwa1k5cXlVWXUrcTBuY0xBTitzR2ZWMTRhZ2Y3QWFzMWZhbTlS?=
 =?utf-8?B?VGRrTUgxdDVmMUVGamFramh0ekswdzZZemVqZGdkRzBRbWw3QnhzMVVabjdL?=
 =?utf-8?B?VjFPRXlFYjBDS3B1bUthY1VSZHJFY1ExVGNFYmxFSTZEdkZzcGF0VURncGN0?=
 =?utf-8?B?YTVZRzk5MUJtS0NEQU0zTmVsZUd3REpyRXhQbE1oSlpoRnkvNnJHVERaRjZj?=
 =?utf-8?B?dTF2N0EzS1p4Sys2MDBCL1RoVXptSmdiRUZRbmRON2NxNlM1aC8yWmhGbEFJ?=
 =?utf-8?B?bi8rQTBHWk1KZy9KWWFRMzZ5RXFQYTExRWZoMWFYdjkxZ0ZwQksyUDlEcjBW?=
 =?utf-8?B?ZHVNektaZzk5Qjc0Lzdub21xL3V2ZVphSWdTdlJEbzZCL1RkL05pZ1dDaEdi?=
 =?utf-8?B?cnF0Mnl2aVdHSEVDSXh5U3FIRWlYZWdGd3pvdnd0bFZibFNjaER4bmRvL3k0?=
 =?utf-8?B?d3N6V0Q5aVYrbVl0S21yUHJMUms5cG5CMTFtdHpDWjF2T21sNHZSai9oTmpt?=
 =?utf-8?B?dTFhV0VUS25FV2JsSk9EbTMvQmVVK3M4VituQkJ1YTRKR1k0aVBSR1JVZE54?=
 =?utf-8?B?bjZYdXdNTDlJNXRTWWMxeTVsT3hwSjZOQ3E2SWhPTEIyajlEUlA0WkR6VXg5?=
 =?utf-8?B?NUd2L2ozWjdCYTRpcHBxM2RuVHh6WE5ZMlBhOUhyVG1pcGZxZVE5eXhCRlgr?=
 =?utf-8?B?U2tIMm9pSDVqVUkrc0wvS2ZrdkZicTA1b0U5ZWE5Wm5ZVUtvVTcrNHprOUti?=
 =?utf-8?B?R0VMZlF5MkEvRTZ0WVdONVI4R0p6aGRwc0dDVG9XclZGMmpieG9hMGViVXlw?=
 =?utf-8?B?RVpmNjFJbDU0TWlMVm1PK3M5UVBLditBMVlqVGpZQXdqeDdVbGVPUGRPUEIx?=
 =?utf-8?B?bGRNaE9CdElpckdQVW1YejVORTlQSjkwTmxPZTJMTmFCVm1SOURxa3crSmhH?=
 =?utf-8?Q?D1fnn3DLJYc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGpIRmprTW5pVElWTUxBYnZIdk9ac0FqSHZqRzNmSzkwZ1VJcEtXN3hGN2Nm?=
 =?utf-8?B?UVAvNjJNMERTdkVZVy9DRGFGbi9RcVRxcTU3QWtkT09LenZkbmx1K21NbXpZ?=
 =?utf-8?B?VUxUNEJQVElTQXUrenMrTVVmcENiS00xMVpmRzI3RW5Md0hzWWJ1SEo2Yisw?=
 =?utf-8?B?cEc5MFlCa0Z1RVdaZm1vNExiZ1Z5TWxyU2x4aUFGL0Y2Snk3Q0gxZjF0b2Z6?=
 =?utf-8?B?L3hyT01UYWZXNFcybVRpVG5yejZIU1dtQ3hPanhORWt3YUsxMVdpYUxDQm95?=
 =?utf-8?B?b3N4enlnSTdJTWZpeG5Sb1Fvdk4wdWlvVjNiamhoMklrdXFkcHptUjB6T2xV?=
 =?utf-8?B?ckNOQk44TmpCd3dRa0Q4MG9LN1IwSjF6Zlh2NHEzL2N6bzR1MEc3bzQvcGox?=
 =?utf-8?B?QXRXTEtaR0g5R003V0YyWVFHR1BsNUFnbitPMDZTR1ozNC9KemNFZGxiTGN3?=
 =?utf-8?B?NTVZRDlITmdPUGNEaGJqT0FhUzVqWEo0RVZxcU92aUZ5Zzdtb1ZNTkxwcDlv?=
 =?utf-8?B?LzFmeHBnbVhEM2RZWUlPY3QvVW1TRmdtYnI4M2VEYnFoUUU2THdGRW5wQ1RD?=
 =?utf-8?B?OFhaUWJJNFZGSTVFVnVUMWNuUlFLaVhYeENuUW9NZWZZN2pWK0VOZkVpYVc4?=
 =?utf-8?B?a01nODZQTU9Ob3JYUDBkOWtxUUxla2FmSFpIelczdDJPRmRLdithZm01Qkpy?=
 =?utf-8?B?dk9xaEJLeDZhaGFMTVVaUksyMHZ6TXFNZEQrRTEvei92UFBYWFBFSHlPT3dO?=
 =?utf-8?B?azdSRHQ0QUM0djVGd3VWSU5KYnJESzJYTmR4c0NNRXJGUkdCUXRsUTRMVjMy?=
 =?utf-8?B?c2ZuZGN1aXRweFFVVEQyT1FhZDdXSlNXaWplUERCS2NEUWVjOVdVVzdNVTA4?=
 =?utf-8?B?WGZ2aEhFVkpQdGxTdjlxUERvTWs5TXFYbzFmSSs0YjFQdExvQi9hN0pTcHZE?=
 =?utf-8?B?RmJFZmZRaU9DOURYaWhBNjFpcTlEdnNWOW9pMTB2MG1HaUdKZDhxdXZKRFJG?=
 =?utf-8?B?eml5SFVlaGVEN3Y1cUVnR2dDTDdtUUtVSGxjNkFwKzJVanV6SDYyWks4VUlN?=
 =?utf-8?B?QURMSlFmUjJqR2F3U01YK3h3L1o0bjFGaXBDVEtIcHJWM1hsL3AzRTNTckhF?=
 =?utf-8?B?VDBxaGhXUjhabnMwa3RUWVUzdU5tWkVOYnlKc2hiMjFOS1piTGdPSnl5QXE5?=
 =?utf-8?B?Q1paVW9pZ0RsZXdONm84enJaUWVON3M0ODdERVJtVDNncjEwaERKMnZOa2ow?=
 =?utf-8?B?SURidnpmYnJRYVpGY254SldPd3RwOW1KUHpieDhya1FjU1NxckZjZUk0WWhj?=
 =?utf-8?B?dG9IaDlNL01sazhoTnRpNWx6OGtYTmVTSUd5VnBqdU5jWXRuRVZIc2h5SVZH?=
 =?utf-8?B?a1pGTmFiNUtld2xXa1Z2c1c4QUJWTGYrM1l3N1gxRzVnb3lKWUhWQTV1QUhG?=
 =?utf-8?B?NXFNT2h1MFdYLzFnWmozTHFJZ2xTemFDVHhVSzBYa3V2UHRsVEQ5VCtESGJK?=
 =?utf-8?B?TjdPVWNtUlpIM2NKeGx5TEVGUHMvajFpajl3TkV2ODRGYWFHbW1zcm1HSjBj?=
 =?utf-8?B?NVBMNlhXUWsxMXRMeExQeGlpSUx1S3Q3QjZRVGl3Um9SdDI3OWlUTWphQlI4?=
 =?utf-8?B?RnZ3SkRIN3lGalJtVFJmQkg3SzIxTGpsMGlVMDFENUg5MERwaGJBaFZZTWVo?=
 =?utf-8?B?b0xNYnVqckx4TitSZGRRQkpidTFpUXlKc3JxYUdDWG1XWC9nbk1SSGFyaGxq?=
 =?utf-8?B?U0R4NXlSR1IyNStGMkplcXpwT3pBUkV4NjlyWlBtR2FCbVFNclh4SDZINVp4?=
 =?utf-8?B?RmZMMXZKQ3dseUxENTg5QzRuMzVoT3FrSHBWckhHOWxmNTQraUFFSUdMRFFB?=
 =?utf-8?B?d0NpaVpDeWtzQTdia0RsSmZ0TnJCUzhrQ0laaEIwZE1XeUNML1hhSGxxVDdr?=
 =?utf-8?B?RHIvaVVCVTZuNWs4bXVkeWo5SitteE9PcktvU0hTajlwQkZsUGdIUTJ0Rk0x?=
 =?utf-8?B?MkR0SnBUVzJ0SGZLeUhZYUNzVGNnMm5YZGhoZGg5NytPZ1ZFMENzWkszVUVT?=
 =?utf-8?B?UzZvcTQ2M3IrNVVPUFAxeFFDTVdFQXFsaUhuc0V2QXJ2TXQyeW91QVhRU2Fo?=
 =?utf-8?Q?AQCBAcwgGCETwfvvdvKzIWHWt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9227ea1d-d1f0-45ba-6c02-08ddaca24a28
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:51:58.7481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 186DQoTfSXOWR0HJL4nJpFtvwPLNWhga6UiXQj7et7LWUcK3Py/g4cOpT5GFUOGo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8475

Hi,

On 6/16/25 08:41, Krzysztof Kozlowski wrote:
> On 13/06/2025 13:26, Michal Simek wrote:
>>>> Based on discussion at
>>>> https://lore.kernel.org/lkml/20241002-revivable-crummy-f780adec538c@spud/
>>>>
>>>> Actually this shouldn't be only targetting GPIO but also for example
>>>> xlnx,xps-timebase-wdt-1.00.a but I would like to check it first on gpio
>>>> before starting to check other bindings.
>>>
>>> IIUC, patch #1 is a prerequisite, so you need to squash them. Otherwise
>>> dt_binding_check is not bisectable and we want it to be bisectable.
>>
>> No issue with squash if necessary. I sent it as series to be applied together
>> which won't break bisectability of tree and no new error is going to be reported.
> 
> You did not say anything about dependencies and merging strategy, to
> this would go via different trees. Sending something in one patchset
> does not mean that there is a dependency.

No offense but I don't think I can agree with this. The main purpose of patchset 
is to show sequence how things should go one after each other and series should 
go via single tree.
Sometimes people are asking for picking up individual patches from series but 
this is not a normal way. Also seen a lot of time asking for splitting that 
patches and send them individually instead of picking up from the series.

Anyway. If you want to me to squash it together I am fine with it.
If you want to me to create cover letter that's fine for me too.

Thanks,
Michal

