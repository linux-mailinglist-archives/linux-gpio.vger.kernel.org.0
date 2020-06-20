Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8128C2026DB
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2020 23:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbgFTV2X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jun 2020 17:28:23 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39089 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728999AbgFTV2X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2020 17:28:23 -0400
Received: by mail-lj1-f195.google.com with SMTP id a9so15281333ljn.6
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2020 14:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=doiVnpeZz6EAtF+e39qR7j8SwcJoFsavM/hNbCfLqRM=;
        b=dMaCyk5rj0t13GaC05m6pfHgrVmAkqDcGWe/Aw36gXR7OcbEAac4PBq6IW1dkGlW8A
         iNY2Z/fqeyYQCeQS2wSz6HnwCgj7wn503dK/K1XccKAGrOQ3D9/WDTXobNV1QCZtENgM
         n0LeTgXZ56xLC3oHJGwUgYNIchSHbWcdeax05kfbmx+y/5jlKLBZjk/pwXtQ17NHnBW1
         d5U1KDgK43yNdEMyfobXWTZqF8MOMPmie/M3W3lf8F+0+QSg4JVwgfX8gQz/NlJtZPU3
         6RVVT4ndlrSTZUnFopUcjCJ2Uxt4XyxtwkWXi3oa3fy4CzD/vviVU/aW305KXamQ14+w
         0NHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=doiVnpeZz6EAtF+e39qR7j8SwcJoFsavM/hNbCfLqRM=;
        b=Q3X06tgMJUqE2ri1RPgcLZTOwKsF6jjUzGK9bNkclRkTmg5W2EiNoWbHuufeaTWf4y
         Uq0alRN9/7HFG1N2aGhLaq9Y035ojGjKoOk8YDaMHU0VwEINfxwTQ3xkzHT+7ouqDrTY
         pRndxbA0ioPdybnvjpSFOE9EXdEMKAG6AoDH5pBbf2yk9bsfNyitpdyUC+PqMuJtnjyV
         e61tArYjsbHowPJB2qtzj1pV8/y4sXAJodLV5HLVKHLI7r2vgJiylcK7vTljwsF8eiSJ
         n9q3OBQVQTbILuSJ1EOhKfAouBo0M9InP6A9xoQf4oLATuOc7k+p8M3B5OD9H6I4O5vm
         H5Hg==
X-Gm-Message-State: AOAM531N7WqWma4HhG9SDhjRA30jdyilItXOYL+ojGWQ3pX+SbjPpqvQ
        yZZH7oC2GDB3ESiMSUcioCB4OAI0yMxtGtyfP30PMvvycPY=
X-Google-Smtp-Source: ABdhPJxB9N+8xAoSiMjHclEoJhQGLQvt4YO+a0WPgzhjdSRi4sucZUPooGGNjhuqRmwkAGGKgnMCsQx+AqKXnb91A5E=
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr5291445ljn.286.1592688439815;
 Sat, 20 Jun 2020 14:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200522030743.10204-1-frank@allwinnertech.com>
 <20200522030743.10204-3-frank@allwinnertech.com> <20200522152803.twvfvuhd6ztunvll@gilmour.lan>
 <8c7a8eeb-f4ea-4df7-b381-5aeab6dd170a.frank@allwinnertech.com>
 <20200605151306.kqmyj673kux4sbaa@gilmour.lan> <CAEExFWutOjweJ_=WYKifebCPohStJdo0UJnHtmzvmhQ+VTb3kg@mail.gmail.com>
In-Reply-To: <CAEExFWutOjweJ_=WYKifebCPohStJdo0UJnHtmzvmhQ+VTb3kg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jun 2020 23:27:08 +0200
Message-ID: <CACRpkdYJeh0-cNbk++CdE664V+2wZirOt1CzfxT-Njp0nq5XxQ@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8mltQQVRDSCAyLzRdIHBpbmN0cmw6IHN1bnhpOiBhZGQgc3VwcG9ydA==?=
        =?UTF-8?B?IGZvciB0aGUgQWxsd2lubmVyIEExMDAgcGluIGNvbnRyb2xsZXI=?=
To:     Frank Lee <tiny.windzz@gmail.com>
Cc:     Maxime Ripard <maxime@cerno.tech>, wens <wens@csie.org>,
        =?UTF-8?B?5p2O5oms6Z+s?= <frank@allwinnertech.com>,
        "robh+dt" <robh+dt@kernel.org>,
        mturquette <mturquette@baylibre.com>, sboyd <sboyd@kernel.org>,
        "p.zabel" <p.zabel@pengutronix.de>,
        =?UTF-8?B?6buE54OB55Sf?= <huangshuosheng@allwinnertech.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 16, 2020 at 11:27 AM Frank Lee <tiny.windzz@gmail.com> wrote:
> HI Chen-Yu,  Linus,
> On Fri, Jun 5, 2020 at 11:13 PM Maxime Ripard <maxime@cerno.tech> wrote:

> > > Considering that the same pin has multiple same functions,
> > > so add a suffix, like i2s3_dout3 and i2s3_din3?
> > >
> > > Or specify muxsel in the device tree may be another solution.
> >
> > Having muxsel is not really an option. We have two sets of bindings to
> > maintain already, adding a third one would make it fairly hard to
> > maintain. And the second binding we support is the generic pinctrl
> > binding, so I'm not really sure why we would want to move away from
> > that.
> >
> > And I'm not really fond of having a suffix either. It kind of breaks the
> > consistency we had so far, and ideally I'd like to keep that.
> >
> > Chen-Yu, Linus? Any input on that one?

This is entirely up to the driver maintainer. They need to keep the
code together and the naming consistent with how they perceive the
hardware works and/or is intended to work.

Yours,
Linus Walleij
