Return-Path: <linux-gpio+bounces-34089-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMlhC26twmkyggQAu9opvQ
	(envelope-from <linux-gpio+bounces-34089-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 16:27:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E9E318020
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 16:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 60D9730B54E8
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 15:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32204035CA;
	Tue, 24 Mar 2026 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WPYgVs1v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208573FE661
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 15:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364841; cv=none; b=WmnyfgSX9tlNHbYS8yKGuzmrIebRcuAV93WX/zUvIfFqpQ88kPHLujJebtjk7HUMQ7hC1IQG3VKJ4A6HXSWoUUOxO9FcvoAuOAdhSNL/aXcNhKjlKNiUeGzdtJN59z3934DglCiB/LMsoZFY9kouWuOxelzMG6gWaPnFPndN0dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364841; c=relaxed/simple;
	bh=Q04xTA47YRKeBfrjPIYFQ1qHCYl+rBBRZENWaoTJKQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aU6aWtge5m8Ylmhccn4ec28e+o8+3LEAr2sWrz/9Fgk1MUdJxQq8C7P8g4drQrxO8GaBdQdcY7B0zB3o7tmY6EVoYum6OoGtniayn45ZdrORtDiIzC09RbtoLyLVRZMfKmof2c195ORKRQhyob//0qc10tdeB9JLSE+hHxGkd54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WPYgVs1v; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b41b545d9so1410838f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774364838; x=1774969638; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P5ZdFYh1bLXmKv/xLtFTZBUW421AXSY/+eTav2poOSM=;
        b=WPYgVs1vvlJxrW66Dv7qlUt66UywnTrZCBQSndwjltVBxvl5tShGCI9OFgTwCSH3gt
         X2IsrfLQ4aT6Lg2Y671cSJQnKKIy/h2OYhtJrqxj+j+z+wDJvbWBxiUU+JgkkbkcVpVs
         XtcfaMSIEjogdtVFD+BSwIqo+4ykm61hctBuqKWOosihwRd0A0TYbyx7tRs7UUx8iA+m
         B/abbvqNiGcpJvWFHqbLXoM5S6oDEpF6ATVu1u4rQXDvj7yJUcuwIcVw/mbElTQ5RPLJ
         N+sW9jy+BLtVrNDmLQPa3PoCJfZxE+Qzy4ecoEEo/QK6RoisU3fsbslcyuaET9UKMwGl
         7AJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774364838; x=1774969638;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5ZdFYh1bLXmKv/xLtFTZBUW421AXSY/+eTav2poOSM=;
        b=eHtI5YfkT5hUnPcuBQuOTApfVEYqkK5PQG+QCxheP/tPEow7fMJlB7FHci5N7eBWOI
         /vvkVKdySFUDrwhwNrNHX+cFatXXXe1KxfvGDoR5yKejJQjkxV458J/4IgVeU3o60Xb/
         UMxu73FQM2sJBVbTVWECaKwYKsnmlS730cWdU43FBShrab1yvSXlp/qQWv0eHSBgRB0e
         /61AH6WT62gudgW2TPRYbO8fqA+dWT19HtRm99pVepmf72mGzkBdQVyA1J271roVJQnQ
         7eVzb7zNfp6NEuuHbfe+cIdIvvXUVJjFIA3o6AfBbOTTJtbjClDVJXaeHzUW3vckqIex
         p50g==
X-Forwarded-Encrypted: i=1; AJvYcCX9f80JwdS3fVmX5bBl5Ko7pWV2Kew21B0yq/qZVYW9zhUpLdNQ8Ty/GTBhF9DdePmR2vdg5HcInBVp@vger.kernel.org
X-Gm-Message-State: AOJu0YzCaV3eQGjkYfViHkbiyM18/1K4xYWhW/UOaFUOHduFbgl/C7UA
	zuz5QjtZGHs9oSneIWGXSct1D2fso64xqoA3raUkrCXokaVqXh6X9+AITGcX/BFaGHY=
X-Gm-Gg: ATEYQzxRnEZWVtM/rbdeSUZx4u24+hgr40avsQwQpIlUOCzoKIXpF0gZwgKBdxs/apm
	x3d79GQqeP2aj9NoMcmU3Oh+ifhYO0SC/DKjT0/9d+hUjskQy3duByjHYPsjBPr4tbZJ7huBbtL
	u+ql/AQG6qbbonRAIrQDn5MOaPk9otvqVMNh9L6pfFwvhU4FMHz16yuQm7RyXkKmy1ktBto95ej
	RORz0bfISOqanmhOriBLal8BNCBsyzlq0Pavhgparwhg1msvEgy6jaNY6uQYuFY1iSj7t3G9h66
	P8vpO7l+pcYYlAwI/o9Kc46aCNAhDZJwlrxvM1Gre10PCSxLyJOIFLaH9B5hsD8goChWLiv09ue
	wOfT5Edw10HT0bVrR0/1J7trapxcPXPjRH8A2Uxtsqv7243Bcyc906skyCJ46oLqfSUeVPIZJnD
	pQs/ucGX9hkTu2cX526EhanjKlWAR9
X-Received: by 2002:a5d:64c6:0:b0:439:b4dc:1e1e with SMTP id ffacd0b85a97d-43b6426493fmr24948925f8f.29.1774364838270;
        Tue, 24 Mar 2026 08:07:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm39839147f8f.17.2026.03.24.08.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:07:17 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:07:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Tom Rini <trini@konsulko.com>, AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
	Marek Vasut <marex@denx.de>, Greg Malysa <malysagreg@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Yao Zi <me@ziyao.cc>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Anis Chali <chalianis1@gmail.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Utsav Agarwal <utsav.agarwal@analog.com>, Ye Li <ye.li@nxp.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>, u-boot@lists.denx.de,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org, linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH v2 3/4] scmi: pinctrl: add pinctrl driver for SCMI
Message-ID: <acKooSHo_FB45nYH@stanley.mountain>
References: <cover.1773256350.git.dan.carpenter@linaro.org>
 <1048331f5d3c8e0cdbe1542bcb65bbf942a4275b.1773256350.git.dan.carpenter@linaro.org>
 <CAD++jLmfRVGGHH1EqMAeSVHVCr1-s2JPyuY_w=2h35_mKUXj2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmfRVGGHH1EqMAeSVHVCr1-s2JPyuY_w=2h35_mKUXj2Q@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34089-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[konsulko.com,gmail.com,nxp.com,denx.de,amarulasolutions.com,ziyao.cc,analog.com,timesys.com,bp.renesas.com,foss.st.com,renesas.com,lists.denx.de,intel.com,oss.qualcomm.com,vger.kernel.org,linaro.org,arm.com,amd.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,0.0.0.19:email,stanley.mountain:mid]
X-Rspamd-Queue-Id: 10E9E318020
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 02:19:34PM +0100, Linus Walleij wrote:
> On Wed, Mar 11, 2026 at 8:41 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> >         scmi_pinctrl: protocol@19 {
> >                 reg = <0x19>;
> >                 pinmux1: pinmux_test {
> >                         pinmux = <0 1 0xFFFFFFFF 18 1
> >                                   0 2 0xFFFFFFFF 18 1
> >                                   0 3 0xFFFFFFFF 18 1>;
> >                         function = "f_gpio1";
> >                         groups = "grp_1", "grp_3";
> >                 };
> >         };
> >
> > Under linux the pinctrl subsystem will parse the function and group
> > properties and use that to handle muxing.  However, under u-boot the
> > pin muxing is done using the "pinmux" property, which feeds raw SCMI
> > pinctrl PINCTRL_SETTINGS_CONFIGURE commands to the server.  The
> > numbers are: selector, identifier, function_id, config_type, and
> > config_value.  In the example above, it sets pins 1, 2, and 3 to 1.
> > The linux-kernel ignores this pinmux property.
> 
> This whole thing is a bit of a hack and shortcut to make hard things
> simple isn't it?

I'm not disagreeing with you at all, but handling the default pinmux
property is the only mandatory part of a pin controller driver in
u-boot.

regards,
dan carpenter


