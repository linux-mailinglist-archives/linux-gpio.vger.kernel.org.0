Return-Path: <linux-gpio+bounces-36019-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OH/LL5R+GmQsQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36019-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:58:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 131524B9C4E
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E78903027131
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 07:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F89E311C2A;
	Mon,  4 May 2026 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eB7tNgAM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R29SngMI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158793112AD
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881258; cv=none; b=hwAJ4GSgtZNcvnyZ7GQzHsIv9RDscJuQ3JMPVsmWSAjLG24YvBzUPZ2W7YEp+fCLWDDNipktFXcoogujv1MTeB5N1wcClHSx6dP6+yOMcL0q62jsYktHNcJaIv+xXRuCyN9R5siL5yfM3rBPW1iQw3vHe4YQHraKvmqNy8nEtR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881258; c=relaxed/simple;
	bh=T/NTBBFEzaxAlwpKUc6y5t7nXGWmMKdb9NSBix0FWmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ANWtr/fPCZf/IGlEVpkj8GwpWtRPn3k5JfRL9Tkd7pwl2TD7sAyOrcCBtmkidm4SZehTaexFZCW1EXd4SVU34Q5JBiYLA55dtJY1sgzJfZaahHs7n0cwQBTm83rMjGzMpv9aLr2mNJQzK127LirtB0Xwwm1ine+lD1jAb74LMqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eB7tNgAM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R29SngMI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446D77t483524
	for <linux-gpio@vger.kernel.org>; Mon, 4 May 2026 07:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Za4labmzB8LC6ifgc58LLb3FdJ28JeS0v47Vu+6GOvQ=; b=eB7tNgAMC4ra69B/
	OtlZTyQyB7nFDWo+BDSEiD4JS4TctqFKtCMdJtlMRTVKUpbUFlTWBScO4RatFCK0
	tNwn8YdzCOOFthupdnoPRNTy3Mg1rlCXa6X5016QZxI+q1jLwePiWG3ZAR0OQglW
	6Q9vN86xjh1nE3vA4XA2t98QIzKe1i8G6Z0YjRBoB77ifJKoo1DVTB/4XxGGHyBB
	i7N4lb7VJ4+MiBI/D6a/g6NfZPLc9swyooOYmK2n4wT879tHUje+xAHSNeRZPACl
	mEnO5K+CnasulxUpwpG+qjJ27uxADpkRHsBCp8vgAVFswtrQbbUeiA0YceEt7Vkq
	s4lW0Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw87scy1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 07:54:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83536dc3be5so1353580b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881256; x=1778486056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Za4labmzB8LC6ifgc58LLb3FdJ28JeS0v47Vu+6GOvQ=;
        b=R29SngMIf0eRuWbW/MmUPNYc4YbG97dScZQdR6xIj6QsUY1WLA/nl040hCSbTvuVnN
         VEIjidBS5NqW5XHbQgzpppdaTBodh+6oNg2NTuCfXSe+TvchUNwkevtCu41wYQThf2r5
         MloiFCyezG6YWHjNS+wZ/YYCp7lybj4PHedeqDTjLUVqBiX0ZmCH5XTyhhK/HfOr1DF6
         yqwCOHf0UWLnLVT39ynlUjA7xdsn2Hmr8aBH9yWzP0FG5q208VK95y251ailqoe4M+K+
         HbvTUw1Sbq3UlLZnznNiQYIn34w+kLgGjnaZxNSez7XM5UMj+ZiviSymKCLK3gReTJuM
         rUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881256; x=1778486056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Za4labmzB8LC6ifgc58LLb3FdJ28JeS0v47Vu+6GOvQ=;
        b=Nb/Hh2s6c3dFANMrSrhbqPYWZq/O2dchJc8WsPU0NTsoaPFSYWTjY0Kl7Nfsv5/dTU
         ye5S4s/+bIjIM8ka6pw/gQc/j70FN9H4aA1d+Sf7R37XganWRq3OPmFXR4QSN/TrOzgL
         mO4IVAqlOGQMP982AVkg0YBIpjr7T70BGm9+WADs6aH2ToDLEK3qJlzOQUeZeBnbpqzh
         fVikIBokYtktjl849E5v+HfG4fBy4TmI2jTYseK1nIv64ysKYSEb7Lb7J6ZTZkpusX8T
         1M1TExLNhUhBxvKojFTuvG7IMn5/BAcLZ2SrxlvpRMuo9hi3GUQ3bg3X49uGNPvYs0SY
         k2AQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+dH77QUI5qHGuD1q7wDeSRFJy7OM5/JhbOu8OKNtJw81c6mw/W+A4X9X5puCvCJyj8zvsO70pA0FV@vger.kernel.org
X-Gm-Message-State: AOJu0YzZsfgQBrbCIn5lUO/n9GVSFBTsJSBCFkXNQMEL4xCX3/6X0QQO
	IsKkcGq22QZRxxGqyuPAqPQpNUGJbiO12VJkCA4qN7xbGkSrsmMXyLjpw2DZlTAgLFYv8SXnI+G
	I5LCHXj/r/CBNXiO/M9jbOlGeWvq0bcINilasEKaO+eWlkxMRQJJwsJaG96AS5OBY
X-Gm-Gg: AeBDieuZgErTznOeI8bcMLBaFcBY/XMO9WLfQVEtC0ic3xx9OQmtz1X0FIkEiTbsMIk
	S5tnSL+qS4LoANbyZyG3e8Y3C4+k/GJbY/w85I7LVbr+Gkj+05qKgJ8sCF4r7Vb2Dq2hQBIA4/v
	pCllMDA+cDoihKOaxE2G2CmmfOS3QzB9+gqha5z6DH8zWB23eiw/lCghrlG8J5kYtbqmfxA5nrQ
	Zb9ooxu0pF+6dCivK9OKAlrsCLOI8+Cs44YVvUmCZ+GZL9AerCsU39lnboTNOGSuvtFsHJT2f+Z
	ke+5qlmuxzenoTjw3Idd327p81fZHrw8AiEq3GAtl46CUFOkb4ElieCm6uqjb/GuOyJFqaIXQ5r
	UeDwBLJOrl/2DIzfw/4VF0NU/CwiZOWomKqGzLcWmri6mvERZGu55nYTDzwI=
X-Received: by 2002:a05:6a00:300b:b0:837:7e7d:3c8 with SMTP id d2e1a72fcca58-8377e7d0876mr2821347b3a.39.1777881255882;
        Mon, 04 May 2026 00:54:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:300b:b0:837:7e7d:3c8 with SMTP id d2e1a72fcca58-8377e7d0876mr2821322b3a.39.1777881255415;
        Mon, 04 May 2026 00:54:15 -0700 (PDT)
Received: from [192.168.1.143] ([59.96.95.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-837a0578a92sm2350052b3a.57.2026.05.04.00.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:54:14 -0700 (PDT)
Message-ID: <f671a58a-d3c1-434e-8b47-472b89f520ad@oss.qualcomm.com>
Date: Mon, 4 May 2026 13:23:49 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260429-shikra-pinctrl-v1-2-1b4bb2b3a8d6@oss.qualcomm.com>
 <38bb1b79-67da-4a23-a0e8-3c3da77933d7@oss.qualcomm.com>
 <bf1e9880-745e-4c7b-bfde-3c5ac39175fc@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <bf1e9880-745e-4c7b-bfde-3c5ac39175fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L3lBlG12kPnOJOWw3XKhn7_BBXIBVx3F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NCBTYWx0ZWRfXx0vwrN/sIMX1
 yaKLsqBI0LBJmQanOVbMxzlolEXb/jfoyXH6PZzthAbfA3BuUgy48L2oW47/k7LEcVjnDXFlAza
 hcZd6cov4NzgYS58A/kTWnyZ2cjPtln52D7ZnYlxp4rk6jTPe0q4atTuWFLhuGGmsy8RWlKUacP
 BxkLB7rHM2i0O+49NHbt7CFaGnlm466YFasUbOsGLJbiD6ubYCgMmft0+a5tAkHNHx+m9gQy0rs
 91YB8gmDyHftVEq0fB3v7YH6OjLQ0wyC91W/XI3WWLoQQXOwN+RurYGHIR4uepnSvqqIdSYWHdV
 BkceVz+cZbWcskY3aJlEDX3Rs1+hEx0Q0/cH7FngUfTOMlfY/h4wbP0BnX3IoIRfm7HbEs2LFB+
 zdHqQX5f84B9URilDSbbbm15BC5kng==
X-Authority-Analysis: v=2.4 cv=O4IJeh9W c=1 sm=1 tr=0 ts=69f850a8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=d18XUvOkrfNYrh/LwM53Ig==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=v733AJcmkcc0okto1YYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: L3lBlG12kPnOJOWw3XKhn7_BBXIBVx3F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040084
X-Rspamd-Queue-Id: 131524B9C4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36019-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]




On 4/30/2026 4:24 PM, Konrad Dybcio wrote:
> On 4/30/26 6:06 AM, Maulik Shah (mkshah) wrote:
>>
>> On 4/29/2026 6:41 PM, Komal Bajaj wrote:
>>> Add pinctrl driver for TLMM block found in Shikra SoC.
> [...]
>
>
>>> +static const struct msm_gpio_wakeirq_map shikra_mpm_map[] = {
>>> +	{1, 9},    {2, 31},   {5, 49},   {6, 53},   {9, 72},   {10, 10},
>> It would be better to have spacing before/after brackets inline with other pinctrl drivers.
>> {1, 9}, should be { 1, 9 }.
> If that's also something that the generator takes care of, let's fix
> it there too

Sure, we will try to take care of this in the generator to avoid such 
cases going forward.

Thanks
Komal

>
> Konrad


