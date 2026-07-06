Return-Path: <linux-gpio+bounces-39508-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L//OBr+DS2r2SgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39508-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:30:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7FB70F31E
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:30:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CQ8DxLlC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ePigIWJc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39508-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39508-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DECD0301587A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 10:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D3338422E;
	Mon,  6 Jul 2026 10:29:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A383AF677
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 10:29:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333790; cv=none; b=c2ClRWQrtAmWtrW4DERjrnNQlXyhOgF4Js1gNJWA3WGfUNVAjHGqrEQaK9uOUA1gUMPYEQ/KzWIj13Zr7JumKoF+MdBmgHODvVwIJEHTelcP2g+f+b9Negw2Dvgk56+H4nKuszxAb8ZR1j8UXY9zMzrlR+qBmeU1htL+PZIy3Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333790; c=relaxed/simple;
	bh=w41DJ4Ry6ZbMPP3IttDbLbgduHem4JSys+EOUqlMzhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKrK0QG/BBkpS4UvewfgH4RHeEniczRjXgXrJ76MrY/cT+WC2vKK0us0HsFBbuJEo1VgBK+eV9bRmgOyn6qJO6KvvXzvr7VJzrxvoxBDPQQcyFj24UY+hIgjo/XYY0m3Knv8aBGohzGpARnnKmKAEIZF8wtdfInkrp39WHIA7k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQ8DxLlC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePigIWJc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693mfK4172096
	for <linux-gpio@vger.kernel.org>; Mon, 6 Jul 2026 10:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0pc41nX7pRqFYy4VQDIaqHwirZrUl06nKO1Kp135PuQ=; b=CQ8DxLlC1ALFL0bg
	Iw6yid3E1I6+R0CgByXSVw5QVqbIw/oMVh7qiOlOEkFuGx3QpEqAO0SNa+Ky6Bto
	S9SzmKNQWG794T00OXtZEsjYUYnr9oala9fjspMTNn63lqFAppasLonfpBcCCtWd
	0//Pqou3zsTQc03sJjgOfuwRW9od18ohbhoR/6RsfrEIW+OtwLL5m/oSxLnVo4ev
	AorzrNj0RU3TzN4HuVwFyMSFbpFzH41IE6yEiUNBqTQiYUFrUGGhDFLUJ2sG63nf
	lGNjBW7UcdkdUPuiNgPjKQDsGvyRA/fZqkA8JNWRlCFGu3O9EklEsK6o+SfoiIJH
	/wQtEw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88gj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 10:29:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eb5b9d2cf6so8433956d6.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 03:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333786; x=1783938586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pc41nX7pRqFYy4VQDIaqHwirZrUl06nKO1Kp135PuQ=;
        b=ePigIWJcYJuCjDWYqE+IM9vkH1Qx/lmM2feDBBbbliwoWo7E3fKewG8YcyaJTLAkmJ
         nEyOyT/EJxiWiiTZG7W6aa7c8dnOl37Z/DmDtI3mkkuLwb7LJFVX2/I+eqAJSqg843uN
         JCiD3L7gXERbpLJQ28tWns9MsyDadlq56FOOsUimNkgdNScS3WTTNqqyaU6xeZvVMA2b
         c/BdPS6qLwBkfMGHP/Dky/6ujWDEkSXGOoB5YfAvbWivUoeeOICKRn/BdWZDseOzFFAs
         8oA7FMxgc6YxTEMFy8QIlikzufXdtmIzJDDPm+1OSEAfxu88vwb1T/kJ0oU6iQA2Y4NZ
         Ufag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333786; x=1783938586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pc41nX7pRqFYy4VQDIaqHwirZrUl06nKO1Kp135PuQ=;
        b=N0zYqSIhXwL9PaVj+LhWnJTwmySYlJPc/ddqq9fa8TnrWnUGjVcxMGA4ikxbUFc3ix
         2aEvfRyXlRzq6sdK3xCq07T6KxLQBdYzQ84O4Xzrt3kCcT390uTN6Bc+EqhbjnuEVfTd
         aN0Rnkom29VjRZ58yAxknx1G1IGHgavQaN6c3nhuPYzL7L+g80MR+zQe8+43k20MgAzZ
         uXOE0hqCPBPTv/hilumEc9w68EVnJcpRs90Y+QtT9yEB8lKGAesIyRmRnb+irxEVxyhA
         vEzZ8JRD74OdpVh7oNTIDLuvSKenu/SLhzRAWvaKrhO8gaNtEbSHOQrLjfgSO3wa0pHq
         eG4A==
X-Forwarded-Encrypted: i=1; AHgh+RoedYAOk9J8M1SsqAgVQdG2UHAeHz9tXTMYwBcA1OAmGc77E71dYH/YS9wVjY4W+mRRc1dbWfQ0t8d9@vger.kernel.org
X-Gm-Message-State: AOJu0YwvTlQIOKaHk9YJKhO0KydqgkwPAY8v4SsOuNhz3wBJPvu2v36U
	jtOsO0oWm/w1NJboJM8p+v9rO77oK4H99CZ5Hy6aT3PDg8KTgtIis+nq1bXRlh4qJ4hiI3lV2el
	Rf/ZTXP14stJuXEwnIzu8qqFiYBxFxqxCcwioK2DZbiFLZ9m+25GplMCpV3xBxXlM
X-Gm-Gg: AfdE7cnBtB70PFCKVWxe8d9hjn0Z0nuyTQ/RzZ3GdAtdEC4I4jzCGfplCjrmjCfJjFp
	ci8fuEwvUzyr9isrWMSgXfY6Fui8iP+kdjWQgZA9gYdvUZhNWthvB+BAjqcCEioRUBC68rFtoZV
	od50If/Q9Kla8Xvlx0mAfxpxQfonFbph3esa3mNSjW7e/1h6cqlZV2RGyfb+UMTe/hMEMQdygOv
	OjuPkpu9ZVgM+WNdZzKJjvG2ufQFlz2aq+H3dHoeFgjzGKpAoB5BXLaYWasxk2KDR2V+9kjfXPX
	+0cxMEm5BPneU8XwS7PfSlNF04Pew4/UiIsKoICh9NJFoFJSvcj4iF5bz46wuCtXO1PdTLEXnjK
	h1kN9kzx5UD8e9yiyPnhvGKysjICNh01dbNM=
X-Received: by 2002:a05:622a:40d:b0:51c:9fa:bc2e with SMTP id d75a77b69052e-51c4bed6c6bmr90102281cf.10.1783333786496;
        Mon, 06 Jul 2026 03:29:46 -0700 (PDT)
X-Received: by 2002:a05:622a:40d:b0:51c:9fa:bc2e with SMTP id d75a77b69052e-51c4bed6c6bmr90102041cf.10.1783333785996;
        Mon, 06 Jul 2026 03:29:45 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6095b7dsm710039466b.19.2026.07.06.03.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:29:45 -0700 (PDT)
Message-ID: <5ec94740-c81f-4117-a067-0f10a462243b@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:29:42 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS
 LPI TLMM
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
 <20260703073029.2588960-3-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703073029.2588960-3-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfXyGo2raHurDYV
 az0Ap9USF89KcvbM2vc9YElF6AZHb1pHrxSXj4YPC8crYS9zl9P8WX78JStHhQngyPxy9tbf04w
 5DDRXAayTCddOL9TqvwZZG7ZySUyrEY=
X-Proofpoint-GUID: F7nAGmkdG2U7ZikNCdh91IOP3ZTb87g0
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b839b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-Wy0pycvYJKZ-mX1LBAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: F7nAGmkdG2U7ZikNCdh91IOP3ZTb87g0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfX+SJnYZOECUtS
 jNVbhv4H0kIebCTrOHE1erKe8O932SROEFb7CpALCENbpGbXeiMdJT+d6byygGPYjp2Z6Zg2V2e
 23DwMbPKEOW7QiljyYaSN8JSJSUvQ2BtOlFczZIVYEKDiCUFV5Zt2qaF3iqo8ioabADyjqx11x2
 7nyogAUQ5MnKg7BJWY/0/NXS4kuyZqZKebw4m2roQ23bqQYOkikDQlR+1jwTUZJojwFqfawmdIJ
 9WKQGh5zQtrjtT3hrDnJrMMX4AfnzhVjEN7THpZ7Jps+n5UX3833oLMpcDozkpM1wokfLk6PwpR
 P8TxBxxKf2TAzmTN0NSMFa3oGjlmB7dQCcABiPghENvlJxdLh6zcWb/q/AAfQqvGFtoRErUsQoG
 NnUH3BgNV1/AutlYCv6n3gqkQBAbcB6KttqQx/yxxDfWi16CLN+25khr1RWh8OJaf7NcpA6aXbN
 wYgxh2nv7zkdvdOR0xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39508-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ravi.hothi@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F7FB70F31E

On 7/3/26 9:30 AM, Ravi Hothi wrote:
> Eliza SoC has the same LPASS LPI pin mux functions as Milos but the
> slew rate control is in the same GPIO config register rather than a
> separate register. Add a new variant data struct with updated slew
> offsets and LPI_FLAG_SLEW_RATE_SAME_REG flag, reusing the existing
> pin descriptors and function table from Milos.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad

