Return-Path: <linux-gpio+bounces-25848-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF030B50964
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 01:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5CFE1C21A82
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 23:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDDC28CF6D;
	Tue,  9 Sep 2025 23:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mXAAWBXj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAA4266EFC
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 23:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757462160; cv=none; b=t+iStSWU9zvMfyrbeRRry7lpYrtod2NV/2z8h8y2AvCxXAtiCZHIdncfdXhfIRU7ZmcDNk/S85FvwTZpt2JfwNogc5OdqOIArKigF+/YZQSvYrmnGSHQeQIZEkF1vkZ053rSzfRcl77M11KD1iOf7b7iul3+ad7XaiZO2XPgYPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757462160; c=relaxed/simple;
	bh=icD9gdWPAJJWeEBQEpTeScQSiYNChrtZNid4ligZQ7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3r4D7f8QaJgoKkbFOMGsVOu4ebgkyOvufefI+KYG1LBW5ZcnhFdGg12cRQN9DQ/C+Cj/zIutn7L4kYwBCYwCuMVPO2GnqtjmayqxwLH4YntRFIGGLtHoNhPWMNgNaQXZl5XrsFlElKywLd+lj1P9Os3hHxzMo+a9UheqDijB2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mXAAWBXj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HQtM8020099
	for <linux-gpio@vger.kernel.org>; Tue, 9 Sep 2025 23:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DOgS6PiQ/hnHybpp7vuDXCDS
	oK5LCMPR9NyO/JUnO1I=; b=mXAAWBXjLX1HxJ54WRna3AxQJL7zH/dZiqOT6/Wi
	rAFtu8RwDTdyNpY+FNLbMAIbgcqykd5u4egWc11FoTpNo3ShwkbT3JZ+/cDnmOUc
	qmg+yBuPjxNnrbrNwz0uLTuTNASiaBQVqbkqUkNWYGH2kF9CwI75178tFkuVQ2C8
	IuoZ99dxZRlcJE+hSx3q6Srx2qVtGNvCbnmgIoKkPfoxVvuj2AV8mhT8dfcV/UdP
	5q7RusnOqQ0OVP9nCMW9m0g0yZF+IKJMk0qek+t3v1haUBSRgESgPb5enGx2UmdS
	kZI5r6jbUfDTt3H6JmPXHRT48RaOB1HVQ2wyPCUoHkUG/Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2612t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 23:55:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7211f13bc24so129234916d6.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 16:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757462157; x=1758066957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOgS6PiQ/hnHybpp7vuDXCDSoK5LCMPR9NyO/JUnO1I=;
        b=CWAkWxqmZ5BNbrrf7v49uRElHktDib+z5QfIBBe7Fo3mS1Lz4nE6MQUW9uhun/ds6R
         HAVzDZFLR5lmeQjeCeoZy1+g5LfLkSihqFr+J981ruWjL6XcfEbExIjo8T6+oLhUpd2Q
         wlTFqQexLZ0BywTJjWTGZ6S14XDg9E84ziRU7b67nag9S4jvaBuSnOujhkk7l60J+4TO
         WbrChCSrYjE33GiezFyYKO5EWEh5iVoH7mEBVpSBUeTYJtVKNyjLPFVOM965eJdcR05F
         AhiNScV7V5jGx36chkrG6DEIMzqLhJefvqmtVwGqHFW8tC16eEelBfhuTgP4XFTc9wSE
         qbpg==
X-Forwarded-Encrypted: i=1; AJvYcCXCaI6ujM/w4Vt7lXqIZyvAO41xFTOejlIlpKRwoX7j17bUolwA6gFCL0oi0MsjrXNWHRwEmx5bpcSc@vger.kernel.org
X-Gm-Message-State: AOJu0YweQBj0/vRS+31qeHtKUutd1LEK18bvYsAxNVQDssXnVqRZohRm
	UjQ8ztn0z0gN8xh3qsojGoVI1jNootmUrwYB7doq0N/kvNkrN1WUqtuTBoccNoHEfervHcuU9Jz
	PxW94xD8WnXdEF2043um33vq1Wdvwfufcmo+m8orxNTP7KYEVbCMMlB7g6mGED5iF
X-Gm-Gg: ASbGncsq3R/Dn/oIJTW2kTHtZSZIDBKaJhgx0aVl/gcEhipRVF2toKmA4/W0AiWkpGu
	sZF3AJnGfhDziL5j1+VrflLwqu3O4jz05jTPLxDByigKfcf8p5IlLuBQ6X8lYXJv+7Xke5wWGMi
	8i0SOh2oAn+4tQWlNnhrLxoXyE4Gc1fddm5qL/i/4uQZ21v8Yg/Yfsh4cQ/13jvJ4o1nSOzrKxU
	XL1954dSOjVVP9lamziDSAMD39Qxi1a5vmwuRmPrHy2NaX+tBhyPP6fJdyNIBQ3hdUEvov5Oio7
	rp5zpIWwY67BY7sQnFnj3ZG3kwZkTXPCLrNSrIyfffQx/OyOkpikiHmAv7cvNMeVO67VxUaV4Uo
	o112aBJCUqWVcSOv7bxfQQx7q22kqprt5/3gWxxjECtkzjUBnUS3Q
X-Received: by 2002:ad4:5d63:0:b0:70f:a874:9838 with SMTP id 6a1803df08f44-738fd44e4c7mr123779816d6.0.1757462156560;
        Tue, 09 Sep 2025 16:55:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/+l4IAg1ke/qBgFq88M1rFWuCS6rIGDcnBc+blOxvMw+WiXtyVyRKy/O3bA1dxeMZYgKWSA==
X-Received: by 2002:ad4:5d63:0:b0:70f:a874:9838 with SMTP id 6a1803df08f44-738fd44e4c7mr123779656d6.0.1757462156128;
        Tue, 09 Sep 2025 16:55:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56818a11806sm831373e87.129.2025.09.09.16.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 16:55:55 -0700 (PDT)
Date: Wed, 10 Sep 2025 02:55:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sean Parker <sean.parker@viasat.com>
Cc: andersson@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: sm8250: Add egpio support
Message-ID: <don2dkb6wfi2g6o2lwwjk7khnptiauvzpnxie4qzt7bfy4xona@sf33md4bqqwj>
References: <20250904170613.68855-1-sean.parker@viasat.com>
 <20250909205248.16169-1-sean.parker@viasat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909205248.16169-1-sean.parker@viasat.com>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c0be8d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=B2zXoFvHAAAA:8 a=EUspDBNiAAAA:8 a=HbEANjnKo7ABX2ZL8B8A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=VYVPV9JAioCtC5HZRjjr:22
X-Proofpoint-ORIG-GUID: K_jusoHlNAqk-WyMxvrk_HSGr4k75q06
X-Proofpoint-GUID: K_jusoHlNAqk-WyMxvrk_HSGr4k75q06
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX7CmTlZ+57RtC
 B5Wb9mNz3at/cu7OSLkpC4W/kMFdWhzkB45VsPul042+aeAStLqsnMwGIUGmSi1KTh4psA9i3PV
 yjYVm365Cg+iB7KUISWNYR8tT4W7JiukWdVKO4zvtS6TpWhcnr++Q4jaVop/OOjbP0LcBXjwgcn
 fW1D1pdtx2DWhwW22uGWw6GAFraH9lnTG0qIHMOI2M67MwTFKmWHwMQ9JWr5wTbgN89tMDefrmJ
 8FcBH5lYhrPVIVLRFwsaecvuw03wBSDJ+V3SRpNdRgmZxFSxL+bOSf7zmC/A0TGh6wfD/HNDIr8
 dHjo1+xvkKyAV+1KgdqHzOI+uF+7euS4eGK4Ju7/NFnokctH7ExucUoibMXQABn7kZixG8E+ZOj
 FqrVPDLp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On Tue, Sep 09, 2025 at 01:52:48PM -0700, Sean Parker wrote:
> This mirrors the egpio support added to sc7280/sm8450/etc. This change
> is necessary for GPIOs 146 - 179 (34 GPIOs) to be used as normal GPIOs.
> 
> Signed-off-by: Sean Parker <sean.parker@viasat.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sm8250.c | 81 ++++++++++++++++-----------
>  1 file changed, 47 insertions(+), 34 deletions(-)
> 

In future, please don't send new versions as a reply to the old one.
This messes up reviewing and can confuse some of the tools.

Nevertheless:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

