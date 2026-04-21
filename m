Return-Path: <linux-gpio+bounces-35306-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCbJAipN52lW6QEAu9opvQ
	(envelope-from <linux-gpio+bounces-35306-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 12:10:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5264395A0
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 12:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F031E303746C
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 10:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641A039FCAC;
	Tue, 21 Apr 2026 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oQinYadd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gg4GoBqE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF3A384238
	for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 10:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776765825; cv=none; b=DTB5xgePxrALut6jwwHNTlgFzqY3qA1qglczJdt1mFdXIrqd5w9CKKWbQML6OlGx+fIwCa0lXo2Gu+bti3mHp5enNM0ErrrXmpQglNSt4owyROuLWnSI4wR8JM30n9bAw0Glb8Ww56GxlSBj6+rq+ZE0YhkHGkS2EXe4fdk4x8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776765825; c=relaxed/simple;
	bh=fUoxY+osAZD3kce95kAP6oBIib9fL/J8fl6XUc8AkO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9sRe/y2o74dM46N/GPQdWagS8dDe2tz+eE+DZN1bkgFBGHG8syYY1UuSYUQ5pcRyk1eWbi4ewUwsUKsht7KzEgcYUDUpuAb2T9oPg/bFKpT/cO0qBeAdDI+kQwmkAhqggosb7eCCtI+f6a2IcPeQI9eDZlgBCR1pFLsl854tOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oQinYadd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gg4GoBqE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9e4no046047
	for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 10:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lsBGUUumBzahguNfhdaERVA35xazIx6Q5OSh6tsxb84=; b=oQinYadd4rkxwUmd
	XWTTOtGmXCjbCAW7OKbU3H6PSL29CVypC3IChafirLUkdzfQuj16GTbgh576GN4/
	w31KHH6WQ+g6nZ5bWUNVpdHGkyfhU/PA2KuRsnh7rc6PnJRkXkqacty04PD+3iXO
	LxRnltAtSWKjQk9JSuu4hXEAHniZMFST0tvtk0pMzqiUaAQwHfWMllHZxyTy8EqO
	esyWMgRA92nHb9YMqqzFVg8TysmucnzA6QVqu3GhsHwNn65q7bj+pCvdhVKh/fKd
	MCCewVw7prLFMBUrTwyEdnnJDb0+IGy3YTlNgz6q16j/79X2i+ubn1dwXkvekwLT
	A7J1DA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp0y1sfau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 10:03:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e5c781193so3271321cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 03:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776765822; x=1777370622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsBGUUumBzahguNfhdaERVA35xazIx6Q5OSh6tsxb84=;
        b=gg4GoBqE9nB1FnO1bY7gXq758ovoI+cOtb1kEfsv6J2NPutym4rxJi5ngxzSJD2diT
         EUogi0vu6NIox7fmjDRC48RlrhhX92ls1jIWgN3b5bCnHqpqsLsa0O25FTaEEdXArnyW
         Djtwk+2lteaVJwLPy5GyqJXiQYiPfTM86lI5ebQyfD/JroIIH+mtXoda9XvBuz8ppSV9
         DNZx1hhP+FeO1PZnP0lETGPPDhL3Tach2fvh9Mz8D8AGZvnxdHIFZ330UZiiKFnMDf3B
         rbbnsh+Ot0sMxZncCEVcUa9rQi0cI4kwPcaN/vhHf7B0mENU8fA+05mNSxLGlzmVohiX
         Lv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776765822; x=1777370622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsBGUUumBzahguNfhdaERVA35xazIx6Q5OSh6tsxb84=;
        b=Al7iT9fLOJUveYfTTXTaPsZzVyITuOxSM+QKtcpR3UrjirTbdoTOs9mA+cBAxZT7O9
         Z4SDMXHlDy5NnjvMAXOYCZr+j7j38zOFckl8SB6+JvbOP4jvtTSOaisJLpedQnprtkwB
         W0zPguqwSKnSjot63TvGRkeZdQz9DsVKQujlRWp8iZ2XkKjh2Pl0Ettk32mWCBbEOEwg
         IxVSylNLBNkTlnlQD5ACCDFCaY8vYp1X1UlkiO0qYyqcXJKU2oOSwqszl1FCFZratG4N
         m3XE6xzj2E9wJ/aucSkAPxF2TQNugmA3nAH6uKkpFzMQ+PKLraMskwAKDfdvcPkR8MZ+
         ZRhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EKL2vldQRs0B04OhpCJZfrS338oUH8kURZo0CRV8ymEu8umuJVeGUpaA/Jg4SJyjoovySe72YvRgr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb0gD6iu2nYAMS06FK8g2gepegwrCii+4/rt/1TcELcy7UEk+5
	o2uNH45myO+rpQAVnppMxgYYH4gr9rqE7LE9Avqwr92y5teRXmF/wRiq9yE+3agJt+OHiPZH51W
	ri7/ScJDbus3rOKDUrZrKemTmAmSBWuUQLkDY0D9QzrRhWiV5ccGc6MgZ4IqZnz+s+7kYDFOo
X-Gm-Gg: AeBDiesjpvK3WVmdVcmw6UIPnkfDa9f+DCTcG9IJlQNlE+LpHZhUDQ5WcJheqAuAHaH
	QiGBwELWJ4/ndn0t3lU2Y/XVtJpx+1v7YUIgFuAFReCy8bAJPzfJb2QW087mYb1rzQRlerjd2q7
	Q3/5DAN9TCrkXGKfGfm+qMDFd6BwGbhNb0GTm8PN2i7ADRcW8UCF2WqRVKp+vaQ+FAf19Z0o/H5
	74e9ih8+JGlfWxdxDnI99fEhXaMNTIPhJICzSQYm2ZNw2DVizl53xhXMB1gsAAZjNZ/uW4HcXUr
	VqYgUbIuFnGC5NsBI40B5lm3E13Tmaz2hgjd+8qHt7bFVQTcsqlweMCYUvgoHhP9w6meVpbnAWz
	Mov0bU7lZNuRD/oP5LdUWIF3mzJVPCeiZH2aHaTXjvlB+nt3NvOCqu6bD/50NNi2kglmtDxIZXZ
	m34OhTZ58Vn91XyQ==
X-Received: by 2002:a05:622a:44c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-50fa53b0cbcmr44662121cf.2.1776765822193;
        Tue, 21 Apr 2026 03:03:42 -0700 (PDT)
X-Received: by 2002:a05:622a:44c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-50fa53b0cbcmr44661851cf.2.1776765821742;
        Tue, 21 Apr 2026 03:03:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e18esm2586174a12.10.2026.04.21.03.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 03:03:40 -0700 (PDT)
Message-ID: <46a322f5-db18-49cb-afb4-ec1a5bf23717@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 12:03:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: extcon: qcom,pm8941-misc: Add PM8921
 compatible
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-2-bcb0857724de@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-mainline-send-v1-sending-v1-2-bcb0857724de@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VNLtWdPX c=1 sm=1 tr=0 ts=69e74b7f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=-ROfvrG1s7MAeRIb7yAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA5OCBTYWx0ZWRfXx7nNDT/6yo30
 FMKSt8V7NKigtCL93JC1KS9L7F95iS+gwZ8ndU+nAOAZaEF3pXfgqi1BK8KY+whwZDG3e4QDSaQ
 HbyEiiZNxz7p8WhSVUXstM1AtxYvptq+JGQ6nLoy+NG0liT3kb8PYh5IZ/Y8QjFZUw2hHZy3Ylg
 8XRiJ0w/cHvlLSJBd2OKR7osOcjEkQiW4eH6vBqis0Dox1Xw20/OGoX3U79HMb4wPyjWHf1bRz+
 vRVd8B+Q0aWHoK4TZdROtbdNVyt4JqfbBPuTHyV1KIzoGAXYHXyM//u6x4IWUba/tnbTK19WBk0
 +aWJ2ydVwvP2ag4yFoNLJiBkvStdO6qlqMrLMbt3L4THXkK+/ropgb7QeYdiV/4vqMQGuHJtEZN
 Zi1S87RvHcAkMZboP4x6CutOOmwQ/ftSJC/ZxNNyjf7AHU6+KJqsdWTOpeq+HXkPqVa4K1NkAnc
 jM671fb4+eLp8tFJqbA==
X-Proofpoint-ORIG-GUID: Yi2-qsw3lsm5jaCvXbfEVlgRmQY9a5fO
X-Proofpoint-GUID: Yi2-qsw3lsm5jaCvXbfEVlgRmQY9a5fO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35306-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alex-min.fr:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E5264395A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 11:45 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> PM8921 exposes USB ID state through the same interrupt-based logic as
> PM8941, so it can use the same Qualcomm PMIC misc extcon binding.
> 
> Unlike PM8941, PM8921 does not need a register resource for this use
> case, so allow qcom,pm8921-misc without requiring reg.

That suggests this block doesn't really exist on the PM8921.. I
can't find any information that would suggest otherwise.

Perhaps what you're looking for is "linux,extcon-usb-gpio" or
"usb-b-connector"?

Konrad

