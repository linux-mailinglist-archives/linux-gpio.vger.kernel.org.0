Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC1B5795DB
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 11:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbiGSJNv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jul 2022 05:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235828AbiGSJNu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jul 2022 05:13:50 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D2923BC6
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 02:13:49 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id oy13so25923610ejb.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 02:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IfKS4DEVXrac63iV1fj4hIYsQwPp/bBFV25LWok+2hk=;
        b=iyG2pL+cIipZQurGw74ASU7yV+Ehpd4dENxiNF/wD9NXiQhH3OrrdUJHGbyYUtDxpT
         YJJoDS9VPBN30hTd1lY6gUFkG1TjilW3mckz4M1xbwP4IGtvL7B6G0n0Q9MT+VT/hRRo
         k0Dn0l3Mh1SV8pWNBGldgDltFLmpUKjrrYZB++9xghRte97URry9rtbI7EFA3S4wD8Xb
         csQuuqPX6vySUs5rka6FMMfjSlmn9c8neapk9t0U3387zj2AFNmiSxbhG3/VoqYEqUmh
         zQ5PQm3gBQ6WpNVXSkANhcHeNFhrzCrZfE5d7t3XJduDY4qjzisYu/6Ceaet7aYLuYt4
         coIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IfKS4DEVXrac63iV1fj4hIYsQwPp/bBFV25LWok+2hk=;
        b=JJcIHKEX/Zd/at5gIOhhqnSEBaR1yzoTptLfm9JF/GpiCKuQLsKIcuVNDeV+i7W7KT
         PaghXY60NH9lLJ16h5qTUqkrvmsxILShlVOaPDCxhwLsr9u57sqShPUsVSd7guYAC1Xd
         qFaqV6Y3NL19X8XYsOcyOmgkXtKwzcDP4lGTv/RaU0ITp0MLmZJ9nBLUDdzkeOQ8s4rU
         idmTpe56m90cBBAgJkqyK57BVY2fZVn3DWtkCM2Q1Z8J2SRWGja4BG23c9OhCkzgKC0M
         Wn8Vh9Zs2apXsAhKrEJwfeY0WKJwGCvPHSJ8MAqyP+gSuL7JRWGJWJgRgJa3GNALsksA
         Sa/w==
X-Gm-Message-State: AJIora/2NdhWALHCTldHS5qJfmZSTrHOG397ZxSukLSrZkub7+FQdTJZ
        cyeK8spJzsFa+D/nnEnL365Ep4hPQQWANIuO/fs=
X-Google-Smtp-Source: AGRyM1t1Q71gfFAoVXNRH/Kwd2NHN13MIfucXpE7AS1OM/VhCXtS0f/sxCLe4KHpaKy6fzfX3j+39qBLb2s+GEXyE2g=
X-Received: by 2002:a17:907:2e0b:b0:72b:8720:487e with SMTP id
 ig11-20020a1709072e0b00b0072b8720487emr28642171ejc.102.1658222027761; Tue, 19
 Jul 2022 02:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220718202205.ssf3k2dqkuvc6bgm@pengutronix.de>
 <CACRpkdaBO=JzokGUF6uXZc7ASVD7LjqBxTLGwX-FShM=A9gw9A@mail.gmail.com> <20220719074919.uawwqoefcgi4rjvt@pengutronix.de>
In-Reply-To: <20220719074919.uawwqoefcgi4rjvt@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 19 Jul 2022 11:13:11 +0200
Message-ID: <CAHp75Vc=0qxzdD4Q3xG-1Ztf9tX+4Xb-KSpPE0MjCBfAPPSG+Q@mail.gmail.com>
Subject: Re: Is a multiplexer using latches a gpio controller?
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 19, 2022 at 9:50 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Tue, Jul 19, 2022 at 12:54:18AM +0200, Linus Walleij wrote:

...

> (And if you have a "native" spi bus, even better.) This way the
> nxp,74hc4094 driver becomes way easier.

Just to say (point out again?) that
1) The SPI can be bitbanging in this case, so GPIO lines can be used;
2) We have a driver already, which is called gpio-74x164.

--=20
With Best Regards,
Andy Shevchenko
