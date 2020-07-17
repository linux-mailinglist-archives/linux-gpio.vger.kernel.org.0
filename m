Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A62E223F31
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 17:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgGQPOY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 11:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgGQPOX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 11:14:23 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14DCC0619D2;
        Fri, 17 Jul 2020 08:14:23 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id e8so6803930pgc.5;
        Fri, 17 Jul 2020 08:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gnH2Zn48d+tF3Gr8V7xhcp7hCTYjQFyRnpkhaCFe4uE=;
        b=rcMY1gAsEdu3Zm1TBCCIyqT3Hm+B51am3j1wzknk5T0iLwEcYDS0owXcM2+ii4qq+T
         8LPoTcY+HGh3duhkuNesN87pKxKod4iD0i1a8JEvF1PCv7tgABCd2U7cs4FcHOdVdQI4
         mjNtgk2HDLSsp9QYugCYdw884/A1FsSPZmzQtf/BW48fXiOBqaETsUzCu9k1BrYNggLy
         po6ZBBomTqH6UEya4o2sDVWOHO7213oXkN8FEG9/MGptTeX4VK/tDiI5yShPku8DmEd/
         ghBSwZ7Rwc9HrXx8yPdulgkw4QyxsIvOmAULkb0AzpEXpZNcAA3gQLX2c+WLvmq5MaQs
         PdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gnH2Zn48d+tF3Gr8V7xhcp7hCTYjQFyRnpkhaCFe4uE=;
        b=eSm0YX+OfygyPqEqUQMKJjd2bDVi/DilhxfN3M+faWQoo4lOcIOsDAN52kIjDlkm11
         RVRd168ZsNAVpJYYq3RYLZC9TnfO/+IBTs23wd34sT86qa/lWiSoiwjY6BBlVKYBKI9+
         Jy71cr/7iPaxsQ47TRWnBHiNUjDSppwKxtbRDXBWVoiD1LKL1siX+Mi/esTV1/1HVABt
         ttqqQzEG26keMYa/PXPRG/8qy4gr6pviT/tfeNPjkQ2UIbJudxxe3LJ5IZ0zewHX5gR2
         QZXM4hjkjPrn1H5418t0MNh8OaIOWodmdsju9yw56wqNS4jX5MGRNj3KasIi3JUQ5nI2
         2Z7A==
X-Gm-Message-State: AOAM531TB1eY43HRV8MOFznovp95Af+E2COeP+d5QuTfjoqv8kN5cuOy
        KNRlRGoSQw1XP18q1e7AB/U7KAbgIVfuaaF2RWs=
X-Google-Smtp-Source: ABdhPJw28fJzlnfSnkm5la1142GtYSnfWlmduGKH1FXIzbcs0yHh0D8B3CX/HcA8SvMVhIeJc7IWB2H4RDGYmkonbVA=
X-Received: by 2002:a63:a05f:: with SMTP id u31mr8820761pgn.4.1594998863139;
 Fri, 17 Jul 2020 08:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200717013338.1741659-1-drew@beagleboard.org>
In-Reply-To: <20200717013338.1741659-1-drew@beagleboard.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Jul 2020 18:14:06 +0300
Message-ID: <CAHp75Vd_s-W7Z1iG4fA5JvY51OzstkTYUcQcd=OGJUQtcJ75Ww@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: print gpio number in pins debugfs file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 4:36 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> If there is a gpio range mapping for the pin, then print out the gpio
> number for the pin in the debugfs 'pins' file.
>
> Here is an example on the BeagleBone Black:

>   pin 0 (PIN0) 44e10800 00000027 pinctrl-single GPIO-32
>   pin 1 (PIN1) 44e10804 00000027 pinctrl-single GPIO-33
>   pin 2 (PIN2) 44e10808 00000027 pinctrl-single GPIO-34
>   pin 3 (PIN3) 44e1080c 00000027 pinctrl-single GPIO-35
>   pin 4 (PIN4) 44e10810 00000027 pinctrl-single GPIO-36
>   pin 5 (PIN5) 44e10814 00000027 pinctrl-single GPIO-37
>   pin 6 (PIN6) 44e10818 00000027 pinctrl-single GPIO-38
>   pin 7 (PIN7) 44e1081c 00000027 pinctrl-single GPIO-39
>   pin 8 (PIN8) 44e10820 00000027 pinctrl-single GPIO-22
>   pin 9 (PIN9) 44e10824 00000030 pinctrl-single GPIO-23

Wouldn't it be better to have this for all types of pin controllers?
But I'm not sure about the format of output.

-- 
With Best Regards,
Andy Shevchenko
