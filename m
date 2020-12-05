Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5D362CF9CF
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 06:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgLEFmZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 00:42:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:58698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727444AbgLEFmZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 5 Dec 2020 00:42:25 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607146904;
        bh=1UOM3lyrYNIHNQmUwBpCqtJorNVR7n1hPqtb+XM0tww=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MA1iZSIwjlf5aB6MkgnstF2EhHg1aeaFegQlC4e4IqyTJ8tHBTyJtoEqe3FJfNGNO
         SoMQf7vq05Tx5xLfWgdSSwaD3ApiFcY9gPsK+XuJNoPygGk9Vpf++d8pAQcwyJw+1u
         LmVGJ7d1+A3R5bGrrZ6de9PGw3vEE8rzwzVQJVA/T3gq41guMRt6U2Gd31BEi9CcYo
         DVoue+GnmE1fpqqoTjLy677Z3Pwj1K0bxjdtGFSMlyNHviuxAjU9LZpz77637a2loe
         qjWqNC+dpcfpjacRZ0DU81hayhdA+dd6PJZmMQYTF2skgyLa62kCzoWajT/wx0aS9K
         5YnYBCzJ/X+MQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201202032500.206346-2-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com> <20201202032500.206346-2-damien.lemoal@wdc.com>
Subject: Re: [PATCH v4 01/21] riscv: Fix kernel time_init()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sean Anderson <seanga2@gmail.com>
To:     Damien Le Moal <damien.lemoal@wdc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date:   Fri, 04 Dec 2020 21:41:43 -0800
Message-ID: <160714690354.1580929.8976634034112573437@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Damien Le Moal (2020-12-01 19:24:40)
> If of_clk_init() is not called in time_init(), clock providers defined
> in the system device tree are not initialized, resulting in failures for
> other devices to initialize due to missing clocks.
> Similarly to other architectures and to the default kernel time_init()
> implementation, call of_clk_init() before executing timer_probe() in
> time_init().
>=20
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
