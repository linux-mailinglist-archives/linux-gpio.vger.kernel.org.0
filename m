Return-Path: <linux-gpio+bounces-15880-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04273A32BA0
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 17:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2936D3A7469
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 16:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C89F21CFF7;
	Wed, 12 Feb 2025 16:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="QExQ9sen"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-0063e101.pphosted.com (mx07-0063e101.pphosted.com [205.220.184.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B70C3398A;
	Wed, 12 Feb 2025 16:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739377948; cv=fail; b=pU288qeefEN30YDtABg+QznI37YDRW1Pklf3JxnpQwpPsQE1Fnm47O/85ijbrItd3VHqH1F2U3XSbFGpm+6F5S2jCZnPhefzZFXUIDUAx4unbaXG4ll/JtGk4Q1Ou5Rew4hww2iXnhtDODtmX5WSs0w2wiqrsOemR3spKXnHDPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739377948; c=relaxed/simple;
	bh=nw/PPRyXHt2N/BnLFf3m4vA5noP2BJhTdk2izIO1ndc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iro3evvGajZy8XFZJqEcWMgU/dOF0z93xsKjyyIqewt6kGeeXkpsBHpDyOQzrP/ooSaRTLaQ8ZMVSb72ipLPm/bMWrvRnLyt3mghE7GaD1Tgr4qeHcpCzvy+exAqdXY74zD6Hua9mnzsqJraaAFTXv7etcpwynvAyhLqqquxk/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=QExQ9sen; arc=fail smtp.client-ip=205.220.184.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CFvEN3032749;
	Wed, 12 Feb 2025 16:32:16 GMT
Received: from ma0pr01cu012.outbound.protection.outlook.com (mail-southindiaazlp17011031.outbound.protection.outlook.com [40.93.131.31])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 44qwtd8v68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 16:32:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmoEHWFMJ6X0HaGBDCezp/5jgARQ8Llh+KlaF2NC/i32+/AESGC1ORI+b5ums8YfSxN0bjd62j5u5Z/Ag7ZEfHPgYPICPlL1ZsmF/UU+mC6s9r4v5SofALkuKaSbrsGd14hdL8GBz16ojU6HO+Fw0RYWZVInHKtAeFvdmNOu720JEmU7kJWZ+rv5zJfrURpQRoncyuo8APAcAcxZolZu/vJfaRHXKUjT9su9esBrcOsbpekSvOOg7uUzZXiVghFRfPOgDPh08ZzdV71hRo1uRHNdu2sFTA2n45fsFlLM075zaRt95WoCsbyOEBo5BPviZ5bvBM2Ix20PxvG8y68Lxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nw/PPRyXHt2N/BnLFf3m4vA5noP2BJhTdk2izIO1ndc=;
 b=PbOkkZtEqZyrR8nfR4orvPS7YMOgI9HqHlTRK1NIqMOxKCwnXvFqOdaJsdckOWuJZpfiu931uorJ20arYOE9JboIV3PU8PTwFOqDyE7hf+PCxJfvCQ0GeaO8ijLjbkVAhAgipAc+gGn8t5UvJDQ6Q0AugxrIdZorBUstHimh0H4KZ26JH0guaHN4YVRqFBzY/OBiVaSpBGJL2WUfC6QD5/nIBbJuzoi6zTKrg6nRpocRikW6VMo8RDs1CvrtL2cGENuJ+2J3CSfBgkOlcxneJNHCKVPtx94Hng85mzEZoeHRfHdHQPuynbECFk1qJnX/LEiIEhRjLc3mZmXDFse8qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nw/PPRyXHt2N/BnLFf3m4vA5noP2BJhTdk2izIO1ndc=;
 b=QExQ9senToI8NXfyKq4mR+QySKmrCuGkst3nec8ihJa8EccuHsSO8oezbjGSthZB3YsInBSgIn7g/BcAVhpg27jsOkD69G0EpUfo4SyBhwgm6b0IDYK3frtVm6VKzHYD5aPzz/EWu+hqWq+HVoP8rbFQXLf3vNANFNBvCS9u/eI=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by PN3PR01MB6072.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:79::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 16:32:10 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%4]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 16:32:10 +0000
Message-ID: <9549d5f6-a90a-48e7-a320-23487a6470cf@blaize.com>
Date: Wed, 12 Feb 2025 16:32:03 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: defconfig: Add VeriSilicon GPIO driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Neil Jones <neil.jones@blaize.com>,
        Linus Walleij
 <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
 <20250212-kernel-upstreaming-add_gpio_support-v1-5-080e724a21f3@blaize.com>
 <9442a87b-ab61-40e3-bbf0-caae87c5731a@kernel.org>
 <259dd121-8c49-44f7-b8f6-e0b68ab88304@blaize.com>
 <CAMRc=MehUWAsBO6YWvwOsexu0yj6S5-g_ydS8tdX12iA0KER=g@mail.gmail.com>
Content-Language: en-US
From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
In-Reply-To: <CAMRc=MehUWAsBO6YWvwOsexu0yj6S5-g_ydS8tdX12iA0KER=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::33) To MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:12a::5)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0PR01MB10184:EE_|PN3PR01MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: 979e7af7-6c48-4e5c-d62e-08dd4b82cc02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REphN1psT0licWY3SXR1QXBWbzA4MzlxYU8zSGt1OW52eFBDMVdzeXdwenMy?=
 =?utf-8?B?TzJVeGtDeGw3RzVwZXNKcXQyUXRTMU8xUkhWdzIybmZRNnhVcytFVFJ2Zk0x?=
 =?utf-8?B?NWNCNkFHVnYzK3RJQ2piQkVFSFRLalVJRFhmN0pCQllDRVFtSkIvVDVhcDhH?=
 =?utf-8?B?dU54SkZmRjk1YzQ4R3F1Tkh0OW02aWVmRDZmR3Q5Y2kzQUZtaWZ2MDhRNFdt?=
 =?utf-8?B?Wk01UVNRUkRHWjNUSFVoNGRZMUgxQ0RPZ2l6ZEs4QVZkSTJSeGczTC93WnRX?=
 =?utf-8?B?a01Gc3NEdWdiK3hrL0E0Q1FRMW4xelFXZytOeXRjZkZnVi9DaUEwd3lqdEZ1?=
 =?utf-8?B?R3F4dkFUcGUyTEZET0xLTEU3UndsWHRNdDdBb083bm5TWjFYL1NVZ21aK1BV?=
 =?utf-8?B?eTZ2ZHRKY1R5eC9DMjdQQW1OY1BzOWwza2xqbE5lQUJiWjBld1V4M1dOM3c1?=
 =?utf-8?B?ZjdKd3JobnpETlNhUnpybHRITCtkalRvZW0vNUpuRUlGUWoxaXVUUXJEM1M1?=
 =?utf-8?B?emVkUkJWRjMxS3oxQ0V3UndEblIxNG1UdkI2SWV4Q3VBZVNNbExPM1RPZzgv?=
 =?utf-8?B?emdDZUdrVlJjZHlhNWZ6cVF6blQrcjFsQUxPV0pBcG5rcHNsQkZNbW1WZmlv?=
 =?utf-8?B?NTNvNmNjSUE5ZDZETE1ZMnY2MUp1Qi9nU3F4dHk3ZU1rT2piUTFjN05aeWJE?=
 =?utf-8?B?SnhIdmRYblFMM2lkQVRkUDk2UFo3d1BaSEZwT1Z6cE9VYk9Pbk50WndmS2FI?=
 =?utf-8?B?M2ptcGhjTzZRVERwU3Y5S3NaSU0ySzZnQ1BTOC9acGpkdjh6S1FsdGxJTlpk?=
 =?utf-8?B?amhxYUoxZ3JHWUFFRFZTM1VxOSt6UFRJUXJOaDhMcVJ3QnNFN1ZoZzkxMWRn?=
 =?utf-8?B?NmErOEpyUXhxM3MvckEwZG9mYjU3MURlWE5Wdjg5c00vMHUxbEd6VnQ3YjlS?=
 =?utf-8?B?cDVOTUxGU3ljN1pKUWNidW5kbjBqMHhJWnBSWERDaGNpb0tqZkZCVnIrb3hB?=
 =?utf-8?B?VUs3R291Y1gweUVTaHBWR2E5ZU5STkZ1SXhnR1dzZlB1Q0hiKyt2OEJPbDI3?=
 =?utf-8?B?VDhLWnNqUG14QlBBOWJiYW5MQTQwODN5UEN2ODMraUo5bEVpMmZOK2lSMkxz?=
 =?utf-8?B?eTN1MDgxME5kbnhvSEhjQ2t4Wk0xZlhPd0N6Rm5kT01lV0p6eFdmcGhkaHAr?=
 =?utf-8?B?OGRrRkN5aXBiNUg3MFhiZ0VJaFIwbXN3SHpjMlVOVlhhTkVaSk0zcW93bEpK?=
 =?utf-8?B?SFhaZEhlTHI3NWFDQk9yeWpud1JNbUlVQkFvRmpWUGJOMW9XS2V0a1ZIZm1N?=
 =?utf-8?B?TWtveU1FcHdwNVNrQWQxUXNRK0ppalYrY09WS2g3Wjh2RFFMZ0ZMRDVSQzc5?=
 =?utf-8?B?LzVnWjVVUUphNVlVdUdhb1JqRytEMFZjRTUrSUIzY201UnRjeHhINUtCNmlF?=
 =?utf-8?B?VmlFbks1cTFhei81cmNFTXJvZ05oNEQyT1dnZGtTMTREWWd0bzBPRzl0QWZQ?=
 =?utf-8?B?NlQ0bHU4M0RWVnZKdllKa3FUNHdZaWVZRUVGVjJvM01JMVlrTDZSZHFsMlBS?=
 =?utf-8?B?ZGkxa0dIR2JVUjRtNXUyeVRIRVhNbm10QzFCaCtESzJPbnc1ckhnSk0vTis0?=
 =?utf-8?B?MDNQdXhjeGgzNUc4aGdYQU82OWs3QzREZTdmR09OSWhSNis5WTlBbVhoNEV0?=
 =?utf-8?B?N3hEcXRFN1ZWNlJ3SHRJeVJKKzl0a0Z2UVgvaVBaM3NiM3dIMlV1VUxuN2Zp?=
 =?utf-8?B?TUZ5cU83bjVHUzczTFg5bktkckpQRTcxSGkrQzlCNEVSeExWbGZOazI2NEFX?=
 =?utf-8?B?WE44UnZkOStsYWxKLzRVR1hWdUZZdG55M0REcEVKNlBuT04xdUhCeHd6UWxI?=
 =?utf-8?Q?wO3UgD+vHC9wt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2tPYUdwZzdXVHlYNTczcnJYdlNpWW5udlNiTmNoS2Y1OGNoOWpuMjNQeFNK?=
 =?utf-8?B?NmhBV1ZyY0ZTTTBsb1FzTjcybjFndkx6ZURHWjM3dWVob0pOL1BwaHBzZ0FF?=
 =?utf-8?B?SGlmVzYvWlBuWXgvU21KSE9ySEdmRTFSd3FHRWIrazlpRzI5STAzaG1uNU8x?=
 =?utf-8?B?ak9BRVI3VnBZQlVXT2o0dTVHNVdpRjF4cFY1dUErblZqTURUazY4NzNRa0Zo?=
 =?utf-8?B?MER2REVCTzRad3k1M29IQ0FiVVJtNFpEUkdLRTV3K05JYzJkdDJ4YjE4bm1o?=
 =?utf-8?B?Y09DcTF0VE1iM2tWZU5KdW1qOE15ZWE5Q0l3ME1UTmxtYVM5aHo0dnhjRFdp?=
 =?utf-8?B?WDdaOWVRTEVibFNtbmxIY0tsdUgzRFl3aUpGeEdEVzIybkhjQk5icXkyMmRy?=
 =?utf-8?B?V0Y2L0U0RWZ6d2lXRTNBYUw3RWhJY2Q1MVd2VmF4dTk3L3d4UFdPdlVrcWpB?=
 =?utf-8?B?U1N5VzNjckV6LzJzQkRyVnlVTW9IUlZSbWJxWnh0aFZKZ3J0L3JjNDk0dDRE?=
 =?utf-8?B?cTh3MjhzTjRKVWM5TEkxQXp1b1RHdEF4bDJLR1J6S3dab3dmZ3NIRVBtdTdq?=
 =?utf-8?B?NTlHMGdFYjhHTTcyUTAyN0tCckVRSS9udE4vaS9KWEJyR0xSYnk5RGlZNW85?=
 =?utf-8?B?RFNMWEREb2pxU3hvMFZyTHRQcE0vNzVQVytJY05vUTB4MVBtb2lGSmVPVFUw?=
 =?utf-8?B?emVNak5Ec0tlQjFDYlFqbE1UcFM4K1JGZkZSRndINHNtQVVVUE15bkxZVzQ5?=
 =?utf-8?B?K1VPWVRuQUNPbmtJL3NCQmhIcXRyeG00NHBoRzdFamlzdEQ0WUpOY1UxeHov?=
 =?utf-8?B?bmlQdDZPcXIvaU1WNVRYQXZwZTNlSjV5RTZhU0grTUFIMW9ETHF0Z3dhVndJ?=
 =?utf-8?B?N0k2djU1akx0RHFUODFIVkkrd2tqZ2pRT1BDYklzYkxRM25WTUkwSDFzblhO?=
 =?utf-8?B?dU9GeFhMVEc5cVBXSnlQTmNDc1dDNnFKbkJXNjBTUnZlNnhPQzlRVTcwdEdT?=
 =?utf-8?B?OHhPbHQ0ZmtqSmwxd0JCUGNmeGI2NmZrR3JYYjhwQVFYd3RNL2ZlQnhzNGE2?=
 =?utf-8?B?RjFDQllTNkkxYkJKYjQrbDIzSmdNd0d0bDVtdGlxRmNxeHkwOWNBYzd3QVZv?=
 =?utf-8?B?SVZWOVJTdU43RWcxT3MzVVZRZDU0cVpjZVBHbFdvdTVUUkVDMkpwNkVBWTdq?=
 =?utf-8?B?eGs2Yk1ueVZVOTF4ODJMaFlzRy9GTlE0T0ViU3pERmNsbzFMZDh5MGpxSXQy?=
 =?utf-8?B?dFFFYzdiNElvVkgrWEVkNEZzWmFmSHA3aXlHbGp5bE5pdVlVSUkzRXloNDNj?=
 =?utf-8?B?OEp2dEM0bjJkbFVob215aC8zYVJ5dWVZcm1jSjcxSlJBOHlZNlh6M3c3OXlP?=
 =?utf-8?B?cUFlSjJVMXN6ckQ3RWt0T2ZJbnJYN2ZTWU9YOXAzMVNuLzFTYndIUU1FYzIx?=
 =?utf-8?B?WEZWRXV1R3loVEpQVUNOSVcxVVQ2a0NRRzQwODRLelpIY2JLWmg1R0VtdjdK?=
 =?utf-8?B?Z1JZY0xYdElrS05OdUM1UzkvVGw1elZVTHhLc0FUTlAyL3JLZk9tTko2bGZz?=
 =?utf-8?B?NjNNNGNPeFlYdm1XWlVUOUN0S0FtN3lSazY1WUE3b0JrRHJnc0lxT0VxOUV4?=
 =?utf-8?B?RmFVT3dzYnhISlVGSWllZlV6T21jOFdqZk8xaG42UllmTERPR0djMXIvbjVE?=
 =?utf-8?B?dDNTY1owMkZua0lJWGtXUGdZZ3N2NStKTXVFUkcvNnhTU05odThoUFBuN1hW?=
 =?utf-8?B?RGZJTDNjblEya0VIK1UyaTJuQmNpN2dRWDBiN0tKRyswdXRrUFhNRXV6aloz?=
 =?utf-8?B?VjNkd2Q0Zm5qb0RaV3k1UjZ3WnVkK0x5YmlrcmRGbkdpWmovZmVLTzBwQkl2?=
 =?utf-8?B?Y0N3U1o0ak5DVkFrbVduV0wzdmREUnZvQmFTMWt3WmpKV1RhWVo4czFNQS9o?=
 =?utf-8?B?Y1NtVXgxRW83QUloNXVPc05yMUJNZ1NydzZRTGdBNFc3MEZnSFF5UXJ5THJR?=
 =?utf-8?B?Y2dpWkFVY2lpM2N5WHpwQkVFTitPL0dGTUgwNnR2d1lPaEtPTUpvTHNwSXNu?=
 =?utf-8?B?bHlXdk10MGJjcC9ZM2lGZE5iK2lDYnZFZ0tSd21PYlByaXRTeDNVSUVFQnlL?=
 =?utf-8?B?WU9SWTZWVDUvOSt5NVh3b2lBVWJabWpyRUhtbXh3MWptTFRkcS9hVmtNYzg2?=
 =?utf-8?Q?DdETXGhHWZM1IrD7QPpXRKY=3D?=
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979e7af7-6c48-4e5c-d62e-08dd4b82cc02
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 16:32:09.9518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 260Fg6X5A568OukrAuakuf/Chm0OTqEltyMUajqBy+wAVJUZlCy8wV3YLH471obQaK+BPedUtZjyKgpAQReJ23bivV/9O3phyYgL1kXY6zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6072
X-Authority-Analysis: v=2.4 cv=ALxkcdDx c=1 sm=1 tr=0 ts=67accd0f cx=c_pps a=eu+VrafKqrkYN/YfGA+BZQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=4MthsM0t3ikA:10
 a=-5LYVjoNHPMA:10 a=SrsycIMJAAAA:8 a=lROSfbVtd0kidYWqLVEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-GUID: fAp-oGmn5QGGEx7IwWFSWxGS_vvbZ0z8
X-Proofpoint-ORIG-GUID: fAp-oGmn5QGGEx7IwWFSWxGS_vvbZ0z8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Reason: orgsafe

On 12/02/2025 16:28, Bartosz Golaszewski wrote:

> On Wed, Feb 12, 2025 at 5:20 PM Nikolaos Pasaloukos
> <nikolaos.pasaloukos@blaize.com> wrote:
>> On 12/02/2025 15:25, Krzysztof Kozlowski wrote:
>>
>>> On 12/02/2025 14:46, Nikolaos Pasaloukos wrote:
>>>> Add support for VeriSilicon GPIO controller.
>>> You enable not add support, but still the main question is: Why? Which
>>> devices needs it? Why this cannot be a module?
>> Hi Krzysztof,
>>
>> Thank you for your fast review and apologies for the typo. I forgot to
>> mention on the commit message but I have mentioned in the cover letter
>> that the driver is needed for the Blaize BLZP1600 CB2 board which is
>> already supported on v6.14. I will fix the commit message on V2.
>>
>> This driver enables support (controls) for multiple peripherals on
>> the board, like Ethernet for NFS boot, SD and eMMC to load modules from
>> these media. Without this driver build in the kernel, it will be hard to
>> mount a filesystem and load modules.
>>
> That's alright but typically you'd want to have something like:
>
> default y if ARCH_BLAIZE
>
> in the driver's Kconfig entry.
>
> Bart

Hi Bart,

Thank you for your suggestion. I will fix it on V2.

Kind regards,
Nikolaos


