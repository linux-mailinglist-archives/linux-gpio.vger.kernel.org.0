Return-Path: <linux-gpio+bounces-29134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ADAC8DE40
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 12:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6A85B4E05B4
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 11:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA54532AAC8;
	Thu, 27 Nov 2025 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVlBR9/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUoL3Uqg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D090328B6E
	for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 11:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764241567; cv=none; b=P+wafUXa7KCWpOQxk6Awespts9hE7481tc3dEi9vEVRnRbwTBYkMCWMBW1mGO31VqZF+fZDzXkDDeXlKnbPENeWPHindz3mFi4PlFGcOkro8iTB+zz3y1A/Tz6QCfDjWgOJfR1mbZaResn2Z6sp8GmUMns2WN3tYMatlZn9M5EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764241567; c=relaxed/simple;
	bh=gErO8r2/jH1JEM6Wb/SziNZeqekYoVk2qJj9NHu1Dbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TdBHGRH7IswIwLXBHh16L2TRmQPNvPy3n9MSkP4ev1QrroiWQO08AmOT6LViMErRoRgDJA9ugq3lllClta3/xBkiZv3RhPSeNHtAtMvrFPWN2sNFpOe46/4DdBqgI7gAZYhfd1Ra3hASHUorTgh2X1ZXW4QdjZ1khNwOTQYhWtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVlBR9/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUoL3Uqg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARAVvm6913868
	for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 11:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dsM5B0ACxhRDHWXvfakmXYc8i5gMH4SHAT6VoxxH/Fc=; b=VVlBR9/l5YNDs+N6
	1CGh2ohRqvDYEB537Y58T3oCOGA3g6gMddpeZw0a4Pm1rNld/NSblhMJkFaG/PLs
	vQ9xjlVdtooR0qI9gV+E4/1lksGm9fNAiDd7DZF9uUoHSZX7urm847rZVzRKqg/t
	BVc7iUJ2piZs1dw3w8DzsIWs5GR/TctO2X+oXyZPEYvC9dWiQ2MAeG9UUo65jVhU
	EzePBW/q7/pgFvh9whrRNTpGkbunVeWWHTrO+SYqyRCV7zQU8KMmKWaSneLqmPPg
	GAk6ZVqmep3HrVglgBFmh77qvee0mC9jO2UV7eS7y7hxw+FdfTjz0DyTVddoFVlE
	v8rX2Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmynr2ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 11:06:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee07f794fcso1323071cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 03:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764241564; x=1764846364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dsM5B0ACxhRDHWXvfakmXYc8i5gMH4SHAT6VoxxH/Fc=;
        b=hUoL3UqgfBckrGzjgMuYHRalahYGD0h9d2plK5h8UTiltdY1QJpcVpD7TwjbMMv5R0
         zZaGC5tmmLLpMNDjzJPGsHB0XN6wKu+YFhgxnu4uQPNceUAiC3wK7wTQPGrgxq9halgp
         mbZVzB0mm4U/hSyp0YFWU/hitqNuw6roV945IL/i7DFheDPGzA1st40NnqsAYzQi/SoR
         dntKxhe8f4ZuaCCkyx7Xg3ebEWnZAb0YVvUGfoX3B5FJ+Gjxk8CkhlltjUe8LETj0z0I
         bRLJj1Iog8aDPW7bbt11XwccBy68N7+Zd+QCMHalrISzqybAQQhfOnSznjOjK6wbjV4H
         7/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764241564; x=1764846364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsM5B0ACxhRDHWXvfakmXYc8i5gMH4SHAT6VoxxH/Fc=;
        b=GA14biQJ3YR+Jl6Tpg9NQyH6mLHJjaI/M4M7r7aSCRySlb4aIYgc0dpWfKs5Qz00Rm
         Q9QoETshrxIGSxi2umLGc3pC1cGWJRGNt0hE4QBRZVFOuhuE5MuLUcjCyCbIVBSUGtAx
         ij824r9kMZRgdupBO8x4o7FHk2AWoRk8ookKnc1g/wlGQ4+JknShF1GxE8si5SlT9BlR
         ECaT6bkF9HJ341HQrLx5gf/VqLn6qdupOMFlPQRIafLvWoQugqJujqlT2vtJPGkesnpY
         daSS+Lsg6sAv9mheDpLJegt6vXk7tw/4dQY8uQ2pe7/TksphxUNPbTcuoHsIWME0xAB8
         crsA==
X-Forwarded-Encrypted: i=1; AJvYcCW50L/FJilDMXM7eZDmgHR3AHrxrUQDAqL2cHX/Sz3FuLRXldCqzi09QHqqnepH6vdNa3Uu9RZ0NftX@vger.kernel.org
X-Gm-Message-State: AOJu0YzbeKFXWM/osq37qYzTyzpwQgW8WBWeo6zgcParihSg5X/DOsVo
	k9PsTETojzh7/vDlQfEUxLqUymQLddgfxK8KHtWqc0EOjuiKOE0/miawmew5AsKtyi9Me/0s/Hy
	E883vtHdusnoQTplC0+uMWXH8D/gvSPvlSksdjYdzN/1Q+0qmJGCm0gx79F7YLguO
X-Gm-Gg: ASbGncs8gimUpuCCKCH2dmVuq7XgRpoNssB5L+/5V1seBuA1CrOLxtC5d3b0FYe0OeD
	BvFzdZMqonyv0Ao2CmZimh3Js0+dbZFca+9VdEjgzfDwqhj9hjqzdJFjzGDKjCHnzGPjzeW5xVG
	OkCX0qB4XaIH6VdGiXykftiK+5nCj2lpiBEVGeqx8uaZXcdN1ywz6nvRwtHUJiL0RiN0mLGugb1
	qlZmCsKdUVo/8EwA02n4yqVmF4nGc+qB8u5qUrbJE8EBX5xM25C7aGavmcZaofkD9XQcJGHCSl0
	oVWO8aXS0j5ZznXegcA4ymUZ72ktCO8x/QxIsh47Pz8YOkluaU3CFb/1diOSt/FmHcZQpnRVcqU
	Lsucq2Zz4ggPkiYdIfP3NciufyCov7Ftou87QGfOUxLZLtX3L2m6Gap+ccoyvduQY5jc=
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id d75a77b69052e-4ee5894e4camr234809401cf.10.1764241564335;
        Thu, 27 Nov 2025 03:06:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQ2C4T/zkTEcfcKbF3Z1M8/NcZ0UR/ptn/bgi8R2SS+xmUzOkuSJbfZlY91sr/2UxXeGziwg==
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id d75a77b69052e-4ee5894e4camr234809031cf.10.1764241563904;
        Thu, 27 Nov 2025 03:06:03 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d14sm1277518a12.10.2025.11.27.03.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 03:06:02 -0800 (PST)
Message-ID: <78307922-3922-40b7-be89-5c2bacbdffdf@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:06:00 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: sa8775p-lpass-lpi: Add SA8775P
 LPASS pinctrl
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        ravi.hothi@oss.qualcomm.com
References: <20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20251116171656.3105461-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <3c0e994c-7484-432f-b3b1-bc7523d27242@oss.qualcomm.com>
 <0b7dccfe-ac31-4d75-840e-96d8ddd66fdc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0b7dccfe-ac31-4d75-840e-96d8ddd66fdc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eZrAJZGMDz9EcYJGyM4a1pB5uTlsTYKt
X-Authority-Analysis: v=2.4 cv=QOplhwLL c=1 sm=1 tr=0 ts=6928309d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PbRpZkKeZxfV5sauP3EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4MSBTYWx0ZWRfXzCOXgOPRxibz
 KDo394EtUx6x8Ftd7nbLtEDkDhmP0x2nnrsB3LyIdnNakyKVsQtpPN1Ijn+/LyFMWsNwaFwasvH
 ZPhOOarVMj9VrN5IBTru54veOiCVgBqykCKR6g1bU7vKmcWdeIDYp9oEfncKITIpPEC4A+MhzRz
 YuCiK7u73GWckVg5VvVh04Fl2TngbKmJdDbCZX6aPxWCdaL4AGMFCBWzfnZfuZ4zQVRA4Fbzm9y
 ht9nl4lBoj90icHTlScXTaWNA3mlRLx6zIrWYgqaccBwiUi4ACm9Zwg1x4DYYYeUVKY2Z3BWxET
 0RIqoYp92JcZNIzb7eUGbS3m9k67umet78/ft1sLE5o6249a0u9PIw1uHxNwFoM9OYr5LxBnAZ8
 MbaKCEHiGHG6QjEx5kwbYi3jA0DxyQ==
X-Proofpoint-GUID: eZrAJZGMDz9EcYJGyM4a1pB5uTlsTYKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270081

On 11/26/25 6:31 AM, Mohammad Rafi Shaik wrote:
> 
> 
> On 11/17/2025 6:47 PM, Konrad Dybcio wrote:
>> On 11/16/25 6:16 PM, Mohammad Rafi Shaik wrote:
>>> Add pin control support for Low Power Audio SubSystem (LPASS)
>>> of Qualcomm SA8775P SoC.
>>>
>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>
>>> +static const struct lpi_pingroup sa8775p_groups[] = {
>>> +    LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
>>> +    LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
>>> +    LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
>>> +    LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
>>> +    LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
>>> +    LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, qua_mi2s_data, _),
>>> +    LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _, _),
>>> +    LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
>>> +    LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
>>> +    LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, ext_mclk1_b, _),
>>> +    LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
>>> +    LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
>>> +    LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s4_clk, _, _),
>>> +    LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s4_ws, ext_mclk1_a, _),
>>> +    LPI_PINGROUP(14, 6, swr_tx_data, ext_mclk1_d, _, _),
>>> +    LPI_PINGROUP(15, 20, i2s2_data, wsa2_swr_clk, _, _),
>>> +    LPI_PINGROUP(16, 21, i2s2_data, wsa2_swr_data, _, _),
>>
>> The max slew rate value (shift) here defined in the register map is 18 for
>> this platform
>>
> 
> ACK, will update proper rates.

It (although generally very unlikely) may be that the register map is missing
something. You probably know the hardware better, or know who to ask. Please
check that.

Konrad

