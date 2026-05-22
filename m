Return-Path: <linux-gpio+bounces-37352-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OJmD1Y6EGqeVAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37352-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 13:13:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A4A5B2CC7
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 13:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F160830066A5
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F6A3D1A86;
	Fri, 22 May 2026 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zm2akx2D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLhpnOqW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEF93BAD9D
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 11:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448399; cv=none; b=l+tVbr5b2VMY/TvwDROwMh3DNuYwyUb6JNYMzunbT5JMO/C2xB5dbA6/QkG71DXp98vGv/KqBRkfeICjxtraYLquDuUiswLl1vyLsGV2AzgqlKRKDnYgmqM7Uu+qrAssr2S0iqDHgVktAF0FWsvSIavWB9FIkhU93ucjw1J1rYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448399; c=relaxed/simple;
	bh=qqkzKz9aumxskViF/d3UgNpUMzUAq30H6/+d3NdJaw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TEQUjbKQ/3D/sxjC/db7gJ5HUXPAeiNCQ616EhCsNMrX9+U76McXtac4F85u2IkFPbUtkKm/6MhEbNZ8o3TvP1ZBvlYdKDNmy1HPGAUo9bMsXdyApivrupE6uDQWXiu9GnqBcmvj2L0sUBExsG8aQ4gHzFsieKQ6I9yYIGmfHAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zm2akx2D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLhpnOqW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M5sXYo777027
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 11:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0n+tw6q3MR13TyJnhZFE+1mC3GQu1m49GgsGGRo5bP4=; b=Zm2akx2DVKO2e7fL
	5dM0Im6PFcR4m1TZMBbittFgKh7XGFpC+z18djKhD/Wg0Vno8jOurI7hEf/TdsNb
	i3occPY3mUPil1iChFJvWECiRQh4JnjzRQ2la8WHz1M1S5yzq6ZiSNt9o6cINa1d
	tCl3aNveuIOrtTJF+3uZ/0Ep+MzTeeLcy9cbCoJT2a66En+QzmMqknRhGhhOCpyN
	GriWgMBciI1AEI8hv9hj9zwTJ8WIMs9lMT112UyFnYyWo0V0BL4CO3zC08kTqYSb
	QwXzrci+UKjXk23rNIF6Cbd44ILmvWQoh7ozHaqsI7YStrRhwh5ulPHalDshMkR7
	txvsEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h377x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 11:13:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90f6e66879eso180211685a.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 04:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779448396; x=1780053196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0n+tw6q3MR13TyJnhZFE+1mC3GQu1m49GgsGGRo5bP4=;
        b=VLhpnOqWeIWCL9I9Ry9Aa9L2cFnQQfum6zm3gzYrWhOAMo3L9DRjKkUwfmm7Wkg5ln
         hgOzHYHQ6Jcpz8IW66zWlZAFqrS/xlFnifI5Tk7gQelZLOPUZ+HlI/CPv71nPUlJWNfh
         6vOjFuc0+DSlm3kkurLYAxtk7RuOuvOW5vs4WxWitRzB6uWzUItfkQjhvU6aBjSGlusZ
         aVrSou6Ikv78AQ+ko4S6u9XZLMwXHth7fhpnrpDypnaWrRUMtplsTEWgAyAYTxR/UCob
         QWd4OQSkW1Xsayd0LEVZ9H7Gd2sUT2b7IaeZL/KiXBvMVoOtOy0WjMtyJ42fR1O1xAfx
         Mnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448396; x=1780053196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0n+tw6q3MR13TyJnhZFE+1mC3GQu1m49GgsGGRo5bP4=;
        b=mi+n1ZVu3XmXcGnitRK3Z/ikmGAMytHlFBOEI0Kq257dcm4PegI1TWUUmGZZFd8f8J
         GwtNzAulxsVxVGsq4Pofv6XSsE4X3nbQ8fQ40CaPYEuvdXzLo4B8d4RdUF3Sxcx8rtke
         OBuxz7/IBBWToT2NCOl85xjFv+3m/mdQ3UoebOQnBY3yvr11UTbR9/9irrEMXZzphVq0
         RNEm514h9M0tzPlC9jBo0cb1SRapJicB+rbM6BR2Z825Rmrs9Ur7qIWWYkM5JV60aO2m
         Q1/MCaV24P/JPkXKH8pm98M2UM+jsi5rMPGIwDzj1SeVzjY6QsNmtWBechWjh+O0Mnfj
         yFdg==
X-Forwarded-Encrypted: i=1; AFNElJ/KVDTF3p/R3dSur0OxXAIolR/BQXoKpyar+Q/QtwKtWilYbMllvlMMTzp3OBk3Rkq4Clm17b1knjV3@vger.kernel.org
X-Gm-Message-State: AOJu0YzaiJkpclEHIV1iHZ2rM5t8C46ZSIokQAqNb+/kPNT42zDrgMcU
	inSknY9DzzjdEom3RvvVM6lQPqM/ANqH/fOnD8hEorvmugRmeNL+4hO+CI35WP7TA78D4MLQ/Pk
	OpRALsbflAG9HBi/n9Z3bh1n+DQ58uxE/crrpYXy14xNJfa6eH+bjwfNr2f1cBTQuWCiUcEaz
X-Gm-Gg: Acq92OG4ajktvKc/QcDInU1Ood+z4xHfiVI9PT8J2LKEL4eedLGbjG3zyDVk4jh+1E7
	Bz3/e3DhEHE8J38P4KDk2UkgPtfGHaofVzhs1Tt+TmpT7xm68oDgF8muAacWf39iG7CAuBlwIx2
	t3AlurpvRkD4atlq4dpwvqluqq8UQsnVs+AW58Yp253f8NiRlIWsEy0TmS3yNNEG9YCXKhYzYEY
	6Iri9NmqzfePKZUWDffZzVNZWQcr/pIMev0VXvRcNbDsCl02l0CH4mxTqOz1WLX/6+ZCKsBhjsv
	0foTgqhIpnJzD4R7Qbp7KEbgRVn8KVN8U/vif+hvLXWgK3CNgv447cku8n4HzysEaYS0ajNnbY0
	3IGy9M1ZjGTUAtvyh18XHveOyr0xFJHq6+2oPliasYsRn7ydGpAT1YJch
X-Received: by 2002:a05:620a:4109:b0:911:295d:59a1 with SMTP id af79cd13be357-914b49d8733mr300185885a.8.1779448396450;
        Fri, 22 May 2026 04:13:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4109:b0:911:295d:59a1 with SMTP id af79cd13be357-914b49d8733mr300180685a.8.1779448395872;
        Fri, 22 May 2026 04:13:15 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5ecec50sm42891266b.31.2026.05.22.04.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:13:15 -0700 (PDT)
Message-ID: <d0259627-bdda-4533-9051-a40546241e89@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:13:13 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks
 on LPASS LPI SoCs
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260513140009.3841770-1-ajay.nandam@oss.qualcomm.com>
 <20260513140009.3841770-2-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260513140009.3841770-2-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: syZWGg_i5KAL0T_QN737Y5qzWdpe1VcM
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a103a4d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4BbeL_lAFTVXvkP5OvYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: syZWGg_i5KAL0T_QN737Y5qzWdpe1VcM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExMiBTYWx0ZWRfX7eimFHz8Pwpe
 6AOsMMMz6l2Bcx705NFr64WQdelyKBYgrjZ8aZsdYZ7z6SU22FJ/pHQb0xmIQ1dXpSmew4EckiM
 zx+e1tny2e1KEXkZ7JJxsq+kM/XZdnZLAet7BIGzeNmRSs9LS6zXqdsGiHyANJRwG1RalidQIEa
 Rk37Gv6YSz45zJzmAxL3YHT4p2UYA1ZEDe5lxes0U2fLs5dSA3HI54hYpYd1XQs8+t5tTyBFei7
 bKUQNQ7gR9BSF7lQz3pB77giSci9Ztzn8DUZHMEoX4zBns2riex7GLpeNNDf2Y75mcTf+DaBwlP
 4aJyLp+oMZ3rXSh7qn709oBK+xH58wgEjqdVFicrQojYZT7N+C29+cY/ajvhfxwhYXu8oVPP0g7
 JeVIDvBUbJMsSvXs9Im0tK8j7in7apcI3/LqPmZDVORiBCvCJl4cwZqFVVkEoIHtTNsN45VCtOa
 jyciLUYSEYcyF/MJQbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37352-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5A4A5B2CC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/13/26 4:00 PM, Ajay Kumar Nandam wrote:
> The LPASS LPI core conversion to PM clock framework relies on variant
> drivers wiring runtime PM callbacks.
> 
> Hook up runtime PM callbacks for the LPASS LPI variant drivers touched
> in this patch so they are prepared for the shared core conversion.
> sc7280 wiring is completed in the following patch.
> 
> This commit is a preparatory NOP on its own, as runtime PM is still
> disabled on these devices until the following core conversion patch.
> 
> This is a mechanical per-variant driver update that relies on the
> same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
> pm_clk_resume()) and DT-provided clocks.
> 
> Runtime behavior was validated on Kodiak (sc7280).
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 15 +++++++++++----
>  drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 15 +++++++++++----
>  drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 15 +++++++++++----
>  drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 15 +++++++++++----
>  drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 15 +++++++++++----

I don't understand why the 7280 change is in patch 2, please move
it here too

and you still need to adjust

drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c

Konrad

