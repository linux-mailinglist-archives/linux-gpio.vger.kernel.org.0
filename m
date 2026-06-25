Return-Path: <linux-gpio+bounces-38872-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p0sZF+bfPGqhtggAu9opvQ
	(envelope-from <linux-gpio+bounces-38872-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 09:59:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EF36C38A7
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 09:59:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="QyUc/VMk";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YxBHHCxu;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38872-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38872-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B7E63009CD0
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 07:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58709374A19;
	Thu, 25 Jun 2026 07:59:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A8B3749E2
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 07:59:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374362; cv=none; b=rmqpPjxMPaa7+ap7yk3N+rwu37sTVYEyBVzzwjSshq0WBsWK4ccd5lr2fmITD/bvsOBu6QJSFPSmHjj7ugucKh0JjA+uUH8cNyWItMA4KSui7LyuknDcjeJkY7LqupWW6Hy20iRXeCsXzujVRwlvYUCBxW95HfFgtjoQPCfKmA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374362; c=relaxed/simple;
	bh=z/WYgAPYjwAq4I23XYwEmqwh3cYJlJxhp2py1iXT17Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COQN000rNlWJ5GrMpUdLh7xo/6HUEWwO3yVZbueDPfAR8IBE8vJszWO/M51Suy0nMQLg2NTHPBui9XRNIefW/dLUXAeMkE4FgIxXaneWkZp2qyqCwT4vambIPb59gx1nkKcXbUVQmlJudMXwHTpoiNDwsTUBOi4lf9lxVnkADkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyUc/VMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxBHHCxu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3e0BW3405658
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 07:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bt52y0UxYjJxGefuoc5i72x0TXQgvEF722OpeKsWqXs=; b=QyUc/VMkWOezro87
	GzYLcaU76xRkzFuqv1/JyXF6K1s1nl94FasXPwSZHvFTI5F0b+udy7aoGR3bxw8Q
	fkXHt9/43wd0pmpdIq69xX5cB/MerZXHZ3BFmssDa1bjbc9/1+0EWU4se5Uh7EOM
	wzRWyW75R0YpPVOX86h4J6jURLzKzBv58DcUX9rETq4SvG72p3m8MmBFrrJ7gVtw
	GfPg7SCwU1N9eky1dwf1DBN4dZvsv2UasotEfZRNMDj5xMWfvzibxR2z67ywoILF
	Rrls71YMMj1hfIUx7NI7pILQ3+a7iS9yOPoLpRM++Q2F2C8qMFtAVdTwPZGA3vdi
	vh2jOA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0tspsct8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 07:59:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5198e72249dso1877911cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 00:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782374358; x=1782979158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bt52y0UxYjJxGefuoc5i72x0TXQgvEF722OpeKsWqXs=;
        b=YxBHHCxuQyhPrVId/jrGuHOe2MLRJzga65SYw2YWSQOTYr/a3C0xfB7F+UF4sKcxnt
         4gReACjtP3uPWl6P5gG06u3+wv4dCUCJTW5/wSXlS6EDeJhYadvXWFMils7oGusN2QJn
         odmNSPT19cbbV9qQgFqMy76z+3haZnKOjyvQZpHIwhe1EQkNwaq22zfRz5fyuGK7X1Ed
         6ugeqwjwb4cXeGVDs4O2PsMWku7h2PbQqjGnFJRn9GW4oa20KJqDpMPoSUFikjaEGwda
         Sai2wWysmcs1YNaFiRRT6dglp67WhuIbpQTsGjqqnrtVv0D9hVQzYNktfng91QiMnbhA
         At8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782374358; x=1782979158;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bt52y0UxYjJxGefuoc5i72x0TXQgvEF722OpeKsWqXs=;
        b=GEW6sVOdLnjgB1lqPNR5tSUKwQoeTEbmlevOov1e/SZtr/6zdUUf8YoOa0FYybLRN6
         nqG3KJKA4m8BYMEJPtBochqEK67pGf9u5yAnrmYaR8Sx2YHbs1vGTZ4ODBGF/xNGQxtF
         8eS7P3ISq3Xwm5lyTEU8T4WtotIU47/JFipmNwOKC6hlH6G0RbdthmQzhpQuCtKpvgnJ
         aEBNNxDXlVWbNE51jhVMuf+FIySIa6fQmVvq/jhGtnMmpAQcSIPRt0obylfmdi40l8PO
         cL50ZSXgCOMmiUlvrSaVxoWrcvV8kuM7gNfktzEBGaIGj9iEge3+/ZrE+TmVmCF8Gaox
         MF8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9tnGiGt0W8jKRy78fJWREDCdGM4iKE25Ug5MscbLv/WUJ8Pi5MTNd/WQbv2YE8nZ14EPu1lmtoGHX2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7txlnj90qjeTabgi6eOkD7LjH1ecHVqptbCirOSegWm8kvdTu
	EDcU+2aFHMwVl5yBC9pnaqi3dOM3wZCi91br9eNOFPByOkL/4lkdHJ7rpo7LAa7qnOjmD7Uewj8
	CtEy5JO11HDmlbSJGopebM+l5lps32D60N1x4NGLnthoolNZZlY5ZteN2VFS/6Nie
X-Gm-Gg: AfdE7ckVwU3itmRmt4VChsZLI2WVuc/rDSVtsbUSNX//p/7w5MFMLyw8XrY5H56wD1R
	UsaYVVmcBaTjZKM2wyqtKqvTMIzLH3g42JFlofUmd+dNncoe7yLxmpOJUVXhoaa6NY85oy2VWOG
	DEJVIoqcEOIx+0C8OY/QQOAhSk/Q4BneKP2Bx5vLGiYbz5kbNR0JCfxrAPHEoA+4SFBuPMrGN/C
	Hk/tdzLRHXUg5aZuR/GQkwNnaBzJ0DoHP1uEz/v5Xg+PBnx6g9ACths9KdVLG6OFS+BWlFGTjEk
	zHHrMz9YluPaHpiLwPh4Kt2xdt4CA66XvuVwmm7SXVqiWFq5aAXTqJsPuqoRH8ewC1tYU4w4wcJ
	tokb1+qz7quDVazRGfOYboCcKz3xnxSfVKjs=
X-Received: by 2002:ac8:57c5:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a72a47ba5mr10403611cf.3.1782374358296;
        Thu, 25 Jun 2026 00:59:18 -0700 (PDT)
X-Received: by 2002:ac8:57c5:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a72a47ba5mr10403331cf.3.1782374357864;
        Thu, 25 Jun 2026 00:59:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe5f249sm120328866b.50.2026.06.25.00.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 00:59:17 -0700 (PDT)
Message-ID: <765b17f5-0ae1-4efd-8af4-9f9411862acf@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:59:15 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: qcom: Unconditionally mark gpio as wakeup
 enable
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
 <d9e778ea-8a67-4576-9c96-9cfd859a266a@oss.qualcomm.com>
 <37f34aff-c68f-43ca-b23c-500cc9bb119e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <37f34aff-c68f-43ca-b23c-500cc9bb119e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OL8XGyaB c=1 sm=1 tr=0 ts=6a3cdfd7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=isb_plKU-JZBI8JTm9kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2OCBTYWx0ZWRfX8MsKfpDjx6Cf
 aUNvp1ufaVJ3g842KnM5fmvq6X2lRYcdmLaxpsyTn02y7lQGShKWtUPAv7R8D9FjhK8iwRTsUnH
 nlRsZx/QKl3ONZvcJ4/7Bb3hBAsNlwomWw3shJNQzwlgdc7qw2LenwyHmV/g2wGbrfqk5Ympjot
 Wro+dXqhWEOK2pa6JMy9r7u2cfR7gTeqYWL9jS0USnX43KUddYpndJsHNx/fn1Mx3piKFqpm4Gk
 GplcCY/9AV9AAzQTcuGpC9IdiFsFZnDjftJFPKJxm7i9TglHULYLgtjxFHWqU9nh8ih23CTNd/9
 FLl62UATmsBzaxVsubWuWGFtS9HHueR3R1LgQQRhQJA9tACVcFH1/6q0oNEzfhDyJ34MMbLhKvu
 KYbDzFWzpwrF88O/KdMA6LgLbKEgq6cSODla14XbQ8iP1k4elfMmPJEROfcIJTM8LpcT+sylV4w
 2bP1SpsGz4TnV6NPToQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2OCBTYWx0ZWRfX6wUlZRGCjNXI
 ngLLacAuXhtZWb9MaEd1SfD+dPQK5qGugaK0xOXx55SrAm4cXsj9Y0KPgRASOh09bZ1FB2vTgnS
 anfA1M7p25uBEsh1enfNqWP18Qb19bI=
X-Proofpoint-ORIG-GUID: fxTWKrgarvqJ5hS5qBa2q2SMRhpqBMPu
X-Proofpoint-GUID: fxTWKrgarvqJ5hS5qBa2q2SMRhpqBMPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250068
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38872-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:maulik.shah@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4EF36C38A7

On 6/25/26 6:33 AM, Sneh Mankad wrote:
> 
> 
> [...]
>>
>> This is a much better commit message, thank you!
>>
>> One question remains - should we set skip_wake_irqs for MPM too?
>>
>> My understanding is that no, since the MPM HW is simpler and doesn't
>> have a register for acking IRQs, so we need to do it from the recipient
>> (TLMM). Is that right?
>>
> Yes that is correct. skip_wake_irqs is set for PDC since PDC can handle interrupts
> during active time and SoC sleep time both, so any wakeup capable interrupt source can
> be handled via PDC at all times. However MPM can only handle interrupts when
> SoC is in low power mode, it does not have the functionality to detect them when SoC
> is active. skip_wake_irqs differentiates this behaviour.

Thank you!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

