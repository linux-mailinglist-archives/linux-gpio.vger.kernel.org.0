Return-Path: <linux-gpio+bounces-36478-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLoTEzQv/mmvngAAu9opvQ
	(envelope-from <linux-gpio+bounces-36478-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 20:45:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC724FABD3
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 20:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1D8E3023DB2
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 18:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E643FB7DD;
	Fri,  8 May 2026 18:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VucPNMPL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18F33F23D1
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 18:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778265900; cv=none; b=DpZsb15HkOsSX2QbRABDU+WOXu1RhBRQ59n8pdeoPFNoie+SypRz+cY9wfK5TiFOPfuokwKn6YZYdYGuCy/BGd3+whBtZQYSIQiETQS0vijEdIUp1R6BvKkQiSFTV6Ba+gWFCybxUPzMmuzYlD5NrLszG4/aDvfl8vArKcSmL0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778265900; c=relaxed/simple;
	bh=MelbRQlPSpb9U3QB2o/axJ+pkJp6b84ioVzzm3YW6R8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZvixMuaB3OYwXuTwhnszk4oWhxKvrCYNAsBEX75YRwNVirK0eCpy9R46LPVhqFRVYRwPUobzNg4n0u8rD3sVbkgFiK1ZniGU+4fi2sF3SSv/zb43HM1yswFAQPE28i+mV4vTJewNYdTPn2BqJnhERf1GPfV844PeMrBzUotgKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VucPNMPL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0BDC2BCF5
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 18:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778265900;
	bh=MelbRQlPSpb9U3QB2o/axJ+pkJp6b84ioVzzm3YW6R8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VucPNMPLR+On7bZVEXwy2/ybRo+nuf/j8At3EzBj7SGdOY/J4HhXJoMK+dS1g6PTF
	 nHVxWnjKnrZgJ8lcLLjX9qL/yzVLpemIluhllP470M7mNfWgBxmT7JwyFEbGTr/H9Y
	 jIOEdFFVcIoCZ+aWzDRg3ay7bTnTHDyrBKlmXXHQ5Q8QS3MsYYTFqdvgkIXqMIGBi4
	 OZNLLg09KMIlnCJcO6YOZ3DUk2dGITQs/ng1hecytDqsz7PQks42OPaNgB0/mBSDkd
	 A/o1FNDYKRxyEsT5H6DhipCrMdl1PD807dK0c7O6ziVa3+pgnqRqphACGBA3ZQy9gW
	 8cnvxdlsUtb6A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a87782588cso2984812e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 11:45:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ967CJ1GDPFur5/iGLkpi2l/JJIEQtFyPpSTz+xkArbVhwPkJPx8PKQaFiJ+2c/F6wmhh2FRU09t+F+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1H0+qqIOfLGURCVJvUR73Lz/NV5nK+ZVQpM6ClSukR/PKlRi/
	FKBQovn3Lbsjiyjsr30Ky3xRGwgAYzpJUt2xXeQhH6UCCZAlK9Lu6zClFBmG3ZA3tflKlBDoSlN
	a0Bz1d7NjMSQYPIl1ld3xUoXqAScWISY=
X-Received: by 2002:a05:6512:400f:b0:5a8:65d9:612f with SMTP id
 2adb3069b0e04-5a887adfdc9mr3985974e87.4.1778265898555; Fri, 08 May 2026
 11:44:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <afzlsRkyKQzuUcgL@ashevche-desk.local> <20260508061729.9530-1-mscardovi95@gmail.com>
 <20260508061729.9530-6-mscardovi95@gmail.com>
In-Reply-To: <20260508061729.9530-6-mscardovi95@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 8 May 2026 20:44:47 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iR-doMaHUhwonHj8byfim18ti0a=_9+4S5bsWR1Z=TXQ@mail.gmail.com>
X-Gm-Features: AVHnY4LIjC8RhqNXALMWq0ecWGQV3YRMPJj1Mx018DKCGE3si5Oe8_bF8NLTRc8
Message-ID: <CAJZ5v0iR-doMaHUhwonHj8byfim18ti0a=_9+4S5bsWR1Z=TXQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] gpio: acpi: use cleanup.h for automated resource deallocation
To: Marco Scardovi <mscardovi95@gmail.com>
Cc: andriy.shevchenko@intel.com, linux-acpi@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mathias.nyman@intel.com, mika.westerberg@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0DC724FABD3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36478-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 8:18=E2=80=AFAM Marco Scardovi <mscardovi95@gmail.co=
m> wrote:
>
> Refactor acpi_gpiochip_alloc_event() and acpi_gpio_adr_space_handler()
> to use the __free() macro for GPIO descriptors and ACPI resources.
> This simplifies error handling by removing manual cleanup calls and
> reducing the need for goto labels.
>
> Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
> ---
>  drivers/gpio/gpiolib-acpi-core.c | 40 +++++++++++---------------------
>  1 file changed, 14 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi=
-core.c
> index 33d6c3b6cdf0..c9b12e24de14 100644
> --- a/drivers/gpio/gpiolib-acpi-core.c
> +++ b/drivers/gpio/gpiolib-acpi-core.c
> @@ -397,31 +397,27 @@ static acpi_status acpi_gpiochip_alloc_event(struct=
 acpi_resource *ares,
>
>         desc =3D acpi_request_own_gpiod(chip, agpio, 0, "ACPI:Event");
>         if (IS_ERR(desc)) {
> -               dev_err(chip->parent,
> -                       "Failed to request GPIO for pin 0x%04X, err %pe\n=
",
> -                       pin, desc);
> +               dev_err(chip->parent, "Failed to request GPIO for pin 0x%=
04X, err %pe\n", pin, desc);
>                 return AE_OK;
>         }
>
> +       struct gpio_desc *desc_guard __free(free_gpio_desc) =3D desc;
> +
>         ret =3D gpiochip_lock_as_irq(chip, pin);
>         if (ret) {
> -               dev_err(chip->parent,
> -                       "Failed to lock GPIO pin 0x%04X as interrupt, err=
 %d\n",
> -                       pin, ret);
> -               goto fail_free_desc;
> +               dev_err(chip->parent, "Failed to lock GPIO pin 0x%04X as =
interrupt, err %d\n", pin, ret);
> +               return AE_OK;
>         }
>
>         irq =3D gpiod_to_irq(desc);
>         if (irq < 0) {
> -               dev_err(chip->parent,
> -                       "Failed to translate GPIO pin 0x%04X to IRQ, err =
%d\n",
> -                       pin, irq);
> -               goto fail_unlock_irq;
> +               dev_err(chip->parent, "Failed to translate GPIO pin 0x%04=
X to IRQ, err %d\n", pin, irq);
> +               goto err_unlock;

You are not supposed to mix up cleanup.h stuff with gotos.

>         }
>
>         event =3D kzalloc_obj(*event);
>         if (!event)
> -               goto fail_unlock_irq;
> +               goto err_unlock;
>
>         event->irqflags =3D IRQF_ONESHOT;
>         if (agpio->triggering =3D=3D ACPI_LEVEL_SENSITIVE) {
> @@ -449,17 +445,15 @@ static acpi_status acpi_gpiochip_alloc_event(struct=
 acpi_resource *ares,
>         event->irq =3D irq;
>         event->irq_is_wake =3D acpi_gpio_irq_is_wake(chip->parent, agpio)=
;
>         event->pin =3D pin;
> -       event->desc =3D desc;
> +       /* Transfer ownership to event, prevent auto-free */
> +       event->desc =3D no_free_ptr(desc_guard);
>
>         list_add_tail(&event->node, &acpi_gpio->events);
>
>         return AE_OK;
>
> -fail_unlock_irq:
> +err_unlock:
>         gpiochip_unlock_as_irq(chip, pin);
> -fail_free_desc:
> -       gpiochip_free_own_desc(desc);
> -
>         return AE_OK;
>  }
>
> @@ -1091,7 +1085,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_phys=
ical_address address,
>         struct acpi_gpio_chip *achip =3D region_context;
>         struct gpio_chip *chip =3D achip->chip;
>         struct acpi_resource_gpio *agpio;
> -       struct acpi_resource *ares;
> +       struct acpi_resource *ares __free(acpi_free) =3D NULL;

Nope, that's not how you use __free().

>         u16 pin_index =3D address;
>         acpi_status status;
>         int length;
> @@ -1102,18 +1096,14 @@ acpi_gpio_adr_space_handler(u32 function, acpi_ph=
ysical_address address,
>         if (ACPI_FAILURE(status))
>                 return status;
>
> -       if (WARN_ON(ares->type !=3D ACPI_RESOURCE_TYPE_GPIO)) {
> -               ACPI_FREE(ares);
> +       if (WARN_ON(ares->type !=3D ACPI_RESOURCE_TYPE_GPIO))
>                 return AE_BAD_PARAMETER;
> -       }
>
>         agpio =3D &ares->data.gpio;
>
>         if (WARN_ON(agpio->io_restriction =3D=3D ACPI_IO_RESTRICT_INPUT &=
&
> -           function =3D=3D ACPI_WRITE)) {
> -               ACPI_FREE(ares);
> +           function =3D=3D ACPI_WRITE))
>                 return AE_BAD_PARAMETER;
> -       }
>
>         length =3D min(agpio->pin_table_length, pin_index + bits);
>         for (i =3D pin_index; i < length; ++i) {
> @@ -1189,8 +1179,6 @@ acpi_gpio_adr_space_handler(u32 function, acpi_phys=
ical_address address,
>                 }
>         }
>
> -out:
> -       ACPI_FREE(ares);
>         return status;
>  }
>

