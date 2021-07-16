Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BAA43CB379
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 09:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236294AbhGPHrs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 03:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236502AbhGPHrs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jul 2021 03:47:48 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF13C06175F
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 00:44:52 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id dt7so13736307ejc.12
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 00:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=48qSBiJyR5MpeeLdsL7BheSYfctqJ+3jnOfGEu+XjRQ=;
        b=tnPvjSKB6aCl+bQVolbzrMv9Et22YPFgX9teY9EjEaN+OGmUVrm5+OyjF6WWFP0xdr
         XQvf88BK2oNN7rMRtvVzk9LxLPGBL70dQPBsSPFBGX2AK5+65KNkAV5KZE+lXvXLCMnT
         o08NN9bY0DtNoZZalYjGEeRXqxLgbI80wDoidm/Nf615yKIpAStoZ4MZNvujfi2x6gbg
         MxLgxuzoM2mfPK/5eQvwkNyxXaW2vqyZ5LNVsj7U4JhTevBrKwnrayQ4EXJztyd+QXxw
         9NFeR7VCB6p5wVF2V/5QTZJmfQmWAWlseNV+tzchkUHsnzOmewg32wwa8cekZjfFIF+4
         hmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=48qSBiJyR5MpeeLdsL7BheSYfctqJ+3jnOfGEu+XjRQ=;
        b=r/Eu+jke0OE3WU/QiZtFL9FkF8R+C2DYdLCGPMYeIc9l2W2257Hdrrvdwi4CraZMZZ
         yH7eCkOvQ8iEnM8IviugKs1PkCP2gF15GrbiYa71AC11IrFWzlo14ewwIsfMdWqrI0JU
         alKBR4Hdgbd71Dlmrr+GzHpfmhhjPx9UxZ4GlN2O60eo/xetPriIaD6Ivs7QEBhg/UTs
         L6bH5Qp1fDlQDSpvWJrJGccDHuXYkwL0gocVCyD6F5A0ZowkenhtL3/SO+cw3V4FopKS
         ZFpSl3dYa/x435cfQCXj0JCJJOqzKAv5r55UpTmHNEo8a6DhBs6oa0RVjkHcgYxtnGfZ
         YV3A==
X-Gm-Message-State: AOAM530YN5lAPGjZgC4qCy6Pf7ToiyIdVmn571S7dEB1Nm788NrLcfT9
        1o5PKZLWhVoZKlO+Af5lMU5DnU3yXe+7MbBOMQOWhg==
X-Google-Smtp-Source: ABdhPJzM/Nu45qjTFxnHPb0YEuS0hZGFs3r3ZEHU+k/SzvKb0K9B8/XAU9cvUhFcm9xo64lx7ErvoYyVOVuByAYwTUw=
X-Received: by 2002:a17:906:1703:: with SMTP id c3mr10334143eje.64.1626421490435;
 Fri, 16 Jul 2021 00:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210715201001.23726-1-brgl@bgdev.pl> <20210715201001.23726-4-brgl@bgdev.pl>
 <20210715221803.GA16338@cephalopod>
In-Reply-To: <20210715221803.GA16338@cephalopod>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 16 Jul 2021 09:44:39 +0200
Message-ID: <CAMRc=Md0DWKBT0BJGdKDdhTN0gG3Jc4Mf71xUnYqqhxRPheR7Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 3/3] bindings: cxx: implement C++ bindings
 for libgpiod v2.0
To:     Ben Hutchings <ben.hutchings@essensium.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 16, 2021 at 12:18 AM Ben Hutchings
<ben.hutchings@essensium.com> wrote:
>
> On Thu, Jul 15, 2021 at 10:10:01PM +0200, Bartosz Golaszewski wrote:
> > This is the bulk of work implementing C++ bindings for the new libgpiod
> > API. The tests are not converted yet but the examples are fully
> > functional. More details in the cover letter as this patch will be
> > squashed with the one for the core C library anyway.
> [...]
> > +class line_config
> > +{
> > +public:
> > +
> > +     /**
> > +      * @brief Direction settings.
> > +      */
> > +     enum : int {
> > +             DIRECTION_AS_IS = 1,
> > +             /**< Request the line(s), but don't change current direction. */
> > +             DIRECTION_INPUT,
> > +             /**< Request the line(s) for reading the GPIO line state. */
> > +             DIRECTION_OUTPUT
> > +             /**< Request the line(s) for setting the GPIO line state. */
> > +     };
> [...]
> > +class line_info
> > +{
> > +public:
> > +
> > +     /**
> > +      * @brief Direction settings.
> > +      */
> > +     enum : int {
> > +             DIRECTION_INPUT = 1,
> > +             /**< Direction is input - we're reading the state of a GPIO line. */
> > +             DIRECTION_OUTPUT
> > +             /**< Direction is output - we're driving the GPIO line. */
> > +     };
> [...]
>
> Could these be enum class types, or does that introduce an ABI issue
> if you extend them later?
>
> Ben.

I'm not sure there would be any benefit to enum classes here except
for longer scope when using them in code. I would prefer to leave it
this way.

Bartosz
