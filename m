Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66D5A56DAC
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 17:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbfFZPaZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 11:30:25 -0400
Received: from mout.gmx.net ([212.227.17.21]:37303 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728226AbfFZPaZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Jun 2019 11:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561563023;
        bh=+m1bpti3Gm94lggBQ3rdBE4ZilC3ZLl2mherlB/r4ds=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=gUUgP9G1fXL1+9rPiVryhgFsHb8tPX0T/6z8SFPiaPh66cwKSWVIeAVZ1KbEInMAc
         TMmriyrPdT3tPU9eFHESIJw1D7luIOLOVjraROkRcxkhuEcFugyIXEaccS0R0DF05t
         RRTNTuh/x6dvZFxJE3zXMqBt+rYskLvo8edEVcFk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.87]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MI5QF-1hksRt3E4V-00FBqG; Wed, 26
 Jun 2019 17:30:22 +0200
Date:   Wed, 26 Jun 2019 17:30:22 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        gpio <linux-gpio@vger.kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v1] pinctrl: msm8998: Squash TSIF pins together
Message-ID: <20190626153022.GA22408@latitude>
References: <18ab4b1c-e74e-410a-a504-f524e46c42ac@free.fr>
 <20190611180516.GO4814@minitux>
 <be298c01-53b8-a954-5de0-3f302265f1cb@free.fr>
 <20190620184124.GB24205@tuxbook-pro>
 <57d0644d-164f-58e7-6c07-9608da4233a3@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <57d0644d-164f-58e7-6c07-9608da4233a3@free.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:j/CN9N+39HsynZ7uVMWJoio99G56bQzgetJdotIVDZEIqYtPopx
 RFZan9bRqQiMaP+mqlczQv3YK7Q6qe3g6q+skVUIWWcwVPnDOmdGblLC39ZzllmW7NE2cKW
 68o/5St05eojiet+HHktXDpoe24BkrK32Au2O18pn4NnhHDWzesWDD9MHYJvxVQG/6niSL4
 tlYduzYHJG2x2gYzgwS2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z6LMXHIlIOM=:ERRUntw1rai1b+07aH0zuT
 n3+Q1/mGxttoUV9dBFOxpttd9xl4gHx/VhLQ1H5pVKORYh/WU0ec9SGw5DGtWpaCo9B/B13Oi
 LIogdSbjOJxTuNwGMsPz/SioNA/IP3bo/ISU5oORUz+Wbket6Dd8v7u9mVKr6WoylTmj8MkYs
 4jnv0aYerHLpk7vTbq51x1Evd0wzx+dDr4ZMRvfM/h/3eil6GMxW0TfsuTCcXqHjXHqC8FAIw
 ZVTJveRyl03vle054QS6Ouq8Q74/u44XsxS23Y0hfzX9MJHmPTMgU2ShcR1eGrTF5CE3byLgG
 N6LFCLT55jmI8FY8AUSBnw0L5zG+LVUygSgjZSIJL9oaEpjAHOYto/6Zdli1BkARVBTPsPKbS
 87CyXuUyDyMBqSnzA7F1JpB3GUzNn7sLLtg3vmdzLLSPIhczMzktCM4IOAIQ9EdbYzs64VMvT
 W58JaYgrQMpI4hipUZ8/r1ZJhc8IVmfAXoP6InFkZNoaMmFVRxZtC1ZKLd0q3FpjGoHA0A3jW
 b9S7hMYm+NngPbk2D7+UNkJxM1chhrR2a49ypJS2PBW1HadHXcIoIV+TJdnMC7ApGvIBSYr1j
 P34CGQ2jae8rcFkf42hsaaDVmWG1ZLje7lVaxvtypwgfoKSe4snZJyd8yyjFAA7D1O7cx5CLI
 Wbe5Czq78LOiOr8NsI38ItpbQkv2c51xSNVmhJ1DJiDhzzfEy9jUjGKbtjtdtdo//4Gi5RiEA
 S0c15XGL4EOLiGwIbieT7l61K0MMN2u+PgHr1gypWYHplhgriwNNeueGjLO3YxbIweEP3T4bY
 okMbB+akijOal6qgVzfBt+n9+hkhu2pGd9OrEO9aN7VglLEWH9Y6QZUe4t8Aua8LgvD08hyRu
 7hOAJ4PVpE1Mj65XqO2NaRZ3fqhILEz2WW6GvHuegAV4CqD1w+Z/DP6Brr8uMllH1PO9GFBLA
 IGP8OOuLVpBgKpHf6Mpsr7Cin+oYUdE8=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 26, 2019 at 04:38:58PM +0200, Marc Gonzalez wrote:
> Preamble: Rename tsif1 to tsif0, tsif2 to tsif1.
> Squash tsif0 pins into a single function. Same for tsif1.

"Preamble:"? What does this mean in context?

BTW, the devicetree people (devicetree@vger.kernel.org, Rob Herring
<robh+dt@kernel.org>), seem to be missing from the Cc list; they are at
least printed when I run "scripts/get_maintainer.pl -f
Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt" on
v5.2-rc4.


thanks and greetings,
Jonathan Neusch=C3=A4fer

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl0Tj2wACgkQCDBEmo7z
X9smHQ/8CUD0ylkawz7HJUX/aRPZRVqzKJcQOADyZCsbFW4M1CXA9DdomaeaA2Dz
k81ZzPP9ZVExsN5ex/IRvt5Tc4DHySVPAHehdh15kvsQUee6fktH0Dc8PapHMqGm
KkHIqc9i6rhn8JCijElQHmm8kFXAe+SbnMuZzLMHlsGZCT4BGddbep+oFAkyioyw
WwDt47Y4mCMiycbCFO7s2aKts93EtdB+bj5AafSm84ja8VivyfM64/3vXm8K5IDP
B0i3Gt+DjWKJPL8GjyQ70WIK6oC4udJMExtI/vGC2f4NYOqDhBwiZWzFI6vP32Ux
w1TM7ovoia45ZUkNITEvYZI+WX09pImKFWHhnvaIXUwrmZB0G92qCHH/9/SJePEQ
HSyyxWXdVJVT4O8WUCbWgMJPdUbKhrurCrq33yeerrRy4ApMwi8WGuc77pj8O6tr
dph5bMJ/hndHFBM0oLnu1/esAfxSsJLLTKHEutTqXvQZdMI41eevS+OHl5BWh1oa
MW6v5FDnlrwz5izozXltz0H3V9vVPr0ge2oL63/9Q21lk+BXUockD+V95ZzhMQ/P
2h0vAezDdAz20sXSBH0/mKXVf6RLzpEPGUkMucwLAUTkz4xyABMWBHgTMgGBgsnH
C6zhr3j5I1LRcany563G2M9JJ9ilC0vasFJ4MfDme1eKj6Ep1nA=
=A69Y
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
