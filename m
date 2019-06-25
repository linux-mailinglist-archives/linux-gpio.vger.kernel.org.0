Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB21550F3
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 15:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbfFYN53 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 09:57:29 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37242 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfFYN53 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 09:57:29 -0400
Received: by mail-lf1-f65.google.com with SMTP id d11so12723874lfb.4
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 06:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uTW1RTzufVVCLIfnh+7h6hW+A8p2OrQGWdWYeH+4NGc=;
        b=rD0m+cdPPd//2jtOKnRrGA+yNzIqtS2OrqhFqNvI9BwnBTByDXePb2d3VmLU2Jsp2b
         Oydu3kFeAuwXsLOTos5YOl2x5uYhXgslRKqRtNLsVCKqeXMHqkFg2ymZljatvVr6VYlA
         O0tiN6MFwgHkc8Q/ZYT/7xhM6QsmCfMQ8+TvCfARZfEtL92HD+7UYauRjumeafw5xCsk
         BZExa7hD1Zs1iEwk2uLNjmROHkuq7YMAp1FA+V8VgxqVdo+xk38mlwJEz72Xnk7ppxBr
         +0cinfadSpALzcrTBdhVj0HVufS77V7TugkgzF4l2XAZenupQ1QYRRNAyk/hiuknm6eP
         3NNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uTW1RTzufVVCLIfnh+7h6hW+A8p2OrQGWdWYeH+4NGc=;
        b=rgcgrbcb/Y0VJofvGL2d6fRYMQZr6KUOZiOAEJycxtrKRxI0y2v987f5KtSQJBpkLF
         HFYOzIO/JioQmOfM/Pbz3YVwW0z2HfSSf/V+0802Yny7E7MuYuHeCtyB85RunrpVpbJF
         IAVofsplaqO4Ii8ixz66qHiwZngBuSrTfjlPQxAnMJcX65lkNYXyxjhGrNfG62DtMqmJ
         mJ6Z0uyzeTSVOaxcpV5LxG2n29SkD4ayfTseEpnpIKPWwSkDYu7UPKhcKclf84QutMZR
         C7mCmLUr24H32850xihkMhKEerKzXzE+9yiFuTlxlIderBAkiGnrLkdPzhVEt4ivcLiD
         a6rg==
X-Gm-Message-State: APjAAAXqL3XYHW1fbvBGBlldrUPRBqmX87KS1Ijegfbj0ghOg7RBNpEE
        yEPICMB0fgPh+x9pDSKwqqZMqsb8akYdlZJ7JfxV8w==
X-Google-Smtp-Source: APXvYqwtMnHq1yBBhWHpEFgSyvvNlRPOWrNyzfQxiPn5jAkCYYNbYam/5KODrrng0KafhfQTzullbXmVYSc52G3PQ3I=
X-Received: by 2002:a19:7616:: with SMTP id c22mr25238102lff.115.1561471047372;
 Tue, 25 Jun 2019 06:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190623043801.14040-1-icenowy@aosc.io> <20190623043801.14040-2-icenowy@aosc.io>
 <20190624124019.o6acnnkjikekshl5@flea>
In-Reply-To: <20190624124019.o6acnnkjikekshl5@flea>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 15:57:15 +0200
Message-ID: <CACRpkdaQSg4qWWF1XurWA8wnW+ezGtTympVT9DvkF87VKEQVzw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] pinctrl: sunxi: v3s: introduce support for V3
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 24, 2019 at 2:40 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> On Sun, Jun 23, 2019 at 12:37:53PM +0800, Icenowy Zheng wrote:
> > Introduce the GPIO pins that is only available on V3 (not on V3s) to the
> > V3s pinctrl driver.
> >
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > ---
> > Changes in v3:
> > - Fixed code alignment.
> > - Fixed LVDS function number.

> > -               SUNXI_FUNCTION(0x2, "uart2"),         /* TX */
> > -               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),  /* PB_EINT0 */
> > +               SUNXI_FUNCTION(0x2, "uart2"),                 /* TX */
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),          /* PB_EINT0 */
>
> I'm not sure why all that churn is needed.
>
> Looks good otherwise.

Should I apply the patch or wait for a new version without the
whitespace fixes?

Yours,
Linus Walleij
