Return-Path: <linux-gpio+bounces-22600-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8049AF12AF
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 12:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A20BC3A797A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 10:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BCA25A33A;
	Wed,  2 Jul 2025 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/X6c4iF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626BF23956E
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 10:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453722; cv=none; b=L0Mq7PO600NoDNz0UU2dmsJONS+5rKyrFd0OkCH3Rm2IT/VM4/22xTniGU+RnDls/f3tQWm5VMUcqGA5FR2fH6vTYCv/OUJ3PVA8mi6Z5jwsGq8ZAES+7cyIiIjGzZvF/mK4HcDnW6C6KIbOplr7nzJtXxp6eU8VncpVMY+NKfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453722; c=relaxed/simple;
	bh=HJyf305xWispnULlnnZ3Q3DtQcVy4HyrdmFWRFyLtuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RMgd181CvjOvM54AHTuEdUaMEHdOv69ltj/NaDYpsupAjtSrgo1VDG6+o9isWwduu876CTi8OaavvB9rJ6jugbFhFPfKGIZUhAwCpGria88G7JlsA3u+zK4XZJ7SiSnmHTiWkPSthclyk15p3eeoOTkryM5yT2p1eL99VxB64b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/X6c4iF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625Oqww024791
	for <linux-gpio@vger.kernel.org>; Wed, 2 Jul 2025 10:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vk7TqcM/VAPxFNM7d3Vzya/VRZ4hi3qF661iXGADBDM=; b=m/X6c4iFCTta0kJR
	zo6MvIGC3UD3V0FUVx/TXYrsL6IY1pAoqm8srfIx7DBcf6/lnIrk0JA8ZpCTvH4Z
	o6uFzzZPsEuHVEWmaVwPlrRmRlVshqPzWtiD2fgqAYV93+OrILVoeksFdWbaygqA
	RBPSY0rBRUB1HGBiTjdSXZClhgU4BUirMCpMR93/0rwds9u+Q2rWydI0mstHFx82
	nRww7j5a+aZs+bLk8t0UWJvYe6Gukr4nSuiMdLUtIrd4WeJNIqGIO8JCIj2fDvxA
	FSRBtL1kC1NHVIG6moQms8qGt+QWCs2nJIevpV3CuUjZjNXUeoDzLA6sGSUP02nI
	sT2NiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9mbuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 10:55:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097083cc3so174327685a.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 03:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453705; x=1752058505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vk7TqcM/VAPxFNM7d3Vzya/VRZ4hi3qF661iXGADBDM=;
        b=jLIm7QmI1B2MbJ+nuuB3czd1vVawAm+W1f+GIbpakUp/FAZ35ZN+0/1kWXj8MsIrYd
         1x9vJGjlcqhYAzEFI1LY9WaST7TX0kz1aIMs311I9/BZ9AssBzQGFYYFmeNehhoEwQYv
         zYKm7RkdXlOUWrIU/gXdahcdg6LnrKTTUcB60Jzc9sWuna3CkaFx9IT9GQ/R6UntFejM
         Fmn5ctttehnHtv+ebf01WD+mip6xMwuVNr6aYra4ZpvzjS/YdUA//vTD250M2cxwUxjn
         HIuq0bOQKAwO9UAf9zxKhcZcPGoVxC6JQcHW6AZQ8OgfX0cOzwnkDxiafdhaq/xxZ+0S
         MlvQ==
X-Gm-Message-State: AOJu0Yw58er4aeNuiVihHTvA33xiYC5CvypAVWhp1yOLH0+OgB+2J2zJ
	pIOqeX4dIjlTtcUh9o60loUWVRmIdYPVr0I0kwwQd3dr0qrps82Rr0qmmNEwPV92zzjHueApfHH
	hKr65c5yBFPh7mlMwD/zlLeiQIkWoegCidJuZLj1S9wLOt6ZukRVJ0vUKepJhDG66orFuOhD2
X-Gm-Gg: ASbGncvFbKPP3rclbJ4KUcTEwGBuwiUiGaVuQZuZ6XkjPD88VnI4/euJ22y5XYqn6i5
	Yc3arKUcfSc1y3W0N7akQYHTJ42cvchrc5ZaG2bPCQpfMa5gHnd1kVyy/Y/VvL+0dbmnEtK0L+9
	Ui2A7+0xF4prG99y5TaLnNRfwduRKiaSRBS6q80UTBJVN4PjROcohZYjfyYEa0HPC67imDk7GOQ
	O831mgshb6FSonpDwpWstQJ725WLo5YKgJBre+iiBOTvlwPSRcNg1G5ly5fuRthbsQ7iiwO1iRo
	4LDVMdJLNiwf2CSOjqfdyjEH4mGgSJhAY/CD6ziiHpeT+DyRz/nxkasU4hwNzbDY3uG0ruIrp/T
	IiEM=
X-Received: by 2002:a05:622a:82:b0:494:b869:abf7 with SMTP id d75a77b69052e-4a97689a84fmr11869591cf.3.1751453704789;
        Wed, 02 Jul 2025 03:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7S2eRUdhaoYyMorGOcDEdRDtdhRw10Y97aNdF7YBj0R59JlX2lq1116ZUFVEFw99flEQ4Vg==
X-Received: by 2002:a05:622a:82:b0:494:b869:abf7 with SMTP id d75a77b69052e-4a97689a84fmr11869461cf.3.1751453704291;
        Wed, 02 Jul 2025 03:55:04 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb118sm8938089a12.2.2025.07.02.03.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:55:03 -0700 (PDT)
Message-ID: <9c4005b7-8c01-4880-b0dd-5be4841616c7@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 12:55:01 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/5] pinctrl: qcom: sm8650: mark the `gpio` pin
 function as a non-strict function
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
 <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68651018 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=JchxpsDTO30hHQ2eRcMA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cn8KzMWmy6OGLDYQRVfnAYg6Eb2wZYaa
X-Proofpoint-GUID: cn8KzMWmy6OGLDYQRVfnAYg6Eb2wZYaa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4OSBTYWx0ZWRfX2DgkG+Y/QIEf
 pGn2JJarm5xlOT8g3pVOyok02Iq2kcUiKO9MFAgGaZlnJ+jvDsROaOusaCa6Fvpj1ax74VtQiYi
 MCJLIBxiMuPVySmmOgO6bRf9vXC05LZ11d3Cz8Gff/8XWRBSAucgfXDF1L+9HKIR821BintWt5D
 lxk1nP00oubztq9HHmzhDhTG40Melc2cBEuONc3jWoA+ZBcqKLa7f2SadFYRjs+mhkyt/Q8koBN
 2NV7sxlXthNpB0Gdap78p+VIZlKFc4hDV/42b3cZNlJ0Kq4pgAuShoH7cT+BY4pj5G/rapBjbH5
 xEEpwn/lZ82v2+mQhMjgco+Yx0fGnuT7uZnp0VaiegWQopSa4H3mlIfFuC+xtS2Y1kV4SCJ4iD3
 1PNrmn7mkZFpb0Ln3oQOMo0qlF77HEo6DIHrFrhS/OSpGasP7Mhp3lsubCnYyMxv3SNVfmez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=563
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020089

On 7/2/25 10:45 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Allow pins muxed to the "gpio" function to be requested as GPIOs even if
> pinmux_ops say the controller should be strict.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

fwiw this simple change could be a single 'run sed on all files' if
we decide to go with this approach

Konrad

