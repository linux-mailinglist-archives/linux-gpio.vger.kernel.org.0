Return-Path: <linux-gpio+bounces-35458-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO29G8Ig62lYIwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35458-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 09:50:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE61945AEBD
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 09:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B5D0301545E
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 07:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA4A317162;
	Fri, 24 Apr 2026 07:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ondEj51r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3KoMduX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D231A6824
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 07:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017019; cv=none; b=lq7hF6paXGY/q+9dzUAMGofWv1BpWye0KI+SpGPwDhwZeddKEwwA5XrijzgLGbkD24jlO6QVvh3QXWup4p5yOTMXJMAfKO5mdFVwx+TWnHBe1zrKKWm+hFmklb5jDkOihQmw4T3oA4NM72vZaYrjGsiaPVx/dVpjaBI4UaomQPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017019; c=relaxed/simple;
	bh=f+msBKQ/wpCfm8LM7KLBCLdErpAw2i4ZpFmFsXMNlyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LuVuml0e+VagX9Dx552ptr2CgyH3U88WoGGahJWyH0oXmP5rTCEjlAKBpQCNGe0bFQ2oMHLU+E9b1vRBVVclEVSaD9HUoywzk80W4hlOHnnfSGeUV9E1wzaDkofq/2ihD3lP3Dr/2lTRbgsSRf90sHcKS08rGJOvrt5SIy/7zU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ondEj51r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3KoMduX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O3GeUx518371
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 07:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Irma5VZ3r17WvGDWJhFF9HSsI7jbHdVbY1YJy0bVFo=; b=ondEj51rEOUvX7bM
	ydm48kX1iUap+qxEe9gWE62j5ttuq1w3gu/SJ3FoaFKely1PjUUz7GnFHnPJA9ty
	AxjgCZDBBquNLZDN1Ml4D40GZe1F4N89NkILCGqP7PgsqbyxENRq4pWk/FoBg12Y
	mlIJv+ckzVx5RACBxXAY5qHUxwCh7tXwnv9FxlUtwr4Gw4SO3XwoDNeVbSQ/YgrA
	rtm2Mrcr4ap3z4flGbL4DVil1UPI8vjSO1NtySJ+IEDcMi7qV/yMcumHYikkKiB+
	6GulWslwBAXXrVWgpuHCinaX/d+UbqJxMqBIMnAZjvNeCzIvY1enmBRk5R1gb+YM
	q/u4jg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr0fngvjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 07:50:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e423a05c8so78559231cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 00:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777017016; x=1777621816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Irma5VZ3r17WvGDWJhFF9HSsI7jbHdVbY1YJy0bVFo=;
        b=R3KoMduX5NPmeQSbAovofYrEJR93KqZM22Ti+ZhZbcdqXcFFJWHFGTbR9og0VoT/wF
         CiqCFbl1l4Z5mLbnXG6seM+C8+eFQGY1iSb1CBlF7EpWwdaNTFu5El4Erb10zTVdsZyI
         1ZZOnWqOnFAqjVUWWxh4CL9gW6ebGrCD0+puOIOdidLxL/Qz6j8bas8Fi1Sy8Xio4YJc
         ePJ3phAzIJdlwaNDYVWR/hWeYAi4BeNd+ZFlpKZifsABJi6/q4hp8Syyc6Es1Ymvqn8A
         USls+xWUaNIBgddjrJq6wq6C1O/KpZYUmZWIlqAhJOTEZi8SuyUSBzv4uOVGMeHrwO+P
         KThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017016; x=1777621816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Irma5VZ3r17WvGDWJhFF9HSsI7jbHdVbY1YJy0bVFo=;
        b=V8CfCZCgMH3aMSRM29JgQo28i3W9v8jxDRF2lA+YpLmdEMcbUYoILgU6LJEJRF7wvQ
         5c3pqfG2N7ESyGxysfeJWqEdOKKBGTkq362RzCu0hO489S2hQS/aN+v6RoeKaRrR5V3L
         EZPV7PolMYm7thJWblUWlLYhbRXGvYjFHQWHJnlQN/V4aJyvBBdGn1ouoTsxuzK73NVG
         iFYkCPgJSDyChXcETeQsLsMc+1ZLvjJwPIEPmq+iCcLyMCadlQgJkUru2pHNOp2G68gH
         dLF++p65Z2GwZ+ekL0nytytGAk0s72i6KHxijxnGUT9B/qd7ENI6xDTX4DZzws+Q+J62
         dkvw==
X-Forwarded-Encrypted: i=1; AFNElJ+3IJ1ral/q54RENPYBFEOUyX/92SCqt2B5UhIfustiR7sSW6MZ29MvwyXZGdqoC8ftswn8aktR/s/q@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi/8XAZRnRuzJc7bGYxje9mrjI2B9GIvHjNOmLqtxowD1n2W4c
	i7qppge3NQ/a8wdjWqADyLbp2B0aH6T0bJql39AbAPDbcUzUHHcTvJtWe9uHjS8she6Ap8dTGtQ
	lDd2i7/uKoFutn1R94P1xnYXrozgCxxKcBsX1ULDnfXKsbRrIQdnFRw1TyVCkedjT
X-Gm-Gg: AeBDies+/d8SiMPZg4K8RFCfhs3wwohkr9h/joOgMx3r3ypZGUx9vlUHDlrdZyllTcO
	74R+VqyaYLxijPKvkJrlUlGD70cVOBKaY3aLbH/31aXP3crTjuCBGz0+I7pOYv/saphwSKyOVVB
	Kj6oHJC5HHaK2MO/opH6+Idvy6vksOqVjXc/VVSE12j1THTrgZg+tK9LF1c/YoZCQomTsuwwH66
	TuSWiAaHUdp2IOtKaWXuZodyvWPqUqx59XSEE8h15myMqHjJEdmK5S5uTuz/P54B3Ky2N6cbEKl
	APpB5U70BIPk7S6RgfCQ13M2fPQ9ulWt3Rk/SA+cEJfBW3NfEgGXwc0kSuI+R+5POiaJRVxoDfK
	4Fc/DKouROf39R4/A2BUura6rY62aY8HNPBEM7688B+4z35Obj/gRdkGLsWf2
X-Received: by 2002:a05:622a:15d5:b0:50f:ba60:2dd4 with SMTP id d75a77b69052e-50fba60364cmr169042221cf.40.1777017016505;
        Fri, 24 Apr 2026 00:50:16 -0700 (PDT)
X-Received: by 2002:a05:622a:15d5:b0:50f:ba60:2dd4 with SMTP id d75a77b69052e-50fba60364cmr169041991cf.40.1777017016090;
        Fri, 24 Apr 2026 00:50:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:35ca:88ed:3f2e:db28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52d232afsm96029485e9.31.2026.04.24.00.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 00:50:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] gpio: qcom: Unify user-visible "Qualcomm" name
Date: Fri, 24 Apr 2026 09:50:12 +0200
Message-ID: <177701700896.5488.15804898915252044204.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260423173553.92364-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260423173553.92364-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LfYMLDfi c=1 sm=1 tr=0 ts=69eb20b9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PkszcvWzcGkvcTmTrJMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA3MCBTYWx0ZWRfX1YttJ7W3kCle
 zAaNSu8ZLhy9k8EhTBfzZvOzkSt5nL4qObH8JfKYb2rrVI385K4962wmTf3SIxcHXtOAUav1hU7
 eQ6Tauom8RS5ycVPpXcLgKPiwUpuaWr0ZfTd/qfAwVPE3HmsGNvpFGME4RUcTkqu5uk3HefK3Mg
 SZIxrGnS43OAa4eT1Z6OjSm9NuUb0FSWr0ArBGr72sVP19rX6ABQChjPwCTDAy7I3mxo70YXaSM
 Pefjz+aeVQmX9d25rY2pKoNQz3Orwvj7dpW5skrKIo8kiQttmcfVM1E9y4zJ+VI5i/RrtlAmvVF
 Oza7SHdGeGKOOmUOi30D7NtJKb/xv0WDI2JZjifbyvWFlpJLRI6bXUTRjhOF8qJkkb2rANbFPAK
 l9vPg9UZPEVOFen33oM8G3xrN3p11O4WePqBwtSsCv4CaDj5QfTcmp5gZcaTLnmmRi9ag+8JuG7
 tHjcH0qgxTCiNWVl5bg==
X-Proofpoint-ORIG-GUID: fOwrv8CBAMja5wagXV5dpaDmQGRroYiZ
X-Proofpoint-GUID: fOwrv8CBAMja5wagXV5dpaDmQGRroYiZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240070
X-Rspamd-Queue-Id: EE61945AEBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35458-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]


On Thu, 23 Apr 2026 19:35:54 +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> 

Applied, thanks!

[1/1] gpio: qcom: Unify user-visible "Qualcomm" name
      https://git.kernel.org/brgl/c/6d22fcf85e3f089e5096812e89b742dd726aa7e6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

