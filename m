Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB85295BE7
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 11:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2509419AbgJVJgG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 05:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2509417AbgJVJgG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2020 05:36:06 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6806CC0613CE
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2020 02:36:03 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id n6so861464ioc.12
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2020 02:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BSpWjM1qLJ462t8SlnK/RCj9UDChN0huxH5XMjy+buM=;
        b=WPLiCf5rlwH94xT0L8zEpgEJE8bk7VGrjgCXcBPWcAitmzIrLuqfrOVoANXpR2cntH
         QilxHB8d5mMAH1Yt8BknE/sUix05DvPzzpG8FDGsP+MgVRy/iPKUgCPsvHQlLl+BH/Pu
         z9Gdxz1+TN6EuzD4g5kKimJBmlOKVv2xJhR2sSr7jqSJUIubowxzc2/c+GeiNRAfyMyB
         AAiOsenKn2K5+qkvRdHP/5R23pYbb7eYu8348TEZM3KV/SR+zeg8eCUGlQOzRkbfMii1
         cKcaL03gfcijw1thnXGONgfw68AJ87s9wYda93hIFCdmKnPd+JyCbDh/9RWaKRbIicke
         ngVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BSpWjM1qLJ462t8SlnK/RCj9UDChN0huxH5XMjy+buM=;
        b=myY8t03ByZTV3Ip57YYBKsgbjMkXBIWu2l2VmxpjzmJTxfpiQukWW0pXHxA0JUD5EG
         In6iRV3cvOzHe/yCZXgQAAvYA5ewarR5u7DCDmLgRXTzwTKA8WS5L+DJpGUMJ5NBXQS5
         CxylWsHDqQA6yKxL61aXs8bCNcAwGSL2t+t2nB0r6oW8ZMq3ikFrhH4X0kAWX3Y3Gan3
         MgVtD8ooT2psAjrpWSuOgL/fyfXXBoM6MWd7tcKL4i6dMTChLjvn4V4gGw2aJJVkAKV8
         o2pwFadi0rpnTyjrbNa498HwX9j5rwVkU+uGvkfAfEFhDAyYatuKSdr0oXlpQSpD+5R4
         peTw==
X-Gm-Message-State: AOAM533bThx99DDeJFRa2oRWEYf+wINAXOak9s7YTWM0uVKRru1o/GBx
        jZhLJEvdP5q8lw3Q4sd2hYabQF1J6SB4RMQzt93OvxdLEkA=
X-Google-Smtp-Source: ABdhPJzxXcOKMVpFGU5ri6dKMemm7pKTbq5ModbZ8meZjUWTC8PiJ1lneFHhAozifbXyD+x6LKnoNEphQgeMF+d9Ivw=
X-Received: by 2002:a02:7817:: with SMTP id p23mr967663jac.57.1603359362739;
 Thu, 22 Oct 2020 02:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201015083805.GA10354@laureti-dev> <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
 <20201015093526.GA10891@laureti-dev> <CAMRc=McpnnK9NydujR=YRuy0ZBLhQqz3SSZ5eeisjqhMPUbMhA@mail.gmail.com>
 <20201015105718.GA11027@laureti-dev> <CAMRc=MdWi94uzYb6OprmVoGnfmSHUCevqAPPgXOPHQNVrj0jfQ@mail.gmail.com>
 <20201015121312.GA7166@laureti-dev> <CAMRc=McApWaCy8kUWurjZByN9vKqw8kZBwNVBtVXXf6-b3PsLg@mail.gmail.com>
 <CAFhCfDa7Yy2a9-ddk0nZmNidar_-H_ONTU93Cb+YatcEGy3NbQ@mail.gmail.com>
 <20201022063935.GA23978@laureti-dev> <CAFhCfDY5JS4WB=0OFdjYGeuRobuMPKkjeir29M6EOSe9zVufVw@mail.gmail.com>
In-Reply-To: <CAFhCfDY5JS4WB=0OFdjYGeuRobuMPKkjeir29M6EOSe9zVufVw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 22 Oct 2020 11:35:51 +0200
Message-ID: <CAMRc=Mfs7CSS_3BU6geAyDq0bNA9Q6eQvw_-iJCttGKimbZHjg@mail.gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
To:     Jack Winch <sunt.un.morcov@gmail.com>
Cc:     Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 22, 2020 at 11:09 AM Jack Winch <sunt.un.morcov@gmail.com> wrote:
>

[snip]

> What I did not want to see happen is the change as currently proposed
> be applied and cause issues in the future.
>

Jack: FYI the clock configuration didn't make it this merge window so
it'll be released in v5.11. I also don't envision making a libgpiod
v2.0 release any earlier than that so we have plenty of time to
discuss it and come to the right conclusion.

Bartosz

[snip]
