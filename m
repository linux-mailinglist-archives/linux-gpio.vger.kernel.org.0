Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6739E2D8BEE
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 07:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729131AbgLMGFK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 01:05:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:51870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726369AbgLMGFJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 13 Dec 2020 01:05:09 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607839469;
        bh=LCpwKqKHTHHHvvyHULcS2y/ZP4zP3djjGqSTEFIFQjw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IGtnnN11+DiOFmkQQeuT41MCzHczfjD/A9JZU5jEqOaFskVIKj8Y3TUGl9YqqqbGI
         q6CrHvEphxiBt5Y4FmQwAmlIdouEB24LC1bmtASRhEBhCikcXFDLX8BaK6acgYI84F
         CLtGY8OB61UASBG0zzUwYVwaP6YpO2Kj5msfNd0EuHukWD56HM7oPTKVE+Bp4/OkO0
         1g8n2GnKyoLEDnof8YQlMXrhar7xwS+OYe7Gryj9sVj0LZ/kcsyE0WT2lApahYk5s1
         yN2b9sSdnfMpObT+MYjLeY7fFvlunir8BUFZtV98tz1V9sp32T/EQ3pqQ16Z26JHGz
         N+koZn4OfqlGA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201210140313.258739-1-damien.lemoal@wdc.com>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
Subject: Re: [PATCH v8 00/22] RISC-V Kendryte K210 support improvements
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sean Anderson <seanga2@gmail.com>
To:     Damien Le Moal <damien.lemoal@wdc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date:   Sat, 12 Dec 2020 22:04:27 -0800
Message-ID: <160783946780.1580929.13355022541956430021@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Damien Le Moal (2020-12-10 06:02:51)
>=20
> Finally the last two patches updates the k210 nommu defconfig to include
> the newly implemented drivers and provide a new default configuration
> file enabling SD card support.
>=20
> A lot of the work on the device tree and on the K210 drivers come from
> the work by Sean Anderson for the U-Boot project support of the K210
> SoC. Sean also helped with debugging many aspects of this series.
>=20
> A tree with all patches applied is available here:
> https://github.com/damien-lemoal/linux, k210-sysctl-v20 branch.
> A demonstration of this series used on a SiPeed MAIX Dock
> board together with an I2C servo controller can be seen here:
> https://damien-lemoal.github.io/linux-robot-arm/#example
>=20
> This tree was used to build userspace busybox environment image that is
> then copied onto an SD card formatted with ext2:
> https://github.com/damien-lemoal/buildroot
> Of note is that running this userspace environment requires a revert of
> commit 2217b982624680d19a80ebb4600d05c8586c4f96 introduced during the
> 5.9 development cycle. Without this revert, execution of the init
> process fails. A problem with the riscv port of elf2flt is suspected but
> not confirmed. I am now starting to investigate this problem.
>=20
> Reviews and comments are as always much welcome.

What's the merge plan for this series? I'd like to apply the clk patches
but they're combined with the sysctl driver so I guess I can't?
