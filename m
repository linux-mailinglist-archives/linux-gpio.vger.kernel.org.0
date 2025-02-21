Return-Path: <linux-gpio+bounces-16344-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B84A3EB64
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 04:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F29ED3AB5A8
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 03:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1FA1CAA8F;
	Fri, 21 Feb 2025 03:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N7bACNBN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE9833CA;
	Fri, 21 Feb 2025 03:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740108892; cv=none; b=hDrQ2UBJzasPkq7WIyyAQtvhba/11/jT3mOUORHnd+1jiw6dTY+r3yHIz7RvQLTDVLaT3BLtjeucHYhluOP06iLJuWd5dzLhtFjsmGuRwytv38J98WTTwE6LymuzBH7Qr+PrgXG5U/tziMJYOGmD6NGrdSw+AFszKcYPYsv+bq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740108892; c=relaxed/simple;
	bh=/pTeCaq0rFXRNDbVH36KuArqLCGCPpbO27CrX8Gsocc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s7Q6gfgdywAvdc9Tt6IkLGg8UB54CD6Qhc2NcCGqJ8Zt+C3ZEk6HTLyoOeMaXkwHvK6399wEdXCbtSudDd2Ws2Z+PXyfLMHZDjASEzU+GhaHNAgnfZd7Ndkw4UI/jtjf1Z9q1Sc7N5X+0LJnm+E1gqQJRCPDFRCKdQpPq6Kq7K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N7bACNBN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KFZIeB031803;
	Fri, 21 Feb 2025 03:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRq9K0Ol51zWXo5Sj62pQYKTUBCarLLDQZa9UUTs1Iw=; b=N7bACNBNhw0hFzVO
	z/IVi9NFVXvhp9ScqPbrPoHHFTyT59i4S3EgG3XsfpouJelZ0lpxpSosvm7FDnpY
	qRLXgVKtR8EUyvFqRGDAZ7LlcBK+i3iwNUFckUBS1MZ7MEWhbh+sTXM6FSHOoKzu
	djx0j2iZ/nWgiI+5+n9em7IAQpnWKfzVqEJBKttpZ7AvBLlkU3UhJvqv3n5MUdBs
	8Vq9tQCn1qfgSPyPPdnZ9EMVgTa+ESGe5ELut/4N16AGsBrKJNSg/UGIERxgUt4e
	rRb+75ZxL+iW7gh1BKfltdK4Ge232Q9+RaeNJsjWldlc02OECBFcEQkGkyYNYXDk
	rBJUSQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy5g85t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 03:34:41 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L3YeEE031277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 03:34:40 GMT
Received: from [10.133.33.29] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 19:34:38 -0800
Message-ID: <cc426e67-106d-4b0f-b4ec-f8fbf089770e@quicinc.com>
Date: Fri, 21 Feb 2025 11:34:35 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] devres: Add devm_is_action_added() helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Raag Jadav <raag.jadav@intel.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich
	<dakr@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>
References: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
 <20250220162238.2738038-3-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Zijun Hu <quic_zijuhu@quicinc.com>
In-Reply-To: <20250220162238.2738038-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4ZDUdC2-YKjcmIQ_ixZkJecPf50ECIbx
X-Proofpoint-GUID: 4ZDUdC2-YKjcmIQ_ixZkJecPf50ECIbx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=925 spamscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210024

On 2/21/2025 12:20 AM, Andy Shevchenko wrote:
> In some code we would like to know if the action in device managed resources
> was added by devm_add_action() family of calls. Introduce a helper for that.
> 
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/base/devres.c         | 11 +++++++++++
>  include/linux/device/devres.h |  2 ++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/base/devres.c b/drivers/base/devres.c
> index 93e7779ef21e..7c2babfa9396 100644
> --- a/drivers/base/devres.c
> +++ b/drivers/base/devres.c
> @@ -749,6 +749,17 @@ int __devm_add_action(struct device *dev, void (*action)(void *), void *data, co
>  }
>  EXPORT_SYMBOL_GPL(__devm_add_action);
>  
> +bool devm_is_action_added(struct device *dev, void (*action)(void *), void *data)
> +{
> +	struct action_devres devres = {
> +		.data = data,
> +		.action = action,
> +	};
> +
> +	return devres_find(dev, devm_action_release, devm_action_match, &devres);
> +}
> +EXPORT_SYMBOL_GPL(devm_is_action_added);
> +
>  /**
>   * devm_remove_action_nowarn() - removes previously added custom action
>   * @dev: Device that owns the action
> diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
> index 9cd1787ef28e..ae696d10faff 100644
> --- a/include/linux/device/devres.h
> +++ b/include/linux/device/devres.h
> @@ -165,4 +165,6 @@ static inline int __devm_add_action_or_reset(struct device *dev, void (*action)(
>  #define devm_add_action_or_reset(dev, action, data) \
>  	__devm_add_action_or_reset(dev, action, data, #action)
>  
> +bool devm_is_action_added(struct device *dev, void (*action)(void *), void *data);
> +
>  #endif /* _DEVICE_DEVRES_H_ */

Reviewed-by: Zijun Hu <quic_zijuhu@quicinc.com>


