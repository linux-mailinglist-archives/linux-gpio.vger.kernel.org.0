Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFC596AD0D0
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 22:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjCFVuy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 16:50:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjCFVuy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 16:50:54 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8EB5FE96
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 13:50:53 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-536be69eadfso210147107b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 13:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678139452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uc3IcYB9YiiZs744OjWKhhD5khz+I9RY3/JZdELOtAc=;
        b=GfSSl7PKyDALKbXMWEoM0iAvvcBrYHg3/7bNw085mzOfE5gFyvuLhaIifsn/DFb/Gc
         JHRy11mfz7B1FsBtU4P5NrCO2EHaHe0g6+0znNtcsHXjiz2vDDggpI40PSOjuuSd1ovn
         ECvTxoGj/o2mEUz8AVKxM8tZYyAqEdFNX9K4xyfLGKcc7fezVbadnvutOwB4HECqW/m7
         SrBbAEJOvOA7kAMH0jNyjUdR5b2BAL3HGsppQZJLWamtKUeCEsLYqTGzRZinO7J6pHwY
         PBHsZXKjY3ueYUwGc9CySwFNARJQnSszj5RPSq5CUZX1bzm6dGh36OEfuVODDs6L4lS0
         tZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678139452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uc3IcYB9YiiZs744OjWKhhD5khz+I9RY3/JZdELOtAc=;
        b=iGhwAnqJY0RcSowgAkuclx71Dq6+fKiyPvB3a12NyLhvugVbo/N93QZ/193pKD7uaz
         ruLMwPfsm087pS6zmKQ98JlcsAjYTDeCt5lOVBaAEGtM5hCpzkMk67xRzl/EsqiR2klJ
         MK6uDp7rgY8j1GVKjku54bLif941zxoDM4hwIdHAQgS63TUPus+bE4tqCrw8hi1Dr5Wr
         22nz+vmtrXnDi8+1Z9hrm0SedCDRtxOW70iWG9/wSbumBvdPWphLoeWeSbuIs7YHjzka
         WY4sRoXE3kj86ZMf7O6icpyfZ7SQ5oVmE8FF6ZiapJQTtVgJOwHMaGmRyx7jHHZagt0Y
         3+sg==
X-Gm-Message-State: AO0yUKW2SoCkfSq6JvS9pA8s64980ZvV15U0Te8yO/HBXTOI1mR+kwZ0
        xwZxgFVivqj8XGGBoQetIwLTwDbu6a7prAcDR5aJcw==
X-Google-Smtp-Source: AK7set/bxbNwlhdYCuHRIIVTQ2GDm/hsJjZCgeENcowq1GuXM044zTbVSxx+PaPuxNEkCK4LKPV78uF315Kv+yo6wgg=
X-Received: by 2002:a81:b705:0:b0:535:fe26:acc with SMTP id
 v5-20020a81b705000000b00535fe260accmr7736619ywh.10.1678139452312; Mon, 06 Mar
 2023 13:50:52 -0800 (PST)
MIME-Version: 1.0
References: <ZAYCRPsKR8Je6LOW@black.fi.intel.com>
In-Reply-To: <ZAYCRPsKR8Je6LOW@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Mar 2023 22:50:40 +0100
Message-ID: <CACRpkdY3pCu6gZ-kA8uHAcCBpx_0AKwVLp+UyYO0dnWdt+fZKw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.3-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 6, 2023 at 4:14=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Hi Linux GPIO maintainers et al.,
>
> Combined series to clean up headers in the GPIO library and drivers.
> Along with it, drop a few unused legacy APIs.
>
> This tag is immutable, enjoy!

Thanks for coordinating and getting this sorted and tested Andy, perfect
job as always!

> intel-gpio for v6.3-1

But I think you mean it for v6.4?

Yours,
Linus Walleij
