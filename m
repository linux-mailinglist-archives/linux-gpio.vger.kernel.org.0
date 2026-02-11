Return-Path: <linux-gpio+bounces-31589-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ4AFSo9jGlyjwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31589-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 09:26:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 789EA12235E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 09:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A75E23006831
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 08:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AAA350A3F;
	Wed, 11 Feb 2026 08:26:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8945734FF4E
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770798372; cv=none; b=u0mHwfWBOOMiexHkcXzkpSwtmJaPeq2pMAd580rc7CZpmV6GM0g5OK/kQNdTcklvPZ978uHF5OHwOBjh/TyJHt8E/iqmjlrlhpVIgdSLWk9vreniti5/mSlb4LF4X4uUIgk2KcQpAncb9YDAaspW0iPE3LNG2zNNczRhd4bGi1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770798372; c=relaxed/simple;
	bh=r9Wla/KAGSmrKoL/4XgQdP4TYp4ywC1zm3v7/o7W7fE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UgXOgxOaVDRRHDxq9jdEurv7UlfPOnRyxv8XK6UTFUyJ9itEb90UMAZ/91fyLAwXTNKBpWRCr1+qzALRTg4GDMZFM/WqbgenbRIZK4LUgzCOGnOKJ97489J39IZvzWh32CrZma6NHdbc8Yw/QxAm9GJWjjaOOzc+omliQTKTbAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56706fd623fso1432046e0c.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 00:26:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770798369; x=1771403169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUtq8RehO2YiCwI9u9SSNEZ4UqlgXWw6ZYam6FQhea8=;
        b=cj4VyulgcZbmH6C8WG7je8LXNvtyVuBIa3v7qWfwHKJMxFKkkBToFj1D187P8kml3x
         YQKJEVXBNN3qLrBgH22Ah0QYicwpxb2Qtj8U+/7y4XIxKq5Ahn3Q+G9tMChd/debOigR
         ougXKxakV263jnpdaUoBGTvCZEZAfCa4IVopiDUxGU+lXgE/DLC2qEccwXsEYhLEj2+A
         3PGO0yaPDcJni+LBLZfJxt8+8iB0Ejy2TOLdPwQim7RZ8hMLqPawjbufdEJ2Fr2tdW9X
         xufmmQzP82VESj+2qGQo8jjUdEEnotglrV06MxXnGWwoJUfFkX0Pg+/9YRlmHrjoDXJs
         zLNw==
X-Gm-Message-State: AOJu0Ywrgj7ajhl+KhvIGxQ3bYIAc4QoAjY9MCwjHGfdvDrtOnbf71CX
	FkYEaQap+bZ1+7oOWUr3yrrgTTReXsLq6igfSuw0E/zP9SgZyNJnZTZJ3jz2TlJhsZg=
X-Gm-Gg: AZuq6aJsPfUaf1IkoIXhIVvWy3Og3QAURIjlWYC62eLfVpc60u36BrbWHg612b096Gw
	FBvvTvhBsZgXhIxmU6iOX+u7c52S6t21whAYuhjq0uN3wJqQf2guGa0tLI6h5L6y9Qk9GmoWx/U
	gt112LqiZE3LcGJcsHbmvtrUfGOt/wT+7AbNdaDoG8jxnF8JyxG6xFMY3Ul9oCbg5cN/wL6BKom
	9m857s6Cp1EGDALL1cHBp+Ihyiz9oFFJA/nGU+QilOtBrNnlVKkTtuBENLAYyrfwyrBA1eQRIE7
	/lVrweWH6/leuSA2AgyRahAfJDHhUS8S6h2XZ9CwTdjdRnUclekydblBeDQ+8WJmFWc0pZGUce6
	xkKzT/3+jbek0gjpTDFLyQvleHApQaPgGtq0g84X8UdvLxS0z0NH8FEgpCtSQfaubowPtnGG44K
	/J2n+WUkzhkRQ2pVIUXyYkNCOEGa8fDNNYpLmL72SFTqb65myVV33agFecu6hT
X-Received: by 2002:a05:6122:d0c:b0:567:42dd:7dcb with SMTP id 71dfb90a1353d-56749ed3e82mr428254e0c.20.1770798369469;
        Wed, 11 Feb 2026 00:26:09 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5674bff0922sm409271e0c.6.2026.02.11.00.26.08
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 00:26:08 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5fc4220b0acso573748137.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 00:26:08 -0800 (PST)
X-Received: by 2002:a05:6102:418c:b0:5f5:3ffe:58a1 with SMTP id
 ada2fe7eead31-5fde4453cfcmr443849137.42.1770798367745; Wed, 11 Feb 2026
 00:26:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
In-Reply-To: <20260211081355.3028947-1-james.hilliard1@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Feb 2026 09:25:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXWAx1Kfb84bhp0c8Gya5yaQjtYOnVFqJzyc4Wjc_KtqA@mail.gmail.com>
X-Gm-Features: AZwV_Qgck8jsh11uaU1QsTZP3lb4ThuWhGkv_csuiy-E1gDkipfBoAU_AtkEcLU
Message-ID: <CAMuHMdXWAx1Kfb84bhp0c8Gya5yaQjtYOnVFqJzyc4Wjc_KtqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31589-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,devicetree.org:url]
X-Rspamd-Queue-Id: 789EA12235E
X-Rspamd-Action: no action

Hi James,

On Wed, 11 Feb 2026 at 09:14, James Hilliard <james.hilliard1@gmail.com> wrote:
> Document the gpio-aggregator virtual GPIO controller with a dedicated
> schema and compatible string.
>
> Also extend the GPIO AGGREGATOR MAINTAINERS entry to cover the new
> binding file.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-aggregator.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-aggregator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO aggregator controller
> +
> +maintainers:
> +  - Alexander Stein <linux@ew.tq-group.com>
> +
> +description:
> +  GPIO aggregator forwards selected GPIO lines from one or more GPIO
> +  controllers and exposes them as a virtual GPIO controller.

> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    gpio_agg: gpio-aggregator {
> +        compatible = "gpio-aggregator";
> +        #gpio-cells = <2>;
> +        gpio-controller;
> +        gpios = <&gpio0 3 GPIO_ACTIVE_LOW>,
> +                <&gpio3 1 GPIO_ACTIVE_HIGH>;
> +        gpio-line-names = "modem-reset", "modem-enable";
> +    };

Looking at the example, it seems you intend to use the gpio-aggregator
as a "Generic GPIO Driver", like in the example in the documentation[1].
Hence I think you should not introduce and abuse the "gpio-aggregator"
compatible value for this, but instead:
  1. Use a proper compatible value that matches your device,
  2. Write proper DT bindings for the device,
  3. Add the proper device's compatible value to the gpio-aggregator
     driver's match table.
The above is very similar to how spidev is handled, which also forbids
using the spidev compatible value in DTS.

[1] https://docs.kernel.org/6.2/admin-guide/gpio/gpio-aggregator.html#generic-gpio-driver
[2] https://docs.kernel.org/spi/spidev.html

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

