Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8BDC71886A
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 19:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjEaRZo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 13:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjEaRZl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 13:25:41 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864D2134
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 10:25:39 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-514924b4f8cso7946318a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 10:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685553938; x=1688145938;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDAdO+T0fcwkBFLiVLpEDGkZ/hLxBO5xuKiK8nObQxU=;
        b=aPS92F23GaCnop9+jYrkNTsLY/84c5iXVLIm8ERSDylewMFcBhKJeRkl6KIIc7s5bF
         RzOqMzhGNUGkqhsQ5FPwY+SFqhngMfA1RowY1ZvT2jZy2o/3XHsDWj2hkpJ+jPATjDNQ
         CxAq9EU5xQ/KvkkTLKCv0hVLgnHQi4SslrBUjGMYfkQU/hyX781PgqZytJ6GoowC0yF6
         2g+DgWTo4rXFpmvjzCgkrvHepniOmRn6qn9ns6vjkrqGNcUcuVPmrC6QuEgnatMRZhP8
         JFaqlQ4fnHC2ZIyIlMIrDNVqYycI3Z8Lf5uy0LWTUMMRO5lUbbKVkGnVk8F75Y77QYcW
         SniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685553938; x=1688145938;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xDAdO+T0fcwkBFLiVLpEDGkZ/hLxBO5xuKiK8nObQxU=;
        b=XBR/Qz2qt5glwzafnZXAeC+vUk6IlRuCVgo08l4bxjmI/CheZ/bW13JcSAi3w/ClCA
         22O3GXEOv3ENN9zB4XRdMa4eR+oNCxpzGvnSR7/12Ye7+tmUzXaG20AQ9YNbaXeDZnSJ
         5ljo4ztlDYSu0cgEBD55sL4otVh+OgIhiU/SccyEnVv06S4dNIaNiC20WMkh0SmE+Tme
         h0n9JLS9k5eioe1ZzU0RnP97/NKLtu4EvwZD5UcqpvAkcaOdXGRq3YunvMStTGXlduJf
         fpwuwkB2OQ2hNBCkjUBk2y62/1LPY4E5lEP/j+qr48p3/xjYJHpsQv8hFcJM8pLP39D8
         lTtg==
X-Gm-Message-State: AC+VfDzP3meVsWZ0czelYhCspjHxdx2b95NIPtXkyYav07KR5B11SMdQ
        khDuFsy425INDg8JR3O/Ajf+NkAakRn0sNiHCZg=
X-Google-Smtp-Source: ACHHUZ4qJTQEsnhZhF2OWSWFGau3m/JAnhGY/kQooQy0FNgfiqKDD6Yzhoif6KS9BsZP5WI4N5JJqA==
X-Received: by 2002:a17:907:36c6:b0:973:d751:840f with SMTP id bj6-20020a17090736c600b00973d751840fmr5895054ejc.77.1685553937996;
        Wed, 31 May 2023 10:25:37 -0700 (PDT)
Received: from localhost (i5C741499.versanet.de. [92.116.20.153])
        by smtp.gmail.com with ESMTPSA id z9-20020a1709060f0900b0094e1344ddfdsm9276029eji.34.2023.05.31.10.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 10:25:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 31 May 2023 19:25:36 +0200
Message-Id: <CT0N04S607VA.3M9CI50HMNANO@fedora>
Subject: Re: Publishing libgpiod-sys and libgpiod to crates.io
Cc:     "Viresh Kumar" <viresh.kumar@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9_e?= <alex.bennee@linaro.org>
To:     "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>,
        "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.14.0
References: <CT0CRWOTJIEO.20BGIDMLFM0E8@fedora>
 <visj7.k1t7273b5zpe@linaro.org>
In-Reply-To: <visj7.k1t7273b5zpe@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed May 31, 2023 at 1:05 PM CEST, Manos Pitsidianakis wrote:
>
> Breaking changes are inevitable. The libc crate follows a nonsemver=20
> scheme (0.2.144 and bump the patch number by one for every release)=20
> which breaks stuff all the time, or at least it used to when it was at=20
> its early stages. There are ways to get around breakages in case of a=20
> crate lib being a transitive dependency but has different versions:=20
>
> https://github.com/dtolnay/semver-trick
>
> I believe following libgpiod's version scheme directly is what would be=
=20
> best and intuitive. -sys crates are not usual crates and users know=20
> this. It'd be cool to not have to bump the bindings crate version but I=
=20
> don't think it's a problem.

How would you deal with the libgpiod (Rust) -> libgpiod (C) dependency
here? Should we request an exact match via pkg-config (or at least a
lower floor that would equal the version of the C lib?).

I think that there would be no good reason not to support older versions
of the C lib (at least as long as sensible!). But it may be a bit weird
if the Rust crate has a matching version scheme but then automatically
disables features when building against an older system library... A
separate version scheme might make that a little more explicit. But I
got no particularly strong feelings about this.

> This is how openssl{,-sys} works, if I am  not mistaken.

openssl does not seem to follow this for neither -sys, nor the main
package. It would also probably be a weird thing to do since it supports
other backends like boringssl.


> All in all, in crates.io follow its conventions unless there's no way to=
=20
> do so.

I think all of the options that I listed in my initial mail would follow
the crates.io conventions and I strongly agree that we should follow the
existing conventions. What to pick seems to mostly depend on how we want
the release process to look like.

- Erik
