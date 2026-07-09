Return-Path: <linux-gpio+bounces-39750-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CaO6H1y9T2prngIAu9opvQ
	(envelope-from <linux-gpio+bounces-39750-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 17:25:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE5E732D6A
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 17:25:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=z8BVWcjI;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39750-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39750-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADDED31AAE90
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 15:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913A736B06A;
	Thu,  9 Jul 2026 15:16:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010070.outbound.protection.outlook.com [52.101.46.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B2D364EBF;
	Thu,  9 Jul 2026 15:16:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610187; cv=fail; b=AmkNU0Px1mknLi2Byx7pVT1PSXtZzwBlA9hVGpx5M/3w8wxPw5B/GorKw7kiTO1CfbkzXdNC0J0vWpwGtRBD/BoDhre1RDMBEwsVGhiXq4M4+76xsPdneEOOPChqU3kDQH7YjSJ1oE06vmlPzApAkKuX9CPKEqHbj7FOsnKtKH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610187; c=relaxed/simple;
	bh=leV7j4jVYs1riQDV+U1r2Fo1DS2zj41dCVuw5z7kzbE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E5tvypo0VKd6fU/nDy/hT728mX9ehJSFCdj3IEENgNHNM4GYvGjIMgXV6Qr7bWKfWxjeQBBTr91erwQArVGOJlC5x9Yoo8nLNy0pPAhWx46B48egkbIc/cmYGDM9mSoNwc075psVGqiRekGzYX4RjseJ+5vzJzbETbxo54SHVq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=z8BVWcjI; arc=fail smtp.client-ip=52.101.46.70
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrdTQs5JoB9KMaEVKOV5DMmxS7oqjc/1Yt2V30N69XiXF2O3pokP46i3bOfI2aBhVqL/S6FGbabRQPlGWDN540oTY0MiubqidbLt5SSFPomK9LUpMXg+LT1UY/3NOZwLMziDGp2nnA7ZYB/h6Uor0ST2S3LrJASTC8d28s6KMC+rXd//kEK10DRnMNgCduLFdf/D6iGNhBR7vdH7FStPVYxDFuuavE1KRm0QfnIzOy6FanNv9FURHzzWJ7DwnzAKh8hN6iVhjKIzDnlJE46Z2Ee8Q5QdCtNhQAXBAc5pxzNWpZ6hbBl6WCpwuPkJYpzg8jjBHhzeTQ9uN7rBAWH8kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b64IZkp3DthB3q/wLkYPo4LMevSPfK0iWjPh8K3txJo=;
 b=Ez+UCcS11/QH3+NDoQVMgWbVIL5qtPjY5/u/3OwjRCCQT4Ecn5B+5nlrF4Nq2zLbwVMSAKmzqv/1uX2rP5eu4SO75T2Hj/8rOEpNp8AupC0M3aNV22gjyiEjPCGGkEkX/Hyu+N34msY7NGmLBUm0f4+s8ZOtH1pGNh+iQMoLviOijgeEj2SOA7CZE0FGXTD/sEZ5j/5r3qYndbqLD7ItlPhtPWXy+BscGVftSnUbSYylocu1C+Q+09hy0IVkiJIjHXRA65nPD7CV8kj7P1QmGlSX0wA1kuej1k70TCenl0trGuPb+Sv66Z8EuALiTfi5JpEsrp1fP8TALo5KzjIibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b64IZkp3DthB3q/wLkYPo4LMevSPfK0iWjPh8K3txJo=;
 b=z8BVWcjIkE4ig0L3KuLwUrimKWRhG5eENGjKj7M60g6iLB49CCYnKr3okArqp90CmOje3FykmbZRSknXdmAGr1K1Hj9md6L6c4YnnN+DvImaLIw91IwO8umHBG5AXNWEtNaiwAiKDD7vlkT89tv0y+OdXFJdQup3p3kcFM6AdSk=
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SN7PR12MB7936.namprd12.prod.outlook.com (2603:10b6:806:347::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 15:16:19 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 15:16:19 +0000
Message-ID: <1c0949b7-37bf-4909-b163-f47190d2942f@amd.com>
Date: Thu, 9 Jul 2026 17:15:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
 vincent.guittot@linaro.org, Souvik.Chakravarty@arm.com,
 Alex Shi <alexs@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 David Lechner <dlechner@baylibre.com>, Dongliang Mu <dzm91@hust.edu.cn>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Pavel Machek <pavel@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
 <skhan@linuxfoundation.org>, Stephen Boyd <sboyd@kernel.org>,
 Ulf Hansson <ulfh@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 linux-arm-kernel@lists.infradead.org,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
 <20260709-tidy-oarfish-of-refinement-d98dac@sudeepholla>
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
In-Reply-To: <20260709-tidy-oarfish-of-refinement-d98dac@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0055.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:353::11) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SN7PR12MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db47909-f866-42bf-3d19-08deddcd076e
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|22082099003|56012099006|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+0D5pmJ8ZAIehXN8ni/f/LA4VG82M8od9tvG5xrmtyVpclwGOQjjS0ZIJN3xRlhHBcKFRpGPA4/+n0dIkl/wTKAaJWEYj2UtyAR6Ril8Y1GemEf0vO5mpBGhz8xLaOSWkfTfAswWSimVvZkOPtbPiJ5dwYTa4a9brZDmRkJ4dp0/sooqWrKsSPdw9FVFsOQFnrD9CWP02qVHgJkvZT0+Alpe0M4RpXOhmuOo2qs8s5nLWbhm4yxDbQ4iS8IgeaJI0ISrbDKAdN4JkhDS8Xr7WuuNiScOjHerqK8pKZbXEV5Z2RNJjyu4haJ0/JEwXqFTWuXixLlN+cVdTXuQUfD9cjZ9kCqwhhsFNy+/sOHkYDfxakjvRvr5fWoCEQ2nJEQVPH7hcIz0eJQVyMNP539B74wbe8aaffFDysPCNy9EGoaguiRKmTqaEPdWcFKTiROFhA4OfRAIQlobAf5kB4m8HuLRtKxL4tzRKxzML48Cq+0g53pKKmXICmJzoR85zzhv4pwnCD4sjxTcI2vswmYS3Smal6JKn9+n1VxzOaeQiNdJvJuRFQ8GGsnNhRPg4SrH8G9jIffgG4h1o5nc96eH6a7zAtQv7aBSq398sXaFfE4qZRcJphMx0Z4l8x4pSilnwgDEFqSxGdIopUHt7ZzRVJMnXJw6BZWjkAXLB2XpAKE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(22082099003)(56012099006)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1ZKL1c4N3EyOUlzTldrYUZ3Z3JWSlFoWmVzcDlyVStSYWlwWlN1RklGMmkx?=
 =?utf-8?B?Q1dyOUJPVFNndFZBVkl1WW4zM0txbGhXQ04wV3BrUGRGUXZWQkt2dWY3ZjFE?=
 =?utf-8?B?SDR4UHRaZVJld0ZURjRVUkoyay9vRWFKM25yVVVSS2N4RW90VW5RUkJCSmta?=
 =?utf-8?B?dFc1V2JxYWp3b3k2cmJVeVNRQ3E4WW5aMUFIeEpSMUdYZUJLZWZLUG4zWWRZ?=
 =?utf-8?B?RGRaT1R0Y3RMWExNMGRRR2J4UEFZVkNtelpQdm1mem9IM2Jyc3ZYUHFmdDR6?=
 =?utf-8?B?dWFra0N0NzZmeVVyb2UyWEpBb1BpemNhRWRvZnJGdTg2dmFvVnpEb3NxNTZz?=
 =?utf-8?B?K2NHUlRQUTlCOEFwcUd3UmcrczNyYWZuWjVZTGV5bzM3VzFRQTdOSXZOQnZs?=
 =?utf-8?B?S21qckZ0WjJpbElUK0owd3dNUnJNK1Nvb3ZpMXZWbi9xcVNjVnlOKzFsR1h3?=
 =?utf-8?B?eTEvTW5GR2wyRnNrc1BEY3M3emJNZE9jbnQrL1NmNjJQaTFSd0xYOWxrdFpC?=
 =?utf-8?B?SG10bk14TUczVnRSUXpXTmtlZC9HTDQ1SFdhWnMwQVQ3RURyalFXbGthRFBO?=
 =?utf-8?B?dEJrMnhCVmFRUTdlYWtZd1FPRWIwWmJoZFlNSXlGWlV5MDUyakkyaDYwOVBZ?=
 =?utf-8?B?TDV2M2JkVENhVkhaTjdLeVBOa0NQbm52Q1Z6Z0xJR3NOWDJNQmZ1SVFlZmZK?=
 =?utf-8?B?Sldha1E0eDhBNjBCMGhOMkJyM0RWN0tZRXprbzBHVDRaVlJwWmdYdEJtb1VN?=
 =?utf-8?B?a0lBOURVVTBobnpHVlovaHNncG9ZNGlZckVpckFSeFZJL2VFakFhQTZDSXVR?=
 =?utf-8?B?a2EwUG5vdXNEVE9qbU5qZnkwZGRhaUNoRDVJMTQraWtGcW5reGtJcUNUcHl3?=
 =?utf-8?B?RXZXMkxlejh5VVhCSUdlbUUzc2l0YzMzTWVsNzBjb3ZVRkF3a2t1dkV1OEox?=
 =?utf-8?B?ai9vWG5BQWlhaU1yV3ZlRzk0NS9WenZPOFUwNWtrK1IrVHlGMG9kYUl5Z2xY?=
 =?utf-8?B?SzlNdlh5NGc2YmN3S1Zha3Y5cjRzdUM0eGRLQTZoTXRkTjFqYVVZelFzNExr?=
 =?utf-8?B?MVY0NzlBVkl1WjM5RHV6a3lZcldHazlrOHUwUVZtNGhqelVJa0lTY3pML2NR?=
 =?utf-8?B?Q1VtMGdnVE1RbVFWWFJXRTdOdmxyTDlIcDV1ak85enFRSjYzaGNESkZzMmsw?=
 =?utf-8?B?MnNDbzMyanpmYTh6R3R0YlhoNFpyMjBmdUhMMkNkdDNpR3ZIWU5ldmZUcVFs?=
 =?utf-8?B?WmpmdHpMQm5odFcxa1hPdFprTS9DNElFckxGVWtlb0JUVk1RY0tDeXlTVVcw?=
 =?utf-8?B?NFQ3a3FyZHlrNkdMQVdaOVdyZzBqalpnZHltS1NSY3huaGNuK1hIdEZCQmZC?=
 =?utf-8?B?MXBXdG9HYkppY1NHU1Fsa3R6U3lSZ2VvaFNMZWVjeVNDdlp3b3djVThpQjVq?=
 =?utf-8?B?c29QZ0I3L2RnbzNlUVVzeTJvOWNHTE00RitSNExEOUlOUUtDTmtjb2Q3RExl?=
 =?utf-8?B?WlZlU2lYMDBoSlF6NlB5RHczbi9nTUJHTWZ3dnlLV2U1OHQwdGF2VlZ4ZVlK?=
 =?utf-8?B?UDRiL2lrMnVwbXU5K1JyR1FRM0l0N0ZqN0svandEaWVPNVNrVEVTNWtrOFhU?=
 =?utf-8?B?blArVEIyNzlNNWg2c2szbGdCU1FXOG5oaEU3d00wU3lHdHUyQ3ZEeDNRR3RR?=
 =?utf-8?B?QXRSVWlLTXJMcXo1dGZYWWtVd2Z4cjFTcjNLNUMrcU1HSmZNYThXNnIxY2hV?=
 =?utf-8?B?cS93OTVKcnpxQlhHcG9NQXE2cVFOWVRwNjZnQzhXclMzZStDcDhMeHIzQm9v?=
 =?utf-8?B?YWwvaWJML3piTERsMm80ZmVNZEl6SVVEUXl1Q2JWbU5rSTQraUVPcG1YWVBI?=
 =?utf-8?B?L0hPWUI5VGVqR1VrU2o0Vi9mWGJsa3dkOEFSZlhHVHRPOWtka0tkNnpZZVpu?=
 =?utf-8?B?UVBldjFGRFVjYnJSVzVtdFkwanZFM1JDVllsMzlmcFgxdlZyVTlVZ2lmTzNQ?=
 =?utf-8?B?TWxoWG5GeUdock03bDU2MUxzVHhOUmJCL21zOTdtNHRUU1lnZ2x5ZHZnMlh1?=
 =?utf-8?B?WTVEMUJvU0NVQmxmSCtEOUlmTVdPOUlRVVA5WmVxOTF2a1Z0dGV2VmJBMThN?=
 =?utf-8?B?d3NRSWExaU1YT0dLeTBkS01aM29DemJPd0wxZk0wYnJuWklkNTdkMDJ1NTJy?=
 =?utf-8?B?dFo1SHdLRE5odnZjUll4Z2xjcG9qQnRWSjdwU2p3aDJIYUF0Y1dqTlhUdmkz?=
 =?utf-8?B?N3dyaHpqalZnNzdEOWhXWjlYdUxMMTRzUWdmSlZzdWJvaWhqSUFuMjJENTFG?=
 =?utf-8?B?c2JpbW8vNzNHdEhoUDFKVGRqTDlHUDViUC9VQlJTSG1nVmd5Z2kzQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db47909-f866-42bf-3d19-08deddcd076e
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 15:16:19.7013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lF9ltWVRHD+o3DXGZF9EOSe6O2+7TdTashUbCro34kVT7k3C3O896A7R4JQCvhW5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7936
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39750-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[45];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:linux-kernel@vger.kernel.org,m:monstr@monstr.eu,m:git@amd.com,m:vincent.guittot@linaro.org,m:Souvik.Chakravarty@arm.com,m:alexs@kernel.org,m:andy@kernel.org,m:brgl@kernel.org,m:bmasney@redhat.com,m:cristian.marussi@arm.com,m:dlechner@baylibre.com,m:dzm91@hust.edu.cn,m:festevam@gmail.com,m:Frank.Li@nxp.com,m:linux@roeck-us.net,m:jic23@kernel.org,m:corbet@lwn.net,m:lenb@kernel.org,m:lgirdwood@gmail.com,m:linusw@kernel.org,m:lukasz.luba@arm.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:nuno.sa@analog.com,m:pavel@kernel.org,m:peng.fan@nxp.com,m:kernel@pengutronix.de,m:p.zabel@pengutronix.de,m:rafael@kernel.org,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:sboyd@kernel.org,m:ulfh@kernel.org,m:viresh.kumar@linaro.org,m:si.yanteng@linux.dev,m:arm-scmi@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hwmo
 n@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-pm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.simek@amd.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,monstr.eu,amd.com,linaro.org,arm.com,kernel.org,redhat.com,baylibre.com,hust.edu.cn,gmail.com,nxp.com,roeck-us.net,lwn.net,analog.com,pengutronix.de,linuxfoundation.org,linux.dev,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.simek@amd.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:from_mime,amd.com:dkim,amd.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCE5E732D6A



On 7/9/26 16:14, Sudeep Holla wrote:
> On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
>> On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
>> SCMI server from different architectures than ARM that's why remove
>> ARM/ARM64 Kconfig dependency with also remove ARM from description and
>> rename folder to reflect it.
>>  From specification perspective only ARM specific transport layers should be
>> available on ARM/ARM64 architectures.
>>
>> That's why get rid of ARM prefix and description from documentation, file
>> names, folder names, MODULE description, module names, Kconfig and
>> comments.
>> But keep origin Kconfig symbols not to break existing users.
>>
>> Hwmon, pinctrl, powercap, regulator, reset, clk and cpufreq scmi drivers
>> already miss arm prefix that's why synchronize all of them to be without
>> arm prefix.
>>
> 
> Technically it sounds good. We just need to workout logistics to apply
> this treewide. Preferably a script that Arm SoC team can run may be the
> ideal solution IMO.

I don't think this is going to be a problem if you agree with concept.
I can split it per subsystem and send separately that subsystem maintainers will 
just take it to their trees.

Thanks,
Michal


