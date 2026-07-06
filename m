Return-Path: <linux-gpio+bounces-39526-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vHGGO9mvS2oaYgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39526-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 15:38:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9AD7115CA
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 15:38:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JTaPMlvq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CI3s2zgl;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39526-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39526-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C57430800D9
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 13:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5F6416126;
	Mon,  6 Jul 2026 13:27:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1123C10AE
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 13:27:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344429; cv=none; b=eC20kH6kl/MElzgqUmHVm6BgAmNn7+4aV9aMDE+1EOKatvH5b9sthbrgVRoHua+0k6lUlmlQ377exoV/uP2i4OM3i6MZMJk3d/I6rZ3gCON2RBXJS7O+9JmAMbVMvyAPi85RFEGsHLduyB2xgLImIClWNl9EiyTzYdlnRAYnzCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344429; c=relaxed/simple;
	bh=zEuiCrpXvyKDnTVE3A+9Ip1nFY2NCrwsAI2cqDALiVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E0c/GD9g3nfnv5qs9TQIkk8xtfJGcVK7tv4ZxpOC6W6L0fGzM03m/A51cHay0PFJ43XLXBxfjzMAhZUlsVDaJXfJ0kCm4MWfiUYTsV+CWtrdyhR9LnSz2LCxM5rv1/Fp43INCsRKvNm6Bl3MW0O9jozYKwXMyYrFcM6tM1l/dp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTaPMlvq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CI3s2zgl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxLhR218452
	for <linux-gpio@vger.kernel.org>; Mon, 6 Jul 2026 13:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XUSpj6ulAMd2esJaQQj7RDDRJ3stdbojp1cS+gth2Jg=; b=JTaPMlvqyEJ0IgvM
	mC0pU+aaTykG5ore7nxEnrJ97rpA4md9q860DqoDHmeUP9+sUI07OQ0l6g85tRrG
	5Mo1+TyfXmcOBtYbUxsjuuK29nsT/SEFkR5SU5w2ydGu4+7lSaqI7lZZp1OI4arp
	1ZVbeTQgKG55LViMDhIId2yRIbuVzy6u9mVsw6/aVPI8mQ27nTF9qI2BZF4QkHhV
	/eol3b7/VriKfzzOvJWbiuchRI+9OQ+izBupBBW4mwVdR/z7koLvwIjuHg9BX3mD
	GFTtnq3Y9f5QkY/cLnggLwC3GCmbenIW6sDQiApGpKAHRl5OaujOvOpc48tUwBzC
	GR+9Bw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs991j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 13:27:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92aea0d801dso285717385a.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 06:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344425; x=1783949225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XUSpj6ulAMd2esJaQQj7RDDRJ3stdbojp1cS+gth2Jg=;
        b=CI3s2zglVQhZ7kG9eBkst7oCpp9a6VMLaUk6omTjG2S63KFZpSPp0/hObBYVpaih3d
         /PXWMZprF1Pj9km8/834N1GCMDzD6uOa+ULy1V9IGJzYZJjhQoGVxztYD2UgO0iy3QdJ
         uK6BL9yMNIvPRFlORig73lA2eboiv5JWW3fkU5YXbw72mUx1aOGx8OvckKHXP/msuG9Q
         mmMEpV8QdCF0jtbLzbKrh5M1fJGvtErDHPeZxz1B/Cho3lBUE2cYdFbA0xLX4nceJAUb
         d6hczCOOQBmWjO73HJWJ8ORHWx9Mk2ZbFFZIZ8xa7WJK0tcDvOZwFyCXBeRYGUc8PNtl
         +HTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344425; x=1783949225;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUSpj6ulAMd2esJaQQj7RDDRJ3stdbojp1cS+gth2Jg=;
        b=ewQKJ6Ajwnz+Wxgbg14D2xUSI0GapknBZPGsgpl5QSqfpdpwmaPU5Y1HWXJdzyWl4Z
         cPe5SKKZ/g5Go1BAjFf3+thaSBvnT1i56p60umS9nBfK4G1O0veVhp65EQqoZ7B8YG0D
         vT5DNp9SoMOAIfQofJbKgnghwtwu4WzLJq47YouBJROFBYT6dbofnd5IX0uZGqH/5AX4
         umn4K31JeylfNkycZqeQytOCXigS0Es06fS5QMgeJ4coA8TU+NPE6Q+uvNz4rn8Z+8Ml
         bglaeYbiL7Q9jtMDJ4WsGFaftv19pYCLJDeKx7nEsIsx73wCK12Wr3TiYz+fsDEjo4hQ
         qohw==
X-Forwarded-Encrypted: i=1; AHgh+RrWAJdM6NuagZjoE3ieR+ncmK5wIElx0OOKT/QZKSLOkgGMPP6sQI1UyGKxD3uF/QFy/ChzLgSmnAjR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaii7rLEvynNanFqm6u3EKueFMp5VHBSmAR6AqbkdaoSrtPRB8
	Tj5z5SW+aok58Bc9E597BKIIbbA5pQe9/TmukuhwxxRXNOxgwKGSoIWCfky9NfkOBVERzgrTvIt
	ocS9ZHZEgl2L+ia195Gww0LNYpOwyGSL3mMWIVGEgLBfWfxnWCr7rCuKP7CjBDsfYlABpsaE2
X-Gm-Gg: AfdE7cmHJYuCN0Q3VhV+7y1EJGSnvMTpu8L79pYIYrn5OhQ9FJ9yH6oDYqXxEW+svbI
	Sh31o23v1cbbEW3gL2GaKURm6JtrG6gFi7m5XY0cJLuZtUi8Gn4PEMM7N9OZ61fRxWAZEEYV55d
	wS4aBzUHCwK9fjPxmGYwYY1w7JpLM8z4nSk5kG2FqOEHOXCZxcffVdoRHRRD0ZOu4Q9d9ODq63m
	SbqSGDKiFZnUHIgS7MB+va5lk/ZrCP7i6uSiSZKMEx1A4WCqdGf50jxaGyeX8FZ5HwNecYGXUXs
	m4FtzMm2u05/RUQvTFc7dK60LAjyUq/yApc01JH2I8eDT6rfxFUddnZ4LV+uC040L58QjVJrLzg
	xbcHiUOny0LbuqZf0MwMCa1hOt8aDZmdBq74ojBQ=
X-Received: by 2002:a05:620a:4041:b0:92b:6805:9197 with SMTP id af79cd13be357-92ebb59fbb5mr73068785a.63.1783344424660;
        Mon, 06 Jul 2026 06:27:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:92b:6805:9197 with SMTP id af79cd13be357-92ebb59fbb5mr73063185a.63.1783344424073;
        Mon, 06 Jul 2026 06:27:04 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm264938235e9.4.2026.07.06.06.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:27:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Marek Vasut <marex@nabladev.com>, Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Viacheslav Bocharov <v@baodeep.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] gpio: shared: make the voting mechanism adaptable
Date: Mon,  6 Jul 2026 15:27:01 +0200
Message-ID: <178334439922.51009.1398959410300494803.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630-gpio-shared-dynamic-voting-v3-1-8ecf0542953b@oss.qualcomm.com>
References: <20260630-gpio-shared-dynamic-voting-v3-1-8ecf0542953b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CpioRI6uK8NOtfewTEJ8Ud0EGZdA_3Dd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX+YRSkIbpkp+1
 XRBLlK2l9jIXH9pmS2U459Z7LfiJQBpSBTOGIm74dCM8leJaQchTqtQvtfUFWh4m7htGlNMfFlV
 PBdZueu+YTy7leu3Vwu1W6vjBE4mGJD9oC+AKOu2mSxD/a0XroHP3JUIsSu5BK1fgErhFVOYr8V
 jWPBSUuPkUE3zmyG+sBrzvV0zoEKoi1q9Fex43xjLOC4cH6ougxuDJub3097tdbs4JVLNRM4+Zk
 VZhQfy0e1TcAYBQDgFX7OzVF1r+l4Zxw5x0CpI/GvpYES1zHhNne7KdHcMbD8DaQUJJ0BTc6+yE
 tPZ0DvFHss7icvgA5uh4Fua+oALYyutIb7v/TvrEd4SawXwQvyFD1++gHYQEYps5k/mO96zxLX8
 W0n4qeeVA8t2HBWa2CUhIerqR30zTMtbro/v7c194bPkEfdkaCGrCZPisr59yJuESwbLXF27M0z
 fFXqfCLzTgxLh3/6v4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX+/F1Chja4I/r
 JQJVFnw8WRUZx33FN9gt1M3Hw4sFJnrzHggR3IC15BXe5waTBa2brz4kHMxsNevHSmpq+YbyjEZ
 caaX/aGZRzd46tJh5Os+jAVdDoP1TuA=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4bad29 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vZZG7usAqG6dULljeq0A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: CpioRI6uK8NOtfewTEJ8Ud0EGZdA_3Dd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060137
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
	TAGGED_FROM(0.00)[bounces-39526-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:marex@nabladev.com,m:arnd@arndb.de,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:linusw@kernel.org,m:v@baodeep.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C9AD7115CA


On Tue, 30 Jun 2026 16:28:16 +0200, Bartosz Golaszewski wrote:
> The current voting mechanism in GPIO shared proxy assumes that "low" is
> always the default value and users can only vote for driving the GPIO
> "high" in which case it will remain high as long as there's at least one
> user voting.
> 
> This makes it impossible to use the automatic sharing management for
> certain use-cases such as the write-protect GPIOs of EEPROMs which are
> requested "high" and driven "low" to enable writing. In this case, if
> the WP GPIO is shared by multiple EEPROMs, and at least one of them
> wants to enable writing, the pin must be set to "low".
> 
> [...]

Applied, thanks!

[1/1] gpio: shared: make the voting mechanism adaptable
      https://git.kernel.org/brgl/c/b30973e8c3920ddfa9255a959b19057515b4e5e8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

