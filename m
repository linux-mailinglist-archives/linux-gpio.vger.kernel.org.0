Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 683694AE3D4
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Feb 2022 23:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386435AbiBHWY3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Feb 2022 17:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386296AbiBHUDH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Feb 2022 15:03:07 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FE4C0613CB
        for <linux-gpio@vger.kernel.org>; Tue,  8 Feb 2022 12:03:06 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id d10so807462eje.10
        for <linux-gpio@vger.kernel.org>; Tue, 08 Feb 2022 12:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=daQexuy6DQc7MPsmCHfDvYZHufkU06yPXzbHQoTr0SQ=;
        b=jCrYbdF4rEQ+2WTUUiD2P2k2mpREPStta3SEF0/wtjdjzpakjbV+sId71yHt7m7bzY
         WfoGEiSeYbAbSUM18zqSk1x8NumxQt+Ksj/5eH+eoE+5ksJiUD3zN+fTKC4n3BwZSOoB
         5Jk1pPgRQy0RKXSxaRHUNxvJgjX1maUD7d+f0DWyoo4uNqueyKTZmD0TLAgwcswbP4bl
         slBvFTZcObtufr10mjpbfsEzTzNTGMIvsdzKjXY4DsTTf3Q1qKJxwXTdOwa/MFsFx+tL
         qEZn0G279YvyxjA6o35ESCA22BjB9InVXGxXrP0pOImSDxfpDMzWn051uj6UjyI97Ry4
         HI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=daQexuy6DQc7MPsmCHfDvYZHufkU06yPXzbHQoTr0SQ=;
        b=CFlPl/IbHHiq4TCgqoYqwYP9P31aC4JE/NJ9DYg8VC3FB+7Kk4WvTd3gqX/tbbSKT2
         o/in503F+ExluVNfLpYjSC24FnKPqaSSUuVQPc/7R/R0mgSIvcd8sYGnQbhNlXEV+AnP
         n/+T1YAZcmd0cEg6GpE1CA9kvJATI0L3PMSypoQ34HgF3axjLT8QXgOz9HcB/h90Tzwv
         kOqoQ/ffnvV93tIl1tUv3NSxTDC1TYiasrpuECRivfNLLStPbN3G7UJVtvU5NejJGlDO
         gIWsZQb/iqcH32yR5FR5Bw9sgNpd4MNV59y3otddNnCKfSAaSgj3OGyS4za8KNYscz8I
         ChCQ==
X-Gm-Message-State: AOAM530ey0e6rXktBC9eeLhgOwoMSxRV0TA0gHC6k4rACbs+hayGUCnh
        jGaTBuv+66L/60de+F6R8JIYlGVFI42g4GM8PIwTb8KLOhY=
X-Google-Smtp-Source: ABdhPJwWYYoFNBQ4psTaza31vsFe4MpNNEqgDgUI5UrhEh8s1KnhaY1sbz8sdQfA++69dKrUc/IwvcnWyfANRG+46mE=
X-Received: by 2002:a17:906:c14d:: with SMTP id dp13mr5077725ejc.132.1644350585045;
 Tue, 08 Feb 2022 12:03:05 -0800 (PST)
MIME-Version: 1.0
References: <20220208105218.316834-1-brgl@bgdev.pl>
In-Reply-To: <20220208105218.316834-1-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 8 Feb 2022 22:02:28 +0200
Message-ID: <CAHp75VcOTiAgHjPoKQP+VTGZ88Y5eh1uw6L11yGEkDyX8Rj9Tw@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: fix hogs with custom chip labels
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 8, 2022 at 8:34 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> We always assign the default device name as the chip_label in hog
> structures which makes it impossible to assign hogs to chips. Let's
> first check if a custom label was set and then copy it instead of the
> default device name.

...

> +       return (bank->label && (strlen(bank->label) > 0));

It can be simply

  return bank->label && strlen(bank->label);

Or even w/o strlen() call:

  return bank->label && *bank->label; // or bank->label && bank->label[0]

Either way the code LGTM,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko
