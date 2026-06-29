Return-Path: <linux-gpio+bounces-39162-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id slB0JpLGQmrNBQoAu9opvQ
	(envelope-from <linux-gpio+bounces-39162-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 21:25:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD5C6DE47E
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 21:25:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=proofpoint-05-2026 header.b=ORhZvys7;
	dkim=pass header.d=ti.com header.s=selector1 header.b=CIWoeAP5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39162-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39162-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ti.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CF26303B6D1
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 19:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D902B39BFEC;
	Mon, 29 Jun 2026 19:23:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106C42F2910;
	Mon, 29 Jun 2026 19:23:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782761012; cv=fail; b=FsriUdcE0vX4YHKsLoeNmq5rtfRxJnQ18SfSJLRFhWdh1tLO2MsUMgmd3A9EOSoNtu4ktLzDtXauTr8iUMfDbQjO+gGOq8rjlprpmDg9sVhzvZ4po9DJZLWuZ6eil7L6rGjnNPL65WY8+rwBCi3xmTlRzk9wk9PgCOtYc5X4Lng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782761012; c=relaxed/simple;
	bh=gG2g2wB/aUVmrOo8IxKxBH4eadub4L+W9YoLek/Ws5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rASZdDBBZVXghX+oscoc2N64UXjoJAcnJxzmU11lyP6BgzHsrQupDu1Ucl+sEEnWVIGsFdwEVo+mhhW7G5WVMMscTpjPG1/dohOFwew1xoaIIj007gqCTviRu9WL0SeFDe/gbGp6XgLZTwwWRsQyTMcMIxvNAHUHf0ZznxbuLzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ORhZvys7; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CIWoeAP5; arc=fail smtp.client-ip=148.163.154.28
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGUYe32586203;
	Mon, 29 Jun 2026 14:22:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=P2M+NFbb++Gdaj59nBS/zBDMrRNFwbwOfvOgkWjRr
	Kk=; b=ORhZvys75io3BN0R8dkFtTVglb5TBsy5fGVTJDPS3GRYHpVtxhR57Fd33
	o9ksC8JoFEgkjIR/Epvd89Je6KrRjEf2iGrj9ysTpGa7s6KE8dHHn0AEH6i+ctPL
	YbYgS3DhiU/S2zwJ6STWn9xk8dBbzNLXw/B4emgvJayaWTY8cj0sDI4NZgnhL1tu
	QG3HJST1DyKBaGMXCmijevrn9IAYyf/TB95gDoRgs19D6MN8TotaIfr4BiiRcfYb
	bgx3oCUc7SjCFCrogP4TexWCdnE6qKSK5iBdi8rYywwNWKrxaboqH/6sxpBa0FSd
	L/kXMDvZn0bm96/WqdOIqK2Ykjqhg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012050.outbound.protection.outlook.com [40.107.200.50])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f3qngv03u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 14:22:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LR6aWVZQV85Pk5GlJxLjabCwfX30hNgsCbyFW5yQhPPSr1eEsmxYdclPel4jSLFa1r+xGulmYT4c923QfkxRMHjxRvxv5sTxphfkC9MfBxsxtZVxOnonM+iSZ8P9iz237YB4Ecn7Jbmz+m5t8/usAMYVsVzVyuzeoK6LboFgSK2LWeDP6HOuMloh4ITYPwVeH0vC+6p49UqE0WEfvCQzq1spjhmJnxJDCBewfoLk5SmaVtxmLAkdHCqknvUEL/1eIk5zOxiIKKFqOTTGdA3KZPXOaGmDjxoDEAIJ2AS/BnIpGa0d0XcKjJR48MDaHDJA+RRo52E+MDF1Ilvlq0duwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2M+NFbb++Gdaj59nBS/zBDMrRNFwbwOfvOgkWjRrKk=;
 b=xwN8gOzRqy6VHfxh+FqPPvNmHommsjMV2CZRqAhC/mKQjIRIvfXC+ILWLsYgCfeAsdGdbJoWaIJSTH94qw+yLkZItZRuzIgBJvCAy2DmfVgaeSpDhtWNTlnoF5gUdyh6tjvA6EYy5dKEon99cmm0kc9XHXva4+BB2GZ6sZaxl1U9eE6j/shacI31FfI61JZeS/YHpVWODsplxoTLTUNATfnkb6xd+6hGDPzBcsSfoFiHgyVd7bJiVdMsX7K7aK05lpSP0mLLfBH3YhBuKCggz97DmbVIxNhGpHC5nv9AUu1wWcdAy/ppe4uCjqqSwBYiVoAjsE+maDM15Sgl6IoROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2M+NFbb++Gdaj59nBS/zBDMrRNFwbwOfvOgkWjRrKk=;
 b=CIWoeAP504hki7bjifNK2GoeOdsez9s8zJ+dj2TisAqMt9F1GIZHyJSqCKkoo778cBwQZoRsS4Mbj/3ewgbTcSmdc2VYHkGppKvlpKa8Hn/6f0go59e+m/DT2hMiOk9nHFc37MZCCUjGoFV56mqQm04NIyB0icGDejL3pofBqQA=
Received: from BY3PR03CA0004.namprd03.prod.outlook.com (2603:10b6:a03:39a::9)
 by SA3PR10MB7023.namprd10.prod.outlook.com (2603:10b6:806:313::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 29 Jun
 2026 19:22:49 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::39) by BY3PR03CA0004.outlook.office365.com
 (2603:10b6:a03:39a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 19:22:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 19:22:48 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 14:22:46 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 14:22:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 14:22:46 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TJMjax1281256;
	Mon, 29 Jun 2026 14:22:45 -0500
Message-ID: <937d1b6f-b22e-482e-8f15-2be757d5446e@ti.com>
Date: Mon, 29 Jun 2026 14:22:46 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>,
        Linus Walleij
	<linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Frank
 Li" <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Pengutronix Kernel Team
	<kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Shenwei Wang
	<shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
        "b-padhi@ti.com"
	<b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-5-shenwei.wang@oss.nxp.com>
 <655ef1d6-08fd-43a9-8507-c2d478c058d8@ti.com>
 <DB8PR04MB712990DF9806BBCF36B1076DC8E82@DB8PR04MB7129.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <DB8PR04MB712990DF9806BBCF36B1076DC8E82@DB8PR04MB7129.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|SA3PR10MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: a4315091-f505-4319-38bc-08ded613ce72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|7416014|82310400026|921020|4143699003|6133799003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EmTYphdIYRHxhmtIj8HtIWpGcUsLnWd0tjQbQevm9dE1xdgaCZRgXf8gA5VkavVmvuDzropRMlyEdG/FYqwNRs7BfBtzHwh299bC3EdvSPmuyUsK6+deUZCuwCN8zrRrtQS6/hI/CA4txjCH6j5VC3ycNLsxIHBgtdvLydJ3WPVBFT1oyBc+pcR1KlqeCkov13S13RG1K9NRa3SGebSjJ7Tkc9uybRXogvWAWU/3Zxi1ujAGkxtuXiLd037LbVtWhC6JeM2MelSGCUfc0vofezfyP7QSmVfcwPRVdWmYSzbdwmri0AKk8Q0bltuyYh3cUmj9GPgbpK0uAYxxIMIu6hut2kwPaUg0Lz41nml5DqdlFVK31k8okZdAxrZx/WX5o+3t2562Ykquj8HT1lXxxsQlCR6LFU3MX0AqJseAgAgcflSeCbJFZJoLCnpOyqHJpEEFLM78RWq5gJzT3mVa/XraqRdjYrgtp03yUIufzIIot3caVAe7ah79U+n5hOzE3Rj2I6B6z733GBW3Lahpny7/7gcf0YCEQLXoivs7o5Pw78D2oTvJsnCR3KyHaDjD+W5NWGjCZJgLAwQxiM+p7Pe/Wf1GvynWp7WwQc5s9vqxsjmZfF5d78XY52m2WljfqUjTXinu6CfRvc0m5N8Hrhs2K1RnirtbU9vNjaDibg5d/Dg7NF3QtuQkEJtSc6dVxMD4pxLt/uLHb5GsABvP0iDkWutR5SuKgaF531rf3g6PLOSUzoOREcbp3ehjzsYj
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(7416014)(82310400026)(921020)(4143699003)(6133799003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BcVpsZQpSKJ4dZcvPy2uk/0SH3/CQ8VwngWFFN5ICURUg73CVCaubCsqdzS4n/ndYwuPIhv8zxoiGIbaZ9DVZWHN/+w88k1Vq+kuB3oP7KuY5qXgB4KpbNE4I56doQBRGy8IqOBOcfFW/I6JnrIvKukL+lFplCKIuEdDazHuPP69PnCKqXwQJ3HUWF293C3fKxXzfUiI9lXodwHsk9Wu3O/my6yndBb8LSvUmgbug8ivvIjWKXtJw1wNsvInRzyodW29JKUiqIABnqTsjgaalpHrbSd+6ZpsTbhZlB6/z54RYNFPy+TpDDJJF3QXgnyBn7T3i0za3Q/1k5DCQuARMTsy0cUzmvfp+om2qwR+rlGHQO2KSmEBSH/iZ7SHR+rgmZtKg2Kb0YS5XOvv4zOy5dbSy10gTnKh21xYwe12IKUk8l+tL8J7d+PcvZrSaqDj
X-Exchange-RoutingPolicyChecked:
	cLROsqcQLDiNOJvA6SKy1z6Z1HEWuZdvw3U6tl4Ql8jX8ouadyg5qMJsGjVs6SrX++SLADWOLJpOKKB3uqW/DmnsBgMxzNeuvTUnrMlBXbTQ16E94oScZoQZeYKMLF8MeWn83jef9K+HyFVF5yvzV+PngW361wJBMyB0H5rnTy4ZqfX1PDp+a13jOjQU7yEdvmEIwWoTGnOn6ewZ9BGq14EBdumJYFs+BKvght5ekqFfOHzmJDTPaLaYWqt5+/a6jTMc/BEkqTCIVIFENHRmbyRcrgQEj87LXmXTcR7gmUGA9ZdW6TGnxTGnGub+KwgvJhiiPkbDj+XqXkm8xosVkg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 19:22:48.8085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4315091-f505-4319-38bc-08ded613ce72
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7023
X-Authority-Analysis: v=2.4 cv=Yow/gYYX c=1 sm=1 tr=0 ts=6a42c60d cx=c_pps
 a=ZVLNonFp53krOPJecICuKg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=8AirrxEcAAAA:8 a=71ooK9dmu9BjJZXyPH4A:9 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: fTUIoVzMDj31EUkZc9UBhuSqnrnVMbvj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE2MiBTYWx0ZWRfX75E9k+S4QSEn
 IAF6syPQXmZiqDjVlG/0LTurkBrkjESd5c2xUU8nRTNFLsQ3PZqGH1WGUN41n0nUZ7GJNxIZPON
 tcG43Tr8OI+sMX0QPZd7rr348F4cLUID+VKOTjBnJjOZ1a/RnpnLv/R86p5Jag7FGyP/XzeUL50
 9CfzwWeXx4nk5H9KD6IDdu+HclXkWqOhq57vNmprJ1rz1TbWMmBvmedr7jKt95z1uQJXG2vEglG
 A5CSSZeHLHIp3JVyxXmbKN4Hlnu2ov8zaYpEHsWHZOCqlDpaMXb2y249Pwl7Mm4Z0JGnkF7nco/
 dI1FhVRbG83QySGuS9WV47RurChUpJo57jVm2mRuZpxsjZVQWiO/w+3IHFERiPPGMPF1ZcXsCr2
 WE1wajKR6PjZWZap9M8ixrcQJVhA/D7qyE5pO5ceYRZGtkP3DEbvlMOrAZ8pzhr8siGG4IUGbkZ
 jMcx1iKLoBXn0+ggrQA==
X-Proofpoint-GUID: fTUIoVzMDj31EUkZc9UBhuSqnrnVMbvj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE2MiBTYWx0ZWRfXwvEdhPCPmyvy
 Bz54P/pbvlvAond8nAW5J/BIPPYbuxAW2fWt+GFY+SALrqFMlcEXjisfgDwac7YEXavPjLC9Cza
 K5DVCnycJjQ07iShk1kwombDMadPvcU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290162
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=proofpoint-05-2026,ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39162-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shenwei.wang@oss.nxp.com,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:frank.li@nxp.com,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shenwei.wang@nxp.com,m:peng.fan@nxp.com,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-imx@nxp.com,m:arnaud.pouliquen@foss.st.com,m:b-padhi@ti.com,m:andrew@lunn.ch,m:brgl@bgdev.pl,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[afd@ti.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com,ti.com,lunn.ch,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[afd@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FD5C6DE47E

On 6/29/26 1:26 PM, Shenwei Wang (OSS) wrote:
> 
> 
>> -----Original Message-----
>> From: Andrew Davis <afd@ti.com>
>> Sent: Thursday, June 25, 2026 3:32 PM
> 
> ...
>> Subject: Re: [PATCH v14 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
>>> +       Say yes here to support the generic GPIO functions over the RPMSG
>>> +       bus. Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x, and
>>> +       i.MX9x.
>>
>> The support would depend on if the right firmware is loaded/running on the given
>> remote core. Also if you want to make this generic, then any vendor should be
>> able to make a firmware that implements this protocol and make use of this
>> driver.
>> Suggest dropping this NXP specific device list.
>>
> 
> Agree.
> 
>>> +
>>> +       If unsure, say N.
>>> +
>>> +endmenu
>>> +
>>>    menu "SPI GPIO expanders"
>>>        depends on SPI_MASTER
>>>
>>> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile index
>>> b267598b517d..ee75c0e65b8b 100644
>>> --- a/drivers/gpio/Makefile
>>> +++ b/drivers/gpio/Makefile
>>> @@ -157,6 +157,7 @@ obj-$(CONFIG_GPIO_RDC321X)                += gpio-
> 
> ...
>>> +
>>> +static int rpmsg_gpio_channel_probe(struct rpmsg_device *rpdev) {
>>> +     struct device *dev = &rpdev->dev;
>>> +     struct device_node *np;
>>> +     const char *rproc_name;
>>> +     int idx;
>>> +
>>> +     idx = rpmsg_get_gpio_index(rpdev->id.name, CHAN_NAME_PREFIX);
>>> +     if (idx < 0)
>>> +             return -EINVAL;
>>> +
>>> +     if (!dev->of_node) {
>>> +             np = rpmsg_get_channel_ofnode(rpdev, GPIO_COMPAT_STR, idx);
>>> +             if (!np)
>>> +                     return -ENODEV;
>>
>> This seems to imply that DT nodes are required. RPMSG is a discoverable bus
>> with a nameservice that can bind/probe new devices. While then optionally
>> binding to a DT node when available so sub-devices can be described in DT is fine,
>> I don't see why it should be required.
>>
> 
> First, a GPIO node typically acts as a provider for other devices.

Not necessarily, there is a userspace API for interacting with GPIOs.
And there are ways to get/attach GPIO lines to other devices without DT.

> Second, by requiring a DT node, we can ensure that only explicitly enabled GPIO resources are managed and accessible.

Not sure I follow here, you have a firmware that provides GPIOs to Linux,
Linux should register those with the GPIO framework. Not sure why DT
is required to be involved. Some systems don't do DT, but they have
firmware and GPIOs.

I'm not saying if the system does use DT and has a node specifically
for this firmware/gpio then we shouldn't bind to that and use it,
just questioning making that "required".

Andrew

> 
>>> +static struct rpmsg_driver rpmsg_gpio_channel_client = {
>>> +     .callback       = rpmsg_gpio_channel_callback,
>>> +     .id_table       = rpmsg_gpio_channel_id_table,
>>> +     .probe          = rpmsg_gpio_channel_probe,
>>> +     .drv            = {
>>> +             .name   = KBUILD_MODNAME,
>>> +             .of_match_table = rpmsg_gpio_dt_ids,
>>
>> Does this line actually do anything anymore? Maybe it did when this was a
>> platform_driver, but this is a rpmsg_driver and will probe though .id_table
>> matches.
>>
> 
> Yes, it can be removed because the driver will find the dt node on its own.
> 
> Thanks,
> Shenwei
> 
>> Andrew
>>
>>> +     },
>>> +};
>>> +module_rpmsg_driver(rpmsg_gpio_channel_client);
>>> +
>>> +MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
>>> +MODULE_DESCRIPTION("generic rpmsg gpio driver");
>>> +MODULE_LICENSE("GPL");
>>
> 


