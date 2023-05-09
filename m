Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9DBF6FCAD0
	for <lists+linux-gpio@lfdr.de>; Tue,  9 May 2023 18:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235848AbjEIQJ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 May 2023 12:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235849AbjEIQJ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 May 2023 12:09:58 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B19834EDB
        for <linux-gpio@vger.kernel.org>; Tue,  9 May 2023 09:09:41 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7577a91cfd6so137139385a.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 May 2023 09:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683648579; x=1686240579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15fvxsClJ8ajL8Xrnd/7Po8UAojxsnw+DrXatQWfl08=;
        b=C+WuEdM717CPbnAntVGGD1ug7rS29yE4EYPe7HaC8x2eUUB9j9ZEaybYQodYAegp6D
         Fx7/+O1Plq4Ud25EITrjIhXfO+odGnAkBdHnT1I0smzgUaq0SZxHqhFvkQAHKwNtoy5T
         ZQjd4peQ0eXQHNkzP5FHtKotZ500nuh5yu7zycFd76OZYDLSbU4j3gXRyZiCGVaeDtGZ
         LX6nuBXvuGlWhIBeOROWrwadDzSspTscsgAf1sh7ZeSbaPQTIdbcHucsattANFtk5O05
         oEBYe/Lu982WqJ7fjAngybKbiNfvt46O7bcDAsP49OklvFMIVsFwZ0HHo/TjQmgQyTPP
         Hfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683648579; x=1686240579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15fvxsClJ8ajL8Xrnd/7Po8UAojxsnw+DrXatQWfl08=;
        b=U2alVZH3lyb+cD+0uQTvvQbhhHd4pLShl21JQyaNDNkI/6yPoegJfxV4HPIB+XI0zh
         kuRrCaQTL01FEGmIi90g/4j7B5hKZ129YHS5QOXdysQmFHVVbfERGsmYTFtI9ktrTwM8
         TQsWbHdB83s7qZCXPYvdQEbP4r2A7qJEEvV6ivdj6GIDpxZwfRwc6nG9eWPui99/pGMI
         GFyEfsIFD5vMBh5G1dTqlT+xstmroU11HkKOTveOOUGp/U1l25IwhJsdzbie7qxgqmcH
         yg0sHOM/GItzXk8KCEpseXWBNYSDknvb7HzP3JGdMaNYgMx+7z/oGPtSnjgw2IrRuuAJ
         tsIw==
X-Gm-Message-State: AC+VfDyLPEDb7j068ifICuRXZzVPagBrX6z5NSLmHoYsHpKtyA47D58a
        YphjjTfAvOKaXsy9e4toopHlLdSoB9p58xRW+Kw=
X-Google-Smtp-Source: ACHHUZ6eV+pEfFSKP/KS+d2MKziCgeJ6w+giRVIc3AAD8QKx48ZwZORmhlLc7aiho9jqbCIc782uPLhUK/fLr4kXdXs=
X-Received: by 2002:ad4:5dec:0:b0:621:41f6:1f7b with SMTP id
 jn12-20020ad45dec000000b0062141f61f7bmr1933287qvb.7.1683648578746; Tue, 09
 May 2023 09:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230509160016.1074446-1-shenwei.wang@nxp.com>
In-Reply-To: <20230509160016.1074446-1-shenwei.wang@nxp.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 9 May 2023 19:09:02 +0300
Message-ID: <CAHp75VdodcyQH+O3Pqa57KrJCsFytQDbz-nqoWbZ0727L+wXjA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: mxc: use platform_get_irq_optional() to
 avoid an error message
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-gpio@vger.kernel.org, imx@lists.linux.dev, linux-imx@nxp.com,
        Fugang Duan <fugang.duan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 9, 2023 at 7:00=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
>
> From: Fugang Duan <fugang.duan@nxp.com>
>
> Use platform_get_irq_optional() to avoid an error message for the
> optional irq.

Looking into the code more, this won't happen as the first operation
is to check how many IRQs the device already has. So, you may go
further and kill that irq_count variable completely with your
suggestion.

> Restructuring the codes to ask for the first mandatory IRQ before
> the optional one.
>
> Fixes: 7723f4c5ecdb ("driver core: platform: Add an error message to plat=
form_get_irq*()")

Hmm...
With the above, the proposed change does not fix anything, I believe.
And I'm not sure that this commit is what we want to actually fix.

--=20
With Best Regards,
Andy Shevchenko
