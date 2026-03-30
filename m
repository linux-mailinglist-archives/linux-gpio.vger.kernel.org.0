Return-Path: <linux-gpio+bounces-34379-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGQJFXwCymns4AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34379-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 06:56:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF21E355690
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 06:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A939D30166D3
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 04:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D293803F0;
	Mon, 30 Mar 2026 04:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inO+f772";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzK767XX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67C623D7CF
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 04:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774846578; cv=none; b=Of1F9S2fmdl/Q2bt3Rv3CTfOhlzXpjId01qwaiOurv3H4X4UUWKEQQttMsWZrCCMhnLm9ok41GvCdMGs3z7p2tMvD8YGr7T8xfx1C8JEEZlDnroBj0cAKEsoVfThvN+DnpNdGg2E3Dbfbeq/jTxxnJNo37hWNsYsILKce7aL3Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774846578; c=relaxed/simple;
	bh=xt4nL01wX2KqbENJVRpe6EAYvo9duFVqMqTp61xxKmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jiDtUJXr3no9WYATJydpLD/SMsTF6o4XIBDjf9wbJrxlVvYJIRLNRN94Q2JgpjgYFNNZ7YVXbRr+qliiJWXM7YPEPTCMIN5WeuY4pmI0dFK8IK4u+EPRWXAZZdQvlkquur2Vtg58+Sg6/dU4ewDCSaXtm6WvMh2xfLdXJKixc8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inO+f772; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NzK767XX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U40RB63931741
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 04:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9t3pLpkMMGLYxzJ3ezf64g/HI5nzm3mmWJG7tU2bnc=; b=inO+f7722dcimJsd
	wbC+BXnBzjfufYRq+3NGwh2+tckSBOQM7q3UlUMKR315VmequwC+Y9T34pu+HFyj
	dH4XxYO0046yCRmgQyPv9Cbdk1WsFz1wR64TwVI3oFZeho2+F0uY+3rrSvmV8/hP
	c74PBp/5QU/lf1+Q4K5qW++p2hqusq7WMi++2k+PlCWhw/4jcQUe9OWhz66cxgEr
	F6F2JDmq/Kx7s/ZrpzV9ScRyeuzffKeWoYB9RzJOTKi18chDiaQPPiuqAn5V6TqL
	6JbX574PfLBk061KDQzRrMzI4zArTuSb7lbhzMYyh/deeoZSKB3YkukMeGG/G9oD
	4Z+0wQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64pdcsap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 04:56:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3594620fe97so14345490a91.1
        for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 21:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774846575; x=1775451375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H9t3pLpkMMGLYxzJ3ezf64g/HI5nzm3mmWJG7tU2bnc=;
        b=NzK767XXpaj34lUgfFP1ZfXQQE76XRuAjNUF/AoxtkayHHwfSzIabNdinqXEidHVVn
         kA+TW7lcCUVPplhSrS9mPJvNrOwUGExofjIGn3ILsxMIJTMVffHuHOMTch3Is4xfj2pL
         SX0UnhodjQe9bbyUO1Tx1gqVeSQw4Cy11rP6aLc1wIGzWjxibD313LG9oz4Hp5B2djW5
         iPccqKlFuTuU3/8KYeCTul88aI5bVP5raX+vstKg+VeBXVL6cqYOEHYEExdE3aJMGa9x
         1rcPB/bn5aAsq0Ifu18yt647+OxzFgowaDwm0UiMOwJFovMF2ZJg+qGKLUYckquINFSR
         ujPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774846575; x=1775451375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9t3pLpkMMGLYxzJ3ezf64g/HI5nzm3mmWJG7tU2bnc=;
        b=ooudj7E71RYV8FMWqf8PVI8+5t70/RRQbK+SDEzIG4Tm2RFzqCNVDumlRWzdmktw43
         ehXUWy5L6JOYbBdOhY7EqHeMyx66khD4qKG2Xc9NUAKD5W2rVN1/TmBEaEvbXVzeXxtC
         dxNzovdqDGxN826s3nlAu4r+YPX6tSDRTIeEKMhF4RuJJ6Sq5Se0M8UU6z5JwfMachLv
         o2yuA+/xEy46kZogOIsuIDeQsJxYjJhA4aeEhwMSHbqDOmdjzWh/E9iMY4eB2dA1Idln
         w7XUmdmOPFtvl8LaRLvCrs4q2eXxJtJ6OyXDTKSrmuDY/e656hIZVfYCIEFYQGCov7YG
         p4Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXPgrUZ+FJel+dC2Q+V0wDmt4sKdQUgfJNlzgbiY3oa9FH5blsk1SuZdI5th9zmjszArAM1vwID01+j@vger.kernel.org
X-Gm-Message-State: AOJu0Yw17KBhX3DsJU92YrS8VqdZ1FqqIEmDds2gwMSkqZXo7uLlh5Y7
	OwGaM5DKyL2PTIz9JikyKaU9sTNNIfW6SY1SUZXI+qRKvm9CpQVwO8xPekCJzIdhcL8uMFo6krg
	eJh6O2xB+eIlHnk53xb19zywPgDYb/BaxoP8k4nUMJfGxc5RXWwp5pDnASVO0Rpoq
X-Gm-Gg: ATEYQzwJ7/qGsqCllC7Lj99v6sERCUWt+y1PZu0Ls+gV/iDkol+WntXRJTESkX8IKtD
	Hgut/55D254HSr62CH5v08A6tCayzXTt3894dUfAoASXRJQqZhmMgZkvGfAU6+pyoJ9BHq3CmJz
	2InvmR57rtPq+jyRVEki/ogTrMT/LekSmqtR2lh7CyoKQ9mBYr7a6ZjZG2p4kIEeUGVBtaZQG9a
	6PgllBuZC02wdFKEuJ3bxooV+pv6UnKlgacOcp2msXFohkWKigWNe9UYYagd4VuAT/HSKSVIUtN
	CMLXdRf9JyfZq6XYd2ruQMLr8t9LwciUPdexBqpbdozq/eWZu4T116Ubv8TFTmvy8agcDXFpZ66
	EYr4b1ZqQ8wz58JlZ7nKE4d9c1U9GmaL2aUbkusrc6+Oi6xc41O3OTeWDKWO52TjtaA==
X-Received: by 2002:a17:90b:558d:b0:35a:329:73d8 with SMTP id 98e67ed59e1d1-35c2ffb03bcmr10608119a91.4.1774846575410;
        Sun, 29 Mar 2026 21:56:15 -0700 (PDT)
X-Received: by 2002:a17:90b:558d:b0:35a:329:73d8 with SMTP id 98e67ed59e1d1-35c2ffb03bcmr10608102a91.4.1774846574965;
        Sun, 29 Mar 2026 21:56:14 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm5755629a91.9.2026.03.29.21.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 21:56:14 -0700 (PDT)
Message-ID: <095ba19f-90c9-4410-9b65-607d29413bb1@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:26:09 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325-ipq5210_tlmm-v3-0-3a4b9bb6b1fc@oss.qualcomm.com>
 <20260325-ipq5210_tlmm-v3-1-3a4b9bb6b1fc@oss.qualcomm.com>
 <20260326-marvellous-premium-grouse-d1d1ad@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260326-marvellous-premium-grouse-d1d1ad@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Y_GmHWHv0FqARQkwr8dML8Dhg2Li-gwe
X-Authority-Analysis: v=2.4 cv=UZpciaSN c=1 sm=1 tr=0 ts=69ca0270 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sbCXkxCAo7F0d2wfUiUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Y_GmHWHv0FqARQkwr8dML8Dhg2Li-gwe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzNSBTYWx0ZWRfX8ys1141SnO5M
 ftVq/LLBqD3HUnIxpQyp79HhUecUQdisCs2wlkqdWcnpFkupHiolzXlngrUyZ9a8QGWZc/XuiTp
 6PKVrYvUmCWObeTx01krBgbZO9+iLhROqwV8yqj5yicZtu9KWCpqVO9Int4hjz2YihzxDR03lr7
 UcRmKqYj9MJOV18MG+yfwoudk6A8GOv7LhUmya6Ov6XzwCUYpj2383WwAwQX2GgKCVY48BxZqrW
 5b/ywDkw85DPpZ/lHSPLCJGPsQhypWT5EK6SoA1DIXCNkfyAhLwsL22B7OoNiqpvTUn7f4U4DP7
 v1eURieRTT0Lg655q/DghDEZrgU89jAkCsQVcSAWVjwXIt6Y6/kNuo+0QjgZbdsgkGrd4cOGFDE
 yKgrQrX78/B54sal26t2SZdRQP+aZ8Py138eeJ2YLA7IT85DimshXeoXvVRWyQ5LUMBOA8UfE2X
 MzXVb1gHMHiL/W/9zgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300035
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34379-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF21E355690
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/26/2026 1:55 PM, Krzysztof Kozlowski wrote:
> On Wed, Mar 25, 2026 at 01:05:15PM +0530, Kathiravan Thirumoorthy wrote:
>> Add device tree bindings for IPQ5210 TLMM block.
>>
>> Signed-off-by: Kathiravan Thirumoorthy<kathiravan.thirumoorthy@oss.qualcomm.com>
> I don't see any differences here and cover letter does not explain that.

Pin control function names are made generic for some of the functions, 
so I thought I should drop it and mentioned it in the cover letter as below.

Changes in v3:
- Grouped the QUP SE pins instead of mentioning by function wise
- Splitted the PWM functions which I messed up in V2
- Audio primary and secondary mclk function names are expanded to avoid the
   confusion
- Dropped the R-b tags due to the above changes

Based on your comment, I understand that since there is no schematic 
changes to the binding, there is no need to drop the tag. So I have 
picked up the tags in V4.

Thanks,

Kathiravan T.


