Return-Path: <linux-gpio+bounces-14035-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2F39F839D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 19:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87F697A1D7B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 18:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B1D1A9B49;
	Thu, 19 Dec 2024 18:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STJER8WZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951971A2642
	for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 18:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734634684; cv=none; b=nquG5WgUiSD5TB/lpG4taTbVM+MnWB8SwHCbZXrj/Mt/+KJjFpJt/i2I1Kzs83IcAap2Jx2MLB/eGfeRVAMGyxjYim/MgjWaCxuwYV2pEYZccjyDybAivGyNTlyV/rL8vF/1kcm8PFR0plqmc/RL5wp4Yeshw6XIHIpcBMoDfds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734634684; c=relaxed/simple;
	bh=zpE/IwkIKQy9Kprf1R8oiWxam3sKYFsPPtlhOYQmHXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4tK+uFvCWMep0bbi821X7f15M697BX+iomjPwdOP28XYn2sduUkGMEBa4MebqeEmHeeyhLbUeoNI8kfSrE55K4AOXfWpViihRv8VN/3kBAbe2EuCLKjWbAaIR5w8Jn4u1z7kZLa3QWn72upa342myTVJ4yDiS+mhZYxPGR35TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STJER8WZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJIgtjk020689
	for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 18:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BoBfjKJGGBGP1QIp7p9Tygch719/YYaqks4CRbMKW+M=; b=STJER8WZlvshyQnL
	1eM4PRuI+IAujdc4ubqMz+Mg81F0VWJaCm5Zr/PyTZQ8kp3HPbSXEzta0JeDJ06Z
	IGrgN4EKGb6rAFGOSw9m9HZ+pVgzDzAGXsOB1BtFbVUTpUBO/1F20tbaDdSPhdiC
	heJCw2sFcjjSM7cxImLVeMMUlcLqN91tUDUJTVnST1Q6B6jgH2+z8mbALi40fc7l
	utL5uA36r6PwZxNTxNgHXrhqreKz9D4pVtDIzcuNeyZya9CJhEeUUMkoPHfLppLG
	J7nWRfvVTJ3ashJmzUWis+wL+S5rwKQTk+oJbr6yjVwk3CmPNBJnb/YPEKLoD8Wc
	xfeLrA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mfup9mny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 18:58:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4679af4d6b7so2810771cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 10:58:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734634679; x=1735239479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BoBfjKJGGBGP1QIp7p9Tygch719/YYaqks4CRbMKW+M=;
        b=XQKIDzUltb0pxUF21oEbjlMhlPrkfuUaGarAajmwRWtUOCP/bNo/4v5Vl2IABMWTbo
         IMldo1+6bmgO+7C7+gNYU+BOozjYDsKBJ5IeNZqbyVDhGPMRsUpsP8ik7QiepOxEg+PK
         CcZYzX3LRzWplgnG/5fgDvlJW+KTX9yr30IkUPGoYhVz7FnucuGwYJr0YZXtNSRmKKXt
         cQ6lAGGTGg9u+GDqLsS6UjQMLBP5LIZqD628qpX7ANzkgoO+hWPusbnqDzMyXXIazxA0
         3Sd2sEY3l5eQ7le/I56fob2PPD8XDae33K62581CS+dQZ30hgZVPYx7Rcq54ZD4nDHHT
         kcYg==
X-Forwarded-Encrypted: i=1; AJvYcCWY4MrbEfNy/cJBiMn6EuN7sjBpjxTn/3bddfLCKAuEib8JFEptL5d6pZZ4cIUr0+g+rn/vrafTdata@vger.kernel.org
X-Gm-Message-State: AOJu0YztQkZYR0xYQAOC2Uj0rajOPFzSEiWWHcMSOKkZcvl5kigt/7vt
	kbasFCGWRf2sIsW4Fdlm9pbjnPc/ps/tAejCE/igK2kh43Pv48YrwzHtFgvsvu3LnP93MT7M3h7
	z3AqjOW6iXslD40a3AAc5vpdXs4+EXQe0Tn9ewIr+T6AntM7CV2jz28Lc3X2y
X-Gm-Gg: ASbGnctvStmaCcIpXwKaW7RLFBjT5jw5HPh7qrrtS3LHbSM2/vJJ7vO+A1AZyviXCQO
	zhI3dpRG3XvBv0RIfvqYBt92VewG13m9T5fTqllaA0AoWZbGxInCH/aQcLboKxI0Rff02pS8ZZY
	Tkz7Zy7IhThFSXEM9IX1JPZCrA5dV3Qkg+hWV+Qnl5xLMzAdS1s2sAiVzjIx+9HSoRlOTNYQnAn
	5rz8s+9xXL+HhjuJth5AM/DotTk0JJAKV74+rO5ufmdxVJovT2Gk4y+9P8GWeAwCWXSy5QEFnMm
	EPiLXe/gdUfqfeY12bJ0AuVyhFzZT6Jr/8w=
X-Received: by 2002:ac8:5810:0:b0:467:613d:c9bb with SMTP id d75a77b69052e-46a4a8eb7e3mr585821cf.8.1734634679407;
        Thu, 19 Dec 2024 10:57:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzzzhRK/H5Q4ZYWYihAa5ttJ5U9egSrme2IPWXLvYMtQK/O0ViHiGIF3Unj/8RkkxSajfAFQ==
X-Received: by 2002:ac8:5810:0:b0:467:613d:c9bb with SMTP id d75a77b69052e-46a4a8eb7e3mr585581cf.8.1734634678955;
        Thu, 19 Dec 2024 10:57:58 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06f847sm91464366b.202.2024.12.19.10.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 10:57:58 -0800 (PST)
Message-ID: <bb04811b-dcdf-4c95-9999-b1dff7abadd7@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 19:57:55 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] pinctrl: qcom: correct the ngpios entry for QCS615
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
 <20241219-correct_gpio_ranges-v2-3-19af8588dbd0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241219-correct_gpio_ranges-v2-3-19af8588dbd0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V_o5rYJG7ODKZEt3bCLo9ok1aaMKDcJs
X-Proofpoint-ORIG-GUID: V_o5rYJG7ODKZEt3bCLo9ok1aaMKDcJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=857 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190150

On 19.12.2024 8:59 AM, Lijuan Gao wrote:
> Correct the ngpios entry to account for the UFS_RESET pin being exported
> as a GPIO in addition to the real GPIOs, allowing the UFS driver to toggle
> it.
> 
> Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

