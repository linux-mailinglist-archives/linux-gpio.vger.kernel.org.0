Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45712354ED5
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Apr 2021 10:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244421AbhDFIn1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Apr 2021 04:43:27 -0400
Received: from vm1.sequanux.org ([188.165.36.56]:37027 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232541AbhDFIn0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Apr 2021 04:43:26 -0400
X-Greylist: delayed 443 seconds by postgrey-1.27 at vger.kernel.org; Tue, 06 Apr 2021 04:43:25 EDT
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id 36C031080C7;
        Tue,  6 Apr 2021 10:35:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LuDpR_igqJ-o; Tue,  6 Apr 2021 10:35:49 +0200 (CEST)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id 77DCC1080AE;
        Tue,  6 Apr 2021 10:35:49 +0200 (CEST)
Date:   Tue, 6 Apr 2021 10:35:49 +0200
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: gpio-it87: remove unused code
Message-ID: <20210406083549.GR25703@kw.sim.vm.gnt>
References: <1617693639-49182-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V2tfspbppmK1TQo2"
Content-Disposition: inline
In-Reply-To: <1617693639-49182-1-git-send-email-jiapeng.chong@linux.alibaba.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--V2tfspbppmK1TQo2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 03:20:39PM +0800, Jiapeng Chong wrote:
> Fix the following clang warning:
>=20
> drivers/gpio/gpio-it87.c:128:20: warning: unused function 'superio_outw'
> [-Wunused-function].
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Acked-by: Simon Guinot <simon.guinot@sequanux.org>

> ---
>  drivers/gpio/gpio-it87.c | 8 --------
>  1 file changed, 8 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
> index 8f1be34..f332341 100644
> --- a/drivers/gpio/gpio-it87.c
> +++ b/drivers/gpio/gpio-it87.c
> @@ -125,14 +125,6 @@ static inline int superio_inw(int reg)
>  	return val;
>  }
> =20
> -static inline void superio_outw(int val, int reg)
> -{
> -	outb(reg++, REG);
> -	outb(val >> 8, VAL);
> -	outb(reg, REG);
> -	outb(val, VAL);
> -}
> -
>  static inline void superio_set_mask(int mask, int reg)
>  {
>  	u8 curr_val =3D superio_inb(reg);
> --=20
> 1.8.3.1

--V2tfspbppmK1TQo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAmBsHWQACgkQzyg/RDPm
szqhURAA0PNn+4SuS9NK7EF7lNd8cbPMNBqxGpdQmWrmbVm9whyL6RiAUoaHTRnK
z51VrxwF1sKZJ14b7YXOhnR5CxZHvtewVQ1DHl2q3Sm0KYDbUxAMNxG0elneH0sA
HAfIVrM30hRQUGmoUuyHJpuFic7X9YNef1Ny5lt5z/wEL3T9cw4LNjLDiQZxvtdZ
ac6/suguZAO0+LETK9MZ+Fb29pebb3X4G5ZKf7bhpVNBtbM5fQDXXfAhm1CBFJoa
mvf/IQXATLONEN0kC6ZoyvtfXee+hY3C4k4ibz5Svh5XymSamM1pkShhUXoMnLN2
bmZxzZc6SkyAti3RL5ZCUEV7bE3EiLcz3t0iO5s5za9nREPbFOLfvdvCbbhpBfgO
pxM1GHe1myHp8fS/PtBzijdwMxfnjVTh1D7PpCtIxXtMsaddByVPnuqtFxdKKL9L
FEKrstIIfsAO/H/fgsA6NdqdfURxFG2GlsWGRmF8HnC4TZeNB+Q3SYJU5gPf7l7x
vS7uq9vkEh52sMioZpxx3lmJkspk0BzoRL+TuaRnGReC16KIu2l594FlNH6w3IG5
Hli5+tYvijD5WUI/ouR9L8sEWfYB1/LLooaCv9bARVCnKAj30bI7Hba8YTXVBkw1
4dAVqGO/Wo9vzoo4i9K3bVl5Fz4eF30/ILAnXSSQCNUFuitIULY=
=4gnO
-----END PGP SIGNATURE-----

--V2tfspbppmK1TQo2--
