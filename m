Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D36501D3A96
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 20:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbgENS5s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 14:57:48 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35487 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbgENS5m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 May 2020 14:57:42 -0400
Received: by mail-ot1-f66.google.com with SMTP id k110so3265756otc.2;
        Thu, 14 May 2020 11:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/8LVtCx28CvxbjaUol4yCcZRY15FgJyZvvF69XKd/M0=;
        b=dLvm+WCSUlUSXJR/rqNr2Dxk9KK0IJR65mGaI0Tz98XQiQvn973Sd3ih6PMzq8cBv/
         PUJehRhFpIvqB5IGrT0O3MEmRZuY4ViwQwJdPYfO1o7Wfjm32ALCBp+lFsfMOCvahUNp
         E1g/ihdbYXzlSOAJaiht+h70NQ9Dg3MlnnKBkEwZ7sGCuXQEkO9nc/nuA1NVPZDg8zop
         iJZn1aNJvolUnXxyHef1wIXyAQF7R2PSg9Ry8wC/4lRYkfiZUN3/PJaY0MW2CVrca5co
         G/PC2xCVONPTl04hekwHsfNv4EqpZ8QwMrB5z0WD8yCijSQPgU6byM9IZq8AzqxAsWz3
         4P+A==
X-Gm-Message-State: AOAM533QjKBpbmzxoAtF0GM9t8yqnmVz2V5rl5glcjj8dfrNdwz6EzYN
        P+LvHRrdhofdDoUyEBeiew==
X-Google-Smtp-Source: ABdhPJw4mI4ppO8Dr25m9miTZxWJsae+emSBHCwQBGETRYpqm7RzS1GGvMUZ3eI0ctgemKfzl+w5Vw==
X-Received: by 2002:a05:6830:3148:: with SMTP id c8mr4567539ots.138.1589482661322;
        Thu, 14 May 2020 11:57:41 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t6sm1003881otb.27.2020.05.14.11.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 11:57:40 -0700 (PDT)
Received: (nullmailer pid 29213 invoked by uid 1000);
        Thu, 14 May 2020 18:57:39 -0000
Date:   Thu, 14 May 2020 13:57:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Marc Zyngier <maz@kernel.org>, linux-mmc@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/9] dt-bindings: irqchip: renesas-irqc: Document
 r8a7742 bindings
Message-ID: <20200514185739.GA27521@bogus>
References: <1588794695-27852-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1588794695-27852-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200514184306.GA8929@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514184306.GA8929@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 14, 2020 at 01:43:06PM -0500, Rob Herring wrote:
> On Wed,  6 May 2020 20:51:28 +0100, Lad Prabhakar wrote:
> > Document SoC specific bindings for RZ/G1H (r8a7742) SoC.
> > 
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v1->v2:
> > * No change
> > ---
> > 
> >  .../devicetree/bindings/interrupt-controller/renesas,irqc.yaml   | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> Acked-by: Rob Herring <robh@kernel.org>

I'll just apply this with the others that haven't been picked up.

Rob

