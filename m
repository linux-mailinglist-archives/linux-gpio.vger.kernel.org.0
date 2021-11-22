Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 198DF45875B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 01:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhKVANq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 19:13:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbhKVANq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Nov 2021 19:13:46 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F05CC061574
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 16:10:40 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so26235317otk.13
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 16:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=itzPiyOgtwsApCWUtmGzmfb+3exHBeHsKo0mabwAzHo=;
        b=sGNbuwIFxxxiYf4vICXo0JohlsFX4Ug5oEbgOKs45fI0Nr0XTJwMKcRcIW/1bke/4D
         RCGl9cHG8hQ16cLr58JION0avoAZ5lC2A0/Y7p4Wy71JmTJSCTiNlrZlYALfe7G/izIt
         ub6ksrsuHzheiBUGMUbcj0r34oekULXINmRXZb5L9+XZ3C0XmsrFSOsxuOrQ5auP3HH5
         gj1kZjGqC8JsWceQ6NnHNMcx/zJZL2PKfEo0fA7a05yRSGH9ooVPtDGw+hLT4YOQM9bw
         +EiBox0Xb+YgOWp07pPhFlzgEGWI9Q/bI20OsHhp2jNWTpeMdU8OVAfYINW9c2NAat2v
         HIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=itzPiyOgtwsApCWUtmGzmfb+3exHBeHsKo0mabwAzHo=;
        b=ntyvOIdpQEv9shTs8mmGXOhdLF7wDDr7IOGZiJel35J/+w1EHiMWveVtCgpD3g5d3t
         99JTLeK+JNtLWfVdSw6kMGVCg1w2rGCjAFUzrzrmmohY4Lt5bQphlK/HsQEkDG1qnf6n
         mhKw7A7FPWzShVmeEDa2DL/4ZDNC9XwZPr8dhTe6gCKl+Y9SlE0dwzIlNAPZTXHaZBzf
         FbZbkQ+4cmeaHjln0O+OSVmliopQIZUEs67XvFzA3MP95j4COvLjRZrakv0KvHGn1LrY
         xtblitllU+ieOruFmZ2eVM9YgInQziUePSluVMlkpJoIHHqPJD/I3EkM6UI+llu1y3F8
         iTfg==
X-Gm-Message-State: AOAM530lsoHsYlRXhPFEtRdVNNaLq7IqBo7DL4P2jekD9xUTNEqjXv8x
        p0ooPuM+ySTlVHi3/0GTuxyyNlgQwj11NGzEwZCFpw==
X-Google-Smtp-Source: ABdhPJx9K34+LZtEz9/UZTq7FZv2CgQWc6APcyvIolJzgg1X3calef7ZvKSzVC84L5AZdd6QhHrmSAVqzzMNVRO1qBM=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr21631107otg.179.1637539839852;
 Sun, 21 Nov 2021 16:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20211109113239.93493-1-robert.marko@sartura.hr> <20211109113239.93493-2-robert.marko@sartura.hr>
In-Reply-To: <20211109113239.93493-2-robert.marko@sartura.hr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 01:10:28 +0100
Message-ID: <CACRpkdZ=K9A=jmWFtKYGdH0VFxYgfOK9t1ubx0mzJY9=S7B0VQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] gpio: Add Delta TN48M CPLD GPIO driver
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        andy.shevchenko@gmail.com, michael@walle.cc, andrew@lunn.ch,
        luka.perkov@sartura.hr, bruno.banelli@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 9, 2021 at 12:32 PM Robert Marko <robert.marko@sartura.hr> wrote:

> Delta TN48M switch has an onboard Lattice CPLD that is used as a GPIO
> expander.
>
> The CPLD provides 12 pins in total on the TN48M, but on more advanced
> switch models it provides up to 192 pins, so the driver is extendable
> to support more switches.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> ---
> Changes in v9:
> * Use {} instead of {0} for initialising the regmap config per Andys
> comment
> * Fix spelling mistake in KConfig

That's a nice compact and small driver. Using GPIO_REGMAP makes
it a bliss.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
