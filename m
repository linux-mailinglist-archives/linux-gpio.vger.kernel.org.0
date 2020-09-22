Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B602C273C98
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 09:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbgIVHta (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 03:49:30 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:41381 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbgIVHta (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 03:49:30 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MOzKk-1k6P3d0A4y-00PKtg; Tue, 22 Sep 2020 09:49:29 +0200
Received: by mail-qk1-f182.google.com with SMTP id v123so18113911qkd.9;
        Tue, 22 Sep 2020 00:49:28 -0700 (PDT)
X-Gm-Message-State: AOAM531ZFUTnbSmypveE+jUMffJhMe8lNY/KWxV6p8PVe6DX97+De9HA
        E/oazWY8apFCIUvezrtJDCWOkmZrvjIG7NH6O5g=
X-Google-Smtp-Source: ABdhPJyZZznlqhSr5J8IOwSku7whjXYVQmFIg1M9KBLxnCkVehJr8wqbYHlXdmTXQPMlzHb/UD7DvboRj1Ve5Zu1+jY=
X-Received: by 2002:a37:a495:: with SMTP id n143mr3586473qke.394.1600760967845;
 Tue, 22 Sep 2020 00:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-14-warthog618@gmail.com>
In-Reply-To: <20200922023151.387447-14-warthog618@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 22 Sep 2020 09:49:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2S3YLgy001xB-xWib9kYkkQKgFmEEP1MGYFhvd2HZAXQ@mail.gmail.com>
Message-ID: <CAK8P3a2S3YLgy001xB-xWib9kYkkQKgFmEEP1MGYFhvd2HZAXQ@mail.gmail.com>
Subject: Re: [PATCH v9 13/20] gpio: uapi: document uAPI v1 as deprecated
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:EgzyUQXwFBh7UCjJ0DpZUYIAqqj4YPg0BG+BwaTPQ2rEhpcEAMu
 ZXRT6WbcVbplxd0RXubQB2S0EtzJ5nURX7Qab/S+oZSSt4doR0PbS/rWDeXZenqt9laBhQK
 TqeeA/ADBnaCoR88/U/VZgodmSJO2g7nW4F0sX5cHTuIzjKLtDr5V+VX+mJt5E+jftayXdp
 ays1FGROJ0VsSfRGoeV1w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:C5fUskuET6s=:9dRx9VZaTzBXjwOZIT4/WD
 PXFNVw+5OW7vxuY89AmnjZe2S7gkfCmRq8daYWCAyLNIR1cWJqoXgHiB8bRwbSKcxlz/Xqbr/
 LfVGgDgAdv1AC9vhfjAu2paYPfHF9B/bpRP4aVr2mduGQRZfSb63Rewj35SKNLeioVABzoSCK
 YTWKUV6OgApCFWKTCW+KwsKjo3P2HHleRdctvb4bVBb/mjhzVJH5yV2s4n0vvgy6/fmiH+tmX
 cezLyjbPNW1Gxk9dhLfdkrOnnTO00ju/YNzgAOJsMTXS/WHtdoqhEDmbdT8u33yqG62adS4yj
 VD4hJMbRmli/00l+5l7kb4xJUBHrDGIni0J4yw+UhCgoK2vW3BGkDiR9qDEr3VoulWJ74DDdL
 4gnY1RNc78XMFmPhaWoqHSmMiKCPezYkhv3X6fh0/jWvEKdbhOQt3EjYoX2RubIT7AwPKi4WN
 yo3bypjO6JDLeu21o73JNKATF9dzlg2zLwStr320VEefyLSB0qdo0Ndm5Eqpuq3egrwx8Z6tv
 n87TYRJ+wUh2ELhgy+XOzwTn4q6C1w8gBKeH5LhfGBRHCDqb6+4FAEv4Iy/TUf0mUGcYIIklF
 mlc0VgX/tJJsQIxggV74zODyBk+mOKOJQ/IF9qedJe4IOYZIdmSHMOfok4/iFvrICJhTc3WsL
 r4Ko3LbLukYqGQXmA84muFkxnF5uRBH5S1F2bE8+tvc9h3irnvKoUhcMvarYFJErlW3J6v3tx
 DsUEUxqZJmvJOItmDZ/sw1qog70QtEgUkoqpv7AujlDKM+/r/vZyqW78KAPYGCdkLdaU/+8t7
 1Q1T+bOIGaqU29Lt7IL/F3X7PONqo13eZQCGMUXEKdrngy8SdFM4BweSOGnSu8/D7hs0A/JVI
 F5ndNUjmXPgbCLestQ5eveCcY4XGzWIl9/USYtj4rmxMAh3TNxyCpzAcIQVywOvMdsrWP4hkq
 Bx63CZvL3iwRARaD17JNtirjw3hjaClnlmtdJDwltbBgghW3LrMYu
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 22, 2020 at 4:36 AM Kent Gibson <warthog618@gmail.com> wrote:
>  /*
>   *  ABI v1
> + *
> + * This version of the ABI is deprecated and will be removed in the future.
> + * Use the latest version of the ABI, defined above, instead.
>   */

How intentional is the wording here? It seems unrealistic that the v1 ABI
would be removed any time soon if there are existing users and applications
cannot yet rely on v2 to be present in all kernels, so it sounds like a hollow
threat.

At the same time I can see that telling users it will be removed can lead to
them moving on to the new version more quickly, so maybe a hollow threat
is in fact appropriate here ;-)

      Arnd
