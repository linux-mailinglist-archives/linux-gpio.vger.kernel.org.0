Return-Path: <linux-gpio+bounces-35245-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLePFEDq5WnxpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35245-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 10:56:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C274C4288D2
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 10:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 186E0303D092
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 08:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E21C757EA;
	Mon, 20 Apr 2026 08:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8O53QDg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="daXU8Lyj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF57A38947F
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 08:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776675093; cv=none; b=L8Gtnm1UjHvWqnNAzkHRlFzjcsb3nGExn1t7SiovE7acWReJ4UO2/AT1bLr7ouqUyg5XPgVNJR0+vlgpSRH+BVzBY52yjMY+ExviSz0fRSBiHdueJCy4KpL6dsKv0LNwPN/10vtoCbTsC+x+By3Bw/j/xkgcZdNEPDgJ7v83v2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776675093; c=relaxed/simple;
	bh=i6UBZe8oWJSRHReo+WKtM+z3I85aFUTeaQjAUJUBrv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKAPsfnO10b+WtV0SvRKlj92vRRCXuS2wziG8NyPCOcdy4WAcwjgR5EcWvrrnYV0GXEE0jh5YEUNH3fz+LcBodSYNdfKTw0KgiJjmgn/UuGjesX2W/kLeBcE5TLANFafZDz3czi3WlHry7CAXvwmRjsvJN3fRcSiF2+bVdBKaZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8O53QDg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=daXU8Lyj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K727SJ3380192
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 08:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TelR88A70ZT8Cwr+SBo1h3ZMdcp7gxqBAEC/PIHSITs=; b=h8O53QDgrv1NX6Da
	Lx8qfNdtRkXI/FbXw4WOIbtL/TZ4VqHbsUSt4wMtI1lPFGvCDVXKCHtVQwSTzpwQ
	aj230XYTwP0/kiqxnsXwtxG/Qs2CuyR2CZeWzkyVowbSRD+eOVoF39Ng/pOl1wct
	ailBhhGZhHebVxLb4O46MWoGqsxlEatZA6tN1nZPbrxIYgT1yrd3W8R/cnARoKCW
	95ERJu/E8mLT1NRWtA3emrRZchRC/6CyLnw6EIFD6iOmpfW6qlsrZ5ZMDFdjBO/T
	Od7X4ef/PU+wCmS/GvwHwAc9qBLUnoucect6pN5yjiJyYf2pNy8ezWyoqJ6vBDkK
	6qF1bA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm388n2s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 08:51:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76bb22a8ceso3233175a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 01:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776675090; x=1777279890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TelR88A70ZT8Cwr+SBo1h3ZMdcp7gxqBAEC/PIHSITs=;
        b=daXU8LyjXCNaDcPiyLt8EDV+tsqb3rlQ0FNUUZPONA11fxwsstWk7XeezXcICcK+01
         Bl9ZFMxpiKvmDAsO2kWoYIVJAn6lVMa8tZbWzJnGNAPUwKKzVPF4gUhm8NdANVjTKys9
         C80MSOu1zyMVCbILv+4tMvUUfZjEBQNSAriyjhQAR7DYt0Nd3u+aM4ZKVOw/xwQMbsgi
         cHXcIqFeNT4MkHtaLPMh9mijky1beB+oRNF38Kbq5tLHMPsmLEQPNaKGTjCb1iUmRzGp
         vNDU0aUGpY2yc/pAjfvqJdldTkIa+URvSOTHrUyKgsmve80m5E23J1U/5cajGhtHHH4M
         3uEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776675090; x=1777279890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TelR88A70ZT8Cwr+SBo1h3ZMdcp7gxqBAEC/PIHSITs=;
        b=asT74JdY82XDxC1V3hWJt4tL7ksHJOQ5nreX+p50Cb+XarjkWPQdl8j+ZvZj4hdNu8
         W0Fo//7jM14C8d0CM6aj9qZwk660yqQMYP5mHvtPsOoI8pYqxtY2VOXRkx00e9tBpANb
         Awb4AnOqmoxjMEaxfQZrn3lCVS1wMsBsw6c8bbDkFFOqyeAiOXoUborom3jlXLfqYfan
         5ooF7gMpAeS6GlSxN2RDkKs4xjI4wKHw5m8z/Mj1WIN+x7v1+edjz45vArPPEjHjlxgE
         RJ8DLRa5b2HAQFKVjWktCN7qjMKBstKsteqRKOu3wGsZdzjnhB1P13dRHGnVXz8sza/1
         /4Qw==
X-Forwarded-Encrypted: i=1; AFNElJ/uzQnQnNRIXXcDY0jsUt/8cFEA7YGGNKHEUKvH/mYGtoC6NMYXIjN23nzaZ0bKqUhkllcjHvG63vyZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyOkRLKZAb2WRGCa3MkMl3yVz3OZatQyWbT6sLbrC+9rpyYVs+x
	8PgZ2i9CDFMH62mXSn2neDXQbIGYMm2qA6x9RbIfYVN3dDOJYK73SWGhFbDEQ2t6I6ZjE++Fd3a
	gxaG8S4nu/xq54EkqPUi8IvdDxFmWP66xJch3n7lYghQB0Yn47yJwKO7cRLsunKnof5VFl8n3
X-Gm-Gg: AeBDieu1TefkLcnCDRY6rtFSk3FPEupWeXNXbz8v1Ue3Gl1yqtv+a20QQDUziEpdbTP
	OpPQ7JLrDfA//vNIsemPqlY4e7zkw0UhTdznozu/gpj0cKgKUxVI6aR7fUuqcITk4TsCItzf4mY
	z+aG5nbSbm65elfkz607mCmeRyp7kZqnUV0P2ZWxrDfev65YeDoNSrbzU0quqoMM01amOme4kyw
	qSFWru7a1ATbAqei9zEEMrEFW9jsFZO0zrXvBacV+qi1ALjeEH6x60fmKOSNIHII42omNTwFGMB
	gpEaTuuUtnkUNtsTRZnSkpI5Xraus0Rmm6QbsbnROF5JfOC0bNVPnoKMZj/oYzpzNtNUM3ltELA
	7meFogITaVhnf4qkQ7gs0vTPpEpjdWanoo6sMiAKea5/3DOOuI6wS6WD2Dw1C
X-Received: by 2002:aa7:88c7:0:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-82f8c889b28mr13218544b3a.21.1776675090165;
        Mon, 20 Apr 2026 01:51:30 -0700 (PDT)
X-Received: by 2002:aa7:88c7:0:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-82f8c889b28mr13218518b3a.21.1776675089665;
        Mon, 20 Apr 2026 01:51:29 -0700 (PDT)
Received: from [10.219.49.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe41cfsm10618935b3a.43.2026.04.20.01.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:51:29 -0700 (PDT)
Message-ID: <951363cc-e09e-42bd-8eb2-ad4bcef4dcd7@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 14:21:25 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
 <20260413122233.375945-2-ajay.nandam@oss.qualcomm.com>
 <36b68a87-4d52-4d6d-9e5e-393eece1a434@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <36b68a87-4d52-4d6d-9e5e-393eece1a434@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GthyPE1C c=1 sm=1 tr=0 ts=69e5e913 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RCzW09EukMXCWuothKEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 7aWCuXSwvbZGyKxqSbS9Ru6SeDyElzCV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4NSBTYWx0ZWRfXydyYKaQulsys
 boFI9UjxZD976p8hjy8ZVHbqob+quWm93ZV7CPwrcpGSpcwKVJHgLqAGXKenoTbQ+4hKNFDHGft
 6cKW151LnlvUj/dQfqWBXNaD46Opdv54TtBCXOgF5LtDgBDa9w+sJqjeuEgQj5DcKworF4+kLjq
 HTZGLVbbKPmiQa6AkbZ9lcf2v03wCQXwLKuw6niEq4pQvZl3w+5Y4SzRnjX4DjHdcTaMHQTMyJW
 kfzKdO2acDZMTsKJSQGHiP8olJYTrxoOdTe3FTyCNVSVGSS4/WL/MBKuWCEXho8I6DJNg67LGF2
 poYG+AEP7TFEAFYfJFghLINJYe7b6GFcdbxv2Mj9GZ6lgusL0Xh81aegOOgpOjJdXtejc//xj+V
 INg+gTxaf4FwAcS4QU0hWDPHyT7WcQ+ioxVHPtKS++z2VTqbDmzlGqkxqYDnxrOwyKvF8xHHQeX
 RLL9NpjRCzVxwsvTRhw==
X-Proofpoint-ORIG-GUID: 7aWCuXSwvbZGyKxqSbS9Ru6SeDyElzCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200085
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35245-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: C274C4288D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/2026 2:03 PM, Konrad Dybcio wrote:
> On 4/13/26 2:22 PM, Ajay Kumar Nandam wrote:
>> Convert the LPASS LPI pinctrl driver to use the PM clock framework for
>> runtime power management.
>>
>> This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
>> improves power efficiency on platforms using LPASS LPI island mode, and
>> aligns the driver with common runtime PM patterns used across Qualcomm
>> LPASS subsystems.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +int lpi_pinctrl_runtime_suspend(struct device *dev)
>> +{
>> +	return pm_clk_suspend(dev);
>> +}
>> +EXPORT_SYMBOL_GPL(lpi_pinctrl_runtime_suspend);
>> +
>> +int lpi_pinctrl_runtime_resume(struct device *dev)
>> +{
>> +	return pm_clk_resume(dev);
>> +}
>> +EXPORT_SYMBOL_GPL(lpi_pinctrl_runtime_resume);
> 
> You can do:
> 
> SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> 
> instead

ACK, will post accordingly in v2

> 
> Konrad


