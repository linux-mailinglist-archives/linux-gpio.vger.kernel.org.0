Return-Path: <linux-gpio+bounces-31769-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id deUzE2SblGmrFwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31769-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 17:46:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0580814E61E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 17:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C228300B9C9
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 16:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E058A36CE1B;
	Tue, 17 Feb 2026 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qMKTNhVm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010063.outbound.protection.outlook.com [52.101.46.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B0C352F98;
	Tue, 17 Feb 2026 16:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771346785; cv=fail; b=Z3aLUqqlHnfHD4jIupptcRoyhzRZMWlwQ7RR1jwiLtU/MEVHu+Qb9XUYvzzwUJ+su7A9p7Q0AUlQLpabvKfNEJEzZQpIxjrUtmYETV/pB1boDbrcjnQpNGaYvEhHLKHyvQXHGJVXRbDKKHQd2q5K81rO0y4IQ/YsyLsF2rw3Lek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771346785; c=relaxed/simple;
	bh=qCT/taDjKCebMYsGOW2kDKq2ZQl6kH6tRQFSzSdto3I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HHrFHHGb73J/5EkgUWPzMgCboWaLAYOnaGFETxod5r3O0i6Pi6bJI7umDuRxfOyWo/tgX+E71XFdmxqKDICjgdf6nvBHn+4bu4nvv1rDZsvlxEODU1uhP0Ftt4Nvuo/uXTvK8x73LdwKMn6LS5VD952Kwht8dlnhnVdrqs6g2TE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qMKTNhVm; arc=fail smtp.client-ip=52.101.46.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpsPlScwVwQvHy3kxGFUEXGi0a+c9ewRrlRSZ4Irphp4vc3J4yv/z4i0h5tWeJix1hzuszKP5mh7TQbMuQnV5Z4hkEapIguWM+6R2kEDIzcfXwGY5LGaxtQiwA4mWobcg1HuFhINM5SBzpd/MmN2nWqLRfWpj2IvLCv6qFQzm1wJFqOXKE2FyN5AcjlfkUXqmLPnGkPc7GMaSvJFS5Tko7I/XhI8OkSy70dF7gOEet9hWJ3pfGUPpil9uz8ozT7FrXXLnvqlOMTSvXZNH+hnUdVztA+nET0KrwMl2+e5uLmyem5dYkWp53csAahEoPKPwGYvoMdrQ1KwKndMdRJ1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4z6alXipK50qhJB89YJXtNFg6buCSBXA/flh/TuwT8=;
 b=ZbH6VR4ZK+YZGmgRYgX5rJK6/4MInqb+OEfrekvn0aQB2VsBEiQ7u6tyTvAtauTuTFXVEttX1lSg/o34hys2/Kk8Kw/kOctiNsE4FQOXOQIihNSOUh7A+h4VUfk4At6l61xab3RigkISgxpBJpW2iaAOKDbZBdoouGNCnEGo9smXVwJwWPIt4jfUMM7lwBGkX4b+uXy3kTK0HONoT71NyGR9yzgzNbTwatl9Y3ysg4EPLOabKA63c34PcQJdHZmxYYNMFx4qcuDQ/mvOnNq0QwiZAvx2EVcmN4HgrT6oiiQStMlg3v5qTFP15mkRpwb/dA8Ix65pgj+2ZGkXA2cgIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4z6alXipK50qhJB89YJXtNFg6buCSBXA/flh/TuwT8=;
 b=qMKTNhVmhykscKDyW+4DbIsXjkyoGbvFSxWbk5nv3bmBuv7CstHHT1etyGoyyUJ3Z8xvoAegXWgrOv8N+kjyxOizfLOTVaSMciyf1ekxq/XxFqPbV3N922qrRouzVaMxqjaApaIFqlXgKJdsaMvmymPgVh2eiLIY13jiwT9wE9jgTlwMsIOMSshHyohqTZ0edM/V8wi7gh+K6d08OGtYHDYtLVrs2gUOwrKgsaZy6/FXld6kezAWMsKRCEiURyBG5OoyDW6cNp1mScDfkxmHvx3/7DuL+r4I5vNBtY/t/3sR1SJCudOUW/f/mf1Y9CKIXXsYbN5w/JrTOwDugd7m+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by MN0PR12MB6030.namprd12.prod.outlook.com (2603:10b6:208:3ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 16:46:21 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 16:46:20 +0000
Message-ID: <046c9bca-f6a5-47ce-8147-6e864b364dc3@nvidia.com>
Date: Tue, 17 Feb 2026 16:46:16 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] i2c: tegra: runtime PM is not IRQ-safe
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko
 <digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
References: <E1vsNBv-00000009nfA-27ZK@rmk-PC.armlinux.org.uk>
 <a97f726e-58f0-4cdc-8e4c-a11c1e1c76ef@nvidia.com>
 <aZSRfzXNnzzc9MiL@shell.armlinux.org.uk>
 <8907b3dd-058b-4c28-957f-9948f23b9c1e@nvidia.com>
 <aZSZ54oZS9C1Qf1h@shell.armlinux.org.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <aZSZ54oZS9C1Qf1h@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::7) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|MN0PR12MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a091ec1-dbd3-4159-216b-08de6e441422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2NBTkJKeXkxbGxlc2RSSWdQcGo4SjFhNE1hYklTS3RsbkI2TEdaK2JiOTF2?=
 =?utf-8?B?ZUVUcmVPSThPNitKZ0pab3NKRmJ5K1Aya1d6aXR0TXpUNlpJSTFuQ1dOQjZy?=
 =?utf-8?B?aGpKWTUxOXVJZlV1SU01MWFISDZKZWxJcTJ2SGJmSkM5c0J2TlRxUFZpOWtm?=
 =?utf-8?B?cUFpcUpaZ3lSTkdVeUJ4aUFIdlJFK0tJUlB1NTRLUnlrZlBmUEswYzJscG9w?=
 =?utf-8?B?WkJqZTI2VkNjQjdDSUNsYmRoY0ZSbTRsci9ucU9Ra3YwdXZsOU5zem1xcjBD?=
 =?utf-8?B?TFRNczY4cnZuRnJOclVFTVNwRzE0TllIeXdiaEkwb1dYT2d6UUx3dHZpekRt?=
 =?utf-8?B?YWhoUEl6QVYreDNXRE5hblU0Q3ZGWnhvM2dkZ21kRlVIdjk3VG0vQ2c5Ymtn?=
 =?utf-8?B?bWZWc1YrNUo5eWg4c3l5SW1CVFNnaVZrL0JKcFJlQ1hHVjZxbmZLYm9VNFhD?=
 =?utf-8?B?SHN5dW1TeHJBd2xFb2d5bHRnajZoejRaS3JzSGhrdGVRQVdacGNONFhZblpO?=
 =?utf-8?B?S2FqZW1Zd0xjQ0RzUVVuamJtZ3RQVkRGbUJLb0luV0lMcSswaktLMEFEbEN1?=
 =?utf-8?B?SGVSVXhpaFkyV2lQd2x1d3lxUmUyb1hPeVpldFc3UGJqd1NIS2VTVVV4cWwx?=
 =?utf-8?B?c3ptMmtFT0d1STFhUkVySXJZekZ3STdLbHpUQ0xIdTB6a0dhOTJGQjVXQzB4?=
 =?utf-8?B?MEN0cDhya2JQMEgwQUlvdkZ4OW9QbTJyUmEvdE8rb1BuSlFGSFI4dXF6bEc1?=
 =?utf-8?B?eGkyV1oxSkxJUFpMZzgwc05BSnpvbXlJMitWQ3ZKN0FTTlFHNkFSRkZ2V25u?=
 =?utf-8?B?ZUliL0JTbnZDcW03TDllTEZPcHJ3RHRlUmRKNFdGMTFGYTRKa3RlZEdmai9Q?=
 =?utf-8?B?Zkd3alFqdzkzbnJqOFBuUlgvM095alo4RzF2T0wwVys4aGo0ajF2aVhSc01w?=
 =?utf-8?B?c282bkN5SnJ1N1JvblVUYXlrOVM1dUpVV09ySHlhSHFJRTdmV2RLeHJJYklY?=
 =?utf-8?B?TTBTb2VER1F6WWtJWG5jUmVpejVGV2NnQmd6bzZGWER1dkVkMm5UVGFPMG9L?=
 =?utf-8?B?cnlXRHdhdU1hQ1MvVWpaQWpxMWRNTUc5NXJDQXQveFQ2TWVRY2NzVTVWT3Ri?=
 =?utf-8?B?eitSaFM1R1dkODZwTzY3cHJhUUR6SnBvN29lYWZWZStCUzBBSTMyakYzd0ly?=
 =?utf-8?B?NldqODZKRStFSVhGUU54Sk01MzcxYUJoVTl0amM5dWZUY2tmSFdDektUaFRx?=
 =?utf-8?B?cGZGL1ZFU2ZWM25LTmF6K1RHekdoRDFublFuYno2R1pHMUE4T0p3eTJsdFJl?=
 =?utf-8?B?aXg1N1lNUlNNWC9wUW13dHlYRzZKSXpmQVJXVHl5L3JINXUvWXg3UldaamRF?=
 =?utf-8?B?VW91THBpWldtL0dyVVY4Q1Ivdi92RHV6czk4UDRweW5MOVJFcGhuSURpWHNt?=
 =?utf-8?B?VnJtQ3BlUGNGMDdxeTloZnUxUU1PQisxMVBCVSsxN3AzNWNhb1VjVDc2cEJl?=
 =?utf-8?B?ZTJjK2ZHcUZxbEt5Y2IxaUNJbjlOZFRXdWtmNWdxbVM0OEZSZC9UUjA3YlBQ?=
 =?utf-8?B?T09oeFdDQ0lmYzZoQjlCVmpjU0JWMUthaWpkSHFxbEUvRE5EOGRTSzZxSjBr?=
 =?utf-8?B?VUZpTkEyS2I3SExWMThRbWEzd1ZBWVJJNXdnQThFSGxoU3orUDZDc3JhaTgz?=
 =?utf-8?B?STA1Q3J1Q1E0Z2ljQ21RUzBOdzhGL1lHTTlIaWxrQlBUUEpiR1FQQ1ByZGI2?=
 =?utf-8?B?eHVnWTFqaVV4Q0pNSDlaTjc2cjh2V1pzWHJzclp4ajZ5dEszeVd1VE9CL2J6?=
 =?utf-8?B?VmFoWkJrZWwrZ3Y5VVl0V0d1RFdMenFsV0xqQ0FqbEVndXh3bklNUHgyTHBU?=
 =?utf-8?B?YXN5eTJsUXpBUWNKL1o5Qnp4QVI4V09YaHp2a3FWeEhGaFB1S2NrbjFNZ0VF?=
 =?utf-8?B?RHRGYmxNN1dVSUhqaTFRMkZSbFRqcXFHWDdkN3dJbG5ZK3ZNZ2ovT25KVnJw?=
 =?utf-8?B?WlNLMUVRRkYyY28zSWhhbDNTbm1HQm5OZW1lbUN0UE0zRWRWWnF0Mi92K0FU?=
 =?utf-8?B?WWR2SytROFhqN012YjA0MldodThmSitpMjJ4eUFoYWxaa0dweGw5djhCc2JD?=
 =?utf-8?Q?OpwY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUltdm9HUHdDdm5rUHpYa2VBT3p2cnFIM2xHRDZ3eC8vL3EvT09JT2ZuZ0xp?=
 =?utf-8?B?alZ6QzVYMGd1bGEwditwZldLU1FQOTZXYXlLb1E4Rk5Hb05VOVhFT0VZQWE0?=
 =?utf-8?B?RXJKYmd2a003TElyaG8zUzNXTzFOTXdQTmlmYlo5OWhmZjNCQW9HUndidFRI?=
 =?utf-8?B?c0NEODRFSmNZN2NVR0pnWE9BOUZ6NlRqL0tPTHNKelFac0JOZUdaRlV2WXBy?=
 =?utf-8?B?S1RON3BLQTFSN05nUG15YnQrYXY1K0JWWkh5ZjVHNkZoZ1dwazlNa2dVbFpz?=
 =?utf-8?B?NGR5QXkrU3NKMW5hU0NRRWtPSHFBV1RoWC90Ti9HVFZKVFk5V3FMcm9FdWRS?=
 =?utf-8?B?SHR6VlVjVlQzTERjbERLVzBhZlU1aitXZ1FCUmg1R3dOZXNsamYxZlVkVDhL?=
 =?utf-8?B?SFozWnFmM2JTVkJid0RkcVdhYS9SUW5nVTlyRWRoL2hlTE1laHZtWW4wTEMv?=
 =?utf-8?B?Q1BkWTBjUVY0aEJPN1p6eHU4dzFEU3N4alM3aTVsT0kyOGJ0enVCTXA3akhR?=
 =?utf-8?B?QTVnZzJyYlFjVzg1ODdocGVnMXRaZjA5Sm0vaUJvTmVvZmVEOHd2K2NTSDkw?=
 =?utf-8?B?MUpvbWwxOWQ2TlFLVEhCU0NYTDMzUUNZSG5PQVNGWnBObmtPeEhycFFFYml3?=
 =?utf-8?B?NzlySFpDZzU0RWd5ZG9KOXZvSjNCMjRHME1SS3RrZ2R1YlFQZE44WkJORkl0?=
 =?utf-8?B?bDIvRjhBQjcrT0pBcWFaV0V1SjIyY0JVN3dWeHNmYml6MytBcWtCWXI2RXpv?=
 =?utf-8?B?RVZGd3E4NVdQTUU5eGs4azlveVBuU0RSLzkxQnFwSzlLaEo4ejFyWWk2ZmJL?=
 =?utf-8?B?RTh6T1pROUcyWm8rd2lzQ3k4Y254Y3dwUGlrdEc4ZSs0ZExKSE92Z1VkOGFD?=
 =?utf-8?B?UFJGcDRNbkVkNExzRC9QT015TzgzTnVrTnF1WU5Wb1d2aFBlUGpENU9QUXJF?=
 =?utf-8?B?Tjg0Ym5UaEZTUXBMYno4ZEFaV1psZnArMXpFT2NVekVFUnJLaHFEVEpHWFd4?=
 =?utf-8?B?TTNUbGhBYkh2bWNxbjhQVjYrci9IWVBOU3ErRmdSamlGY0thSzFqRDFCZGtH?=
 =?utf-8?B?a2Yxb3VDVXgzajlJYjViOE82Zis3ZENSSWZIMStuR2cyRGRtN0FqUnFKMGNw?=
 =?utf-8?B?eUk1WTV1ZmJJQkhSTTV3NVdLemR5Rng2T1ZpMnZxcUZmeElWTXQ0ZFlhVlE5?=
 =?utf-8?B?amFMbERkUDZGL3Iwb2V6ZzNHNDkva1RFQ1Qvdkx0K0VxOE1nNE8wYWQ2Sm1I?=
 =?utf-8?B?TWNuVXdwNXp1ajZJZ2xtSVFqWnhoU0lmOTJSL3BjdDNkbm5UK0k4N3QwaVBE?=
 =?utf-8?B?b0JvQ3dxNU1XOElRcUxjRzJzL3RTdU15K01uRmd5dXBDU3ZJbjc0QW1YV0V4?=
 =?utf-8?B?dTZzR1hhaUhWbDRqaDBVNkxxcENpaytpT3FRajAyTHJVQkNNajRpS1NtUjVR?=
 =?utf-8?B?MXRoVEZzbFRCS0NJUldLM1hWTkRlTXhNbHVpcmwrUDJkaVpmcTJFUXRNOEFS?=
 =?utf-8?B?T1hrS0dxZkpUMHJnbTIyZkUvamFIWTB4NmtJQ1RCSUZ5UzhSVldiM2ZUeW9k?=
 =?utf-8?B?UGJ4OE1KYURNOTU2cmxRV2NxZHlRakJpZDlKR3ZOdDJPU1lpS2R6c0l0Zkh2?=
 =?utf-8?B?UWFMdExnN2hkQW1SMC81eSs1aHE4ak5ybGMrSUVkaStwT2VtWks4bUt1VWp5?=
 =?utf-8?B?VlRDdjBrU0ZLVGcrOW1ub3hDN0JNd0M1THcwOWlRZTZINnJMS1lBREdBVHUx?=
 =?utf-8?B?cWtpV3FCTHNlbmdzaE5ldUVaTktOcUs4VHJFY0NMdTI3MFYvaEpqZ1RGc1d3?=
 =?utf-8?B?cjgvL2s2SUJ3L1B4cENiYSsweUFtLzhPbzQzZ1ovR3IvOFlEVmIvbUNVYk9y?=
 =?utf-8?B?N3Nta3Z4SXBpZjVTY1lPeWhSWDFiV2prZXVjRm1JSTRSTlhXaHhSVUlDZy8z?=
 =?utf-8?B?Zll1N0lPR2h5WHhWNGFNQnpZSmpzd2tOTDFIaXp6bkxoaEhMQzlEaEduZ0t2?=
 =?utf-8?B?emNQL042MnpFY29xVHhWRzJPalN6YjkyTGdwNFJPOVhJUTNpR1JHL25OT0lN?=
 =?utf-8?B?cUhFNXZMa1FUU2RZbnVWUGJ1RUNxMVBCNGtwZCtFMFE0K2tQd0NFQ2ZFbTcr?=
 =?utf-8?B?Z0lkYnVoSllYK2JTVzdJWE02OEVZU0VNUE01YmdXbkFmL1YveUtjQkZybkRl?=
 =?utf-8?B?bW1vYm10Vno4YU8wRGNpNHNhenI3S1pGNnpVbUxHL01KMk5MUjNwbzUwVHNF?=
 =?utf-8?B?cmorNHBzMFBlcGptOUd6bU9BY0hYNk0vdWdlMFVNc3lOZ0Z0MFJ1eDNkRzZS?=
 =?utf-8?B?R2ZMWEFJS3BEY2hIWlJ3a0hQRlNBT0cxVVhZQzRZZ0YzTlZUTStiZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a091ec1-dbd3-4159-216b-08de6e441422
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:46:20.8649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95/Td0bgJEAYzCAZ7aKeGBch8sYBU5a6ORkrh/Qf/0Pel2+3KLPujqC3e3Zo8gM8u1dn9jhgCQCl9fEa74TlPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6030
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31769-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 0580814E61E
X-Rspamd-Action: no action


On 17/02/2026 16:40, Russell King (Oracle) wrote:

...

>> Yes we should always follow that rule. However, in this case, I believe that
>> the build time dependency on the PINCTRL subsystem was only exposed by
>> adding the 'i2c_dev->dev->pins'. Unless I am misunderstanding ...
> 
> Yes, it looks like it.
> 
> However, I wonder why the dependency has to be complicated.
> 
> ARCH_TEGRA in both arm64 and arm selects PINCTRL, so we can assume that
> PINCTRL will be set for ARCH_TEGRA. So:
> 
>   config I2C_TEGRA
>   	tristate "NVIDIA Tegra internal I2C controller"
>   	depends on ARCH_TEGRA || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC))
> +	depends on PINCTRL
> 
> is a shorter way of writing this, and it makes sense - pinctrl isn't
> required because we're doing a compile test, it's required because
> the driver itself fundamentally requires it with this change whether
> or not we're doing a compile test.

Yes that's true indeed.

Mikko, do you want to take care of this?

Jon

-- 
nvpublic


