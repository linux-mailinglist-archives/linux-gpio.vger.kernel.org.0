Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6A4D672812
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jan 2023 20:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjARTUi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Jan 2023 14:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjARTUd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2023 14:20:33 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2AC653B0B
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 11:20:32 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id k13so99956plg.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 11:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ywKO85xWkRk1a3hgDXPya3NpvwVbPDzcyk1LXiI9iho=;
        b=aUouE2KW1ntPqcfDWCHc1uOjxWkE6hPqMQmBjJLumnRxPk1z+bT3P5tGKPCORyhLZ5
         9VjED8qFiBb9HGfXshgJChljg9sA8qX1RQ+jyxKXLRWqEkkHZrtKof7oxQMUi/ZdPc8e
         PvLVY/ezZ83KFDMKW6YDocOL2wP/PIsQeGwXJyql5iwMpOz4hmDZyIfeJp2hfFK9qfCA
         bUN/5jPB+TWdeayAOo9w7diaaG9SWR/FzrAnNZFH+90LabAamKiLKBn0LTyKa6L2ZlsN
         yMcAaqe4Od8s5LlV6ouq9JXMaNY8avHR0OCZLASF1ed9q1Z7UIScCAJf7p/y0arHZHkB
         /+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywKO85xWkRk1a3hgDXPya3NpvwVbPDzcyk1LXiI9iho=;
        b=MzA7hRn5AomfvDMCKntQPZ5NB7epyVhfVLuFja16jJueAztG+YVdOdfWyNjjkTWr4w
         A/mi8F8/sURV0kHBhJbEG8FyzbiUIQLZw1yNrSEx/0BOeTQt5szEILvRZPupakQ99zaU
         njQ+RR2Ndm2SsDQ2SFACqWRmIC+Hd5lLHNE623yTR8apLGYaMb1DtQWD7mv3lx9XSNHR
         kC8wAjgcs4846c9icWa1rh7bnEV6nXCi0EFko6YllHhtdtR6ptTiA5tPsqCv+3O9Jb3H
         mOSAY80/DfmuS2pbgrvBsPXvkC2wwzGeq8Y7CBocDekv2gE8lZLaLvWhyfaxUCmlK8cq
         2+1g==
X-Gm-Message-State: AFqh2kqDEQzs8DnX7bNxB6z2FTCaipRJZjZZW7x9UVTlkYjBbJ69Jr3W
        K5sTZKvg/oCWPHeUP0tvpAdWDusJETga3PTQ51bBOlC+fqA=
X-Google-Smtp-Source: AMrXdXtQKm3ClMrzfytdZtawsmB8KMK9R7gewxxSPEv8QzbybGIhIJwtNX+VHWiYJeoG8tZc3RzahKzXuNTBHk7j5cQ=
X-Received: by 2002:a17:903:2c7:b0:194:7a94:ba0d with SMTP id
 s7-20020a17090302c700b001947a94ba0dmr696254plk.82.1674069632395; Wed, 18 Jan
 2023 11:20:32 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5Am2Zm7vwk_8ey_qx0dhcONV4WzPk1aDxvkvxKi-2dhrQ@mail.gmail.com>
In-Reply-To: <CAOMZO5Am2Zm7vwk_8ey_qx0dhcONV4WzPk1aDxvkvxKi-2dhrQ@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 18 Jan 2023 16:20:18 -0300
Message-ID: <CAOMZO5DjSh9RvaXGYOn_ei4w-AvRWOvC8jhk4_wZC31TX3n0aw@mail.gmail.com>
Subject: Re: libgpiod: Using the -a option in v1.6.x
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 18, 2023 at 2:44 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Bartosz,
>
> On master, there is a useful -a option for gpioget:
>
> --as-is - leave the line direction unchanged, not forced to input
>
> I am running libgpiod v1.6.3, which does not contain such an option.
>
> Backporting this feature to v1.6.x did not seem trivial.
>
> Would you have any suggestions as to how to add this option to v1.6.x?

Nevermind. I changed the libgpiod OE recipe to use master instead of
1.6.3 and now I can read
the output correctly using the -a option:

# gpioget --version
gpioget (libgpiod) v2.0-devel
Copyright (C) 2017-2018 Bartosz Golaszewski
License: GPL-2.0-or-later
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

# gpioset --hold-period 20ms -t0 -c 2 16=1
# gpioget --numeric -a -c 2 16
1
