Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A7D1EE417
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 14:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbgFDMGn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 08:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728555AbgFDMGn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 08:06:43 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C1EBC03E96D
        for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2020 05:06:42 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id c12so5621013qkk.13
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2020 05:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jSQHC1o3f5m5emzxu9YBcPNRqKngKwzMlx+TKTi0XtU=;
        b=JDruNPPkDTGBxJQk+jI2G9ZRH1SJmQtyus/t8H9KtBs8Rb9bGj1e1/ClynWK9gEbBt
         HNqs7c/AEdpw4zCNLIOrzC5Ucd6TqJ/WwrO92NFNQ7GuGw4DK8IcjKP4jYtD7snAe5TV
         EbAhGhVO9jTc/GFjwupNGZYe+owFtDNwy+IiVXJwWWYCw/LvGGu3mvWmnTLKootUzVYp
         wBUdWNuAD+BbmlCaVCq8otnoeyQhpefh5XQbTMZbDph6YeNPhYhZ0mSQgHl0VzmNxUi2
         7bp0NDj74Krnv/WHb1hoA6WXqF+9hYvtvmnAD5KROSA5bDkPaAHjX3DiaAuzTy5BhyzC
         M70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jSQHC1o3f5m5emzxu9YBcPNRqKngKwzMlx+TKTi0XtU=;
        b=rFNZgQGgCFWh+AYSO53jV21vit5Y/g9MoMGXwEpw1a7WqkRe7+iHjnxa1TnnTbTrfp
         UK3wp2sMOwmf0Tkh8AkopZ9nprfYTZyWL2M4FOqEeClKJdvhrYt21Mq+ns+uyR7QdPXB
         prVIL7cna7zUJ/iM7XmLo/pB5/+zs90CSUIagi+MbhrRM9GqPXz8F0f6L7e18y3W4216
         5EWrw60Tt7Y7njYMTPGxl686edvb0RYpCXfLlO2on7k0VhgggXWUCktWqSOgmXEI9+K3
         t7kVZulr54ivzi8gKi5Sl40Ht3TPJpG6D5dUz3yZP/jI0niEh/pvSn4IXm/8smMblERj
         J8zA==
X-Gm-Message-State: AOAM532JbA2qzRQ8mxvFmpzSdBFbgsJnp8BHaz96bPaaUtLHDf9/ByZU
        LeCZjYWSGuoW7rgMJEp8CDriPXtLoma5PdNzeDpJ0NW5
X-Google-Smtp-Source: ABdhPJyD7+lCfVAQJ1oyaF8Br8FLt6SIzAwugbG4sH7U8+avpScU5Ikt1971Gx8kBKqzvlH6XR8X0LSQxEeSj6gFrB4=
X-Received: by 2002:a37:aac4:: with SMTP id t187mr3933753qke.263.1591272401774;
 Thu, 04 Jun 2020 05:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200516064507.19058-1-warthog618@gmail.com> <CACRpkdbputuoHFWL_FhUNR-ZywvJt=qYdaa+i2cLt-Odmgxe2w@mail.gmail.com>
 <20200525141902.GA27938@sol> <CACRpkda4PEYd5UGbLkq9w1RBbtOdZxuMQ75k-nu5YfoKTZ_azA@mail.gmail.com>
In-Reply-To: <CACRpkda4PEYd5UGbLkq9w1RBbtOdZxuMQ75k-nu5YfoKTZ_azA@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 4 Jun 2020 14:06:31 +0200
Message-ID: <CAMpxmJVzMJkPSrL4uhfCgjXb7CkLSOH3kW=aeb68LRNJenKRiQ@mail.gmail.com>
Subject: Re: [RFC PATCH] gpio: uapi: v2 proposal
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 27 maj 2020 o 07:58 Linus Walleij <linus.walleij@linaro.org> napi=
sa=C5=82(a):
>
> On Mon, May 25, 2020 at 4:19 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> > > > +struct gpioline_config {
> > > > +       __u8 default_values[GPIOLINES_MAX];
> > >
> > > So 32 bytes
> > >
> >
> > Actually that one is 64 bytes, which is the same as v1, i.e. GPIOLINES_=
MAX
> > is the same as GPIOHANDLES_MAX - just renamed.
> >
> > On the subject of values, is there any reason to use a byte for each li=
ne
> > rather value than a bit?
>
> Not really, other than making things simple for userspace.
>

I'm in favor of using bits here. I think we can rely on libgpiod to
make things simple for user-space, the kernel interface can be as
brief as possible.

Bart
