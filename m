Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C314B1AE907
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2020 02:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgDRA4A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 20:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725856AbgDRA4A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 20:56:00 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73FFC061A0C
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2020 17:55:59 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u6so3900098ljl.6
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2020 17:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qs6wrAd2usiw5E/NvfsaWD9NmqabIB9KmK4sn2np7kI=;
        b=U4x5PtWjYno+y9kpXnPl1TultiRn27j4BA37HWNBlr8kBkFNbIKmdMCjn5+3qALEe6
         dRH3LlE3dIu3QUb/4qxHvQ9l4xMOL9Mb/kG0fdw89qIxkUEdLh7LgPPZdg/O0R+zWCWz
         DW9rBf94bWBr7s2zss5IpNuRxdZPbLRIPLmgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qs6wrAd2usiw5E/NvfsaWD9NmqabIB9KmK4sn2np7kI=;
        b=VZvl276gvCrwjboA34rJNdf2bhpiWjZyoahYRPQXa54GJTbhZ801o9Wf27zbAlq/ER
         X7R68ggD46Wld/Fe6im7rshIBv58z9hiJospnlHhS5FsFi+RVQjWvFlfEkgDAsUw+vdQ
         IqGjFsdM40sidnkPoIz1zyTlZxKOw4MH7GitWbSmY38YutRkWe3NEls2Hul3dhpZfmPy
         UWH0NzljmF5LlkqVjWPm0NX2m1y4CUN5Luge068Qg8Lz8Vyz2T+rTQZnKbmlPmv7cYHR
         D5faAGeur8FU4gc5bpd2EPuNGgbNUqGHeVX6WIRPoU8i/+WcARJK9ag80NS9GO44eKUs
         fhag==
X-Gm-Message-State: AGi0PuaI8vkf1YmoCRnipMi/gFJmgL0mOg+NKKr+f3CZoeFBCXgFJeo2
        fa4VNuh9KAhiabD7pS/xVUY7mcv/i/Q=
X-Google-Smtp-Source: APiQypI6ofK9bX5ZjAlPkNt8Cq3slWNH+sXhPU40w9AQg7e3USAn3fzALU9+vlZjL7E1Xgcogm1Ixw==
X-Received: by 2002:a2e:7e03:: with SMTP id z3mr3646803ljc.200.1587171357577;
        Fri, 17 Apr 2020 17:55:57 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id m17sm5250449lfp.25.2020.04.17.17.55.56
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 17:55:56 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id g10so2833124lfj.13
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2020 17:55:56 -0700 (PDT)
X-Received: by 2002:ac2:4859:: with SMTP id 25mr3711879lfy.59.1587171355790;
 Fri, 17 Apr 2020 17:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200205194804.1647-1-mst@semihalf.com> <20200206083149.GK2667@lahna.fi.intel.com>
 <CAMiGqYi2rVAc=hepkY-4S1U_3dJdbR4pOoB0f8tbBL4pzWLdxA@mail.gmail.com>
 <20200207075654.GB2667@lahna.fi.intel.com> <CAMiGqYjmd2edUezEXsX4JBSyOozzks1Pu8miPEviGsx=x59nZQ@mail.gmail.com>
 <20200210101414.GN2667@lahna.fi.intel.com> <CAMiGqYiYp=aSgW-4ro5ceUEaB7g0XhepFg+HZgfPvtvQL9Z1jA@mail.gmail.com>
 <20200310144913.GY2540@lahna.fi.intel.com> <20200417020641.GA145784@google.com>
 <20200417090500.GM2586@lahna.fi.intel.com>
In-Reply-To: <20200417090500.GM2586@lahna.fi.intel.com>
From:   Brian Norris <briannorris@chromium.org>
Date:   Fri, 17 Apr 2020 17:55:44 -0700
X-Gmail-Original-Message-ID: <CA+ASDXM9mrkGfxtVVNWkqnDNzcok2LAqdfVbQL2RV7yWE0tMWw@mail.gmail.com>
Message-ID: <CA+ASDXM9mrkGfxtVVNWkqnDNzcok2LAqdfVbQL2RV7yWE0tMWw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cherryview: Add quirk with custom translation of
 ACPI GPIO numbers
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        stanekm@google.com, stable <stable@vger.kernel.org>,
        Marcin Wojtas <mw@semihalf.com>, levinale@chromium.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

- Michal (bouncing)

On Fri, Apr 17, 2020 at 2:05 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> I wonder if we can add back the previous GPIO base like this?

Thanks for the patch! At first glance, it looks like the right kind of
thing. Unfortunately, it doesn't appear to work quite right for me.
I'm out of time for today to look any further, but I (or perhaps
someone else on this email) will try to follow up next week sometime.

Cheers,
Brian
