Return-Path: <linux-gpio+bounces-39219-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wxdxJnbBQ2r4ggoAu9opvQ
	(envelope-from <linux-gpio+bounces-39219-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:15:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 332286E4B61
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:15:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NCBNwFz6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39219-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39219-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF5A0306CFF7
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A95419312;
	Tue, 30 Jun 2026 13:14:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B975411687;
	Tue, 30 Jun 2026 13:14:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825258; cv=none; b=dsL3ngaMDrwp6+D/bpHNRdFFtFoGw57oy02kQVGDt8v9Kbb8kc9BISAWjaDiAnmPhOXCpAhbRS2asUfuAOjfWIKoK1tINu32SBjH6VglyAYhW9n6ZfK1ZPfD41+IZ2P/qOZhmxkLbj2lqlJQiPXKRGJqUhpbqs8bmEKcqDyTSGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825258; c=relaxed/simple;
	bh=8Me9j4Yvrzs+qI7l3WnoIUpPeb6lett/KoGVKKDdR/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZiTwSUE0n4gvUSAgqCCgspmirvkOxhMCcvAAE8DWQWovY1Z3wcsTUwZGFzlhJ6lnTWjDf3LxhCCoxYPKNow7timJnRkkqQ+Dns+DM7jLqsbW4vfHIlsZsRicaLwekI7XdCm8Ju/l8BiznE40dcbIdA3FiCmgFdt8BHN4EvhuGgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NCBNwFz6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C833C1F00A3D;
	Tue, 30 Jun 2026 13:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782825257;
	bh=EpQlFhGR0CXES6vDl7EpLBL9hnoH9HcaRhfoMbB9B10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NCBNwFz6c2fKdVb19gwyDiO9PnlyXriYS81lNIf/qzXncSC47QfhPwHZOFO8CLSJY
	 pR+5wIDr90lzxdE8glY97eAUFPM+0txQC5S3r4SSz1Gfz8MG9zJMDBh131aUMh/uAg
	 SMmLQvKLH4T+FL5HJyt+/yv7n4sp+6zL8jfhRP8J6IP+1H2Gh7bjV/lg+zW/AEHkal
	 ocCX2GPXkjOZFqcVQZdjb/dnZFXvwNKt/CW1SeQEYizmUZzjgW1/TlZ87anAQ71iZt
	 sidRDyuNNArshmfU1BX5VtNY36BLF6+Brm3ifl4o7/Du2ep5qRsN4Wzqm4ZNXWtNNB
	 iZbewdUkrcr0g==
Date: Tue, 30 Jun 2026 08:14:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sireesh Kodali <sireeshkodali@protonmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	freedreno@lists.freedesktop.org, Linus Walleij <linusw@kernel.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	linux-phy@lists.infradead.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Bjorn Andersson <andersson@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Brian Masney <bmasney@redhat.com>, linux-serial@vger.kernel.org,
	linux-mmc@vger.kernel.org, Sean Paul <sean@poorly.run>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	linux-i2c@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Andy Gross <agross@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Shin Son <shin.son@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robert Marko <robimarko@gmail.com>, linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Barnabas Czeman <barnabas.czeman@mainlining.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Anusha Rao <quic_anusha@quicinc.com>, linux-sound@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-pm@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Stephan Gerhold <stephan@gerhold.net>, linux-clk@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Pavel Machek <pavel@kernel.org>, David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sunyeal Hong <sunyeal.hong@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-usb@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Alina Yu <alina_yu@richtek.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Adam Skladowski <a_skl39@protonmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Jonathan Marek <jonathan@marek.ca>,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
	linux-media@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
	Chanho Park <chanho61.park@samsung.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: Drop incorrect usage of double '::'
Message-ID: <178282525553.2727643.3907229896177636220.robh@kernel.org>
References: <20260623054842.21831-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260623054842.21831-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260623054842.21831-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[protonmail.com,kernel.org,oss.qualcomm.com,quicinc.com,samsung.com,baylibre.com,lists.freedesktop.org,linaro.org,vger.kernel.org,gmail.com,lists.infradead.org,collabora.com,ragnatech.se,redhat.com,poorly.run,ffwll.ch,intel.com,linux.intel.com,arm.com,mainlining.org,linuxfoundation.org,somainline.org,gerhold.net,glider.be,suse.de,richtek.com,linux.dev,microchip.com,dowhile0.org,marek.ca];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39219-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:sireeshkodali@protonmail.com,m:sboyd@kernel.org,m:robin.clark@oss.qualcomm.com,m:quic_wcheng@quicinc.com,m:vkoul@kernel.org,m:sw0312.kim@samsung.com,m:mturquette@baylibre.com,m:freedreno@lists.freedesktop.org,m:linusw@kernel.org,m:semen.protsenko@linaro.org,m:rafael@kernel.org,m:alim.akhtar@samsung.com,m:linux-gpio@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:quic_tdas@quicinc.com,m:lgirdwood@gmail.com,m:quic_imrashai@quicinc.com,m:linux-phy@lists.infradead.org,m:ansuelsmth@gmail.com,m:sebastian.reichel@collabora.com,m:quic_luoj@quicinc.com,m:niklas.soderlund@ragnatech.se,m:andersson@kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dri-devel@lists.freedesktop.org,m:magnus.damm@gmail.com,m:conor+dt@kernel.org,m:bmasney@redhat.com,m:linux-serial@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:sean@poorly.run,m:kyungmin.park@samsung.com,m:quic_mk
 rishn@quicinc.com,m:linux-i2c@vger.kernel.org,m:konradybcio@kernel.org,m:s.nawrocki@samsung.com,m:bzolnier@gmail.com,m:hverkuil@kernel.org,m:krzk+dt@kernel.org,m:cw00.choi@samsung.com,m:quic_srichara@quicinc.com,m:agross@kernel.org,m:simona@ffwll.ch,m:jh80.chung@samsung.com,m:mchehab@kernel.org,m:rui.zhang@intel.com,m:maarten.lankhorst@linux.intel.com,m:jesszhan0024@gmail.com,m:tomasz.figa@gmail.com,m:shin.son@samsung.com,m:m.szyprowski@samsung.com,m:robimarko@gmail.com,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:lukasz.luba@arm.com,m:srini@kernel.org,m:djakov@kernel.org,m:barnabas.czeman@mainlining.org,m:gregkh@linuxfoundation.org,m:quic_anusha@quicinc.com,m:linux-sound@vger.kernel.org,m:neil.armstrong@linaro.org,m:linux-pm@vger.kernel.org,m:jirislaby@kernel.org,m:marijn.suijten@somainline.org,m:stephan@gerhold.net,m:linux-clk@vger.kernel.org,m:broonie@kernel.org,m:mripard@kernel.org,m:pavel@kernel.org,m:airlied@gmail.com,m:geert+renesas@glider.be,m:sunyeal.hong@samsung.com,m:p
 eter.griffin@linaro.org,m:sre@kernel.org,m:andi.shyti@kernel.org,m:lumag@kernel.org,m:linux-usb@vger.kernel.org,m:tzimmermann@suse.de,m:jacek.anaszewski@gmail.com,m:daniel.lezcano@kernel.org,m:alina_yu@richtek.com,m:abhinav.kumar@linux.dev,m:a_skl39@protonmail.com,m:conor.dooley@microchip.com,m:javier@dowhile0.org,m:jonathan@marek.ca,m:linux-renesas-soc@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:inki.dae@samsung.com,m:linux-media@vger.kernel.org,m:ulfh@kernel.org,m:chanho61.park@samsung.com,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[97];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,microchip.com:email,glider.be:email,yaml.org:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,samsung.com:email,collabora.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 332286E4B61


On Tue, 23 Jun 2026 07:48:44 +0200, Krzysztof Kozlowski wrote:
> There is no use of double colon '::' in YAML. OTOH, the literal style
> block, e.g. using '|' treats all characters as content [1] therefore
> single use of ':' in descriptions is perfectly fine, whenever '|' is
> used.
> 
> Cleanup existing code, so the confusing style won't be re-used in new
> contributions.
> 
> Link: https://yaml.org/spec/1.2.2/#literal-style [1]
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Alim Akhtar <alim.akhtar@samsung.com>
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Intention for this patch is to go via Rob's tree.
> 
> Changes in v2:
> 1. Add tags (partial Reviews as Acks, as that's the meaning of Ack)
> 2. Do not replace ::= in mux.
> ---
>  .../devicetree/bindings/arm/qcom-soc.yaml     |  4 ++--
>  .../devicetree/bindings/arm/qcom.yaml         |  4 ++--
>  .../bindings/arm/samsung/samsung-soc.yaml     |  4 ++--
>  .../display/msm/dsi-controller-main.yaml      | 20 +++++++++----------
>  .../display/samsung/samsung,fimd.yaml         |  4 ++--
>  .../bindings/i2c/samsung,s3c2410-i2c.yaml     |  2 +-
>  .../interconnect/qcom,msm8998-bwmon.yaml      |  2 +-
>  .../interconnect/samsung,exynos-bus.yaml      | 14 ++++++-------
>  .../bindings/leds/qcom,pm8058-led.yaml        |  4 ++--
>  .../bindings/leds/skyworks,aat1290.yaml       |  6 +++---
>  .../bindings/media/cec/cec-gpio.yaml          |  2 +-
>  .../bindings/mmc/samsung,exynos-dw-mshc.yaml  |  2 +-
>  .../bindings/phy/samsung,mipi-video-phy.yaml  |  4 ++--
>  .../bindings/phy/samsung,usb2-phy.yaml        |  2 +-
>  .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 +-
>  .../bindings/pinctrl/samsung,pinctrl.yaml     |  2 +-
>  .../bindings/power/renesas,rcar-sysc.yaml     |  2 +-
>  .../bindings/power/reset/restart-handler.yaml |  8 ++++----
>  .../bindings/regulator/maxim,max77802.yaml    |  4 ++--
>  .../bindings/regulator/richtek,rtq2208.yaml   |  2 +-
>  .../bindings/serial/qcom,msm-uartdm.yaml      |  2 +-
>  .../devicetree/bindings/slimbus/slimbus.yaml  |  4 ++--
>  .../bindings/soc/qcom/qcom,apr-services.yaml  |  2 +-
>  .../bindings/soc/qcom/qcom,rpmh-rsc.yaml      |  8 ++++----
>  .../bindings/soc/qcom/qcom,wcnss.yaml         |  2 +-
>  .../bindings/soc/renesas/renesas-soc.yaml     |  4 ++--
>  .../bindings/sound/qcom,q6asm-dais.yaml       |  2 +-
>  .../thermal/samsung,exynos-thermal.yaml       |  4 ++--
>  .../devicetree/bindings/usb/qcom,dwc3.yaml    | 12 +++++------
>  .../bindings/usb/qcom,snps-dwc3.yaml          | 12 +++++------
>  30 files changed, 73 insertions(+), 73 deletions(-)
> 

Applied, thanks!


