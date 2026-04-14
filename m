Return-Path: <linux-gpio+bounces-35134-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMd/KS3/3WkRmAkAu9opvQ
	(envelope-from <linux-gpio+bounces-35134-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 10:47:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CE73F7812
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 10:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EFED302710D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 08:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C5B3B6BEB;
	Tue, 14 Apr 2026 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3CwwvwC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKXYo83y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB3C3AC0EB
	for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2026 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776156306; cv=none; b=nw8m/ImVrmmd9Y48rTaZVx6ykmEo1JSt32sDbnYirdgdiTI9mdXbmuEhHsubvQl05gWxSil2LcOVRNh+LPu/R/vetAZ07V1oKqEGi43cCsiJOZZIOF4UwLJ79boe9ZliIors3PYAlLhlx2oFBToduEq1RQev8jCyg2SVVUnFTi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776156306; c=relaxed/simple;
	bh=HTEX90PfXymgMT//DFg1G4w6F5SOGPZeb6W9LFpW2Tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f21qVz17etda7wN6Wy4x5cMEw7wdOpSInwP82FmOcaLTEXcogKfd/8BKBEy7JS1lql89bDvEOOF39tNypGOc85jseZ2iMrUPqIhMh6ESXCzA6n/3C9grGIIc227RVhTKdU1cwkcz1h6W6O7V8LbQxwET4xq7GWMv6F/EE3jV5uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3CwwvwC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKXYo83y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6KUOA2633626
	for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2026 08:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+zwomaoPZB2k9QUwyaY7hnwguNk8gPY4TrD/qvJv59A=; b=J3CwwvwCpKE4oefW
	NkZ34IsFxzXSbpwq0Y0A2CtUAOF4e+1mORZZGz80hE2PD9eDfI2Jmt/LLpOLRxGM
	8OMOtcpcMqUsb7ZufWxFIOBWkR0cvVrWC54y8/Vr9BMT3e/Vf34/mRz8tNQ/30tK
	coPSi6kXh/bkyLbFo6VdWXoNe4kyN6ZsRTPLs7pc98FVEzNYbJbMLNkhgiDPGppK
	YLcM5ibC5zTK9ILRX0tHya2D0WMluwt2sBJXQSAzsbBdNNBkWnQSmHgYj3Hn3K4B
	jB2DcF603DaZiRLyow0GsvbN3LEILsogTXVR+ybBf7TpsOUEEQqaBOuaD4/xjjF2
	CyPqog==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86c9ut2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2026 08:45:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aa9fe6b6bcso9698246d6.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2026 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776156303; x=1776761103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+zwomaoPZB2k9QUwyaY7hnwguNk8gPY4TrD/qvJv59A=;
        b=EKXYo83y0Q5HbeeGu2mlH1nvURYuoP8iPiKlNz4C0lFVd0Udz9+wQrh6uINfFpziLj
         PNxvuMACDcSLDah1Eboi6C938/x0W7CL6JVDvN0Z/ZJbcqfsxTSn4DNNVre8mL/eWClI
         TEjZ2v9wt+NRE329yvRPkTocxuGiG8thD4dSTHXhZ5LP4R5coCEuWCAR49OK/VKgK3L9
         Acbvy0i0TS6wPyB0II6NzAckkmOmv9mkIe73wUzWQOV71VNa77uAaBqR93odWVzJ4ujU
         aRibYVCaDp+DfWvF1e4oPaWa3bgP7ogxlXs/ml/nORCdPu9b2SiLZWLHRnqj6MRv/vYu
         +oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776156303; x=1776761103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zwomaoPZB2k9QUwyaY7hnwguNk8gPY4TrD/qvJv59A=;
        b=IYanvJWGCBtknNOYQjPCnEdNqIFqzcckjNfv9YoxB8aZa90U/3c8AsgdQa0yIn4aJw
         xbyYMJDct/twJJA9DduWXG0zQGUMSUb6b83dmjFfKm0BIL5bjOGbxiz0bo8e6nRAhE6o
         FsZucV4Jduw9A3BQCcOyDIaDBnZQOddWrOorqqHhWuiEScF8J1+m9VjAHDM9a4UBxUO6
         ZaKZ6rSor60JCj+/dKzh74y6Tam06ag2R+zKre6CSo1WZsaGE8q33nNRID/6JODR/7au
         eGflDmf4gaZR81QZOAyyuw7FXQzmncccEelZMvtxiY/lpn9J4UVo4VUfO0x5YnKFsjOm
         MKaQ==
X-Forwarded-Encrypted: i=1; AFNElJ91QYi7eI84RbjuOayzh1lKQs1m+DTAl9Yx0klBmV0mChaderxkGRJw+lzot0kBYDRTG/ojJb33UYQ7@vger.kernel.org
X-Gm-Message-State: AOJu0YwEblxmhE35Fg4h6SPozEE3TgjxPMRMDwuy8pDeI4ylzk6HAHBv
	pY8XioxkB9SOnJ3PQwbK9jJRnEvsfOxSTbN/rAxiB8OIoifpTKTNv9SQG622R8aPzRVT6RvhJw2
	+Qv1sRKikj7pZdMQjnyVoiqObaB08KYBsPP2Vs6nhabP0eQxxdCORAQdfs3zej6/1
X-Gm-Gg: AeBDies78hZOr2FeslwYiFkLSAkIYxeIq3NrRcxh6/o3V7g+QwXN1p51tucPtWq2Xnf
	1+JfqgzaICmewSR79bzJY0OQgFZiiNhbVb9TiYwue1ei9yoR7rbs28RRMdZ7lYyv+jz9eqUyhFQ
	Nx33c1IEzG5TZn18TyEZVYip558tShEjiBUNhTHt1eode9LuMmZkvbr/kQamfxpZLGuj/0b+7Ta
	cyRu+z7gtINkZ1jZBrh4MCXEhlf+fJYpcNEt/bvDVAWe1f/ogDwdL8KIE/y29mZk3zQfDXLBUHl
	A7FHjnK3WSZpBjal/RG/Yd2cjyBXiaAasPCWjMNO4xWH8EtGGYDJiEtMeF9e1/Zp4JklkplBH39
	GrOiQZITTpLqeS0PcmsSY6I9iAMqji/6QUXZ866U+tZbaKmx6qdexlDP6o6IdNSVuopEjaGxDS8
	dmLNAvvKwlur7ERQ==
X-Received: by 2002:a05:6214:4e15:b0:8ac:ac2f:c8b4 with SMTP id 6a1803df08f44-8acac2fce64mr87407136d6.0.1776156302922;
        Tue, 14 Apr 2026 01:45:02 -0700 (PDT)
X-Received: by 2002:a05:6214:4e15:b0:8ac:ac2f:c8b4 with SMTP id 6a1803df08f44-8acac2fce64mr87406916d6.0.1776156302412;
        Tue, 14 Apr 2026 01:45:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd77c2sm381252866b.24.2026.04.14.01.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:45:01 -0700 (PDT)
Message-ID: <dbbbd4f9-ab27-4568-a06b-5d982d54bb51@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:44:59 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] pinctrl: qcom: lpass-lpi: Resume clocks for GPIO
 access
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
 <20260413122233.375945-4-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413122233.375945-4-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vOeQ-ggl1Bb_FQGKNXhp_87wBQOak2Wd
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69ddfe8f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rVK_4phez1sAFflzw9YA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4MCBTYWx0ZWRfX/XYLXGfwc7E2
 N8/UFrVDXqtrGSfctOjWOA9D08VSbH++7sRJ1RFNvZ5Tt3mIhbaBNfRXQ7Qs/djdJvUNEwdgv2L
 iEOLUGluN5SWzkig4RxMu9/XQL0OFljZD1g0T1TBh1EkZu9fOFDDVImS8J2Ug8PF0s5o7gFyEO9
 WZFhrgNELZSkEVhyC9pjPKVqzIfsweBrnCnyXhKtssJLvCOTOUoSNUmDXJDZ0r0/+l7/73wQsbO
 BF5RgZpXqMNIfEh1Ia9Jgn7Wddgl2ppXyo6fW6AkT4yRGP/jwo9FajiNtjVT6RdzQjr0ZHKD6qT
 L4DpE1uw8jbJeXLK8NdaQxD2glq7S6tzRs/jUFaEV0MUUNqyHCYlFT8t/CFprAINQPV2Jedw07S
 sRnV/zpATWOPAeT68T47p6A3CVWLQORjkPACJ6dR89pgFfiBNxVZuZ7RgfM96bHMEhGHgDGVMsM
 ESYk74AdpuyRSd3yNaQ==
X-Proofpoint-GUID: vOeQ-ggl1Bb_FQGKNXhp_87wBQOak2Wd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35134-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F1CE73F7812
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 2:22 PM, Ajay Kumar Nandam wrote:
> Ensure the LPI pinctrl device clocks are runtime resumed
> before accessing GPIO registers and autosuspended after
> the access completes.
> 
> Guard GPIO register read and write helpers with synchronous
> runtime PM calls so the device is active during MMIO
> operations.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index d108e7321..4275f2734 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -49,8 +49,17 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>  	else
>  		pin_offset = LPI_TLMM_REG_OFFSET * pin;
>  
> +	ret = pm_runtime_get_sync(state->dev);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(state->dev);
> +		return ret;
> +	}

Okay that's how they can fail..

Please move from pm_runtime_get_sync() to pm_runtime_resume_and_get() or
someone will come around next week to "improve" it

> +
>  	*val = ioread32(state->tlmm_base + pin_offset + addr);
>  
> +	pm_runtime_mark_last_busy(state->dev);
> +	pm_runtime_put_autosuspend(state->dev);

put_autosuspend() already does mark_last_busy() nowadays

Konrad

