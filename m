Return-Path: <linux-gpio+bounces-30111-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 092BACF200D
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 06:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7687B30022D3
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 05:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F0632573F;
	Mon,  5 Jan 2026 05:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="My9u6RiT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HDRG0qnu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F76E221290
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 05:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767591294; cv=none; b=pIRfOnCqdyT8f1llUpft8YIIIiZ0WhG1IG82dQnrt/O/NUsRD5kBRcWnVRzxZd+kBCjwM/BClng4Ir0XtAnJu/TWuq9WdmPdfuObyYcsb+LeQ1VfYHVcEHd3YSz+B/quryNFARf4JE+M0ax4Yvhe0siRcPpbUA/ZkBWM7e/triw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767591294; c=relaxed/simple;
	bh=h/bMINANe47A2eVjCwBctDmWgSk4WkscDZc3NzjFQ4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npEdfu7ZiDuXraQkh8vNhZRdEi95BW8YMduO+5Ypsmu4sW+Xc7Tq08Hj0W6cdnstnnUn7gmdJ2z/o0MhXZancwfimK3qCMCTssJZR8xFAEQFRH/fou2wpP/b/64uY/35KLS3Xjr15vc8ICaOyZQiEDfGAn1uBkREUSg40XTkRr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=My9u6RiT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HDRG0qnu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604Ndt6e1210004
	for <linux-gpio@vger.kernel.org>; Mon, 5 Jan 2026 05:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dMFgxGuk3OXQPPDdcrPI1RFSpmbZOWLaGbwvslpiNGc=; b=My9u6RiT4avq4GCI
	EfscY/gVuw6jBcvw5h3c4Fu4ctwHbqf65Q5wdd7sZrhoXemi4in540BZWuz41+xp
	uHs8w1DwNNoX+T/xilTGi64q9VFuC4suphfSAITEzsfnubgDxwyJdb0XUR+7T1DV
	kipq89v0/ZXAXfrbWpAwkVxHAnE02RLmIrF3tVFmMt9FJM7SsQZgajHKfOcYnO14
	Jm9Xa6KmaZrWjYKjW72JU6BgoIN8Em7ZgieZG8RpAdpWzZVl0BhSsW+qMEdHbf2c
	F5J0aeLV9mFej8Q+CyItdKoLD6Gv3jA2AoRokpFCsjiTEJu4HS5n1VTHo85FWNXb
	iWLtCg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bev9hb76f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 05:34:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c37b8dc4fso30358235a91.2
        for <linux-gpio@vger.kernel.org>; Sun, 04 Jan 2026 21:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767591291; x=1768196091; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dMFgxGuk3OXQPPDdcrPI1RFSpmbZOWLaGbwvslpiNGc=;
        b=HDRG0qnuFQDEui3s4ihOt6+y9gJJKMQ9h3rXZHenSVQz29xIrjBmOvgFl1t0HqvyeC
         69Do4WNGLgyNWrKJ7wRI8BPXKEZmKlgZtYGUxd+2+mrERU2RjolJfvr35FPHWuSnDE6s
         7lcH78mnNLmLWn0kClGDiwj4VPML+ELhXgnuTIp6pJzjoHN+mPngcJ50+lwUGJk+uj3i
         K45FF0nhG5M5eNxfNEJZupgwyJntV2C+dg1de+lbIUEf28A5aKvnHpjGR7fZnI+MSLSr
         8ZCeXIfYnaf9odcder6nQC3sJwEHHpyXNxUOeCm94qRjDLB0BqgDwxZedB9cP/CWbdS0
         vnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767591291; x=1768196091;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMFgxGuk3OXQPPDdcrPI1RFSpmbZOWLaGbwvslpiNGc=;
        b=NJQbDFCyB7vs46Kfeq5QLsZf0g+uY0JZ9fsLJ/uw4EI3q+U/9vxcZlrBhTif8zsEJQ
         Eucxfp1vO8WsiA+ENrdDDpd8RSsOAifrEIGfuQC66CxxR6NcEa6DBB9VeL+nXWFeWcid
         YoeSkbAynFatx8s8OvHloFbDFr38WuR6T55DMoDeBfvatRPyn46M3dx24UcgAY9C7coY
         BuSp5NEucBAiN2CIHzi5RJoYOhnvWALbcjCFWDH4ZhJ9TH2L0Cu5hnggV7sqENt4a/r9
         NgxR6SggX14Sl4+vjHYBJebU958N1modyVzzJg9TfL/J18wbsNtrQU1dqGwNPppNPC1E
         HqHA==
X-Forwarded-Encrypted: i=1; AJvYcCXnKXirvd7WVd0hoy6DSrCtZ9BwMJy9lyo03M3lFVgv3Yo064oelxxeps08eHgBeT/HgqORTkClIcuO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfd3LanxXQs65Pab0+2smtQGssFkVmkWKUxKyLQCeajjcAN4z/
	PTu3LZlhb22sfSnlkvzcxe76esTZ8LggxwGlp7ddyygEBJXsim55aZk3GV5ROVNwqqEQXFT8VFW
	sb3T8vRbYDc7qop0Mmr8aRqxZ+YAF2BQZVhBiu306DxWluHNEH+bPoAIE0sRtVBgy
X-Gm-Gg: AY/fxX45KJUrNo40Lj6dVTi7HnqxuI3aobnb4HRlmw9i95y3aQel0J6QK+UUieGiNmn
	Go81nIPTgyNmfkbQ2AxiOD+PF9hiXHoQKgair/Q+qjaxrtty1MSgaHhTHgnxHEm1t25vDbdwD/9
	wXHfAYdCetQBTx9g8pDdNfAXBcb+LXKSuov0XIYWn9NIlZogPv8CHbBMXjt2tEPuY+0QKdY6vJH
	Ex8vjSzNRGkyJ9VP3UCX8rFnx3kcAHd0C+gVXSa8r4wlCG5v+ZUHcql364tTKkU3vKhfcFh7p+1
	9nfAuhjFrZgZYR8SIj8eNYjj/yFWrBqkAN0K/qVl2OQOLvY8I3KbkANYcGZtksTvD8ItHSZWah4
	v9mw9B/Jbqf1nfXWJRZIdblpUHw==
X-Received: by 2002:a05:6a20:728a:b0:35e:6c3:c8d6 with SMTP id adf61e73a8af0-376aa4fc3d3mr48020015637.41.1767591291456;
        Sun, 04 Jan 2026 21:34:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4r7405ufilSptQ8ZTQNZbtPYY6oZhiB+G/cr3WOZUB8IrbNzA20MNS/Dvw7xmIVuWKCyEQQ==
X-Received: by 2002:a05:6a20:728a:b0:35e:6c3:c8d6 with SMTP id adf61e73a8af0-376aa4fc3d3mr48019984637.41.1767591290834;
        Sun, 04 Jan 2026 21:34:50 -0800 (PST)
Received: from work ([120.56.194.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961b4d0sm39889121a12.5.2026.01.04.21.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 21:34:50 -0800 (PST)
Date: Mon, 5 Jan 2026 11:04:44 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: glymur: Add Mahua TLMM support
Message-ID: <dayj662qu7tb3l2fuq4sfdxunvkk2rt777vm7dfvdazbwiwpzn@mysrwdbdptqt>
References: <20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com>
 <20260102-pinctrl-qcom-mahua-tlmm-v1-2-0edd71af08b2@oss.qualcomm.com>
 <91d2e5f7-7d93-4909-9ed2-6b19abf0b448@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91d2e5f7-7d93-4909-9ed2-6b19abf0b448@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA0OSBTYWx0ZWRfX1srDeUPNxdgz
 Xko1jHxQ22ZzDQP8tu9oo6h2lOf7U+7lWGcx7fo1XVwDjOetSEGQP8edh+FEm8QS783GC34CDLu
 +TkljDhwpp4IaP5uY5K+k6mwJhFFDPvd73O91aJgnxkX1s532QpH3AvegDs41luk3ms6CbrQmgM
 TRi0s37Vtho5R2of0nsFMCtCmJtWGH+MQUwPcv2qEE5Uy+dpQin2CjZa7Wm/c7PeWGek1dFKX64
 PzqnEjjJ2Aa07775zSxgvbvAW1FwTem2oy5uw2c8TXNE1MDphJBAbP332NvpLWpebWlaHYuAcXm
 /NgVfojUSjk3LBQyxJ7AEmfw/r7lp7PwipsBBaKHs5Divra1m89CFP/xMlYGgll9QkV9nV2AYTo
 zGY4qRBhToJRMoJor9WZNAtt1/EcJjpNlL4vvtQ+6e9+55w4+AHoEdUHEU7h3BLwEWaI2KauqZC
 pkvx30Xr6xkItMGxybA==
X-Proofpoint-GUID: gnZy2RA8iRFnj8Y6ll5arOMXQOB6JSMY
X-Authority-Analysis: v=2.4 cv=RrbI7SmK c=1 sm=1 tr=0 ts=695b4d7c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=3dEILRYKsVIWdVk4w2Qziw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=H7rYz9wmTQShlFnk6OkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: gnZy2RA8iRFnj8Y6ll5arOMXQOB6JSMY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050049

On Fri, Jan 02, 2026 at 01:40:22PM +0100, Konrad Dybcio wrote:
> On 1/2/26 12:07 PM, Gopikrishna Garmidi wrote:
> > Introduce support for the Mahua TLMM (Top Level Mode Multiplexer)
> > in the pinctrl-glymur driver. Mahua shares the same pin configuration
> > as Glymur but requires a different PDC wake IRQ mapping.
> > 
> > Changes include:
> > - Add mahua_pdc_map[] with Mahua-specific GPIO to PDC IRQ mappings
> > - Define mahua_tlmm msm_pinctrl_soc_data structure
> > - Update device match table to include "qcom,mahua-tlmm" compatible
> > - Modify probe function to use of_device_get_match_data() for dynamic
> >   SoC-specific data selection
> > 
> > Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> > ---
> >  drivers/pinctrl/qcom/pinctrl-glymur.c | 43 ++++++++++++++++++++++++++++++++---
> >  1 file changed, 40 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
> > index 335005084b6b..bf56a064d09c 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-glymur.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
> > @@ -1729,6 +1729,25 @@ static const struct msm_gpio_wakeirq_map glymur_pdc_map[] = {
> >  	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
> >  };
> >  
> > +static const struct msm_gpio_wakeirq_map mahua_pdc_map[] = {
> > +	{ 0, 116 },   { 2, 114 },   { 3, 115 },	  { 4, 175 },	{ 5, 176 },
> > +	{ 7, 111 },   { 11, 129 },  { 13, 130 },  { 15, 112 },	{ 19, 113 },
> > +	{ 23, 187 },  { 27, 188 },  { 28, 121 },  { 29, 122 },	{ 30, 136 },
> > +	{ 31, 203 },  { 32, 189 },  { 34, 174 },  { 35, 190 },	{ 36, 191 },
> > +	{ 39, 124 },  { 43, 192 },  { 47, 193 },  { 51, 123 },	{ 53, 133 },
> > +	{ 55, 125 },  { 59, 131 },  { 64, 134 },  { 65, 150 },	{ 66, 186 },
> > +	{ 67, 132 },  { 68, 195 },  { 71, 135 },  { 75, 196 },	{ 79, 197 },
> > +	{ 83, 198 },  { 84, 181 },  { 85, 199 },  { 87, 200 },	{ 91, 201 },
> > +	{ 92, 182 },  { 93, 183 },  { 94, 184 },  { 95, 185 },	{ 98, 202 },
> > +	{ 105, 157 }, { 113, 128 }, { 121, 117 }, { 123, 118 }, { 125, 119 },
> > +	{ 129, 120 }, { 131, 126 }, { 132, 160 }, { 133, 194 }, { 134, 127 },
> > +	{ 141, 137 }, { 144, 138 }, { 145, 139 }, { 147, 140 }, { 148, 141 },
> > +	{ 150, 146 }, { 151, 147 }, { 153, 148 }, { 154, 144 }, { 155, 159 },
> > +	{ 156, 149 }, { 157, 151 }, { 163, 142 }, { 172, 143 }, { 181, 145 },
> > +	{ 193, 161 }, { 196, 152 }, { 203, 177 }, { 208, 178 }, { 215, 162 },
> > +	{ 217, 153 }, { 220, 154 }, { 221, 155 }, { 228, 179 }, { 230, 180 },
> > +	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
> 
> Over the "common" base, Glymur has GPIO143 (PCIE3a_RST) and Mahua has GPIO155
> (PCIE3b_RST). Both SoCs GPIO maps seem to contain both, but Mahua has a _unused
> suffix for the missing 143, which makes sense given the bus isn't bifurcated
> there.
> 
> The _RST (PERST#) pin is driven by the SoC so I don't think it's useful to
> have it as a wakeup source, unless someone decides to connect something that's
> not PCIe to it (+Mani)
> 

PERST# by definition is an optional reset line, but on most of the *recent*
designs, OEMs always connect it to PERST# line. So practically, I don't think it
make sense to mark this GPIO as a wakeup source.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

