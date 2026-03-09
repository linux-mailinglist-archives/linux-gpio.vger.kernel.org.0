Return-Path: <linux-gpio+bounces-32791-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFGRJ/RarmkMCgIAu9opvQ
	(envelope-from <linux-gpio+bounces-32791-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 06:30:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A02FB233E9D
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 06:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 900E83004425
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 05:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234AB30C37E;
	Mon,  9 Mar 2026 05:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="f0eOdXQy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64B230594F;
	Mon,  9 Mar 2026 05:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773034221; cv=none; b=leaG4oDs17pKzYv6rKH+Kc/+rTtHH73pGv9vvuGZ40mftZw6jibFWReVZldMeIHEaWtB/RnpAm/4qE2ci2ZY1hY1Kqgc/aZ/XNx8yr9uOLGfD5tOLym6lkVa8ndjjG8VOG/Kb0z8/sHoKNnTcxUPshmTirPcIi9s9TsAW8Y32ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773034221; c=relaxed/simple;
	bh=Q+Nwq0h7TopR9fYpyp/EIJoXFyGHQQf1i093ZvQvGBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udk5PYeGnh7EpBC8XggDdrsR0HLm/soWiixg29SAmvCs3GKdRKwsYPii5vGNeeZAOeaODlQi2MeiyjkbkoLhF1USpSYWrWLnkFebSahrIMw2IeHfZ31CRnOyRZrwXZINzJD5PBGYiPlCpDV/YQN/q0VXQuXq+IThBOnTepBEHV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=f0eOdXQy; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PNeD+GDRfvfC163fk97XXvGbw+Jo2OUnbtzurN4RsaA=; b=f0eOdXQyFKMkguvkn34E3Xua0g
	Bb1HoHUvOp6/i0mokX4C1D2tti8SZSeNi/F8NVTGZtj9uQBnydmZ2mVd4TbKXdCnZTCbngSj3tBAX
	DhnRXbNsdmi1RzlCSshHcHo3OhkrcddJLsyxmP+WUKGB7n6o4zIukG9CaUT+tRCeC6OQYh2lursuZ
	gqcXU43yidC6ZrXTQ/dXtXtJS2bdoWNKqEZyTLOUCpvlC5tUBIPcPcPk5JuJkIedMrs6zUm++tlB0
	hYfPxgsDLaQiY+QOIF5w8UZFuHrK8qgE6iVezAUE9LlBbFdmPLc78lAUq0Hk5IitGGu66gVdY1wY0
	EM8EpBrA==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1vzTC4-00000009tKp-24g7;
	Mon, 09 Mar 2026 06:30:16 +0100
Date: Mon, 9 Mar 2026 06:29:38 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrey Skvortsov <andrej.skvortzov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
Message-ID: <jbxovdxkqgg7jnbryzvtrk2df4cgtzee3f6deqxu47nruotaau@254vefkw2gxk>
References: <20260308-rc2-boot-hang-v2-1-516fdb820953@mmpsystems.pl>
 <CAGb2v67FO1bt3yee2SXn1LTt7O10z1EHHw7F0xQ0bKbpUqch4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v67FO1bt3yee2SXn1LTt7O10z1EHHw7F0xQ0bKbpUqch4w@mail.gmail.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-Rspamd-Queue-Id: A02FB233E9D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[mmpsystems.pl:s=x];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[mmpsystems.pl : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32791-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	NEURAL_HAM(-0.00)[-0.226];
	FROM_NEQ_ENVFROM(0.00)[michal.piekos@mmpsystems.pl,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,arm.com];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mmpsystems.pl:email,arm.com:email,infradead.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 10:06:42PM +0800, Chen-Yu Tsai wrote:
> On Sun, Mar 8, 2026 at 9:42 PM Michal Piekos
> <michal.piekos@mmpsystems.pl> wrote:
> >
> > Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
> >
> > The issue is caused by gpiochip::get_direction() which was returning
> > -ENODEV when gpio is in unitialized state.
> >
> > Instead of failing when the current muxval is at default value, report
> > the line as input.
> 
> I don't really like this "fix". It's really lying.
> 
> Also, this problem only occurs if the interrupt is taken directly using
> the DT "interrupts" property, as that mostly bypasses the GPIO subsystem,
> especially the gpio request part.
> 
> If the consumer does gpiod_request() followed by gpiod_to_irq(), then
> the pin is already muxed to either one of the GPIO functions and this
> won't error out.
> 
> I also found that if the interrupt is taken directly through the device
> tree, the pin itself is not locked out (like for GPIOs, on sunxi we also
> don't do pinctrl settings for pins used for interrupts).
> 
> I think the proper fix would be to somehow be able to request the pin
> as GPIO if it hasn't been requested already. And then either
> sunxi_pinctrl_irq_request_resources() can use that to request the pin
> and mux the pin before calling gpiochip_lock_as_irq().
> 
> Hope Linus and Bartosz have some suggestions.
> 
> 
> Thanks
> ChenYu
> 

I will prepare new version with your suggestion.

Michal

> 
> > Tested on Orange Pi Zero 3.
> >
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > Suggested-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> > ---
> > This fixes a kernel hang during boot on the Orange Pi Zero 3 caused by
> > inability to set up interrupt for the AXP313A PMIC.
> >
> > The issue is caused by gpiochip::get_direction() which was returning
> > -ENODEV when gpio is in unitialized state and its muxval is at default
> > value.
> >
> > Instead of failing, report the line as input.
> >
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > To: Chen-Yu Tsai <wens@kernel.org>
> > To: Jernej Skrabec <jernej.skrabec@gmail.com>
> > To: Samuel Holland <samuel@sholland.org>
> > To: Andre Przywara <andre.przywara@arm.com>
> > To: Linus Walleij <linusw@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-sunxi@lists.linux.dev
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-gpio@vger.kernel.org
> >
> > Changes in v2:
> > - Dropped the previous faulty solution which was forcing the axp313 to
> >   use r_pio as interrupt controller as pointed out by Jernej Škrabec.
> > - Implemented suggestion from Andrey Skvortsov to return default
> >   direction as input
> > - Link to v1: https://lore.kernel.org/r/20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > index c990b6118172..e438cf35ff28 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -971,7 +971,7 @@ static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
> >
> >         func = sunxi_pinctrl_desc_find_function_by_pin_and_mux(pctl, pin, muxval);
> >         if (!func)
> > -               return -ENODEV;
> > +               return GPIO_LINE_DIRECTION_IN;
> >
> >         if (!strcmp(func->name, "gpio_out"))
> >                 return GPIO_LINE_DIRECTION_OUT;
> >
> > ---
> > base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
> > change-id: 20260308-rc2-boot-hang-269e8546635b
> >
> > Best regards,
> > --
> > Michal Piekos <michal.piekos@mmpsystems.pl>
> >
> >

