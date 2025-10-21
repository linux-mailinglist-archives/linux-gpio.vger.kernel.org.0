Return-Path: <linux-gpio+bounces-27377-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1736BF6A6F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 15:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D4F324EC95D
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 13:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E50333437B;
	Tue, 21 Oct 2025 13:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7fzZPoX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40121239E76
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051837; cv=none; b=FX8LvyBI5V9ygCNbjRlYU8MFg6igbbLsrBXH1yGJHIvJF2JhasIAd0XG2uZZUX+LxSzmcunB5HUZoUIan+sOvZ9+G4/G6Ac62C7cYXw0RfDHa97zHmQfiDfAlvqnYr2PNWUOospMl7FuoGG0PUeeoZwDhAd/4qiULzvvbb0R098=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051837; c=relaxed/simple;
	bh=FDyI0ELaP+8G6K2J87c4ou8IZSaFgqHpQeJVkW91Fp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkNW5f7vDxG6ukCu9xWOZzn7mAH39sZ8I2RhIsgjl1yuDXEods8BgG4ztBzgue4WldKoEYayBZdwKvN42apDlt2u0LbJmKCVtU0lC6CovJQ72QRWcLffNNlH8EGiWiKkuXzyBB2u5PorplzhmWMsRgjLhGuhP8ZjNe8YLVSwVYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7fzZPoX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8OgTh031062
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 13:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EDrIqOlDWabTc3vmLbQ0DUei
	ZyiWzCtrffXjD0fQBds=; b=m7fzZPoXJUiRKy7jLR+DFiwS7U+89rFly7j6qaNC
	lb4tBdMK5NlFYgFtlni3rijyRfYScjrcTHuhM6Gb3nWZSFqVXW6cTWd0wbrFOY6B
	gfd/38XNwiIWfiIExxLgt3R8GI0tYsK2mimtozWw4L73c4M+lihPKOdxY6N2Jk5/
	OxNKaav5mGAexhkyjyz7tq2WLubclB134renYtfBKuFY6a3OoohZiArLkG4xiHWI
	dT5jQRyUgulhx8keK2ItyrJaT2T1cmY0Mx8hTAMmpMh5AGSW/7lBHWug5v9r+ct6
	ZUnEB3XKH+Kqg025nkhBvyIoOg6PQXa6keu1zuzhvIjnbg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k8m1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 13:03:54 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-54aa4931402so9927233e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 06:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051832; x=1761656632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDrIqOlDWabTc3vmLbQ0DUeiZyiWzCtrffXjD0fQBds=;
        b=VP24qSRA4lz/PwbMaiI/ngoQ4xwLQ7+yvdpYqXkZUeenqaavPABsy4CRliexMv/kaH
         lmnKfxetruGzLEhxZEBlPdOA2Mn5Dkagu92H8VxtmnHdGJ8VNnsvTS18ffSNA5nMIzcA
         pe5BFxxRIcVloHbWQILPeJUzFy3hXwqg36OKoyYHpdM+xuA/PQ8cp83t3mDIRWkglzob
         YCBiqEjZmtaVdfPVndg1Z30vFgLOcKwCBp8m842ag3KIja7gMIGPobZ/rqqdTw1imFft
         JYaVc4epMmzAMnp46PkqyhMy5Tsq861KGPkCvRXGuT15XoTWBWE+rf6zli3jJNzkoPgm
         86Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUK4C2xFPHaRkqheilHvXrPCCtMjFhaSwFe1tCu/YWmZPhLzdesxKVVEB879mYoWGRpAitCnOhib+Cw@vger.kernel.org
X-Gm-Message-State: AOJu0YyHaAdUHH+pe+F5oUpcn0b5bB0hW56TKQJJfN3QwahduUy5mR4a
	ryvWfN4g4BF+1WW6VsKSM4ZZyIH6ue4Ws8hozda1Uo9zxZn+agi9ZjKAjPIESPs98N/jFfbp4HL
	58Ua6Rm/CSD8dqpAV2Vn0/rIfepYdTtjssf+3opXx8x32tW7QvccfAwkafLnSoJLfgfcRleG14K
	Q=
X-Gm-Gg: ASbGnctbOg7FRc3hGmPCk0cU7w7XEpXuk8FONiTVIkryBYDmQfjdH5QklsV+77evpan
	kfOYtAGcinW7PJpW7DObiuwH9ca1OXGC3n+0RwCDyU6QKEUgNWtboJs+x2IIB5arGvSoDFmgWVm
	vBdoUKjrr6+iZ/YQtZi0flYdydneLI+mtCG9wc2KJGK0MfpNHNxqKmZJmUQsVTZC2LNB5MNTTLK
	ZsyOEwl4kTP7PxhLnOQX0BMa4itH4/0zcAagwgHGwfWF92kM1U7/NPvrknHocfshoV+JM7xtNm2
	ePnoAVoB+LCtXj9ziPjEi1dbqk1AeCLQXLgm7AYlfTS8QzQCk+2nqYBTL6QW0JxYO4wv85hqoGz
	qZjh2bUxVaN1sePBRKkkyXnqu03MPjCM38r051DZXyty3Y+oQX9jA5b9f/Ptd9LbxoQYHZ9w18O
	0qiTZmPIfShvs=
X-Received: by 2002:a05:6122:1346:b0:54c:3fe6:6281 with SMTP id 71dfb90a1353d-5564ee23106mr5038775e0c.6.1761051832346;
        Tue, 21 Oct 2025 06:03:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhkuO0rTjc/ZeeWLixgVS1Ew/7JMs0TEHaib+DIHO5ztf4dvMOXWkt92zh6Povn11NoZSU3w==
X-Received: by 2002:a05:6122:1346:b0:54c:3fe6:6281 with SMTP id 71dfb90a1353d-5564ee23106mr5038728e0c.6.1761051831810;
        Tue, 21 Oct 2025 06:03:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a950cb2bsm29151841fa.27.2025.10.21.06.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 06:03:50 -0700 (PDT)
Date: Tue, 21 Oct 2025 16:03:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
Message-ID: <56vmqgrjy3je7omzirxnfxtuocebbj356iaew5thgkagi35464@hh34y7efssow>
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
 <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
 <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>
 <DDEN5NSLDIHD.C1IELQW0VOG3@linaro.org>
 <zmi5grjg2znxddqzfsdsr35ad5olj3xgwwt6hvkiaynxzm5z33@gsgrdguj563n>
 <DDO0LYS7UTEW.3A9WGTAA5DKVO@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDO0LYS7UTEW.3A9WGTAA5DKVO@linaro.org>
X-Proofpoint-GUID: gy9E-hUPVDsA0ouUXLMc1sV-YMxIZ2Tj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX7o5Lb3eRffSC
 1B7ttTsuCY8wG1Re5vL5Fum3pHMi+2t7PyG6TPp87L0wlH3do9GH85JcaKMd/blGkCkqP5tpcl3
 BrbOyw9TV/zThWqdZsM8pGy7QqXkS8JnvvFK1HfjQ8N/ZzcQmuZ3xSoyObNdusNKMLs7DugQxSH
 DTOoZhGyki3rNlpOym4n+a8njpqR2nCPM16rGX9cegICl4X3EveAIo3s1iED5L4BpV5KXyKvbGz
 YwQad4/dJvHHBsjTWGMch+vqzTCPKQoDcGCypL/petDg3n1rzyBsVc0qxWLjDoH5W/+jIIqRX8N
 vM1Xqyb33zWmh7R5go++kxZEpqrXWovsI/RTRLrGDbzjG2UkKIHQBXb09BbSEESGUcCUo30/Fpj
 5MyQ7xzUkxb9oyTSrgQBarsefuMcQw==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f784ba cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=SizNog2SKWkDgIwviPAA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gy9E-hUPVDsA0ouUXLMc1sV-YMxIZ2Tj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On Tue, Oct 21, 2025 at 01:56:09PM +0100, Alexey Klimov wrote:
> On Fri Oct 17, 2025 at 11:42 PM BST, Bjorn Andersson wrote:
> > On Fri, Oct 10, 2025 at 01:29:38PM +0100, Alexey Klimov wrote:
> >> On Tue Oct 7, 2025 at 1:39 PM BST, Konrad Dybcio wrote:
> >> > On 10/7/25 4:03 AM, Alexey Klimov wrote:
> >> >> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
> >> >> controller device node required for audio subsystem on Qualcomm
> >> >> QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.
> >> >> 
> >> >> While at this, also add description of lpi_i2s2 pins (active state)
> >> >> required for audio playback via HDMI/I2S.
> >> >> 
> >> >> Cc: Srinivas Kandagatla <srini@kernel.org>
> >> >> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >> >> ---
> >> >
> >> > [...]
> >> >
> >> >> +			lpi_i2s2_active: lpi-i2s2-active-state {
> >> >> +				data-pins {
> >> >> +					pins = "gpio12";
> >> >> +					function = "i2s2_data";
> >> >> +					bias-disable;
> >> >> +					drive-strength = <8>;
> >> >> +					output-high;
> >> >
> >> > I.. doubt output-high is what you want?
> >> 
> >> Why? Or is it because of some in-kernel gpiod?
> >> 
> >
> > What does "output-high" mean for a non-gpio function?
> 
> This is not efficient. It will be more useful to go straight to
> the point.

It is efficient. It makes everybody think about it (and ask the same
question in future) instead of just depending on maintainers words.

> This description of pins was taken from Qualcomm downstream code
> and the similar patch was applied (see provided URL in the prev email).

And we all know that downstream can be buggy, incomplete, etc.

> Back to your question -- does it matter here if it is gpio or non-gpio
> function?

It does. The I2S data pin is supposed to be toggled in some way by a
certain IP core. What would it mean if we program output-high? Will the
pin still be toggled (by the function) or stay pulled up (because of the
output being programmed)?

-- 
With best wishes
Dmitry

