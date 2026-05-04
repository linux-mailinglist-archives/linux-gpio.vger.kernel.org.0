Return-Path: <linux-gpio+bounces-36014-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD5yIL9N+GmQsQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36014-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:41:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB174B9799
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 239C43003371
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 07:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9BC3074A1;
	Mon,  4 May 2026 07:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lz4VL14B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2nlRu1O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C48A2F0C79
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 07:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880508; cv=none; b=nNpDS1UtLQWChfoeTNI3BE5sBWlbsiI/XhhkHHz6QWrgf4eFj3/okIb8mhbaMJaqgrfQR158nZgf1SL7vOYt1KGP46oIPADrLp/MEOC+MHr4EjhUNOq9eCXVuoy9648/2Njvq5zF1nQVmNPhTIV5zY6Lkn7mjg0kk2H36Q6IJw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880508; c=relaxed/simple;
	bh=QI33Pz7U9UhsDa9ZD1RZtVFTpWOVF15tMOBDX8QVH9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IaReicEo1ppjm7ndEmgtkBECTYmQpXLPyHmc+mPrrveD7uWzjLhzt3YXRuuhd9woAEPg8yf5pWGkGyYlz8RuedJ6rrRAO0pJKFFWa42+kS2seqvx9wN4JmeTHlLG2e+XIm4uKzLphSX02mOsuY/rL6OlLsa6RQGrw0GfMis9YqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lz4VL14B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2nlRu1O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DEj33479971
	for <linux-gpio@vger.kernel.org>; Mon, 4 May 2026 07:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8ug/Zd9gtpfs2PpGhjlFATeBOiTKIDePAY4xdnfttk=; b=lz4VL14Boq9YDRng
	2rYZveYVby4c1eOhEMWHlRcgRi8n/ZhGlFM/eJZDfrqSG4gtaW0FUTUNzQaCK4Wc
	Hn++H3iqCnICWnLVBnTaq7dRhltDY6J3Na05nQbCruDvqb3tfOuzRxztXGe1fqf5
	Zust1XExI/dWQZCMVCKC6eN42UEgBRQAVYdBqerwh6pfRbDXkHTfhNPL0cjHClv3
	4Gkw0EiHNzEVY8x1ChPmfKK0HSqy0zhnBNZ/zTOfNS1efQm51+pdcRgTMdZukBsv
	YBHZqOHRzxi8Yhx/jl9+x6aHclcmf/MItRMgaWPxGQJOTXQAozZUhEXWVDJ8LOfR
	krsdrw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9g3mskx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 07:41:46 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5751831fe6dso46880e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 00:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777880505; x=1778485305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g8ug/Zd9gtpfs2PpGhjlFATeBOiTKIDePAY4xdnfttk=;
        b=E2nlRu1OR+iIT7JDy+2N07m3al3zSifkRmI3UhEQeadxv5WESAPjy4TejSKjvLImh3
         pG2fLgY4q71lUbsIH+Ce3eZ0Y2ajakvgb6NZI6Ew0Yw2dQF+SblSpz3C1PCkeB5KXTGo
         UozOHLfJGXEG65QiZ/WSo5V9b4/LyA3d1gMNUMmI0dpyYMvPKBYJ6P2LyIaBj+PEnppU
         scrWrTzYj0/gaLg2Nyas6Dbnm5PgIoIUXxObOO8ssrjFII6f9i401yTfG4ul/8+f0sAh
         6n621hQ7eadJsRM2zycG8dFZdcRPH142HI+uNO4XSos2qdiKZDjPVUPAkTWMvfI62d2j
         ImSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880505; x=1778485305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8ug/Zd9gtpfs2PpGhjlFATeBOiTKIDePAY4xdnfttk=;
        b=h7gS5uoIaTHbJSAUH1R+bRrj5NbLsBtUPlJwopFk+xYwpRy13UG0TJ/awdd58BLKCV
         yqTZTixnvMUCVgDsxTDYPfXBWdlEKGxOFawrhWD5Zd2mjhkYo493e4vD3oJClpgBF2BN
         V0tI9cyb6PeJyh3PSlfqZNWx7kbOhCgkVAbJdvIO1T1w+NXBymGfOGsG9kNFgzOpDEdG
         lZc4FDUfs0OKx5/ol7DACIWQ7UYKD3SKPoJoTGBELBNam3lbOQ1HhLDHG+1LGNVIMYe9
         7h5GPuffo92XvaL1fQLH0zAdrSDVKQqgzhKnmzaNNHo5KB2SxeGvf0yprZsbyx1s5ZSt
         J4nA==
X-Forwarded-Encrypted: i=1; AFNElJ/5pdp6hJfusCQ+zwpwM6VvDISn4GnNxrNJd3oWT2BRIyNwxJhQpTh54XMsoztn42ZBOrW9VEjnRn39@vger.kernel.org
X-Gm-Message-State: AOJu0YymR9xjT9SWMJ9AWWRNjt9f4fwFSA/5OjZ97xAjxat/jBr5mb/u
	aPv7KDjDyFfrKy09Z6g2Mh+XSWlKsbX7xStrAld+dFcqvxZQdnrflcOErOdoetFvQDCJYGy3mdZ
	vtY39w9yC2zcB3UPVIYF81nlNtM2GCZSoJsoP7Nn5LDCF72rsc3IPj5UhJ2rBDhM0m4P7YVyI
X-Gm-Gg: AeBDieslcSp9f19e3FGVfe0+dBmJFceFudmV94JXEpyrcsTBb5S7Y/ix4c+43KZdz+0
	KXO0oJ09+pYcc6THJl+VCA8O8Q033bIovpm3cgYaA/115PrLKBNGWbasiG2ShF/Uigoum67YQJZ
	oP+jIOsA3O4iaenC1/uQGj5qGf2AtQpaEQkcxY1WYb3Eznf4wn5sNKTKIgVYinnGDm7jqnjaM9Q
	BLu2WFVd/IsPV+Kw3BZSLyneLHbPGJ8r3IeRX2CXpBKPYvbNZEa2FhW0mRyHX5l/YnA2yUiDONu
	IE5Z1ltyVGUWm+IMVFaf9hpXgTqH8EvGTSPnIzlvCK0HyMvbYhH7N2DXH3/HLBRKAhA3KITcmDt
	q95fBKWqQZSxk87TypC13HjJlQAY5uk0AGQ5VerA7ZUqhGo1s/7EMKQrcAkI8JctNpOFfbsoO85
	kmtX4RqQLxEMC2Sg==
X-Received: by 2002:a05:6122:41e:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-5750c6aa09bmr1061232e0c.3.1777880505443;
        Mon, 04 May 2026 00:41:45 -0700 (PDT)
X-Received: by 2002:a05:6122:41e:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-5750c6aa09bmr1061221e0c.3.1777880505049;
        Mon, 04 May 2026 00:41:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6da73a9fsm361006666b.54.2026.05.04.00.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:41:44 -0700 (PDT)
Message-ID: <bb8353fe-29f6-4902-9c7f-67ef61676f2b@oss.qualcomm.com>
Date: Mon, 4 May 2026 09:41:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
To: MINETTE Alexandre <contact@alex-min.fr>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
References: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
 <20260427-mainline-send-v1-sending-v2-8-dcaa9178007b@alex-min.fr>
 <97969bf9-8eb2-4498-90bd-9973fb2bd638@oss.qualcomm.com>
 <edbaf71e-6a47-4294-a8c6-6b356bc336ed@app.fastmail.com>
 <fdca4d01-eb6b-49a6-86e1-b6d582af4ba8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fdca4d01-eb6b-49a6-86e1-b6d582af4ba8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4MiBTYWx0ZWRfXyp22VCcfS1c2
 URy7qek6RQ1xYwoOTXdAEO1tozjWSwvD10tFFnSMjnOP4zso4JDk8HaHenYUZMnoDTj/j/xjXyi
 x11YUhwdqqOhfdkGvOjXvS/Shbr4sZSOW+zxaAvMWpLwT6BF5n7jJL1ALCgxnrGLBfUH1uypt5r
 bODA00VQuCBjFaYfqOi6+rT2iXKr1BZC7p+3VYlXccyaEFiuqsSYjj1Zo7IIcZ6WlPxP2Nc0pqn
 JqRhMD9dcIBUywtM3+fgabWXO/q0Zp/2zwJS7GvCV7xh7Do5/bbKgdKTZqnKz1JDcbmrgOPJ4tq
 MQBVzo6UdeTfQDWT3hjoxg7WVFcc34sn9miOUrwV2fCb5sKN1u+L6c+EipNI5pGU2b0BxlpqDkW
 aOrmhZiJBcl9vjxb8drCCV6+7H7xZBy/cg5AfvWZw4oeQ/+9tONau5qXpAq9W+693Ao4ky4GC4a
 FoKwYENSF9VGXaB12+g==
X-Proofpoint-GUID: oABlHGtqVMD9ZIXoyxD5rbLgnLrZDtZL
X-Authority-Analysis: v=2.4 cv=Ge4nWwXL c=1 sm=1 tr=0 ts=69f84dba cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=XNjK35SS1xEl92Reu-YA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: oABlHGtqVMD9ZIXoyxD5rbLgnLrZDtZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040082
X-Rspamd-Queue-Id: 1FB174B9799
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36014-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/4/26 9:40 AM, Konrad Dybcio wrote:
> On 5/1/26 9:41 AM, MINETTE Alexandre wrote:
>> Thanks a lot for the suggestion, I checked the downstream board files
>> and it does not look like these buses are wired for GSBI.
>>
>> There, the MAX77693 bus is instantiated as a dedicated i2c-gpio bus on
>> GPIO 22/23, and the AN30259A LED bus as a dedicated i2c-gpio bus on
>> GPIO 6/7. The native APQ8064 GSBI2/GSBI3 I2C pins are different
>> (GPIO 24/25 and GPIO 8/9), so these two buses do not seem to be wired
>> to the GSBI controllers on jflte.
> 
> What I meant is that the pins that the i2c-gpio nodes reference
> are actually wired (inside the SoC) to the GSBI I2C controllers.
> 
> You'll notice that in drivers/pinctrl/qcom/pinctrl-apq8064.c,
> there are bits like:
> 
> PINGROUP(6, gsbi3, NA, NA, NA, NA, NA, NA, NA, NA, NA),
> 
> which mean "function 0 is GPIO [implicitly in the macro], function
> 1 is mux to the GSBI controller"

Unless you meant "these are indeed GSBI pins, but within that GSBIn
pingroup, those specific ones aren't assigned to SDA/SCL when
proto==I2C, to which I'm afraid I won't be able to find docs for (too
old)

Konrad

