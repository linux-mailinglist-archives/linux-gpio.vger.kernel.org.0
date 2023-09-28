Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 528217B1CDC
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 14:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232547AbjI1MrK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 08:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232574AbjI1MrJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 08:47:09 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 308B6191
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 05:47:08 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CBFC433C7;
        Thu, 28 Sep 2023 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695905227;
        bh=ZojkhVyYvjOakBy/EstOH1IibvwQIUhtEQYi7Jm6Uxg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BLGAhnFBbY1GdJsJjoae7P5CsecMYfOFJpPo2TtoyI6Pzj0N4ZliVLS3+JUh/3niY
         P0vKtoSbnIBZgrAIe9+SkItxISCEPiqPa9NveBevZZJAphkxxSxDJAPXJvs9ty+YxZ
         xpZXM/hfLLlhe93p4ujvwFUBxv8yNcu3aWFTsj9zkDnIeazYLGvCBM07n+PipWgk3i
         bmoI6pEfvL18yak+DGgEGTJADo4zHx+fHAmpXUvmzWRKjP/Vc3Glu8dUIAAt/rBeYz
         ErK1BSsggZ904QBvtjU1fFl1Jwth9bC+NBbm7Lj8KbXjnfgFMA/VOf2vpbrQ9j+SVb
         frrY94zQfXYxA==
Date:   Thu, 28 Sep 2023 14:47:05 +0200
From:   Mark Brown <broonie@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Heiko Stuebner <heiko@sntech.de>, alsa-devel@alsa-project.org,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/4] ASoC: rockchip: Convert RK3288 HDMI to GPIO
 descriptors
Message-ID: <ZRV1yYs/xOXjlJ79@finisterre.sirena.org.uk>
References: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
 <20230928-descriptors-asoc-rockchip-v1-1-a142a42d4787@linaro.org>
 <9199562c-65ac-d8b1-20bd-429a32ede6c9@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6/w6Gx2e/XY3z/8g"
Content-Disposition: inline
In-Reply-To: <9199562c-65ac-d8b1-20bd-429a32ede6c9@arm.com>
X-Cookie: Save energy:  Drive a smaller shell.
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--6/w6Gx2e/XY3z/8g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 28, 2023 at 01:34:56PM +0100, Robin Murphy wrote:
> On 27/09/2023 11:47 pm, Linus Walleij wrote:

> > - As the probe() code is very insistent on getting valid
> >    GPIOs out of the device before it will continue, there
> >    is no point to carry all the code handling the GPIOs as
> >    optional, drop all these checks.

> Isn't it allowing them to be optional as long as of_get_named_gpio() returns
> -ENODEV (which I guess may come out of the chip->of_xlate callback)? Or is
> it implied that that's never actually been able to happen?

Right, I *think* it's just trying to open code optional GPIO support
(possibly it predates the core helpers?).

--6/w6Gx2e/XY3z/8g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUVdcgACgkQJNaLcl1U
h9DbSgf/bknMA1yTgPBPmmYPOHEHbjEGSeEmCX+Jh1W3Rrr6qLA0okNqn7DqGgKo
9jtRrzKcEIEgFMq7vhkyUtCLieHFdK0XBufLw/Eob4dNcQ53OTxxJI7n/o7iDlv4
LcAUFF3qzHFEd0HwA99vTPEnpUoL9duZgWiiWBY/iZ8/F76QUG5ED4H/3b2PlbZb
krLL1pRMD3gm7ToaaYcZnaCfH7MW+/VIlGmftGJa0uaS+f+VnLo1wqHX6NZTjqM7
DsI2KVG6SkdZZcxPgs8SvMZHMJ6R/6zrdlfTbUjXNZnWkj9MwHSlF2bsJzg4AcD1
FjQR7HVyTsaezL54ftcdpuOWMMmCwg==
=OfPk
-----END PGP SIGNATURE-----

--6/w6Gx2e/XY3z/8g--
