Return-Path: <linux-gpio+bounces-26969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D08BCC798
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 12:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 036B3423A5A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 10:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC902ED85F;
	Fri, 10 Oct 2025 10:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DlHU57DN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012022.outbound.protection.outlook.com [40.107.200.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F25026FA77;
	Fri, 10 Oct 2025 10:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760091004; cv=fail; b=gmN+nAzMBzBxXqKvsrgGQFbJe/ayH5O9eVxjl2cEUVw3HYxtUn18NV5nZ/h1FrY45X4jt37LnCjbbgP9KNOgC2LsYucSMWKfXTI3SJBrPYpSbr5ipg+24i1foaqWqb5vpADRpJkD6yOZAG0SE0rFnl5aw1rcQJOQOoXzcI7/Sao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760091004; c=relaxed/simple;
	bh=sSBZQh7qT/gEMU7i+wwgHwKSPpKeM+Omuvq9zzcBer0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rdU0nu3odfKrT2AthnmQ0If8vBA/Opx17jcZB49yO6oS7DSnRUYzZ1udTV7tUDrOx59UdRThu9dB0VIA2fjtDZXilhOeJZfQGcWcMe0CDXFS50hWsPCdC63OBXJdYddZ1BAaNLVv3kzJXKpbl/X/+Xe7iBf2kZYFgpTFOWGpCk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DlHU57DN; arc=fail smtp.client-ip=40.107.200.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xv+pwpzLwauExVESVx2Em2RViYlqvq1loflOAsYigiGKhTRYcyWiMUq7gWGhZESxk/LPu3b9X7anvAp3CHGY+BitQmRjLRqE33lp4/mUtif1be1mA78JhcFIp33TJUQd2po8EeEyJUSsY3MMfPjnanxGCNF91nP+Buy6HsW4U7LtyzViLcU2IIfLy4mhNhHhcRGxK5p4utRr9Ep/jfHP7x/Uhk10wi9NIfz03kGyTulz/VPKn/3IsqLvlkwwz0+YnMnL914QmU63JNxUWdOLmnlVJKQf+3/wQ8OlNE3u6piHgB8QlJGne+t38IepLYbLbe68jtui5JhKD5T67iy3tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeesvhQ3ijb7okFgJbrEwdZGvWn3kKDlp9AZ+gRvkME=;
 b=mbLLTQTTjM6cbu0teA3n4sxO6tiwOFiL6s8ZizmKLB+LNM2uiawrrGaPE5Pob5y+RhDeAG090g7CarZGZUkW0kAxz5h5u2PjMAvkFmT0jktk22+qTnbL+okHwV4HTHLUBhToa1DI4vOhW1K6TuWjRxAZoO695rMckFQP2RpAjuuj74faifVkij/avieRJ9TbJp1aGrJnD5SappC8HeH9uj9EGnnf2ubw5ayM7LjuJv/EdYzfcE6E654x69NoIvTDLG2odzVe66swmEb3FvPPJPDRbT/GATSng2J4dRHrGzRPpeBl8JfPBT/Op1xOxdpUoFmTMpqVBAJ+GmMh0kEMMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeesvhQ3ijb7okFgJbrEwdZGvWn3kKDlp9AZ+gRvkME=;
 b=DlHU57DNeh0qebd1ck/ZZBGkGPYzRUER5ls2TIcrSIB9E32DFcR6xS8dZS6Fi4uW1J6zJOElQZ/8sD8y2rVWOJaldm1wC9HStNK8SC1kflq3wR6L9LPLsgHZL5JSbDcm/cVImcgtr2joerC1KAjNxP8DN5eYrSQuqgEfrdsXDqijXjuupnRIEj5y9tiT29s/vBYue/AD0q1GEWJI90yKmILNRPrjiJ0LCsXrdSos8fbN1PZtlGmYIH60f+unadH2C9A7zIwm0SaRE3dZsik53i8GFmDA7MY6gBTwLrdGXRWfVF3+vXrtXdUfPUJ9vPqwlBEspV/w/teqdFkTPE81vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by PH7PR12MB7938.namprd12.prod.outlook.com (2603:10b6:510:276::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 10:09:59 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%4]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 10:09:59 +0000
Message-ID: <cdfe50ee-4539-4826-a39a-2d9ead67a199@nvidia.com>
Date: Fri, 10 Oct 2025 15:39:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpio: tegra186: Add support for Tegra410
To: Jon Hunter <jonathanh@nvidia.com>, linus.walleij@linaro.org,
 brgl@bgdev.pl, thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Prathamesh Shete <pshete@nvidia.com>, Nathan Hartman <nhartman@nvidia.com>
References: <20251010092913.711906-1-kkartik@nvidia.com>
 <20251010092913.711906-2-kkartik@nvidia.com>
 <a82f9e2d-0e12-45ed-ae6c-af781df05b5a@nvidia.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <a82f9e2d-0e12-45ed-ae6c-af781df05b5a@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::13) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|PH7PR12MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 354bfaac-b2e7-4607-4812-08de07e52b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3QyUUdQdzgxY3JOMXF0dWNDVTVwSnpxQ2NSbHUzb0daL2laUFlZRUNNZ0tO?=
 =?utf-8?B?aTdZT3Y2YlBUZy9vNEE3MmR2cFdPRENDVjNlKzlpUmlBYkdDSG50eW9GZHpi?=
 =?utf-8?B?RStEWmlHMmVBUTZySHREQ0pyZE9kcHNrM3VjdmF6SzRYVXp5bG5NWlFhK0o4?=
 =?utf-8?B?M2VNUUhreWx0WGNzOCtGYkFlR0NZb0hHeWdnRGtJVHg3OHJBMnRjb3hvdWZC?=
 =?utf-8?B?Mm1iRk5rVjlZZ2t2ZmRlaE9KOG4xWHU3cjEwUEt2c0JoTkpIVVZUWkxuaG93?=
 =?utf-8?B?aWFUZEJva3VzY1JLc2d2L291dW5sOS9zWldYSTFhcU9SWFVoZTh3ekorNldT?=
 =?utf-8?B?OXBHL3E0UW9zOWlRcWQyVkNpWTdUYmpxcE9aOVMrTjBDT0U0U2JiYWdNU21U?=
 =?utf-8?B?UzM2Q2JLc012ZlZma3NtakpIZE83blhiZHJaeHF5NXNYb2lUajBkei8wblgx?=
 =?utf-8?B?alhKUjB4dWpGRkc1R04rMlNFaTJqakdUSTdTR3JpU1E4VEZkL005L2h4eVdF?=
 =?utf-8?B?RlRZTnFtNHlJY2RqODFtR2pNS3kwbVRJOUtXTmJsREZNc3FHeFRHOE9sc2dM?=
 =?utf-8?B?djloNSt2aXAzcWVvSDFac3NaZjNXUy9WMmR4Nkl5U3NReENvVC9wT0NJS3RD?=
 =?utf-8?B?cVZ5QXFxb3YzdXkzYitibHF1MGJJZ3VqZzh4clgvZGYrbC9HdkE5Zjh4b3d6?=
 =?utf-8?B?OXlsWXk3TVNmWS82ZXJxYkc2aFYvTWlRc1dRUzR5cTIraHdpd2RPT2NUTU1F?=
 =?utf-8?B?MjBLV2NGQXBFaGliSlA3WXhxVEtQUzhXMXU4ekFKMDJ0RU54VzFhSUVZckdW?=
 =?utf-8?B?SlgySjlCTG9zTTZVQjNLbE85TnVic2ZFSXVnQVpyNnEvUXo5dzFjV2NaNTRT?=
 =?utf-8?B?bjY4aHhVYU1EY2FQQWR3UURGZzE2blo0LzNqRkxBRjRlbWM2ZW1oaUZIT0Nr?=
 =?utf-8?B?bnJVSEZua2M5M2NCd3U4c284WHY4dTFlSkxnOUY2cnVXcXpVRFRYeEswYWhu?=
 =?utf-8?B?Q0VRUTdWZVNSbWxKSnRTdDUvbGxMbHVXSitHeTQ3UmF4T2RNRVVkcXJ5MlBX?=
 =?utf-8?B?bFJoUkptQVJWYVVtMndUYjNBTlVDMDNMVG1zUkRMSUhDc2toK0dja1Y4RElj?=
 =?utf-8?B?eWxkbzFTRWQzREV6SWcwd2duamFKdHI4WnFaZjE0Vi9YQlM2VVh6OXhuN3JS?=
 =?utf-8?B?U3NieVhsNnRkb0FIRGh5ZlFCYU5UdS9zb1Blbk1sWEtLcnRWZnpWMU5vQTFR?=
 =?utf-8?B?NmhUUHdXZ1BLTlZqYitJVVV3OEpYZlU2VGlGZkxIbElBQTNpemhXN05KMVcy?=
 =?utf-8?B?Vk5ESDBwbEl6QWpFZnNsMnhmUktIR2x6anE0cFBOUmk0WXpEdmRveGVpN3BW?=
 =?utf-8?B?Y2VJYS9JTytvSXQyY21EcGJxYXNDNCtyaTV3dSt6WlZra3lRMzVFSjhySWIr?=
 =?utf-8?B?VERRdGZFZzA2MTRHd0ZuS1JSQU1XUkVJWnFLd3NtdmJNdmVrZnliYllKdXJx?=
 =?utf-8?B?cGJJS2V3THowTElFU2E3WmJycm91RlRIKzlIK1dRYmppd2dSVWJDc091Y2Zh?=
 =?utf-8?B?TWFIb2QxcGFnUWpHZ1JqME5mVEVicDMvRmZ2MzhOeWY1MmFmS1orand2bnE2?=
 =?utf-8?B?WGM0UW0yL3lvMzIrcVRkcmd0WC9QOURDeW9XaDRzQzJjRGhLWEtVcmswQXVX?=
 =?utf-8?B?dTFDT2Q5NXF6dUFCSTIwbG15UkFFU2ZMbjEydXpKLzhFRVRUZVcyS2c5M1ZC?=
 =?utf-8?B?c0FONnl5TkZxWXkvQ3VqSE9CWS9Cb2dRaGF4VkVIQ2ZTUmNMNjFGMTFTSExT?=
 =?utf-8?B?c25IVlNFaXRkT0hmZkw1bGRZT1BldTVJK0tyR2swZllNWHdiYnBKeW1yckdT?=
 =?utf-8?B?RndOVDJ0WStiUFhOZ1l1dlp0dTdxa1FjaUsyWG1lbnZXNU95b0kxMktVK1JG?=
 =?utf-8?Q?ny8sOdbfEnd6hxV2dHFC9kMTK4rlb4dt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1pEZnlhVTJwSjk2S202VzZKS0ZQT3JtaUtsTkU4bFlPNWNtSzNUbXhHaDFF?=
 =?utf-8?B?YTBSSjBvQ256WktaWGYvU2dnQ1dUMWFqNzlURlluclB0NWJWS0dqMGRQalJx?=
 =?utf-8?B?YlQyOGt1Z1lKdmM4ZGxXNUNYRHhPOFlLWmNGVUpRQWhZSU1sNWZMWUpmencr?=
 =?utf-8?B?MGZEbU9HYkNYRHpaM0hZQU1MRDVvNkp5T1ZBcmFZTkZzMFJPd1NPSU5GWG0r?=
 =?utf-8?B?aitjejV0Y2RtUUtTK1pwQkYzZ3Y3MTJrL2tVdmh3a2RyMkljN0lyY1JTYk44?=
 =?utf-8?B?ZEQ5N2o5SEhURTZ5OHB2TDI2UE9HajRqaHJYcVR1TGxoT3V3b1UzcjRzV09n?=
 =?utf-8?B?enBldmh4My9CbTZXSnVicHZIcjZkMXovTGZxQVorZm82ZDV1eGkrU2FnWk9Y?=
 =?utf-8?B?REJhNVFzTUd1aVdvQjlLQTkra1RtODlBYmZtWDg2YXQvYzR0aXE3QllTMWU2?=
 =?utf-8?B?OTFsbEZzNGhnSnc4cHhXMkxYRjBKVU1jbWhZMGM0VlFnbGUzYkFDUlBTR1Ju?=
 =?utf-8?B?eDRlbHlDTk5RZ0NzYjJIQTFKOFVOQkV5WkhCWUgwWUQ3SEd6QzVZbU96Z1M5?=
 =?utf-8?B?MTFDL2FZQ0hocmpET1JkMi9uZWRKTjExMnlVbk9YNWxxbncwZlJjWWErL2Fu?=
 =?utf-8?B?N2dmaFlOb0dXNUE4ZmNaVEs1REpxeGxXOVV0bTRENWJYZFo4Vlh5NnhPWFlW?=
 =?utf-8?B?VTE1SXdQaGpEQkZLT1EwbjhPaGJoaHduVEhud1ZQdEVxTms4YXdmUWwrWENz?=
 =?utf-8?B?ZUpmaWJ3MUxyalVCZzVGekpnTnJNNWxVOUpkdHB0T0hqOTIyYlREZk80NVlj?=
 =?utf-8?B?a0MvaFlSMktSR2JMS3pjVzdPR0tJcy9FM3I0bWtDY09QR1ovMU8xZktnWHRk?=
 =?utf-8?B?cXBCbk9Xc0Q5NlYrdWVncnR4ZWpRYnJLeSsyc0FKS0ZiUzNCS2Fndk1RcUVo?=
 =?utf-8?B?UTVNd2ljNEEyUkNCbnpSQ1ZaVWpPaHBrMlhxd1lTWkdYcFFxbjBxSVptUXd5?=
 =?utf-8?B?RnB4QlI2VjJKeEsrNzFBcHp6NlJPOStFdEhHVjdhNW5aRmN2ZHVSVzk3WWRq?=
 =?utf-8?B?OXpJQmMzZVpwVkdSUmRXak84V0Jpb3R2VzNxakd6L3BkL2pjVFgxMVVydVpD?=
 =?utf-8?B?NFdWSmJZN0R5SmVmc2ZVN0FkbGlEZWkzekVVTG1hUGd0eE91ZjdPN2FaQ3ky?=
 =?utf-8?B?NHdZdzZEcVR6bDFPUUpEL3plOWo0TXp4QjJNN082cHFzWGEvZmJYTWQ2N21S?=
 =?utf-8?B?NmJHS3ZpajVabTk0eUpDU3RiYnVibEEyOGpKRE05UUd3NDFqaXNtcGZzTVlN?=
 =?utf-8?B?SGZRYUhBM2Q0MHRMb3B4NnhCTHRoNUUvbjRzTUIvV01RdkY3WXlUclhObXZF?=
 =?utf-8?B?d0xCbVdUeU9mcWQ5a0l6emtnbEtqRVErK0xndUkzYml4dnBmamxaV2w0d2N4?=
 =?utf-8?B?M3BhVlBXTDZXTDlNQlhPMktSbWxLOFNmbW5BN29PWWxTZ1lCN0tVUGJhTW1q?=
 =?utf-8?B?dmo4MnVWMGJ5cHE2WjlOU1lPVmFBS0d3NktHbFRsV1FBZ0hOZUx2TElZOHZU?=
 =?utf-8?B?dTlhOFRrekVCVXJXYSs5UWRyVEduK0hscEZkWXRZalZDTlE0bWhTRnhyYjJH?=
 =?utf-8?B?ajNsVy9TK0FrQ1pwR3VsbWJ0U1BjNDN0TWN2cHpZeDRIMHlsSHp3Sk80RGF4?=
 =?utf-8?B?REkrY05kYUUxTjZwWWRObDA3Q2FlQWp1bDU5OWcvVkYvMEhRaWtiRTJJU2h1?=
 =?utf-8?B?dzhpU0h0U3QzUmVQdHRFdmV4NGtsQnl4aXBVVWw3SWRJTEZqQUtEaVo0Vmxk?=
 =?utf-8?B?Y3k2QzhJeUJBdnR4NlFyeWRweGl6aThVSlNaYTR0N1ArRnJ3VGY4d0dGbUJR?=
 =?utf-8?B?YUJYeVNYVnRQaW5vb0ZMUHJDSHM4ZVdza2RuVUl2bkxpRndsa05mZGg3TGlo?=
 =?utf-8?B?ck91SUh0blhKUGEyQml6eDJZckZ0NXl2Mk4rN3VjNHY5Z283VkxXVHpjd083?=
 =?utf-8?B?YUhtc0lSOW5MSERQdzN0SlpHc3pNSjYxcHAyNURKTjFsMFZlOE9xZERoZ1c2?=
 =?utf-8?B?eGV1dnZvWkNGYURBUUVwZU05Vll0TkovN0c3dHc3NGdXYUxycHhCUmdJRDA5?=
 =?utf-8?Q?Dulho+YKNP23onGy6BrVNcFUJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354bfaac-b2e7-4607-4812-08de07e52b87
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 10:09:59.6876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALhoUMSw1hVhKCsJ4JHShnbXDFg2m6zT+tpe6mlld/rnSfHT5AAgdPNUFTHQEGT7ZJWTZTD+OjsfVmkTi7k5ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7938

On 10/10/25 15:34, Jon Hunter wrote:
> 
> On 10/10/2025 10:29, Kartik Rajput wrote:
>> From: Prathamesh Shete <pshete@nvidia.com>
>>
>> Extend the existing Tegra186 GPIO controller driver with support for
>> the GPIO controller found on Tegra410. Tegra410 supports two GPIO
>> controllers referred to as 'COMPUTE' and 'SYSTEM'.
>>
>> Co-developed-by: Nathan Hartman <nhartman@nvidia.com>
>> Signed-off-by: Nathan Hartman <nhartman@nvidia.com>
>> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>> ---
>> v2 -> v3:
>>          * Add a generic TEGRA_GPIO_PORT macro and use it to define
>>            TEGRA410_COMPUTE_GPIO_PORT and TEGRA410_SYSTEM_GPIO_PORT.
>> v1 -> v2:
>>          * Move Tegra410 GPIO Ports definition to gpio-tegra186.c
>>          * Rename Tegra410 Main GPIO as System GPIO.
>>          * Add Compute GPIOs.
>>          * Update ACPI IDs.
>>          * Set instance ID as 0 for SYSTEM and COMPUTE GPIOs.
>>          * Added Nathan as co-author for adding compute GPIO support
>>            and renaming MAIN GPIOs as SYSTEM GPIOs.
>> ---
>>   drivers/gpio/gpio-tegra186.c | 82 +++++++++++++++++++++++++++++++++++-
>>   1 file changed, 81 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
>> index 7ea541d6d537..c6ebe29f9cf1 100644
>> --- a/drivers/gpio/gpio-tegra186.c
>> +++ b/drivers/gpio/gpio-tegra186.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>> - * Copyright (c) 2016-2022 NVIDIA Corporation
>> + * Copyright (c) 2016-2025 NVIDIA Corporation
>>    *
>>    * Author: Thierry Reding <treding@nvidia.com>
>>    *       Dipen Patel <dpatel@nvidia.com>
>> @@ -69,6 +69,36 @@
>>   #define TEGRA186_GPIO_INTERRUPT_STATUS(x) (0x100 + (x) * 4)
>> +/* Tegra410 GPIOs implemented by the COMPUTE GPIO controller */
>> +#define TEGRA410_COMPUTE_GPIO_PORT_A 0
>> +#define TEGRA410_COMPUTE_GPIO_PORT_B 1
>> +#define TEGRA410_COMPUTE_GPIO_PORT_C 2
>> +#define TEGRA410_COMPUTE_GPIO_PORT_D 3
>> +#define TEGRA410_COMPUTE_GPIO_PORT_E 4
>> +
>> +#define TEGRA410_COMPUTE_GPIO(port, offset) \
>> +    ((TEGRA410_COMPUTE_GPIO_PORT_##port * 8) + (offset))
> 
> This macro does not appear to be used anywhere.
> 
>> +/* Tegra410 GPIOs implemented by the SYSTEM GPIO controller */
>> +#define TEGRA410_SYSTEM_GPIO_PORT_A 0
>> +#define TEGRA410_SYSTEM_GPIO_PORT_B 1
>> +#define TEGRA410_SYSTEM_GPIO_PORT_C 2
>> +#define TEGRA410_SYSTEM_GPIO_PORT_D 3
>> +#define TEGRA410_SYSTEM_GPIO_PORT_E 4
>> +#define TEGRA410_SYSTEM_GPIO_PORT_I 5
>> +#define TEGRA410_SYSTEM_GPIO_PORT_J 6
>> +#define TEGRA410_SYSTEM_GPIO_PORT_K 7
>> +#define TEGRA410_SYSTEM_GPIO_PORT_L 8
>> +#define TEGRA410_SYSTEM_GPIO_PORT_M 9
>> +#define TEGRA410_SYSTEM_GPIO_PORT_N 10
>> +#define TEGRA410_SYSTEM_GPIO_PORT_P 11
>> +#define TEGRA410_SYSTEM_GPIO_PORT_Q 12
>> +#define TEGRA410_SYSTEM_GPIO_PORT_R 13
>> +#define TEGRA410_SYSTEM_GPIO_PORT_V 14
>> +
>> +#define TEGRA410_SYSTEM_GPIO(port, offset) \
>> +    ((TEGRA410_SYSTEM_GPIO_PORT_##port * 8) + (offset))
> 
> Same here.
> 
> Jon
> 

Hi Jon,

You're right, TEGRA410_COMPUTE_GPIO() and TEGRA410_SYSTEM_GPIO() macros aren't
used. I will remove these two in v4.

Thanks,
Kartik

