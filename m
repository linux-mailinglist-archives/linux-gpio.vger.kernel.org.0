Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7048039991E
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 06:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbhFCE2K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 00:28:10 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:34495 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbhFCE2J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 00:28:09 -0400
Received: by mail-lf1-f52.google.com with SMTP id f30so6827478lfj.1;
        Wed, 02 Jun 2021 21:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=rrDXbMXVVEpFm4oCGOVkSODCgq2WYx0s4pQOaY7en18=;
        b=TYMwOqitKeXnzEmvf8XxeNkFmGQjea0zWr1Fas8a99fqkKCKCc+Oew4cSWZLvHVDOS
         W3abSvU4gBTuOP6PNgF7C5omAeIces4Gia9MadbDTbKteQ2YxzBriEvLymkvxCVOgg63
         VIXFHVR9vC0eyZ5T6EHWeafXp9PuPOBWNs3kzDPuHJl//M2jn/ksH9VYjtsBxyUQcCJR
         qsnsBrAmoHKqydAl16h/H+Xj0Cmjra0HAf8MD2f/KdwD9A2sADKOLwKsbf/Zjq66Ou4/
         QE5+Pi2jrtWsWVwnjaZL1zysfDIw8oY39DvAiwbK7XcLypCAMFY3rL9JMVtsJkMjEo8B
         Rr+g==
X-Gm-Message-State: AOAM531fHusoOGGALJ7lhprFgRwIdeteAqf81Z1h40ayI+eGz20RdSYB
        MtKE8a2h2SqrNWL2xX2vsvw=
X-Google-Smtp-Source: ABdhPJz3dNw9Rmk+VdDyrkwVRQYWP+fuMgo0HcbYnnvDAci/SFbOow756/kiTDf+pOjguytrC2Pk3w==
X-Received: by 2002:a05:6512:224f:: with SMTP id i15mr11703144lfu.162.1622694369127;
        Wed, 02 Jun 2021 21:26:09 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id a15sm188528lfm.54.2021.06.02.21.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 21:26:08 -0700 (PDT)
Message-ID: <f651ce02ef481eafca0ff0c95d76c6060f4f0021.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v4 2/3] gpio: gpio-regmap: Use
 devm_add_action_or_reset()
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
In-Reply-To: <CAMpxmJWmmB1tuYS-zy-n165WFnAmz12-7+3LDQxxh+jvk=QD_Q@mail.gmail.com>
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
         <cf34b0268bf298314392b0ed8831a4d9cd14efca.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
         <8c1f817e48bce8a4cb730d79c1ef0330@walle.cc>
         <CAMpxmJWmmB1tuYS-zy-n165WFnAmz12-7+3LDQxxh+jvk=QD_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Thu, 03 Jun 2021 07:26:03 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Morning Bart,

On Wed, 2021-06-02 at 13:54 +0200, Bartosz Golaszewski wrote:
> On Fri, May 28, 2021 at 7:17 PM Michael Walle <michael@walle.cc>
> wrote:
> > Am 2021-05-26 08:10, schrieb Matti Vaittinen:
> > > Slightly simplify the devm_gpio_regmap_register() by using the
> > > devm_add_action_or_reset().
> > 
> > Reviewed-by: Michael Walle <michael@walle.cc>
> > 
> > -michael
> 
> This doesn't apply on its own - looks like it depends on patch 1/3.
> Would you mind sending it separately rebased on top of my for-next
> branch at 
> https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/?
> 

Sure. No problem. I'll respin this sole patch today unless Michael
plans adding other changes - in which case it might be best he includes
this just to avoid the conflicts.

> Bart


