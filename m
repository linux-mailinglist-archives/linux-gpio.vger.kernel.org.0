Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C774121C10
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 22:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbfLPVkB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 16:40:01 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38429 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727224AbfLPVkB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 16:40:01 -0500
Received: by mail-ot1-f65.google.com with SMTP id h20so10895715otn.5;
        Mon, 16 Dec 2019 13:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=0GsPeTC5I7jrDDz1/mRik0wFXcqWGQRKCD2LfGMdFfQ=;
        b=lML+XikYeTMtlZ/L5neHd46CYHOiI6RZlhRbyRa6Jt4W8c3jcUHrKUtyp/wJsDpGfx
         YNCcrm64N/R3pGO4Wsym0UoPI2DvsGf+e2lPujQVG92E9G/ZQB1qRI4j9vxrDYD74119
         I05wUnrGgaInhv0MgHUehJmEzDcccMsrW3SU5x1dHQm5/hAi0haAtK2RHWHucAVuiwq9
         11EHQsipoJvBTCr0OZ2nA/VTUe+R5bfp79XGO3C9E0xxkasUyOqpGqcCg2hwiyNNxocV
         2mdfFSINtLKZ+pUlLZcLNg7gLLs9MA7YL0vQLuAc8EkR39M96o/PybudSrVNhlUflEvq
         Myqw==
X-Gm-Message-State: APjAAAWJ58FuVdUegTf4SPJuRip4C07FSEWddjRVmMGGJ7BGLb3ZNRsI
        521D+NgHBBt5X7fu9G+u0A==
X-Google-Smtp-Source: APXvYqzYmSDVxXnFshZGeMwRBHB5yeIYLUK6ymCvVZ1ZuA2IXGli11VpthB1YbxzRvDcgsm2KsKguw==
X-Received: by 2002:a9d:175:: with SMTP id 108mr33650028otu.325.1576532400888;
        Mon, 16 Dec 2019 13:40:00 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w8sm7154511ote.80.2019.12.16.13.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 13:40:00 -0800 (PST)
Date:   Mon, 16 Dec 2019 15:39:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?Cl=E9ment?= Leger <cleger@kalray.eu>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        "open list, GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH 5/5] dt-bindings: pinctrl: dw: move sps,dwapb-gpio.txt to
 pinctrl
Message-ID: <20191216213959.GA957@bogus>
References: <20191204101042.4275-6-cleger@kalray.eu>
 <CAHp75VcqqqAv1iiwjNqGVcadmdzbjHt8f_ap7DKd3LWC=wwkhw@mail.gmail.com>
 <696316719.95315119.1575467579136.JavaMail.zimbra@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <696316719.95315119.1575467579136.JavaMail.zimbra@kalray.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 04, 2019 at 02:52:59PM +0100, Clément Leger wrote:
> 
> ----- On 4 Dec, 2019, at 13:45, Andy Shevchenko andy.shevchenko@gmail.com wrote:
> 
> > On Wed, Dec 4, 2019 at 12:13 PM Clement Leger <cleger@kalray.eu> wrote:
> >>
> >> Since the driver has been moved to pinctrl and now supports it, move the
> >> documentation into pinctrl folder. In the same time, add documentation
> >> for pinctrl properties such has snps,has-pinctrl and description of pin
> >> alternate functions.
> > 
> >> +- snps,has-pinctrl : If present, register the pinctrl controller.
> > 
> > I'm wondering why we can't always assume pin control?
> 
> This hardware IP is configured when instantiated to include support for
> muxing. If configured without support, the registers will exists but won't
> configure anything.
> I guess that it's not really a problem but it will lead to unusable
> pin muxing.

Can't you determine this by the presence of child nodes?

Rob
