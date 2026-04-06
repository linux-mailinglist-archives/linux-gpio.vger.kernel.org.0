Return-Path: <linux-gpio+bounces-34701-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADUdEk5302nPiQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34701-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 11:05:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6533A26E4
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 11:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98E3E3004CBD
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2026 09:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD0A31B830;
	Mon,  6 Apr 2026 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WokG1jV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MV6ZjB6R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CA83128C6
	for <linux-gpio@vger.kernel.org>; Mon,  6 Apr 2026 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775466307; cv=none; b=GT16lxSeoJmQoJotbx4czaYniNVPoRyLJHiWX1TwlCT+/oAZD1K9rpFQJR55wqI4EogppglkWilzdxuR/wiaP5P5ZM4PNlZm0ZgblfXS3W+2sveI4xJzEnatrsQts9wB6Fz/MRyNqZ1q5YM8HTNCCvJ0OWQYO++Dy3GW7kTS6dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775466307; c=relaxed/simple;
	bh=JCFwUhX8n6J6cLvZHBT/nylt0d34jPjdOhcY0lO5Akg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVYEEu7R3V0872+8VP1n2ID2ktRfU6nlm5Kctv1nmOpoCqjn8ZzTQfTL+ZCq6t0dQH7m9TVewG4x5CzQ2aUWn6b28wbT2Bb9PV2F9FKIw97uIlkUicb6Dw3lDnZUJvzNFhxdOO078bczudPt/pQPijBiMbIlSuc5t2oyY9HIvu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WokG1jV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MV6ZjB6R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6364nboZ2394711
	for <linux-gpio@vger.kernel.org>; Mon, 6 Apr 2026 09:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wY4ckWtfpN2pfgEpvz3rl8Jz7KSBQO2pSps0bfWI4Pw=; b=WokG1jV8TTdAeLH0
	WsES62KZhpnmUicCUJBlMBRKguACz/XLQ9xgrlE1bA8MbMFu1mO10oPDsWTHtHfW
	Fy35bNo0seziStC/yDhZGPbiVtsRKOhab/MIKKwr+Flfend6sAYd/T++zDJARBYr
	S0WBm28qk7J6eEGmnXtpyE/M80BjyvCpW2fHuzCY9cHWrtU/3krYOxmFeZanpBtk
	qsMHQaxcyYvkB9z9QRxbOSGwxoHTQ2JzMZC5+NYZrpxSYJIxpZ5KBsECTLjnXLU5
	aypwI1kSsBTzSCFY/8RwMy/ko9V9VGd5QPRMFVx7zZehfh92bz/tZuXG8+MNf/v2
	TVr+wA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqsmhwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 06 Apr 2026 09:05:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b241be0126so106167625ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Apr 2026 02:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775466304; x=1776071104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wY4ckWtfpN2pfgEpvz3rl8Jz7KSBQO2pSps0bfWI4Pw=;
        b=MV6ZjB6RamvVIkf6ebMgGxst+yCuc92A8F06Y+ZZSOGQSayiY/h4+nNmh3MzhKIZ2/
         DPcjNjgvzf2vj6+4G3CSqozTHTj7llI6Ktj0eIiIi/2mL/9tbebO64iv2ltCvyPgkdH7
         t6CMLug9ZL3V07iM2FG0BlRFUVApyd7ktUyl8V9t+bjddUFdc7kn1zRPP52HFOrBMwd5
         ACLm36ZLIZCvzTfOFVKzxh/Xk8P/rjbfTLWILMCaY80j8Sz8JbbVSO6pwfaWRzH+NjKq
         HXAhO6+w2bDSmOF8/5JiRygbRjJEfDa8pdl0Tv4loxnHEato5Noizwd+07z9VKBRDPX9
         4qfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775466304; x=1776071104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wY4ckWtfpN2pfgEpvz3rl8Jz7KSBQO2pSps0bfWI4Pw=;
        b=TauKFZ/wjYtDLQ3cMOnoilSnBdvBvT1GEdBUA5huBgMQAKtldo6Oun4+d6KlH+R8VB
         2brDVr2yxGb3neg8rc6CRQP0wsTtGKdTinta2z0oWqvSZ5ZK+UvNPwQIyY/rk56DPOUr
         424AtbxCVfsr2fMqhP3MxWEFZr9boFaW+Y2J9xRGqfeTtMb8EQpb5xvsLbJXRYENATxz
         y1YOZ6xjX4XMkbsZ5pfTXnLbArXtkUFgEkKR/nbZm5XXuYE2MiQLNEdR9kPUwxjK1MZ6
         ztUfjLgiQkPE74N//tV7WwpFxjgPsKgnlUQbW/1H1Rjw19bLJ2pbzCWaCvttLH2nmxDc
         jGYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoV9RskLu44xdptf6lZm8f8trWY8bwc/1PKCFndwdvSk0P0o9fCBgQFOnNhzQe5Si0Vy/px8qUV9H5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxib/lH22HXhLAmGti1gmjRDIs8wFBvNKz9UvYhj8ZqR6UyFTjM
	DT80GLe4oV73Zl+LXWzYX1axEvwRzmUafRL/Vi/52I7Y9RPVolyzm/2iVjTGULks/pGeNhgIF02
	HNhn9tyqOVDceqQFnw0GNJqfSnSvPKtG+gK8dZebXc1eoLZ1c+JIvzQAKdOzIZsGp
X-Gm-Gg: AeBDietTiLGZ3jNenC6w/28AdkW0r8Ve6acx/U9wrzuCXhgmJ6tGZ3IJAAnEymvwOpp
	PI/6hLj0W6hg2sUO4W8mch1DpozR6opPFlJPOqH2TE9WadmdtCBPmCdJNN6iJkbKqh8oNgtXLyP
	WuDIGoJomVlw6O9V2ODQipnkHhuSP1o9IxyemVFf87evw4bjKRvX0WYISuYU+FHbx1hIMFkEFFl
	TikSQ7gfNuzlToGh1XfQficGN41RXLJ1CxNEFb/7jz5n4XbNtSUCN1j0SR/atxjn8VPDCm1tpSj
	97Voe53333lgL1MyW0e7PqBSwxZzCh99yhja7Y1ZruB4robEQpLDYXgWkfsPdKHXIDx3bIkqPWo
	BEWs0U0HKm0RVy/mejDjcVNzBhgSlIIydIa+KuxFCtzGEh5X7+2uyBHVzyJotgT4mxg==
X-Received: by 2002:a17:903:3586:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b281705e9fmr125987535ad.22.1775466303876;
        Mon, 06 Apr 2026 02:05:03 -0700 (PDT)
X-Received: by 2002:a17:903:3586:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b281705e9fmr125987295ad.22.1775466303395;
        Mon, 06 Apr 2026 02:05:03 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af19sm129633005ad.50.2026.04.06.02.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 02:05:02 -0700 (PDT)
Message-ID: <5c0a53c5-3750-4b80-b3b0-0bc7595454d9@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 14:34:57 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Introduce TLMM driver for Qualcomm IPQ5210 SoC
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260330-ipq5210_tlmm-v4-0-b7c40c5429e5@oss.qualcomm.com>
 <CAD++jLkwGT2SxQrax5FFF2x6CznQF_03N_FC6-2n7OAiNH3Xng@mail.gmail.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <CAD++jLkwGT2SxQrax5FFF2x6CznQF_03N_FC6-2n7OAiNH3Xng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d37740 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rkh08bgVQrwZcmFFEZkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: TMllHd0-OA31pQVind5GF9TIhJEVKtO6
X-Proofpoint-GUID: TMllHd0-OA31pQVind5GF9TIhJEVKtO6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA4NiBTYWx0ZWRfXwVbvOGJ07kiw
 tOFskyW4rJ1T0CRKL7Zp0InhE9vCAvnRzCE4Aq+FtxCKrxMU7kOG9qdloqUnqtMTzhnCTK4It4J
 oFohRDbXmfP5B6dcf8h0fgh+Vii+EJGVx82m1Th9fyKZzXiNg18dnOKymqmJCtCcqY2Axh0OiUR
 AgoGIM7Xb7QbDjgY8jltcE7Tq/GY2bPxOMqT09pEe9GthNCzg/9laimO03LowuwA2l/1rMWmrO+
 YdzyKhAY2Ne1ktGql8pFcBdtpNhTuM9wXNkmverdEEwaVqNy3aJJ8HpVCGC02JgArY/7xlrQBvC
 bN5mdV52CWN2tkfWRlKNlI7nDDKIQvmLH9tkzHs51KhZte6aElB6cNPFGC1/TF53iKWNNd8BvqM
 BkUoh777c1RgmZx2mLscGGd2sx3O+iZeQre0EyrbKGZLVPgGAUjFR8sxlsWhf5trrCpDSENAfnV
 CpsLRX7vS+cVwWTGFCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060086
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34701-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F6533A26E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/30/2026 2:11 PM, Linus Walleij wrote:
> On Mon, Mar 30, 2026 at 6:51 AM Kathiravan Thirumoorthy
> <kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>
>> The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points.
>> Add the pinctrl support for the same.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> Patches applied!

Linus, I don't see these patches in linux-next or in linux-pinctrl tree. 
Do I miss something here?

>
> Yours,
> Linus Walleij

