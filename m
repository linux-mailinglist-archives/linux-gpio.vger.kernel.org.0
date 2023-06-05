Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2177227BA
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jun 2023 15:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbjFENop (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 09:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234101AbjFENoo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 09:44:44 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7DEDA
        for <linux-gpio@vger.kernel.org>; Mon,  5 Jun 2023 06:44:42 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4394a25867cso3392868137.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jun 2023 06:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685972682; x=1688564682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DekAtwMVkcivnyF4r3XIVW4vGLWiIJxRdNoKEqV3irw=;
        b=b+Bp1OWAOgg9EZe5DmD2grqFrFL9O/Wr1YS2Uzl/xljGVZ1Rvousy8JV/KtmQT68zd
         xFvIMX+f4JHCVIPH4Jonx39ziKfgxuwLnI9ubme+arKytqQSlMf7tlTIR9tT2iCIIl1f
         SXbpyFgSDpymh4xwy/MeVpo/GZ6JaFlDU8zjRW6mmcQb2GcUSbK9jUexu4RSDH20u/IA
         MUzEIwSC4CjRV05OM04Dngb4VVCECw+5+zIHDiYCRaITuAkdmLicO/qKDAGNUGYLEmj7
         DgEBssEVjJtdFvUKhLlVbZBFBGKllql2vS9770XulMrHQM28J1nsUSo5w9J40I7YQCJL
         g7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685972682; x=1688564682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DekAtwMVkcivnyF4r3XIVW4vGLWiIJxRdNoKEqV3irw=;
        b=I9ty2lVXkdJlahp8yG4xoEmv8m6LI6g0oTzXVnsmaZ5+jbIjmwQCaykiIDYExPXU+m
         PcFsiAMkEQnIesLgr8Ost+3S2fPzR0iunH/Fx6enKmo5OWNAA1+J3AUsXDxl0duN3VJ9
         Qh2JNEtZSnQ87EuVarC6GXY3l4zjQSnq15lUfqHrx6sqEOpykhkm4LrE5+aL2m7Pv8NQ
         yPoqWILzXjJ2ZN18c+1AD3sx1x1y9sb8X5nH5S28LmKVTZkQYNb7dtzAdHKjHuAojbEc
         3zu/gxutSJzeTvLY8Bh/SzWicvIQl7KwDsKEF3yCOadhegu+mdZKv1lbofl5Fpqe4Z8s
         vD1w==
X-Gm-Message-State: AC+VfDzuSkChYMsZ2O2QOQUxckV/ZFeA8+8MR0citmDd//OVnIQ4i2zy
        2ti19xcghTes4GOl/jDKWIKO/Q==
X-Google-Smtp-Source: ACHHUZ7XC25H6mIgMa0hdmpkO5ZIcPqc2AGRHmz/nh7Sxgnk2B49Ae1CY66ogMMLPpGU2QdBtMhKlQ==
X-Received: by 2002:a05:6102:558e:b0:434:8540:377 with SMTP id dc14-20020a056102558e00b0043485400377mr6538395vsb.17.1685972681923;
        Mon, 05 Jun 2023 06:44:41 -0700 (PDT)
Received: from fedora (072-189-067-006.res.spectrum.com. [72.189.67.6])
        by smtp.gmail.com with ESMTPSA id p27-20020ab0549b000000b00787011aabb2sm1300393uaa.18.2023.06.05.06.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 06:44:41 -0700 (PDT)
Date:   Mon, 5 Jun 2023 09:44:38 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, techsupport@winsystems.com,
        stable@vger.kernel.org,
        Paul Demetrotion <pdemetrotion@winsystems.com>
Subject: Re: [RESEND] gpio: ws16c48: Fix off-by-one error in WS16C48 resource
 region extent
Message-ID: <ZH3mxt4f5HaCCtph@fedora>
References: <20230228081724.94786-1-william.gray@linaro.org>
 <CAMRc=MfD3=ifo9EJf=5_HZKLXnbASi=ehYm=Zs4WQA+YxfffQw@mail.gmail.com>
 <ZAXfZbywWOo2pg4L@fedora>
 <ZC2J9ru1VN5fmeXZ@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3Sb3Dpd48o5YzIL0"
Content-Disposition: inline
In-Reply-To: <ZC2J9ru1VN5fmeXZ@fedora>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--3Sb3Dpd48o5YzIL0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2023 at 10:47:18AM -0400, William Breathitt Gray wrote:
> On Mon, Mar 06, 2023 at 07:41:09AM -0500, William Breathitt Gray wrote:
> > On Mon, Mar 06, 2023 at 10:23:30AM +0100, Bartosz Golaszewski wrote:
> > > On Thu, Mar 2, 2023 at 11:30=E2=80=AFPM William Breathitt Gray
> > > <william.gray@linaro.org> wrote:
> > > >
> > > > The WinSystems WS16C48 I/O address region spans offsets 0x0 through=
 0xA,
> > > > which is a total of 11 bytes. Fix the WS16C48_EXTENT define to the
> > > > correct value of 11 so that access to necessary device registers is
> > > > properly requested in the ws16c48_probe() callback by the
> > > > devm_request_region() function call.
> > > >
> > > > Fixes: 2c05a0f29f41 ("gpio: ws16c48: Implement and utilize register=
 structures")
> > > > Cc: stable@vger.kernel.org
> > > > Cc: Paul Demetrotion <pdemetrotion@winsystems.com>
> > > > Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
> > > > ---
> > >=20
> > > Why did you need to resend this? Anything changed?
> > >=20
> > > Bart
> >=20
> > No changes in code, just added the stable@ver.kernel.org Cc tag.
> >=20
> > William Breathitt Gray
>=20
> Hi Bart,
>=20
> Would you take this fix through the gpio tree?
>=20
> William Breathitt Gray

It looks like this patch was missed. Is there anything further needed or
can it be queued as it is now?

William Breathitt Gray

--3Sb3Dpd48o5YzIL0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZH3mxgAKCRC1SFbKvhIj
K5QiAQDfYsQX7djq2TjQkl7XLqygXAO84H0mOGS+1DYHnz+xigEAl5J3Fnk/FnNU
+5aHsTf6k081wrNoME7IoWFIaYcxJw8=
=FrZW
-----END PGP SIGNATURE-----

--3Sb3Dpd48o5YzIL0--
