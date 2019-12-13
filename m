Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C009911DF9A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 09:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfLMImX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 03:42:23 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33087 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfLMImX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 03:42:23 -0500
Received: by mail-lf1-f67.google.com with SMTP id n25so1363683lfl.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 00:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+3AGyagak+SsQwMgJI8DqZjJRt+2sRcK1YdTOf2bFE8=;
        b=a+daNgiQiCYJ8MM6UhnHVrWdoGUXOn3GJH0VpgdC9SpDGXCOkLoPmTrlEqRvbWJSWy
         scJgeIUaLdduo9o91tDrNbzuthgAPOM+aFslD2C8TAcTn1tMXB+WFmtOrTcyb+iujSMm
         7oUPcMGhQBLpN99Q5fopI9AB5FHtDFFgTs4hShQap/ML5xXW3jaBZ0I1lvhSAhM1jDPv
         ujjyEpNoH383Drw+a2PgfQ3Yo6URBxeqlRWSJygP0NQJUkP0r2uCOw88AmCK3y5gPvfc
         4JPfg+gDEUV27h+riy/0uIHzNAKSe1b2pC1GVrN+eAOOp5FrGij5sffNU2QagZHee+tA
         xU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+3AGyagak+SsQwMgJI8DqZjJRt+2sRcK1YdTOf2bFE8=;
        b=SDEFuCF+NjSv8yftxpfDmyvmOxcPhLAHGtWCVMmKxv753Onp4uecrObMvGxnQTqy3U
         j5Kt4AMCDFmCkBS9QKSEo5dJ/sxMLdYl4YFqoD1Zvbt2Ih3Xai/gs2V/9MTommsJWFK7
         D/B5YlVzkOBY2DzbWHziSYKxFYUJHwlT/TzC5aXG5QJ7mgpMV59/lq72BUUcjSSY63x5
         /6g2txOJrAuFhU2TO7G9WDgfZkdoMZRhU/I0IHDOvA3icS0O8vcMuEthqlQqI39hVRvt
         Jq2e7TycHusmD2UfJIZcJ0QCmrhUlQxSkcBAIVZQ5YxVHYeD7eK9RgCnzkaKsoeFgvg1
         3O4w==
X-Gm-Message-State: APjAAAXcKC2AHLr1NJDtGQ8WyrqerCHsDBni55jfhCg+hgo/7wgwRqQg
        /BxYJhx4OCXS8wFjdZ5U6xgtI6axCjLjCmlE5qgtWJsG6WU=
X-Google-Smtp-Source: APXvYqz79bn/tRSB6q2MlLzPdVGXKAD3lMBgrE6UtCaOD5iDixhhmHkxpkSan8geCglyFBt3hCB+ZaEC8V1y5zn49yA=
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr8062235lfp.133.1576226541430;
 Fri, 13 Dec 2019 00:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20191202061432.3996-1-andrew@aj.id.au>
In-Reply-To: <20191202061432.3996-1-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 09:42:10 +0100
Message-ID: <CACRpkdZVdP+rfnhF8Dfk+jLsqTEvm_tqv6to2s4nnJh8diaM+A@mail.gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: aspeed-g6: USB and pinconf support
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 2, 2019 at 7:12 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> This series adds USB and pinconf support to the AST2600 pincontrol driver. The
> patches have largely been developed by Johnny Huang from ASPEED and have been
> used for bringup and verification of the chip. The were developed around the
> time of the 5.4 merge window but I got distracted for a while and haven't had
> an opportunity to send them until now. They've had a run in the OpenBMC kernel
> tree and so shouldn't cause any issues, but given where we are for 5.5 I'm just
> getting them in early for 5.6 so we don't miss another release.

All 7 patches applied!

Yours,
Linus Walleij
