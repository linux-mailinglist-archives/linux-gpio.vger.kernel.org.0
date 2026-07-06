Return-Path: <linux-gpio+bounces-39492-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VSBZHsxyS2p1RgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39492-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 11:18:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6865570E866
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 11:18:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GuwEkIMW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SoGkL6fo;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39492-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39492-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF2D6308FFB1
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 08:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386014252D2;
	Mon,  6 Jul 2026 08:47:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9E3378D7F
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 08:47:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327640; cv=none; b=aDyO7y71NtIEw2fMYcBawyhlhfJs3npAKwFnxzho/dyslq3dh1ml9qn1/7n+riy3VwhhYGcZoRVJFxxtZcMWl+ThSoKoACBmc0zKu0QtLXISofOLp2ty348u5BRgrqjMmW8xQwVIXsYGjAxiWysVW7G2xnLkhPUpdE4/PYqoKIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327640; c=relaxed/simple;
	bh=kyla1w/oc3Bz/mSY5pKrdMFoOztHPoBcl7c+XrrRF8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ks+vlojS3bWSVlyAr+Jyvq0+rTBnUfnF33m75hp0HWvRdUwJq1+qa/va6CQ7vw/y3LtEqWuB5Ao7JVtfv1ZVx8W09shOO9jJEDJ9clWCWz/D/6cZC97JJ+2kalzgj9oi+vBm3QoWHJzbdY03d6kpjGUCRtra9Nbt32m6qy9t3FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuwEkIMW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SoGkL6fo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668N2b04072465
	for <linux-gpio@vger.kernel.org>; Mon, 6 Jul 2026 08:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tkYP3OC/LGLNNPp1OzKbhDNNQrn6HqNLBzqQQFjefnM=; b=GuwEkIMWoCxx6IrM
	gQMH14bZ/dcpMdqYgaQjGjp08xg3tRLbTAldWqg5fQcJSY/z9j2DhYanw6ntJv+n
	yNlj6mrFIMaVBkE1q6mazb82x+40Ry2JdQD1lUUfojbeMoNUo0fRrfAsg3xvwNmo
	icFVM/zgmpteKR7xNccBENX2GDYYbH6jvCulM9VGFPa92wa6AHC06bwZ1bVFLDeA
	dkimCTckYfOZVIfqmefKqQfnoNclEcToiSXHb2ADtLSlcNC2v0185Budb2E1FLUy
	MMJxQshZOdsXfhuilXAz20QmXm6RyObpANjgdSmsqc7wiQy7jkAQT2fT/oni6fWm
	4I/ZYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8836q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 08:47:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e820609d9so195219585a.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 01:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783327631; x=1783932431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkYP3OC/LGLNNPp1OzKbhDNNQrn6HqNLBzqQQFjefnM=;
        b=SoGkL6fo3lmNTKqq7xdTUBE09JYqGkqq3+J+TM5vLvy8HCfNR0+wA1xevvXJvBRXNp
         vUC4EsRUB0ENlAscSMUESS2ncK89BWblR8dZQVQIP3zRgyuHn0jKguFRge8HhwJEzbFl
         SJ3rf+wiymrQ7HQ6EcW4X8hOuro4Vcp56cEZYQ62GbjvPcl8dzMWKKGcEU1O/VxtHMRF
         X7LF+FzNSdDZQn6lpnhrVkTtQb3iw8eUfphkpFlSTtbeWLTEI/RMfEC07JW/slW85pjg
         6jZdGe4b+ePM8O1Mp++b8BAgyYoj5tR9HxpeNe9yoopo3R415k+3J5zl7yDjFGp8cv4t
         deyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327631; x=1783932431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tkYP3OC/LGLNNPp1OzKbhDNNQrn6HqNLBzqQQFjefnM=;
        b=ZtVJTc+5M+bInvSIntxUpdMJWCLSJwetTHUloZm5Qv4v9PSTpEzaizEvyBnTEaEjH1
         +8kdPpI1kcs0yszRMpfXqrIWHIkZtnIZOGbydO+SZq0YJ0018vPVp7XL4VXjhc7Gln1j
         SLtsGQ07wkoeOuHKQwh9pzB/kz9nlOzenAVXmkYpBXvAcvOFopbpsBTHAL/ot2WR3Yf4
         UubyGinGbHyec5azMhW2Qju/v9AGZyVFXPlgjsNC6qJD4E5YTNBSDXgcajbEZRtoxvHJ
         bdHvvwqOom3mY/Mwytoubbpd+0c8RMwbKtaQWD3RHjO//YIed1YMaKzrvkjdp5OM3jzs
         X57g==
X-Gm-Message-State: AOJu0YyyZQUeHQ7NAaV07spPkNQKmL13hGAX5ZpR8NQ+0ioEXqnyQDEy
	3JoORX4UcdSfSwJ6iv1UQ4ykTmYNe7hROLYWpLlnbB8Tm5riisB1IZURQoRHkpr9ZgsV/CcZfQJ
	+J+nxlRe1uJu4n/XFodVbj9/5YMh8VvcjOCm8+mx6s4r902qi32q6CUW2Z9q0nM4VR2rTI/mk
X-Gm-Gg: AfdE7cnphxi15ksUUwQlJpSequQc6omSi+kVPvWRFSmoVXd1dRuwdkLC0WEGTD3b6QN
	aVysHI8cjLg3V6VGtytMZRKsAslSZBaKH9y43HO8IBnqPNk9P70UrYFVJSgzXp7G5PrBVDte98J
	MEJAyhF/eht1qv12qPEup8Gt9WFsoAnviuHuutvQQzeGlokBiUUsUDkvq31aoWasDqR1Ipsek8i
	NAvQsw3GX/Vs8XRSA1/hh/c3BbVkPVF9Czmy7HpMaOA9vjOzw/GPZ+81+oYN2Kr+it6znRq5wIK
	4qS6Mz4qepbUlSHukMlNq2IRUHGeMJWirSgrOSwrBYl4K06NEgg+zuFxe0CrlkvdZKDOQBvbG2I
	qGwEnkVxm1NRNTtT1xWaHBW2Dio7YtA5vd5D/mcc=
X-Received: by 2002:a05:620a:450c:b0:92e:5297:108 with SMTP id af79cd13be357-92e9a3446cemr1315686085a.14.1783327630041;
        Mon, 06 Jul 2026 01:47:10 -0700 (PDT)
X-Received: by 2002:a05:620a:450c:b0:92e:5297:108 with SMTP id af79cd13be357-92e9a3446cemr1315684285a.14.1783327629559;
        Mon, 06 Jul 2026 01:47:09 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bf7efsm358170155e9.14.2026.07.06.01.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:47:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linusw@kernel.org, brgl@kernel.org, vicencb@gmail.com,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/4] gpio: mt7621: address Sashiko complains and other cleanups
Date: Mon,  6 Jul 2026 10:47:06 +0200
Message-ID: <178332762342.17485.9754072207529453942.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626060112.2498324-1-sergio.paracuellos@gmail.com>
References: <20260626060112.2498324-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4NyBTYWx0ZWRfX4GW6eWU/VTQ0
 gGtkNhA3tfaRIW1ivvaq6zRJ3P6SedzXl+7mxasUtewHBS8E98IOOh3ULRoLOkSvaurw1Weu9kI
 SYkfoGq9l+aSu1GaPN5MGibFDbKewBg=
X-Proofpoint-GUID: NoTpOojjm6wO06on4ZpdFRnWofrqaLuZ
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b6b8f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KLu7tvSqfL87IkgZ-RwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: NoTpOojjm6wO06on4ZpdFRnWofrqaLuZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4NyBTYWx0ZWRfX6DXOWLl703si
 rc6ZJyfODOOGoNGVrXpN2eoHtPDwi5H6qXB5F0LnNYMiFqY1ZXdAwibyOI8OBS2yDQdXSYDRd59
 nwh+HhnG/MRu/xYv7ddBBTcIFxk+WSaLblaBD8R1Ja66kHMq9aQCIgyYq3S0ZZ93+x6hXmv+t2C
 MNgNKtXCm8Oayepqsl/AdPXEwRfH5QW1kzx37JUQv5C2Ht1idR2oq1vlTTh/1xfIpzdyZG+ZHMm
 TEW7caLvdemb8P0YL5qwGJyKzE+DxkCqg9wHL/Jx6wyffw/ZXOirTWQ7WuUSsuPfn5wWObSMlxM
 YAQt9gjMdgP+i3X7IkBOX9eqYvWJqbVWpU+T5BZzgeA0xKbszlStfLtVGya6uyIpo/0xtj8opGJ
 u3yWpJ9oslUzmyqPafXKVYCx/4zr0KVx/t1VrrVR9aJvuovT8MlYghwZu7+tHt4bwF+EJcUZ/sV
 kNMP3Cv/WDnt6Jw4NyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39492-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:sergio.paracuellos@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:brgl@kernel.org,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,m:sergioparacuellos@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6865570E866


On Fri, 26 Jun 2026 08:01:08 +0200, Sergio Paracuellos wrote:
> This patchset covers some sashiko complains reported at some point when IRQ
> mapping was being fixed for this driver [0].
> 
> I have included 'Fixes' tag and CC to stable for patches 13 since patch 4 is
> just a cleanup for naming.
> 
> Thanks in advance for your time.
> 
> [...]

Applied, thanks!

[4/4] gpio: mt7621: unify naming style in driver code
      https://git.kernel.org/brgl/c/83957567b1589bcaf5fafbc359cc17f79a59ed29

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

