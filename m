Return-Path: <linux-gpio+bounces-38826-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hm6MO/H5OWqXzgcAu9opvQ
	(envelope-from <linux-gpio+bounces-38826-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 05:13:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C756B3C4D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 05:13:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=HSBXm6Wr;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38826-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38826-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32E85302F712
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 03:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FEA938E8A5;
	Tue, 23 Jun 2026 03:13:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CD8374E7F;
	Tue, 23 Jun 2026 03:13:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782184395; cv=none; b=T8kEJjHokpkJWzWEHi97jb8gkFByAS0Omf7/AkJfh05zrZvS2UUVSUR1b4nceStW1sNW0AknleE/G0K/idHK61bY6R6wwe5Ic2p86/L+fiJF3Nu3mX8NSZZIDkUshRf/nl7sQPjphOwYRgwl5IEftpzMkwE4UXi5TIR+zphVh3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782184395; c=relaxed/simple;
	bh=SwNva69jy2afJIyfC0fIqgAntqNuL+DM/a3cYXevjM4=;
	h=From:To:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Oox69dgE3K0Kqu+3LKt+gxQmKhT57FU0fP9mHyTb51RT/JGqq/LH5wSIXtJA6L5ah/DU9G/Tyud4wBnDMPBiSMcIgG+GFPJbp1ltmBjxpk1cYxzAFhyUaA0vcoTNT1jZECjimfJDJzVLtbtDPzwiF3dh1nLT4eGog/pLmct6Z9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=HSBXm6Wr; arc=none smtp.client-ip=203.254.224.25
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260623031303epoutp02488f852023875c7b097a7427dfb11950~7l0ExemEP0684306843epoutp02R;
	Tue, 23 Jun 2026 03:13:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260623031303epoutp02488f852023875c7b097a7427dfb11950~7l0ExemEP0684306843epoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782184383;
	bh=xYWvnYzx61MOHShrICO4N9ZwFKzGqTfE6OdZqCfXxL4=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=HSBXm6WralSrItnUo41WTp4Q9bHEdBGeR/ktDAbhDUX4jHkktSgXl1qVmshH/Zbfz
	 HyFkrFLLFUikPIvVZvLN8hutNjgoW819TbAeR9N1Fg49C1AhVAoaidIA6WQL6TnjHz
	 ZebhsaMkFvMv6aZD8a/rzkNbslvDGFU7faVRYhzM=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260623031303epcas5p1fd11dbfc745aa99f18d960e686705fcd~7l0Ec3mqg0166901669epcas5p1o;
	Tue, 23 Jun 2026 03:13:03 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4gkqrb2vfDz6B9m9; Tue, 23 Jun
	2026 03:13:03 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260622114230epcas5p3e590b84087d9879e30d604f89ce938a8~7ZHlpxa2p3249132491epcas5p3i;
	Mon, 22 Jun 2026 11:42:30 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260622114216epsmtip1ccbcb97431d34878191527dbce3b94b6~7ZHYxKdLA2526625266epsmtip1D;
	Mon, 22 Jun 2026 11:42:16 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@oss.qualcomm.com>, "'Bjorn
 Andersson'" <andersson@kernel.org>, "'Konrad Dybcio'"
	<konradybcio@kernel.org>, "'Rob Herring'" <robh@kernel.org>, "'Krzysztof
 Kozlowski'" <krzk+dt@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	"'Peter Griffin'" <peter.griffin@linaro.org>, "'Michael	Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Brian
 Masney'" <bmasney@redhat.com>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Sam
 Protsenko'" <semen.protsenko@linaro.org>, "'Rob Clark'"
	<robin.clark@oss.qualcomm.com>, "'Dmitry Baryshkov'" <lumag@kernel.org>,
	"'Abhinav Kumar'" <abhinav.kumar@linux.dev>, "'Jessica Zhang'"
	<jesszhan0024@gmail.com>, "'Sean Paul'" <sean@poorly.run>, "'Marijn
	Suijten'" <marijn.suijten@somainline.org>, "'David	Airlie'"
 <airlied@gmail.com>, "'Simona Vetter'" <simona@ffwll.ch>, "'Maarten
	Lankhorst'" <maarten.lankhorst@linux.intel.com>, "'Maxime Ripard'"
 <mripard@kernel.org>, "'Thomas Zimmermann'" <tzimmermann@suse.de>, "'Inki
	Dae'" <inki.dae@samsung.com>, "'Seung-Woo Kim'" <sw0312.kim@samsung.com>,
	"'Kyungmin	Park'" <kyungmin.park@samsung.com>, "'Andi Shyti'"
	<andi.shyti@kernel.org>, "'Georgi	Djakov'" <djakov@kernel.org>, "'Lee
	Jones'" <lee@kernel.org>, "'Pavel Machek'" <pavel@kernel.org>, "'Hans
	Verkuil'" <hverkuil@kernel.org>, "'Mauro Carvalho	Chehab'"
 <mchehab@kernel.org>, "'Ulf Hansson'" <ulfh@kernel.org>, "'Peter Rosin'"
 <peda@lysator.liu.se>, "'Vinod Koul'" <vkoul@kernel.org>, "'Neil Armstrong'"
 <neil.armstrong@linaro.org>, "'Linus Walleij'" <linusw@kernel.org>, "'Geert
	Uytterhoeven'" <geert+renesas@glider.be>, "'Magnus Damm'"
 <magnus.damm@gmail.com>, "'Sebastian Reichel'" <sre@kernel.org>, "'Javier
	Martinez Canillas'" <javier@dowhile0.org>, "'Liam Girdwood'"
 <lgirdwood@gmail.com>, "'Mark Brown'" <broonie@kernel.org>, "'Greg
	Kroah-Hartman'" <gregkh@linuxfoundation.org>, "'Jiri	Slaby'"
 <jirislaby@kernel.org>, "'Srinivas Kandagatla'" <srini@kernel.org>,
	"'Bartlomiej Zolnierkiewicz'" <bzolnier@gmail.com>, "'Rafael J. Wysocki'"
	<rafael@kernel.org>, "'Daniel Lezcano'" <daniel.lezcano@kernel.org>, "'Zhang
 Rui'" <rui.zhang@intel.com>, "'Lukasz Luba'" <lukasz.luba@arm.com>,
	"'Jonathan Marek'" <jonathan@marek.ca>, "'Taniya Das'"
	<quic_tdas@quicinc.com>, "'Robert Marko'" <robimarko@gmail.com>, "'Christian
 Marangi'" <ansuelsmth@gmail.com>, "'Stephan	Gerhold'" <stephan@gerhold.net>,
	"'Adam Skladowski'" <a_skl39@protonmail.com>, "'Sireesh Kodali'"
	<sireeshkodali@protonmail.com>, "'Barnabas Czeman'"
	<barnabas.czeman@mainlining.org>, "'Imran Shaik'"
	<quic_imrashai@quicinc.com>, "'Sricharan Ramabadhran'"
	<quic_srichara@quicinc.com>, "'Anusha Rao'" <quic_anusha@quicinc.com>, "'Luo
 Jie'" <quic_luoj@quicinc.com>, "'Tomasz Figa'" <tomasz.figa@gmail.com>,
	"'Chanho Park'" <chanho61.park@samsung.com>, "'Sunyeal	Hong'"
	<sunyeal.hong@samsung.com>, "'Shin Son'" <shin.son@samsung.com>, "'Krishna
 Manikandan'" <quic_mkrishn@quicinc.com>, "'Jacek Anaszewski'"
	<jacek.anaszewski@gmail.com>, "'Jaehoon Chung'" <jh80.chung@samsung.com>,
	"'Marek	Szyprowski'" <m.szyprowski@samsung.com>, "'Alina Yu'"
	<alina_yu@richtek.com>, "'Andy	Gross'" <agross@kernel.org>,
	=?UTF-8?Q?'Niklas_S=C3=B6derlund'?= <niklas.soderlund@ragnatech.se>,
	"'Wesley Cheng'" <quic_wcheng@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<freedreno@lists.freedesktop.org>, <linux-i2c@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-leds@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<cpgs@samsung.com>
In-Reply-To: <20260622101606.485961-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: RE: [PATCH 1/2] dt-bindings: clock: Drop incorrect usage of double
 '::'
Date: Mon, 22 Jun 2026 17:12:14 +0530
Message-ID: <1050065615.01782184383398.JavaMail.epsvc@epcpadp2new>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIwXoGyyqYeRyJ4JjkgDeaw0zOZjgI6ZcaYtZHncYA=
Content-Language: en-us
X-CMS-MailID: 20260622114230epcas5p3e590b84087d9879e30d604f89ce938a8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260622101627epcas5p2aeb4aad096395936c04cb563eb226b83
References: <CGME20260622101627epcas5p2aeb4aad096395936c04cb563eb226b83@epcas5p2.samsung.com>
	<20260622101606.485961-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38826-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,baylibre.com,redhat.com,samsung.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,lysator.liu.se,glider.be,dowhile0.org,linuxfoundation.org,intel.com,arm.com,marek.ca,quicinc.com,gerhold.net,protonmail.com,mainlining.org,richtek.com,ragnatech.se,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:peter.griffin@linaro.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:s.nawrocki@samsung.com,m:cw00.choi@samsung.com,m:semen.protsenko@linaro.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:andi.shyti@kernel.org,m:djakov@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:ulfh@kernel.org,m:peda@lysator.liu.se,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linusw@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sre@kernel.org,m:javier@dowh
 ile0.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:srini@kernel.org,m:bzolnier@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:jonathan@marek.ca,m:quic_tdas@quicinc.com,m:robimarko@gmail.com,m:ansuelsmth@gmail.com,m:stephan@gerhold.net,m:a_skl39@protonmail.com,m:sireeshkodali@protonmail.com,m:barnabas.czeman@mainlining.org,m:quic_imrashai@quicinc.com,m:quic_srichara@quicinc.com,m:quic_anusha@quicinc.com,m:quic_luoj@quicinc.com,m:tomasz.figa@gmail.com,m:chanho61.park@samsung.com,m:sunyeal.hong@samsung.com,m:shin.son@samsung.com,m:quic_mkrishn@quicinc.com,m:jacek.anaszewski@gmail.com,m:jh80.chung@samsung.com,m:m.szyprowski@samsung.com,m:alina_yu@richtek.com,m:agross@kernel.org,m:niklas.soderlund@ragnatech.se,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsu
 ng-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-i2c@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-usb@vger.kernel.org,m:cpgs@samsung.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,baylibre.com:email,vger.kernel.org:from_smtp,samsung.com:dkim,samsung.com:email,samsung.com:from_mime,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,epcpadp2new:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	RCPT_COUNT_GT_50(0.00)[96];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50C756B3C4D



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Sent: Monday, June 22, 2026 3:46 PM
> To: Bjorn Andersson <andersson@kernel.org>; Konrad Dybcio
> <konradybcio@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> Peter Griffin <peter.griffin@linaro.org>; Alim Akhtar
> <alim.akhtar@samsung.com>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Brian
> Masney <bmasney@redhat.com>; Sylwester Nawrocki
[Snip]
>  Documentation/devicetree/bindings/clock/qcom,videocc.yaml   | 2 +-
>  .../devicetree/bindings/clock/samsung,exynos5260-clock.yaml | 6 +++---
>   .../devicetree/bindings/clock/samsung,exynos5410-clock.yaml | 2 +-
>   .../devicetree/bindings/clock/samsung,exynos5433-clock.yaml | 2 +-
>  .../devicetree/bindings/clock/samsung,exynos7-clock.yaml    | 2 +-
>  .../devicetree/bindings/clock/samsung,exynos850-clock.yaml  | 2 +-
>  .../bindings/clock/samsung,exynosautov9-clock.yaml          | 2 +-
>  .../bindings/clock/samsung,exynosautov920-clock.yaml        | 2 +-
>  .../devicetree/bindings/clock/samsung,s5pv210-clock.yaml    | 2 +-

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>





