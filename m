Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD3F133B472
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 14:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhCON3V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 09:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbhCON3U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 09:29:20 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 137D5C06174A
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 06:29:20 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id n10so20458772pgl.10
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 06:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6rA3O4nSYpKU9iHGqB8mfNCQIexoRIWH06/sz4VrUTI=;
        b=isOOfgTiMx29B/9QUQco5UaCJMuCOCmsWxuNRxj6ADssnQY29pqtR3aNhdAlcOOFBh
         YG71zNzPTwK8IeTE0QxfqlHxeMkU4596dI4cT2AXjSwUJbhlO64+VlMPUmyOxiGxftNd
         JKPA3ydI9uKXUKgWMAYYeXGoFuIGGk7FU/kPSog0xtbpSPfZt7D4kS+uwweMqBShAwK9
         UiPAUMUreDhMDEBUp64IaaP/WJ4Pkv9RPBI/8qqmesnR5KKSeuTquQcPmjxoQnexmZhw
         7HBD6C9YPTlyc5xro6msKrzbX0547N6e3dnHkeJbp2yBz5Ze6CxVgu6+ZojwlZX7Q2Tc
         QGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6rA3O4nSYpKU9iHGqB8mfNCQIexoRIWH06/sz4VrUTI=;
        b=fXvCUQN4PrfpSp+mpi0riY3hoHTmWO+vj6IlKCdUgT+c9Vivsx4SuE3xSUlhsYYZgH
         idITg1Lu/lsWke2zS+894y7qmYUP1rPqfq/lhjjhRtVgcEFiAFPWc9zaHccf26TiA0tk
         M2qhUdtDfscKfzztsRSEiROU7MHzixuoDsLyow0/jRpnFHTFjct3aERe3theZrkK/Lx2
         AhCfGQArYY/TPQB3kKgjws/9FO8/x/uQU/vfhbn0rHLvnfbQHczbKzT4OvVK0vbR/sxk
         YVR9pIdnvziW5RXjulk+J0dDdJnBlE8n70qZSpbMynsMri1BExKSoNm47tQ0Nef1L5Ey
         35oA==
X-Gm-Message-State: AOAM531zDvui8Wq+9mo7c/YPT9rq13Hx5mPF4+1APBoZM7dENABA9N8h
        YR5qmd9n4zpBVQFNTZkFEtCD0HebUPTP6PUajbY4rdIvDL529Q==
X-Google-Smtp-Source: ABdhPJzRga5NW/CXprgGx11iyY4R8z/HTgfsq5pjN/3AzwRJoJ5vzhM4KtnVCNFMj9inFJ2FEsCbD5NKtmU6aD4vRnY=
X-Received: by 2002:a62:528e:0:b029:1f5:c5ee:a487 with SMTP id
 g136-20020a62528e0000b02901f5c5eea487mr24164825pfb.7.1615814959548; Mon, 15
 Mar 2021 06:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <af518806-f473-8979-6d32-38c94a29b762@rasmusvillemoes.dk>
In-Reply-To: <af518806-f473-8979-6d32-38c94a29b762@rasmusvillemoes.dk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Mar 2021 15:29:03 +0200
Message-ID: <CAHp75VcKSxVhSNei6kFAxKM57mbRyFaxJG-BcGuz9-0_JoupDA@mail.gmail.com>
Subject: Re: replacement for persistence of values written to sysfs files
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 1:53 PM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> Hi,
>
> I'm sure this has been asked before, so please just refer to me any old
> thread(s) where this has been discussed.
>
> In the bad old sysfs days, the value assigned to the gpio via the
> /sys/class/... interface was persistent. So it was easy to use in shell
> scripts etc. But gpioset very clearly states
>
> Note: the state of a GPIO line controlled over the character device
> reverts to default
> when the last process referencing the file descriptor representing the
> device file exits.
> This means that it's wrong to run gpioset, have it exit and expect the
> line to continue
> being driven high or low. It may happen if given pin is floating but it
> must be interpreted
> as undefined behavior.
>
> and I don't see anything in v2 of the uapi changing that.
>
> So how is one supposed to get the kernel to set and maintain a value for
> a gpio, without having to keep a dummy process around? Also, with the
> sysfs interface, another process can later change the gpio value; I
> don't think that's possible with a dummy process hanging onto it.
>
> So, for example, one init script we have first configures a temperature
> sensor with a high-temp alert threshold, and after that value has been
> written, sets a gpio that will make such an alert trigger a reset of the
> board. That gpio must of course stay set, but it cannot be set before
> the threshold has been programmed. Then the init script starts a simple
> service that periodically logs the temperature reading. A human being
> working on the board can temporarily disable the alert-triggered reset
> by just writing 0 to the gpio.
>
> The README says
>
> Additionally this project contains a set of command-line tools that should
> allow an easy conversion of user scripts to using the character device.
>
> but I don't see how to achieve the persistence (or ability by
> third-party to temporarily change the value) provided by sysfs.

My understanding is that the character device interface lacks some
kind of (D-Bus based) daemon for this.

Note, the state of values (their persistence) depends on the hardware
driver as far as I can see in case of x86 (so, we have the gpioset,
while being context less,  be persistent). But I completely agree
that's undefined behaviour.

-- 
With Best Regards,
Andy Shevchenko
