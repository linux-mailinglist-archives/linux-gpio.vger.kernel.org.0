Return-Path: <linux-gpio+bounces-36235-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFerHD0d+mkJJgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36235-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 18:39:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 521D24D1770
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 18:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD084301586A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 16:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E613B492515;
	Tue,  5 May 2026 16:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+F8y2Fs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VuMFEPFL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E5D4921AD
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 16:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999153; cv=none; b=PUSyQEWgqy2kQxyX+IcJOxbwf4mLcUlva2ylKqDAVpUl0GhLo5RELv9U/SK/bxYMbBvbEuddSqWjylSZd2EZ7dVVhTjz8uy/8lurpGLoJfVMsR6SNosFnpVGBa2tTtlKvE7wtBuXnI0kRZK6SzxlbzAaNI3LedrTaCiXrpFkWcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999153; c=relaxed/simple;
	bh=xyEx4G2wKir++EItxT2osj5+hfVEdh42Mr6R7Zl3tOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLx2ukil7lvUHp0hnfu5/4XEfBtPCR2MESRrbmmQLi0kZ05d3Fs4kUqA0ccB9WlQf1+iNXB/Bssb+zZCdXOdazB+4zl1ehyZInyksbw8sL4yJxMKIksEW5va8RrCG/CK/Yi3KVdX1O30bFHuRMRwM7uaoL1FkzVPYVTkjU4Eli0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+F8y2Fs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VuMFEPFL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645Djdkw3501563
	for <linux-gpio@vger.kernel.org>; Tue, 5 May 2026 16:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kcvBYxHAlvNI6sLP0AoxikyR
	e9LehpKzs6txgD8Qv9A=; b=M+F8y2Fs4/hg36XqYjUZ2aG/CZNEeOdd7UKhLo9j
	8Y0UqL088LknMkhUQRRyzARuoO+oNdGh9YxrOOAxY/U7s1HsLB3jq8q8b572Tqb5
	2J2XraWuZBz9LdfA9uEUNIDzVwbtTmdX/TNaSRaMM6PHAW6gsR0T2etdCqgyjR9W
	OtKYqNDll3aDE4gWGrusBKXkSTVYtXtVbLt7Z4gD7cN8n6QH/CpYQCimZn7DQWrF
	m3GQg+lAgKMKOaKN63Lthabq8F8NRozdfQsqR4fdsT1/DalMjesfDByXRSWYZ8Ws
	d0ZxdzHiQipQdq+w9AFeL3epabsWRpQeHSAmWpEXG/tBww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhqf8rpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 16:39:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad5fec175so73832935ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 09:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777999148; x=1778603948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kcvBYxHAlvNI6sLP0AoxikyRe9LehpKzs6txgD8Qv9A=;
        b=VuMFEPFLEnWQfKlZNxTOy21MJ4cTuCEYI+jFFeGNEuyLcV61JFa2+/bg5tns4qzngr
         +V438+52M4/+U12YdSyhzaytn22IZ3Ca5TNE089SIsSAMs4YicVY1RGxrW5ki5xmbdMZ
         P5BHwB+e3rXSdElDvbIYTJtmC5ixF6zRKor+UYDFWgBRY951cUmuDXnSEAGHZbdNVOSk
         y0fOQY39aHi3gpRKiC0JWq271Ps1eER2XrDly2dZ60B79naNbPkMJ0QdOndwIY4I8CjS
         EDA2SliByOW6fQpnoY6tBsUSjmS1kSa+xcu9JPyrpzsG0QCWT/modDBSGCppXq2yKveV
         S1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999148; x=1778603948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcvBYxHAlvNI6sLP0AoxikyRe9LehpKzs6txgD8Qv9A=;
        b=N3O1qKXk58CEC71RUCASvxGTkfLUR750CahN2BAhKzdPlpNRmGCaEUgjHxo1uULubb
         s9wpWn683rX+vVAIZeOGRwQeYBgoE9IHUafxkbr+ALpb2W62y+QVQKqkq5gNRn6660To
         d+qzq7Oj7P8Gp2+k1UCTHu/r4//rU+xIHR91kKdr4clgblx5RJ6wMH7gWePxkUzjYNeo
         gxOG4LhkxZZXXRgZQvMJfXGIYhFzdzn4IfjhSeufHsH9A9/0/qPEaFdTAHdxpS3u6ft3
         B81yUmucx7ZaC2n5/2eddeLO/BCZXN8Cs9k485Jy29Dv6qWkQCSTirKc0RHF+/4vv/Zg
         i+Sg==
X-Forwarded-Encrypted: i=1; AFNElJ/1BBoo6ul9V1mOSX67H54QwNF/KJXVckSi8Af6DjrlH5RAKltPWV17kx6dFT9N8XMayUicwKn275ym@vger.kernel.org
X-Gm-Message-State: AOJu0YzZWvH5LnEL6WGi9a3QbUSBOIhObex9d4tsdTFkIc1gS+mo3SIA
	9cEgiO0Hojui0vtAY5UopAW9YB0pYIiVuCM6GU5JY/HXiPChpMUAIk+Hgi510Z5jwIbFutE+710
	llanNEWcqMpe2lBYLsMibOlPX4kHqP0q01Yes150PAvLARDXWNwx2hc7bNE9iE2NY
X-Gm-Gg: AeBDiesuvmXtuy20SehbigoFGAHW7qB9JyEaL0iOmEeFuAm6egpEjCi7sruId1YgzCX
	/HyH9sul8nkToL/ut7q7Or8LJ1OwSphJvrOIFIqo0UQcAA48u5x45yxqnjP5aT1DGDGDn7LfyuF
	NCiGoRIbGbJe2MggCxD7pGC/VzlsdjMqA7t1G3GzYTPIaZJAfjt+hPcGU57ya4QPiy7+bkJqX1A
	01qJCd021riN6pP7jhb+TEmOZcumGvW08di3iEdOLv937v5PFC9FPCLlupQ98hnFFXid0OaQUw/
	6/YVRbSlNL51lSctRs7z3nkDkQWSIRVKpoJe/AtQQzwZK8gNdEBfcSYQwiOppi0fArpboSktp87
	ZxzVsxZiuT3QBaoOy9Z7QLBpN1pGg88QRUSFf4tJN/HVq3Q==
X-Received: by 2002:a17:902:ebd1:b0:2b9:eb6a:68b5 with SMTP id d9443c01a7336-2b9f28348efmr149463225ad.38.1777999147939;
        Tue, 05 May 2026 09:39:07 -0700 (PDT)
X-Received: by 2002:a17:902:ebd1:b0:2b9:eb6a:68b5 with SMTP id d9443c01a7336-2b9f28348efmr149462845ad.38.1777999147261;
        Tue, 05 May 2026 09:39:07 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae15fb6sm148392135ad.43.2026.05.05.09.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:39:06 -0700 (PDT)
Date: Tue, 5 May 2026 22:08:51 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
        rmk+kernel@armlinux.org.uk, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
        gregkh@linuxfoundation.org, Daniel Thompson <daniel@riscstar.com>,
        a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
        boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
        chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
        julianbraha@gmail.com, livelycarpet87@gmail.com,
        matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
        prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
        rohan.g.thomas@altera.com, sdf@fomichev.me,
        siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
        wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
Message-ID: <afodG9uuopgfvSmu@oss.qualcomm.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501155421.3329862-11-elder@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MCBTYWx0ZWRfX2WKVusSCOcNL
 dkrja2qFS2whh2RghCHSKhShTDcFsopqAZwWwEO2fhPJpSmBeCTk3xHbKL/3kfo0y23zFN3/VON
 HebmXS7SsTsHSqwgOcO6rAWb0hKY7tnMse91NC6xslXVj8JRRimoBbGXREfGJUJlDBIwCfuGoue
 Vqmu+ekfmxxlZJ61IUwTFx9f9N3UqagEIRsyHt0llsCgZH6ksM2lN2vsVPBa/4CXlO3rE+Hx+Ce
 SAaTPtgy73/jg+VAx6mxk317mBtOsbONYG41YGzvfJWTSLp/6BYd1LHj6X7kyqp9GfZVae8/8+X
 vCMnAdGtOMgNA3AVZftB4yzBhSEl/Hf7MXjNcbuSGfNKGGQmi1+R+C1F2frbHiWxLUedFfNt7lm
 5KU/4T7vr+oKNJjs0em+Siitr19aNjaos/0/lm7JdS5V9q63nD1ztttYLTV30LU3Vad0DGLoGA9
 fKHgDNL+A06EjoDYCWQ==
X-Proofpoint-ORIG-GUID: yN-Q-TH9CqSO4dEh6THXXQym7jMycpLi
X-Proofpoint-GUID: yN-Q-TH9CqSO4dEh6THXXQym7jMycpLi
X-Authority-Analysis: v=2.4 cv=NPvlPU6g c=1 sm=1 tr=0 ts=69fa1d2c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=YOnX06L-6IeA1UCcW-kA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 clxscore=1011 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050160
X-Rspamd-Queue-Id: 521D24D1770
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-36235-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Alex,
On Fri, May 01, 2026 at 10:54:18AM -0500, Alex Elder wrote:

> +	/*
> +	 * TX956x has 8 TX queues but only #0 to #3 work for general IP traffic.

Minor typo in the comment: I think you meant TC956X instead of TX956X?

> +
> +	for (i = 0; i < td->plat->rx_queues_to_use; i++) {
> +		res->rx_irq[i] = irq_create_mapping(irq_domain, HWIRQ_RX0 + i);
> +		if (!res->tx_irq[i])

Typo: res->rx_irq instead of res->tx_irq.

PS: I was able to successfully test this series out on a Rb3Gen2 board.

	Ayaan

