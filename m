Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1417839713C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 12:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbhFAKSV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 06:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhFAKSV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 06:18:21 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34CEFC06174A
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 03:16:40 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x38so20909367lfa.10
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 03:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9JgJKLG77oA4fsPfmhV/22/+J8paV7JGFmptd3FIW44=;
        b=sl+L5T4gBDijTK/6PvXm02T1i8WN8JiAWYOScypKiijXgVP6N1crIeVt+wWGBXXFDH
         3bj7Vv2phMrmsLD6ekzlzlzgtg2MgXSKL/DL63Y3EGZnDOsTqKgLIRO7b2umrlTw7std
         GWGZhhGmbTAdUS6Dv8FSjCuGB7AjPT0R9XNIoF13jT7jKHHc1epZX0edVkf0ldfOuGMo
         w0hFrTRebe8kTg5hCXmkUHuC/HgJQqiM6NB06D1hzudz1sJotMH4RxG6uEuf/CvkMs/+
         oQe44XFiI/94UDn7W448kquuUxis6Cae4rc3z8SkQmHKh30VUpteVsP4C5Lh02HTEguu
         g3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9JgJKLG77oA4fsPfmhV/22/+J8paV7JGFmptd3FIW44=;
        b=tJ6Vj8i1ulQ+Juh8YlnUjLrrKCep9tk8oPBTRYkIefLhnGRdWHaSiCD+2DCk2HDhCZ
         tUX4Fz9WrLfiK0GXvgEkLuXLr27nWP2id5W0LID3cSRKeu4TFLmo2F1xP8cmQc0lB/D0
         ctGUIsGyM4qR560SbvnfZrG0PyG8+jQaLNmgr/1fkBZWg6Km+tn32CCOhm51uZSe/6Sd
         cCKHaSo++IKkvV+eAwkE5GPBFS22v8O4G3YUzlzqUg4bxsxxK/JWloyEZOvT1zii3CAL
         KMNNm37LqyPW5JVnYJ086JXIXYZMwZVyMDaulrzR7MDGXUemRsK7Mmz8iFTJvTbjhoMm
         ZG+A==
X-Gm-Message-State: AOAM53137Yoom9tF+gEtWMoIKU2F+YTSO7UDAGapSkw0lJMUzYH6Mg4S
        DZ0aOpJe6BBPH9w0LxObVGdEuRl6RDNNtMPlCZ10yQ==
X-Google-Smtp-Source: ABdhPJy/xrCcERW+957lXcvVNGT5zyGBGdADRSZbatHeuqcKcxbF4gcIYsCn4wfFQ5npF9r30qUpQIoF7hiIHQTgIxE=
X-Received: by 2002:a19:5503:: with SMTP id n3mr9973147lfe.649.1622542598494;
 Tue, 01 Jun 2021 03:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210527005455.25758-1-steven_lee@aspeedtech.com>
 <20210527005455.25758-2-steven_lee@aspeedtech.com> <CACRpkdZFcFuT9rdrc8BfEBmhy0--9uLMSJWfr=A+nU117_BT8A@mail.gmail.com>
 <20210528040934.GA28403@aspeedtech.com> <CACRpkdYnvzOW_86QgLAsNpNXWZXpaMiE7g9_jHZ0ZsFyhOjjAg@mail.gmail.com>
 <20210531052318.GA3973@aspeedtech.com>
In-Reply-To: <20210531052318.GA3973@aspeedtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Jun 2021 12:16:27 +0200
Message-ID: <CACRpkdbq5me7erKdzaDHrPP5QjY4-Oxqz20tg2rSn3yrWDrhYQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 31, 2021 at 7:23 AM Steven Lee <steven_lee@aspeedtech.com> wrote:

> The parameter max-ngpios is the maxmum number of gpio pins that SoC supported,
> ngpios is the maximum number of gpio pins that sgpio devices(e.g. sgpio cards) supported.

When you put it like that you really make it sound like you already
know, just looking at the compatible string, what max-ngpios is?

I.e. do you know for these three:

aspeed,ast2400-sgpiom
aspeed,ast2500-sgpiom
aspeed,ast2600-sgpiom

the unique number of slots for each? A 1-to-1 correspondance?

Then just add code to set this value from looking at the compatible
in the driver. You can write some text in description in these bindings
about how many slots each SoC has but there is no need to add any
extra parameter if you already know this from the SoC.

Yours,
Linus Walleij
