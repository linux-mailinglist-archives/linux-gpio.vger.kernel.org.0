Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3C96D7FF2
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Apr 2023 16:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238586AbjDEOr3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Apr 2023 10:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238554AbjDEOr2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Apr 2023 10:47:28 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F09FE55A2
        for <linux-gpio@vger.kernel.org>; Wed,  5 Apr 2023 07:47:23 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id bm2so26832012oib.4
        for <linux-gpio@vger.kernel.org>; Wed, 05 Apr 2023 07:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680706043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A6AwQvzuA6Qp8K0j8ecwWgIY3AigiwirmRRkxPYgXRI=;
        b=RwjDEPijLGXCa1yTOksX+85ZtjH6zfq61HX8UxK9ONjNwvz5+3sTVyY6zdxn/O8ZQW
         l2wLQgwsDcZ1H3Cw9ngGUgIg1UHiwPnJ//M54fTZIQeSsBWJzehpbJvrFadPsnBq22NP
         tqYe6ny+qcKLwMMQh4U17j31RckwaIxyXZhN9EKWi3mAEQzKGLz4U4EXjh6tNgbga1X7
         EGLqAhwue3spWFeO3tvpNyx0ZbyTo6bi3A0kE9AuDjBXSLiZx8FXGp2TAEeD0lZaDVI8
         yB8EwGU091BlaxK1hOEGWb7MfPbB+b41+4ct74xuZUs3mmPj6jGhEDHY7NosYMspjEBa
         H7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680706043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6AwQvzuA6Qp8K0j8ecwWgIY3AigiwirmRRkxPYgXRI=;
        b=H8Pg2cNg1Gl67+ulTgJjJEwgJ13XPVpzWgoCqHsmntX3Lu/NbxyT2uHAzBM2nHAJtK
         P1vT6n60VuIPprCw+PnVId0+gly1Za9DzDYWKC0Z9+hX4rzRPLSXE0JbIwP/82OT1KFe
         rmvV867JKXKf3iMF7Va0FrSkQMKjka0SV8c85at2IgGm6t8ovvD/PSlsNqEWXhu1QvNb
         oVMJW9dU7KT/QwHNoojEjWfC1oO4WchKuEfoHTt5WMHH/1QVTuYdecIvrDtZ8B7UzN89
         fVJw5liyuCfs0QNXfjwMhBsXpdMBcFy0TSIssTZjIZYiKvkAO51OmyDmN+DI7rO5Zzj/
         QbTw==
X-Gm-Message-State: AAQBX9eKeYLKeuYv15d8Sy7mujzLi+oV/DJC9+S0SV4ZaGQelHKz2RkT
        0k/jIR0IiQwu8WUfo4yzpGHPVw==
X-Google-Smtp-Source: AKy350a5zlZ0NfDm0JP3xKXWSvEkhSEMQGkFGmxLlt4aAPR4WIqNsg4iqgBh8TMPciCp6UzlpqjtVQ==
X-Received: by 2002:a05:6808:1804:b0:386:fb78:a4cb with SMTP id bh4-20020a056808180400b00386fb78a4cbmr3960056oib.43.1680706042500;
        Wed, 05 Apr 2023 07:47:22 -0700 (PDT)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id o184-20020acabec1000000b003646062e83bsm6406041oif.29.2023.04.05.07.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 07:47:21 -0700 (PDT)
Date:   Wed, 5 Apr 2023 10:47:18 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, techsupport@winsystems.com,
        stable@vger.kernel.org,
        Paul Demetrotion <pdemetrotion@winsystems.com>
Subject: Re: [RESEND] gpio: ws16c48: Fix off-by-one error in WS16C48 resource
 region extent
Message-ID: <ZC2J9ru1VN5fmeXZ@fedora>
References: <20230228081724.94786-1-william.gray@linaro.org>
 <CAMRc=MfD3=ifo9EJf=5_HZKLXnbASi=ehYm=Zs4WQA+YxfffQw@mail.gmail.com>
 <ZAXfZbywWOo2pg4L@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7yTnGSIEnzs98TqB"
Content-Disposition: inline
In-Reply-To: <ZAXfZbywWOo2pg4L@fedora>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--7yTnGSIEnzs98TqB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2023 at 07:41:09AM -0500, William Breathitt Gray wrote:
> On Mon, Mar 06, 2023 at 10:23:30AM +0100, Bartosz Golaszewski wrote:
> > On Thu, Mar 2, 2023 at 11:30=E2=80=AFPM William Breathitt Gray
> > <william.gray@linaro.org> wrote:
> > >
> > > The WinSystems WS16C48 I/O address region spans offsets 0x0 through 0=
xA,
> > > which is a total of 11 bytes. Fix the WS16C48_EXTENT define to the
> > > correct value of 11 so that access to necessary device registers is
> > > properly requested in the ws16c48_probe() callback by the
> > > devm_request_region() function call.
> > >
> > > Fixes: 2c05a0f29f41 ("gpio: ws16c48: Implement and utilize register s=
tructures")
> > > Cc: stable@vger.kernel.org
> > > Cc: Paul Demetrotion <pdemetrotion@winsystems.com>
> > > Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
> > > ---
> >=20
> > Why did you need to resend this? Anything changed?
> >=20
> > Bart
>=20
> No changes in code, just added the stable@ver.kernel.org Cc tag.
>=20
> William Breathitt Gray

Hi Bart,

Would you take this fix through the gpio tree?

William Breathitt Gray

--7yTnGSIEnzs98TqB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZC2J9gAKCRC1SFbKvhIj
K9tzAQDQyEfw93RTfPmQ34tV0L79xQlQXgHqg+joxkMTlU+8gQD/UIaBvRjVTxwA
rRFt8lGY+iFzGtHkUsRGaIbrQGP+WQ0=
=bqhB
-----END PGP SIGNATURE-----

--7yTnGSIEnzs98TqB--
