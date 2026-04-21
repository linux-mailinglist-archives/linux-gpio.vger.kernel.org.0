Return-Path: <linux-gpio+bounces-35311-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBmeG0Rz52ke8AEAu9opvQ
	(envelope-from <linux-gpio+bounces-35311-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 14:53:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDE343AE24
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 14:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F567302A2E0
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 12:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8510382F0A;
	Tue, 21 Apr 2026 12:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGQrkjQW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7ON39xN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9B23B4EA8
	for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 12:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776775978; cv=none; b=YXFdCva3YB5Ihqw6gT6lJoJ8HHvEchMU6MtvcWglTyWNYUhNJbSG2f+XHByHr6/NKqIg19XBDFPidq6/M0HqRQes5e5uVIMcx5DT8JhS+5TTQHi5CE6FsUWXXHsLPPeS8Yxgt32pSeclr/ooXcxuUQSXMmQ+PTBHT3kJFJ/uqWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776775978; c=relaxed/simple;
	bh=HH1NNtZwFd250kpA7uXnvCLzi+RUfrTgM9xUyAAcOSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFLEIl1x9NI43sBYUrMfW1FFZLoJBvoBxdFxkqnCPHWXUR9loxJvK2DjsNVbWSr3O7mvPNaRZfPSbtiCwaw50JMN8Poln7/J9b2zV78pDSaAH8zaNX3jyalxkLc7+TrXcBpb2PdZ6ao6mCNO0uxUYiIu4MS5VkRqMFvXzPElmBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGQrkjQW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7ON39xN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9XNPK3164507
	for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 12:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	irJi8OzHDR6ei5r/Ez62ynMGGPCuv+u/Q8dfmAXThhk=; b=HGQrkjQWlenfTVtX
	pCqIWiiEnA7cZUOjOC9uUwJQmuaKF5Jtgah8UKK007j442R00YN62efkAO80hpY9
	FdZp6fFQ0oRI3bsd36baxehwdOqJqBOvzh9NeNWXzThMhe2pVZFRzTq7DptE+uUi
	aYDD9hVfNbp1UpF5C+zC7IqKlkwxYEAheBbQ4qbeUW6D97wEbT3N1TwuqfVJA821
	l7UhC+3S7eA32E5CyAt/GAEHngk85T57Nlr5T/+bZjO8JEQa5zsyLeEWGcgmypYF
	cqYnpoZ+cv9D3iLcJTEz3QF6PnGnbxS6EMst/V/4/h6gxcGjUKQiC4bc+oIVzHsy
	VTkHVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp6q80mwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 12:52:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eab57f0e8bso37483885a.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 05:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776775974; x=1777380774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=irJi8OzHDR6ei5r/Ez62ynMGGPCuv+u/Q8dfmAXThhk=;
        b=a7ON39xNPmibqz7+JShg/pM991tLK+qV0CAeDxxVp9y8jYJxeH6KId5A7q/BaaEytg
         qaR+jnAFj3BOMNKOVg1tAd1BArICGV9mtFe2ldZ3lWLlrfhIUHDA0W9jeGn4gup8Dg2C
         /6/wDpmyhgupIVEwCpXGNttL7+WGuDBZ/ngjf+O6YOJhp2jhirXFktjkLxAiF94A+WIf
         OJW5Vo9fmWkIRSBCmPXlgFccIG0/7zy5VoJgp2FpWegHJawDlzqBRrd3O4EjKXx9RBST
         X2MF3WXfhPAChc0Chr7f4mcUGZYVBzvMdDMbRQTsyictbwCGkeictp0HQGG7ZHcHVq+E
         dWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776775974; x=1777380774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irJi8OzHDR6ei5r/Ez62ynMGGPCuv+u/Q8dfmAXThhk=;
        b=gHtsCFlXPHMtXxTW/GuTmCk9BppMIrG2e/txdYO1NZtdy4KPiVYTfySr0MJVN0b74C
         dOxdfWYKz9JyG7sWAvyc+ZF5EsFFt52mq4zW+SjyJWUpehmR5Dg837gktk6hsfb83tAJ
         qGwPHY+oA5BuL5ExFYrfh0HpC8prgcbHJ9d2QDDHDLDzvlcVNdZDSP9Q/rJiwKxZIaYw
         1Y9HwO84k1MQewXRait+upCZHXxlVHwHdFbO81lgWl/sLFFGcL5J+E5fwgWXRBhALZjM
         IlViT98ItwWcTLWkPdggCEMalZAYmgGqbI+KmzJR2HdWB0J+RyBXrBdUx++2AM7nlNkj
         1lhA==
X-Forwarded-Encrypted: i=1; AFNElJ9qa0wvsLq21aQGw0cEajG7O3TBQk/71XoFCadm+YXkqRPe2ohSJzOvSK1ns6xlt+vAXgWgCmWdrPZf@vger.kernel.org
X-Gm-Message-State: AOJu0YxpfQHP/Vg0An01aH7JFOHHM5etZdUVw6tnUWt802MnMJAjuvN7
	jPAk5Q5jl4rPa66svoTuw7MZv1N0HhlpZEt/Ijuy5OiMS8IC4GR8Sv+AJYpsECj1yvw8aSy0bCe
	jGQ8LW9l3mT+NzqOTlP7CoaCLP5QWyY6tfMhs2v5wY0b8jPV//1ZvrZbh9ig7PhGJ
X-Gm-Gg: AeBDievMR9tkYF5HzPeqFj8lQwqhMiMGtyHOxnlV3HMb0NOkJFfnjmBTwB0r+R5IgNe
	Lg4tHPWbXtmqUf1kILk3ZZ/kae8YjoMDXeJV90FzPyZIIMZL4UqvkvPjnnG8qyOrGrVblg9iTSI
	vLhvD16mMcV7qsJ72lvyrjtunSFwESjBcpNSYe3/rASdHvX6hmiJLMWT28xnsRT5ZjAtGlrlQQR
	vHyrLS6ldbxNFtR0t8HvmRpGeD1pAD8g7jykMpM5/YVaqzhGBZXjRvT2aYBCdkIrDfaBgl9hJZw
	TRvlpgFBssUY0Wr1KaIjeNOw/Y7Vvbb3rvIN2XwYx2YY/lEMf/Vj5XV/seK40yKHoXS/2eJ7MV1
	SUQoY69+rnwo2jPAgidS+XOGJN8mpZKpo9VIfHvgWKb41NOLF2CnnYPRvteFwtxgDLQEFNAl7g1
	r/6I/Jmis/d84htg==
X-Received: by 2002:ac8:5741:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-50e36c12a00mr165757521cf.3.1776775973950;
        Tue, 21 Apr 2026 05:52:53 -0700 (PDT)
X-Received: by 2002:ac8:5741:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-50e36c12a00mr165757131cf.3.1776775973511;
        Tue, 21 Apr 2026 05:52:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e1bsm444593966b.3.2026.04.21.05.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 05:52:52 -0700 (PDT)
Message-ID: <023375c1-d2ce-472e-8a82-1cb013d31de7@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 14:52:48 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] ARM: dts: qcom: apq8064: Fix USB controller clocks
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
 <20260421-mainline-send-v1-sending-v1-6-bcb0857724de@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-mainline-send-v1-sending-v1-6-bcb0857724de@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEyOCBTYWx0ZWRfX7++rdFXcWL2b
 0Mb70B7vRdBwLA0lm6lkE0XDUaz0KCp9Ufl0nOxc71L+QzCbN1UhpgFIRJH9FQT/nWR7CvZdeYX
 IQjj7e+K+tRwg85g0UD8VxtTzG+2Z8MIAVzxYPKWnfDNGcbC8jVhT4cqgPyuonLJSwUjE/BJVdA
 hsI1Yh2BpcByuLUTlGHvtztOO3wAbUtE1+BmY5xeqcPYlQ/TRHJ1omZoc2PwXlw08A0Nrbt16lP
 mrbEC+HRJysWNl2EK4pjSTnM4j3MZUoJHjtPn1TDp2VAkaZ1BQDrd36Wfazu4mm/kdGWnwm6m/b
 s7DbszwekZCuSI8wYJ0dvCs/erulIGXbMYVvlnZWm9m8GYXa7cDnOs13vwj3lV+IZ+BevZ5vnq3
 ulsliMMOI0VwehODQmGrt+K3C3Aej3f+OhtrxkIazuKYX4Qd4f+biGyzaBG9cBAH/tTYVPlnBTO
 I1Gea789FJBYniMLbzw==
X-Proofpoint-ORIG-GUID: 56JICov5ryDVuRpA58cOPg8VEPq5ORRg
X-Authority-Analysis: v=2.4 cv=eOYjSnp1 c=1 sm=1 tr=0 ts=69e77326 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YCWiAI6G9GZrcvXlVdoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 56JICov5ryDVuRpA58cOPg8VEPq5ORRg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210128
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
	TAGGED_FROM(0.00)[bounces-35311-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_SPAMHAUS_PBL(0.00)[78.88.45.245:received];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[205.220.180.131:received,209.85.222.198:received,100.90.174.1:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0FDE343AE24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 11:45 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> The APQ8064 HS USB controller nodes describe the transceiver clock as
> "core", but the ChipIdea MSM glue expects "core" to be the controller
> fabric clock and "fs" to be the transceiver clock.
> 
> This mismatch can leave the fabric clock disabled while the controller is
> accessed. Some boards may tolerate that if the clock is already enabled
> elsewhere, but it is not a correct description of the hardware.
> 
> Describe the RPM Daytona fabric clock as "core", the AHB clock as
> "iface", and the transceiver clock as "fs" for all APQ8064 HS USB
> controllers. Without this, USB does not probe reliably on Samsung Galaxy
> S4 because the fabric clock remains disabled.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

