Return-Path: <linux-gpio+bounces-39975-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iFO0Hr/SVGprfQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39975-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:57:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A3F74AA02
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:57:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lysator.liu.se header.s=2026 header.b=eP0SQK4N;
	dkim=pass header.d=lysator.liu.se header.s=2026 header.b=eP0SQK4N;
	dkim=pass header.d=lysator.liu.se header.s=2026 header.b=tBP9qD8X;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39975-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39975-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lysator.liu.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52E1830342AC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 11:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5793F3F58EA;
	Mon, 13 Jul 2026 11:57:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.lysator.liu.se (mail.lysator.liu.se [130.236.254.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EA83EB7E5;
	Mon, 13 Jul 2026 11:57:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943855; cv=none; b=CQxzqnA0NqP24I8VhGS+zg9VHnnUFnqe5vvfYtN5QCQ2j5eAKCPW+ZD9+PXQPG59uvdJei527ZBr70vcz3KiS7ItGLhGURZ2z8LnzFR+ZILMhw3XvP6dOJ1KqRdT53YHhm87r4W7mV2j3KuHNEviuBzz2GaPRNy7GKqt52O03oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943855; c=relaxed/simple;
	bh=ZU9f5XQcfOha9tsafysQKKY+BbVKCPTIcqlTdjCJdHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=S2xHn+O7AySIgt7Wd13DqhtuZrjBWIr4NAmnotJYWx0Ioa+3rW/oduaDdEu2Pg58ogwS8dH+YMiW55PZsDcJtUJGJq334uNmvCWZkQ1dJKxOO1gd9jeKAIkorPpQxj9I33LdsZfiggrJQL31udIEGl4e62zn1gbNgsmmXg+l+8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se; spf=pass smtp.mailfrom=lysator.liu.se; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=eP0SQK4N; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=eP0SQK4N; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=tBP9qD8X; arc=none smtp.client-ip=130.236.254.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1783943841;
	bh=ZU9f5XQcfOha9tsafysQKKY+BbVKCPTIcqlTdjCJdHc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=eP0SQK4NrY74ZX5zlx/KwwdYyE2G/8poMBqqsYoS9tPi1RKxIjtnrjPUoiCA+Q5iA
	 vFznL+nZ+wGAZrfHeEU4m4hA9UTu4pEx6ilGNnP+VnZ59gDhiWmGBIA261Ua29NkNs
	 tgEmKcKTX2hMe/bXGsqXOOwzi2IN0e6i+1nE7deJUbZmfhon0rwEtoTXkioudsbNPw
	 4qbCOy+5rK9Gpzmo6c7JXmf9ndxNv6o2xkPeOYviDTyIeXuDz5Cs1ioZHWWwBlnHHG
	 /w7C2LqUyxwgwXiI/kLetGmJh/AWvZsS7XKNvLKy7WFkn1P0OE/dG5n8kjFROxB7TJ
	 UYtZ16Ajcz0Xw==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id 5BD8145D0;
	Mon, 13 Jul 2026 13:57:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1783943841;
	bh=ZU9f5XQcfOha9tsafysQKKY+BbVKCPTIcqlTdjCJdHc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=eP0SQK4NrY74ZX5zlx/KwwdYyE2G/8poMBqqsYoS9tPi1RKxIjtnrjPUoiCA+Q5iA
	 vFznL+nZ+wGAZrfHeEU4m4hA9UTu4pEx6ilGNnP+VnZ59gDhiWmGBIA261Ua29NkNs
	 tgEmKcKTX2hMe/bXGsqXOOwzi2IN0e6i+1nE7deJUbZmfhon0rwEtoTXkioudsbNPw
	 4qbCOy+5rK9Gpzmo6c7JXmf9ndxNv6o2xkPeOYviDTyIeXuDz5Cs1ioZHWWwBlnHHG
	 /w7C2LqUyxwgwXiI/kLetGmJh/AWvZsS7XKNvLKy7WFkn1P0OE/dG5n8kjFROxB7TJ
	 UYtZ16Ajcz0Xw==
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
	id 3EC074698; Mon, 13 Jul 2026 13:57:21 +0200 (CEST)
X-Spam-Level: 
X-Spam-Score: -1.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1783943829;
	bh=ZU9f5XQcfOha9tsafysQKKY+BbVKCPTIcqlTdjCJdHc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=tBP9qD8X/xsXZ7egKwzKFvcjlUpLAIm1KgxB8b2b/QLhFDWGuOsaaNyA9AaX0h4EP
	 UT2xTKBrUdwJ/uHPjdWfTqK0UgegGwGKDuLWoa8qiMNmxxKHEMA9HhBig1pp5ohAjX
	 ZI/fDbfZ/PXP7cP49ifkTiFpUxlBKg38sdJlmDSBipXM++nfWkFQRfFkeqkLQyc7bx
	 m+f1FvpSIm0o1JV9aJcwLQX8dUa/Xdwqevi/LKyHPDmfPXQ0CFyn7k19/mxEZu9W/X
	 A9NB0oaVGN8c5fFzWE1e2YV54kMlbioLeCyOmyKxNO/NUCXCFkQTvjQuhFWkI4UuLv
	 L4FRdHuEGTiAw==
Received: from [192.168.2.172] (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id B019F45B4;
	Mon, 13 Jul 2026 13:57:02 +0200 (CEST)
Message-ID: <744e6181-ad21-4632-b293-5bf6c1e9fc2e@lysator.liu.se>
Date: Mon, 13 Jul 2026 13:57:01 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: Drop incorrect usage of double '::'
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Andi Shyti
 <andi.shyti@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linusw@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Sebastian Reichel <sre@kernel.org>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Jonathan Marek <jonathan@marek.ca>,
 Taniya Das <quic_tdas@quicinc.com>, Robert Marko <robimarko@gmail.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Stephan Gerhold <stephan@gerhold.net>,
 Adam Skladowski <a_skl39@protonmail.com>,
 Sireesh Kodali <sireeshkodali@protonmail.com>,
 Barnabas Czeman <barnabas.czeman@mainlining.org>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 Anusha Rao <quic_anusha@quicinc.com>, Luo Jie <quic_luoj@quicinc.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanho Park
 <chanho61.park@samsung.com>, Sunyeal Hong <sunyeal.hong@samsung.com>,
 Shin Son <shin.son@samsung.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Alina Yu
 <alina_yu@richtek.com>, Andy Gross <agross@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260622101606.485961-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US, sv-SE
From: Peter Rosin <peda@lysator.liu.se>
In-Reply-To: <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lysator.liu.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lysator.liu.se:s=2026];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39975-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:s.nawrocki@samsung.com,m:cw00.choi@samsung.com,m:semen.protsenko@linaro.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:andi.shyti@kernel.org,m:djakov@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:ulfh@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linusw@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sre@kernel.org,m:javier@
 dowhile0.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:srini@kernel.org,m:bzolnier@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:jonathan@marek.ca,m:quic_tdas@quicinc.com,m:robimarko@gmail.com,m:ansuelsmth@gmail.com,m:stephan@gerhold.net,m:a_skl39@protonmail.com,m:sireeshkodali@protonmail.com,m:barnabas.czeman@mainlining.org,m:quic_imrashai@quicinc.com,m:quic_srichara@quicinc.com,m:quic_anusha@quicinc.com,m:quic_luoj@quicinc.com,m:tomasz.figa@gmail.com,m:chanho61.park@samsung.com,m:sunyeal.hong@samsung.com,m:shin.son@samsung.com,m:quic_mkrishn@quicinc.com,m:jacek.anaszewski@gmail.com,m:jh80.chung@samsung.com,m:m.szyprowski@samsung.com,m:alina_yu@richtek.com,m:agross@kernel.org,m:niklas.soderlund@ragnatech.se,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-s
 amsung-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-i2c@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-usb@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,samsung.com,baylibre.com,redhat.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,glider.be,dowhile0.org,linuxfoundation.org,intel.com,arm.com,marek.ca,quicinc.com,gerhold.net,protonmail.com,mainlining.org,richtek.com,ragnatech.se,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lysator.liu.se:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[peda@lysator.liu.se,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peda@lysator.liu.se,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[95];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,lysator.liu.se:from_mime,lysator.liu.se:dkim,lysator.liu.se:mid,yaml.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1A3F74AA02

On 2026-06-22 12:16, Krzysztof Kozlowski wrote:
> There is no use of double colon '::' in YAML. OTOH, the literal style
> block, e.g. using '|' treats all characters as content [1] therefore
> single use of ':' in descriptions is perfectly fine, whenever '|' is
> used.
> 
> Cleanup existing code, so the confusing style won't be re-used in new
> contributions.
> 
> Link: https://yaml.org/spec/1.2.2/#literal-style [1]
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Intention for this patch is to go via Rob's tree.
> ---



> diff --git a/Documentation/devicetree/bindings/mux/mux-consumer.yaml b/Documentation/devicetree/bindings/mux/mux-consumer.yaml
> index 9e2d78a78e40..769243a2bf04 100644
> --- a/Documentation/devicetree/bindings/mux/mux-consumer.yaml
> +++ b/Documentation/devicetree/bindings/mux/mux-consumer.yaml
> @@ -13,8 +13,8 @@ description: |
>     Mux controller consumers should specify a list of mux controllers that they
>     want to use with a property containing a 'mux-ctrl-list':
>   
> -    mux-ctrl-list ::= <single-mux-ctrl> [mux-ctrl-list]
> -    single-mux-ctrl ::= <mux-ctrl-phandle> [mux-ctrl-specifier]
> +    mux-ctrl-list := <single-mux-ctrl> [mux-ctrl-list]
> +    single-mux-ctrl := <mux-ctrl-phandle> [mux-ctrl-specifier]
>       mux-ctrl-phandle : phandle to mux controller node
>       mux-ctrl-specifier : array of #mux-control-cells specifying the
>                            given mux controller (controller specific)
This change does not match the others? I do not think ::= is some kind
of malformed YAML that has crept into a literal block. Instead, I think
it is syntax inspired from BNF or something such. IIRC, it was once
adapted from
Documentation/devicetree/bindings/pwm/pwm.txt

Or, I am missing something...

Cheers,
Peter

