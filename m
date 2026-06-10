Return-Path: <linux-gpio+bounces-38214-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CrB+Lc4CKWo5OwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38214-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 08:23:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B52C66631E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 08:23:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JJ2nS2wn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="f57F/sDo";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38214-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38214-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC4543014653
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 06:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B02233689B;
	Wed, 10 Jun 2026 06:16:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427192D47FF
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 06:16:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072210; cv=none; b=czkmhnzuthdIF6geJOV6EPvidCDDFz7rTE9eIxenAs6e6MhXlPW1+Bzm1v7zWg6BnLqPzXzO1UUR/AOgOFfN9n6XQr98QfWa8sPdGXBgNmwq2Z1oBLjeUx+zURGzbGJMM5tIjg9vMhlmDKhTd3yzV0EtM3OmZsc0R0J/rc46yjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072210; c=relaxed/simple;
	bh=eRdB9IcExeSuHVeD4iZ6KuqU/GRLMfDP/J7Iq/x5/Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1G/scfX/qeP+YV75VpQAF7xsTvyjw9z1aq/vmp3a7mcj2fHIDzTiWRi2GrG7Bffieh3Fo7cQ2d0nGY1/TsoCB7MRwJhiGf1MI1QjlD5YaMHFgbYvJzrNXnckzqCm1zwLH+as68AiWmpWoEJZ1JwzGinG/qegd9kkshFH40KKpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJ2nS2wn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f57F/sDo; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A4Wwab571992
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 06:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TFJyzzVwH204oZf0Zg9D/JDdPLwjY1lv4WhKivVcE3A=; b=JJ2nS2wnDcbLNzEp
	MeWnFjGDML5Dcd50WyQkOhOulgMRAX1Zfkx190kXhHHuAaOhKmHwxC5CwK1gISpL
	d1w0gsEK8HTMFU+pUdY7G8wxijIvQE3foEfoDa0D+gyKIJJOelMlCK82xO+s1MtL
	50HZSuTTvyddKQUHSaCa8wueKM28knuHUnj91BIJ0IlFA86aiGObIjisDb/mxFAf
	wRIcmPp2FlXFUm1+b70u1TOIuefevAXmMeW6kNJScW/cOYckJE/vYqg/mI4jtqJb
	APipRJVXmIqBQJqbZt7+KxkCX/UZ086sY9iLbOtpD+oIA1/PeAJYyGHPY02k4Asb
	J3Ti1g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a8b1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 06:16:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d982d932aso7966477a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 23:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781072207; x=1781677007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TFJyzzVwH204oZf0Zg9D/JDdPLwjY1lv4WhKivVcE3A=;
        b=f57F/sDoxScGnxE2ksN7aHuc9fIXQYZrGvn3PSn59VwNZZp9IbVIoijCL/BNrX4K6h
         5F4H31o2gvFYStek631q8HGkVh9LymVlD6sKNNvVjXtcs1dRoMwxK/EW7fLUfY2h2ve2
         wk2D2je8M1LozTHd1k1BtM2svb5LeassT7C6/s1rwLhNOuqmfRR3sN4+/gs5FW9Czf11
         ijIHES73t0q1bwd1yx2r/gZs0ckmekSCnGcebJv9pyThz3rpE/tEihhEO1CGshrFnMO6
         oTYptmzUjRLabu7pSwCqsxSeknExOfYewoh5/+3kJoCI4fK2xc8OASUnhNAYd+SGwhuH
         mEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781072207; x=1781677007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFJyzzVwH204oZf0Zg9D/JDdPLwjY1lv4WhKivVcE3A=;
        b=KMbELp1VjEbedr74Ea69g18dCsLh46CmP4xGN275IZLcw1HVwXrV/wLdTG4NvtX6yS
         g7XMbLe7FgOZ10q4OsmJqXMRgx/ofx324i9i+iPRTv4mupdt4xKf3cdYpOkfAZPS3OEi
         ERZQ4OLUoVaSP6FzR1bdtNpAW8HplsKYeLAuYqbHTHyY+BQx3lkuDu3C8QrJ1kBonrFw
         P6yzVLy0pygalzZoBt1NNSO3PQ08WwGbscl3/3Dlb8QTKg0ErOUTdao3Ttc8t/jecsCq
         tJK11cHZvPEGwvVEbkYxS1/vYryvZFg/yJtVM+bcqSo0UxEsVf+Rlgz3ZqcTP9zs+mNt
         OvQw==
X-Forwarded-Encrypted: i=1; AFNElJ+vUCvTNOKkddRm26SAKdm5hEW7I/EiLUFqeBxpSUo2A6rD0xxDt7pDUVsRhQllUOH9kK+t5usz59WU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqt3DvWyz9rMFmX3PQyo4X8+cJ5n7xyFUxVOhRIHjm52wmfMR5
	BV3HqxUNI6hHi4j6s0dzwLnFOLsaPWdDZGBiJ2nx0KZgcf/crtY6eS2Vm9bLC521CoVsDrPDz5x
	kajpgpvme/CAAklIJ2blHpG3W8CWVVOg0cuW3Q2sG3YHlxRmhcsZSZLde5fa2JCDT
X-Gm-Gg: Acq92OHSc/I+VSX3g70MWDZDn/ssbZ8C6PE9Grt9+vIkBxcNavMdNGuzP5dR6x6sBlh
	QlyOIRZaE9UK7MkV+vvpQTjKtCy7Da426+0AI7OdfIycbagnQAGgVvrKwAOMPv2QMw9G00vNnUB
	c6ZxLpofs6yktkdw9EDLwak0Oa6BF1WgN2NfbLFdznVv72zVH6PbDjiAH2KP7r+fhKqYFPPoCpT
	XA0s9hLaFyQVKaEXkLkMqtsLZS3u2baPTNI7/fOxxmIKil6kGjkK/Bf08aReTAmZUy/NLJlhIdF
	3boTGm1LGh/ABt18nr8kbcxo5SS5Ncn9Dzlqt7ekH0Zgp+qp/GCO1wmDBCgH3z0UUPAX5k0HjHU
	zVBun+aqrD3ie9rw7QqulksifOa4bToL+2ATnjgpDo6a4RaWojelOWAYdWqQ6
X-Received: by 2002:a17:90b:54cd:b0:36e:2106:ded8 with SMTP id 98e67ed59e1d1-370f1333f8fmr23429117a91.25.1781072206889;
        Tue, 09 Jun 2026 23:16:46 -0700 (PDT)
X-Received: by 2002:a17:90b:54cd:b0:36e:2106:ded8 with SMTP id 98e67ed59e1d1-370f1333f8fmr23429087a91.25.1781072206473;
        Tue, 09 Jun 2026 23:16:46 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37624b83589sm1779078a91.16.2026.06.09.23.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 23:16:46 -0700 (PDT)
Message-ID: <8b110f90-2001-4655-856d-ec8cff98fc0a@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:46:41 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pinctrl: qcom: Avoid assigning thread_op_remain in
 unthreaded test
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
 <20260529-tlmm_test_changes-v1-3-88bfdccb4369@oss.qualcomm.com>
 <bf77fa4c-168a-49ac-bfe9-87880b0bbc9f@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <bf77fa4c-168a-49ac-bfe9-87880b0bbc9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a290150 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=86_BQXzD9sKH6W767hAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: PUbT_GEFO5SJ0LiYknmYeUDmBfJyK3aU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1NyBTYWx0ZWRfX2t6J8e8vDMp+
 aleeBgMxipAYbQFlGuqKEzKkGvzkUQOiyznPnPa989LzpiaEkeK57UNEBTfcp61jIT7m332fY4N
 QoB8eUevUwdZbUYmTyP504FggzGCCD6LQQQyatft3YqL5QGEFsZ3uXJAfPWGKmkrntYGUBgr+fd
 pX5FOBdIIx5fxifWcPqM2QyKkvxcGt8y4n4RAhkku3bjLDbCgtoEJin6gTJe6jHIhezA+EoxuJM
 z667qOlV7ozA1RBua2pfbUit89nWN6J5wLKm+gESqdBa48nITeSESig6X+m9i0+Thv+RUjUaQ4B
 XH6UHKaGIuGf+zBhtgTUycYCYr9S+N6jGa12YWflE9zrtURKb5ffQfjSirjkLQyE6lMXrBSonmw
 kq/OPIDoDxqPIWePAyQcHydFWuOW6mx9H3ODXvD4gSIEUBf8wDE61aDy/8rxD6mrVq30+LXpqwR
 sypjsenHJcqV5LnadaA==
X-Proofpoint-GUID: PUbT_GEFO5SJ0LiYknmYeUDmBfJyK3aU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38214-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:quic_yuanjiey@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B52C66631E



On 03-Jun-26 7:28 PM, Konrad Dybcio wrote:
> 
> 
> On 29-May-26 14:55, Sneh Mankad wrote:
>> tlmm_test_rising_while_disabled() sets thread_op_remain to 10, but this
>> variable is only used by the threaded IRQ handler to control the number
>> of GPIO pin toggles. Since tlmm_test_rising_while_disabled() does not
>> register a threaded IRQ handler, the assignment is never used.
>>
>> Remove the thread_op_remain assignment from
>> tlmm_test_rising_while_disabled().
>>
>> This does not cause any change in functionality.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>  drivers/pinctrl/qcom/tlmm-test.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
>> index 007d6539ceced294e81cfbe93a00c75a98c858de..e9e04300ab3687825255885821ebde0f3ee586a8 100644
>> --- a/drivers/pinctrl/qcom/tlmm-test.c
>> +++ b/drivers/pinctrl/qcom/tlmm-test.c
>> @@ -521,7 +521,6 @@ static void tlmm_test_rising_while_disabled(struct kunit *test)
>>  	unsigned int before_edge;
>>  
>>  	priv->intr_op = TLMM_TEST_COUNT;
>> -	atomic_set(&priv->thread_op_remain, 10);
> 
> Should this be setting priv->intr_op_remain instead?

Should not be needed.
priv->intr_op_remain is to indicate the hard IRQ handler how many times to toggle the GPIO line within the irq handler.
Here the test case does not require any toggles within IRQ handler.

I also found other test cases where intr_op_remain is assigned but never used. Will remove them in v2.

Thanks,
Sneh




