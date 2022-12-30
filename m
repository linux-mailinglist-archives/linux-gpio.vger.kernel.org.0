Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC3A659872
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Dec 2022 13:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234369AbiL3Msm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Dec 2022 07:48:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233838AbiL3Msf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2022 07:48:35 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0793E12A89
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2022 04:48:32 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id m129so15362545vsc.11
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2022 04:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=28ae5aprnMvG9EIDp12Nc2gkTPr7Zgogv/Cw+P2D0o4=;
        b=jO0PHXBfOJCKtK8hSx9u/RA3qhmJol7gY5kYjJMWyMFX7VyBFEN6QnhhK88D034q0s
         tSFnN5tG1povXjsITXAD25Vr19Dcawd/JSlDMb1exxUZ5ctXXRHW7WXkePllfPgZeI/S
         oE40rBD3G5FGZTA8E3Ow2pyCoGazQ26as531BgENMEBIvlbx2ROAuPwK4jDDm+VSJ3uo
         j7UimB64wP3ilr1mp+C0r6YllZ9FIQsy0zmFShD7F6NJitOQcj83gdNmkLh5kt5Krw6L
         iuZoGkFkNmxMjSqZoG9iteEIdtMwQGl/8IqHW3gDczrb2C7OYiwQzwOJxtPRHPpGE4HP
         hQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28ae5aprnMvG9EIDp12Nc2gkTPr7Zgogv/Cw+P2D0o4=;
        b=VZeqahCjf14sDkdJnuhmJ6X+mJTiJG6qMNc0iKN+FWClUdl0SsiGlAlQA8xxjQh+fA
         gk4E8UJ0ZwZl+/EF+zUt4h4NwGoyteK39UpChBcEmF29+kUz6PsR/mx2DAVVeWDOklai
         rNZ0xvS8M3mLT8OB7wpWq+rMQ6lt7SQD/lV+vDOHE0fttdphhgeZGCXjO8YDSi1eoxRM
         mSb14GLDuMTPG2SRitNBc47DEjJASoc0tIXQlvjlc2luwUQgYWx3PXtoCEFRhGP5V61G
         o9G1+c5qND2UmNfShxy6+0Y6npNTTiTMxdsVJ5sQeUcFwIFnV2cX9cI0lXgrxiBFrljW
         tl+A==
X-Gm-Message-State: AFqh2kqAr7kHJ+JmD05CYn5RJLZEBq3rrI3Ea232Xl775FH2KsFunbtn
        rls/Cm9sxUgghPLlRQu8q5+10Q+zPBd+A9wI8SPxv2B4JGZJbw==
X-Google-Smtp-Source: AMrXdXvukYgv1bjyiEgT6uh9dsGIpfq0l4WOQ7H2D5ik9FyF1BMGQ+Yd3Lb67/ZrAoUcfLBORjE5zFSoGFNKoGi65Fc=
X-Received: by 2002:a67:f756:0:b0:3b1:13ee:4bf7 with SMTP id
 w22-20020a67f756000000b003b113ee4bf7mr4033109vso.62.1672404511164; Fri, 30
 Dec 2022 04:48:31 -0800 (PST)
MIME-Version: 1.0
References: <20221210220601.77648-1-andriy.shevchenko@linux.intel.com> <Y67T2u0VfSnq48KQ@smile.fi.intel.com>
In-Reply-To: <Y67T2u0VfSnq48KQ@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 30 Dec 2022 13:48:20 +0100
Message-ID: <CAMRc=MdZ4RN=EFS0Brf0Avis9FOVh9+8x5rB52b8eO_Ln+CGiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] gpio: pca953x: avoid to use uninitialized value pinctrl
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 30, 2022 at 1:04 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Dec 11, 2022 at 12:05:58AM +0200, Andy Shevchenko wrote:
> > From: Haibo Chen <haibo.chen@nxp.com>
> >
> > There is a variable pinctrl declared without initializer. And then
> > has the case (switch operation chose the default case) to directly
> > use this uninitialized value, this is not a safe behavior. So here
> > initialize the pinctrl as 0 to avoid this issue.
> > This is reported by Coverity.
>
> Bart, any comments on the series?
>

Now applied. I just got back from Christmas break, give me a moment. :)

Bart
