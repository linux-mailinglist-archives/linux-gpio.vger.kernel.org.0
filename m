Return-Path: <linux-gpio+bounces-39327-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oJX4FcMoRWoE8AoAu9opvQ
	(envelope-from <linux-gpio+bounces-39327-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 16:48:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C09AA6EEF3A
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 16:48:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N1D8ezUR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PoW9airN;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39327-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39327-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A84FE316AA10
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 14:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD24344D9D;
	Wed,  1 Jul 2026 14:29:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C42A330D43
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 14:29:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916183; cv=none; b=fk6Byni6qngBdaBn84YRtIXUIsW4k1g1aBNKUIMGps/ydO+PJqICToifZ3CAi6PFMJN+Avw07uJB+75v2nrttjMj5IpeW4wJ1a4gYdOptotu95JTEzMO6T7GVHqFQEu+atfqXY0CX27aZoPG5mXrXjEO+wjrbk3CH1d/1wRZUCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916183; c=relaxed/simple;
	bh=n1qejj04sNHaMIzjnmlkuI2T1vR12yhFFuqL+VESCNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJ9wkLYmad6kLcbGNg0a5mbNQa0k6loEesiva/hh42X5mKpl6OKbyZaxwXiemyd5/E8W0Fwguy5TyEng6PJ3GM8DMjVP2a5dVvAV9nVWbvpchz+yI/jaPoKHRkOkLGjHkPLZHMJ8sPwWECAB29BH9q3QWCIZdfl6bmXsSwAO4cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1D8ezUR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PoW9airN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A98W1674097
	for <linux-gpio@vger.kernel.org>; Wed, 1 Jul 2026 14:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TkSOof5emTsreQ5QRNYQrP4Tkvxm+w+63WVvb/pRaU0=; b=N1D8ezURnnupNr6l
	J0GloK45XqK1CmSRZoUQhda/5vuDhG7a4QtxGn3RT+pY7Wc+XNTTVun8q0L56m2D
	QlNqi9vJtY5dcMs1MS43oYv+ydYkKfNPU4UnVi/bkILMeNsIvl3oeIV6ZdHPRH2N
	IbKFSe6diTJa5j6uxetuB7TkUrWHtTgPLk4/onpdifQKQrdn5ZsMliFt2HyBdedH
	ZBU7yWwFWN/GNpJ3GYCt7F0353zfqCW22CoDEZvyfVX6cGVxqBwMBcEgeTH3WXmC
	rCjNNq+pnRgkAIFydePXnMjF7zVHn+AA1Dnhz0NR8lenRA5WdJapk9eaauQ+q41u
	12yweA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f502usa9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 14:29:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e62e3459fso97216685a.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782916181; x=1783520981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TkSOof5emTsreQ5QRNYQrP4Tkvxm+w+63WVvb/pRaU0=;
        b=PoW9airNKuK4iYm/TUgVzJ/hOfbglmmXMjQPj1SHfiel0W0fdjW9qD95k/pVAdq7XJ
         EweiRZ1i4G/ttSka6mDMQPq+rRaQIbWN3Z3Qe8r+AAEmDw1md7HkaVXapHjrKQ3V6vGf
         OMkZ0YhnUjdv9EWK2k1C5A5hg2o6FNoCIRGnqQJ0FztLlFSyTr0Uq/OJJYIA/zRuW3wc
         UTtdWV/A0dNXM+g+KqDAlvWUJnBN3FSnI0ZFPhgd83SO8PlNJiyE+TxLHr2KrWW31MhF
         Itj8TAvd9ObbBbtCY+MPSNKS0rOgptFgxU2YDLgs+a7yzCafeZC3Hp+DgZF2287MXlOV
         DpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916181; x=1783520981;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkSOof5emTsreQ5QRNYQrP4Tkvxm+w+63WVvb/pRaU0=;
        b=Hio5cp6ptsUt3Xb7zamQtlEo1U1o3QhCfVN3Fkt4ThgXTyYn+rRafrvsKD0+49uK7f
         ytaLqzVxhu/BxIiT2CiGIf5+4kFrMHomqMK6ekhbHKi5pweynoUVOuc6BmSNDWP1Md85
         rl5y213MdnEYS0/Nl5HtQf1lz9GWrkIqixrwbXYLgeagPuW4JSis/irJsjKYEZYDjMKO
         gzsGlPDTwRmARRX+Qr01Dqy/evhuaqM9enVzJMdcd/VY0hKLnHsS9BM8g/h/x/uikPLa
         WWrepKMBE8W1tBkfU8OfUsz/JGe4SwvxB/lab70c+AFw9w4WaqjqdZDM8RB/EW8/s1fj
         y0bQ==
X-Forwarded-Encrypted: i=1; AFNElJ8L3k9YB+Gncoqkm12aa/WNcFI0Jre130bBVIEQobkwHjrG/tz6LFeRUdznuGlw54tkhUsoSBi/N6cy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+8gaIVv4h4K0X1JomaZfP0wD8fCgqU8QfqG2f02sHEmmgVKP4
	9k7Xb4yS7/i61yyhjU9KMDcRGL8l3injvGKVpgp9tm0fpih6aQYsBGeEWzgMe50YKFDcOoOqm38
	KvBfOxdlWwuPNXQGEmDI04Wmyp2aNqyjjIcUlwR9DS1x20uvXurZ74mr7LGNxCUb4
X-Gm-Gg: AfdE7cmbPxalLF0ZWilleaPZ/+KXMnwpcApbmyBsEcBnpdJrrAAFTxmHUtyw+OD6XLr
	mjTlxyGOm1qTEq0h+Nyvg6euLf2k45+BCA5qEMz9F6KckNxy86HueJFNCUVm2gYwWv0C1wCuBHX
	9TbqAJnxgTxGuqmZzIvc77FBl6V0VIqN0AlkBLwicdikeZCfNkIABn6CgdzV0v3xlTfhPDxqr58
	Hl4AzlU7/qs2l0Ff13IArZW8qL01NO8UegPLtUnzjiza7HdZAbUoWXCJA20MpmuT99FNy1cNVoU
	Xv3U28AP0yrv0hXQxZ6n8ddu68UxlfIknv52wIwj25xYrkPGuwcPFRZl5zWiZaWbqZ38V4i/EsH
	idGCdFG4YTkdmbz0OOInBU9rw1IYeSMI=
X-Received: by 2002:a05:620a:6846:b0:915:efa6:d70a with SMTP id af79cd13be357-92e784d06e2mr251421585a.49.1782916180656;
        Wed, 01 Jul 2026 07:29:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6846:b0:915:efa6:d70a with SMTP id af79cd13be357-92e784d06e2mr251418385a.49.1782916180241;
        Wed, 01 Jul 2026 07:29:40 -0700 (PDT)
Received: from [192.168.69.212] ([88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm264534f8f.2.2026.07.01.07.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 07:29:39 -0700 (PDT)
Message-ID: <2df27e6d-082f-4334-8bce-fb23ef0dd7f3@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 16:29:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] MIPS: TXX9: Use GPIO lookup table for iocled LEDs
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <cover.1782900491.git.geert@linux-m68k.org>
 <68c915761e5234ad64cd62024fbac39ab097494d.1782900491.git.geert@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <68c915761e5234ad64cd62024fbac39ab097494d.1782900491.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MSBTYWx0ZWRfX1wyI/WHBsKcq
 B2ciMCgzTweUkegLdpeoTmQMXdZwZgebPvY5HbOf6R7qcnpniwEuHwSIKKaIt/EQfs93LakwtR7
 87GIj0y6scheVAr1YubLkQIvxV8XaQY=
X-Proofpoint-GUID: PKnU-gKlBkC1DzAZaKJGGvZtMQgv_84C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MSBTYWx0ZWRfX5uLerG0CFuuc
 4VT0alyEYiHz5BmPmOO1Bcp6mRUuH43HPNRsLmhZYc81nNFpshDSKmXVxd55yJaiUfKzGm7MbZ0
 hQj4AU/jy8ntZ4jpVNqRouyGlc6649M5LBp04EZZYjB0XVAcGKMPoH7WGTrL63NubkurrgPQTuL
 q0G1NTEZGSFUmWJN5S/MTbTdVNUUg4pPx6ulBO+zOYlGXp6Yeph1SSdJdR44esdzZwrL4nHkCK4
 wBOMxT7qUah8oVlqhpigoFDCCkNHXWjLbDaYVtNBjlqaLeesCv6Q2rSVgMvIY5DzjdRIRDY8BD9
 3idaUWfGTuYONjua+z6Wwl19xC8aS7W+pOk7X/C2wyA9bQcqKpFrBW7RC46SGkVpR7k7QlghSkA
 6+PQO3QyD0Y5Ol0Knp35Pj9XCivdgZk3DHzqp8CmJ7BbRJsNUSzfqFhI50j7vyncvNk0ukVFnAL
 L5a8m6rbdreaidU0mCA==
X-Proofpoint-ORIG-GUID: PKnU-gKlBkC1DzAZaKJGGvZtMQgv_84C
X-Authority-Analysis: v=2.4 cv=PbLPQChd c=1 sm=1 tr=0 ts=6a452455 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1tSEMpTH9XP_W59IOagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010151
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39327-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,linux-m68k.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C09AA6EEF3A

On 1/7/26 12:11, Geert Uytterhoeven wrote:
> Convert iocled LED description from legacy GPIO numbers to GPIO
> descriptors using a GPIO lookup table.
> 
> For now, just ignore the "lowactive" parameter, and force
> GPIO_ACTIVE_LOW, as that is what the sole caller wants.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> ---
> v2:
>    - Add Reviewed-by.
> ---
>   arch/mips/txx9/generic/setup.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

