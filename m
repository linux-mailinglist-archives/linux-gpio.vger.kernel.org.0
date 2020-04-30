Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683EC1C0AFE
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2020 01:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgD3XdB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Apr 2020 19:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726435AbgD3XdB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Apr 2020 19:33:01 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A1DBC035494;
        Thu, 30 Apr 2020 16:33:01 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id o10so6684725qtr.6;
        Thu, 30 Apr 2020 16:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2A/DmSI7u9G6q/CMXLbjEf3bMfDgzemo/yRoL39aqaU=;
        b=aSfaSeHlt9VZ20RTcm6aeKqni2u8F0wnyraBRryqBN07wBonR4bMv0OuUpi12hCmZp
         hfHHWiw4Z95QKrvH0o0HgJKkW0epOP8pLAUysAVfeM67/nDi506HswYDQ/ovEoRMuP5o
         HIlMLYl44Sq9XM4nkn08LCMZkno8nkbOnoPYITd+xu2kjkFkhmRcNNFYNEagtskGDoJs
         rnag/Amj9PywWwTm78BBgjwdztrYsEFXm1ujJ/42djPgSyQCj+nnBLBBwzq3vZ0xLIGy
         y6MMCIB00FEhwMj+BehjqypFmoOf5G+GsQfQANaptmbUcL4BDh24sQLje2nV7RAv66Yq
         u/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2A/DmSI7u9G6q/CMXLbjEf3bMfDgzemo/yRoL39aqaU=;
        b=fj2vQ5IwuyWMKzL+RHsGw74tRbf9bNQilzMO0oAKSqa9yNrx5pqMtIoJuijs3gzMUQ
         RtQ9FBNKPIcfj7L22HcvXfGPXdlQM6AQpRYrvXIDsxqIgr4QPkin3ssQ5C4Dljg98Nhf
         Crd2Ojnbnd8whlGnQLxOwl4Jv4+6UaGmJg4/W4jJKb4T7hxOYpBabexv4ZLk0GzogQVj
         WoNCXUQRcX+u1plQEJ1nQO7LfyFiGOpAcMTjrgAmqL2tD2HKrqoK8tPVN/L4yZuOC2lj
         Fr88SZxZuuwY672CL++FzROyuUUjN8wTS5iofrlgRr/Lt6c8SkqOSLQCIaA1YSNb17Pm
         pefg==
X-Gm-Message-State: AGi0PuaNXu9fMa4SdH2wYCJoL2VMseBZidiunUq2luG+3X8GI7l92W4K
        Xa5uujJcV4Dt8Y0P6lFzIWeZtn4xgaZfhw==
X-Google-Smtp-Source: APiQypIqFCBPhblosSlDyR/50M2frSiMdvRrArGECFPJL4S4dYt1C46HkQeCTpPmPDbsu96iSNKqUg==
X-Received: by 2002:ac8:a02:: with SMTP id b2mr1024400qti.95.1588289580533;
        Thu, 30 Apr 2020 16:33:00 -0700 (PDT)
Received: from icarus (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id t67sm1421670qka.17.2020.04.30.16.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 16:32:59 -0700 (PDT)
Date:   Thu, 30 Apr 2020 19:32:45 -0400
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Syed Nayyar Waris <syednwaris@gmail.com>,
        akpm@linux-foundation.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, michal.simek@xilinx.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] gpio: xilinx: Utilize for_each_set_clump macro
Message-ID: <20200430233227.GA15963@icarus>
References: <cover.1588112714.git.syednwaris@gmail.com>
 <80745504d15c87aa1da0d4be3c16d1279f48615b.1588112716.git.syednwaris@gmail.com>
 <20200429102114.GF185537@smile.fi.intel.com>
 <20200430161514.GA7107@syed>
 <20200430163855.GU185537@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline
In-Reply-To: <20200430163855.GU185537@smile.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2020 at 07:38:55PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 30, 2020 at 09:45:14PM +0530, Syed Nayyar Waris wrote:
> > On Wed, Apr 29, 2020 at 01:21:14PM +0300, Andy Shevchenko wrote:
> > > On Wed, Apr 29, 2020 at 04:39:47AM +0530, Syed Nayyar Waris wrote:
>=20
> ...
>=20
> > > > +	const unsigned long state_size =3D BITS_PER_TYPE(*state);
> > >=20
> > > This '*state' is unneeded complication, use BITS_PER_U32.
> > >=20
> > > > +#define TOTAL_BITS BITS_PER_TYPE(chip->gpio_state)
> > >=20
> > > This macro makes code uglier, besides the fact of absence of #undef.
> > > And also see above.
> >=20
> > Thank you for your review comments. Just want to clarify, you want
> >  a new macro to be created - 'BITS_PER_U32' ?
>=20
> It's already there (read bits.h).

I'm having trouble finding the BITS_PER_U32 macro; are you thinking of
BITS_PER_LONG? I don't think there are any cases where u32 is not 32
bits wide, so perhaps it'll be better to just hardcode 32 directly in
the code here to make it easier to read.

William Breathitt Gray

>=20
> > Also, don't you think that with BITS_PER_TYPE(), in case later the type
> > of 'state' changes, it will be reflected in this code without any code
> > change?
>=20
> If it changes the bits per type will be least issues there. The rationale
> behind is to have code readable. In proposed change it is not.
>=20
> > Let me know if I have misunderstood something.
> >=20
> > >=20
> > > > +	DECLARE_BITMAP(old, TOTAL_BITS);
> > > > +	DECLARE_BITMAP(new, TOTAL_BITS);
> > > > +	DECLARE_BITMAP(changed, TOTAL_BITS);
>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20
>=20

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl6rYBwACgkQhvpINdm7
VJLECw/+KAFotSbxboM6/EahiZDg6o8VINH7Voi6PxMY138JFAJuvSOH9WXnsB04
3TlevS6jVx2FsANy/U24AjNejr3V4CCcICuKbGJSHvPN/1qujHVORBAAKQXESA1u
Rcbp4bsCWwRvPfm5g3OHqqeoku8n+SEp/kvryk98/ejV8z8JWstw/zDk6cMQEuwx
a+Qu6xHFeLD89RMBpQ0+jLFYYfXVFUiSx2I37d3klJdo1a6Y9ciFpETgYi0gdecW
O8byAK57VtfjAuBEg3DQdsoSO5elteH2c00ooIGVl2of/+xBjmk7c3g4bS1i8ruj
uvd0YZy1xoqYB1SFm+V78nUCYmY/I4+yxye8z6obXmcFrGQBCvCXAw+fOnbCbp7k
ijpQcrPnNEzfZuC7Pi6VHVw7CQTcVoounIFvmh/udY0zUZYxrwHwf8wUvbDibbO8
y6ShNwAFxoWvQVKD9x4cDe2j6j7tgHpJ6MpAtyOaCEDoHJNFbs/mAK1IlFtx5l1d
jKBOp9SfZUyjqHLr1o/5a39EzcYS0HhOJmM2vTB7atIwACe/ER6lsvJcdwJfmxIg
AWZHneJQTfYOfMhmLl43uDrkABMhHzvicu4+1316z/3iEBmLGpssyhICQh5jRSwY
EHHmh/O3oR+9E0G8zPZVg68f/tXB4cQ3iPeFQwYrYKuI5/b0J0c=
=Hs0E
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
