Return-Path: <linux-gpio+bounces-39217-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b43yDoDBQ2r+ggoAu9opvQ
	(envelope-from <linux-gpio+bounces-39217-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:15:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC946E4B71
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:15:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MlQs4G54;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39217-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39217-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 854BF303D80B
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0EC416D13;
	Tue, 30 Jun 2026 13:12:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F5C416CFB
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 13:12:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825172; cv=none; b=ut/kmh/oexa8o8fbI4wBMHctzoQtz7IQ+zWjdRogwLxZHW63J86v8I7zt4v52upJMbLr7/KIoL/876GjrMfL56Iiy8et1lTF1PgurRRMkbqGIzlD1DjKDWhQk1eixLtdybTrD9soiffjP5gvUTPf/7zzDFA2sxav0fD+piFFx7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825172; c=relaxed/simple;
	bh=3RhZhz8qRVBeG+9Z4V+0HzKXdGm3B3s1JlXEC/Wghdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eebxaTYp0Qr4+bEmGZt66UxWf1Se9MXWRTIaPlf819yEbR8lr2QzSV+XDM7qV9Yxstdr20d+Xj4CENWL/L3eHTl0x84+IyZmQYtbFP4rUjog7T1+gaLrrdFvn3TvpydRCw3IKUD2zhcOOEHTaMps01B0cBg0oxXjFPg0u4n7vhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MlQs4G54; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C19E1F00A3D
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 13:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782825171;
	bh=wkvT66lJpDRdyEaoJbT/7KZo9MPl7om0PLqvxc7ob+g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MlQs4G54c13BOoDjbRqfk9JXS0zYvoN2PTMHw2l9DzIt3rhp0u/NLUxXtRzfj0SMk
	 r248yRej4n8zNz5ghiy1dms0tnbjYQUG4bYLHhG6wCqW+RTP1eFw5TJZKWyQkxJBBe
	 lE+jSuWGKJS5Vu8R7jGIlwotqdpoGkzlI+f9KEDueRCjVLIwJ02WWEicb44pTVWJZP
	 PpTy6IhpTI91585rq/dKUbVYvxW4aLqfxO4kLfghjVmsDS0DRNWPgKtr4vgn+i4Wkt
	 qdkodsqKJpYB54dq5rTckejtiUpGJZm0bCpO7hL6nEESxBJESjAwkKjBWEds7ev3Cb
	 lNwK33IGbkvNA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb77b3afbso2950854e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 06:12:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqVNzwMvWCQXZINs4TysPTq25wFQEpaSo7z9haSgBOcgGpx1nJ5T2PRQhu+gfR+wo1veHA2qilNNhGr@vger.kernel.org
X-Gm-Message-State: AOJu0YzuPlyHjGUXmDZBZkTRy++OGiEiKPbi3evoEWCI0O9n5cdiG5wp
	U8cXpdBRffyMTuA5FJ+W7LouStYIbvwZUoh3Bt5r1pomMdvMwpOSvKP7bsK+5OmFxmx9h91QuPk
	acoy+JjxAM3I+GJvgzkiZTUxC0z3GOO8=
X-Received: by 2002:ac2:4f04:0:b0:5ae:ba3e:a6f6 with SMTP id
 2adb3069b0e04-5aec10a566bmr209261e87.4.1782825169836; Tue, 30 Jun 2026
 06:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622092335.1166876-1-eleanor.lin@realtek.com> <20260622092335.1166876-4-eleanor.lin@realtek.com>
In-Reply-To: <20260622092335.1166876-4-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 14:12:36 +0100
X-Gmail-Original-Message-ID: <CAD++jL=xa-8E8Uon5mXgA=XHTUpc3h4DNi-jUevq5ibWyL3YGA@mail.gmail.com>
X-Gm-Features: AVVi8Cd0rzQDD94BIMNrdHy8q6vTCtb9F3B8vRr2O64rvi7iNBdl6YLUyoEX4Ss
Message-ID: <CAD++jL=xa-8E8Uon5mXgA=XHTUpc3h4DNi-jUevq5ibWyL3YGA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, mwalle@kernel.org, andriy.shevchenko@intel.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com, 
	stanley_chang@realtek.com, james.tai@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39217-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:eleanor.lin@realtek.com,m:brgl@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:mwalle@kernel.org,m:andriy.shevchenko@intel.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,realtek.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DC946E4B71

Hi Yu-Chun,

thanks for your patch!

On Mon, Jun 22, 2026 at 10:33=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.c=
om> wrote:

> From: Tzuyi Chang <tychang@realtek.com>
>
> Add support for the GPIO controller found on Realtek DHC RTD1625 SoCs.
>
> Unlike the existing Realtek GPIO driver (drivers/gpio/gpio-rtd.c),
> which manages pins via shared bank registers, the RTD1625 introduces
> a per-pin register architecture. Each GPIO line now has its own
> dedicated 32-bit control register to manage configuration independently,
> including direction, output value, input value, interrupt enable, and
> debounce. Therefore, this distinct hardware design requires a separate
> driver.
>
> Additionally, the RTD1625 GPIO controller has a specific hardware quirk:
> it fires both 'assert' and 'de-assert' interrupts simultaneously on any
> edge toggle. To handle this, we utilize the polarity register to route
> the requested edge (rising/falling) to the 'assert' IRQ line. The driver
> then filters out the unwanted 'de-assert' interrupt in the IRQ handler
> and pre-clears edge interrupts to prevent interrupt storms caused by
> unhandled dropped interrupts.
>
> Interrupt support is optional for this device, matching the dt-bindings.
> If the interrupts property is not provided, the driver simply skips IRQ
> initialization and operates purely as a basic GPIO controller.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
(...)
> +static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
> +{
> +       unsigned int (*get_reg_offset)(struct rtd1625_gpio *gpio, unsigne=
d int offset);
> +       struct rtd1625_gpio *data =3D irq_desc_get_handler_data(desc);
> +       struct irq_domain *domain =3D data->gpio_chip.irq.domain;
> +       struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +       unsigned int irq =3D irq_desc_get_irq(desc);
> +       unsigned long status;
> +       unsigned int reg_offset, i, j;
> +       unsigned int girq;

So this

> +       irq_hw_number_t hwirq;
> +       u32 irq_type;
> +
> +       if (irq =3D=3D data->irqs[RTD1625_IRQ_ASSERT])
> +               get_reg_offset =3D &rtd1625_gpio_gpa_offset;
> +       else if (irq =3D=3D data->irqs[RTD1625_IRQ_DEASSERT])
> +               get_reg_offset =3D &rtd1625_gpio_gpda_offset;
> +       else if (irq =3D=3D data->irqs[2])
> +               get_reg_offset =3D &rtd1625_gpio_level_offset;
> +       else
> +               return;
> +
> +       chained_irq_enter(chip, desc);
> +
> +       for (i =3D 0; i < data->info->num_gpios; i +=3D 32) {
> +               reg_offset =3D get_reg_offset(data, i);
> +               status =3D readl_relaxed(data->irq_base + reg_offset);
> +
> +               /*
> +                * Hardware quirk: The controller fires both "assert" and=
 "de-assert"
> +                * interrupts simultaneously on any edge toggle.
> +                * We must pre-clear edge interrupts here. If we drop an =
unwanted
> +                * de-assert interrupt below, it will never reach the IRQ=
 core
> +                * (generic_handle_domain_irq), meaning ->irq_ack() won't=
 be called.
> +                * Failing to clear it here leads to an interrupt storm.
> +                */
> +               if (irq !=3D data->irqs[RTD1625_IRQ_LEVEL])
> +                       writel_relaxed(status, data->irq_base + reg_offse=
t);
> +
> +               for_each_set_bit(j, &status, 32) {
> +                       hwirq =3D i + j;
> +                       girq =3D irq_find_mapping(domain, hwirq);
> +                       irq_type =3D irq_get_trigger_type(girq);

Just
irq_type =3D irq_get_trigger_type(irq_find_mapping(domain, hwirq));

Drop the intermediate variable.

> +static void rtd1625_gpio_ack_irq(struct irq_data *d)
> +{
> +       struct rtd1625_gpio *data =3D irq_data_get_irq_chip_data(d);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +       u32 irq_type =3D irqd_get_trigger_type(d);
> +       u32 bit_mask =3D BIT(hwirq % 32);

This is a clear sign that your GPIOs and IRQs should be three-cell
(bank and offset) since they clearly have one each a separate
status bit in this register.

> +static void rtd1625_gpio_enable_edge_irq(struct rtd1625_gpio *data, irq_=
hw_number_t hwirq)
> +{
> +       int gpda_reg_offset =3D rtd1625_gpio_gpda_offset(data, hwirq);
> +       int gpa_reg_offset =3D rtd1625_gpio_gpa_offset(data, hwirq);
> +       u32 clr_mask =3D BIT(hwirq % 32);

Same here.

> +static int rtd1625_gpio_setup_irq(struct platform_device *pdev, struct r=
td1625_gpio *data)
> +{
> +       struct gpio_irq_chip *irq_chip;

This is a super-confusing name for this variable.

It is called irq_chip but it's not struct irq_chip at all.

Call this girq like all other drivers.

Yours,
Linus Walleij

