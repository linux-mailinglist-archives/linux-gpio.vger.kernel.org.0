Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62D827844C
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 11:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbgIYJpA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 05:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727426AbgIYJpA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 05:45:00 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53ECBC0613CE;
        Fri, 25 Sep 2020 02:45:00 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t7so1571869pjd.3;
        Fri, 25 Sep 2020 02:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2L1T0+Pb0fY1KaCXrGmvGo6KzupVmjy5juT/NsHl0Rs=;
        b=Mc9FGD2OHbWcDegTzkVgBfY5ByeLiEgIJR7odI+cED8XQqO3Q1gZTFcAaC5OUeLsv3
         m3CJbL2NlqLoSTst12mUkmMTHKwXPC3Fwxc0bOkSH6+2vLMg5hQinU2fFxXnYuDZ5XVx
         N/isBX1Xda6C4A6Yaj+idVMDKDIsLV0yjx1ORyOHBqpXnlCEJkubV36S8/jjB7skpHIn
         IyWud/XWRYYytmjWzGe0IGBSfPg9m2kU5QBFGTZ3On4Vu7Flc13/NEepSL65KjakpCqa
         PrGk2jrX3ekMB+acDUG+IPVgybmvC2QJPPmNJvZaOhf2k9zxU6kbPtN/pbcdvZ1alvwx
         m9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2L1T0+Pb0fY1KaCXrGmvGo6KzupVmjy5juT/NsHl0Rs=;
        b=Gahi3Vmzgpgmn+qyvKHuFqrprLIC7CqqXA13cfaE0RtWbEr0cbD1oG4xXa+r4QxHPO
         /hwYQw2dp7tzHMGjkBNKHSw/EnToqCSQLfjkMukD+v9ujdad4jE8hTxKSXSKhc/2nUzE
         X85PlTSTgu1BXJ3rLtKZ0e8SEmgSegRK0Zl0Gg4euFjRytQ8mflQ/OEhwL77BflX1UqY
         2mKAhh97OBcyFSqdNmjnb0eNqwxrZM2FpfsBoAF+dbccdR0bkWw8xas4LLABseFYRmZM
         jSdPWOFJShh1tAZ2UJpuOLd+nMBBL6xra6tanssbi/+OydxlLixFaPgfTYjv2V1kd2mq
         JAXw==
X-Gm-Message-State: AOAM532GTSgLht4YRAk7rE4AFcf0teJR+JT3ed3TMyebOrMVvZbr8Y1v
        /YXPFhrq0EhsbOgEvRRtD6A1lUCRqHBlljC0Xjw=
X-Google-Smtp-Source: ABdhPJzZ/22aow9OQ8/ObU9p4pR0lRep9jwQZbe12tKAHhZJgZMNFO9YlwDsvLWjeTGHr8EpQyo2/Co49tnrsWrHFl8=
X-Received: by 2002:a17:90a:b387:: with SMTP id e7mr1907888pjr.228.1601027099890;
 Fri, 25 Sep 2020 02:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <CAHp75VeXbTkSTVgrqmeL_taEHPDBMo-rekA767Y+YT1_7RYjdg@mail.gmail.com>
 <20200924080014.GD17562@sol>
In-Reply-To: <20200924080014.GD17562@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 25 Sep 2020 12:44:41 +0300
Message-ID: <CAHp75Vf_vPqat96X5FUirS13TZsCH8Tv+QZxdfoMzcHZvEmrHA@mail.gmail.com>
Subject: Re: [PATCH v9 00/20] gpio: cdev: add uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 24, 2020 at 11:00 AM Kent Gibson <warthog618@gmail.com> wrote:
> On Wed, Sep 23, 2020 at 07:35:30PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 22, 2020 at 5:34 AM Kent Gibson <warthog618@gmail.com> wrote:

...

> > For the rest I gave some comments but most of them are simply to
> > address. The uAPI definition I agree with after Arnd's comment. I
> > don't see big impediments to having this for v5.10.
> >
> > Thanks!
> >
>
> Thanks for your review - I nearly always learn something new from them,
> and you can be picky pain in the arse at times - which is a good thing
> for a reviewer. Apart from the pain in the arse ;-).

Thanks for being patient!
As a reviewer I'm also in constant learning.

-- 
With Best Regards,
Andy Shevchenko
