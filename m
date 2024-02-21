Return-Path: <linux-gpio+bounces-3595-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 461A385E75E
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 20:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37FBE1C2232F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 19:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD688663E;
	Wed, 21 Feb 2024 19:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u7W79RKB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEB485C6F
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 19:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708544212; cv=none; b=TGd1R89msgJMIRPqzsuYWzsE3NV4QmZ+5pukMIBdN++E+GNCQ+bATlEOBUpA09iz+RjsB8SochNGQGLOZneloy/1GTWlS3lEJaGK8x62ZKyR8h/2R/1yhzdIn23Ps5I/26ZWAOOt2jUMqz8DU9xCieE2KWNob3jAS+Dp1+2yfRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708544212; c=relaxed/simple;
	bh=eV8KAdCq546PLUu5EHILB1FlUk/5D6xqO6K8+ATuJRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQA5zE6SyoZKG2P35pCNTKm95cG0uXrt6kCulAZ5oZ5tceaC9EKEjrnZ0yvluvC1gXpFMUH4DBGELaQRYXdU9VUlypMYN4yYlKOtHmR+fXZTokRXs7bvEIUs/IZLFSiZu/7qSKNosoZP4U2Uw4uCEf7ZQbhMk+I4EcVtclai+ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u7W79RKB; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-608342633b8so41029457b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 11:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708544210; x=1709149010; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ww0To1dp+AHUBLp6rp2jOb2P+DD7/I49Wgp5bodshls=;
        b=u7W79RKBLtsgCnc0flAkFFQjlNIqxSAjY5e/tyZWGtgpaeWNePfbPUT/5PyeQQy0Vg
         gMawdvc7NuNL2qna8LFqr8OoYCxlSNbNchQtxc3gKCQnpM8KzZTDoxG+ZCRoumx8fg4j
         vKGy5yVlHdC3r+q+1lbXf6/AKkrc6XdgPPT4Oau/33l1pCJ4mHeG9ggcN+S0sGO/uTFy
         /ELHrXy7VM8kS5kqWWcrWM+OFMoy4XImpDOMhQdVzhnDxCfEUBzYSYwlcZlita1tX0h2
         SfTk+p/6UAKzYhFDtfufqjxWXM5/MmPhZnFMzEwtxFhINIZUpdEyguFQ+tIB9o3u9ule
         6gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544210; x=1709149010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ww0To1dp+AHUBLp6rp2jOb2P+DD7/I49Wgp5bodshls=;
        b=E51Ctg84KKdhpOskiiNAkpQ/dT7PygvucjRD43VX/ruAO89AbJa8Fudsbfw2KAaeHf
         UDRV4xHxC3lOmzs7Tg8InTBKjDwWoqcdMcbntnp0ZeEb83Gzkjvf8XcoaAoMfroJhzev
         /rm+PBs4kmhDRQWLfHPtcRFpSzL9R8Wummv+y5SuobQlMUtUZnzg3M06c8VWbvSOdH97
         Nfr4u+YrNsDb5yFt/HHm5snnbxSRKo5DUrKfD4406Ft626+WreYh839sg3+/xh8WsP+G
         qFLZzrHkMeV86/hiQzsj32O+6wuRGbrj2L7QrJqDGp8KgJM8bzvZvkLitnkKkb2/Zu1p
         JsuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNKtUZQep9ErFqpxnSBTVQGhIJLXbnDb1wS90wOnhWl1tu+LTEf+zVNxqYCykKrCUHvjicfDkMDpaivHTpQhNwdlBCD3wlAj4cpA==
X-Gm-Message-State: AOJu0YyOmmbw82IG5Sb3ac1Rfv5X9Xa0rJkhF5GOp4ngb+5mw4zM4tLc
	yG6UTLSyugU6qiWkeGuoZBmfOYsV/fxb4FE3V6OqSxluf2Yx3aAOBc12DhAbus4NBq2e/kXmTex
	eYZTquB1cJDd2D/1fFomHO/nzeTYrDz5CsJx+oQ==
X-Google-Smtp-Source: AGHT+IGCZPDCa1Hzfo+KEBVcL7TsTR0Ad/nA9/EpiWdmACh0Xp2HAj3m3ZyLtUAY4auzZzhlgNjzo05jt7jYW0MAWUM=
X-Received: by 2002:a81:8d51:0:b0:608:8b1e:cee with SMTP id
 w17-20020a818d51000000b006088b1e0ceemr1805668ywj.25.1708544210048; Wed, 21
 Feb 2024 11:36:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com>
 <20240214-mbly-gpio-v1-18-f88c0ccf372b@bootlin.com> <CACRpkdYLBGsphNkmWyPXQZvFaO2hHGHGTMt1eqz-HAa2k5F3bg@mail.gmail.com>
 <CZAW47LJHQVD.1Z9GFT8UENYXT@bootlin.com>
In-Reply-To: <CZAW47LJHQVD.1Z9GFT8UENYXT@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 20:36:39 +0100
Message-ID: <CACRpkdZQ9LEqKvugDCMEXPPLMCUJ-f9rYQOpmsSEJhtW0zjNsg@mail.gmail.com>
Subject: Re: [PATCH 18/23] gpio: nomadik: support mobileye,eyeq5-gpio
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 5:16=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> > Trying to figure it out...
>
> Can I help in the debugging process?

Nah, I found it :)

> Reading the code once again I'd guess
> of_device_get_match_data(&gpio_pdev->dev) could be the root cause. We
> are accessing match data for the GPIO device while probing the pinctrl
> device. Maybe something isn't initialised properly yet? The rest looks
> rather harmless, I've checked all conditional expressions.

Yep spot on. The nmk_gpio_populate_chip() is sometimes called from
the pinctrl driver before the gpio probe() has been called, so the match
data is NULL and we crash.

This looks like it does for historical reasons and there could be better
ways to fix it now that Saravana Kannan has fixed up the probe ordering
code.

The following is one way to fix it for now using device_is_compatible()
(illustrating some other changes I did as well):

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 21bb6d6363fc..11071a982ebb 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -27,6 +27,7 @@
 #include <linux/of_platform.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/seq_file.h>
 #include <linux/types.h>
@@ -37,15 +38,13 @@
 static DEFINE_SPINLOCK(nmk_gpio_slpm_lock);
 #endif

-#define NMK_GPIO_FLAG_QUIRK_MBLY    BIT(0)
-
 void __nmk_gpio_set_slpm(struct nmk_gpio_chip *nmk_chip, unsigned int offs=
et,
              enum nmk_gpio_slpm mode)
 {
     u32 slpm;

     /* We should NOT have been called. */
-    if (WARN_ON(nmk_chip->quirk_mbly))
+    if (WARN_ON(nmk_chip->is_mobileye_soc))
         return;

     slpm =3D readl(nmk_chip->addr + NMK_GPIO_SLPC);
@@ -105,7 +104,7 @@ static void __nmk_gpio_irq_modify(struct
nmk_gpio_chip *nmk_chip,
         fimscval =3D &nmk_chip->fimsc;
     } else  {
         /* We should NOT have been called. */
-        if (WARN_ON(nmk_chip->quirk_mbly))
+        if (WARN_ON(nmk_chip->is_mobileye_soc))
             return;
         rimscreg =3D NMK_GPIO_RWIMSC;
         fimscreg =3D NMK_GPIO_FWIMSC;
@@ -134,7 +133,7 @@ static void __nmk_gpio_set_wake(struct
nmk_gpio_chip *nmk_chip,
                 int offset, bool on)
 {
     /* We should NOT have been called. */
-    if (WARN_ON(nmk_chip->quirk_mbly))
+    if (WARN_ON(nmk_chip->is_mobileye_soc))
         return;

     /*
@@ -161,7 +160,7 @@ static void nmk_gpio_irq_maskunmask(struct
nmk_gpio_chip *nmk_chip,

     __nmk_gpio_irq_modify(nmk_chip, d->hwirq, NORMAL, enable);

-    if (!nmk_chip->quirk_mbly && !(nmk_chip->real_wake & BIT(d->hwirq)))
+    if (!nmk_chip->is_mobileye_soc && !(nmk_chip->real_wake & BIT(d->hwirq=
)))
         __nmk_gpio_set_wake(nmk_chip, d->hwirq, enable);

     spin_unlock(&nmk_chip->lock);
@@ -194,7 +193,7 @@ static int nmk_gpio_irq_set_wake(struct irq_data
*d, unsigned int on)
     unsigned long flags;

     /* Handler is registered in all cases. */
-    if (nmk_chip->quirk_mbly)
+    if (nmk_chip->is_mobileye_soc)
         return -ENXIO;

     clk_enable(nmk_chip->clk);
@@ -235,7 +234,7 @@ static int nmk_gpio_irq_set_type(struct irq_data
*d, unsigned int type)
     if (enabled)
         __nmk_gpio_irq_modify(nmk_chip, d->hwirq, NORMAL, false);

-    if (!nmk_chip->quirk_mbly && (enabled || wake))
+    if (!nmk_chip->is_mobileye_soc && (enabled || wake))
         __nmk_gpio_irq_modify(nmk_chip, d->hwirq, WAKE, false);

     nmk_chip->edge_rising &=3D ~BIT(d->hwirq);
@@ -249,7 +248,7 @@ static int nmk_gpio_irq_set_type(struct irq_data
*d, unsigned int type)
     if (enabled)
         __nmk_gpio_irq_modify(nmk_chip, d->hwirq, NORMAL, true);

-    if (!nmk_chip->quirk_mbly && (enabled || wake))
+    if (!nmk_chip->is_mobileye_soc && (enabled || wake))
         __nmk_gpio_irq_modify(nmk_chip, d->hwirq, WAKE, true);

     spin_unlock_irqrestore(&nmk_chip->lock, flags);
@@ -383,7 +382,7 @@ static int nmk_gpio_get_mode(struct nmk_gpio_chip
*nmk_chip, int offset)
     u32 afunc, bfunc;

     /* We don't support modes. */
-    if (nmk_chip->quirk_mbly)
+    if (nmk_chip->is_mobileye_soc)
         return NMK_GPIO_ALT_GPIO;

     clk_enable(nmk_chip->clk);
@@ -517,7 +516,6 @@ struct nmk_gpio_chip
*nmk_gpio_populate_chip(struct device_node *np,
     struct resource *res;
     struct clk *clk;
     void __iomem *base;
-    uintptr_t flags;
     u32 id, ngpio;

     gpio_pdev =3D of_find_device_by_node(np);
@@ -551,8 +549,7 @@ struct nmk_gpio_chip
*nmk_gpio_populate_chip(struct device_node *np,
         dev_dbg(&pdev->dev, "populate: using default ngpio (%d)\n", ngpio)=
;
     }

-    flags =3D (uintptr_t)of_device_get_match_data(&gpio_pdev->dev);
-    nmk_chip->quirk_mbly =3D !!(flags & NMK_GPIO_FLAG_QUIRK_MBLY);
+    nmk_chip->is_mobileye_soc =3D device_is_compatible(&gpio_pdev->dev,
"mobileye,eyeq5-gpio");
     nmk_chip->bank =3D id;
     chip =3D &nmk_chip->chip;
     chip->base =3D -1;
@@ -667,7 +664,7 @@ static int nmk_gpio_probe(struct platform_device *pdev)
         return ret;
     }

-    if (!nmk_chip->quirk_mbly) {
+    if (!nmk_chip->is_mobileye_soc) {
         clk_enable(nmk_chip->clk);
         nmk_chip->lowemi =3D readl_relaxed(nmk_chip->addr + NMK_GPIO_LOWEM=
I);
         clk_disable(nmk_chip->clk);
@@ -690,7 +687,6 @@ static const struct of_device_id nmk_gpio_match[] =3D {
     },
     {
         .compatible =3D "mobileye,eyeq5-gpio",
-        .data =3D (void*)NMK_GPIO_FLAG_QUIRK_MBLY,
     },
     {}
 };
diff --git a/include/linux/gpio/gpio-nomadik.h
b/include/linux/gpio/gpio-nomadik.h
index 8d0134dd3771..ede16cdaa920 100644
--- a/include/linux/gpio/gpio-nomadik.h
+++ b/include/linux/gpio/gpio-nomadik.h
@@ -51,6 +51,7 @@ enum nmk_gpio_slpm {

 struct nmk_gpio_chip {
     struct gpio_chip chip;
+    bool is_mobileye_soc;
     void __iomem *addr;
     struct clk *clk;
     unsigned int bank;

Yours,
Linus Walleij

