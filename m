Return-Path: <linux-gpio+bounces-12132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5F39B1780
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 13:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBDD3B2251A
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 11:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC431D417F;
	Sat, 26 Oct 2024 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDz3mP/Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEE61D319C
	for <linux-gpio@vger.kernel.org>; Sat, 26 Oct 2024 11:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729942726; cv=none; b=YN2jgpGtIZfbi8pV2Y9OBltIAFflhWpsPIqcG9eu0AhI3B0ymSNHBclpbNsPXI6NGveb/2FcDGJq4ANXvnqvmCMg8UuNP4TwwipL/EPvj49A6tEQ9GInRUZIjCmbTZJIF1SLLA1aNG22NMO6gOkY8wgs/3Gzp/nLjuQXR33BZlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729942726; c=relaxed/simple;
	bh=wxc+dIWaFDqYXJ2UOmZG5MwkG5ZYvvsWMsSRYr4sCqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ni1XnuUQAkYlL4KMaJgWjEQEyC8dYHHNdritPFAzJQEMrxdbMQEP74UfcHyyzzQ4VnMtIjkegmoPY3366rjSVVtVWDUbp3hJy/x0KMfBeTZid5Ap4Mek470I/1MCYT7/2oYxx1wFaf49leHaaX8l1tYHWd42Yaog8nKkrZF/gj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDz3mP/Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q5v2YX032585
	for <linux-gpio@vger.kernel.org>; Sat, 26 Oct 2024 11:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wxc+dIWaFDqYXJ2UOmZG5MwkG5ZYvvsWMsSRYr4sCqo=; b=MDz3mP/ZMt8WB/wA
	IcAO7pwBza5WgovDX3dJprlxB1WBXOdlPTAQL+bugHUXQHO1DzJOx3plmqFgF2/Q
	s4nN4CF6YY8HZIB60+OXGDQ11A+MGYSt/PWsAmJpye2ZZ2tS85KWDsda2TxRuBiZ
	J6zLWeF9baxcRvmA8kMnn7BbcgxG1lL9vHH5zlQ6L+9SpExDDt4R4EwFg08JcEJu
	oe0jv4nXQFZ3i1JGYJEDBbp+sBXu9r/eS8L03Pj7u4q/txn/yX+IPtKowVUnbAtK
	Lx59EVD2BQykqmceCas40qwhdXfaalHByj5wjrcea1NCz8jR+whdjXkIfMHTcQJv
	WRYixg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqe5rvvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 26 Oct 2024 11:38:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cbe91571easo8875466d6.0
        for <linux-gpio@vger.kernel.org>; Sat, 26 Oct 2024 04:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729942722; x=1730547522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxc+dIWaFDqYXJ2UOmZG5MwkG5ZYvvsWMsSRYr4sCqo=;
        b=hvz2UuIS9p8G5xoXhy/fJv8aub8+PGsppi1DJ7wwSwV79rRmqGwweYrSMGvJfPM+HR
         DJccT3Za6aZpjmVtdBQcfhazZRHeZHAFN6u1ARknsUz6X2XdqnczVTCDIkeMaahfyIll
         5W5pnbZZqXngV9Sp+WR3mGWPz3UDzTa2zy2MTiitzHFoQUTUxViXulosb9Cz/72X9BGo
         KKWU+C177UB/47PrSoLhjTPe+gyW23d6lBzz0RYgMHIpQ2t+C87ET0jQmdYZgSf7i0bA
         jfWHuW5npU6uBkkEKsn5pr12i7jK5An2bMo0vOAHDysZP5l4MSXOSRD427tttL27LnHn
         Bchg==
X-Forwarded-Encrypted: i=1; AJvYcCVRJ0c83mMnBXcoq5gMRBXvHTBpRbALWktMdskznwCDr4tcWWybZJA/PksQ0zrn1FFsqYhN29SPcfOc@vger.kernel.org
X-Gm-Message-State: AOJu0YwEjDguDgDrdM2fYIt5k+EH7VYROI8+JQ+DxwxmCbzpEXApqdLJ
	xK1OpWvofr+QfzZe7lr2ZLxeHNhPlhYIVSxKfrq0909yZ/sB2gZldrixbEiAc34EAmBcdg4qYl5
	fO9IcLrZTDi79qpQxt+mG/6MvYRgyCspKsEkd2kR9YcZ/70gJlsTz4VuHMMcI
X-Received: by 2002:a05:6214:492:b0:6cb:1fad:82b2 with SMTP id 6a1803df08f44-6d18566505bmr16966106d6.3.1729942722392;
        Sat, 26 Oct 2024 04:38:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjV61HARupu7W70JLeA+UqwYOAVuXyIFMiS4jRVtOulAOXFcqwYl1WNINTuzhv44XyFwqZCg==
X-Received: by 2002:a05:6214:492:b0:6cb:1fad:82b2 with SMTP id 6a1803df08f44-6d18566505bmr16965886d6.3.1729942721904;
        Sat, 26 Oct 2024 04:38:41 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f2994ddsm164820666b.110.2024.10.26.04.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 04:38:41 -0700 (PDT)
Message-ID: <768a1c92-6e1d-4d6c-90f6-efe66f68dd0e@oss.qualcomm.com>
Date: Sat, 26 Oct 2024 13:38:38 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm: dts: qcom-ipq5018-linksys-jamaica: Include
 dts from arm64
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Karl Chan <exxxxkc@getgoogleoff.me>,
        Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        Sricharan R <quic_srichara@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20241002232804.3867-1-exxxxkc@getgoogleoff.me>
 <20241002232804.3867-6-exxxxkc@getgoogleoff.me>
 <f2eck3tudqoqyylcknfvz77wj52fornxevp6po3y7sov7swikt@asez6wepyl6h>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f2eck3tudqoqyylcknfvz77wj52fornxevp6po3y7sov7swikt@asez6wepyl6h>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l5JwoK8kdz3Pdd4kBc2ovlXl4zfooNFY
X-Proofpoint-ORIG-GUID: l5JwoK8kdz3Pdd4kBc2ovlXl4zfooNFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=682 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410260097

On 6.10.2024 10:14 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 03, 2024 at 07:28:04AM GMT, Karl Chan wrote:
>> Build the Linksys EA9350 V3 device trees from the arm64 tree together with the ARM32 include to allow booting this device on ARM32.

+ Kathiravan, Sricharan

Would you folks know anything about it? Do we have an open source
U-Boot release that could be sideloaded as a secondary bootloader to
kick it into 64-bit mode?

Konrad

