Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9BAB3A001
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2019 15:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbfFHNqR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Jun 2019 09:46:17 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39608 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfFHNqQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Jun 2019 09:46:16 -0400
Received: by mail-lf1-f67.google.com with SMTP id p24so3641620lfo.6
        for <linux-gpio@vger.kernel.org>; Sat, 08 Jun 2019 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ofYgsLuXZbDJJLvQ3kbbwDxmKxUMJavDmJ4aftucJL8=;
        b=ReCVugjebDcRYbz6018VpCGuLxRUxhWI6kszCBIeM05m2Ai0dpqgIgBhHJdZVP7z34
         b6T5XZZTTnqz3Gr0grQg/WNRaOg6CiCw4G3CLkdNbJUnhaFdL1i/ph9Rmu9PKqHEpqIb
         6ssomMVUhSIsgtG2ibv56iLmlAP4Smp/Z2Q8c2FruUNYnB4KSMn47+xRr4AQ4EUg+8H3
         kWC+t+2Sl4s/5jMBFBVsslhhMkE1ke0lykA3ar4KwEmW+i9ud5DA3lxqX3gyRZRpijuf
         ExSNh26nnQBYk4YDyUrwcEYyvczcGTN5b8YkKRGj/71pb8FNpd4ZPnFpVFRVBizN+NCe
         U0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ofYgsLuXZbDJJLvQ3kbbwDxmKxUMJavDmJ4aftucJL8=;
        b=NDT5z76/gs8ml6Q0SuMomLiZO1i82NriOTE+DzXbIglhGcZ15YaQTzF8vQ273GDliR
         xAC7J7e6T3zMJDMpNif80RNCLkiFAVpwpTOm1CizlPu3cH+XDy3Zrpxinn6UmpW8OfRk
         3IRIYlQZ8ihxhL4i7ihPZMPZQrguk1qL963GBhUwO8JcXmIiXYRBmY6i69AcZLqgK5WU
         JViEbCs7t62tQeZyiuLr5qm9p9UMswBp+DHXK275NqK3Feq0Nb107D6mq6KUISxkPPNn
         3SLOS7hA5UTI6b7IkiEVuC6ovls/5CfVIyE9zUmEgU3yZfYr/jQmfaxtomYjup9ty1Wv
         F9hQ==
X-Gm-Message-State: APjAAAXnpXz5FnhWfBLBmeJO9HAXyw2eGhoJlrI1PurhClULtCKJrxPB
        AoIx2ugUeUYI96jMwhR5MN5XLv+4/4WzBiC0hcHLOQ==
X-Google-Smtp-Source: APXvYqxR1+S7TpAKcaY19xGekrYcikcKLF1619Fhs6N1/cnEP8mkGyTqpUIypegiC3N1+wkqjCRw66N49sxpNwPAg/A=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr16104016lfm.61.1560001575166;
 Sat, 08 Jun 2019 06:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190603230604.30938-1-linus.walleij@linaro.org> <22282873.PltXLBtAh5@pcbe13614>
In-Reply-To: <22282873.PltXLBtAh5@pcbe13614>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 15:46:07 +0200
Message-ID: <CACRpkdaCFZcQ8VMjKJkXAm+TRH+=DY3j5Udh0mcYR7YcDr8VtA@mail.gmail.com>
Subject: Re: [PATCH] RFC: fmc: Try to convert to GPIO descriptors
To:     Federico Vaga <federico.vaga@cern.ch>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pat Riehecky <riehecky@fnal.gov>,
        Alessandro Rubini <rubini@gnudd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 4, 2019 at 8:42 AM Federico Vaga <federico.vaga@cern.ch> wrote:

> I take this occasion to renovate my proposal
> https://lkml.org/lkml/2018/10/29/534

Hm, it looks from your proposal like the FMC device core
is using its own hacks for i2c mastering, FPGA management
and irqchips. Does it also have its own GPIO implementation
not using struct gpio_chip from <linux/gpio/driver.h>?

In that case my first step should rather be to remove the
reference to <linux/gpio.h> because then FMC is not really
using the GPIO subsystem.

As for the proposal so remove it, I'd like to hear what
Alessandro says. If there is consensus on deleting this
I can queue something up and send it to Torvalds, but
I need consent from everyone who cares.

Yours,
Linus Walleij
