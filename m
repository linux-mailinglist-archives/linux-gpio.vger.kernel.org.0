Return-Path: <linux-gpio+bounces-35466-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JLGHUwq62keJgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35466-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 10:31:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB1245B808
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 10:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC4F730684E1
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 08:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A773332623;
	Fri, 24 Apr 2026 08:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g879Bmck";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TYyrvBC4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BA633067C
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 08:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019203; cv=none; b=XF3Js27Q8L4EAqjj7sWTepvPH5JYV22gHBb4RWSR7utTr1WKY9tZShHl+l2zsJgJ2+uVZL8sF9GHKEzOSkEMA6rhsecsIRqiE8PEE2xAA2cgdXslQqDdb1n+3Qz8ujtR4U7ojsOyIXhGBCyMs7/hofLcpaMOa9nXETM6KVhnjf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019203; c=relaxed/simple;
	bh=mrjuOE3fp3ldYK8xPEL5xhkLTfhi7Ytij2WNvb3Mg1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMLZUr1VpnIblQB+QsN9XRDwZrVhMZEnzJUkT29GIbewXXh730M5ONTd7fLBDTaTsp6wiLvbpxHiYAv1rVCWDTG3EF3K36jHNluMm/Jo7B2y9YUZaJuYRJJGUuTzvDD6aA9OL9E1veAQYXxfYQYG/O0XaO2Wjnf4bI2jv0ops9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g879Bmck; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TYyrvBC4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7gEZp1888659
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 08:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sKHlaaiNgSfzIyzrCdP3s4bzl4EsQF8dr24Ms2iKUW4=; b=g879BmckryV4ZlOB
	VZwc1CVfNaVvWt42wfdBeVu9mEwcxJk37RGmn6MhAkQpCnCYvislqOrzQP8Zk23U
	Y0MBXgzxF9DDL/yooDBuQMZZcd/dWSWIj3AvjW3fZgzS0e/LOziYoru47UcV4f1w
	H6Zb9CvOXoxW9YeIFOr8hjxj53Ra42k+aW338OvqD9M+GMSgifcDxeMFgtrnSDm/
	WyudzyXJaTxMjMPqCCGxhIX96owmP+SRs0a+r7SryYe+kiiW7Hnd69NnoikgNMKN
	/EToGOVU3+f/9gaqVVTePvMdkmXdC7ABycEonEDWvxs8/ALJV3aE4VJ6FfjKM8z9
	AzJRkA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqp9dukam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 08:26:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7973e22399so3074189a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 01:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777019200; x=1777624000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKHlaaiNgSfzIyzrCdP3s4bzl4EsQF8dr24Ms2iKUW4=;
        b=TYyrvBC4IFbN/Ktv2ZGJ942Prok3iDFDyGUq2YzdYW9RkBwgxJDFe9hIzPM3Q302KN
         O6xqLg1Kv/6i87jOOrTYH/SOJLqVM9dUs6T0JePy31USI1R9e6xjnDU8RWIySxujccgk
         Ad8RX/o6qLCmx5c07halWHA3xTaNMF3Y6YGNyPCjOi0hFymBFvTndz+unbs+x3wfMaK3
         uxkSh2YYqfmNErCPMSUQerx/F43L0VW/kQclZw2ZJUltrQDWKcuBrDFXZ1cW8QJBCqVx
         QOshVfvNF7XaKo8HwyVVLYEq05FrY5bVs/WtvFgJR29KYs6ubl1CaNx8pVF17ilHc+ql
         t4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019200; x=1777624000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKHlaaiNgSfzIyzrCdP3s4bzl4EsQF8dr24Ms2iKUW4=;
        b=Vh3q5oXd3qv9FRVe/5U27pHs0KEk/RYy3bNa35/JUVlJ/nYDauvmISB9NFI+lTm2dx
         JrKGnriMGrwMyyyTG4IX4/oeKQcp6gPglA8WsJXHanHyb348evfRiOVpSPiiCKLfW23V
         u6Jy2R4o82uVJMmbUUdz0D01USVg37QAzc8TlXLCXhxe5KD2yuuFWU77kC01Gcq9o5Tq
         J3MKFI2YNBcWtDzvU60T/HG5b+S6vQOrjIEswJFMQbYxk56DXAgjJCnD12vmbTdMIi0g
         LCRudSCPPFaJIVXAUk4IWso+EcreGpmHSoB22/eIrUzz6UdVMacChfAyZnBZ5G9go7YB
         +8eQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jRSNszuOgJcAQUorrsJeQsoXNuB3j0UrYsELVirrUrgBNg0ayMERX+U0JK4GokMqELu+kpa7MY8ie@vger.kernel.org
X-Gm-Message-State: AOJu0YzSiHQerPWEiOD4jlSlAJiyvqAyGU4+YMwryL9dLprWm/I6K2Pp
	ulti/m8ubKtC8cn92PHa3tcX9p6qdLbUROiBWRuxlNJ2ah7Y9G5W0W/ro+idwfXLGvp7q2TyA3u
	7FXYxX63BCgLcD/ptGdI0dyeBP9xD0TDLR29A7vmrfHRzZrFmDRS2pugmTOlf9ToHd9Y+ObCc
X-Gm-Gg: AeBDieuIhvhHQdA0FkDi5GNeW5iTWH9u22SZKRbsS4FuO+wyGlLqw5OBg8n1mnFj7H4
	86Pnhy6/F+7vkoebrjtWvmvTcbY0CmffuZcCSkMQ4q+3R0zW/YIfS/YYN34s8lki/UK4B/BFc26
	T63k2uMjISHwa/wcEk65gkgiHghALjWPt0xvD3FnWN+iMFWRzg1TqBX4H9FYn9IkPoPEg68cRrn
	DGwv+A4zEVNuJ2j945FmMnT76RTzPsxpWlbUam7cC1uSCT20XfYJgU3HwExaDfJN9kgJb/YJpKX
	8rKyfHREMCDg17VACe+tfjLnntFEE/LEAOsLAdXOTGKDhYM105aq12LyEsb0DMAOgiQ20rKOaY6
	q+5ytXH0jTM5hL3YeLmk33MU5rIOfuqAJRPQo1UMCTIsUjQmXkUYWnaspmYbU
X-Received: by 2002:aa7:914b:0:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f8c8c39c3mr31279183b3a.26.1777019199750;
        Fri, 24 Apr 2026 01:26:39 -0700 (PDT)
X-Received: by 2002:aa7:914b:0:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f8c8c39c3mr31279171b3a.26.1777019199243;
        Fri, 24 Apr 2026 01:26:39 -0700 (PDT)
Received: from [10.219.49.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec06cbfsm26639666b3a.58.2026.04.24.01.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 01:26:38 -0700 (PDT)
Message-ID: <ce370616-9499-471e-8217-726655764b00@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:56:34 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
 <077cec8c-f6a3-4ee8-8ccf-7bc2e540bc61@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <077cec8c-f6a3-4ee8-8ccf-7bc2e540bc61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SeHGEKo1_zyZU1iF2e85FQJJt9DA-wbJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA3NyBTYWx0ZWRfX0GoTiNEH9GVs
 sX0zSOOBSWUPA0Ow8zSVkqA0UkH1jMf0zSEi17GK59ksS7r1gEd1UvIirFgxpYMWnJCAU0L4FHH
 P72JarqLaRTsVVs5tSXTtSoEwWHkhHWWQBznz6M1GEGowxL/eGoEdvvtbj2pGjOHgSM8kD7kzLf
 cawwe5YlBPDJOLFwWsUim5ggxX3Q/vnfLWDjjfiQL6/k0Frsqo17wFEI/iSh0Kot89jVWEc/Ps2
 OZfeEY4MrmowMj+af5gHg+ZJ9dw/uiVSVHHdIg7E+e26WY1UV0vASxCT3JeUWcMrUSPlqDTvhIT
 /87nL7DnZdtNdh8wnllK9FUnPLGXK5GiSpeNEmA1MVQ5ZC7s5Xwcp+Zqvd7tzqefaQ1db1dgm7X
 N0Jb1hnJP0wjkKDp+qPNg+MWuwJJ13iIoUQhm9fzwpI0vw0xVJB0JXN4tsiInFFy+P3+0GNstz2
 lL8/luOEN8/8vw8wjjg==
X-Authority-Analysis: v=2.4 cv=fP4JG5ae c=1 sm=1 tr=0 ts=69eb2940 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T8sK16H612TzD4tvtxEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: SeHGEKo1_zyZU1iF2e85FQJJt9DA-wbJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240077
X-Rspamd-Queue-Id: 4CB1245B808
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35466-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/22/2026 4:29 PM, Konrad Dybcio wrote:
> On 4/20/26 2:31 PM, Ajay Kumar Nandam wrote:
>> This series moves LPASS LPI pinctrl runtime clock control to the PM
>> clock framework and ensures GPIO register accesses runtime-resume the
>> block before MMIO.
>>
>> The common LPASS LPI core now uses PM clocks and autosuspend. Runtime PM
>> callbacks are wired for all LPASS LPI variant drivers sharing the common
>> core so behavior is consistent across SoCs using DT-provided clocks via
>> of_pm_clk_add_clks().
>>
>> ---
>> v1: lore.kernel.org/r/20260413122233.375945-1-ajay.nandam@oss.qualcomm.com
>>
>> Changes since v1:
>> - Kept GPIO helper return type adjustments in the runtime PM access
>>    patch and switched access paths to pm_runtime_resume_and_get()
>> - Added runtime PM callback wiring for remaining LPASS LPI SoC drivers
>>    (sc8280xp, sm4250, sm6115, sm8250, sm8450, sm8550, sm8650)
>> - Addressed style nits in GPIO access helper declaration formatting
> 
> Each patch must be self-contained and not break functionality or build,
> so that bisect always works
> 
> If I only apply patch 1, non-7280 platforms will still regress because
> the changes made in patch 1 require that pm_ops is set for the clocks
> to get enabled (otherwise it'll just autosuspend 100ms after probe and
> any subsequent accesses will crash the device)
> 

Agreed on bisect safety, will reorder the series in the next version.

Thanks
Ajay Kumar Nandam

> Konrad


