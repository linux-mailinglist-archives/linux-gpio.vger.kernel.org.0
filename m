Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95B98663AAE
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jan 2023 09:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235227AbjAJIP2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Jan 2023 03:15:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237848AbjAJIPY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Jan 2023 03:15:24 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD8164F9
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jan 2023 00:15:23 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id c82so3771204ybf.6
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jan 2023 00:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9pgLTdpvWw2skhjb4T56kILYZt+xH34j9kjUZ75HWSc=;
        b=VSOCSfl0vMa7Mgocmkd7GP5+VwBzlOHM8BHouJaEMVZy3NMpSZsrM66VuN2U5DNwfi
         OB00YI1nkp3DXd7dQqDwYZEM7eRCYImt9K8fbrCGDrCykZDarqlo3flzn+WEhxrJcfxU
         7Ia1K4ut7ELQX6fW34m0gCNp7+1LbCpab9YAflvGZVXBZ9f2JLL1VPwEhj8rkkYZBkZT
         hGW9UDkYPWKX8ZAsI4HUbZZXkW/hQmUMyThJt+ixQ3xBv5BmkO0DRs3sZtY40jlqnLr4
         eBhaKwtO3f1ZLDyr2stdrm6lcIlz3asTEVh6bI1LXn0+75sR38AHE/nOOW8+ExMBJOeS
         Q0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pgLTdpvWw2skhjb4T56kILYZt+xH34j9kjUZ75HWSc=;
        b=FFA6klJbNdMfhhle3+z7uF/NnqhSp79+Np1btFLaN2yk3LU5G0rn2pRcY7B4EfvmxU
         x3dBNzU9/NVGHDrNSi0yeWnEF/VmzRGuAZY2NvThgWPLgil4Bfeezhs93WmAvB4nAYCT
         I7CP5RGDw0HxriAt9KD0brmteLRm3VVKfizcj2ODkXa0utFzbMbBAImpacrbQMnbF4bl
         1EDzz8VGgj1CtKLyxBeH+4awgODj8dv1kMGmiyqrsTiBf2763jTkh6Dh9zqvk4dV/RyG
         pv+jOujOjHes8bKgiB+s7M9CO/ChciBKBi36sA8HNAd/wEHKiy+pKI5Xz//dJ/PgRuwt
         r1fQ==
X-Gm-Message-State: AFqh2ko9/e0ayHXxHdgwvVF4T0lVsnlqo9kxkyLPxwUqQhMWjV9MsHyJ
        DQar/qLmgGpAjqqM4dJCZrtTsN4S+4rcDZEzvzUB2A==
X-Google-Smtp-Source: AMrXdXu72/6OnGsmGp9R8TxFpMf1pphZYj6NyaqD4j9V8BNchawfB676VHxYCeEsZkuxmSi+HAVFn+QGRomSFSGqO5A=
X-Received: by 2002:a25:8e8e:0:b0:6fa:a54e:9276 with SMTP id
 q14-20020a258e8e000000b006faa54e9276mr5388853ybl.460.1673338522267; Tue, 10
 Jan 2023 00:15:22 -0800 (PST)
MIME-Version: 1.0
References: <20221215213206.56666-1-biju.das.jz@bp.renesas.com>
 <CACRpkdZCEvpLAWvH7pCLH7KwbDMzz0EN+4HbxVGfFPi_C1b8+g@mail.gmail.com> <OS0PR01MB5922FBA488F80DFB08FE16E686FE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922FBA488F80DFB08FE16E686FE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Jan 2023 09:15:11 +0100
Message-ID: <CACRpkda1JDaaMnCx81oZ2Wmm1_rfYgsaRdBGT0jCyczNSHc4og@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Add RZ/G2L POEG support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Drew Fustini <dfustini@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 9, 2023 at 4:10 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:

> > What's wrong with using the debugfs approach Drew implemented in commit
> > 6199f6becc869d30ca9394ca0f7a484bf9d598eb
> > "pinctrl: pinmux: Add pinmux-select debugfs file"
> > ?
>
> I am not sure, we supposed to use debugfs for production environment??

It depends what is meant by "production environment".

If you mean a controlled environment "one-off" such as a factory line,
a specific installation for a specific purpose such as a water purifier,
that is very custom and hacked together for that one usecase. It will
have other hacks too, so then Beagle is using debugfs in "production"
if that is what you mean by "production", i.e. used to produce something.

This is the same "production" use cases as used by i.e. the GPIO
character device.

If you mean that you are producing 6 million laptops where userspace is
going to hammer this constantly, then no. In that case a real sysfs
knob and ABI contract is needed.

Usually vendors know which usecase their hardware is intended for,
there is in my experience no unknown target audience, so which one is it in
your case?

> > such as a list of stuff to be exported as sysfs switches.
>
> Can you please elaborate? Or Point me to an example for this?

Not sure what to say about that, you will have to invent something I'm
afraid, good examples are in Documentation/ABI.

Yours,
Linus Walleij
