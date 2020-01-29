Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA10A14CAE4
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 13:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgA2Md4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jan 2020 07:33:56 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55388 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbgA2Mdz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jan 2020 07:33:55 -0500
Received: by mail-pj1-f66.google.com with SMTP id d5so2502637pjz.5;
        Wed, 29 Jan 2020 04:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Jpbr8GKp/0wStkQW/jI8GCAjFuma5ymmOxdBW7I9bGA=;
        b=YF23lrJl87SgR4eEjsacbhQb/6C+DEd3VnKmR8dE8/cefGjzErGCHqgSv9IhDViwit
         39jIgx3AejlQewGSyrXPeAAZN/TcmuVYTsh/6yrOfX2X75K0EkISrlSjt5SpUuWcpuo+
         Azu5m2VAuFNMOqnoZHNISpH9NEbrcDbBCE2Ih0IYFDV78zDEz9mgKv13Ii0s4MS7RTAV
         JAItF9WC/hZBPJUezhweKXpIQuyhK/Uq+nWYGD6jn+3m+0tWbkWWHOJy2541AdrDDrfb
         Pbn3ymh7Zo2gD+oC/wvWRCWJyDAErBcU9AwFnySX0KuzXGLA9ie4HQbJXQ/RuslYdi4r
         RHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Jpbr8GKp/0wStkQW/jI8GCAjFuma5ymmOxdBW7I9bGA=;
        b=lgUSIIjLT71hDTTd5adzJgdgqbKIwX7qM+ZeLgP8C7Wfj/ReN7UOdUYH7oy8MnEeEO
         nUqbQawYHcI1AhBsRifOpwiJysxzjMEYM583dN/oUAOp9uCPArAAPXnh0jejXQT3LfQp
         p/VGU9uB7Ams/ZNlVY+DwlFzB9uxJkAig+CsWAIyt19ZW6HvFCEX0zC1H0wb1CaXsTnB
         tORa1/hfVGbJlUPikLdqZwEAKEfZR/NMQAIoShjFx/8RZqiowLMYxDhLXPO1pQyOoxT6
         lIjPq/b2u6KHQTTFSghG3L3NsL1Wl9C6baJoKOTkR29w6LdrWIolA2yX9zbgqNKgevNE
         2VlA==
X-Gm-Message-State: APjAAAXrG8p1bQlZoVVGeT/mWZySMRl+grWaRvqw6AEmZCWS8n/bSYKW
        RPI/AdNa/m8nCnPn9MY6s3k=
X-Google-Smtp-Source: APXvYqx6QgAA5Yfmz7YYE7tRmEYfjG0454Sb6tWfecapBqRmjm3uljgDvjaSwRnv5lumVQs0pW7pSQ==
X-Received: by 2002:a17:90a:2351:: with SMTP id f75mr10862042pje.133.1580301235171;
        Wed, 29 Jan 2020 04:33:55 -0800 (PST)
Received: from sol (220-235-85-249.dyn.iinet.net.au. [220.235.85.249])
        by smtp.gmail.com with ESMTPSA id y6sm2678154pgc.10.2020.01.29.04.33.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2020 04:33:54 -0800 (PST)
Date:   Wed, 29 Jan 2020 20:33:49 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: remove unnecessary argument from set_config call
Message-ID: <20200129123349.GA3801@sol>
References: <20200120104626.30518-1-warthog618@gmail.com>
 <CAMpxmJWCwtnuB4T3_no59cVvPS5gy6QwOBV3i4FU4N6hmYugEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJWCwtnuB4T3_no59cVvPS5gy6QwOBV3i4FU4N6hmYugEw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 29, 2020 at 11:55:49AM +0100, Bartosz Golaszewski wrote:
> pon., 20 sty 2020 o 11:46 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > Remove unnecessary argument when setting PIN_CONFIG_BIAS_DISABLE.
> >
> > Fixes: 2148ad7790ea ("gpiolib: add support for disabling line bias")
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >
> > No argument is expected by pinctrl, so removing it should be harmless.
> >
> 
> This doesn't really fix any bug, does it? If not, then I'll just take
> it for v5.7 after the merge window.
> 

This is just fixing what I suspect was a cut-and-paste error on my part
that wasn't picked up during review - until I had a closer look
following Geert and Andy's recent comments on some of your proposed
changes.  So it is just a tidy up.

It could only a problem if a pinctrl is making use of the unnecessary 
argument, and there are no such pinctrls that I am aware of.

Merge it in whenever it is convenient.

Cheers,
Kent.
