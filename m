Return-Path: <linux-gpio+bounces-36270-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GogHpIG+2njVQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36270-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 11:14:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E7C4D86CC
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 11:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1EB5302B772
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 09:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7503DC4A3;
	Wed,  6 May 2026 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3G5UjQM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wd9zOJbH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80DA322B8B
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778058612; cv=none; b=d+jTjoFuKXHbuSRI6jbEHzLWu/HEGq/ysjcqiSFey4N+i3+qIGwbv1dYnqI4yS1ADYDjoU94eOt79xBGwQyyrYEWSp8J2FGW6GQXMGnTLCz2GuaoY3hik2/HhIyMqsou+8ugCrtlbAiWYNIhEYBGVxqcZo6D6DQVpYRrV45s1nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778058612; c=relaxed/simple;
	bh=Z1BdD20u+8aXJufVXLXtLtaebP+vr7xBeAeljLMjjoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XElAdcy889ssUeuwCoFXRNMmBQ9pfB+OuktKuSd+J6QFITC9qXc+LUs7Lp8cy/Ov6t2qVcwJ8ArXidPwYwkrkp6DJojPUABfmrM+eBexXxVO9BsvRdyQuGsbpZ+tFNqA2RWVXS9OcR/gNx+yFeQNv2bNQ+AE7K86fGKOFk25AE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3G5UjQM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wd9zOJbH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6468a2NP443191
	for <linux-gpio@vger.kernel.org>; Wed, 6 May 2026 09:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TLbEw0mjU0MpEOoeo++D7ArNr4Yn1pQmFRpiMgSVle8=; b=j3G5UjQMPqCAQePo
	+SNkwm6S9nwRG7q3Dl3s/0b9TvoMiYZh5+093I2wGO6yhq0TIYpM2yfGyBLpm1xe
	vgQMXojF9EG2DAEHNLAnuqTkMWTsY2RZlNbHYrom17gZnzaBy/zRWoZz2arEjP+a
	bfak/MPpZffmtaomkcUzMrBMESt4bCKHdcIAWtxaGlZmyDMPxB2A/808tYy6Cj5y
	02R9mChxBFN9RfNTybnITEdQN7TOBhQFFVylsYgdw31M+LE9inAQ8f+HdOCiK6V6
	iRYv5j1woydOqWKnK1tEg91WEGnGAPYTOmgNQuH7s1Ap4PyP/LNxwzooWxxc7QUO
	Goxv0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299g4sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 09:10:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9f1bccd7so16581511cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 02:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778058609; x=1778663409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TLbEw0mjU0MpEOoeo++D7ArNr4Yn1pQmFRpiMgSVle8=;
        b=Wd9zOJbH82dA+K/GHzdjkKwrnoRWUhyQJ/eTdGwry7hIl8QmAQ5QYkTDDAj9RRZ9fh
         +98iQV0w0qqOOjbN6v5iEUBTw8U6QpIe63vxvEhfvI1xCHTdCkDD1VQniyoMYITJPkEY
         344gHMu3FdsJVb2iFuBv4AD5NGAF3D2foJs7VYi6Md9QKTtalX32/SWnu4dckKCUVuzM
         xzSUsIUr/kM6T0av8shR72YeE66+K6EzLVVvgRtXm939Z+2VLOd02D3ivpyESzeFRmc5
         urc6K5oCxorcp8nt+ZW8Lzn/BC/Qy6rIVP82uqutrYwpaGqR78ifpALyks1NbsEdQfQ5
         mE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778058609; x=1778663409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLbEw0mjU0MpEOoeo++D7ArNr4Yn1pQmFRpiMgSVle8=;
        b=EaaYbqSSNMRLY9LZpPmiVVjTr2stYzcUM5jQlYdUMvE6wiop+ggji8uryHSskjhR+K
         dwpZ9duuHgCpC8+3Yl4UGKUu2fbgeIM0lBfJkAlZhjV7UDBvIfJYQe+mUBre+9L501mP
         aQo3YiSw2AkcKrvillQI/XwovV6AHmWLZVYn5eGC87raNOY3Q+POgEYUciUBjp/QkODh
         XlWI5/vaySHLDXh4zRbhZt31lXiV0uE9AGPIUg4ODgGWk3a/LwboV/HiH7a4Lrwh+Nrn
         l0/EeKz8Cfe9meKvZbLqlYIOYBbkUUxiz6flLtP4dRIcKiZ/fKRFJwtmrg6n2BBWDk1q
         Hn4A==
X-Forwarded-Encrypted: i=1; AFNElJ/iScMznjUzcLMZDHj9/9a1chftyP82OCr7j0PherzrpxYpA/Cf2ZHjK8asEt68uHnJbYp+3U48CJaX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnb1aRhiHkX0zwH6SBbnJX91C40jUUHyy3vQf3mfkYzfFgTIOb
	GmIG0aqGeir2VjzfgX0Bt6zrDCymTQZTy/2TWXXIoeFGWyic5HBB5FRwgj2zWOxC+CxAGri+q4B
	CQcdclJ+qF9x/pk8r2LOmQhgJYkbjFWrQtoZSic/NC6KWuz+eUc9c6pxGh4Vx5N8q
X-Gm-Gg: AeBDietw1sNdm4Xzk6kuZvaBw+fyEtkrl4RaekM8W4uLNlL4OnGmE3jwWIx33i/wV2s
	Ii3JlcZeyiMLScZUpUlL2ExTaTlRxCvyFi1+uzvkGvoNCIkB3Vg4sElWnPdY/jOedYxfYnNpyla
	0FHlAdDLIsDRk2t/bUQGO7lvaB96+8ADiAJH5k+zu2RNofcL+dsNxlISj1j1KHgAZfGahlMaW3S
	rbTEcqpk5coHGk1f/zvcewXLfNR1R5FazJnsP/ZRazv2E85GCrEfVfctHnGexaS/0Y80TR5ypD2
	daoaeMHuoMEZL2lk/gu1jov6yEljpjfwu5JpFbDl4fsPWv5d80LMmZMMB211sN+C4AxteP8OvYe
	ydeLb0uE53PX3BzM9moXkphshWMurcpMWwDxbdTQyxwpt7//EQlc844n36J2aRadvmfWLNBiaG0
	fEN2MdGWepgA3kiQ==
X-Received: by 2002:ac8:5d53:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51462619094mr24274711cf.2.1778058609308;
        Wed, 06 May 2026 02:10:09 -0700 (PDT)
X-Received: by 2002:ac8:5d53:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51462619094mr24274461cf.2.1778058608801;
        Wed, 06 May 2026 02:10:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd90ef9d7sm1143831a12.8.2026.05.06.02.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:10:08 -0700 (PDT)
Message-ID: <d4abe1e6-2fea-433b-8d6b-7deebc94f38b@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:10:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: nord: remove duplicated pin function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260506090006.10905-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260506090006.10905-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fb0571 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=byAbIwltOI_n8w-TLEQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: wpGHeGkeZFpsoVhxxfh3fnXXCcNiveqA
X-Proofpoint-GUID: wpGHeGkeZFpsoVhxxfh3fnXXCcNiveqA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4OCBTYWx0ZWRfX7orr5RfS/ALr
 v/B4G/qXCVNX5HkDy8Qgm7QnN2jsGA9Dy6LMnGV4pdtYbwUF34nBuvryKzhjaeAKuk+PxmZNHzE
 YsJLOwn1Btb0kn5hE5DofylEVFKIcUHQkmJAS20ogcyRmurlORKJ6qCH6plJ7Hi0Ge3EX2Kc5bW
 FtltvDo/AL/nOXq3m6t4TJubSMVa/6y/WBOfBD4xRxXNnWIa9YBKylLpGcw6D1BR5uaPnm7qOYV
 a1Av6Ftyk0V4a0Q1t6KVem5W/l1xU9PtmZTTbvqBWTYqgqjvLVFEXFZEGVYi4W1qXBtKQffnRrO
 V0MlB2nI14cS7zZv0hJdBFIRQ0xBNQVsgdajzcy4ld9hdoKhR+FuUXrneAmv8e3aRD65aO8XI4G
 i1TLcwK2vK3UtpkUKxELXbXuNw1+P+eV5VjOSHl4oaOd3njGDTLhhbtwCg8WUhAmVgki0cwto/4
 OiZN3HfDcksNCBQl89w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060088
X-Rspamd-Queue-Id: C0E7C4D86CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-36270-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,intel.com:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/6/26 11:00 AM, Bartosz Golaszewski wrote:
> The qdss_cti function is initialized twice in the nord_functions array.
> Remove the duplicate entry.
> 
> Fixes: c24dd0826f06 ("pinctrl: qcom: add the TLMM driver for the Nord platforms")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605061633.BJLI5voT-lkp@intel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

