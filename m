Return-Path: <linux-gpio+bounces-35873-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEb8GxQ182kUygEAu9opvQ
	(envelope-from <linux-gpio+bounces-35873-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:55:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B03744A115C
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CE0930209FD
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 10:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A623B4E98;
	Thu, 30 Apr 2026 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+wX++2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vu/YtEYJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C086C27281D
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 10:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777546466; cv=none; b=gjhFpFI9RFt9pQ7Qiu9hydg7pcv3NdXRh5XaFHLMUt1+yIksDqGy+X0R4sfwMUfSgSvRsDjHzhkgIgJUoEH8sYrvo90X4rMvnu2narVxFXX0S4Zz8wOtJr5TyREv+FS5O7BAjN6Dfbl1tKK00t8n8GyW5mUBkPfuDW0L4p3BGNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777546466; c=relaxed/simple;
	bh=NiGIsc7+2BG9Ag9y3ftpDM4w1lYngC9h5iIud/W5nAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AcS4Mb1P/aL8V5q5ookeLb7gSKwqoZgFiMFdq9czbjC3t6KyuM67l0btRQk2gJFaNvKr5GlXZZZkDlnz+eX9dZyRtPVpJxrVYHrzqWtlL98eGRkMnneSklFjL+2NeCA45Rmr3q3xZTVtK8uvxjyfpvgWhaxxqREtebDMfQOk10M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+wX++2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vu/YtEYJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U5skBY255343
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 10:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1EDKwO1UG1K0QkJS89ldvgWnbt8po5vsN8CULEuSTRo=; b=g+wX++2sRsPI55ef
	GBVjeOGFlzHmNokT2GEZzxno+pNQ8Fn5VsAA9bd5S5nmCyc8e+aJY+oVBinzPl27
	fJwa9PlB3jt15/9wc+94ryDK0lalNl8ofgdg8J3ESgnY5mN/c7JVKbNJ0NbN4d1f
	1yQ+hJaSfAaRSyRjSdRKO409lOMZk7syAaokmoj/7gwTmYc73kxNEcK1fYkTcQwH
	HHqTzrC35ykQYO97Nms9pcJVOMS18LmKb3kcsD5z/OuKU+QzSaF8Z4ouixDAst/q
	si56y2gLKz5BEpei7AOUK3IXfDrHR5oL2ymvabNJEGWr5Ti/Vj0IYtpAEXDP6IGQ
	OYWsng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dun71ks6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 10:54:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ee2dfd63beso12243085a.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 03:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777546455; x=1778151255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1EDKwO1UG1K0QkJS89ldvgWnbt8po5vsN8CULEuSTRo=;
        b=Vu/YtEYJXwTR9WPd9KUV98J5qekPNzU2r+STjbP8T/0w93oNi6iTcmZIsdx5VF0Zwc
         +cDYQrvV4/9Ag9meTXp70BHZROhsWGrSdvsvQJ40/xwOKHY812bV5/eJf5+tTfaifOIv
         K6xa0UMG3K+XZWcjcyTVWMM7vX+a3URhS1OLFcfzWJPBcVbI3BvC/zFuL+WEUHYM7yJc
         oRBTWY5tAXGz+1XJWfQhCViwfiCZE7HTZktxBkzClZNXyc6i11mHR5Q5CC2w9v7SUODm
         D9ubudzto7sJzJKRxsyJqE9yAkqPrCbeXT2HfBp0yHwZcl+TLBSYFEzHD1ykURQk9yES
         RNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777546455; x=1778151255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EDKwO1UG1K0QkJS89ldvgWnbt8po5vsN8CULEuSTRo=;
        b=kRMnSaPul98A9FzPF85u4p47c2xF8BBa2VA3JLhoestU1KSeIj1VkotU8UY5sKaE+X
         JewhFt1sYs8uURxTIHtPc0mI3NF90UldQ/q0mmdy4i/CLvya8GQyqG2g4/+fCQLoa+2V
         EMWGuln/5UkgTfYTkATA3A9FNAXhRvi+2GJIJuiUBjmhcmDaI1ZFl8vddFBdC9eGirIg
         bnZ3ziyoKiN96Ho9w9DBwXALtyf5QBX1hnxLjmRzdf9FUi0c8N/k3HIZqu+iQ58cwiGa
         4xunJEGey8FN0XXXyRyx7Ei4TJsXpL4wmIm2+Vke3fYuV7WrbPhLPxfWlEnhctUXe/8o
         tbZA==
X-Forwarded-Encrypted: i=1; AFNElJ9E1Ub+47SHNodvCvHNemj4+DoVPu7y3pz/aq++wpasB0eKozzJtUNU+hMrxDLC0pgcEfIeb8lR2vg1@vger.kernel.org
X-Gm-Message-State: AOJu0YwDmoigvZddq1AtGEHu5sApFtILy3W70A2yPAjR7wzX0Ko0euCl
	1PdFCVccT+grxf+5lRsz3kSNcWi3ejO+ndpR1WZhMSnaTni2UkdTU+2nq7FG4S5JNVx87hSyJZ7
	5GizY3gTAu9YgmxHV1QAiVWy+1hdbiX8nXzuA64MvL+MPkwitEehqUhlJ7aexeHin
X-Gm-Gg: AeBDietwpLzdiMoNcOC68k/wiSybTh7KHcibIrWFVFTf5EvUkwE3lecurdmpHbXw2BG
	mEDBad7HPi00qVMkTDvycPTdzFhDP4ELZXyBbvYYToWWVG9be0tb2oJ48OkB29gI1J3LRzBxc4V
	e4FOSbGIiuiwcqRQyFXmTtQ0euk8cBbLr7eVsVunFY55jGBFm8LgX4Jy1cJFdN/M8+6KNRU6oRS
	cOAdcWFKg4uUHv0MytEpN69ktruCA1+jEfFiK9qxOtT9+YmpMjsaGdF2oZFczDLZzXoXRt7nRE5
	jA+WboovXzNGkNTE9ZyAqPdSPeUaXRYE/aAQo6m5c0S7yZxBGa3rR25YRB4gPqLb0S1GUHU69cm
	8ThJXwai5x6nx3qB8m1jeRrT+Bwv4qdb9lD+7ZS67d/jm8J3lzF6buICkbMxszBIKyNiLY0Xx/l
	Wxgwp6nUjtnYcMPg==
X-Received: by 2002:a05:620a:444a:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-8fa88a4341dmr240221085a.5.1777546454646;
        Thu, 30 Apr 2026 03:54:14 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-8fa88a4341dmr240217685a.5.1777546454135;
        Thu, 30 Apr 2026 03:54:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b220d0656sm1771099a12.11.2026.04.30.03.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:54:12 -0700 (PDT)
Message-ID: <bf1e9880-745e-4c7b-bfde-3c5ac39175fc@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 12:54:09 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260429-shikra-pinctrl-v1-2-1b4bb2b3a8d6@oss.qualcomm.com>
 <38bb1b79-67da-4a23-a0e8-3c3da77933d7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <38bb1b79-67da-4a23-a0e8-3c3da77933d7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8veVBE6AO1kWjB34FVg8pidnK3u7TVMO
X-Proofpoint-ORIG-GUID: 8veVBE6AO1kWjB34FVg8pidnK3u7TVMO
X-Authority-Analysis: v=2.4 cv=TvHWQjXh c=1 sm=1 tr=0 ts=69f334de cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JYc5Ya0DD96nsJLtuCAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDExMCBTYWx0ZWRfX6r8hfrRHrEm6
 5mvTnfiof7I1EXykHbm6bWLfGfxIKAR09wtGjGsaJaOyYzsNPIIjAswILuy0CyQwsgWLf+FD0TV
 8tmq6SjkFFbYhyCqw8UrUw024f4Nr7wfL/W+XnotIPz7LMQO/rTQMz22bkJtXHmJ2F3xseZRg55
 OIF+Nl0ZW1ysBBMKDFTzYleIXi3HAAjMuXBYIDNCf+0WeS1FHDGhhoEJSLTnT5Et1P1oWeYtWCG
 Hi4jcf94cK2e8OC4/AFi5CsoXXs/iqjiLlUY2137R06jDDuthQNtRXmfMQdBJHheOpMBGy0+s8w
 iU2KnY1ISKpZ+uLWQJ+YnoeCqYFzCpEO7jpRUvEsATfqSKS7t8xR9rv4hlAbXCRMcdj6h5uJbur
 Q6injdLSdYVi4l/9KMde+KatGV9WVXoPXbF7MW/tjqwgGCDOShwg8M9dEdGUdnluaUGgWHlqZOZ
 HvJzGi3oUU7YccfsKtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300110
X-Rspamd-Queue-Id: B03744A115C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35873-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/26 6:06 AM, Maulik Shah (mkshah) wrote:
> 
> 
> On 4/29/2026 6:41 PM, Komal Bajaj wrote:
>> Add pinctrl driver for TLMM block found in Shikra SoC.

[...]


>> +static const struct msm_gpio_wakeirq_map shikra_mpm_map[] = {
>> +	{1, 9},    {2, 31},   {5, 49},   {6, 53},   {9, 72},   {10, 10},
> 
> It would be better to have spacing before/after brackets inline with other pinctrl drivers.
> {1, 9}, should be { 1, 9 }.

If that's also something that the generator takes care of, let's fix
it there too

Konrad

