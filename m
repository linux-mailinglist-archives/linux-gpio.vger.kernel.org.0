Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6FE6836DC
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Jan 2023 20:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbjAaTwU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Jan 2023 14:52:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjAaTwT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2023 14:52:19 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58CB418B0A
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 11:52:18 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id 3so17254714vsq.7
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 11:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KL2k5mH5tmh8OZcAXLezc94ObW8reBjePc/UC71xBuk=;
        b=2zcH/SsP+C3sFcBExQ+tfjOiA4gzU+xCDsh55hkCCdEu6CNi7dn8/CaS9L1bJCZhDz
         lB1hpgdbjllPcUhcdiqHRYzRw1m9mqYX/edVLZ1r8sRPodBFhkUJZ6tLqvp4CXX+0kgO
         GgHOOGR3F3iiIWstYbmXzTRO3Dd+rVTxZVLo4skOle1v+9FABR+kr61UU815wkUDy+Oq
         iKqqF7myL+thFvtLvQJrn0s71X4mBAh20HKquY1WYr0aMYKzWQk3qp87MWwhyGMLnZfG
         sGh8IYl43lEK7fV4ItLIuSmdb6QdKvlYYuACayqCMbpnvESPMxENX9zqvOo5FoEUaGiM
         kKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KL2k5mH5tmh8OZcAXLezc94ObW8reBjePc/UC71xBuk=;
        b=X5M/Qknd3WBYZv3rmYHBBBTLlfTzXMDm6RBtNJHSTNADM7CpSsCBxxoe3Bvz4b4WkQ
         ib5IxVTVuRxaVZI1P67krov7ZKyKU8gK5gD1bhJmzCoPxmdZmdGsBU/oLokPYb62eeSa
         W9tvexRczqmgfwKhMJcakyuS8FbIch71TlaVtb2uDQJx2swG7lJt9Mp3BF5PNunmpK54
         0DASaxSSm4vrdgCvPYjTJl9iQonIwqpTvrD4NZu6BO9TngdfPq3Ykm9+gnPPmg67Ntnv
         Z3quPY/mn7lUHk/A7nu/Z9QAFhZyVS1ILO8n3dGo9LIydwRJrutnlskpY8HLY5bfHrJy
         oP5w==
X-Gm-Message-State: AO0yUKWFZN/gxhpCE+l123E4t3gLICNAQhwnzCMt1/+DvF+/EWbbs/LT
        Im2mAdkRIxEXEiRfVbkIuFdr/a7VxmM06Qpgs8t/9g==
X-Google-Smtp-Source: AK7set/oOA6IyJt+vh/gLqG2/HRqLlE5B5Cir2bEZDg1ffrGa8ZLHGevdwZmT6tHqfZ/+115zsVr54EHJ+RjH+iqR4Y=
X-Received: by 2002:a67:e002:0:b0:3fe:b46c:7889 with SMTP id
 c2-20020a67e002000000b003feb46c7889mr14423vsl.78.1675194737411; Tue, 31 Jan
 2023 11:52:17 -0800 (PST)
MIME-Version: 1.0
References: <CABTDG88t8_6s0ahuEKAxXsJD1KP0OuMoS-Mqi+qoeJuHutk4Qw@mail.gmail.com>
 <CAMRc=MdDzBQOeH01wm-i36KCDX_CM4E9jV=+gG7BQt8-36WzFw@mail.gmail.com> <CABTDG8-5Cch9vS6kWqQp+RGV082CfMT7gv1QiO1n9y6YzSR4Eg@mail.gmail.com>
In-Reply-To: <CABTDG8-5Cch9vS6kWqQp+RGV082CfMT7gv1QiO1n9y6YzSR4Eg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 31 Jan 2023 20:52:06 +0100
Message-ID: <CAMRc=Mdso+vvd68LYpQt_1NMWn5M2t_KjfYjCbLFtj5-5=8D6g@mail.gmail.com>
Subject: Re: I2C, SPI, etc for libgpiod
To:     Hank Barta <hbarta@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 31, 2023 at 8:32 PM Hank Barta <hbarta@gmail.com> wrote:
>
> Thank you for clarifying.
>
> Can you point me to the other user-space tools or help with search
> strings? So far I've not had any luck finding them.
>

i2c-tools is the official toolset for I2C on linux:
https://i2c.wiki.kernel.org/index.php/I2C_Tools

spi-tools seems to be the maintained package for user-space spidev:
https://github.com/cpb-/spi-tools

Personally I use the following python modules on linux:
https://pypi.org/project/smbus2/ https://pypi.org/project/spidev/

> best,
>
>
> PS: Gmail thought it best to reply directly to you but if you think
> appropriate, please share your reply with the list.
>

Yes, no harm in responding directly on the list.

Bart
