Return-Path: <linux-gpio+bounces-34998-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN7yInjY2GnHjAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34998-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:01:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1B83D5ECE
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0D29302E0C5
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 11:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F933B52FE;
	Fri, 10 Apr 2026 11:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Phits5Y8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PxS5j8tL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D273976B3
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 11:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775818863; cv=none; b=agf4/7HnXjd4oS+b0cBwbKvw/ofzMiAp0GrsabdLvKIZgHJ9eTn9qzxeePr3rd/fPuN5wuKpLu51ZKsYQaMJfxWMufVipvGSp53z9VUyEZfdl372lb+SdQC8SUZP0IW4Ce+k4rnxa6OsgsbFrEEoe4tkB/jf5tfmDKTDr25i4Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775818863; c=relaxed/simple;
	bh=6wI9cMZAo2npTuJOYKZetDzsYNbkWj9//2ujo3YHFU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TywXUO0unfsD0vFEkvX6QQQo5o7HNO9Ftm7gIRcRwaPUFA8QwqeARpvAcixj9GQWoj1qfEG2HUJy4CWmtY4dAFhpd8X4b4l97eky0Id7Gh9EOWQQZ+4lu++CMbWXn+hDJ5SEmTJwaIBuscC0HVtNFkqMSbx+B6QMTiRxOtW8GJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Phits5Y8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PxS5j8tL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAWrLw709170
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 11:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXew227V6g8SGJxO+3ueOdrfFkheSi9hI9c4QCoM/TI=; b=Phits5Y8ooTczj4O
	vvUmCNqgrAHGGXza3ZVA6oLBXo66NvwZrZhOL9iKeVLv90J+TbVYm/k4JhM2IVpz
	rja0LnasFZA+QSe+DLZcg86nk0gjKHDulX+vgf7//9Q+O4WN/vuP/U0KKy/KqTp5
	TRmkgP1jvTaIJXJZBFjJqsXg+boXzUbCc60fgUkMVlgdx+WFx7iInxOnuCJTcYiL
	Lp6rS/8D/zFzgu5wkjh+ZRde76UTue96r3kNHhXyKX/tXBW+JE0aHS1mmjP0TKhC
	WMMbeoaLGfa6zj70QmAnq+WZLdM1OH3eCQT+GhqEnRTNKdxnY6bxYvp2yvfnAmdv
	bTQ6Cg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj14gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 11:01:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d826ed6f9so42211751cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 04:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775818861; x=1776423661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jXew227V6g8SGJxO+3ueOdrfFkheSi9hI9c4QCoM/TI=;
        b=PxS5j8tLv1xi4vZwnp12tbCozSJjdeLg9IjwHZd0B9RfZGUV9sj0vannuiB2GdRyh3
         nsdFl7ESSdIhD0ScFDhCw+sfeX2PiYAW1YRcr2fEczkuaO1yuq+1u/UKjecqOViW5V1v
         K0Lr/c/GVKZiBQ0ER3fRiv69x4YkgC0T6GSkhCPn6gZHbd/IT6lB40kuHWPFOCE4745L
         YVmRCjKM5oBRDfzWN5uLoMS7ceDEG7/zAmU5efa8kHwjkwVk+y/n3f2tchYdyPN1ZFYF
         QiFP1w3Ui1qZD1CVfNCLSgEoGNG+dvDKGDiWedzq6pl6SFI0J/+yAo4SoTaz4BTFtCOA
         2hSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775818861; x=1776423661;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXew227V6g8SGJxO+3ueOdrfFkheSi9hI9c4QCoM/TI=;
        b=qxceEgS8f916dXI6YHBsMMmTyUqI/nSW2J24U2o9l9AhRWvvE8ar/NBJHNtEvkgXIs
         WpJ7hWpEUE6TkvtDF2UDdkxZN+LBej8ZU5L3BjJUqvn3pCHYm5wNRLjsQOlLZtdWTTfp
         NU7RDRxbmQbAqgNVIDVzeyxvb1+cj2lXUbMqeauiNDGHyOxQt3WI4U5Bm2rHyGBe99oj
         gYWmw5wdAJtUewiT3kS59MsiFOQgCEOSUfkOLa9ZNkLJVfc5W6YUXONAjJwhKZEpEXYI
         yxANZzsK0wXxHtt9yfCsGF5CWxnZR8UyqhkRT2FwbojpBTbP2UBVSGR01ccMi8EDjIMn
         /OSw==
X-Forwarded-Encrypted: i=1; AJvYcCUrQrLlikSXaHar1tPB8LYc2COArd8UUy9YakQ1EKdaO/cq2GDhRR2BBHuvgegwGQPXLW1IhZox8nit@vger.kernel.org
X-Gm-Message-State: AOJu0YxKLojtOmMSEN2HEyYhyKxZdIBnMaFPkeZEtUo9h3TJC09gBh6G
	kCirex9VcNYH8qY1tYgsWks4FyONyK/Y00brFL3VwGzrYEfgt+9Ia25eiLiI8QvJcFTiis+vrw9
	Njywo8BXeP6j5fR4A4PBAVRQi4jT+x9dNVF0qJ+Zqab0av596BTwQvYvb1IZRKjFu
X-Gm-Gg: AeBDievl10X0oEBQ5pH+J24Khp/vCJFX56N8PlH4ZwM6cIZDY2iGAHny+izcNx4jO7F
	yDL30b1pNtQI15584V+XlaWqGQYGbCJZT7NB7x3HvwEPisRgjv2HaycUNJNwJM2AtuJlnLB6j6z
	L8Rsqm7mEYqbfBpEfwU/qaehNpCXMOfSdddaXVJb/hZpO6kXIi22rOFnjD3K8jhX9+QDQmncHU4
	rBhK/Xh6tcu1Sivofl8bPDOakayrS4IT1iYj/a5cGfQHPXYHmxKGCoETQ6XkWYvb6qg7JZwgFRW
	UyM92mRdRzsjbdgAGfOOBEZH3tHvugcAM1rb4B5dEpno+pWk7r2QmD0mol7MZamPOjy0OLLwNZx
	P3gxnKo4gCk8kqdYuSzRHhx2lrUM5SdvCWsmr5tEcNXHTdAUU
X-Received: by 2002:a05:622a:150:b0:509:5c6f:c0e with SMTP id d75a77b69052e-50dc1b85089mr84213791cf.37.1775818859278;
        Fri, 10 Apr 2026 04:00:59 -0700 (PDT)
X-Received: by 2002:a05:622a:150:b0:509:5c6f:c0e with SMTP id d75a77b69052e-50dc1b85089mr84210741cf.37.1775818856787;
        Fri, 10 Apr 2026 04:00:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dbcb66sm18714715e9.9.2026.04.10.04.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 04:00:55 -0700 (PDT)
Message-ID: <b7df6bb1-015d-4651-a439-d89ee0e03f04@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 13:00:54 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: tegra: Enable easier compile testing
To: Linus Walleij <linusw@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260410103005.163128-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260410103005.163128-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lNbskykFhf8HGurPNijPNIO27RBnEpzp
X-Proofpoint-GUID: lNbskykFhf8HGurPNijPNIO27RBnEpzp
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d8d86d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HSW5M3-sS6Q-1782CTEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEwMiBTYWx0ZWRfX8lGZDGzfy3OP
 17RnBJSkTJ/XV5hd7FcNZUgj8y8h9ZH2PIJZoZ7aCy6MSbyLd4i2wZf6vjm7IRxHj+sT4thCBOG
 vrkzOSJluLj28Z13vMvIxEYL1F3K424CE5fVKTgM7I6VopWyDnb9zrLaZec+mfhoF1Tp1Iw6OZV
 0X5AGVLahRCsYnNJ3jTv9c6vIj6OabHYMAxsGYztShVtana2ahToH6OC58ccYWJAxdEZnirkEUN
 r2X9Rhna7YjCjywHOWJoSbhm0ba3VfpKvCztq6cqJTDEew/7Bxn+Jgp41z2HQmvZ/Ia9op5Slke
 +dMECvrWsB3semQudgXEUYuYYt+dS9n5OxaNx0dhi3DNvl4XQvJPfLHmz9339li6DojwNSCMlfm
 JqfTzcDlWkBpWkS7guij+99X0q3OAldLB5K4mP3da1JSNkdWaRi3SJLegZzeptEFTRYLQzYNVSw
 v/skSf866m77zN7qNKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34998-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D1B83D5ECE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10/04/2026 12:30, Krzysztof Kozlowski wrote:
> Currently NVIDIA Tegra pin controller drivers cannot be compile tested,
> unless ARCH_TEGRA is selected.  That partially defeats the purpose of
> compile testing, since ARCH_TEGRA is pulled when building platform
> kernels.  Solve it and allow compile testing independently of ARCH_TEGRA
> choice which requires few less usual changes:
> 
> 1. Descent in Makefile in to drivers/pinctrl/tegra/ unconditionally,
>    because there is no menu option.
> 
> 2. Depend on COMMON_CLK for PINCTRL_TEGRA20, because it uses
>    clk_register_mux().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Not extensively compile tested yet. Pushing so LKP will pick it up. My
> build tests are still in progress.


I tested all of Ubuntu cross compile environments - arm, arm64, i386,
x86_64, sparc, m68k, sh, s390, riscv and powerpc.

Best regards,
Krzysztof

