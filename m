Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C97611F9BB4
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 17:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730470AbgFOPQj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 11:16:39 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:34471 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730197AbgFOPQj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 11:16:39 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B1D2EFF811;
        Mon, 15 Jun 2020 15:16:32 +0000 (UTC)
Date:   Mon, 15 Jun 2020 17:19:56 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hyun Kwon <hyunk@xilinx.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v10 1/4] dt-bindings: media: i2c: Add bindings for Maxim
 Integrated MAX9286
Message-ID: <20200615151956.fsiczqldkle5aevb@uno.localdomain>
References: <20200612144713.502006-1-kieran.bingham+renesas@ideasonboard.com>
 <20200612144713.502006-2-kieran.bingham+renesas@ideasonboard.com>
 <20200612221003.GA3901624@bogus>
 <20200613123207.6ey6y5spfa5ajk4h@uno.localdomain>
 <CAL_Jsq+o6Hwz6vN2mgYGnZF4wX5nFoaXRMweQr8euep-9OmBiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+o6Hwz6vN2mgYGnZF4wX5nFoaXRMweQr8euep-9OmBiA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On Mon, Jun 15, 2020 at 09:02:28AM -0600, Rob Herring wrote:
> On Sat, Jun 13, 2020 at 6:28 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > Hi Rob,
> >
> > On Fri, Jun 12, 2020 at 04:10:03PM -0600, Rob Herring wrote:
> > > On Fri, 12 Jun 2020 15:47:10 +0100, Kieran Bingham wrote:
> > > > From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > >
> > > > The MAX9286 deserializes video data received on up to 4 Gigabit
> > > > Multimedia Serial Links (GMSL) and outputs them on a CSI-2 port using up
> > > > to 4 data lanes.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > >
> > > > ---
> > > >
> > > > v7:
> > > >  - Collect Rob's RB tag
> > > >  - Remove redundant maxItems from remote-endpoints
> > > >  - Fix SPDX licence tag
> > > >
> > > > v10:
> > > > [Jacopo]
> > > >  - Fix dt-validation
> > > >  - Fix dt-binding examples with 2 reg entries
> > > >
> > > > [Kieran]
> > > >  - Correctly match the hex camera node reg
> > > >  - Add (required) GPIO controller support
> > > >
> > > >  .../bindings/media/i2c/maxim,max9286.yaml     | 366 ++++++++++++++++++
> > > >  1 file changed, 366 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > >
> > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/maxim,max9286.example.dt.yaml: example-0: i2c@e66d8000:reg:0: [0, 3865935872, 0, 64] is too long
> > >
> > >
> > > See https://patchwork.ozlabs.org/patch/1308280
> > >
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure dt-schema is up to date:
> > >
> > > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> > >
> >
> > I have updated my dt-schema installation to the latest github master
> > -------------------------------------------------------------------------------
> > Successfully installed dtschema-2020.6.dev8+g4d2d86c
> >
> > https://github.com/devicetree-org/dt-schema/commit/4d2d86c5cd65cd3944ce0aaa400866bc36727bea
> >
> > $ /usr/bin/dt-validate -V
> > 2020.6.dev8+g4d2d86c
> > -------------------------------------------------------------------------------
> >
> > But I still cannot reproduce the error.
> >
> > However, I see this commit in your next branch
> > https://github.com/devicetree-org/dt-schema/commit/b72500282cfd2eba6f9df4d7553f696544b40ee6
> > "schemas: Add a schema to check 'reg' sizes "
> >
> > Which sounds very likely related to the above reported error.
> > Was this intentional ?
>
> Yes, I can't add the new checks to master until all the in tree schema
> are fixed yet I want to check submissions with pending checks, so I
> created the 'next' branch.

I see, makes sense. Can I just suggest to add a few words about this
new branch in the automated reply ? Otherwise the ones who are not aware
of this (like I was) will keep wondering why they don't see the error your
bot reported even if they have updated their dt-schema version to the
latest available master.

>
> > I'm not sure how I should handle this. The error reports the i2c node
> > parents should have both address-cells and size-cells properties set
> > to 2, but in the example there is not i2c node parent at all :)
> > Should I add a parent node for the i2c in the example snippet ?
>
> The examples have default sizes of 1 cell. If you need something
> different, the example has to define a parent node to specify it. In
> your case, I'd just change 'reg' to use 1 cell each.
>

Thanks, will fix.


> Rob
