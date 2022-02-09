Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720B24AEBC2
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Feb 2022 09:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240566AbiBIIDN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Feb 2022 03:03:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240536AbiBIIDM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Feb 2022 03:03:12 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733B0C05CB82
        for <linux-gpio@vger.kernel.org>; Wed,  9 Feb 2022 00:03:16 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id j14so4900918ejy.6
        for <linux-gpio@vger.kernel.org>; Wed, 09 Feb 2022 00:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OXAEh1c4z3zGBvrN7bqaawfr+LmWO5zTfpfSt6D+/Uc=;
        b=138w53XVROFJ27PHYBSRfd1UurXGY4tJxCUoaiLfKVJA7fxGlA5hOdvFcPG0qboIYi
         GqzXuSzFGdaWgl7YsC9PPsSoN2yJmi3CGuVJd5pbe6qTYN2vDlnSlbhGWNrL7CBD3GSc
         lf5TaSEjtwfgBcaV9Cj3hrukyk9jHryB/FNWFTWxxccBUrUIGSuUVSSeG4iaiDG3V8y1
         sf0MxXdnQJ0seEyxKO3MLVWsOvj+LMxhGbuq6jFjurzplig+4PqLKscxFlotlBcdMyrL
         4SGJbudxIFmLOUa/hlkx8DXkEEFwvgZkAIVYSjxF1Dz+j4nsEQe/IRzcjpCZ9ORCDdeh
         +Sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OXAEh1c4z3zGBvrN7bqaawfr+LmWO5zTfpfSt6D+/Uc=;
        b=4fsdAzpmKDf+Is1DNaMDwfuqD0nZWPMs7SdZsKIkLgGcIIeDqtYfTfcExHAJeISnWh
         qyoOlGEJCgVHbIQc9wXgrcnVZDkt3DRcPzF4NQKsf1VJr/RVpTY06hMsrW0tZ8QSA1qY
         yJ+etYiA7kztH6KHNLkY+83gqaMUmvUTtU59vUMHs6LxQlMGOs0/7g1/CwXogopjks5X
         m7Mj7zF3I7hZqXNCBiIJHhbT7PxmYzVtO+NHogJGLxdDKTzOUUFneBg4dFlA2qxXlwbI
         VIG7ylW3kZnf2pv9uDp5asvO3abPNnztuwCkvYag1lXTURzdCf9z7YlbrwyRE3wjU8aw
         dA/Q==
X-Gm-Message-State: AOAM531YZB2fsTXBnzdJYiWbKid0bsHdiqjRGFIZoIpVgS3dqxAnPp6S
        iURpNyPNSWfSEKeDasqsy96c8Z8NC9TY+HfcWRqi/rODHts=
X-Google-Smtp-Source: ABdhPJxs0sHWF75bxryzvQ29jRym6j1/NHApwIrt5dBmmrDtkQp8ZJ3WvACKcICvVJhTSnkJ9/AU87FtXZEMsf8TE5c=
X-Received: by 2002:a17:907:728c:: with SMTP id dt12mr831067ejc.697.1644393794989;
 Wed, 09 Feb 2022 00:03:14 -0800 (PST)
MIME-Version: 1.0
References: <20220208105218.316834-1-brgl@bgdev.pl> <CAHp75VcOTiAgHjPoKQP+VTGZ88Y5eh1uw6L11yGEkDyX8Rj9Tw@mail.gmail.com>
In-Reply-To: <CAHp75VcOTiAgHjPoKQP+VTGZ88Y5eh1uw6L11yGEkDyX8Rj9Tw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 9 Feb 2022 09:03:04 +0100
Message-ID: <CAMRc=MdiE39WAcejGDxOrfx+FkqOGsUBJ=gThENwRx2DEhvwdw@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: fix hogs with custom chip labels
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 8, 2022 at 9:03 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Feb 8, 2022 at 8:34 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > We always assign the default device name as the chip_label in hog
> > structures which makes it impossible to assign hogs to chips. Let's
> > first check if a custom label was set and then copy it instead of the
> > default device name.
>
> ...
>
> > +       return (bank->label && (strlen(bank->label) > 0));
>
> It can be simply
>
>   return bank->label && strlen(bank->label);
>
> Or even w/o strlen() call:
>
>   return bank->label && *bank->label; // or bank->label && bank->label[0]
>

Yeah makes sense, I will change it when applying.

Bart

> Either way the code LGTM,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> --
> With Best Regards,
> Andy Shevchenko
