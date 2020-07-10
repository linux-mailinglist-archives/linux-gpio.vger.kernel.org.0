Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFBE721B40E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 13:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbgGJLeh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 07:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgGJLeg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jul 2020 07:34:36 -0400
X-Greylist: delayed 1072 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 10 Jul 2020 04:34:36 PDT
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C94AC08C5CE
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 04:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=QnCaOuIcCvhdYBaLUabKy4df1O0QApUXplyyBGGXirA=; b=POGAhwidXZA/FO2MzD+VgQyWM
        GSo4tLG+skCosrnZ1xIBzj1L/J0XxDOdGJVtG5cPDsJXvxb6WsUVS/86X8mzv4IH/KO06x58lrwvZ
        FF59kyB2cTMBhIv0IMY50JrRgGWFDOC0uv2fnqmfv3fgX1yGY08Q83tFTbt4geIcqoE5I=;
Received: from p200300ccff110000e2cec3fffe93fc31.dip0.t-ipconnect.de ([2003:cc:ff11:0:e2ce:c3ff:fe93:fc31] helo=eeepc)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1jtr0m-0004gH-G1; Fri, 10 Jul 2020 13:16:12 +0200
Received: from [::1] (helo=localhost)
        by localhost with esmtp (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1jtr0l-00020e-Se; Fri, 10 Jul 2020 13:16:11 +0200
Date:   Fri, 10 Jul 2020 13:16:02 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
        will@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, oleksandr.suvorov@toradex.com,
        aford173@gmail.com, hverkuil-cisco@xs4all.nl,
        bjorn.andersson@linaro.org, leoyang.li@nxp.com, vkoul@kernel.org,
        geert+renesas@glider.be, olof@lixom.net,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH 3/3] ARM: imx_v6_v7_defconfig: Build in CONFIG_GPIO_MXC
 by default
Message-ID: <20200710131435.38f1f8a0@kemnade.info>
In-Reply-To: <1594164323-14920-3-git-send-email-Anson.Huang@nxp.com>
References: <1594164323-14920-1-git-send-email-Anson.Huang@nxp.com>
        <1594164323-14920-3-git-send-email-Anson.Huang@nxp.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/d6/Rv7Yx5KojLO0Piux=DEc"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--Sig_/d6/Rv7Yx5KojLO0Piux=DEc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed,  8 Jul 2020 07:25:23 +0800
Anson Huang <Anson.Huang@nxp.com> wrote:

> i.MX GPIO is NOT default enabled now, so select CONFIG_GPIO_MXC
> as built-in manually.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  arch/arm/configs/imx_v6_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
shouldn't this be done also in the multi_v7_defconfig?

Regards,
Andreas

--Sig_/d6/Rv7Yx5KojLO0Piux=DEc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl8ITfIACgkQl4jFM1s/
ye92NBAAirKEXgFataafDg7cpIdPHiPdBtEQxJN0JqXbsleYOFa4XZX8UEaS5T+E
bNQ8n7MLSorL1sxQL8JTTyaXcpZ0uWTLW1JYIxFTJmOZLvEg9CuiKWASFg2L78w6
ie/jiFwZhUX5LitiikICMcXbdqMatE+UjeFbTIEWZfiSbX5UNSUMF5bPNTOatgvD
K33z+2z9jc2rTToigZRJg2Qe3+x96rxTAZ8oJuX1fVR8Ini6cbUjI9LvBlPQmpmW
asOU92aqMGIeBjZRJCO+GBfrP/Df1P/LoFcmZ98Q1G4OR+Gr/1dudhXjScEIzydF
fmHW1vOsJQoLAdaX7Q8iiSNLR6S6yIkJSLbfP6aVSbjE3lq0OUti2aSQ56KxlUBt
3JkVP19uql1hmhLYqFOObbwBjpE4xhvqJSHz0F//sun+KE1G//BqVZ5d049wyuV8
VX9rWje+/cRD711W7/HKcrzY/juP74eFOt9zUDgx7DCVgVYaZ41HHSGtDdfD6dXf
fsqoWvzf5o64jCC3taMnKA2nYH8yC0796+fXQVuaBWoZal6F0fIeUOVF7mGoqK2z
rvCmfrWeRtDXfs9w1t8csiWMxgywYvkoPJ/dm3AAwtpSHKFdxB+XHmKw7traX6Bl
IVTV+BN5qhs0XqDM95AlhSZ0RLINTgzFoUVjcpgWp40XMLq+szk=
=nwOK
-----END PGP SIGNATURE-----

--Sig_/d6/Rv7Yx5KojLO0Piux=DEc--
