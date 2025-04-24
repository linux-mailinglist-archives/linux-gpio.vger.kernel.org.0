Return-Path: <linux-gpio+bounces-19288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B52A9B4D6
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 18:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B4F69C01C2
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 16:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5790928D83A;
	Thu, 24 Apr 2025 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5eG3B0W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845122820D8
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 16:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513909; cv=none; b=Px75/4Bnl9WUfUMR4RuuDPCKE63GkMusvxLBgLnrr0KhmGxCzJ9ZkykD6UIlEAz0PF/kSgBeh0YwHco7r61Yqc0iFRKYhUCLUSw+O7d/J+O5kwW5ZICkTZI3W1C9xkXB62QSIlYkmW8aBeet5yKUXriN7KDoqxstvfwJKuOCVHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513909; c=relaxed/simple;
	bh=lwIVb6Nui00ZfZD89j30bpJzTmw1n5wUZd7dfBimA3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F4lwjNWp9AJT87FVa+p6R/naY47TQ8VQrp/u9q+sDf2p4+//MJ1P1PXiSgvrC9jsqF+li/3QnF1hcjvPOFnzCa7iaPqbzx8FDx0xu4RgV69rBOCx6o8kK8UBwRwXJCuIE1r4Gf2+IoHhO/DmrQnnlqlK9vpKC4mcwTwOjm8wJhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5eG3B0W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3EGa011678
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 16:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/9+kJX3qmRmZ2snfGBmR0Ap3enazyk3U0iCrZ9pj2O0=; b=D5eG3B0W7PYD0ivr
	qKb2yY8BsGuY3MHBXVwGb2Z0wEw47W/X1Y+34no5gp71saWSt3Pe0LUVaQT8oDQL
	UbGeSxee79uaV5oJ4nRnSuU4BO8BKQMCPn/iAtKRHZIPrUibT4UsWyOmQ2/eWPWI
	X8zohplUMo76IddWA6rs6ZTnRe5xBCvt4dPi6s9MEGA+/A/pmyoMFFjPQNafZ07Z
	iAs+d4xko576QraV8Ibsa4sIS6uUYLT6jFgIqEizKJyMLsQ2dxE3YdjUM8M8yidF
	W3PwBq6y3/5KhsjszBknN/H58VKxVVvoBMiOekD2np54JMTfuPgfSmkm1q7qei5u
	9CVxEQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1pcb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 16:58:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3087a704c6bso1299517a91.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 09:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513906; x=1746118706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9+kJX3qmRmZ2snfGBmR0Ap3enazyk3U0iCrZ9pj2O0=;
        b=YOvRM0WDdpBJ6h4JvBVhHMD3gWMIyXeSaQ6zxOYhVY+lsbnZ0qiV1JKhVPTQ/jRWyI
         dSNGnyfJ0hHJgYe+7Ci7b2dcREFZZuUJ/qYzdGOS6rxA68Ar2HRS5hxTpEOBic6bBAaK
         i5R+w5vV3qZkWvsxvV8laFnHn1OTePfsR168x4O4szuTJ3vAy/9Cs20BFNzYz5ieSyL9
         cTMyGGXF8RSaFvsjni3UbVlkMHQIwnUL4czHUlBbdqEWXBHgjQesAEUhuv9pChECsGLu
         vK3jcNZc955WTT1/4QbNUujKHDRFwU4z+KKzYmGHANG/qoiqOw08QQcDkJsytm9u6aZa
         W0Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVzqBtBGBKlEZXj18JMDJoqhXxtsXBLaAjaOZgJISblpdt/gA89qBxRwFbRYypHTk3Pphwvy6VKfnVb@vger.kernel.org
X-Gm-Message-State: AOJu0YwUIvXca2bMVr/wjcIQZwy0de30EZEE+B3cmVx1MDriihMT5CcA
	S6/PU88oxZviM9/DOQG5vxEol/elr1AI2pSMljHd5m1smoTDImT6noxYgxSZQPN6EUlwjBTTbb7
	+ASqIioeC9hMgPk+Y/i17L7/i/3a+s93lS3znbw2bPF6KZMpa4sLAXLvByCVY
X-Gm-Gg: ASbGnctphJQTuu9En4f4jJLznGrxcl2wFkNDtPsTCcIugoVtKSsoYa5eQeLRtgarSo9
	cYCF/tIxm0RcM5AXDlZPkNlmKWtVM/NCTgkcp2rXpvN0/M0ri90F3I/XxuI4I87yLfACrMHsCnP
	RBjXpxH407fzh/x2AtW8cagw+QGecr+MGb0xcVj4HEDfqxUn9myczPzggh5flshqFIRr4zfteLZ
	giFuQv9iM5Nx9K0HGs6PEJ+anQRywUTqIK7eM9WqGSO63PqXQIrC8MF9lrWBaZEeTxgjpqsJEjJ
	qTWE4GEoYy0PgrEVN5S2vuqH3wYXCfDWe8m4SkwNQ++ylTbEptg6NejX9EyNSmzBjjg=
X-Received: by 2002:a17:90b:2d0e:b0:305:5f25:59a5 with SMTP id 98e67ed59e1d1-309f56d8124mr558471a91.35.1745513905708;
        Thu, 24 Apr 2025 09:58:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh1h0ZlmpzYkSjNOUZGfK3vhdOgJu5HDMU6J41zqG3DYFF1qB5+gZ+Sugq+6qPpgpDKZSMxw==
X-Received: by 2002:a17:90b:2d0e:b0:305:5f25:59a5 with SMTP id 98e67ed59e1d1-309f56d8124mr558444a91.35.1745513905372;
        Thu, 24 Apr 2025 09:58:25 -0700 (PDT)
Received: from [10.71.109.146] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef09689fsm1644276a91.22.2025.04.24.09.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:58:24 -0700 (PDT)
Message-ID: <3d583880-5e94-4f12-aa50-96d133276e4e@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 09:58:21 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Fix PINGROUP defination for sm8750
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
In-Reply-To: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0boRSZBJ2hvvEz6weu3_vG6p9Fcs21-1
X-Proofpoint-ORIG-GUID: 0boRSZBJ2hvvEz6weu3_vG6p9Fcs21-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDExNiBTYWx0ZWRfX/2xEg4uTxqG8 4o5fBFf0jKU23+e6biyp3xqqfX/l4DIQjHnCALk4n07rVpVNwJ9Ommlji+RFB+I1qqLcl8boAEI uBwYRhmgWb/dyzR+4luankzuFS0X7HHE8NAYRsi+xUhCX1HHj5wDDB0BWTMgdMtjm1GN1srIgGf
 vDx/2dUpP/7I8ISulIIDvFU6PpHcjrz3j6NpKYdgHco19slPO+VF9cwQYBetgoWTo/KBVrQrB65 tpLoikSSVVu8IdfP6jTW5a6lW4oUQ9P1Z7tTM0k/TFlymwXx9QCOrY8OI6z87+/XSOjo3ee9+4L G9tbKozeuDjwzxK2APP37dfKatM7Zy5w28/G1Ik8A1alxfcmuOKVPcAeWqTWf3ZkvRa4gqGtUtZ
 r5qD9xw+oKrmFGeuPcwgZGouDh0xLfEDSl9zPIgSUqele6W3wket8qKtrMU8EveD/jUNcpUh
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680a6db2 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=8B2AFzsc9gyHPfch_-wA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_07,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 bulkscore=0 suspectscore=0 mlxlogscore=657 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240116



On 4/23/2025 9:47 PM, Maulik Shah wrote:
> On newer SoCs intr_target_bit position is at 8 instead of 5. Fix it.
>
> Also add missing intr_wakeup_present_bit and intr_wakeup_enable_bit which
> enables forwarding of GPIO interrupts to parent PDC interrupt controller.
>
> Fixes: afe9803e3b82 ("pinctrl: qcom: Add sm8750 pinctrl driver")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>   drivers/pinctrl/qcom/pinctrl-sm8750.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
Reviewed-by: Melody Olvera <melody.olvera@oss.qualcomm.com>

