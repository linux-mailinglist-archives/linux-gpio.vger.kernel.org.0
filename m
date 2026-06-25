Return-Path: <linux-gpio+bounces-38868-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qksEGKqvPGrgqQgAu9opvQ
	(envelope-from <linux-gpio+bounces-38868-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 06:33:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6D16C2AAF
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 06:33:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EWmExZUF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PWSH4snW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38868-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38868-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08C66302A6BC
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 04:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E672DCF4C;
	Thu, 25 Jun 2026 04:33:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABE01624D5
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 04:33:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782362020; cv=none; b=IGI6YKvlBPRVm1NTS4CjLk5zk2YzRZhPByR1YNoI3Rro7WXivkaFfJi0c/SSYY9lVHbRTx1DQ2f/QqmF3frW7rSgL1OadcNzKEW0KG/6rsvUSaPqKRtHYgrrXTvyNkdrY+yvQYUU14AqOzEicvB2i33BAB7ykInAFku6XCRHrU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782362020; c=relaxed/simple;
	bh=di87V4TuWc8GxaW2bpmtLqkg86RNsVY13ZKDNnUAke8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwgZ/qhLDNvaoWPXv7BJSfdqtkGEqkaPWHKJ7wELKm1UUDbKnDXEfXlVi1x399A5YOCLEtJtKlGVQyk2jKJQwkpcDW1sexlnhYJbVJdJQkcLPNvGj+Yodw+fTzKlQSXxOAtMc/tBDyoI6la1J0SoCVM4rxYxqkGsIBrQ7wTa+D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EWmExZUF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWSH4snW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eBAJ559059
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 04:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+FT5jSvovKl8mmSq0cLr6FQpeeAxgbMVrgag/p1Y74=; b=EWmExZUF1I3+nn1z
	iwUXTnwl0sTFyMMiydaHqbC2SdsIEEj/T8YdA0Z2lp9x3g3z+5Ui/Yf29u7CFRd5
	ZS5eTePRAFHD4tWDh21LqlNr5oZ9XT+WpRLtFVXeGX+Xd/lAN4oQjCt6SH7RNL58
	HVWk6A6aVw8rtbBP4920wvJJ/OvKNmEvg8tqX7PwzWtJpH4utoGKh4liwjunQD6W
	J1bJamDStUNdGsziDCsoXAdLkCoa5aVVxUPCrj4l4CHPzQflZ37lDDyr5EzbErq0
	bFebqKrzn9MWtRi6HN6cfCv4Qli7LfXjyTV3+WLyuM5Cb6VFHglxqixqV6Q2VFnY
	nv2AHQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d454032-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 04:33:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c011c7cb9so5194246eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 21:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782362018; x=1782966818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+FT5jSvovKl8mmSq0cLr6FQpeeAxgbMVrgag/p1Y74=;
        b=PWSH4snWfILMzzVwiN+0Bwajlw7779aLYskcLfRHl0JNnfB4QW6AgHRo7WRIFqSlSN
         IscHnOQCASaLJAQTe2BkElc8W6J5PXQpUM7hjL9/tHd7KsxqhWTc+J+F71JQtQP3m332
         7asklkRRdj16d/bN+gxfDUeXm0VmuHYS5Yip+ECcHFFmcf33NvizxnRSer7rMZPPyCLy
         oLFja2eyrfEVfDhaJOKPZwzXVL/SPXhpSswEAuNbNL50X4Ds4itnoQAG+NTBXT9OEEYG
         zFrXYidpzqwPxy6KAHqoRg5kJ9wyujVWcM/VIXlENW+KHgW6LMkY4f6MXz6Tp9zYJwET
         QawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782362018; x=1782966818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+FT5jSvovKl8mmSq0cLr6FQpeeAxgbMVrgag/p1Y74=;
        b=Gb5HIzMcC5sYsO2tRugls06aLSF+zSCgXx06d+v4gTOH/3E8HWAyT8bloT8i/ZPMbh
         Hwqw/SGF15Ruv1Xi3wkVJFJukBUeSYsLVpxFSMaaim3JYSU4ktIaTOIGs8tMBqG6wL+/
         JO3a4AJvgSbxRVdvkB9pAkZtMZaaKelvCF+kjIfHuXNKw2fxZgSA4oWVNpg+g4v4Bbu3
         dB/F4GjobTsj89v8ExcdTZdk6fBghK5l2iraI+BG0FDTSgA1G9qfQR5nrRPtQjSSl3xw
         4x41DWJnwFlAAZ1fJRSuNxWxAJQKtNxOUZ+RaCJJ8lM88jZ4dBE1SG6BzparBAtQmGnu
         ercQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWC3MC6r1OeOMJdC6r1MKfcmU83gR9I0nu0e6zKnOG03lXRfoJUXY0L/hIf6y2vNEGyUgvM6mxjYsq@vger.kernel.org
X-Gm-Message-State: AOJu0YwsDl2FT6uuS7mW4/IxEDs/aX5sBExpL5WaebxWIoHG5jHiXQUM
	mLCiUo3HgVZVJ9hAjN7nHc1IKZODlcs25Q532UOID1C5yu/e71h6QYSSIVUIylR/g8Y20Qp5LiG
	AZsxiZWl+/KWox77CjFEemyBAlLd8mJHzTcXe6VdAehJ+ir/ROz+4sPzkuKJz2rQe
X-Gm-Gg: AfdE7clUpnV/oPa28C3M52Ud3nbIsBvg+2abxQOPh8EZz9uXJfq7uCHAN8fd85XTeP6
	2t58aaXPoG2uFuVOIn+eqqmLVtDvLgtcmzsHcxveY2PUpAZduSS5eHdDzdaqZe7E/iU+qvQbOAo
	k6F4lMNDyt6UCAGaCN7CCxLuLZ9HP6P1pkMuPdOI1c0zCFuWtOGplYHKRJe+0uk1a6iRht4pWIM
	p1wkhfVZEiXbIV891s0JNtoIzmWJwpk48O5wnSaJdJfRskl3ypfRWXjN5u/LvoPT63Xvt35vLys
	WPgPy/gnEoUZ8lcEJ66zzSL3kTODTuK1GhbaZoX/lgcKP0AVzDdlTIIuRTUJhm7Z5k+wcJlTDwY
	2woMCMnlkFXSKgdtEfBra1Zb3oQEveYzq7pzzfL4=
X-Received: by 2002:a05:7300:7308:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30c84e2074cmr1135170eec.11.1782362018185;
        Wed, 24 Jun 2026 21:33:38 -0700 (PDT)
X-Received: by 2002:a05:7300:7308:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30c84e2074cmr1135135eec.11.1782362017677;
        Wed, 24 Jun 2026 21:33:37 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c664sm4251756eec.8.2026.06.24.21.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 21:33:37 -0700 (PDT)
Message-ID: <37f34aff-c68f-43ca-b23c-500cc9bb119e@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:03:32 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: qcom: Unconditionally mark gpio as wakeup
 enable
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
 <d9e778ea-8a67-4576-9c96-9cfd859a266a@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <d9e778ea-8a67-4576-9c96-9cfd859a266a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAzNyBTYWx0ZWRfXzMEcugkiM1OM
 owvsnv4WfrlJG8N12zIvdZYRO5osIv8tpoqQWob1mS68xmZ/sA3AbvLZz2/k7VkGH6SdB0ZbONK
 uWF5Jb/qfeic2bzMosWHMEcwmxnOtc4zpI+CM49CiLDCSfjSk323BY1u8ppQi9Sypa9Aq6bUzcA
 A0xHhxtL+V3PmHJVIaIquL0D6jMcNIDm3/ipdmVjTvZ5tZ2DRmktZzuxWuFjllx1fZVjCPctR8d
 v97wJbAz6w/D3PKmYkTVknLUvl+iWI8ii0BDaw/MaQLECb1Zv1yHE4XqJIcC22lakDWBUx/EEY3
 +j6qLAz7fZmOZexJeIrQFGc/BvCeBj6JdBAnkTLEOElV4ZDNhziGZFcIJPeE1L6Ny4gjeKM5/xa
 Opr578InEozSOTcuYNUuGMl4gvpotkcRGJ4d4YdMzilO4ffsaq5YlbaY5e2k+AIxdjUWekpLTII
 5+dR2yKfLNjJnGxZLeg==
X-Proofpoint-GUID: rn3MEuOi9UJBw4rQ95jIHBu00LinLZuC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAzNyBTYWx0ZWRfX3ESXzJUV704H
 qH18yFxrml3d5D6jp3nCOBpzGu1ZB5+7iJmz5IHQnYpPj6MMy/b0gr7Nk8Ldie528W2hJrjG7DH
 8SHbGzRtOvOqljAMY0M5GgG8IUTbxqE=
X-Authority-Analysis: v=2.4 cv=Ar7eGu9P c=1 sm=1 tr=0 ts=6a3cafa2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=K6J0lT_fCWCxxGhrr3QA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: rn3MEuOi9UJBw4rQ95jIHBu00LinLZuC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250037
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38868-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:maulik.shah@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF6D16C2AAF



[...]
> 
> This is a much better commit message, thank you!
> 
> One question remains - should we set skip_wake_irqs for MPM too?
> 
> My understanding is that no, since the MPM HW is simpler and doesn't
> have a register for acking IRQs, so we need to do it from the recipient
> (TLMM). Is that right?
> 
Yes that is correct. skip_wake_irqs is set for PDC since PDC can handle interrupts
during active time and SoC sleep time both, so any wakeup capable interrupt source can
be handled via PDC at all times. However MPM can only handle interrupts when
SoC is in low power mode, it does not have the functionality to detect them when SoC
is active. skip_wake_irqs differentiates this behaviour.

Thanks,
Sneh


