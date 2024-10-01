Return-Path: <linux-gpio+bounces-10611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E38A798B9BD
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 12:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0EC41C23596
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 10:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69B81A0AFB;
	Tue,  1 Oct 2024 10:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="odD8JR77"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3396F1862BD;
	Tue,  1 Oct 2024 10:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727778628; cv=fail; b=B7VytuDeRa3BWp75/dyuJ9ygzd4kDxOngq+BxgXp4AC2bxCGUePhFTWyOyubHykh/7jROffrn3l6zDZg2IGFuZHIp1gFThuboR/kOlpqwySijw1JQw3FRT94Wv5gTNxrKI+7ECzGaVtdN5QxceFJSt9V0lDkFlMiBpnng/ZTIoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727778628; c=relaxed/simple;
	bh=xYtQgeg995BKCA6Ug6FJFaierCCJdPzHmevOxlIOTCg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rqJqZnZR9imcbfMsFZukpIxPgaTl9RCZZWhXDg9SovCtyTws+jL0pxJVxYpsu+wBVOc7RQ1VcAgYLrlq4p5nedIg1c4lH32Oq0rGrdJuS1i2vZQRt8eDGujyckOsnpSKWd4pbCHFGlWNWz4X1CvenfMSDQEUJicaIcryVp5EXec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=odD8JR77; arc=fail smtp.client-ip=40.107.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4aHJJYAvy/G8bM9YDPi3JR9ROWvGA2jFquDCRIsMgqDUPTZPeVELP22Tx1/YbIP7/6C/b6oWU2S2sOLpT9o9uEhBzsnqsXcfAemnLktV2EaySTpKwT7mn/x0ppbE4EIlf2cQR1M06Rbnv0s2lEImm7k7PpQfGdOwvyui6alDJe/ZTXhLjM9jJxNXcnS8bJ6kyMQIN5woRPhQ8HEgIpn9vzuHulGpwZmZZHTs7TaXBUxq982isqqZBUDWZlo4iJ46nPxVAnR9vC20GxoUkOZobb0M6f2vFPX4sQHYCvZhNlU9Nc8DH2Rjo3dPp9OswhwQ5rTGSJqCVc97FG0qm32uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9wrihtl49un16+o2CD3cCELMffI1YgklIjbuz+r9lY=;
 b=wooMv1oBMxs9N6utXG21sF0LrHBoMLNRx7LWri7ShPyC1dueJEXi1mjYEvbVQP2hpzsP+yTnAjMAZAB8scLvJdo5Wf7s0UAzDLnBf7vP+BYMBG/J3rbCS+N0AMM8PYgv+8iE1rwEw9j2bYu/xyQvv1O8iTeBWA96B7dJsWYZTN5PpT2Sgthqzjq3bzwVacUCfcyUzOyCqZ04cG3+HXChtIb9giFrs1EmWFFBkPFZPza2hV3to4qL/B4OCAWlG43H5pIrmIdZ8OjTX+O8u1/DzbJkDXwDXV7QjzqjNgYmUwdFB7yXffop8BzRM30R9PkMtYgJOEwDYA81FioWl/4h/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9wrihtl49un16+o2CD3cCELMffI1YgklIjbuz+r9lY=;
 b=odD8JR77p8D4r0lLXjYwZZLsd7i3KeW0q2zkJo898TB/Vit7HwrLb53XiPrMsE5iESRpkoE2ojZvydhpnN3s0CXKL8hlfstw2Nzp0K2l+piM1hoiB149C6boA6a7TVVIa5RSAsGij/OXvpqiMbvbvLn7Jpq6yxVAcfnRBugT0M0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8101.namprd12.prod.outlook.com (2603:10b6:806:321::7)
 by IA1PR12MB7662.namprd12.prod.outlook.com (2603:10b6:208:425::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 10:30:24 +0000
Received: from SN7PR12MB8101.namprd12.prod.outlook.com
 ([fe80::fdb:e120:f99c:c899]) by SN7PR12MB8101.namprd12.prod.outlook.com
 ([fe80::fdb:e120:f99c:c899%6]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 10:30:24 +0000
Message-ID: <c56f17e9-8da2-4894-9000-b74b7cb66e86@amd.com>
Date: Tue, 1 Oct 2024 12:30:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] gpio: xilinx: drop dependency on GPIO_OF
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240930144804.75068-1-brgl@bgdev.pl>
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
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJkK9VOBQkWf4AXAAoJEDd8
 fyH+PR+ROzEP/1IFM7J4Y58SKuvdWDddIvc7JXcal5DpUtMdpuV+ZiHSOgBQRqvwH4CVBK7p
 ktDCWQAoWCg0KhdGyBjfyVVpm+Gw4DkZovcvMGUlvY5p5w8XxTE5Xx+cj/iDnj83+gy+0Oyz
 VFU9pew9rnT5YjSRFNOmL2dsorxoT1DWuasDUyitGy9iBegj7vtyAsvEObbGiFcKYSjvurkm
 MaJ/AwuJehZouKVfWPY/i4UNsDVbQP6iwO8jgPy3pwjt4ztZrl3qs1gV1F4Zrak1k6qoDP5h
 19Q5XBVtq4VSS4uLKjofVxrw0J+sHHeTNa3Qgk9nXJEvH2s2JpX82an7U6ccJSdNLYbogQAS
 BW60bxq6hWEY/afbT+tepEsXepa0y04NjFccFsbECQ4DA3cdA34sFGupUy5h5la/eEf3/8Kd
 BYcDd+aoxWliMVmL3DudM0Fuj9Hqt7JJAaA0Kt3pwJYwzecl/noK7kFhWiKcJULXEbi3Yf/Y
 pwCf691kBfrbbP9uDmgm4ZbWIT5WUptt3ziYOWx9SSvaZP5MExlXF4z+/KfZAeJBpZ95Gwm+
 FD8WKYjJChMtTfd1VjC4oyFLDUMTvYq77ABkPeKB/WmiAoqMbGx+xQWxW113wZikDy+6WoCS
 MPXfgMPWpkIUnvTIpF+m1Nyerqf71fiA1W8l0oFmtCF5oTMkzsFNBFFuvDEBEACXqiX5h4IA
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
 If49H5EFAmQr1YsFCRZ/gFoACgkQN3x/If49H5H6BQ//TqDpfCh7Fa5v227mDISwU1VgOPFK
 eo/+4fF/KNtAtU/VYmBrwT/N6clBxjJYY1i60ekFfAEsCb+vAr1W9geYYpuA+lgR3/BOkHlJ
 eHf4Ez3D71GnqROIXsObFSFfZWGEgBtHBZ694hKwFmIVCg+lqeMV9nPQKlvfx2n+/lDkspGi
 epDwFUdfJLHOYxFZMQsFtKJX4fBiY85/U4X2xSp02DxQZj/N2lc9OFrKmFJHXJi9vQCkJdIj
 S6nuJlvWj/MZKud5QhlfZQsixT9wCeOa6Vgcd4vCzZuptx8gY9FDgb27RQxh/b1ZHalO1h3z
 kXyouA6Kf54Tv6ab7M/fhNqznnmSvWvQ4EWeh8gddpzHKk8ixw9INBWkGXzqSPOztlJbFiQ3
 YPi6o9Pw/IxdQJ9UZ8eCjvIMpXb4q9cZpRLT/BkD4ttpNxma1CUVljkF4DuGydxbQNvJFBK8
 ywyA0qgv+Mu+4r/Z2iQzoOgE1SymrNSDyC7u0RzmSnyqaQnZ3uj7OzRkq0fMmMbbrIvQYDS/
 y7RkYPOpmElF2pwWI/SXKOgMUgigedGCl1QRUio7iifBmXHkRrTgNT0PWQmeGsWTmfRit2+i
 l2dpB2lxha72cQ6MTEmL65HaoeANhtfO1se2R9dej57g+urO9V2v/UglZG1wsyaP/vOrgs+3
 3i3l5DA=
In-Reply-To: <20240930144804.75068-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0205.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::26) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8101:EE_|IA1PR12MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e21f06f-adb0-44a8-85f8-08dce2040f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0FHOFAveVQ0TlZ5OTRvVEUxZWZKdmpBTVFhaEIzaFdLR3BQVjN4YnQ2Zkpm?=
 =?utf-8?B?T2Z5ak1iZ2pkSEt3SlhXbDFXcW1ZN3oyaW5ialFlbTJndURBSjI4bCtnN2Rm?=
 =?utf-8?B?citwMzhZUXk0b1RwMUVaOHNBRmxqVEJBam5qaU1NbFhlVndNQjJwM0tJOVF2?=
 =?utf-8?B?Rk5tWVlnNjJwNG5BWXB4aGRHdVJ6VWVTMk5FRnBjQXo4NDRjTjBhMms4U0tj?=
 =?utf-8?B?Rkh1Ukh5dHlKQnh2RFdpTGpkQVNBaS9mQ3lGd2tjM1JCaHdoS3BPU1BOczd4?=
 =?utf-8?B?OHJIdzNEZmc3STl6MHQrd2gyRjVJVnV6YXZIdktrcFNWZmgwaThxQ0trd2h3?=
 =?utf-8?B?c1JSSGdVZTI3OEozeG9FbHBjcjRuUU81S1UyVzZSQ3J3anExVUlLams3bWd6?=
 =?utf-8?B?UUJkcm5MeEFqWkhxNExIcXJ3WFJZWHM3My9xNzZrL2J2c2tZcEtyNDQ4eStq?=
 =?utf-8?B?eTE4cDVBdmJheVFDVUJyajJNVHpZT2FmN3JCRE9oYk4xek5DUEtEczd0YWRT?=
 =?utf-8?B?S0NUanp5REdPa1hYb0tTaE5LOUE0R3puWnVXcTlMQmprV2hWVjVldkdqUVZl?=
 =?utf-8?B?cW5PYTRXc0hWaDFrcFhCbWFIczM2eElRdmRUUkk2L09ubUpkQzRYTi9mU2xn?=
 =?utf-8?B?azB5bHpMYzVOM2dOZ1Uvc0Z4WTBWQ0NWOVB0OFhETnpqSkN3aDhlWmtIa2NI?=
 =?utf-8?B?b3RhcktKQmdjcmVVSlg5bDMvcThrRDBScDZPM3NGSytNYUpMQnVKV3RyK1pl?=
 =?utf-8?B?eVcrWHBCQ1J3eUJKcVNYOFlGREV0eS9DQWd1UVFtN1lkWmFCb1hKazlRZVVT?=
 =?utf-8?B?c0FGYTU3cHVkcWVORzV0b2ZMQ2QxUWlBbjdScHlzR1RGUlNSZ3VncDdwQWJz?=
 =?utf-8?B?NjBCVlBnNDJpZFZKRS83SUNJOENkSHZrejFKVjk0bTNvdFlvNE1YcXV2dmti?=
 =?utf-8?B?ZEdQVml5RHQwK2hWK1FyK3JuMW5xbkt3ODZLakNxaUg5UklQZ09VbXJUL2J5?=
 =?utf-8?B?NFlRTmwvNHlrMFFUTXZFTmNBK3FOVFZyU05kNmVzRklTVll6MFk2bDFiNGpa?=
 =?utf-8?B?YjFPZVRWeEFCc1ZJRU1MaExyUWN0R00vRmpzTFVXRTBXU1ZaZnJUbnFsQlUv?=
 =?utf-8?B?WldFbXhvWUtqR1oxQlMzMzRzMit1NElhZHZUeHFrV2d1SURkbElCTHphL0k3?=
 =?utf-8?B?c1hDdEdONWc4UEc1cnVnaFM4ZXF6NUVZR3NuQXRXTVZFNEhyUExJMGJjV08v?=
 =?utf-8?B?cFlKQTFhdVVXUGZwajk3SFJvaHcraXFXam1HdkdLM01jakpmcUplalNvTmQw?=
 =?utf-8?B?Qk0vUDhoRjlaZXJRaGxWTS9naVpLVCt5SW1zUTIwdXZTSlVTYzNWSmRVR25H?=
 =?utf-8?B?cm0rQS91MFBETU9va1RnQ2VpdHJoanU3emZTWGV3cFlRam1jUTdwN3JuMldv?=
 =?utf-8?B?MWNVK1FybmRFS3BJN3Y5ak0yVkFpdlk5MzgxckpHSEc4MG9OQ2tzVXhROFR1?=
 =?utf-8?B?SHNWdzdUSGpQRTBCaFJtVVZrdDRRcDk4cXNRcFhQNzZPYmszNHR5MnhXVzU5?=
 =?utf-8?B?WWx4QnV3cjJPaEpxQWxFSzA1TmxIZ0h0RHo5bUp2R0ZHM3A5ejNaRUhzeHJi?=
 =?utf-8?B?OTRZNlpjUUIxcEZ5NnRpSkdNWDR1NlRoM3dTS0JFVXVUdEZ5UWt6VndRRVZo?=
 =?utf-8?B?ZWE3RThFZjhZcm5SOTZJYjRMcDFjWWtJdnhGbjBqWmhlU2RraHhnNFRET0JN?=
 =?utf-8?B?a2RJc0EvWGNZRDVyZ2NxaXJSTDhvdVFnQWRoVzJqUmgvQzR5bHFiRk5FLzJ1?=
 =?utf-8?B?RHE3ZXpFU1hlR0Z5c2YwQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGtubFpoQUFwbDFaNUpOenNjb1VKWFpzUXNtRjhqN1NMaDRLTHdVN1BIcjd2?=
 =?utf-8?B?RzdyamNES3UvM0Z6d05BdmNublNsN3BQTlphMzBDdmdOMG4wekViaGhLUVZt?=
 =?utf-8?B?QXg2Nm01Rk9hU056VEc0NnJxbDBlVmx6OWRSekI4MkFqQytxYkJHeG9rM29V?=
 =?utf-8?B?UGJGL2I0RU91NHdMbkxRbXRNUG9oYzYzT0REeVF5SXRkbW1maDVCRitQaGd6?=
 =?utf-8?B?ZHRkTmR6U01QNlRCYUxBUy8xWDJKalRZRVJmdHVGL0RFUTJQODN2Z1JZa3o1?=
 =?utf-8?B?cHRqQWJaRGpBQjJpRzlMek9KVkQxWGRWSjV3M1dZVytaRURCMjBYSHl4clhs?=
 =?utf-8?B?RHFBa2RQRURib2laaGdDVU51UzFZVzZlQzVSUFdSVng3ZUVWOFBhN3gyTGN6?=
 =?utf-8?B?MXJOZytUVEhoTlBRU09MOXBleWZmL1RrWWE4alhIZXlRY1NvdHArbFJMM1JK?=
 =?utf-8?B?Y21wVmlGYkZRNWtpOFRjYTd5cGJ6OFdHZ2RmVGJuczY4REpkQW1sbXZRU2ps?=
 =?utf-8?B?Q0VPbHpLbVdQcmJmN2lJSEl3OXlBdkZLMHkvcGRIRWEvWFhHT2Z2WkdvdnhV?=
 =?utf-8?B?NStYNEp1d3RYSUx6dWVBQkRnM0YzN081NzM3aURnWDltMWg1dFNoOFdxbU5D?=
 =?utf-8?B?Q2hBWE8yR0Y3WityUkFSYUwvU3BEZEZpR0VVbjdNS3h0cHpDQVZ4ODR2TmZm?=
 =?utf-8?B?czcreU9RMkR4SklVbE1zZzBhdStZTWFPZWExWi84UzNNazBtN20vcXkveDBr?=
 =?utf-8?B?SkVTd1NUaGNEdjV6U2JtZmUrYUlNQ2ZnV1NUcWloWTU0Q05tRTV0d1ZJeTd3?=
 =?utf-8?B?cksxcXhjc1dmWGdwL3lCTWN2T21nY1ppK2t0UzBZaFE3RUw1WmFUYWx6K1dF?=
 =?utf-8?B?ZTM2dGJyZmFlY2VYU0w0NTZ6bGFGTjVMa01HelZ2QkErTDAwMU0xQy9BS3kw?=
 =?utf-8?B?R2FzTFprQmsrdlhuSmdMcUZHTk1maDJZbjZyV2IxaERpN05kYVVnb1hmQ05O?=
 =?utf-8?B?VXpMeXRLRFJYOERuQ3Y4bjhWSG1ITWNzdFlleVgzRDdGWUx6L1RRM2VmV0Z6?=
 =?utf-8?B?eVRUYmZmZzVWY0JWVTJqL0VHR0planc0WkJFSHlJMmMrZTNmc0NRaTU5dHpj?=
 =?utf-8?B?U0swTTBhMkNNSHIrZHN3NEtpWmdaVVBEVFFuSlZYS3kyaWMrTUd2cS9CaUVG?=
 =?utf-8?B?QTJCOUgwcktObWYvZW12ZXJlMGFxRHNzRklCVW5WQkxpNzVOaEtsRVVLcTd5?=
 =?utf-8?B?Mm14RWVxRXVtV2c1NWFBT21jMkFCWitkbFF6YnJzRXFOY3UweUtCN2RHeUtK?=
 =?utf-8?B?WFAwZDZoK2diZEZ6dDg1eHdmV0RZdVRlYnlQVkh4bTl3ZmFBOWV3TE4zcldm?=
 =?utf-8?B?YWppWC8zSVRORFdNVHhIT1QzdHFCaUJDRUNsWGNPTTIra3Z4cHg1NnNRM29X?=
 =?utf-8?B?bkxUU2g5bk5ISlo2aWZiTklNRTVVSm1iZ29Bb1RwRk8xMVEvNi96SVBIcXNI?=
 =?utf-8?B?TENVQi9mSGUxU3pUN1NHVldmbGpoTS9wU1hJdVUxcVlYQ3diWWlxOHFLb0E4?=
 =?utf-8?B?eDZIL1hhOUEydGpTQzB2NnI1MHRWVE1mNlovUmV4NkgyemZxc1ErNWJabUtC?=
 =?utf-8?B?dlBTMnlqQkJyUzkwUmYvV0hqYVFIWXVoTExRYkZrVzlwd2c1Mkk4UXU4TGVm?=
 =?utf-8?B?bXB2bEVJbnpXNm5hVXJsMGR6dnh4WEJZandqMjdrK21Dbzhrc3hRUy9oMFRk?=
 =?utf-8?B?cm1ZNUpLaTduaVBnL3lmRFZMTGVvbnZxUUxxYlVIQWZvV1h3RWQzOVJpbHBO?=
 =?utf-8?B?bVVVaDFEaGMySDVVcytsSHNCQ2ZzUGQzWFMxcWRMSkpyL3F2M1dyOHJmTGZa?=
 =?utf-8?B?VEkwMm5VbENOODc0aEo5eUpmSldydGhVaUxhSVp4d3Q3bDNPeU0ya2NRTnZv?=
 =?utf-8?B?ZzVRcUhaa3ByeVZNanI5TkhkOWs2QXZUbit4VGgvNzBlL3VkMnlXMVkvMUFX?=
 =?utf-8?B?YmVZVlNza1kxcjhnakl6aGNPWWxmYkw2YUptdjV0NmZCNzlwbGFQaUJsb2cy?=
 =?utf-8?B?dkdlQml3NlU0SENGUStrWTBneW84TnR1WEs2aTkrM2M0S0dNZSt3N2ZkWW5X?=
 =?utf-8?Q?boWqdqsixqLPGbw2W0OnqD3CA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e21f06f-adb0-44a8-85f8-08dce2040f05
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 10:30:24.5197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9laUnzXYVKh8sWq3cebyMgWBTR5GMN4ytZWDMEZ3hzBm15H8N/iB5VGZTl/o9Hxy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7662



On 9/30/24 16:48, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This driver doesn't really depend on gpiolib-of being built and can be
> compiled without it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index d93cd4f722b4..0d676c96b72d 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -796,7 +796,6 @@ config GPIO_XGENE_SB
>   config GPIO_XILINX
>   	tristate "Xilinx GPIO support"
>   	select GPIOLIB_IRQCHIP
> -	depends on OF_GPIO
>   	help
>   	  Say yes here to support the Xilinx FPGA GPIO device.
>   

The patch itself is fine but it should be likely applied as last one not the 
first one.
If this is applied like that feel free to add

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

