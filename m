Return-Path: <linux-gpio+bounces-38856-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wKPiL8CKO2r2ZQgAu9opvQ
	(envelope-from <linux-gpio+bounces-38856-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 09:44:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B25386BC469
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 09:43:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pCBoEaMR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=R3CprJPq;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38856-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38856-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BDBFA300F78A
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 07:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966E2379C37;
	Wed, 24 Jun 2026 07:43:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3D31DDBF
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 07:43:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782287035; cv=none; b=uu3WO0NgSq+P1cepOfnb8fpsf2wxZ+ofNaH5c9HgEQPrpyiFMwz+Q67FsMHOJT8w+C6dofR9iGYLWHDPFbbMbU6vYHyS04wiMKmWhjlDzhDnaLjo5+hC/9rUfl2E7b3sMqBpvT5UtINRgL3jhH485Vk9GIMyJRCC5sj4SKQ1mW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782287035; c=relaxed/simple;
	bh=yLP+O1B0JtHQw/G2U6NEDgrrGFjALZXfN7mTRnZOOxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mLCGI7Ju0kcz2LNG4QKrRJ4awpbfOKJn6AeGWaP+ggPkJWNeEhUwLZPsn+RCGj/IxM3Ea3Se1vG4CkRXpmxYL0ZxN1gjRjO0ipIO2EXSfkD0rSJWHaat/4feYRG2O0r3mh/1wHUxoduwdCWjZWFwUaUxr9g6hhzDCWlSDcyAJ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCBoEaMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3CprJPq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5uAHp2439069
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 07:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eA3haVZuSgRB0UM8pMeo9bv9A+DRXdbrjWNgdAEot3g=; b=pCBoEaMR3lAYjAsZ
	o+o2I8kSsHJUj554VQsOfa8ZH8YfiCU32aliShpLPNZaC8ZaPUVI/kjoiRvMBoYT
	u7NrzhmD9Rj1OmJt+ITJioEjmgv6cQnVKPXkNqxaj3EvgsPONlO2/YPqt754C4M0
	A5s7/xgx5CQxVKXvjU0ApL1CnSPVPigIsO3mlCGuX40LS4Zrot3yqnYxhqFlk2tc
	ht4TtDxzLBXMGRT8aoBSPO4x8+BxyDMExGRP1qlJElQoknbP5nfxVfrk3Mhu/Rz7
	lshDXxAU1kVDOgOxBQO/fjnzcmfvlNBSO5fE6K9Q+hOC38oi74xI5nvxYfWHybnl
	Me+CgQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ar14v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 07:43:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-922548a7b0eso7739085a.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 00:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782287032; x=1782891832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eA3haVZuSgRB0UM8pMeo9bv9A+DRXdbrjWNgdAEot3g=;
        b=R3CprJPq/SNrL74SE2KG0PSUIZbKbgXK5gTcY7tGmpy+4WvlRZoNyLVqdPSYWk1B3D
         1PjEpXJjuqXDODVnnA9ErMmcaU7Bajnj9XJhvYLdVs3V84L8LfUTwTL8oz02gNh5rL37
         0KKkOfImtruGaJ1OVxFJFqcw2Zy0MmFvjcCLW7zUiq3wK1/qWZItTz2ezUXBhzYrcLBR
         wD6RajdFd2adg7Pf1JJJlAv0AOi6Fz3eqKt0mHWXGmQx9IPA3EgbcLvugBuPCYSD3Tco
         gdKP+iVLfECYe3jwDN9Y6AmJlBQ3pbt8roKipSdaFdSkP9C7mVSDFUzg3gtE0m7V59Zw
         BQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782287032; x=1782891832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eA3haVZuSgRB0UM8pMeo9bv9A+DRXdbrjWNgdAEot3g=;
        b=n3Vp9kXOaNJwGSbYEAnauZKtAUMuU2G8F3C+H+Hpz3Ljikl+A8skzFg0oTB3CKphBl
         W52L3kTVTwbRU2G3X3DKXpb5m/43g5kkNH/lksKx5HgT2jZzki8ZDsnZNnziLElsG+kM
         /Y6LrMA2avlfYWUEH8XZs50wvYk8V7dGI/i6Z/xena0Lq8zg8X9KtAEMYlfcw8aleYWS
         w97zroRGijVwhsjuEAmYuZ6E8lP1TGpcC1IKEfO28kNs9CqxSnmy09DLkr0YxTRPmo42
         UEiWQ1jwvyXscRtbebdUteBaiy/Z9DN3Ij12Tyh7EgdG2lFgBNOysq3NlgN4Fq5FeEu6
         /dzg==
X-Forwarded-Encrypted: i=1; AFNElJ+i2qp5P69Snm1W+CiiuUrpVKui6/iy8L8FkaJo8vMTUpap5ZVgB0zS5hE8gYFz4jQ7uj/U1u8cVHm9@vger.kernel.org
X-Gm-Message-State: AOJu0YziKjeU2tjBmBGx1BujoDBIRTwnw1oxAkmcjuL1FWka52Y2i3Ny
	x8RmZ776Vi36Oct9U3wTy5KT+GN3BXFtJpWm7Tk+EOJcNITHCz9wos98sBkOj7ZRMK15sIHqSUu
	BuBWHJHFdunETyNJFg2PO99fQJstNwAVInvKWO2ayYB5EdBhKtVWpC8BeQc9yLgl/8Lmu2mLO
X-Gm-Gg: AfdE7ckNqgcehfndM5Xm1M2u0jQHljwDjJ0D8kBg3g5dhN+LQ1K6IveMDXOIMscZ7+u
	clqfs33a19QbDdC3UP6bP0cpXYGzXqxODJdwjbtYLSYDi/8S96bMwFRCDLIWdQVixnGgWxJXGIB
	6kOqOpsnXcHRcy+uWV5QudEkHCSHWz/HyrSyph+6my3AD3YlfNKiSJeIo97OLNRJWpYuX3e4W5Y
	8cgKwevjEJuulQE9WT5aOLBZYKoufYD0MZYesp9ThulscjngQuvkHcP+/rIFLBT0TPtw2CvkcQ+
	J2yDRZdH5XVz9D3SEmIHlAAGhpFycMoiKC1MPLNTca9I6nrfFGJo0OSXvUXneQlS7tS47g8BnK8
	30VDHWZ9ps5J23WdKdGq+SEhB7IsBeSKOCU8=
X-Received: by 2002:a05:620a:4550:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-925cad55e47mr823983285a.5.1782287032325;
        Wed, 24 Jun 2026 00:43:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4550:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-925cad55e47mr823982685a.5.1782287031885;
        Wed, 24 Jun 2026 00:43:51 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e48ddsm635579466b.50.2026.06.24.00.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:43:51 -0700 (PDT)
Message-ID: <00fbe3eb-fbfc-41a2-964c-6f4b94ecbb5c@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 09:43:49 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Drop unused irq_data argument from
 msm_gpio_update_dual_edge_pos()
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
 <20260623122732.6439-2-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122732.6439-2-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Xg7KS78lNbho5W9pgIjgeHDljK_KChcP
X-Authority-Analysis: v=2.4 cv=EuLiaycA c=1 sm=1 tr=0 ts=6a3b8ab8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=AmUg6oatqqt9N5fMmIcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2MyBTYWx0ZWRfX5N3GEN0cF6q9
 K8NYUgEwV7Vd7MQ1+JIRUUHypQAcT1i+KBujXE7KXeG1rENCXbzdQhzt2ghaPckNr64U7GkOLej
 gM7aQwdwN5egaAdNd0HuOS+b0MrIY0g=
X-Proofpoint-GUID: Xg7KS78lNbho5W9pgIjgeHDljK_KChcP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2MyBTYWx0ZWRfXw9MLb5tGlkrw
 vEYyUoIWQS2fEJBkp7mhzAvxdBQp4uR3W3ttiAcNw8OFNeJf+Rm+D/FqJL6MxomEhAPpJU549+7
 8lZIo7Lj1fbkF53N+ifPXGP1VkRA+uDmwJ4w5T1B6HQX6CW/rtZcBVlhcrZ5zvqeJLhuF4AD/rV
 wKJFWHxQJlYClWOy2fhImvULuvL7VUKS1lo1mSyVWL2vUckkbJby2JFT78ZDe5LtV2ykFOTgSNZ
 8KjC4zQfK0N3i+nyQyGnoyxQESI+pbB1zEf+4BUgNpM8cSw7w26XFaIQGyzEPGbCbrGfiNsHcSu
 79Opl+H6JtWpkLplEsMKjko2juyXJXFrgNOqvq2OObaZggxIeovupjCjOH2XItOIMRXaEbnQfde
 /HVIBHzLSTrxC0B5DcErg6wzdISSOS04MVaCewPdKHIStLHB3ZofMxm21/A9yrfvblU+9ausatP
 d1ElWqoPhoct6NekmzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38856-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B25386BC469

On 6/23/26 2:27 PM, Hans de Goede wrote:
> The "struct irq_data *d" argument to msm_gpio_update_dual_edge_pos() is
> unused, drop it.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

