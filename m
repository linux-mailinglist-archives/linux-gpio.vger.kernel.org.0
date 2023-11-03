Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B84827E007F
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Nov 2023 11:30:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235912AbjKCJJL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Nov 2023 05:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235819AbjKCJJK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Nov 2023 05:09:10 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C502D187
        for <linux-gpio@vger.kernel.org>; Fri,  3 Nov 2023 02:09:07 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-4abf80eab14so141315e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Nov 2023 02:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1699002547; x=1699607347; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZ+pK7HfT2/R2CHqNUxxdFop+H2f9lKl/kwZAHnUNCc=;
        b=peVp3SkoAlh8W2pFsRjsxwAJByWm5XMxfy7q/k/feck+DaefKy9kjEQgxXMFprv0tn
         aPeEdv9uhk4mbT/JkXcMPaO2xPtiPODHcj8B1zob+owyRosnx6QoOuxOBwu2GkpyZclo
         RnHVGYroa5B7+TT4gEnevwgDQRjrB5ReR3EOme1ipJUtAKJ7FCN+SoD/ITiqYU4T+zbg
         2C8XN4NzelAyBPOtj8OETwcfhLQZe6AJdGqUAuQ/Wt0gceAP1YraCPRr+1sx87rU8Rx4
         knfvb1Uh8RqgEki9wOeVXO3wsZEaHdEPOkU94E1S5MW642dp+aS5bTPHikRd2AZzjFjF
         UwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699002547; x=1699607347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZ+pK7HfT2/R2CHqNUxxdFop+H2f9lKl/kwZAHnUNCc=;
        b=tevMzm5Yte1WxQnpz2lvC2jm7Oy1aNfTClFFS7pvE9vSoKYLqlhDPsyCTahAuzwTxv
         LXnV75fZc22tCIX93lh/fDNAX+QMwzw/kRyOND20BWSuALe6LE0Jdkx3YX10bBIRfV3m
         VP5Y6gGX34JLXND/coQV6zfXH+YIMBFr1Mz2etNbHGhdI+Zcmr+WbtH3H6lTKbLefOxJ
         DLOeQWGXEhqD17kECsDKosmvX26WHY+SfMvOnDaweuU3cPk7tuqVJo1B4nXmU8DLYvYM
         JFFnFACcGu1KME/1mm4rLUvU2AmBsFKOru2fXJuPRAtoxSRpTuxJA3x5ltQJ4qDSWChV
         +kTQ==
X-Gm-Message-State: AOJu0YzAgiy9Lw5TM2+kajf4r01JIKL7gRlCfQ8T0Qas/8zCvIg/LUvS
        Fvf7co8mqTC7hdoAUX2Sxe5cTWiHw6dvSk+NnIXB2w==
X-Google-Smtp-Source: AGHT+IHMP14aNnuPk/M9auTqU14X1reP20Ndq5FFB6ZsM/lAvTNnyVHqTdzd4iYuirkmf+ceV4tLz2fWcV0BuqJs+S4=
X-Received: by 2002:a1f:a6c9:0:b0:48f:8e3a:5b83 with SMTP id
 p192-20020a1fa6c9000000b0048f8e3a5b83mr18714917vke.14.1699002546868; Fri, 03
 Nov 2023 02:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231025184259.250588-1-andriy.shevchenko@linux.intel.com>
 <20231025184259.250588-2-andriy.shevchenko@linux.intel.com>
 <2023102624-moonshine-duller-3043@gregkh> <ZTpbMVSdKlOgLbwv@smile.fi.intel.com>
 <ZUPBVMdi3hcTyW2n@smile.fi.intel.com>
In-Reply-To: <ZUPBVMdi3hcTyW2n@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 3 Nov 2023 10:08:56 +0100
Message-ID: <CAMRc=MeV9ZyOzuQFEE_duPTHYgfmr6UZU6bpjDPhrczZX4PHpg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] device property: Implement device_is_big_endian()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 2, 2023 at 4:33=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 26, 2023 at 03:27:30PM +0300, Andy Shevchenko wrote:
> > On Thu, Oct 26, 2023 at 07:25:35AM +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Oct 25, 2023 at 09:42:57PM +0300, Andy Shevchenko wrote:
> > > > Some users want to use the struct device pointer to see if the
> > > > device is big endian in terms of Open Firmware specifications,
> > > > i.e. if it has a "big-endian" property, or if the kernel was
> > > > compiled for BE *and* the device has a "native-endian" property.
> > > >
> > > > Provide inline helper for the users.
> > >
> > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > Thank you, Greg.
> >
> > Bart, would it be still possible to take this into next?
> > I would like to have at least this patch applied (with the first user)
> > to allow conversion of others (I have some more users of new API).
>
> Okay, seems we missed v6.7 with this, can you then prepare an immutable
> branch / tag with this, so other maintainers can pull in case it's needed=
?
> (I have something against tty already and perhaps something else, let's
>  see.)
>

It arrived too late in the cycle, I needed to send my PR earlier this
time as I was OoO this week.

Bart
