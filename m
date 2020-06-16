Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2101FB133
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 14:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgFPMxs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 08:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgFPMxr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 08:53:47 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9836AC03D1FB
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 05:53:47 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b16so9445827pfi.13
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 05:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5Y6wEAlAgsTxpN0pz7DrDEj+FpV7gGtoAH2iYun1tO8=;
        b=QuS1kP3HH3dJdJWfEud/v440H2HaC36bBjDRr5DDl8WNT4lxGSNBjagwdbgwkKMJ/s
         7rE0VBbo91MiIhN3GYmXTQEm7sStFgvkEaZ965V6QdRsle6XY8tjmWRkFKHp+kQdcNsu
         +Jvael/G/Mt6z4wuE+7APwBESobIO7bAfwgIpXpxLNKOL1S/CHuVXWxJgP2sOmtApFA9
         1+hosPeDIXRk93trOjrsFs2vbVTKDKCVwmwXZLvVtV6gwxrxmBHAEL/l5euzuF3HS1sv
         2oJTps3xHvvpEAQ/4/IExc3HrsbukEoufk/ao0hM7W99uohxoF7jla0yj5v2C37OAMCC
         5rOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5Y6wEAlAgsTxpN0pz7DrDEj+FpV7gGtoAH2iYun1tO8=;
        b=riu647L7hwRyEO1WXIOBT0IdxfT2Ckdl0KQnav2pqidh3wVBxwLz1/GWfR7ASM5P0p
         Znbi35KzNY37kBLBZ5Rexe0GaD+LlotkDPioAe7VKG2UUPXPUtihbnMdLRp6hAYTPUTu
         nK0yWZ0EV5Aj5rnm7l9fEMUqa5Da37/MlcBp4JhzqNhcTqpdJs2W+J1DtI0Kz411RSZg
         Ao9CjAwC7jxySOsPkNR3v6ZCoZW/Hjc3VYYG7VZTdktoutlCiJJBXLkX570Bs9IU1l0m
         FeAfJEcyGtmya/Dlks703Ktq5pjze/SA+XD5IwNrVQCV6m2/CklCWuKuZ6e6BrVcORLT
         pPFQ==
X-Gm-Message-State: AOAM531S4X2g8RTFdFxPgDvo/xY4xSwm8dszYrw9/wCtmw9BlgYPMPRX
        FXAuUrG+73qKcJfg+w+h30O/QSSkHWJVLMQJy7A=
X-Google-Smtp-Source: ABdhPJzXzF56mw9sIAJ8dbBpVJ+6jkngSaSqgFmy+pAuHq51xaccpXR0Zx+rY+VhOwTb1f76jVdMNiOTzBKD6l9DoZ4=
X-Received: by 2002:a62:3103:: with SMTP id x3mr1934271pfx.130.1592312025584;
 Tue, 16 Jun 2020 05:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200605134036.9013-1-andriy.shevchenko@linux.intel.com>
 <20200605134036.9013-4-andriy.shevchenko@linux.intel.com> <20200615122044.j2vdhpmhbpsw6qkb@taurus.defre.kleine-koenig.org>
 <20200615125349.GD2428291@smile.fi.intel.com> <CAMpxmJWiX2750939wC+btP-Uu1oOA2iU8rsJ1wqe_c+x9HeCzw@mail.gmail.com>
In-Reply-To: <CAMpxmJWiX2750939wC+btP-Uu1oOA2iU8rsJ1wqe_c+x9HeCzw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 16 Jun 2020 15:53:32 +0300
Message-ID: <CAHp75VehmxpTocW=pAVeAyGPP_nF8Gvq7kb_3GZgTsmB9JZE=A@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] gpio: pca953x: disable regmap locking for
 automatic address incrementing
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 16, 2020 at 12:25 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> pon., 15 cze 2020 o 14:53 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
> > On Mon, Jun 15, 2020 at 02:20:44PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > On Fri, Jun 05, 2020 at 04:40:36PM +0300, Andy Shevchenko wrote:

...

> > > Looks right
> > >
> > > Reviewed-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> >
> > Thanks!
> >
> > Linus, Bart, just to clarify that this is material for one of the next =
v5.8-rcX
> > (this cycle!).

> I applied the whole series for fixes. Thanks!

Thank you!

--=20
With Best Regards,
Andy Shevchenko
