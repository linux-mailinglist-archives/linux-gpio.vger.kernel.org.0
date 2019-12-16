Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25D2A12029C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 11:31:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbfLPKbB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 05:31:01 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33534 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbfLPKbA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 05:31:00 -0500
Received: by mail-lj1-f194.google.com with SMTP id 21so6234492ljr.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 02:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R2CAqD7yphVxKpqpK+F/eAr7MRlAfENWVqw0CFqAnoY=;
        b=F98ofzZswi1ON1bAKTPSWd5+Icm6mrMRcWlGoNTeahpUdZxvSM6qFcZqGN4zAN4Osp
         NdlLEy7XHE0zbPmUPi2zZq5/U5/a9Ue2B+XfIh+EluUE+NoHaOMSjoxvxpExuwNfwwOs
         2oTEoPYR/rTYGmGXHzgc0Pr/FAj3QmcuhcAhTsRGt6RmxDIqCHgnOQMkUTOAHb4I3u1R
         m/2YQVrcDL+DR1UUH/SkmD8dEzpXTM4KzvF07eOk6LXi/nqEznJiz6kcl0yeiO3Lfg0O
         dcea358D79Zrq3wRs5ExA4+mnB0OVo8ZagEMOi3YmF/JKgrNYhNQ40lRqBXcsKfb/BZy
         RfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R2CAqD7yphVxKpqpK+F/eAr7MRlAfENWVqw0CFqAnoY=;
        b=i3MZtG/Rf8Cz/HeHJ5NfqaoAZqxGHMF9FWCJ7GwP00BDtFShJIljs2zoYD9t76rbqg
         2RD3CUQn+5opSKD5Xq/P+4Ws0upk2r6xskqaxHZbBAJd5AUH7y9lMDJqNaRBy/4XOw87
         fS8lc0lEJTe3Z8/VBWyJVyNa3epNRYDeSjDPotNCAh9ZrglV0AvBQ8nxkQFfZEPEpkm0
         hYNOG/A9rcaDKPBMj6aenljskvcCvkPYNMkjBOp4LFDH63zXbLVd/QAdJQYo+UqC5Q2w
         cXStVVHLkZUecjLLRNqmr5Ba3DEPY9Iy0bzinzHj1KCScZV4bm0XynJ6wr2D6829KRDB
         ePeQ==
X-Gm-Message-State: APjAAAWCtoqZfipXuM0gDZjNZWUFwH4DfVtwKmo7jxUsXYEo+T0ZNOB7
        zkoEtsl8b9+dsUwLssPD8Fn5+4u/eyA3k0iZCQiEFw==
X-Google-Smtp-Source: APXvYqycu9hlE1s4S+Sge2Bqv8D+k87tga/cDOXtTcuobEYzip+IsUlyb9ENhVmckOFQwM0Ke6RmQOIym8zJ1np0yPg=
X-Received: by 2002:a05:651c:1049:: with SMTP id x9mr18594833ljm.233.1576492258842;
 Mon, 16 Dec 2019 02:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20191215163810.52356-1-hdegoede@redhat.com> <20191215163810.52356-5-hdegoede@redhat.com>
In-Reply-To: <20191215163810.52356-5-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 11:30:46 +0100
Message-ID: <CACRpkdYLXU9SmrNZfk9vrJuai9O-evAoq_c1oPJ7Q=NQU8=gng@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/i915/dsi: Move Crystal Cove PMIC panel GPIO
 lookup from mfd to the i915 driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 15, 2019 at 5:38 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Move the Crystal Cove PMIC panel GPIO lookup-table from
> drivers/mfd/intel_soc_pmic_core.c to the i915 driver.
>
> The moved looked-up table is adding a GPIO lookup to the i915 PCI
> device and the GPIO subsys allows only one lookup table per device,
>
> The intel_soc_pmic_core.c code only adds lookup-table entries for the
> PMIC panel GPIO (as it deals only with the PMIC), but we also need to be
> able to access some GPIOs on the SoC itself, which requires entries for
> these GPIOs in the lookup-table.
>
> Since the lookup-table is attached to the i915 PCI device it really
> should be part of the i915 driver, this will also allow us to extend
> it with GPIOs from other sources when necessary.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Looks OK to me
Acked-by: Linus Walleij <linus.walleij@linaro.org>

But Lee & Andy should have a final word on this.

Yours,
Linus Walleij
