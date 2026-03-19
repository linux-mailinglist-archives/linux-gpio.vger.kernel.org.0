Return-Path: <linux-gpio+bounces-33839-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEP3BlkpvGkxtgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33839-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:50:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA7C2CF212
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02545308C743
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 16:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DE63EDACF;
	Thu, 19 Mar 2026 16:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="piH974Ow"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89723E7163
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 16:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938657; cv=none; b=HEhIfYc2b3k1fZJyFhv6S09WtiTuDaLNI8sTbRXYl6QYCv/9ILbrKoYhYMopd3qQSjXPdRjOukQVtbgxWWXHH+0LcS5yQQ1Q1iwQGScrS4PJqU7gIoVhDl3psuV36HMIvkNRomhwV60n/tK6o1Sjukc3DzvBaPZaPk5LTtVPgs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938657; c=relaxed/simple;
	bh=oEWVx1OpHMMRuk87wznIK8JEX7NBHGl8RmGt9/hk5y8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VubDpXyxCe5vMWMmisoPv95QtwmGxqgukyt8OfgEzNXkFR/dNzPDxpy5Lp43wtWcS8cAqNz+ILYcU6B5X699HAvorJSnj3keHoi0BfdbjX567BYV/ZEVPgMFvtydPK7jFrdzfzvv9hWL3PEbWbdmiijFVaMNuDeFbEMO2P7Sb6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=piH974Ow; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7094BC2BCB5
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773938656;
	bh=oEWVx1OpHMMRuk87wznIK8JEX7NBHGl8RmGt9/hk5y8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=piH974Owj0mxvtd/gslxmBrKH74drAYEc3RYL2NYn5OCMcal2aUKbk7XRpEXls6CT
	 ZyelWFoDfsw4ZCzfcFRUJaFj0zjzlijyKOf7wQfsW55dAAiAe3j/9sZlM0brg1/uAW
	 rq2v6A4huul16tc+PeWvsi8oGaR0mYdW5kVs4DgRhFVIW/bAYsIG5cLCHNMoGaYNPo
	 5v6lSGsEogKy7XNz0c9p0vgKORghvChDkuS58fiP5Dy3U+FeTisBynopVnKDPkEnpm
	 0YEPSRz8GmAszz/+2bhD0O6cIzUeyFvGHH28LxV4jK8Wd8pvAJzPJceaMe+9lR3VFH
	 xyDVkJi8eq2eQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38a67221fe8so10135841fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 09:44:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEKCl7lkdQ1vUNlaVuy+YJdkWb/nYcvAoYhYUhsPeMOaBhEiu4tg26L7MyUP8ajVTEEOlukNpP9HSa@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/i9YlLKl6o3+4gQiZpiZ/HF0wrXEqks3eZgjCqgTZDuEnR6DM
	B9JHxCOYxIlgZPwi5JyDH20ZiyvEV7sTt2IJ7wfR4TXrsS2Sssfut7TsWUnDtKNmOjLrE8C9f8e
	cjyqDYeZDEOPe13ush+gj2HIt+SJ/9ao=
X-Received: by 2002:a2e:a987:0:b0:386:fa6b:44e0 with SMTP id
 38308e7fff4ca-38bf966a00bmr538601fa.10.1773938654791; Thu, 19 Mar 2026
 09:44:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-rc2-boot-hang-v4-0-4372f47cb6b8@mmpsystems.pl> <20260319-rc2-boot-hang-v4-2-4372f47cb6b8@mmpsystems.pl>
In-Reply-To: <20260319-rc2-boot-hang-v4-2-4372f47cb6b8@mmpsystems.pl>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Mar 2026 00:44:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v65c7A7V05ih-GkHxs1tik892Fgt8HhT49_2xHeL91Sh_g@mail.gmail.com>
X-Gm-Features: AaiRm50--3c_EFXYH_tPkJpauDkMflt6ULJhXyCWNw5590qsCxieypOfZHxKwAQ
Message-ID: <CAGb2v65c7A7V05ih-GkHxs1tik892Fgt8HhT49_2xHeL91Sh_g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33839-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.960];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mmpsystems.pl:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AAA7C2CF212
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 12:10=E2=80=AFAM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
>
> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> is in unitialized state.

        ^ uninitialized

>
> Solution is to set pinmux to GPIO INPUT in
> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> earlier.
>
> Tested on Orange Pi Zero 3.
>
> Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()=
")
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 19 +++++++++++++++++++
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 ++
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 685b79fc0bf8..321ee97f5745 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -1092,13 +1092,32 @@ static int sunxi_pinctrl_irq_request_resources(st=
ruct irq_data *d)
>  {
>         struct sunxi_pinctrl *pctl =3D irq_data_get_irq_chip_data(d);
>         struct sunxi_desc_function *func;
> +       unsigned int offset;
> +       u32 reg, shift, mask;
> +       u8 muxval;
>         int ret;
> +       bool is_new_layout;
> +       bool is_reset_mux;
>
>         func =3D sunxi_pinctrl_desc_find_function_by_pin(pctl,
>                                         pctl->irq_array[d->hwirq], "irq")=
;
>         if (!func)
>                 return -EINVAL;
>
> +       offset =3D pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
> +       sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> +       muxval =3D (readl(pctl->membase + reg) & mask) >> shift;
> +
> +       /* Change muxing to GPIO INPUT mode if at reset value */
> +       is_new_layout =3D pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT;

You would want

    !!(pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT)

here to normalize it to a bool value. This is quite common in kernel code.

> +       is_reset_mux =3D (!is_new_layout && muxval =3D=3D SUN4I_FUNC_DISA=
BLED_OLD) ||
> +                      (is_new_layout && muxval =3D=3D SUN4I_FUNC_DISABLE=
D_NEW);
> +
> +       if (is_reset_mux) {
> +               sunxi_pmx_set(pctl->pctl_dev, pctl->irq_array[d->hwirq],
> +                             SUN4I_FUNC_INPUT);
> +       }

Nit: the curly braces aren't needed.

> +
>         ret =3D gpiochip_lock_as_irq(pctl->chip,
>                         pctl->irq_array[d->hwirq] - pctl->desc->pin_base)=
;

Nit: you probably want to replace this with "offset" as well.


Just minor issues, otherwise

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

>         if (ret) {
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index 22bffac1c3f0..0daf7600e2fb 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -86,6 +86,8 @@
>
>  #define SUN4I_FUNC_INPUT       0
>  #define SUN4I_FUNC_IRQ         6
> +#define SUN4I_FUNC_DISABLED_OLD 7
> +#define SUN4I_FUNC_DISABLED_NEW 15
>
>  #define SUNXI_PINCTRL_VARIANT_MASK     GENMASK(7, 0)
>  #define SUNXI_PINCTRL_NEW_REG_LAYOUT   BIT(8)
>
> --
> 2.43.0
>
>

