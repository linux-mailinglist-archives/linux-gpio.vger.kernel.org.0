Return-Path: <linux-gpio+bounces-35453-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB7HFawN62mvHwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35453-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 08:29:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDB145A3E5
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 08:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD3AF3010507
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 06:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C376B353EF3;
	Fri, 24 Apr 2026 06:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ko/7KaUz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7LVVT1e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4425834EEED
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 06:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777012129; cv=none; b=mhEAImlPDNAmN4hnoa+2rKZyTZoZaWQxCKcKeiuOrTEL5n+NZb+TAUyjM8gBYZbmYDVIjXaEdsDBKcu05eTeKGgSruPYkyzO/MSP26gni8Od4IcMCmPJpR64mCOf3nmWaVrvaLoJL4oU9TsulYb1nebe4WHjHURco+3VLTl5D+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777012129; c=relaxed/simple;
	bh=v4lzZb8z7oq4g2InfkmpENPN9iW7RCVGiCC+qJR87vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yij9hug9KEQph2oMFNVAPtuI8nXFPxUrZh05BQiR+o7Tj0eskdRf6Y6EG/mAltbYfdkvHFZUjNktaczH7vk0DnGOkT6Ad2zeMAvoQNW9FpvpupzKSkUi2FxL7Y0BMMeNnvTK6s6CGI/OaZgKlFjquGvRF8xE15P7gKKVF0APK/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ko/7KaUz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7LVVT1e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O3Ma66756669
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 06:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sr5gOJDsXqs0OCz2aTMix6lTxgOix0DJAO0zyJju2tI=; b=ko/7KaUzdTQqLCwJ
	nC8cmuFFkOnx3MGJyn2QvWF3r+gKhyWtgzYH8gLTsKJK3hMLbVW5dcE5++CUanvU
	WpnruSlR9dlbuHfFwdK8Ao1bUXhWalzDEmJs6Zqq0xNTjxyBqYw6MlaEUIr2kNIv
	U7D6//y3/KKctcitj0cEDiFO6fuifko3iF7Uifx3IQsdPUr9BX0a77gSC5/uYtUa
	K6/SgzCmQZuwaD1OA/aPvgevRuG6QxYHoVexYHa7pIdi3vMVQ2EoP8oPV73b4+F4
	QxR3AR0xRv7JlaSAnYfjQOKq6bn9ciFZK/I3TWfWLiJn0TpT49/DnvFZPnkN8E9s
	iCm90g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr4bjfqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 06:28:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354c44bf176so8980495a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 23:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777012126; x=1777616926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sr5gOJDsXqs0OCz2aTMix6lTxgOix0DJAO0zyJju2tI=;
        b=J7LVVT1et8ss4Rb616V3rwVBdrT1UP+vs/9jyJDsjivWUYQybh4N4vEfJ+QSwHR0f+
         p36WqI7GlR7HK55+vdfVArwsEqErqA4q2/fErlAZiOMnbQAR7okudJIh8O495vy//7UE
         Dz0KwyzoRFEYjXt+S8UJxEzpi4fzGmPEHHt8kqZel6ogogBN1Oqaekr7ak5FVwkqAF/8
         oNvQ4umkmNvKVKvRUVMsDqS+vmfgn4Ow5etrFcLGoarUEL9YHDiztIl2R/89rUqUdNwX
         +3CqpcigahGsKHZQ2d9PivHy6wBxMcqu47cYybZLN2X6PHXRIfW6zff/Leih9onevkfh
         swHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777012126; x=1777616926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sr5gOJDsXqs0OCz2aTMix6lTxgOix0DJAO0zyJju2tI=;
        b=Pw+0VXn1d/Bq8gjVokSqP36wM7wtYMjvxA4aKz+p8J6iT9NtOqDrBXOYcMe+oqagya
         kthO3qEYrXoQwb7EI/a34GyBT68pLCfGFyQkQPoVep7G8ZMy1/UB0kA728JymiqEa0lH
         VX+xVF5EFGF/O5p0lEmtVd9sPG+4paVKuiO89SY0JLMI+6WMw2S1TGomp8zSviIFc8fl
         Zh1j40PSKossYioeYcOLJXMOe1S1THEdSrab2SKzPw7v7w7GrjcHuJzYpsSM8z/fBIHa
         yarK2bqCkT6Jv3KVxCTE4bHxLB49H1XPSV1r4Yv0CIl/ZiWN9r9w4usy5C9vbmgKbqxp
         GVrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nQabLyImGQpx0yokQMuquZK0MbYp/goYAO7/Ep5lhglSRwlUFXpsVWN9Zou9BzrbsvdjF++pn/ugz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4MV/Kyx0RYPavmo1CiTwVMBEe6SwWW4EEqzH49xUAF6svEEnq
	NBkZFYJ4J9bbNwApnJXrxuFq56djsF8iXsfStYJ34lJ43TD5g2X1xitI0PSpRIq+4FdY3vkKHz0
	fE/BLrKg1oBxwNO1o1+wtzSIiV8bUDyBj0pP9Bse5wlN7xFVjyrYMCbhBf4817QFh
X-Gm-Gg: AeBDieuRjxqMdzp4DHfHU7RCyOPNZAXyVGvpbDQf7AYmjTBLruoD7nZ5pjTiPIXpVR0
	X79jJI10bobMG1IDrWkAKYNahS88HwK5968ip/WJTAyNpUVRW/GwaPnLcRkIWFvAVw7xTOEJson
	z/QYrjBncVeHx4dozbKoFIb244dN7lEClAS1cDWnENTzJYpSnBE9jmUsu+FklFra/yNFAyCXrn7
	oiIGSSRSFu7KJfFlcSUztC6D9m9/UxWqISUwo9RMHqItQZ6GAXqd3gT71VaumEP0Qw5DIvelmo3
	rycmqUvEaGNPIBJc77HXoXIspYjhRhgCIfcwj+jRtEIgvXsuFeNVFEwoUqi4ATQiNA5Spwb0wCZ
	Dxbq9fGbO9zbo9ByM381CdHY7hRVfGOPegBKNYjnYXat1S0DgCoEAuALb1YazU6s=
X-Received: by 2002:a17:90b:3d86:b0:35c:a8f:5c5f with SMTP id 98e67ed59e1d1-361403f0ee8mr28696981a91.8.1777012126215;
        Thu, 23 Apr 2026 23:28:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3d86:b0:35c:a8f:5c5f with SMTP id 98e67ed59e1d1-361403f0ee8mr28696939a91.8.1777012125624;
        Thu, 23 Apr 2026 23:28:45 -0700 (PDT)
Received: from [10.218.6.76] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fc5d94sm28499012a91.2.2026.04.23.23.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 23:28:45 -0700 (PDT)
Message-ID: <d20e8ced-9454-4924-9042-2f725de6d332@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:58:40 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Fix wakeirq map by removing disconnected
 irqs for sm8150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260423-sm8150_gpio-v1-1-e418613a1f48@oss.qualcomm.com>
 <gayeixwyvv4qjtpc6gz5ljrtpmb4ckm4up7gdxutpbatbxny74@kazqjbepwb46>
Content-Language: en-US
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
In-Reply-To: <gayeixwyvv4qjtpc6gz5ljrtpmb4ckm4up7gdxutpbatbxny74@kazqjbepwb46>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA1NyBTYWx0ZWRfX6TUCCJ3C3Ivw
 tWZP5BDdJVKIXlNtcx7u1kD3WYplsFwGdL1SrWSMn1lZqH6gRjZ+Zv6hM5lIUdRFX6rOlGNcL/s
 xg05QZ4BIhMLIZuTomOZxxvXdU49NPizzDK9Zp2r48WCaUsFCFVhjqiYcg77925saS/7EbY0IhH
 3jPoDIWL5T7Nl1fj3X0hauM4WZk3fAq4UlJmXpODc0Q6m7DOJ2P6lLVpenSTiEHBi7JIi0JAcmi
 Ub3/RxA6M8B5RygOaaqpsPHHe1SR783B3AkyO+cTIK0EhAlwkcebLsBWE5YUxWbMYYhgM/edj0w
 Y6lLZ1kF0jA3X2G9WPrrJfPOIzUTEDdaQU4OyZDGtBWATpB3NgACDAHToXD4ReN+GRLIBaOuPt7
 SJKPBh98SB4mwz48NSAnEw0J0pHtgng5IFDC83afv/zwi5+xPvHTt8eM0twLqTS29YYptr1dYMo
 wrBo3xoasjHp5lWNkwA==
X-Authority-Analysis: v=2.4 cv=TtnWQjXh c=1 sm=1 tr=0 ts=69eb0d9f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tG5hwu87TR8JjoD4RVAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: r63bV-PNvk5uCKyvgY79OSYosBUKEs3e
X-Proofpoint-GUID: r63bV-PNvk5uCKyvgY79OSYosBUKEs3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240057
X-Rspamd-Queue-Id: 9FDB145A3E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35453-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[navya.malempati@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/23/2026 6:09 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 23, 2026 at 05:21:01PM +0530, Navya Malempati wrote:
>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>
>> PDC interrupts 122-125 were meant for ibi_i3c wakeup but sm8150 do not
>> support i3c. GPIOs 39,51,88 and 144 are also connected to different PDC
>> pin and already reflected in the wake irq map.
>>
>> Remove the unsupported wakeup interrupts from the map.
>>
>> Fixes: 90337380c809 ("pinctrl: qcom: sm8150: Specify PDC map")
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-sm8150.c | 23 +++++++++++------------
>>   1 file changed, 11 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
>> index 0767261f5149..81c08b18ac71 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
>> @@ -1493,18 +1493,17 @@ static const struct msm_gpio_wakeirq_map sm8150_pdc_map[] = {
>>   	{ 3, 31 }, { 5, 32 }, { 8, 33 }, { 9, 34 }, { 10, 100 },
>>   	{ 12, 104 }, { 24, 37 }, { 26, 38 }, { 27, 41 }, { 28, 42 },
>>   	{ 30, 39 }, { 36, 43 }, { 37, 44 }, { 38, 30 }, { 39, 118 },
>> -	{ 39, 125 }, { 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 },
>> -	{ 48, 51 }, { 49, 53 }, { 50, 52 }, { 51, 116 }, { 51, 123 },
>> -	{ 53, 54 }, { 54, 55 }, { 55, 56 }, { 56, 57 }, { 58, 58 },
>> -	{ 60, 60 }, { 61, 61 }, { 68, 62 }, { 70, 63 }, { 76, 71 },
>> -	{ 77, 66 }, { 81, 64 }, { 83, 65 }, { 86, 67 }, { 87, 84 },
>> -	{ 88, 117 }, { 88, 124 }, { 90, 69 }, { 91, 70 }, { 93, 75 },
>> -	{ 95, 72 }, { 96, 73 }, { 97, 74 }, { 101, 40 }, { 103, 77 },
>> -	{ 104, 78 }, { 108, 79 }, { 112, 80 }, { 113, 81 }, { 114, 82 },
>> -	{ 117, 85 }, { 118, 101 }, { 119, 87 }, { 120, 88 }, { 121, 89 },
>> -	{ 122, 90 }, { 123, 91 }, { 124, 92 }, { 125, 93 }, { 129, 94 },
>> -	{ 132, 105 }, { 133, 83 }, { 134, 36 }, { 136, 97 }, { 142, 103 },
>> -	{ 144, 115 }, { 144, 122 }, { 147, 102 }, { 150, 107 },
>> +	{ 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 }, { 48, 51 },
>> +	{ 49, 53 }, { 50, 52 }, { 51, 116 }, { 53, 54 }, { 54, 55 },
>> +	{ 55, 56 }, { 56, 57 }, { 58, 58 }, { 60, 60 }, { 61, 61 },
>> +	{ 68, 62 }, { 70, 63 }, { 76, 71 }, { 77, 66 }, { 81, 64 },
>> +	{ 83, 65 }, { 86, 67 }, { 87, 84 }, { 88, 117 }, { 90, 69 },
>> +	{ 91, 70 }, { 93, 75 }, { 95, 72 }, { 96, 73 }, { 97, 74 },
>> +	{ 101, 40 }, { 103, 77 }, { 104, 78 }, { 108, 79 }, { 112, 80 },
>> +	{ 113, 81 }, { 114, 82 }, { 117, 85 }, { 118, 101 }, { 119, 87 },
>> +	{ 120, 88 }, { 121, 89 }, { 122, 90 }, { 123, 91 }, { 124, 92 },
>> +	{ 125, 93 }, { 129, 94 }, { 132, 105 }, { 133, 83 }, { 134, 36 },
>> +	{ 136, 97 }, { 142, 103 }, { 144, 115 }, { 147, 102 }, { 150, 107 },
> 
> Is there a chance of mimimising the diff here? It is harder to read than
> your v1.
> 

This is v1.

True, it is little difficult to read since multiple lines have been 
changed to re-adjust fitting of 5 entries in single line, otherwise it 
may look non uniform across lines.

Thanks,
Navya


