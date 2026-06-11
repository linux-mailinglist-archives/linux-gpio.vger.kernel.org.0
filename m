Return-Path: <linux-gpio+bounces-38323-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QhNFJMaPKmqysQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38323-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:36:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 289C8670E53
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:36:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b4up0xld;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Bb9MsRah;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38323-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38323-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7AECB3016C4C
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 10:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C873D0BE4;
	Thu, 11 Jun 2026 10:36:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348173CAA49
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 10:36:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174211; cv=none; b=KjjSlR5vOvVZTT9ORqTxOETF5wbqcCiBN/IzGLdwwDlsrrwMsJnM9sbp2mdRJquijnBFK5bYZefTqj+iNvNkgpx7q88TbnGvwGVsJcUFOugOVe8ta24ShWuPjEL71apMaZ3nQC/sCZr8Onnhz6SBco96uNaciEl+c4+6bJFKdY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174211; c=relaxed/simple;
	bh=wbQLUAzVBUhhiK5N3Wwqo+NsDf+9mw4irZ+wa8g4/5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nh44BCWcEYpEUUwDu5u67Wi3TUHcAXLrS+6rPkAvS5vHiDxnyGqUon+gZe4jIH4LiuNpQcah0twFGohIVDvQhDlVm1tB0J5NH6hrXvIg2JkXOmunoEHrTVUg/7YEtv1AOZagXsex6qDsjkK10NBg7wzvPHv8av3v5Xi0XQKJGaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4up0xld; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bb9MsRah; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xGTx242841
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 10:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mv4KppXr2RPw18HcNjCs9EUos8UhpHx6TTozk/GPXOk=; b=b4up0xldvTfdFm3p
	Isp8OhJeJZbZ5s2HvTMBUOOT8/KQx5eLYvLaRQViW0Zov2dWhUymjl0rPhkWDZnc
	JY6+7c10nENZXC1AZxp1s4ZLMNYfXgv8lLXmKDIcWKfd1pcZYs3eEYhjn/vL2ueO
	MqjaZKVLzW+EJIgtuTqsaBRycxbOEEzXdefc6cPEYaFb89OtG8/jj1nbovcLRKy0
	WRgHSqZbxBKvLIEhcHAT9m0mGUXXoskaK7W/+/aj6VDg9Ukc/lrPhMYXMsURPEfU
	FX11GDveGRmwD/XQvVya5xoFZrR+Ho6dyLgHbFhBWAA4e4wgZhbpygHSs7iAPHfA
	rzw88w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7030jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 10:36:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157b3e5182so97719885a.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 03:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781174208; x=1781779008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mv4KppXr2RPw18HcNjCs9EUos8UhpHx6TTozk/GPXOk=;
        b=Bb9MsRahfAsb4NeL4ZZt+H4CM8BYNWhPZrLzCkxFoeU3RFUW9HOtH5WM8g4U7MEhFH
         nAAKNndNdiHD8qT0weol028pC3uXd6xe4ouvriDq8V6hIBqy2w5zGi+gbe/x/jmEKWw2
         Ac0EyGwWn/jJqWTcMHr3zW71A+rj24S2KCcX0hnfxZKJ3Yv6J54MPplv7wshNCpsBXYq
         sH8WDPtiyDwxpqrlVltmcYrFKyzS9HuBnsAwIO4LSYiUcbbmSnZHv11fvdR+ousx6aLT
         593HHT6qyRhnnUotMz9BktBU5FMuDD1psRc1pEvKH69LE7SN7sLDp8xyUvU3VVRh+8gz
         hdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174208; x=1781779008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mv4KppXr2RPw18HcNjCs9EUos8UhpHx6TTozk/GPXOk=;
        b=bpBQUXRG2GTW9FSA3Ou1ywZde4gsgK6BHLMRby9pJS6FvaCPgrrxX2yOLkaL6ccJ0R
         D1FUNqAmfQyiXLTd3Dr+b+zXvfAyVdFsxSHfo+y3bTZRSueE6XmYoJIrkn4ZRpodxj4n
         aCgoMx8/QaH4LIBYaCYUUH9V0RRFYJFL27mTIVApR7+QVCoz/7cibyPaSt1DuwUTLuFv
         qD3g/CWRZfeeduCi7DSUSbV5fIfDmpP0TEB/LBnlaTbM1tg+KhGwncQyJpBbsvYYSLYr
         TfMha4LLj7osTHgs0zHfNNjtuNUJ5jBcYSyqH6bHXb5MzTxvj4NXMsfLjxSNr63AhxYN
         n6zA==
X-Forwarded-Encrypted: i=1; AFNElJ83HVcTb6PqfjGXpollqQD+TpR7YuSJgCpg9xPEeq/y0utLtHTBJpd3kAV2ZnOjGX7uzszf6sGTSo0l@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7lD+wXI9KS9gS3HHtxGfJkBJWIMYr2Ajw84jU9elCFIc6NPPE
	PvYrzsUN9jHhCI6w3aVgPLIcMIXU1x3NOP2EPrPTXBKK7bngmCLZkPSQ3GJp6QrQ3pzhfmtSrqO
	D1lQb/yqhi7ndBgMyBIWD6lxdCTfpBIxlNe1eSoZlwcdD6OuBlIbXzEiUlhyQHuL7
X-Gm-Gg: Acq92OGVlUHWoWIngf3wpEMck+Zdvqs7Nj9PWz86ThGUvhtMvJBAhMJ2t/pDPlSp/wi
	D2VnyXPfT0aLOYUmYuWdkCnLZU89fL+ieSMnVofMfueILtoxGBYuHwbBj1PRPtVxOj3ROjEQH45
	UNtxd+SAHuYxr4LhA12WUOhzRQT9UEbvGmU9fOsYPzEXcCaBqu5DGlR4Zl3AQ7mgq08OMKXms+l
	aqMw1YjPbfsT3ENjJXqAdqyZxiSCvMMc8vlJ08bt4cIXz2gFU5uCTUwUvKCOAWKGQvRmAcZiD0F
	Ujjtad0lP3Ncnr6EzVHTFH3KsXBlwExcJffZxhr4iHHWRO8uWzAVlV0n4WAQxvLABotPQIDx9Xo
	i8tQ+YiSBn/RF+wNQdcPTNh3Q7hbibzUd6nPZC2E9xXxd4/Ig4HJKk/j1
X-Received: by 2002:a05:620a:3911:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-9160a4fd651mr193141185a.0.1781174208353;
        Thu, 11 Jun 2026 03:36:48 -0700 (PDT)
X-Received: by 2002:a05:620a:3911:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-9160a4fd651mr193137085a.0.1781174207841;
        Thu, 11 Jun 2026 03:36:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6595c72esm10431210a12.23.2026.06.11.03.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:36:46 -0700 (PDT)
Message-ID: <4edaf745-d24f-4ce0-9605-e3971f067b68@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:36:43 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
 <4ac5hjmr6divqs4myhcw5sveuboj265sw2jwslbivrfwh5e7ce@6d7ajvgikkgt>
 <18235340-cd42-4d88-bfdb-19aecdd63d68@oss.qualcomm.com>
 <9927f5d7-1eca-4936-b38c-678e76ac11cb@oss.qualcomm.com>
 <vmk6b6cd4jolhisfphgai35eznr5d5uwrhx2qktdwd2qayxwm5@fb2js7bw4dca>
 <837dc7e2-4db8-4a7d-a19f-e53ddbcc9cf6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <837dc7e2-4db8-4a7d-a19f-e53ddbcc9cf6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwNiBTYWx0ZWRfX8da3SgWqoz9u
 RgMiku3cOtVMyj8sFxL6DdkfJO5H7EPOyic3LNgQcVm5t1JFhLVIqi7o1whLa0SGHswQJx2J0/Y
 Gh8P3CPfr6illNnwINGqEgAmQiBiEzIfpmo8608QqKq6iDE00JZHEdFeP+SiaNskRRzmN2dv/9J
 uvBiSzG4e9KRE4cw4786VUI8Bc/9tjhOde53OOv60E8eqsmgrl//yOyIZB8oXvDaWXzMMEVt+bn
 HVOP5Jdb2rs3900txGvS5dxFsBEIK0N7GroHMWw1y1K3UYBty/ryNd2TpvWll5zY1Gxh4kmuRcy
 Fonnf9MzbOwP4vb/nbb+Xcne3b0h6xpZhagML3Q4eUPdMVh+3ygYCoRc1kjW4hf5g8WaAyLIZHu
 HPoVwlstDtmED16yHLBTdGwYwBugN44HV5WALXJtZSH76LePfus3kfQhDmBTjSnnIoomwUBkfns
 Ted2/mKbtxQIP8HaVug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwNiBTYWx0ZWRfXyl2qhywFO1d+
 U2drJ9PXN5Fkd1pIxVEpnVyT4AneVZdS5/KR4NYx0HSgktIofESLBXQBlXXLAxUyXj4ohFAT1KF
 5iZXzv5u6URH4G58rIBQydVctXvlcA8=
X-Proofpoint-GUID: 2fHF5AkCsVoJKiVC6tuX4NbdDiDVvCkN
X-Proofpoint-ORIG-GUID: 2fHF5AkCsVoJKiVC6tuX4NbdDiDVvCkN
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a8fc1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=V0-bULfdxerEnfIzaLIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38323-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 289C8670E53

On 6/9/26 3:28 AM, Fenglin Wu wrote:
> 
> On 6/8/2026 5:21 AM, Dmitry Baryshkov wrote:
>> On Thu, Jun 04, 2026 at 10:02:43AM +0800, Fenglin Wu wrote:
>>> On 6/2/2026 3:29 PM, Fenglin Wu wrote:
>>>> On 6/1/2026 9:37 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, May 28, 2026 at 06:05:35PM -0700, Fenglin Wu wrote:
>>>>>> Currently, the RPMH driver only allows child devices of the RPMH
>>>>>> controller to issue commands, as it assumes dev->parent points to the
>>>>>> RSC device.
>>>>>>
>>>>>> There is a possibility that certain devices which are not children of
>>>>>> the RPMH controller want to send commands for special control at the
>>>>>> RPMH side. For example, in PMH0101 PMICs, there are bidirectional
>>>>>> level shifter (LS) peripherals, and each LS works with a pair of PMIC
>>>>>> GPIOs. The control of the LS, which is combined with the GPIO
>>>>>> configuration, is handled by RPMH firmware for sharing the resource
>>>>>> between different subsystems. From a hardware point of view, the LS
>>>>>> functionality is tied to a pair of PMIC GPIOs, so its control is more
>>>>>> suitable to be added in the pinctrl-spmi-gpio driver by adding the
>>>>>> level-shifter function. However, the pinctrl-spmi-gpio device is a
>>>>>> child device of the SPMI controller, not the RPMH controller.
>>>>> This replicates the story of the PMIC regulators. There are two drivers,
>>>>> one SPMI and one RPMh. Why don't we add a separate, RPMh-based GPIO
>>>>> driver targeting only those paired GPIOs (and we don't even need to
>>>>> represent them as a pair, it might be just one pin).
>>>> Thanks for the suggestion.
>>>>
>>>> I agree that adding a separate, RPMh-based GPIO driver would be more
>>>> straightforward from RPMh control perspective. It makes the new device
>>>> as a child of the RSC device then it can naturally use the APIs for RPMh
>>>> commands. The main challenge here is, we need to make the level-shifter
>>>> mutually exclusive with other GPIO functions when the GPIO pairs are
>>>> used in level-shifter function, which means we need to write SPMI
>>>> commands to disable the associated GPIO modules. I am not sure if AOP
>>>> already handles this; as far as I know, AOP only manages the
>>>> BIDIR_LVL_SHIFTER module registers. Let me double check on this
>>>> internally, if the GPIO modules could be controlled along
>>>> with BIDIR_LVL_SHIFTER module registers at AOP side, and get back.
>>>>
>>> I checked on this internally, AOP only handles BIDIR_LVL_SHIFTER module
>>> registers, it doesn't disable the associated GPIO modules. Also, I still
>>> have no idea how could we make the "level-shifter" function to be mutually
>>> exclusive with other GPIO functions after moved it into a separate driver.
>>> Do you have further suggestions?
>> So, for my understanding, we still need to write SPMI registers to
>> configure the pins and only then AOP can handle the level shifter?
>>
>> I was thinking of using gpio-reserved-ranges to prevent those GPIOs from
>> being used by the normal SPMI driver.
> 
> More background: "level-shifter" module is actually an independent hardware which is not part of the GPIO module. However, they are sharing the physical pins. Which means, from PMIC chip perspective, these pins can be configured to either a GPIO function or the "level-shifter" function. So in PMIC base dtsi file, for example, pmh0101.dtsi, these pins should not be restricted in the GPIO nodes in "gpio-reserved-ranges".
> 
> Also, we need to make the GPIO modules are disabled when the "level-shifter" is enabled, to ensure that the "level-shifter" circuitry is not impacted by the GPIO modules internal circuitry. So it is supposed to write GPIO EN_CTL register (offset 0x46) to 0 through SPMI bus when the "level-shifter" is enabled.
> 
> That's why we have the requirement to access both RPMh and SPMI bus in the same driver.

I was thinking about other ways to solve it.. maybe someting like:

&pmh0101_gpios {
	pmh0101_ls_pins1_2: foo-bar {
		pins = "gpio1", "gpio2";
		// appropriate pinctrl config
	};
};

&rpmh_rsc {
	// should this be a gpio controller? a mux provider?
	// is there another class that would better suit this?
	rpmh_level_shifter: rpmh-foo-bar {
		pinctrl-0 = <&>;
		pinctrl-names = "default";
	};
};

// but where would it make sense to describe?
// fixed-regulator or something akin to that?
&some_consumer {
	someclass = <&rpmh_level_shifter 1>;
};

i.e. the "rpmh level shifter" driver would consume a reference to the
pins, configure them as necessary (just like any other pinctrl consumer)
upon request

Konrad

