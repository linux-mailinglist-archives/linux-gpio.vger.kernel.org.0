Return-Path: <linux-gpio+bounces-39257-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CQwkNCo/RGpNrQoAu9opvQ
	(envelope-from <linux-gpio+bounces-39257-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 00:11:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8E96E8567
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 00:11:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UVVUyqEg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NRJsyDRg;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39257-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39257-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B170230D9BC1
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 22:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D492732AAA7;
	Tue, 30 Jun 2026 22:10:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321D932B110
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 22:09:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857400; cv=none; b=BIsP8CL9PlPGFq1BBkitcNn309aYZIsnbBxPtF0ce3GR01A+PJQAnK2C5LE4P7K4filGSSzCHuYl8j8Ykv01nEtqEnOt4HYBRxEoz5Am5Vw2HPproqHWyGYC8ihS9noFTN5eWeK+artLmvvzN7innXJXinlttLiC8mCWmsaiyoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857400; c=relaxed/simple;
	bh=lka07Gr3l2JawsdDoDkCfszFn1o8HA7+GaDRSGzKdLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PZoZy9oPGWW9w7Vn+N7w/codJB1cT65gKc/2Yi+DooGsqBEeWg1sYqS9TRggfAQoNwnP19ztDEpzEkuK8T9HgAFYs40mxUz/yRyuEvmnmdC2Caftej5JzeR6SXlrHSw7AS28+E7r8+wFRUTOHnCJto7NdhGIGF3mb0EPH+yXfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVVUyqEg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRJsyDRg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDrH32838664
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 22:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=; b=UVVUyqEgI3aai44H
	QkYs6h4Sk/6/uPO94ctKOtJjj3n5+wTduu75T3lBINHDzCPeXdCe/LLgdz4BiIIA
	I6FCYJGuW6rbqCzG+PqGMHpMb6xjJcmfkHJt1PYgP/kntODh+X0VaaTTgDbDdP/t
	5mK6QuZEI5QJqRhPc//Uvx2PsEtojBE3Wf5jUoCGbxwxji82ZKuqfAGOBqi/CtJM
	MHsN9S66aTzRxKSc9r6r3jxLGT72P0S66dSuzw/gjfRycE/zeF8d/az8b9/+BxqX
	uSr2XsXere5zlNsaYwMjPVwz06xYAC/u+oMsdfeWvyWqnAZBEcPGno6XGT0scTZD
	4sRW/w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd1g54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 22:09:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e73fc29bfso894585a.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 15:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857397; x=1783462197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=;
        b=NRJsyDRgz9XcsskDy1TCStajobjEVNxjDA4Y9JZ5YMTLcBi9FjUItPsUngOQEBg+Ve
         qCRCHUiUpd9V35DZ7oUeLzju31vveARTtZe9HrVhQDCcAJcPYuvJiG46Hv0aZK4TUEAd
         LjXYOD5BGZmYIA39/qF/kHDQRYxv4Ui7o9c1BLhA8bCMd8MCeNNEwUoVW3nW1QOL8HOE
         uRPOEvPot4OpwEeJOWmsxnHopCwAs4RQgWaTZCne0w0DuiZRruYr26BbTeTaohBkIYr2
         bvNdMnDKPbiyjlCms1hLacLCibEbq0ywkqfYCG58x374QsjTl+HiMPLbYJR9NlMCknbf
         2fVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857397; x=1783462197;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=;
        b=ZdR9cVZSAbFeKOJemoj4ktXBxEIsC5EXalLBHP2OnfC7F8EFx0VdyqKAxpQ/hTG5G2
         kPBoeNLb4wpkgof0JYQ9/QUAm1t9V/R9/ZAZR2j5Q8ukyaxhMWTqXDbzoTHtD0Y/SSmq
         p9sV95BWO+wjUpwoWo/t27Gaf1u7G+/uHSKuIU4UUf/DhUDAmVePbzAuaTKTjkrOOu3a
         h11wHJ/hi60MIN/ieN4hMFuLDxtwDxtV7TnrJFJr62oRgSUhsWO6/f9vagma5uMQMZ+6
         hfiFtctMRft+DF78cfqnVB9StfVXr8Jj7N4uXKf+5fhH9hQ7rRiJqpTiPENduUSHs8SV
         9sEg==
X-Forwarded-Encrypted: i=1; AFNElJ+N4rMyV9uDWu3giu2lyDcvpoHV8JH/umcYxxKkRWHh0jtCJSrrU4TiLNLcmlp+DxHO355xpVitpxSR@vger.kernel.org
X-Gm-Message-State: AOJu0YyVVdLU1Sxz9vc4+LgooBHDkafraujCvd6RH4fdhs2Y38aCmWbT
	et6+R/ag355swaDDvtbhdpZMzKngxVc+q8VnPF5bTeCOLPy3yXOAHfmSJm7Hi1UIqVXT2NqMykp
	XX71pKP7Fa/eifhsI8kKmF+0ylL7JhAZ60p9uRowZu5UUn5VjOPgECPRo+nDgfNTP
X-Gm-Gg: AfdE7cm/bI7DxzFONKLqBGi3fM1W284tf+iKZyNt5NzmoDHl4ey79G7UUtzNY+5SFFH
	/Ybv69iSQhYeMEf+d8PG0QMCUbdSm4IVayHl/SAU9ph0wsgxVO7uQV+pEQ/J4lUtJpK1E4Tmqy7
	ogPOgreq6yuVACAwcCgiZpEE/ckf21L3NtGDfbJi0czb5VshcqFhfCvFcb0ceF3Vnm6+iCirevk
	Z/c03iw9L1PkaWBwK4B3ESVmBKWRQN8ic4+oBwsSCT+h3uoA6acfshWUC12NFtfWulzPgTFzJhZ
	O93Y2hvBMv6wIt3ZOAsdNpvBqE2BIaRM4gKU6IIyp+6h65vDkx/dBHLXIN+/LtBPxCzwCoyYKM1
	PYLUfnabSlbfNLoH2FFky5xI9JWz+yeoZWwSm6BHP5X6Edu+CWYdd/TjGe0vdZg==
X-Received: by 2002:a05:620a:468c:b0:92b:6805:918a with SMTP id af79cd13be357-92e6d926a2cmr434243885a.66.1782857397408;
        Tue, 30 Jun 2026 15:09:57 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:92b:6805:918a with SMTP id af79cd13be357-92e6d926a2cmr434238085a.66.1782857396955;
        Tue, 30 Jun 2026 15:09:56 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195b3sm11865243f8f.8.2026.06.30.15.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:09:56 -0700 (PDT)
Message-ID: <caa30078-9dd0-4f07-a206-2dcbd2ba09a1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:09:54 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] gpiolib: remove linux/gpio.h
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org
References: <20260629132633.1300009-1-arnd@kernel.org>
 <20260629132633.1300009-14-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-14-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX19wqpp7YKjJW
 6KUqVmYFiaq+oouf3oG+vt058QuNkLRqBUPLeR1R/QuPqYQnMh8E7AkfJnuLWULdJDgMi+e0x8F
 w3opHMXVX+pM402u3MrOk4zsYEZDWLw=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a443eb6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: -CK7liEIrnGuJYWwUDLDwypz40yMMyiw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX1SPnzpK2hJJL
 /zX1jntF7GRugYTBDxpkTjFzylWbMtgHWjBtj7n4X/RvpQHcNC2X0PoRZRMtIkanGdCGnfuwm6o
 cYCIm6tKCeBe/mEC0KGKU8i+YEEtgFABs9K2XJNAyuxtWZvaJWwfhYfamW0OnPeL5kJY6aVPmm1
 0nTMWp0kAXfzrA/XWs3ciMOTZB5iJqT+CQEzmCrp7lfdzOYNb5SMo3/CAit/S8UB1FhX9aIpJqF
 T67PWdVkSHK4FCVLgkCh9dDqQyfAC28VCAxCch+SftGT7KV+LfHFh2iGqHP5qLT2B/CchzRSMoS
 nNDbNVASp8goJ2hfWQLRW8vEyZuRJ+o7OnonUHtdZkaKb81xdUuZ2kXLgAHwA/fsWuGZ8QO6f2z
 GEp7h0RyZM0FrpjdY6PXtYDDr7tzDzAZUrS2gTmn07Aqtbb4Xmwfn7DAXaOUqD3YI8og20+N30d
 am+n9qIapbFq0ZOo+Aw==
X-Proofpoint-GUID: -CK7liEIrnGuJYWwUDLDwypz40yMMyiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300216
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-39257-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:dmitrytor
 okhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,redhat.com,dominikbrodowski.net,vger.kernel.org,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A8E96E8567

On 29/6/26 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> After all other drivers have converted to linux/gpio/consumer.h
> or linux/gpio/legacy.h, remove the final leftover bits here.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   MAINTAINERS                   |  1 -
>   drivers/gpio/TODO             |  4 +---
>   drivers/gpio/gpiolib-cdev.c   |  2 +-
>   drivers/gpio/gpiolib-legacy.c |  3 +--
>   drivers/gpio/gpiolib.c        |  2 +-
>   include/linux/gpio.h          | 22 ----------------------
>   6 files changed, 4 insertions(+), 30 deletions(-)
>   delete mode 100644 include/linux/gpio.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

