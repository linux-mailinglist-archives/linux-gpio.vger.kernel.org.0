Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B506207CC
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2019 15:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfEPNPY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 May 2019 09:15:24 -0400
Received: from mout.gmx.net ([212.227.15.19]:34607 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbfEPNPY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 May 2019 09:15:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1558012516;
        bh=4PSlOiO3eht+wWQhmBnMks1JK1SUuaolOlOFVMPsFKg=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=gZT8I55HYG+eXIuD+hI8Nwg4b2+u0YlQCZSpmJ6d8XRtab7Uo5AZ0b3ZOiO46jHWi
         C9HyaR0jD5FhM9ujXcOA0hHl8v1j14ZnFvjySmsRQ3uTuy8zRa7FJfEKW6F/SRfH9F
         9NxSphwuM2WaJx+ePeRpLYC5XJjc2cfnAYOToEd4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.200]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0Lb5GD-1gyV6z2Uwr-00kibW; Thu, 16
 May 2019 15:15:16 +0200
Date:   Thu, 16 May 2019 15:15:15 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: Fix spelling of bias-pull-up
Message-ID: <20190516131515.GB2000@latitude>
References: <20190428150822.13935-1-j.neuschaefer@gmx.net>
 <CACRpkdZcP3gEsudT0rpzNuBe=4Mz0s=KLPd_y-38E4oxVeQD0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
In-Reply-To: <CACRpkdZcP3gEsudT0rpzNuBe=4Mz0s=KLPd_y-38E4oxVeQD0A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:Ue4Zk/ZiHBIR0wdXiJyWlB7U9GLA0tsVWbvjz0k9/U2nNoQgzvs
 l36UQu5c7MJiQHuy9vlcNE3aEY4u3KTq4GmYtmyEoZWHmsUwHr9KR5sVodNkMHyhVsWnXMP
 ahZVoFVvnRbonQWFlQdKF+rLVkRVatYHqUkZPdC11igbZOJ8QqZYBzoTNDQouyS2Sley0Xi
 KUbMYvZQiEIUcPksylp0w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c51TKyMCnFY=:cTt9QpyEDqQtRvclrxCIxx
 1ukQuW8dx1RvA5SyRSf9jo/IqKZxcruWAjhSErjdXRDZc8SttXdvdv5GD4cj/PSO8s6PaGYk9
 rE8jKwrkKUwkXcqOBbFfvXUQ6+GUX5OFit0J+JdEoXNgO2+ADQmadWFCdsjNIhX8WqsqMo6ea
 y1EQn3e8mVJw8IfIG56LehkeD1ZrVFOc7qziAhrjpjAPv92cY21kg5GkX3EWZb2PUpv9KHLjO
 13bzx2f3ie39sg4K7yBJ7TgpxzG3gwlv8q5ZzoulwbbdIO5Yy83oYUpcrUP2gMwzYINIhGylb
 yjXJ//3mLIUGtx8v/MVDHwdvSqq2VLGRrf5j95y91YZLPDW8+c7GrnrJRaxNXIKoVOp+SFSJ9
 R3qWv4B2E5BU2oVch5Xa9e8KrOa/7ZQ1Biw5p078YtDraaZivfjOMH+2bYVpMghQw3gNwn8f2
 GiWu8jpElhGrVacy110UKY7uJNRimkzT80ggUYyZSNJ/WxQSjgjuX9Z45/BiZ8qkGx9LVyfRP
 cZlgrL2fLxOog6yC1IDsB5AnSwYlefH5F7BcsAI23/TQzyOVIpwfRzV/ySqd0b/JzKZE4/xn6
 Nz5Iz12LjRSHeRvRpZuItpztUdKCK8r8/yils/Qb/bgTU/va1jWjZkXi4mDiUVaLu3QVR96/T
 9vsdPDRuqxcNOWLIg1A3iyGXHDhABbG9/n1Q49HJLvc44Fic3HP6Q/cKZlCsK92eP1vzhEXgq
 HeFfgD/T4/xvZjQRgmIyx8iPWYLZx7d6dt0ZTjBVItMNIKZU8ZoPP0FlrX5vUhAQPiRTDGWXR
 hPz329qM5kU2Zn+4eUEmuo5JFUpaFDc+7rWu0uoxUjRj8MRYq7G3xMXjyki4LOuV00V7jQocH
 eNAbHguyrWrIoR8rIZHUWCsdCDQ0pb0lZw/dHZy71dDhutal/ROZnoYIrgzp60/hM8Qewosqp
 H2+GV6AKtiBnsv8yIM/X8N0bq3FNZU/g=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 02:44:30PM +0200, Linus Walleij wrote:
> On Sun, Apr 28, 2019 at 5:08 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
>=20
> > The property is spelled 'bias-pull-up', as documented in
> > pinctrl-bindings.txt.
> >
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>=20
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> It appears from Rob's comment that he's applying it,
> tell me if I need to apply it to the pinctrl tree.

Yes, Rob applied Christian's version to dt/next:
https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=3D=
dt/next&id=3Dc50495aa4cfcaace5f61174ab3069d5047d14f17

So there's no need to apply my version.


Thanks,
Jonathan Neusch=C3=A4fer

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAlzdYl0ACgkQCDBEmo7z
X9vDaBAArHDvJllzymlUcI+Bs9d6A5YfI4V3wR7SI7nvjkCSa+ctj11a0qOLsLqw
4+QoXkCETu5Qrwz4utAi8emKVpSjWaEkkickLtpjNDZacjF8kt8QA28uzn8WScoe
7gs+bd0DZ2Q+doK/QRoGAIZvY/SPSTacaNwec2wKc0d63dn8tKoqrz29r9fNOW3Z
MvS03f9PF2JFgHCPJkQPDbfmaMXl+57S4N7F9USDhFZmiF2hZNAwL4/p8whw8fLq
1aRjIpqLw9otvivF4LpK5WUj5XZoSGxbIfAQ2pS2Uj8K+MUp95fB8TqXCGG9hQHw
dstusnYe8NrcwCBYkedHoNAy2cmj3l73JTe9bSZkeSpSo/dFO9GEvILvS9BaYhJZ
9bTydEkP1YmAUeC0R962HGD1Yx1t6izL0WNzX/cawg4iQUC1uJPPLWu1p2y2FajO
FX+nUz3/z8CtGu49Wl8gezj+eI1L3joUuRAMypw7MfQzDsFv0G39wNzjcsfllhZg
8w71tQx7yA7M4tUGFBWip1tj30d1M8HghAn7psNN8FOKxZbb5NUyDT8l1v+wt1Xl
VcIfIfT9P2p9//etRlY3gdiTVj7rkZedJttSPq4LUWxENMUVnBf8BYF49hruMat8
w6L9nhPmq1qQMjZStJBQQupKADwnt6Yce6xhk4f6BYeNbuHAtZY=
=BpWe
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
