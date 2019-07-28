Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF6A78249
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 01:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbfG1XOv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 19:14:51 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38253 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbfG1XOu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 19:14:50 -0400
Received: by mail-lj1-f193.google.com with SMTP id r9so56696569ljg.5
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 16:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uqbaLb+DoYfmkQkeju/D4dfpefzvGhqE/NA7IyXYHDs=;
        b=mecH4VhtykhjOehOVm7m8Pa5YP6LbhZHxuLFQA2XocGjWKuVwaUD5JKujEe9aVixYW
         cawoMpzpCuo6PsH/Y5+Y7tXwV3d7SoDRDfjjcoukQScCk9CzzHAMPo1pS4yrzvyXmqyJ
         2yMjXxSUUQvzemHru0Os3ufWRvyApCPQMYjePIqEYdIr8dqIpeHbncxd/W99X2KbFg2j
         jbwANzOROhAvP10F0iLcxqbviHMgDbZ6aAMO7bHOLzMbrE+YgCLY6qUQqtoboNujm0Gj
         U73hnvjkMlVYKlUDbpdLF67Z+MpbkHJo3vfCQ+e8YPRfhiYgmC3LZ5+TDpH4eiTfU3zX
         7Iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uqbaLb+DoYfmkQkeju/D4dfpefzvGhqE/NA7IyXYHDs=;
        b=Wba50EMxdxHt1yGT2u3T6P4EQyYuXezbwdmG2P0O2VmYee4u05VQD5DItSZH+4PI8q
         +iyJD7JRrT4vJZY5XUJbs+ULTErN2nY7zoE9yVDpytjWFaXmWDpob6j4Mm0rgLoa84bu
         d8SnltylIdCAndn/rR5a3b74+kiMIwt2UNHC2Lnpk1BK/EqI6hKgxTVPGZEDiQL+zciV
         xj3kTYrJU+cPsTUoW+L+Q5rDh8KIr6lLPrPfLYifci0iQdpWnj1azjG23RenxR5noHSH
         WHMSI7U/lI0WT60d1GYtZL1JDuvpfVJY2EF/rLCB/cB4QES0HM57gvgxwNiTV3hdTgD/
         VHzw==
X-Gm-Message-State: APjAAAXCE8a+FGioY9VmRiXrZZHc59wjXX1gsufSZWlOgTRTGLuMmaVa
        H0MhmESIudOGMY1sEz3bzsDpgQNbAEPjecUPl15i3g==
X-Google-Smtp-Source: APXvYqxZn/ye7KzmbCXTelv16sXPVMTT2jnKOOv6eVhlkoDzFB17aRJoEaL7U1kzdaeMP7q7K+fcGcM99btdobKE65w=
X-Received: by 2002:a2e:9593:: with SMTP id w19mr8822011ljh.69.1564355688739;
 Sun, 28 Jul 2019 16:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190711041942.23202-1-andrew@aj.id.au>
In-Reply-To: <20190711041942.23202-1-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 01:14:37 +0200
Message-ID: <CACRpkdb4pEdPHbo=3+fJXe9WG8K7A2_xVMtKWCJCfEawDO5wBw@mail.gmail.com>
Subject: Re: [PATCH 0/6] pinctrl: aspeed: Add AST2600 pinmux support
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>, ryanchen.aspeed@gmail.com,
        johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 11, 2019 at 6:19 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> This series adds pinmux support for the AST2600. Some more rework was required
> on top of the previous cleanup series, but this rework was focussed on
> supporting features of the AST2600 pinmux rather than fixing issues with the
> existing infrastructure for the ASPEED drivers. Due to the dependences it's
> based on top of pinctrl/devel, so should avoid any more SPDX issues.
>
> ASPEED have been testing the patches on hardware, so even for an initial pass
> there's some confidence in the implementation.

I'm unsure if I need to wait for the DT bindings to be fixed on this
series?

Yours,
Linus Walleij
