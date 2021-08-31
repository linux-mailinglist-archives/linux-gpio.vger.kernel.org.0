Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1FE3FCA84
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 17:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233809AbhHaPGv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 11:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbhHaPGv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Aug 2021 11:06:51 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1CFC061575
        for <linux-gpio@vger.kernel.org>; Tue, 31 Aug 2021 08:05:55 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id z19so27268110edi.9
        for <linux-gpio@vger.kernel.org>; Tue, 31 Aug 2021 08:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BARSFxi7xv3nkNL/W/EDPHcCb/EHGhTjhxrEdjrSyAY=;
        b=htbNVn16qJ+0RZ8YbO0qf15i5f4+EKmDTPCi+17+435Nna8aO5vgAiq+y/9hCKFhNN
         QIJ5ew+xxGXj/yvlAdX6dhIlCqBQz6vbB3c0IkMylHaadwFKKhPRqa33QEkwJUV7PEnP
         9ho1KaY8132gp4eXKMyxINkd0VyiL7TJjfXpLFHZ7BiiIh5br8Ch1XuGe9incWg3srBH
         HfnGfAL22FrmJazxebDaO3nvfEQoOUnzkWRMW1ZRoCHfPTQYg6nUNCJpKhSeWweAOTfF
         RP51v4Hm8caZJ/e8/Q6KYcse3BWtGIL0uKDEHJCB9Wykd5pPkH54VVMojcIfjetaL7lB
         TBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BARSFxi7xv3nkNL/W/EDPHcCb/EHGhTjhxrEdjrSyAY=;
        b=TYwCsD4dvjSAtHzZHKD7Kh3L55n+70o0aKfNUvUr2LRuQO7wehIH1R9HXiDofHJ3H6
         EDTEvo3Oob+D5fxSrOT8THgBVfklNvmhFjYkhq1DNdTAYBlPph5WMMW7jC2tNniBuqej
         BwdeUYwgfBGtygR1NsuZPcTX5TVHpOuOp2bmwdzsCw8/6LADpjyfzHZEzoDo0rtcr2/O
         rkDgdRxAorw84K5lgwY0jhepwsPlpiUvaBSKGeozpvgSPLqBhbeqiV2BjV9A5a3ZM9SK
         az4wfCnPh/Mv2cfhfEqV2DR/I9EmY8/CZ/7PLbQcl9odryLQWu0MxYg4H2yqvtckQC87
         nonQ==
X-Gm-Message-State: AOAM531nQz2ipIHwmi0TGWUnlth6Mh/wP3GG1zRoEPDx4U/r4F279l4R
        0rOs+0uHNyhvDQbQNXtLq4W/aKpm3ffDNpy9nqBMTevD+ODB4g==
X-Google-Smtp-Source: ABdhPJxt9Hgl9THfFvLcMO+ywjvb5O2kWfTmnISlKVvMn8OQeSfOa6veBrY72RUqV7jYCW1yMdY7O3F2OuCtaMWjbTQ=
X-Received: by 2002:a05:6402:b9c:: with SMTP id cf28mr31366078edb.356.1630422354407;
 Tue, 31 Aug 2021 08:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <CA+FSg4rJcDPhPoBbEYjsq_UOysLUdp6YnBh+3XeHL7UkH2cfdA@mail.gmail.com>
 <CAHp75Vct=K1Nh+UDS9tZgvgF1ju_c8417wzfHg9YCA2ay0jtCA@mail.gmail.com> <20210827022140.GA8509@sol>
In-Reply-To: <20210827022140.GA8509@sol>
From:   Riz <mdrizwan827@gmail.com>
Date:   Tue, 31 Aug 2021 20:35:43 +0530
Message-ID: <CA+FSg4qxArwg67YCbpknJciOfraV-WxSUwsFrq1DmNLKHZHqLw@mail.gmail.com>
Subject: Re: Regarding export of GPIOs
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Kent,
Thank you for your response.

I am observing a strange thing here.

The kernel logs for the hogged GPIO reports as:
[    0.251788] GPIO line <num> (name) hogged as output/high

The corresponding dts changes are:
>
> pNum {
> gpio-hog;
> gpios = <num GPIO_ACTIVE_LOW>;
> output-low;
> line-name = "name";
> };


Based on the kernel log, I could say that it is hogging the GPIO as expected.

But using the gpioinfo and lsgpio tools always show the direction as
"input" for the hogged GPIO.
gpioinfo <chipname>:
line  X:      "pX" "name"   input   active-low [used]

lsgpio -n <chipname>:
line X: "pX" "name" [kernel active-low]

I tried following the kernel by adding some logs, it seems to set the
correct direction.
I have really ran out of options here, any leads would be helpful.

Thanks
