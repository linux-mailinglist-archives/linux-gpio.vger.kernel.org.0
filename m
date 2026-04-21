Return-Path: <linux-gpio+bounces-35312-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKMoNiR052lc9AEAu9opvQ
	(envelope-from <linux-gpio+bounces-35312-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 14:57:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ED143AF5E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 14:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C33DC3025A7F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 12:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F323D5677;
	Tue, 21 Apr 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLNVAWjZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDakIPHC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EEF3BC667
	for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 12:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776192; cv=none; b=n37i+bQChLFMkDwIxrxgnb5pkAmrcwEIR3qS/8AjKboKHx9f3tdGLGz1WLZgRtGfBXZQMDJ9eyqmvj9kqI5fqPu6i42O8+7zDt8OeUeCQu3552irKkhwnUcaE4mhdW8GzeEi7nD5N7z6F/ATUYVkP+0EYSoNt5RGQUK2wotf9PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776192; c=relaxed/simple;
	bh=fZxcstZOtHZken6KyX6sF1sb4GT7D1BHeIJ10cAP5OE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSVhmlMZc0EpBZuBqcvpPzmfg2Roziyj8SQCDvRRoQCs3v0uiAYjWxdLysYVT2SAcO0QEpcA9Fm0u/0Ozvgz3gy6frjqzBbc6L5Zn/JT0VVrrnNgvzC+Yo0UxcAOLkmDMWvgAu/KTtCxzZla2PUHVt88/06/xFJxdMqwom3otok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLNVAWjZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDakIPHC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LBs3JE3257310
	for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 12:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iIpjnj4qJhyWrwLOyoN8jJDUuolI9DeQZdXqiYE21WM=; b=JLNVAWjZJAjaSa8B
	7Sc2N9yzIKI/ZHt2xq4TGTGQGkrE3wIIoR0cu262e32Y5o14hRemLW0Jpdyjr3Rs
	JZkr0gl1yvIUQC1/a6W1iL2mJPeExY1TeSqK6hhg7iNwgDo+aYmvVy+ERUqRIFqz
	pHHPWdvS0a9NwczufXWIjVKPgPFqp6ECU6HD/QVrx/g/HT5OY81eg8Ys7nXABEcq
	/dNwFptXf2XA/uhTr5AC8y3enVXKL7up28Bcn8g24owH6fijvTC5BYFndTF56NiJ
	CoMz1gUaNqkKNkr083PTv2EgC2B50/Z4LFWQWVMVmzS/0A3ZRd4i9E12EjQaLlzN
	0/D4rA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp3na9dxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 12:56:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5c781193so3663541cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776776189; x=1777380989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iIpjnj4qJhyWrwLOyoN8jJDUuolI9DeQZdXqiYE21WM=;
        b=CDakIPHCDz8M95HHeILYTLAn+CtJbMCMFBG0opAsR+kwdgwHZftA/BnHv7e3aWsBSp
         na7YxeEXBgmyi8aLo0FC8274hiv2Z8A6KSFOGwmpwNkUFNiD9fx4xoMMOg4Dp8t5cg/s
         Ug4W5rzKjptqA6fXpGxAO9EJYepZ6ST7nBiHIrCC0BLTpcjA6u+GO/mUWdc+Pb9mjLNf
         iDwcWY+v3R/8TySBtOWmoJHUfNRw/tlRHhifAw68Ovgakg2GsZg1WqDf9039mjswN9Wm
         v3784+ADrOK5weYOzRgSgTydJZWs8UtDDD3uSjpyrd2Fc5j4IVZvPOF7xcpocPb/mIRI
         5GQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776776189; x=1777380989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIpjnj4qJhyWrwLOyoN8jJDUuolI9DeQZdXqiYE21WM=;
        b=RHUJRiASNSI1hxzackwpnE4MmgU3Gsb3lcqBsidiE2att/6I3AcCNGgwRK4Auaou24
         bMulebXioL27WYKAPLgtIDFpBRUYA34MpTHA8Xstbc7HOzNG1M3tPOBoHRPvS875XBNA
         c7F3xP85bD7BP0GaoKrghCBMXuGA1VFTBQu+S9nGjKnf0kPaKzal4FwoxxWcyjD0Yeha
         K+02HrSsRfTT+9gkb+pD6PHoIi7O7g6LKkDvxBSrvBmEQ+lQ78lAww3gMiaPx6XlTLBY
         5ZcgFuKY9B5mUzZNUjETcERx3/t4XMXtWuKSglciR8BEr94N0DfCAeOH0A+kNQUlgmEk
         eCFA==
X-Forwarded-Encrypted: i=1; AFNElJ+q+Vfz47FUoD0/v7bzS4FsVAjgQUutsu7qH7uCaTKnJOR7XGcs6MlXKwoxan/D6ngzfaku+OH5tbpo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx7eCvZOCOIeAgogpqgHSMSbEE1VIlQxUyORJoQ4TA2cKSI96D
	AJ5naDGEg4oARCm//QKzx/2mqowQTaPTpYGFPHfOwmzjUcbRwny8d+eEb/G1hGvp42H0QbHLBt1
	xGRhBJz21n0uTfUG8oFgiUicZi5hnobsGXzxTZjHy2ApQJK7UblCDlGxGgzdvLaqZ
X-Gm-Gg: AeBDieslwauTJMyPqwe8/iMIFfisbTwkdEuk4ueLyM2qU33xrBIXJlRE+tZTCs6Nfyk
	vbwbnjDmbh+2Coh2rNRM/2Foa/I+h7Rf2bvg2PoWjQaiNBD8bpCuDdeCJQ3V45vs3JBix44TwHU
	uA5uFFk52xsFe+fapukleKZ3iGOiFEfappqP3ivwq4iurvW+FRRoZ47nYQ+p9UCPXHvvSjUQvNO
	NXDyQ32CrPPkm2j/1yvY7sVtXp1jMkpaFpYjElGMGR+PaeY4Co7auAUANpfA+RSMJJsUQ7s8Qth
	j9OKI6QgUgHkP2XOeFuA1lFKOiCpwzFlafJ/PhDuXxe9UdNhk+6xWeIZByGgDvHxXO23xWEla4q
	fF74amtyflhqtHWdlQx5NY6hBy1fwuzBF7wnKpWFDjtpOr3+qV9fCsLBxhf15BRxmxUQOIJMq0G
	qe6gaFVlA7Zjop0A==
X-Received: by 2002:a05:622a:5c9:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-50e5cc12306mr85384041cf.7.1776776189475;
        Tue, 21 Apr 2026 05:56:29 -0700 (PDT)
X-Received: by 2002:a05:622a:5c9:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-50e5cc12306mr85383581cf.7.1776776188975;
        Tue, 21 Apr 2026 05:56:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e18esm2692261a12.10.2026.04.21.05.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 05:56:28 -0700 (PDT)
Message-ID: <cdaf1f7d-72d1-4481-aa3f-4b15990cf6a6@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 14:56:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: eliza: Split up some QUP pin groups
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me>
 <20260420-fix-eliza-pinctrl-v2-2-b68329fd6701@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-fix-eliza-pinctrl-v2-2-b68329fd6701@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yKOe0wJKcjzpkvN3wx7Jdx6Iq58b35TZ
X-Proofpoint-ORIG-GUID: yKOe0wJKcjzpkvN3wx7Jdx6Iq58b35TZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEyOSBTYWx0ZWRfX7u/A/O+OpK+M
 rDarb/xJrg3SjcP+8rQkmnskfKHarWQj/9uI8uLFv+qG286JPxXI9TfxyIj4+vh05uLBEqVWsHy
 JW4R8MG8FUyGpIZmbxPfz7EKGHDAl8cU13GH8LSHWlp52483t1FaaZYHgVq7jTOc2wajbecPEG4
 y946WcKYsUX0SjKOOphZNQGdqlcGhFSUCuOHiqeodhh9NUSqezjmweAT/hyNlLXvzOQhkQsgWUV
 2Jz75YvJlMfW7pThJ7X2qHJy0jAyOtRgjGjfLXPOVBrtP2W9k/eVA/y/9xDKiqjktf+V3HjMTfq
 xdS7CjpW0t1HEblopDGWlr5AejLimD8Zldknkx2A4CAIAVdBEOLcFsOpG3714XPX9LEsJN1Enl+
 bvFQp/5akw+2NaIkUAH1sP4F4pHrJGkGrqYCTvXqIpN17Nv9ycYQ0OYHpnrPLCwr+GQd3WM4QnV
 YZTWRP33wtPRi2J1n3A==
X-Authority-Analysis: v=2.4 cv=O9cJeh9W c=1 sm=1 tr=0 ts=69e773fe cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=sxPfDhhxBCIg7INJgBsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210129
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35312-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0ED143AF5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 4:28 PM, Alexander Koskovich wrote:
> Multiple QUPs have lanes that can be routed to one of two GPIOs and
> collapsing them prevents devicetrees from requesting specific routing.
> 
> For example, a board that wires an I2C SCL line to one of two GPIOs
> cannot request that specific pin with the groups collapsed.
> 
> This change splits them up so devicetrees can request the configuration
> they need.

Please massage the commit message so that it highlights that the issue
is that there are multiple functions defined for a given pin, sharing
the same name

Konrad

