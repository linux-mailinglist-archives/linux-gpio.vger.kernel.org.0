Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBE812022E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 11:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbfLPKTS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 05:19:18 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:39419 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbfLPKTS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 05:19:18 -0500
Received: by mail-vs1-f65.google.com with SMTP id p21so3755876vsq.6
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 02:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ueDedzI946XH4PwhczhGeVD5DlLhpVlGlKAyHYsNtI4=;
        b=xMTLZBe9EHbZSuDD63/fynjBq0TMvoIuWQ2+Dk5OTT8tQ4Zuo3Cy9HImD3UWs5kLKj
         E4A0y7sKPT5+yPfjFyjJ7oHj8z1mCgWU5d+xPUuMK7ASBydMJpQ6lfFj8cEl9LsnWSgY
         VpnrjZqhGsHjJeQ6v8kocpglYnRSgLWBTANs1jQM9sOFKlTVUKGSIQ4KAuiKiaX0x+c2
         fqibsiogCi/u6AdiPCoRX0kgFt2oHdSDZh7+SzFqBX+hbyUke1edkmGrRoIRPRAvNg55
         WhKITFUqStneT8rBJUjFtU4egb9jtGKhQw5Gv/9AZcNDUgvKnraUSpNO7qtHxskWSQDA
         kGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ueDedzI946XH4PwhczhGeVD5DlLhpVlGlKAyHYsNtI4=;
        b=Z/oAoTuQxfhp71rWsm4ELT0HStCP77JGvjsCam2ZQv9NhGL6lrgHd3nrGmfmItakOh
         aAfzn41CMB292ZM4RD14wB1og7d+82Lo/Q1PhVYTrcj+6FC3b6HMbKcWNs1mQ3jYcm/d
         cQod5VggUy0/zHVtvenLNa/XFtA6NRUrKqWbS7JFMrM8nHqjRseq8PkVhuFKQpkUi+yQ
         mdSfyC0rIHsAzKwp6RuC1Tw42ir88+sezQJtHHZ/kacbDDQ5SKBZToastMY33vHn0jDl
         GrbYOC9ifNwc6kJOgXWnGPeIVPoQSAg26pCr/7vdYggOA9g1o0gIxvTVIfbVwJSV0hqO
         Nj4Q==
X-Gm-Message-State: APjAAAUPPKIsCgp6iAfsszOy9JzQpV9cps4XY3nJyUti9RqsBJyHfhaI
        1rRdd4in4mB3jpqmtgyQdDbPtM82Zrq4grOiIRmRaA==
X-Google-Smtp-Source: APXvYqxU/gsQDQg+UNwUJ5SeGezCQPaVBedec32xSUzB+8OIBESUkr8UHH8x2mW1oxPqPqmPbBDRtHMDadQ8H2wzpYo=
X-Received: by 2002:a67:d592:: with SMTP id m18mr20877265vsj.85.1576491557076;
 Mon, 16 Dec 2019 02:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdaxTMPNcRMkKxJ9y3W8x7pwwnNaG+=Tc0P+-3ZzpnFmww@mail.gmail.com> <20191213144431.GV32742@smile.fi.intel.com>
In-Reply-To: <20191213144431.GV32742@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 11:19:06 +0100
Message-ID: <CACRpkdZxRhF1gc0XvA23P=aTiq-a-WNF=ZMnw29eR46J2PGnUA@mail.gmail.com>
Subject: Re: [PATCH v2 00/24] pinctrl: intel: Move Lynxpoint to pin control umbrella
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 13, 2019 at 3:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> > If you want to make my life simple could you do this:
>
> I want, though I think above makes it harder. I'll not expecting any patches
> against gpio-lynxpoint.c (and if they will be an author should Cc me anyway).
> Besides the series nicely grouped on top of prerequisites which are solely
> Intel pin control (no need for GPIO). Thus I prefer to send simple 1 PR during
> this cycle to pin control subsystem and that's it.

Fair enough, if you are convinced that will work then go ahead.

Yours,
Linus Walleij
