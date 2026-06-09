Return-Path: <linux-gpio+bounces-38139-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L01JDcdsJ2oGwgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38139-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 03:30:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A1165BA0F
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 03:30:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="OnVHx7/E";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AJSKnnHH;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38139-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38139-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 462353053FFE
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 01:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8908130C37C;
	Tue,  9 Jun 2026 01:28:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ADC2690F9
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 01:28:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968494; cv=none; b=jobhbU0OBtAyDZcnvnAy3TFUSYnlfGS5q9JJObSB7uwOJSrpmoYJ7HAR3Kohdpf39oSXp+D6DZo5l1upiQ+mmx4Yj6TmsoMZz+QAQam4RCiAWl0+a/pm5xKaVWtrpwJ2xy9UPZ6B9WzCyE0ZBtq4kQcTBw9CB/iU58KU6hpBG5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968494; c=relaxed/simple;
	bh=BwJk+NuHYY4stw75cFgdbElX1PGap2VAfIQrLGLFKi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1jE3NFrrhA5/Q0GfzL4eB95veNIhuX+nzZCFIL4fkeLQvm1lX0kUdjT/z/7bbDwDmJ/GeoIUARw8hJzwXGDnIylYyBp5fL5zni2D0KQjvDiVW2eaYsF0Fm4UYDCCqoafnX0kNaznYtNj9bNdRXyZsSueUgtt5TLnUAuhxOpAcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OnVHx7/E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJSKnnHH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6590s6AP591864
	for <linux-gpio@vger.kernel.org>; Tue, 9 Jun 2026 01:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ResP3+g23q/5QVoIcvFC7sk9tnXM6PNEhK8ZG2iDgfM=; b=OnVHx7/E9InKUcB+
	AGN5D2D1YuV/AKDIRI0Ak76vMAR5OrMaEJQ1c5y65g3nbLRRSQAVPkUE8B+d8BI8
	wWOSuZ/5hTRhuEbuMJ6wCalSJy0jwqk68seXWaI4zRKkSCGNPJAeS1nkiZVyqkro
	6fENDqQ6tsIh6LVwEEBF5i0wQjshMyYYHLJ+hIkeDzYEqZ3NKKS0M1H1jDOxbT/M
	uIjkP4Ii/IME7jJLmDYBFT61HkUMFfFRjZvzZyzcPXIh5/OpzNqBRS1lbbBa+Xb7
	vDK2Yp7ebCguM43MYB0WRHYutG+bNjyr7WUfjoajaDuWUbU3+bxMlNVEhZ6tRxG7
	sDGmJg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkv1su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 01:28:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso3052052a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 18:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780968492; x=1781573292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ResP3+g23q/5QVoIcvFC7sk9tnXM6PNEhK8ZG2iDgfM=;
        b=AJSKnnHHIYMUmufrsoSTZk3y5zfXjQY+qs+nQXna1dDAbZ0teXor9YrQ/xr7CBz1ne
         B+YAETgLDHHd3HB7RVEZPtiAH8zxZ9lJqZm/3kfcRa6AOGC3kJfpynytmabd791eiJyr
         Bj9Hk2lo7dx72DuKscQTt6iliqmML4arbuQNC6svOPAk+AryZPs9ZafSJ9fSlOCF79nn
         lwNLWNqyiCArXagzboxbGiaGlFnfArfxdTHAJ/jElqTWXlm3f/V/nZmyV4wO6Izwemmn
         V8A5w4eEOYj/bXM76T/wl7PBLePG3vhy1uq2dgC4W35biowufZPSiVhv7fUWyXZhDbDG
         ATFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968492; x=1781573292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ResP3+g23q/5QVoIcvFC7sk9tnXM6PNEhK8ZG2iDgfM=;
        b=i/fuv68SSUWtfvE8EmbK1rDrUt5mwfikbxJ1aifeLj74bg15DFgNm16prpzTn2pnLg
         qc93y05mYPNKr/iuimmYLtrKb8xZjIvtPmYsAH1RN7C15U0nb6T9oWo85gs+FUTUuybt
         8FHYsvqxPGRk1Aq6ncXsinWnzhjwWok/RBU359GypXQitTbO7p8dDAOlIUPe18zkTMWR
         sSju6QeLKsGGkT7PSPxGzfQ7YnVwtWi0vzAC1KvKXj0eu2c8NnvGGHzznKbwuMRh8eTC
         rPEqL5j1RoJJR0hqnrDzP+iodJ9ma982mXOQRGh2WOfwBtSqaoiOYM1R+7EeZCOb6R2M
         8F2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8xsmDCKMDC71sZ3p0msufCATgTkCht964AmPG2qVVk3Er7v/xfF+LWSazXpViY/+4OLlknyFab43f0@vger.kernel.org
X-Gm-Message-State: AOJu0YxjT3L7ZgVajIohTlUfh84IKOuNEPsly4NwGzgrSpdcJ2MlpXZf
	IWnXd9ZZRbvpYK7CPhUY7vq/7JHsluZjuWMlle4MZe43x07eI3yg7HydCi478+O3EN/qAHCR5c/
	fM8A23BBpueOdQexsK9MltKTHOBv7EtQgpI2yH0ZixhFzDQrlfAbdKxhoTKczeKLf
X-Gm-Gg: Acq92OFH/bCBZXFNoVe5UBI1asECVWgfDNf+FcMusIoPRzABLdIxiWWYdnPQS1VCQPe
	j37dSdGaDpF6HLY6VM063JYqVfVh7WdpTgVQ3HsDnBxPj9/nqoPC15kFe/SR+OacOq4Oibdq0NM
	k6CyYeOX9PG1xPLYD45r18rJQtHWDkZM57wiyuWS4ujqwOlwsXKHKR7DtiVFd8NrW6SIZhM4jHa
	YQfM3mhdPXftX5vrVJBGI2GeKVX2I88xauBjyfSFnZUjLuJJuxSwFbWb9ZICoarabjGBEIIUGjU
	/YLssb5Jp2l0BXyo+yTiWzqD+A5DPphAsdpcvtA7VOQkIOiZrHkvxWXTGysBzJUqX3EieOPN8ZA
	w0w//EI8y1fIwF/w1AUR319aJQANIFHBRCmuYSl7qudHM/zlYV1wFj43/gA==
X-Received: by 2002:a05:6a21:4688:b0:3b3:bdfd:762c with SMTP id adf61e73a8af0-3b4ccd77cd5mr21154914637.17.1780968491699;
        Mon, 08 Jun 2026 18:28:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:4688:b0:3b3:bdfd:762c with SMTP id adf61e73a8af0-3b4ccd77cd5mr21154865637.17.1780968491217;
        Mon, 08 Jun 2026 18:28:11 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm16992009a12.14.2026.06.08.18.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 18:28:10 -0700 (PDT)
Message-ID: <837dc7e2-4db8-4a7d-a19f-e53ddbcc9cf6@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 09:28:04 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <vmk6b6cd4jolhisfphgai35eznr5d5uwrhx2qktdwd2qayxwm5@fb2js7bw4dca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6EPcnczapJO5EGx6Sepp0VB6NoBnzKGN
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a276c2c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=PiFggYbFkCWDbinlX1YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 6EPcnczapJO5EGx6Sepp0VB6NoBnzKGN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDAxMSBTYWx0ZWRfX7zIBqjSasJMM
 S4/u27VaSLeMIb7Xgh3A6P8Dm1vY5UufP+WP/ZASXIPN1P1khmdnIvrzmd0zviUJ78AnFD+bhHH
 S95HSNPaNssIgSFgNb1galFla9SMKqI04Vw2NIEj0dGV6ECV2gPc7AaOd0QxkWdfk6onwa6+nTp
 QXknFXWAQP5KE5dpG+3T1lH+nj5c005X7btP8L/TUVuBjjOV4ALljnwoKuhc45RdSvCOO6PL+pJ
 ti3WY9KEnQM/QqNWVfD6JpLsyzji6aVcFqB8mjqSh3hjWDRzvuMMjHAjkbyqq5h2jIsnTcyQHJm
 JDFPPOTjErVAhmqBcaYYcGqm1StlNFfXrQo8Ks0ZrpQB3NlAEbWxoxvWXXNvJZDItizRKMVQ8Rf
 cesaAZUL6Te+sWtdaBFhkKhv9WkuwXVQJnqXufy2RtWXR3U/u7LiANZYZXlGU/DLSscmPvIzGa9
 A9GkKr4JsNHlsqJd0rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090011
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38139-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4A1165BA0F


On 6/8/2026 5:21 AM, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 10:02:43AM +0800, Fenglin Wu wrote:
>> On 6/2/2026 3:29 PM, Fenglin Wu wrote:
>>> On 6/1/2026 9:37 PM, Dmitry Baryshkov wrote:
>>>> On Thu, May 28, 2026 at 06:05:35PM -0700, Fenglin Wu wrote:
>>>>> Currently, the RPMH driver only allows child devices of the RPMH
>>>>> controller to issue commands, as it assumes dev->parent points to the
>>>>> RSC device.
>>>>>
>>>>> There is a possibility that certain devices which are not children of
>>>>> the RPMH controller want to send commands for special control at the
>>>>> RPMH side. For example, in PMH0101 PMICs, there are bidirectional
>>>>> level shifter (LS) peripherals, and each LS works with a pair of PMIC
>>>>> GPIOs. The control of the LS, which is combined with the GPIO
>>>>> configuration, is handled by RPMH firmware for sharing the resource
>>>>> between different subsystems. From a hardware point of view, the LS
>>>>> functionality is tied to a pair of PMIC GPIOs, so its control is more
>>>>> suitable to be added in the pinctrl-spmi-gpio driver by adding the
>>>>> level-shifter function. However, the pinctrl-spmi-gpio device is a
>>>>> child device of the SPMI controller, not the RPMH controller.
>>>> This replicates the story of the PMIC regulators. There are two drivers,
>>>> one SPMI and one RPMh. Why don't we add a separate, RPMh-based GPIO
>>>> driver targeting only those paired GPIOs (and we don't even need to
>>>> represent them as a pair, it might be just one pin).
>>> Thanks for the suggestion.
>>>
>>> I agree that adding a separate, RPMh-based GPIO driver would be more
>>> straightforward from RPMh control perspective. It makes the new device
>>> as a child of the RSC device then it can naturally use the APIs for RPMh
>>> commands. The main challenge here is, we need to make the level-shifter
>>> mutually exclusive with other GPIO functions when the GPIO pairs are
>>> used in level-shifter function, which means we need to write SPMI
>>> commands to disable the associated GPIO modules. I am not sure if AOP
>>> already handles this; as far as I know, AOP only manages the
>>> BIDIR_LVL_SHIFTER module registers. Let me double check on this
>>> internally, if the GPIO modules could be controlled along
>>> with BIDIR_LVL_SHIFTER module registers at AOP side, and get back.
>>>
>> I checked on this internally, AOP only handles BIDIR_LVL_SHIFTER module
>> registers, it doesn't disable the associated GPIO modules. Also, I still
>> have no idea how could we make the "level-shifter" function to be mutually
>> exclusive with other GPIO functions after moved it into a separate driver.
>> Do you have further suggestions?
> So, for my understanding, we still need to write SPMI registers to
> configure the pins and only then AOP can handle the level shifter?
>
> I was thinking of using gpio-reserved-ranges to prevent those GPIOs from
> being used by the normal SPMI driver.

More background: "level-shifter" module is actually an independent 
hardware which is not part of the GPIO module. However, they are sharing 
the physical pins. Which means, from PMIC chip perspective, these pins 
can be configured to either a GPIO function or the "level-shifter" 
function. So in PMIC base dtsi file, for example, pmh0101.dtsi, these 
pins should not be restricted in the GPIO nodes in "gpio-reserved-ranges".

Also, we need to make the GPIO modules are disabled when the 
"level-shifter" is enabled, to ensure that the "level-shifter" circuitry 
is not impacted by the GPIO modules internal circuitry. So it is 
supposed to write GPIO EN_CTL register (offset 0x46) to 0 through SPMI 
bus when the "level-shifter" is enabled.

That's why we have the requirement to access both RPMh and SPMI bus in 
the same driver.


