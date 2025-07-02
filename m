Return-Path: <linux-gpio+bounces-22671-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3107BAF653F
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 00:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EED7C487D61
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 22:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF70248F69;
	Wed,  2 Jul 2025 22:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrfFrXe+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8E31EC014
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 22:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495635; cv=none; b=EA/qSC1D7+ZEwXPsWmA5JC1IST2tSlFAQ1oXk+1Z7GdQbbKyslF/T+VHqyFGdeZ+3vUDpNtd9rGe06LW5Ln3YS0uWV55mS+WVZZrPtDfJluDP/uNw5uItIUTMcLOYpmFOsPRofFgfN572g4wLynunMs96eUxRfWuozg8Hd+2NgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495635; c=relaxed/simple;
	bh=fKYrShfy4eijBV7nECTRWv3J853kJl0gn/F00vK+lMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dppy0ley+bTYxg2IenlJT1MCAj4lfg/2xuYVBStHC8r1s+MNd1X14ahw1nHOl0JlSOT3MYDqd60t9f+EmkUqQho8yhyBdiXGFPCAqad19cIlK+HqIpvqHs1YDTTyN0J4eY0weasstHmK8nCAvZixo0KY2rm4CNp6sE0mvk2Yzho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrfFrXe+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562G3FEU000320
	for <linux-gpio@vger.kernel.org>; Wed, 2 Jul 2025 22:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9m75rRNh/55YNUo8oud19uqS
	Nh7ztNCNjf7HEJhz4Jw=; b=DrfFrXe+I0mvhum2HRzezn+EXJKPyXEcy+lFpiXD
	yOW6Cz33OviCyc9FH6nvXpgJomdo/eHdhOG8aJTRmhOs1ghywi8LT3qVJZ1pxOD3
	GyhruPTn6GEwW0yJPm8ALH1doE311dSlPuVVheig2nl/QFP/k3H5UtbRBlkFzk0R
	64iMHYOn5V68PVk5s7LpCywTIpe72+rDeaQuJwMGen2pcr4W34h3ccIptIGUDJoP
	z93TGYaaZMIRmax/U0SdcL8yN9FvAE53uNRVqNPy01th9lcZOlKG+K/+ZSrD0CUk
	2AYUnGEcREoX4z71rFOJ3ex5ZlmLHJFGznZITV1RC0/zXQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qme4bu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 22:33:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2872e57so808585785a.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 15:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751495631; x=1752100431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9m75rRNh/55YNUo8oud19uqSNh7ztNCNjf7HEJhz4Jw=;
        b=b5899TiSWVfIIP/GKhVjjiSXi+8B+Ske5dkBnR6La7yPZl9OrLLhDOEQC0o03Wg/01
         /6gA8hyWiseWqQuj7t8afpm9JmXHu6HrQvhlJ7MAmh9QlFgaXVlmylKEO0lvnDAhtMH/
         Reh0PKkSn4ghZsIVEyrbj3pjGk+brExdh0i+aBz7Yw6k9zizILK3mXbisrRdrBKmXWzN
         P28EKx4pyk2Z0jZds7+pL8/zbYz6eNteS07+ldMX6NhkhHzrUQP73LxczZ51Pb50OHDB
         uGb0yF2c8bwo7i1yQ09UTecYNuCcwxoLBQawO6RKlzqvGrdC59mvT0SjNHY310Br+ndU
         iznQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw8tLvFMmoUoN7KkY851MOJ/Q9Ulm9/dLY0cCP3EjB7oHUn7xBIXwv0CHGpKJfkmz/P1Gur4p2AaQ2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr033SE0bE4ywrddd6fHtFhMP5Cy9zuyUEgny1d6jUQJ5XKbdT
	NjUeZrleBSz0LM5/RsqXUPLVbwfxAvYXuIg0VNG2jT6+ICdJTdL6nFULygWGKC5SDbK57I2nGpd
	r5s+zKzcYnsvmNl1BqAgtjpEjT7mDtc5YTU43qntc5DVP4OGz0soS0Z7W/R3YR0MX
X-Gm-Gg: ASbGncuDgBhVffcg/qWbtw0AQghqcqY77WOgo72NrrbRjjCLY8PGkjjA+k53FzKo1eW
	bswqUbLdrTmgR3U64qJEx2Vs5+TZovsgqju7R5W7cQWYWiYBGU+e6kcT2+opnmFUbbOgO0hJaCy
	UneZHYJ95ZtFNlyokmvNzjr8xV/+zSWVkZknKh2p/rm2HHrwI7IddAi7bIRedtS1KzrvuEfSzCT
	I9PA1kc8QtdHKT2M/ohAQkO/V8ARKZIwC+MFjGwJRCW7CV8+LjcZA5v0rJINoklaAUYv05ocwNA
	KdYi0PiSkDKJW9mNM4AeTV6Jlmbj5U3davumjiRI0BXYzFf+yVAftiX9Ujgw1A82oc2UE0vN9Qp
	qz9uN9NQR5C2Tw8EI7/dZriuJIu/sUDEn9IA=
X-Received: by 2002:a05:620a:394a:b0:7d4:5a4a:ceb1 with SMTP id af79cd13be357-7d5c4798da0mr884198185a.47.1751495630587;
        Wed, 02 Jul 2025 15:33:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqHg8DuS5Rl+xyDTUq7jRwAVjwOfUy86K5mPVVKk/oqcQL3wgwaOndDK7teOB2+3l4vN8JRw==
X-Received: by 2002:a05:620a:394a:b0:7d4:5a4a:ceb1 with SMTP id af79cd13be357-7d5c4798da0mr884194685a.47.1751495630175;
        Wed, 02 Jul 2025 15:33:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f00aa6sm18743291fa.99.2025.07.02.15.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:33:49 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:33:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Milos pinctrl driver
Message-ID: <xtcfzqhwmxgyui7fyn5bsms52nnlflalhlkvkinhdc2sxdu4l3@logrn3cjupez>
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
 <20250702-sm7635-pinctrl-v2-2-c138624b9924@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-sm7635-pinctrl-v2-2-c138624b9924@fairphone.com>
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6865b3cf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=JBPsfPNCSnIN1veHQUAA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: D6YHg9rA8NgzXZ8BcjiVGrZiRSGOnb1R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4NyBTYWx0ZWRfX7XOCPNlpyidY
 pCybQKl9AMSfkzvM7ytvAslNuvXkWWLSfp0nkF2yy5roRKW9yaKL7ZvQKrYzF2DCX+8s8Gx7qv+
 dC9o9wb/HRx8KLTX04UJB9usmM5zzzRaIFJyqnYch8GSXQVeSEDjqcUhNFg/XqAM4wwbNl5ZX1K
 5gLXVlBBK2Y3eXBjM/hpnO/U4bEjTjvKF7SzOIgpjcfCRJf3Sw5t/oEocC7Ouv/A2cLkf5f8Fl3
 d9Qju+jVIZUOYZ95hWYYuqEUxgdkHPD6XigVu/sAM2jwCIcFC+ZsBGHI+7fHyuuQGPjQaxSU9LQ
 a9UxnwfUlUkAtct4CBU7eO6PuGS47M47MIXjbcyp0rJbhILl09doykkMzCJcuZ5mnhn6+L1Cvwr
 5w1QEni86opG9zuEB9BNRN3FlNI3NvQgrrobMJudxF3xG6mCSfGBmHvn0F80BHKZLrGesy2k
X-Proofpoint-GUID: D6YHg9rA8NgzXZ8BcjiVGrZiRSGOnb1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=988
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020187

On Wed, Jul 02, 2025 at 05:56:17PM +0200, Luca Weiss wrote:
> Add pinctrl driver for TLMM block found in the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm     |    8 +
>  drivers/pinctrl/qcom/Makefile        |    1 +
>  drivers/pinctrl/qcom/pinctrl-milos.c | 1340 ++++++++++++++++++++++++++++++++++
>  3 files changed, 1349 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

