Return-Path: <linux-gpio+bounces-27278-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0353BEF17C
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 04:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C5A118963BF
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 02:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB35329A326;
	Mon, 20 Oct 2025 02:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gkk0oiRt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010066.outbound.protection.outlook.com [52.101.201.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB0378F5D;
	Mon, 20 Oct 2025 02:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760927660; cv=fail; b=F3nbXLTip09KwnQZKK1c1uRmLZ26njCj/1kRhQt3sbqPbqj5ojw8nVT/pWPbFV1aoyM+ywecrIDmaFr2tOD8beI/8LZTb6qTQXkHbGSdN8xym9EGWToSLtXW86bdtXf+K9DWam8p8wj4DCW+cZuv9wDV5Hm2uhWgqgjnQL06TPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760927660; c=relaxed/simple;
	bh=p+8psK/RRzGQx3qkuUnFqu3uT5rAblld5u7hbdTs47k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jLvxnB3ubnXIka6If3GNpscyR9Fir25jq3JvQ6pXYjT84KWEt01ELy85LOUEg0n+CcO6qfC2N6mY95kZBi+Rqn2DZLDGDQ958oykAqZZu5kE9h9Xy7a9dDSLysv5SzSbVz+6hcdtmOiQIAC/UBAjVEyywaNBiJwRIXfhSUJhJ30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Gkk0oiRt; arc=fail smtp.client-ip=52.101.201.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+G8SQGy06nDmjEURaWneL18D+Jq5JbP6oZtXOUMjT6RTHydX+XIw717hjXaFFyBGQNZIL2ij9quxZzXyv0nJZh7Gac5SBTKCKvSucC8Hw7G/YKV0iTvSKRqRL0aeM9w/OG7RQF0SRC0CdSeIYfH02/O/IHOX4z6BQdI2GLfxMfwi8t0BHmtWaChqkiI7avkLQFUuRxyLmu3A+rc7FLL55WEXFred7B6HPakvLnXQDM06Q3ohOKjOqp7DuQoLRY3vK8CmNYDSqDeB9cA2sAzXzqh2bZEjwcFOBmnNHQKlmvFnX0irkiWBo9oPqWxsbTC/vMuFvbwBfy9fF0JGpVVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGZ1UcGc64i/UbZLRWrOU3lWPFpSAiHbrYTe4fBsuwo=;
 b=gfOL1iWfssqb0hShSo9OEu1D74rYLU0THbzOX6g8B4BBIWDrvhTFl7e+hwKgAG8ugAY95Xi5j94OG++/yHZrWdMQZk9kg1adzrq2cjza7Tfb2ugPdphgvOQ1Vbw3LqC6MrvVlHgiywVjjpbVgoLBwnWQ49nVU5o+UxpoMezZ6gPoaKSSg6wdOQu1evMrUIRrHDTbMUs42eHXx8OYrZQooV3J5gFAOSzunP9DRypVHkXeiilDAi03fnvOpq2rcFDJgZdUSXRuBxT75i5UXMKr5DhM1iT1/wZOXX4hAF+SR6UDeI4gA/tLOhASvbBUoX02R0gl3IlAqgbbG+UHdXuYwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGZ1UcGc64i/UbZLRWrOU3lWPFpSAiHbrYTe4fBsuwo=;
 b=Gkk0oiRtIZeAfryRcmSnsPQEMyz4c1og5MRVGUGcvC4l39Y5mbDhLOTxo7Xq9NIC7HaIdjCUs/61RJczdZxc91EFpeOgfWD4pxtRGI0G8GeVjZHXuwnYCT586CMMnO3qSffoIQIA/ofouJ7gOgsp17Ff0pw/WVNdt3jE9CC75gyquVwksV7xTDY5moigyiP7BN4b9HiesnyCd/MlbkAJEkVytLCilDlEMyNhz/l1sBp4ZcrWA5Uf6DAc/HXSe02R7gwHKDOudik2h7vMTB5sojotMIeXWYu+EGrT4ZXz0jRPtVPDVetK2dN7FjhFLqipk0Zm620GlYHospWy66wDhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 CY5PR12MB6345.namprd12.prod.outlook.com (2603:10b6:930:22::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.15; Mon, 20 Oct 2025 02:34:15 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9228.012; Mon, 20 Oct 2025
 02:34:15 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject:
 Re: [PATCH v4 17/24] staging: media: tegra-video: tegra20: adjust format
 align calculations
Date: Mon, 20 Oct 2025 11:34:08 +0900
Message-ID: <2442650.GKX7oQKdZx@senjougahara>
In-Reply-To: <20251008073046.23231-18-clamor95@gmail.com>
References:
 <20251008073046.23231-1-clamor95@gmail.com>
 <20251008073046.23231-18-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|CY5PR12MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ccf9fad-1c19-4fc5-88e5-08de0f812911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlNKQ05PRVA2a1JLdHp1U1RlZjJ0L3M3QTZvVk5QQmdrY1JpVnFMb21lVEla?=
 =?utf-8?B?VGVVdXJtQ1NPRHROQkJneUxwV2M2Qi9jVm1hRk84UHpJR2l0M294eEtHSm5p?=
 =?utf-8?B?LzA1U29sKys3OFZmaFdTaXY1eWJBSW50ZjVFYWp1OExMT1JQREFFVWZGU0FK?=
 =?utf-8?B?RTRiOWtSQmFRN3lYNzNZalZrREE1VEljcUpqTWFrVXdIL0RzMW92RXhhbmtF?=
 =?utf-8?B?RTcvVHJCZ2VCb3ZnVTM0OGZJM1BjMkdqeU10Q293VmpDTVl0YmJ6czBLek5M?=
 =?utf-8?B?M2l5V0RRREJuMlo4ellpV05CZ3ZnVnJCdWJtMU5oUGIzYlJlWXVHSUlMMlNX?=
 =?utf-8?B?TlZsM251ejE4aWtkOEpGbktDcmNRVVNBNitwcDlxdFYzWWZIWE90djZ2dFFi?=
 =?utf-8?B?eW5MSTVRbE5jdENXemxxVmY1czEyNkhhSDRpVjM3T2hkV3pHNEFwSzBpZTZt?=
 =?utf-8?B?L0VZdktyaXNISnRHTVg3R1p6azVrTlFjS3hDMDZIM2xMZDAzbExlZWQzaDhR?=
 =?utf-8?B?WlNueXB6cW52ZjZqL2hSejlYVndFcE1FWkRqVElZY1BYeTZjZzZxTW5VeWhJ?=
 =?utf-8?B?d2I0VW5lVGh6ak02SGhDSzlrUlhJd2VxN2tRZWpkam56b1V1VmtHZjRXZ3h0?=
 =?utf-8?B?UDlUL3N1S2xUVXpNQnlxQzZ4RVo1TEwwSldxcXVxZ1lCcGthSGlGNDNZZXY0?=
 =?utf-8?B?Q3NmN25KQXhFdTN3MGh6MGZrN3ZvNVQ4MEJlMVZzNnJGZHh2RFpBWUtwU3pH?=
 =?utf-8?B?MEZubXI0ZVp2YXNEdVhNQUFNSUFXUUtwT1RYZHpoRjN1eE5NTU5EcklRWnN5?=
 =?utf-8?B?aGlOb1paQWVBdFVOWVF5cEh4NW5xTGdIb05NR2lSd2dydDNKaVRobTF3QVZy?=
 =?utf-8?B?a1h0eWFsODltc1I4SDViMUFoK2E3L1VkNDJvaC9NTWZlZ2RrK014Y3NrdUZj?=
 =?utf-8?B?TXVVbERrWFVCZFdra1pwd2kyYmNtN2hTaDlmYXVuUG1EUlN4NjJMdmU5YkYy?=
 =?utf-8?B?U2kySnRXYWRYemltMWx5Q3ZYVnV6aHBOMExZL2dRWlI3SjhFZWhSdlJnQ0dM?=
 =?utf-8?B?TEw1bE9xaE5uRGZvbEF5VzFkS3hQSno5UnZOQmM4eFdHSVB6T3htckJGcjB5?=
 =?utf-8?B?Z3NRMzFieG45Y2lwRERhM0Z5czVZQzhFb2RPdVBhczVFWWFZSSs4WjFYVkFy?=
 =?utf-8?B?T2laM01Ta3B2YUsxTWc2OE12ZDRZV0FhcWVWZXgyeVlMcWwxdWUwN0dSR2Zs?=
 =?utf-8?B?bmwzblh3dXNHdVEwN2xXOFY4cnRVdmZwY1pmejBaOExRS01lS0FxMWl1RGpQ?=
 =?utf-8?B?WklPSXlydHRoZDV0cEpyWVpuZzVXczEzMmdqNnRqYWVIakRnSXZESkZnVnlo?=
 =?utf-8?B?Wk1HcHVmZUd5WDk4MlMrY2xoV3JadlBKQ1FVMFFFTUtJRHB0ajErbXk0Smhs?=
 =?utf-8?B?VEpaSHptU0sraUZ3cEwvMFl6enF2NDl5aHM5VXNYSzZ2SDhHSVZwN01GVElW?=
 =?utf-8?B?NG1nSVovbWNtb3hFYkhkUjhQYU1oN1RUQjdhQkEvTTBjaGlFaUxUM2lzK290?=
 =?utf-8?B?ckpURnZTVGxlUGxBMXpWSjE3V2NYTlRVL21QN1dLK2N5VVJ4ZTgxSHhxT2FT?=
 =?utf-8?B?ckVQd1NVa0xrSmV1eGJDWW1KY2NmNGQzOHlwR0FSOWovbndqaFdueWlxUStQ?=
 =?utf-8?B?ZWQwZjJUZlk1NUhYc0hiVWMyNC91eXJaeWl5UDR5NkVhTlpYQnhuK0dacDY1?=
 =?utf-8?B?NmVQL2NLd2x4aHlQckRRZUptcFVzSHBWMEFQZDBBSlIrRWJsSDk2RFN1Znl5?=
 =?utf-8?B?MDBwdHhjanhFWHRPcm5uajRabWdYY1Q5L0ROQkMyOXQ1WjFPTUJURjZId1h1?=
 =?utf-8?B?V2NYSVhKWEV6UUVaVEc2WmFjV2JlS3VjejgxUHpsQUtSS25GUGlMV3ZHeDFH?=
 =?utf-8?B?NTkwK1NnU3BaYVZpaTJ3SDBNR1BIYXd1TExsd3RBL1JSUkR6WExEWGpSbDBX?=
 =?utf-8?Q?jAkWtRRtLVxTD2CKSVkKZHqDOiKB/c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGlsWDVFTjZjb053Y3FINko3L1ZlOEQxWXpxaSt6bmtKM2dnTXR0bU01ZUwr?=
 =?utf-8?B?R2R0NkViVDRmTUpNZWJPSnNycjVUekFnd2cyQkxMS3NCQmxEVkttc2xIcmwv?=
 =?utf-8?B?NmNnMCtrN2dGNkFQWkxZb3p1YkJOUmdSMWcwbHVFQTlSZkVENEhaTkxtRDZZ?=
 =?utf-8?B?cTZoZE1nWldxa1RIZ2p5dkxnMnA3dlJLVWxURER2OEJHVFhta29JdUd3RUtx?=
 =?utf-8?B?czNCMnNDcmlGVi8rT0xYcWRCSkwrN08zR0wzbHRoWUVhOXpVbjlyK0c0RUNu?=
 =?utf-8?B?cVhMVzVpdldsM1JrWDVaTG1FaVhHVHJkUG8wZlBrMzNBU0RzMThyVkNiVEpv?=
 =?utf-8?B?Y1VCSWZNYXdpT3NTNG93L05YZVA1TjRhR2REbnUrb1lHdXJoamVmR2hucmw0?=
 =?utf-8?B?UXFwbU5hb1JRY2xzSEtlaHhMQ2lzdmxuUUZrNmZwckpIblJhWWpLaEpTNVNY?=
 =?utf-8?B?Q3ZOeDVJQmN6VzN5aExSZUlaREZrVkFvWUxkSG1mRVg3YTNheWNoZWxHS2tU?=
 =?utf-8?B?cXpjWlZFSHJzNjFqQWdzWC9lVmdyUDk4ajgvWVRuMXhvMXl0QjNDa1M4YXFY?=
 =?utf-8?B?a3k3VjlLU2tGalliVFNKejdkNUMzandhOVQwcTRHNlh6bG9STDZuOFpJc2Qy?=
 =?utf-8?B?a3pSZk1NZm1yWHFqQWttbVVLeWNZU3oxbGxSOTNEelVqRFRyTzNFYUlkYUpH?=
 =?utf-8?B?Mm96di9WVkdVWGkyc1B1YjN0Tm9zR3lHQVR1b3FTaTJsSWVKQWpNSlkrcER0?=
 =?utf-8?B?aTRqT01aOXNUMmlQcVlyNDJOaEM0QTJmL09BM3htWlVGRkVuSWFQM2YzQk1N?=
 =?utf-8?B?M1c1NVg3NTRoVzRBSWhrQTE5TXp2a1c0ZzF3TmU3cnRlbGJuL0dlS3JtUXR2?=
 =?utf-8?B?bkNGekRVcTRGZFN5SkVSanZrWnpybTdsK1NRd29GMUVZTXJUWWpIajMzNGNO?=
 =?utf-8?B?a3d0cFNSanM2bENPNk1Wc2pTY2hWK2lsaHAxQkFiamFxaC9mSmdqdjgxNWFC?=
 =?utf-8?B?ZkpMNTN0Wm1GUlIxNzZtRmNZVTAwbUd3OTEycFFCa1prOFJpbk5GT2VleGlm?=
 =?utf-8?B?Y3VWSjEvRjhjT09IMm0rOE54dVE2bUNtSmlpQjNleEZERVFHMHRpMGdjOUZm?=
 =?utf-8?B?TFpKYXRmTzJzQnpDb2VBRHlzR1ZUR2pJY05yMW9ncDBlUmN2ZGJsS3ZKSlBQ?=
 =?utf-8?B?cHA4dE1iUFFqYm1uekUyb1l3bHpHcWxUeDlUZ0NOWVpDWXcrdldkZ1g4MGlX?=
 =?utf-8?B?RU9SVGdad2J4QnR1L0ZWcVAyM2VpdWwvUy9GNG1qdmt5MHBYVC9KMjh1QVVn?=
 =?utf-8?B?elMrVW1pRmg4RmFlRzdwSTZ2TzBMQkVxU3cyY0tJdWpKU0lTV2V6aGNVUEdi?=
 =?utf-8?B?OFdjRGxGbm1zUzUrQjZML1d3VnRrZDFDTzNLa3AwSUdvcnJQSFBrVGdPaGtq?=
 =?utf-8?B?MTBScDBGb084Qi9ocHVtdUpENEg2R1dZVGhLeW9jTVB1aFo2bGRYOWtlS2NU?=
 =?utf-8?B?REQ4ckN2RmZPWldLZTB1dVRibXZEejJaZHRWd04xNmFNMlByVWliUUVGdSt3?=
 =?utf-8?B?V1FlTitQeVlLYjVFWkZLRGg2V3pySzNzQWUzbmdaUVlhdm1Odzg4TVhBSWly?=
 =?utf-8?B?dTAwY3hraWV3dVByS24vS2p2QjEvTmEzaUhDTjE3K25sWDlKUTdSWGhWMzBJ?=
 =?utf-8?B?cGp2UFpKZngyY0YxajdRZ0t2VC92SWRHVUJQaFY2L25YTUNBQVJmcU11ZU5K?=
 =?utf-8?B?VEJNdkFQQldMNk92eUJQbFl4OHAvYVYxSWNiSlJMNGJEajAvcHBRZENyUEp6?=
 =?utf-8?B?ZGlldFh6NkZEYmZnenZ4aVRDWmtpeHJLUGpNRkVRSmhmU0luVm1TMmFXcTMx?=
 =?utf-8?B?ZDJla21CU3IzeVBpd0cza1hoY3ZZaE5lNUV6UUxRMzhjU2lNc1RvSFEvanRC?=
 =?utf-8?B?czlaeG5FNlhpcXRlNGZWbE56TEFwTDUwbC9pL2lCc0lXR3RlMnZYV2h6bVl3?=
 =?utf-8?B?bFB3NmFhcHU4dGRnQjRJNit2MnNna1kybDVqSzVUTVpyOWZFczBDTGh1dDlQ?=
 =?utf-8?B?WFBMd0ZBTnlIdjBaN1hZbXYxS0M1cEM5NUU3NzVTU2w5N25tdlFyTndKT2xn?=
 =?utf-8?B?OHZMY0VnL2RWUG90R1hMUzlrcElrclBQdnBpZjVrVzVwQnlhZTM1bWxIS1Jm?=
 =?utf-8?B?K3lLc0JUblEvWXhkNGYrWm5nLzJIRnZCUldEZ2dGekhWWVNxcHFsUnZLdDRa?=
 =?utf-8?B?R1N0dXIxcFB0VEd5dVhReVVnSkZnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ccf9fad-1c19-4fc5-88e5-08de0f812911
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 02:34:14.9929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WS4utXThfm3ALf5KE8OyJV8ISy2FRRlPrqQ0oB/YawxatCK3pu/WC+g+mDu7y8DIf0KYMwGCfZw0MV2HDwzr7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6345

On Wednesday, October 8, 2025 4:30=E2=80=AFPM Svyatoslav Ryhel wrote:
> Expand supported formats structure with data_type and bit_width fields
> required for CSI support. Adjust tegra20_fmt_align by factoring out commo=
n
> bytesperline and sizeimage calculation logic shared by supported planar
> and non-planar formats and leaving planar-related correction under a
> switch.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 39 ++++++++++-----------
>  1 file changed, 19 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stagin=
g/media/tegra-video/tegra20.c
> index 7c3ff843235d..ffaaa2bb8269 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -280,18 +280,13 @@ static void tegra20_fmt_align(struct v4l2_pix_forma=
t *pix, unsigned int bpp)
>  	pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MAX_WIDT=
H);
>  	pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MAX_HEIG=
HT);
> =20
> +	pix->bytesperline =3D roundup(pix->width, 8) * bpp;
> +	pix->sizeimage =3D pix->bytesperline * pix->height;
> +
>  	switch (pix->pixelformat) {
> -	case V4L2_PIX_FMT_UYVY:
> -	case V4L2_PIX_FMT_VYUY:
> -	case V4L2_PIX_FMT_YUYV:
> -	case V4L2_PIX_FMT_YVYU:
> -		pix->bytesperline =3D roundup(pix->width, 2) * 2;
> -		pix->sizeimage =3D roundup(pix->width, 2) * 2 * pix->height;
> -		break;
>  	case V4L2_PIX_FMT_YUV420:
>  	case V4L2_PIX_FMT_YVU420:
> -		pix->bytesperline =3D roundup(pix->width, 8);
> -		pix->sizeimage =3D roundup(pix->width, 8) * pix->height * 3 / 2;
> +		pix->sizeimage =3D pix->sizeimage * 3 / 2;
>  		break;
>  	}
>  }
> @@ -576,20 +571,24 @@ static const struct tegra_vi_ops tegra20_vi_ops =3D=
 {
>  	.vi_stop_streaming =3D tegra20_vi_stop_streaming,
>  };
> =20
> -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)	\
> -{							\
> -	.code    =3D MEDIA_BUS_FMT_##MBUS_CODE,		\
> -	.bpp     =3D BPP,					\
> -	.fourcc  =3D V4L2_PIX_FMT_##FOURCC,		\
> +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOURCC)	=
\
> +{									\
> +	.img_dt		=3D TEGRA_IMAGE_DT_##DATA_TYPE,			\
> +	.bit_width	=3D BIT_WIDTH,					\
> +	.code		=3D MEDIA_BUS_FMT_##MBUS_CODE,			\
> +	.bpp		=3D BPP,						\
> +	.fourcc		=3D V4L2_PIX_FMT_##FOURCC,			\
>  }
> =20
>  static const struct tegra_video_format tegra20_video_formats[] =3D {
> -	TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> -	TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> -	TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> -	TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> -	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> -	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> +	/* YUV422 */
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 2, UYVY),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 2, VYUY),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 2, YUYV),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 2, YVYU),
> +	/* YUV420P */
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YUV420),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YVU420),
>  };
> =20
>  const struct tegra_vi_soc tegra20_vi_soc =3D {
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>





