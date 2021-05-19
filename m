Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74CE7388D49
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 13:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhESLy5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 07:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239763AbhESLy5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 07:54:57 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70AB4C061763
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 04:53:37 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id o10so10986118ilm.13
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 04:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UW7fZiIlXVfl0Qc0/A9Hj0P585Ftj5tVT/omHdWRq4I=;
        b=xLPFHrobZa2WtMv3ql7wPlAv5Tlyo5PmflSYyt63GdY1dJxV6q/++PoWUU73Vm8I8Q
         XhykK9d/2gYBEup6fAwa2XK+Umf9GBrejU/zdN/Q5H/8/Fgml0iNnb1gBdWV8iOy8P1v
         VJBUZDNw3f4iM+zvum6Yav1e8S+RzjRmzu0EQdDYM46bamsvc9oBTDOc27AOk9ZJPMzN
         hX73g9wxPHDs13xqAScfxHl1X2NLKl1zx/r5cxUNm2PlXAJ2UXr+O1mvsXUmJHXY/j3m
         t340Ij6y4xra8yVLLznQQEYhjk9BsM/rX0jQObGJQmoKKyBeJyAiwsCqGdNfZvj/t9ir
         +/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UW7fZiIlXVfl0Qc0/A9Hj0P585Ftj5tVT/omHdWRq4I=;
        b=kbdSZIwZGJbeIjXuZ1a8znuAto0+CKFcJRcUDxuXFA4Ew6czigZDXwqpLHZNyn921V
         JAI+rBf+lrhb7dpBGoMO56CuekxTOLMKVCf1CftXnjqV/ilN+opOiFH1s8PBbi5xTkN/
         ld4L93631QoQ32pM6mod9/HZSbRuRfhM5cAWCml78IoAlktoVSNgmVmfPm53+3DUVJ/F
         8gndMhKoI4MmRIFdd/nz3a+qEos2eZpDfDmoy1adUqGWO4F6NQhg0vMIHFiUj61uDRPQ
         pogQKtt2acBnmwe/di9J00qy0mAnUrtCLlK2GAQo4ysteQSQ8dpT7d2DR0P/oGh5SfjO
         ZYCg==
X-Gm-Message-State: AOAM530HVyZfKkWq4ACV7wFFbgi5U7DJs3ciqW3D8G0GRtzXGg3pDsfU
        zRstjwg88kpQx98aTKtDMGgpfd5T4Yx0LWNpLN6mtg==
X-Google-Smtp-Source: ABdhPJyagVuDl87Slxx3PuzN9OBL7HrQnUxrISgaMw3Gc9dfiRyYygGFfRlU4U4XUgvEtNonmfbMHU8PypFnnAmBhHo=
X-Received: by 2002:a92:cf45:: with SMTP id c5mr10915199ilr.182.1621425216452;
 Wed, 19 May 2021 04:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210430123511.116057-1-robert.marko@sartura.hr> <af4923ef1ed0693fcd67d7986348b164@walle.cc>
In-Reply-To: <af4923ef1ed0693fcd67d7986348b164@walle.cc>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 19 May 2021 13:53:25 +0200
Message-ID: <CA+HBbNHCnpg9qCzZbT9KVNqX-daC68iaJKNdyEf7do3w98miWw@mail.gmail.com>
Subject: Re: [PATCH 1/6] mfd: Add Delta TN48M CPLD driver
To:     Michael Walle <michael@walle.cc>
Cc:     Lee Jones <lee.jones@linaro.org>, robh+dt@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, jdelvare@suse.com,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>,
        jmp@epiphyte.org, Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 6, 2021 at 6:34 PM Michael Walle <michael@walle.cc> wrote:
>
> Hi Robert,
>
> Am 2021-04-30 14:35, schrieb Robert Marko:
> > Delta TN48M switches have a Lattice CPLD that serves
> > multiple purposes including being a GPIO expander.
> > So lets add the MFD core driver for it.
>
> Did you have a look at mfd/simple-mfd-i2c.c?

Hi Michael,

Yes, that was my first idea but we have a requirement to expose CPLD
information via debugfs as there are userspace applications using it.
And simple-mfd-i2c does not allow us to do so.

Regards,
Robert
>
> -michael



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
