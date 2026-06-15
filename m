Return-Path: <linux-gpio+bounces-38436-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SrS1KQmPL2oGCgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38436-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:35:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0BE6837FA
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:35:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eq2KrgWa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CeI5FSfc;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38436-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38436-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8CAD3001FF6
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 05:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8573A7F61;
	Mon, 15 Jun 2026 05:35:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145D13A7F7A
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:34:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501701; cv=none; b=YPGHVuHF5F6y/kKzXfWgniNceBSHUmrGzl3b/hl8+l1Mh+Oq7HvkjYTqK2iI9A9bsIMPG4tM6KQZlJs3UUeU7kuYCkfU6DzYPYFxcbiYNWtxpSRwxdhC3tbvvCWKzKif1C+xNesc9iovBIMbiYaX5W5tXC5Aqu7HNtPtNJwBhKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501701; c=relaxed/simple;
	bh=RxblkpIC033IGRqSz8PzKM3bfvj7YHZDH/KxCenMQsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dBsLzhFSMJeaO+mdYA1ZTs3kxi6tVIqwAA6YO7v02W8VXcFOOfYhr70jc+Qx6ZdOWB86nafwTqUN+6iWnXX9ApvAAx9lqU2gXIsyGUefOF/nqfG3VTkrY8OCeCXXW37Pu+B0U0rSonpBk099QuZB6lzqSJEKtNjg34te1A8PpyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eq2KrgWa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeI5FSfc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kAF83307877
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x05aYQlMjFXE+lV3LQNFzHhZRxyxeXI9gIkbFls0RTg=; b=eq2KrgWa2jv9+uVX
	2E3loq3TYiLyTL87k0di+sAVFMxakWN1rvT8IEQLc55A2pBxMezivKRruvaUOOZG
	j+39h9jUPvA8MYB04i9LF+S03P+s7Id7l2pLQuteSc4QaWodh8QlwTthP2HtnAJ0
	fu5BWf44w5sT7Sib7u7dsW4RCAcHCI66kBGvkQUM+ODuCNddx9ius2CEC8AdcE6S
	789QJho9XQ1e4E3r5LKipM35JVCdgRuRyVBSJWNHlm+EHONcpFT3JNZWZPY3bxvj
	MKWVOc1XpJML5uiy6r/k3xnb3nkERKgZkAc0oeJnbvsbhCKWml2h6beiT9WWgGam
	5a0KCg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6wqu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:34:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b828c8so4814867a91.2
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 22:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501697; x=1782106497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x05aYQlMjFXE+lV3LQNFzHhZRxyxeXI9gIkbFls0RTg=;
        b=CeI5FSfcSqJqEYcxeszp0/h0TgqjWDF6WA0q4uSXyOaxxgmzDalTsP7pS+KjRYMaHV
         5wHsE8iQL5nnxkhUSyowFgJm1Ek+skFSrbBmhkehPXLJrcPkrvK9gs5URAXI/h3JUNgX
         7RV3Ddmyq4KZ3Roakt2YuYv/wObEgy4zUJP6r21hYs4l76V0pKHbEmb8LK09Zm1Y2yQH
         v3ZVTH6OyKcrhlqIF+LylwyA2I5Lr2OW+3/3AGXaJtaZKoJCopnP1EUNMs8D2x7aH5eE
         Hi6qM13wvTe8NiJXkGrqeOuwMhdtefpiU0/Q3jB+BFV8Pl5LyT63qjFtc27DH1SNTgrH
         oujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501697; x=1782106497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x05aYQlMjFXE+lV3LQNFzHhZRxyxeXI9gIkbFls0RTg=;
        b=Qmaws6B5eYYeuBbSBClj+hkc+TVUv5Dx++V67gbbst2Q5w68qxfJqQM7ZLmO+i6EEC
         1esHlxNPux3ecqRa/tyNleFb7y9mLSEheInjNrm+uUvJ/vAyksEvE3HLgoTNmt/pHeAD
         tEDDp647LiXG6b0Qlj07zyyFU7x5lYnwCdlZwGyKZ3S0hAd6GDOmyVATuZ6IyWY6cy1/
         A62eN3iyIsAdIGO1JwUqlMB2tb5D97uhQ6CzjPcvBGcD2koCETeUlYUEi8Gy1Zke2QIL
         1Ok8JjkgCR94ONFhzoUDtetgwGeB/wXOYtY1xqmm5RnY+NBZFdgDO7TAjvWJuSHX8j3H
         rjSA==
X-Forwarded-Encrypted: i=1; AFNElJ8jGbBtEeYrel8GciObADs7KViRbNZJ0ZTjb0LDdV7RfiQekFhl1W3284E1hzFBWeeAbkqtWnNB+4DA@vger.kernel.org
X-Gm-Message-State: AOJu0YwjqAsZCskQTkU8bmPla7rwWWen8YbjQBbKmzWu8b8JKLyioVm+
	Hfun7GnL/t0FbQVlikMx4hHmF79uNUozS/mqgy33xRKphhBvKEQxEj1WUJDy3c5IaoBtHkN1i+P
	81D7ji1F+KJOoOoKRpG6OECqNt3/mDx6DFuIL5mSG2TZVA9UqVBFCAHWiPFvq4MAe
X-Gm-Gg: Acq92OHhWGYX3GwQ+y4POJAzugo36/WLQIDo9ahaWnnMmmcTYusdmylQrV4U8cd8dl7
	KsFuFP/iSujbxhrEJkjNktg3o13z+MX2AnrnDbHKexyZbtBiA1ahI7wCJONrGMgf6vhWXTozDMu
	u/uUBaf7b4XJtcmjibQrN8eVQcv1n2y/VUpUBMCM90llv2L3tQFxrJ91F+9KbnluUVYB+e01lPg
	apIqX2K3Zycc/9aplQBm8kQDou0+EKtuufcFYlVMnZJJEVlWXu9teQ3y5eRk41MV2v4zKBuVujT
	GXzAdPr2dsalTBvlNrdhRY6rJWuQ3my6FIcO1tOD3Fl22UNPjiWWtPTiMUMCaIWjZkKZYbemgTk
	BNIKcHXReNdQ7P5S1vgeeyUmRZ0SFCNvoaC8k9U4HS+I6RBCnyw4=
X-Received: by 2002:a17:90b:5102:b0:36d:df4f:ab2 with SMTP id 98e67ed59e1d1-37a036ea6c5mr13740047a91.13.1781501696730;
        Sun, 14 Jun 2026 22:34:56 -0700 (PDT)
X-Received: by 2002:a17:90b:5102:b0:36d:df4f:ab2 with SMTP id 98e67ed59e1d1-37a036ea6c5mr13740026a91.13.1781501696316;
        Sun, 14 Jun 2026 22:34:56 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a233f58ccsm9379806a91.3.2026.06.14.22.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:34:55 -0700 (PDT)
Message-ID: <fe0c4483-3bf2-4c49-9652-87afc91f55ea@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:04:51 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <ahWLPy8vg_neYgrX@linaro.org>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <ahWLPy8vg_neYgrX@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfXwivsd93aApaA
 GRM8y4mdwq5Y5eZ129forn+t13FNFZ6xA3WuF2tkf/kFAZHRULO/vim0zFAzvvIC+qb67caWD1z
 HutEm7K1v3UZ4eApwgaQN3YdHdDI4/c=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2f8f01 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JbAvS3xc7vGkN5pBbYkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: JpC-RdXhAN6UWVIxbPMBIP3ebyQ6r-p2
X-Proofpoint-ORIG-GUID: JpC-RdXhAN6UWVIxbPMBIP3ebyQ6r-p2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX5+F3L/EtS++q
 JmZnppO2c/UwXOmrbXOa58l/akTHYlTRRco57cFDAYN2xwtsgWhN+S5So4iccX3MFNWCTwtLY2x
 5a3XyUIMacHS7daV99TkSnTyjRe6GuOp2NqMGnlQCauLpFM8p9ikB2jWTpVWGzIgsYup1FIW4UK
 VsnNiJ3GS7SWOZONfylpfxR3wHVnKXkUGsc7xNz2RbmnAv4y6A7RXupUtIJE3p17/3XIqysSH5i
 rvz9grwPZuJmvOeGsbLnnBS7KRZEJTxZ5VOiVTaFY9+4WX5SjMsNqmomT4xqkqM/N80ZauWYQnc
 D/sg6l4EXL+RWmSV4ytV+QYkSyJGDWKU8b8fMcd4fNMjtnDAhgbpFoZd6hYxDkKplSoBDeglcQG
 DxWfSJdCdmtpwLt0mdtrW4c4WaGTywW6YyWI2nsu0xX1QIt3PM6SKcNxj1SSBhdlLRI+zlRopF8
 CSE5IFs2MEWvD06KvTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38436-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E0BE6837FA

On 5/26/2026 5:29 PM, Stephan Gerhold wrote:
> On Tue, May 26, 2026 at 04:24:36PM +0530, Maulik Shah wrote:

[...]

>>
>> The series has been tested on x1e80100 CRD with both old and new firmware
>> and also on kaanapali.
>>
> 
> Tested how?
> 
> I recommend testing with the tlmm-test module Bjorn added, in all
> supported configurations, to make sure you don't introduce regressions
> for one of them. It would be also good to provide the test results here
> in the cover letter.
> 

Sneh tested via tlmm-test and figured some issues with test module [1].
The test module fixes are merged now and I will add results in v3 cover letter.

[1] https://lore.kernel.org/linux-arm-msm/20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com/

Thanks,
Maulik

