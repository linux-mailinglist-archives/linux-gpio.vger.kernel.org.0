Return-Path: <linux-gpio+bounces-34086-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMswNPeRwmkXfAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34086-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 14:30:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3609D3096D6
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 14:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 350D1316BE81
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 13:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9A53F8815;
	Tue, 24 Mar 2026 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBwkojXH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CB13F7E8F
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 13:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358387; cv=none; b=NpLdRIDec5VclGboJbQprmgMwENOgzne7S6o23u7x3V+4Gx23Sn4lM3zDWhRm48LhBwa/VClkwQNghJhZHAByFGP9NtwrxxsvZ+52aAtG8FdjWMtFfn4ebv8IX8QdhQ7zB2QMBTwiwnW25SC9pfVFIMHz0zcldxd9pFepVlASLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358387; c=relaxed/simple;
	bh=sUwWBN+L5vBt9MtcOkpmh1ZOM7hZjiguyxrPzePsaKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nP81nBz/eUBPoa5MhziPC55zhL4Yq3D3sEL46AZhwKneDqfar9P+hHu7pB36+96/bK0ZyX53agol0+EiEQgBheUw9jm1CFwha2q9TFP/cLRCXzBgWla7Iij1Xojx28snIYXoaX2mw43Mrv0KdIdC2S2AoOeO+0uYltytfV4FTLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBwkojXH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94DEFC19424
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 13:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774358386;
	bh=sUwWBN+L5vBt9MtcOkpmh1ZOM7hZjiguyxrPzePsaKY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZBwkojXHCEuqyjJnqLbKWotstbK7ZjE2NNZDrmMjagJCAmEJxNPpWr5dnWC2XRb3K
	 6SZ17Qi8wlHH8f1SXfgOg0v77Fz72v/Ztj/3BIccauCldcySJ5fenExVF2mYDMGS1d
	 Beq78vhQTVkEPoYOKV0s1OywqSBalDb88eu956IDIfwykmmLVZPc/fDSEFiD3lwjsE
	 b0wQ075w2rBHV5KKbwAJrPiXp7D1ZnPaJ71oFxmi7t0iFBbVcV4ljGd0ZC9djVhyyk
	 EDZiJ8xyX+nLza+86ZRtpBDgj1mYIhvXwVq6lkyshWuGjmwxPxM06m1dSoISJkr3Td
	 XP26s9Dwqa1Kg==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64d5a7926cfso1327562d50.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 06:19:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXlZFpI8HxTa58gz+ndtRWQZwgPRGYdCMEKPPX9r7ZjIqOcrAUXvJ2soVO3CuFj4DtqJ1SkvbLYD056@vger.kernel.org
X-Gm-Message-State: AOJu0YxXB1ql84SXrx9GLtDhgDAPiyRGvp+phEX9bAWYOlJcyiwQVzQ6
	TpqGWKJiqvszhcOumJS8I3Y6oAifZUB1DmgJ7sYoYAeT/hUdYtAKattcLIZyNmq1Oxa4RzO9QOb
	2H4GbSShcOEF3erUlkdJePhdKQNmT79A=
X-Received: by 2002:a05:690e:1a52:b0:64e:c68:8ee1 with SMTP id
 956f58d0204a3-64eaa69ebe6mr11550490d50.8.1774358385617; Tue, 24 Mar 2026
 06:19:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773256350.git.dan.carpenter@linaro.org> <1048331f5d3c8e0cdbe1542bcb65bbf942a4275b.1773256350.git.dan.carpenter@linaro.org>
In-Reply-To: <1048331f5d3c8e0cdbe1542bcb65bbf942a4275b.1773256350.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Mar 2026 14:19:34 +0100
X-Gmail-Original-Message-ID: <CAD++jLmfRVGGHH1EqMAeSVHVCr1-s2JPyuY_w=2h35_mKUXj2Q@mail.gmail.com>
X-Gm-Features: AQROBzD_rVrAsbDukAvkngaYGMUewIR7TXu0vqz0CaG8_h0ydLheVygvbWR3rso
Message-ID: <CAD++jLmfRVGGHH1EqMAeSVHVCr1-s2JPyuY_w=2h35_mKUXj2Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] scmi: pinctrl: add pinctrl driver for SCMI
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tom Rini <trini@konsulko.com>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>, Marek Vasut <marex@denx.de>, 
	Greg Malysa <malysagreg@gmail.com>, Michael Trimarchi <michael@amarulasolutions.com>, 
	Yao Zi <me@ziyao.cc>, Arturs Artamonovs <arturs.artamonovs@analog.com>, 
	Anis Chali <chalianis1@gmail.com>, 
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>, Paul Barker <paul.barker.ct@bp.renesas.com>, 
	Utsav Agarwal <utsav.agarwal@analog.com>, Ye Li <ye.li@nxp.com>, 
	Valentin Caron <valentin.caron@foss.st.com>, Vinh Nguyen <vinh.nguyen.xz@renesas.com>, 
	u-boot@lists.denx.de, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, arm-scmi@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, 
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, Michal Simek <michal.simek@amd.com>, 
	Cristian Marussi <cristian.marussi@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34086-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[konsulko.com,gmail.com,nxp.com,denx.de,amarulasolutions.com,ziyao.cc,analog.com,timesys.com,bp.renesas.com,foss.st.com,renesas.com,lists.denx.de,intel.com,oss.qualcomm.com,vger.kernel.org,linaro.org,arm.com,amd.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:email,0.0.0.19:email]
X-Rspamd-Queue-Id: 3609D3096D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 8:41=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

>         scmi_pinctrl: protocol@19 {
>                 reg =3D <0x19>;
>                 pinmux1: pinmux_test {
>                         pinmux =3D <0 1 0xFFFFFFFF 18 1
>                                   0 2 0xFFFFFFFF 18 1
>                                   0 3 0xFFFFFFFF 18 1>;
>                         function =3D "f_gpio1";
>                         groups =3D "grp_1", "grp_3";
>                 };
>         };
>
> Under linux the pinctrl subsystem will parse the function and group
> properties and use that to handle muxing.  However, under u-boot the
> pin muxing is done using the "pinmux" property, which feeds raw SCMI
> pinctrl PINCTRL_SETTINGS_CONFIGURE commands to the server.  The
> numbers are: selector, identifier, function_id, config_type, and
> config_value.  In the example above, it sets pins 1, 2, and 3 to 1.
> The linux-kernel ignores this pinmux property.

This whole thing is a bit of a hack and shortcut to make hard things
simple isn't it?

The information encoded in the pinmux property is identical to what
is found in the function+groups property and that is why Linux does
not use it.

Also device trees looking like this will not pass validation or be
accepted into Linux, as it is not part of the official bindings, nor
will it be, so it creates a necessity to maintain forked device trees.

If U-Boot want to do things this way, I understand it: it does make
the pinctrl default set-up simpler, especially it makes the code
smaller and easier to write, which is something bootloaders like.

I really can't endorse it though: with deviant device trees and
information stored in paralllel in two places we create a
maintenance hurdle.

Yours,
Linus Walleij

