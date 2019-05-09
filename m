Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B65BE19571
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2019 00:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfEIWxj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 18:53:39 -0400
Received: from anholt.net ([50.246.234.109]:39386 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726219AbfEIWxj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 May 2019 18:53:39 -0400
Received: from localhost (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id C42CF10A34BF;
        Thu,  9 May 2019 15:53:38 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
        by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id KaayIk_7wkA7; Thu,  9 May 2019 15:53:37 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id A64FC10A34BC;
        Thu,  9 May 2019 15:53:37 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
        id 27EFC2FE3AA9; Thu,  9 May 2019 15:53:37 -0700 (PDT)
From:   Eric Anholt <eric@anholt.net>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer\:BROADCOM BCM281XX\/BCM11XXX\/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Doug Berger <opendmb@gmail.com>,
        Matheus Castello <matheus@castello.eng.br>,
        =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
        Lukas Wunner <lukas@wunner.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Al Cooper <alcooperx@gmail.com>,
        "open list\:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list\:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list\:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] pinctrl: bcm: Allow PINCTRL_BCM2835 for ARCH_BRCMSTB
In-Reply-To: <20190509205955.27842-1-f.fainelli@gmail.com>
References: <20190509205955.27842-1-f.fainelli@gmail.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1 (x86_64-pc-linux-gnu)
Date:   Thu, 09 May 2019 15:53:36 -0700
Message-ID: <87woizqlxr.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=-=-=
Content-Type: text/plain

Florian Fainelli <f.fainelli@gmail.com> writes:

> Hi Linus,
>
> This patch series allows making use of the pinctrl-bcm2835 driver on
> ARCH_BRCMSTB where it is also used. Binding document is updated, and
> then the Kconfig language is updated to allow selecting this driver with
> ARCH_BRCMSTB, finally, Al updates the logic to account for the
> additional registers that were added on 7211.

As far as platform maintainer goes, patch 1-2 are:

Reviewed-by: Eric Anholt <eric@anholt.net>

and patch 3 is:

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlzUr3AACgkQtdYpNtH8
nuhpHQ//dM7jTyPUB9eHCYdZerTKDtr+6aY7wKi3KTY3eTJVErru/9skG0qyV1Es
ccQf6Zkj20wnXjucSP9f0zEHCaeybXgx3OKLALE063nuglnvfKhEzDGvzWUb2Xv6
BBlCBf5o9xM5nIhdw1i2bITSNvUXYZy+JFRTVZH59x5h6OBYfaxLFwon7hxFajpQ
1VxFDUEIpltkJuJNp7dXNvC+iIEAv7zWNS5JR05S8h5R7H23c4odUPfWEGkMTFdH
w2+kPoNVT6aZ3u4DT+EFH/SGfhAWwkCX06KBa5/J8G026R/x6VG6lmsohe7sGyrh
HRoozBamxxCixfHI2imHsjwkLWLlEijZeh+HV8iHmTlQcdZnLY6hQ0KxAsVr9dqW
r03BFJ1uHKhFg86kPsVraAVlOhr8riqQnzsrmh/LkmG0eF6WppgLQ1Q2txFvA4/R
WxFXNu0vRRd4X4ICCcllge77E50HM3bhxwmbdp/oouQfyJVMxwVJUzbbDGEKWQ5u
JDYndEouNcbB8+vnRzli8bqu+tkif/wODaqp8THHB4IvpteGcgk2+yCBh0CrYV6f
/WGNhOZFqWHshFL1uVYwPvnlW4VkJPTJ7O8w490kobjnU8CwCTn0rUoe2n45f8Oi
iecWgOgVSl9mjzEL3d81+PmuomYdSwz9vz2LhOkD4oiATkGSbK4=
=HgWt
-----END PGP SIGNATURE-----
--=-=-=--
