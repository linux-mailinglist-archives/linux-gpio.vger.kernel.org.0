Return-Path: <linux-gpio+bounces-33085-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMS8Du4tsWkVrwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33085-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:55:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B3F25FCF3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67E5C3089B95
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 08:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019173BC695;
	Wed, 11 Mar 2026 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrdENJTc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvB4Dsop"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E87399008
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 08:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218788; cv=none; b=XWnz1JLuiERBxh+97U6MJfjGi6iV08YXzn3r4DUs+7mljP/2HEyJ60Ty/3ybQzQUZr8LJ2z9rRDC1b/XhSIXhT/AZN73OlJjYBOmiS5iSDpA/GLtdhB2f4c8pQobYsXVOdQS9QkAb/+SD/FCM4yYlYLXjmMc9g9WyDSTgT32x6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218788; c=relaxed/simple;
	bh=J/eXn4jxWGAFllL8D/NqvXyBbzgywLRkM6+3tnsk9T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LinQFMR2HJibqy18hxHN9tlVSm540KHK/HWpu2Feco0wDWKtxIuFStnAz7PyZMAvAuxhHIwcdGAovufGr6g0EXwsb073s64iK3cwRL1Q0LnuaJkih8W9S0omPUhjeCce1Wycf88vm/IP5/Sgah4fJVZafqvcE7D1B+46Dl27DrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrdENJTc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvB4Dsop; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3VKb1614148
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 08:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6vJFxCRXXAQ3TQeEvqMbHf6JZbJYgoRmy2aLFS+RO1I=; b=BrdENJTcMQ7zUFAN
	qayAoKHnVf+74ijFUtI+1sjehnCalKYJmR+V4UkmfRgZS4q8XAEyr3qeV7z/Kv9k
	e9BUTrzPz5yJlv4DiVPu6/aEpl7NyHlvf+F4dP+2jvl11VZW7uvgs+xCR40xebyc
	SwOd22pwGqSTKRtgtOqAhYAe6SlE6USa6xYSTVi+6tCt53Fn091kz9x7Cu3M1jmD
	T7nwfESm8MwkUkf+lIMJIC0268HqbsUDwDfd924MYngbnHobFNVjBVa9SRpOl2FB
	TjaZ3uyM1/PwFHVuo4n5wI1EPb3IPUJf5mWIqHbNwVmkHv73OyVy8e82oFZvbcL7
	bElvKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu0jf10fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 08:46:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd820c6a4fso2961986085a.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 01:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773218778; x=1773823578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vJFxCRXXAQ3TQeEvqMbHf6JZbJYgoRmy2aLFS+RO1I=;
        b=gvB4DsopezQqZ1V5twaEpPa0v5Q87zq3NSFGJG6Vuwex3VxBP6Twva35GMSiwrEWou
         5k/EK4tncx5+O8BCN4/8BJdemxzKz8aeEDA8b3CFTa5lV6cOjwJoAjxazsrYjc4uIXNM
         wWF4/Y5roffYoMCRUnDCKHEp1lIXo7B3b3gBS65wbXvolyMVGRrmk/bWmc2h7pQ6HhM5
         A7Ox49hA284/auh0H271JWh5x/G4xkgEmd2Rguc3jUHZZbFg/I2wYdArBpXGfDCt0Bdl
         IIjnkz6nwcNOf7dn6nJsKPMZ8up9ABYlcYVTkO41IxXSZ/T0++k5MvjXUQ/1GU5CcvcB
         hqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218778; x=1773823578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6vJFxCRXXAQ3TQeEvqMbHf6JZbJYgoRmy2aLFS+RO1I=;
        b=HOJrMOHma+AgZ7lhzlUzkoRWffQcz1aieME2/DvnIO2e7fw/a3K7kDH+Of/qNTB8SZ
         IPx9XA7izAUXA7Xzqef2CHMQIVfrllonGa+NlAh+llT/Z+0KyRdn2yRnpWQAu5Hzhq3Z
         nwOXoEmLS+pDjlKxbETnx/FOpjQqeKkBn4YDKwVpZ0mOdgAFOIRob6HOYnJkG+8icHLL
         ETrRGU3cmkFot+Av9ItaquqIye8FzCkrlLazVJo/gc+c8lL8eXepKGfPXbrvFNTA64Zf
         DoY9fJDcNzp/X7xBWMh6MCYOec1UMLx8AOVXV+NIftf6RzlbB0Cf1K3Shnum2MpQ7UZ0
         s+RA==
X-Gm-Message-State: AOJu0YxFN5TMVVuEfpfH3I54DQG5+XBqMk9CQMhhYzW6NvydiEs2aeBu
	h7OtuRlexk35pqpFB74AT7GmNNikegMdU1GUtucOKL/dL2TZPaZfBBR26B1ranrsMIf2hZpyWQy
	jOTx7r5ZyKw/ToqZFEPeD7QPydX59HmaO4O2zvEejAtI704HJDX8QnWOEqWIG15d7VYVRpbTd
X-Gm-Gg: ATEYQzyftr53YeR6XjHUVG40l/fO2LswOI14kfq7Xjo6AiwHc/cT7257IBpWDxHm4Ls
	jCWoc2pfQxDeu16WgAXzUTX13Em28YpjUiss4Uqk7FO0Yq/oZOQcgpLczvz71UGstxdZxFxCnl9
	PLCxifxmAh8kDRpLFxDznMUHDZx67gOQ1x+TZSFOKTI6XB2CJEo/6GOiA8luf9nTLo9gxIFs9R8
	ZXbTjsyR3kYfaP5g2qkSAx8NZBtyyQoYxpL/3ocNxazxY8x/JNN1VokIDmzcEi0LQH6/Y3FVNx9
	6+a9auo0IuMTzGS5hM15Lhvo5qWpWvlgQdvg/CVCVFeXCAR7jErK3fpygNQdEIL8B5+ng0/pwkW
	ZLD6kDXQH3MDw0Rk//1x8bUZ7xv3SFZcNvHi926uXSK9mGFTm3Vs=
X-Received: by 2002:a05:620a:2848:b0:8cd:9253:215b with SMTP id af79cd13be357-8cda1a87e2fmr217871185a.38.1773218778205;
        Wed, 11 Mar 2026 01:46:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2848:b0:8cd:9253:215b with SMTP id af79cd13be357-8cda1a87e2fmr217868585a.38.1773218777716;
        Wed, 11 Mar 2026 01:46:17 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1f4c:200b:aaaf:c666])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f81fcd65sm5503816f8f.26.2026.03.11.01.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:46:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, linux-hardening@vger.kernel.org,
        gustavoars@kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: tegra186: allocate irqs with the main struct
Date: Wed, 11 Mar 2026 09:46:09 +0100
Message-ID: <177321876121.6763.3562212784533777999.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309232804.331882-1-rosenp@gmail.com>
References: <20260309232804.331882-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sTDSNlSrMpKXqo46avjWGDzX8U6eoeBT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3MyBTYWx0ZWRfX+1dsxGUYscza
 eevEvz9pTiAfR5nMlfMeeSuvABZ8bksSslLmgSe7Jo+dOI9naTJVwW2tflger7Exz6ldN7DFFW2
 pC8eGE+WbI6sz97sAKMb7/K5V8PPy38mFgGf7PB+BHCYYc2DFbBYK2cZ7q5bvBwqfabMka2eirs
 8e95HnUD4hdigVgq6FLsTJxtAAaIQrlOnvGs7/xklng5Ayqm/fjoIuHFF6cpRP+Jlsd9jOSTtfg
 pqXygsYbVEGjWqhTIF3/KvK/FUO5RxizIE4u3qGdFSuNAZEb8Mqyx8uOHOT811Sckn91SugokgB
 aSPlYqC39URFqEEgRTvlTIfjtOF6/q0/ThYo2Vl1RHcEnTymprRGdldLulnyJt3GOfRpO6+B4DY
 fof1D9QyuBZtnp3Iq4CyZL8xm4iAsFVMtptbF3WtukgjNRyYDvh61Cn/EeKsV1pk7IBv9uTkcmQ
 fdbituWuialnUtNpcIQ==
X-Authority-Analysis: v=2.4 cv=FMMWBuos c=1 sm=1 tr=0 ts=69b12bdb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LMpztJHqCLRgs0MzPDEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: sTDSNlSrMpKXqo46avjWGDzX8U6eoeBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110073
X-Rspamd-Queue-Id: 17B3F25FCF3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33085-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Mon, 09 Mar 2026 16:28:04 -0700, Rosen Penev wrote:
> Remove an extra kcalloc call by using a flexible array member.
> 
> Add __counted_by for extra runtime analysis.
> 
> Assign counting variable immediately after allocation as required by
> __counted_by.
> 
> [...]

Applied, thanks!

[1/1] gpio: tegra186: allocate irqs with the main struct
      https://git.kernel.org/brgl/c/b4784adfe3aab3e74b5f7556834d87e416b666d0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

