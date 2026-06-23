Return-Path: <linux-gpio+bounces-38836-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VDPOGTdIOmok5QcAu9opvQ
	(envelope-from <linux-gpio+bounces-38836-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 10:47:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB4E6B5631
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 10:47:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ObZk2d5l;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ox9Mcv1g;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38836-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38836-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9263630A292F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 08:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7543382C7;
	Tue, 23 Jun 2026 08:45:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6D33CF045
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 08:45:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204330; cv=none; b=k9TNtAKkWcH8lMseKlTXh6pz1qXV/sg6vL03B8F5e8OFbJ2qq4td2gmncjilmkFgtyyas7JAJZ/V5DxcMi7+GIckqSBUT2FRkVcJauDjC+k8kCe7FO+fAmzEMW+E31sXchMm6nUfhUzRd8/QZnv0r+CiVYkkNI+RjEf2eMdy3Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204330; c=relaxed/simple;
	bh=qOvsRO9o7DvnAFdLYRo+mFth73k+QBuItOM4nYJ1O1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bh1ZQ/nazN+Zwjs32oMJeaqnKn42/htvSHpgsxgINP2LfrrDjqXlDpC69WNDsJ2sTCeRiP0aOgycD8+wLMY97DhjnMUrDWeYFAKFweBdbcwlKImb6FYj7lqw/344SACSynnWGRfM67rgE8Mmk1zFEzBVKe3TZmeMwmmt7taNYcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ObZk2d5l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ox9Mcv1g; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6crnN3547402
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 08:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/09oqpVSzXEvmxDxvReqNHOyNW4pwbzOgwRGLRb2Aqo=; b=ObZk2d5ldklCAktK
	Dm+5dqjF8x9zSu7fY+bZQ4/MIcz6B7pwC0um8iGqA/c8cd5gYIyKbBhlFlcMp09P
	u+fV52+RKUDT9S1I7s8mdRrKV+0uKEChMpLmqScN85wC//YUIqNIKov68+90/FYm
	K1lQdcItFHVRFzSBQ3Jmz3MRN7O4VlDywLR24bE9U8U2nB/eCB/zLmhg3aUackS8
	K73Q3wgpJ/jstLnS2xQ4lgkk4B3/X0oBUN2xR4veTb4d1EQO/LEtfwxNY5LFNJmB
	jQUHz31cGAcQbqA2pZwkQy2RIKsU3NFtHxPGuCY0ioIWOiWHTtCVbEGxGQdMN3Pr
	FLshdA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3ebc9c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 08:45:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8deb27fb80eso57435716d6.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 01:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782204326; x=1782809126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/09oqpVSzXEvmxDxvReqNHOyNW4pwbzOgwRGLRb2Aqo=;
        b=Ox9Mcv1gnqzgW87sbKpSBzxkIuuNFMHHcloxRn5m9YaDoLflLumzvurCEN8pkT+zhs
         c5E65ALLDPboUpBoiupu1m2i4C1m3zrJu5QEeFjxJ5VBnbbPyHfLbQiFP8ZQVNQ34XQx
         m72GzwCXyKbHhPKdfu/6awJqAkzZZ/i7/EqiSH3pXirgC3FBUJ0FP62K4+3Kf6Bb0wnW
         WKG9rXyLBOb3dmVjbhzgFysBCG1AXnTC88iZtmzbYg7kf1h84sHJQVdtalyYvqAk3Jh/
         ONU94w23qfOfHhRhqfVBEJf1rT5dlLaeVDj4h8f1RCQJnkZ26ipFJZkkEHnWfuLgmP0+
         RFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782204326; x=1782809126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/09oqpVSzXEvmxDxvReqNHOyNW4pwbzOgwRGLRb2Aqo=;
        b=BEd/wQ4SXvLDcqwTgp6dG43Jtcr5krwe7OC1roPnOijnBIBd4q1wTcKIX4ik0Rn6OS
         QbFO/+34eozmmRj86uF0FZBIBwCRvemNfrUOAqqGn3EzAxO/6D21iAFz9A+XTLsAuyal
         Smt0TPJm0rTqhUUIlAibSlMulGaK/b9uU0INKZ6dsyF8UpIY3Q+sO4d0eCZjpiUKwMOU
         fPoo4Vvobba7yy8wPEupgbhxxa87WOIOa5ia+ToAmUSOdiZsIjJ/eqUTblMZJdNAgKZT
         3KspJDPB/ria8Qwp2tWTfT2lFDZpS5lql31EgM9gN77LTIs+Dru+ynwybOwNq0SEXVyT
         ZNdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TfIYFiDVtDrDccJh+bPlu/sbBknI9f75xNsOmjQT26MltAI5dkSy1tXidc2NokRolJcnRScnHGgl2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx39ZZBh/6AdbdQg5evWLN+1msgvYGA5qW+rx9OySf77Ny/IYHL
	S8yi924Kju9oO8JIkeUpje9Vg1S35NiITbqCb2JN0NPD7Wk1kEQAn7i8Z2SlGqh1Wu4uP/6U9p6
	Kx+nHAlCc5kynJzSdo4bMvlxM+ikMqKD0oyDD5f9asPBLI2DcnpYmdl+pjfu4gSli
X-Gm-Gg: AfdE7cnJ9ZFvpclJ6qgdJbcSicc2pLusE/Nj3IaR0XBf+apD3/XxF/4elc4oZrFWXv4
	G/nD/wlOSiiDWHxrhk/jxybSXgirm7mSa+/6+lfMyiAyfw9xkNRRNx/oQMPmdKZXfqTpmdeO7VS
	goQtUdKcu/biNB/WRl0oRipjhycyVHaoclR9XlorSJb1XFg+QkvwrbWvG76ZVRsGhPNF7UShLVj
	Wdtg1wQZVRWlvHsUvOySYiebfSZuNVtlQcLkX6CISpR8cGWfc2auOU7OYzDJt2dhbzJIGYEE5VZ
	+H6ykRdKaYueb3PKH2NoyhHAVrpsG2kb4iht1P8DSyzNmBwthM4DKQxbJJtDpsFM/QaXieumu0o
	Tn1gYaGRQwjijDUJwKMTjMMrMhgHJbm1kKP0jsCE=
X-Received: by 2002:a05:620a:444d:b0:90e:2f56:2f0b with SMTP id af79cd13be357-9208a9bdb09mr3152047685a.7.1782204325641;
        Tue, 23 Jun 2026 01:45:25 -0700 (PDT)
X-Received: by 2002:a05:620a:444d:b0:90e:2f56:2f0b with SMTP id af79cd13be357-9208a9bdb09mr3152043985a.7.1782204325147;
        Tue, 23 Jun 2026 01:45:25 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ac73:5de7:b9d6:d9e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788547sm35622583f8f.18.2026.06.23.01.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:45:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Keerthy <j-keerthy@ti.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, fffsqian@163.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: Re: [PATCH 1/1] gpio: davinci: fix IRQ domain leak on devm_kzalloc failure
Date: Tue, 23 Jun 2026 10:45:19 +0200
Message-ID: <178220431332.7682.2130723358623360207.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260623023106.117229-1-fffsqian@163.com>
References: <20260623023106.117229-1-fffsqian@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MCBTYWx0ZWRfX76GIgn4oWMR4
 fAani+fDmbFDnEmG+T3ZIVuSTKuiwvoPGaLqGZ8FbrPoERrgEDW34azaEqkXxvLOb1FJnN2N6Zu
 30eGDswC/5eGGckCJ/+lc93n2aarlmQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MCBTYWx0ZWRfX3QqteEgYgF63
 sLJgnhBJy3DEY0AXB+9enQTVPpAaL4AK80YQquXvAl9AJycyVLcL5fJQdkWJsVSashSt0uaZ/BU
 DvVrS4+vsSCkM1KER9NsxjCy6MZWHK13UnAM1xcqfX36FfJ6QMsqPQSs7inOsvYFonJ8Ce1rMYa
 5AqGudhHqTRCoJgSj6F4TsIyNestsJFVCDqsKexhQD16bQXIpe3ytEoqmu27kZ1txQMuWGQaV8+
 f9lqh/Bq+22x3qfP3niiM+eiF8Ix8gFSB8ldB2PNxAG+fsAWC+edWXFrlSk9Ja8JgapaR13H+45
 QTet7N3S69PN3SMQKVImrkb39AVyDlZl8kfxDKFjQro+7VYnuq07MWLXpNAWUyTjGSU16XkPMCj
 iSLsA7FJsdPg7I4hBv+miMukSBYoAmSmif0ZWSe7njHOB3uFN0TTsifXlPhVMMXiYR80gNqlPlv
 ecBxyZfm1SnmA2/bKww==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a3a47a6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=2obOHJNsDCdd8Pb9Ut4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: OHGIWXbTm9Go0aup2R7VHqW4n9ewzcbg
X-Proofpoint-ORIG-GUID: OHGIWXbTm9Go0aup2R7VHqW4n9ewzcbg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38836-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:j-keerthy@ti.com,m:linusw@kernel.org,m:brgl@kernel.org,m:fffsqian@163.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:fuqingshuang@kylinos.cn,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,163.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFB4E6B5631


On Tue, 23 Jun 2026 10:31:06 +0800, fffsqian@163.com wrote:
> In davinci_gpio_irq_setup(), after successfully creating an IRQ domain
> with irq_domain_create_legacy(), a subsequent devm_kzalloc() failure
> in the bank loop causes the function to return -ENOMEM without
> removing the IRQ domain.
> 
> Unlike devm-managed resources, irq_domain_create_legacy() does not
> auto-clean up on probe failure, so the domain is leaked.
> 
> [...]

Applied, thanks!

[1/1] gpio: davinci: fix IRQ domain leak on devm_kzalloc failure
      https://git.kernel.org/brgl/c/4e8eb6952aa6749726c6c3763ae0032a6332c24f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

