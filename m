Return-Path: <linux-gpio+bounces-38225-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NrVaMbQdKWrAQwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38225-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:17:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 660ED6670E3
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:17:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iH01zTOw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jC1OyCOe;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38225-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38225-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 07DE43080A4D
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 08:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CE83A1684;
	Wed, 10 Jun 2026 08:13:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F4338E8D0
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 08:13:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079219; cv=none; b=bAhBJEuY7U3TS6IQ7gZxREUZlBSkTYnd1DDwBLroM52w+YsZQB/aT5UMWVVxxX8hUJACKpeEY4kacSdHDCWLdaNycq/d7qpXGkem2F8OKFmuUHRXPwVmQGIBRyNyOr1dkAvsI1aVMZ4kTtkGSzjf/5jv/UgG4sUVfD52pCpQLh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079219; c=relaxed/simple;
	bh=dpPF4jy6YiLPmgVihY15KV5722GEWu3hV14zsL3pvYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kQNhiI4OJVqVy3YCzgep1m/qa2nlJKla849olAkVZ1DJ2eomu6MGh/yvf1gCxwlC74pyBFcZBE29x6ipx7fWJk3y4VgqB95d9i+ClvDHmbPd6MMrp0HeKc1g+BxyB5SdAqDIfa+vBmHrcgAp2ol2yuxhidom78Fi2E6ho/6G4G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iH01zTOw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jC1OyCOe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hj9V530199
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 08:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhIIMTxswpu0kQXH6fHxF1NhZGZXbF+4A7iTY79l5MQ=; b=iH01zTOwsYo5+f9s
	5SsillREx29Fpv66NWi/PUKxYZEJF8a68D5JiHCA+ghOdQdKUkhicjdfDbPOWUOj
	YxdPVNgJfo/43k4/r91fUk1VHpoAKsJQjfRVvrThpk/zd3QWQEfXp7FoGXfvTyc5
	vGiXNJnN+QQ36ENy8j9zv87GK+hVgsNWM7Gl2zamWn8+HnKB5iTAJMNFNcsFhjVW
	7ZsLUb2Kr/YI0m5WPTVHdMzRacrCU+RmP3zTapNWmlJB/Tw1phNxt1/2oJsXcI6H
	cA5uv3rPsDaEIrC7aUWjBHADL+KbXv60ql1MWJZWKbaSLNPjYAzDmIPaLdlrNuOK
	ZlBf9w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2hdxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 08:13:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cecb6dee57so137347776d6.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 01:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079217; x=1781684017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhIIMTxswpu0kQXH6fHxF1NhZGZXbF+4A7iTY79l5MQ=;
        b=jC1OyCOegudaaUNaP6antmyeS0E/glIA2QjQPn1P97VRJCxzdMkdsnSbWczJqQw8U/
         +JewTtcjFYESMmTqZPLARB3HjTW28OzJD9U9NDojE5VLEbvD5Buw1VEKTFUKoSbGjfDj
         LNsT8y8a6LocLhfuL7Oi2yxTGh8kDSx1IRh6NTec83dZCbdP5Ek8ia7gq0yQJx/uJ0f3
         JvpEZhKJAe27O1jKYvKvoQ6vb16kMdVOWENbW60mv2Tmcmy//nYXFYCjBmGPdBdClLfT
         8RqJ6l4jdyuzVNJ4iEIXVLeziJfbqfi+WXkwLjjGGODu3r21c5Fo/F0W9xkmMzw+4DnP
         cU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079217; x=1781684017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PhIIMTxswpu0kQXH6fHxF1NhZGZXbF+4A7iTY79l5MQ=;
        b=og6IfwQEeGAmG+0YXRb5lOiRbEyONnBPq1d4i6YvY18cFi+leBE+JQANwxFz0q77lg
         C9BDDwfu/1zd7daLgj2gTKSB9Rn6qn8VnCuPV1qsWXOZyCssiniVXgQVg7W4rJ2/Wjdr
         2vNP/GlXWnO1a3Z3sBeN48BLGKpsg337C+cywdVpSaX5ny/9Kt+RVRWKPvWb+lDiVbz5
         MTWrih5Pq1TSiGij6H/orjCcFzK923DRMH3bzCTLrnZYYLcGKT3PBNGtS5C3EzlwZFWz
         W0dmqpdL/W+pa1xKufAZ+vUz7jYugTqnkfE3no3jHM9erk0Ru4ZTM8Of3v/I2uf71ilp
         IOvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Kj28zNs0LTA9d7l44RJzqyRorZOD2Fd0YNOxuOdzrB4N2zgDFBL1OGgvygXSRMxb0NDAtXJad7PV9@vger.kernel.org
X-Gm-Message-State: AOJu0YwKmtKE8I9WQzYMp2ke155WdYc7Pa9Uh5pXiwxohb5kVHQESJ4F
	hkE2sFWlj8RdOhLWUrqIiDsbJW2H0TGcAwdl2BZFG+4jqzkQhXn1W5+/YOh7/m5zQsxFBOkrqRG
	whcsp1wnPEofVvLVvnf8u18HGX/SytcUrnAZFgTS+LQKKX8fAzgwovTR8F2/LkxeY
X-Gm-Gg: Acq92OFg2vve78hMqMby27O5rSYPnJIjx8HOhp/8JJu46WpszQ4WJRtWKASGuennRGj
	XNfLkuO1yzf5+dUPWCXq2Iq9Wk0AALBMuWaAyjFAbZFJXYpnYN+C2smMscFbaWwQmOT031UsIS0
	NfG/npCMPgZE4H1mzqC7eJsdnYjTzwhuRf5punI/CqtbSJ5QHDlGLUCYgDuY3Qv9lAwpX3uSQT8
	UXoOeQpVfYJwcoNeU8d/s++7tnAcAIFM4jmLew0a/0liPILXrjp/ym9fANzjyOwdpybT8zCUGnz
	aT76vI36xsihukKOJdIytENWukqTh/VyTdRh4Ycv66Fm+80D5fMCxpIQv4NJoclqoWkYaNn8uzG
	iRqeTmCapnyZGcJFFte+E7ms0YvoR2qcv5o60kf7wQb19Zl6At9huWhCc/m45
X-Received: by 2002:a05:622a:4807:b0:516:cd8d:c7fa with SMTP id d75a77b69052e-51798882e6emr254695661cf.39.1781079216699;
        Wed, 10 Jun 2026 01:13:36 -0700 (PDT)
X-Received: by 2002:a05:622a:4807:b0:516:cd8d:c7fa with SMTP id d75a77b69052e-51798882e6emr254695561cf.39.1781079216204;
        Wed, 10 Jun 2026 01:13:36 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:528e:d8e3:7d1b:c55f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344558sm66503001f8f.18.2026.06.10.01.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:13:35 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, Daniel Drake <dan@reactivated.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] gpiolib: handle gpio-hogs only once
Date: Wed, 10 Jun 2026 10:13:33 +0200
Message-ID: <178107921083.14393.15982991231905667426.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608210108.36248-1-dan@reactivated.net>
References: <20260608210108.36248-1-dan@reactivated.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a291cb1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FKizRO9OI0puG8hLs8EA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NyBTYWx0ZWRfX+YByNzdXBEmN
 Qke7oAWFv2OFedocHal8Dc3cj8QbAhYN9c+1k7/7062LJQaZcbMGY5HMsmmxHP2QwYHcD7bvjsv
 bdFp27bIc9jQ3R4m30nGc0cG3P9INmxPdY81sudq+N3mZNlTmCs/qviV1TumrkvNZp0yBwqhXwY
 MdR+3kJeaqNy3ZtsQ3SHJ63KY95Uw3eKXf98kIBjVEMAynPT5miB3GBAPl9avXOjEwNAh/zZP4C
 IMINC+dGt1XglQWYm/B3yDi79xqMTcv7z8U8eBM1C5ahS/PfpbT9BFvdauzcf7OWpmox+HpnKsU
 Ae4EQ7Mx291jvm2ZHnn1xI2z73SPDbLqvMAJN/G4w+bGddWPNbiYcglnj0erMQeC5o+sYloN+OP
 6Wo3g+evfY85hL2KJlr+iJM5xpBocp+GcpPcZXULnw4hffpg9jk154WySTzRSyvPVpz+Ance9I2
 kymk9Iw6w3C3bHTJ97g==
X-Proofpoint-ORIG-GUID: 4xmrJx6SpjilDXepmfwauyY5IqFWMXTe
X-Proofpoint-GUID: 4xmrJx6SpjilDXepmfwauyY5IqFWMXTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38225-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:dan@reactivated.net,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 660ED6670E3


On Mon, 08 Jun 2026 22:01:08 +0100, Daniel Drake wrote:
> Commit d1d564ec49929 ("gpio: move hogs into GPIO core") introduced a
> behaviour change that breaks boot on Raspberry Pi 5 when using the
> firmware-supplied device tree:
> 
>   gpiochip_add_data_with_key: GPIOs 544..575
>     (/soc@107c000000/gpio@7d517c00) failed to register, -22
>   brcmstb-gpio 107d517c00.gpio: Could not add gpiochip for bank 1
>   brcmstb-gpio 107d517c00.gpio: probe with driver brcmstb-gpio failed
>     with error -22
> 
> [...]

Applied, thanks!

[1/1] gpiolib: handle gpio-hogs only once
      https://git.kernel.org/brgl/c/a23226b7c1f69eafd9ced4e037fb51c9758c0501

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

