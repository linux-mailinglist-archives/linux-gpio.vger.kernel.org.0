Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B0E34D052
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 14:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhC2Mrr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 08:47:47 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:42568 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbhC2MrY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 08:47:24 -0400
Received: by mail-lf1-f52.google.com with SMTP id o10so18196416lfb.9;
        Mon, 29 Mar 2021 05:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=qcUkrZxCZhAMY+mD6RDntHpxB7c/p3mawg28QpuxShY=;
        b=TpjX4pNbD75w4xB+txGJdl9x5PI+sU44yTheoTNZC/w3MdNn3/hyVW9La3tv3HaT0/
         Lr8SCKMQ7KI1ntgzy93y4u918nOG2DzOWYJOMzBIidjgemTTaIRitt6jlL5LmNHpojig
         W/7VGxfpzDUVixkWAR4EXI6ab0ILYYpogJpV+I1Xh34atEVUsq2QO0jM6CaOmHT4kShx
         bhOAcJI8k4WTHRoyVIu+/8qsDlmGj48vlEyl8xPbVt2nA55CuTLPXrTp31O+v3RBHiSd
         wyQAcLoIoYJdaCZu7ha+3XxIXhLOQ5Afn9quBHeVGg8y9nwklL2/H2O6RM9hbeIMOXkR
         OVww==
X-Gm-Message-State: AOAM530kUIKiVXX2APdJR6nkeNt6iDqXWgRQgsIvVwI3AGJlVTQqVoHT
        DzHhMkwV1adr5gQ1/Fa0LHCxZAxNP++PPg==
X-Google-Smtp-Source: ABdhPJxcqzSpvlZ5/l+LnbH92oR6LF57czHA95JmDUeNTw7crz1rVuvNSo46wGvFzvCg0HQ+zxMvhQ==
X-Received: by 2002:a05:6512:5d7:: with SMTP id o23mr16028798lfo.81.1617022043565;
        Mon, 29 Mar 2021 05:47:23 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id f22sm1826514lfc.68.2021.03.29.05.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 05:47:23 -0700 (PDT)
Message-ID: <bf12f668db2f0dce7dfc09351780e295da30714c.camel@fi.rohmeurope.com>
Subject: Re: [PATCH 2/2] gpiolib: Allow drivers to return EOPNOTSUPP from
 config
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Joe Perches <joe@perches.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
In-Reply-To: <CAHp75VdXa2bkJ+ej+HNYstLeK4TF+L5H3wTgm0CgJ9hYQeU+ZQ@mail.gmail.com>
References: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
         <d2c8b7f9a3b420c2764f645da531a57db16905f3.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VdXa2bkJ+ej+HNYstLeK4TF+L5H3wTgm0CgJ9hYQeU+ZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Mon, 29 Mar 2021 15:20:07 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2021-03-29 at 14:59 +0300, Andy Shevchenko wrote:
> On Mon, Mar 29, 2021 at 2:43 PM Matti Vaittinen
> <matti.vaittinen@fi.rohmeurope.com> wrote:
> > The checkpacth instructs to switch from ENOSUPP to EOPNOTSUPP.
> > > WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> > 
> > Make the gpiolib allow drivers to return both so driver developers
> > can avoid one of the checkpatch complaints.
> 
> Internally we are fine to use the ENOTSUPP.
> Checkpatch false positives there.

I agree. OTOH, the checkpatch check makes sense to user-visible stuff.
Yet, the checkpatch has hard time guessing what is user-visible - so it
probably is easiest to nag about all ENOTSUPP uses as it does now.

> I doubt we need this change. Rather checkpatch should rephrase this
> to
> point out that this is only applicable to _user-visible_ error path.
> Cc'ed Joe.

Yes, thanks for pulling Joe in.

Anyways, no matter what the warning says, all false positives are
annoying. I don't see why we should stay with ENOTSUPP in gpiolib?
(other than the burden of changing it).

But I have no strong opinion on this. All options I see have downsides.

Accepting both ENOTSUPP and EOPNOTSUPP is the easy way to avoid
allowing checkpatch warnings - but I admit it isn't stylish. 

Converting all ENOTSUPP cases inside gpiolib to EOPNOTSUPP is teodious
although end result might be nicer.

Leaving it as is gives annoying false-positives to driver developers.

My personal preference was this patch - others can have other view like
Andy does. I'll leave this to community/maintainers to evaluate :)

Best Regards
	Matti Vaittinen


