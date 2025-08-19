Return-Path: <linux-gpio+bounces-24574-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB67B2CC33
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 20:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E77D817B8CD
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 18:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3239430C345;
	Tue, 19 Aug 2025 18:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8Tt1NgF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D3E30EF7D
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 18:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755628683; cv=none; b=TiuIxZSsaOWJtXo54SAGcDKTJ5/614ETl8VJRC6uxED/MVjyQYar3gM3E67PgFHQEV4E8YtsmCUy4pF5vHiF6oU767dkWTJ8L7lTON8cGKUtwGgVKfpv3nW1Gmcpy+o5qEu3TAe5oyTDwi1wStbLFdJ6mTBAdwP9mB2bd45jzLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755628683; c=relaxed/simple;
	bh=fzu+T/ZpzSqtE+bS/ZciAkniuUnpqpoUpamP1BrgRg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gh8D0mSfbzXFfKarT6sOxNPLMMRDxGmQAQBO5lneAOCOiYCqgzwLz7qzcf2a/CL2v+3ECcDZgdULdYjwUlseV7nX3x4qAzDjMaIJ7OOKUSTgqHMYsMWbD+bXMLda9wnWOvonBMLD1bXdiNMW/QE51ybKUKdDm1TQTxdQfZyV/Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8Tt1NgF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHmfHj030294
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 18:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FuqeBl3XXkMoRSpQWscvedo8
	vMMNpCq8+JIGH5PifRQ=; b=S8Tt1NgFWZUAxFYCkBWUVN1turDtFmfB4OuXWqVy
	Tq5bcbnSAjmB5TYv5bbb/76sJBu5DnUUuSndAPo1ADNeX4xpopW+Jb+PiyIr3yfJ
	b8WSrheObpQxIuvCAtPU7VSZfqEMm6Tc90Arpr3EtQWG2Mp9H0FqRmr0H6fnvlid
	Z0+eov7NWaMrE08ih5/JVtJJq3IPWeQrtVwCjsrw8xp5mdzbNxL/Z3AAY2sKyXVt
	OhER9JJGBVt9RS2t4Ta07CUVZhSoxzAg8dPR1vX7cZD3VEEKWqPI1zXtiEDbJqdr
	+R3HeypNnVIrWolFV+tnwpUV/jE8vSkio+yTXalrL9OL6w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunwuq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 18:38:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9f5bb140so187975906d6.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 11:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755628679; x=1756233479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuqeBl3XXkMoRSpQWscvedo8vMMNpCq8+JIGH5PifRQ=;
        b=fkYtUiZEtofSfFJZBhyEHsWTXFWSP/MdV+piZeD5KUwXmg0+qqaCqQQkLnI3l0QM6c
         DODwJ3kF/EmadmOzd0gpXKcX7bUBoC6KswE3OERIC+tqrfMTnDHRVAsPFSf/0p1og914
         jTbI1yGE4nnUNW2SOkXJOJTSPG+uUNqqL6mjZNX3yHB8eTBgZCLbbIhvDN7SFyibrsq+
         gV9EobRbKhIlcG3QO6O3jwycrgb6PpTbsLVwVtcr9cXeVS5WAX+UnCs70q+JtbGaBewW
         vQyjr9fahieDoG/pb1Z0sXoWPLyFaHMGFzd/5Dzp7Lkk124R81UEqk7CxkDKtOX/fHqN
         /oBA==
X-Forwarded-Encrypted: i=1; AJvYcCVSdCGsrfQbkILXbxEOuVmA17NbNEka1TZSbgaTHiO7IAsrTdr0RUdwdw6H/Fn8LTrGb8s1sM2gUTV8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc2UqXXUS8gBLcjbVdxgLyVLpYQka57lO8wl6WMHMsgi4vJLNb
	fjnOBvO7KSjIflBn1sZwvm0VYrUzUWyD0yUS2Zl8mTObEp0w5JwWMqfMUYCC4Z8Q5MEkDuL4Mg8
	xtmHN356uCBc6zJDv5QlbKSspDvRib7MxiV7S9X+n+RybXAUfJ4zTjTO2UKDyVLPhrcyHRbub
X-Gm-Gg: ASbGnctBhIEM0lKeOoLI0UImM6oShANJ5mVtZJHl7r1VLjt1vSzJc2SAUYNZCvp3Bk/
	Q8pwN+aiFS3p00r7LqVLwjUrPCix32cwuoSoQvAEd3y54TUZd/TUdO0M9daM1C766RVrByrCz+S
	GKMu505bi8l0gEQCK0AXmZj+L3clOe77pdKyeIZMAyCWGyyY9+8/pRi0Y4VMi52mGUnwQojFbvz
	BIq9jCwx9wQ8IvEJCF1fiPzWAgOFk82uWeFdy+PngsnQFy8Swa0EfGHhv0j1k1GTk7lZFdnHu1x
	ZFfFt89+nWZuOqucOS/ZVKWM0bt14wzoWOuKSt14rziWFMjGqVWA9zyuLe3L9kAMHOdInJqogW3
	WIW3O4szr3rexDjqKZ0Kz9f/Mc1pBN1HSjfbkPDGMUBRQFV/i1Mry
X-Received: by 2002:a05:6214:485:b0:707:62c5:975b with SMTP id 6a1803df08f44-70d76f8b608mr442466d6.15.1755628679267;
        Tue, 19 Aug 2025 11:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLtaEbQxqekbslnXL5QEBDgG7J4g/ZfzsWbUQYRkJowuQhIsbV+V8+PDEmGQipEuEBgC213g==
X-Received: by 2002:a05:6214:485:b0:707:62c5:975b with SMTP id 6a1803df08f44-70d76f8b608mr442106d6.15.1755628678559;
        Tue, 19 Aug 2025 11:37:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef473889sm2167995e87.167.2025.08.19.11.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:37:56 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:37:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] pinctrl: qcom: sc8180x: use kcalloc() instead of
 kzalloc()
Message-ID: <ezuwnxx3djye23x57vnlnvujauiefcjd5sh7yyodd7kcldfqhi@ya5kyvdftwn6>
References: <20250819143935.372084-1-rongqianfeng@vivo.com>
 <20250819143935.372084-4-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819143935.372084-4-rongqianfeng@vivo.com>
X-Proofpoint-GUID: z-5Trdgqxyb4VvRkKq-CLeQi9AzKQxSi
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a4c488 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8 a=fkPgAY4U1MdPopZYpRkA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX0eWpdmad1Fot
 B2BdCsPoSC3QWtJaFEEj4jleLfMu1rb22cpNhWrdYjnKLPkMyVX2SbW3NxXgGSFWHvCsoGyRAHs
 EmntQU6lvqm970eijDr2wF0ifS/ueDeUsbxdBcBWqYx/0lQJjiLJrw13RIkic73fXPKgZ6Ndall
 s7WPsK13rFUxv8tCd2EgLOQqHhduZeytk5HnnZruB2VzZCfL6Kw4ZvB6Q7GHf6UUYrXgjh/6tcx
 84W7jRd6u+2Cq9QghXog/gL/id7wRvhTrmQUVll8PFyNlkIkpNO9EUdyxrdk/DcUR7O7AAHCr9G
 CyZtmpClohd67n0uuQSpxSD5IzXcgbKz5faX2iGyRotRRCvfj/q0Qjmzg7uDH8RdGVkXMdWw0U8
 Xk0bNoXd
X-Proofpoint-ORIG-GUID: z-5Trdgqxyb4VvRkKq-CLeQi9AzKQxSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071

On Tue, Aug 19, 2025 at 10:39:34PM +0800, Qianfeng Rong wrote:
> Use devm_kcalloc() in sc8180x_pinctrl_add_tile_resources() to gain built-in
> overflow protection, making memory allocation safer when calculating
> allocation size compared to explicit multiplication.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sc8180x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

