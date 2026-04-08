Return-Path: <linux-gpio+bounces-34884-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMwmJtUn1mnqBQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34884-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 12:03:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C2C3BA39A
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 12:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38BD0302A538
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 10:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E46A39FCAB;
	Wed,  8 Apr 2026 10:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDswb93o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkxwJ1v+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDF23A6B76
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642404; cv=none; b=uv6wUyrKqNsxEJDA5CNAwiTvKLBg355OI065etd9ISNjlF//Z7YV/N8UKa0sxWsB4iime76Jt0vAdn6MfPgybO17psEmGFe8sVq7E6IH8bzNhSvTlwzlDVW0J7XvkSr4hAr/BjnGJnQhgm3z2eh1ps1VRv8xVi0dgqIhQwl5SIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642404; c=relaxed/simple;
	bh=mBi8lFLIKMzICVhQha7ak23yOXt3vD3HD6QrPuHi4Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcPxY97rl0TbBzNeecBKTloj+2WmXnLK4w5MNZObjdfzP3lI0WpAmAAvZs/F/7gJpm+bRy9RZ1On1MHO+wQT5jdY8UdKN8jAz6m3b1jpm2JcZS0L/cdCCIfgxLFTYfseteqhLsBVhCw0E6+3FeKZtRnJCD//nakrm32s/tvmb/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDswb93o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkxwJ1v+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6383orci2412209
	for <linux-gpio@vger.kernel.org>; Wed, 8 Apr 2026 09:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y8yc3SWGU0L+F0BGHaW8P53Qu/1P19jf7doWt69XljI=; b=CDswb93oo4dExRKV
	p0bg4KOuTsdlVXIkgmMaSPIJCYP4W7sVZ9PVuUDmovMg6ZI/QN94WMZbMMD6YYH8
	JDDpkZVbXf8xeBXLlzGfepboVrWmwdffBqCh+he0/EE18hZHrnpM/4ltDB9yhSCe
	sJmWvdgiIhZzEmTEatUABFWs/4mKzlJHsOjM4Cy2NAJr9huSwvlZC7Dq6hvsJMPQ
	sS+sJCKcUevFRzdXc76WyT4VfvPktw6U4HbWAanaFH3HF4ruYS+5KHjD7SHWIjXN
	tnPrgJFuDZK2v+44biJ3/YCnlSPDxbKlfbRhqeAV4GOyXunW3JqiHKjuvK+3Dw05
	GzA7ZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vb6hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 09:59:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfd003bfe2so154306385a.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 02:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642393; x=1776247193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y8yc3SWGU0L+F0BGHaW8P53Qu/1P19jf7doWt69XljI=;
        b=WkxwJ1v+DJdk/z52iHqwIKCE/RPNNgRXiMWL8EI5Iwvp2p/mSvooFGqSQ1wqVssCwk
         /MtyHP4mqygaBNqDuPHKculO061aOh5fBAYijUfvy/CGf/HH+yHACDSPbu9r+8T+Q8ZY
         VCuqw1vOALCvPRpIswXGklbTRjRPzBxfgpbtZ/IBJYd+iGtzCYWz51UgLMkogYvF/Tzq
         gDDnv8qEUnYB6yqOWVUohjFM1XCbbbmE01DndspIAY1RvlvpUwDS/6eGbdqq/NGIb+UP
         fLjkBVPFn0TGNINf3SrSIsXkS9ZO41CHGRJpxxkMoYpJf0CuuDh2S7WRKOrpIjmmBOPi
         7Yag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642393; x=1776247193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8yc3SWGU0L+F0BGHaW8P53Qu/1P19jf7doWt69XljI=;
        b=dxm5CmAT1GzhDIc32pkox6+aT+i94GfHQ+l05cttQaH6tBu5s3lgVYeTGH/WRYgWHi
         tRl0CTTlgh+rtshrIpPEXUFmE2blORQL7GQ/P2qd3cI/ayDmIiz/KoBzXU9bG1lzeHjp
         vvzKul2dQFzIFAz4V4HN8E51A82uGntCmG/zYbTNX8xaXG89res5FpHdYqBRzF5lQjRF
         TXYj5btEr8Fz0NMm2AwpIFYuOj3q6KUznQQBZawoVI7QxjDIctl6Cj7BbZ5/8lUHOzZx
         ux1JlR0kqm59sziLjfFhw4Y3mtES/buU0f/s0fLlYLmvoiX8Ebj7rFn0e788fAZoHRuy
         xtZw==
X-Forwarded-Encrypted: i=1; AJvYcCXdEGBCwi6Sq0+W99bdE60zMTTg6AXI+uGdpDCJu5Bi2WY4b58oI0bdIxGU+g3J1CdZAmdy7opzO6ml@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq+8EZu3vRZby//O695Ae9H73ehRBlREXwZMRzY6/MKbpeL9BM
	mJNHFsxvb9Rfz6kPXP+cW7TFIHob0hesFO7pBC2AaprKE5ePohw4iqe+7DlKZyBl7ELBjDuI5Xz
	g+dxVX4+iYqctPUzuUYvPq9F/Jj25ROe7XzCxkIlofKmmcjZM4nye7nTpebJCrvH2
X-Gm-Gg: AeBDievSv/aJQeA97Jpauikyp5kFkoWNfeH4G4u96uZaus6KXTT9wCb1oy5fBfnlcGB
	wXhDflq8v+cqQwuAwWWzB1j+5iuSVKxa4a3iLn5615UI8i3g4kWskoGiZ6bP/DSlkIIXIgJjOIi
	c201qGiKJTNdqpiTgR2EzsmiQGVaD0e383u+bYYHBH5MyRn8DMJ7tJaGeOfP8siQ5t8/l4JICVt
	QMzXODofivNlhX9q+liPTdJFgXJdfy01+wS7kmc6BsVWL5ldCkW/elKum2mwqLo9ZjmPptsrMz1
	joJHpA7AGIBgIfjXoG/IwwHPQiqAug/6RObUopDmk8hRd+xfCiutqVRnBWMCe9tgdOkxh7tZp3h
	pro48z7HpUndbUquUATHQZKBB1pDYveOROTE7/+CJOwgZqkOJ0YRhI4OjO4FqtTNaTVESCIhh6f
	3qV6I=
X-Received: by 2002:a05:620a:2682:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8dae2489c96mr319301685a.6.1775642393452;
        Wed, 08 Apr 2026 02:59:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8dae2489c96mr319299585a.6.1775642392995;
        Wed, 08 Apr 2026 02:59:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034b9284sm5221704a12.22.2026.04.08.02.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:59:51 -0700 (PDT)
Message-ID: <1f6727c3-d10d-4f04-9492-2cb99c95d1d0@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:59:48 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
 <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MCBTYWx0ZWRfX5xzFWjEljxX1
 rQkRv0cuegRAson27wIsyNtJSA8wB3vB36Ssgn6QqIUTa7Q0VcLdd+VwBey04ELk/+72JPrfz40
 JWLJhWVuMVJ0gx+yIIcm7zbm5OKFPOFZAZw761w8CKK81VZ3LrPXBv7HIT5ZkAzVOrubGhDrhUv
 hW0z/Vyjv7EFcGtj98s81SzRNQ2EWIxg4trVFkuCeHL2drDRsUj6O/oKLc+ByVE7nsgg3WyTMYh
 AmUFAQkUC8wAW8sFpCHFKR5mjmRufxs0v69aUE2GO9ReSY59hCUWf/S7qkMEge2Zxz/Nf/RaqPg
 h83CfHFtHlWuY6MQ6pMo/KEi0WLn/+XZbTg9yC3YI3ndozjUPvbOWnmnkbZC7HBUNNYQgbQv3Hh
 8XgBeZWgugxNV4ooVS6X9qzhdCmzBjpisfwuegMq+JaFZuZIKMTXgE40nMyu+jdPrLUmPWYvSM8
 aFTjJUPD3CicxwRwnXg==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d6271a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Zw2ZyFplH8TUw-UW1mcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: zF8I4qIKdDCUkOmuwaFh3ZbDzLbyWAtp
X-Proofpoint-GUID: zF8I4qIKdDCUkOmuwaFh3ZbDzLbyWAtp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080090
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34884-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 30C2C3BA39A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 3:27 PM, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

[...]

> +static const struct msm_gpio_wakeirq_map nord_pdc_map[] = {
> +	{ 0, 67 },    { 1, 68 },    { 2, 82 },	  { 3, 69 },	{ 4, 70 },
> +	{ 5, 83 },    { 6, 71 },    { 7, 72 },	  { 8, 84 },	{ 9, 73 },
> +	{ 10, 119 },  { 11, 85 },   { 45, 107 },  { 46, 98 },	{ 102, 77 },
> +	{ 108, 78 },  { 110, 120 }, { 114, 80 },  { 116, 81 },	{ 120, 117 },
> +	{ 124, 108 }, { 126, 99 },  { 128, 100 }, { 132, 101 }, { 138, 87 },
> +	{ 142, 88 },  { 144, 89 },  { 153, 90 },  { 157, 91 },	{ 159, 118 },
> +	{ 160, 110 }, { 161, 79 },  { 166, 109 }, { 168, 111 },

This list seems rather short.. are you sure it's complete?

And could you confirm that it's been synced for the prod verison of
the chip?

Konrad

