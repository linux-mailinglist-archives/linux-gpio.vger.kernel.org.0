Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99A4057A6B
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2019 06:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfF0EHQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 00:07:16 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:43307 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbfF0EHQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 00:07:16 -0400
Received: by mail-qt1-f195.google.com with SMTP id w17so979577qto.10;
        Wed, 26 Jun 2019 21:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=odEtYfSJdPci4PPgC6CMfIE2a3S4KfjZvHhAIm9Si2o=;
        b=NVXpmGHHe7707LTsMucUvOxwzqModa7uwKn6y782AkEHVmiQE37lGR+CCTV7KeaR4K
         Ipa2RoDO3ChzEM+/WUWhSOcMdUzPWKsf7B4l66NIlneOj25x+RcLt+JfAA7Ty7muPfix
         A4+9c0tMB0L8UkSC75MkDbLb/YA6L3lXGrlhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=odEtYfSJdPci4PPgC6CMfIE2a3S4KfjZvHhAIm9Si2o=;
        b=elhfs+S9SjoU0HuGIOzOc+eMbN2gJC1mbl3ilzibudgeu4H9WJ7+mP+cNxK+4zMq98
         O5Ey/7kGm+qnpXA/3FfMtEGOVMZggtfVzAm9PI1z3O3T3/Fa28qaG/wW6kc3F8bwSQyq
         c9c+ltOWyQ8o3Ue4ET58PP9YTxCDCnUihbT6AExUUc+qPL4+mVSS3NHESWtGmaa9UeM9
         NEpyKvpCtQDmBRoRyPT5EGlNwor8GD8Dr3VMfVYeR2Ty8ATo/1FbYqtXWyfmKwSwYZRw
         SQ1J7z4TrJA+EVsKd5/DC0jv7xdgq7zM4PsKOMci2gszPe+rNvl59Y+Fgn3DLuYffxVA
         IAOg==
X-Gm-Message-State: APjAAAUAF1X//QsoWr1P8QvPwxA9g5uKBUsMCcUcHVW0rlS92M/0aE6x
        D/gosPCZBBrZYr876pWHik9i7r8PySoaHzqYdwg=
X-Google-Smtp-Source: APXvYqyRm1YLTsTM11LFxi70F1EclLRg6D57JwIALT0GIHZ3dVSDFeeVIzBTEVCsbfHG/lF/8yIhuseiBKeTXBZy+D0=
X-Received: by 2002:a0c:a8d2:: with SMTP id h18mr1493936qvc.16.1561608435486;
 Wed, 26 Jun 2019 21:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190626071430.28556-1-andrew@aj.id.au> <20190626071430.28556-2-andrew@aj.id.au>
 <CACPK8Xfdd1ReAHr9f6zRbZ-WJRquDJsTdUQeT_JuEBhOzS8tig@mail.gmail.com> <226afe63-cc86-4920-abc1-025bdda32063@www.fastmail.com>
In-Reply-To: <226afe63-cc86-4920-abc1-025bdda32063@www.fastmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 27 Jun 2019 04:07:03 +0000
Message-ID: <CACPK8Xd3Cf8zRSTLVbcTQTu+4aEp1qhmkaFAF4AcfJMkky3gYQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: pinctrl: aspeed: Split bindings document
 in two
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-gpio@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-aspeed@lists.ozlabs.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 27 Jun 2019 at 04:02, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 27 Jun 2019, at 13:02, Joel Stanley wrote:
> > On Wed, 26 Jun 2019 at 07:15, Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > Have one for each of the AST2400 and AST2500. The only thing that was
> > > common was the fact that both support ASPEED BMC SoCs.
> > >
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > >  .../pinctrl/aspeed,ast2400-pinctrl.txt        | 80 +++++++++++++++++++
> > >  ...-aspeed.txt => aspeed,ast2500-pinctrl.txt} | 63 ++-------------
> > >  2 files changed, 85 insertions(+), 58 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
> > >  rename Documentation/devicetree/bindings/pinctrl/{pinctrl-aspeed.txt => aspeed,ast2500-pinctrl.txt} (66%)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
> > > new file mode 100644
> > > index 000000000000..67e0325ccf2e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
> > > @@ -0,0 +1,80 @@
> > > +=============================
> > > +Aspeed AST2400 Pin Controller
> > > +=============================
> > > +
> > > +Required properties for the AST2400:
> > > +- compatible :                         Should be one of the following:
> > > +                               "aspeed,ast2400-pinctrl"
> > > +                               "aspeed,g4-pinctrl"
> > > +
> > > +The pin controller node should be the child of a syscon node with the required
> > > +property:
> > > +
> > > +- compatible :                 Should be one of the following:
> > > +                       "aspeed,ast2400-scu", "syscon", "simple-mfd"
> > > +                       "aspeed,g4-scu", "syscon", "simple-mfd"
> >
> > I think we can use this as an opportunity to drop the unused g4-scu
> > compatible from the bindings. Similarly for the g5.
>
> I Wonder if we should eradicate that pattern for all the aspeed compatibles?

Yes. We've settled on ast2x00,aspeed-<foo> for most of them. If you're
aware of others we should remove them from the bindings.

I think we've stopped any new users of the gx style from getting merged.
