Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4CC15AFE0
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2020 19:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbgBLSd1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Feb 2020 13:33:27 -0500
Received: from mx2.suse.de ([195.135.220.15]:58538 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727923AbgBLSd1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Feb 2020 13:33:27 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 20985AFC6;
        Wed, 12 Feb 2020 18:33:25 +0000 (UTC)
Message-ID: <ed0ebca492ad3b4229835cdbda65549a4e794714.camel@suse.de>
Subject: Re: [PATCH 1/4] pinctrl: bcm2835: Drop unused define
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
Date:   Wed, 12 Feb 2020 19:33:23 +0100
In-Reply-To: <1581166975-22949-2-git-send-email-stefan.wahren@i2se.com>
References: <1581166975-22949-1-git-send-email-stefan.wahren@i2se.com>
         <1581166975-22949-2-git-send-email-stefan.wahren@i2se.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-ulzXRZjx5UFe2W/mHRRR"
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--=-ulzXRZjx5UFe2W/mHRRR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-02-08 at 14:02 +0100, Stefan Wahren wrote:
> There is no usage for this define, so drop it.
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Thanks!

>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> index 0de1a3a..3fc2638 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -40,9 +40,6 @@
>  #define BCM2835_NUM_BANKS 2
>  #define BCM2835_NUM_IRQS  3
> =20
> -#define BCM2835_PIN_BITMAP_SZ \
> -	DIV_ROUND_UP(BCM2835_NUM_GPIOS, sizeof(unsigned long) * 8)
> -
>  /* GPIO register offsets */
>  #define GPFSEL0		0x0	/* Function Select */
>  #define GPSET0		0x1c	/* Pin Output Set */


--=-ulzXRZjx5UFe2W/mHRRR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl5ERPMACgkQlfZmHno8
x/7XAgf/e61c0DAwpbRreaAJ033lb5vYCOwBg1og+mB2nUKnUvuCt+VaXLu9joLt
1rmULI6ENxMegyCtvmsUcEFpDcm13mPFM75+FOIOvwGZYP0NoPhNeRCEQqGKK0V9
D7QyMCIgQfREus91+C9a5McL5x+RuXp+HBgE0Pd2IzUKLmHjwyd22sVoWv5jq4QE
h7XcacuGLyHtl1YEyg98+FxSxamejERl5/XkKAvw+9mEong4Z9fCrWB7aqeiZzT+
k9y0Gc4Ew+x9u5bGyuuXIP0gTF9OmxVVbgKHw8llmvusPiogkZ+UdpZyKKCkwiWV
IHleKsp1NY1uHBmg8wNbo+jRvhmbGA==
=SdUw
-----END PGP SIGNATURE-----

--=-ulzXRZjx5UFe2W/mHRRR--

