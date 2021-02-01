Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCAF130ABE9
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 16:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbhBAPvF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 10:51:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231556AbhBAPu6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 10:50:58 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44464C061573
        for <linux-gpio@vger.kernel.org>; Mon,  1 Feb 2021 07:50:10 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a9so6735635ejr.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Feb 2021 07:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=umfeuXW08c1qiq1OJKFy/yOM2bFxEDQdo0ZTFrpR6VM=;
        b=X55wTf8G8OwgkjiABiwOVZmZuE1SSTejF01oX9CAb9n3QEZi3TNqI7CwHyRJVhrEFN
         GNGjSDM9cLnmzD3Ljm236PQMaCf7WUUu5qPVPIdHP6adoZqpKRYfk09ezhm8wQnU9pjs
         VmPIkmA8qM9eNVcqZfM14QUMGgmY5jV8xvSfhtWtmZPg/BQEuVXDFurbNT/YKXcdCFrk
         OS6FVb8PGTypAwqVecLQBN5X7A+SIQ7IHg/YOia0/iHGCHYs2KAQQgyWe5q84ZBUFijc
         /9mn8Z0960EE4ZxuyuzhI8Xy9EtxIJ2bRESkF0z2jtKJJpmT5ywjnHH+IBzTS2wbzBOj
         dZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=umfeuXW08c1qiq1OJKFy/yOM2bFxEDQdo0ZTFrpR6VM=;
        b=H//TAalqRZ1LEIvRTEj5M7rEVrVLR814Ow+/V43dlQHxhZVTBzaeN69yvbGserW2nE
         6UAB1oiF9ZhlRow9XrV0jD+cPyMJPhM8PfuMBPMRoqW1+s2Tu09bOFfWaOlP9/qrvyNd
         12S6RjS0MXcpfaFrDZDWFEoaypLo56uR9m8h3j7FETM3KL1R1LYnypr9SbVvQwbBZjI8
         vWTprGV8h3+uJKy/jW0ZazkWh713qK/jjtaI65RQWMP3eQK97/v5wZ8yzjDzWB6Zhluw
         RZDKVN4qSSivmLlE0C4z+v4ROqfiw2sRUPiYeqrO6k0J5bfJzvs7mZtvKzIa6B1IMsx6
         8jAQ==
X-Gm-Message-State: AOAM531vLIcQLjDQyirLzw6FdRdkYXmb1mOG01fZwg2L9ajoYpBBpNpf
        2+AdMGZfHb95rrutTVWRHpcipUyoIlqxOQQWpMv6EQ==
X-Google-Smtp-Source: ABdhPJyqX+cSxuF/Ai9y1AvPhH+Cl3I3e5ctWQcw5mGfTYM4iIFkJfgPLPPov5Wrc5TyEA/JuJlMiM80zHHiXTCgGpI=
X-Received: by 2002:a17:906:19c3:: with SMTP id h3mr17993759ejd.429.1612194608986;
 Mon, 01 Feb 2021 07:50:08 -0800 (PST)
MIME-Version: 1.0
References: <20210129081917.1808218-1-quanyang.wang@windriver.com>
 <CAHp75VemJWQDKFFrrCKWnUGHFiPhuh=4Aqhn8T6qF5yuMOCOKg@mail.gmail.com> <02e614e9-fe2f-d7b2-6c47-2431475780ed@windriver.com>
In-Reply-To: <02e614e9-fe2f-d7b2-6c47-2431475780ed@windriver.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 1 Feb 2021 16:49:58 +0100
Message-ID: <CAMpxmJWNJ3MVT58nKhkzNDtr39Tr7xPTSKvmcisKY9OBVg7wzQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: free device name on error path to fix kmemleak
To:     "quanyang.wang" <quanyang.wang@windriver.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 30, 2021 at 4:45 AM quanyang.wang
<quanyang.wang@windriver.com> wrote:
>
> Hi Andy,
>
> On 1/30/21 1:26 AM, Andy Shevchenko wrote:
> > On Fri, Jan 29, 2021 at 2:01 PM <quanyang.wang@windriver.com> wrote:
> >> From: Quanyang Wang <quanyang.wang@windriver.com>
> >>
> >> In gpiochip_add_data_with_key, we should check the return value of
> >> dev_set_name to ensure that device name is allocated successfully
> >> and then add a label on the error path to free device name to fix
> >> kmemleak as below:
> > Thanks for the report.
> > Unfortunately...
> >
> >> +       ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
> >> +       if (ret)
> >> +               goto err_free_ida;
> > ...
> >
> >> +err_free_dev_name:
> >> +       kfree(dev_name(&gdev->dev));
> > ...this approach seems to  create a possible double free if I'm not mistaken.
> Thanks for your comment.  I didn't catch the double free. Would you
> please point it out?
> >
> > The idea is that device name should be cleaned in kobject ->release()
> > callback when device is put.
>
> Yes, the device name should be freed by calling put_device(&gdev->dev).
> But int gpiochip_add_data_with_key,
>
> when running dev_set_name, "gdev->dev.release" hasn't been installed
> until in the tail of gpiochip_add_data_with_key.
>
> So we couldn't call put_device here.
>
> Any suggestion is much appreciated.
>
> Thanks,
>
> Quanyang
>
> > Can you elaborate?
> >

Andy,

gdev->dev.release is assigned as the very last step in
gpiochip_add_data_with_key() so the patch looks correct to me. Do you
still have objections? Maybe I'm not seeing something.

Bart
