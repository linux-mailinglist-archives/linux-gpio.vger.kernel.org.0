Return-Path: <linux-gpio+bounces-26311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 932FAB833D6
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 09:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0F113A6A8F
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 07:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494362E3AF2;
	Thu, 18 Sep 2025 07:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FD0ZzwnZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489B32E54D7
	for <linux-gpio@vger.kernel.org>; Thu, 18 Sep 2025 07:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758178809; cv=none; b=NkemCNWWiwZbkIQ8XZP7QKgIu21f5e4NYwO6vIqhRoZdRQ9+yLJDJYZnRrQjKNy9B6Oungi+cpw3MMznGb6bs4iqTYyfdwP6WmvB1w78Yppr7xP/SlZLRlL6XhmCdLms7lQ2reIRCConor3F8RBJrkR/jbVUmorUBELRtL6Do2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758178809; c=relaxed/simple;
	bh=dMPBMjcsgn8U8Ns064JVZeWP50Bq8MfymrupfdTqn3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TmPrK8UqD64gzV1LsGcvDH9ivH5mGD5S+oNAKoBjSWEusMIUjeFgo7o0KIWsEjyGZenOLI1WF6FzkVFi9s26aQ1rhENmmyNxUXuOgWAV4kjbyOfPYVc/2QYwEtILVoAYqgIfw4fMjFHVthEH9E2uBq95a39FaemjfhtQda0Rs9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FD0ZzwnZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I6qCD0027040
	for <linux-gpio@vger.kernel.org>; Thu, 18 Sep 2025 07:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbWfmH/pC1nkCgbZSoU/uA31VLtZW7O3InnzSnNVGIE=; b=FD0ZzwnZ9FI5tSH5
	60sE1dFrl1ZPrFfJ5uI7jRgaHHl0uWXeRIY+wI0MxAVQ66fP4cGwJKZjyFeMFRtN
	xB3CDjO6ztTxOWvhK91CiNK9sq0Xtmo0VxWIfJ0Wg194uTKKZsPlXUqtBQUo4GdM
	dcRuMVQGJmySLA1vQvDdrFcFzvJQ+xUFQaubCSCTxF8sMiQsi0zGXuZdMMPgeFyr
	ETj4ZRllZguijOkmDS13EQIgYqeI8EB1NbRVA0EiZKntcIGv3KYF8aqaVqK64wmG
	MyeW2srrKdt7Kc/sKP04VmubzDI7zgCN7AXalJx1vgLW6Btj0Wzx3iKjdHi+2Nv6
	0QE3EA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1jb88m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 18 Sep 2025 07:00:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32e0b001505so617870a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Sep 2025 00:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758178802; x=1758783602;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kbWfmH/pC1nkCgbZSoU/uA31VLtZW7O3InnzSnNVGIE=;
        b=dsTRs2dJetQLVjnnsHLONqJzC4esc8dUGtoZ0xO10nEyCbk4EYBda9F77N7yyVr2Bm
         r/moOCQG8UTHFyjHv3yMfzY60B0lpN5eZF2egAq0Pztzo03u0UkZ8wJAxehPsmYcxUpf
         DlO0nVRdRpfPp3mKb9WhKsnAbZDCMc85eRihMvSMGX3OWW3anEWlShZGd4ZIzy6yyE+y
         3dgVMV3/dheMKwXXge43DBi4kJ6MZwXOlV1kM7bA4WNtA41Yd+1FNC+V078H1O9BP2B2
         lF1PrTx+PpYFggAIl03/rivSlpUB3T+x+mLtSmfRauEl3sSgaZSjkrTgDNgrQ9ROudni
         m75A==
X-Forwarded-Encrypted: i=1; AJvYcCXVe+t5ck9l9jrPfh+pGvCqFLBOIdaShqSCcI9B9pNQf85UfwwEWciJLA1HZNm/3HSZu24VknSCgPyF@vger.kernel.org
X-Gm-Message-State: AOJu0YwsV1p2XzwFmkDr6G7lhTGUhIG0quftIMEE/WYqVaJwmyu6yNsv
	/0kbtITdFodAJ8GVdgDEEUsQtS7sQTK6aYsxT2eB+uT0ZhHwYszKgasOToJCtVGqtSpC81Gtq6t
	bxL637yEfGnJuQM4fnyTmel84YCzOTNL+06L03Kb93C2bxUqqCpLb86Bhqpki5E1z
X-Gm-Gg: ASbGnctbmEzUqFXyuTsTCsxx/h9g8LMjPw1p2UyC6KB8/vr4rmDPnL3jFY+KyZStp7D
	4xNksmd2ApnJdHfPPEKBuoonAl5bdTT4UQRvYlNlDup7xLjwdUcbN88SOgZH0sv/gyPXzHr4Twx
	7PksQjZGbpA0lEwn5G4lTMLJOZUXvKASHZIu1+6fjRNJvDDq1Kkrgwyrzd9dMZmXsb63q9Gmy0O
	63GZ3qkjUlel2JigGRnTnGEQ//8mKbU4dmdBqd3j4CTMfJsGLFtXrK6y+zbSu2yGjhF3sxKQ2fU
	kKVvQdEipDBqut1fia+mXtCJrFLwsd0cZWPpKhpU0tOmld3aWrY98ENkQJBWoU6eO2twHRdBFsF
	iDHugovldQoPnv3EGHyudgNLnu/gOw8xlfOcB
X-Received: by 2002:a17:90b:3c8c:b0:32e:3f93:69e2 with SMTP id 98e67ed59e1d1-32ee3ef0806mr5833896a91.13.1758178801461;
        Thu, 18 Sep 2025 00:00:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqOU3X6jq0DY1ti5vQYDwFxJTrFdx2WWG+GVUcFRyYIyCcd6DpTKmCSc0wqBeP9DA1iegvZA==
X-Received: by 2002:a17:90b:3c8c:b0:32e:3f93:69e2 with SMTP id 98e67ed59e1d1-32ee3ef0806mr5833868a91.13.1758178800933;
        Thu, 18 Sep 2025 00:00:00 -0700 (PDT)
Received: from [10.133.33.30] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-330607f0deasm1526418a91.23.2025.09.17.23.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 00:00:00 -0700 (PDT)
Message-ID: <e01fd1ed-0b7e-442c-9524-3248a9cb32cf@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 14:59:54 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/21] ath10k: remove gpio number assignment
To: Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-17-arnd@kernel.org>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250808151822.536879-17-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: V5zReCwIOgAoEpgy7-JpshX7JumN-o3N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfX3ZHrTXu9qRON
 v9MBrvgpX6wlaOn3PuMwwtGmVV+rPT7WuIqOolI14mTP3HoPnWJYTapeFA9ttc9lm7xaBB+zRYn
 +2nfm6L7FDufmFDtlZ+mumuEc1sRVxKpLyXyXVQOlEchsdgtWPwzYC9pe60kVv37l984bEd8cva
 j9leKRZvuvdmX0XVmp6+IKkE2EEBFznadKaz+1jYkCSiE0P6RtntBUfhSeadOUxZjZ10fJ69UsW
 80+M+0Yj6necdKnWgdUmX3ltzZTbW/9HIybvpezu0ovNrUS2oeXlQenHhF6MyChR6fbyPIcmRMy
 pc18fAa7PeZTvvV0t3DRiFrYu9O+Vaylc/JoDtEYOjiBUXHkjvUDFixycS68N5UjGl5Le+CLhqV
 o2GvjWtE
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cbadf2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=uLrbQztoRsBK_tCdPC4A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: V5zReCwIOgAoEpgy7-JpshX7JumN-o3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110



On 8/8/2025 11:18 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The leds-gpio traditionally takes a global gpio number in its platform
> data, but the number assigned here is not actually such a number but
> only meant to be used internally to this driver.
> 
> As part of the kernel-wide cleanup of the old gpiolib interfaces, the
> 'gpio' number field is going away, so to keep ath10k building, move
> the assignment into a private structure instead.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/net/wireless/ath/ath10k/leds.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/leds.c b/drivers/net/wireless/ath/ath10k/leds.c
> index 9b1d04eb4265..3a6c8111e7c6 100644
> --- a/drivers/net/wireless/ath/ath10k/leds.c
> +++ b/drivers/net/wireless/ath/ath10k/leds.c
> @@ -27,7 +27,7 @@ static int ath10k_leds_set_brightness_blocking(struct led_classdev *led_cdev,
>  		goto out;
>  
>  	ar->leds.gpio_state_pin = (brightness != LED_OFF) ^ led->active_low;
> -	ath10k_wmi_gpio_output(ar, led->gpio, ar->leds.gpio_state_pin);
> +	ath10k_wmi_gpio_output(ar, ar->hw_params.led_pin, ar->leds.gpio_state_pin);
>  
>  out:
>  	mutex_unlock(&ar->conf_mutex);
> @@ -64,7 +64,6 @@ int ath10k_leds_register(struct ath10k *ar)
>  	snprintf(ar->leds.label, sizeof(ar->leds.label), "ath10k-%s",
>  		 wiphy_name(ar->hw->wiphy));
>  	ar->leds.wifi_led.active_low = 1;
> -	ar->leds.wifi_led.gpio = ar->hw_params.led_pin;
>  	ar->leds.wifi_led.name = ar->leds.label;
>  	ar->leds.wifi_led.default_state = LEDS_GPIO_DEFSTATE_KEEP;
>  

With 'wifi:' tag added ...

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


