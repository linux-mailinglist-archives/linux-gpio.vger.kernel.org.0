Return-Path: <linux-gpio+bounces-30844-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOLSHoy5cGmWZQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30844-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:33:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB965560D7
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2319194C801
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 11:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CBF3D6476;
	Wed, 21 Jan 2026 11:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmGMiqZF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5JE7+E7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAFA32C925
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 11:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993684; cv=none; b=WwUUlfN/nTQTg90fAJjD+6AZUzAxGOXVWnqOBIFzi2/qH1yUEZc++CUUPjckQcj9gU8pm2ztQ/yP60iOOlBmak7+20BWmxd0aCBCARPdDDn2SgMnIH8guHWsOfzGBRbXnqVo78RuhTrNYq11YxyVvNqMYbcZBjKV+a+u+Hlf9Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993684; c=relaxed/simple;
	bh=KDeP/t5EXFpOaIWGjlox3DEQ5bzq+q1jhuHzDo3/b9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtXsaNtY29aT3uOBiVd93GbsStNXriRHbygqa9WF6Ma9xzGacDZzhJLVzv3YXOfr2zTMX9esk+c6BK1hwnStUVYjixReB27KKBLpCZ03EUIcFTDi+P+OeuH9wUjNuAAJ+y6T6fOD+3SPIyw4p63BLyhfgZGlAq4aCset7hzpU+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KmGMiqZF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5JE7+E7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L6XRGj2938614
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 11:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+G4eN6UdjrFQfu6AHLdiQ8ljqUfV5jUwh6aCPXLQphQ=; b=KmGMiqZFbNbxPydB
	K5BSDoOcplFKzjqk/CJd2ssGgiPMW2kQIYnRjUc8QdWsZz8M7cwjQ//wCydKew/r
	xd5ERMrPQLRYfMSvgClQzgQO70MKnI5OtdwFTf4rblHnJaTc2AyaRx4YrGB77DfX
	LHxllVsBIv93BIsBTKyY0w8SLcPgnq/P5rsaTgjHPjTBKWU/D36/yzE1n02HdiqM
	/7lwNhS9zhkdaWmhSV4Q6PdaJFDVUqsDMMz1czBlnOWvxUpaRez93GwK25wwM53U
	Q9I2Rmv3WNCXsRzBNSWBzC4N2lwj5JThK/dqAoVSfYP+HqPL4j9SSayHbzNdCAkC
	81DxpA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btsmu95b4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 11:08:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81c765b9b03so839033b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 03:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768993681; x=1769598481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+G4eN6UdjrFQfu6AHLdiQ8ljqUfV5jUwh6aCPXLQphQ=;
        b=P5JE7+E70ug0nv1XXhFOKRCezV0AXViUJr8kanKFGxA9zOrreDIIZyl7tz71kYpnu6
         5ZK1zrp2V8OA9JyPCYEKWV7DBtauz3aOfC56N6WClQ72bQ5pV78+bC2ShtvIeAfzY+aI
         PSVVHffqOQVXIGw2DPl0Btn25M3Bg41INdaPcYzRYw7FOTqJDsENj6h866NC3ywVLXX1
         anghA7Xq89ScfP2icQgZxFEHuCxRB3gxcZWFHxQcyuGcp07MVoMDjkThSArDYCPMG3Ud
         3dQyuH0pEBDbqEILmnV8QfyORSRButvy7A07eMW5mfoS+6Vbucue37Cf57gQW8s0LfHb
         jY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768993681; x=1769598481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+G4eN6UdjrFQfu6AHLdiQ8ljqUfV5jUwh6aCPXLQphQ=;
        b=GFOa34OK9NWjp1ggDNVwRqerDSjyI+iGGN+F3mV0HNXktKL17B33f/lNXNlom3K/Jc
         EmcTwDFaWz5TEGbkJfClmBLRQksZVxR7XgMo/H+JXyAcn5/LiSXkPFmXuBEBBBSjZzl4
         f7liEDy9v/BGirBfx8LP9AIws6QoGzvKQVKcEtc4MeQSZI7ADH+qT+RdTJsxYTBg0EWf
         y5F2lf0mDTpTVBlFdCjHDyMcUw62JQhxViTZOxesub494fVu6h5RlhPPNnjNhapeoT+b
         nx+7Z5AwkHr6p0PU+ydyGaVikeokmPEK9PG0ZplyQEEaN0GOZxtHoootDLO+Yvn4+UhZ
         Rm7w==
X-Forwarded-Encrypted: i=1; AJvYcCXwznmZOuCrDuHQzMiqGEpi4m8X0qp/+C7XwX2OgVCvJf/dZTqYy1okCJm+fvbq47ZgXbp6FVcBz80o@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ekStH8ElZCdPV53ZgusOF9oBGLqIsKD2j/YTBd+5gQ0GUSh0
	CPdLz5q5Xqr5w7nwiE9jBdjBA07rKbkkaQSSnY5neIEzwHO4dtSW8GDlltH4a6E0pCbhUNzqlsp
	T6ptkNdxt3e5TKQ3wxKNvqANx7gtKK5Iyqts5niL7bewGbzl9Jdi1dxy9GWEteb9K
X-Gm-Gg: AZuq6aKLRGwcKADU8x/CnB2bSWf51fDDzDcMRiOLMFfe6r1BgCsK2mcNzFxNCYwBsGZ
	6uPndj1sHwvlh3yi41nlHzeEh/SyN8jdwu8WVRYJUjwfp6Ak3n3m08+yWJ9JCwkWQKuif558kdw
	Cg0c4TmjAGBmPD79p2rhmdkIQDV1qCF73MAC8ewzyctP+GxMTu8yHAizOvUC5M8R9Kd0JF0C3RA
	2Rjl00hGR0gUrkjxTstd0iG9CpTGnLYU89++mPbm41FJo3p4e2lUD2S208eWQbDHxROxV76Xn5+
	Cu58ENpKEVRV+yNVEiRMbvLVgmI6oAmBNRM5n7hIyLdVt68PXrzG8Y+BiFzuR7gk9QuOR3tqoA2
	XVHUwaR/F2MeM/NF6voxaTBonnPSx8nF2YRE=
X-Received: by 2002:a05:6a00:4105:b0:7e8:3fcb:bc41 with SMTP id d2e1a72fcca58-81fa06fb8a9mr13511451b3a.22.1768993681188;
        Wed, 21 Jan 2026 03:08:01 -0800 (PST)
X-Received: by 2002:a05:6a00:4105:b0:7e8:3fcb:bc41 with SMTP id d2e1a72fcca58-81fa06fb8a9mr13511421b3a.22.1768993680644;
        Wed, 21 Jan 2026 03:08:00 -0800 (PST)
Received: from [10.219.50.64] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa1278061sm14881313b3a.44.2026.01.21.03.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 03:08:00 -0800 (PST)
Message-ID: <1fb6fe78-c71a-4658-b396-f48fa4a4b7f7@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 16:37:55 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: shared: propagate configuration to pinctrl
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohs@qti.qualcomm.com>,
        Ravi Hothi <raviravi@qti.qualcomm.com>
References: <20260120154913.61991-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <20260120154913.61991-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OaiVzxTY c=1 sm=1 tr=0 ts=6970b392 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4gj4I00feunHHkNmgvUA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 2DRuwzsxm_kbRd7y11WROGYvqJApM_Kp
X-Proofpoint-ORIG-GUID: 2DRuwzsxm_kbRd7y11WROGYvqJApM_Kp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5MyBTYWx0ZWRfXybnPUYOxYvMs
 3y5CVM00sqWMMrK33dW2FjVxxVNe21OHWwRDlEl7cxWSjA3jT8XmB+U+gDKrYt+U9cEBWuZs0zc
 q1V4NtyxxyqHs2KX9CWjWR2C85A7gqZlllFxli3ytH0Umu1Og9ufTviSjPNXG1WWXwY3UoQvcJB
 xByo82VYMb6TxrLZ/NxOBmS3EgIpAcUjcFYxSG1mch3DPQMIKqx2m1aSE8UoWrQNdvkBTjPMrLW
 7kax2X56h8krU8Jjdr9CHhiZ/BhfAFCQGpHtop8R7wqRMpyzsKc13GkKbyR143WEytgZmjgwZ/2
 MMM01pO+2dqBZHZ1qoTrHtTb0E/uuvC5mWnjk5dvY0R8y+KW7WopiU2RmhPqEngW0Hrqer8rkmZ
 AnXdSTy1ViTxSJo1P76qkRdmKWrzugFbtha3LIZgClsyl7vaBGfwbvhtNgy9JWkIvpXlA2qieg3
 0GekT9nbG165mo7FjUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210093
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30844-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB965560D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/20/2026 9:19 PM, Bartosz Golaszewski wrote:
> Just toggling the descriptor's "requested" flag is not enough. We need
> to properly request it in order to potentially propagate any
> configuration to pinctrl via the .request() callback.
> 
> We must not take the reference to the device at this point (the device
> is not ready but we're also requesting the device's own descriptor) so
> make the _commit() variants of request and free functions available to
> GPIO core in order to use them instead of their regular counterparts.
> 
> This fixes an audio issue reported on one of the Qualcomm platforms.

Thanks for the patch, Issue got fixed now.
Tested-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Regards,
Ravi Hothi

> 
> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>   drivers/gpio/gpiolib-shared.c | 16 +++++++++++-----
>   drivers/gpio/gpiolib.c        |  4 ++--
>   drivers/gpio/gpiolib.h        |  2 ++
>   3 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index 17343fdc9758..9e6544203439 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
> @@ -515,7 +515,7 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
>   {
>   	struct gpio_shared_entry *entry;
>   	struct gpio_shared_ref *ref;
> -	unsigned long *flags;
> +	struct gpio_desc *desc;
>   	int ret;
>   
>   	list_for_each_entry(entry, &gpio_shared_list, list) {
> @@ -543,15 +543,17 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
>   		if (list_count_nodes(&entry->refs) <= 1)
>   			continue;
>   
> -		flags = &gdev->descs[entry->offset].flags;
> +		desc = &gdev->descs[entry->offset];
>   
> -		__set_bit(GPIOD_FLAG_SHARED, flags);
> +		__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
>   		/*
>   		 * Shared GPIOs are not requested via the normal path. Make
>   		 * them inaccessible to anyone even before we register the
>   		 * chip.
>   		 */
> -		__set_bit(GPIOD_FLAG_REQUESTED, flags);
> +		ret = gpiod_request_commit(desc, "shared");
> +		if (ret)
> +			return ret;
>   
>   		pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
>   			 entry->offset, gpio_device_get_label(gdev));
> @@ -562,8 +564,10 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
>   				 ref->con_id ?: "(none)");
>   
>   			ret = gpio_shared_make_adev(gdev, entry, ref);
> -			if (ret)
> +			if (ret) {
> +				gpiod_free_commit(desc);
>   				return ret;
> +			}
>   		}
>   	}
>   
> @@ -579,6 +583,8 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
>   		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
>   			continue;
>   
> +		gpiod_free_commit(&gdev->descs[entry->offset]);
> +
>   		list_for_each_entry(ref, &entry->refs, list) {
>   			guard(mutex)(&ref->lock);
>   
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index fe2d107b0a84..1578cf3a8c74 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2453,7 +2453,7 @@ EXPORT_SYMBOL_GPL(gpiochip_remove_pin_ranges);
>    * on each other, and help provide better diagnostics in debugfs.
>    * They're called even less than the "set direction" calls.
>    */
> -static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
> +int gpiod_request_commit(struct gpio_desc *desc, const char *label)
>   {
>   	unsigned int offset;
>   	int ret;
> @@ -2515,7 +2515,7 @@ int gpiod_request(struct gpio_desc *desc, const char *label)
>   	return ret;
>   }
>   
> -static void gpiod_free_commit(struct gpio_desc *desc)
> +void gpiod_free_commit(struct gpio_desc *desc)
>   {
>   	unsigned long flags;
>   
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index 77f6f2936dc2..3abb90385829 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -244,7 +244,9 @@ DEFINE_CLASS(gpio_chip_guard,
>   	     struct gpio_desc *desc)
>   
>   int gpiod_request(struct gpio_desc *desc, const char *label);
> +int gpiod_request_commit(struct gpio_desc *desc, const char *label);
>   void gpiod_free(struct gpio_desc *desc);
> +void gpiod_free_commit(struct gpio_desc *desc);
>   
>   static inline int gpiod_request_user(struct gpio_desc *desc, const char *label)
>   {


