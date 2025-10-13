Return-Path: <linux-gpio+bounces-27018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 316ACBD294E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C73754E3491
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 10:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3573A21FF38;
	Mon, 13 Oct 2025 10:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b="RU8evdlD";
	dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b="n8JkXrVu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-002c1b01.pphosted.com (mx0a-002c1b01.pphosted.com [148.163.151.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6B960B8A;
	Mon, 13 Oct 2025 10:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.151.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760351600; cv=fail; b=gFGz7cOYFPqKGZIb/KcrPu+Ibd1rUJmU/FoKEIwA5cuJ8xGcCTbQULR/18dagcKkns2z3/lIS64wcSlxYflWILhhl0cMzuVwwq+S3Be1uCyjZt6BecCOqRVqmd/a+UbIfX8I2T0Di1jTg9LDJeqh34x4fk5CiuR8zDwKeaB4Lvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760351600; c=relaxed/simple;
	bh=070VuSUBEek9MXKoZ5bi6cVNW8zjOMaOfvz237Laa1Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gJ9OUIXjIHT+xDjlePlBopLh3rnFzSZxIgkkJSRe+Qad/4ixFux8UflcrY7Y/wNW2tiZhA/XkZ1IJ34DMQbnuTAfEq480Q3XsbQMG8D/LyABllakejNHgDGE1y4tCFLbUL9w9v0HLcPxQOBPwZgNa6Oux1aCPKAookhYYzBl0NQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nutanix.com; spf=pass smtp.mailfrom=nutanix.com; dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b=RU8evdlD; dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b=n8JkXrVu; arc=fail smtp.client-ip=148.163.151.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nutanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nutanix.com
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
	by mx0a-002c1b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59D5u0sC2686210;
	Mon, 13 Oct 2025 03:32:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint20171006; bh=GP6BjiLZds3+EuNFThv31N4gvrsUz1oZngdd3c5g6
	LE=; b=RU8evdlDLmGmW6JkZeaCP9iWTIDgicOSnAVNM72j78yYI04CI2SdgEO6p
	EtKQJ8lHgkC5Yu4VUMjqrkxYmJ/OBohD0tVvjg0Avbw+eMvNWxYdDkGDo8IC3hYk
	xgpxOhHf7DvVDEEJQk10jWXF8tNUTVGYGKm7wzx4MrM8zk541urzNq70FQMwLCYa
	fmYK1zx/vaR/zyGDOICXMEN1T7SOQLteoVwqXCAgGQfpPxYH3jTItib5uMbgwYg5
	WbLwG5cdDzR0J8uAtCHGeN9N2F4BhIGWHly6IwJkRhx1X1O4EIr9zYt9KYfm6kxk
	8dkk2XRCHDaaY4+mHtuM0Gaw8sqXw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022099.outbound.protection.outlook.com [52.101.53.99])
	by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 49qpstaxeq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 03:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOZPd1A87UZAU53axS3nhsJ7W2d0TFgs0ucwWDVPugGPB+J9Jkxv7AOrxKGZjpfCWeunKfd0K+f674o5GcJx+Wz/m5eyBSv1kq5wbeUptLdPZcGEzFAHJogcna89B4knaUvlRc7INGz148ztrPX7aw0h6prR7dg5tAbpkwFsT/KFnFL6DOJQQzSv2b/NEiKgoBMr198PMpKmv63q7vKUFgMWpJV+vZH99uOXwwdBZHqBGN7w07+qk0GVI8Wh+OQTw2whxyxn4F8lUMxP+6+yyV5Mxc4sKCFUufF+RmSMt1D884UB7hld1hzBNnTQPOLD9zRXpBGfIlQ7vTNAKWUnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GP6BjiLZds3+EuNFThv31N4gvrsUz1oZngdd3c5g6LE=;
 b=L9tkO8zyngSf2fowL+x27uqK3cDHt2EFUUhmx3eqnKNF/XH0N45rHMWclma5hemy32LENeHVnCn9f2Vuqp+GTOp3+33d1EPWrBYf9Lamc9JZjug6xAMxlIQFzKtcKI5GdZOVQ+8GgoPaNC8kSdGgN0Y4oTfOykZnZB6RWUse5AS8Eht2SgwIVb2xzYzxar2iV29Q1RyS/2XsJRJw2AnwwJPtJwVr3DrWJnqm5OOD6iRKAdBfOVv+4jtMm6tpG5ckEYwVQ+c+9mYKDHKLYqD0SfK698Z5GGrjoKlJMiPayCJsPOx0pQ/WykbUlKaL6D1uTB8xPJs7/Q4kA00TKhFyOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GP6BjiLZds3+EuNFThv31N4gvrsUz1oZngdd3c5g6LE=;
 b=n8JkXrVuGM4C2snen1Q5huik8W0HdQ6QO1OPglmA5z0XOmYC9wyMnrRdFubQndwZy35K/sS8SRbFWdMQqgZIm8FroVo3k+Jqif0JPhVeZBhXgn3osH79KOxW/ky4jYSjrqx3Rz9jrQc8ckBGK1UKZfLl3dCAooy0ILFEyO5Z3+1jSpFlUyvsvEbkprBq3SR0qmGNN4ogrB5NTMQZQI2Ou+ZF7OAkMuWpBUTtroEtp0kBhq6gDiAuaXJ2H6ORavGXTyOhgfqPJX5xQpTidtn9b+88fjFKxUkyQopBSsP2JHq+G2z8cF0I4S7W7D7e6ofur+mf9rSzhmA0JtUa2wwW6w==
Received: from PH0PR02MB7159.namprd02.prod.outlook.com (2603:10b6:510:16::8)
 by PH0PR02MB7560.namprd02.prod.outlook.com (2603:10b6:510:55::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 10:32:55 +0000
Received: from PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::6cf9:b35c:b143:bb88]) by PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::6cf9:b35c:b143:bb88%3]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 10:32:54 +0000
Message-ID: <6f4bdb5e-56d7-432e-bc5f-cea97c37ac77@nutanix.com>
Date: Mon, 13 Oct 2025 11:32:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: gpio: gpio-pci-idio-16 regression after LTS upgrade
To: William Breathitt Gray <wbg@kernel.org>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, andriy.shevchenko@linux.intel.com,
        mwalle@kernel.org, broonie@kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251012142216.72248-1-wbg@kernel.org>
Content-Language: en-US
From: Mark Cave-Ayland <mark.caveayland@nutanix.com>
In-Reply-To: <20251012142216.72248-1-wbg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0087.namprd11.prod.outlook.com
 (2603:10b6:806:d2::32) To PH0PR02MB7159.namprd02.prod.outlook.com
 (2603:10b6:510:16::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7159:EE_|PH0PR02MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: d1b3d148-997f-45b1-8889-08de0a43de8c
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjlSNmhQaTdpS1A1bkcrcnQ1c2FCMjZndnplcy9hdkhIeU5vdmsyaTd6NUZ0?=
 =?utf-8?B?QVF3U2t3NnRNNHJKQXFSWHRKWEVkT2xtdzZ1aGNmRG42cWZWQVJyODBEWGF3?=
 =?utf-8?B?aFF5b0JoNVRyZDlwbVFaTStXYUcwSC8rbllRTTFQQ2RPMmIvNzdISUtoK01j?=
 =?utf-8?B?eVJzcVZxcVU2cFZUYmViTzRJbVFWMHFJMmNEMjlsSEJMZ0d6VWZTKzBRMXE4?=
 =?utf-8?B?eUNCbEJWQWpIcHdneEtlR1hubFF1WEdxR3JqSGZmK1hTUVdoZ2JRQU9va1Uz?=
 =?utf-8?B?YmwrQ2djeld3b3hPbnVobVJ2MnIxWG5VNk85UjhucjM5dFV5a25seTlIbWtE?=
 =?utf-8?B?UDF3KzNTYWhqbVlHUE1raXVMVS9pMFVtdmJ5Q0E3cE5kdnRnYTFxYW9iWFY1?=
 =?utf-8?B?R0FaNDlQV21hS1MvcDZMQVE1UG9SdFc4QnNPeVNLV05nWjFteENRdFpWVHNi?=
 =?utf-8?B?bkFWaUFOVFF5TVhTb3VBM2dlV2IyRUhqNFV4SlgvQlhRVEhNVmxkWTZ5alRx?=
 =?utf-8?B?blE3QnJUaEpqaUorSGFTanFjYzFwYWRLeVIxM0djekhFd1FPVnZaZVlCd2VN?=
 =?utf-8?B?ZjFUQmhZVVlVUVl5THFEQUM4cVlRaUd5TlJsdjdCY1YrNzlzK3Z6REhjWGRH?=
 =?utf-8?B?czZ6ZWt1SGlBSHpwNGl3dVpuZThENGMrWnBURDhwc1plU0taMTdzL0MvU09a?=
 =?utf-8?B?MHlHa2R4clI4QTR0MmcrRzNDZCt3cDRPSWN2YWRGWTVBT2dsL2tIUXdSVzlO?=
 =?utf-8?B?L0NBZWRkU2RINjUzQ2lka1k3bjM3TW5qdkk2eTdzOWEvdjMrQUtpVnJsNW9O?=
 =?utf-8?B?Qm5zV29BTEN1SVpTT1pIV3ZOdTgralA5UnlaQmxLTk0zZWNMKzNRWnFpdXRB?=
 =?utf-8?B?cERJOXhLTUdFVzRjTmlYd2hUeGw5ejhJNFg0OHBrbEtpV214RkpsbGQxanVV?=
 =?utf-8?B?TmZraVBNZEhBdjRwNDNLcndVL1BtQVhHZlJMbCtKdWg2dkNYck1oeUt4UmlV?=
 =?utf-8?B?V2ZsSjFEcERFT21FOHplODZmU3hsNTZ0SWU3SkQxZHJpcWNZRmYwYjRnT1JG?=
 =?utf-8?B?TVVCTDRFRWlDNjdhK0p1a1JMc3YwdldKZ3g0R3ZoQS9HeUFNR3VoMHpQWWhN?=
 =?utf-8?B?YmliRFJLcFFJUnU0RHVhVGlVKzhvQTViQlJuSzNQZ25VTmduMFBncEtpbnVX?=
 =?utf-8?B?cnF3WGJDR1E5WVV3eGhXenpZbDZHamJ3bHR4OWd4bzVmVlpWNWpNVk0rZTBs?=
 =?utf-8?B?TjEzS3U3RGJmb0RGa054bzVYYTVsaGc5dCtpSHZYTDExc3VuMUFnNVhoNTU2?=
 =?utf-8?B?cGVXeDJ0RWZlOElDd1ROQmJYY3hCZVg3RlVKVDcxMlR4bE1nMzJYOUpJNzdx?=
 =?utf-8?B?bUZUZ1BYY1BVcGNFYXZpUGNIOUxoM1Z0Qm5NRm01S3k1ZkpDcGd1TTR6dGg4?=
 =?utf-8?B?c0ZxSE5Ra3N2WW9YY1J6QWs5UWpXZ2dpQmEyZFpoamdCSCt2b0VVQW5GY2Vx?=
 =?utf-8?B?UTdrUmhaRW1rSitaWWJlL0s3dXBBQlc3VlZXbjRnWldkYmtBbkJ0QXRWL1hm?=
 =?utf-8?B?RXhzRGUyWGNkN1Q4ZERtRy8zN0ZIdVc5TndaNGpxQzMxOTNmWnJjbEcxZmE5?=
 =?utf-8?B?a1V0ajFRenBLRGZrWmhPaU1qS3ZFNjN3UkFpbitHK3k1VG1DVVVQRVhqenpL?=
 =?utf-8?B?R3ZGdUkxU0NQSFZLWWZKT1VOWnRxT1Q1OHNxU0N6Vi81c2tBaXZlcSs0M2g0?=
 =?utf-8?B?M01XbXVzTU1hdzJya0FPU2dvNFRaODFST0kvR0MrekFJYS9vWkg3akk3NGJj?=
 =?utf-8?B?YXZEMWtLNUNEelJJLzRtZG5JMDluZG1UbE9DWGxlVDgyak5oUnhrSFNHemdr?=
 =?utf-8?B?dzdnbjdHL3BGTWIwOFNXQnlFTGFNaWhWcFkrMDlURWNyV1IvWUs5VVY0NHdu?=
 =?utf-8?B?cmdpOUEvbkRhM09HN1pTV0M5OW1lVjE3OHI5ZjBId1FNOHh0YlJFb25sV2ow?=
 =?utf-8?B?dVNiSjB6R2xRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7159.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzByeTBnQVRLL24zcVZLYi9jZW5meCsxZWFXeWFMWHVjcDhtYXprOVFDZEN2?=
 =?utf-8?B?eWc3NGNJQ245bzB4M3RtSkhHV2x0bDhDRFNhNW1BSzkzVnlwKzFTUnozMzJE?=
 =?utf-8?B?VEVYSTBhMFNlVUxSdW1PQjVWejlMS0ZmSzdPSWM2WkVDbGl1QzlONVMzY0tt?=
 =?utf-8?B?bXJlOWpOZzRaWTNISkFxbFZkUUlBVTNjR3dIdVZGUVBjWCtDTDBGQUF1UWZw?=
 =?utf-8?B?VHlieGdJd2oyVkZUQSswVUdNbzluQW9icktHaFNHcHBtTVJoVXNqY1pYSFdD?=
 =?utf-8?B?VGg0MU10eEpqU1dwY0lkcEpOc2FvNUhYZnB4ZTdTNDg4WHVINE1iMVhvVzJj?=
 =?utf-8?B?dkRuNXgrYnVkODhTR3FFY0duUGJWdmljbEpsU2xNd2tCcTRFQ1J6K2grTTlL?=
 =?utf-8?B?QWFZS3NFNXdRcnd5QzlRdWNsbjg2MnhzMUFOME84QzNZZFlJdzhGeDc3dnMx?=
 =?utf-8?B?ZUZ2SFJwdEw5cGtiOEJsZmZWYjM0djdLaFN3NmpNeXhVdDYwZE9SeTY3NnVm?=
 =?utf-8?B?OGYxR3dKN1pzbGRlT2ZFdVpQSGpwUFJSSWNxZnpwSU90Q2cwVEtuSDByNmoz?=
 =?utf-8?B?MTA4R0NTdllBV0xaL0ZaRjZlY1U2MXhiWktNUThwZUI2enFQaUhtV3dRL3lH?=
 =?utf-8?B?MDVCMEkrcktVbGk1ZitycndmV0JIMklBU2h3S0NwVm0reVZ5UFZLYVcwS3Nx?=
 =?utf-8?B?RUFwamZrOUZ4eEd0L0xKVnFxbnRhSTYrcHhLSHB3U2s4UGxTWGpERDZJbmd1?=
 =?utf-8?B?elp5ZFNQK21qNm1oRUdhK1FYUno2Q1dubkdVZVgwT3pXU2xIVXBGUEE0andF?=
 =?utf-8?B?MElyeDdTcktpd3pKSXl2b1dTVHZuTTVBdlZzVERVQzVYSEZ2RlZNZkI4VTJy?=
 =?utf-8?B?NlVxdXM3NmI4Yk0vbURzaWcyOHNGbEdKYXFjYXpDT0pLRHBPbkNvMHVRbnZ3?=
 =?utf-8?B?YUdWcVR3U3hxK01ESUMwMFdSRVZ6dDJuSEUyWGpEekN1eG50WFg4WjMydDMz?=
 =?utf-8?B?RTNoakdQVjJmalhCU3lwbWZjaGNLTHRGMmlIT04rVzNzaXAwQVZ5akFqMExx?=
 =?utf-8?B?aEgxNXlXcURMRHUvQnNEMnRJRzYyQXROV1JwUjQvL3h4Z3B4VnZvYWs0SitE?=
 =?utf-8?B?bmttSDh5WE9UeEZXSzVUMnExaCtPQm53aTRxTXJMTW8vVzYwS0RnSGlnR1Rw?=
 =?utf-8?B?czNEUmhCU2N3bE1Wc3dSZExKMW1WWWNFNXFLQ0JZUW56cHU4OGErYktNOUJG?=
 =?utf-8?B?ekFuc0ZYOE8vY3ZuS0tZZnM3ZktCcnNDYmY5VzBQTVB1a1BvekNGMjBmWUlj?=
 =?utf-8?B?YUIvR0ROL1gzaUpQR2VNNHo4VmJxS3ZRSnFONit1Ym9NcUxRSDdRb0E4MlZC?=
 =?utf-8?B?OVY5cWlrNEpldXRaSjZLemlocnpKdVhrY2cyempZditJaXFvNjVCMjZjVURZ?=
 =?utf-8?B?NnhKbWl0K015UlJ6Y1phYXYyMy9mczdkU0c1TG1CblAwajBqRmdLaWFOT3Zj?=
 =?utf-8?B?dUZrWHFZYmJkcG94clVrd1Z3WVh5R0FlMlpUSlcrZ2YvRmVYMzlyNU9hQlRl?=
 =?utf-8?B?MDNiWVdDckhMYVdyUGkwZklicUh4NmprRGZDdTBqcUJOd0NTblBVQm9YTVdJ?=
 =?utf-8?B?NWZFQzZGTW9tU3FGL3NxdlQzRjZibUw4Qnp2L3J1endMZ1BFNzF6R0w4Y0xD?=
 =?utf-8?B?UENzNG5vcnJmTXZwMGVxVEd6TjlxcFhsQXRLdDlrSTJEVnZWVHRMakdTRTNh?=
 =?utf-8?B?Z3REWnJxM3daZENzRisrNjV1ZkpkN0RSVithamIyYVQzdHhXbVJjYUpDaFFC?=
 =?utf-8?B?NlpwNXpraWFvQzJ4MGhXOUt4UzNHanpGNlNCcFIwUGNSQXd6dGozSXpGMjZ2?=
 =?utf-8?B?dUZQamV6QkhQS0UwZXVZR3lMSlVSRlVKMFFkZ1d4eENWZjdwdUJwYnB6Rkgr?=
 =?utf-8?B?RjNmVHIzVHQwQVlyVFEweGFtVHdxdTdYKzZKUjhOd3MyS2owZVQ5VFpwR0R3?=
 =?utf-8?B?UUJSK1BqUHk5WTdsdWRWVFhYRXp6bUNoM2M4QVIzck41Mm9wWG9UNEJmb2VV?=
 =?utf-8?B?bjQ4NlhOVjJpNUFVRlAzYnl0dEQvU0gxQlpBTC9SKzVDQ1d4QjF5KzhQTDNt?=
 =?utf-8?B?L3YvYktXb1Y0cWZNTTVIL29WV2dOcWVsM0JiM2ZVaWQ0QUFNTHljMHVHSmVi?=
 =?utf-8?B?S2xEeDRML3ZwMUpYdkxDd29aRXdEZy9QQjg4SGtHSVhkbnR6L04vbmgwbTBM?=
 =?utf-8?B?RG5jOGFUTWFRMXUzb0dnWDJ3QzFBPT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b3d148-997f-45b1-8889-08de0a43de8c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7159.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:32:54.8780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIZ7OXXJmZli/sQ/Nb6Xs5zNP3UytqaqQhrRF7kaVrA0XEHhAoTeaFazmvWR3K6lM0hME2yHTBrK4QXzSUKUVoIEXDtv0fjCVJ9kSCEwMjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7560
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA0OSBTYWx0ZWRfX40LDtI8weyXx
 hQ1xjDCrQbToUhDERi1n0Ncpa9jwQzPtnIIH/bbi1Q69ietRbZ7CV3DlZ7KiMuZHlCSWgfNczId
 l5X+yrquleQq3HF3jv8nv6JCk8rCnqFp1aMES9y0Jk7W8gH7RUksXQjXRZNPbWkGSB4FcLnEMNu
 YE0m5oaZToBEUCmZljKdmul/+7/SBulGBdFQMvsg7OkQOVrxA2ZGSgKd7+G3KAHNNILENFXAFQa
 BA0qoJboOCQh6BRnwX1b1NEr5jE++eyowDjHqgbcuqmoCQ3X7Kapqh984t0AZPH7NmhFpAndfhx
 /BTyK6GPbG5oAjM56NcpMfLDv9SRhns3XEh2B58mdnpkzY39MhnRUehhj6C0PqF+HDhrbzJv09d
 ou7NXOxYy26Dl9aRnb0x3teTinEVmg==
X-Authority-Analysis: v=2.4 cv=Gs5PO01C c=1 sm=1 tr=0 ts=68ecd55a cx=c_pps
 a=qlJ2pVgRLkKXdQ82XtY8Hg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=0kUYKlekyDsA:10
 a=NEAV23lmAAAA:8 a=B8fRsNHPkwha1j0h_lsA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: y5A1jMupZ76nNugxf861ReB8WnqFBs0X
X-Proofpoint-ORIG-GUID: y5A1jMupZ76nNugxf861ReB8WnqFBs0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Reason: safe

On 12/10/2025 15:22, William Breathitt Gray wrote:

> On Mon, Oct 06, 2025 at 09:37:14AM +0100, Mark Cave-Ayland wrote:
>> After some more debugging I was able to determine that the failure was
>> due to the regmap cache failing initialisation in
>> drivers/base/regmap/regcache-flat.c::regcache_flat_init() because
>> max_register wasn't set on the regmap. I was able to fix that fairly
>> easily with this:
>>
>>
>> diff --git a/drivers/gpio/gpio-pci-idio-16.c
>> b/drivers/gpio/gpio-pci-idio-16.c
>> index 44c0a21b1d1d..55be571b5cca 100644
>> --- a/drivers/gpio/gpio-pci-idio-16.c
>> +++ b/drivers/gpio/gpio-pci-idio-16.c
>> @@ -41,6 +41,7 @@ static const struct regmap_config
>> idio_16_regmap_config = {
>>           .reg_stride = 1,
>>           .val_bits = 8,
>>           .io_port = true,
>> +  .max_register = 0x7,
>>           .wr_table = &idio_16_wr_table,
>>           .rd_table = &idio_16_rd_table,
>>           .volatile_table = &idio_16_rd_table,
> 
> This particular failure is separate from the get_direction issue
> discovered after. It would be good to have this fix as its own patch so
> we can keep each solution dedicated to their respective failures and
> streamline any necessary backports to the stable trees.

Agreed.

> I have some travel scheduled in the next couple days, but I can
> probably get a patch series addressing both issues ready by the end of
> the week. I'll also CC the stable mailing list so we can get the fixes
> picked up for the LTS kernel they are affecting.

That would be fantastic! I was hoping to try and look at this over the 
past week, but it got delayed due to other work. Regardless of this I've 
still got access to the debugging environment to test any patches if you 
add me on CC.

If it helps the implementation we're using is part of the libvfio-user 
test suite (see https://github.com/nutanix/libvfio-user and 
samples/gpio-pci-idio-16.c). Internally we run a script that launches a 
QEMU VM, reads and writes a few sample gpios and then checks the logging 
to ensure that the basic vfio-user protocol is working as expected.


ATB,

Mark.


