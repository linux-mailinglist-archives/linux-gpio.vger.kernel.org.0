Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3901ABA54
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 09:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439430AbgDPHvz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 03:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2439757AbgDPHvu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 03:51:50 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AFCBC061A10
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 00:51:50 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id j3so6295367ljg.8
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 00:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=loMCxNASFvkfTDCyeUmtP2u+gte7x5OtiG/cQmRKcuQ=;
        b=xMUW3PGeSrw4ARkL9VDfzWDbSGxC6xcX4Ki7j9FBIb94zY/nyX3c8swn8+2K2eXQWf
         u5I0kwTaOMKF60tm8Ybb4RI83J/5chP+BKkJGzpCt4Njp+d5eKgO+RHGsvNhseRCUr0A
         kxzkYeOwrVdKr3ln53f3UvwS5CL7sp7ao9UeUyT58VwwdOmE7hQ8XnRCvvbD0t3FKapJ
         oJRfgQsGirpJkwaZ7IV8kGn4+8QNBvxXn8FYrLA5QKLO3da7dEJHYdfloWOUGYngvefF
         kPv4d618uycUv1TdFu4hKJ4ZeXV264Nmr2hjONIdx1CDO9GlIQy4qphT6PWNZXnRrTaf
         KZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=loMCxNASFvkfTDCyeUmtP2u+gte7x5OtiG/cQmRKcuQ=;
        b=QeZA1ZTZJ1ou1JRh0c7R9tayExS3Oz8z6CEIlvWCjIV3VEhBFH0KN+n4Qce9fVtNhz
         buy/kN8W5H+7hlELBwNh2JtokOCieab9DIm48oiJDhOUgOVy9Gn33KXq1WpcH4/KBwbq
         GFSpj455Cp0xfH0vtZkRfOLRES1AMctazGK4dAiI9rzWLaZ7OZF7xpYJyuVfVtLgsI5h
         QczWnNHlG4I1WFsJBh1VrS0gPnrH9sXnU/uZEZaCeb9Y7svz04gDb6rToKyJqvvQ69w5
         f6BB7bInkXLSug9ou1dCX9xnP1xkCmuqRac4g5i1e1ULJji144PqnwuVDZVwCYYrB4IJ
         cntA==
X-Gm-Message-State: AGi0PuYWnEkT7ef448Yu4VnH/tQxW5qHIxspf6RHgGyqxGn0uvB+6dK3
        O3TmbVtSBm1c5mOprynnyileXD+Ltpk4XUKIhwscrg==
X-Google-Smtp-Source: APiQypJ3hmhHjH4xlCLoz3/xbW/q0EWD5I/m1MGIq4yanefRacOTieYBUa0MrvrxoWyMyTHM8e3D7N8MbRBPt6Mds40=
X-Received: by 2002:a05:651c:32e:: with SMTP id b14mr731003ljp.277.1587023508445;
 Thu, 16 Apr 2020 00:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200329104549.GX25745@shell.armlinux.org.uk>
In-Reply-To: <20200329104549.GX25745@shell.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 09:51:37 +0200
Message-ID: <CACRpkdaL4-Z36aKOVW4o2MtCG9fbqm4gxZN3QjejVRPBZrzxxA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] PWM fan support on Clearfog gt8k
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-pwm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Mar 29, 2020 at 12:46 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:

> This series adds support for the fan PWM output on the Clearfog GT8K
> platform, and can potentially be extended to the Macchiatobin.

The gpio changes all look fine to me +/- fixes for review comments.

Could the MVEBU maintainers provide some feedback?
Curiously the file is only listed as a PWM driver in MAINTAINERS
so formally Thierry & Uwe review it (and Uwe did), but surely
the MVEBU platform maintainers should take a look too.

Yours,
Linus Walleij
