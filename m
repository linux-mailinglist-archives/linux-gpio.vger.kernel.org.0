Return-Path: <linux-gpio+bounces-28340-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F17DEC4B88E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 06:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AFAE188778E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 05:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED79284896;
	Tue, 11 Nov 2025 05:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MosCMOCW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L2DgMTqq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD7C237A4F
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 05:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762838560; cv=none; b=d43KXzZnXxa8N1O0nJQ+axbMFlpNRwOtphp+8Dmbj1PG8IR4mx5IbNMb6YwmzAns5l//PivMuM43qigNXgDIBTuMtGoS4ShgESdo3dDV3KKMZekvUGPtnvvADR/26hH1cGaaFzeLKEHyyN7gpjYzL2zZw2IPx11q4JV+PtNkOVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762838560; c=relaxed/simple;
	bh=9OF1VOFFihuJuwmCepEzHh2ATgtLynGxJRG5+laPChQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mv1MTddcu6KWSqJGkrZoHkQBCm0CHIUaHlQF4AtwzMxjJrUlsPSXAFJQt07UtwAiBHBAkSO+gGgq4sqCFVsDgGCI59E6bVn5kazGTPPVmgqkXhKj88q+CLl8YnS8TpMWCmaH6/hw6CmMoWo/x67Y8NC0sO0UT44kL9mxh0kKRbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MosCMOCW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L2DgMTqq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB4VxWL4166773
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 05:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Te5+jGKVmczWAFRX4897loQZ9s+94IKGhi21It1SFQ=; b=MosCMOCW3NChtPvs
	1bMlSDAStRvBjBJXjFGSIIe7xvCam9wnhaxQzB66lwiNjiOQ/qnwNa72xMafmilu
	PlW8P2WijEWhS+bhRRQAXYqJLiEkCvJ596Xzxl7HtrFjvcmw+PTma5FAp1Ajap3S
	zSR/bK8hYfviy4wkcYa2aMxyZzhPXjbuRNawLs/NE07hoRJmFMmUUbwsevY3uyI2
	YbohSNdFNIDmOFZ9+jTEEsg04GL3AF5R29fevs0MOKf8/aU64bqQwYd7xkC7gHp3
	TVtvbwICqiGH13o6ULl4Jr3PVpkNBc1KxT1P+VTTrC7BHTPWphRa/nyb9pBsstbH
	pb/Wqw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abm4a1qug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 05:22:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ba795c4d4a2so2756853a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 21:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762838556; x=1763443356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Te5+jGKVmczWAFRX4897loQZ9s+94IKGhi21It1SFQ=;
        b=L2DgMTqqT2kHCVAgyb0L1d2M5AhD+8YwPLnlM3JJuLvnoQT52aDkTGLek27Fk+JsgD
         GzQ6+tMMzpuL0JH/H7WfN5t30E8xUoA1VAzSTLcxEw1bpcZVTt6BZhtLM6PmNWC/Jd98
         Rcug8a9m/InRbm5nO2yrljyXpMndqB/rojuoyKE292y8hcW4N0zd7gqoiQ/99+REL6Dg
         Es883jIpXTGBBAiu8xGZH9IB1U0jcAf5i9yKDStuO57EKDYuLS0hGah8EpvuutqCZhPp
         LZOi/txN8ca/FYp4mYf3czoqx44XLmcS/M7kIlQQlN2Hp/jmPvWCAE1GBuOqRI7oczq1
         zASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762838556; x=1763443356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Te5+jGKVmczWAFRX4897loQZ9s+94IKGhi21It1SFQ=;
        b=KzrDSqonwAMHqIPcLe/OoClJeb5EMOFcpC48hAFEptfujM+PjVHZBCJsdfW7BaEXX/
         s9pmdBUDYTz1WPCLhlAKXXe6DhxpThC8V2K2PyCQu9MnH8hME6TXMGTx/N/nKk70a5c+
         8sEH3HW6AQ6AXmDoviqhUj0ewIhZiVXKYz1QATdpiVB7dy5g4cd+V3EtAxWx/isNT5cz
         sfd4c5GYJajU/8YsXiQBe7+S57ImytDvyHDm0tKQ0WrzWyEtfIuL+eDOIlFmRdimoiDd
         UTUmrQ+w+rJ/Wt5FF11xzLL7qxArShLUT33AFDNCUezZvSeJpv9ew+2C+mapUmOL+4IA
         NCzw==
X-Forwarded-Encrypted: i=1; AJvYcCWRSFsmXnJiVsW09mXRH/hX4IilFhS/EKsSRM8Tt+5Ey+Y7eMfGYmF5xsrar0G/MP0U7S9WuHZJu2Od@vger.kernel.org
X-Gm-Message-State: AOJu0YwuDQdUQCQcE6PYFlqC/02gNH6HBruAXEMlg2Qw4B3P9DtKl0U/
	uoaCcwSE+HAOls+2vS38IBkeR6LjOE4o0GOnPYSlqEgsijlv6wTt9X5tNetwOs6xRmwabolpTnh
	UA2v34YahUxLIiAwlxKUX4r5/wXYiPQMSX2J/2hmuZVrWzf/CHM5J4ioXRqtY0iuU
X-Gm-Gg: ASbGncuB7VHtiXMKZKeJpUdQ1zPlrWcGBmkMx+ZhD4qBUm40ms3pzrgEXhqoVC2/X/n
	UWk1KwKbO5q5yD3ueRccYbnfvv/ZaFKn6YPbL4aXxDvEDBI0L/WS6AapPBVhoYZSkfVWIBFiS8O
	pFBH0g4YGIhwDsqeSGCfX6sQpHK307DSUaOq3HESOIpn00CCDHbcPf8NrdFa2P2KebtSRnM3DpO
	TGNtxvZ83+G/zHQd5HVm4Is8tApSY5duyhhEEhzVjpn250zLr7abfyHUlG0o/aJ86D8j9lp369v
	+1nRgnDbhwRFPuIqeNBclrnCHkWBMV4gPHvpBpod9SjFpDVhcQPEYUClKdpEM7vorJLsLpskIZw
	tF7lEskhaKQFpGUMoysAz8gwLx+70tK0=
X-Received: by 2002:a17:903:244a:b0:246:7a43:3f66 with SMTP id d9443c01a7336-297e561ac3dmr145695945ad.7.1762838555587;
        Mon, 10 Nov 2025 21:22:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG44dhpC7FpqpgcK7ljK7RCCQ2W7yUdgoVHyPBRAs0CPdhZrrNwS6XdCmzCnymqvg8hfGr33Q==
X-Received: by 2002:a17:903:244a:b0:246:7a43:3f66 with SMTP id d9443c01a7336-297e561ac3dmr145695555ad.7.1762838554961;
        Mon, 10 Nov 2025 21:22:34 -0800 (PST)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5f011sm165660855ad.25.2025.11.10.21.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 21:22:34 -0800 (PST)
Message-ID: <5cd78217-8da9-4290-b098-8210280e65d8@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 10:52:25 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] pinctrl: qcom: msm: Fix potential deadlock in
 pinmux configuration
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
 <20251110101043.2108414-3-praveen.talari@oss.qualcomm.com>
 <l2jnveusblgo5cfou3mx3usn7qgenj65wfyrnycmaqamkvhkee@gy745hkc3poc>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <l2jnveusblgo5cfou3mx3usn7qgenj65wfyrnycmaqamkvhkee@gy745hkc3poc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: n_X6brCDnLoFbxvFRxGRVRiXi7yd4hoj
X-Authority-Analysis: v=2.4 cv=G6kR0tk5 c=1 sm=1 tr=0 ts=6912c81c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=IV0jPyGM1QMGTU76z_QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: n_X6brCDnLoFbxvFRxGRVRiXi7yd4hoj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDAzOSBTYWx0ZWRfX0IYEu9p1Phas
 e/5UfjBzP06P/aecqp0MlAdMAkAw9tlAPaEOkER+Gnw/VTRxygRsaYeEUiKS+udqfSzhCUD8Gmz
 vbfS4TGANdlRAuki1u0NVMj/WNZfwVVtYJ2hrClA+m50DVwmFEZximryCUsgwcGNell55AJrQoX
 zakoSFtpwrGql20Pa/nF+vl74CdDk6SWrgniEPDARdh4+xuE/OdZ0q1aLNGqICXkPR4peiTYYgm
 JswswGh5a9G6y+tRLoQefG/IqAw33Kw06fONp8eLnA/hk9m6juKEiNq82sWBAzlCL81BXUyH+jb
 wS9ufF5suO788WiTmHCbDPbtLfa2EwCxRZwA5v0kTHcPAn5sbcBgFdPPUkS9xbI5Vk/2dgsAWmg
 98y+8upfFhAVUq5UoFSv9lwmBmlPnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110039

Hi Bjorn,

Thank you for review.

On 11/11/2025 9:38 AM, Bjorn Andersson wrote:
> On Mon, Nov 10, 2025 at 03:40:41PM +0530, Praveen Talari wrote:
>> Replace disable_irq() with disable_irq_nosync() in msm_pinmux_set_mux()
>> to prevent potential deadlock when wakeup IRQ is triggered on the same
> 
> "potential"? In what case will calling disable_irq() from the irq
> handler of that irq not deadlock?
> 
>> GPIO being reconfigured.
>>
>> The issue occurs when a wakeup IRQ is triggered on a GPIO and the IRQ
>> handler attempts to reconfigure the same GPIO's pinmux. In this scenario,
>> msm_pinmux_set_mux() calls disable_irq() which waits for the currently
>> running IRQ handler to complete, creating a circular dependency that
>> results in deadlock.
>>
>> Using disable_irq_nosync() avoids waiting for the IRQ handler to
>> complete, preventing the deadlock condition while still properly
>> disabling the interrupt during pinmux reconfiguration.
>>
>> Suggested-by: Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>
> 
> That's weird, I debugged your deadlock for you and told you to make this
> very change in:
> 
> https://lore.kernel.org/all/7sxsfyu2kqbycyfftwfhrncwk3dfnubmzhyi2rqi3jtvi5qsnh@bya3cii45zhn/
> 
> So I guess Prasad told you how to fix this issue before I invested the
> time helping you?

Yes, that’s correct. Prasad had suggested it earlier.

Thanks,
Praveen Talari

> 
> 
> Change looks good, and description captures the problem.
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>> index 67525d542c5b..e99871b90ab9 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> @@ -189,7 +189,7 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>>   	 */
>>   	if (d && i != gpio_func &&
>>   	    !test_and_set_bit(d->hwirq, pctrl->disabled_for_mux))
>> -		disable_irq(irq);
>> +		disable_irq_nosync(irq);
>>   
>>   	raw_spin_lock_irqsave(&pctrl->lock, flags);
>>   
>> -- 
>> 2.34.1
>>

