Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCBC48986E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 10:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfHLIH6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 04:07:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:47554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726405AbfHLIH5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Aug 2019 04:07:57 -0400
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62E70206C2;
        Mon, 12 Aug 2019 08:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565597276;
        bh=rfwD66AedIpA/3YE2dWFn8YCpnEehefOryrXd0y6bio=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TH581SWmFX5Vu6WBmaibZ4b8HqpSesdZ9B8gRjIiM+ftqFvUWyIG4J9oD/o8xDBaZ
         4EOPkWYiJUWIBlolpVAenfFXazLeuyXQ4Owqj3+RBAyWEqHZvQyniCnt3m88lmuzbd
         tnmIHtFxQyKlmk+kt7gW0A7xtcnNrGAQZcF73pBo=
Date:   Mon, 12 Aug 2019 10:07:54 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v5 0/6] Support for Allwinner V3/S3L and Sochip S3
Message-ID: <20190812080754.n7dgogopm3ytd6h5@flea>
References: <20190728031227.49140-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="he4xln2tfu7hadbz"
Content-Disposition: inline
In-Reply-To: <20190728031227.49140-1-icenowy@aosc.io>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--he4xln2tfu7hadbz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 28, 2019 at 11:12:21AM +0800, Icenowy Zheng wrote:
> This patchset tries to add support for Allwinner V3/S3L and Sochip S3.
>
> Allwinner V3/V3s/S3L and Sochip S3 share the same die, but with
> different package. V3 is BGA w/o co-packaged DDR, V3s is QFP w/ DDR2,
> S3L is BGA w/ DDR2 and S3 is BGA w/ DDR3. (S3 and S3L is compatible
> for pinout, but because of different DDR, DDR voltage is different
> between the two variants). Because of the pin count of V3s is
> restricted due to the package, some pins are not bound on V3s, but
> they're bound on V3/S3/S3L.
>
> Currently the kernel is only prepared for the features available on V3s.
> This patchset adds the features missing on V3s for using them on
> V3/S3/S3L, and add bindings for V3/S3/S3L. It also adds a S3 SoM by
> Sipeed, called Lichee Zero Plus.
>
> Icenowy Zheng (6):
>   pinctrl: sunxi: v3s: introduce support for V3
>   clk: sunxi-ng: v3s: add missing clock slices for MMC2 module clocks
>   clk: sunxi-ng: v3s: add Allwinner V3 support
>   ARM: sunxi: dts: s3/s3l/v3: add DTSI files for S3/S3L/V3 SoCs
>   dt-bindings: arm: sunxi: add binding for Lichee Zero Plus core board
>   ARM: dts: sun8i: s3: add devicetree for Lichee zero plus w/ S3

Applied the patches 2 to 6, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--he4xln2tfu7hadbz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVEeWgAKCRDj7w1vZxhR
xc1HAQC4pz8qSqTprqKaHx4vMzq28Cpy8SSZNQyYzojW9ba9VQEAuyb7C8zQZ1Qn
xIEmEbly3ZpRq6N6RP/EFwfX+rg2HgM=
=3RxS
-----END PGP SIGNATURE-----

--he4xln2tfu7hadbz--
