Return-Path: <linux-gpio+bounces-39029-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qf3qB2pNPmoJDAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39029-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 11:59:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3E6CBE1A
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 11:59:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=myMLOWGW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SFVts5Dp;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39029-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39029-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B9EA93021046
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 09:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1ED3EB10A;
	Fri, 26 Jun 2026 09:58:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379F93EB0EF
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:58:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467934; cv=none; b=LTFisOnfM4fnj6h9YyK/be6suPKN7qYZGKSrMKeEW3HbSizNVVYixdv0EIB99JiFookeNaKebSwqC1csMTiLQ8paKXYms7KkuUvIjVCMxuIRYNwusOS6SmBpKCqQS85uJ1/4ujg039ny/cNPA0gEz6ACC2zs38HYLzWbJtBMN5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467934; c=relaxed/simple;
	bh=ToIyddYVbCIXLLuLfLQVWbf6ABl4vEe1sOOizB+V2TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sF7RXz9j4BrI1XCzmnxrL/J+PGHmiilyk/KOk6Ostu54x0EWEmKkm213lht3shldg8UVw2uwKg5d/j5umFM1/ai3R3Y05TqWlqpcanPMPqEkkKPDU3cmRb4jR+Zwc/6wdwqUmILzRWR0Q2TEvI4KxXm8kd32uZkcMLC/6nc9sxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myMLOWGW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFVts5Dp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VK4J1680006
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHJunZ8VxaQphlifYdobUQD81sA/oCXWOC3NtKsd1Ok=; b=myMLOWGWbSGg7j9H
	s9zd9PTCCF7RwnNh3QvEM6psfxFPlgKfNklRdYV8cjuuzeDGU5yGMz7jNcywyasL
	Vr5MBNfIOcH3IYpbuLP/WcV5+FodpnZtzaW6clvmFvzOHioVL3Zmg35i0iBM56sV
	ya5pAqc8+6iUedtaOyDe/S0ozxfO+p8xRL2jx7FVYpCNpwVAF4w8WH2gALY7MiWK
	unq/f5nNyVbYcbA7LHj3Vhc8lDiJymQQH1zS0xWp1ASXwJI2lvVN5KciHWgszeQb
	avjWEUaRsw0tAmEbVn4ehm9TEHRRWk1o5hXZoTbA/THSU22tsJMrp7Yn8wuzKvZq
	SVpuFA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgc1uty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:58:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157c8eb597so108784885a.2
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 02:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782467931; x=1783072731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHJunZ8VxaQphlifYdobUQD81sA/oCXWOC3NtKsd1Ok=;
        b=SFVts5DpYMb8NXHMV/kPACb6opKn7Lj3J0PD8LeH6qVOKbum+//LLLTVeE+75P7iob
         ssSS3LaihVTA+0oe04eENY/LKZivcLIQmgD2TtHZzMYP5iUGxPGiQ5FQHfIBYue36P79
         EBpNFpFc2FH2dLQSjgXqNDZF/CS95R9By3N37Xd9H0wPB7dptyYskdTL4so0b6Y6ub8+
         7l+ae8m4zHwZJpxUXmz7l7RosBX2dgw05IDOOYHKmksWkvZLEm9Irn0SPW6u3dA2wVfc
         u1abbtQtkWgYZyfY21YkZ4gpxoi/ozTXzdFHIipn4QNY0YM306S3ZBeDLuXQlOKPaF40
         brRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782467931; x=1783072731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CHJunZ8VxaQphlifYdobUQD81sA/oCXWOC3NtKsd1Ok=;
        b=c+jw7YJ2sGR/MWWfwbVkjq/YwvBqmSxAvAhQpkc341Gifl2yKbb0c9nh2Dh0cC90AW
         85Ks+F/UjWJJOIOsMPTWGgpD3FDkToHi2Qdq1ljwxbkYw/he+BfW7HRDMqVqSsQsmJJM
         hekswestXEtmZ35yhgJMdBL2e88EN+5v/glh5wn4Q9vlWb0jxsUVALDvv4WQL1awAtdc
         Lbj4p17ZrJyQvZimzCD6VTjkI2hMwYNdfkWsR+W4v2j4aG39ctAmRqy6gqpy9fe0nvon
         65DsZq8IWP1N6baZYmwDHSiWBE7dN9q41ILObIHeBrEuBR/3FERFO8BwV4pb7ZCyy044
         efQg==
X-Forwarded-Encrypted: i=1; AFNElJ84p8pAq6XDHsMHcQXv/ziApnRouU7SqCzrmV8LVABuPRF/ATkZTPqDXIu5pV++HBvyyUXMlmIJXCBe@vger.kernel.org
X-Gm-Message-State: AOJu0YwIXpU/9VGpnKGsA/IkEJ4Na2Xj++9w15v8YcQ4Y3diXXchcELJ
	n2/rGZp9RJUj9JsktuzKbrI0IUz6WQG646ZvWN7HP8Al8X4xoIt/xMvXKxZOTNOFiuNr5CARMpy
	dZYL4T3C8ootq1m4DgpnUsArv9X0XQJtZH+VOEX7fG/aPGjVoQklCcZvIG6ILUF43
X-Gm-Gg: AfdE7cmrtwMDciNvCwy9QWNGmGvb/xuJZ3gVW/WHUEkLMfRzWNeoisDQvitz5inTPMQ
	0lDS2JySAylssjeKU7f0IvGnDNhWXSHl9MY4UUtUdsceRPYe1XECLKf7G6u2TuojrdszHVLyH5x
	2S5m1zed2JPhdTG70xr4msfFZLKpgnRP7X09Mbcx3em/itmiANJ8mWchkZS+heoqnCTdryXpOfm
	IkiHrGr/f/qgyIhJb29w2nim475jj1WjTKb9O6QKNZBAV++R84o4LuwBvgpKxioqUuEmkkNvCYI
	XEwG+X7u6abS6Wj3rnGUMhRQ+NPybxjFN8KMyqEWxW6dxkxOt3FGqIzwHe7Fa6FtwFd/JhmYZ8M
	KZrKaIKGYjj2vCev2eyxX1KKUUe5kjQV1ywvCx1Q=
X-Received: by 2002:a05:620a:2689:b0:926:16a9:cf08 with SMTP id af79cd13be357-9293dfb7267mr932215185a.51.1782467931482;
        Fri, 26 Jun 2026 02:58:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2689:b0:926:16a9:cf08 with SMTP id af79cd13be357-9293dfb7267mr932197385a.51.1782467927454;
        Fri, 26 Jun 2026 02:58:47 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d8a4:9330:ebc2:b0c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fd9f2esm59110605e9.5.2026.06.26.02.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:58:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Philipp Zabel <philipp.zabel@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] gpio: htc-egpio: use managed gpiochip registration
Date: Fri, 26 Jun 2026 11:58:42 +0200
Message-ID: <178246790739.13732.10538727452698779385.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260624131828.94139-1-pengpeng@iscas.ac.cn>
References: <20260624131828.94139-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3OSBTYWx0ZWRfX3VhQEiER6EMG
 69EQvYqQlmu9Wu9S5noGJD7Dg/57viepM+rwSKksW5bs/STk8UpE/Cd5hn+sS1H/WV+CRvITwXY
 mVSESKN/IGiZUSKfh8w4Xd+0s8TLNIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3OSBTYWx0ZWRfX+ZdomSpHDapL
 UHUowkKrSCfohZWAcvfe3FYLPTVDmMyQARZbnnENXOFHwyTVTyaBMPSpGZ2G4RFZG/lz4VaI08u
 NzORCO8f8T4sz1dP7yymBHW9u+u6kBpMsvG33nmAA1uGgA7GY6B8bKd7mvD1nXbb8FlzMq4SU30
 chdF9uNlSuMvg0u/ZMAInXsxUS7zwKKBKIz3EzLBQJjU1A0MBbIYQg1VugodhEWeMGDBsY0QoVe
 KYI9YIQe8gFpm3IwJ2ixK5eB2sViuKxcsxyYE0fqXTlhGdznWaCJnilqJ/AE8ba815dGZKfuEoY
 tISozSsMsj8u14MZLo/LX5GBZtlPw9INYYIugjmerB1UxMYR46h4zeHR5bOI1mxFF74mrFxsO6S
 C27tkY4HCBIU+0majW56ed+DLd75Txi5yKvcUAPhscGTqr/RzItHruZNRnT5P7D9t6EEzkSpe4O
 Ly6qBW95ovauolKDCFQ==
X-Authority-Analysis: v=2.4 cv=O4oJeh9W c=1 sm=1 tr=0 ts=6a3e4d5c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=v96yJ7PrigVALGoPNp4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 2Rm2L1hJRGWImcubQe-V9PKBJOClIZZV
X-Proofpoint-GUID: 2Rm2L1hJRGWImcubQe-V9PKBJOClIZZV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39029-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,arm.linux.org.uk,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:pengpeng@iscas.ac.cn,m:bartosz.golaszewski@oss.qualcomm.com,m:rmk+kernel@arm.linux.org.uk,m:philipp.zabel@gmail.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rmk@arm.linux.org.uk,m:philippzabel@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-gpio,kernel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17E3E6CBE1A


On Wed, 24 Jun 2026 21:18:28 +0800, Pengpeng Hou wrote:
> egpio_probe() registers each nested gpio_chip with gpiochip_add_data()
> but ignores the return value. If one registration fails, probe still
> returns success even though one of the chips was not published to
> gpiolib.
> 
> Use devm_gpiochip_add_data() and fail probe if any chip registration
> fails. This lets devres unwind already registered chips and prevents
> the driver from publishing a partially initialized device.
> 
> [...]

Applied, thanks!

[1/1] gpio: htc-egpio: use managed gpiochip registration
      https://git.kernel.org/brgl/c/17326db5f0ab4ec1901e75d052b5ebef486b467f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

