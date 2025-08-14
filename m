Return-Path: <linux-gpio+bounces-24382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B64B261DD
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 12:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09EDF162257
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 10:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFF02F60D8;
	Thu, 14 Aug 2025 10:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fd8xE1P3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FXv5wkyK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A03279784;
	Thu, 14 Aug 2025 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755166007; cv=none; b=rvHRrjFykP0lbKmWkyMJprmbIKTzZh5Quzzr6vnATVVBMnIeKGvKellXEYED0q0OZxKik+I7Hsp82i0zJl3LVga4Ck1s2ScASIxEIg0BiJv7MFLUWIWOrsdVpYhL/yxjYT8YXZMjV8GDZUqI5ekpusTG13btRw4SorDisjUm5jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755166007; c=relaxed/simple;
	bh=pjA1Ka2oWY97YGnAX3DCceJhO8IsETdHhyuyUc5PTF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfZlLtOmPGE5P8LGouoSisr5/jgr3Gg/Y+d71VHMq3/FoMHNmJo3AL6WHbMRYfa1RzeudtOvWHDi9BvxlqO3DbbFMgaSI9Rs7GMl6Pc2fJBO9JHzZivupv/DwYV6kkXI3Zdv9GSPEls36H6ivdx39uTiavFDSSMUnAe1pPl+f60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fd8xE1P3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FXv5wkyK; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5A69114000B6;
	Thu, 14 Aug 2025 06:06:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 14 Aug 2025 06:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755166003;
	 x=1755252403; bh=JsAxzXgjzHRP9fzvgrE35OsqNZuMVG8ONOw7NsIFeyk=; b=
	fd8xE1P3L2QeBPxLJVYmAh6XY56rFGyLgqK4ZGRmSQa+BVoVmrmNjeYK1aqccqqa
	ORAbph4UjuUsxZPPxTI4gGTN0lV2SZuIxwOtTHIyiqC8k0oi1XPYrhiWmdYShn+B
	Yg0oc7XJLyc+vqU/TUd85+dH6B526jkgu2oUrZrar2dWUAUyKBKqTeFMXCElTCMy
	YwKC66QUe3scpODzKvUTJeAP1U6oHdR2tnbUfn0uNWjKRV2SpSHdPV6DGZ0IRAY0
	EWCsVFbwcQy1lhzaQGtUTe14gbHf1b1wC/T8Lac6brxetDVeiQvonliHrXLIEJVf
	3w2jWGo/OTn0krkHXNt9Ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755166003; x=
	1755252403; bh=JsAxzXgjzHRP9fzvgrE35OsqNZuMVG8ONOw7NsIFeyk=; b=F
	Xv5wkyKvuwerPh76xTFQOwCkunA4A/fSotTHZitILk5DcqaQU/IGq04s1YvhulKs
	aoNAQzjBxluEcjtKbHz9P9+ngZKysnCEa/o+AGY0XTReebCNhn2pLDpZV6Ec8Inu
	zuT6bDzIc0MD6v4B6cPBrWShzH6x5j4KCjJbnmQZQrnYdOASZVT2RaVHOxOHqbwn
	NljAQyP0f8CeunVDjU/ouOml3BrZlxb9mIH65oAxfzX+b2IZTW90RQzlNJdioycn
	hOaFDNUP//KYyyxxacpXcbAlfDGlLloB7Z3W+9zG9QW+6qaCzZEshMuckb30Zfqd
	KdlnYt8dVlRb8ATYuAhqg==
X-ME-Sender: <xms:MrWdaAw8v7w6a9jrt8-G4QUzVR-B97XJQsC8fnXbcne1Y3DwiKETow>
    <xme:MrWdaBYWhSW54znxsDHtiiMNIgXaCFZfan8f-e2con7bfMlXft2HqycPnP1RXOy3J
    KfKcmaNvqdOMtcY9E0>
X-ME-Received: <xmr:MrWdaBWFxv_D3jM-qSzisRwsMn1SHSXX62bJ6261ue5TDwoeyWW9s1Cq_gWj5DbGWIJm-UNSnwWCZQgJ8tAtUVvVAh5FbSXXWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpefftdegfeevfefguedtveevlefgleek
    uedvfeeggfefheefieejhedulefhjeekgfenucffohhmrghinhepkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgv
    shgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjse
    hlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghp
    thhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:MrWdaPjPrH5e4gJxe03MJ5cPW_mv5fds-zHtzjK8aW3S3OnTXsLI6g>
    <xmx:M7WdaPudfvLDf3Q7kCz01cldyWRvZcucNRwPpyB7Xu8mO7ag3hhkqg>
    <xmx:M7WdaI4gAJi-khNx2a_4mi-jjityqa5UWTQxPeVkzUNSzD9GkgHN9g>
    <xmx:M7WdaDPgIuC5meITyGRQttDrnex0HGtc1OR2H4KYGR7hthI1Kdth8A>
    <xmx:M7WdaOHkhz1-HcL7m-JlseELkGa7TSh-Wjtwr-TAAc1zFWqSlLf7G3j9>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Aug 2025 06:06:42 -0400 (EDT)
Date: Thu, 14 Aug 2025 12:06:40 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: rza1: Make mux_conf const in
 rza1_pin_mux_single()
Message-ID: <20250814100640.GA2197757@ragnatech.se>
References: <470389b1411074f0da2cef8c6c3531f16aba6589.1755164114.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <470389b1411074f0da2cef8c6c3531f16aba6589.1755164114.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2025-08-14 11:50:55 +0200, Geert Uytterhoeven wrote:
> The rza1_mux_conf object pointed to by the mux_conf parameter of
> rza1_pin_mux_single() is never modified.  Make it const.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I like improvements like this!

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> This has a small conflict with "[PATCH v4 09/15] pinctrl: constify
> pinmux_generic_get_function()"[1], which I have already acked.
> Perhaps the best solution is for Bartosz to include this in his series?
> Or I can resend an updated version for LinusW to apply after Bartosz
> series has handled?
> 
> Thanks!
> 
> [1] https://lore.kernel.org/all/20250812-pinctrl-gpio-pinfuncs-v4-9-bb3906c55e64@linaro.org/
> 
>  drivers/pinctrl/renesas/pinctrl-rza1.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
> index 23812116ef42682d..4613d2c8cccc1dab 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rza1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
> @@ -669,7 +669,7 @@ static inline int rza1_pin_get(struct rza1_port *port, unsigned int pin)
>   * @mux_conf: pin multiplexing descriptor
>   */
>  static int rza1_pin_mux_single(struct rza1_pinctrl *rza1_pctl,
> -			       struct rza1_mux_conf *mux_conf)
> +			       const struct rza1_mux_conf *mux_conf)
>  {
>  	struct rza1_port *port = &rza1_pctl->ports[mux_conf->port];
>  	unsigned int pin = mux_conf->pin;
> @@ -1119,7 +1119,7 @@ static int rza1_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
>  			   unsigned int group)
>  {
>  	struct rza1_pinctrl *rza1_pctl = pinctrl_dev_get_drvdata(pctldev);
> -	struct rza1_mux_conf *mux_confs;
> +	const struct rza1_mux_conf *mux_confs;
>  	struct function_desc *func;
>  	struct group_desc *grp;
>  	int i;
> @@ -1132,7 +1132,7 @@ static int rza1_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
>  	if (!func)
>  		return -EINVAL;
>  
> -	mux_confs = (struct rza1_mux_conf *)func->data;
> +	mux_confs = (const struct rza1_mux_conf *)func->data;
>  	for (i = 0; i < grp->grp.npins; ++i) {
>  		int ret;
>  
> -- 
> 2.43.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

