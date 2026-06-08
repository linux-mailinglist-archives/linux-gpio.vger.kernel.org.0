Return-Path: <linux-gpio+bounces-38088-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fGCELXyXJmo2ZQIAu9opvQ
	(envelope-from <linux-gpio+bounces-38088-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 12:20:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53758654FD7
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 12:20:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SsmReYi5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Tr8/q2WP";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38088-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38088-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF4EB3043ECF
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 10:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D86C3C2BA3;
	Mon,  8 Jun 2026 10:05:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A603C1413
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 10:05:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913105; cv=none; b=U4KixMvqYTRzlNh838c4Uc4mWaxeGQrILtFHOtOpY9/DRXaYUvMJEQgTPiS6RWIrzu6xjebc5s48HRYbp5nlDTycQVqXm4DyPUphxXAKrnshfvYfsNzcX5TKHc2LCTZuYOJlF2BZqOY+lbkNyRam6bInpbHsZTiRzllPw1Uvnqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913105; c=relaxed/simple;
	bh=hlfs03Xx9bg6vz32VheIEg4FEzOKPnzkVBiyVQe7oRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HXPnLiolYCJtpOPhxarmiEacsWtjQEEyWB08pfltQmorasJHAK8Mvv5gtR2q0WFuSMQvfELhzrhz/eGoyvVk3PgU1noPrKIGrROl5rnWBcGPGXNUYvF1BJ3hscIpOjCjBoXlTpcum02pEM88LEbrFo7FQ/T4i1nMTT6BYf1t8cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SsmReYi5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tr8/q2WP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OrHt2274513
	for <linux-gpio@vger.kernel.org>; Mon, 8 Jun 2026 10:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1OWXlkGlD5B8kceck4cb0Q6AFE/5sQ53veciYy8JoFI=; b=SsmReYi5meb6veN6
	ylLJP/+Ku/s3BNRwy6NZnquFzyElJi1SJJhHzb4Uge4oIcPoEC/DernDKO8NMNPH
	Uy0jDPgmlswv2tMgr6cXZW0P2RPGjt9Ypqp7/DJYLEgX5+doBE8V8W5+OaxJ0hpD
	0vWfmXI7D62WelIPtCqEW3qvnNCtYx27Yq3EB3LrCPyUMwH9dcQXxjTXE6cg7N52
	Rq1SYGZmvg8OskrsoXN+j4IoH2FiDMjidYSwFYCvAN6z79Kk86zB4Iop2LwCe/On
	iZ8g4vUIllndqQemNU8ZFY3KevC7ucZ35IwHR2VYHenw/4L9Qd7W6f1K85yOCEqp
	KslqbQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgxy0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 10:05:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51757324dcdso8124131cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780913102; x=1781517902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1OWXlkGlD5B8kceck4cb0Q6AFE/5sQ53veciYy8JoFI=;
        b=Tr8/q2WP+jmTthUUOYKLDdtiQWFfL8cy5EhApK/oyIaEuihUa6UTcW8MCOJ36HfZvh
         aAZQjU/OYT10EPxoy6m7FMovlqb7BYWNod4j38QiNEDvcpFNUU+hSmKzCbS4+IBc2BYX
         +cbIIwGDVR6jDKTqduLxjCRuG/OUaA1ICASSet3fYgvEbwUEzfeAKr98d9/wwqT0yRy1
         mhwgVeT2C0VY15gQmrCCdL1EpJMksJd3CHmzqpKGDDzvQJetjEhtnX/0PlLLtXzF2fMG
         Rf6NCx4mETMEFzCcqYCFlLL2iG9tBuiDhuSAOy4T0lbOD9c2r+H1dQxvN6oxFwveb0rQ
         el3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913102; x=1781517902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OWXlkGlD5B8kceck4cb0Q6AFE/5sQ53veciYy8JoFI=;
        b=aNYBqKugbQMXKoPmMhabXL5wCtilJpgpSCt5vWHtV/YQaBz9uTzLscMRxvzTa6EPdt
         1u1YfscWTnoi4MhoShz92J9KxMCIauhAsE59XlDvAcmBFUynkGVwo+Inz/k+0PTI5H2o
         gN2+pL9YCL6HvLL7EEpSoZtB38WJbDP2qXDdsfMZOAK7BKG5b7hCww7J32Nl+qGG4tyB
         SA7NangEubzv/uc7XT/WDc/TS+7WfnSnm3a/ElW7cUMprHyYr8jV2+y5VC9sR9+s1VUT
         gHrXk+HrwxJG3I3c3pAvkJyzkDHhD0ULGNGhPL1GwkgwxPoRUowG5UQrKmCM+F/s8+zT
         BDNw==
X-Forwarded-Encrypted: i=1; AFNElJ9XnR6fS+LpVAlsPnPWuFRgKIbTewSYHZqlaumajalRMr00FH95tI7RJJEWaJ5y9EmI3pLZvanriO93@vger.kernel.org
X-Gm-Message-State: AOJu0YxmfY0dxKJ6OCXj/AWrw2YwJM5nHX3dkO1qC0kq+nr3H3ZtP/lx
	muM3SBOtYl4uzel84EQZoJyLOACpckrIeElWcWSNxAVInzNd9BDYF6Cqp64V2siC7FSLN2qDaNC
	CKhmBHyd0glEWN3CxlHD+OPQHmWmPrZ9e8wwZn1JpUrzqb1MN/JtYMtp77aEqP9Y5
X-Gm-Gg: Acq92OF2rnsYOYFLneFWzfFqArFiflzbJCyPI8ANfwbSJ5AcnbyU6+1jMNKaAtQW/b9
	VWZERdbH3SFUis9JehA7bBtKJVsVj2aAcKgiVX+dZiilypqplAFi6j6TF8dTPYL80Dq3yIdAGFa
	CuYW+zNPb+2r0hWItQo1KOl4hn8vbv5cj/io6tAhjSK/bINfNmXUfC7AFhqkJcQpU7aYUWXSvJz
	EE7ICX0a9mQ+Ps6jpEcCygO5scLqJyOTcS8gsUOCMM+veuq08pmqax+DHKrRZIB7Uj9E+Cze344
	FrsMi1YhXsMSVVS+VHOe7A9vVt3czmG0bclkprnyzpg7Tov0ItdyRAFQePF0RicE9/o5h27Kxf2
	dk7xHNuKJLWjxjonQKYvL/ZBeeHJ0K9I3+REJIPXa7JJDeS+z7Fhc0vJX
X-Received: by 2002:a05:622a:d:b0:50e:487a:bfef with SMTP id d75a77b69052e-51795a481e4mr128027271cf.2.1780913102491;
        Mon, 08 Jun 2026 03:05:02 -0700 (PDT)
X-Received: by 2002:a05:622a:d:b0:50e:487a:bfef with SMTP id d75a77b69052e-51795a481e4mr128026981cf.2.1780913102054;
        Mon, 08 Jun 2026 03:05:02 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6912365bd3fsm3425407a12.5.2026.06.08.03.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:05:00 -0700 (PDT)
Message-ID: <0bd25e6e-b4d7-4133-a718-0b569405cad7@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 12:04:56 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Remove unused macro definitions
To: Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260529-macros_pinctrl-v1-1-3d5671efd18f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260529-macros_pinctrl-v1-1-3d5671efd18f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a2693cf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QQIitYBaRXPuBUzoCRMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 45A1_R0gvW42BEtC4dbALemv45cImfxg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NCBTYWx0ZWRfX2NlYsxNOkLoh
 q65gaxoQIk8UiY4VJN9JlWNegvs+VCYHJ12l25KzkuAaPAVec0szo/CII/iwS5ODxvTgEeMPABX
 8H9ccqbGtdsQ/Q+J13JINLPqlaGZS+FrxkDnugxThxMIRlqAJSLdfCeuPVHAAOyK6xShmOaoNrb
 3rQtGOOBwFo1t9ylPPFY54kheGJwWhvRr9Gs2zcBTc69Ixh8BK0VN5q0JoFulzbENr1hv3EoNHc
 fPXCik//2kngvx8yKXOMsMpnTKBQ3UlTHU/1SjRVIW1eMRWGC4hYnaHGr64kXtGxL6VNiud3Ypy
 w9XSKo9QGhT3D6ueLiSy9zkKcy7oGOFx91wTbOohhGcIi7x7QJ+qX+u/07QkyNtbT0AsxF907pL
 INgXTzbmNT6bnJ2tprYgxel8oEZnRIQOf+hZiq7GTP4x3Ycee6Drta0jFQkxNpcTKnbjTwtYCHL
 Czn1zObEGWbzKsjenpg==
X-Proofpoint-ORIG-GUID: 45A1_R0gvW42BEtC4dbALemv45cImfxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38088-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:navya.malempati@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53758654FD7

On 5/29/26 12:43 PM, Navya Malempati wrote:
> The macros QUP_I3C and UFS_RESET are defined in some platforms
> and yet not used. Remove these macros as they are unnecessary.
> 
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
> ---

Wonder if we can/should turn on -Wunused-macros for pinctrl/qcom..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

