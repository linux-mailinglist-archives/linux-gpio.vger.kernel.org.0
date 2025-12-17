Return-Path: <linux-gpio+bounces-29678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2724BCC74BA
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 12:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E10E83033AAD
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 11:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C849627CB04;
	Wed, 17 Dec 2025 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mp0HuW+V";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZrTDeowK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C26246781;
	Wed, 17 Dec 2025 11:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765970225; cv=fail; b=E56daMrxYr1LEHwpsXoivDUoImho6OTdgmlVxgUKL21s9x4t0xwqJ6z9WUoLIXtnoPRkWQNgBkn5Jkvf4PDIVHK3w2tQJQCtnnJwBKdw280vLNFcHGppuXPgJRP5AOV4c2PVQyfGiaTT1CsoS1uvKLRmsOeWQ2XP+KPXQBf2K0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765970225; c=relaxed/simple;
	bh=3DUdxRcdwdvNP/gnsi+B2olb2kczSkAsZFeTbJK9rBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sm6kLNotkpLQ2DFvGsMQ/h40FBS17woet6fNhqKVO0/czTKklankQQdHsS/htGydKe4PQS1nG7kcPi6y80qFwLztdTLo/zHlnGn12iS2WHtnD3eDwH4uSWcdYK2VYmUrM5GAqLXPGVdnBY7DmPHS8jqx4cbQbL4OiyaN+Gfvb+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mp0HuW+V; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZrTDeowK; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4PGC43077319;
	Wed, 17 Dec 2025 05:16:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=QOjkK62VK62XxRCb8W
	RHV2/oCDLaYvwcG38/gv+U+IM=; b=mp0HuW+VGf+NVDKdlLQjJjx7B7ZHfz2jjd
	hObd2QmW0eMM2IvjliJCMq7jgAhV0QPzqRxKm6TdVn+/hLXlM6VuiCFNUgVUdcqr
	R/H/oXOjwshBsTKT47LtsVOAsyGbZnAJc0Eh6Gkbo/MIwF3al/L6FLZ+A012VmAR
	PN/W7Zw3m2tgs24yw1hTqkya/A+o1b2xUg2bGzI7IrKcPWrBcxuuIexcdbJb0txM
	QH5E1kfoyHG8/QoXi7uDAc0SrIKn//2xAOrTTbsBbgcr+tL8ChFgre48GbN7aPuY
	Z7RCVOCHV5D7jXwVSmszkTUqvox4eU3ikBWhCFdF2kj9L7jYuYgQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020088.outbound.protection.outlook.com [40.93.198.88])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b15ejcqny-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:16:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWZmMgIFqB3RH9NObqgPe49UruKl69T6raihvEuPfQRsufB6ZPgSfazRTBrebGuAVxgR5qGsxXvOw0mDIPFqdBUuxlt6id77oNIm3qfrvxhIqBhQN7dG1J4zP3wgyu+4KRntYUtDdwy4EHtxQRK5G6DCY6K4xFYMDazWUxgU1zXzJi21jpgJ6SixglJx+35U3BzS/GG0RK/7IPdjJsoyXDqcFDa/oaQAn42wZ7/aw6rj8KOMak8hwBjZe07jrgPLBR4iRIlE61OFwSaqCh05UpdS9tnc4uM5qDUNMqYuk1cWeXg/V76z3GjeCVMHknr18XJKYXLidJj3U/4HShmm7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOjkK62VK62XxRCb8WRHV2/oCDLaYvwcG38/gv+U+IM=;
 b=hPWt+DF6/qZfE1+jNl9g2ElBsdK8OESWVn2hWXQo3ZOBUMNR30qOqXEUEKDTMBGMghqwmwnEG+N/5ooI8umTJ229ZsPPk3I8FzNMVOSyFgmjyMcxlbBpMvfty87Q5xfC184Qemf1456OHB4uGEHRsM3HWExfesziTANf5cBGisgbmKmK0A2YQ5WRKC9yt4dmed8WXTl2NF39awi65if0lcBMPMeC3PUJcUqrX/+yZPtFVgTyxum2MH731izN2bi+51mHOBDK8fPH8VX1yi/btusmNYX1WiE79xgaqiIL3ilavuCmj+0tPqdqf6gVHv1m8W6nCQHCUAMD/3s2DmM7sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOjkK62VK62XxRCb8WRHV2/oCDLaYvwcG38/gv+U+IM=;
 b=ZrTDeowKuekzQ+OXawL+ZFnl4WJEVCozSaODaY6Sbe1jQY4HUg+onwVpbzGtb3NPakrTAniWnWQaXyFkFwGSxGogvzYInQVlTJkKOupVeDoWc5fqCRRJJETUcJn1tTnltqAKPlklmnKLzPUOIT0GC5u25CZIxElxeUU28dV8UnM=
Received: from SJ0PR03CA0261.namprd03.prod.outlook.com (2603:10b6:a03:3a0::26)
 by MW3PR19MB4315.namprd19.prod.outlook.com (2603:10b6:303:44::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 11:16:51 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::8d) by SJ0PR03CA0261.outlook.office365.com
 (2603:10b6:a03:3a0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 11:16:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Wed, 17 Dec 2025 11:16:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2E3ED406540;
	Wed, 17 Dec 2025 11:16:49 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 10DBB820247;
	Wed, 17 Dec 2025 11:16:49 +0000 (UTC)
Date: Wed, 17 Dec 2025 11:16:47 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: swnode: compare the "undefined" swnode by its
 address, not name
Message-ID: <aUKRH4aT9saY9avJ@opensource.cirrus.com>
References: <20251215154624.67099-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215154624.67099-1-bartosz.golaszewski@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|MW3PR19MB4315:EE_
X-MS-Office365-Filtering-Correlation-Id: 5029516e-1a0f-4cb2-fa5f-08de3d5dc6cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S8IAhpeCIBjHsUlfyp134mJ1cLFxjPDZGBnFJVJw4Cq8uaD+7R41MD1CpHBk?=
 =?us-ascii?Q?4+0maEBDPy+5CL0wIjVI06161dd42+c1AbsZVqC3BK7XVk6acr9GFoiXYFi3?=
 =?us-ascii?Q?NXej1i7OO3d/77lOnCwYoqEATZzw4PINHqxOI+Qle4k91xVJxAg8Y5wmouQh?=
 =?us-ascii?Q?KtyWEcOg7JD/gLfENfkT5bKG1o8u48TgBVXYzOe5wPoUCSXSO1TPvxp0yBuv?=
 =?us-ascii?Q?8R79k/UMhCpC2i/v1LGlLHnkDo2hXjV9X2ekFHHUaHsoOGGOaXkT8JXZakwj?=
 =?us-ascii?Q?D7Qq1D3H9fGoIjVUGZwPqpvz6SW6+qBW1ZeSPjlazYsN/a2ZIh8SzQvbt/Hb?=
 =?us-ascii?Q?4xYvDXOwwSev4eJ9Rld32zJoNkG5jE1nrw1L7dBgS2fAgP3Z0wtr/Q/+wd8T?=
 =?us-ascii?Q?jTSd0/QBgBd68HhlFHzQXfmFdt2lDnhJbFiYZjHYlQ7oAEJpfohLvn+ejuy6?=
 =?us-ascii?Q?HOkkHcAzuj0SBlv0/EzogWd6bynryCuyFlnKbaqDCjSo+tfHV0vYcVcv4As+?=
 =?us-ascii?Q?UrGKfKPuFHCOQ9MCThCwXHBthSIFPfgE0b6bEfqgfqlJhvP7XMn0viqz4UaG?=
 =?us-ascii?Q?++9Wcvg+wSbR52UPMp3tDsANB2JgmhX0MATcbpjx39Y0muEYWfjvO/BFZIgx?=
 =?us-ascii?Q?bCI5leMb6J8YrXza1ckp1WlQAK5zZH0yrzOg0N8q42kvbZ+GvRQQumOnuwpK?=
 =?us-ascii?Q?ztvY5po3MVRxh4GbjN0OBs6TFNCzVMbzLiVAjfb16mhCknffWLCUOuj2WcBP?=
 =?us-ascii?Q?bANwwV7cWxwoWya8X8NP1izi2ICz1NgjTdK06UXy/kYfg5AtQYEFuy6lnmMN?=
 =?us-ascii?Q?R0f3BaouPriGGKJQ5QIBhRxYZ9GUQIVeLaQzE0AzqKBbCvXXQ7C5ZQ4E7sT0?=
 =?us-ascii?Q?HcDSL0EolHIUgMjR0kZPOI/zUdMtEv+HUtzNqQej4yNA/Swf6ab0hCFyo+Bz?=
 =?us-ascii?Q?rhkSQvTJaJm+wwWpFghuokrjTdZrF77zXlGExgoPZntwM0BrDIN3pBZCkrN6?=
 =?us-ascii?Q?b81jDgXZSB+cbiAFl+vqrmszoUfZ1t//18F+t6SSF/092sDSGPGwRQLvXtOI?=
 =?us-ascii?Q?rIA5XZUgyVmgDjbc/8dk7m0l6TfG09LGc3F5CRIwdt1oRK54wNty4ux8JCdu?=
 =?us-ascii?Q?B2G7LvJ1MrDu7GBj6jyev4jOlDmiuatw6gPFLtIb8Fp5XaCc8e5rUlhyFTni?=
 =?us-ascii?Q?Nm5+scwJclwW9LGuqFOQKGy8AXCoByZa6Jwy3SWMD8qvOOe6/0T6dWsDwZAB?=
 =?us-ascii?Q?pJKg5ySpD96PG2K86RKKTihEDcDz/lDZ5JxFK6IUj9S4DwyfbNlfC/tGT3vi?=
 =?us-ascii?Q?DLwqmHKxP410Lxss3oPwHU841/ov6S3YDfXwsLPoLFoT6R0Tib5dQvgMQDAu?=
 =?us-ascii?Q?mPZhbl3I5w0GK0VusVn0BINoTMYxH9G0cBeMALDCfz2R/kF9y0ISQAvxfFMl?=
 =?us-ascii?Q?+zR7etOsCk639+NZicaXqXl9tMkRbbqlUA/MT4j2FRY1shPx7BYRImAtEO9M?=
 =?us-ascii?Q?fGJcxvT+J0ddnbwEpD7IMyY6OYrMjK/AJRXq6vxgne1cb+P9mgyd+Hag3wXY?=
 =?us-ascii?Q?C6GJU0TwOdcVEPxvS6o=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 11:16:50.6528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5029516e-1a0f-4cb2-fa5f-08de3d5dc6cf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4315
X-Authority-Analysis: v=2.4 cv=ZZUQ98VA c=1 sm=1 tr=0 ts=69429127 cx=c_pps
 a=B4HvfKsIdAoZ9ZdT5gFWvw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8
 a=yiCsVvNatFuNo99BfHcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4OSBTYWx0ZWRfX7qiTLS6/datt
 L9MNjoBnKepjlW7I4Z/XSyC4l9YEVO2M890aSJJ5sFgfPbY7aCvCyYhd6a43pNeX/Nfo/Xpug2F
 bNPE4DIotZQAEABLgLqWR4EtDwrKB9R1iTqFTtCkSKfQTn6qgNvxo3ilfxM4FjkI6MoP0vj1rZ5
 GMzDFFETtDJ7Lg6tVuwWQFT6HO3WTs/tc2TA4PQPXUUuiuSp4C4E/HQ4M3+s1qKjaaBB8TeemLN
 lwfWLQjyUsiWJMFgGrsZLRgD/F3TvQDhXZaW9GMVnOeaXl41OJaH7wsH2FYZSi4mjlkhszjwKXa
 WtmJ2Mx3XMkzyMofSwzuvm6R6p8eBwJwUdfzf87CgmbjhVu+D4w5qePQxj3KBUik+9FwSHKzD7B
 jaiWZNxKavdutGs1++DF8QsdbG94aw==
X-Proofpoint-ORIG-GUID: a0Vl5LwOO9Dt3v_iw5SpBma2aTya_SUm
X-Proofpoint-GUID: a0Vl5LwOO9Dt3v_iw5SpBma2aTya_SUm
X-Proofpoint-Spam-Reason: safe

On Mon, Dec 15, 2025 at 04:46:24PM +0100, Bartosz Golaszewski wrote:
> We know the address of the underlying remote software node referenced by
> the GPIO property (if it is a software node). We don't need to compare
> its name, we can compare its address which is more precise anyway.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

