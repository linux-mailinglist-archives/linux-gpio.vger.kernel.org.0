Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3572F571CA8
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jul 2022 16:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbiGLOa7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jul 2022 10:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiGLOax (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2022 10:30:53 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D3523BE3;
        Tue, 12 Jul 2022 07:30:52 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id v10-20020a05600c15ca00b003a2db8aa2c4so4919237wmf.2;
        Tue, 12 Jul 2022 07:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=bzwxy70TNOzVzbC2SQ6pvxX4LI9i4auhhVyInyenLbg=;
        b=iiLNdHTC8ESUCoAHkM/+WlHCV0Sw8CzK1CV5E4nKh5s0HWbiBPfsQXDmKQCIQMvsO5
         EBw+FZRQr/NfAxusxfMt9/y9ycRcOcthOKHMKJdpjTU4v+soZknV+8Vc+uDD9pAZ7xLR
         2iHXxvLSi2yCxTeDI3P/2EURCcQuYlv4Fli9+fUqvpASymmcmC1+mdHrSMMUb1LS9Oxo
         ZEBr888IZ2Mitnnnh6AUYHDXNT+P4sS6B/7tcvUmIqc/q9hEjs1rLKrlCMX6+CY9ifIo
         MZ88IZHbppWvq7YbXZpanMSwMRZrM0zaKkWbTQfAL6aAhF/WHboXOLrNuT+exLr8xI4i
         LB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=bzwxy70TNOzVzbC2SQ6pvxX4LI9i4auhhVyInyenLbg=;
        b=73cHvYrhANK6Xs2yXj1J2N7uzQApTrffd27JNScQWpGAEbzhS0/rvWCDdIe5b+kDuU
         219zHQzP2/En4g4RSxFhpJwbKqymfmxFJuvZNciV6Sg9rTcAiJHr5UtErqfiEp6oRlg4
         4wjuub3iwyt6u94vXGjA2ihK0Ydie85b5kSyuJRaVCOGoxCpsJ7LBGNaTjjrqk/jcEhC
         goFhJR4t5B9ePe/hjKE2aaAJHkW5fxBRexofp6+1xdxj0HM7KPwJPj/hNAuhhPTR/Lhr
         9KOnWE9KTS1Fu8YpWovrQ0jzORw0tMI7uuPShvVLj7TnbevcPXWX3zd/ml/7i/Px9bp8
         Mjsg==
X-Gm-Message-State: AJIora/Xn8rYGTGGAQGAq3+bFDBCd89mvSJROJ0qIePPR7EDu2vDkG6a
        qgQPWgqsrYQ+m6ByjyHLx/c=
X-Google-Smtp-Source: AGRyM1tG2wW154+SibgSBju+PDxt2tIJ0H01DgYNd4GXlcgDCdTYxqt2DoAhWPKhuoYxERcQ7TwiHw==
X-Received: by 2002:a05:600c:1f08:b0:3a2:e82f:7b49 with SMTP id bd8-20020a05600c1f0800b003a2e82f7b49mr4172537wmb.11.1657636250998;
        Tue, 12 Jul 2022 07:30:50 -0700 (PDT)
Received: from p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de (p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de. [2003:f6:ef03:6f00:5de6:a4d0:d791:ed01])
        by smtp.gmail.com with ESMTPSA id bd10-20020a05600c1f0a00b003a18de85a64sm1915169wmb.24.2022.07.12.07.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 07:30:50 -0700 (PDT)
Message-ID: <cf0a46c499de1f97987b231a0b162d09f961b702.camel@gmail.com>
Subject: Re: [PATCH 04/10] input: keyboard: adp5588-keys: add support for fw
 properties
From:   Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Sa, Nuno" <Nuno.Sa@analog.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 Jul 2022 16:31:53 +0200
In-Reply-To: <CAHp75VfqT7L7EkSt=6DTwYeK-Nz6pX9edhrfoAR9AUTz40pcMA@mail.gmail.com>
References: <20220708093448.42617-1-nuno.sa@analog.com>
         <20220708093448.42617-5-nuno.sa@analog.com>
         <CAHp75Vcv8i-XXarjA=sE_gkG57ngADLrsG2=xA71zOfxtfEUCg@mail.gmail.com>
         <PH0PR03MB67864AAC5B51C36E6FB202BF99829@PH0PR03MB6786.namprd03.prod.outlook.com>
         <CAHp75VfqT7L7EkSt=6DTwYeK-Nz6pX9edhrfoAR9AUTz40pcMA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 2022-07-08 at 17:07 +0200, Andy Shevchenko wrote:
> On Fri, Jul 8, 2022 at 5:04 PM Sa, Nuno <Nuno.Sa@analog.com> wrote:
> > > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > Sent: Friday, July 8, 2022 4:56 PM
> > > On Fri, Jul 8, 2022 at 11:37 AM Nuno S=C3=A1 <nuno.sa@analog.com>
> > > wrote:
>=20
> ...
>=20
> > > Okay, you add something in the wrong form and then fix it in the
> > > other
> > > patch in the very same series? Please no ping-pong type of
> > > changes.
> > > Squash / rebase your series accordingly.
> >=20
> > Well, I thought to just copy it as it was on the platform file and
> > then just fix
> > it with the rest of the coding styles changes. But I'm fine in
> > fixing it already
> > in this patch. In fact, there's a lot of defines that are not used
> > (it's just
> > defining the complete register map) so I can as well get rid of all
> > the stuff
> > that is not used anywhere in the driver.
>=20
> This needs to be split to:
>=20
> 1) fix existing
> 2) move data
> 3) use that data
>=20
> Or
>=20
> 1) move data (no other changes, if possible)
> 2) fix data
> 3) use it
>=20
> ...

Well, I think in the current form is already your option 2... And fix
is a strong word in here, these are coding style changes :)

- Nuno S=C3=A1

