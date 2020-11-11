Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B22AC2AF489
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 16:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgKKPOz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 10:14:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgKKPOz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 10:14:55 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8310DC0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 07:14:54 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id l2so3653836lfk.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 07:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=al9AhlnpLROQkeJcp4KmhZIYQISi9OqNRGCz0MVINWw=;
        b=y08ZYrv1xG5Qj0tEoDGVettd6ppj4PdfFQR2GwrfLIq1X4UljS2YNirJRLLAMNsMF1
         YTxjjI10M9sQ2VXUJT6wxadFuaQWiqAK94OAVdQtplsvx4WTvCjU6XbAAkSDy2XgIGpf
         h/6KBI5kuT+xeh+/nBRhxS0shHxLGmUFyKPrukHuvICv+VY8DcBfifYCE+GFxOsEvsIz
         sCpg+dQyFJ/01xmRiXdd91CTkdPW7kp2lMgLwsaUNeweovFq0rcokhjqrW2WxRVOP4G1
         qXisn1eVPedSZ5H9KJSuWCj6mCV46sMdlL/4c8+vMg2ZoN8TY+Pma+FKvcFLG6YFMnII
         NjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=al9AhlnpLROQkeJcp4KmhZIYQISi9OqNRGCz0MVINWw=;
        b=SiCNVpo/NlP9sF9O94JYpECPLutoWgH+kU2MjzHHET7tLEJeA5C617UzH+VpN7pB4z
         0gpcAjMbK3ThMgDHM5Z4UubxPQvzXfL7163WFow6BhU6DFnrbQheSrlIh3SKB9/+oH+u
         K71ioemlR05nz/+oX1Z7H60RjKlHn7CtyNu6mKQvjNZkEkXvoUI30P2twyDLU34uH9sh
         5x4ELEK+XQ9xevcGEKWd3px6TAQ78VEGgNJ0voXHIMhxEarWvs1UX8RG5SbWAvT1jAtv
         xmAafcne32GU+B65EByKqLZ5Go/VgDLWBvRPImuUEGUsHyIPq2IKuf+9UfrbfbaYaOac
         Umlg==
X-Gm-Message-State: AOAM532x4hj/PDgeSxUX3/zMYgv20bHIhYLWWv2GMT0X4llNHedjBKQO
        7+z5sjVc8YQqOA3QLNngDqHy1U2JhbYEEGgk9H3d66EhnFRttQ==
X-Google-Smtp-Source: ABdhPJwS69Hw3ZIr9pybPqkVIWtgoqFtluUp54n8mRWhaDl7choUIRTC8pYtRhQB9bhsJlsGjbijABs4I51xhw104NE=
X-Received: by 2002:a19:e08:: with SMTP id 8mr1037175lfo.441.1605107692888;
 Wed, 11 Nov 2020 07:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20201104115348.51930-1-damien.lemoal@wdc.com> <CAMpxmJUO-fyQRyjKD4gNZFw=_iAH7eMd=xyLXLuwAikC0OnLsQ@mail.gmail.com>
 <4dae7924b5d8b020e747a36ecb015063090b819b.camel@wdc.com> <CACRpkdZup58yojegKUxpok-aqE95sk18JDc0kuiUoiOj1XKpGA@mail.gmail.com>
 <b551cfa97c1ee0aa892d80454a47ed859b9a420c.camel@wdc.com>
In-Reply-To: <b551cfa97c1ee0aa892d80454a47ed859b9a420c.camel@wdc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Nov 2020 16:14:42 +0100
Message-ID: <CACRpkda_4JrF=akOO+Y8=xcDqQ3710ztbcj+Z2PPk65nz37Vag@mail.gmail.com>
Subject: Re: [PATCH] gpio: Do not trigger WARN() with sysfs gpio export/unexport
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2020 at 7:54 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

> > We need to think about a similar facility for users which is less
> > damaging but fulfils the same needs. I think I saw something a while
> > back that looked promising and added some funky files in debugfs
> > in a hierarchical manner per-gpiochip instead. That is how debugfs
> > should be used.
>
> I like this idea too. The point is (my opinion only), anything that allows
> quick testing using only a shell without any extra tooling needed is fine.
> Extra tooling is not really an issue when using a full distro, but it can be a
> problem when working with things like buildroot (or busybox directly). And
> indeed, as its name implies, debugfs seems like a good alternative to sysfs.

I would say the problem is something like, I want to test some simple
GPIO access like turning a LED on/off and recompiling the rootfs
is a pain, so some simple debugfs facility would be nice to have to test
it and get on with development.

OK I'll think of some TODO item.

I am slightly worried that people will start abusing debugfs to do products
"because it is so simple" if we add this but wel...

Yours,
Linus Walleij
