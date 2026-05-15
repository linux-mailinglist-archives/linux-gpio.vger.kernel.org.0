Return-Path: <linux-gpio+bounces-36923-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ+nJCILB2oLrAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36923-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 14:01:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB4154EF89
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 14:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7897D31180A5
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 11:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C7F478E3D;
	Fri, 15 May 2026 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+4pj6cu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3RapAfh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00A52FFF8D
	for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844749; cv=none; b=FgYpRoSwkv4XYpxMNnA+KgNvyE3XRRj9AMb8Uw+Jx2r+4ci41ASMDvOTQTy6kkjAtn5Dpekc243T1PufdrvlRFFvj+9T2LBNHcJ9D2tkFKdFMLqFeq6+eQ+7TEYqBRgEH9FF6V+/JO1ihXZzIBKtc1gFLP01S19BTAs8M6S9+3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844749; c=relaxed/simple;
	bh=TBxWd8dzqFRwo+1aGvB1TTlhj/ctsVbToYE8VLuyuJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FWhRxTV5kabLHOvi6hsz0b2W69Wnk/M4REObHfoBrxuMyTeLqCZZ/oFaVgcS2zb1lPND1yvQBx0E4HRDJ6bd5XKhN90bDm/qRaNLzFhDq8BDcKqlG+IHlvHLmz2xyBsouo4S9XDbd9Qv3k0U9V3RGquRDfI5Rz7IWm7zwvkVIX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+4pj6cu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3RapAfh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5AAU63512994
	for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 11:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0JAjxwIQnSuHPB4Lo64pR3CCm8tgrZFOSdk1x/qRuyI=; b=G+4pj6cukhra5JPl
	tdVjW6oqRj9L5hTGEmr5LwfgUr0SEPbAC8MpmhKdoksVgtSWOO0hXP43ycYvuQgL
	EIj0xStLA9Oj651qfY7jVREesprKx3xWV0N9pgw/Eh62PSi2AWVHYeLzCpMOYK8a
	IZfilB85rqXvxacAD6G/PWhphOBfrcBFLNCm9mPymszbyTOJ9gTSiUO0NIN+/COz
	IUFy/yH6djgNPr/W30+UoSQM8vGSgpG8zHJcFiIub1fu3UGCWgpf/FWTAtFVLFGz
	R5ohcP8xhCoZHtw9KEfZl96H56Gj5v9/y2M3s7ecWaQpcKDJFMg1j6Oa8T8mKmbl
	NJ6w/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vb27y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 11:32:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e5d7f4b63so15337711cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 04:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844746; x=1779449546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JAjxwIQnSuHPB4Lo64pR3CCm8tgrZFOSdk1x/qRuyI=;
        b=V3RapAfhGtKzTMr3uGaMsUHQUUwCtMYOjS/eIO7iva2370ip73o/qillN4uvjAKx3b
         8n4ogpYwwumzjS5Jxvu8YbXLgKbDbBwjAuAvAId4YhhE1eTAeeA7ZfigSEy42KiK3+qr
         I4JAzdD9qngrIxw47F8NTFRE/tB8JTzxPDvPNgMoG5T+AW/WmBAcXgT0vBOKiK32oh65
         ckLNC+5dVxZ5kV9KDxZAkoWjSzJ9co3i8lnXP8wGfDwhhMS5qrm8TlsyXZIe/sMnWqmH
         GN5df2rNT4UGpgjJtft1nqhwI4GBIV6At+uK1z/Q8Gv8iXInaA3n8Bnmhf6Wc/hVBrS5
         2D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844746; x=1779449546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JAjxwIQnSuHPB4Lo64pR3CCm8tgrZFOSdk1x/qRuyI=;
        b=gIYDGAd+Vor+OBCQjuihuKq5WnLCm0ER1ig4PEq1ipQXBDr5IVBmS0g4L1VDy19aRa
         PSnX5t32wRCnD7pgehW57q/PUp93D7LdvJcdgNWLe8Mk7vE9YUsHGXjyls2j7ZjFO8L4
         /avdlcXSfXTlxNndUAAaGwyyMefiG8jdiKntzzfhNcb3xygACJCegGOSuRzHHZzkzyya
         SDluq6zgkzknqhD3TVdF2uChQfAHRHh0e0as1S0LtAGCxdDptLbHSuuDpa7QArl+r1fy
         Ms9oxL1a7NfqbdQtp0Ri1A9+GHnJm7UJSZND/HneNv2m6ZqLf6T/AZvr5EJnL/RGSvuZ
         J3Uw==
X-Forwarded-Encrypted: i=1; AFNElJ8AN2fsUj5OJaRDD+DLOFeHoqpbxLc+is+0O6uk6vnm7/EBnVPLKAvpf8pqHERAn8uWQmDNCphz5Sdf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/DH0HNlM1GWKfHYudz6bFbTOW6h1q8Vp6IzE115qcEis1Mp1A
	2FfEpr3R6O5MUrxq065HnraE/C+AxRm1SvVHaMYUf8T9WnxANahGH5CC5U0zh2hhQTXroKQTPE3
	UML6C/XWEhMtcaVT5TOBO5iHHRFpF3C+EHHDi3Iz9vAR/7irnpuPfk4nwVlq3dB0G6EtT+3F2
X-Gm-Gg: Acq92OFc75BZaNiZaAnTroGki4VaeXX7mW3yhnTxTjk1nj8Ao7AWbhrZdB5ibfH0e84
	/6JUFEexj51nyMTMuWUD3ljNHLFCRANM0C8vSSsMMEyYwS8heUetAcYYvWM7D6FNEZ5TaDDxxzt
	UnedWux1ME2qfc6fLsh+aVB2Wf0RqMXDExJA/hDyy/2ysS2GGjQyBjhvBSmz4LPHqms6N1dv3Ge
	MYni49nJsUcfAvhJizOo8N839MNOKPM513CshctoQnrom8BUbGD7D9IwKVywoejiPbdDcPe459u
	/5JlVbEYKV8xYtJgyouOrvIob7RjNFzQ6ezmVSz8u52UKtYBROeqoWSGWqalg+IEqbo5o9wEff8
	bj88QskIAqRkLRG6dSC7t5IQ7p54GWuovli+xRwBBB3O67i3vFvNogykV9kf79YYBYRNDhD7PBU
	iwBLg=
X-Received: by 2002:a05:622a:594:b0:50e:6311:7380 with SMTP id d75a77b69052e-5165a229508mr34435881cf.6.1778844745846;
        Fri, 15 May 2026 04:32:25 -0700 (PDT)
X-Received: by 2002:a05:622a:594:b0:50e:6311:7380 with SMTP id d75a77b69052e-5165a229508mr34435501cf.6.1778844745379;
        Fri, 15 May 2026 04:32:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm1922402a12.8.2026.05.15.04.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:32:24 -0700 (PDT)
Message-ID: <2ba8b020-c8b9-4c60-9fa8-545642bde1fb@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:32:22 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: qcom: Unconditionally mark gpio as wakeup
 enable
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260430-enable_wakeup_capable_gpios-v2-1-8c26ac795318@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430-enable_wakeup_capable_gpios-v2-1-8c26ac795318@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNiBTYWx0ZWRfXy3lx7RbPHgf1
 j3IU/JAzpPJNcRzSDy5Xm+JTjnJLVpXjgaXvIqMBOG8a2BD0AIrjf9o8wN2DFMFA34xLO1KsT4q
 No6ezAtIaLhH/BfY9ggEQfrsifKEFfk8867Iotujzvn/SJ/jff9RYdXm8NW8MNNTa3fcr9emwbB
 l3Cj7UyNi3iY+s+PF0oyUWI088azcZm3K2R1e7p46D42YGDKF7PmvuXNhOxncOag5UwjY5SiZKw
 dSsxnxdfZE0Rrd/+xiqVdOvMetlvmBUGDpJ89PWmncXs7f3Yd0qqeaTQjYqZwwRm1bLEZ0rH5VD
 2hIemzBDhnnK+CYhudWrPYBNeaR/MbCRtzN+cKGgeybDhWltZzIq0rzRlLxfcQK8s7OF3vT9u23
 6enACNquMCW/fcjc/hGnv3F3kGnga4Tlor1gawl2109gAmdlHsVXYWhpqHZOOqmAt85Sqa54dBw
 5iWD7m4eiMmNY9Tbcig==
X-Proofpoint-GUID: L1u9SzeDUAxA53lAkbeUS0FKJTG14ev7
X-Proofpoint-ORIG-GUID: L1u9SzeDUAxA53lAkbeUS0FKJTG14ev7
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a07044a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pFRikYD481U3yHg_XLAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150116
X-Rspamd-Queue-Id: AAB4154EF89
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36923-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 4/30/26 11:20 AM, Sneh Mankad wrote:
> The wakeup enable bit needs to be set irrespective of the SoC using PDC or
> MPM as wakeup capable irqchip to allow the GPIO interrupts to be forwarded
> to parent irqchip.
> 
> This is set only for PDC irqchip using additional check skip_wake_irqs
> making it impossible for MPM irqchip to detect the GPIO interrupt during
> SoC low power mode since for MPM irqchip the skip_wake_irqs is always
> false.
> 
> Remove skip_wake_irqs condition when setting wakeup enable bit to allow
> forwarding GPIO interrupts for SoCs using MPM irqchip too.
> 
> Fixes: 76b446f5b86e ("pinctrl: qcom: handle intr_target_reg wakeup_present/enable bits")
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
> Changes in v2:
> - Modified comment to specify MPM HW as well.

$ b4 diff 20260430-enable_wakeup_capable_gpios-v2-1-8c26ac795318@oss.qualcomm.com

[...]


      ## drivers/pinctrl/qcom/pinctrl-msm.c ##
     @@ drivers/pinctrl/qcom/pinctrl-msm.c: static int msm_gpio_irq_reqres(struct irq_data *d)
    +   /*
    +    * If the wakeup_enable bit is present and marked as available for the
    +    * requested GPIO, it should be enabled when the GPIO is marked as
    +-   * wake irq in order to allow the interrupt event to be transfered to
    +-   * the PDC HW.
    ++   * wake irq in order to allow the interrupt event to be transferred to
    ++   * the PDC/MPM HW.
         * While the name implies only the wakeup event, it's also required for
         * the interrupt event.
         */

This is not what I asked for.

Instead, please focus on explaining what skip_wake_irqs is, perhaps under
what conditions it is set, and how that differs for PDC vs MPM

Konrad

