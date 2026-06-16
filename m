Return-Path: <linux-gpio+bounces-38558-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fUZoKrX+MGrYaAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38558-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:43:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DFA68CEA8
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:43:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="R5PeRK/J";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QeBn91GG;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38558-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38558-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48228302F6B7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 07:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D1640B6DD;
	Tue, 16 Jun 2026 07:43:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602F740E8C1
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 07:43:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781595797; cv=none; b=CdoLrdSk+rbwV4ssnh7XkdgNga6o/hEE3uZZYCTnTNgq9TGrkmMhE6oS5IuRq6He573cHP03nxsahFnBUGQbTF+b9f3F8nCyW97bJjw4vyZXa6DkJa5TkEh1i5uKKialPSkl4A+WuI7EP46dg0B2fq/vmOFZrlouQXJb3Zg0wuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781595797; c=relaxed/simple;
	bh=kgEtPUUD2iDC8x9LHZD1yk5uOO85YLOt4CEScVF7i28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WWcSrSGhAVjTG3M9risCkSFub/lPHysk2F6FCOT/kuKi+SPHgYkYkyBNvOa41MBySslQR0xcTOeZRpa7qcp/d5X0a2WGyI9ljTQ69jnhs1FClaYO+pBYoEwugMKXW2NQwA2VK1nooe43akwJY4kXlkgUoWqymbQK9+VOIatCdL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5PeRK/J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QeBn91GG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G6PWMI2402292
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 07:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eBaj0hbHFDluuwif7q10uqb+NElW6H2Hsjh8tZeIAXE=; b=R5PeRK/J+qp7wJaN
	ryem8kEKCnEgoL1FXd8WyI8kfi51bcRfIawRPFA11ZWeZUwGdJwSLINIXZmBTwBn
	a9ftUMt4QeErCsgNABkkWDW6ZG6nk8E8/fyqQ6BXk6DSQ5q+IOBbKDbor36EuP4F
	sVBWJOpZ4XL8eifCh2aASSJsZs72CNXVaPvdG1MbRGVkjMkycv6w2FkhALLK2JYe
	h4nIavw3TmZz9UCVmLvpGW3WbC3s1/yfi4u79hJc1tOEKLnfdxshcl27tLUHLw9a
	ep+9F4U3KM+upDJZP8J46wMNUo+ruHHyfBR11zUvEAR7GOTp94bZbpKZabqN4Rm+
	WgriMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu17609yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 07:43:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157d38ab37so426801885a.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 00:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781595793; x=1782200593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBaj0hbHFDluuwif7q10uqb+NElW6H2Hsjh8tZeIAXE=;
        b=QeBn91GG0nN6lzKhrH8XxE5OLquqbtZ0WZrBI3yFFkHVos1CqTVF0/YVMqLB3DOlBo
         l70sgKFTYRqltJETzYkqu/lb+0RdNKFHo2QyyMxBMJZzXkTqOeIBAs/Tezwqx4R0v+n9
         Ao92+903YUNdTZeeDCpJI6B9eAHimkL9FRpaUAMFdqTxoUMfRiZNUOS6PGZYAI4XZg/S
         lr58TqqWBRiBA78Pf72law+nCA3XcAG7KF3a6uz3v+9cV067fnnK8jgTlbeQisN/43fB
         EmwGTfvCdHjaPFMe6ISZr8oVBUYRY3dHFGudmpNNjDenD9lV4f8CIPdmIsBlhStpTG75
         IsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781595793; x=1782200593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eBaj0hbHFDluuwif7q10uqb+NElW6H2Hsjh8tZeIAXE=;
        b=mFnFJlCxoMC8deT0CkO3mLv7lhSFop8IB7ROsZqvMrwzYCjXb30NFu7BnQ/mQ0DgkX
         OTMTy2Vitd1CItZAT03n/bftT3wrlj9w9qqrc0kAElNbQLnHUfr3URxelYzAL2BiAbwQ
         1J54go2+vkz7b+V3nYnoBX4XprooUxCAFD03c7mVckG3V0Nvw1sAz+aE9KYXr15dmm7F
         8EJmyQrjxo5JmwHODDOGFZNbos53Hux6SBqZd/mFnwzlvgj1DQ5ZqnwjF3K4DZFdvQ4N
         fR35/ydnpnQZilR12PGE7clN9Ad5FsM2WHUWKgv+RH+dRR3J5i4JnXAeuDa1Vy+Ff2rH
         zmcA==
X-Forwarded-Encrypted: i=1; AFNElJ8IlfeTA5IgCn8rhtw5K0XlACM5tIeofzvXSGT1c9IFE0shxUFBkhM//OiqnYJyg3kN5WpaeEX4ORg7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf9WI2fv0wqg+wwob5vJMtNV2s8mIOyTNS6Fi0TEkvdXSij7MB
	HP6MnGVDW2fE/iE5Twov9p6IEm1neejvmI3lH3Q05bmv2ZBt3DGkEmKYAjafvFC8nnJOpPFQ0Nn
	0c0gUa3DlqpSfnra3kyN+coDmmMvzb3twQUfJ1my/pUtmuEZycEJN41V/6N2jSkdNernW6F0caO
	U=
X-Gm-Gg: Acq92OEKqfRmFBmDu50+5VUcY6W+kVdKfFt233SvxQxP0WNQrfj+FWHyrVnizowPtYQ
	B3Bb3H+slKB9Q9aa0f3TE2wlZ+MMD44uTw73OggecNQ0HDSV1dgwwB/4hWxJdkRJcZraWTr70o/
	dFwdct787sjQBRYN/t9nRpPzQih1+tO3ZLJsn1Kg44HngRJXd9wWJugzEJfnqoIIQooqn4MymqQ
	TlWFKvrnZy9ryPWPRIGFV46AnAvm7K5EasAZ62g6KhlxiBLeI5TeIJbdkVu738VfinZ83p2GTpA
	n2XQd+u37aq8h171B53hhMOi9Pk+M/bumBZ+5qqSsZ9uq6T+/S/z+G9akdCEeTltIsXal26ILMN
	LqY6qR1KtWBI0g9uNoUsr65OTM+EaMIxA/4NwwzNoVfTYZ8fhag==
X-Received: by 2002:a05:620a:2887:b0:915:ab83:6954 with SMTP id af79cd13be357-91c45def7afmr370803085a.20.1781595793559;
        Tue, 16 Jun 2026 00:43:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2887:b0:915:ab83:6954 with SMTP id af79cd13be357-91c45def7afmr370800585a.20.1781595793113;
        Tue, 16 Jun 2026 00:43:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:cbbd:82b7:e325:35a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2e6a8fsm42470981f8f.37.2026.06.16.00.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:43:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] gpio: mlxbf3: fail probe if gpiochip registration fails
Date: Tue, 16 Jun 2026 09:43:10 +0200
Message-ID: <178159576614.6094.5316998958701016924.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615091918.43333-1-pengpeng@iscas.ac.cn>
References: <20260615091918.43333-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kZCJnPgNxYa0keCzD2dMEWGZ8Oo416O_
X-Proofpoint-ORIG-GUID: kZCJnPgNxYa0keCzD2dMEWGZ8Oo416O_
X-Authority-Analysis: v=2.4 cv=I4RVgtgg c=1 sm=1 tr=0 ts=6a30fe92 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kLWfz82vtZGjw1f9lhAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA3NiBTYWx0ZWRfX9P5pi3c+Dbu4
 4PdK0hRGHh7nWKLYbGMfPLQolD5D/QQxo9/2ep/2qMUyBkNjsfwxeDn72POL2Rdg6pIJoUrukW2
 tzYG3XHPvrbOmoqK3zhOlw3m7+gsqD4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA3NiBTYWx0ZWRfXxOppLaeIPat8
 o2P4VWYzmOFIszXby+dtL9ZGUEYS5sDjZwIHoFFIXVsXMSu0DOIFyceK+mzUO8VXobeaXPRZM/O
 fXk5/EDIbUyQO1vLe2WDIVKexszVScFGpNuMjqzHUbjPZg4fcZjwklucpxvzftGwxftPGfbUVKm
 wItsw4uOuJS1HQF+pODztnexVCYYfYR9TPxaGjixhtDGDg2cNJA0yC2oxJbgVyK2fmfbyIzoMDQ
 upCnVfaM+rEROWQX3gkBIReXogvPQ3iGzRIE7eRqzKwpyMCfXD04R340PrNwE19O+bwEav3jFjB
 fRXvtaMzEGMcANDOIUbe0Pb3TbiXhWZntYi9TnIltNFgjmrlcDfmL9r81ZfFokL5wXeT2RqANOa
 RVlDznYhpW7wBY4P+GlMcuNuTtenlQsGaQGY+CdLT6wZdJWb/3h0Z8wnWK4fHzNKMFI6EYF6UFY
 Wq6Rg9L4BtDnzPR2zfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38558-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57DFA68CEA8


On Mon, 15 Jun 2026 17:19:18 +0800, Pengpeng Hou wrote:
> mlxbf3_gpio_probe() logs a devm_gpiochip_add_data() failure but still
> returns success. That leaves the platform device bound even though the
> GPIO chip was not registered.
> 
> Return the registration error so probe failure matches the missing
> gpiochip state.
> 
> [...]

I added the Fixes tag and applied it, thanks!

[1/1] gpio: mlxbf3: fail probe if gpiochip registration fails
      https://git.kernel.org/brgl/c/0482862a90169f4daaba0ed31a85d8304bf51e04

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

