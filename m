Return-Path: <linux-gpio+bounces-26138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A3DB56D1F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 02:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6E6F3B8F02
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 00:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139264C97;
	Mon, 15 Sep 2025 00:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pc3IGBQ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6101A295
	for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 00:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757894825; cv=none; b=GfZ+Cet9IYjETCzqSAIbphRi9S6Hk0OID9qPFdkepAo3D4wS/NNC8264PX3xPCXimHtdmmWwjtv6TX5LgE8EhKt9oTjRAyun/kUA7LzLJVcX+gNJkHeUeclpBMzT8+vPItwQANu6QQt6hBJhKRpcP2TXehHU0ZTj52wQ5AIMopo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757894825; c=relaxed/simple;
	bh=CzHNrfktlaS/4ODUMT4RaYAOMeg6Qil5XWqJ4rs6Ovw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChG8w8TaaNsdDDJ4v27wL20+kEM9XlFFzzi4qauYpatuwlE91mJPvfypFo6G+lG0xnC2h8mVTiJdquiQfx5lKuQvMWdKr5fUr4whLyjFBP7D/lJgG2iX6tqpCJd18z7TlOWmIP8BIvNtdtcSS3eIZWhuJwTAtwKyjUk9BRoqZwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pc3IGBQ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EMc1L5011237
	for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 00:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mh5sherNX0Q7001jFm5e3R/a
	R9MYR1zMB5/R6VlH5zY=; b=pc3IGBQ2F+XOHk6PRzPPKJgl/CGbDJNc9BPjW5mq
	uWN5lngUkmgaMjIdxdaFP95j5HFm5cVAKvmgd76MGHTJH62XkHGKKrrsAmWOqyk2
	q6KYuOingaxaPdb/VrAaac4/klQmDkUODhkTfcbronq/Zp60Y9rqWf6GzhJcjNcO
	LIDd2uHkCRPqRGg/chmBi+2pdEw3TrppmTAl6d6ph5MWJJnwNVpH8SjFYROmGk6N
	DwXvlgk7r+iWpTKfcx4XLOwNuLxKJEf4x+OI8DMnEnbu/dXJn8+w3KgVlt7IrmVO
	aPu70eumA8CQNPbUrQPn3lPX5RVkq18JFCOwMyC1xQx1Ag==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma3036-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 00:07:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b47b4d296eso99405711cf.1
        for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 17:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757894823; x=1758499623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mh5sherNX0Q7001jFm5e3R/aR9MYR1zMB5/R6VlH5zY=;
        b=SBfxshXlLSv5XfEi/d8OWN9IyffSn5V6NsDlssHTKOG8YKOor7l4P6FKMu5gaSc9RZ
         wlnvKxVekSZqn2gAedENXRMWNw9lfk//tTCyFv5t9k7EBFTsFbVmCCzeiUG7e3i6ptqe
         TtPK4ac/oHDErJ+DHVEWnJnk1zwXQB87wLFI5gR54usq45VgnmbFGKFKMZ2Myk7bjHav
         1j9qj2mmcPRYuF6+1dntanoz2GdeaFvNlYbXUzZspWDP03Kthsx/JFvjnSoGfPMVJgkX
         XMjMHQ/fm3rgZTriTHhj3u8IJFvISj3LmidLvZlK2ZFbg5tvSCrTgeMoUOJlXHbEKW02
         V3og==
X-Forwarded-Encrypted: i=1; AJvYcCV5KAO8rmRMNwtwV5gJ9NOMAxGE6b3xx1TU1sNc7AaOHap7hv5dRqrK0srx7FyRCZ5YMd6Uw+me/wpX@vger.kernel.org
X-Gm-Message-State: AOJu0YwVvyh6tnr+FhMmwseaIpGfEWvt+h0XAPCOHZImdv0wZZO1EiZg
	/kui/UUDvw6Wu0HEuHDYfuAydrvPNYPobfnE8FGa1Twb8TwYOprAOLWtSj+exk6mqNBBLo/p+6q
	ohozceg3Wbgcuq53agIDR19bjMgKbWAHPchWXDbLruXRcTh3YTjBLCD3NNXSC0txw
X-Gm-Gg: ASbGncuFeMRuTf0i4Nx33ucv8s3Ooxuu6mNz4d10gDki1Rb0bQfHAutWs+66RCtIbmZ
	kHXg3JSx92MBSJbhwDFfXFY8F/ZDa3WryamP/rMGlkAyykDmwITu6Cd/Mz+KfSCVeXuQtwMhT/f
	9dmFi2XitYvCmzRY+ll33pBkMJV9Zdq2mJfPv7PF33Twdo6ok3mR6NuoHE3MhZloijv5pvSZUpe
	U0cLIrWsMfCdOGinR5a+I33h9+ogj9e+x2EuhDCApXR2WAMsdfSiTvf+yAwoxBZfMow+DntGf2T
	7PSnBBqu6ufoyHEzOQFtEj3hsLg0jkVFOhGWmjcecUP7tTXUcjr/nKYIx2McUz/0WNgkPSZU1gr
	DZoN05vJQXB5EKvUItERjVIeEmBMAleHx+pW/fZzGNQlGN0Zc6ZE3
X-Received: by 2002:a05:622a:4cf:b0:4b3:4c51:6434 with SMTP id d75a77b69052e-4b77cfded57mr125964661cf.20.1757894822535;
        Sun, 14 Sep 2025 17:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsW542Cjhva67Azk2KlVPzEQFGIEU+WTmFXy6f0ObUGTCHrlb+05YBOXy7VDLH+4P8nX23BA==
X-Received: by 2002:a05:622a:4cf:b0:4b3:4c51:6434 with SMTP id d75a77b69052e-4b77cfded57mr125964301cf.20.1757894822072;
        Sun, 14 Sep 2025 17:07:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63ff4sm3220354e87.84.2025.09.14.17.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:07:01 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:06:58 +0300
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
Subject: Re: [PATCH 4/6] ARM: dts: qcom: msm8960: add I2C nodes for gsbi1 and
 gsbi8
Message-ID: <kiawbx7uoz4bs3esiyraeess6vva5f4fwwqh25xrgae6j35gn5@4eoereuoumhb>
References: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
 <20250915-msm8960-reorder-v1-4-84cadcd7c6e3@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-msm8960-reorder-v1-4-84cadcd7c6e3@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfXwtj+CgNKESIX
 OQGeMc/ymA76BrZzMc2jft45fsBID1MMftIBke+lj11yT63lz6sfWLWmLz15IQtW6mUDfXkGL0V
 WzQMbefXAR+tbw1d9UduoXdG6JH5LqeUPzIaxP4GRRz6ybI+Qrn24G8bVtQ01ItYYbWDSEPzCVi
 LC0QtomZ4WMiotvf9g4DXKPj/jBca9RPzSiKm95rYUhPrTWy9FhHw48UhIk71xMP642tBt+DUaQ
 +cVnpO7TyffcOOzB7FTpwvHxyr95PVnm9npYEHUZLYRo/cBjDZHbj0Qe8Sz4upJg+hw9MDB2xX/
 jHef1KUshC+COZjR93cD6o8NPGs0z3M859NEikQ3Jdp9ZErh7TSPGw2fm++DB6lhzdQAMnPYeEq
 myRUIixo
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c758a7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8
 a=t1JXzLs-izEPKbqAoeQA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: Hcm1OlG37mvwsxx3wM_tn4X9TO1h3E-7
X-Proofpoint-GUID: Hcm1OlG37mvwsxx3wM_tn4X9TO1h3E-7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019

On Sun, Sep 14, 2025 at 06:34:55PM +0000, Antony Kurniawan Soemardi wrote:
> These are present on msm8960 and are required for devices such as the
> Casio G'zOne, which has NFC wired to gsbi1 and audio amplifier wired to
> gsbi8.
> 
> The nodes are added disabled by default.
> 
> Co-developed-by: Shinjo Park <peremen@gmail.com>
> Signed-off-by: Shinjo Park <peremen@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 68 ++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

