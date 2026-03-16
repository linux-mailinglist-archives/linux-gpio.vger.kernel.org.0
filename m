Return-Path: <linux-gpio+bounces-33580-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PZLMcVhuGlbdAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33580-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 21:02:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6C029FFFF
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 21:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 104A93015B9D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 20:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389A1332EB1;
	Mon, 16 Mar 2026 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lk0qSiLR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q5rNQVq4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8D9279324
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 20:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773691327; cv=none; b=JXDiTdJnc/sA7OzXd8DKpTRwETTkCl5qz2+8HE/sbm4k/x108K9rsjRyE2k6KUOLPmThaduqZX8krQJySAYGYUqC8eV1uc3DJRFFIr+4P45exK/Xwu1UQvLFoW0qzrZuudMC5vy5YA3HoRpEq92uciwrL9oGbI9ofWz7meRypD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773691327; c=relaxed/simple;
	bh=36n0bi4fVRdSzw2/ckM1WfY6jFeDjYHWHstRyrD5L+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SvKAi/gvnDlruAeL+YINA+Tf+k5SfACkywFhQYFs2utN6h8eDlZQm3Vx+wu4gn9hmGZweIQe2R68mjqrWz3Ppa9Tm4sfuH/maaLlpd/W5iKfbsyICso2rKMC5GyD2/BIzTx6SielYooHUbX3g8pO2zMqZL83HJ4PAcFiloFUcC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lk0qSiLR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5rNQVq4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GGfjaw3124594
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 20:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HQ8WifFC2j/bvDha3tINklH6CxSce1xbV+4Y4V4qj7o=; b=lk0qSiLRMJR+ijD8
	XRuWzAePKAzhP1ahOeQuHNnkkSoq01jPC7DzvfeRxfSEgcSA8d2bjWGRaBolv5z0
	9unnHLgJ2z4Qw9dweFCnbVYjDY8lCHADkqQZt52fwL4rJxdDVa5LecOLd0ZnWBLY
	7oWaEhvHDviQMLrAAMg2Hw0QpRyDhjAXO6e4M6UVol54LL2PcndeXWFwsQQKdljD
	eg0OzttNu1OgWo4qLAZ7/6tUu9aUcDr96WrMf+zEBqgrbGBCchYpICxfjFAevJhw
	N0ayLZS3LLlC9ya6jtQ37T4r7z2uoslu6711qzKtjAMKb/3q8uPkUdaCAEN4T9UL
	CXfE2Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmj59m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 20:02:05 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12721cd1a2aso22929480c88.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773691324; x=1774296124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQ8WifFC2j/bvDha3tINklH6CxSce1xbV+4Y4V4qj7o=;
        b=Q5rNQVq41CRZz9TgI6WD1DfiJw3CMt9Yt2zq+wrgnt/xw2gpmNX8xzecmunM+rooJi
         ntrDE2jEA5phHqDq+2Rxx1lAFDLcFbMP8ntRKVxmavJAKU91JnFZQxvruN8Y5DL/fhU4
         KcO0aEuC0MvlZpTCxCQdeNraAs+caNtdy1ieitsV4qj/W9kOTnG54i8wzt1J7p/EDzmQ
         pZ3oXHCroQmW9TYJXa4iMfs5TCnguxvVLaKPihtWQkxjiHUvWo0BG/fWt1SA8MukcUP0
         stw4hkFHWGR7DYP3rYewcjDiG7GjhUxvb9WzY9Qgrf6lwxA88QoeOGDvD3vuC9qj3ULz
         gsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773691324; x=1774296124;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQ8WifFC2j/bvDha3tINklH6CxSce1xbV+4Y4V4qj7o=;
        b=QMk9Zd0t4g8lu2C2zSNEU/tuSVKmxuk8mieEYPp0MQT8kT28jHEddaQbTKyHTYIRix
         7Cuk+YdRrrZM1/gaWlf/8peBtVVGBEDEwNhcz4Gxdykm61a1AGrmwc1KyiRHxhTR850i
         Q4p7Y6NHhJDtgC4VmulAnu1pKyUJiSrXhyn2aB+G02WTuTPPRQGhYKDniQ9uLd4MfEij
         mR2d7ONzi61BpaphUYnDfEqe9qMNl6y9MwobuHYzpXcPrnpweQ9vjvcMgkA0mlWPNPrP
         hgm8xEV+r9wkIQDXG9ImvcnKer5oxGUsPgO0jR8fukakB+YtzGSnITjiRz8ZAr840MbE
         Rrwg==
X-Forwarded-Encrypted: i=1; AJvYcCUICstdcdJpDdpnPPhFYKinGA7au7WagQNJOpV5KpxGYJUorpHZC7qIwZAHEFoX9rdkugzU8niTattU@vger.kernel.org
X-Gm-Message-State: AOJu0YyjWMqqMyBjdn1zdmYw0EmW1ssU1eyQPg+Y5ysM7jS6yZ4EawB4
	EsLhwzAEudL7BOWwZQm9/Zeb829Sg840Dn4HPWeyZXO2nQfAbzDwSgi1tkzXtqNZuf9IyKZ1uNZ
	z1W00szkcOi3ud4tloXXuZF/MPP7BfnU1q6HobqChkPhxrkKjZ7FyhX0TdymstAU1
X-Gm-Gg: ATEYQzyZ2TnHHHsZ4djp1cr63xzevYMoc0jnBfwipToqfWb96egEBjdfjiORa9lH4Pj
	84YXyS3dq4x/VDs7WPbKTa7ITZBBlKrRT0kIIWueHG2BQdQqJL8FNlbVvNbieqPv6eWq/Eo97Un
	QnKIuhPIP3GzGZxlAVUCR8/kYak1g9w98apHtVc5QhryJzdVZfyb5jsxbjiqw2l0dN/KXcrGHYi
	nH9eSaS2amc2WaC2GZrbH6eHvr9nBU1tqrAHE3qPRFqbW+9eLZU2UnxD1aVin+cNFaW249nlqHR
	dyGaESZgbnxW4j2BI3RGvDKt5h7JFT4RJX1MTJXdEnlsDZVHwqxynSAWCcnrENbEApteG3K13a1
	xIOE6aWcaDR8RW5FBlKtZVQSlaCtvzBAjFPBifdlen38HJY0VtEplJNw9oT3G4Xp+wplYui/U8d
	WKzRNYc//fgOZ1rw==
X-Received: by 2002:a05:7301:d8c:b0:2b9:80c1:bb5 with SMTP id 5a478bee46e88-2bea572a4aemr6611025eec.33.1773691324263;
        Mon, 16 Mar 2026 13:02:04 -0700 (PDT)
X-Received: by 2002:a05:7301:d8c:b0:2b9:80c1:bb5 with SMTP id 5a478bee46e88-2bea572a4aemr6610997eec.33.1773691323712;
        Mon, 16 Mar 2026 13:02:03 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526d61sm18944609eec.17.2026.03.16.13.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 13:02:03 -0700 (PDT)
Message-ID: <3c3a6273-1b4f-40c6-ae59-11a4706ac86b@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:02:01 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: ath9k: Obtain system GPIOS from descriptors
To: Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, Alban Bedel <albeu@free.fr>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu?=
 =?UTF-8?Q?sen?= <toke@toke.dk>,
        =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?=
 <kernel@kempniu.pl>
Cc: linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
        linux-gpio@vger.kernel.org
References: <20260313-descriptors-wireless-v4-1-07ab47c89a98@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260313-descriptors-wireless-v4-1-07ab47c89a98@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE2MSBTYWx0ZWRfXzZVcJnrUvxIB
 e6mzNFnm2jLMZmWJoJzTk0pamSl5Ya4GvzZKjaPPID+8iCeRgJVZd0gJpdoFK5oK1lr/FAxjv31
 RjmkiXZY8X44SnSjR3+SKtf8p0+Ev0COpG47bB9R73zB1EBk8iRMgr2oClhwBBK4kOJilVF3Kr/
 YqRXT42mMgrueV9LuvHlrb2j82Yl6P0bUqpguBD5tuAWmAX0faYqYDT1dWIZ5OoCCJRwP6i0Y/p
 bv0AzaeMFA59YsyEQV2KYA3cqP78s8LKW0qG21s0OIUIsQmspQWfSBYrn7QI9N6c3CXLm861fXq
 pEz8PlrAQbWuuMDaspfKG6wuM5U/LLYPqSBAZTj11JEmhgcUVkzwRM4tkVkAneQlO2T3HmfOqhw
 9G2yUj2+GL6wKhRdkzaHia0IXZ8kphIy6vUAwapNicAwjIQpxSTtHIcTS4Ti9HEZEEMkzg+gTno
 JKf+077yC2YR68yuRTA==
X-Proofpoint-GUID: DlHRqqME3UVtWQhcicE_4bCOLfeoLvhv
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b861bd cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=vSgz8sLpNFa1Q4fVfdwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DlHRqqME3UVtWQhcicE_4bCOLfeoLvhv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160161
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-33580-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,arndb.de,free.fr,bgdev.pl,toke.dk,kempniu.pl];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF6C029FFFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/2026 2:53 PM, Linus Walleij wrote:
> The ath9k has an odd use of system-wide GPIOs: if the chip
> does not have internal GPIO capability, it will try to obtain a
> GPIO line from the system GPIO controller:
> 
>   if (BIT(gpio) & ah->caps.gpio_mask)
>         ath9k_hw_gpio_cfg_wmac(...);
>   else if (AR_SREV_SOC(ah))
>         ath9k_hw_gpio_cfg_soc(ah, gpio, out, label);
> 
> Where ath9k_hw_gpio_cfg_soc() will attempt to issue
> gpio_request_one() passing the local GPIO number of the controller
> (0..31) to gpio_request_one().
> 
> This is somewhat peculiar and possibly even dangerous: there is
> nowadays no guarantee of the numbering of these system-wide
> GPIOs, and assuming that GPIO 0..31 as used by ath9k would
> correspond to GPIOs 0..31 on the system as a whole seems a bit
> wild.
> 
> Register all 32 GPIOs at index 0..31 directly in the ATH79K
> GPIO driver and associate with the NULL device (making them
> widely available) if and only if we are probing ATH79K wifi
> from the AHB bus (used for SoCs). We obtain these offsets from
> the NULL device if necessary.
> 
> These GPIOs should ideally be defined in the device tree
> instead, but we have no control over that for the legacy
> code path.
> 
> Testcompiled with the ath79 defconfig.
> 
> Reported-by: Michał Kępień <kernel@kempniu.pl>

Are all of the reported issues fixed? I cab add either a Link or Fixes tag,
presumably referencing:
https://lore.kernel.org/all/Z3t6coHFgd9PBCeb@larwa.hq.kempniu.pl/

> Acked-by: Toke Høiland-Jørgensen <toke@toke.dk>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> This patch set is a long standing attempt to get rid of the global
> GPIO numbers from the ath9k Wireless driver.
> 
> Maybe Kalle can merge this to the Wireless tree if we agree on this
> hack solution.

-Kalle since he hasn't been a mainainer for a year now. I can take this
through the ath tree, but would love to have a Tested-by from Michał to verify
that the issues he saw have been addressed.

> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>


