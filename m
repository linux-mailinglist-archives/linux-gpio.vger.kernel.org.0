Return-Path: <linux-gpio+bounces-33490-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOcDKsbPt2mDVgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33490-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:39:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 520E2297272
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 66B1C300462E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15D221D3E2;
	Mon, 16 Mar 2026 09:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIKTkxUd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NysbOBfa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC4C382362
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653955; cv=none; b=WxxqPRv9MOmbWJJvQvRTuYLFPPwFD1kjyvDqxFds7JbIjaPkYpm+q9Y9ORQVpenajHi6FTuTKKUfYOw9fGRAvYmgehcrYqhIEySfKZFzVIpqh0oiwkiNdQsZ7Fsz9q+0OggL2ys4guTDBa99plXHF8Kf3cv7GvEAb9VWm3aQ6Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653955; c=relaxed/simple;
	bh=B3OU56y38JhZLA9jQM1FfR0bPEJ4Iw/MDlK/lajt/gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXZYsu3DN3kHSTry3VResu9gFF8ZQUgVIkGKtmfyrQte+/LCUkeJCUmVSweLxHKrk4fNaNYROQOdHCfIlVlTm3l0PZrDhEI/MORTdAshn2NbDrxfZXqUnMxOVMyjJp6SQHf4sMhzRvCPQkpSbGTTB/COOilnxXvs42IG60kuFY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIKTkxUd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NysbOBfa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64csk662950
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1OLd1BUVc4e9AOajpXP8LC0jhT/oCscnk1JKQjEkAfk=; b=ZIKTkxUdBdd+OP5o
	RdvMar9RYFLh4pwe8RHW/Z4L7D/JJM1Nm9QrpYwRecKfkIgYB3vsTOuUtLf7ZyaL
	C+QlpcjVVeBZRF5O9ixgVrY44Pe+fcUblMYol/aokFGbdlhqcs66S9g2aO0/AHWY
	mx6unKpjZQ0ynRRXih6dwWdvhMUvjVyMFsOjV5AtQONzyK4izbqGMTHeIjL0CSkz
	ItT/eZfgwziAbU+dPxiirw57GtzpCPCjtRIz5kBMXQ/RpfMh4ioR5MyO+fJF8ERL
	iyr/FakdMVAS8pCAzeosqOZuClnVAhgtnj4+I3h9cS+o1zncLlsPP1T3b518DD6b
	bccplQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw043n1v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:39:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd90210336so240104485a.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773653953; x=1774258753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1OLd1BUVc4e9AOajpXP8LC0jhT/oCscnk1JKQjEkAfk=;
        b=NysbOBfaGpegOPUNNQU6hDEqPy/mAXE9cM7ApQC8elm7oDGbqU91vn6slNDpmeXTw2
         B35JCvggzDZn1uxwYwxwqX/WrNlVBim7wxQs5ZVlic3DPlISTHYso1Uycr1fCGMaNq37
         PDfx8MuTOkFn3V6S/9WSNP09SKMRs3gwVffJGZKjplz8TBDUYUksfzABKR971LiQhuEa
         MZ1Q83laSnYUMGwg99nSSaMuF//XwCiP/i+p8JhbzbA9GbAOIazkduNlfXKvDQhhmba7
         vOJahRmt+vEVjHXjHS0lUhWaCx1oi/K5wtNaioccSQEvkkYHZLxxnYjYqnekEaYMz5MY
         9hwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653953; x=1774258753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OLd1BUVc4e9AOajpXP8LC0jhT/oCscnk1JKQjEkAfk=;
        b=fdOh6m/ekxICJXtdyi/5Ln6ZVBwMCvxFy45gboWGTaymQVRZ3mvFA7K8cvFBd8JkTG
         Nq/L5o8bsfCDi6zUFTGFTmA4pO3lxlpGfhNZRPeVZkITHJ8VEkUAHNsQZ5wW/IgcQY8m
         azLzNxsYFzazuBi1KI6RVwZdvQIcyRMp8QPlRHHWA6cXmvX6VmNwof5uHgnxOJNMWFJd
         o7o86Jo2Z9CWnbXBL/uIbKqKCes8OAEIjd+CoPa0yrXzhPD2j2LBoQCwViypHW4OMFUc
         W1k7Kn/biBCwK4Gm0r2X4DoFomoUSvG9SJtk4rxGiy1gk2q0leWOm4eqRWAQtEmTAxxi
         HAyw==
X-Forwarded-Encrypted: i=1; AJvYcCXI3do/931AUgUMhfPBjoQxBg3JMUy5JoVEvfhPXXA3Tv4c4n0OFcFgXqhDIbRgQfaYNPpUUSL84Ni4@vger.kernel.org
X-Gm-Message-State: AOJu0YzkyEZKHpCulwvDRx0rWCXvNJot99o4z7/tiQAKeIk9552UQOLy
	/AxHrxTTl6gkY02DPJ7bIahJ7K1qR/wQd3hfa8AqR8PSSsNyEBr5BbS4K8zL1w+Aa66W6mePvZr
	+l+kEGtf1iY3Tc7FeyDOj2p/kNGSvBpIbEPVm9sOwJJ74XrEHbTMfDQOOsWOp+RK4
X-Gm-Gg: ATEYQzyr6ezpcBj6in4LiICxzaJ4xHRE+DUQ5N6VxpK66Mja481gPi644tTddDSmRe4
	Jhs83dnuUlpQs2IrSBEzLj+KcM0aEkNWEDrYOsZ8dLzHZKv4V+xuS5CRjz/2eorPE9hl92phOjN
	z7IuKPX0gbErHMmYKt4WNS9r7ZajbIVZnq+b/JC4l9NCS5LJYK+PkvwPMVdwXet328etKLOyqXS
	Ej8d1eoeSAKotx5BWjBDkiPruM1OupkHQKpU9tPKyCgmC+qH9kd3Hg2tMDDIWqjXemBCd1xMA6U
	59Ie0uxN2QC9PLs2yX5p1kq7DbQAERBA5Vc1cHmvav3Ad1+56pnMc1UWWlGFlhbmjS+a9N7Mjpp
	2mdw5pUzHRgGlaH3Lp8BHXuvWTsahPvHLbIhILr8yLIc8ub1R7sI0QtSB66RzK7IradzafwaMHx
	CIvu4=
X-Received: by 2002:a05:620a:44d3:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cdb5bb356dmr1363741485a.8.1773653952592;
        Mon, 16 Mar 2026 02:39:12 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cdb5bb356dmr1363739885a.8.1773653952142;
        Mon, 16 Mar 2026 02:39:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm529902066b.58.2026.03.16.02.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:39:11 -0700 (PDT)
Message-ID: <822cc610-7984-4684-99d3-8abd679eb06d@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:39:09 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: x1e80100: Remove interconnect from
 SCM device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
 <bnaxwhrfeer3n62xp5rka4pq4mz6y5xxwsin2vavc5zcj3ymxj@splrj22ki445>
 <198ccf60-a4b9-438b-ad92-bc4d2cc84b83@oss.qualcomm.com>
 <90b3a7df-cd02-4878-b614-1499589f0906@oss.qualcomm.com>
 <uukjr4c2uymzj2pe544hn2w5ecpmqle56mir642zieip4ixwor@3uuhplnfo5qt>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <uukjr4c2uymzj2pe544hn2w5ecpmqle56mir642zieip4ixwor@3uuhplnfo5qt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MyBTYWx0ZWRfX9qJwHswY8G1Z
 6/tZ9AkZLQLm0JUD8VliJPfpw2D8v1/6l0jkc6d1KrfHmiYC/D0Sly4uNyfrAC/zUGhU5tN5GT+
 5O04OTJuXzi9LV7CYz8L6ZDvDz/N3kGJLMQSSIhGYNPwxxOW8ckgMOrtYJdPA3IYdlXWuOU7koY
 mtqb9hyu4A9Ixvp/MYaKvI2RtSDKPFuylgJcUtQ08aYJ126atPie90q1R0Z1BjZ5ogswpUcIQoW
 /Q8Bui73ZU/fahLsA43M3mMVq8QDBp4VQtwhZ5gfNNU9pXqLU4RvLXeXOOxklhA3zODyIhuVpsX
 nJPYQSPVEzB5ZLriy/b653wcveaJ/ePrkzgl0MyurZS6esHpThTR74Ry8UuiZpJbRgxjQPWnTyi
 UQZC8zSzwjDYT7Mj0AdcCGRj5XOXIioQeMhJvasF078jCorplsN3HY4f0MU+AUhBmQHCPDZ9bwd
 NC9DucGcXAdmkaqQTBw==
X-Proofpoint-GUID: UQoMYqjDirQa1AMyWvpct0H4O-Bdw1Zo
X-Authority-Analysis: v=2.4 cv=fLs0HJae c=1 sm=1 tr=0 ts=69b7cfc1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=GTjZm-GAFzhKDQlTXa8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: UQoMYqjDirQa1AMyWvpct0H4O-Bdw1Zo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-33490-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 520E2297272
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 3:48 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 12:59:46PM +0100, Konrad Dybcio wrote:
>> On 3/13/26 11:12 AM, Maulik Shah (mkshah) wrote:
>>> On 3/13/2026 7:41 AM, Dmitry Baryshkov wrote:
>>>> On Thu, Mar 12, 2026 at 09:26:35PM +0530, Maulik Shah wrote:
>>
>>> d) Add separate SCM child device (with interconnects) under SoC.
>>
>> We'd then have to probe it as an aux device or something, which would
>> either delay the probing of SCM, or introduce the need to ping-pong for
>> PAS availability between the API provider and consumer, since some calls
>> work perfectly fine without the ICC path, while others could really use
>> it
> 
> qcom_scm_pas_is_available() ?

This comes back to either having to wait for the interconnect provider
anyway, or allowing the ICC-enhanced calls to take place before they that
happens, stripping us of the benefits.

Konrad

