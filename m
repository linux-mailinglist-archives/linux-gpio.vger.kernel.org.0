Return-Path: <linux-gpio+bounces-32555-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHr9E2tTqWkj4wAAu9opvQ
	(envelope-from <linux-gpio+bounces-32555-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:56:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E435A20F1F5
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 827E83014618
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 09:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8184237AA6F;
	Thu,  5 Mar 2026 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lISM4GYy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FAAyF/p4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4724937646C
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704493; cv=none; b=Xr/f2+202W31eefz7keip75VNAXHlIJJg/tDaBKsUb07n6UjRjyokqWrg5GnIdwzjs9kGKt1X1Rl57SccAPxCIf2hiwSXjgtlZrb9XZWIJAVoS4KSOJXvzUFZOdwDrJYj42ZoCWB0uVYIrV8U2hIGluKebYG3z0td/xgl1wjaSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704493; c=relaxed/simple;
	bh=XQukW4/ROjIRaE/AjfKafsRfg1a0xwL70/N0xAoX1/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oO4+LylMrrdx4lLE9TEL3nTRXkNbKCgy8gRzOM/RrMJYjeXUI+6djV0zrsGYUOi6ZQKAOV/iFNtgauE+1rT1x3cXEhdHy6+2SZYeXIuTWzj2ppKbdRlaRdOiEEQ5BHtFomNrx2+XLHwxrDKPyTKvN5UQHeJixUlHT6jjuNAd3UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lISM4GYy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAAyF/p4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258sQ9D2665152
	for <linux-gpio@vger.kernel.org>; Thu, 5 Mar 2026 09:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8bIcgp0lZ74b/t0VJU2b2r35aufWZF3oWB9C4Cu2IJs=; b=lISM4GYy7r2YvjjU
	he4Xn7XIzqyhlsO5K1EieQNDL0YlmsoRBamjcxtaeggPUF/bFKEYsxqE7ucR1iaf
	vqYv2T+XnqzKJRHtYFyUy71iivagmE96MKe1VSotqqcezS/Oq/OjWChvOD4XkwlI
	JWJySWaWoIno8r4zZD1j9pEpPKA5o/RM17NnRH3uA9qQYtp+zz+C4iKZaDMCbqpW
	b9/AJY1jRDU3zwiNu27sgD3X+YpDvBndopQz+MoCjwNxTu31Bz6MmwYwHHtAG6R0
	6QHxt9gXTJvO/DIcsclzmbgNB9aNyqg288aW1a+ewi0Vc4mFtsYPI/4Z9MIbKyjS
	po60/w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb28fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 09:54:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a09f050feso15468066d6.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 01:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704490; x=1773309290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8bIcgp0lZ74b/t0VJU2b2r35aufWZF3oWB9C4Cu2IJs=;
        b=FAAyF/p4ETlAjDhzYR7IzeUm4bwuG4qLmRaQZNiRN+1J8kI57cDOpOF4DpBk6iJkS9
         cV1ApoiIRGNHOCv1h4xuRKdwgn2BXqemWPHSb07YFSvmBRBo8RthSqTvmzu6e2tIJoYo
         Ibso6SeIbyt10UrgsYS7W/F78aKcIZ+nh1e6BfeTIjlgcSSxcdK2Hetqz9WIVDBHtfqq
         wWqrkvk9/sa/NldAejQjyUsKYHKDFZrQZtVb2Gq3L4fCWnUefouJf7Z/lUTqKdzdipal
         3xLIOkr9iIGcBrlLGNuYC43BtYInVkytUsnhd2nstQQeJwupNTQYSXBAh4A9wb/x+KsS
         GKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704490; x=1773309290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bIcgp0lZ74b/t0VJU2b2r35aufWZF3oWB9C4Cu2IJs=;
        b=X3XoZ3AA/5ehW7wPN4zXoJmYXY03AHV2BAgLvwhXm+7oCwvCPFZyxtyGGhpsv9Tj+3
         a/I6pmcCmvOdRhz11N5VrqkxOGphEdDIyLaJwjtsNg/HWINEBB1/p2yyahc+HEtiM2of
         Nm3b8IYjlfYXneW3rlzVf5GJIqdQsfE9AxvlZHE3pr7BZmL2rlScmWZsn71Ud62y3g2x
         isvdYHL1RmCmT++AqJkRAE9RB0F5rCG1EXgXF4yra0N7ZtGXB11r/qntStz8OW4WrYli
         df+Lj3HfN4H1F2izQ5hL9mCgbz1q33kN9Y22jq9u26ZpZm/cuktGqxAWrB1A/M4C5myB
         m4JA==
X-Forwarded-Encrypted: i=1; AJvYcCW/6M9xJWtfeEvKnChlqeFo3R78mryTRAntuyA2jjGebPGFo2zizRvfx5AJssL56isOG4iS/NJXZ9Hq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/KUXNpFhh/To/kFbpnzjDWu44dh5n/pfBQ8ezftJMUH+k/4yu
	LonJqI2fk9AyezhIPfN7fCQ4RQJk3P9TgvVolI0s1spWGQhtqz0Hb2K5yOpSOS3v5EiL093ko7R
	gQZ5tHQ9rEXiQ1RbpRYwcthMyO//Dhoj6YNv/nChtC+3Pj8g0kQ2xBKqxsQttkjlB
X-Gm-Gg: ATEYQzxhTOZRcA6bRMKe/i18cLTnsOXLmTKBqZu++6M8mYWPfy1aMbNG5bizbmLM/x0
	9Rb9XCGac/qoRBglb2RksZ9hpU9RhI14uInFB/9Wf/F5rmnRvUvKEhJ2vOqulpOC5+dxfxwPakn
	RlTvNEIxq3zQaPs5BIX/UJoNaDHK05VziCOhV8BsPNYk5GxBD7E76J6iSVPMWSuTnyVsfIM+crt
	T1hVxpfKxjAraPSsjElEd5+JgKK6qHq6J/YQi6qbgxEa1hjU+VvNLRrRCvMdImm4pbJg8SEmzCH
	O96EAjxd627v0mP050VSpZzdihzDij+/83GwZmPOuHkU14Llo3YI/5xxGhmMH3YqoRwtRTUmhLP
	DLhKwDQ5s0Hr+69+I8plFulKKy4f/NRgBFpjeHyPEBPNwvHfOmgZg0ycZ+kxXPglPVLkyV05GP/
	uR1+I=
X-Received: by 2002:a05:620a:4014:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cd5afbef4dmr441848285a.8.1772704490558;
        Thu, 05 Mar 2026 01:54:50 -0800 (PST)
X-Received: by 2002:a05:620a:4014:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cd5afbef4dmr441847685a.8.1772704490152;
        Thu, 05 Mar 2026 01:54:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac546ddsm883089766b.20.2026.03.05.01.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:54:49 -0800 (PST)
Message-ID: <07901284-a42f-488d-860d-985fc30d309b@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:54:47 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: implement .get_direction()
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        "Ivan T. Ivanov"
 <iivanov@mm-sol.com>, Rob Herring <robh@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260304-topic-sm8x50-spmi-gpio-get-direction-v1-1-a25612161fba@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304-topic-sm8x50-spmi-gpio-get-direction-v1-1-a25612161fba@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OSBTYWx0ZWRfX8nlcdmg9xNG+
 dle/Y9ImMNIGhnT898s3joyORqQ1lQC6MpRRtPHEvPzuy1pnke2hkXVQiUZTeJTx+1PuDyhZ/++
 8wFP8TxK4Tzfo4O7CvR0jH6YKMXjC6FMDSHE5xI3EEg6cXS2fdu0W9oGMz6FOxjtq5gEhpSUbZr
 k6JPLWfGWEl/9AhMZ6dznB2tHROtyWcIOV/GCtvtKzBdPVl+2FDqWamMeFBzaJ9b5je13Vht7LG
 KZOCWmjtqFPCkxCWPlR5NFJp+HDPqeHUb1ZhUx8RdLw1p6X+AoIjbFBqbxyY9bXXsYglGYuMGND
 ap6W8ce7GXDb8QuHxbe5IKq1mgajlU9wEs7DtgqOYktlVGBEdETNGX8i5fCcpcj77y6JgbgtTPy
 qPSh/2C1a2HhpUOTPisbuGS0zAcMxCgaEKIHDbfBlXj7wbJyQXDpDn1R6E4h4x95YE7bBhH3m1y
 UEDlzKmp0piRQsJiIUQ==
X-Proofpoint-GUID: VoeBUb7v5yulWJUj7sM5nvCk9FPYWh9w
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a952eb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=R7yui2fbp9-lrsd8BdYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VoeBUb7v5yulWJUj7sM5nvCk9FPYWh9w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050079
X-Rspamd-Queue-Id: E435A20F1F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32555-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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

On 3/4/26 6:41 PM, Neil Armstrong wrote:
> GPIO controller driver should typically implement the .get_direction()
> callback as GPIOLIB internals may try to use it to determine the state
> of a pin. Since introduction of shared proxy, it prints a warning splat
> when using a shared spmi gpio.
> 
> The implementation is not easy because the controller supports enabling
> the input and output logic at the same time, so we aligns on the
> behaviour of the .get() operation and return -EINVAL in other
> situations.
> 
> Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller driver")
> Fixes: d7b5f5cc5eb4 ("pinctrl: qcom: spmi-gpio: Add support for GPIO LV/MV subtype")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

