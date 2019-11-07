Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1834AF28A5
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 09:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727265AbfKGIEW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 03:04:22 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33983 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbfKGIEW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 03:04:22 -0500
Received: by mail-lj1-f193.google.com with SMTP id 139so1186812ljf.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Nov 2019 00:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Icvs9OZ2xWXC5UPn4WjTDzsRSqv4ABuStVj0mfFJ9ZA=;
        b=F/SLkeZfh9tn1C1SOcqQGA7uI8T6cB6x6lBr5R+HR4WuNbOlV4NPR9FoJasE9xAtv6
         myuCAP/bRD1Vvyzg8Ht5V9SEOvVDBbEU7ewy7WXFpiZ1HLhB8P2oZeUPl3Cmzz8jHTBx
         +JfsjtF9sx1XLM12jsSW1Us+ebt3dG7MeFhJRiWZ9vvFjb/pYX1Z67xgojDhwliUFwWq
         wc+FCq3m2Kv4+LogclzGNz9+4IIpJKrUjtvRQecQJusMeZQtaRp1A4lh4MEQGcSjyORu
         POQGNcpHNLzdj9lNrwEoO14rI7QHovnPphY92fDo2F1f8ufzcgSnOLHhOCHrewzyFfUV
         TcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Icvs9OZ2xWXC5UPn4WjTDzsRSqv4ABuStVj0mfFJ9ZA=;
        b=PZzgin0/7Q26//boPXgpczFspG+Ch5Z9x9D0fTmSLc+tUdIiUoydI94PuOzmyWMPGP
         baAUu0Q1S9mMehoaqD9Bd2KAUu/UBZmya3LDG11ZOH9DWGZmNJWkhn39HkiGBgPE9c9i
         thPprr8oQPaFtQ3IWSkcPjprYKk1rDtmOv1DVYixq6Om+DAjR0J6EAi+D+zRbEknyxdN
         T8co6fih2+l75whvTr8xSvtOpHG/boNv4/S+yAWuaV4tnJp/fKg/pENwZgjCqVS6B1oh
         bFOUsGwl7H4bHp5jnKVbbUHLvhMPAAm56rLuXRHRA+NoOVwNdzQf/gsB+ujQNicJPS24
         jFNw==
X-Gm-Message-State: APjAAAWwDcX+SFFtjw4VfAgnqzl6sRNqBa8akOs750YAVrCUdVwwxBGS
        kNGfsHDZztGVvf7eJ5YH+c2Iv7xGSjv54KVuUHMGV9RO+bQ=
X-Google-Smtp-Source: APXvYqwyLBON2IrM1MH7zrGDSUoOt7eH91Ktx6j7qYfJSSZHJ7k8s5gOCs6qkRwBV0ORbE/D4fJNFUcmt5X6vjZzWp0=
X-Received: by 2002:a2e:161b:: with SMTP id w27mr1297296ljd.183.1573113860059;
 Thu, 07 Nov 2019 00:04:20 -0800 (PST)
MIME-Version: 1.0
References: <5dc3460a.1c69fb81.bfae4.adf1@mx.google.com> <e2ba3c23-4b85-f83b-0ba4-dc0db1b8dd0f@collabora.com>
In-Reply-To: <e2ba3c23-4b85-f83b-0ba4-dc0db1b8dd0f@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Nov 2019 09:04:08 +0100
Message-ID: <CACRpkdYA9TgBWb2TQzSVtV1CWy6ZOXA1=8NjSg5bksrNM1C=NA@mail.gmail.com>
Subject: Re: next/master boot bisection: next-20191106 on r8a7795-salvator-x
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     Tomeu Vizoso <tomeu.vizoso@collabora.com>, mgalka@collabora.com,
        Mark Brown <broonie@kernel.org>,
        Matt Hart <matthew.hart@linaro.org>,
        Scott Branden <scott.branden@broadcom.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Scott Branden <sbranden@broadcom.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 6, 2019 at 11:27 PM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
> On 06/11/2019 22:15, kernelci.org bot wrote:
> > +static const struct of_device_id bcm_iproc_gpio_of_match[] __initconst = {
> > +     { .compatible = "brcm,iproc-gpio-cca" },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, bcm_iproc_gpio_of_match);
> > +
> > +static struct platform_driver bcm_iproc_gpio_driver = {
> > +     .driver = {
> > +             .name = "iproc-xgs-gpio",
> > +             .owner = THIS_MODULE,
> > +             .of_match_table = bcm_iproc_gpio_of_match,
> > +     },
> > +     .probe = iproc_gpio_probe,
> > +     .remove = iproc_gpio_remove,
> > +};
>
> There's a fix for this which Mark sent yesterday[1] and should
> have now been applied, by removing __initconst for the
> of_device_id table.  So this regression should not be present in
> the next linux-next tag.

Confirmed, I pushed a new for-next branch with this fix in it.

Yours,
Linus Walleij
