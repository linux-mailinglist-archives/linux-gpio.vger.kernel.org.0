Return-Path: <linux-gpio+bounces-37915-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1lRNC+XfIGr38gAAu9opvQ
	(envelope-from <linux-gpio+bounces-37915-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 04:16:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9630C63C6D3
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 04:16:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PSpSDJ1t;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q2jweFwD;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37915-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37915-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1872A30A59E9
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 02:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67CA38F928;
	Thu,  4 Jun 2026 02:02:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8984388E5A
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 02:02:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780538574; cv=none; b=iLuj6jC1Mqosw4vbJLvCgvzij2TDOj/9bk1O1SMDk38QjzF45Au/e0QHhL4qnv5RthhwME+bny/UQqFRJPSOS5zJ9RWsDkaAzE2dqLxVEJD+4g4nN51XUpKPO3qC/1CKe8lpJHBO/Eo10k5Rq9mwglhC5NyJBWwRGXfQ5y0rB2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780538574; c=relaxed/simple;
	bh=ydKZYR+Y656Yw/RzkG9VPOvC0WJNSVkB9Fl1bWPPzlI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hvZsAk7C4Ur66Y3xoAnDb+gLGMSKF+TkyxzGJKuPmqE0SnkRnzFMTh4V5H9TJxSR3U/PviJ5W7ovB6yY86lIYlWpQ3CbKQALLZuZNhubOEjirGRlUTRrBk70/NoWoH8n9ByJjp7IO6QqzTKG8woXA33iV14+EHqOhxUQnxtOOA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSpSDJ1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2jweFwD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653JZ1cp1039270
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 02:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q85xjLd3JmVGen8gRY9Dym5jEmwnZApOCk0ggYyeWL0=; b=PSpSDJ1t5OoimHBA
	jvqZnpMh9pg9bCxwbtMYRfGU8QplH4XRwr3xEefRECnriMhKUD1z0mW9NnQw11ij
	9du+os2xYW4MCj+4wg8v+4CUNTgQlAeFYuWcZLWe/fS2Km5sskX3cn3kF9tQpXr2
	NsK9n8g1wOkxF3txSaNynqzzPAM/bRhqDL8qohqdaESN3qWMmdyakzhS2PhGpMF1
	2RlQHdxih8G6JhQPLIU+wrioI9CRUDtb8hNgPzDKND36Xg+5Q9yg77o234XAR4rS
	CCmYOP4hk7QMvZf4IC1zSaXyeLuDoNmzK2cqTB61m8ZVTeNJmZdKEpU7sDJjLx9x
	/yT7jA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8h5uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 02:02:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a298cd62so142018a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2026 19:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780538571; x=1781143371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q85xjLd3JmVGen8gRY9Dym5jEmwnZApOCk0ggYyeWL0=;
        b=Q2jweFwDYYD0yYhabW+nqFrJR96b+9j8uVeT0BjAyI568HqJumLSxJWQ0f9H3838LE
         0SQY1iA0+Ldn9KJhJbdvNnntld1QdO3Df++hnHIorftnJTFtVf+tQz2ho8mujtEPTiB3
         +fbPkHeE9cdrbJmpvowlmINaw4eHEQugEF7QmoSKw1I+rjuiSzvTCwyFK3JcdpLciqCG
         iRIuR6Vo7YaiqDrEmPtLdxuI6rDzHWyjZ6C9R79fpeAoZypbiYWXE/QsmZIjQbA7W769
         M3PGUgnktTM0L3NicbQ+RdNR4v/JQ//YEqpeqfrdx8I7Pfsvbmy/an6VTLeaZpRvE3h5
         f3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780538571; x=1781143371;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q85xjLd3JmVGen8gRY9Dym5jEmwnZApOCk0ggYyeWL0=;
        b=tS7oZ0sk220OZGIBZedN1U156WEaMhnDM+e8TJYET1or+1jEZPhx7IXuM8f2oMy1dL
         sYG1D9t42AJueXTuMshOdkk3LVOmaj+hH/wh/lOmEghqNe71ASWKHxvJc/R+V9UpvQis
         J7de6OWNp5VTZvBR4VNNzD0RgW0k4l/NO+nrH65p82TuZjg0hO1bAMdZR1XOd3OTYSql
         7yVW2yYEPfyskZxvI/404LJ/4qt6DyaHdqcRXCMoNAY8maEDsTKnh9jc/gpUa69U7lk9
         XbFvvuZrZrUF+XhuNR5FhwSo56hX2iK9wFfr7CE0XvzPKzfhSioAdlfqcgJpJSSNdOU+
         ahNQ==
X-Forwarded-Encrypted: i=1; AFNElJ95E294PaEr+3gdeal1/JPVDLtLh91Za3thBdhzFJV2owJQOP6I6u8XDL5TWtbf5QroMTijZO6Y77c3@vger.kernel.org
X-Gm-Message-State: AOJu0YygssnhAilef9MNffcBGgH2/Ld9joiHHsjKYIkQTbJ6LOZn87zP
	AcRmZRe+uduy63oxAGkzsRkP6LU4WTfspjvVGhqqEsMxAG2caX2pRNAUDrmlpwh43+QvzPMa93d
	KY+0mvq6eW88ypLM7ejDcrg3HqWpUBg1ZgV2DvvCF9XL1ZMH50Lxl4LsoyrapXpen
X-Gm-Gg: Acq92OGGwQN4i9TqIUdALmOElcN/ttA66kd/+AA1/vAcfRBu+GkQ6c099enutg93NAw
	B9zh+LMHVMaMFwmiJVHpygxnSkFDzGJEqrU0PMrpwNb4TdE9jWZSDkAWmjFAybaSEiWvNAt1mMi
	lZ11YBtqit09SXAQfyRhcMXiaJWZ5SreRG2mGj5ZTAOyjkmUvywZOoVcCq1BmUCVzOkK48VL0rV
	u2NjvxVIrYVhztvmKiRyP4hygzC9bOA8SPtZiscUmlaeptnimuvG6GVX1tGUWFcPL/Zvt4oa4UO
	B9v6VHvYjAOGIJg2OolOKtfy3hEjKIuu8x+lnIYUtS5PdjlTf9FWky64vNpHX+fBOIB8JAYpnk6
	3tFw6exnwb55Wmnb1NDKPy6dDWC6AuYoRRCTQEVETwhSqqSXLueSm90RO9g==
X-Received: by 2002:a05:6a20:728d:b0:39f:9eb3:1d09 with SMTP id adf61e73a8af0-3b49766b7f2mr6538679637.37.1780538571138;
        Wed, 03 Jun 2026 19:02:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:728d:b0:39f:9eb3:1d09 with SMTP id adf61e73a8af0-3b49766b7f2mr6538631637.37.1780538570626;
        Wed, 03 Jun 2026 19:02:50 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85deeb2bdesm3413401a12.0.2026.06.03.19.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 19:02:50 -0700 (PDT)
Message-ID: <9927f5d7-1eca-4936-b38c-678e76ac11cb@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 10:02:43 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
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
Content-Language: en-US
In-Reply-To: <18235340-cd42-4d88-bfdb-19aecdd63d68@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: O3rNRtz-KfiKRwJCi3jlTYRs-9z-7w8x
X-Proofpoint-GUID: O3rNRtz-KfiKRwJCi3jlTYRs-9z-7w8x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxNyBTYWx0ZWRfXyRSZ7g+DfZzb
 WGhBIXDRFj3nwQCtG8VgwiMudAcnglPGCGiNXNAQOu4rpXcHuW5GX8okuuBxsqrN1vyP6envQae
 hC7Jix0Ui8Rbq3jaX3l5Q9d6NNJ05ldjB+70oKSGcKl4Dp9fGWcMLQxQc5Zy03SN1BxTcHzatpV
 sHtpTjf62O+KJQLjspDlJ+KVZyOKrQI/nXXyz1QgLY6dApVQJGGh526RNRKvwBtMk7orrT6xPnO
 CM/kfTw13nCNIBQ/A78iY3zdHuAJTxG61Fb+8uSvYDrJnjCIMrPFYlqsKX+JTohmtfhjCBtVtrg
 X5xP99RuORLHp7lkxxBpzil3MB9IuRweUTbfrkJ5beiE1WfYvgipN6nccnuPMY3Ej+DTGNSKN+H
 6fGYMMe2lT7HzGCKv/GLjLLsaNTLldaHAb1eaTFM8MAiQ78aNJNHYfEos/Sas/1gtDf7biUy1u1
 ZojkPAg/Vo0nn2YevVw==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a20dccb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=m7le24t4bVehakb2-XAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040017
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37915-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9630C63C6D3


On 6/2/2026 3:29 PM, Fenglin Wu wrote:
>
> On 6/1/2026 9:37 PM, Dmitry Baryshkov wrote:
>> On Thu, May 28, 2026 at 06:05:35PM -0700, Fenglin Wu wrote:
>>> Currently, the RPMH driver only allows child devices of the RPMH
>>> controller to issue commands, as it assumes dev->parent points to the
>>> RSC device.
>>>
>>> There is a possibility that certain devices which are not children of
>>> the RPMH controller want to send commands for special control at the
>>> RPMH side. For example, in PMH0101 PMICs, there are bidirectional
>>> level shifter (LS) peripherals, and each LS works with a pair of PMIC
>>> GPIOs. The control of the LS, which is combined with the GPIO
>>> configuration, is handled by RPMH firmware for sharing the resource
>>> between different subsystems. From a hardware point of view, the LS
>>> functionality is tied to a pair of PMIC GPIOs, so its control is more
>>> suitable to be added in the pinctrl-spmi-gpio driver by adding the
>>> level-shifter function. However, the pinctrl-spmi-gpio device is a
>>> child device of the SPMI controller, not the RPMH controller.
>> This replicates the story of the PMIC regulators. There are two drivers,
>> one SPMI and one RPMh. Why don't we add a separate, RPMh-based GPIO
>> driver targeting only those paired GPIOs (and we don't even need to
>> represent them as a pair, it might be just one pin).
>
> Thanks for the suggestion.
>
> I agree that adding a separate, RPMh-based GPIO driver would be more 
> straightforward from RPMh control perspective. It makes the new device 
> as a child of the RSC device then it can naturally use the APIs for 
> RPMh commands. The main challenge here is, we need to make the 
> level-shifter mutually exclusive with other GPIO functions when the 
> GPIO pairs are used in level-shifter function, which means we need to 
> write SPMI commands to disable the associated GPIO modules. I am not 
> sure if AOP already handles this; as far as I know, AOP only manages 
> the BIDIR_LVL_SHIFTER module registers. Let me double check on this 
> internally, if the GPIO modules could be controlled along 
> with BIDIR_LVL_SHIFTER module registers at AOP side, and get back.
>
I checked on this internally, AOP only handles BIDIR_LVL_SHIFTER module 
registers, it doesn't disable the associated GPIO modules. Also, I still 
have no idea how could we make the "level-shifter" function to be 
mutually exclusive with other GPIO functions after moved it into a 
separate driver. Do you have further suggestions?

