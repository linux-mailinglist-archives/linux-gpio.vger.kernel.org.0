Return-Path: <linux-gpio+bounces-35595-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC1WML1z72kcBgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35595-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:33:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6213B4746F1
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5681B3001FFC
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 14:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8222E7BD9;
	Mon, 27 Apr 2026 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UcbvvKZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jchMWZoH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D6A2D131D
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300410; cv=none; b=KmFDGACRGV9nCuLqA4N6CBNmTQ+SvwDq6CzNWrSnXZnmTSB4xDXhlT7wkjLf3WWgB9Oz8+CvmlH/6jxUhzpXF89Db837e3obVeJ7qZZF6QTRHYO6EidPu4v0JTGNfgtGsUg36HWj865WaVTMtnbSJjhvr90dvVlYe31B8KsvK4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300410; c=relaxed/simple;
	bh=JuemiLqBRwrioORUP3apGn8ByH6NxlePrkE7q19s2hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j32POOuvRmGs8UlU5C2UPWF4nmetY9yoa+EEgZyH3jPbMG3urEjz2zISPUwQM0hWx5dkht+cOtEAfFAWnns3OBaUWizxumqU7PtZPdSjEqlhwoi4tg4eIoGchugyBkcQCPKMiejmkO71KHXmzEA5hSYLyLpIB/Rv8SilVzI7pdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UcbvvKZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jchMWZoH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RC5dTR2006212
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 14:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ENCWJ3tXp/MAXnI+GiSGkpNUCG5d+RbFUTi1THpaXuI=; b=UcbvvKZUpaOzhqw2
	NUml43E5SDcN3UyHwHQVXIXCKe61TK4I2ZMzZubZF3ca2Ike2vKVRwZoh0yVWcwu
	0zOdfCjXlvOjAfW2SOlwvuUuKYchDtGXy3Z91ROX7qo082RMzia44i6KiHM/1flr
	6LJjZlzy2Xd1ZnIEA4zcGgL+O+SaxedUk1iy2THwfOch/E0e7YI4nGctFhnV927l
	rk52EBs2y6zFs5NSjTT3zqkIOZL3egwRajwm8/50kBooy+k3WzQYPxYlTbhRfsvj
	2heS28hxJcbmwvQictJCipujz2roMN4+v2kpnQdbLLPXkTkfkVzPmVx1Ec30X9iu
	V1KUwQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7gkgh4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 14:33:26 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95a76c24859so348021241.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777300406; x=1777905206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ENCWJ3tXp/MAXnI+GiSGkpNUCG5d+RbFUTi1THpaXuI=;
        b=jchMWZoHLSXby5wK+UNZtr//qetH7TMzaPvJ5GZNZI+Q9weTKkF9otRBEf+DLmv852
         UwG2KQrs8Rh9AvjkKQYSjaSBbREJ+a1vSQb6I0vDCjJeo7yC5FSdHMsrd6rMmiK8pSOw
         Accqh1OXm15V/WKS/mKJ5GsXf6H/w9cucXzAzoL2jB6unjUKaCKYfCRzmhs8W24sphVY
         +AZ+Ld0CRnq38KQGhHFN/quJ0kuQIO8tuqJh7incfCeMCR0vCpp+YBNaBlSZUCRXdT48
         CSzco7VJjsRnqGkaEwBpw48S/MdK6ZzeBSAhZ7UwWebPxdhuJk0fmVy6eikNfG9fFFer
         jfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777300406; x=1777905206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENCWJ3tXp/MAXnI+GiSGkpNUCG5d+RbFUTi1THpaXuI=;
        b=b01VQjseB9TwzVRkndXSe0/XJvh3XqFJNIsp0BxA2z3fIBaiO0wxAze4bmskggj2wA
         xqOWG4G58XQm3CoiX3aDyy+B26BR5d3jAbM/utGVnbtWmkHEt/BnYtOntBuITYUNvgHp
         OgSLvwRdLXU2Svp2IF3gPn9CPAiu2TuJcAncUhq6oerXz1kPHo0cWrGEAWV5gOPMB+uQ
         NU4KIBGf4buwMj4LE77AmW2ioox261GfvKKsGxiP6S6MULssfY9tGLnuc9dtb11t1DDe
         1kEfmCVqKYX0cVai4OxZKtY0iq5FDAWFblYvJkSbaeIvq1GA4J77vkPIeCfuSdIkdbCW
         xxuw==
X-Forwarded-Encrypted: i=1; AFNElJ9z7AGNchwmyETusmjIkZ/IOVmaTf3hDdut2mQchs0v9J/awZCU2hIggyYG3AP3bmeOmhDloe+2D5JG@vger.kernel.org
X-Gm-Message-State: AOJu0YyaTkZqRclOjxWsYEDQKKF2kiofsVquAsllEE0RWggWXy0SJ1qr
	cdq95cqztEjbcz4OYiARVOT9heEQXRjhT9J6P0YvrulJzS/xRyz9WMsi1rQdD0xxvdZXJhEQEhw
	Fa3Uiut9B2b0JWHUTdWwg+OhUG3e0nJpdPjRWhGNPsB1iUBhfTPEkHssKwgggjrFvVoHqgU5L
X-Gm-Gg: AeBDieuSrI4bbkiCxDiZKpPXXNJVH/NchvSg7Kzjd7Ha+h/4NNBc3rmlNRsnosKt+6P
	+VGDy9Rr7QN4d/fEYnUTGOtf6ac2gFyCk75V0s6PqxurHYY8oOs1O2YRFEC4KZLYbGkARjvoi7o
	DVl63+xiUBm1rb0faW5mrF59a9IHHyZg4pWn+nxeKTeiINZPDbpeM5yUy8FZLVHRCfPKpVMl0HI
	1lPkPu2LpiMduWMGRE9pYRNLKUx59UIIq2/sY72GETEzbvZvQv4wtRhLoLTXYh+zdKBzOjuj9io
	1wo/LKZlHN2TAptMqEFWIUN4k1OOgqx9XbSXaVzYUJffLQtDuAS/4vidTZBucGADO5+MFk0coMH
	2UUfGhZOhzjjRjeaFJCT9p3R2WEv+t6YzZIpF1Z5MH9NKQqPN5ip6xTeLyyRIHqPwYkh/XDoN8G
	HvvcsOg3xLAc8xWQ==
X-Received: by 2002:a05:6102:292a:b0:602:7589:6536 with SMTP id ada2fe7eead31-616f4c5b722mr8288169137.2.1777300405891;
        Mon, 27 Apr 2026 07:33:25 -0700 (PDT)
X-Received: by 2002:a05:6102:292a:b0:602:7589:6536 with SMTP id ada2fe7eead31-616f4c5b722mr8288147137.2.1777300405231;
        Mon, 27 Apr 2026 07:33:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451be2c9bsm1156735666b.23.2026.04.27.07.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:33:24 -0700 (PDT)
Message-ID: <db6bfee6-6b80-47ed-a29d-1f894008a346@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 16:33:21 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260427-nord-tlmm-v2-0-ade8e0f3d803@oss.qualcomm.com>
 <20260427-nord-tlmm-v2-2-ade8e0f3d803@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-nord-tlmm-v2-2-ade8e0f3d803@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 28DsXerLBC40fwZ947NhPSbUuNGk8ME_
X-Proofpoint-ORIG-GUID: 28DsXerLBC40fwZ947NhPSbUuNGk8ME_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1NSBTYWx0ZWRfX3XetNytmJeEI
 oTHcYtEA87kMl5xLpqLOXRa3i65aZbIgMk8qSd3KSdcZ9mx7XkZEh0c0smoe8PJIWn4vDwkfupZ
 Vrw2XdyF09Er+ckXE7p02Wd2/de5PG73WmxJoUzmmLHZsvltiCAVJ0BybbFRBUd4PxcZHfjj/EP
 MwmLDRtQCOuL1A9Q4nYbmSxVvcxU0kd3c5kMZjPrlqYKqematISnuqYCkmrU61PKtcYIceub1gC
 aRB6B+44SAKfTGVhBpedr6ONZny6e17HEu2Zt/yc1cfpmkST3iiUyRZdrdCq/bmMguczXxpJwNb
 lQZfHlZCo1ANrLOPAXTUQd2azjwb8+9ROFRirS+iyH8llbTV3GzqB4J+9syN/pvlYE+63TpCu3K
 RzlAC9vD62pcpjMDWej/OQnHccA/gYsM3zDi/NkuFViWMYXLniAIG8FR7eHFoh+AXBW5jFl5qPv
 76/xf3eNybkhJrqS0vg==
X-Authority-Analysis: v=2.4 cv=bJsm5v+Z c=1 sm=1 tr=0 ts=69ef73b6 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JsCFQBrew_vequdH2koA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270155
X-Rspamd-Queue-Id: 6213B4746F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35595-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 4:00 PM, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

[...]

> +	[177] = PINGROUP(177, ccu_async_in1, atest_char0, _, _, _, _, _, _, _, _, _),
> +	[178] = PINGROUP(178, ccu_async_in2, atest_char1, _, _, _, _, _, _, _, _, _),
> +	[179] = PINGROUP(179, ccu_async_in3, atest_char2, _, _, _, _, _, _, _, _, _),
> +	[180] = PINGROUP(180, ccu_async_in4, atest_char3, _, _, _, _, _, _, _, _, _),
> +	[181] = UFS_RESET(ufs_reset, 0xBD004),

lowercase hex, please

You'll also need to alter the macro definition - the CTL reg is where
you suggest, but the IO reg is at +0xbe000

Konrad

