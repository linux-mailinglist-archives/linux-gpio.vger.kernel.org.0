Return-Path: <linux-gpio+bounces-33451-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IaSAd2wt2l3UQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33451-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 08:27:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D76295969
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 08:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83D11301548B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 07:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF4934EF00;
	Mon, 16 Mar 2026 07:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JlV0p3nL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2tQ6LVG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7256734EF01
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 07:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646039; cv=none; b=l6wxasHlwhLXvAgiB2iT1P6Zqc9CWL9afJQLqtBSKTp3qaW1DvM7Uz7+vIkPKGinVUk7WTftqxKVMxUl2JpVng83o87MW8Jl2ZPo+39yDWrqtnC3zEwJEoRtn6Bs6kdTwsAIgIpCRCgoaYUYxcFCTtYRaQAkpadMMH+yK3buUqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646039; c=relaxed/simple;
	bh=idhP3raNCBc9CYcTy8C7XdEy8xQz3oMFvJUQt6kJp9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Thl4mMcwyLbt/Eh49hHzwUSFkf5dWv6DnVnKXPCWH1X9KAbiaNATWHKIURYRuQdTLROA+bLkx0xUqS9n1/nJIwdLnP2ch+tk+i8p5oh4QaqkOtMqm5FT/3S3jTIFdpyjMrxl98krO+w3CkEYZ/7kgllEaboIqw6HGA6s0FyablQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JlV0p3nL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2tQ6LVG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64aDH323548
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 07:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OK1uBq1HcvaDU6l8IK1ArJBmNEb/gYGGSynId4hWAm4=; b=JlV0p3nLaJb6ZV3W
	L+WI9NGSyz0XgCZJl9CYFvtLJHBYQP4jdieJFB7ehexKdSyYlZ4iadN+rtXTOrxp
	iFoNOIucy0yhjE3uI6B7EDYgcV+W0J2tXZrCn213m71D3WBJv4uStjT1giCY021g
	Tm8Upjs+VLrWtGkYXrJRfpulNbTXRTrxmKcVnXgsmawsINWU8r6DmQ6nCVCixqgZ
	Qqqhg0aIXWi7lekGFt23MiM8cSQOTLPgceRSfl/enL8FLFZNvRRbxlVhSp6QMSfT
	FNbRqu8yp5bqtl9w3u0SyrA0iYOCE694iGHTlEzKrYs9ccJJyV4+NSTk2s+XWPOO
	x/Ue8A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qmnsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 07:27:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b059ab124dso7147175ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 00:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773646036; x=1774250836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OK1uBq1HcvaDU6l8IK1ArJBmNEb/gYGGSynId4hWAm4=;
        b=O2tQ6LVGgE08wJ6Gyfjh5M3xxcPL52Ki3TNxzYNr5oG0+x3XY5dq6VL7NEjZ5S1hKi
         HzEwOq80WO7ZSTY2vdNyTJ84a8ozqnXQf1vxG+EyQqvk8dvpsma4g0UMBFSV/sCYDZz/
         CazyyG+V/occYsbTy1ygIX6Tibc1N8ouqPWbYG/hABFkagGgA0937kW3YdSTEdQzBeiP
         tuPh3YEkvv6K+SoZV7VcwCm9VccaDwE18H5cAj3g9ZUX40nY72bZ015yFoOPuwzSOIit
         gTiz7FELgi9FNha/8AkNWkOTsQL6etoIg1NYZbS3b6nTYBcYCsDYlyWcMy6Mjlpspt2j
         WJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773646036; x=1774250836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OK1uBq1HcvaDU6l8IK1ArJBmNEb/gYGGSynId4hWAm4=;
        b=BQktxdNVTVU9C6xGu4tLJ4FoXQvcJ3XbjQiTbV7gD6pB3t129iVzB4o2XLoa1lJGyg
         S/43ebUS333bA4Xt+v8VbzMEBEfEbNwL3maucKy4uTTHmseMRKIG0tD/HDkzV5A/p7Kt
         FhlsPmoB7d04AyyFfE6UbbrmLJGofZDY/FMb/Q2VkTidujGQbIWxxLD9HVGShQYl2yAM
         D/OgBJzMn4N2w0lC0jfHfGMjdkp9Sy/deQutyqwKAios5w+uBiNo8nM4i8mMfOlYvPTy
         LM982fxN9OE5KtjnqWcDryJpSOhnVleCmwR0ECIFhbuJXapoPTKMS9qoLMPlAysTpFLD
         Folw==
X-Forwarded-Encrypted: i=1; AJvYcCUez35VTNRLNN4rM+RReEDF5RQFORT/06hd9amlmk9yGqamkywrPMAhbwJQboZm7VranE/qh3AYQf5I@vger.kernel.org
X-Gm-Message-State: AOJu0YypZN89vzOwILY3Xv+E3XunavXlGtUyXhXbQsF2DSPDzvpuJM30
	6WpojoVKFDJJRhYSefgjKTYfKSjB/mpMfKaOYFBqEMWwJF2OJiD8nv3OI2wdIUmzDIK9p9QayeP
	MZl0FB2h3EMjRBQSP1HqBmwjZEbvahQRTTPD7q9A2/PBxP483Z0phsvtbyPmdBOF2
X-Gm-Gg: ATEYQzwJ/UJM2w1pi7Y3wCGt8G/BJRcPegy59mnHDIjEgxmk9ZhOf+TCk47a2vcn6CF
	iSKKcXM6Y6SiNGqR0EBtw+Eotn3y+ImK2KOuItjsOb8ONIjHUCf2YUVAcrHHnOhx2tIvWozo4eY
	KRiFqtcMSVBnSaW6yheo3UoMt/D5JYag+qxAIwKGMwEihKVjpmOIK2GazTFyfngwly1NgPNDKTz
	1l7fSUb+ZPwYEDL3N/ZuMTO3tdoqxJDvK+R25ej544hV9jOX4Sooe+uKMlu+7WAFi5e+yfATw95
	gTw5P3A8E6bjhcc0PYdqXxo2Ly3MHzlnJ90YnZN4SqpBEmFDy+2/ecjFj4rZYsniJ98ls4PpgVj
	Ys4hL0QmkhHnecug11F5IQkDk9p0Z8i+zKghs6wYkWH4E9KIKhutCyNSnRXvzZD4fDQ==
X-Received: by 2002:a17:903:94d:b0:2ae:63a4:3baf with SMTP id d9443c01a7336-2aecaae66d3mr113855785ad.46.1773646036229;
        Mon, 16 Mar 2026 00:27:16 -0700 (PDT)
X-Received: by 2002:a17:903:94d:b0:2ae:63a4:3baf with SMTP id d9443c01a7336-2aecaae66d3mr113855375ad.46.1773646035745;
        Mon, 16 Mar 2026 00:27:15 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee9f2sm99694215ad.56.2026.03.16.00.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 00:27:15 -0700 (PDT)
Message-ID: <9b49adde-3414-4e2b-81b7-ecf54faf40b6@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 12:57:08 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Add minimal boot support for Qualcomm IPQ5210
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260313-serious-calm-chamois-4a0af3@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260313-serious-calm-chamois-4a0af3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J_Qxkm0wdIlxcV5q2hYxwxHEPxS_d45s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA1NSBTYWx0ZWRfX0EvuUV1OI4rb
 nfd+YPmNwRU9QGewxeQxKEpesxllZyv7V4UYf3F7tsPuuW/NwzGf1c5pYpru/G93kTHpUnQ/sqS
 2KWx//f/ifclhzIpf8nV3+mY4lTCPBe2BBA5y59uIA+npAKMAkL7mVVayFs4ol7K7+qcheDQKN1
 llKdMBItAutG24Uqa/ZL/q3UcwdUwx460x46ntHtJG5GE5IfuUostgGa6sbCb1zBaRIntqSxfou
 lBlpqObVN9CVJst7zZd7tqx5YmoHsbAHkT09/WYY4UkopK8wur8H9mcSAaz8puipuFx0JMdGes9
 dALdjV9b4Ezgsj6B0AEktt16HUm8ikdMgO/Aeiy/KHsjQHlo8Ale3aVBttKFlf0U0G2E720w8DE
 z9l+8D6xxk9cVTQqYlt2UNeI7PxDd/iuWh/dSQmhiVEHOQaIuBwjBy9nsjOJzcjPlh2Kl3VVT78
 ww0pxnaZlfANAPIk1XA==
X-Proofpoint-ORIG-GUID: J_Qxkm0wdIlxcV5q2hYxwxHEPxS_d45s
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b7b0d5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e8CD1ygSFDIBAwsAQqEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160055
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33451-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0D76295969
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/2026 6:55 PM, Krzysztof Kozlowski wrote:
> On Wed, Mar 11, 2026 at 03:15:42PM +0530, Kathiravan Thirumoorthy wrote:
>> The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points. This
>> series adds minimal board boot support for ipq5210-rdp504 board.
> You combined around four or five independent subsystems. Where are
> dependencies and merging conflicts/strategy explained?

Sorry for the inconvenience. I will split up the patches per subsystems 
in V2.

>
> Best regards,
> Krzysztof
>

