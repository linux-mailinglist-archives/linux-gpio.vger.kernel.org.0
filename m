Return-Path: <linux-gpio+bounces-38840-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kcsWJDpQOmqA5wcAu9opvQ
	(envelope-from <linux-gpio+bounces-38840-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 11:22:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB886B5C0D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 11:22:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nAKwn+ZX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HBmi4rvT;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38840-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38840-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76EFD3016C91
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 09:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CCF360EDE;
	Tue, 23 Jun 2026 09:21:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AE33546FC
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 09:21:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206467; cv=none; b=d6808zmLTNJd2KB4rlrzxi0RVSJpp3JDKaK+oQyqQQWsttZbKWSwy6sVODdH4JvOjAXhcOGdDLsxf8qp2l89EpnVdzmGgW3GsPWlBthIYOcQO2odzc4/FIICO1hk3bRgcoiZ63qH6zZM2l40L3oak/9lKznUnuTYHxdpblu9Pr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206467; c=relaxed/simple;
	bh=mj+L6fNIend4DPnJIWWfjOMaq1nQkDBZqomFXdwOlsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIsKFS0zqgPYh9HPEEuZwh08Lca+YaDhFjEwR5nqT+MmGU0BtBlFAtO5V+j8IhgD8rn8qDvhAeBIqhJ6cXjm7vs+w20CYYmTBsQg96oxtCQd44GimCOgAhD6LLulw3Kk1wzrASmxN+UnXRnG3URPnUmwPYj8lIJ0NDPQqTbD0bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAKwn+ZX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBmi4rvT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N9KUU43918982
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 09:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rYS6OZjyyZJEvXuWC0yUGIwHhaWz1fNCfLFi8IntxzA=; b=nAKwn+ZXk1196PFZ
	62hTEwsBtBMuZdf9QbH23aty2LfHEJxmTepY+JnfQ0VyVCRZbK57dtLlf+nNxuB7
	SjKMRsO3iySjudL95lHivhjopYdqwoMa/Ub69VrPTR2UV780RSndEXU8F2nnz4C5
	ZwsdJtahJYjI9CtwfiSowmmjF4fJBimJXawPI4GKGYVtzojFQL2uYUTkzVNlAVEf
	1F/rKL+RvRUkPRmCfwKKkgY6enQZPZd/cU6F7Y71LMJyf2shbkAB8sfS6GCYJtOo
	tWG5M1AK2JBtC/Fcv4aZc75t76f4RwrwKJ3nTpbfNSf/cfBuLRW017JLS2GgiN9+
	7OqcQQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe6804c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 09:21:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845317fa7e6so7706289b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 02:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782206463; x=1782811263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rYS6OZjyyZJEvXuWC0yUGIwHhaWz1fNCfLFi8IntxzA=;
        b=HBmi4rvT0tAFFO1P8HdHiqMy95cHAe81LLx8NTSMu4YLIOfDlxn6kjFNVnuAws8JBL
         PK5JEQkelmpZdx6OsIrj/IbzQYalblqEElYt6tg4lpklxtAjMqrMJi2nrxCaSbi9TwnH
         n7oj4ZqetNUNWFTvL9BS57P1P3BrqeRwJjRepm4j5CKjKunGq6hj1Q9yuG1jM1F3Jmex
         WFMh7cL+8JVqdC1eBmznqqWgrMZzrQh6LDx/BL/8qCUbOsietBrgHEwKv1S2fo0OmHGt
         Y31Gv17ELMDZuGTteVWnwOAXWiLsI4jr1xMIjhu4eiTNJnEVgMKH/sJ8V8gwO9NkOrLt
         i5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782206463; x=1782811263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYS6OZjyyZJEvXuWC0yUGIwHhaWz1fNCfLFi8IntxzA=;
        b=SBUtzdjx7x2xv34rG2hcJj7MEcZddTMraXD5RllL+GM5nbMSmSkjQEuo2tooDUm4gF
         J+b/Y1EH3dx24Fq9XQiVUBa2rI1DnKDhN24d1ON3xBQXrA5sWPZZblyMZsvXH3oUx8kP
         AhD6EJ6GW1MeeG+m1t81iBuwYIo37IVBdYr/8I2JnDT+yuT/yhF+8buAYq88+aqMWm4X
         D/AdQRpHE/O/TSxg+Lq9COUyuIXZ5BH4f5r+TFs6Q2g+2atawrZpQv+gTGr/SzBIArrD
         ATp16whrb2FC3uKFQ8sX5vXVD63VP1kZkwXe+C2vqA0g+ykiMB/zm9HzJsR5LsEh0Bqj
         /z+w==
X-Forwarded-Encrypted: i=1; AFNElJ+Nl1BZyBl723oCPGTtFlTPYZD+pMRuESBTSRUQy0/S0zJSMVkIYoXmj0hodGj5E1RVCd1KM9Y8+Pdi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5agTGt9LVjVlqsIjdEsU9eOAARTiXIboa1fBzDtyBf0FrWnQN
	7eaFUuCmDH0TA4gxputqoLBW9MSjNRXDpTSsaEWcyIkE/43mi2d8fNhtr+tGbcyNBKhzDVlvd8w
	Nqj+BDp7teq4De0TwG/Gz2QcQtpwKpvGABgKBRSCag+bCaEt7/kA2RzLQRd5qksL9
X-Gm-Gg: AfdE7cnvcWDoICnff3dWlbhqcZnORvk+dDIRQv9PzIRsSwrzPaI/98ROkAaTr/kHezZ
	SczQic+nPF5pHfKpQo/Or3/Wh88hrIukzy87XCa3n97fPJQyhy2cFhUNqGwVwwY66etxpIsHq2v
	hNhEGPMUhPqSToyoMgjZwEW9IJ17gyMasdsdnLeDHFoV8hCGhJWsK0ZAnPeMXqz69fxNa7WsCVl
	mIRxGu8g83KvrLCeGRAt+xPgbmVrC+vTGIZ3gjBmpdR1fUeIbiPWeGLFF4OeVm5+V+uAdfsgCzk
	hZFURgMTqagyClAbx0G8Mib10eyDqzVnfg6ZMSDLzOiag/9O0eDGJFYSyfFBAbrN9uEanuwPoXV
	GvmB/xCyWrPFLyA80s2GoEYclhSwVpNszvb1UbbBxJMb4
X-Received: by 2002:a05:6a00:990:b0:845:36a0:9eb2 with SMTP id d2e1a72fcca58-845970cc9b4mr2598660b3a.34.1782206462976;
        Tue, 23 Jun 2026 02:21:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:990:b0:845:36a0:9eb2 with SMTP id d2e1a72fcca58-845970cc9b4mr2598603b3a.34.1782206462359;
        Tue, 23 Jun 2026 02:21:02 -0700 (PDT)
Received: from [172.20.10.7] ([106.192.20.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564da57a0sm11428820b3a.26.2026.06.23.02.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:21:01 -0700 (PDT)
Message-ID: <47a9053f-2153-43ed-9e6f-21f0153a2f04@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 14:50:53 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: codecs: add Qualcomm WSA885X I2C codec
 driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>
References: <20260610155708.151067-1-prasad.kumpatla@oss.qualcomm.com>
 <20260610155708.151067-3-prasad.kumpatla@oss.qualcomm.com>
 <CAMRc=Mf2oujn6MstGqKg1JCu3hbPD5zHhCB-Zke_hu8LYCz-Xg@mail.gmail.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mf2oujn6MstGqKg1JCu3hbPD5zHhCB-Zke_hu8LYCz-Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a8CvckTHIDaNZnl3Ip7WOV8QLrNCFJC-
X-Proofpoint-ORIG-GUID: a8CvckTHIDaNZnl3Ip7WOV8QLrNCFJC-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3NSBTYWx0ZWRfX5bCy9sgXItmk
 f2UObQ5lpmsh1FBmVkJwMnNVZ08Y/aTGnjd3m2WDiLMtEdu0oI8SAFMnbcRV6+NITgtB8Odsebb
 MSw5hebd7I5GCpjACOqeRbaZ9uK44E0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3NSBTYWx0ZWRfX39CdCFOs4OKe
 iY03j5gbsQ6DeBmQO9ewwe6TGsXkL/ey5mqO6kqY9FXrBecTjkfSHBEpOA3eNWhDeebM+cMM6wX
 5wh3YQQDrWWR6F/iwMGNzcAikY8MKACngAaRSGRBa8Nm5A2Kmrf/9IG94Ez4Obu+sDZNxxz7HJU
 KaLR6O13ad0j7lzohoieCY154p130u8Rn66DbPpm1ptLEOWeG9+yL3musdyqqW6y5SSKM4stjFn
 c6c77UZEOaQ/3Jitw1IzjRjj9rgWUFqz1Ac4Yu/U5XZOGnL/AnRIOpiqTQREmGPA64e6HlbFbSz
 GK82s9+jAtf9N6ltOSjFAF7zwLk/rTeOmSZSSjKgux7ZdVG03Oji4llNUtGFrnw9H2DalOgjgiP
 rtz2RXP5EWgGS4sB2EGc4sOFpGK6kgy0ZrVwiDumwkb6Nsvfl3nvI9dVbi91XM/M+H/S6Ea4s/P
 12t1o4HwhAHGK5M6Kgg==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a5000 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=GtHFPjVsJ1z6j8OeKiQY1g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xkAQp0t9iyHIzJGVLTQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-38840-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linusw@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,kernel.org,gmail.com,perex.cz,suse.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBB886B5C0D


On 6/11/2026 3:19 PM, Bartosz Golaszewski wrote:
> On Wed, 10 Jun 2026 17:57:08 +0200, Prasad Kumpatla
> <prasad.kumpatla@oss.qualcomm.com> said:
>> Add an ASoC codec driver for the Qualcomm WSA885X smart speaker
>> amplifier accessed over I2C.
>>
>> The driver provides the control-side support needed for playback
>> bring-up, including register programming, serial interface setup, clock
>> handling, mute and gain control, reset handling and interrupt support.
>>
>> Program the init table during codec initialization and reapply it only
>> after an explicit device reset so the static device configuration is
>> not rewritten on every playback start. Also program the TDM control
>> slot-count field from the runtime slot configuration so the same codec
>> path can be used with 2-slot, 4-slot, or 8-slot Audio IF backends.
>>
>> Keep the stream-time power-state sequencing in the DAI callbacks and
>> use normal regmap access for the control path.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> ---
> ...
>
>> diff --git a/sound/soc/codecs/wsa885x-i2c.c b/sound/soc/codecs/wsa885x-i2c.c
>> new file mode 100644
>> index 000000000..a7d8f8d48
>> --- /dev/null
>> +++ b/sound/soc/codecs/wsa885x-i2c.c
>> @@ -0,0 +1,1643 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/* WSA885X I2C codec driver */
>> +
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/regmap.h>
>> +#include <linux/property.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/slab.h>
>> +#include <sound/core.h>
>> +#include <sound/pcm.h>
>> +#include <sound/pcm_params.h>
>> +#include <sound/soc-dapm.h>
>> +#include <sound/soc.h>
>> +#include <sound/tlv.h>
>> +#include <linux/interrupt.h>
> Can you keep the headers in alphabetical order?

Hi Bart,

Thanks for review the patch and the feedback.

Ack, Will update

>
> ...
>
>> +
>> +#define WSA885X_FU21_VOL_STEPS 124
>> +#define WSA885X_USAGE_MODE_MAX 8
>> +#define WSA885X_INIT_TABLE_MAX_ITEMS 256
> Add newline.
Ack, Will update.
>
> ...
>
>> +
>> +static int wsa885x_apply_init_table(struct wsa885x_i2c_priv *wsa885x)
>> +{
>> +	int i;
>> +	int ret;
> I'd put it on the same line (elsewhere too) but that's personal preference.
Ack, I will make them to a single line.
>
>> +
>> +	if (!wsa885x || !wsa885x->regmap)
>> +		return -EINVAL;
>
> You have a lot of these checks but this can't really happen, can it?
Ack, I will cleanup and remove the all unnecessary checks and update in 
next version
>
>> +
>> +	if (!wsa885x->init_table_size)
>> +		return 0;
>> +
>> +	if (!wsa885x->init_table)
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < wsa885x->init_table_size / 2; i++) {
>> +		u32 reg = wsa885x->init_table[2 * i];
>> +		u32 val = wsa885x->init_table[2 * i + 1];
>> +
>> +		if (wsa885x->batt_conf == WSA885X_BATT_2S && reg == WSA885X_SPK_TOP_LF_CH1_CTRL11)
>> +			continue;
>> +
>> +		if (wsa885x->batt_conf == WSA885X_BATT_2S && reg == WSA885X_SPK_TOP_LF_CH2_CTRL11)
>> +			continue;
>> +
>> +		ret = regmap_write(wsa885x->regmap, reg, val);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int wsa885x_hw_init(struct wsa885x_i2c_priv *wsa885x)
>> +{
>> +	static const struct reg_sequence regs[] = {
>> +		{ WSA885X_DIG_CTRL1_SPMI_PAD_GPIO2_CTL, 0x2e },
>> +		{ WSA885X_DIG_CTRL1_INTR_MODE, 0x01 },
>> +		{ WSA885X_DIG_CTRL1_PIN_CT, 0x04 },
>> +	};
>> +	int ret;
>> +
>> +	if (!wsa885x || !wsa885x->regmap)
>> +		return -EINVAL;
>> +
>> +	ret = wsa885x_apply_init_table(wsa885x);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (wsa885x->batt_conf == WSA885X_BATT_2S) {
>> +		ret = wsa885x_2s_conf(wsa885x);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return regmap_multi_reg_write(wsa885x->regmap, regs, ARRAY_SIZE(regs));
>> +}
>> +
>> +static int wsa885x_unmask_interrupts(struct wsa885x_i2c_priv *wsa885x)
>> +{
>> +	static const struct reg_sequence regs[] = {
>> +		{ WSA885X_INTR_MASK0, 0x00 },
>> +		{ WSA885X_INTR_MASK0 + 1, 0x00 },
>> +		{ WSA885X_INTR_MASK0 + 2, 0xf8 },
>> +	};
>> +
>> +	if (!wsa885x || !wsa885x->regmap)
>> +		return -EINVAL;
>> +
>> +	return regmap_multi_reg_write(wsa885x->regmap, regs, ARRAY_SIZE(regs));
>> +}
>> +
>> +static int wsa885x_wait_for_pde_state(struct wsa885x_i2c_priv *wsa885x, int ps)
>> +{
>> +	int act_ps = -1, cnt = 0, clock_valid = -1;
>> +	int rc = 0;
>> +
>> +	if (!wsa885x || !wsa885x->regmap)
>> +		return -EINVAL;
>> +
>> +	if (ps < 0 || ps > 3)
>> +		return -EINVAL;
>> +
>> +	do {
>> +		usleep_range(1000, 1500);
>> +		rc = regmap_read(wsa885x->regmap,
>> +				 WSA885X_SMP_AMP_CTRL_STEREO_PDE23_ACT_PS,
>> +				 &act_ps);
>> +		if (rc) {
>> +			dev_err(wsa885x->dev, "PDE state read failed: %d\n", rc);
>> +			return rc;
>> +		}
>> +		if (act_ps == ps)
>> +			return 0;
>> +	} while (++cnt < 5);
> Newline.
Ack.
>
>> +	if (regmap_read(wsa885x->regmap,
>> +			WSA885X_SMP_AMP_CTRL_STEREO_CS21_CLOCK_VALID,
>> +			&clock_valid))
>> +		dev_err(wsa885x->dev,
>> +			"PDE power state %d request failed, actual_ps %d, clock_valid read failed\n",
>> +			ps, act_ps);
>> +	else
>> +		dev_err(wsa885x->dev,
>> +			"PDE power state %d request failed, actual_ps %d, clock_valid:%d\n",
>> +			ps, act_ps, clock_valid);
>> +
>> +	return -ETIMEDOUT;
>> +}
>> +
>> +static int wsa885x_codec_hw_params(struct snd_pcm_substream *substream,
>> +				   struct snd_pcm_hw_params *params,
>> +				   struct snd_soc_dai *dai)
>> +{
>> +	struct wsa885x_i2c_priv *wsa885x;
>> +	u8 pcm_rate, cs21_sample_rate_idx, cs24_sample_rate_idx;
>> +
>> +	(void)substream;
> Do we warn about unused arguments in the kernel now?

Right, this is unnecessary. I'll drop the unused parameter cast.

Ack.

>
> ...
>
>> +
>> +static int wsa885x_stereo_gain_offset_get(struct snd_kcontrol *kcontrol,
>> +					  struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component;
>> +	struct wsa885x_i2c_priv *wsa885x;
>> +	int val;
>> +
>> +	if (!kcontrol || !ucontrol)
>> +		return -EINVAL;
>> +
>> +	component = snd_kcontrol_chip(kcontrol);
>> +	if (!component)
>> +		return -EINVAL;
>> +
>> +	wsa885x = snd_soc_component_get_drvdata(component);
>> +	if (!wsa885x)
>> +		return -EINVAL;
>> +
>> +	val = wsa885x->stereo_vol_db + 84;
>> +	if (val < 0 || val > WSA885X_FU21_VOL_STEPS)
>> +		return -ERANGE;
>> +
>> +	ucontrol->value.integer.value[0] = val;
>> +	return 0;
>> +}
>> +
>> +static int wsa885x_stereo_gain_offset_put(struct snd_kcontrol *kcontrol,
>> +					  struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component;
>> +	struct wsa885x_i2c_priv *wsa885x;
>> +	long val;
>> +
>> +	if (!kcontrol || !ucontrol)
>> +		return -EINVAL;
>> +
>> +	component = snd_kcontrol_chip(kcontrol);
>> +	if (!component)
>> +		return -EINVAL;
>> +
>> +	wsa885x = snd_soc_component_get_drvdata(component);
>> +	if (!wsa885x)
>> +		return -EINVAL;
>> +
>> +	val = ucontrol->value.integer.value[0];
>> +
>> +	if (val < 0 || val > WSA885X_FU21_VOL_STEPS) {
>> +		dev_err(component->dev, "%s: Invalid range, Val: %ld\n", __func__, val);
>> +		return -EINVAL;
>> +	}
>> +	wsa885x->stereo_vol_db = (int)val - 84;
>> +	return 0;
>> +}
>> +
>> +static int wsa885x_i2c_usage_modes_get(struct snd_kcontrol *kcontrol,
>> +				       struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component;
>> +	struct wsa885x_i2c_priv *wsa885x_i2c;
>> +
>> +	if (!kcontrol || !ucontrol)
>> +		return -EINVAL;
>> +
>> +	component = snd_kcontrol_chip(kcontrol);
>> +	if (!component)
>> +		return -EINVAL;
>> +
>> +	wsa885x_i2c = snd_soc_component_get_drvdata(component);
>> +	if (!wsa885x_i2c)
>> +		return -EINVAL;
>> +
>> +	if (wsa885x_i2c->usage_mode > WSA885X_USAGE_MODE_MAX)
>> +		return -ERANGE;
>> +
>> +	ucontrol->value.integer.value[0] = wsa885x_i2c->usage_mode;
>> +
>> +	return 0;
>> +}
>> +
>> +static int wsa885x_i2c_usage_modes_put(struct snd_kcontrol *kcontrol,
>> +				       struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component;
>> +	struct wsa885x_i2c_priv *wsa885x_i2c;
>> +	long val;
>> +
>> +	if (!kcontrol || !ucontrol)
>> +		return -EINVAL;
>> +
>> +	component = snd_kcontrol_chip(kcontrol);
>> +	if (!component)
>> +		return -EINVAL;
>> +
>> +	wsa885x_i2c = snd_soc_component_get_drvdata(component);
>> +	if (!wsa885x_i2c)
>> +		return -EINVAL;
>> +
> You seem to be repeating the same sequence in multiple functions just to get
> the address of wsa885x_i2c. Can you factor it out into a separate helper and
> save some lines?
Ack.
>
>> +	val = ucontrol->value.integer.value[0];
>> +
>> +	if (val < 0 || val > WSA885X_USAGE_MODE_MAX)
>> +		return -EINVAL;
>> +
>> +	wsa885x_i2c->usage_mode = val;
>> +
>> +	return 0;
>> +}
>> +
>> +static int wsa885x_i2c_rx_slot_mask_get(struct snd_kcontrol *kcontrol,
>> +					struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component;
>> +	struct wsa885x_i2c_priv *wsa885x_i2c;
>> +	u32 mask;
>> +
>> +	if (!kcontrol || !ucontrol)
>> +		return -EINVAL;
>> +
>> +	component = snd_kcontrol_chip(kcontrol);
>> +	if (!component)
>> +		return -EINVAL;
>> +
>> +	wsa885x_i2c = snd_soc_component_get_drvdata(component);
>> +	if (!wsa885x_i2c)
>> +		return -EINVAL;
>> +
>> +	mask = wsa885x_i2c->rx_slot_mask;
>> +	if (!wsa885x_is_valid_rx_slot_mask(mask))
>> +		return -ERANGE;
>> +
>> +	ucontrol->value.integer.value[0] = mask;
>> +
>> +	return 0;
>> +}
>> +
>> +static int wsa885x_i2c_rx_slot_mask_put(struct snd_kcontrol *kcontrol,
>> +					struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component;
>> +	struct wsa885x_i2c_priv *wsa885x_i2c;
>> +	long mask;
>> +
>> +	if (!kcontrol || !ucontrol)
>> +		return -EINVAL;
>> +
>> +	component = snd_kcontrol_chip(kcontrol);
>> +	if (!component)
>> +		return -EINVAL;
>> +
>> +	wsa885x_i2c = snd_soc_component_get_drvdata(component);
>> +	if (!wsa885x_i2c)
>> +		return -EINVAL;
>> +
>> +	mask = ucontrol->value.integer.value[0];
>> +
>> +	if (!wsa885x_is_valid_rx_slot_mask(mask))
>> +		return -EINVAL;
>> +
>> +	wsa885x_i2c->rx_slot_mask = mask;
>> +
>> +	return 0;
>> +}
>> +
> ...
>
>> +				/* INTR_CLEAR registers are write-only; use regmap_write
>> +				 * instead of regmap_update_bits to avoid the read-modify-write
>> +				 * that regmap_update_bits performs on non-readable registers.
>> +				 */
> /*
>   */
>
> style comments please
Ack. will update
>
> ...
>
>> +	ret = devm_add_action_or_reset(dev, wsa885x_gpio_powerdown, wsa885x);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "devm_add_action_or_reset failed\n");
>> +
>> +	i2c_set_clientdata(client, wsa885x);
> I don't see a corresponding i2c_get_clientdata(). Do you really need it?

It is currently not being used, so storing the client data is unnecessary.

I'll either remove it or add it together with the code that requires 
i2c_get_clientdata() in a future versions.

Thanks,

Prasad

>
> ...
>
> Bart

