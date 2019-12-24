Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9AE7129E45
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2019 07:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbfLXGyQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Dec 2019 01:54:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:38866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726043AbfLXGyP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Dec 2019 01:54:15 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D09B620706;
        Tue, 24 Dec 2019 06:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577170454;
        bh=ZKiiDeIHEimT5RF49wdxk08CEo4aIHjAHjFkXzaey7Y=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=XD/RA8iIKhhmqKRAYapiwrONvPCq/s/0rct5T1yVgKpw15dEQr4ILYfgyPZaPBQ0N
         w2MGva0yTs/pjiEyEbMOCYXAOeYP9ZSfev1N/rA9WOhHHH8pu1G0qouZQNUj/1P3n+
         kW+SQz5bkTrNMQWF30Q6IHU4RMWGk3jkJcoRpSX8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4907f35240ae77bba4a27fd32f1e586e00cd434d.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com> <4907f35240ae77bba4a27fd32f1e586e00cd434d.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Subject: Re: [PATCH v7 07/12] clk: bd718x7: Support ROHM BD71828 clk block
User-Agent: alot/0.8.1
Date:   Mon, 23 Dec 2019 22:54:14 -0800
Message-Id: <20191224065414.D09B620706@mail.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Matti Vaittinen (2019-12-19 01:52:13)
> BD71828GW is a single-chip power management IC for battery-powered portab=
le
> devices. Add support for controlling BD71828 clk using bd718x7 driver.
>=20
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

I guess we can't win and break the build dependency on the "generic"
header file :/

