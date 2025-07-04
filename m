Return-Path: <linux-gpio+bounces-22809-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65444AF994E
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 18:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC960584BF7
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 16:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F8C1922ED;
	Fri,  4 Jul 2025 16:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nbus9nel"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBF919C546
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 16:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647811; cv=none; b=UPpf9ocXfYulGJy4ba9eLDAQhYtY1Coc6vJIPq2GPcGLfR9roduxS8CW9hivdznPnEp9acPfmhvHk/xc0A6HGVoZqlWm4OepBWkOG+O4MVutdgQH8Clm7yA9167hCQVFphoNZgu/3Darqrw9kfR23NeHiruccOd6aQNKhuA+KS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647811; c=relaxed/simple;
	bh=csbEb0KENiAbOhaEZqVV0SELhvMQVqF7Txk57mtfHe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iv5ImHl7/HQfquUaui5aYgslA+8BlvfImUoxsFLwLEwiETMY3Ce8lOWXUVZ6yQvzq0PU2q8UF/M1Kdvth1+98LETnDWOhi/qf1tGJ8HenKOLzVhyPC7AuSvKlBq0535vxNUqggkrjReqz5HLK86hhkG8RQdBTUnxnTGiEWMybt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nbus9nel; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564ECmxU022019
	for <linux-gpio@vger.kernel.org>; Fri, 4 Jul 2025 16:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wEM4j1XOLi6BZwo1cLv2zjvJBeM0ee0P0ue89+lcOSQ=; b=Nbus9nelbqg4FSna
	93HfDfdeto7B2/ugkW/4Ws0fH/pDoriS1o95UxOs6u6ShkE4zj1iE4iKMLCwrn4A
	clUM2W6i6yGumd3cyWy6koyrmQViLHoDDYM/gKqn0/NA0+1+0+nwT6mmr1Nhqv4z
	9zDVDsCE3eJIG8K2MPNG7PK4BcJkCcHnQotoE3GNnCL0XGbhDf2vetMfObCnRZfs
	u+Uor4qXhiq5WEZarpZblNzsR9bF7NlVJVqDwhpSS36FiHXutebS0HiSriSb5tR2
	XxKc+4/ZAIBdNWyOxEuDW2GWaOC1NAsEwogfaq0ubdX6Bj3IZ32jO8WCcpsCUBdg
	Hj1v6Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxvm3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 16:50:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d4576e83cdso288067385a.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 09:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751647808; x=1752252608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wEM4j1XOLi6BZwo1cLv2zjvJBeM0ee0P0ue89+lcOSQ=;
        b=BcqIdmQmxYOc+UBRBJUMXxqmoef9iA0hEtTFLzwRJLuSX3X2pKovNXT/BnGuVzEBAI
         u1wnaTTpUUqIt9VVjRBio9W1XbHoscv88J0fG7E690z7wpLTFfbzNHq/y/P7YooHrrfU
         xAJM23xW/1sLJ1yufQib/RUD2ieTxzITn4FxDq+5wSZzcrJ7jFqHy4jy02gXl1zR0kmV
         wmef/bZ2kuM6DxvNiv6vDpXCF6T99uu7pHAobrZ9IVSUk4U0pZg54QVgAL4lNZyaDKcu
         o98gmRp0khTm/Lk16kgqwV/Co4257rXJWf6B+bjBLxagELVDyH62N/+mkuqcuSpQJszd
         vspg==
X-Forwarded-Encrypted: i=1; AJvYcCWQCq3S26EP0aNKDZmrHgjUVhyLe5m36MA4xdaX3J1mls3tUIuT5Ykjbuai1zquUoklY/oC78jEHHN0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt3NTv/qDTUOLw3vYmez70i7oVM3ebBtDo2f76zvNiV7wDMtfI
	p7S8lZQ4D/bryiXl5BGzUPzkbzYGx5y+AF9Yw1E5fKeIRovlRQ60kjn9TISFPLFp5DvA4Hje8Il
	FCuCa7BkgYNKCI7kJXw53niN8XvmERTLQcYkWAQeGdzp3RS0K3F0kaoIx7Sb/eKTc
X-Gm-Gg: ASbGncukTLykZXU8qNGJb4O8Fw0BtT5liSX9qQiM4Sxww5W3wvJ2Bbh/W8+h0r+a/br
	jQWd8ghv27HSUsDwJ17mpGJP60h/fFTm5VZqgDGho9eAfQUwLpk8EV81LS5/bxvs15cMh9RUqum
	y1+fe4SCvsiZDVOnG26sdTfBmO3qOWUfio+Gbw+2yf/4wjoiqg7oHyhes8Y5ZcCfuJXExLI4wkH
	OLIjE0aeDjKk3ZZIhTaVFtKpmS3MGv2bkJgi7TSAjJtEHBy2voGfEAHWJm5BPfEOZ9QYFRayR0R
	LXjZMo9qIXKSETtcB5A4KKOEGckgQVcfjLAhBHGqBC/zoC4oUdZZi7KIJ0WDSye2nQkBrbiSOhj
	3IBzLQrYStqAWUyrDF1qNHkc84p0W/lO32hc=
X-Received: by 2002:a05:620a:261b:b0:7d4:63a0:e0c2 with SMTP id af79cd13be357-7d5ddae41camr392082485a.15.1751647807813;
        Fri, 04 Jul 2025 09:50:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPoGPvTmGMkFyX/qytnycN+mM326tGMOLxBZbe002Y3SgEer69CCflWTfw/Q2aA0VrRAuyyw==
X-Received: by 2002:a05:620a:261b:b0:7d4:63a0:e0c2 with SMTP id af79cd13be357-7d5ddae41camr392079285a.15.1751647807416;
        Fri, 04 Jul 2025 09:50:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baf0asm304624e87.7.2025.07.04.09.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:50:06 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:50:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 3/5] pinctrl: qcom: sm8650: mark the `gpio` pin
 function as a non-strict function
Message-ID: <efods2cmjrhbjvpffswvsubm52u2hvkd6rry7gjwm3k5c7ezo3@b7wc6p6ieiof>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
 <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org>
 <qwlhmbsd5gqrgjsfzvaqha43pztq34bxjswske72igg2z37euw@2rkx76ikaclq>
 <CAMRc=Mdk+fGiVOH_Zq0K_gRpo-c2Gyh=SakKL77bL2BscS_PKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdk+fGiVOH_Zq0K_gRpo-c2Gyh=SakKL77bL2BscS_PKQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNyBTYWx0ZWRfXwDH3AiwuO9Fj
 1ZzoUYvyvaPF8ls90XcNbXQHK36XXmdhz4KWpls1CXlhm9JpVoxaOYQ7KpEyonfAKqLjJM/uzr0
 KWFXBK7GS/FaZ8ZsxIhpWljGoUvWvMD8VjrqkN+Zu5BKbuV3jNuKdB5ZRWu02dLYrgp3ENY3H8c
 9YRuU4JZ0Kt/7LLRlG0SuIMiZ0H3iyD16XiyV0Lo7IaiotN0GVGEEOI2mTWZx3Hf9gOBFt6/s9/
 EJYzfa+5qyuHjgvUUF1MLsIVDxtuFbRP14N6W8XlsTyonyVBqTicde3viWrGBMqev8HPr/G7BgK
 VzqwDgzB7e1GiQMZdv9s4gLosfTHcjcBElZwfizSCth1vsTXMGiwypDpnC2yosdFpnA9IZnjhRF
 dkxHUD8kwN2WymAzVhZA6ysesQjl9QX+sfyx7Ba73eFBwiMwYBt3icPpDJJi5iFlTMHKEeC/
X-Proofpoint-GUID: 7yHYYGahOg5ZTsQ-vWbQJ_hadHbgwUiR
X-Proofpoint-ORIG-GUID: 7yHYYGahOg5ZTsQ-vWbQJ_hadHbgwUiR
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68680640 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Xwy0tvpjcyFCf_kMTfYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=832 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040127

On Thu, Jul 03, 2025 at 10:17:43AM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 3, 2025 at 12:50 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Wed, Jul 02, 2025 at 10:45:33AM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Allow pins muxed to the "gpio" function to be requested as GPIOs even if
> > > pinmux_ops say the controller should be strict.
> >
> > This is a strange commit message, shouldn't "gpio" function behave
> > exactly like that - mark the pin as a GPIO?
> >
> 
> They should but they don't. I should maybe rework the commit message
> to say: "muxed to the function called `gpio`...". The "gpio" here is
> just a name, it could as well be saying "dmitry" or "123456", the
> pinctrl core doesn't interpret it in any special way. What I'm doing
> here, is marking the associated struct pinfunction object as one that
> should allow pinmux core to export this pin as a GPIOLIB GPIO.

Ack

-- 
With best wishes
Dmitry

