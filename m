Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75E1270810
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 20:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730681AbfGVSBK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 14:01:10 -0400
Received: from anholt.net ([50.246.234.109]:56456 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727466AbfGVSBK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 14:01:10 -0400
Received: from localhost (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id AE02B10A2890;
        Mon, 22 Jul 2019 11:01:09 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
        by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id W4DVnCITH2Nh; Mon, 22 Jul 2019 11:01:08 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id 4A65510A13E4;
        Mon, 22 Jul 2019 11:01:08 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
        id CB4E12FE2547; Mon, 22 Jul 2019 11:01:10 -0700 (PDT)
From:   Eric Anholt <eric@anholt.net>
To:     Stefan Wahren <wahrenst@gmx.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 00/18] ARM: Add minimal Raspberry Pi 4 support
In-Reply-To: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1 (x86_64-pc-linux-gnu)
Date:   Mon, 22 Jul 2019 11:01:10 -0700
Message-ID: <87a7d6eyop.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <wahrenst@gmx.net> writes:

> This series adds minimal support for the new Raspberry Pi 4, so we are able
> to login via debug UART.
>
> Patch 1-5:   Prepare platform and DTS for the new SoC BMC2711
> Patch 6-10:  Enable support for emmc2 on BCM2711
> Patch 11-12: Enable pinctrl for BCM2711
> Patch 13-17: Add Raspberry Pi 4 DTS support
> Patch 18:    Update MAINTAINERS
>
> Unfortunately the Raspberry Pi Foundation didn't released a
> peripheral documentation for the new SoC yet. So we only have a preliminary
> datasheet [1] and reduced schematics [2].
>
> Changes since RFC:
> - change BCM2838 -> BCM2711 as discussed in RFC
> - update MAINTAINERS accordingly
> - drop "spi: bcm2835: enable shared interrupt support" from series
> - squash all pinctrl-bcm2835 changes into one patch
> - introduce SoC specific clock registration as suggested by Florian
> - fix watchdog probing for Raspberry Pi 4
> - convert brcm,bcm2835.txt to json-schema
> - move VC4 node to bcm2835-common.dtsi
> - fallback to legacy pull config for Raspberry Pi 4
> - revert unintended change of mailbox in bcm283x.dtsi
> - add reference for arm64


I gave some comments on the bcm2835-common patch, but I think this is a
good start and would be worth merging to start bringing the board up,
even without a respin.

Series is:

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl01+eYACgkQtdYpNtH8
nuhCnhAAgBRNPAZ35O+bC/XiTCvTUwVxyNmNbtrkztXtBUlmBKrifmsuKEkCbjZb
yMAmwOIMZtwC8HzeH4h4/bTd/l0djswGTPjb5hoko3u0CFfRnZnMgBwyFenfdThc
SCI8/+zNSl8JFnmGKKdARYW2gvm2LySsBYS69YC33IhBCPquSHcBupZ7Y/GJYzt0
KYOGnRglYuUQmJdwBzK/3x9qi4wBaC2wh6X1WRErBrFoY6neodUNT5BAVko4hVXO
aS5Ej5u0Yx+1VNgNx64DfT8S5WRfpy2wmhwujYn04MWt4PcryHKY8HU7T+UW+/tg
PVw+yVnsyC+1ctvmW7qXEDY+41msPKcxUIYMEOskftCKGnM7criZrEp6W8m5dVag
VmlnK/r8JESbAzgBCKE6G0opua0OCGzuOU8GmdFA2eXd6wwwG+uW+SBArjZi7UxF
p2q7YB52eyzNenqn4pYMrmgRFiO2I3Ai4+zHnPM0tWt2pysfW1uG6wqaJlCPiSJj
WbIN9dmcauHFKsiiJs3TUIDkWhEcSA0v95wL3k6ormEn+FtKYFbf90R36lRmK49S
2G70Bd8yGl/kEYAL3+Kb5lBTaqhO8B0uV+M4nN5a73K/LXwQ2kZ/RWsgaQzLPMFa
3C/xv0Ld6qx/gNSWR2bRcV/DydAP1UjfJaidCUE2tnpWJFmQo7U=
=dYeO
-----END PGP SIGNATURE-----
--=-=-=--
