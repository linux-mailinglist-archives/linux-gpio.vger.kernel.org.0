Return-Path: <linux-gpio+bounces-35412-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJ24KggH6mk/rQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35412-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 13:48:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C00D451775
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 13:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BB2B304D412
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 11:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC943E6DCB;
	Thu, 23 Apr 2026 11:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UAG1VZ7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZG39+YGg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DE53E959D
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 11:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776944837; cv=none; b=UmqcYst/VeKivbknULgTWtRfpqo0wJHhBSFyFdtKjiWCyDeq7ZSCmPg7nyx278Sa8TFccagMRaVPW1Rjr2I/cTrAnW2gmgX3PCP8TXEcGpI+vpyVTFxVAXTMA3ARpBODQDrauTrLPEN7hNwVosMG7RAHRiMRY8hp9kzAIC5D6No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776944837; c=relaxed/simple;
	bh=pf4xPrLptPcZTsfyBX3J3PHDd8iI7szlgq61F0eoRWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SON7RM5Vk+VlPm+fIbbhQ8CpmJcA/h6+VqsXQWYPZP74HB13KMy/qbLpFz+pwwfsVLYy2/u+VKPxiKFg00okmPu5V2O5kHA0ymtHdYXRHCV0+5PHOiopA7cdmnuHf4AJ8wHm0uSQlHMyBFD1bXMm7EwTzieeh6ljCzXv1eUjG1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UAG1VZ7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZG39+YGg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uFP93044120
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 11:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1zuWgAnUulF9AbNuuLh6oflt6IMnhJYD6QjmVzuEsHc=; b=UAG1VZ7woy9X6KHE
	CEp+mnLPMnBnJs+kB7wBcQ42sm+/aOxGW4SlFitPofZULHADC45S/7V5KT+cQ5tK
	O21Iyy9q/NDTc3ADsYgkW0eRQcSKXZjk5v3iBk3k8CZuy54PI6PwFuj/PiSOZrKH
	zeX80xDE7JfbGJ+nhjYMfRp9BzLwwT/PszJlGFK4MYvvYbJR4X5/V5ZzgwRx9QiA
	TgFtoYeZn0MmublGZSsnbW7K4/xZMT52mbDtl1lO8S7P/urJWlZwr/DKceQ5mnne
	/TV9a+U0R1sFmdjX7rFYzGfdWgfvYgZ357Dliah3FUBnewaSo1XK1hsRJOTXsM4+
	44LcgA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh3qe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 11:47:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so7012315a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 04:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776944831; x=1777549631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1zuWgAnUulF9AbNuuLh6oflt6IMnhJYD6QjmVzuEsHc=;
        b=ZG39+YGg+7/KxrcaJySGRFDNVY8qVjUpyeMwrrWdF45PsJiQr6nlYYOvW6yniTnTDv
         559vSbz3eDkdzobWRXgKckJS55tKg7Df6X/ArdgX7bpL5YDMYCpXFDI7dCrDAj6/n9E6
         Q+vJfAXfuH5cHLAN0HUY32TA5lEU136GMKDq/Z2R0FR+FqW+vZFLJuRKROenoorbqD18
         5Ln8RHpESXfYYl/VQhhh+qw6rFhvZUyoX0m+I/DQRggqR5y58b1IIu8nNxHu3o8sbwv3
         S4AIT0TUvsJ2Yds7bWakipJ/NIXaltt+Cv0TBEYYpJjieWMXrf6ZXgkvKF+afVuyUy5+
         xY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776944831; x=1777549631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zuWgAnUulF9AbNuuLh6oflt6IMnhJYD6QjmVzuEsHc=;
        b=W+Thv9jbOEsxDR/vCYcIlf7e7M8gzQ1PAMcZUIAbTE24IjphVbBCJQxAagbS4pgCm2
         5ythGF4V/2kVQiMDsboneJVC7clERuEAUHCDnmK8nXYlH+N1R0/HfxUytwi2FNNUZEuV
         KJzpSQxqsayfmI0yiWVhpW7D9voVZxsGdo7QwmHlaBaUyrwWcRYvS/z2a7rM06EGVWId
         Dj2ZXpMD6QgEF4UxoHICwGj+/rEmlGPzikKqfALLMWft0KTsNpGjt0EZ2p7A+63+2o5i
         XpFZ6AtE46goxnLVHJIOsSINUwDJ1O8luYFg82fZaaq3PSpdCCRr81NrccKksAcMk1HP
         4ZDA==
X-Forwarded-Encrypted: i=1; AFNElJ8AfJ4EabIfKbzKe00pl2w/bEiEBDC+Fjrf0QfR+WD89VqMFrf2gHVOmTEDjK/Lwno3dup7ufqaD9F3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5fnD6SYA5wEaj6ZqJ0pXtThRit7ZwUKAhMu54nvBu+9deZSnf
	IDPOwyCXONw1zaTonQ/MtpB8GJ9rgzu5gC6mmcnK0xBJ+AQaEF6396hmm2KDv+BU26GfUrzeW0a
	lfQQc5BW/T5JHnMiKR64UvKgK7voXCRGahPNbgwoZW1SrcD/cvgK3KZmoiAB+CT/0
X-Gm-Gg: AeBDievl9r9Ccq83/l3eunLUXfTTNyqG5++R47c4c30CFMlFA6lu3BBidiJv0cTlHSI
	h+I4NsA3+qwCn3DRratHJpjF/mxCsRdZ1BQD3Ub2igLWdcjekbsgMAGqGkE0589Av5Kbn0v/whk
	Tgn4jtuyfZhIkWTdHjMq9/XwvJM0NXPS8XsgLgGBL8np7EunmToKnDEw2YjBFCMvSpVALveqnft
	obbHb1HYrBRQ+ZpPxo6irkPaB6eA4qYsqq/bdAVH87x9ziRBcpBg9i3c2Leken87B2OKuHZwqnG
	URa6INyltoQGYc5iyKuQOM4aw/Q26kWb8HBFm2ecljng4QWRNjA+qmWVrMcVeqcrSo6s5blcUgz
	mSYZz8tVzQ7P9mD4/6sGey44VQWfTQQBGNkweh9oQhzByZv7XQD5w1ph3ZGoXYNk=
X-Received: by 2002:a17:902:aa98:b0:2b4:5cb8:99eb with SMTP id d9443c01a7336-2b5f9f8808amr205116695ad.27.1776944831272;
        Thu, 23 Apr 2026 04:47:11 -0700 (PDT)
X-Received: by 2002:a17:902:aa98:b0:2b4:5cb8:99eb with SMTP id d9443c01a7336-2b5f9f8808amr205116385ad.27.1776944830776;
        Thu, 23 Apr 2026 04:47:10 -0700 (PDT)
Received: from [10.218.6.76] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4049bsm177109095ad.77.2026.04.23.04.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:47:10 -0700 (PDT)
Message-ID: <6379a497-05dc-4cc4-b1cd-1efad3eff2c1@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:17:05 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Fix GPIO to PDC wake irq map for qcs615
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260423-qcs615_gpio-v1-1-f2d5a31ea3e1@oss.qualcomm.com>
 <z5bkivkfvr642qpjujpqzwpozpqeqhs3vsqcpjfbkgipr7csko@fs4hal7fvqnl>
Content-Language: en-US
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
In-Reply-To: <z5bkivkfvr642qpjujpqzwpozpqeqhs3vsqcpjfbkgipr7csko@fs4hal7fvqnl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExNyBTYWx0ZWRfX32r2isO6wAOS
 C8wmChiM2ubmrLbsikxNz7vuTHqjK6LLKNGSqNht8MBApc40mEG3k8C5CvaxYP4Mw72KAwRo7rh
 ejnwQzeDWl7V31ThKh6WnuO65PnmVF1E2wTdAdr87EaTfN/1E/DKMx/Qa/xPLtdVDv3bE5BsGXP
 kWCeayojWe2cBJF5cone0jIQiSP8pwSWRqJir8Rbfzjv7jPJcbSCgLyrymAhQcv0WvyNrRHKRKm
 zFMtUSr8vihC9PmtQgaf8tNJytAzrYXtNd2DUhMazP+xJvBr4OubZurFeOYp5PJeKORdOBcBLzo
 RDt+oGYyRH14a6ERP4kOOndIC2hOP/MGCb7bzcnthTnnGg33kUOBqwQ2hdc5OKiKd3ZOanZOO9U
 JkyYbOwEtfK9ehxRVInc60LvWVYrzb7HxVPTVm2cIUedHGFDF20G2g7ldOa7LJcx7z5bzVNPI4T
 UGhpwwSzpoqAWhRcemA==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69ea06c3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HsTIzs3zK7ntyYVOL3sA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: rHDX1_ELCPFTiUR4Z4BQzsvCiuB7E0bc
X-Proofpoint-ORIG-GUID: rHDX1_ELCPFTiUR4Z4BQzsvCiuB7E0bc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230117
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35412-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[navya.malempati@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C00D451775
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/23/2026 5:00 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 23, 2026 at 04:55:24PM +0530, Navya Malempati wrote:
>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>
>> PDC interrupts 122-125 were meant for ibi_i3c wakeup but qcs615 do not
> 
> Is this something which changed between SM6150 and QCS615?

No.

> 
>> support i3c. GPIOs 39,51,88 and 89 are also connected to different PDC
>> pin to support non-ibi wakeup. Update the wakeirq map to reflect same.
> 
> Should there be two commits instead of one?
> 

Removed the ibi_i3c PDC mapping and updated the PDC pin mapping as part 
of the same commit.

Thanks,
Navya

