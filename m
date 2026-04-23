Return-Path: <linux-gpio+bounces-35411-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFf/CcIE6mk/rQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35411-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 13:38:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F17C45161E
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 13:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75DF13013EDD
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 11:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331D43E120E;
	Thu, 23 Apr 2026 11:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GHs3n6wd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SeaEV58g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF70A30E857
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 11:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776944315; cv=none; b=u3JiqRhPP+NrWymWich6GWVMqsLV0hNkneqcKYsriWpIEFpPLv2+G0QNjNV4CvhyqulfPRHKk8wIaMeoaXSOqlkCq6zGWqNoFgPqu5DCmJXR7k7AjsnkCpPp+Xw2A3ItqwTThzR33XomtmYF5SJuey1HTZ1523TRvWdvyUVmgSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776944315; c=relaxed/simple;
	bh=undU5ih4MIuTl4e9WKfe0G3pArV13QYpE8IzdILfAyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EIkUnFe8k6ds3BWSfDb3tANE4O1nXPWYy4Yk05Zy596IUhDgAmVl5UNEI+IHs+e6gD7+EJK4LjvAY+TImzwe4dyRAF5yLD1ETu0OHEZ+Mw6GSyHOODnY1XhgtllmyMLzN4H1c7RuCgq1IZY0dWOVTvWbWkNYYBrKctp1bNKV8u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GHs3n6wd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SeaEV58g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uDQ53295045
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 11:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K15ngV/p/eqMid1ghVunDxNCcZpY1i2oHUp2kxe3GZg=; b=GHs3n6wdjXDRK8GM
	5N3ypL7EOSzVhLC76gBkfgDyM+YNw/5BcQiHvlaCjpI/6Bu9R2aIQ1NnwCd0rA1S
	tpCI7A0yLVNGvBBHPc6s+FD2YHKhS9ABQxAiIRVfjHOx3Au1ACoIJ9HS/kylgCiq
	ylzKocunFuCti7XkXtGx02COWzTYtdBvnxq0M1JAz9fpat+MGRXdIBoA4tauIzrA
	HRaXiCJ7dXwuTTSB2Eqx4Fke1xRoRUNq+12S8H7EiVTXHgNjLp37TFAtrZHOqkjo
	o9vpJ/pSz71GWoWQhqwtwgMQWhWG6QLNw89AHlq3t9lxiIkgI4WKmdVus8+/TkPV
	iee00w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq282uhfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 11:38:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a016b99579so23990106d6.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 04:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776944312; x=1777549112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K15ngV/p/eqMid1ghVunDxNCcZpY1i2oHUp2kxe3GZg=;
        b=SeaEV58gwLKFjJxgjKKxFdvb72nCKJsX9UXDwWVWweu2/Rs512Q0NNwbKWwN3vu0p5
         h6STM+Uh360puuY9oGsIDJJ6Gn3qd9jT5I+H8Lmr/uYCXmU277HEft0h5E4kyKQM/3xr
         75u/yr5iGgmmBnAjtsy3LfNvxCz0T7aAljbjUCO+XNYBO0e5lAy8wR9EN43j1gZzIZHC
         9CMZrjGH+nnSHMP1KDXczNfHhqPvMuVzIDj0vkm6YdFy86P653Bkb1wAOjAcP6/3J5+d
         IiZevh6hI4sisWtu62oYTYNoBFQ9m3xt27HNVplmXERUmqtPHsnEUjXUo9YnFdbxznTA
         OScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776944312; x=1777549112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K15ngV/p/eqMid1ghVunDxNCcZpY1i2oHUp2kxe3GZg=;
        b=XqC3LzG8CX6okahkdM20xWLTTtxQQW+qW3ojvCzyfu6fEfjN73R+dW/ytRN3h6JbPQ
         990AmDJjTfzEMNXhAJK298VhZm/ShpwzS2KYu6/wBbPmWsw1PLuUokGrLRdG/7Ls1VE3
         clXcrR31bzliliqDa7mejgCSjrLrvbO3skh8Fcq7mki0atzG4Uz9vsVeYrKMpAvHEIdh
         7dD0+0UWXEGripziU6wnHptIU0EwbRBSo1Oh8Gz3S6ELdlWhS4t3jlKgJ27ULLlzYzMF
         6N2KRGzEz69a3GxG9V4iqyoy2iLDLN/jmfamomLfz02l5bhC88uCoo+MKMfy1L6HTnyl
         V7Ag==
X-Forwarded-Encrypted: i=1; AFNElJ9/kShf8XCxHE2puWSGcc7/et1LI74wvOUMmDGlaZ9dJmBs56J/nwTJHfnC9VUzpZHza1zzP8b5frAb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkg8FVlUQXkPZiP10fgn3nOZdvzmkNJ7DscjrnGvJxqEdNTkDf
	TLzwGhn0sfeo2pINpOob+ssgKYU1qQZN92/DK70jQzQNq0HxJstojXP8F9FzPxzS+kEx5Y9RW6p
	jCtHOjRkUJ7nqFlF73uPmLk0NNlhTVpm0U+7Bx8/LskE6bpEgXTdzJYgRZID0bM7gakNF1gHS
X-Gm-Gg: AeBDiesbWvNpNKdKvgAz8WF1PH81Etz0xZA0hsS6z4cAbObj9ur3L1J0vrYdutivXMx
	PgIpE2HodojLLt9nnl8vedl+u8qM9kRKGrIViwi24tMBookKDSQhrsGa9iuZj5kmnACqIu2c14S
	UbQ2mwLziTvfKllKfndVrKPY0zGhhmejDdgmMW93OYg6JpEXmOIQ0CLBB6GBRdNSsgSdtOCSjFD
	Fd8vq/gAH5Y1RUFPDSe8qWFnGPE/IKzehmzZPDai+lPFuLEZYFwCjxO/mtbLrtYKzvCjBXNtBFF
	+G9ijkN+xuDCe9/INlvdSEIMU9vHvz33d3rlpgB6bj2LYUYJxEfg/RwGOdyAh9G2/NjymddtK0i
	YQVbFLJc5wXGYR6qn9Y7/j7v0Jopz0/e5bd6Gi5IPTJVrreJuWzIr/9JfBQlQrvkeCadjJlONTs
	Jxza9r/AVupQaWmQ==
X-Received: by 2002:a05:6214:2606:b0:89a:4741:2147 with SMTP id 6a1803df08f44-8b0281c69ffmr283806006d6.8.1776944312087;
        Thu, 23 Apr 2026 04:38:32 -0700 (PDT)
X-Received: by 2002:a05:6214:2606:b0:89a:4741:2147 with SMTP id 6a1803df08f44-8b0281c69ffmr283805746d6.8.1776944311708;
        Thu, 23 Apr 2026 04:38:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba53297b1acsm577341066b.53.2026.04.23.04.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:38:30 -0700 (PDT)
Message-ID: <2424e049-f9e2-49e2-a94d-dc009f8c9fa0@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:38:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Fix GPIO to PDC wake irq map for qcs615
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260423-qcs615_gpio-v1-1-f2d5a31ea3e1@oss.qualcomm.com>
 <z5bkivkfvr642qpjujpqzwpozpqeqhs3vsqcpjfbkgipr7csko@fs4hal7fvqnl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <z5bkivkfvr642qpjujpqzwpozpqeqhs3vsqcpjfbkgipr7csko@fs4hal7fvqnl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExNSBTYWx0ZWRfXzPkY+S+QJKST
 y3gN69lTmWJUZD0AyVwrnmmw+qej9P1XgxmP+foElKL9hOFp1vb7Lm1BBFDarmf+fbLvXqiFPFe
 kiC/r6hoHI5jmfa6uWQA/phYYExlMuON0a0U8GuShGeMZUzwYWZ17kmQeTImwSO6wric5qIt2Jc
 4nR2lAGDwZdituIhf6gEN1JzOUH7zz7iLkCzEFy617k3pY0/WwtWoJYgiXZ6hg0rDE8icjduc0D
 f3vz/vmPPz6lbA0+hqEcSo9qICc9Ia33MC3YXFLZKpvyBVOqjhfDuk1X71y+sund1/duIDF5OED
 KncRwv3z93dx/FJ/ou3l64Jyp7/0ZZ53BDGqVBE7Fr9OZlL8Fviu4izm7tbiN+a58PfGSCUqiEr
 IxIflb9vzDtzHyCBujGRCr27O+WutpgbmGi+OrqKrXMQmsWEPWwK4U3hpV70lGSHk/m76GE9AQT
 KJHnzgRblj2WcMBUAmQ==
X-Authority-Analysis: v=2.4 cv=Zond7d7G c=1 sm=1 tr=0 ts=69ea04b9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HsTIzs3zK7ntyYVOL3sA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Aqf-25e725tzppgOea045hoEo0w6Md8H
X-Proofpoint-ORIG-GUID: Aqf-25e725tzppgOea045hoEo0w6Md8H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230115
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35411-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F17C45161E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 1:30 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 23, 2026 at 04:55:24PM +0530, Navya Malempati wrote:
>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>
>> PDC interrupts 122-125 were meant for ibi_i3c wakeup but qcs615 do not
> 
> Is this something which changed between SM6150 and QCS615?
> 
>> support i3c. GPIOs 39,51,88 and 89 are also connected to different PDC
>> pin to support non-ibi wakeup. Update the wakeirq map to reflect same.
> 
> Should there be two commits instead of one?

My reading of that commit message is "these PDC interrupts, to which
the later-mentioned GPIOs were assigned, were originally intended to
be used for I3C IBI wakeups, but these GPIOs also have an alternate
function, available through a different PDC port"

i.e. 4 pins, same issue

Konrad

