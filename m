Return-Path: <linux-gpio+bounces-23691-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C69EEB0F196
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 13:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CC137AB18C
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 11:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E202E54CB;
	Wed, 23 Jul 2025 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2KZycmR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A1E2E54A9
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 11:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753271304; cv=none; b=I5ei1Tp2UFEpPGuYi86lHUtK1K9t/121utKDvZav10VWgM5mfvx0dk2m0P1zfno6r1bw34RUeLe6/ZllSdiOTSlp/gONUjat/byib1BuBr3DDyPu+rWXhnsIikweOgAMI6NtoB7jHwk9sRwRKdhJw74gtn3lVG4vh3ONk+7sNEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753271304; c=relaxed/simple;
	bh=8yH7oFH2qYJ/03mUo911wdRMg26XEqz7hrSxPrVK0DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOhNc7rntfAv8hYkMMGfl/3BODiT70QFBS2Cmmvf1hgpSLZnXDNFcRLi8mDIzAP0CEWPR7moLPquDSJ65PHh2QoXfAmpNocqWDhE64LTuRY+eFpvk2aEKmSwHxAq0/+irBOLi7WStH0ainUmdE4JJraubBpeYLnooKa0vfqkhUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2KZycmR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9N5KH026804
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 11:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSjiElhJLB1AgW9OvfAXOVswnnZr43VSgMiFw0vektg=; b=X2KZycmRvq2doU6Y
	0HJmsbLsX2nwMS2s+NxycamIaR00bbIXfGjWYYE3VcE0Z+NeTKyf5LlRA4yWwX/x
	m1VeDe17KOICbKKiHQCUyLNw9kOsFs6Aht6S+6EkhO5QWNQi3wB99uFRrH5D0f7l
	AhT35V6oTgKZtQ4V/cvCsUAIN/j/DcqgQUMB9qda2Pl00JVqd1Hsvz4j/tV+S9YS
	dRvZRDaZ2EivEYLEYLgtBu8G6VzFvfsVgd9p8F90x9IvgsxReLjtkzB5gFqPNQaB
	X+/x06hbDpb/Ob2mG2M3V8FOnxu4lXvcVfQwjJ6CGZ05LCLI4UcpR+KZyHrQsBKy
	4YFCOQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s5153-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 11:48:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-313fb0ec33bso7151047a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 04:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753271298; x=1753876098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSjiElhJLB1AgW9OvfAXOVswnnZr43VSgMiFw0vektg=;
        b=IASJyM+e+53DFiXuTTxIsapXJPMFMPSeolnm3YfCfP+PnjpwVGOJRCxQDUXon7xLyz
         V3/eYkIq4SzErPoWI6grfvuHg+d+aIYPF8A+Jq+St7N5smuH0Uz7dlgT2k4KEV6HinjH
         JNTR9XkVvWnmgm4/swclESgf6ZVdugCPIDsyJ7YChXqx7AwxC01bD08r8jNr8ILhjHuY
         Dw3T6puCqQgh/JX8xxIHOTk/814cW3ZEHaVBIrCivBlS79aS9W1M5xBPvvOLXeg+H2Ec
         FnRv7DpQSID9J6uBV3SMNF5g4sKaCmtFFRIWSqdwasHJ1fRcXSiGId9OF7PAeQGQML7t
         GgyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbIBX5mtYWy3MjIHDZvFoFNjjhzwhLF0lHcxYuJa1c3jpiToWvLwg2WQta+rYBw+6Wjpud0i6QHRcY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi0Oum6Gfu572Uu/NG1kGawve76OW1UKKRnoqoExP3VdFv1MmY
	1Gf0Kd1d/UCiQR8LHXnFnrnnSPmx8CHc58fbGprkROF9/tdEGLLBKpCL5Q05vF97ZwLw6P16Q2P
	GF0mgZJHZF+BnGqxDVc9eYWkUzabZiPzBudygO5179tX9usejGBLn5pSsUDlnXSWMuXZQjP0P
X-Gm-Gg: ASbGncvR96qCxIdGi9aSRi9Y9WMYGc4K5SOtRbe4HLFr5bJTlwFD6ONdjX8PY/ipGkO
	MO2M1u2yFAhtqpM+QmKz6vYgJrH5y+OSNts/dgZ4+vXZHK2ZvNrjcF3x0fk4EaZtM4XTFpbZoj6
	odaEZEkUg1gnTWZ9wEb1jBrneiso6sXxB1p8Vxbqpbvv/9cWfb0OkQvI6rHakA7SQ2n0/DYPCuU
	3cJsyDOkJ/6Du8h+F5/OBkBFfApHY5F5lnE9+SHRGYspS5w/QOequOGK6D3hKxmXUZGoC+Zs/VR
	S+0A6d8vgSOo+q2ARJrQi1l0GWbF8IFwc4RqIbujYwUCtv/qBJNAvkyZyWH/K5GnwAmLnpsuroL
	lzpIf4yevMPSJHI9ug2Nn5/cVJSRkizHlfHuxniFKiN33WNtWJkmyoQ==
X-Received: by 2002:a17:90b:35cc:b0:313:b78:dc14 with SMTP id 98e67ed59e1d1-31e50614581mr4506837a91.0.1753271297918;
        Wed, 23 Jul 2025 04:48:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyLPE/0loV3mylprlTbYmB9p942oBmpy9lW67S1iT63o2qjYTAxnay9GvJWV74rP0lBxpzIg==
X-Received: by 2002:a17:90b:35cc:b0:313:b78:dc14 with SMTP id 98e67ed59e1d1-31e50614581mr4506804a91.0.1753271297526;
        Wed, 23 Jul 2025 04:48:17 -0700 (PDT)
Received: from [10.190.201.48] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2ff87dcfsm8681671a12.51.2025.07.23.04.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 04:48:17 -0700 (PDT)
Message-ID: <790fd85b-fb24-4d44-bdb1-706c534d1da5@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 17:18:13 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl
 bindings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723103644.4058213-1-pankaj.patil@oss.qualcomm.com>
 <20250723103644.4058213-2-pankaj.patil@oss.qualcomm.com>
 <70277682-94e7-4905-823d-25ae76f72ee2@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <70277682-94e7-4905-823d-25ae76f72ee2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDEwMCBTYWx0ZWRfX5AFRRcg74HRR
 E2yHRqChCm0VW53aLceIXsrGbQtLFO2l4khuygDQRj0Af+bLrUyFD8cG4Q3+YWFBPuDPiEhQxRE
 7k1jA7cx9cCm+YykQHiXvLrP9XVZDAxLxtV/V0S/uMzBxbM2lNOjyUOKURHXNY1K2o6smNgLsrC
 YjRlqmKZa8BBs5f8vPHzE8EWNwgf8EdofXmIAWs0NpfDTK4sgZItfZAU48W7bKb47jF8qI8pOCR
 xWZ7WW/gjEnu/8JVO+oETwclJiGIRxXCKOEoHn6Z2nx8UYWDD8yGqR9DYKUrcyk/KbC2mMpG5Qd
 KW0x++JQvxbRvybwNIX/SHCUK9QraaNms9YUE93Vs+mWic+7CbR7SLLma7XzWdsBevMo/fCB/y0
 WRTYU8sWjmhX7LL/DLNjf4gfu47obzyJSes5ODgbHRNnLrZHtR0MAk3u704Ky2lftTSjKtvB
X-Proofpoint-ORIG-GUID: FJNCiwrFMZQqYGiItnqAR3EE62JvMMIz
X-Proofpoint-GUID: FJNCiwrFMZQqYGiItnqAR3EE62JvMMIz
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=6880cc03 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ak1qS01y0rHKsXKK__AA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=879 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230100

On 7/23/2025 5:10 PM, Konrad Dybcio wrote:
> On 7/23/25 12:36 PM, Pankaj Patil wrote:
>> Add DeviceTree binding for Glymur SoC TLMM block
>>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
> [...]
>
>> +      function:
>> +        description:
>> +          Specify the alternative function to be configured for the specified
>> +          pins.
>> +        enum: [ gpio, RESOUT_GPIO_N, aoss_cti, asc_cci, atest_char, atest_usb,
> Any reason for           /\ to be uppercase?
>
> Konrad
>
glymur_functions enum members fetched from ipcat,
this does not exist for sm8750.

