Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6942792649
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Sep 2023 18:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241163AbjIEQT6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Sep 2023 12:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353915AbjIEIg7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Sep 2023 04:36:59 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1F7CCB
        for <linux-gpio@vger.kernel.org>; Tue,  5 Sep 2023 01:36:54 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-7a512434bc9so1868351241.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Sep 2023 01:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693903013; x=1694507813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlsjQOgmFFNUt1m9Lt2zPKJMVSMTbucW1JXahOsWl+c=;
        b=kjQFtMwWkahcuCVKTgj4UpQcMKoPy3aOVTZHRmJQEB+U61qgrLEwllXyJwU+g1UKpy
         tb6tHafdslrsgAnIT7JEBQPa1HfcA8oz0APqUGyGd4KiRAxa6Y90MaOerbkYN8LOe9Se
         VftD+5i90BdOvZXornH1eYbKPFrECDzHsK+VknkskXMD9WQPaL+pj90JiKIcMu8gTZz/
         BPlbG9eXLhWXgbaII1/I7WEOaN2gW0DbRy7nXRqhnORs1UP67RpmuPwjPUj7uNxr9X3X
         1dcuaUdlUIdCyxtQGJ4t+m2ExcyadiqRnvdfy63cVeaa8iAEu+87bj9zHdbmc+0xj40B
         EeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693903013; x=1694507813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlsjQOgmFFNUt1m9Lt2zPKJMVSMTbucW1JXahOsWl+c=;
        b=fItNAhsW2QlK+ETv6wYfVVlKscxRJQE11eWlRyOJUbaiCNFmK8Du82GPwjcvnWcyIb
         aIqlWAMFh3sCpc5s4huyoGwBjw6UDsIprtX5Ikb77SBBdjBrPj4bChbhYb0eed3iX7h7
         uA/S0Zh7+1JPThpjdFYn/PAmxxA7iOQXVW4C3MyRBonO2MrmgFbGISMsID8CCq2jNHUk
         MYSlAasswadxgrDWWzcWnr2bVKGbT2ee/8GLj9P+eSs4Wb4IvOYRgr7A7z/EkvQUA0UJ
         DdLZP0LtydA2AiBWUnDktcXNxVb/XogNqCgXIol1fU1k2FudH6e1PSxY8X9a511L+ZyP
         oCSA==
X-Gm-Message-State: AOJu0YzgXv47ESazpczOgLTGihW1rj2HbmtC4B1bogTl0hgkxeywaKoG
        AUuI4cPWiFRE3VldmNXNvUIpAb7KlqV2cKAtXtb3Qw==
X-Google-Smtp-Source: AGHT+IGRDEC62pyg3qU8itOWPkFU26zCaVY/sg95ZJW9wtyl5CBJvNiHZVwFQmWXZGfA1eA8B/lFvlumQ/fKLizKsbU=
X-Received: by 2002:a05:6102:3576:b0:44d:4c07:f203 with SMTP id
 bh22-20020a056102357600b0044d4c07f203mr6688676vsb.17.1693903013473; Tue, 05
 Sep 2023 01:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230904073410.5880-1-brgl@bgdev.pl> <ZPWiZSgyar1zWfR1@smile.fi.intel.com>
In-Reply-To: <ZPWiZSgyar1zWfR1@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 5 Sep 2023 10:36:42 +0200
Message-ID: <CAMRc=MdRdiEE=FND=a2Y1XZVqUadzdx+UNgc63Okio_ha4h6jQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: rename gpio_set_debounce_timeout() for consistency
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 4, 2023 at 11:25=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Sep 04, 2023 at 09:34:09AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > All other functions that manipulate a struct gpio_desc use the gpiod_
> > prefix. Follow this convention and rename gpio_set_debounce_timeout() t=
o
> > gpiod_set_debounce_timeout().
>
> No, that's not true. This one is inline with the other gpio_set() _intern=
al_
> APIs. If renamed, should be done consistently.
>

All the other ones are static to gpiolib.c. With static symbols the
naming convention is a bit more relaxed throughout the kernel. But I
do agree and I will get to them in time. :)

Bart
