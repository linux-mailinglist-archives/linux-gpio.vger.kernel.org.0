Return-Path: <linux-gpio+bounces-35400-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uITyORHd6WmNlwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35400-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 10:49:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8540D44EC37
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 10:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64C8F302BA2E
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 08:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B30E3DEAFD;
	Thu, 23 Apr 2026 08:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYGq6six";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKAJQX96"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBFD34BA5B
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 08:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934153; cv=none; b=TzpuDUpcgjK+jZdPJWrtdm9sdAwx/md9sZ6SN/nFPASdac2t4bPJJjrB960vH/htg6Dstl/gBXJCMJmzll417Pad+6qyK+TxgapPomqncv9nHVXcXokJNi0hR1CeUNLScGzHMnLBs2fBJL0VwF7yi/NGWLxsLjC9t1yJQqVjaOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934153; c=relaxed/simple;
	bh=I2U3XsezvXd9uh4PW749z23HA4VB0PSXUJFwIxMazsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJzeeb7ovkXIXXEVm0p7oXHHijHqhiElK29ONOb+fx8lhSW+8eLwruplYNXvTjXkL4CNhCXhseBcWX5CfNQn1ICDmBsR3juFeoDpjysJTWtKi6BWk4IQ5060QMecDNPNVT7bZx+CRA6B3vL2LZQBkQv5+2N+fcKTnfZ3BamjnQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYGq6six; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKAJQX96; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3ZGuB872657
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 08:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xCzsJFXw3FhVBh4XGBhd3IVV8YIdrDkuxwic5Z5yMJ4=; b=CYGq6sixIIDNpjuZ
	p3P1Rikw6/qpimmfdqrrpVa6s9s3XvC2dGq/UP3YzSP+luAIT2RqTzTdeE68/Mu8
	JSOCy/4JWPJNhFfTP6ruqCWrnW+mGcMAF2/y7CELMPgkPbG8BbcTLWX7Y0mo4pgv
	DH/opIiTzsqcjkbmc9xlOmm24ASqtTUNIRYQnatei1sta+rPr+VuvLgFZvn5R0ja
	K/BPaEVGpzBQLHgxF5wpRZyOZ2HgaovVEoXcMV+6W6sW0Aae4FDwszdT6O1U2gWQ
	BPlXjmVPIguQyYEMhQHKWPddLvfIZGFTSj6ViZ3N1djltatGrDNp2vUwoiuRFpEH
	vdTxnQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh3167-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 08:49:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eab57f0e8bso92970685a.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 01:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776934150; x=1777538950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCzsJFXw3FhVBh4XGBhd3IVV8YIdrDkuxwic5Z5yMJ4=;
        b=VKAJQX96EkvX3Ks+ndazcVp5dlPar0cb83SJK4kx8F6oThMPwrXHXqTntlv51CRj7P
         Ib8P0HOTv7yrdnAxEUqFGD+aBPkjnXVOR2hx1Wj+IuqFQjN33WG/YN0HtKJATY23PtJo
         U/j0oJ39FINNYbbZF8TBSndVRt8b4sSNmZVaKowXvGtYItI8bAgk/WVylxIRs5uIyymm
         +I7P6hnTOhTFMwSL48a7xJLhlxa+Sgku1CfSfgPBSuTIqndEuV04nKIvoCC/RCUHu/af
         b583854TGrSqXO7q+iw/OFoxw39iEaBgQEfECza11wzRaeu+iumu+bpJajEt//qs4M+R
         Wk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776934150; x=1777538950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCzsJFXw3FhVBh4XGBhd3IVV8YIdrDkuxwic5Z5yMJ4=;
        b=ESpFxybuq/RuTCbT1FFtgOb4gYb5ambsr0vuIhD5oo8/ojcw1FOCJyRcUABLJyGuu0
         tJaw84nkix78EUEC/ganQScJABs/c8wO4iXqHd5i/oV+1g46esu81OSvcJiAM5ZsRviK
         p+NBq/jyDIoz8k2C2wY/Ch9YAtUMQjZOI7RWz4XIoKml/Dc/SnGf7YUqxjKwgioPArQW
         feN/MfFpHLU0W0qOH+soR11agk9vysxndVCITxFLOPZD+CV2cjkjK56OvG3oNlIe9OvS
         ycZMxeuG6WYVMbHaRl4NTMWqZe51vZxyGYnksmkzk117y/zaynk1nr6sgINpgGocdyW7
         3+dg==
X-Forwarded-Encrypted: i=1; AFNElJ83La2Nqvtqdr5PihlEDfegdBJD1n/PG+lf9WS+MIRxsWznQtRubugTA4SuMq7PfZEBAPGDRJeXhmic@vger.kernel.org
X-Gm-Message-State: AOJu0YzFeH7SPUi91yptmceWGsvDey2gIuffvb/xzfZ0T92ecUVuioKC
	uAFwRqqFfZMaiQrEfKXrgPHX+Cqgami39Hfpp05H9zKXnYxkXoIOU4Cy9yVrsKHPASJTBFsw5Mi
	dgloK56ryIKJJVqRK5tpf2qiEYTU+U6axRqzeAMAcsFtgxKni0Ji6ycEgKiWsZqS7Q04qOlib
X-Gm-Gg: AeBDietOjALSB3cDC9zUOlmNXZUend+b8jR/6QGHomr8p6jwfD5FKC7CPwH5fQL1zS+
	FN0UTatcpvUKV5/ZDNfDVa0rbPRsVqm9Ii1Yhyr6+g9gWMOQ6mxgsRrMEaD+we7ofqMnI+M0So6
	75xwcEDRr1MQ2XOjzdQwU5LA60Bs0kkwDj/No3Ohw8eDaWTs2tJtBaHdA6JzGT40smsb8h77fro
	mXBIvykCiF/BXN5wwdExSiFYe7gKcm+y3788mcODE+0DKNaRbwdddamSpBs2kHkazrR3/YcGtIh
	ercHxreOPvstyjBcdPHjJ10ujBeQ+4iixRK6/VTnOCL0XXF61uENGmaa+ILfu87JHldQHJrNP9B
	Z792BU6CEbybq9QWLKW2MPxXsl/Suyh1+b9q3aJP7SZPAqibE24cce47HNzCabbGGwu4s9BQY9n
	rFPX4HEcTvCRAWjg==
X-Received: by 2002:a05:620a:29c3:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8e7916ad048mr2263461685a.4.1776934149991;
        Thu, 23 Apr 2026 01:49:09 -0700 (PDT)
X-Received: by 2002:a05:620a:29c3:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8e7916ad048mr2263460285a.4.1776934149558;
        Thu, 23 Apr 2026 01:49:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe836sm4026054a12.3.2026.04.23.01.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 01:49:07 -0700 (PDT)
Message-ID: <caa2c3b1-1ea0-424b-84ac-d50261a06cb2@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 10:49:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] pinctrl: qcom: eliza: Fix QDSS trace
 clock/control pingroup names
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423-misc-eliza-pinctrl-v1-0-2498b365ff2c@pm.me>
 <20260423-misc-eliza-pinctrl-v1-2-2498b365ff2c@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-misc-eliza-pinctrl-v1-2-2498b365ff2c@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA4NCBTYWx0ZWRfX4RwlTs6kSlSo
 wekvcCsEqzrr90MZTGI5LAI8TD9IkVfeOryRnJKlu3IxSPhzXRxtvihH1KL4N6B+3WDqmsiNbov
 nysA1qHFCF4pXFstx0GM909VowdQPwfltNlukpD3xiJKBU0tpd38+bKGSFa5fRX6IMWcExdtSl9
 dP5o0FjADsFDDxJIL/wdsiALY2UBELuYYbIq0FGs0mJkpYHjvlLYRCE02JbEfNknkKrKRceJPrn
 qCsjkXQBiid0PSS+EorfthVuekHpplcUR803tHz5CyCx6jvUa1jFc4uIzJc3f6PZmVIF6DXkWNm
 vjQU4KBwdN1Oi7BGVlFP88RYeDbuusH9UdKyfCOvqjnzgyNP3J6DDRvA+FYY1pqIa488KUjdlwp
 bozvlhkZMUmKFNemBFqKf77jK16idaslBLEiv0KVqMGsoxeox+nnLVce0tU5P2OViShLz46wuJk
 7sj2NagRQjcJa6SXDAA==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69e9dd06 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UWz2gvasjxx2GRne_YkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: L2mHfjjm0hhl6tpPR9nKeQjRcXOEeBAa
X-Proofpoint-ORIG-GUID: L2mHfjjm0hhl6tpPR9nKeQjRcXOEeBAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35400-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8540D44EC37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 6:51 AM, Alexander Koskovich wrote:
> Fix a few typos for these in their respective pingroups, the groups
> already exist they just weren't referenced.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

