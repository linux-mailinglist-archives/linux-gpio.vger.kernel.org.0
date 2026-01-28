Return-Path: <linux-gpio+bounces-31259-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPPTKEyLemkE7gEAu9opvQ
	(envelope-from <linux-gpio+bounces-31259-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 23:18:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01912A9806
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 23:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BC78305DEE4
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 22:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3734E3254AA;
	Wed, 28 Jan 2026 22:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nehQZQsZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VGxPux2A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38379342CA7
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 22:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769638638; cv=none; b=dQKOTzOqu8JbWTNRHuTrvqd6oCeSTK+bLaLJgDK5gHh07AGG4eAQ1NciI76Ov2AGN6XJ0QRWa5d+744P/ZZXPfTYzswnrwWCvTT1Uk4ex3byHIbc71qa+B1pYsMN6DO69kJNoElRsJGnPjTPKB5kHtsuvyVmkCLhukOGYbXcH2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769638638; c=relaxed/simple;
	bh=8gCm+keAh4iloPnPUPFhyZpkhcs2+S5XGOmc6PZKlAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYk13HiAr4hthNzf0TPgshQ7QZzU+UUCiWllr7L3jcZS169cACF3K30jsWHkxnCO1rfEfYB3aKMux1iZFAog7/KiCsBsKOiMmOED7mAD+ykozRv/uMSL/QRToDyg2oQHXpOVQ1E4/ldRl7wOn+QUL1x+/cNy1RU8zz9jt3kjZlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nehQZQsZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VGxPux2A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SK7G8e679621
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 22:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LiSPXLj4QSiN5MSKstEEgtaG
	EF4LVNZ0IAEy6B5hhkc=; b=nehQZQsZnUyGSoaBwALnypDTGwnULyCFAEVJuFRf
	6jncvHpjdcUcxW/5oO9KK4zmkNMCOX9UnDzX0igiPsgEjRU9+6IA7DN5vz5Kk4yw
	X9fwnYFEqwZy+aB85sp4bQI0Zh8Hy0jHQH16ms8MCbK8yuksabp2Ciw2Nq8d7CqM
	i6BFUj63gFRXi0J+igV3JQmm1/fhJOL7kaaR3dMPlkMkQgRBJFYUxOMg/7SAJ5Z+
	7YzdlyO9fH03HF/kDQqDiVGiFqnjlHerFNnifDHpOKowQmTQiKzhrvaSlc2SJ7tS
	I+8xMVDh/gYPocLxqXiEZPwFjpsOCgicnbDvJx2tbijbDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byjxhswe6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 22:17:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71304beb4so76048985a.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 14:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769638634; x=1770243434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LiSPXLj4QSiN5MSKstEEgtaGEF4LVNZ0IAEy6B5hhkc=;
        b=VGxPux2AHL8JeSy13P3BUSTRQ0++nZv8y7k251rYrJzyuzgG2WSPinBy2uumMIdiY6
         U9cCXJHfgBc7We80vX4QVn+ARR5mDNIn63AMCIKqjrY/UhhszZ+Vx1h+3lxUBpwXcvg6
         XVib06UhgQJZ/GahjfeYRg3DXRB/s88DDpFDxJ6qHtJ0l/ysFPA5d3PrXVnbxxJ10lKp
         7v/qZ/3/5dKHGr/4h/YmMPkKseZ/tZCTvcx+GZsSKyN755GQXFxAJhIJt3in+iVKXp6v
         ajdfdjxUpjkQ/7lyzUBhOJWdJOnzMCSM5aZFvgwtcUzsYL2zvvHXJsPZSpXanUwEct/+
         JzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769638634; x=1770243434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LiSPXLj4QSiN5MSKstEEgtaGEF4LVNZ0IAEy6B5hhkc=;
        b=ZDOyRLprNxnJ/8yL2JrfnKkluVKVXQCwFBRPFaMUhcAWkj9xAlAbzgvmEihSxwYNRg
         5abNucqwtG1w/D9u1aQi+jZYvyEx13tQ9uLvmcsRAPtOpsq8l0KIrlW+hOqPmt11srSh
         RM00p+BNVlea05WccSY3kk7aHA75HtgxB4y01Q1DxG+zQzWO1OGiUuBA32oNR2dthj3U
         6EBdd8P13hXejJka3bwDtvibvC3nMA0/VwOVkyBmnvP1vSPv8fOyg5t2gwU0cwQy+1oB
         lzF/+SOUzVn5ucoOiH9du49E4A4VPJNu61TpWcdrf90BjWGvqRBbuz26KtyROux2S8Gn
         xCsg==
X-Forwarded-Encrypted: i=1; AJvYcCXFC9LE0JUjWJOoNlbP4lbwY5Fs2CNWbtjjhsXs98UPOarfpS6lSK2VDAlsMw1rhWHwD/ejbecNnXuu@vger.kernel.org
X-Gm-Message-State: AOJu0YySDgnsGIATPwWFsepaF3zg25tJV8oIoadXjkJnnmSBObKS8SeR
	8ollqhhWzpRAuoW+8s9Px4Iqq4dnmXkIpACkEgXsRUNml2+wL4OL8yiw3ZUtnB62wm6XWV1Ap29
	JMCJ7oKjwmuyGMDlphaeC+xD4G3LXgqESL5fPj43tyr/g3G3ogIJDeVOTV7B/7Byd
X-Gm-Gg: AZuq6aLDwQPDhQ973qkYwDn5+ZEkz0+vtHxSbLbcDzdM7xuuhkWG9ZTdyIDNVI+F5AC
	9Pr1BOv8wCKo//tZ8nVtlGe7Ajt/SJqnf+J9jc95rPorraaBVaG/NMCvLMJUg/bpcBqq41CVwmW
	BDoZaLW6SHQxqtKg9mGoMwYhrW12Tiy73L4vmYJZfcIZIQky/T79PC4sX1MmtL8x0AnbxRBRfuI
	NnxVO4drPe0dZnIjMjDNi1A2+He5znkp1Wj2HFTvZigGBMeVzynhPbd6u0K5rHPzpL5LNBebvP3
	q9uGAHFqcRtLVlMeIw/lr9UpD2Y76q/PegdU/0XsoKfQoHMvEV8UkYQwrnqj/rnVY+D33a857FQ
	pJ8C3wru5cFQBWc0hE55/o5UGcRRq+m8a7rPUeUHgQobHjYfXb/oIHaprXif/VLBOlKua6EYiaX
	/kU1Hvw7JZL0bv18va4dg7xYo=
X-Received: by 2002:a05:620a:bcb:b0:8c6:a213:8fe0 with SMTP id af79cd13be357-8c70b860766mr819708485a.23.1769638634536;
        Wed, 28 Jan 2026 14:17:14 -0800 (PST)
X-Received: by 2002:a05:620a:bcb:b0:8c6:a213:8fe0 with SMTP id af79cd13be357-8c70b860766mr819705985a.23.1769638634131;
        Wed, 28 Jan 2026 14:17:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625fbd154sm5748571fa.43.2026.01.28.14.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 14:17:12 -0800 (PST)
Date: Thu, 29 Jan 2026 00:17:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: defconfig: Enable LPASS LPI pin controller
 for SM6350
Message-ID: <44ar6f64zneh5ix62mjtwycp7np4n4fpabynftrpb6yev4qshr@lopazp22g6o7>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-5-36583f2a2a2a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-5-36583f2a2a2a@fairphone.com>
X-Proofpoint-ORIG-GUID: wFv6TtS0sjrqkAvEYOtzRbwMVO8yWmPL
X-Proofpoint-GUID: wFv6TtS0sjrqkAvEYOtzRbwMVO8yWmPL
X-Authority-Analysis: v=2.4 cv=b9G/I9Gx c=1 sm=1 tr=0 ts=697a8aeb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=gLsbps8-TBLE9aXLRz8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDE4MyBTYWx0ZWRfX4NP+1qJcm4yJ
 5foVS5skM4RmZsZQuDAsKdSL2e/C9ykcjfy5dAohcyh95AuObInanzbrUHIR6UcE7DGh6mP1i1i
 BxizX1Qxhu2nEp96Qqu4QbYN8f8YLkkpeq8j+Unp4jJT/nVQW2cRhXmnqfeXfH4gI2ztA/EtBFe
 5P/wgBGFkrdpfpGTOskcFqhQUQLNezwSl1qtWODZSdjNmeEP0uI9twljRca/Ddo/GYFvNet3uNt
 OdumN1txkP4ZogABGWJ7Pa/6x+z3Gwq6cKqG3nTHSdQI4RWz7fWNkNn2i0IJfp/+NVZDilZKWPj
 UJz+LpZziOGKn/gAQc0VnGF7st8hdFgcUK+/C52wlXoTEUvmRELkdK+9sRK9whWUSLvVqPsJ64b
 kweDKTsu25MdDsoOLLnj1GPP1LDUQmc/OPE7kb8cuHArgmlEl0khXhvncYHkxNH9zU2LhsBMS+J
 55ojlcYWUoAYdRBUKqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280183
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31259-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01912A9806
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 01:26:53PM +0100, Luca Weiss wrote:
> Build the LPASS LPI pin controller driver for SM6350 as module, which is
> required for audio functionality on boards such as the Fairphone 4.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

