Return-Path: <linux-gpio+bounces-36013-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Bt8GbJN+GmQsQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36013-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:41:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D234B978A
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3309130134A0
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 07:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FEA303A04;
	Mon,  4 May 2026 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XoaomhBi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZR7a1nXl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30AC2E1C7C
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880433; cv=none; b=JsAJ5cpYhlPxic8qty73H+l6Mql5Rj38kkU2AVtmJHWPNEbjBL4Exg1xasLmsWfKsYg6D+mVrdm22QJhU1fT4uJaowv8gLTewisEEWVn+9gqTMPz7KJtjBey8aBHzMXPQ/2qdGSxSiGs2CdTq1LeHcZzAUsDmUupt7MoBvXQUsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880433; c=relaxed/simple;
	bh=CxHY4RvIZsFVhZ+sfhFRyOxtKsGuxa202wmwVB50kfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkuS1aBcGvjQYlZdymp6bw0IDwp6CtS2ZzidKGEMM4SxB0tFVqJvBJ62yj9GRR3E8fDDPJhyLZoIyxzqfze5Nrgc4RjPqGmIGQbN7INxRw99y3kmYiTp4qxOgbU09I1p4WfK4Cd9JmLCSDfoqDRIIg/MOG96n44jh0Pkb7yplBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XoaomhBi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZR7a1nXl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DCYT4174294
	for <linux-gpio@vger.kernel.org>; Mon, 4 May 2026 07:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FwIM1jl5XWC+65YTaCeocqS1G1wiQx57VLQE5Vf3BN4=; b=XoaomhBii6vH9AqL
	D1IMpS8AEOAFl8pbpgOoft5D2QxekEvTVYC/iMlgyDaCZOY6153eEmRxIH5CiPwI
	WIuJ9AF1wR1KS3AiGm6XpZ5+qAtRrA4GDFnizPStVshUHVjkLEdBAI1zoNllPqQY
	i0tPlv4tOyth2RQdpbrRbPq7C94lTTMNz6vLC5JLQE/qHJZNm6Pz4G0PG0mzPA1h
	MRPrIdmRb7qkhshtoITuuQUDSGMBARjthU4BP38IOqQkGjOOKnbI2OA2VQ2hZw73
	7ylxoOGy8UHoN/eQEGpobrQIOzJicKlK7YoU7HhOVBc1QjGFa0TXZbHX4d+685Zh
	9o92Bw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9n8cnqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 07:40:30 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5751831fe6dso46854e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 00:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777880430; x=1778485230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwIM1jl5XWC+65YTaCeocqS1G1wiQx57VLQE5Vf3BN4=;
        b=ZR7a1nXl9i/4+jyXKzvEVd47QT5COUQXqnAMhafxBn31EbXS70Xci1npYPoHD0/l8I
         5U7ine9kSsnWqHtK5nW2k9zcafIDWVEXFirGS65pCUDZqG+CKN3T5NZOCORCSJkCU6MF
         p3oDX/2Q7WExmEIPCVqsp1k816cQW/9Ixssrf4Es4Y2A/gM6TNBOW9UvsaI2BSqc24+6
         2bxXiN0maRRIxkGol6jyfZe9N4Q2tdak6HFKmWThbXFtUIvPFUFmDJClgH+X9Sjpt3sQ
         +zUMOjePPUrZDXFLa4UYSWO8A3kkYZ7V5NUt7NkDu6BA6p9Ow4mVRc804MwV4DJ24QTf
         VLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880430; x=1778485230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwIM1jl5XWC+65YTaCeocqS1G1wiQx57VLQE5Vf3BN4=;
        b=AlEfj5CvOBYkv2yDs3B6bxOnGGnmgrdx4M88ttpwsSwAte5BfdHLy2CpzYAG207NSg
         efq2qCegiXnVfprG2ITcr3ocB2D7hGPa3OH3eiD/74+JfOj7U6Mf20vlDsvNLyC5N9GE
         R7Q/iQ8o8JQ4BVkW9rvJOP80FGgseC2piF/m/t+d7YXjGCzMFl3vGjo3voVAmFEpz8XU
         fN8TPYS1ePy1aylqeDZL5/wXSY1Y/n0q66n+c+5Ol9RXUNxSkjzl7KJSozVV5laFj3Pz
         vmKU41HsZNjKeE4eW9cpfFRVaMJa7BrIeQ9WRJZz+lrF1/qlMX/nKBY1ouQH7qU6xBKl
         uYdg==
X-Forwarded-Encrypted: i=1; AFNElJ8GrZgiw6OQYOYh83+8h9mDmBprUFcKraoirjd3HRb5p6DplOgK90fWb7NLUNoMfkzPBoS1ciEgrmyS@vger.kernel.org
X-Gm-Message-State: AOJu0YwpTaqfjflqBYPdqk/xCSQtDBd3nTtrPtpvM8F5UeVaJRbiZqxv
	cdWLoI9nNhufYHVIZw/bNq8Khluje1igVePTjbFgGjqt6l4mD0BiSiiuT+iKpKZ2QOAn7xYzGbm
	JvEzR/8Ecsyi5YrjN6lnNVzfUOkT/VIZiyJNvG46w3GHkmEjnSE2TFom/SD1Qf2z1
X-Gm-Gg: AeBDiesjtIRCiUx8cIcCVV0rzZVDqqzTu5Ao6R1O0rQPFOWT/5n8EnzoK/tumIYsjIy
	XUeD9UZjdJthfFtLmzNW9RfhDk5WyxKLEu6WwIefzRk3QsoV1RVXoUjx49VyUgleGulCa4zqXvR
	YB/zwxX++nDUjcQud0HEsFX3kvdS9DpJie+/SyTxALzJZb/aIyPctUyR+bmLFecpyxp2/Cb8aDN
	EkH8VO4T5MRlNInRfMFKjhKv2UeIX0j2erB8bmq5bLriU4SXwnqPi5pWfxKf7OkQyIb8zTCx0TW
	dRiHSDH7buM62HTivgULWRyuJTC8QlcT5ix2xEWjS0id6/3NAC6HieyZvd9gXQfe9COaBiOBG3Z
	hSNZrKEykpJ7jhDXG8BNKzoW9nvztNHSA2IesB5nX2UkCw8QxosZYW2pC93U8g8RbO1XqYxVKGZ
	EWHDw/XZLAi99pEA==
X-Received: by 2002:a05:6122:1216:b0:575:1954:4396 with SMTP id 71dfb90a1353d-57519545c81mr773079e0c.2.1777880430000;
        Mon, 04 May 2026 00:40:30 -0700 (PDT)
X-Received: by 2002:a05:6122:1216:b0:575:1954:4396 with SMTP id 71dfb90a1353d-57519545c81mr773066e0c.2.1777880429549;
        Mon, 04 May 2026 00:40:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc20825b337sm93249866b.23.2026.05.04.00.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:40:28 -0700 (PDT)
Message-ID: <fdca4d01-eb6b-49a6-86e1-b6d582af4ba8@oss.qualcomm.com>
Date: Mon, 4 May 2026 09:40:25 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <edbaf71e-6a47-4294-a8c6-6b356bc336ed@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JDGVHwVII-ZWeMEo5HjdbCbBd3ODHJjM
X-Proofpoint-ORIG-GUID: JDGVHwVII-ZWeMEo5HjdbCbBd3ODHJjM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA3NiBTYWx0ZWRfX+szuIoqRqib1
 2AHSVrnNS+o8flOa5Esal7EAY2zuyvcPEJpdqFPtIWijQ71JZ7xtVA+aDLxBWBGvp58iNMvfJ1T
 bKY229Rtfz/NKU1ibP97fp4BGg3CJz7IZa/gO5M/jg+F/3Re7kOpuEun/3qZ2xojNGahctY0PHq
 U4F/w3cH6EDRL60R5UqZzITMWNUfwabN3L0g5Ben3sZZppQCPDBcqIQcoIDQ87gX9lCUib/Y17X
 varJNc/HYetLieGp/q9chIGq1SF0ZCW408SUzG+wtQtv+bdwgG5W8I1iE2N25vT4LB3vm33piT8
 5urBIlqyV26yT8HutmbrNmuQLL1POZSfuxsDb9ZhuxMbzVlk1p+bahATltGPs39ECbi7vVGn4Zx
 GqnW+X/ajqa4vVKZ7rDlWhmMx8NcRTZ7ftyWOH/HGOgwWzxD9QtgEO6WnQZKOTuhya4Nd+6Id4M
 vdZY2pJZwjUfG+iXNXA==
X-Authority-Analysis: v=2.4 cv=ScjHsPRu c=1 sm=1 tr=0 ts=69f84d6e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=DDlRktX6VRAlMvZBBbgA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040076
X-Rspamd-Queue-Id: 20D234B978A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36013-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/1/26 9:41 AM, MINETTE Alexandre wrote:
> Thanks a lot for the suggestion, I checked the downstream board files
> and it does not look like these buses are wired for GSBI.
> 
> There, the MAX77693 bus is instantiated as a dedicated i2c-gpio bus on
> GPIO 22/23, and the AN30259A LED bus as a dedicated i2c-gpio bus on
> GPIO 6/7. The native APQ8064 GSBI2/GSBI3 I2C pins are different
> (GPIO 24/25 and GPIO 8/9), so these two buses do not seem to be wired
> to the GSBI controllers on jflte.

What I meant is that the pins that the i2c-gpio nodes reference
are actually wired (inside the SoC) to the GSBI I2C controllers.

You'll notice that in drivers/pinctrl/qcom/pinctrl-apq8064.c,
there are bits like:

PINGROUP(6, gsbi3, NA, NA, NA, NA, NA, NA, NA, NA, NA),

which mean "function 0 is GPIO [implicitly in the macro], function
1 is mux to the GSBI controller"

Konrad

