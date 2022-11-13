Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC6EB626FA3
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Nov 2022 14:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235014AbiKMNIs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Nov 2022 08:08:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbiKMNIq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Nov 2022 08:08:46 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD16C6448
        for <linux-gpio@vger.kernel.org>; Sun, 13 Nov 2022 05:08:44 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id l42-20020a9d1b2d000000b0066c6366fbc3so5286809otl.3
        for <linux-gpio@vger.kernel.org>; Sun, 13 Nov 2022 05:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zyETYDiRN3VplmbENm82U2H3FCfTggZYLpOpQqSk3NE=;
        b=cIQBkZ6n8OcicnSebegRPdcOnfQdOIpwaqsw4zQcmRNIcyrZsAYJ5gkwO7Ib7QsC5T
         JGmSSAnoRIkOHcUnFuZabglwSnks7TdzHCMQPoRI0mtYhcGe8NdPHPMruw18+1lPcEht
         bvWBCTZcMxB/3YVDfqVTLpw8kBgBUPlNCOUNGmuG8lCVQwEo4XT3LG1WONOUiOwd4XGF
         1hBk3t9IgNoiwTYo1IMt/DDxiXHupTvMniix2/lv4fybpmL6EigPKgo5oMV5XR+K6fB0
         w2Zsnowbydj/WfBr1qyPIuVcpeMecU/zIPfS98KpQKMolKZ9qbUDQoqNpvLHT6imB3II
         V3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyETYDiRN3VplmbENm82U2H3FCfTggZYLpOpQqSk3NE=;
        b=CUQBMsQ63eY4MxKWCTJ2nNCrKZUVF3ciFPwlvfHAlnrpKNBDzw7snafe2e6vB8ADgU
         68A4244si+zZX6cuXD3X0IKBJdZCx8BN3PRtqsN3GUtwDVtdcnfYTk8ftKDM4/3s0lde
         dS5hX41PodQTftTWQMzfn6AH+RbG1CaSWJcDcuExOIvZnF2VPpDNk+ETJFYKOy02hb2R
         wXrV3zyetft2tXVmPbOc3Ldm2WNKxJWPYnGNBpZZ+4ul5twmLD8Hwpx9JhNbKLdbrUpm
         6DQvST7ckIdXDDgrnFj0iN+H+rbrtlTvuTulZjISkaXSXFmPKrynp0lQBm98dS4+Nd5Z
         DTwg==
X-Gm-Message-State: ANoB5plbMTNhqmeBWGKR/zaUNY5spRVtC9axV/xJxm/TEKuZv7u+gCkS
        029RtHlm7/txZ8XUrwtK4Cjm2m1ER0uE5w==
X-Google-Smtp-Source: AA0mqf6+2/Kf1TS6UmIUGlAGSdFVvvwScfE4w+pqp9KJrFRimpQq2T3rPLgyXgCr4sJ2ukjHhyK7hw==
X-Received: by 2002:a05:6830:1657:b0:66c:7856:3f72 with SMTP id h23-20020a056830165700b0066c78563f72mr4607019otr.136.1668344924170;
        Sun, 13 Nov 2022 05:08:44 -0800 (PST)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id h24-20020a9d6f98000000b00661b46cc26bsm3038805otq.9.2022.11.13.05.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 05:08:43 -0800 (PST)
Date:   Sun, 13 Nov 2022 08:08:40 -0500
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        michael@walle.cc, broonie@kernel.org
Subject: Re: [PATCH v2 2/4] regmap-irq: Add handle_mask_sync() callback
Message-ID: <Y3DsWFQfE3Ov8s2t@fedora>
References: <cover.1668129763.git.william.gray@linaro.org>
 <53e9e89cc9d7e9c20cbdfc13b360dcb43d07f832.1668129763.git.william.gray@linaro.org>
 <Y3DmSfdG9ZeV8inu@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DjtPv7CPbqyv+G/s"
Content-Disposition: inline
In-Reply-To: <Y3DmSfdG9ZeV8inu@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--DjtPv7CPbqyv+G/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 13, 2022 at 02:42:49PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 10, 2022 at 08:55:51PM -0500, William Breathitt Gray wrote:
> > Provide a public callback handle_mask_sync() that drivers can use when
> > they have more complex IRQ masking logic. The default implementation is
> > regmap_irq_handle_mask_sync(), used if the chip doesn't provide its own
> > callback.
>=20
> ...
>=20
> > + * @handle_mask_sync: Callback used to handle IRQ mask syncs. The inde=
x will be
> > + *		      in the range [0, num_regs[
>=20
> Not sure if it's a typo ([ vs. ]), but if you want to say "not including =
the
> last", use mathematical notation, i.e. "[0, num_regs)".

I was following the convention used in the @get_irq_reg description, but
I agree that mathematical notation would be much clearer.

William Breathitt Gray

--DjtPv7CPbqyv+G/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY3DsWAAKCRC1SFbKvhIj
K4pEAP4rJRoPAf6w7qKx+kurONAPY+V/0kAEK9c54tLiSI0OVwD7B1Aa7Py2Mn4V
L7q5JQ0WfEulvWDyG9ctH9E81MOV0AM=
=liqQ
-----END PGP SIGNATURE-----

--DjtPv7CPbqyv+G/s--
