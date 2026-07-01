Return-Path: <linux-gpio+bounces-39272-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eN5ZBGHBRGpx0QoAu9opvQ
	(envelope-from <linux-gpio+bounces-39272-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:27:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 615856EAA0B
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:27:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a6N2XewA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CeCHna4G;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39272-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39272-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B43453017BDF
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 07:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEA63BADA7;
	Wed,  1 Jul 2026 07:27:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4D93B42EB
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:27:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890837; cv=none; b=dtusJOltHh6gfzvdSuc7J0mQLGr2o4Rj8q7DTkhuEbKUDw+yW2l4HR41cV4iyc4Hslxl5wcnZhfbIub/3H8PFOH76ON3B/AlQ49wAIsR2yp4VVR5Squ8yzGvmyOEFye6HoXWKOYbKh7qGvoUVlbzOqaNCdFl5fuq2uomsfukGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890837; c=relaxed/simple;
	bh=4GE2h3uQWPFIKUiRHjbrTKswNYR20y7g5wbcKu6OEx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SjqiWi2EBxhXLgV0AvqlWT/uoErFi/qjx/NK0y1onT01emxkh6Z4neaIQKv2bxfho8q06rNw2mkPloMpwSRAmRMt5MdEWcpfsPhLdt9TJ1Ie0w7TfR70bTeYyR7uRRWXZXhYGSkTNYWxGjltmDuaRRB9NZdxG6IZ7zwFlCmY3SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6N2XewA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeCHna4G; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6616qUKY279960
	for <linux-gpio@vger.kernel.org>; Wed, 1 Jul 2026 07:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UjPiDRtkBxxHS008iG49oRhf0qpCD3AfI/FuawlGAtQ=; b=a6N2XewAv+horXnK
	nKkWBvQxpygYro9ayToWkB+R+7sHu+pSIFsh6CKOXOc+upk4XoQcHznfXwVh+2m8
	9UfxKuwo+PCvR3+N/+QowoQW8W6a8KHRalmB02z2+C4CNqnSR6JLYmHyb12wwsyV
	QDYySU/vWiSn8ZLRyKlpjinT8fpduIsElGhR8p5zyqf9QXo/4gVsb1zu38hcl8Fs
	QKDPDtCs8oknupQhU9oAy2ZVjmczQ72QkxGsLUn92OP2eTGzSFDpl17p0bPf6bmw
	1VplRXkA/PWjCHP4Al3Jc0ByNqnU1h0Ii7YW7pAzra/x5BSkc2HjbRU2tn4Yjs0B
	qK/V5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tg643-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 07:27:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f6ff639aso72013385a.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 00:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782890833; x=1783495633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjPiDRtkBxxHS008iG49oRhf0qpCD3AfI/FuawlGAtQ=;
        b=CeCHna4GxVQmdgmdJYS+uCf4Ff00LhWCVt21M37ICVYtIyUGKfIRHmGVtUrx7oB7Xn
         1lMYK0J9z/o5mZWg5QKDXHWwX8tB2fpD/az8omwxuPo7eCf/rv3/O3kzmWg2KA+o+TrK
         D6oG5FAp0AQdBja49Z5gI+MjA3e0UVU8IBmwHOBsh/QPBj5icE+OqiLQJO/fzpJTijlW
         ysGnX1hmp7LxCJ5Wv67xs8XTEri4uBw1cQ+UOWf5ILFu8rA8/RXt6bHpPH/qlfWS1Nxi
         mobSzt7uGyhpD+cb0c500tTcyp19dVl1yPr6XH+SLAdnYRMaTOnqdZzCMO0y9MdI/QCf
         Kbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782890833; x=1783495633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjPiDRtkBxxHS008iG49oRhf0qpCD3AfI/FuawlGAtQ=;
        b=Xvzi2QMir7JI9bOSXwgpmxyY1wHaKJu+Y5G4GEXarxJkIYl3H2q7Qx0N1R7MvrzCVJ
         AmsUZIZQlDOd+3+Ra7+4hwao68TVXqdrGmJl+WI4gwPmq0Dzg6LS2YscqS8P/Y/N8hR/
         eOHIXmtfpnv4eoDDmRDp8f1JCerXpx2aDfmwVi+01OTr27qSSiHPf/g9QjxEN1II5h9z
         ayyvyCbFhlyqd60D2cnK9VCCg982yzHtIP6ZOTv0z9KeP1mnT8INwmk8YyUS6J2aNN1K
         8dSt65WIfdOgtpUAcZIormKVnXNjhohOdQusAcfiUxvZAISKW8tQy2NRrQF4IPkR3MjM
         uI/g==
X-Forwarded-Encrypted: i=1; AFNElJ8cjaodsSmBsrFcwRQENUXqHKDPq4ERmmP7zaB661mDtgNVADMbknI8gyMtpNLG8AHhSyD2bYV0BhGV@vger.kernel.org
X-Gm-Message-State: AOJu0YwERdaCGLYgi4/piAYwR6AyyWpMGdL2C3iGcglViFPjaaJogXXt
	uFgWJduiDXWZ1AdyOLZr3eqpNINAD/lBE2SlJnl98wpeIIm7rc7JR/bMwsdvUkllnn6zMFeqAbC
	3iWY6tketOH+sLMf5UXYyvKoKWJU/QnT1K6RsG8DHzu1HyayF7g77FxpUwjoPOubc
X-Gm-Gg: AfdE7cm5C7kMjlyWl6/oqfPt8EIVUpxWZ8aR5WJi9bVZCEHz0vvpomENV5nQfU20pJf
	s1Nhx34XIiLuUfHsS5OlBauW7cfAb4LEpK/o+J5pOivUXlMHrvNdB638fiZYwmO3OuR7fZ7I8Bc
	qfHDvvh20KnvEjuFVuxn3nqwd++UVht23AkF0EPkSi6CHmhYUWQFaUUmBWhLTOWjzr6GyCVK+Uf
	mLRTWM70FbKqnkD5lWYu8M528N1sBu8thymyhu7NZZKnlwazstg0d6Pgum56Xlc08x3BEfsTp6R
	+I3oQy+zEAJePFsaO2IW32qGfYxgwPyKuEvvuHzlIfCR71qLeO0i4kSW5EqWGAIqmvehhI0r07r
	UhOl2rJG16FlSHTUNsSivSs8O48iEx51/KgEGFxA=
X-Received: by 2002:a05:620a:1a19:b0:926:e8e6:3c34 with SMTP id af79cd13be357-92e78217161mr66559785a.21.1782890833319;
        Wed, 01 Jul 2026 00:27:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1a19:b0:926:e8e6:3c34 with SMTP id af79cd13be357-92e78217161mr66556385a.21.1782890832668;
        Wed, 01 Jul 2026 00:27:12 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4718:fd49:e3d7:676a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47566c0deacsm15559815f8f.26.2026.07.01.00.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:27:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Viacheslav Bocharov <v@baodeep.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore meson non-sleeping
Date: Wed,  1 Jul 2026 09:27:09 +0200
Message-ID: <178289081780.4972.9992474509894050572.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260625115718.1678991-1-v@baodeep.com>
References: <20260625115718.1678991-1-v@baodeep.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kbJEyFo6OQ8l0wjbzdknBQgMsuM475uY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NSBTYWx0ZWRfX59/DyHr/Tp9J
 f52FPUgVejM1SRFdkjkjeUMmKIfrUmspSZm79IPdzhQNO0VF+OlAxqNtb6ltbcTQVJqdsGDYOWg
 DKmKU6UVLkOBxQPPVM3z9qUPstVHu+Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NSBTYWx0ZWRfX5YaiWxs38NbT
 3zIF//mki0qx/QBGCguI72xPs2lghP2Tw+ySTIhRflC0TFw5+S2IW9Pnd4hqDdsKCPyGmRQdeZ1
 0VvfBQCgKrGs6WkAnjtQ1ne53mb5K4xR4YyGZhPZjUgDJeSNOhOA4mLxqiiaFAewaUOfUZ/nzad
 U4CGw13b7kkpKoSbPZP2KgI6v6P3zESce8ycS9wNHVBr6VgRoudnj/wLJnFNn9AoY5/TIAlqENC
 KFL+86jgaTurfcsOFLYu9XpZXAjLpiBbosiCteKeyu3HxMq2nhmg7vODz5/aBJ/zUF+IUPufkea
 qZymQfRF4OBPm9niVR0Fr0Y1Hppg/pKzkj8Z3lQWcfMhctcTvsCTXCT+XGmjNpDmGoRd20i+z/0
 KnTQCDIQ8yYs4EVz/vCrGJJGomyP2MlT3RkUXTCXYNjqqwa5Y7LKjg523oq68DpRYOMR++VXdWS
 zwRvg8RzAs8okD0rtKA==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a44c151 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1LRHIn5sqR3nmJZzQNMA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: kbJEyFo6OQ8l0wjbzdknBQgMsuM475uY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-39272-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:v@baodeep.com,m:bartosz.golaszewski@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:diederik@cknow-tech.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linaro.org,baylibre.com,googlemail.com,samsung.com,arm.com,cknow-tech.com,vger.kernel.org,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 615856EAA0B


On Thu, 25 Jun 2026 14:57:16 +0300, Viacheslav Bocharov wrote:
> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
> the underlying chip's can_sleep, but under that lock it calls config and
> direction ops that reach sleeping pinctrl paths. On a controller with
> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
> runs from atomic context:
> 
>   BUG: sleeping function called from invalid context
>     ... pinctrl_gpio_set_config <- gpiochip_generic_config
>     <- gpio_shared_proxy_set_config (voting spinlock held)
>     <- ... <- mmc_pwrseq_simple_probe
> 
> [...]

Applied, thanks!

[2/2] pinctrl: meson: restore non-sleeping GPIO access
      https://git.kernel.org/brgl/c/9777530157e7b82fd994327ff878c4245dadc931

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

