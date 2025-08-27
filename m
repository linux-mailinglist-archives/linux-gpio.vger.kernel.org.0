Return-Path: <linux-gpio+bounces-25003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5FFB37760
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 03:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D8207A4FFD
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 01:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801AF1A8F84;
	Wed, 27 Aug 2025 01:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhLXBVe2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2F11DE8AF
	for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 01:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756259211; cv=none; b=o7p4O1mK2G1IA+MloBtwJ0yczyZbrmZG+yTPjabhU2iqF0PeHKLC+NKP4B9NCsoriKcTVF1DG9VB28AaltEsr8bTMOVunvKqy6rkNpxLinNEgVCV43lbNk2sEElOoMGUsG7LM6LU+6Ua1IKpVQBeewW7ea3ee/O3uZ7bJUqVDKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756259211; c=relaxed/simple;
	bh=DysN5hU3oh6u0Gix/Fw/6sES2iyVhu+TI7M9kG25Jhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OT8AIZVtzbzZdMYt4fyqchJ9W/2ediqgmjLEaItOO92O55ngZkulQPmScdLvUF3LYf2cYGFK9z9Mn7L5T1iaY0AFuxbNz2Qb2MkB4px/tvJHAs74SN9qVcyIaUKyq6XFWvsrSgA42WujbBF8pUwjktsjzF92jFJdG/lfZGBnk40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhLXBVe2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QFcEck000535
	for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 01:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JsiI2R6ibkXEQVsd2AueMHAg
	SFh7s+WwOR/4XjgqCBY=; b=YhLXBVe21/hN247bvkvVEfLqcK+vDTHSZ3+l7oHg
	8JGWd1wBDFdGdfSnMg+1K5dO77K7KM5/jCNQ2HKXYtBUfMe0kJfS2Q40bC7ziAJq
	BIPixjMuuNJeHCo6lWz2M6QS3eEd9jMZporoVpFD6Q/EJdm3U9dpsruRlwifmUp8
	qI9qpuLjfR9B3hrjJmeRj45bK9amnphtBZWVb5vMq/OmR+WN95F5ddhKYDBKE47w
	mVkZx6MCLHIe4AKxVUW7Hosss0P6q5kZYunS8vlKsDuR7TJCcAyKGmDDc9bA4TFz
	IDSeYpUzYnaB55SqKrdwv+9s8DecfFR6f2ULXQVhOamtTA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfjx8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 01:46:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b0faa8d615so12760831cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 18:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756259206; x=1756864006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsiI2R6ibkXEQVsd2AueMHAgSFh7s+WwOR/4XjgqCBY=;
        b=MgZQ4MpWhtoTRG7kfmVNLz8ubjHRhuzQNxFvlJoor8irHFp5cJByWd3s7gZBW6zLJm
         4ivZM1N3phfedKiUstpB3nxIDnU0uxIUFqZDpkddWreRiksBt6a1RDp+DvsMJzRFCsw9
         jAhiKLgt99siNuDDOmJT+rBUtEIHBkF9BoHvkIBXuOCKjQR4g9+3vOqOj1Uhl9sJdCXj
         ptgmkkJbx2iK3iWYkhNLnf8VjviALZ9fDOp1JXMyI7FD38GmNZvmEArwDozYpTizrZiW
         ITnaOL6PyTbga2a9+RiqahZteiuXcd9ekYLK8BAi69Fz7ThtvRC7t4yCVbXq5kMxA2uA
         Wc6w==
X-Forwarded-Encrypted: i=1; AJvYcCVZOYEd+RZK7XszRjtFmAmPx9h5MUc1qg0Fq0Kz1OCPr/D8uCfphWq82lJKqXn6VxCTWBHARpC5sk3/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8kfOgnDQmVoHxIFpbvbSl+wzSrqr1LQNLPCUdpTi5ewYRNItg
	yo21nagfdmbokT9m0o8U+PJC3aecXUmUUpsPmNk2UxpfMmsYHBZpg3dGFW2N0ZKexQ4Nz8rqgDa
	FqAUprwL5DsK+xg2IsjRazIHlzTraadaaHOE5aI4XDu447P3bE2SciV4M39VK58WW
X-Gm-Gg: ASbGncttVlPHEvTUbPKBcl7VZlmTdHY7SbhMlCxcyij3mpvCzkqt6hfdQvnMf/wDG7M
	CPrQGTDXZAhdMjz0/GLJ0gIL4kjP+6fEaeT6GLeU7foaososmZhLxJSNIqeqMKfhtAzPvsCYb7W
	crabi8xcgTq0UMuMaUQ+zz/rb8t5AfMoFkxvOzg46dl8SJ7nvkQxC0eOiFuENCPgnrYHmowFzPf
	M8dlwei08IUoiXhDzdvmETQ/DXtwJ46DAWabmyV42Csa48sNTzSHur6PjtaH2tWOl84F4ZcfFQs
	c5d4R3FvlcCRSjVsQvSN5nfV+l71fQzjDFPmisISoNedH4J83AXMAR/TLPgbVUXV6VXzfzSUbmZ
	ApApqI3c830jTu/UI/zpc+OzO2DO5BYNjhV0YDRkU3rqA/eyBL/QT
X-Received: by 2002:a05:622a:24e:b0:4b2:a9bd:5e0 with SMTP id d75a77b69052e-4b2e76f7172mr37630721cf.4.1756259206177;
        Tue, 26 Aug 2025 18:46:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlmTK2otsgLWy8SWBZn84jmif93f/VKR3VjTdwWA6dS24L2uPT70Q5mJ3bV7NaE5n3CnyiUw==
X-Received: by 2002:a05:622a:24e:b0:4b2:a9bd:5e0 with SMTP id d75a77b69052e-4b2e76f7172mr37630501cf.4.1756259205704;
        Tue, 26 Aug 2025 18:46:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c8bad5sm2541712e87.83.2025.08.26.18.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 18:46:44 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:46:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: setotau@yandex.ru
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH v3 3/3] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
Message-ID: <nr4ipnjds43cheo5af6orylrdn6an2qxmdu6cloldn4qd6vsnc@kidtkadei24y>
References: <20250825-sdm660-lpass-lpi-v3-0-65d4a4db298e@yandex.ru>
 <20250825-sdm660-lpass-lpi-v3-3-65d4a4db298e@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-sdm660-lpass-lpi-v3-3-65d4a4db298e@yandex.ru>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXwZynIMewcbzv
 Hbf45eH0ZK20Q58xUX8YKAB3EzzU27KulshoODPxXZY9odv26srt9+pnuvirlFeVlY1N+qPFIC6
 xFnwXUTeFl0eECR7Zbcpm+N32lzgZQ68j+ibrKNCJYUoxcJarbg6Sq22TvV6vSie96q1BgUShAG
 g3C6YDMCSe0m8f6zuO5W6BV19CcK7MGgKezpLltRh0Uaetoae1wBoQE5QU6tYOGIsXLl2IdvH07
 5rqrjHPB+3pdSKZ599ZVXu/bAFE+6JWMA8lo+kLp/PEP0yPqqbLPNroCB5fN/J8bJ728QMkOsC0
 62IJ1IgQLsuIdke1zHIR35px/JgORGtpjP6w5uyBczhf6kJpYlfos43MFbdSbBkn1bepvQppT5A
 ra88WwH5
X-Proofpoint-GUID: WjvSZ86Q11WxyGAVpQPWyzlkgA3z2fi3
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ae6387 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=pGLkceISAAAA:8 a=vaJtXVxTAAAA:8
 a=EUspDBNiAAAA:8 a=waXtKuJNql4FBI_f4L0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: WjvSZ86Q11WxyGAVpQPWyzlkgA3z2fi3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Mon, Aug 25, 2025 at 03:32:30PM +0300, Nickolay Goppen via B4 Relay wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> The Snapdragon 660 has a Low-Power Island (LPI) TLMM for configuring
> pins related to audio. Add the driver for this.
> Also, this driver uses it's own quirky pin_offset function like downstream
> driver does [1].
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Co-developed-by: Nickolay Goppen <setotau@yandex.ru>
> Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
> ---
>  drivers/pinctrl/qcom/Kconfig                    |  10 ++
>  drivers/pinctrl/qcom/Makefile                   |   1 +
>  drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c | 196 ++++++++++++++++++++++++
>  3 files changed, 207 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

