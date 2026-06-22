Return-Path: <linux-gpio+bounces-38825-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kal8C9X5OWp9zgcAu9opvQ
	(envelope-from <linux-gpio+bounces-38825-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 05:13:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E35B46B3C02
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 05:13:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=dNfxF4M3;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38825-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38825-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55150300E161
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 03:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0016538D687;
	Tue, 23 Jun 2026 03:13:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD6938D3E6;
	Tue, 23 Jun 2026 03:13:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782184395; cv=none; b=ppPjLOsdfmP+Vk8us8Ganw6O0FuP1awjXyoMFfCwul+HGdcLFqHZAI7dQLCG3yTmMGA8dOLnNOOiHbGN4QRT8lq2OD9mBqLRSjhXQ4O5mZ8+ApuhjiC/h15eLG9mWa6BfFCubIpc2lzXnTpMJCae8Qk+HO6lGdEFR/M0OzBwXuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782184395; c=relaxed/simple;
	bh=tatdd/Q7QE0upqPJVjWgLFwHUzQQq+izQdPrwXLkDtk=;
	h=From:To:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Z9oS3eMmT4mzR5aLybFEz4wVeD2LPT9udgVHrMxRAp1o0WywAZezKeIe44q45ucCrX8Ta3KZpUTKpcM02trQmcTCKdhEeKdqYEdEZK84gvaIP6xD8CKl494dUQmTaMpREfnXgPF1oodc+IT7In9YbohfvNrwz+evUEe6Mu0/sUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dNfxF4M3; arc=none smtp.client-ip=203.254.224.34
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260623031304epoutp04b58205b658a8fc7f7458a882a18eaba2~7l0FFYfm41880418804epoutp04a;
	Tue, 23 Jun 2026 03:13:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260623031304epoutp04b58205b658a8fc7f7458a882a18eaba2~7l0FFYfm41880418804epoutp04a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782184384;
	bh=tatdd/Q7QE0upqPJVjWgLFwHUzQQq+izQdPrwXLkDtk=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=dNfxF4M3fyZDfW3CRh3lyZWqMNYsOP4XtAdUT1p5ZJqUeSRRx63y6bFC8gBFnYGJ/
	 2PA9S3WitCXE5BiEd84kDRmhjRFpItBmgmC2TWVubBHDJLlGmnyl63bz1zTjkIX2Mn
	 UkknWAWYwpil1XaCsoKvzcmVN65+WOpAu9nWyWc0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260623031303epcas5p378f6b175e3e88956e96fb88e6537bcf9~7l0EthhRN0685906859epcas5p39;
	Tue, 23 Jun 2026 03:13:03 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4gkqrb4vT0z2SSKX; Tue, 23 Jun
	2026 03:13:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260622114525epcas5p2654a56b123110dea3b2fb97739d9a92b~7ZKI1GCT00255802558epcas5p2L;
	Mon, 22 Jun 2026 11:45:25 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260622114503epsmtip205edc6f0281b21bca275e7401267a8a1~7ZJ05N0KR2405124051epsmtip2Y;
	Mon, 22 Jun 2026 11:45:03 +0000 (GMT)
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
In-Reply-To: <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
Subject: RE: [PATCH 2/2] dt-bindings: Drop incorrect usage of double '::'
Date: Mon, 22 Jun 2026 17:15:00 +0530
Message-ID: <373928166.21782184383679.JavaMail.epsvc@epcpadp2new>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI6ZcaYiR7zkv7wowZwd71jplyCqgLGmQzlAevIaT+1ahn2EA==
Content-Language: en-us
X-CMS-MailID: 20260622114525epcas5p2654a56b123110dea3b2fb97739d9a92b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260622101634epcas5p1137f33cd1e53341e3d7600eb105cd859
References: <20260622101606.485961-3-krzysztof.kozlowski@oss.qualcomm.com>
	<CGME20260622101634epcas5p1137f33cd1e53341e3d7600eb105cd859@epcas5p1.samsung.com>
	<20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38825-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,baylibre.com,redhat.com,samsung.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,lysator.liu.se,glider.be,dowhile0.org,linuxfoundation.org,intel.com,arm.com,marek.ca,quicinc.com,gerhold.net,protonmail.com,mainlining.org,richtek.com,ragnatech.se,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:peter.griffin@linaro.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:s.nawrocki@samsung.com,m:cw00.choi@samsung.com,m:semen.protsenko@linaro.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:andi.shyti@kernel.org,m:djakov@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:ulfh@kernel.org,m:peda@lysator.liu.se,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linusw@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sre@kernel.org,m:javier@dowh
 ile0.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:srini@kernel.org,m:bzolnier@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:jonathan@marek.ca,m:quic_tdas@quicinc.com,m:robimarko@gmail.com,m:ansuelsmth@gmail.com,m:stephan@gerhold.net,m:a_skl39@protonmail.com,m:sireeshkodali@protonmail.com,m:barnabas.czeman@mainlining.org,m:quic_imrashai@quicinc.com,m:quic_srichara@quicinc.com,m:quic_anusha@quicinc.com,m:quic_luoj@quicinc.com,m:tomasz.figa@gmail.com,m:chanho61.park@samsung.com,m:sunyeal.hong@samsung.com,m:shin.son@samsung.com,m:quic_mkrishn@quicinc.com,m:jacek.anaszewski@gmail.com,m:jh80.chung@samsung.com,m:m.szyprowski@samsung.com,m:alina_yu@richtek.com,m:agross@kernel.org,m:niklas.soderlund@ragnatech.se,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsu
 ng-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-i2c@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-usb@vger.kernel.org,m:cpgs@samsung.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,vger.kernel.org:from_smtp,qualcomm.com:email,fireeye.com:url,samsung.com:dkim,samsung.com:email,samsung.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	RCPT_COUNT_GT_50(0.00)[96];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E35B46B3C02



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
> soc@vger.kernel.org; linux-serial@vger.kernel.org; linux-
> sound@vger.kernel.org; linux-usb@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Subject: [PATCH 2/2] dt-bindings: Drop incorrect usage of double '::'
>=20
> There is no use of double colon '::' in YAML. OTOH, the literal style blo=
ck, e.g.
> using '|' treats all characters as content [1] therefore single use of ':=
' in
> descriptions is perfectly fine, whenever '|' is used.
>=20
> Cleanup existing code, so the confusing style won't be re-used in new
> contributions.
>=20
> Link: https://protect2.fireeye.com/v1/url?k=3D20b000b4-490b6806-20b18bfb-
> 905a08a8515a-b42887ea7482314e&q=3D1&e=3D9fffcc8f-6266-432d-a638-
> 208efe86c9d7&u=3Dhttps%3A%2F%2Fyaml.org%2Fspec%2F1.2.2%2F%23literal-
> style [1]
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
>=20
For Samsung IPs related
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>




