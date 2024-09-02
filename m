Return-Path: <linux-gpio+bounces-9561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C689685AB
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 13:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6C22B29054
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 11:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CFD1C3F2B;
	Mon,  2 Sep 2024 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="z0+yXXeB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BE91D2F4B;
	Mon,  2 Sep 2024 10:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725274756; cv=fail; b=RYYLwXLrRfs3KId89ASGYu3v/hg3nJ/+Z8yikdzpQeJmeHOTueXqidayHG6+PNohdSEEgj1CmFWCLNckSdT7cGMxtTdLmvRY6KSE8ZCD02Y1yBkmDK9YPY19wlwnCXNo+zRr9O30nHOi+I5qKVHQkRJYdt/WRw4tVkaBN2pIlvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725274756; c=relaxed/simple;
	bh=WTmrsfJgFc12V/KVPF6StNqUoe1bgTstBO22P82MeTw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bpny8OyMNwSL0SxohM7D65hwnzs/RHNTa4Ng/V8FQAUr0OD7/TdhDPV+TsejgQC6z676/5Ph7x+s/XC8kJ6SaX396Dcrjax9Kd8ROkMINYk0hAEYvBGjcR3V+x89F9+lcsFZPk6C0VR5igoC+ONbxXiCw95+Mg+m1OyXROPz5zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=z0+yXXeB; arc=fail smtp.client-ip=40.107.94.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4hxPprk5a2d6kMZSdsxRkL7+hUJ3+vz77kKPqlNkpo9dt7qOOv2HPZDQ4fzyEp+RpL7g/TjsnclkJ2d/c3W6k5ZSa0pYc6x6/d3VQuEPjufFABI+ovvw3yFfKqDCOkuHyv/8btoYNtSDeTmVq93YoHduB1mMoZO3N2Nm0e58m2j5Af9wyWRrMpNXRQWlZMM/Lt5D7RwNFeQjzmK4BY4rdUuEWJ+HPGAC8w5x128N3zoPqC1OFYZFisHw5kW3mL2SZyMdbgH1vsijbg6caob7rhC7NensST6WfIZUh7Ezw2s6Fibnc19wpa+HURVlOzItuydmhsEFRBEO3x0NjLkSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpKNbNbLubAn2dmFmNnDQYO8G9v9qQEKhE06Qzk61Q0=;
 b=ZBXP9j26D5wJjnBPO6bPWQyZFvUtoCfjnNh6lFw6tTeIxcBKxKXkaTJR1D/4udO16hF1LJVv+Gr7qjr23mtUvt+fqWEMTc0t2xfsOXh4UrfXQgRQrxq8Zjw2kHKCcF9hNBM61KGtbVsvspqRgdMzh3MPNtFILGMDzb0CvUXC3E1HjdJD+YqPmLIwZufvd7aMX+7Y87aSqcDgyutTKs/dXdkRp4q8NIVHdMFYrgl7yfCOgVuRE8mlykvjjBdDy5dAAvWEcL0/eD4rSLBivYPZx+ZXR0BMh1NzsQGrc8RNhh1zrnapWq86fTU8bZ8xD+3gbYBwK0I/aQwLbq1tAVNxUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpKNbNbLubAn2dmFmNnDQYO8G9v9qQEKhE06Qzk61Q0=;
 b=z0+yXXeBd5Q+paM63YKkO63lSoUcwPa1Bj9ET5tSTEsl5Qo2+GXL2wYUmS14gWZGjfqVpe4EjzzwxskvZrjUiMLCRQPG3aAYBf3mnW3ieOJUwECV6Qjd0I1SCSeqvnuc+BJ2PwEO7z3A8cEHkMwkgHiLCSF3esgo7lLnL4w3ZO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by PH7PR12MB7914.namprd12.prod.outlook.com (2603:10b6:510:27d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 10:59:12 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 10:59:12 +0000
Message-ID: <64cf8023-9bde-4c01-aeb7-0cfb8aa79a74@amd.com>
Date: Mon, 2 Sep 2024 12:58:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] gpio: zynq: Simplify using devm_clk_get_enabled()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 opensource.kernel@vivo.com, Rong Qianfeng <rongqianfeng@vivo.com>
References: <20240820121651.29706-1-rongqianfeng@vivo.com>
 <20240820121651.29706-3-rongqianfeng@vivo.com>
 <CAMRc=Me0OBPTneoB5WGa72eL_Yu=1=X_yu3nFimsDKUv2X56Fw@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <CAMRc=Me0OBPTneoB5WGa72eL_Yu=1=X_yu3nFimsDKUv2X56Fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0106.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::47) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|PH7PR12MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c0820a-4e4a-4936-d6e2-08dccb3e46fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c01POTdCa2h1enpnQTNjRHFIMkZqWlB2bFVVTDNRNEcwQXovTk5lcVpERFN2?=
 =?utf-8?B?YWpQY1BIMmlhSjYyTHZYSkxPd0pRNno4aFNxRzh4TnlJTXBWWFp6blFOaHdM?=
 =?utf-8?B?cGFXQ09Pb0FDZzlFY09QWE1wTDVmcWlEOXpwbmtnM28yQ0pWaGZRU2FabGZU?=
 =?utf-8?B?SGNyMm96WTB3VjVxb2U2SGcyZG4xeFlScFVTODVHRGdPQm9pTVJtRHpxUmxP?=
 =?utf-8?B?UjhLaHJ6MmxHbHhGWnczTmFZQzBPM2h1Mzl1K040dmZwY1k2VmtkbzNHWll0?=
 =?utf-8?B?d0EwTElvbzhiQUNtSGZZYVArdGpQVHdHQWdGQWpNWklQVHJ0M1l5SG10aHBZ?=
 =?utf-8?B?cS9oejdhTXRDV3N0eGJHMjR1YUV0U3lEWWVtMHIyOHd3M1NqMUN4RDI0QmU4?=
 =?utf-8?B?M0I3QUY0MEtVcDAyUVMrSy9xcnRyMU9OUUlrMElER0dIMWs1YUp5RStNVGVt?=
 =?utf-8?B?VjR6WDhjckNpZE9vajBpQXZOSk54RUZkVXdMb3Fzd3hlaDgyNloxMFFHNGJX?=
 =?utf-8?B?c0VwdVBlOXVFejFhT0VrcGtSSVJCZmR0NGF4ZXVCV05mcUo2VVRLOFV4UStO?=
 =?utf-8?B?cTA1YjIzcTQyV00xNkMrdUYxUHhTQ25JcENpN2pFaVdkMUJ2emZ5ZWRPRGhU?=
 =?utf-8?B?ZVJmckwvY21sS0VNZ1NNcUM4M25RSTdlcTloV3g2QXZUVThObkFDSi9UNE41?=
 =?utf-8?B?Skl0NFhZbVpQdGxVZmpGejJHK3d2YWZyeXYyNDZVWjE2ckUwVmJLWVh4MnpQ?=
 =?utf-8?B?SDlLS29veXVWS2JMN3BKNzRSVlBTUjNEM2lpV1EyNWFuZGVCOXJPdlZaZGVq?=
 =?utf-8?B?RDBCTUVJRlJsMW9BeFJQM0xwYnMrOXJEUWJaSXk3cm9Sa09WM0lyTmlkcWhw?=
 =?utf-8?B?L0VRU25UdUErcXYzdENjdElqQWl4SzI0eGtTNGtrUlhsL2UvazRpK21yRW5x?=
 =?utf-8?B?VnFvTG5BN3g3dzhyT29MU3Znckxhb25xNENPSi91SlFVN1Q2RzZNR0xBcXlC?=
 =?utf-8?B?MW5nVVhTUUZoazJRK21FOWlHSUFXaTgrKzNzdmdmT0F6TG5EeG1VL3ZRT3Bo?=
 =?utf-8?B?SGx5MEZIUFBRSUF3bnlaenAxZkFvNzRoS0RtYmpiYUcyWFBSRlZSaHJUT1VR?=
 =?utf-8?B?MktaRWxZbS9xRUpTZGxvQ3hTUngxN0cvY3hxRE4xbE1GWGlITCtZcll1YlJ1?=
 =?utf-8?B?cnV2N2FKMzBSTys1WnN4cTdJd3M0TDdnZTZSbCtHQ0VBRjJTeFp5M3FKSWVx?=
 =?utf-8?B?dDg5b1kzUVF0YnluWmV0V0dQMkhTbmZoYklqTmR2T2wvZDBuZEN0c0NVT1lC?=
 =?utf-8?B?ejE1UWNvd0xKREpKeGdvcDIwWlhyWUtiendxQmJHa21PTzJpaGowakNJQjJH?=
 =?utf-8?B?TlRnbmtKa1VMNGt0SHlwSGpvQk5QZVJzcXRQRGN2Rzk2R3JKbjNGUzlJeXI4?=
 =?utf-8?B?MnhKeGoyZzZ6N0hTTkJsS1h1UTl1ZE43WFhQbTNRRE9oai90VXV3V2RLV285?=
 =?utf-8?B?U0tHUDlONXJVNGlEeWVyOG5zZjhRUUpENmUrL0FEREtoS3FrOG4rTkZvZTA5?=
 =?utf-8?B?dVJSdXJRYkpLdTFNaUNNSDdnNldkOFRMZEJPOVlMa1VDb3pJWHZ1RUVSWWZr?=
 =?utf-8?B?aVdqYy9hUTAvOHBRR0tLTUEzSzRiK3B1M2t1Zk1keW1KTnZGR0tvd2R2MlVm?=
 =?utf-8?B?Uzd6czhnYng3RFNNcEZaU1I3NWlYc0ZqRStWQ2Y3Rzl1S0tCbko4a1dIRS9E?=
 =?utf-8?B?TXFIK3dZZkRqcWVRVUhLM3VVTW9yejVCcUFSaGs4U0tka09ubVZpRGhybCtv?=
 =?utf-8?B?Yk85azRIdEpsbjV4YlBRdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXZKUDFyanZkYnFPbnBBLy9OSkg4N3gvVXlEU0kyQkdjSkVCZjZDdmZub0di?=
 =?utf-8?B?clc1STNxTjBkOW02czVTNkNaaVhTZUQ1MCtja2UwekNpQ0dZT05ZT3FlazdE?=
 =?utf-8?B?eHhrODB1WmlObFNoLzJQV2RaUWxuMlpFU09XQzM5cTJqd0RvalZ2bTlPS1pR?=
 =?utf-8?B?WERNd0ozK3ZjdmlSTE5zNkNQNDErVHZGOG1FV3M0REk3NW5XRWliMnh3bnpa?=
 =?utf-8?B?aE9wN1NXQ0pFUmdsT291ZEJuVGxIajVOQWpoUSs4NytFQ0pFLy9lYlhoSUZZ?=
 =?utf-8?B?Rm01MTZOS2NXLzJIS1cxOUdSMlRhMlZ2VG0rbGVhQTMreUdWR3JPTzNnWVlB?=
 =?utf-8?B?cHpvekFVRHU3dG9vbDNhdEsvd3g4MTdtN3VOekNDcHBtVXdLVFFHZnZCYU5P?=
 =?utf-8?B?VmdHN2FSTm1USHZVejdGNTY1L29KcG12V1RxT0hQcm5EZ0RhejNtUThqV2Yr?=
 =?utf-8?B?K2JiRUZCbjU4Nkl2WDlJWEwyV09aNlpoNmhMelo3dEJBTnkvTHRpNnd0MkNu?=
 =?utf-8?B?K2hJK0N3NW80QXFyMm9QV29HSFg3M0hjUUNZdUVEZTVvNk5rL0ZzUkJHNko4?=
 =?utf-8?B?RDBTOGM3dnNYdEZTeWIwNlk2b1ZEYkl1NGh5bE9JM005aTVxTWxLbitxUUFJ?=
 =?utf-8?B?aDk4T0dqOEZzaytab2VOb1hKazVqQlppOUJibjAydEN3b05EeERVZ2p5Q2hn?=
 =?utf-8?B?WFFLeGNudGMxakJIUVdab2pCYVJsNnJ1VFRQcDZoWk8yNFZoaVFUb0UzOG14?=
 =?utf-8?B?bG5oUWQ2b0J1aGRJcENYNTh0bGxFM2o0VW0xNFkyMGYxMk5tSldhelEwUkJ6?=
 =?utf-8?B?ZFF1amlnSGxSOFJ0OG51Y3dJZ2hlODVjVmk1eHdPS1U1SWZRYkpRZ0VMQThP?=
 =?utf-8?B?QkJTNEk0RUNWMFZJd3VwdmY4LzNuOFp3OVZUQWpDZCtOQ0JYUXRTN2lJVm96?=
 =?utf-8?B?anBWdWZnU2ZGdzZnSytuWGxNYlo4ODdOZWN1cWFqY2RyV0ZSK011c2k5OE9O?=
 =?utf-8?B?NlI1NTk4eGNrUldBZlozb2RIZGlBTWY2R0RjWlduR3pHZll5WXdWUEMyaUhi?=
 =?utf-8?B?VVBWem9JVXNpN3BESUFETmRGTDBUcFE2TFVRbXhzcGwySW5BS1dxeGxhLzRE?=
 =?utf-8?B?SXBzN0tLeFM1R0d6TUdtOFdMUEFpcFJOUVBtOUJKM2xvU0pZekx6U1RNbWZy?=
 =?utf-8?B?V242aVFUUEpVeVA3R1hSQ3pZcy9rU2dsV2M4REhhYUQ3Mk5UWDQ4WitjZHg2?=
 =?utf-8?B?MjBlai8yWkoxTzFEY3VQTmdOMHhrUmg1YnJja2xJaG5JeDl1ZUxHK2dHNEQ5?=
 =?utf-8?B?ZTJ5djdiU1htNlBZZFpsd0IxRnFFMGh2K0RYQ28xdTVpaVNudmZMa0VWT0hK?=
 =?utf-8?B?M3NmWkJ6TWIvcklLVjMzMFZjTDdpNjhwRlRMS2x4c2kzNlRQYVlhZHZIcU5u?=
 =?utf-8?B?c3JHZW1TSTFoS1d0U0dLbmRBdkhUTHlCdTEyZm81VTB0MmV3Z2dzckV5L0dH?=
 =?utf-8?B?V1pOWEhjNElEYy9iS01uMHBUTGYwYVpSRUJxcHdQSnE1OGZvR1pkdjJRcVM4?=
 =?utf-8?B?Rm9UODRONU10L0psVnF1OGFOSlZGL1l5dlhiYnlZQ2lTWmIwRXZnWmlET2NL?=
 =?utf-8?B?Yzc0STQ0dWhHMERyWWhXYTFtdnlod2RpODE5WWpYRG1EQ253VEtZM2VneG9L?=
 =?utf-8?B?aS8xM2xFeEl1OHRMZmc0emE5OU1aUWJVNUpRVUs2K0VWQjE3QWZkNTkxK1ZE?=
 =?utf-8?B?MmptZUFJanhYdVRjTFc5K2pRQk9JZWlxR3Q3MTVxNDRhNFVsOHh4UVJMVnNG?=
 =?utf-8?B?SmtTcC93Y3ZSYUpEa2VTUEdSVmoyblB3WVY2MnZsTUsrUVFlWC9iQ0JXamx6?=
 =?utf-8?B?VzNzdTVXYUp6cmVCclBVNE1SSldLRnpqRjBvMjYvT3U2ZnYwK0daZ2IvaC96?=
 =?utf-8?B?RW9WNjVoTmlkcW9zNXUzWG1WL3o1czFFTUY5Q1N2M0kwZisrS1lseWZvOGNy?=
 =?utf-8?B?UE5lTVZBbkQxWXdyVytON2trMWI2d2lRdTFIYU9PWnJFRGt1WTFZYjBsakRZ?=
 =?utf-8?B?VjFuYWZVeEhmbmUyU2VsbmdsTnlDWmFxN1U1RHVjd0RvWWpnSzBrSlRXRXYw?=
 =?utf-8?Q?/SgFNgzDCbIf0GEc9cbhohx2A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c0820a-4e4a-4936-d6e2-08dccb3e46fe
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 10:59:12.1653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGfFcBzZ4wLNfia2VRmAljOnyRZrRZ5y0S/dSNmJPTDz6JFrSzSAeiq7n+OfVHFc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7914

Hi Bart,

On 9/2/24 12:32, Bartosz Golaszewski wrote:
> On Tue, Aug 20, 2024 at 2:17 PM Rong Qianfeng <rongqianfeng@vivo.com> wrote:
>>
>> Use devm_clk_get_enabled() simplify zynq_gpio_probe() and zynq_gpio_remove().
>>
>> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
>> ---
> 
> Michal,
> 
> This changes the order of operations in remove(), could you test it or
> at least give your Ack here?

Changes look good to me.
Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

