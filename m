Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 675DD639BAC
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Nov 2022 17:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiK0QQl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Nov 2022 11:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiK0QQk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Nov 2022 11:16:40 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53C1BCB0
        for <linux-gpio@vger.kernel.org>; Sun, 27 Nov 2022 08:16:39 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id x18so5715404qki.4
        for <linux-gpio@vger.kernel.org>; Sun, 27 Nov 2022 08:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AtjqZ4VyQ2SYUlYtB4PTJx1v4nCQ3nxMf68+9BKzhLk=;
        b=dONEegcNUovvXPFpBHhQ1u9J3Sw5I9EkMgV+aC9ZFLGhmzamjsXQzeHuxs+B5naUW+
         /UX5ggr5c4stnMjbiPIigvCHpnR13z8E/P+WjJPXiUV+ZBk0Q55F/vbNKiEy1JxPagXV
         wkrSVeLtpZGIWxXbIGUufp3ZHa5m+0vPbI66yeLgyJCic23Lq5aMtV1st53ewqDbEoUi
         91Xwa+kis9DY6eoIpcW7aYXDUOdyl07d9eUsAdpE0zam0tTeuhKSSX6ChuNhDn5Yf4Ub
         Lw2VRfJx7FVHbES1HuHv7pP/uOUzgvBSGGs/kVJgk0WoHDEbndFkmk4L9zWzFMRrkyAD
         bsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtjqZ4VyQ2SYUlYtB4PTJx1v4nCQ3nxMf68+9BKzhLk=;
        b=XfskYUbPpXpH40+H0BVRRDfU7XvlUUTyureQYEOsHhbQikb2QHfCVf/PF4Bt1c4LYg
         PszlPzQDCkTmUoSPonzELUDvurpLvou+89hRCN2Mo5QOCvru4NfcTr59BKQpSAE455JE
         BVNc653XxefOPLbfePio/ycqL97/UNR/ma0KqyhxQ81lj7y4PtQW4+QuQGFa3x43Nxlx
         dUsQ93aPemt4YsELIJbl9je+1VBfTWpOm9qPF4GhDjjEEz4ikGNAQ7jsaw+w/O+hDj2r
         H18GSB1BIc4tcisIoFpYHCzV9ctf8Ut6qJkS+2l+V1fH49hNy4mvNXjCBSNnWpCDgtbl
         dtmA==
X-Gm-Message-State: ANoB5pmhd9DVfAAfJV+cfFe7hVZ0Lk1Iv6ll4BWo5XZuLH/iS9b4vHkW
        PZTSE3YA45AsNdYY6HPHHH5sEg==
X-Google-Smtp-Source: AA0mqf7bJP+s8HX9nXexFryvTPjjGxzRBTHGu20oac7xJr8kzgwP6xLmJiSPwjz9kICGkeN3s6ccCg==
X-Received: by 2002:a05:620a:a10:b0:6fb:a7e6:96e with SMTP id i16-20020a05620a0a1000b006fba7e6096emr41309467qka.675.1669565798741;
        Sun, 27 Nov 2022 08:16:38 -0800 (PST)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id k11-20020a05620a0b8b00b006fbae4a5f59sm6474650qkh.41.2022.11.27.08.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 08:16:37 -0800 (PST)
Date:   Tue, 22 Nov 2022 05:29:23 -0500
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        michael@walle.cc
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org
Subject: Re: [PATCH v3 3/9] gpio: 104-dio-48e: Migrate to the regmap-irq API
Message-ID: <Y3ykg1Vc96Px6ovg@fedora>
References: <cover.1669100542.git.william.gray@linaro.org>
 <80fc819bcafe9697b6e02c0750d3cf0ea4ec9e1b.1669100542.git.william.gray@linaro.org>
 <Y3414YhVjqKakddV@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dAH3nmkLpM+wn5fX"
Content-Disposition: inline
In-Reply-To: <Y3414YhVjqKakddV@smile.fi.intel.com>
X-Spam-Status: No, score=1.3 required=5.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--dAH3nmkLpM+wn5fX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2022 at 05:01:53PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 22, 2022 at 02:11:00AM -0500, William Breathitt Gray wrote:
> > +	/* Initialize device interrupt state */
> > +	err =3D regmap_read(map, DIO48E_DISABLE_INTERRUPT, &val);
> > +	if (err)
> > +		return err;
>=20
> Use ->init_hw() callback for this.

In a subsequent patch 7/9 we remove direct gpio_chip registration in
favor of the i8255 library registration via gpio_regmap. It doesn't look
like gpio_regmap_register() sets the init_hw() callback.

Michael, do you see any issues if I introduce init_hw() to
gpio_regmap_config? Or do you think this IRQ initialization belongs
somewhere else?

William Breathitt Gray

--dAH3nmkLpM+wn5fX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY3ykgwAKCRC1SFbKvhIj
K/qAAP9JKq+jiO5wBIRFqknwUP4kgTw20obC2XXbW7O0jmpmOwD/WPCVDxfX7NxH
dwnxNFjvUotQnD29N4jiKwsw5Fmgfw4=
=aPrP
-----END PGP SIGNATURE-----

--dAH3nmkLpM+wn5fX--
