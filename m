Return-Path: <linux-gpio+bounces-32227-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DoMLP0ooGlIfwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32227-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 12:05:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 516E01A4CB7
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 12:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37ADA306A650
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D55336EE9;
	Thu, 26 Feb 2026 11:04:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAEB314B6B
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772103885; cv=none; b=gEN6sevKTGDD6NfxNllu6SQa/JpWCgKok+qMavEXC1hs9RcHzex68kaZU2MIaXR9q29xbhx2zV3urWxT7CQ27OCk9lZbBoZUz0IGhDQsf2xznbFQEfAjwXU3jGH4W0MpWkfS+Cq6FPjzV01gVhasx+pa6EIt/uvuIwQPxQ1d158=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772103885; c=relaxed/simple;
	bh=+vLjWaq9LnXzNkC7qmnLbMd7q7CMmHMTZnsitFmSez0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzBNdQvs17kDqMTIOAv2/qhPopG7eI0AjzrfjZT3WXP2287J8OC0SA1lSi+m3TcLZnu+MkWLgmUcJLOpFuwTr/+H5kiIXHIPpgpB8to8w5KRTazGkwxMOSi1GWJUOt2yk1NUPRzoyxEqy7murM8VIqvvxhl0fVulIm8eq+iOxiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ff10630b18so176348137.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 03:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772103883; x=1772708683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyfItVIyFDGDjkquUiGlMUBCJZDbfCOG4EVvKD6FZys=;
        b=Qw2PH3pXjBeZ6oUJKpOHLZShRjZwbtyiIuD/XeNym9eM8J7r0yKFoE5L7fuJVvQR9j
         YwS0Bs2HFjsH8Qwh6dZOOyuKTp4m7koOuN130V7ufXFQf+m4BADN60nQ21/ImJtKS186
         gnXmstp37KBs0WHc7k9gAS6OUZWHPQ42Z90XQ8nlK/Qhd5jHjB6+BAGiahvxoTIingWr
         xYTTBj6MCUvTyb8Mmr0fz0+O4VUdbwuWsRc0JkhwbiUFZjMdpwWhOFCQNkvH/7v3J3tb
         uN8yigbxrmgCdJ8yrypcEZIWr90zAiT0/YoxFW40eYIdG14U/iny2KpCV1jXB/6KNQBh
         oTJw==
X-Forwarded-Encrypted: i=1; AJvYcCVCc0nfIGo+p5q4sgERMHeVpXYMSEUswnwOMT8GxotRr2WPeFBnBISaj7R+2F/4yuBHCLFKRetRiS+r@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs5McwnRCb0Z2cjPWVZOhxyHjtdw013P3LPvAbHiouOpg9/RyU
	lACdgR8xY/CzrYnXVFfg0ToIZGMBNH9lW+yAatiFAngW+7ll+8XAXDsdFdJtlIoJ
X-Gm-Gg: ATEYQzxejGq7bOWnjeP2NSPqOfQq7k0w+XXIx46MX2FbgCfEJAHxc7fspJfnDH4FYRl
	AhJ+JfVQUULtCz/IJQwYXxGx+brh3Yy51EiioAGDUxmYRcRtA0hXmikDSa4Dmxh6hLydvKHUte+
	U46GWTFxSmzGTwOfUjYUupRITfbyoEqeGvaA4xmx56ci6XtTAmHt3xZkzBIGavopnDb+9IA3yJ8
	MV3MmqPgVZQkMBsRuiKRZp6iN0ukKxNPwKf8po6+jAweL5kPOa+dXyRVkLMBh8HnwCx1skpPRQ/
	8qKUNejCR0IbEOWkwmoIzERd0EKoThTsw4h39evp/nEdMLmzSbcFh1EBV2HdzgCPCIhwpg9eV/T
	F0HsucLpTu7YROuCdW9/cDYhd3GU3urO3LEoWMdIZOEjtX9v+XkpRATcGf8cd6LK67T+DTUkrZZ
	aotdvZX7+Zv0yzXOImhVEIIgMzA4InASf70bUpg9wqmCBGGyR0aGQmflF54LNO4nj04ekeyi8=
X-Received: by 2002:a05:6102:5494:b0:5f5:5a45:ac5d with SMTP id ada2fe7eead31-5ff13ef188emr1658322137.17.1772103883049;
        Thu, 26 Feb 2026 03:04:43 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea6b5fcsm1714099137.11.2026.02.26.03.04.41
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 03:04:41 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94aca174532so197643241.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 03:04:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLpLip01aG1Rhf3EtLAFJvJTfKlcu4KmAPhCsoXJAQ16iH5PuAEAmN/Qy9klhUb9fDvpgfmBCLYJOE@vger.kernel.org
X-Received: by 2002:a05:6102:26c7:b0:5f5:4055:4558 with SMTP id
 ada2fe7eead31-5ff13e48da3mr1747443137.2.1772103881016; Thu, 26 Feb 2026
 03:04:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8ecad26c23ba35741f167b3753cd19e72c33c0b4.1772100926.git.geert+renesas@glider.be>
 <PAXPR04MB84595BC43F3205ADFB00D95D8872A@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB84595BC43F3205ADFB00D95D8872A@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 12:04:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUmnfeRcqg3HqdM7bgBtpnUucOCSzRcz=AoBeMKU=fxBg@mail.gmail.com>
X-Gm-Features: AaiRm51k8LVW5VHSxSnfaOZjdlPSUNjcvgCb5ebX1inrRnkMxJ8rNOumZjOWDaw
Message-ID: <CAMuHMdUmnfeRcqg3HqdM7bgBtpnUucOCSzRcz=AoBeMKU=fxBg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: PINCTRL_IMX_SCMI should depend on ARCH_MXC
To: Peng Fan <peng.fan@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <frank.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, dl-S32 <S32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32227-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,pengutronix.de,kernel.org,arm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,i.mx:url,linux-m68k.org:email]
X-Rspamd-Queue-Id: 516E01A4CB7
X-Rspamd-Action: no action

Hi Peng,

On Thu, 26 Feb 2026 at 11:46, Peng Fan <peng.fan@nxp.com> wrote:
> > Subject: [PATCH] pinctrl: imx: PINCTRL_IMX_SCMI should depend on
> >
> > i.MX95 SCMI firmware is only present on NXP i.MX94 and i.MX95 SoCs.
> > Hence add a dependency on ARCH_MXC, to prevent asking the user
> > about this driver when configuring a kernel without NXP i.MX SoC
> > family support.
> >
> > Fixes: b755521fd6eb22ac ("pinctrl: imx: support SCMI pinctrl protocol
> > for i.MX95")
>
> Not sure this deserves a fix tag.

I can drop it if you want.

> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/pinctrl/freescale/Kconfig
> > +++ b/drivers/pinctrl/freescale/Kconfig
> > @@ -10,6 +10,7 @@ config PINCTRL_IMX
> >  config PINCTRL_IMX_SCMI
> >         tristate "i.MX95 pinctrl driver using SCMI protocol interface"
> >         depends on ARM_SCMI_PROTOCOL && OF
> > +       depends on ARCH_MXC || COMPILE_TEST
>
> How about this?
> depends on (ARM_SCMI_PROTOCOL && OF && ARCH_MXC) || COMPILE_TEST

Sure, these dependencies can indeed be relaxed, as the driver
compiles fine without ARM_SCMI_PROTOCOL or OF.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

