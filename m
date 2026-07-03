Return-Path: <linux-gpio+bounces-39392-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qrkDC7N1R2o7YgAAu9opvQ
	(envelope-from <linux-gpio+bounces-39392-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:41:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B1A70030D
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:41:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BECsprnV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ce+w9h3y;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39392-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39392-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D567430D1A80
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 08:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA7033D4E1;
	Fri,  3 Jul 2026 08:21:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAB2331EB6
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 08:20:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066860; cv=none; b=HSdNhUvSvlUtVBqLDnav6OAHOhn+dSiaEnW6Uv2P6JbXX/y7u3LhEspJZ0JeKsmAV8k7D9RbJ/B27ZflDQhMZZpsBlKEil5k0DmPxFHYjfpGpAQ/EuTJeiaNkzq8y51twdgaN0Sbq2+9vF/O3PNhxebbp8zp1bZ4SsQknenOcvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066860; c=relaxed/simple;
	bh=HbHpHSY9NsPk9W35hmKvEGRZPRI3Z5ug0TTg3TXplZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U+8AvgVmVu2GaJ59wqGKpHNLxmZdc93tyF05oTbbARGF0AmA5Ycz5WnTRQZk5Guuv4DDdMpGH0WBAR1bJgsTsHyA3lckqp9Xhcpxf5+k5dnWgeWI/gv6/O0NtW/NCeCh7BiMbtj8+DKhZBg36MQ/gx7GR59nPun1MGEHzInwBaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BECsprnV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ce+w9h3y; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rsI13147562
	for <linux-gpio@vger.kernel.org>; Fri, 3 Jul 2026 08:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MevWA27iUr+PqW2XLoVtzDgSJt/tlvlfQxk/aVUgRkY=; b=BECsprnV4e8eciNC
	vZ0Gvyo2mJYE9MB5ZPCb3lHH/ALHqw7R2tb2eAK9PgXz7LAiz+ZkkFbA8RjWxdUY
	5Iv5erJhlQGuRrc7jNuEcpmPyTQOcQzNp3wOhzYs5BV7nyVPqz3r9Z9zSXeQeN8j
	GQNpsxGkvd2qbD23Pqih4FpZMnnKSWzFmRNh9p5dlQ9bX58TDrhTBPCtSwfTCWXO
	i6Yl8QUjBUQZgobZYqXfLF+hIJy4sYnMRuMRFzN7Tl9TvQ3Yfg34qy8soU8hwvtg
	+SiItcxqnSJbuxyAzOeiiIANAsUAFr3nOoZsypnbT/ZPKww7Ep2bJ7RL8Ijofyf4
	O743tw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvww84k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 08:20:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5fc4c7e9so27982285a.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 01:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783066857; x=1783671657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MevWA27iUr+PqW2XLoVtzDgSJt/tlvlfQxk/aVUgRkY=;
        b=Ce+w9h3y4sdY++lNKIecFQtE0Jrzpd3snNsVKksEaS3wc9Mh88usFhMuLeEKSh7d+5
         maovxqpE1AKW6HdMJROq4tmb+HI4JwL9PeLpEnCKiKefPYgCbNNy6ZoFOsQrsc+52qTG
         2xNhGqLHq8E9YC1d27FU1kdqpiZKZL0F2RfGF56ropN5LFm4D/+StcnPyftourIAtOzQ
         XVvWcZ7IG6N8+ZFaXtHakaS4K8gxbnvUbaB3Z9G+MldvWznCi6O+O6VKAPJyEykCQ7uu
         EMkuWG+cbL/b7LEJg12Rm1gmi+psxBp5zhFpu7qEZSL/y4+eAITN3FMOZuf1XpbDpOU6
         mgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783066857; x=1783671657;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MevWA27iUr+PqW2XLoVtzDgSJt/tlvlfQxk/aVUgRkY=;
        b=lZ7CnW7sbCgWzV42jO8Ko03O4R7JCgIsvFx5bHgJMU+HbrlbBNLRkC4xvNZBHrzXbl
         yEVPNMKEVeXsZ5ZsVIIP51BJLCcHUCBH+vhRqMTzXwAn30Lx2GevRsvX0dlBd7JbrDSG
         RTdbgioIPQOpEYl6gITwQtlEAWJqaFH2AzYBtiV1I22gDA6xQ8Y4w1/vNaLbqHlRmyOp
         cMP4X+HKbUGjx9El18V3iZGYwYJCIsJzj5f3mrtTySnYy+N44fxgKnx26k/I2YUrjo/K
         Rkjw3LkvIylnvvQCLw4JThvPR0BeLMOuRXLM1TOZfHmlEyfpvh5Ybr11IlZ/5XdzkJMP
         e9tg==
X-Forwarded-Encrypted: i=1; AFNElJ8SxY7nUmlor4cInDV7kW+iXLvHov8eGTvy2rCLHuZtzXIFvKTXDhIWdWn3e0Gea6gab+pT3g2MsZt7@vger.kernel.org
X-Gm-Message-State: AOJu0YycwgUbYDpG5ai6YDnzcvqy/1GsvRsF1T47egq9rUsAayyUNOcb
	aq+2ihJAtJFuvVqlc23e+8dAbi/w/RKWKozmy04pso57wEIAMVOh8AKOQ8qYg+yMCk/gV52gAcw
	NDJdWqll7KgY9cjLBVBV3Gjz3eAIUKyct0zTIu0yBHMTzxMwkayd3QSKNvhsKU5Eh
X-Gm-Gg: AfdE7cmA85SwEhUfTIrIzY8eDTdp0h7iGJnF7uXJb+MNsOyXqQNIBKGZDvnpf58zihh
	KhzTlb7W6kr5w/fPTMoSoJ4QXcJseatr2UpifXn4z/fJMopqt/aKC3hVyXO+9HCXyvOyfLoL+ko
	TCg623ICKKp0I5+qe+B3BLyMt+piPs6rXieYxeySlEX68UigPDsH0Rc+Znzxj7XBcOTnV6xE2at
	Ezk6QSpplf1NpDiRozpGkdliWUVF5Y19nZmRtTc3mr6RRBv3MdQwrZ/mEsxz4CP3Bz8RkJwlfO+
	GrokWdb0kmrecFFzFJerxi+qXDgY3F5oNEGc8rrb1SPXoF0hmRHxFOC5zD9lFN6XvkLAQM1za7u
	yauSyqTdputVGcfyuvektc4YIMfp4Vyd0QDKDf+w=
X-Received: by 2002:a05:620a:44ca:b0:92e:7319:7365 with SMTP id af79cd13be357-92e7b042c9amr1098936485a.26.1783066857371;
        Fri, 03 Jul 2026 01:20:57 -0700 (PDT)
X-Received: by 2002:a05:620a:44ca:b0:92e:7319:7365 with SMTP id af79cd13be357-92e7b042c9amr1098932185a.26.1783066856791;
        Fri, 03 Jul 2026 01:20:56 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b934:1281:e054:26d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce1a844sm30038455e9.15.2026.07.03.01.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:20:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        =?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
        Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] gpio: nomadik: silence boot log
Date: Fri,  3 Jul 2026 10:20:54 +0200
Message-ID: <178306685093.6924.3082461604910448071.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o3OxAjXc6a3cwqiKOb4uuW9Idl8ncq9r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3OCBTYWx0ZWRfX0B7r5gyfXc5H
 i+4Yqj/gmiu61sYdGq6mgNe9lf1lBbsdpkoO78h1mWZxLA+jpWO2BW9opIP+eJMVh84xJRPq2jC
 PJfZsHb4wLosj+O003mqgFDYWQ+NmW6xY1fqG3zGmojGq2kxFN1C7c3RCOJhJjedWTH2APX2kav
 oGJqj9OJmPBlvHJTEV8bndxsdJBe4escdun78Ty20UO/bxXQj7QuWUPuutUSrS77f0pZ6sbSbJo
 2cLofuDnZLzqaQcEQP4LDdBU8fBdZssCRSs8tZUHiCc0AjxDLN+n+GCy1wXSMb5TDGxdUV/AuKf
 jax9sCt0ror1zuDo8fNEcCMMHXDqu+ZZ1qCzgBEpCWBxLNHyIu5bugUD1htiCbXoAWzVisalvw6
 AadAMqrre2XpJmyZbN8cADGTxqE9yMqAk3W+67/y1dxNBECGXRBIxJroqqm4TAqzGZCkirNCnGy
 5wfrsOl6K8eGpGxTihA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3OCBTYWx0ZWRfX07zVaKXI/0Cu
 IUEizEZjRuwkAK5EUx2pyN8/QDDEk5mnrX/9NyWBcZn5QQUr8FQ4CbgNmUrnNcnN5eK69HeCiLL
 PWMII6ZKueBAxBOdlsC3HAERga1pwDc=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a4770ea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QoyTEntUziiQsqKmZ_8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: o3OxAjXc6a3cwqiKOb4uuW9Idl8ncq9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39392-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:p.zabel@pengutronix.de,m:theo.lebrun@bootlin.com,m:bartosz.golaszewski@oss.qualcomm.com,m:vladimir.kondratiev@mobileye.com,m:gregory.clement@bootlin.com,m:benoit.monin@bootlin.com,m:tawfik.bayouk@mobileye.com,m:thomas.petazzoni@bootlin.com,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74B1A70030D


On Wed, 01 Jul 2026 18:56:57 +0200, Théo Lebrun wrote:
> Currently, on EyeQ5, we might get those error logs:
> 
> [    0.544230] nomadik-gpio 1400000.gpio: failed getting reset control: -EPROBE_DEFER
> [    0.544274] nomadik-gpio 1400000.gpio: could not populate nmk chip struct
> 
> Then on successful probe we get:
> 
> [...]

Applied, thanks!

[1/5] gpio: nomadik: convert nmk_gpio_populate_chip() to goto cleanup
      https://git.kernel.org/brgl/c/6dd9672a16bfbe59427aa0694fdb94553e7949f4
[2/5] gpio: nomadik: add missing dev_err() call on chip populate failure
      https://git.kernel.org/brgl/c/2123813511d495b99b605abe4db167793698e0c5
[3/5] gpio: nomadik: drop duplicate probe error line
      https://git.kernel.org/brgl/c/b0901d4dc17e37edbc928c01dced21ea86da87f2
[4/5] gpio: nomadik: use dev_err_probe()
      https://git.kernel.org/brgl/c/56716e37447a5bd4f9fbd6e314acacce191e313f
[5/5] gpio: nomadik: drop "chip registered" log on probe success
      https://git.kernel.org/brgl/c/edbcefc9b0d5925f8be4227fc180a92cd49d126e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

