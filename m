Return-Path: <linux-gpio+bounces-16343-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 595C5A3EB4D
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 04:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCFC516ADC2
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 03:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD74C1D5CD4;
	Fri, 21 Feb 2025 03:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ledSbhvb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C0B3594E;
	Fri, 21 Feb 2025 03:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740108404; cv=none; b=AsiwKlh3cv4xEA0IccyKIOMMnVP85n6iyQHLIbvT4IBpiOaeUtH3pe6p4pEZyQ1j3p89qw1+E7RUQDz0lSmd0zF+bK7Iapl0YLzhcTNxZ4htGwcaKegI6OI2ahzJdPODDPp5tz5slBBi87K2MNI+nJLQCqhE5WjcktGPUPM5HM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740108404; c=relaxed/simple;
	bh=qAOiPfmApqMC1NgVsH2IeoP4cIG1AS0ltxSHCj2b09s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gfZMkdwNCoOhICk2cpRArYtkgqefGGAPPn5jSfqRUGc/9LUPLPA+ZfsPpgY1lsl8xSdLTAAwG/qObvUtq5S+EdXj87w13gmjitEgtRoBLHPoO/8UqALSl2EE8V8hi2ZL0b0U5P1iHiwcI8rMfqJpunx8cgMouMQTKB7pkv/NoUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ledSbhvb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KH6qph020394;
	Fri, 21 Feb 2025 03:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qnGks312UIXQbcCA/LnWeosHrFelHP5H0n6awHbZFzg=; b=ledSbhvbJ5FgNv8O
	w5MLphY0pTa6zZxjKzAtsheCwHkFZ1wZv/ikzkmn0SjIOes+MbRjqg7hCJ/J2HnE
	nUK1LJWD8n4EnB3cUbFiSrpuwOAp1ZdfVUEs06yvI+5UMKjen9+w3zHic1Kcrg0W
	PduA2/hKYVTVwV3z2LZEGucDJM3agv0pC52i8zsTZ2leLFwRQfsA944P+mSa66pI
	aH5QoCzCwhtbm2mCzMqWkUGDiZrMpa1WvLf+LC+ejv1m4cr5h/Agg2deROxKFsqD
	MJDvLU5NX37Qoj/r3x9vsAYYyhPo9CSIWh/s5iARNc5qkD3nKypWEBw9bvGIRtcE
	EDuTXQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x06t2yc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 03:26:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L3QX2w023444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 03:26:33 GMT
Received: from [10.133.33.29] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 19:26:31 -0800
Message-ID: <19a43125-8daf-4b81-9b4e-ab85c7090988@quicinc.com>
Date: Fri, 21 Feb 2025 11:26:29 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] devres: Move devm_*_action*() APIs to devres.h
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
 <20250220162238.2738038-2-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Zijun Hu <quic_zijuhu@quicinc.com>
In-Reply-To: <20250220162238.2738038-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0xw1OGVdQphIFg-zLHv_ITVnl7_0LLxE
X-Proofpoint-GUID: 0xw1OGVdQphIFg-zLHv_ITVnl7_0LLxE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1011 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 mlxlogscore=926 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210022

On 2/21/2025 12:20 AM, Andy Shevchenko wrote:
> We have a newly created header linux/device/devres.h that gathers
> device managed APIs, so users won't need to include entire device.h
> for only these ones. Move devm_*_action*() APIs to devres.h as well.
> 
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/device.h        | 38 ----------------------------------
>  include/linux/device/devres.h | 39 +++++++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+), 38 deletions(-)
> 
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 78ca7fd0e625..d6341a05e4fb 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -281,44 +281,6 @@ int __must_check device_create_bin_file(struct device *dev,
>  void device_remove_bin_file(struct device *dev,
>  			    const struct bin_attribute *attr);
>  
> -/* allows to add/remove a custom action to devres stack */
> -int devm_remove_action_nowarn(struct device *dev, void (*action)(void *), void *data);
> -
> -/**
> - * devm_remove_action() - removes previously added custom action
> - * @dev: Device that owns the action
> - * @action: Function implementing the action
> - * @data: Pointer to data passed to @action implementation
> - *
> - * Removes instance of @action previously added by devm_add_action().
> - * Both action and data should match one of the existing entries.
> - */
> -static inline
> -void devm_remove_action(struct device *dev, void (*action)(void *), void *data)
> -{
> -	WARN_ON(devm_remove_action_nowarn(dev, action, data));
> -}
> -
> -void devm_release_action(struct device *dev, void (*action)(void *), void *data);
> -
> -int __devm_add_action(struct device *dev, void (*action)(void *), void *data, const char *name);
> -#define devm_add_action(dev, action, data) \
> -	__devm_add_action(dev, action, data, #action)
> -
> -static inline int __devm_add_action_or_reset(struct device *dev, void (*action)(void *),
> -					     void *data, const char *name)
> -{
> -	int ret;
> -
> -	ret = __devm_add_action(dev, action, data, name);
> -	if (ret)
> -		action(data);
> -
> -	return ret;
> -}
> -#define devm_add_action_or_reset(dev, action, data) \
> -	__devm_add_action_or_reset(dev, action, data, #action)
> -
>  /**
>   * devm_alloc_percpu - Resource-managed alloc_percpu
>   * @dev: Device to allocate per-cpu memory for
> diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
> index 9b49f9915850..9cd1787ef28e 100644
> --- a/include/linux/device/devres.h
> +++ b/include/linux/device/devres.h
> @@ -8,6 +8,7 @@
>  #include <linux/overflow.h>
>  #include <linux/stdarg.h>
>  #include <linux/types.h>
> +#include <asm/bug.h>
>  
>  struct device;
>  struct device_node;
> @@ -126,4 +127,42 @@ void __iomem *devm_of_iomap(struct device *dev, struct device_node *node, int in
>  
>  #endif
>  
> +/* allows to add/remove a custom action to devres stack */
> +int devm_remove_action_nowarn(struct device *dev, void (*action)(void *), void *data);
> +
> +/**
> + * devm_remove_action() - removes previously added custom action
> + * @dev: Device that owns the action
> + * @action: Function implementing the action
> + * @data: Pointer to data passed to @action implementation
> + *
> + * Removes instance of @action previously added by devm_add_action().
> + * Both action and data should match one of the existing entries.
> + */
> +static inline
> +void devm_remove_action(struct device *dev, void (*action)(void *), void *data)
> +{
> +	WARN_ON(devm_remove_action_nowarn(dev, action, data));
> +}
> +
> +void devm_release_action(struct device *dev, void (*action)(void *), void *data);
> +
> +int __devm_add_action(struct device *dev, void (*action)(void *), void *data, const char *name);
> +#define devm_add_action(dev, action, data) \
> +	__devm_add_action(dev, action, data, #action)
> +
> +static inline int __devm_add_action_or_reset(struct device *dev, void (*action)(void *),
> +					     void *data, const char *name)
> +{
> +	int ret;
> +
> +	ret = __devm_add_action(dev, action, data, name);
> +	if (ret)
> +		action(data);
> +
> +	return ret;
> +}
> +#define devm_add_action_or_reset(dev, action, data) \
> +	__devm_add_action_or_reset(dev, action, data, #action)
> +
>  #endif /* _DEVICE_DEVRES_H_ */

Reviewed-by: Zijun Hu <quic_zijuhu@quicinc.com>

