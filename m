Return-Path: <linux-gpio+bounces-16848-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E00A4A47C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 22:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2C0A3AD1FF
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 21:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5EA01C54BE;
	Fri, 28 Feb 2025 21:02:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2106.outbound.protection.outlook.com [40.107.21.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD56217A31A
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 21:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740776543; cv=fail; b=ZnhQqBgRE+Ji/JeGj4jGFcuTupHn+vwiMJAO6zwVrgSIomKO/M/Cfeg8HhDmrEyXdx5fTsrlTueJddPpOFrICwjXDruH1q1odo17SaAdx1KKTBAP27mP9cVuZWj++3xqNCLjGVftbYyb/o2wuEFJr7ZvBHYRm+bJ0Cbm+CfEDws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740776543; c=relaxed/simple;
	bh=F2J5mQAUZhBJyedms3wPpXD7jOlLtfKSPKbnc2WUey8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G3sV3MqtHv7F+hFYgDtDVUa5QrthCpgaV80ccXCn7nCFkbSYURnPJsssTJZHiy6fRup4fOZqR1x6gnNchRzGdF35j45n6wbI2xXFnHXcI2UEKosrbBYChQa8hHA8NAoTabJ/EXQRf7MgvjfLm0NdrV3lnRfhE146MFdMhFRaQnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberdanube.com; spf=pass smtp.mailfrom=cyberdanube.com; arc=fail smtp.client-ip=40.107.21.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberdanube.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberdanube.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ky4mKw/ous1LPeWzCEDLnzWQ9tbJIO3+Sfw/K5Zdf+DXYaG53P/jS/uf6btGdUjLhG5gOgoe10MNrvCvNkp9eKCNwhdMAqkodrru0R6QnoXbUAk/Z5MQMoFt173dtZlSCs1tiWIsiWy3BmujJymgb72wRpoY6Nm4uIeiWsPeZpL4TTFKjMGA3/UYTE0SUR2zUWWnqlJcQUHMawL4CxB9G0mMZv53i9OoWMSFqh1Haw0kOgp/yMIFY3+OM3N1uuS06gYAJ4vzB7P2nq95u2Dohps2Pg9/31E5ByDjNE3cxkzVxPw0MwOa+KplV+Ln0jdxbVonVkZC+vuzHpWUHHIRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C29NDibMymsD0tlPvu4QOcVDfB9lcDK2ObWVNlYywUY=;
 b=Ul5xmNBwePLlcRb6w9AlWowM4paxnclo3cWpUP0jzNVN++ZbHgddxP2Th3I1EA1ZbfmK25LoepLgumYQqY5xXx3TIDJlQYkLBGVxJRJUQnQjI1MeF5qIYYVS/23tBZ+B7HXwjgwQkfVBvSLwf3vHv6xmCqn7XgOgWpXooYwSqm4FEObXj8QgiFqQeXxyYmf+DwYcl+qt6lYdbHfdtLhwz81b+fHH8OaD1Ms6OAF3M/p0EaJ8Eychut/il5NV9NhzuACZhlTp1JIRUe8ZEYfRj+Ae9VvjOf9+UsB1c+zW99oCg4NGpA/7qTIdxUACCaHmOY3Uq9uuDXI08tZDkLvLhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cyberdanube.com; dmarc=pass action=none
 header.from=cyberdanube.com; dkim=pass header.d=cyberdanube.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cyberdanube.com;
Received: from DU0P190MB1708.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:344::19)
 by GV1P190MB1851.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:62::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Fri, 28 Feb
 2025 21:02:17 +0000
Received: from DU0P190MB1708.EURP190.PROD.OUTLOOK.COM
 ([fe80::bfb7:7fc0:d495:3413]) by DU0P190MB1708.EURP190.PROD.OUTLOOK.COM
 ([fe80::bfb7:7fc0:d495:3413%6]) with mapi id 15.20.8466.028; Fri, 28 Feb 2025
 21:02:16 +0000
Message-ID: <230bae96-2cac-48a8-869f-0e664cd8e049@cyberdanube.com>
Date: Fri, 28 Feb 2025 22:02:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: sim: added configfs option for static base
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org
References: <4af4f6c5-d7da-4735-9ef5-ee3c34f7eae6@cyberdanube.com>
 <CAMRc=Mes3EmqfPtMBNZfTPV2cpyfsH13hS4bad5AwgTUbdVCPQ@mail.gmail.com>
 <661c2ee0-013b-4ee1-8c53-51729a172cce@cyberdanube.com>
 <CAMRc=Mcx4=9u9n2CoX=ErxjEidEHH-+ALz976ir1P0NMnzAQvA@mail.gmail.com>
Content-Language: en-US
From: Sebastian Dietz <s.dietz@cyberdanube.com>
Autocrypt: addr=s.dietz@cyberdanube.com; keydata=
 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
In-Reply-To: <CAMRc=Mcx4=9u9n2CoX=ErxjEidEHH-+ALz976ir1P0NMnzAQvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0229.eurprd08.prod.outlook.com
 (2603:10a6:802:15::38) To DU0P190MB1708.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:344::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P190MB1708:EE_|GV1P190MB1851:EE_
X-MS-Office365-Filtering-Correlation-Id: 495f6ce5-7b0a-4834-6b3e-08dd583b2e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDIwWDVMRzRTQnl2bDVQaExkZFpuLzhlZ0pxNUlNYkg4VDFXbG1KU3A5STQw?=
 =?utf-8?B?dE9VZFVpcHFZdzBCa0xDNkZTYXJaTTZaL1hWQzZqWkFaLzdMOStjMXBSUEJQ?=
 =?utf-8?B?Y0I0MXhxVWJUQ2ZuQmR0QnNRa09SakVNR0xWQ21PZVorSWREUzF1RWZ0N1ha?=
 =?utf-8?B?bUdGZVFSVnhkVFE5MkVjVlkrK25DRitpeWRSd1BWMzd4Qm9GRVJSWHMvMThq?=
 =?utf-8?B?S2Y4ZWtPUGpybDdXbUd2Y3M4WnZaVExaa0k3bVZKR2tZMWRUUEdrTHB0WEls?=
 =?utf-8?B?dXhFOW1ncForRElEdFp0NVl3UlB1SFdpaUZodDNuVklXSUVXQzI1eGdld3Fn?=
 =?utf-8?B?U2tOVUczSFl3NHZJMzVzb2F2Sk05M3Z6cXg4K0xncytXZmtGNXYzL1RXckxy?=
 =?utf-8?B?Wnk5dmJBc1E1cFJhOXd6TVpYQ0gxNWwvMUYyRVVoK2kyS0J6dGxYRjRVcGpN?=
 =?utf-8?B?N1RGakxOMkgyaDJiRStlbG5kMlVndTB2TWw0Y0VwYTUyWmpJWEMyK1UvUGVi?=
 =?utf-8?B?OWNpSHBRUlViM1dYcDYwdWh1TFZrNktrZFJ5ZGpsbCs0Zm5jUzhaMFF3ZzNt?=
 =?utf-8?B?bWVzQ3ZjN1J3MlBUeGx6c0xCeUR3d2RoQnpsQ0VvNWFPM3I1WkFRZDkrT3Fh?=
 =?utf-8?B?SnJRS09CZEgrMHVVMGZINElPOFN1L0tkNGQrWFdKY2VsOWdDaUEyWVNBMlk4?=
 =?utf-8?B?Y3BmenZDZGpoeU1idm5UMS9LWEF6bzBULzR5OFhmWTc1YkE1bWZTbzltLzZk?=
 =?utf-8?B?Y0NaZlpOdVVPNmlFTmtmNkp3dHhTQWVJcEFWeXVackdxbjF5SnYvQndoOU1v?=
 =?utf-8?B?NWw5enZzQzhoQVczVnZVcjNBVC9SSkp1K2xnWjQ5ZWRKaHdld2tQcVdubVEz?=
 =?utf-8?B?UWVvcnFncVMwczhtQnRVdFVIZnNjMm5IeDBrbDhXaXk2TTRCVER5RzF3NjVE?=
 =?utf-8?B?T0V4WkY3WmI2dUhjTEh2OHdma1Q0RVJrdmtoZnNEemtMUTBpY29aSERRRDZU?=
 =?utf-8?B?K3F5d01XKzM2S1dyOGZVRzBYaFRvUWJhR3hqWlpXeE5uNTVOeXE2dis1Q1Rr?=
 =?utf-8?B?TW5Qb3JkR2lYRURoSnN5L0k1ZmRtVmVPQkUxbWpUQkwrNHRMc1BieUtyeldo?=
 =?utf-8?B?dW4wTnNFRWtLdTNaOEZPWU1wWnZobmRqNk14YkhMbllTMy80d0d2YkFLWkpw?=
 =?utf-8?B?bmlud294Y2c5a0RnSTQ2TkVvUWZ5aitDbU9jUGZ3ZEZQU3hiV3lTcmdybG9r?=
 =?utf-8?B?amY1SUQ1QmdXc0k2aFZHZFhhcWhKRnlrcy9QZnlBVFZFV0pCVHNKM1VwMXNE?=
 =?utf-8?B?SGxFYVJOUk45UEx2dHhYNjhnZXhDU2JrcnhZajFHR0JudHRXTjJ5WFhhVjFF?=
 =?utf-8?B?eXM1T1BHNmU4VXh2aWg2Nkh6N0NHR3BndGhVNlU4dHd2TlRHTXVucklrSFdx?=
 =?utf-8?B?d2R6c2NEd2lhSTRxNTlFM3haVGFQMEFYT0NOT1d0U3lnME5SRHc0dHovK3RW?=
 =?utf-8?B?bS9VVzJyeEwrQzhTY0hxcnJWT0dhTks1KzgvQkk2cXZsVEZOb2hpNlBwcTZC?=
 =?utf-8?B?Wkt0R25Nb2FLYXJFK3kxN1NhNkNESzFMRnFRb01DcHh5UmNib2pkS01zSWIz?=
 =?utf-8?B?TkhXZkQxbm9FOXR3MnIyeHdtcGtNQ1BCMFVXNUx3cDdIc3o2cUxyaVcvVzA1?=
 =?utf-8?B?OGNpcVZmTTRXSWMxY0htWW8xK3pkaFBEWWM1UG94L2RQb1o2MFZmMVhGYlJN?=
 =?utf-8?B?ZllTa00xcGRCaE5QMHpmbXdBR09mdURSVUNSUXUzdFJybkp4OGE2TGpuL1Np?=
 =?utf-8?B?dEx3S2V4K2dDbHoxZTk3dG93dlphczZpaXFVb283K2svSGlmbVhTTGZQZG9h?=
 =?utf-8?Q?GX2ZzPgBjrB9H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P190MB1708.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEtqejJRUzB5aGpablhza0I0bzZ5eFFVbVJzWk5DWXE1YTRQWkcranRHNEh3?=
 =?utf-8?B?bVZYMVZNTDFqakUwb2dRaW1mdi9aYnpTNXYxT1MzaXhnWGNRV05iSm44R3RP?=
 =?utf-8?B?cWl5NkxNa1BUTXZVOHpBRUJ6ajJqb25YazdOQUVHbk8vT0dIdklJRUcrZkVy?=
 =?utf-8?B?RGloMlJQeFA5eTlOUkRFc0hPUGNMQzRpQ09vSHZoeDl5OGs3WnNGUlNsUUxw?=
 =?utf-8?B?RGl2ZzRzcklheXNTaXRiQTdhWmlFZGJidEFGcW9LYVdhZWhteTZzalhsWk5N?=
 =?utf-8?B?dHBSQnFIeG5ZZkdBNUZLQnFzZEJEaWdMSHJmSm9takJIOUFEWVUxb1ZhMll0?=
 =?utf-8?B?UUdUenpodlhqWkFTNHF5S296a21lbG00MEx4Z0ljeisyRHE0Wm5Ga3ZGK2dp?=
 =?utf-8?B?dU1kQUV2R2NnSjRpZE4rRFZOL3k0OVY5T1JyZzNnTEZneG5qdi9vQjBsNitp?=
 =?utf-8?B?SVRNN1IwUnpHeHNKQytjR3d1YnRMWEVXM0xrQ0hhY3RvUThqM2p6cTl1eUZK?=
 =?utf-8?B?cDZ3cWRvOU84TFhMbTBDUFFZcDk5ZnpuZytYcW1mdzNEN0Y5djlZNnJNVlRB?=
 =?utf-8?B?UXYzYWE1MlFyWEhTS2NlV2NHR1lscFM2c0QvNGIwTzJDdzg1bEhnc2E3NzhQ?=
 =?utf-8?B?MHEwams4NjZxemhUeGJkZW9Sdi9LN0FoS25qOVErVEQ3emFLbTllMTVJTU1G?=
 =?utf-8?B?YXNOM0xMZEZKZGFwdHVmTlRqT2R2MXF6R3JtTDRMakM5UDRmZ3B1T25zQUJo?=
 =?utf-8?B?TUoxek9WR1hEeE9yRTRzMml1UlNFdi9sTXpiMDlmWURabThTZE4zWVdJMmlO?=
 =?utf-8?B?UXZ6MlEwYmtPMjhQVjE3TURuR3B4c0RPamtiZW45bjQzQ3BqTCs3WFVzZGhT?=
 =?utf-8?B?bTd6aGVNdTlrU3UvbXlhTUFWS3hZWnFjL2gvRUM0d0VlcXBzK3pQUG9taDFu?=
 =?utf-8?B?c0RmamdFRnAwMWg2NmdxYkZKMUV2bzk1WlduMHN0R2FsZWpyZVNnbk5nNlpm?=
 =?utf-8?B?S1R5SGorQzIvUDZHc2hvdm1LVStGVE82RE9DRmVIdkZTTE5yMENPT0F3Z2du?=
 =?utf-8?B?V21hQ0Jod1JOcEhXdTAwUjdXV2MzZW5GLzJBN2Z5VzNCOEovTEF1Tko5MTJS?=
 =?utf-8?B?TlY4TFFsSk55ZnVDZEl4SStteG5wWTdIRzBzWTlLUU5LWXlwRjRDa3dQK2N0?=
 =?utf-8?B?R1dxK20vbjEyUS80UGM2emhZQTZJaXBlTysvdkJBYUVtN25tUzFzRVY3SlBT?=
 =?utf-8?B?Zlg2V0FUTDFHdGRZWTlxUmZJb2VWS3pnRFFweENqTEFMRHpxcnZQNTBISTBJ?=
 =?utf-8?B?TlNqQWdsVEd2Y0NEaWx2dzRkZDRWOXI2TG5WN2NpWEZIcWIvSk1yNGl4YnhG?=
 =?utf-8?B?U2lZWnd4d1VrdTZiM0ZhdnhQYUVEWjZEN1FwcDByZmh1Q2VGTGdGcmRNRUhm?=
 =?utf-8?B?R0hIUE9MdWFvQnVYVy9hcFM3OW85MnRMUmxFMlVXQVRLZkp5QnBjTlE5cThq?=
 =?utf-8?B?cEJGZVRVOGE3a0V3b1Y4UEdBa1Z4R09BbEtlRnZma1FaTDZVRkcrRUtkbURj?=
 =?utf-8?B?Y21tNjRuMnFpYWtpU3lXUEk0blU1WTdXcjcvM3U5aTRiRmtWL0YrS202ZURG?=
 =?utf-8?B?SlBLTkE1OWMrMjVNWVJUMjlPVVV3VEF6UzMzTWJkZFptc0t3aG80eFlQSHB0?=
 =?utf-8?B?anU3ekU2dGpXLzV3SzNNQ0J5aTk4clBJUnF4MEhGazNHUXVwWUEyY01NN1RP?=
 =?utf-8?B?ZXJoMnRjR2lOTWdEMXY5Rmx2VURhb2dUQVMrOXY2cnRtVmU3TTlWRCtyd0E5?=
 =?utf-8?B?RFZRZTVLRmsxQVVOcWc0WlViZzVneFc0cnRFZndyQ0NuS1FPQlMwbUVacHo3?=
 =?utf-8?B?OGhYNjNkWERVS2x3RWZTU3J5ZjUwQlk5bTNISU5rNHdacEIxV2tJTm02aHVN?=
 =?utf-8?B?aStXQjhmOUtxVVZFcDhucE9tcktyK1EyRG5mODdXYXdLUmQ4bHdyUkM5cWFD?=
 =?utf-8?B?KzZGRUJBeGFrZWJKcVFyZG9kR2ZLUE12TTZBZ1R0QUxIUGY1MTdCZW5UVytS?=
 =?utf-8?B?MHFFVGUwR2NtNVRkOWoydWpLZ0RqaENldVhqaFFQR0JUQ0VNRmVFeGY5S0NF?=
 =?utf-8?B?a0wwUjhjWU9mbGlWQ2k4L1lqMVJDdW9KdzhEUy8zb3lLYkZTaVJwQnByWmFY?=
 =?utf-8?B?YkE9PQ==?=
X-OriginatorOrg: cyberdanube.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 495f6ce5-7b0a-4834-6b3e-08dd583b2e72
X-MS-Exchange-CrossTenant-AuthSource: DU0P190MB1708.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 21:02:16.4668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f36f8ec4-80a4-4765-99af-e8d63d22f744
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9oIA+SY6/2tMMWDUru3u60sQjP2kaDmiDiJQRU9O81cpnrDNLZkeX/MlhAZ1rSj6TiHsQGcGBxDkHydQWYaDKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P190MB1851

On 28.02.25 16:43, Bartosz Golaszewski wrote:
> On Fri, Feb 28, 2025 at 2:54 PM Sebastian Dietz <s.dietz@cyberdanube.com> wrote:
>>
>> On 28.02.25 14:22, Bartosz Golaszewski wrote:
>>> On Fri, Feb 28, 2025 at 1:46 PM Sebastian Dietz <s.dietz@cyberdanube.com> wrote:
>>>>
>>>> To replicate gpio mappings of systems it is sometimes needed to have
>>>> the base at static values.
>>>>
>>>
>>> Can you give me more info on why you'd need that? Static base is
>>> largely a legacy and deprecated feature, there's ongoing effort to
>>> remove it from the kernel.
>>>
>>>> base is treated as unsigned as there doesn't happen to be a
>>>> fwnode_property_read_s32().
>>>>
>>>
>>> Ha! That's interesting, I wonder why that is. We do have signed
>>> variants for OF-specific properties.
>>>
>>> Bart
>>
>> We are building digital twins for embedded devices for security research. The
>> firmware of these devices often export static gpio pins which we simulate
>> using gpio-sim. With this patch we are able to satisfy these conditions.
>>
>> While the feature may be deprecated, i would argue that it makes sense and
>> fits the nature of a simulator to be able to configure it manually.
>>
>> BR,
>> Sebastian
> 
> What kind of digital twins? Using qemu? In any case - I really dislike
> the idea of extending the configfs interface of gpio-sim with an
> attribute to support an option that we're actively trying to remove
> from GPIO core. Unless you can give me a really convincing argument, I
> will allow myself to use my maintainers' right to NAK this one.
> 
> Bart

Exactly, we are analysing the firmware and re-host it in a qemu instance with a
newer kernel.

First of all thanks for giving me the oppertunity to pitch the option.

Gpio-sim provides a way to create chips for testing purposes. Some embedded 
device developers still rely on sysfs. While the ABI is certainly obsolete and 
not actively developed, it is still actively maintained - Which means that in 
real-world testing scenarios, it remains relevant. Our experience has shown 
that these firmware images are often build with hardcoded sysfs paths in mind 
and do not use the character device interface. 

This feature wouldn't encourage new use of static bases - it would just make 
testing existing setups less of a headache. 

Given that gpio-sim is meant for testing, shouldn't it provide the flexibility 
to test in this scenarios?

Thanks in advance,
Sebastian


