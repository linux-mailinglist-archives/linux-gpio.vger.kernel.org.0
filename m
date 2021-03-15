Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED91933C1A5
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 17:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhCOQZG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 12:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233209AbhCOQYe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 12:24:34 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 374FCC061762
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 09:24:34 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id z25so16972504lja.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 09:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+jijPdUSqMWGA4azd9UUsLc7iUCEpYRxzK2+H3ibJFc=;
        b=HBfH0hJjHZsJUIABSUUUnDm9OcQhN+J/+SjcbxyL9bvFjPm4gci2HRaUu7JRaOiIhT
         FyldEpW+pn1sucRDLZXbYYakoJqm9/lcum8y1SjpY5QhppT9fF1l52QMBkK2DC8JMSwE
         HcurWBp6osin0yQ976e4QdBXl6CtJHbgziNo4IEWI9GaIIDNeC/NFPJQo+X/jItD/ccb
         qwZShnN2J750y0dlOUTCon4cgZx/QvffWIKnEkTc/WhDfNTzTkvWQ/mSjZvgOQQblqaS
         4qAEPJhPhFJ6XPu76NtDXSYJ0iu6MpSuwanMeuTya0F0v9btVjtSl/XpeveRtuUwiAsN
         vE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+jijPdUSqMWGA4azd9UUsLc7iUCEpYRxzK2+H3ibJFc=;
        b=kNmpByU39+k/fiFYWQNNzbQ4pF1wFEDvMhtDX7VD9yfmxlAhPmRs2w+Nc8POsae+H+
         SO7tjWyqyly3SfrHB2JJGAT5OfB5dJlu94JCiiKQsUNVtFzpoB1i4SXl7vtUZg5fYWDT
         QXrCkL6Gox0O4dz0tWF9MwFC3vUaWLYcqgM7bjhzDhsuifwfUFlKhwhdzBUELSOcbns/
         Zn8RhR7qpJ+wd9CYnbwkxhgCCrROoUbnR8Zcdd4/bjcXc/GbYLnFawUyF1QJdEhj0jif
         ExON6rHLI9IJD46jZJXjdt/kGbIV8Rx6X/iV4j+TybXhSsj6A1TcW+C2z1tJonmSB5fU
         HjTg==
X-Gm-Message-State: AOAM53155+s0IXHkKBnAjwB66Ius4lB7U4UJllZ2cKWKY5XJQJfpMIZM
        5lDjcVUuKTNgnXI52nfx2c6HQCadwKeAa1GAcKpqikN67+jGEcx2
X-Google-Smtp-Source: ABdhPJyxd/mpXT0lN/bRNEsisnm6+S01PvbUvL2Q8FY2E6phgBdUpAOl8aU+deK9u8wVwU9D+/gtaXhvcy+c7qQjBcE=
X-Received: by 2002:a05:651c:103a:: with SMTP id w26mr11107541ljm.273.1615825472712;
 Mon, 15 Mar 2021 09:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210302053059.1049035-1-drew@beagleboard.org>
 <20210302053059.1049035-3-drew@beagleboard.org> <349b09f8-fe99-d0d4-dd11-c288bf66cb4d@metux.net>
In-Reply-To: <349b09f8-fe99-d0d4-dd11-c288bf66cb4d@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 15 Mar 2021 17:24:21 +0100
Message-ID: <CACRpkda=_qSY04mjyYUt1ox_yGgmTR3YPRrOYeJeMLjvba0ADA@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] pinctrl: pinmux: Add pinmux-select debugfs file
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Drew Fustini <drew@beagleboard.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 12, 2021 at 2:57 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 02.03.21 06:30, Drew Fustini wrote:
>
> Hi folks,
>
> > Add "pinmux-select" to debugfs which will activate a pin function for a
> > given pin group:
> >
> >    echo "<group-name function-name>" > pinmux-select
> >
> > The write operation pinmux_select() handles this by checking that the
> > names map to valid selectors and then calling ops->set_mux().
>
> I've already been playing with similar idea, but for external muxes.
> For example, some boards have multiple SIM slots that can be switched
> via some gpio pin.
>
> Not sure whether traditional pinmux would be a good match for that.

What is wrong with the subsystem
drivers/mux?

It's exactly for this usecase I think. Peter Rosin already wrote
a GPIO-controlled mux driver too.

Yours,
Linus Walleij
