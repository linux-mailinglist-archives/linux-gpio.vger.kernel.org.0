Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC9C19F0A5
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2020 09:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgDFHRD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Apr 2020 03:17:03 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:33646 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbgDFHRD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Apr 2020 03:17:03 -0400
Received: by mail-qk1-f194.google.com with SMTP id v7so15233299qkc.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Apr 2020 00:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oB5EwWkuYfJgFInVNSAKK2AQewxxq5G9p5vadiA9m9w=;
        b=E0e8cult3VLYeIc6b5jikP2f5NAeMplnnu3dOxICNaBPwLmOdOghfEQFOyy+o5l9+d
         5OdU0CzX6CQvtLshnWdaAJLHFJE2qmTAYHkDHgkRCISS+jITR2RJkL5VWd1BbxakDuw1
         OHQTLs7G3mAt70WpSxqGpIo5rMYCRfDI1+s8lZAN7GCbyovYohTS/MxGUi6LG20vzo7t
         eokqfH53hLI2XfkOFl5wP3diugaIC0d2M4Lzznlg9oXGtcsSa2Dq2SW9JNi3qw3va1KQ
         VFRvYvQkCk55eCiMkV1Iene+3lorDip9qU9JhGJUOWBidNP1NzYAIRdUAlWuiAWlGR7E
         ucwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oB5EwWkuYfJgFInVNSAKK2AQewxxq5G9p5vadiA9m9w=;
        b=SbJYhmSwP8koGyy65pIJBQvZIfzGQhFa9U9vhaHQtPso+l8fnIfXvt/EkUKDqafII4
         yWJHoXa3Er2Z+0dwlF4Xr8xve7Yuq3K+V7x+FdY6SSfSi21wjAXzOFd1aBUM1GUh8sUX
         gapu+/gITL6U32v5v40rigJiDa2PtSgOmIaDtSHWHQDfOUnFqxs7+QqTewDExYS1tR5S
         BaT9kJBgZVJhW/OvLefg6cMXPh504NFNwerqKC9O7kL/baKH+mY6E23ly8KXti5GLJ5v
         B/gvVCeRrx2HNHd2o+Mf4iRI2CbDCC610kqx43l4e74ivTRX49hckD/Do7zaj/FMA2D0
         jWog==
X-Gm-Message-State: AGi0Pub6uOaJCuppaH3DQn3OafnT/64SwwS6W3Tt5Wdy3IHe3Fkg40ur
        0inAySh0wHOUeDtiM01hPDyntZQXGA6eBI6YbjmL7Q==
X-Google-Smtp-Source: APiQypKVUuqZ5QsidR7frE5tgG9pEagty5rI65ouHB07YUDxmKa8JecpN7uaP+389U6F+6oFNEqWtYM24INBYvzI008=
X-Received: by 2002:a37:a2c8:: with SMTP id l191mr20425473qke.120.1586157421644;
 Mon, 06 Apr 2020 00:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200401174937.3969599-1-bmasney@redhat.com>
In-Reply-To: <20200401174937.3969599-1-bmasney@redhat.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 6 Apr 2020 09:16:50 +0200
Message-ID: <CAMpxmJVzUPcRe=8MoHdsq_LNdZVT5rvPjF+38BmRTGU_zh-6LA@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpio: xgene-sb: set valid IRQ type in to_irq()
To:     Brian Masney <bmasney@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, dhoward@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 1 kwi 2020 o 19:49 Brian Masney <bmasney@redhat.com> napisa=C5=82=
(a):
>
> xgene-sb is setup to be a hierarchical IRQ chip with the GIC as the
> parent chip. xgene_gpio_sb_to_irq() currently sets the default IRQ type
> to IRQ_TYPE_NONE, which the GIC loudly complains about with a WARN_ON().
> Let's set the initial default to a sane value (IRQ_TYPE_EDGE_RISING)
> that was determined by decoding the ACPI tables on affected hardware:
>
>     Device (_SB.GPSB)
>     {
>         Name (_HID, "APMC0D15")  // _HID: Hardware ID
>         Name (_CID, "APMC0D15")  // _CID: Compatible ID
>         Name (_UID, "GPIOSB")  // _UID: Unique ID
>         ...
>         Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settin=
gs
>         {
>             ...
>             Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, =
)
>             {
>                 0x00000048,
>             }
>             ...
>         }
>     }
>
> This can be overridden later as needed with irq_set_irq_type().
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpio/gpio-xgene-sb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
> index 25d86441666e..b45bfa9baa26 100644
> --- a/drivers/gpio/gpio-xgene-sb.c
> +++ b/drivers/gpio/gpio-xgene-sb.c
> @@ -122,7 +122,7 @@ static int xgene_gpio_sb_to_irq(struct gpio_chip *gc,=
 u32 gpio)
>         fwspec.fwnode =3D gc->parent->fwnode;
>         fwspec.param_count =3D 2;
>         fwspec.param[0] =3D GPIO_TO_HWIRQ(priv, gpio);
> -       fwspec.param[1] =3D IRQ_TYPE_NONE;
> +       fwspec.param[1] =3D IRQ_TYPE_EDGE_RISING;
>         return irq_create_fwspec_mapping(&fwspec);
>  }
>
> --
> 2.25.1
>

Patch applied, thanks!

Bartosz
