Return-Path: <linux-gpio+bounces-37496-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMCYAS9bFWp7UgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37496-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:34:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A832D5D281D
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89C46300F5C0
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 08:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9A23CEBA7;
	Tue, 26 May 2026 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="plk1s8L8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKE7EAaH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57183CE4B9
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784476; cv=none; b=Fpx5tQ1o+i8LCUSpHJnVJU9GAuuT9Je7Yt4/jpi0tyFCayCry57IfsIVFcM3ireKa5g3nUfojD/fgyS333ypyp+d8AOJ1SEVa9WSRXiIfrm4IMhmPTsPPWpOxAZHI0o1HJGgGVl77ZBnbEUEx4u65+qWFTI1CgJ7h58mbXVyDCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784476; c=relaxed/simple;
	bh=8IlCA1uegdWbOyGjbLY03xW1bntW1C8VUVNVYXUnLyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K6jo3XgjOqd70tsAzQwx6PoZIOhVMTSkzGP+p87uUquDETjxvg4xePQ56lev8FhOm407eay2zXkwdNfs3LagnwvEV2S67OcE/m1A2ACxKrqKC56hmjptkRRwWPm7bp0Num7Df09OqijSHz9o9cG2iiytjkuJmAQ950RVwrNnYwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=plk1s8L8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKE7EAaH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2i6wL4117909
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WqpzdJMGA/8/ZcOiI0e+kV/+L0OOLHUDx0AXR+uWI6w=; b=plk1s8L8OsFt1pJa
	LwG5v9ON6Fte00KmPyWhg8o5vfVC/vn+76bLPCADQ4QqhyNCZppV5k2QmPwMb56m
	ObggzLWypSKRNjdzmwSk3pt1ZpNRl3LvQ/gFQtGXxLjjLeAUIyn6mSTS0YBu3/ft
	IU5/XTmBQI+piEQZzyVxUwW0aloOWJuS4zHfHP6bBJeK5mgs0nKSoQxBEW1QuUff
	XbdPQ8OuWup3/Y+AHrxUZ6QCKsO6v7zoycXN09CA4tAEmgv05ARwnmbj/WLP9Yq/
	L/IELSAD/UDpkjdcGbQyncxGcdnsjp6oMsPRTRmXXslN9zRI/oQR5nrBSrK/B72z
	/KoxWw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecquday7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:34:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514a182b90dso131663081cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 01:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779784473; x=1780389273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqpzdJMGA/8/ZcOiI0e+kV/+L0OOLHUDx0AXR+uWI6w=;
        b=XKE7EAaH9cXlk7QBogbQewH2dYH5TchaZAm/+uJfmmxrmXxRvo9jyJKb4GM8z0LuyI
         FFKHvAnkai3Pq5dWiFmsFdMUSUSuYDwKwVnVrCD/F5bzVYn3v0jXb+fM4SmNUQBO67MS
         s1gAUgNl01ZfCebRp9sCXQPUOvLGWDRo5gIgNYlrspOU/g8sTjaDdtayTNE/4I8/fPip
         nkAKwQeOWGKyOy8iI3ILbEZdIGlnXraWFnpfVJphMGO8YTIbdD2PQd36orUY3XxadJ5p
         r1wCrtBU54CG8XFrL9opA9BUnDDSeKlgTHGDP27lr0dbpwbRwLQd+2EGKmO4Rc3TbXnx
         Ny6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779784473; x=1780389273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WqpzdJMGA/8/ZcOiI0e+kV/+L0OOLHUDx0AXR+uWI6w=;
        b=oHFIctYMgzzVTfaqH5CaY039pqdCCJ6gghdN26A9TZI6PbIa3y7LfKQRGgo8Ye/Zws
         rheQOAnzKYlWjOslEnWQg0s7K1/Cfrdz9ZEIWE8L4gp2XRdSW/WO++N3NU1vY+YmnImR
         9sUVzsh1GgygHywqgRjtXz4MUx1Kidph8UOVgcXg75Pd60eTAsj4G13WoGR7Y052TmtX
         U5uOfiIhkxKuJ0sZDl9GsB99eO8AVYKyAU5R+m2SqCGTo6W/HgvL3In8U27DaL/4zJwo
         QYayA3+1x7Hynyoiajc4p8+Be9ePwKmKcCfOtKSQeRopk3MQy63OXLdVKXLEfbnPs7Vs
         CFLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EoivzmfxWP5JvaW5UBR3W7PGS405ANyGFd+OjsrVrENNc+35VyFRmznzwYoJMeAJWEN2i0n73pNg0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9KADkR99hMzAq66XxCxuQjjCNNhS4f7hLwYIHyJYNx8SGI/ue
	TEKIISKCCZ37/lQ+abu6AtU6tLH0DvbgGme7+V8FyM7LjsZfkVA+E92cvHuaNt3hbtMqXGXAHQU
	hRQX0x19x6uYlunAry/l+kvOrPrsMm2kCz6oKKCMzH0XBsKEGNbukuZuQaGYy0QFc
X-Gm-Gg: Acq92OENd79BxOX5ToYdwHP9KlmaqHAGsPOhz+Jg6sCluOYAkL+OA4B29Jm9Mqdyalg
	r8Bdhhg1sUtbc0tJmGpYSFRG/d/KADJiaETcUA4QUW+xNMfIalqJQZNNnbqzp7UiRh00zqse+oA
	QhnDKIKVwPvGUMOVNRKgug8rkPuXmF/JX3WnaYF23OIppq7blYmdOuaVpU6nc1SFhsviUuH0Yq0
	iMaw9jSLeqy09W4W2xs1hV1RbGWa/nlObr1UWDPnnqd9/RqeREi/A1chc3VDK1NP65pCWyflWO/
	FLxPmMhm1ueKy3R7yIWIx0XO8b55J2j1ShQHLxZzp1UzsN6xoIgAB5p6gYCD94rZNavuzSBBrht
	M32swCsLa4Z3UevVHnm3mqUK2NMQlUNUGAjpY79rhRn4wkZuzfw==
X-Received: by 2002:a05:622a:2296:b0:516:deda:3ddf with SMTP id d75a77b69052e-516deda47ccmr204214551cf.49.1779784473468;
        Tue, 26 May 2026 01:34:33 -0700 (PDT)
X-Received: by 2002:a05:622a:2296:b0:516:deda:3ddf with SMTP id d75a77b69052e-516deda47ccmr204214271cf.49.1779784473029;
        Tue, 26 May 2026 01:34:33 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:77fb:9b68:d26a:48e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49048c6acf8sm92904325e9.10.2026.05.26.01.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:34:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        David Lechner <dlechner@baylibre.com>
Subject: Re: [PATCH] gpio: adnp: fix flow control regression caused by scoped_guard()
Date: Tue, 26 May 2026 10:34:21 +0200
Message-ID: <177978444194.19212.15426026071166774852.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260522073527.9812-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260522073527.9812-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: f3oBSTaep7L54qehMKYGUtr8xe2D9Gse
X-Proofpoint-GUID: f3oBSTaep7L54qehMKYGUtr8xe2D9Gse
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3MyBTYWx0ZWRfX/SqjJ97fpcYE
 x5XqxT5txn14pAvHjBPDaMgHlkSZCLr/XZ2L/3Xlr+uO0m5sUKmCUxYcSbZzkXHWtAIedohXXAe
 P/Bnu41Sld3x/pCjyajvc8YmYq0i8Gk3ooX2eOZrQKedWwXum5rM7G/DUAZrz7fLQk4g2ih16Vu
 INWdhQYN7pU1E2kJGH1YSaQABHLTfbIKAsWtNgrdCbheX0QWBhqR6thbqQ/E+i0uD+/Wv7Okz2+
 mgzfcAbTXEB348Zn3fu3nn/xN4X9Dl8nOPNSf2teYXQYlfoHJG61DaR7+IWx4KkEMibWxIND3bU
 rlMwmZ8RLAFN6zcKr3ZbKd0rkc/LtnUtr9PFKkycrvgJNjOu35+mhV5+QaYzsEKsevwy6UCyOL/
 IE0/io/rylc96q32jy0t3YH2xf8NhfZsxSmsXDyWZXNzfC5T3ZRydL03IGUHhNCm02H27fyHLKQ
 ZaM0YfvT31idNm49F3g==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a155b1a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=JY3PJf2_bncAKlCCtqkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37496-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A832D5D281D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 22 May 2026 09:35:27 +0200, Bartosz Golaszewski wrote:
> scoped_guard() is implemented as a for loop. Using it to protect code
> using the continue statement changes the flow as we now only break out
> of the hidden loop inside scoped_guard(), not the original for loop. Use
> a regular code block instead.
> 
> 

Applied, thanks!

[1/1] gpio: adnp: fix flow control regression caused by scoped_guard()
      https://git.kernel.org/brgl/c/7df1b49aadadb0be1baec2a101b3ab3986e40e7f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

