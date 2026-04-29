Return-Path: <linux-gpio+bounces-35785-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MQvJ97R8Wm3kgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35785-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 11:39:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CC8492201
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 11:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 004E83008C22
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0E239C64E;
	Wed, 29 Apr 2026 09:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aL9a5EM0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5SdL2zx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38CB3A9618
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 09:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455474; cv=none; b=E/SAWiH+TIKLkLGkB1sPu+x2KHoaMc9BQsuaQTqOuYEqLgx2tFSwy6D1fo/GtH36tYIRPGmy8WI7ifYjNbavAJIXHXoUct90Ha8Zfu/xYATLPSKWwQv5TiE1jwDtuL8BZpSmyvzzx2f/F3B3IEegtVW5TUWu4GUdO4WUA/XOAW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455474; c=relaxed/simple;
	bh=sY6uvPoFWphWYageZQ9Sz/jChxWgPsxvGE/Sy/m5xfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djVFbULQy8UUr8bKDyU96YejztY4PI/tCDK6XxA6+SiQjZKkEtbR6Ru3HtQONjV5FnF/IQjQmGZNfo0pt9VDc98TvRoX2OstOp+htzk0ipnw+cmiK0EkUjwPoQ04qroGnBXMP0eSC+KcjfHP0Yho00acpoWtaw8uIAFUCv7e66A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aL9a5EM0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5SdL2zx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8plVY3752353
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 09:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XdmHACio7K6SZW0SDaFEL0/f2ndCq5sBYF3pznoVz94=; b=aL9a5EM03qdF0gXl
	zVRQlxi391PVqhe5qn30EhRfyyRM6Jyrop+ldig4zdqSkVrDB19DxpytY5twVuFI
	t+mbaA+3ggGgo6L5UY17TgUQtzx6D89KOgTB3NHEO/OmDEGdKEyuJy2EuK4RtQIg
	/OhhqE5g46z8ZkhBoLq9MHIXAYCTsK12NerwHy/GY+RhDZH9mhYge/+EM3HzulyZ
	5Zp67RQoBiRAbYhTmxI7c+uHwzyh+13uKRDiS9Hki4VLZL1mYuZyG4vofNfRpQGx
	rYDTGS3nya3kmLAd6J6VqOVUzyt1GdB0hWZUrhC05hCS/z8YvySspZ/Dz5EOHfii
	xY6osg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1gvdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 09:37:49 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-573ac60fcc2so141113e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 02:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777455469; x=1778060269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XdmHACio7K6SZW0SDaFEL0/f2ndCq5sBYF3pznoVz94=;
        b=J5SdL2zxQ6sJcC324azei6esOeWT8i+EJAHiFyoIq/T6lVjtNfkD5qRiG7os4Pswj9
         KLFbU6i6HW3ULr8T9QhNjCy9hab5cGQ0q4Dn41Klb96RxLyAGaDpyjCLie0hRDCcM9XU
         Ml0nrnPJ7ARSHH0bclv3nLPBAy8H62hXg6qgGMCi1r+Vw04Nmqobgm35z0N9k3EWEOhc
         QAD3Yflh/Sab0pU8HA40pdB6njPJ+0lexcQeMsKBTdTZ3+NE1dNx1FcavAWMWpfVU7qN
         1l3HOA+CR0JHG3nIjc0mBBgOY7oGjP3WAcvN70L81Slo75FRVgbS7K/p20+9jdxw6a8D
         lSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455469; x=1778060269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdmHACio7K6SZW0SDaFEL0/f2ndCq5sBYF3pznoVz94=;
        b=ZLlZ76ohHIJOeVhQ694XyTPyykZ5B1WbSf3EH7C9VihdVw6DGDRFAJWAB7XSTm+wLd
         xnqZoeUSknvI7Igcgwrdhf5v7tVJ+wTDFADxbqEu0FdZ4hkV9dBF5EYaqg97i0ahAp4S
         Rn1KnNGKBFKAEwmBbyvYwmtyLl4eih5EuSRSFsjzlYGMlIISwELKLjnOquXCcpzLGZVr
         BWmUrJ5MeVckgGFW8NJvqiZc1QELJmhX2GaVMHSI0wrA7+9eX3bH++95bCoCzlHKy5BL
         Hj+WuIZh31BD8gSITAP9fcWqEXlJTOdXK4Gb2JNfzlBzes/9D7mjr3o+SqhJOGK0MLUn
         6yrA==
X-Forwarded-Encrypted: i=1; AFNElJ/5qv1JZYc2SdQT/wdXyJs1Du9X6lgi9JshghaszHNINEGE7gyu3+Ck9vTimEFHO33a9kzh183Wvo+B@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/TXeH9LK/qKXRULWXpH6js6/2FPD+bIE4wuos/u4blde+GY7+
	AljFMRmawDZPMFdfhRZsldXwMk1hr+M0VFmTpnzYb8j1ylEvGIuSbgphyLBN7Q/tdbqYH4GWyE4
	liAIrDDQbW09pmkwVq4lkO9AQ7kKW7Bnhc0e0vtIEqKudd28po6+iBznKK1Vihtim
X-Gm-Gg: AeBDietj0AyyvOXoQiSG+i/4AsH/g4BlijZckmMb0WWNd4kg+q8jOpoAM+ZmjRi6gXY
	UKRIizmy8lkvs92jtJ2fFF36D0ZfC6nXkgEf8zXZR4ojYrDrrqTY7xW0NQ2Dobdh1wT+UVVuZpq
	etI8795oRkvqEcBQ6JxegKOfk2VF7ZhOpRaXezDwO3mpITzuQL6KaZRjMYVKMV9Fz2ETj/zLqf5
	jJ+uPLsNceue/CHz/V0nFUzrZaXxflXew0IqsrCF/qSSmbjqtFmWnBpAQG+dEuDuVIeYtBR42RA
	oFkC3LeimxDDrZu2MrO78SDilp5SclVOrDcnZbvIhzAl6z9Zpr+caklx40N0B0NfV2uxOXpwUIT
	vwXE6xo8zlb6Iby+Oy/7k3rHyjUYumR8BKN/eXibLSqpi63cGUrezg5nZab0CYn4fboT0740U9p
	JscVeuG9Sx/IPJfg==
X-Received: by 2002:ac5:ccd9:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573a2df9fd3mr1310913e0c.3.1777455469377;
        Wed, 29 Apr 2026 02:37:49 -0700 (PDT)
X-Received: by 2002:ac5:ccd9:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573a2df9fd3mr1310907e0c.3.1777455468931;
        Wed, 29 Apr 2026 02:37:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb98630cd19sm66147666b.58.2026.04.29.02.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:37:48 -0700 (PDT)
Message-ID: <4429f44e-f7e5-449c-824c-83daa339b383@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:37:46 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: qcom: Remove unused macro definitions
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260429-eliza_pinctrl-v2-1-feff875e8137@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-eliza_pinctrl-v2-1-feff875e8137@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f1d16d cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gJclFhXD44B3JayKqD0A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5NiBTYWx0ZWRfX2vkg4S1Fs8gE
 h/5USK0HITMPGwGRRXhh9Eg8pMo8HlGqmTP4eyDFu75cDEzbxX5Ssx5WUNMRLmd/j/jOute9fIZ
 CVbgwmPo+UsUipaAB7IkGCNi35LAiQXCtccBua4O/pMC2O3Y+EjhJ3TlRefX7SCUgXdYr7KpVjG
 iLGRHQecbANCIDAcgEtBgvOX6nPa2a5Nqxo8BhtU86cCSEkqTrRpvVcy2XI9m3cDUkNPX3Ayt3B
 pzHz//hRscycS3pRe9lB3MwiGCh5ctqDvrwRLaTat2CHCIbOnyNFNdnAUTlxEQHfsIkU8d7DCu0
 02bco7KT/Kz6kFFOs54N/VY8HXlLx++MvsU0NwTNCYZ/yGS34WFpWa9meeU7/qxdHbxutufTc1R
 5rlw9tLTA3vHhPEfRMZExoN4Hje8bsIXkgISXGdC7n14h8aQyzKmcWjY3PrA0TidfBinbvEEFIo
 So3fB2ts4c9TM5MLSZw==
X-Proofpoint-GUID: ZZxbQ5wVivOPvhM3ee_79KyQZ0KnjbhP
X-Proofpoint-ORIG-GUID: ZZxbQ5wVivOPvhM3ee_79KyQZ0KnjbhP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290096
X-Rspamd-Queue-Id: 25CC8492201
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35785-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/29/26 8:15 AM, Maulik Shah wrote:
> Remove SDC_QDSD_PINGROUP, QUP_I3C and UFS_RESET macros as on some
> platforms they are unused.
> 
> No functional impact.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

