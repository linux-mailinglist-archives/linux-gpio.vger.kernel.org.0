Return-Path: <linux-gpio+bounces-31113-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPGeDAWCeGkzqgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31113-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:14:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D084A918DF
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60591301572C
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E6533372D;
	Tue, 27 Jan 2026 09:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7To+Ioj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zx53euiU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54B733290B
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504970; cv=none; b=eVvhRID8pc1rgp9WY/Ymoyi0fBTGkIHJU7/Uz3i6fsUoyRZkpNJf8bd3/27i0RFlovDgSLiqWFPjW/EaqVwe2t0tO2YyryH9aeH9ni1Sz4tkDda0RlVsY3L+UCy9sVUmvdQi+huiH3cPq6qjgiXZhnIbELPV/ylJcZMsITOaGU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504970; c=relaxed/simple;
	bh=fngx/NCf+/N+HScEHfbKqwGhEzf/fUg4MNQWFqsEczE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YWsLCfUlvDmSKzzvWVhV3LlUj5+mbSkp96K8Sma0DrS2DaB8nO/qs4vn0zcPaOEt6qCL1WkyNG1i07a6HbkdzjcKPMsDN8iatj/bhzBT/HW/D7q3okbnBlU80ngpW/dzgrQfkzRsJscu1De2d9+IaDoC5gS7dLnJoHA+uWxrAEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7To+Ioj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zx53euiU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7RsPC112448
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vvlvwl1QyFdXJth2eYeA5TIEczP4LPciKUZRTZ+rabE=; b=T7To+IojkhBG8ZEO
	HE6Qoqu0XRQsxt4ddkt51TOn+acN4BA44nEUEqpNUbFCc87saL2AofL3nRqLj8i1
	aQ3BmwQmlgIBzljkIa/CoHWIzFxuccXrGRpx+F7Dvr7F+jaLMbDg/J2eDOJaHnQ/
	iUSjECYtYgkTcXIdFMbU5V6rfQgDZVZGacNh99aPERt07liTUKVZMFNu11Yt4qOO
	srx+CkvrZD6t5L542M/t4zGVzbP6AoDpPMkuVzXKeZUhHy/WgGY3S7nkTZeGbkun
	AmZ/uoXLtmLbExIwQNxlNEm9ghMZ5q3HwcOaCjj1bhlprMi9z7ZOjUmGfO8GT1UQ
	/ChUvw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxs0e0d03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:09:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70d16d5a9so45331885a.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769504966; x=1770109766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vvlvwl1QyFdXJth2eYeA5TIEczP4LPciKUZRTZ+rabE=;
        b=Zx53euiUHvdDTpXi1Chm50fLYF5YfpHv+HyUZMU9qBr29WrFjCRVgeeKXWgPYh9RR3
         PT/+2I1IpU2wCoHG8bW2ku7af1HO1B6nbwB6P6SnmPIjhuukhCgV8k1HHAH18oMpaWS/
         clsht0b07Bp7fi8spnoDbSiXJH8P5loJGKZkUj4bnB4x+KZ+/AjwEscqL2ig0xozjHTN
         QoZ0LdXyGYZDXPr22hIp+9svMp4koE4JDcMC2dMQtOKgCPtjhXsAlq0Ya0eNRRX/oXVb
         mAf6kVl3eRnoTWxwF/UCYZBon9Ipnoem/2ytg5C/sOcw9H4jEXGWqgKjagLZHp7aYZWG
         n9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769504966; x=1770109766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vvlvwl1QyFdXJth2eYeA5TIEczP4LPciKUZRTZ+rabE=;
        b=U63dCAltqIEHkGHYByTx0M5jkMu64W+3HhhD1dymOaUDt62LrwMUvDH0lMWtVfl4Qw
         d5vEVeAPUzvWY2izGJnov279spi9lJMgLJFMuFz1FPH0GpR8qTXuKdhfm2ZUxfe1oEtv
         JYBR6VojGy1tMDEZOMempYZ2AkbvN0us/bI+9+O6zMRIf+Q9zON2mFYrP+E4NS2P/KmE
         t2eSq9jkJfyV9lC4crEfSwxSidA3tKu0giC4PPlp/qYo1OqHxiBr/ZufXKbDc56cp938
         HWWmftLVlEdj2ud0+4qMWtCMPLv4pJe2L9EQ60Icru+zMpKlGiR5ptvqLq/2G2gDwf3Q
         7evA==
X-Forwarded-Encrypted: i=1; AJvYcCVzwe1KsYYkxQ2Ibes0sYUlGI9fWQK+n/YErp3SyL8iOP6opUqWrgrAAfwTwKCGo5bn5jnm1a7Wmh8k@vger.kernel.org
X-Gm-Message-State: AOJu0YzqYJCFEFI8tJRtDHqugqkjJ6zm5Lk0iIm9Sdh+hgdMrIxUqA75
	D4UQa6heppBJwPwFdlo41lbBaYY7jMHnhY9dt3jJwJOoCdgGGuzRTLaz3EGlAWMZUXpZcc36V7D
	xodU7ubca73y8bsVbs3XHSvOFrraPRgbW5avMTaTfkZDcYTX7ozVJANvgn8INyL8C
X-Gm-Gg: AZuq6aJITIV7gl+RD6jJNxbLlL+gGxtKwulC+ACPpIZTYwSiNLjQZ0wMirihoqK9UgO
	RHiaMmOimNK2zVcIipE4GN//hjM4XfeMZu4xQvNTxCFCAXwD2snhUqucolWrJ8+DXYiQ+MqpD/v
	tRHF+Th+AfTvJW+4YfHR+000PbJdMZxA1a9zuRUuyxOZhZp7W20ZODUdge9kXNZaROQbH2Xajyw
	YLSUR4/mIoCQpkQPBizZu5UqClLXi5cqMmcAGdcoumAtHaYZK9rNZJEM//UZ6zxW50Tuvyh1ptg
	fGM2jT7Hdlh4lLhSJuHqUNsNOASRf4Q3RZpr1/g0lH9YIw9P3Bz/rPW2MSdKemySfo+xWd1tDoq
	9NiyrRFFva2lDU2tSXEppLz2hLSnt8pmH4DAYUg==
X-Received: by 2002:a05:620a:46a9:b0:8b2:e827:14bc with SMTP id af79cd13be357-8c70b8e5f77mr100446685a.56.1769504966122;
        Tue, 27 Jan 2026 01:09:26 -0800 (PST)
X-Received: by 2002:a05:620a:46a9:b0:8b2:e827:14bc with SMTP id af79cd13be357-8c70b8e5f77mr100444185a.56.1769504965631;
        Tue, 27 Jan 2026 01:09:25 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:262e:d32a:e347:8b74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804db7b434sm128163345e9.4.2026.01.27.01.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:09:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, broonie@kernel.org,
        will@kernel.org, grygorii.strashko@ti.com, ssantosh@kernel.org,
        khilman@kernel.org, linusw@kernel.org, brgl@kernel.org,
        Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: omap: do not register driver in probe()
Date: Tue, 27 Jan 2026 10:09:16 +0100
Message-ID: <176950495232.13307.15142034347404555496.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123133614.72586-1-dakr@kernel.org>
References: <20260123133614.72586-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3NCBTYWx0ZWRfX1ywMwMg91v4c
 UGOdlA8ScsDRB8kU+4DOLGS0rP62Uxt1eA1M01/pbaOVUYzngWlUBgUCtpr40Bfy7sqL6LftDRk
 IJynYe0y0JcP2M3Qs6OcjjxWQwRQCsddNf7Rgzp6XEF8P+34gYzw+zh0a0CNAqD1b0fylNSh1Tr
 XlujDZBn9KuSBKHgLLFGA9s2hO7Iascn/YdGfZe5kr+cNjZKqtcbmL0SiZ43FtEx18TSz12ePO4
 cfDZb7xtATslRRydoVFjRRyPZ4mylP7phYt+G6eDsSRALJjRUemk9TkZNDFuqD2lMKz9N/cj4WA
 hWlY0DcP7iOQJJS8857rXtvgqhgGyfM5g0iA04QLYjaiDlztDwWdVQLlSFyLGnq92EtiM2c8cyC
 ZbCp40SFoqPYIsMXasV9w/gfXkjUCXFupSAWsaepSTFWDcDiq2/Dm9VEF478E6FmmjxoGogbJUX
 lftGPpWSqvD2VEFYKLg==
X-Proofpoint-ORIG-GUID: ppSXSP30hqs22LCUyjIC6NwDukk-e70X
X-Authority-Analysis: v=2.4 cv=Hvh72kTS c=1 sm=1 tr=0 ts=697880c7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=StneJEbOKPblmvvYeVQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ppSXSP30hqs22LCUyjIC6NwDukk-e70X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270074
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
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-31113-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: D084A918DF
X-Rspamd-Action: no action


On Fri, 23 Jan 2026 14:31:56 +0100, Danilo Krummrich wrote:
> Commit 11a78b794496 ("ARM: OMAP: MPUIO wake updates") registers the
> omap_mpuio_driver from omap_mpuio_init(), which is called from
> omap_gpio_probe().
> 
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
> 
> [...]

Applied, thanks!

[1/1] gpio: omap: do not register driver in probe()
      commit: 3cb53b083fa665ec14c52962f50b9c1df48cf87b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

