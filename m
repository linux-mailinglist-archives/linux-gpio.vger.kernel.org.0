Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4C6F6234AF
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 21:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbiKIUfM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 15:35:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiKIUfM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 15:35:12 -0500
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3CB26571
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 12:35:11 -0800 (PST)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-13c569e5ff5so70124fac.6
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 12:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A+RWMHtzBwH+UyEMIibHMkOjaG+jD3xP+GD0zzqH3bI=;
        b=seEEuKP+uFdqLON3j5Tj3HhI1R5c3RUDL07Ds3b27oK/IdgifhJW1x1/8yPVSduRZh
         zQexuuTwNLokZKterbhssXYUCeF6onxDKHs7tsQUJSIJ+8gIUipb6GarmTqUjGht/XFu
         RZ700XHujd8lEGrIyP4niy2vHpRkJxGDtpEcISnwRF0cQL2usKSxYICWlWhdVy+NORic
         oyj1IxWabABYTy3NB9hFeD+RfZGEqzOsxPoJHYCjGqF5QHRvnnK24UtVCFo7NQClkvfb
         Tc5GylCq76Q5SbczIvzlWCwNk9fduYnRDauYLZDprOKgYNSO1DC5i6hHrWL1d6mWmF+V
         V2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+RWMHtzBwH+UyEMIibHMkOjaG+jD3xP+GD0zzqH3bI=;
        b=8HyA1bid3zI4hNHUpswXNx7fMIQpD+M6aekPaz7Vt9UjGOJt5z4L+ZD922JN+aVWgE
         z/+lKqQPKCgRAjjiQyWYVswyaLhNKrklvEpUlQmmxp596i0xkYrxmo6wlFrDvVNmxH5b
         ox1Y3zEo6bZDPO93n20ML+gPJm13wJboUqm0JdiOGc8rNSSLrr20Ds9ONAR0KOG3UK2n
         xvjkTlJ76LAa2qzh1KAUjlfiOlwXsaibsTB6bmU/Zpmj70Iy43Ex1EWNXgS4bD6SK2zb
         mq228aaBg2/l1H7Af8Ql6OOJI3AOhr00h1/z3kjMltJFCu6Zu8+39ZB2yYx5VUgzKcfY
         0pmw==
X-Gm-Message-State: ACrzQf1Kkz4VexrZKihCKIQr5F5DcYgjaOOqFg377RU15JEvWx8/B6CN
        PBTFg/gH1cGN/8aneP5ZshbI0g==
X-Google-Smtp-Source: AMsMyM5BRu4PcnqU9PVs95CrEiZdPHOzOxktd8jbMYbfR8rLJukHCS8JtfaqqAdnVd9lxEE+I7vtjw==
X-Received: by 2002:a05:6870:c22b:b0:140:6552:acd3 with SMTP id z43-20020a056870c22b00b001406552acd3mr17196219oae.175.1668026110536;
        Wed, 09 Nov 2022 12:35:10 -0800 (PST)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id o30-20020a056870911e00b0012779ba00fesm6617548oae.2.2022.11.09.12.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 12:35:09 -0800 (PST)
Date:   Wed, 9 Nov 2022 15:35:06 -0500
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Migrate i8255 GPIO drivers to regmap API
Message-ID: <Y2wO+oes0+Aosips@fedora>
References: <cover.1667472555.git.william.gray@linaro.org>
 <Y2jfzKZkcEcQTdH5@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PdydrcQV0/345AbN"
Content-Disposition: inline
In-Reply-To: <Y2jfzKZkcEcQTdH5@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--PdydrcQV0/345AbN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2022 at 12:37:00PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 03, 2022 at 07:20:46AM -0400, William Breathitt Gray wrote:
> > The regmap API supports IO port accessors so we can take advantage of
> > regmap abstractions rather than handling access to the device registers
> > directly in the driver.
> >=20
> > Precursor patches are provided for 104-dio-48e and 104-idi-48 to migrate
> > their respective device-specific registers first in order to simplify
> > the subsequent patch migrating the i8255 library and its dependents.
> >=20
> > The struct i8255 control_state member serves as a cache of the i8255
> > device's control register. Does the regmap API support caching such that
> > we won't need to manually update a control_state member?
>=20
> Yes, regmap supports caching and IIRC it's opt-out.

Looks like it's disabled by default if I understand correctly: the
cache_type member of struct regmap_config has a default value of
REGCACHE_NONE if not explicitly set. I'll set cache_type to enable
caching and remove the control_state member in v2 then.

William Breathitt Gray

--PdydrcQV0/345AbN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY2wO+gAKCRC1SFbKvhIj
K5YuAQDTKUCgknRdaTutuxuTWu8lHtqMkKM0sXCH7VkMWDsmXQD/bIM0GnQBOyYL
mor615KanGSUauJgtJu+ptX7b5ugOgQ=
=X120
-----END PGP SIGNATURE-----

--PdydrcQV0/345AbN--
