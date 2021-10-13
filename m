Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D13042C8DA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 20:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbhJMSlu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 14:41:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:36210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229814AbhJMSlt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Oct 2021 14:41:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 464F7610CE;
        Wed, 13 Oct 2021 18:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634150386;
        bh=MYmDHzJwPEJExLNeuOeTzwZwoQrh0px0zzcEL82qFSI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=aJIk7eMpMBRaG0bBdQfELLWRZ6Ukw1HNhei7KJ/CMaWjMZjuKdi4T0Tx/gPR+2Zrs
         yO4yOyNBvJnHUsaMkmHKxygt/0OEbGGgx3hsaf7DIDm+/j8JnoOum1wKdUw5E2jukO
         iRrRyWH+dtcGKkzC4l/slVj3ivX2GvpFT5SP2b52qB8fzpEbg7hf+7oYyjAT2JULPe
         ujetj2YMxC7FAL4syv1LbNL5hcbbWQ9QLS5eh4h2X6qDajL0E0THAapaLCS7ArVyyt
         PJ94Yio6uEao94UXFMfWcbEfor5X8zjyT/dwdlAS4pVg1nxzbyhnuIZCQ85raJ3nJh
         pM6oy5hIu+xpQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211012134027.684712-5-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-5-kernel@esmil.dk>
Subject: Re: [PATCH v1 04/16] dt-bindings: clock: starfive: Add JH7100 clock definitions
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org
To:     Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Date:   Wed, 13 Oct 2021 11:39:44 -0700
Message-ID: <163415038497.936110.9558001474390705865@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Emil Renner Berthing (2021-10-12 06:40:15)
> From: Geert Uytterhoeven <geert@linux-m68k.org>
>=20
> Add all clock outputs for the StarFive JH7100 clock generator.
>=20
> Based on work by Ahmad Fatoum for Barebox, with "JH7100_" prefixes added
> to all definitions.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

You need to add your Signed-off-by here.
