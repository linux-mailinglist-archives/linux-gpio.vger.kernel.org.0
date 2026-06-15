Return-Path: <linux-gpio+bounces-38503-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nMbKFloOMGpsMgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38503-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 16:38:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E40106873F2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 16:38:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V2rJNPHY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f+1akzKb;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38503-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38503-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BD9B300C304
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D413F4DC6;
	Mon, 15 Jun 2026 14:38:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57633F39E1
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 14:38:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534293; cv=none; b=PzBPD1e56wvr7c+m/8QkwG+d8na98ocHbbYyPpHsz7NupBAnsigaoRYiPOtAQ9WqrDDmPWX5PvSEIUWM46DHril+Lk/Ah7QSOH+P9xTA2YfxrPTN0Vg+qWbQ5BoogKNXiFSg2yH1XWFdqdty4siQRyB0Duxj4MP8xNYrfF1A3QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534293; c=relaxed/simple;
	bh=/dqmKEk8IHcyT64dAazScoiyh61y6MuCEqGtr0TDgeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQFCU+RJfhZqjNmSG7AmO1BFRXXhOysLGdS6kPb9qTR2/4VpaRMyU5TS6IOP+mk5wXZ015Gh9qOG6nuEqzObvR3AwcRo7JINDxYIyLIl19xubx520/z22FF+t/X+cROmp0jNzPVpYca5/KghGAef/lAmg0LnZKGFzKCN5VbV/lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2rJNPHY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+1akzKb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FEYhg22984335
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 14:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2J+LVI+c+0smqU6fvzbOLf0LFTi1VUdvON3SrgIXMag=; b=V2rJNPHY3yu5Fz0Z
	FOjU9xPe3Dnhh9j6j+NjNeQ3APHJ7rR5mMP53L4026uFMAcrGKTJWoLR8Qtm9nTC
	GJSxHfnkAlo8V/vdBxt2pXf89myXLuFv0iE+kh2bpZuZ5hfGn8DHfBoVlNzqsyrs
	lbSasmHddLicNNFRm40ew2oFrwe4rwaeo77KxkIFDgLFIZIBtkXaKFQFfs3Og2uz
	Vj1x0AMAV/6ncfqKDAepLHVNptZAPHTL3Nf08oYLvE6WfFbkR1tyDlwBWg8dOG47
	8i0AADjYCMfxJHw1oWkrelC5xF98DS2+US63hhyVAcVU9tb8y8frhkH9ZmQsL8xD
	XP+ALQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete981bqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 14:38:12 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9646994f445so104180241.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781534291; x=1782139091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2J+LVI+c+0smqU6fvzbOLf0LFTi1VUdvON3SrgIXMag=;
        b=f+1akzKbzeTw4IUBkfz6awmNFWnXB9zgqMa6UXAR+ekxVM6BYnc6G5WOm5SFzWzlCc
         lZTNcKpi79Rk91TKkZs8LTBYqiElPl/Avr2ddhi2+H6BtsGFbftuKcjxhP+M/92E8o0t
         hQg0BC5pRQxYIxHteiLSXKQccDzW2+xj4WX409+VV1ddPdnvT7ptmw+3+0OXh7/U9MXB
         30/UdsqdOWZ/781LRa+jtPd7skedd0PPepxG72itNZ+2yYuwWuhzWDylfLsFnTGPjZZb
         Wj+85ZQCf3Ccc6IvVx0Uur96kmcAqe3Ygla7GB0YnikqH6K/SNucTfxiC0L4pugofc7l
         GfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534291; x=1782139091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2J+LVI+c+0smqU6fvzbOLf0LFTi1VUdvON3SrgIXMag=;
        b=oLsgLMVAyZsYpvvZorLnPyruNFLsIybZSlDVVWLxvjP5touQ8k6B4sYS2UgXytD4oV
         7CWofa58FBCQWWF5bhyRQrAqwta8URsAjcC0PmzJrlEgpOG8uYsBYEBB2ue2EXGVWXGZ
         JRBHDJiKviAFJXZW7fWPeHQjTa55X3zeuKhBv6QtFzDlOJ7UAQ/1Rf1md95eJY0erJ/U
         Dj4J6tCg1wyfwnqPoVayC+zstl+uOG6lB1HFQ5b4y1Z3cs6ksG6p36JKrzr6UCoI1I10
         cDHV3KIGHAr2DJA9GVUPpqqkGTil9yfNLf0KtuIIwzq1E3OFi3Ob4K/rjFUmpoy/baZU
         gNKA==
X-Forwarded-Encrypted: i=1; AFNElJ9sj3rBAKAucBh3XxZ7fobsCeP3w29zfXI2wQa1degjWKat2yoN6LZpCN2UtDLAL8jPKWM9mYn3EN9U@vger.kernel.org
X-Gm-Message-State: AOJu0YzN7YlW6i2fqZXNVt7Ep86+9L9fnKS24wb7M7NWBbrb6eQ7W4s5
	g6PGEaZ4m9z4i3F1BcHAE4pdIuKH077eRB22gFRGt9JPKx8MmW8IJ0Bcf89BIivcRpGrNBkXbNT
	bY4X/dy5ZmhDogMvcgWnZ7Sgjz4XYujntDNhzXktiC3EslSZSkJucSdbyjukQLEpR
X-Gm-Gg: Acq92OHKV7UkBBlQd9DZT4kUGD4LjAwqFvnDdfFHkoqnSAwHJw5kJwg8Rm5WRrXDe1G
	cIyYSVmZw5FystZWT8GXKaSDW1ERvMZEsOGFI1VJ1meecl6PUGvFNDbR8rJnTr+jJwXqVcFUhLZ
	IrwdppN3XvTpS03gUx3U6VGDuVUyZk9woeesDR+0P7ihvCU+BNmEQb3kDtizZKkvTVkuoPcHrWA
	HN5563hyS7PlCJ4965w7q7wa/WzZs10LUL04GoIuKkpIanPb0R8uinlsMRVYFlEDTidc2+xxLxq
	o+pLnKzpaV5NgvkVAl1ckjc4pXav73IzEbnEvXzMG2fkufjU02bQSYJnsuv6U8XU8nePuX/1NFT
	nNXc5QJ8OrYk9mwUq5GigD9w838kstb5ZjojBvTUCLTlVog==
X-Received: by 2002:a05:6102:3f06:b0:674:84bf:8e0a with SMTP id ada2fe7eead31-71e88e6c8d2mr2467507137.7.1781534291093;
        Mon, 15 Jun 2026 07:38:11 -0700 (PDT)
X-Received: by 2002:a05:6102:3f06:b0:674:84bf:8e0a with SMTP id ada2fe7eead31-71e88e6c8d2mr2467497137.7.1781534290655;
        Mon, 15 Jun 2026 07:38:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe5116f409sm453354266b.23.2026.06.15.07.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 07:38:09 -0700 (PDT)
Message-ID: <748147d8-0145-424b-b147-67d92154a989@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:38:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pinctrl: qcom: Avoid assigning thread_op_remain in
 unthreaded test
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
 <20260529-tlmm_test_changes-v1-3-88bfdccb4369@oss.qualcomm.com>
 <bf77fa4c-168a-49ac-bfe9-87880b0bbc9f@oss.qualcomm.com>
 <8b110f90-2001-4655-856d-ec8cff98fc0a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8b110f90-2001-4655-856d-ec8cff98fc0a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a300e54 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=MRFKDVH_TV9PNoJzvMIA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: leET7foypnRn0AY2yGh6rC2R6ctF_-Ar
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE1MyBTYWx0ZWRfX15ty5fmntNJF
 q1BIHTPvY8LJ1rBtf1j8/rbPN2pUIgtX/pg2cjTbWXASevqliKPimMaplsChyGn9XyiMKbNl/6K
 9t5Qh9Oqkx3rNm4ocMThYK5XWsYME7Q=
X-Proofpoint-ORIG-GUID: leET7foypnRn0AY2yGh6rC2R6ctF_-Ar
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE1MyBTYWx0ZWRfXzMSzhwIs48oa
 s19cFSeBruEAlGAvzj3GZcUiIwT3QqZwOk4Wsw67zrPxkUb56H/OsYzk06sxuAQIKhkjzNEdzfa
 M113eEMYEK1b0wua0H6BodN1XMF006TTHaq+wU7JyPHz01afq3MpNQCxLgR+rVu8/ArxlEtB+Lx
 ERyEmo8pnFC8UQNGfvc4BzgVsS9PSMNPONqCK1Ir+ccSQGGMHq1Kc7+mqsd54gSfD83i5BmmD7d
 X2ViAg0FSoM0HLzOyS47w+I4dmi5VZEOC/cmJl+SbiuVDtny0Gc8EPTM/jOMjcSOyfgjivI6p67
 1qeKQaPaQCeXY1BThbsGo/ZatGZET0CYD+0kao1lllOrwAIQaa2Jx12Yn4l/dPxvmdT9QXgaUKx
 TIrVTSKz6lr3EmoaKRQeYamibis70mBYGVUyAy82cJcRuLPX9gvLxwpPTd7+gYkmoRzfVZpQl7P
 92ZmZmUIpmvVEfRyX/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150153
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38503-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:quic_yuanjiey@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E40106873F2

On 6/10/26 8:16 AM, Sneh Mankad wrote:
> 
> 
> On 03-Jun-26 7:28 PM, Konrad Dybcio wrote:
>>
>>
>> On 29-May-26 14:55, Sneh Mankad wrote:
>>> tlmm_test_rising_while_disabled() sets thread_op_remain to 10, but this
>>> variable is only used by the threaded IRQ handler to control the number
>>> of GPIO pin toggles. Since tlmm_test_rising_while_disabled() does not
>>> register a threaded IRQ handler, the assignment is never used.
>>>
>>> Remove the thread_op_remain assignment from
>>> tlmm_test_rising_while_disabled().
>>>
>>> This does not cause any change in functionality.
>>>
>>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>>> ---
>>>  drivers/pinctrl/qcom/tlmm-test.c | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
>>> index 007d6539ceced294e81cfbe93a00c75a98c858de..e9e04300ab3687825255885821ebde0f3ee586a8 100644
>>> --- a/drivers/pinctrl/qcom/tlmm-test.c
>>> +++ b/drivers/pinctrl/qcom/tlmm-test.c
>>> @@ -521,7 +521,6 @@ static void tlmm_test_rising_while_disabled(struct kunit *test)
>>>  	unsigned int before_edge;
>>>  
>>>  	priv->intr_op = TLMM_TEST_COUNT;
>>> -	atomic_set(&priv->thread_op_remain, 10);
>>
>> Should this be setting priv->intr_op_remain instead?
> 
> Should not be needed.
> priv->intr_op_remain is to indicate the hard IRQ handler how many times to toggle the GPIO line within the irq handler.
> Here the test case does not require any toggles within IRQ handler.

Oh yeah seems you're right

> I also found other test cases where intr_op_remain is assigned but never used. Will remove them in v2.

Thanks!

Konrad

