Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0892AEDC
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2019 08:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfE0Glu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 May 2019 02:41:50 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37803 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfE0Glt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 May 2019 02:41:49 -0400
Received: by mail-pg1-f193.google.com with SMTP id n27so8532191pgm.4
        for <linux-gpio@vger.kernel.org>; Sun, 26 May 2019 23:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4/HzX52OrCnis302RqBSbBUi/NWy6HP0B3xr1wzhcQ8=;
        b=CUZnJKYHgsstejCHuJ8ei2HYYKLEj6wUCY30alqN8VUKo/mCmWo3+L7rVbDMh4sw4q
         v8iwsmxua/Th+KEucyLh5fxqmqztpo0EQxei3XfMhBlVXbzqCzVNGPYjJLVB4+c7WKEJ
         z9reMbZFOLgaEeSKJskbekD8zNRh5HY2IQVAWPLxAipgNQKYzuRHwtGLe2/OmioVhIsD
         Wm/3MWjlxOTkHXHqcmidEofzuXn+A+5lMLve8ymG4CCO5s8FzC/SB5oxPu8hOL7eIUuX
         mejV1fev2pVc6OK2AP2tETcyUAj0YDaJmnetzlZYQLqgLbwDEvkAHz4sJhKAlvsCuUWj
         Cv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4/HzX52OrCnis302RqBSbBUi/NWy6HP0B3xr1wzhcQ8=;
        b=NoNmjRtnPoevjiYzTiUBeF+NbzJ5JOlf/rVYpoFvQoNLOb941TFWScWrYFb5tC4aq2
         T5p6Ev4XC/NGGkDTTdObh0jhILPGe3adFOcAwRjw3n6S8HMjHS2Fug9yCYubkCPx54/0
         1y5HXp+k2Wka7LKCvGNGE/WFMfxlricwO5rzGRqBmvVWlfEfBNBrvbMex2gobRemCqtE
         O5AO8qZZ7L+okrRGY3XN07adPPqFgJ3drCHiJlFQbiVbv8kwzMIPEUpvPV8DXfrXkxuT
         I45Bg5bDecz038VbU70dY9VDv3n3Q6ZRExfyELM4G0yaslvQ65G/GvZMFKaFKROE4yK4
         ddVA==
X-Gm-Message-State: APjAAAWEIschqXdl8MUYe3dXwOLqevcz1oWd6oG+kaQTX48tyPQ/x3lf
        6v0pYE5elN96KiJ3Hk4uESzF7Q==
X-Google-Smtp-Source: APXvYqwzSNxf5xyNIrcxftAJlxeN28TQ9hDRBQV13SrKOT5EVHqD+LOv/Ty4GqWv18yx1qqkfLgLKw==
X-Received: by 2002:aa7:8dd6:: with SMTP id j22mr70066022pfr.192.1558939309070;
        Sun, 26 May 2019 23:41:49 -0700 (PDT)
Received: from localhost ([122.172.66.84])
        by smtp.gmail.com with ESMTPSA id s27sm5379775pfd.18.2019.05.26.23.41.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 23:41:48 -0700 (PDT)
Date:   Mon, 27 May 2019 12:11:46 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: gpio: Convert Arm PL061 to json-schema
Message-ID: <20190527064146.5rlm2audk6uojdxn@vireshk-i7>
References: <20190514005033.15593-1-robh@kernel.org>
 <CACRpkdZabT3_vjkv0PR+GLC0ZXWzpMxfwJU6O9Y+omKJ=6zCaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZabT3_vjkv0PR+GLC0ZXWzpMxfwJU6O9Y+omKJ=6zCaA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24-05-19, 13:38, Linus Walleij wrote:
> On Tue, May 14, 2019 at 2:50 AM Rob Herring <robh@kernel.org> wrote:
> 
> > Convert the Arm PL061 GPIO controller binding to json-schema format.
> >
> > As I'm the author for all but the gpio-ranges line, make the schema dual
> > GPL/BSD license.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Cc: linux-gpio@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> 
> Patch applied. As you know I am already a big fan of this scheme.
> 
> > This warns on a few platforms missing clocks, interrupt-controller
> > and/or #interrupt-cells. We could not make those required, but really
> > they should be IMO. OTOH, it's platforms like Spear and Calxeda which
> > aren't too active, so I don't know that we want to fix them.
> 
> What works for you works for me.
> 
> We could add dummy fixed clocks in the DTS files if
> we wanted I suppose. The #interrupt-cells and interrupt-controller
> things we can just fix, but I wonder what the maintainers of these
> platforms are up to? Isn't Calxeda yours, and could Viresh fix
> up the SPEAr?

I checked SPEAr and it is missing interrupt-controller at few places and clocks
everywhere. Missing clocks should be fine as SPEAr doesn't get clocks from DT.

And interrupt-controller can be just added, I don't think there would be any
platform dependent side-affects ?

-- 
viresh
