Return-Path: <linux-gpio+bounces-31783-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJqpIPV8lWl8RwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31783-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:48:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF963154484
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9714305F7C6
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 08:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532C730F943;
	Wed, 18 Feb 2026 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTY2qGB0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LV063I2p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D0672631
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404227; cv=none; b=lzyPIJXYa5BGL0KFS/Tg5Qdx+5EtPbhOC6CFo6PQoClkmFauxrAOnyGarX5MlP+t9JNABzuDyr8Y8wqxr9+y82ACgjxdhCGt/FT//RfkFWhCO5akWohpPCw+NEZWI6huHRxHR4sonkI39kFD1ppPwNmk5AOrSSWCrOHY8pwmf3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404227; c=relaxed/simple;
	bh=t8MZQ/ZZEwlyiwhBvjBltm4YE5vk7TMCaSJCZpqS7hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GxeQYRBpzqM2kasdbKzwcnMlyEIQ/W0iDFw3o83G3pt8lUo/FQKInx/JMzKPt2Ig8+Px77ltheBVP/Zgf75nIHr2zh0JgF6LX26aUZYT0AUb5Nc0gKQGhZN2KcnmklojHUYRmdK787PGu+qoRvt2FIUDH8Xpjy3nxOTJvkE6rRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lTY2qGB0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LV063I2p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HKWthO3693919
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D11DLbhgRQAYOxcXhcBA1YEKOPZKFRqaz0G263o14M4=; b=lTY2qGB0pm8qVZ7D
	Fqgvtie5yySSJlMnMA8Bwje+H/xaeXNYaeEFVN6n740mGv+fNlohPt2hSbBEy+Km
	B6QQ3OxcekZXYLHYAyfY9lqvRfNln4zc59SOxgdTrm+YaLlqie/2DZ2ITya7dJgm
	TyV/QxY891Q3KN1SIC7WxadItCfNKd0XzFYkssvECN6wzJ3utH4ZADZ7XpzH4z3b
	KjO9HhGBNeexDhVBLcl0Y6f8ldvr2zWAiOR3MqZLVTsKPbhvPsoS9jyZ2o4bTaXp
	iWrQAH70QRRh/gs+yMneXHPZhHn5wRUSN86KPSWxfMIXg+k/nhlgRS0D+0Ylap6n
	wuJoVg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccyfb1nmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:43:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-503810dba87so693239671cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 00:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771404224; x=1772009024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D11DLbhgRQAYOxcXhcBA1YEKOPZKFRqaz0G263o14M4=;
        b=LV063I2p0LlYz/eqwKEbSZ6iCVslTNfnUjoozxj4OzMNuAUsB4yFhjz9nSgTKub2+w
         aBCbzw6L2o2xVXs4XlOp2GOPCf+jmSjRAFF4b0BUoghdFxw7RLOCVuL3+d499ZFoQExP
         m7LHU/Nq1T8i0T1wqEVjZ3eRCNvWSwvuxzU/pTSQO3XluMVB+2YW3BEQ8//OK1Bf0bPt
         mpCLYLaA1f3q0hEMSQGvnkEGhXCEm1er2Tru/k0K/ZzdQYmbYi3yg6607gYKaTQAXO+t
         fmY7nKgyx4l7U/zoZ6FnVHZIw2Ql7B7DGktWkA65/H2iuwlS7oWe4wacWgBD5LGlRFzs
         NI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771404224; x=1772009024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D11DLbhgRQAYOxcXhcBA1YEKOPZKFRqaz0G263o14M4=;
        b=cPbDn0lJ9P9u7WDqUdZmqxzp8XF2KPNYDxqu/kZ7F4Cu4yFCoWR1p7u1g/As1UTRN5
         EKkgFlyZL8qe/DvOc1E4hBTx4ygONkbzXsusXFa0QgbM/4mv3e9ZEje3bzgmRzG8RqoW
         i5PnLAkqZUZ+uj72Ot/QyMJG8AwhYrROdOJlfWSeRY7VaXcrelJNMpQuTjFVZ9i+Pb+O
         x82UESeW5YzH23qvDu1erPYHwoB7m8KWnPav+7QaaDP8aKzW4hDFhZdg9Q2nr6J4fee1
         aajfhWVlvaco8HN82GALqxcitGi1M5z6OQI+ShQalSCZLfz0MoxSVMlGPJZrrg+PvxRh
         0ruQ==
X-Gm-Message-State: AOJu0YysNG9Et+XMjJrrAv5T6MWaoJvYgtyIIb8W8AQuVs2Oykl29uSp
	x5Pr9n86D87zOCfJR65as6qgD9Fl0++/ODGjOq122wLwFMDR68ZgMs1Wj41wAjDzFfg52lGbTR/
	ljBNfQgLOWqRrO8WcZnw7xdmc2BNNue6qR0T0zjPHr3p17ubyq+HoX2n308XyCpug
X-Gm-Gg: AZuq6aItibN8iZ3Ip24txIL//aZxqhb9LWsC5FPhTXE8iUzdfvITqh4s0DNIybsQZMe
	ie3xcfGscce/B6815EQWHtnKflt7v/2UdoFZ0mrgTSAUGmsIvzi2M5q95zTWUB7lUsuIhhJ/1of
	6bABlVEuzlEePAraWnYS2+Qa7TktZnGxsBmKsoOET9H8Ex3ByNLA0Nbo2oLV+ILoRSsg8/xmrJp
	ey5V1jzgg9zfQK8jOzWrKclph+V+d2kUXw3r/Fj2UYeXEf8PMTWTsbomom25i2OvFm9Vp0U6jS+
	nCHbzxlW0E+RLS4PBsd+Eh6JChXSBdQe34atU0pjZXL5xk1sdHBSp5LBD4MgCR3lAdkoRWGK+L0
	bN99DUbxtIjxDPPwBVVcvqD1R3uoCcG7R5mvAimTESNRinVryxps=
X-Received: by 2002:a05:620a:2683:b0:8ca:55:ac72 with SMTP id af79cd13be357-8cb4c024fbamr1719913285a.61.1771404224346;
        Wed, 18 Feb 2026 00:43:44 -0800 (PST)
X-Received: by 2002:a05:620a:2683:b0:8ca:55:ac72 with SMTP id af79cd13be357-8cb4c024fbamr1719911885a.61.1771404223856;
        Wed, 18 Feb 2026 00:43:43 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6f70:9a29:d138:f5ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5e11f5sm583750455e9.4.2026.02.18.00.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:43:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: swnode: restore the swnode-name-against-chip-label matching
Date: Wed, 18 Feb 2026 09:43:38 +0100
Message-ID: <177140420873.51570.16441963571525422397.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8SFFRQc6wgtIZEfcU9Y2Phxy2JiL9Fnw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA3NiBTYWx0ZWRfX584JeTZXW8xw
 6ymHXnWLUcLaT7gyTt/X1NhNya7cYXoxijM4aByadZoUkSdg1eE9fyz66w9Gq/NXSX2hEnbtj4w
 j6Llj9JoVettk93G3UgffR8Zw4rdAmf837Q6THYn+iS+lDmzbr2mWsYut07Hy87nxIxS2qXkAqf
 X3onRicJGGUJGbu/EXxjAzNg2N1elYGFKrxGhoSzMoaPda8pnWPPFEjkMH7z8j0idLMeAtzQmD4
 NR3zvSIEIkl6gj/Pj3HX4fywZzbFm9w7QSsSMz8ToAxtby/y37NqMztftudDHr5ZjL3mEDVRFnH
 oDDM5FXZenh9ziD4EZvLXs0rScR39symYc4CwxcoIW/L80u/iSpGxGhbKcHoB03TK8h4iLlIbXz
 41FNJGppsgqPE5OB7XZ9xDV5vCI8KeajBObS3ey1rrUn8+ujrqyiMaNlxJVbZ0iWgSZJadQFOIN
 x2IOoscTLwfXd3Nv/eA==
X-Authority-Analysis: v=2.4 cv=JNo2csKb c=1 sm=1 tr=0 ts=69957bc1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=10r_2F6UnNXIiLmb3qwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 8SFFRQc6wgtIZEfcU9Y2Phxy2JiL9Fnw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31783-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,linaro.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF963154484
X-Rspamd-Action: no action


On Wed, 11 Feb 2026 09:53:13 +0100, Bartosz Golaszewski wrote:
> Using the remote firmware node for software node lookup is the right
> thing to do. The GPIO controller we want to resolve should have the
> software node we scooped out of the reference attached to it. However,
> there are existing users who abuse the software node API by creating
> dummy swnodes whose name is set to the expected label string of the GPIO
> controller whose pins they want to control and use them in their local
> swnode references as GPIO properties.
> 
> [...]

Applied, thanks!

[1/1] gpio: swnode: restore the swnode-name-against-chip-label matching
      https://git.kernel.org/brgl/c/ff91965ad8b214e0771bc5a15253f14f583a7649

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

