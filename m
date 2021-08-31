Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59CA53FCA8D
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 17:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbhHaPJK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 11:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbhHaPJK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Aug 2021 11:09:10 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935D1C061575
        for <linux-gpio@vger.kernel.org>; Tue, 31 Aug 2021 08:08:14 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id e21so39430764ejz.12
        for <linux-gpio@vger.kernel.org>; Tue, 31 Aug 2021 08:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0n377XHsnHanfkCpW4uQxyJLZ2CHI+mItltHrowkJVE=;
        b=gt+xra7sEukKch06D9Gmva4taH6IPRw9QMxVwBarU959lsST3SgZ9c0dNBuqzsD3VL
         lU6XcAbFMrH/Vo3MvBp3QPOA1OIErSR0pYWU1fyfSeIfeFUUSXgRRUrgMPTMvtFa7LG9
         abQexgKhU4cziiwImj9tiAz3I+E2czQaYp5r2KoMtvEEj3KLsuDOmC6gAWgfSTeRdBQU
         GasXBwJ/h+EbX1gD4kntHJ4Zsh/k1a69GGzeKVMQYylwU4YrRMw8Sy4rFqAPpELxzX+H
         S8QxWZUBNkSvhxp56VzAcIJeJEaGmDpe+Yu8fCG7zKifT05uuK8b1Vipgfcwkes//7HI
         eyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0n377XHsnHanfkCpW4uQxyJLZ2CHI+mItltHrowkJVE=;
        b=czdKU56u/1SCNEHVFamI/CLmjPCuVmC4nX37HY/i4KZvrpnr2QeUqXk4DfegV4rt2q
         nlpO3bwVl4hD8Q7JeBrvLx4Y3OhFcpuUfdSJYkrjhWBXLhLtvdE5qy92praruRSuUZGT
         4Ka1ZlRqvpInqezN0FP6ys9f1oo05pacCS4jYPu8Ug9t7PMp4+kuHVTMaRhLRys9TiC2
         aTKX6G1BtYrkd/J7xNcv3nyVr8VxNsDgTadXT5L5l740XvN+DpxqCDA9OYSV3srxy5kn
         3xZbHBCOS41gvAezriHncn5C+W4PeohpF2h1e7f2jPldlEZdEzn7Q2e5+Hhr/g/+MNhj
         q2vQ==
X-Gm-Message-State: AOAM5312XWaRHeIJWSBbYxTjtuEri5fJ3vgZERMju1KOZuW7EdllrazU
        kgOLMauSZEllip+fFBD4yWSbPW2DIuq0YWZvFCoZ4rAG+ih0Pg==
X-Google-Smtp-Source: ABdhPJzNnFfHAjFiM+JR3u04JU5nNix//xrRrTS81nFqM+UdUYNB0T+3GlUaQ52tyKUtkEBjxI9Ub7mabKXdxX4W1eg=
X-Received: by 2002:a17:906:8597:: with SMTP id v23mr24306482ejx.178.1630422493170;
 Tue, 31 Aug 2021 08:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <CA+FSg4rJcDPhPoBbEYjsq_UOysLUdp6YnBh+3XeHL7UkH2cfdA@mail.gmail.com>
 <CAHp75Vct=K1Nh+UDS9tZgvgF1ju_c8417wzfHg9YCA2ay0jtCA@mail.gmail.com>
 <20210827022140.GA8509@sol> <CA+FSg4qxArwg67YCbpknJciOfraV-WxSUwsFrq1DmNLKHZHqLw@mail.gmail.com>
In-Reply-To: <CA+FSg4qxArwg67YCbpknJciOfraV-WxSUwsFrq1DmNLKHZHqLw@mail.gmail.com>
From:   Riz <mdrizwan827@gmail.com>
Date:   Tue, 31 Aug 2021 20:38:01 +0530
Message-ID: <CA+FSg4rE8h0hdGa2UmvNyX1B2ChjJPfwobRdEsi_dSnyvT0p=Q@mail.gmail.com>
Subject: Re: Regarding export of GPIOs
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sorry the kernel log was:
[    0.251788] GPIO line <num> (name) hogged as output/low

Regards.

On Tue, Aug 31, 2021 at 8:35 PM Riz <mdrizwan827@gmail.com> wrote:
>
> Hi Kent,
> Thank you for your response.
>
> I am observing a strange thing here.
>
> The kernel logs for the hogged GPIO reports as:
> [    0.251788] GPIO line <num> (name) hogged as output/high
>
> The corresponding dts changes are:
> >
> > pNum {
> > gpio-hog;
> > gpios = <num GPIO_ACTIVE_LOW>;
> > output-low;
> > line-name = "name";
> > };
>
>
> Based on the kernel log, I could say that it is hogging the GPIO as expected.
>
> But using the gpioinfo and lsgpio tools always show the direction as
> "input" for the hogged GPIO.
> gpioinfo <chipname>:
> line  X:      "pX" "name"   input   active-low [used]
>
> lsgpio -n <chipname>:
> line X: "pX" "name" [kernel active-low]
>
> I tried following the kernel by adding some logs, it seems to set the
> correct direction.
> I have really ran out of options here, any leads would be helpful.
>
> Thanks
