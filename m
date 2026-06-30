Return-Path: <linux-gpio+bounces-39172-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Cb7OBf10Q2r4YgoAu9opvQ
	(envelope-from <linux-gpio+bounces-39172-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 09:49:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A71426E15DA
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 09:49:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BL8ASBoN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EV5m5dmj;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39172-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39172-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7FD97300D4E7
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 07:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253093E51EB;
	Tue, 30 Jun 2026 07:48:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C4A3E3C73
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:48:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805734; cv=none; b=FUfbMLaig7RXB+EVQ6e/K4VQPXk7Eu6Eb0yyP6YGxROeOMkj9CgU/P33nNXvNJGYRiI6nKWF3bBH/UZZhfBu65WF3ow8eNuzkMHfDyb2E6J231PDnOBTS7GSIeSuWRSiXiR8LfNXFA9wOItohvEjrzDqdLqFsDNX1MLGIa2lroM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805734; c=relaxed/simple;
	bh=FVsTp1W5wAMou7tfbvT3MvGOwJ4atyI0HNj0OMdGxB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hd7spP5JprAtF5Q0E0BHlTGd18jc+B1d2e3uWEhd5SxdzltcelhtZpnNmkHx9NIok277aPsOWE33RcxUVtH7oQhnwvEBK0YlWBGJ7RiIjotMqdrxNEj2JLcVJCdZO3IVVbK1z4oO9+K2Qo/5WGfAvOuc9K/Phr2vpafdV+LaZ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BL8ASBoN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EV5m5dmj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CT4A1089900
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i0OvYj2FpZ08KKJOnjskaUMgl/M91qfEsZGOL3FKGXw=; b=BL8ASBoNxXkoZNfg
	EXNJyjI4C6QaS5sbxsb4KFOBDEYR7Yos+njfcuxtrpjyJwJxcZldsWC8sc8JGsvM
	xrKDs5i4ldXb6o6YQ6c5iceyIjZxmDlfk6CGFD4NRpzwq1r33F8M3KGWoMD0B+Ia
	XPZk6ncR5TI8JqJd9p/YoZANgdNEsmKC+Mw79smAzP/cGvjHg9k0uq/Pyi3TsRaD
	YfNsYL497k70BrnmQj/v60H98yOYaLbRBbahcSkvvaNTdG7lwXg1mqvLpi/7yyeB
	h4FQd4p2xFjGSoDrJS6cDva37pADTpHQN04AfSg1ERnvCupeQA9H/rcpcKudHm0d
	KM7gUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfhcqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:48:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915c364ae3bso696022085a.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 00:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782805732; x=1783410532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0OvYj2FpZ08KKJOnjskaUMgl/M91qfEsZGOL3FKGXw=;
        b=EV5m5dmjJvyskzsNGvvuOqXqqNLT8s4NB1tzZGXplUQWphn9Nz6Y3cZu+wRLlUGSKA
         aQKua7ec5+h5Wq+z8LipuAUZsllcY/xa0iIpxiRqGxjryCiLNsHr4vga+5BidNBnvP5r
         zYHXGlCydQk/UH5AZHEk33tVXHdsyoNDj7qv//ArxheISElS56xKXxdlo2gYXNIj9RUY
         EAw4p3Qo0QlVW7cc983HP80ga1EAVU3wRFljrkZe9xZt6v5Z+oL90xaiZU4D8JgeemD1
         fbQbHq67nfZPeSE2NXjksifBGa6bxlzf15GEU9CJN3mhFhwjpW4KMB090ZRgRz6wsvDL
         JwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805732; x=1783410532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i0OvYj2FpZ08KKJOnjskaUMgl/M91qfEsZGOL3FKGXw=;
        b=iNC/S+Lg3HTQwWET1qCDc63K7I0ep5Cr5Lcrh3xOpnqatMcEqjnscl80IDuQV3guf6
         MHJtJx+KaPG5BpynoquWX3X2kBjmnvzZGEbWWJujLUP/tHotmTARKR6wAjVEw7UWmMrt
         WF9MYNUCwdtP6ItXxCZhbMxbiRqkOfoHSawSrZx2E7yXvF53QxXxg7jVwoBYn92sS+XH
         uXYKaeKMNQ5fzU9y4wDzs+Fk1lQGrWPQQeIN4xh33155w7rkwtbkvvfQuZN6JFUknzWh
         gFG+rJT3+y/quVTV5WrQJjagct0D6+zJss2bO4/toTU0MZsX0YfXpZ06+136DZElzt31
         /RdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lHE5An7D31BTNabxyrmj5osSiQfxU3TZC0PTQVUPhuqbUPiGeRwUrE5VNq0MDHU6ElDjiLLY9wsa1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/dFsRUfALgIstWqYBO/h9dteVjhUXLhni3FTpGefQGTqxEA3C
	EORFxcp/AI/VEqIFPwXNWtjAwK4UnOmtiEzNQmFU/4QSZJ2WDDRsKdqOtiZtbxE404BH2InKftU
	QAYjzU9626J8NCAz0xQjdinXVZWvH9W/4p5bwEMk6OrUGoqGALwIrxJ31zLRxEDuB
X-Gm-Gg: AfdE7cm7kJZY1M5TwpgRFt3eGsk98SNcBPWSgvWFcV4fMhuEiIqRgiya7wKEebbOSre
	6wRDxVnAlkhMPD222M9cVTCJSH9XKYnsAekVzmkdHgCPaJgbx2AHYuidkPhUyK9ihAVnqdBqRlp
	CNLpWz0KJf43jUpeOcFMmWUgbdLsH91+dyuaXWKkT1n3QVCzcNwgwsaTmUdX/Axn98kLGNW4e9m
	UNJXM0rX4kJGwCYbT4xeWVeBk11gmqMrIMISuUQ1bBt7uKhVYxVsM/hanlM4AbfDyC+HcdjFy+J
	/ITuJXWXSCRHSGKcfy+m1KaRAUgVafRfi4Sf6DlgLOUh7aecYhaLm0E5C57oOMhSQwrt7E8yq2r
	R4RfBRzcQwluONQMchdVD53jt8j+IeXJNBSe9GqQ=
X-Received: by 2002:a05:620a:40d0:b0:915:cda5:2803 with SMTP id af79cd13be357-92e627eba1emr490886885a.56.1782805732102;
        Tue, 30 Jun 2026 00:48:52 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:915:cda5:2803 with SMTP id af79cd13be357-92e627eba1emr490884285a.56.1782805731685;
        Tue, 30 Jun 2026 00:48:51 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a2d4:ac8b:bb21:2661])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8c65f67sm53224605e9.3.2026.06.30.00.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Henning Schild <henning.schild@siemens.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Paul Louvel <paul.louvel@bootlin.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio-f7188x: Add support for NCT6126D version B
Date: Tue, 30 Jun 2026 09:48:47 +0200
Message-ID: <178280572474.5897.16083467528991834203.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260629-gpio-f7188x-nct6126d-version-b-v1-1-a06226c02a2d@bootlin.com>
References: <20260629-gpio-f7188x-nct6126d-version-b-v1-1-a06226c02a2d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XYnl9IYOL0hXhsfauS1KGW7lAMD7me-b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2OCBTYWx0ZWRfX7zefMvquH18+
 6cYfh6AfTM609U5OETPHc6YUskZAXmNsy2At777d46M4wnle3rP+pp7Eo13NF8nosePfG7TMcCp
 nyVpbLTUkdYtDA/KkQLd4p6p4GCOLLNDa/Zen/2tiyr3+bStLTcAAYebzLcAglWeBXAr2cE/UDn
 gTUsQnE/ILfaQz1CA3CJ2ubaFUmylOqlZmTMcjalVrtopBh7cLsVcGNCino64fLbfI/AJKukdm/
 cbh+0zBM/Nk0HWwQwHxkQbsF06LZlbEbxcNHckCMzle58tX/TaLKyBTGqLLooGilHhe/2lEeO1H
 VoeyS5U5sKci6dDEybBWzW8IjF9D57REtyLQkEuD47dvgI9artJzAzxvHtqX2qc2sb0FlKgZrsJ
 L9vgTjv4xNgCUz/EeD5o21zZ/38aAl654P/En7ykpG1HJ1CqIBux9A5bYhdLxiWvvSDeEoaiZx4
 M+rKUoYnuoMJ3zefO1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2OCBTYWx0ZWRfX5n+X9kyrZ9Nl
 xtkOfUQUuvQvrKwW8LUIKbCkWze4j33OQsZqw2PqLA4WzC6MSwSE/WWvOBrAtb22p3dBNO7C9CL
 PmbHSsaDA++e1I0GDiceS+8OGQ+Hyzg=
X-Proofpoint-GUID: XYnl9IYOL0hXhsfauS1KGW7lAMD7me-b
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a4374e5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pvbJ51eCTVabp2qf0xoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300068
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39172-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:henning.schild@siemens.com,m:simon.guinot@sequanux.org,m:paul.louvel@bootlin.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thomas.petazzoni@bootlin.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A71426E15DA


On Mon, 29 Jun 2026 16:07:02 +0200, Paul Louvel wrote:
> The Nuvoton NCT6126D Super-I/O is available in two hardware revisions.
> According to the manufacturer datasheet revision 2.4, version A reports
> chip ID 0xD283, while version B reports chip ID 0xD284.
> 
> The driver currently only recognizes only the version A ID. Version B
> only contains hardware fixes unrelated to the GPIO functionality, so it
> can be supported by simply adding its chip ID without any other driver
> changes.
> 
> [...]

Applied, thanks!

[1/1] gpio-f7188x: Add support for NCT6126D version B
      https://git.kernel.org/brgl/c/9a6c0b6ea12746d50cf53d59a7e05fd83f974bda

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

