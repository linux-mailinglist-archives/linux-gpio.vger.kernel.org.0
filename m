Return-Path: <linux-gpio+bounces-34967-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKKKFSDp12msUggAu9opvQ
	(envelope-from <linux-gpio+bounces-34967-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 20:00:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1582E3CE61F
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 20:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09602300B545
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 17:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D543E2750;
	Thu,  9 Apr 2026 17:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n87eBuju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aafETJFR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00D93DA5AC
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775757597; cv=none; b=pMaAHwgMrkgyoBJGoqQrd8poptWH3hZTPFz3T2iBWYpo7qszduzza3d8XBM4EsiTZ2Ds+WnzwU1IqCWSrBH/DiWCkaZOEelarZ25Qt9/zK4BQUgzUfClL/hse34VFhljoT+fEAwIsxWOPYeVpa5n0ZYcUjNyTR19lYu7WEAD72o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775757597; c=relaxed/simple;
	bh=UwTKJqIuXUGJa437O6+rI9hIW9lYlI4aKyAu0vnxf9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NoRhpyNhy4Zq39wCCZXdhI/29nWrMLv6E8DiSH+Ep5Ntd1Zg6rENU55nPga6Os3Y1/X36zxFx8jWg3kz+NkyO0CntSVl9Ob+CmsUCXt0tqfvGTpN46BheDdW8c7LRKLJ1wRpqSVRKIM/GqcSvxNEzb7RCwb4tNTpR/kwQoKVgiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n87eBuju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aafETJFR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639D1R101972534
	for <linux-gpio@vger.kernel.org>; Thu, 9 Apr 2026 17:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjEY8hTmGJ3/wMx6dnV1mYL6lmUJ+FGqfFbqbgSdHUQ=; b=n87eBujujRU2JwR2
	1pIelmYVDonQlfkw1Ws6dc4xep0H4alt1HdgclQIbVe1kNshz3Mbxy9r1rCtpd7n
	270B2TpPizMz5WZrGshTol3uEPouMsr2EVMWKIQcV39W3gwd7htEqQ86mNz2RAZX
	spm/5h8Tm01ZlxJWVyum5ZYr11TyXoECE8JHyUiUtzYxwSKJO/2+2ViGPf/77ltE
	4h7fP5h+84Ceq//LImlzmiTWpBMNjbobR9fiMmtcC2KgFjxl541KcU7Rc8or+fPI
	WsdMe4HKdhh1GhRqTDqCi9Q1Um13VjOezbTpf2d1qG+6NYO2U+9VigmuGLcsxVUU
	vKMhhQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms14ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 17:59:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so1568612eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 10:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775757595; x=1776362395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjEY8hTmGJ3/wMx6dnV1mYL6lmUJ+FGqfFbqbgSdHUQ=;
        b=aafETJFR0zcxuymhyNvgLc9LHglpSRw7COw7j28oVURMu7bkyjXKKOAj07UKnQXSqD
         t7LgI6o67PhZaj7Wf5GgPwphq0UMZEGkByM9ajkjq9vnWryCwti33i+xW4/haBzwIGcq
         TNpvPgisw+xQXZ5gX/ibzH++/J12i4aQ+9DjuxD/0DchevwElLlC0+BgC2LIPaMQcmwi
         fW0nAfOD+kzVuY2ILFiBzjrFh4swSBwoIHDZuSX3SZrskTEe7qE1FllJZM+v1ptMSO16
         PCRbJUanR6EhXsj2Pkr12hFfZIhOzPoAEuHJcPQ/QoiskabZzZOpQrKpFskyNvW12gwz
         I9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775757595; x=1776362395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjEY8hTmGJ3/wMx6dnV1mYL6lmUJ+FGqfFbqbgSdHUQ=;
        b=Ecr1U9oqlWAaw99NUuwVR60iNvXPi0cRRYVxkY9Ckfsbt06Tet0ctTmGyhIl1IFTza
         I8vOMeaNVXgvTlnPvAUp1vHgo5xcJLdBvJpAGaAgWIcPP0ArHSjo/yK6J3m2wKwAXy3z
         MDcraRyEkA7LyvbeHwhrGmk95aVX3nSs31aNn31R7zBggggUDnEMrJ95V5cRw143Tybe
         N57vQhKBxA5G6lZ4OJCzxGd5C1pdll6H5whd5EQ9BhGMqa+4IcqFJOOF/g8HX5sYvMFi
         YiJylg3LRbGNYF+SQ5CNqtju31bNo+GwbaAD8pWFrJ7HF4C5QJ2En6iRFxhsFx67qa4v
         7fzg==
X-Forwarded-Encrypted: i=1; AJvYcCX6kXyheMm4fIQI3ySRElkZ522cTcFHWRiq1kNi1UzTL5+tYpnRD9zx6QcopcluL9fKPaUnfY1elAs4@vger.kernel.org
X-Gm-Message-State: AOJu0YxN5IDKHwlm98ijm6p/2YtbrXaHl4eZYGDSHzb3XJpCJifjPz91
	kkJj6844r+MLvvckQunRP2VYy2W4TvL2M2sXTEjsCn965ZOM8rs+N8lswwhwvsYVBRQ0w80qKlM
	5HKBLPzFJjf6pTnZP3kLk7LLvuAbccoqJfFVwqObo2Nhg325dKf8Sfj7CaBYBVaaO
X-Gm-Gg: AeBDieu+6Fl53UxxIpVQ+Es+OeB6N6rt5LwACRVOig79EOmVy8I+ASwzCZUgDbSZmVg
	+xdvAI7c6pd++VWSof3OrzUq7u2GsUCUJEwd9qLQR6qHWWgP7/0sOxlUc4wNFenb5usfoIYzbr3
	nr9AcwJHDnfVl50PdW4tR2i1sPYf4SF/4n0PcK1RCuoLByvcLXE/+2+baV6H5E3aJF2oBNfDnBa
	HN0hL8uwqzxFthDikSTmsRJcxB0wqLCYOHkcpqBcjZrDmbTVO4o3NaiZiQgE/tXPw7q0wC/j7ii
	659pU8RRBBH0s4aUM4W0ewoqf46W5cPiPUIDslPGFB9tE5lr5HPXqT4KGBzkqyTTWzuLyKYxqGm
	jDYabZeajNxi9kkO4RYAnESm3eTtC5WXkAaz6Q3GH6midMlSn9XKIdrI=
X-Received: by 2002:a05:7300:3246:b0:2cc:3684:d1 with SMTP id 5a478bee46e88-2d589cb5e3bmr26041eec.28.1775757595239;
        Thu, 09 Apr 2026 10:59:55 -0700 (PDT)
X-Received: by 2002:a05:7300:3246:b0:2cc:3684:d1 with SMTP id 5a478bee46e88-2d589cb5e3bmr26018eec.28.1775757594609;
        Thu, 09 Apr 2026 10:59:54 -0700 (PDT)
Received: from [192.168.86.243] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561bde70csm779899eec.15.2026.04.09.10.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 10:59:54 -0700 (PDT)
Message-ID: <78cc27ee-ff1c-4c98-93a6-d108bc6f3b2c@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 10:59:52 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: Introduce Pinctrl for Hawi SoC
To: Linus Walleij <linusw@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260408-hawi-pinctrl-v2-0-fd7f681f5e05@oss.qualcomm.com>
 <CAD++jLkVHZOBk3bgdqk0dX2q4v=+CD8jC+1vu2gi8CK9BLfX2w@mail.gmail.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <CAD++jLkVHZOBk3bgdqk0dX2q4v=+CD8jC+1vu2gi8CK9BLfX2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: E-PkfobS9kwj5eApjg-IBv4qtODCG5eO
X-Proofpoint-GUID: E-PkfobS9kwj5eApjg-IBv4qtODCG5eO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NSBTYWx0ZWRfX8Ntt10zkH29q
 B6U+5cG9M8XvBjjVEDmueD7cVwHy8RG1XqGalLvYgGGkUZTOkgFsep/UCu4hujA3lIVZtggQ4Wd
 i+3lEji8dVyOHk6NLyGPnG4Sz/0InjbPIiNxSkVx1xF9wIYS/JvGVxVpfW0JXon5TBcQ7fe2WWh
 QLW0O87CcLlPniYre6qYqWxZrHb63+s6f1pX3tZ6MDIzCkxXo9SlIjhnED+gDI524La4VlBoqjx
 1sMiVZeMUrWd/KIzDHg9vqAj8UyTBbTlK0lEpbzYD+jPacZRA7MBot6ojljd47ceeJBbdAyhrEi
 L6dXisp4eo+b9y+ov6IjZOXIbj9RR+1TKFnBdqYeYBDJOkrqlqz+zWf80C0L1X7HfN/9mD08OU7
 tvclYtzNezpg3B4Pn3pKZO0eXaA9fBIKlOIK5LtTXsks4NjJxxtkzhaNBaViVvkn0Y2YouV1YNa
 rZAGsU/uQrhfSski/ZA==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d7e91c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NgZ62R0EuECE8gCXEp8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090165
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34967-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1582E3CE61F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/2026 1:53 AM, Linus Walleij wrote:
> On Wed, Apr 8, 2026 at 4:16 PM Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> wrote:
> 
>> Introduce Top Level Mode Multiplexer dt-binding and driver for upcoming
>> Qualcomm Hawi SoC.
> 
> All was reviewed quickly so patches applied for kernel v7.1,
> because why not.

Thank you Linus. 

---Trilok Soni

