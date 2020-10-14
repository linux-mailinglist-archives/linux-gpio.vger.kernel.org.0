Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46BF628E064
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 14:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729901AbgJNMRg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 08:17:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:40322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727112AbgJNMRg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Oct 2020 08:17:36 -0400
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B8F820848;
        Wed, 14 Oct 2020 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602677855;
        bh=UnglWlgDMyRAQjyYpzLo/EzUEQTCtgFkf+XvinTiyQY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dvqqiYrQbivtEH0AQFNlp8v1cPl7wEhvK85kQSKTdmxl0i3m9NB9oYXTIujUrpCbq
         hG29fQzWdroD9ae8M4s565kbn1Hl0hrpfKFZr3BEKGKdtObmM79gcDhfF6YyswteIq
         KldPePiu4K6d36TV6uMKZYocw/zGgsuJVne+qk5Q=
Received: by mail-ot1-f52.google.com with SMTP id d28so3220958ote.1;
        Wed, 14 Oct 2020 05:17:35 -0700 (PDT)
X-Gm-Message-State: AOAM5323KZgA0Kbek4ePzkXnbjsz1nMNgIW5wPTYA5CCwzE+UWZWkINU
        zaYs5m3ciM8CtOPvy2353DjL4nVpUvF/aNKEWw==
X-Google-Smtp-Source: ABdhPJxkxuqmjftMYOcKCMoLmsnUGWEAmRTqLh/i0hi30/43bXjm9pgfpjRmitKZgflw+uL4sDdr/nDs4pOg1f1UEGo=
X-Received: by 2002:a9d:7993:: with SMTP id h19mr3287795otm.129.1602677854790;
 Wed, 14 Oct 2020 05:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201011024831.3868571-1-daniel@0x0f.com> <20201011024831.3868571-3-daniel@0x0f.com>
 <20201012161156.GA1635284@bogus> <CAFr9PXnK8wsTURRy77jMwsAS9vkjo6ibTVJch0BEUgvT4ALEhw@mail.gmail.com>
In-Reply-To: <CAFr9PXnK8wsTURRy77jMwsAS9vkjo6ibTVJch0BEUgvT4ALEhw@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 14 Oct 2020 07:17:23 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+qWvd-Y_NcXb579TDDRPxbrcYtOdFHoZEedWA2u3cPyw@mail.gmail.com>
Message-ID: <CAL_Jsq+qWvd-Y_NcXb579TDDRPxbrcYtOdFHoZEedWA2u3cPyw@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: gpio: Add a binding header for the
 MSC313 GPIO driver
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 4:46 AM Daniel Palmer <daniel@0x0f.com> wrote:
>
> Hi Rob,
>
> On Tue, 13 Oct 2020 at 01:11, Rob Herring <robh@kernel.org> wrote:
> <snip>
> > >  MAINTAINERS                            |  1 +
> > >  include/dt-bindings/gpio/msc313-gpio.h | 95 ++++++++++++++++++++++++++
> > >  2 files changed, 96 insertions(+)
> > >  create mode 100644 include/dt-bindings/gpio/msc313-gpio.h
> >
> > This should be part of the previous patch to avoid the error.
>
> Would reordering the patches to make this header before the yaml file
> be acceptable?

Sure.
