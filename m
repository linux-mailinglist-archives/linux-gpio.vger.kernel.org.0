Return-Path: <linux-gpio+bounces-33314-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MrJOS63s2nbaAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33314-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 08:05:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C87927E77B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 08:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 069DF303D70D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 07:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC882F12CE;
	Fri, 13 Mar 2026 07:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4QKlM4U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CPzWt83P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088B536309B
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 07:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385425; cv=none; b=WUWsCYT408TXEpflJgfsrNJg8Tai4nPSslun7SG/a5Mg24d3zMIqu1jfKGZit/nFEq17QKWHXHzhuLkulYAAiV9s34SDBYxixMK7jWExGWLsJjOkIxfNrylKA7ysh0QuCi59z8FqJ9XddWuRxVfw8ZQu05Suxt+o9D2LGI/QMp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385425; c=relaxed/simple;
	bh=Rn8wHtCLMEv57Olj+9qoKpCygPJwlSOUIiqpDelPERk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pgu8Yr0XU/1S3I+80kXx2t4ZjriRMYIT/UOqOL7WKktzNyPZAzAuOaum0MbEUYfsFQ1LSPlX6cg0Qn0wkSsWaGaNE07GT5qHCfzldOCk63GsyMAzlUfKxC0rjPrX/dZizLznLBP7Bsin0beydlI0hr80NxuymUqydwqJUTC/V9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4QKlM4U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CPzWt83P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tet23342534
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 07:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zEP0RLQ1FcdKjb0SaePafyEpkf9Bx0Hizh3a1ioi+V8=; b=I4QKlM4UymqKZXFP
	PKcF6zPyg9UbFQB1MYYkLiw8zjs/DVth36yYp6nHYC9Bsbn+0TT52kaJ8YyqGOnl
	9NkkemP4jZekyiG9CF1W5hMZzhvJ4A8UXG0WqdGInso3z7QaZr1eEtGNWNq9E8h/
	CRRF+St3t7p16Ku/zcj2rbMB10hgJofduwIhsqWlW1lHIrKM9/y+DKkTvnVPQ0IV
	AKomOC8lIJluZlqDlNOzkYzsIHIXy8pJwFTKjsvrhJjNbjaVtKQ9X7k8fsxT3bN8
	zrAGV2dl9nhRvY5kgZwuXr+v7cKFUiL7csF6Gt1Dfq/wAtaRt9rS0NjbZ/VFn6j8
	AJpQng==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w3m2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 07:03:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae405e95f5so21279895ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 00:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773385422; x=1773990222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zEP0RLQ1FcdKjb0SaePafyEpkf9Bx0Hizh3a1ioi+V8=;
        b=CPzWt83PMwARBsvHOylBdh4EU9BB9bRNMKHvc5vtVxM9GM8n5ncpqaMfWsqDsPleY5
         Scj+uoaHp6gffbUQgIy2Z3iefub05VbPB7f5U0sWqg+WOzXWApW45jzK9G19BZRw7Dj9
         g6ctr8dkUlAUpEXgs2dy68GsyQOP1wcYOZq3r8URDTXaOTmBeyf+I0w7gTO/RS8FO8Ny
         MKFQWxqTEuM5mB6pU3H3fXt/vU6O1ZlaL0Qnj8vEf+qb2rp2epY8D6ZrSEQ6kJTqg/Ou
         U2tpm4dVnEG5XAD5YQTBwgV76ykJd2WH2fgk9l28NmsX8TbqGplIhgwNjCIk6sXtcble
         JciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385422; x=1773990222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEP0RLQ1FcdKjb0SaePafyEpkf9Bx0Hizh3a1ioi+V8=;
        b=r4REbhYBD3m2FY5+M8l8AGfmI1GAnXHhw/TkywVXY/ym25Q28ICSggolEXWeZmXNSl
         ogU+a79WeHYqG4BRXM9sI+m3GLOpQjw8bE4OqGE7XIcW85F/IPHQyYsYWSIyTzk2WDls
         GaadWpOKwlSri+A6+b3B4BYJhpRIE4uRfVYaOzgRNuiuXNlM1Vsv2Ypbfy6uUH1Hu2Pv
         1v51vSwUmAJdmYbXW2HQqIVS0wso5U/Gn3OcBaOCa4OgKBVuDd31LlYwRahsd1JJHOT5
         0vwIwcYrZpZ8JiSLIc36dI0uCeAXJIGE48pZRGQDI5L7PyjtSbBPpuPaH3TH/ynAsBtX
         ODhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu7cxBB2anBsj6DDYUBCqwTr3DyKqe5SUPAUuWG4d72irQyuGISFNCFDaDO26ny6y+XxfyXG/ITCdk@vger.kernel.org
X-Gm-Message-State: AOJu0YyFEkXpX5O/2p7z54GXesLWm6EUIDVaGd/VFo8TNrPsAN87NJyv
	dPK1Hd2uS/yNDz7XJxxN6U9aliwOcPS4M7Mm6Vlg7sdkTaikAhVo+JBd+RAGuFjmhT9XPO2eSdQ
	e7YjYs2VfCYAevjab2HYy20wOaYLCf7jzmOMwpmSG48iVvzUvPhBxN/cNn2+NLMcA
X-Gm-Gg: ATEYQzzHnu2VMk9X9aMvCW8g+6X2Rn2LGCZK43NjoJtgmPTuR/WXPcsRJSfNeYp6twR
	FyW8FlPO/Skf6G9AH6n0BFOdEm5wTZJdeOUQEnl44og7xgMN810MKHiIhHC/ssiICumKTykXOss
	5EqdQxTuDGz4MyvjbF9u3eafHIW3Rh2m4nBGA5taZhyiHLnrLPNhmYdWOWiANADU5BKQCVCCBDP
	TFWyo3bH7uZl5ZBMNXVbD5cKtG28NtxA+DiNXDs/llXU14K1YmeDd4yWdo7d1G2xWJUN0fhiezg
	kBk6w08HnJSXnLIULKZgVq5Tm6NN4w0R92D6sx7Qyd/Uh35Bz078n6DZKEaQzUHxTzq2vvFYsfx
	9GznIkUpO0unCasQTUhLcW9y5qAfeD+uxW8wxxH9Y4hbskElRsdwN5Q==
X-Received: by 2002:a17:902:f690:b0:2ae:5a70:476b with SMTP id d9443c01a7336-2aeca9e0906mr22825685ad.15.1773385421944;
        Fri, 13 Mar 2026 00:03:41 -0700 (PDT)
X-Received: by 2002:a17:902:f690:b0:2ae:5a70:476b with SMTP id d9443c01a7336-2aeca9e0906mr22825295ad.15.1773385421470;
        Fri, 13 Mar 2026 00:03:41 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece62d0easm15764975ad.39.2026.03.13.00.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 00:03:41 -0700 (PDT)
Message-ID: <54798338-83b4-4088-b2b1-52c3cde960b2@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:33:35 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] PCI: Add support for PCIe WAKE# interrupt
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij <linusw@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev
References: <20260218-wakeirq_support-v7-0-0d4689830207@oss.qualcomm.com>
 <CAMRc=MdF92kriuT_-Fbk3pj6YeJiNv6RSiDE7aB0AKL9oFZg5w@mail.gmail.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdF92kriuT_-Fbk3pj6YeJiNv6RSiDE7aB0AKL9oFZg5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5TkFCM7szor_gY-2eqoJsmuC6GXDTzSm
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3b6cf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8 a=s8YR1HE3AAAA:8
 a=XA70DKTrLd0yiFKK3swA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NSBTYWx0ZWRfX3EVq01Lc3NVG
 /x92HH5kgm5Misr7sdnBTyRbd82WcJmbB2vq8w3AKsunbNd2pkkRildgHADDDUohcAVLtWiKz5Q
 de2vxsAopF5SeU3kNK17JcVzs3yk86xqyFqyxcz+hQYd7Y2R5vTqtUSiSWCcHv8drGCwdINrc2/
 RolTUDEp1wsyxzLWv8UNL7clMQ2SGK8r6rqAW4Q8P5SWKhoBWAW2UjsJGnRJbXxUSFtRoOZA3jw
 Jsn4uYLkvLZHTDc8EN/2iqhWo8px28AeeOxan7pBeOimtvrLCakoenTO9yR7r+QG/nMJ0xGcq9F
 XZZOjO16I73HjNfAOkHROCBV6Pc0MSqBqdYJVB9ZKBhBhOvl05R47naDv88rhiVqPlpI2gXSWjW
 v6o9M1f748wWV1UofUoas8TZLPG3ce3ooC3ku5ftyJwwFp1KAbsVoHSbqqdFy9dXl+bHuDVfeoi
 nUxwLxbMgfFqdZewgww==
X-Proofpoint-ORIG-GUID: 5TkFCM7szor_gY-2eqoJsmuC6GXDTzSm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130055
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-33314-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C87927E77B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2/18/2026 3:31 PM, Bartosz Golaszewski wrote:
> On Wed, Feb 18, 2026 at 9:12 AM Krishna Chaitanya Chundru
> <krishna.chundru@oss.qualcomm.com> wrote:
>> PCIe WAKE# interrupt is needed for bringing back PCIe device state from
>> D3cold to D0.
>>
>> This is pending from long time, there was two attempts done previously to
>> add WAKE# support[1], [2]. Those series tried to add support for legacy
>> interrupts along with WAKE#. Legacy interrupts are already available in
>> the latest kernel and we can ignore them. For the wake IRQ the series is
>> trying to use interrupts property define in the device tree.
>>
>> This series is using gpio property instead of interrupts, from
>> gpio desc driver will allocate the dedicate IRQ.
>>
>> WAKE# is added in dts schema and merged based on this patch.
>> https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/
>>
>> [1]: https://lore.kernel.org/all/b2b91240-95fe-145d-502c-d52225497a34@nvidia.com/T/
>> [2]: https://lore.kernel.org/all/20171226023646.17722-1-jeffy.chen@rock-chips.com/
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
> This spans three subsystems, how do you want to get it upstream?
Hi Bartosz,
we can take these patches through pci branch, if all maintainers give us 
the ack.

I will mention this info in the next series cover letter.

- Krishna Chaitanya.
>
> Bartosz


