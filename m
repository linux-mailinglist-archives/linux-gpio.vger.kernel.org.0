Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A96E46F4C
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Jun 2019 11:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfFOJel (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jun 2019 05:34:41 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33258 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbfFOJel (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Jun 2019 05:34:41 -0400
Received: by mail-lj1-f195.google.com with SMTP id h10so4767056ljg.0
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jun 2019 02:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S+e3ae3nDo211Phfm6lcT95OA7IYBp3eNuvxr46hQI8=;
        b=zsVylsI+bnY06zotdYazoqPbnqUS2bZqtx0d0MuPW/bi3FvKVPndysWw/GmsA8nyHT
         8OH/NT4ce1fzy5TYJlw+GTkMjV7R1XaROP5ucrGnnw9G+yWfWFxFlIgWx3OVZ0x1I5tl
         QnwB4lxeWcknPXNyNPm3rS4cHa7P5WmM815esIo4rsIvSI7OdC5YxnnU8It9uAtMks6l
         K850SbpvjROUXWEPw6SiH2O9omsXoqefhAPei/vVTEUCASiIZYeatcjTMajo59ZtyfWb
         DWVcboaNAnc11jo7aidKR2y3twNjWkTIb2gO4WO2e7TpPWH+XJkry/tpYuGouE7lLcyR
         0c+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S+e3ae3nDo211Phfm6lcT95OA7IYBp3eNuvxr46hQI8=;
        b=UqGvvWmTDoiLxcmU10B6O3hysts3RnMjSotyRHBrnUw9qSrLV9RThHNXX3nxb39K5F
         iSmRFDPeM9TBHZgc4hsmgMPOo78fk4nNeJqn1ZGI7ZbXWqtyh+jh9PHV7KVqe+T1e11U
         RPmxx8ltTi4HgXUOYQavqK1gnJ7L2751p8p/qMIY+LSl7v1jUC/IK9QHviXnGmN4mobT
         nxyPJbOD/Po3RXYT7MV/CFVntOaXtBAsGLsgupcE5VGZhZ1ZOu4GlhmAzccFBPBzEpcz
         yI+njTCJkTq5T4DzfU8TYMTw1iqtdQ82uC4mf9OZvqcSao2/OU2YbwkHVG+FHw9OVTjJ
         ze7A==
X-Gm-Message-State: APjAAAWGXPxtybAWa0vMs9j29m5u4O0Bu/+VAf2QiKprCtQXXs5sUc4c
        7ohTshAcpb95E1NCxw4mPqOrfKTH9gS1kmQNewlqUQ==
X-Google-Smtp-Source: APXvYqwLTbopvLRNBKb2DO7gOLSSgRDu4W/A9L+CndsAaEJ7YfZQiyyOgo75eSM8f89ms/J7M3hBuD/kna+45G311Jo=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr23119868ljm.180.1560591279344;
 Sat, 15 Jun 2019 02:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190612193115.6751-1-martin.blumenstingl@googlemail.com>
 <20190612193115.6751-2-martin.blumenstingl@googlemail.com>
 <CACRpkdajXRXRFz=XpbEzwUb-crhBxNQ4f-m9rfdY6+HcG0+_gA@mail.gmail.com> <CAFBinCAimhth8fDcBZ3vNdy_9dGmHZVAAK0=TUczWWC4Dsa-pA@mail.gmail.com>
In-Reply-To: <CAFBinCAimhth8fDcBZ3vNdy_9dGmHZVAAK0=TUczWWC4Dsa-pA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 15 Jun 2019 11:34:25 +0200
Message-ID: <CACRpkdbQ5VivFJhL4keOgmUe7BzhVU2v2R0Lso8rQx5s3tHY8w@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/1] net: stmmac: use GPIO descriptors in stmmac_mdio_reset
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     netdev <netdev@vger.kernel.org>,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 15, 2019 at 11:11 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> I think I finally understand why you want to switch everything over to
> GPIO descriptors

A bit after-the-fact reasoning, but after I was made aware of an interesting
lecture by John Ousterhout I feel the best description of the descriptor
refactoring is the idea to make the GPIO API narrow and deep, make
it simple for consumers (hence <linux/gpio/consumer.h>) and handle
as much special cases (polarity inversion, open drain...) as possible
behind the scenes.

Yours,
Linus Walleij
