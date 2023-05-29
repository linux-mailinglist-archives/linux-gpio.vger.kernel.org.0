Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AAA07146D2
	for <lists+linux-gpio@lfdr.de>; Mon, 29 May 2023 11:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjE2JIL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 May 2023 05:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbjE2JIK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2023 05:08:10 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75999B5
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2023 02:08:08 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-565a63087e9so41569277b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2023 02:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685351287; x=1687943287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czKe3+OmUvIsF46Cr74M2YagU7bLWoF6T2tvzMeSlIg=;
        b=O+A2G/w0fOq+1Ct3SKL09BppJX3dlGxHqIbZwduCd49YuqjHRRwvehja/JiS5c0V0B
         342USrUWjCMDNqmrMyuNd+eEWhWMMy7m2DksTK6k50+Ha4cj+CUk2XLVVJ3WcK2WsYm6
         o83IHJldC0MEoVSD49MGLKzDUqRKbp8HMeN9HD9+dO72HySbQGC2LKOlS7MEUpXPgJq3
         WqgzfEPCH8gSUDFWaoqTDocj+LXRolU2s5nIw2FGB6QQFgF/PDjh2HTWBIj6nodnDfzi
         LIZmPg4qrAWPSqUFHDIR5OP0zRvTCcqjdTYOvTAJoNwkV2wkk9hoaUrPa4/IJmlDrNvI
         6iMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685351287; x=1687943287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czKe3+OmUvIsF46Cr74M2YagU7bLWoF6T2tvzMeSlIg=;
        b=UjTgMdE7qF1tnxPyVyeGeBKWYrJk69Y6LLZRNpmQ7oxM9HvO9uafwrmrB2UGwwKxri
         GGHi/eYcPWBfXWtzjiE2hKRT57Ynkmybv7jicnhKqBts/bjHV5CnlOtxqqfdS2XQSioR
         s0cKIWFXKHA1MxGMmMOH4CsuNFVajFK/v46qcgTvaBlvM2p8wuKFe4ecES6WpqmbysiP
         3RDFv4IFntFXbPTnxT79AKlIeehB45AGwlKgBcpQjBAn4q6tEgqGFUZTzrzpHEKBUW+c
         ko4McLkwSzKMotUkgk+0fS642tBH+SrGiItn5JxsG91SSYWFUmXBPGHv6sJ5WBa2gLW/
         i68Q==
X-Gm-Message-State: AC+VfDznpLrE561H7uDAER+6SW5itbtm3zpgBoEd94DhJKKNGpAsdFr8
        vS2cWmeKNCEyplPebZskqNbGB+6hVb+xZyf9or/Kqm41U7C7W9rd8UU=
X-Google-Smtp-Source: ACHHUZ6LUBrgAChKEEZijUBR0nGS9EV2XOn4iKqsyD8ikgHGOJaeaNpBTgkAskqoUZN9p7Fp5HZJakOFGWJYlITG3bI=
X-Received: by 2002:a0d:eb0d:0:b0:565:cf47:7331 with SMTP id
 u13-20020a0deb0d000000b00565cf477331mr10291900ywe.2.1685351287600; Mon, 29
 May 2023 02:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230512042806.3438373-1-chris.packham@alliedtelesis.co.nz>
 <CACRpkdYz9ipNTo2ORXKWy5Q4uCpKL=9Gd+kK76pestX7Onuz-Q@mail.gmail.com>
 <b36fcdf1-45ab-0c06-efe4-237df0612466@alliedtelesis.co.nz>
 <CACRpkdbiSAFoJP_JB1d_6gQ+Xx7Y+mLAh=C6Za+fpyWuRe6Gbw@mail.gmail.com> <31a23398-9b0e-4a19-3576-84fcfd3ce4b5@alliedtelesis.co.nz>
In-Reply-To: <31a23398-9b0e-4a19-3576-84fcfd3ce4b5@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 May 2023 11:07:56 +0200
Message-ID: <CACRpkdbqq1=8SeN18V_iyFQQ00bd8Eia5okB1v3f=nZQOnSiTA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Avoid side effects in gpio_is_visible()
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "johan@kernel.org" <johan@kernel.org>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "maz@kernel.org" <maz@kernel.org>,
        Ben Brown <Ben.Brown@alliedtelesis.co.nz>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 17, 2023 at 12:19=E2=80=AFAM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
> On 17/05/23 01:57, Linus Walleij wrote:
> > On Mon, May 15, 2023 at 12:27=E2=80=AFAM Chris Packham
> > <Chris.Packham@alliedtelesis.co.nz> wrote:

> >> The crux of the problem is that the irq_desc is created when it hasn't
> >> been requested.

> > The right solution to me seems to be to not use gpiod_export()
> > and not use sysfs TBH.
>
> That's not really a feasible solution. I'm dealing with application code
> that has been happily using the sysfs interface for many years.

I wonder how many years.

The GPIO sysfs has been deprecated for seven years:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/D=
ocumentation/ABI/obsolete/sysfs-gpio?id=3Dfe95046e960b4b76e73dc1486955d93f4=
7276134

My fear is that deprecation is ignored and people still develop stuff
like this ignoring the fact that the ABI is deprecated.

Yours,
Linus Walleij
