Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 693778BB56
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2019 16:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729272AbfHMOUr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Aug 2019 10:20:47 -0400
Received: from ozlabs.org ([203.11.71.1]:60813 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729407AbfHMOUn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Aug 2019 10:20:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 467FHY24Fbz9sN1;
        Wed, 14 Aug 2019 00:20:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565706041;
        bh=C9s0yRRPB4nDLu6tQK9aDr8H1FCQPsMKUqY0M/UancA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nDVFoW0ZtEemmZ+mYuR/9bdMZjg/IEYEtLrrI+iaO1kHYPjrxXQBYz0Ayy/EGMQ0K
         VlWeulBAdA0l2K3Grvy75iaeJPRsqIn9tpCBXygEAcmOJBJFF3ucqgP6VqVxMVI5iL
         Bp0aleltuH7q/WSB5hnDJe1/ZOiPBB2q3CWc1ubOWSe3cmFEwXOrvXDCfOmUxryc0o
         J9f1Dj7FfoG+1hFMactYItgbcq1gUhaUJYh7n/z1hETGtwR/GO/JUK8eDKFN8nEX/9
         04ZUYEGwoCobRq3fJrUeLuQRU11B/AwwQqSTKEa6+r8UO5Qu+O9vl9k8oEdfq+adgG
         0kab2PEwRtuFA==
Date:   Wed, 14 Aug 2019 00:20:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Intel GPIO / pin control repositories for next
Message-ID: <20190814002039.125b1898@canb.auug.org.au>
In-Reply-To: <20190813140403.GB30120@smile.fi.intel.com>
References: <20190813140403.GB30120@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A+IuQpEJybXFP852dRufAqE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--Sig_/A+IuQpEJybXFP852dRufAqE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Tue, 13 Aug 2019 17:04:03 +0300 Andy Shevchenko <andriy.shevchenko@linux=
.intel.com> wrote:
>
> Can you, please, include the following repositories for your linux-next b=
unch
> for getting better coverage?
>=20
> gpio-intel-fixes git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux=
-gpio-intel.git#fixes
> gpio-intel git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-=
intel.git#for-next
>=20
> pinctrl-intel-fixes git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl=
/intel.git#fixes
> pinctrl-intel git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel=
.git#for-next

Added from (later) today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/A+IuQpEJybXFP852dRufAqE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1SxzcACgkQAVBC80lX
0GxZUgf/RiYVbm9Or6CLz8Q6Uvs4jZEghI6nZ0keXPRuwyaGWJ7Wpacs2Tc+gTS1
H7y76IhqYyzezEvfpNj3I8VRRdFgc080wgWko1p0WMnAMztBcAnMVWyVagXS3+6o
+oImBl6zgEGPIsizx4/NLUAMY6GMzvPgogfcEdJPXmWrBIw1HQHbHuS4/y8ith+A
3frqHeq/Kqbmjn+Sr8IWRG7HMOhHT6HOZSMiLtj27HPvQDbhCUDHpVS73LAdjpSv
AyNabZPGxKg6VtcUvMm4raV4zBcOhtdNqNRlIg3UrMsDMoO7WEij7voJWqe9zDlx
OZPq40veJEDPP04JKazKvhGg+wul/w==
=AB4p
-----END PGP SIGNATURE-----

--Sig_/A+IuQpEJybXFP852dRufAqE--
