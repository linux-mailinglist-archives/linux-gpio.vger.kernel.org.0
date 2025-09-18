Return-Path: <linux-gpio+bounces-26347-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AAFB866F3
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 20:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D72D15887A6
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 18:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA932D3A93;
	Thu, 18 Sep 2025 18:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KH28pdFF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CC621B9F6
	for <linux-gpio@vger.kernel.org>; Thu, 18 Sep 2025 18:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758220936; cv=none; b=imOxIKzOjgG8MhDN/xstzndR72IYs3rAMxtIAX+cjE6YFGpxW135/g9nqH+FE+vOUlOTBMiHL99qdIP8ERthFlvZC4KXvJSnVyqLAhLqb4zeUeVOOowUNE/RRbhb9yKiwsLsQnd7RfTsxZNaaIzAg1He7uSQ0AMeGAJOWD89I6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758220936; c=relaxed/simple;
	bh=po+vLPdEwz+nRrn33wQ6Gz1tHmjdtWHriulevSWkdgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIx3xyvHjCSRXmP4xUq3wN+Z2KtwhKdh/5G6TWqiTzp+gg9H7lpILm2XYo3c9RsxFHs/7h7R8OZcT8Z4FRecqsLinJceY1qERsr/O2bPkeWbO5cXuxNDqVV9DCJaKsoZheKmmg1Hps/RcisvrsT4i9ZtZ7NrCjUurioku136nFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KH28pdFF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IBHhv9010750
	for <linux-gpio@vger.kernel.org>; Thu, 18 Sep 2025 18:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nF1fA0zbp7Djqf2UTk7dkerj+IhERcStYJUK4pvZ96Y=; b=KH28pdFFlHijuxsQ
	Tkqdw1reTQqEDndBc+MUD9qCFuM2XNpbvqD4c2uEhhH2V4OCR919S5v1UB7AQEy5
	3RlVlVzpTBlZBZONRaTU+84KuVpp9SAY40yGm11mLbRM+bgbzopewjHgb0LbM7Ya
	FGdvtXNzsSTxKCxYO6qfrRFKwN8VwBRaNcPsdcqePqFsn1WGtNZVRw5MqexVIaE/
	iARYmzkEdCwMMREiX/9LTzrhlVHScA/zUXa9hLhVecVVL/hE33NyS+UkgoQRZ4Lw
	tdQryztVonOH63nY8jL4OttMdwwXTOVb/VIThGwyw36RIhVMGDrER0/sPyJn89d8
	9H/keQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxyjrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 18 Sep 2025 18:42:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7761dc1b36dso2442247b3a.1
        for <linux-gpio@vger.kernel.org>; Thu, 18 Sep 2025 11:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758220933; x=1758825733;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nF1fA0zbp7Djqf2UTk7dkerj+IhERcStYJUK4pvZ96Y=;
        b=fD2pfU/9BZ6Qxaz6P/Tv4tB1v95c31g2G+LF8odUXVkCR45NvqiZnoQN9Z2Fu+1Gqp
         86CLT2ruOiZ9zwTEkU+J6J876Y45tLeT0pFhHnlju6XrRynIQKiIXa6C4/NK7utWXFE+
         ZF9PXGRrudvjceRvrRidXDqTv7iwU16+CT67nqadKtHWpUi3jnWnD4KpNq/KikuMu3SG
         SLfs5+2Q8WrdJodAu8bKLpvLSoJI/G3bnnYiRf2Yo4PZLKrE3sJJ1BB4VEx+eMWnbXAA
         iw4SUduEwR00U3nBetrngHUX463tbQ8USD4mOEAeP0qLIXgiqMo7My6tMw2cLkJw4Qf+
         Q/XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMjqlyQtf/wQnZ33FTJ3sGy98AueqZgy6t1Wz42g/O66gqXyGik6d7XTH8Ef51zzxz7Wpkf7n+1QNr@vger.kernel.org
X-Gm-Message-State: AOJu0YzzbZY8UI1aNiztJ6Bu7T2TZUs1Mz1ztfNQt5ac6ktx6A2mCzq+
	XmLITzFpgs1snlkReYfVt7WNDK82Nwsp4cXkUjUuRWfKvFIoYnV22BRUnYgnZk65mNsFq4wOx8e
	EAfy3fMFrTrmGez8vXn5zDh917d9ivWDDFdEwsqZEZeWIvGXmX2ZOePQmmpeQkk1o
X-Gm-Gg: ASbGncudjfqwdw7BbKzfVYItWQdyVuvhBrauczTlPbX28pwIinO7FLrhGBXr7fp2pGH
	Ncw44AKld6W1ZDNOtEW0QXFHvonWlWxfykclYNzI3ol9grZRYQv2+Q7gRpG1trd9iMjouM5z18V
	t/yxwHEOmBOgi26ekOw3F/ZYelA4k+FCxyELVWKc4hOQDQgRBgkF8qtOS0liBYvrtJqHlPocqb4
	aM+jMt86Y8cFoc9kIQgnUm/vnMew6QxOricfResuH3bMv9yxiVigB5IN8avmXCYqvyhu9zrOqXP
	n4l0W3mG8Q75ndvl2811C81XPT2hekvJIJuQZyhMOd8rntQ+5UZgkU2TR/7IlmZO5cyDhkCy9Br
	Y4kCVzf0yZkz2UipiZWY+S6MO2VP6Z3gFnguj
X-Received: by 2002:a05:6a00:3cc9:b0:776:8b9d:85ad with SMTP id d2e1a72fcca58-77e4e8ae21dmr394529b3a.19.1758220932896;
        Thu, 18 Sep 2025 11:42:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzBPxPNDF/BcchRmyd2ICCvlhe8W1SbwWFUAF0xA+HbKxZJwRAh+LwrobiAdxKNso5yJHRKQ==
X-Received: by 2002:a05:6a00:3cc9:b0:776:8b9d:85ad with SMTP id d2e1a72fcca58-77e4e8ae21dmr394497b3a.19.1758220932404;
        Thu, 18 Sep 2025 11:42:12 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfec40601sm3020533b3a.87.2025.09.18.11.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 11:42:12 -0700 (PDT)
Message-ID: <eb3a2ef9-3f93-48be-b6d4-28eeeba84f04@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 11:42:10 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/21] ath10k: remove gpio number assignment
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-17-arnd@kernel.org>
 <27c1274c-e021-ba69-175d-a1271c33498b@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <27c1274c-e021-ba69-175d-a1271c33498b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyqrPsKOV1KTM
 BRQBX+h4OiXelreAJLK4zwnxqQ59m0rPpTwPwixZn5gIgwhBI4WpIDorx2OOyB70+howo6Syg/Q
 3ucQn1f4tSTOCyMRckBawpM0uXsPMwjqdM3gRxeMe+9XDRt5g1LEfNYtSeN5hEvXPujfeCz1tZx
 b/6H76h+RAarQ8aSHkINX02lcgqfjeSanVMaS94wbfxOWKChA+4/uyIEHA3DAsp0WQK1agf9TGa
 R9MHqf3BxqLubfpo1l/C80zyid17QYuQzd9enedxwkEZ75NoxnF2bGNTERGAUsgw7t1F84PD/1J
 u93IV/nYzkscfmvj9clI4GSP/BAyokU4Bkf7F0LipMnjf/G4Oc/Oov8sH7GCCFhZTrrJYM1YRJd
 Scukr0yX
X-Proofpoint-ORIG-GUID: HoGCzZPopot0z3_Yk9YMpVz8lgU5HKkX
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cc5285 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=FtxLtjK2MU5K6IsP0WQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: HoGCzZPopot0z3_Yk9YMpVz8lgU5HKkX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/2025 10:22 PM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 8/8/2025 8:48 PM, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The leds-gpio traditionally takes a global gpio number in its platform
>> data, but the number assigned here is not actually such a number but
>> only meant to be used internally to this driver.
>>
>> As part of the kernel-wide cleanup of the old gpiolib interfaces, the
>> 'gpio' number field is going away, so to keep ath10k building, move
>> the assignment into a private structure instead.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   drivers/net/wireless/ath/ath10k/leds.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> wifi tag is missing in the patch title.
> 

I'll fix this when I apply the patch

