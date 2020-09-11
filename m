Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1E5A265E5C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 12:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgIKKwX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Sep 2020 06:52:23 -0400
Received: from mout.gmx.net ([212.227.17.22]:44027 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgIKKwV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Sep 2020 06:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1599821537;
        bh=4mRT3yUpUdwMrkefLslPaenmtqLYGk/SPbvq8bTP6pM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=lTWOLJJUeQcmQsVHzt4tBOgFyaEIedr17BnMxGXiIJglxtG0Y5WHEB1PTwQyVtYeN
         o26Mlfzu+IzDYI8iC3oUTLVfC3BWqGVJCgBjotgKccJo6DJk5aXcRr7LU8bvgslOP1
         NWQvR7iy3Fgd/X/qvA7lst09hZUuPYnTti5l5AB4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from waterstation.localnet ([217.83.97.121]) by mail.gmx.com
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MwQTF-1kZAxA2Bi1-00sPfr; Fri, 11 Sep 2020 12:52:17 +0200
From:   Florian Evers <florian-evers@gmx.de>
To:     linux-gpio@vger.kernel.org
Cc:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod] Integer overflow in C++ binding on 32bit systems causes wrong event timestamps
Date:   Fri, 11 Sep 2020 12:52:11 +0200
Message-ID: <4594456.31r3eYUQgx@waterstation>
Organization: http://www.florian-evers.de
In-Reply-To: <CAMRc=MeKaSaajcariAqfugW6RGK=A1URZV=ir9BdGm-QubMKgA@mail.gmail.com>
References: <2572959.mvXUDI8C0e@waterstation> <CAMRc=MeKaSaajcariAqfugW6RGK=A1URZV=ir9BdGm-QubMKgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4265285.LvFx2qVVIh"; micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Provags-ID: V03:K1:SekJqeECkfy3WpbklyPVwPzSrBW6wFSFp7hnWJ9LtVBCG0GaZtm
 xsu7NIiW84YFg8F0+XTsQqALspLabX+r3gbSKIPQriuNybsjmY0Vzg5cEl6qWIoCdpd8lnD
 O4o1pZI+f1hv1nH7ai/DK9Vh4WNBlJaS24SpI/ZuQOffL4+sXka/iLLRF14sT5PcRw0sQEd
 587pfVtpNVAd9GM4qelUQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WRGfSozXDVM=:9Ker8Pp0oe4kMvhW83AVov
 QqDjPf5M1o1o6c2Her5b39iby7GFrqM+utQStb++6ldwFDf66OxcspBd2ge7NXrXLuv//cT22
 argBab7eAL9DAf49rpcF0H/w+I2T3SK8+77Kkhq26Pg/x4NS1r4C9wv+RgSCetKQoqe/loY4Z
 pOqHHp/OsOkrjPbeacXGwUg6ug7YgmNRWjReGccyObpK1Ff5Wtz+ql6iYp62GULRz+zET20Cr
 McwfQ25wtY+i0jQbOIBuwVr/KLQF/Kxxo2MoVOqs9Q4UKEM4b/HTTONvehkywS76B5GXZUx0E
 lRK35UDFPYv4KhfmZCOYhqTbN0HH9fiWs8q/sMSy65mrUrWkNdRH1zHYRMg6QZPDExloV1aP9
 gnoKk3wrY0uJFUAjPWT3wbD7RP+EDphnuilq42dia8G/vY7Y0XhBayiJ9OCVvVs+vyHcrAvVl
 44MYgawm/OU+jLTkLjfOy4YjBpVvLTK4BvO//nwqSL47ELwiWZ+yK/HSmPaIfhHPcR36cwlE4
 HNR50wPaYsDKc9v9SR3P67+VdkaGHySYAwknFhrSsCjHZ+OLRgte7PF/aXjZP21wNY6HmUdvL
 X9F1LXtAdd1xIsCaI7pgIRkt8WvChzRawxE1sshjrs1z4rC7mMIVO5a4SKH1PyPZshLnGb1Vr
 I020d2YQTqeeYMvWaeKM5mdzUSdnJPmu7nYIy2rFTrjrVjITts4LGewp0Ci5G3rsCPeFFto74
 nkhhWtrv6Qh0W/OBDb0oeYV9qtDX17/kcDmVSRGyqTzTfvl0S3EDjHz6x62gbsc6kRo+SUVim
 orMYzrTXMzy1DPyX+OSoFnaKlbrwbY1G/wxx+9bNvIcwtDVs87bzsnUh7y2f9YmecCLxnsQJH
 xZsKQOxmWXEW0R2l2PmImSVKlczL8mG5m1KA9cnibQK0C2bcHxa99lRw9CL7f/fx9XJHVXlau
 LLlqXjrD7LafrVY2veIndfoRMlltPOcs36nkyeI7kTYCROGMJvZ9gDD8aQf7qzSp+t+adRLPs
 840PLqo1xCVaFkfdOcbBb3Jq+g+cfJ9EHCXx0jqnmyz4WOz8MrY2CgHASXUOj+us6XcUoKDLN
 g+AsyOYHy2cC4vJkH1SNF20DhjRzwpwqHVy+5ZP+yeT2do5KwXWIkgqDHnnLNKJVhWvSaKFJ6
 1hOgrpIGvz/zoZ6NGycnKRoofG4AEAcYgtphYiw/sc8coGxcXYnM84BgpaahyJ5/yZHL33wlV
 +tsbLRYfQDfkVCW9Xa/llEZP8jaWRv8xgzcAEoA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--nextPart4265285.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Florian Evers <florian-evers@gmx.de>
To: linux-gpio@vger.kernel.org
Cc: Kent Gibson <warthog618@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod] Integer overflow in C++ binding on 32bit systems causes wrong event timestamps
Date: Fri, 11 Sep 2020 12:52:11 +0200
Message-ID: <4594456.31r3eYUQgx@waterstation>
Organization: http://www.florian-evers.de
In-Reply-To: <CAMRc=MeKaSaajcariAqfugW6RGK=A1URZV=ir9BdGm-QubMKgA@mail.gmail.com>
References: <2572959.mvXUDI8C0e@waterstation> <CAMRc=MeKaSaajcariAqfugW6RGK=A1URZV=ir9BdGm-QubMKgA@mail.gmail.com>

Hi,

thank you very much for the patch. Your approach to use std::chrono direct=
ly
is far better than my proposal to use a simple cast! I tested it on my
platform and the use of std::chrono does not cause the overflow anymore. G=
reat!

Regards,
Florian

Am Mittwoch, 9. September 2020, 10:05:14 CEST schrieb Bartosz Golaszewski:
> On Sun, Sep 6, 2020 at 6:52 PM Florian Evers <florian-evers@gmx.de> wrot=
e:
> > Hello,
> >
> > I found a bug in the c++ bindings of libgpiod that affects 32bit syste=
ms.
> >
> > Observation:
> >
> > Only the c++ bindings lib is affected. For input events, the time stam=
p
> > delivered in the event object is wrong. Instead of providing a complet=
e
> > "system time", it delivers time stamps of of a range "-2.1"...+2.1 sec=
onds
> > (which relates to the time stamp range of a signed 32bit value, in
> > nanoseconds).
> >
> > Cause:
> >
> > The bug is in line 219 of file "/tree/bindings/cxx/line.cpp":
> >
> > event.ts.tv_nsec + (event.ts.tv_sec * 1000000000));
> >
> > "event.ts.tv_sec" is of type signed long, which is 32 bit on my device=
.
> > Thus, that multiplication to convert total seconds of a system time to
> > nanoseconds causes an overflow.
> >
> > Fix:
> >
> > There should be a cast to uint64_t before the multiplication.
> >
> > Thank you for fixing this!
> >
> > Regards,
> > Florian
>
> Hi Florian,
>
> thanks for the report! I see Kent already sent a fix - could you test
> it on your setup?
>
> Thanks in advance,
> Bartosz Golaszewski


--nextPart4265285.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEhKFNjXl3cTz1YyjaJLtLMH/ftD8FAl9bVtsACgkQJLtLMH/f
tD9p8BAAj5xVDpGBnaNlUxLuAruEl6p4VXnLzal6HyOHZ3ytIZ7YQ5HYCCqRCcI7
U9QXtbVwdkzfjQNdM+1d5KcdoQ5zo0Cy6Sz4oE94sLhHaD83G/QxO03y0PSyBq7g
yvxB7EwJcXiR46UnT0pr7bBaEY2fzu0Ll5+/nn32q+8S0kVRgAu3HYty5QCdq7Wn
UJ3pv0c0zGZdvQHW01Nw4zYsTH3bknddC/v9/7cnjNlA+0zgW5wY78PjK9AMCZli
2D61ulKpjBLWA+2RpNfgE1dpDaZxZEI/fO7eJLWBcMTkHbUSdBfqIp5dTAN8HPSD
WnCKIl9n0bcUZ93Tz1BpJ/UqbQzgNDzxmHqp+X62DDbI9+101CPbOKIMj5yj86Re
glWuixDm3hM5hx2BHI08Bwtgghjl87tfVMAcIbNYok+l8+U4IaZotSX/lFa0AH1r
hW9r4HNoQWV67mAFCwVjzX+WC1FQrpaS47L/HzedHHGNBN72E9/IE43rv+ZORr/R
LD2WDIQ1GxH+4y2ToatAVy+ELqzyDXzaUSboI11CqLlN8qBG5AekYfD2oNKhpMTh
6whxfHA2gd9E72toY5QUPDhISlyzjqYJHA2kG11r8YMLvmWUqBpKeKf3ivaWoZmk
USwHOft9VnCFKSh5aJQFDxZ3s3fSzwPh0UxEfYD1JRvSkE+Tuz4=
=ZyJB
-----END PGP SIGNATURE-----

--nextPart4265285.LvFx2qVVIh--



