Return-Path: <linux-gpio+bounces-36526-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PIRLYy3AWr2igEAu9opvQ
	(envelope-from <linux-gpio+bounces-36526-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:03:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E07150C714
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 452DC305DECD
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 10:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2419C3DC4DC;
	Mon, 11 May 2026 10:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PiLl/7Yi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrAl3xGW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A47B3BD63C
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497083; cv=none; b=kqfqWg6OKF2L1oKSNs/z6Ds1z3U0p6GSamFlDYEHbZlmLvQGsrKDhJ9brzdrD41+UinNnUh+8RiFPFPDU7fNLhH7HeHXDzJ2aV207RSXTMVxPwnoP6gyQlpR7rnEJk+D8xwEvg5jm1gITtztAHwnpsc/yh5gM8HLtZNWbmiPM4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497083; c=relaxed/simple;
	bh=idKSf0Y7Y4AVRyohvvU0Gin/2AbcPVLAoJEq2SUw1/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dyEnfbXUk5JMGb48u+aRpDTnLeDUGOu4YxeLjb1PE61YuTkpD/zEdUoE2kolKaru9zEcI2acrdgrgykzRZ1AfF+he9tRST4/pAuqSeGwM9VgT8RFkXCrT8K3QopEtNaQGFWZJuWSZSknsGPRin86OpXez57tjuXiJ5zq6h1wnhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PiLl/7Yi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrAl3xGW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B6gj4Y3635091
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 10:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEtWHAym48gNPoa8v7LlK08pYl2QtT1Em0d4Un9steU=; b=PiLl/7Yi0R5gn+5i
	2hy68OfuaYkmHFrpTXSLhlDK+zk83/rRnwe64goU5qbMKvyG0CGjcN9ZvR1aFrA5
	QaX3qj18MpL6FvKb5Q4CS7mqsTLplElGPCax/l3UiXlGs5DV8VFFYDfcddEmWbRh
	5rA4NsRlbho4KGtmjLKn43mY0xHc6EVc7CwAYqEKgCegDzfaOrqJoezjKi/mhF07
	4sbepO1VFPQeY0uiTjtKPw3WIjq3ztMy9L+bLMbIods1sbK1MAtAYnC8yPLHqI4V
	ezyeqDymdwpAVbHV4MqYHncdpVNGAR35lG41AczSE6dxMolj4CTk9QHL3F9NgPuW
	b3WDcA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e240h4w6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 10:58:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50edf01172bso103888491cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 03:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778497080; x=1779101880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEtWHAym48gNPoa8v7LlK08pYl2QtT1Em0d4Un9steU=;
        b=XrAl3xGW6tMDdzya8MoqXMToh+ZDf5S3scEf7W9ZniEsi2knEay/0m/zgeY0uzVrcx
         t8+QDRFEKzLiajlppy1AZfZ4xsC/2ZmYXZGuslp+Z4k3y9FRe4ObXvts7nE4nUYDAExW
         8qHcQmAmqsDWJPCvHca4B5QBO/EVmobN1jpVZ+duoSqL2aH9IHREq+sNKIOH2jNnugLt
         kEGKDH8Jnwfl0AJtpF4ou9PE3i6+BcK3DQJbqKc3hePgSSIS+VdXIZRiJiyHu7YTdsId
         loeoxFPzwpvAWAb1kqyxBPrRkA2iarY935u5xB1O278oergY0ykKeNMPm+BSL+HXzSZu
         lo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497080; x=1779101880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sEtWHAym48gNPoa8v7LlK08pYl2QtT1Em0d4Un9steU=;
        b=tCuZUXK0dsfAuP0teX4ixQnk7BBPJ7O+AKImicVWvm30duN1IybzyMb3i7hSU9JUig
         LZ+jXwaaikW3K6LbGQLuqzjLFqw8MpkWcKW/YiKgod1YXrpALYGiIk45URm0wiXQeBEH
         z0cECbUQeThC0YdNP/8zrRSQUjyjtCSxr25Y4Yseb95/huYrvLBHRYxfVD39N8/BEuCv
         vLTGVRFm58+2fmNNgQqwdho2nPCkVNaxbitP+8a8sPUmAgSCeGuoikOkzfR9iuni9q/k
         AvDL+OTY8yMa9CW/Zn/PPR5F347CLQzWGcU7OggwId90koV2pQq3hvRyTjzN9grugQvK
         020Q==
X-Forwarded-Encrypted: i=1; AFNElJ8yWSPD1y2Hq8AMEnSO5hgPGZNnbdl/mE0SoZEmeu/i2IeDaxYgxoGTMfmxWy5Vi6pVlMcErPQmtFV/@vger.kernel.org
X-Gm-Message-State: AOJu0YwUjimY9GTQ6z8F3gLL6IndJ4ygiV1ANfBGxIhR45805XI4altw
	3ZJgi/Oa6XFjRErC5DOMDF43Z1t6FEVNqsu9FlfNax9/G5ihWOkVBqMQz1nIX6jrl3pwVAxSJ5a
	a6qbsnC2ruZ+hvU+jt1JYATf7mNxprluSc8HkQWTtzQgSPjSJAibRRgYDnw+wfCH9
X-Gm-Gg: Acq92OE9rLwmpvk0y8Yk96PLPipo5tIFAkEPp1cf5QBpZ/DnFlu0mPtydN1c9ePyke+
	713/bu5HuHcmkEfJOOMx2oz6+5PXQeBi44aAtHdKZlGolOuOo8m2KwsOJRW09CSHDjkING7Gcco
	lcy6JMLHMRILt5eVebouleaSE7NY20+2jKdUMYxI7Wma4CdkEJaZwqLUjxHj2E4znJ1Dja0Pro7
	UC9+16nq8AFq8TqTp/NvUHHr/2T3zLmD1z90EnP/VozIeubuSl0C1mw4/nSb3ZGic4OZhHrHcrc
	ZZ2aotEZ7eZgsKMeziJAYNz3N38a5wGSdlvhKvDBisgCbweHtKFjKKifAS6Y+jjiFl74fBJx/tB
	qty31SRjOxCxqGHDYFbFqXG1xpnVL9eVmY44z68M8Jz8HKMnWzQ==
X-Received: by 2002:ac8:5a85:0:b0:50b:526c:541c with SMTP id d75a77b69052e-51461fb1c27mr339570371cf.50.1778497080347;
        Mon, 11 May 2026 03:58:00 -0700 (PDT)
X-Received: by 2002:ac8:5a85:0:b0:50b:526c:541c with SMTP id d75a77b69052e-51461fb1c27mr339570131cf.50.1778497079931;
        Mon, 11 May 2026 03:57:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6fffb9bdsm166087555e9.1.2026.05.11.03.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:57:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: (subset) [PATCH v10 0/2] PCI: Add support for PCIe WAKE# interrupt
Date: Mon, 11 May 2026 12:57:56 +0200
Message-ID: <177849707405.46496.8165024025113766918.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511-wakeirq_support-v10-0-c10af9c9eb8c@oss.qualcomm.com>
References: <20260511-wakeirq_support-v10-0-c10af9c9eb8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMSBTYWx0ZWRfX3iygDrlugtUc
 Wma2bulQ0B0/RSZOO3vA5rtuSH0zGkOLF9YO6wGsfeIgt3PThUId956fkoDLWtcNRLws50v89j0
 aV6Zo3DD6cV0+nwdGcQ3cLrydZxd0jHkpgBCSrP9PvgsrICnAhEODQCUzg8ckdoFwqmaznN6wC2
 LnYEbsD+Gamte/AqSxfN5mZwpfqh0BjDHitCAhI5LFOdY6OSV4/9TQwglVneH+LV7PeWBy5RkAP
 P/Q6td8jP/azRzXqZ8nk3BWZs8lzh1lA99F6+fz/J8oUDHvSvsaFXNw8R4zOizI0YEaN6xef5fD
 S64fynEojghytRSXTCw8G3iepahuO8Bus9mSsc+/UqUeXIbfIXbimagVTcY8JdIjNzjL0KXwGeD
 6TB8AaF+Xb0Sxkw5WA28nskRhltWqafnP2kpnoIjYJiJMpOpMDbZO4OvGZgVbNNbnBBAw/dwyPZ
 JcSmayacuWtiYyeqmjw==
X-Proofpoint-GUID: _DSVEYb2NPQqgQeNeaIEpZqr7uPf5CVY
X-Authority-Analysis: v=2.4 cv=X5Bi7mTe c=1 sm=1 tr=0 ts=6a01b639 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TmBss_aizDygq35vy4EA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: _DSVEYb2NPQqgQeNeaIEpZqr7uPf5CVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110121
X-Rspamd-Queue-Id: 4E07150C714
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-36526-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Mon, 11 May 2026 12:55:36 +0530, Krishna Chaitanya Chundru wrote:
> PCIe WAKE# interrupt is needed for bringing back PCIe device state from
> D3cold to D0.
> 
> This is pending from long time, there was two attempts done previously to
> add WAKE# support[1], [2]. Those series tried to add support for legacy
> interrupts along with WAKE#. Legacy interrupts are already available in
> the latest kernel and we can ignore them. For the wake IRQ the series is
> trying to use interrupts property define in the device tree.
> 
> [...]

Applied, thanks!

[1/2] gpio: Add fwnode_gpiod_get() helper
      https://git.kernel.org/brgl/c/8a46bd2638f1ad6d1ed73dc3ab10919e67274738

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

