Return-Path: <linux-gpio+bounces-26139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 996D4B56D28
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 02:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54F61167901
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 00:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE7176025;
	Mon, 15 Sep 2025 00:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dS5O9eWp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA28B4D599
	for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 00:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757894909; cv=none; b=r3/pES9gENmToRLSFa/XVdskpZLNBBSgOH3f1tfM5ZHhK2PTWqkgOG+zpLqJRutJhwJGTX8vY8/CTJxHuhjkvIax0WgA7YwR7bXT4JoVEXjHGhWww6vMYBwWtO5gNX3+28FD7MARZ07WZYCKu43p0/BlIaDXi/rEvA4SR+JuXvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757894909; c=relaxed/simple;
	bh=w5+8AtP73tAF4f80M4jzv+Fd3m1mwSzu1c5/Mxog6IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMMIb20KXb0hPTVHBtjJVnM//d+cmsXToswHDVm/yRTU5qbn5MRfa/EjqjSsxT3wR4Nt0EvvCLHdUPmMCsNF2Wo+BIANmxFAjkIFDuGPSkMu81uz8xuvrORIWxNCaAvpbNpHsida7hwDokQI9nVp7D8KDWAklMnr6+pyAcbPDhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dS5O9eWp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ENu0m9012221
	for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 00:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jhHQJ2FaZhjbHowvbcKpjMEF
	Vjk3jYUMJhk+fRucFz0=; b=dS5O9eWpq95Bj7YN2/hf0NUR+QUi9prvfH+97CGM
	wGLciooned986w5e0IsJ9fbTgJwG/pNgegL8JTzuY6TIwMjBB2uGTKJt4HpD+ipd
	M73z7oF4ydGllcKJYHhxh1qbSax51CwmOYo61HvMOx2Z2XB034BntzdilBy5Osk/
	ILstF1kthGk8yJAhRRgbyTR7Bb8b3q9bHTJ/xtojxzJBoZ7SlAi6orW6lVrAbtvr
	os3JHoV/nwZJuaTlA4Ehe0ZPxS++rfrrppvwq938nqzYXQGEuy7zwIR7XKVzqtPe
	VG9dLEK6vw6LQ7Z6lE5+8rWGL1No9WO+7sZxWOcE18oTaw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951wbaudr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 00:08:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5e91fb101so108504421cf.0
        for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 17:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757894906; x=1758499706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhHQJ2FaZhjbHowvbcKpjMEFVjk3jYUMJhk+fRucFz0=;
        b=txgq5KyTczQafLI4nWa/QyW/Pc6WGXri2UVfWqVOQRyVIgEg2V6eLlLUa833BfKVpy
         i3Yo418xfdx2claWbSnk0dbLWf+nNpczicbd2jd7FEesbX/bJUxX+tpllIbPfCixhVSR
         gfdTqu15XA540HuHzK33M8YdLPsbZsLjXFG+ZVPzLhcbRwZX/CUKe0x5mr1G6Lt9/orG
         0ifySmvdfqPL29DRE0M4NFHONm822x92wUt9PwWH2KOcTCMaStDFFEjHD7WfcECIZuiQ
         hGh3za16ekANmVSz74SztGcs1HPUpOqhFicWaRnKl9xVSSTk5w4NpHuOXJrPCWVKfVf1
         7F9A==
X-Forwarded-Encrypted: i=1; AJvYcCVItWM63R7pqknbHWfAB+EJ/CePL296+KXpHFN+ij33uJ3dLPwSd/fNi2D6XRRhCcSui0RKoLNReqJW@vger.kernel.org
X-Gm-Message-State: AOJu0YxfzWiTiG/uX34B0/4E2y2tzIL7O73EIqkxZwnYNpkFzEPtO3x4
	hOilAtiR7VwKUJIKQ0Cv4WJ3R3sOlnkt4LtRtD6MRdQ3+5MrEwRlY1K2buKPNMauQCDSTvCBSQn
	r00wNMEx+j8QaA2k0U1J1SBK0ENLAZHbpWCLKEJZQ6Ckgaoikqiha15feWRfa8+9j
X-Gm-Gg: ASbGncvfQnvlnDJFdXBw6DdSyp2YPuH1gRtQ1wrhxVM2bWIUs+Yp9SxLLcw2PgQ6G0r
	S6LQSNvQmRdXNyCd7RWdhNSGEwfydzUYvBAU2m7GDCk3DwX1JfgDt6tSYJPdpUnAY/s5BqJ/y8n
	meiExLIKao/+YkIgDhUOpxTJd7v19IjRwm81kHPOunhUmXciVx7RGJn4zJ19MScyakAMnwd3+xN
	G+YWn1mUxPjaqyhDZgSGU3Apbm3SGv1/SraQMuahLd+USQmpi8A7aeDbYEhZ4eoAXZXyipHxn8z
	lkZZAt5qnPzFwYMDpWan7jAoHC5mrkS7JAo3VoMwKSngklHrMQhVG/SVYiLdPMrzo6kooL7r6J6
	FKCPuBW6wUKir6SdT/bAS+OqNy7i2W2QasrXqjn4VmNzzCMrKWqfr
X-Received: by 2002:ac8:7dc7:0:b0:4b5:eec2:fa with SMTP id d75a77b69052e-4b77d05c20fmr145396211cf.62.1757894905787;
        Sun, 14 Sep 2025 17:08:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlzWL1Pn7gtuuEpIlHBZn+SrnRj7NK/IECY8KYfOg+8dAVUiEVUigMgQ3DRWqq0FAo6LUpYA==
X-Received: by 2002:ac8:7dc7:0:b0:4b5:eec2:fa with SMTP id d75a77b69052e-4b77d05c20fmr145395871cf.62.1757894905336;
        Sun, 14 Sep 2025 17:08:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460ded0sm3264619e87.105.2025.09.14.17.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:08:24 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:08:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-gpio@vger.kernel.org, David Heidelberg <david@ixit.cz>,
        Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>,
        Shinjo Park <peremen@gmail.com>
Subject: Re: [PATCH 6/6] ARM: dts: qcom: msm8960: rename msmgpio node to tlmm
Message-ID: <nudo46pgp2uaegztcpvp7iu6fuotkp4hjhpl3qo57jpkjr7dph@5ypen25l4xnc>
References: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
 <20250915-msm8960-reorder-v1-6-84cadcd7c6e3@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-msm8960-reorder-v1-6-84cadcd7c6e3@smankusors.com>
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=68c758fb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8
 a=WfKvcdoTxDYLXQoqPjMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: IPnQ82TXhMl4TU93IZJFULHTMf8VpR0I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MiBTYWx0ZWRfXw2wswg5Voz1Z
 LSpMUPU8f1OvKxKo9OYqx+0Afc1YcgV1vz+axYiEqHr+yial7EGrATe5xCiTg/7r75EkfSweDke
 z7+MIf7Q38wNxh00RC0RGZ/K/YPHO83dcxhJ5Lxcpj9FK2aamulGVP+h8tRAyT/EszYyZ+BDc7d
 NpiFhcWoo/mv/4NTmGBq8+V74m8gmSBjxkA3Hvh0JGTlPwSzPA75bAIQX26F2kIlFUsbkSVdx7L
 w65vYCzoGXtgYXuL4ihEHTNizVgFKfQ+T9KswG9KExoDSHKhpshXSeLVNi0SDo1g+zTiqe0zSFA
 o2+fwDiNVm3Tpi6QGvwmOf77Ziyzdo8I+7g1w2eeUcx6LRe2NvHwnbJkab2eVDBW54vbvZuYneO
 RitOCSkQ
X-Proofpoint-GUID: IPnQ82TXhMl4TU93IZJFULHTMf8VpR0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130042

On Sun, Sep 14, 2025 at 06:35:03PM +0000, Antony Kurniawan Soemardi wrote:
> Rename the GPIO controller node from "msmgpio" to "tlmm" to match the
> convention used by other Qualcomm SoCs.
> 
> Suggested-by: Shinjo Park <peremen@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts                | 10 +++++-----
>  arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts | 12 ++++++------
>  arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts       |  2 +-
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi                   |  6 +++---
>  4 files changed, 15 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

