Return-Path: <linux-gpio+bounces-21125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9817AD1CB8
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 13:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9288D3AAC38
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 11:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A1825484D;
	Mon,  9 Jun 2025 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fR7A84sz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="z4QIrvis"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73F224DD08;
	Mon,  9 Jun 2025 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749470306; cv=fail; b=saZ3M86je01L6c0jyzNVfq/mQSLuo1u6shGS3lvQAdYlMJlda2uxWRQeD0IUNFXNtnQaCLdaBrKD4XFF7wpmAD4Ly3HRa0O2UjbL9XlvD7EgZpuTx5OgTFxx246zddIoFg9lYIoQB0olX+QZ/V/Grtm8c/6N4Mz3iy7AO71NkNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749470306; c=relaxed/simple;
	bh=xRKGLwWvjxAhYpeYVtxh5jEQXMb2pH5DRlojLvFLOSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R1ZhxzD5FrzuYesWfcvYd/BMe4b+TIx7iRm9VtEH/K2gkPEychQOoJe/ouYDWrCQDajd6LkwiUe7n4C8oalTUcdbsxXN35ce6x2EmPJpGROXwTVt2bEFt0eDggvkok2DVTYYpTaB+KGKBiBNyuW0klCQeuTiucYT+7jidoovLBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fR7A84sz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=z4QIrvis; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559BWCxP029240;
	Mon, 9 Jun 2025 06:58:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ATord8/6XNhaaeV5Rb56VV6ou8+GaNajYJHeBo1hdsI=; b=
	fR7A84szIeYye65gNpjXx3cLnObSAkTRhk9tyQkeBVmwT8GdV4Y7VOmL669KNrK7
	OCVWfkbooPb9r4dGbITSKFkwCo2UaoqPmd/EshYI6Ac/Yj+fTaLOFK/xTvBJ/f/N
	bQr+aW0ZbQVCxDXzIzjSGF73pQyEMiflB4K12x9abPT3mEa5067MjtHhjSvFN3ni
	8irh+LlsNFwWrdSXmCaxdXVgDQMHiABYzkupQcy0iBdPLzHvB+sXmFwI0YyWDviE
	BYXfbCsVHswgKDXoM1GVs8S3luEri1zk5BLZJfd6rdVoW8p108qWsLdf8gBxS2K/
	kOdgVfSO46FoYJh+S+IWAA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2126.outbound.protection.outlook.com [40.107.94.126])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47529v1caf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 06:58:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7X459yr84wy9JVszd7GWwseCUqSXlzCiDgSYKiGCV0uu9PLuQEv3zpVY4AV/1PkQqSUjgP384306JaInzttbXjw5rrZCR3Y1cB7eHgRC4JN8z6qkfLmZEcXuE3Ywxlw/wntpkJWBNwq3h53zDORV8WNbxsgSLqMWiPSK2ZhPV83IQA1T/Vo/5DEBGD2HcUV/O+Fzh4/W8cFSfWplp5paHrR+DNO39N3HJh65kW+tUX2ZDtsh0u4vSQAe//ZQvzOauBBc6+CTwtQR+S5bloMSRiHNX/cxtEztTBi1O0nCtCuDOTRB1SQ9AD5UaoRRyCGYjcwjim2clxzO9C0B3Fg8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATord8/6XNhaaeV5Rb56VV6ou8+GaNajYJHeBo1hdsI=;
 b=zUX+UrK1OK4OIZhfx3SAOblXFkOaHm76jat/MTs/+aaxQSFAz7vo8cjgWXb/hLa3oKPZFxSDZZm6aRphqqKsD3TpLz5tQYfzG2gQXfAGeUuN2a9YQn575rVQ5jFHE2avpcBbvcM++CjeHNomvSUXYx1tBIoWo+SjbVBqdEFaxxjj97aIGkjsaXuAfqcCyqi5Fm6bxqh4zCmrE2HYMoEHcPizsN+ba6Iz+iWBQP5/Eeu/dHDp44yDSNc2vi/PPh912w8gSVlQmLSXoGubCpkx1aKSyEY3EI5p9wC/YyH2TN6JSW8ily46cbJuhjN4aOdvuNGN7sAj8jLhQPSTrsEwrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=bootlin.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATord8/6XNhaaeV5Rb56VV6ou8+GaNajYJHeBo1hdsI=;
 b=z4QIrvisx85ipDSptQXWy9g7glNYtfbInzR4X9sgTpE/H0ZKYHeC6LV2v/YuNaahPNfGZFN9bWsNpVJDddfAtAKQxSWDGu0W6MdkqpU53T1f1tiEsZfMRr1uFLLtBnRlXR2si1MhO6zXorP4TVxlg23x/EDONsJwMr8WkQQJN+Y=
Received: from BN0PR02CA0059.namprd02.prod.outlook.com (2603:10b6:408:e5::34)
 by PH3PPF96A9137F8.namprd19.prod.outlook.com (2603:10b6:518:1::c3d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.42; Mon, 9 Jun
 2025 11:58:04 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::da) by BN0PR02CA0059.outlook.office365.com
 (2603:10b6:408:e5::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Mon,
 9 Jun 2025 11:57:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 11:57:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 19A9D406541;
	Mon,  9 Jun 2025 11:57:01 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F1A1B82024A;
	Mon,  9 Jun 2025 11:57:00 +0000 (UTC)
Message-ID: <4f046bec-4a73-40d0-9f9d-0cab56b3ea9e@opensource.cirrus.com>
Date: Mon, 9 Jun 2025 12:57:00 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: cirrus: madera-core: Use
 devm_pinctrl_register_mappings()
To: Thomas Richard <thomas.richard@bootlin.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250609-pinctrl-madera-devm-pinctrl-register-mappings-v1-1-ba2c2822cf6c@bootlin.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250609-pinctrl-madera-devm-pinctrl-register-mappings-v1-1-ba2c2822cf6c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|PH3PPF96A9137F8:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f721bac-a12e-4715-c7fb-08dda74cbf24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|34020700016|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXNmNVlOb3M0S1dCQVExNW13OWxHNFd2VGFrbVlwZWc3S1BtL3J1aHdTVXZK?=
 =?utf-8?B?b2VPTDRveWl1TnZXSXJHVUtTUWxHdk9qbTBOb3JUQlNJVVBhWjRrM3FYdzBH?=
 =?utf-8?B?MHBPdkJOS3U3YXI2UmRzNFlXTWJGT0Nydm9qZzl3ZGZDbjdHTkliS2dReGZV?=
 =?utf-8?B?ajJtaWI3VlgrTHpsdnZySXoxR1pocWY0enRHdm0rVE01b3BYcjhLbEhuKzJR?=
 =?utf-8?B?WC9GMkRzZ0NQMlNaNDBwR0JXd3l0enZ1WWZLajJmVnRCUnVRWjBFcFRzU3dw?=
 =?utf-8?B?bVRhRWg0eS9UaE5jSTdrMkdrSWw1MkpZTGtjek1ONFR2WmVpOTk2S200VVRM?=
 =?utf-8?B?T0ttcHRYQ3pvOTIwVEVEbjYxSkFoaDBHc1RhdHlLczB0UXNQOVpOeTgxRU4z?=
 =?utf-8?B?cFZrUUtySkdzNEFzc1kxc2RrQ3FrS0pNS1ZrWFluc0RpaUY2SDZGT3U4aCtT?=
 =?utf-8?B?c3VTUHRzdkJ2VkJ3bjFmUFlwY1o0YUVmTW5DZEhycnptSmNuNVpnOC96REpm?=
 =?utf-8?B?Vy9OckJaUXJJckhRbEN5SE1sTmthNktwSDAyeFdYNG43bXlMb3lvejBQQUhN?=
 =?utf-8?B?Y0g4U1NObjRFVnExVWhlelN5cllJcVUzVXBJdFFrcWFkYU9Fb21pZmprVC9I?=
 =?utf-8?B?a2NrbDA2UXZvdS93eVZMZFpwUitwNTA0bGxZaENmajhCblozNVNNK0pjZmdY?=
 =?utf-8?B?V05oL0JEY1dnRTJnbnNqVy80Z2h1UGpJd25oMVU5UXlYaHhhV3c1ZWNWdWVJ?=
 =?utf-8?B?ZXlPT2xxT09DTXRBMVJuZ1ltU0h3Wm1PelBuNHBJenVlN3hKNXloVzdjT2tU?=
 =?utf-8?B?MnFpcGNzZG12NU1TZEcvbGFyeGpNZ2xpUUxpWm1tN0hsZFk4VzJha3ZLZmxn?=
 =?utf-8?B?RStOQkc5ZmozZHo2SC9yTnBTbitQd0tYazN3WEU1dGRSQStzZGVURjdwbnRk?=
 =?utf-8?B?NUtJN2hzdVBtL3ZRN2NJKzBMVFM1UU53TU1YN0ZUTTgrNzBQbHpHMHMzbkE3?=
 =?utf-8?B?NlNKOTUzaEFJSTQ3b0t3VSs4WVVSdkVJSzhiczFEbW96MUJobU1NeFUrMTlt?=
 =?utf-8?B?aDBBOWlDTVVVc2RkZzBXZDdMUEdYUHV1cVNWMEs4UTBjalVuaEhkQ3dMMjlC?=
 =?utf-8?B?NjZNeVIvK3BXcjNzcFJUdnV1cGRVZHplNWlWTHZFTHdWWWpxa0NBQnIwWUN0?=
 =?utf-8?B?Y2RvYWdCM01QenNjVWtwcWx6N1ZzNFZaODE0YzFTTk5mK25aeFp1cW53NUdq?=
 =?utf-8?B?NVZPd2UzV1V0ejBHZVNxdnkwblkwR2grRkUwb3JrQzRSVmhuaVZUZGsvR2M0?=
 =?utf-8?B?MmszbjI1dlYrc1cybzRiWXppRFFqTVNxY29ySGpxTkJzTERPVURXeEhVaFkw?=
 =?utf-8?B?cGx1bEwrc1EzdXdxVHIyOVZHNUVzMHF4aHE0a3p6U2hSZ0tsSG5Wemp6OUxl?=
 =?utf-8?B?QVBvZ1VoV29uaGpNL3hXWnYrMUszOFp6dGFiTkVrNXFkMjZ6L1hMVmlRbFlG?=
 =?utf-8?B?MElTOHJITjNFT3hSdG4rYWJDTEVuVnk5WkYyaVpBbmNWbHNuQmliaHEzQ25o?=
 =?utf-8?B?UkRFdEZmMFh4UXZmSGo5Z3ZsTlpvaE8yNTk4TXZnc1BoaWp1VjlzL3dXV3Mz?=
 =?utf-8?B?Ym1qSjFHRjU3NlNMS0NTc1lkS0VORWp1ZDVUeXZmaGttRGNYM1NyNVB2c3lW?=
 =?utf-8?B?eDhCL1I0ckdnRWlKTlk5NTd2TXNJZXpPU2xWZ01Yei9WeEtjSXBKbTdhdnNo?=
 =?utf-8?B?RTA5bmZvdjB4M1pZYXpONFQ3U1BsZ2grMW5Qcy8wM1E2bUFJZkozeW5jOW15?=
 =?utf-8?B?ZDhmOTk3R2xja3A3U2VscGpyLzlyTlRseU54eFR0WTQrL2phM1VZZWpaOGR1?=
 =?utf-8?B?TEJWOURJVDZBTWN4S2dRalo4Ykl4a1RYOEFtaGJjR1NNZjVNbjM1QVVkd0pt?=
 =?utf-8?B?UTVZNTJPdDRXcG1xOHkxenBGaStEbXlqa2p6TkpIYjZtb0lRdFVQaUdYWlJU?=
 =?utf-8?B?ZkRRZnJNdXhFRUJCYXNHYm9VTEZtcW8wU3F4L2dFNC9YRzBld0NIMEtPZERG?=
 =?utf-8?Q?1n4dXu?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(34020700016)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 11:57:02.0618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f721bac-a12e-4715-c7fb-08dda74cbf24
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF96A9137F8
X-Authority-Analysis: v=2.4 cv=Jfq8rVKV c=1 sm=1 tr=0 ts=6846cc50 cx=c_pps a=dBTsQuOS/+lY8TR7GNd4mg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=P-IC7800AAAA:8 a=w1d2syhTAAAA:8 a=omrlzGe4tN78mTyd88QA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MSBTYWx0ZWRfXwlmRXJm4mucv VDOk54V4ZtUmMg0vAMlXJ4nskUME+cYsxYYZC1+HSdLbUKAqajD3a7kRX91deWGI7mwYoeUi4Pc 3IGcNpqUucqxHWL2jModMl9As493cKVJDAoTA9R9rjuvx9V7/d/s/3gFzUJfj6uTb5iPLvLmfZz
 mJBpKp3+jVyay06kWSVJ+RKJpZ2uRSfCKgVj64bzpvUDCcokdKWd/K1dKgKWdiLQO22ATwgZq0+ HknQtp2wx2d57pAz3MpdKdLyBqmtnbTFk3n/gg9g7NR4d0i+HHcmhyuSJ74acPgmyRMmaA6OVA/ ow3vOu6f/tuoNrDxNWyoREM0Peu/dZBTf/0gOVgJBA9MGPuA+8VzSLav4pNJTfPuP6pLCPqYKWr
 yF9nvP3u/Slcxl2uhilcCjdo+27eS2bXIuO3AAv5sR1CLBiryrzble9k4mNEvzZwEy/As5gj
X-Proofpoint-ORIG-GUID: 0DalfHro-zdSKeWGckMZWF05vR6rCrLp
X-Proofpoint-GUID: 0DalfHro-zdSKeWGckMZWF05vR6rCrLp
X-Proofpoint-Spam-Reason: safe

On 09/06/2025 12:51 pm, Thomas Richard wrote:
> Use devm_pinctrl_register_mappings(), so the mappings are automatically
> unregistered by the core. If pinctrl_enable() failed during the probe,
> pinctrl_mappings were not freed. Now it is done by the core.
> 
> Fixes: 218d72a77b0b ("pinctrl: madera: Add driver for Cirrus Logic Madera codecs")
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>


Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

