Return-Path: <linux-gpio+bounces-35286-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOnbEmkR52nL3QEAu9opvQ
	(envelope-from <linux-gpio+bounces-35286-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 07:55:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D384369D4
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 07:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A67433007E03
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 05:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B8033F588;
	Tue, 21 Apr 2026 05:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVeNUxub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aroRNJxZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D148833B6E8
	for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 05:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776750922; cv=none; b=ucdteFGN/bNFSmHDjJoU+QEuURfTp/d1Gq8+tw/gYqXWvRj2xr1EYv5Y0FebRhmoM+O6ctKuoJqz17CcdRUcfA/gkTzXcTRi2AM/11x6k//4VzB7qTkvr1CIbUVC9xc5uAx+qSEEc8YfGnhd1twbAsSg+NeKiQLXMWolbBFLAnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776750922; c=relaxed/simple;
	bh=DwnoIcrwC48DuenKHaAGt4VITzl0FvYLmEIst6/KvsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wz9gXt3M2nV7eQyv984dX7vkuPpPY543bv5eBy+kRWe2VyKVQ4h0cTVXBqTvYMqcMaojvM7Q1PuhVhJkV1ZN3IIbCDCgS6LPta7dFRXs/8yosYZ8cxeAI9IH5N+0Q9GlUWYrMN0deEiIoA/75YkW2dftCG4+OYIlkkMOgRna1rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVeNUxub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aroRNJxZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L5pKAo3455879
	for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 05:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZLmjUEMZaBOEwk91cxCa7Dkj
	0p1g4V0BPoDXZ0mMsMk=; b=QVeNUxubskdrZqCWL3n1kz1kL5jOjSaiPtB3pWnE
	kVJ60PWiSwI14o2PjuT0a9TcwEmqMNhrmOoLPlRVDgGxLgFm++gTxcLlV1lseF40
	mkNlMSVwpbX4Hhj6Xd0F1zUk500+hY5BanH0G2FCqC7wziD8h7UZNOH6iArWqtqg
	m83mxOmCqStHyEd4j7RM5BEXZoE+9eTWjjv96LoZ2ZxhcyQ7Ig/wkh2pzTT83Mx+
	cKkXZn4v6xgyuSpIZ9tFIydRmkx4hUj5C4WtPwm2jvouOVosmWUfOGEa4I0vDEaf
	0Dn4/GrYEauqFRpO3iN/5zZvmjt41rLbMyMB+YskCV4Hlw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjvheg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 05:55:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d58bed44aso59554141cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 22:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776750919; x=1777355719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLmjUEMZaBOEwk91cxCa7Dkj0p1g4V0BPoDXZ0mMsMk=;
        b=aroRNJxZsgGS+P3mZw1Yfv6lvr6t1ozx8whZMrw2hq40gPGNdsMayEdphf1Jz6AMFk
         Jq/2RNwYFsYO64VPgAuho1GKViv1duTZsG+iBOemze1Xfx29tTakHXCoEKEdq/h3dyVB
         xAH+/1KNYMccaJFuql89JR5o6eR6d1QLVfCCrC64+RrowzddM7OmUNz78s+KABJBVTzj
         b9xTRHWKv+bgKuMe/FhZvuxTmDJZ7Lstmr8w5vv42u3R2/y5zmjwbThpmkGXw3aDP61l
         H3ieOYm7OJ7t8LrbjW/MdmmqcVQGKPzXf+5M5FOcW/HYXjJmw6a0MtzcDB8sszJw3bDI
         jAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776750919; x=1777355719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLmjUEMZaBOEwk91cxCa7Dkj0p1g4V0BPoDXZ0mMsMk=;
        b=jPp0jjfwzt4ufPTPV5gu553GroMJlJPS0J1LAbiC9Am/FxMmBKXK3u+DykaT1rb/1K
         A4mOtpFrLpgBjttS2BkFosYmhGjA89G/Kyc3/Gg+ZGj6pkcxAQmp7csoUnPJMNowiQeO
         IXd4qRnWvXskIo+6MM1JTzPC4KzyHzlfqLNdeJgsGiL6B1wPNOpeEDs2nIGldw+yuSab
         Q1b+vOYJN2485nhDXDB2TSZeW6xLTMx6TYqiiOdqyjW67GRhqBK6YvvYQ8NoKCtnuGjE
         1gHyMNKofQhssP9AY6a6JdV6O7tFuGF9+Hg2J88BVGbRiuAOBISUhwd2kTu0vM8I4jlO
         dNjA==
X-Forwarded-Encrypted: i=1; AFNElJ/m3ff6MPn9sFvjv5H/LDCVC+K0VticNHjPwqDrJbKgclaaswVMgiJikCkwe7+5muX65Im7wchZm0RZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxOSwbQrfItNXbQLG9ZtQ1kDbBdXwJysoRbbwt1G4+debZvQ0nn
	uRnl16JP/7NTZTbtTU6u316gH4peU/2FCjE+sEI7kHUllLzJ8h0eDST5JeNlBatZbS4tPNYYlKf
	UzFC6Adj1EAYJP7UCurj7cENt2fw2FcvvOyeWM7apZLhk99Lq9CQvyCLl3OYLMSqH75Y3ty8a
X-Gm-Gg: AeBDieu0Z4N4U27JNosYIPcyHPIRyt8bvdwIER6qkJFi0jcv4Yf5C4uH28IqWFSfQQU
	f0azgXrd0HZBWGjHV5tDthT7HLogzp2MdULRcCBDJEGE72wiCAVgTdZNXx+V4Xl3pFdqFW/OnzG
	HwyHI9gHarLE6oC/qvZP3hIR6TlDDgZh/PLcpfMdzPuB8SFEYjFS2TH8dj7hLrMOVEVRRkfz1jJ
	WFr17R/36Iib4/pwWv3Cr1VC2TE8HF+A/JfAB7If3xeAjB0BsIo05zuVWjXXutOn8WcpfsM+cJj
	kGS7w77xKkPRX96nTo/8cSufIYT5vb1W7Z1lsBtE0onsmfMofs33FaA26bkFA0DNY0fKkXtdL/3
	F07jUZj3fgSE0+C66ABuNJOWkkDEFerQ8ngzgFeTmTRf+cbg=
X-Received: by 2002:a05:622a:1ba6:b0:50b:1e5d:9930 with SMTP id d75a77b69052e-50e36eb86f4mr249982741cf.58.1776750919053;
        Mon, 20 Apr 2026 22:55:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba6:b0:50b:1e5d:9930 with SMTP id d75a77b69052e-50e36eb86f4mr249982501cf.58.1776750918542;
        Mon, 20 Apr 2026 22:55:18 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1249sm31437198f8f.5.2026.04.20.22.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 22:55:17 -0700 (PDT)
Date: Tue, 21 Apr 2026 08:55:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: eliza: Split up some QUP pin groups
Message-ID: <iksogquo33tsza2dlw2dkkb3siei4zubhtedjubpnvtmuqnwda@enqxfehgojjz>
References: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me>
X-Proofpoint-ORIG-GUID: NveXt6Bk2uo-6h_PIw5UlSxXwjmSX9p9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA1NSBTYWx0ZWRfX7Ghr2CFg15pY
 pNEFWyXvGZVP9f+YhUG5FKkcbNjKWTizU1JxcIRw3aOpLmTyOh8xJzacUx5mmGkx/jDZF3b4ZqY
 bY+jTt+4GAh09f8asGlHZdLtGrvKVQpinEiNFKsDbSSx/kZUA863S+DtgYsMHqR56BhLd9pnOqp
 SrsmuqePSUhyNZgv2XWH267n0SuNdlihSX5t2kp4kyZeCVqMO7DJf2i/h9akC4Zo0DZGXVpNKwd
 EBz3DA62e72KLw3QDXEoaMPNy0mJp0hJxyCCjbm5fG3NIfqpAAg5MgdZy7kKR9SyWVF179PBxHO
 NGuKbS3a219MS2sJsf7SBUeBtZJ7nRIHhuL+oITVORx+mvYgUWLBF9IuDZJHDLL7n+R3GQBZLqq
 WkuqEpbIN6/sh2cNG3QkrOvtlJHqGEmsCJBJvzkoSy7Egul8wu6qTl9KR/U4Zk1nSlE1XhOu0rs
 90VG54xTe9ciTkRXBwg==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e71147 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=-5iab5_emSoejSdK0CYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: NveXt6Bk2uo-6h_PIw5UlSxXwjmSX9p9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210055
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35286-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89D384369D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-20 14:27:46, Alexander Koskovich wrote:
> Multiple QUPs have lanes that can be routed to one of two GPIOs and
> collapsing them prevents devicetrees from requesting specific routing.
> 
> For example, a board that wires an I2C SCL line to one of two GPIOs
> cannot request that specific pin with the groups collapsed.
> 
> This series splits them up so devicetrees can request the configuration
> they need.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Nack. That's the downstream way. In upstream we group them.

If you want to play with the WIP bring-up, here is the tree we use:

https://github.com/qualcomm-linux/kernel-topics/tree/early/hwe/eliza

Qup nodes are already in there.

