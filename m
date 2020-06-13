Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01AEC1F8333
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2020 14:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgFMM2v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Jun 2020 08:28:51 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:37649 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbgFMM2u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Jun 2020 08:28:50 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 0F0CB1BF204;
        Sat, 13 Jun 2020 12:28:43 +0000 (UTC)
Date:   Sat, 13 Jun 2020 14:32:07 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hyun Kwon <hyunk@xilinx.com>, linux-media@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        sakari.ailus@iki.fi,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v10 1/4] dt-bindings: media: i2c: Add bindings for Maxim
 Integrated MAX9286
Message-ID: <20200613123207.6ey6y5spfa5ajk4h@uno.localdomain>
References: <20200612144713.502006-1-kieran.bingham+renesas@ideasonboard.com>
 <20200612144713.502006-2-kieran.bingham+renesas@ideasonboard.com>
 <20200612221003.GA3901624@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200612221003.GA3901624@bogus>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On Fri, Jun 12, 2020 at 04:10:03PM -0600, Rob Herring wrote:
> On Fri, 12 Jun 2020 15:47:10 +0100, Kieran Bingham wrote:
> > From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > The MAX9286 deserializes video data received on up to 4 Gigabit
> > Multimedia Serial Links (GMSL) and outputs them on a CSI-2 port using up
> > to 4 data lanes.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > ---
> >
> > v7:
> >  - Collect Rob's RB tag
> >  - Remove redundant maxItems from remote-endpoints
> >  - Fix SPDX licence tag
> >
> > v10:
> > [Jacopo]
> >  - Fix dt-validation
> >  - Fix dt-binding examples with 2 reg entries
> >
> > [Kieran]
> >  - Correctly match the hex camera node reg
> >  - Add (required) GPIO controller support
> >
> >  .../bindings/media/i2c/maxim,max9286.yaml     | 366 ++++++++++++++++++
> >  1 file changed, 366 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> >
>
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/maxim,max9286.example.dt.yaml: example-0: i2c@e66d8000:reg:0: [0, 3865935872, 0, 64] is too long
>
>
> See https://patchwork.ozlabs.org/patch/1308280
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
>
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
>

I have updated my dt-schema installation to the latest github master
-------------------------------------------------------------------------------
Successfully installed dtschema-2020.6.dev8+g4d2d86c

https://github.com/devicetree-org/dt-schema/commit/4d2d86c5cd65cd3944ce0aaa400866bc36727bea

$ /usr/bin/dt-validate -V
2020.6.dev8+g4d2d86c
-------------------------------------------------------------------------------

But I still cannot reproduce the error.

However, I see this commit in your next branch
https://github.com/devicetree-org/dt-schema/commit/b72500282cfd2eba6f9df4d7553f696544b40ee6
"schemas: Add a schema to check 'reg' sizes "

Which sounds very likely related to the above reported error.
Was this intentional ?

I'm not sure how I should handle this. The error reports the i2c node
parents should have both address-cells and size-cells properties set
to 2, but in the example there is not i2c node parent at all :)
Should I add a parent node for the i2c in the example snippet ?

Thanks
  j

> Please check and re-submit.
>
