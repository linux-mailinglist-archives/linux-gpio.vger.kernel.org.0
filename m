Return-Path: <linux-gpio+bounces-35698-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBADOBGn8GlAWgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35698-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 14:24:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A466484CD1
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 14:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E246430C3CA8
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 12:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF593FB04E;
	Tue, 28 Apr 2026 12:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/x+cIQr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVetHQKZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD33242D6A
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 12:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378020; cv=none; b=FE8N+4+QUk5hnstV1XGt8Qj3vnfSZuGDuLJYd964YYx5YR9kDdle+yxO3Zh9fXAbKfI56Cb8xt36RrTNq2KL9yXmTIcaYqWZUkJJv2QKDB2erHUhwgbJWryMPfN2AssWuru0vA/c3eeL2W00eWXh3TSM3QaSgXbR9TthwTV6/Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378020; c=relaxed/simple;
	bh=lyk4P6BlMyKtxZuhADtGbhmpXZs5geBXVLGI6+lsIT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T+3ecV8H5T5/V0rsHpJt4V6nJnsIL3HewMzTL3jw6cXplIR+LgcdxHTBEbOqaMX3AxemLAlDkDuGIVSmes5gaJMU0OaMojzKQ3b8TRnVPzRc43TROBGQmxjdKQPV+W94Oh2HMgSEkhdl9MuJanW7MPVDmef89w8w2m/uPMISyZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/x+cIQr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVetHQKZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAs8222112789
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 12:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+9y8EV99iyvX3G3DF8b7F3f6YYH0PTQ5YFB++5dodr4=; b=T/x+cIQr+Qv+875b
	4tN02qN3qjL1MlIosGj1vGiCxLn1OPlk9EIcofEYFFDCMh4wEOxyKSNf70x9uUTX
	rpKyEtPAT5okFIPOOsBhj36GIQCln9sBelvDgp631LB5j1Noz1bxLRO81UPGiauf
	cRuq6OOGbi9772xF41C4IphzUeRzNNrd+bpHXJl8aSNKDFelo37mqTSgZtwWuxDB
	I8NLT9UvRi/INY5U8d0PIYiHYjyDWQiMnqEGbmAsyhncNneAJYtB/45V/UsuG/tn
	nwy53YvTPKpZb/Lxu5y4PCRFptOLpy/JblQUUUEjC76gu0HYakYaVapwt0N/q+mT
	cB4JUw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbkduk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 12:06:53 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56eeaefec9bso11017639e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 05:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777378013; x=1777982813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+9y8EV99iyvX3G3DF8b7F3f6YYH0PTQ5YFB++5dodr4=;
        b=EVetHQKZsI7tEQE2Y8jn4k4WYL4HOoklGYBZ70GIb/t6s+RBaa5Qb4Z7gN9ODnyLaO
         UsLXL3zr3auZlnHSHn7XW5Kf2Cy+lDn7tpgnyhh4SdNdJuER1mrdajSucJrz/ZfJPShA
         6YuxaHyiG9fG5e2Vic0lOMyCwO8sNtLQ6oHaS9ipUINO33c9iIIvcL+MVqM28pheIxiD
         gJe/LEg9SjgamK9AgQDhzQk7UtxniBSRtiVsyyT7p+24G7MhtmBRFABhnB2C3C/O4vQN
         KvHPtcgfFUFamuWzm92p+6Cm97HfzADqJe/3jbnbrBBkhPZ+lLfx25lfdv98VSW7Gm6g
         teHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378013; x=1777982813;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9y8EV99iyvX3G3DF8b7F3f6YYH0PTQ5YFB++5dodr4=;
        b=Rp6CES3txlk36IKsqbVa3dl+2QwtljT9NFiVTtEVnxhoLzrCVVxJ/xOQrY0ZN95h5E
         0q34kHc7x0pdjVD1CLpnRoWU+z6S4pqkwTCQZtypZzjdSr2dPX6+8d55FVZDe2uvp3Yh
         hzMEFtGRmihkrtHgkNh+wQDNlNN/Ay/Vqt6nNUyGwVPkqweVDSWcjZ1cjxBR+Vs6PcOU
         ikpXPm10fiR9jbQq7RLGLqyNP7VxT4emJi3Rf6Cb++ZJdqTLEDiOxJYmgwrbKbYKGzeD
         vvQafEjfapDU/X/QS0Jlzolzqjok9Yw+Ai2nGIBXe6m0hkcFeE19HaQbtLNYRO65aZEJ
         lWcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cW8A3bRN2vyDFJ6cd2eCEvTDWXvNvHyH6zUUGnykrdbgbx+kgm4iwd+p61dv6lGAzcdmADKWiMH6w@vger.kernel.org
X-Gm-Message-State: AOJu0YwrqiSM3KTTunpigC1wUzRDxhHd/a/ObL1GE8ANeQMGtM8Dq1uQ
	PwNaFTMdQhyvAThk9ROWqqKkxI3RSgFarzQlTFtgU/EfwuA2pPBZt4XYdca3SX5gM8tB5nX362w
	XS+C4zNNRpS/UZRrPnBaBYgT0jpyg0XUm4FmwZ3X1zxedzCyjwN0YFt6DWbdKJuue
X-Gm-Gg: AeBDieswqFLmDU+0kpjSrUhNHHJojhDrQch53XCi3HqtRLT3AuCinz5DnicpRp4SqtB
	ExHZfVyY75A2CY8HJvPAU0qoU1O2yCrF3UgNK7J2Wj5rbxoKyIswAQG7XR74PMinsl3sjZmd3Li
	0sehfOf060idQr/23lxz8mUv5HWQV0OTTbXcllw7M9Q1K+77Bj1xG68lI6zXahZla2+auIFvAEz
	1APH7aoN2U2B5C4jn0LvuQLq87GR1Wuq7DXAzWkQo5hzSX66oJyhdc+rUpJW7ENOMb5j9nY2WJu
	8eqYSxRP2IvJcJjgECNdyZk1c2pAsxEPtXkbbEoY3p2/QIOaNkiqaPtiImcwRiT9tDoS+4ekM0x
	bQRzLOxMYkBGMOBCPLGaQL+f/VoLevgBVn8x4Gd2H+uq14qYaaQXTBmsqP/c=
X-Received: by 2002:a05:6122:4f98:b0:56e:d2dc:9bc7 with SMTP id 71dfb90a1353d-573a5596190mr969535e0c.5.1777378012590;
        Tue, 28 Apr 2026 05:06:52 -0700 (PDT)
X-Received: by 2002:a05:6122:4f98:b0:56e:d2dc:9bc7 with SMTP id 71dfb90a1353d-573a5596190mr969499e0c.5.1777378012158;
        Tue, 28 Apr 2026 05:06:52 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a775f7807sm17428265e9.29.2026.04.28.05.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:06:51 -0700 (PDT)
Message-ID: <3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:06:49 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Make important drivers default
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAD++jL=yCM80YHV3bKTVVfNoYsbTLJ9oV=3sJ8JcL6ftvWa3_g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAD++jL=yCM80YHV3bKTVVfNoYsbTLJ9oV=3sJ8JcL6ftvWa3_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OPi-YuphnhBogY713Mw9W77tOV66-dcf
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f0a2dd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=H6Ehi7c2N8zr8xo9JnwA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: OPi-YuphnhBogY713Mw9W77tOV66-dcf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExMSBTYWx0ZWRfX2fc/vibMX447
 sfSxW3Y0pmqwu/Lx/hkVHqcehJ4nXy6JLUgv5heJLdCQEo88sTNQC9oXKr79O+KjTSY8NgWAMSn
 jmKOxNCE8J7VZpIVwpUcVR3js3Ax15dnvIV8/RfnCS1TVRPInx4LmsJx8q/yGz4HT2EvVL51UcA
 H/NtUrePKRsFwsNoIFxepJgyyx7EOC1DQelpNNEnaNz55eO0vPjrnUjnGIcP4Y5svl+O0HdM9fQ
 I3qBOdjh5NSJUiM/SlxUjwfR9APrji64EuWwVbrns0LgfQW9ly3PoH8YpBouF0mQZCPiLug+N5h
 lKkPakE3bKzYKh0qE+765YMyQwNWgAwc6iVyRdl/jKC9Qqfa++dCYWw9A25eYdUQCB9XbPQWEo2
 TWCOcE9cqEdqXMSMA9HGSgzvC99H7PEQr/3H5ffpEUbS1qoFALcLAosuERbZDRw+BZ2XVQnGKDH
 6N1ELpKZ0OSrLNjm1rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280111
X-Rspamd-Queue-Id: 4A466484CD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35698-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]

On 27/04/2026 22:18, Linus Walleij wrote:
>>
>> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
>>    platforms, which are already enabled on qcom_defconfig.
>>
>> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
>>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>>    time and feels logical, because if one selects ARCH_QCOM then
>>    probably by default wants to build test it entirely.  Kernels with
>>    COMPILE_TEST are not supposed to be used for booting.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Way better like this.
> Reviewed-by: Linus Walleij <linusw@kernel.org>

I think this should rather go through your tree, because new drivers are
coming and some other changes from me might be touching similar lines.
Well, defconfig also might be changed in parallel, so obviously someone
will need to handle conflicts.

Best regards,
Krzysztof

