Return-Path: <linux-gpio+bounces-23080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A88B001A8
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34B871C883D6
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 12:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63BEE2561C2;
	Thu, 10 Jul 2025 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXEEgYd+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39952505A9
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 12:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150375; cv=none; b=KYxHsjv4s2Z/XvERGXfonnZInxlsPjXdyYlyEllY7WcNC20Zxv3VHVWij/2DnuXQFmv8FNamOmQI7j2jGY90XdutKlRXS6LuIlForKdN50x+g3x5dRsEDDKtPqZvANBnGrEzQeNIYVCXafBCGtG7YXpRSfHl29+NbA7vI7BeJNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150375; c=relaxed/simple;
	bh=at4PJj61Rjxc4Od3ayPh5DnmEL4cEmAZ23qhK0P61rI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dAOjpgEQgexnGMoykiWl0a/ze3woZ+Kob5Taapk5mWBCGoGqcpDU063b5GtSztnd46zg/VbgIAgg0MsXm2Yl3GWcEZ8Sxt5Uf2QS9Yy9fdwvZ/IvFjeCaNwK124aoqSIyjRmXqy8ty4uRA/f4B9ILED4zJwzvsEwKTcIBIFps50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXEEgYd+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9UN9Y013096
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 12:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FbtxCizFqVmxij5XWo+R6iw22/lNiJfKJkPmSZ113lM=; b=NXEEgYd+NswWueGn
	kf2mUE+Mon8YCT33JJSf3IUKY+Olh1LlhK/jbirwF37334gq2xwKoISTazBhDzbc
	2jf0GtiCng+vWYoa+5lP+i+2sNVux0VqjycX6naffBY11yn/U/GiGy80suvXD+Kp
	kUm3VQKes3tTfVGzPTfOozQo0wWqPESkeiof9+y7g7RgSegZ15SJaqUNtBcsCL36
	Jqr6N6nVO1FHS+dxW/12MeWC89YXJ5BlZI5Pcp5OrJZ3HlqEYJRvNnviBAMlHdXa
	HNsmoI/u3yfzKsl5BbUf2XJ3BZ2L2k0zw7zpMEA/ZRmYI0QlGKYLgiQgjIn0lLOc
	1fm1ig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn8e08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 12:26:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a9a8841a85so2257221cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 05:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150372; x=1752755172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FbtxCizFqVmxij5XWo+R6iw22/lNiJfKJkPmSZ113lM=;
        b=XMJ/ufWiIxFlTqLSpYh4ySElRItWKWzSNRdiPQcKC1FoHzrEN2ZJxCNmJ3dn6x/cNE
         MnpjsdU1I7Xi2gWuQKVVzSoON2EqscHRv4hLrwMa46JsCiwCbFhMNl3LoQGbXmLWZxhj
         LFot4RqPsP0NRdqwtCABO39GXTG/l9ZCOo/GkAyKQlykH5wys0H5pote4gjluW9AomoL
         kpyp3+Wr9+4qa7tpr5Aqt/UWFMw4ORshJ51mB7z3D49NDWpps1T6nkdvh0MkNjLSDab3
         z8cjlEKfRqnG6KZJON+BnQ5FWwONiQAmCOyNAKzA8xoJYcP+PjUQobeYBIxJSf00bLL7
         pS0g==
X-Gm-Message-State: AOJu0YwvJ4SVVAqak1AeH09qcbr7cj/UCz+LywTy6v8XnYwOhbfolznk
	W8PVHj/cwaM/OtZXGo0gel8y9TOTSXXXQEJRMgjIaQUGqBroKwLPliNP2ejzyt3wH+e95xUHDpC
	ZFj3iNxovUyKBmS2+b1h3GI+nRBJ5ARYwQlFfdPDYhfk8bvbcfAWuk/KKHdi5NEX2
X-Gm-Gg: ASbGncuE27OEMTXtlRghV+rSKaIqylw6CuNAVBHh14o/vpJUes3FSl6GlYqtApaaBTk
	nzO/nXZaPP4JRw47QEV8UsdUoqy0Vu49Vwa7rv6EdH0zBA7XrojqQDWRNauhyodEA2Gj30Q6+y8
	y0EDM6b0B05FJF8kJhf6zSdRqgsaHO2FRi1fcgUbHs7oBH/oZO6liujiDh30JkbtImLctgjbCoI
	H0ST6L7sbLx7W1nLQugQ4648+fmweTtEjIZm6IgPLGDh2Losta7FvcXPV0Zii+8uStqdzqbG/Ye
	aJxxnxjHCo7IKcoptMtm8sCgMvdNcJsBYEysNs3rvOy3+0MiiSqpqNf0IKLWFeCNfCDTcGfvffg
	KBqs=
X-Received: by 2002:a05:622a:148a:b0:4a4:323a:2d76 with SMTP id d75a77b69052e-4a9decf6af5mr34076971cf.10.1752150371447;
        Thu, 10 Jul 2025 05:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6rD3KBw+n4YbMxLbNBGM2hSLhxtVZ+IZYWVEKjer3BHqjIzVfrtLkflN1y+COvTFzgl5lDA==
X-Received: by 2002:a05:622a:148a:b0:4a4:323a:2d76 with SMTP id d75a77b69052e-4a9decf6af5mr34076541cf.10.1752150370531;
        Thu, 10 Jul 2025 05:26:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c95242e4sm821075a12.26.2025.07.10.05.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:26:09 -0700 (PDT)
Message-ID: <1f0debc7-bde0-404b-a395-dc72ca4c82c2@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:26:07 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] pinctrl: qcom: make the pinmuxing strict
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-12-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-12-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686fb164 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=sOBEMjS50dyNa0exkEgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZKJxtJAEl64MSt7VosP40GWZ5v-tpAVe
X-Proofpoint-ORIG-GUID: ZKJxtJAEl64MSt7VosP40GWZ5v-tpAVe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNiBTYWx0ZWRfX+WUn9Bv9N3Ac
 JMBLhRjLUuk3r2dpwz9Muj1aObJ/Xk0rtXC2jXyRMWTF/vYArple7NyqDr6vcRWL+7Dk3wizkku
 Xkuv009Edu+s82XZuo40wayGhGqMtarv3RH2AETCFVnoNebm9ht1Enz/s3v2sOWifTM6b2Okl+A
 PYgfzopoipei4VoUNWcBtAcshgcESDw+zwXuVQlWMt2oGRI3In9BSCFBVH/pMJCGJUOmMQgA+1o
 jOxKmHYRPcinI6mCz55ocv5lcTvgX4kPGH0mOvfFr4AYX+zQ4QLPk74lxzNFbeY1St5lVnums/n
 SlHLB6qfDZE6a2DOQbwFsg7Xk/z1Gr6O7T+FIEbIA04OIKFFK5adlXybnl0nGI5u9fjhd05+2Ut
 ID7dtZnHje7JR+zkRJIjZE8LOcVvlowEo652whZQEKRLrrbicMOiT6Duo8G7F+iolmkneOGD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=850 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100106

On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The strict flag in struct pinmux_ops disallows the usage of the same pin
> as a GPIO and for another function. Without it, a rouge user-space
> process with enough privileges (or even a buggy driver) can request a
> used pin as GPIO and drive it, potentially confusing devices or even
> crashing the system. Set it globally for all pinctrl-msm users.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

