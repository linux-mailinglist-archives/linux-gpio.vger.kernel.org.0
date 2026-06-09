Return-Path: <linux-gpio+bounces-38196-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7IcYOXo9KGpfAwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38196-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 18:21:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 448D96624BA
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 18:21:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38196-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38196-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87F2430BDF31
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 15:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C502D49553D;
	Tue,  9 Jun 2026 15:55:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408DE4963D8
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 15:55:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781020510; cv=none; b=CmD8MnhGXWB3MQKBevZutSDACbaQQm51bUj+DzQ9nWgfI7LYyrjmjTJ05rlUVPzjHdJKzDSCCzUDgr/3YTLk4vV+tvm3Sf9pnHGvkls3MmqaRlIkQrI5MCq7mHOXSdZq/G1Tzfr8FNGZUw3KoUCUFLno0S1cRJyinqJmZNsB+9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781020510; c=relaxed/simple;
	bh=ToJ8zEJiW1bs5CBQxzv/XDoFjmAxdA2pPZ5GUq922/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tL4iqrrtJSKNFcbu+qpw45Wc/qAApJej0gArF7UHRO20Ekp2gz/TMGW9Fg9aG+NSgutst2FwVlyDZ6Lwjs4gGisIPjNMz4Ch2Pw+lXdcTw1aJqycb5KQNkLt0v+V4+Z1vQlbpPUaGjmqnnDX87W2/6KCOze8G1nAnqvyiJUHLqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9639b1ef167so2032548241.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 08:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781020506; x=1781625306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+Avm/3bAYyxwMVrCuWlXvGD7InI0ltUZ0EVtayRBuI=;
        b=COD0y7dB5/30YPpIEo5nygAtUBBqrm2fTSC2oowJwMKXcEITdvBzrRcsLBvc2EJt+2
         BfptClJnLnraJfvYPtHOc7X3RZPs+OJQPqr3vSLGxq4rnRwTviy7eCC8g2lzQ5thxhvz
         oIPah8LQOtTPHk68AIGgCBIiA6sQr2SbdfnHI44Ig+V8+mAFRXWalL9LQTgpT6obhUGZ
         A/7fRo8TGEuOR3BU/NubqpOYk6vkOoa9OAo7OhxieL5P8Kk87VRNzHJpWXpp8GRY2zJO
         dqO5aso+UcF/s76iKaT1a+G6RrhD6K5oFnW6ll8zbitqGiZEYnlyNq9rxVQY6GofNHxg
         WWRw==
X-Forwarded-Encrypted: i=1; AFNElJ9gLdXhzSpiD1dZl8HQNB8K8+biK2mleu3pwZjb/1Uo+z6hr2UayupmWe+FNqkhjJYB+Mbnc1ZMFSNP@vger.kernel.org
X-Gm-Message-State: AOJu0YzA7arsC0lOrGselksWSQ5Z9MkNuYD1k5XzQJz30oBYU4ASPQqV
	WjqNSVS9qqhr4f0rnxNwJxOhmJbdoSq3tAT4PusIs8TTnJcghmTpGUtMhVb2WATFxyY=
X-Gm-Gg: Acq92OG3REDO5BRkFRfGV/eM/YGQ6SFf8JhfyYkVuLzhk4gCpsfRiJMFTMVZzd3xcKo
	Hr3cNyNsmd3fDS5CWJrl8GORuKifsvdM58XeBurEcwSPYALIn0NrxR6citDbxXX5rIAM7xh705w
	aZ4aOgPyggXmgpdBGCwcJRISvsxR1npR6H0g5zgaKLSU+0JSbov46+BnJTeoNI0p8P70z6p5pXH
	VvcvBX9hx+mjTARb5dqERlqL23F17yrgX8aZ4sae7+nsH/2vfl962NrDHky06SJeeoxReGxifEb
	Ffo4HWOpuEdArZznAaUDkL4YX7VJbpgfvxLZWfJGA7COQ9q65ZOSSacTQZiFziWQuJLf3o2nWHg
	/FAnu/4XHaGA6fPhpWPwjNhJKSAPGP6hBOt5j+Se4zaziGlUnUaihNEQQjLJrA2shyG7oXd/hWp
	ISf69nb0xLi4tFRSGIXNqEWCCpQt6dTUfkTkqbS2tTai5TrrXaeXPnJDj2faNR7UExpjN1ELTSI
	qY=
X-Received: by 2002:a05:6122:916:b0:575:352f:eac0 with SMTP id 71dfb90a1353d-5ac505042ddmr9518745e0c.7.1781020506069;
        Tue, 09 Jun 2026 08:55:06 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d777a638sm17095923e0c.8.2026.06.09.08.55.03
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:55:04 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59ebcbfb2b0so1964255e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 08:55:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/eyLWb5KRC1zyoZatMxVGLDHwHibhy01kpEPp9FxiyzXdzuDv9+uqyEdssN3+kRakAEfFiocGIRt4l@vger.kernel.org
X-Received: by 2002:a05:6122:3a15:b0:5a4:ac74:f5ba with SMTP id
 71dfb90a1353d-5ac5291bd8bmr10681939e0c.11.1781020503646; Tue, 09 Jun 2026
 08:55:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
 <419c7510-3410-4a2e-b3b7-181e796aadfe@oss.qualcomm.com>
In-Reply-To: <419c7510-3410-4a2e-b3b7-181e796aadfe@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Jun 2026 17:54:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUc6ur7hjQZjdiGB87JiuZB1geA6FU5mGehZ3T=e8X8CA@mail.gmail.com>
X-Gm-Features: AVVi8Cdxc5cR5JQjN3rczKbNms6cVA5aKxH7o-FoqyzJlikW2W6ZFAee9lEYXoY
Message-ID: <CAMuHMdUc6ur7hjQZjdiGB87JiuZB1geA6FU5mGehZ3T=e8X8CA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: tegra: PINCTRL_TEGRA238 should depend on ARCH_TEGRA
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Prathamesh Shete <pshete@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38196-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:pshete@nvidia.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-tegra@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,linux-m68k.org:from_mime,linux-m68k.org:email,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 448D96624BA

Hi Krzysztof,

On Tue, 9 Jun 2026 at 17:38, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> On 09/06/2026 17:08, Geert Uytterhoeven wrote:
> > The NVIDIA Tegra238 MAIN and AON pin controllers are only present on
> > NVIDIA Tegra238 SoCs.  Hence add a dependency on ARCH_TEGRA, to prevent
> > asking the user about this driver when configuring a kernel without
> > NVIDIA Tegra SoC support.
> >
> > Fixes: 25cac7292d49f4fc ("pinctrl: tegra: Add Tegra238 pinmux driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/pinctrl/tegra/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
> > index c7507193044f4af3..eea7ec9688b6460b 100644
> > --- a/drivers/pinctrl/tegra/Kconfig
> > +++ b/drivers/pinctrl/tegra/Kconfig
> > @@ -39,6 +39,7 @@ config PINCTRL_TEGRA234
> >
> >  config PINCTRL_TEGRA238
> >       tristate "NVIDIA Tegra238 pinctrl driver"
>
> It's the only user-selectable driver now, so this could be unified as well.

This one and PINCTRL_TEGRA246.

These two are special, as they are tristate.  Hence the user can
choose between built-in and modular, while the other boolean drivers
are auto-enabled as built-in.

> Anyway, the change is correct:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

