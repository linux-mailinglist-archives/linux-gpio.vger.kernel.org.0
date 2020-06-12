Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9467A1F7EC1
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2020 00:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgFLWKI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 18:10:08 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:34410 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFLWKH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jun 2020 18:10:07 -0400
Received: by mail-io1-f67.google.com with SMTP id m81so11894322ioa.1;
        Fri, 12 Jun 2020 15:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vsuC0ZvFk/M7QGOO3kSRJo1w4ApK2NBX1I3MVGpo8VE=;
        b=aMA1PcyIHNhE7/p+WO2u6/9ia01zoX0VolxTv+nR0z7z6+b2enCBL3QRelqeC/ztZn
         ssXlK1Qw0ERneertwj1lOolPzRFkfgYEnf3Lvij1+w0mDxW9lDX6jcDp9VEd1zmmosQq
         gnkmXN4xgn8LFF3/KQkLzXjcikZcZ2bfeaxJWVHLZ1kLsMWnuNpJLQA9ZSAMmvjajFze
         8BL8VIb6rGohOiffPcYL22eONm3pSfVQF9nkjc2IkfmqtCoBdJXGb32GRwnYHiWroauq
         hbaoo74urFf2XzqM7L1spEssdjxI7mZoMZVkUH1ISkcpnpVThzOOD/PCxSHiVAN8+4sN
         rIBA==
X-Gm-Message-State: AOAM532Dkex2TUJvMsrplSVzfhHcl2NkhEH5szNmgRKBEqboopV5PDpd
        CnwuvrZ7FrV7OuXwl3QCdQ==
X-Google-Smtp-Source: ABdhPJy83PHqKXsJJnuK0EqeA7WoMB0lsts9S5KbBiViaHT8hFTKrbldXaRx+cTqZx0MZ3b3ePGpYQ==
X-Received: by 2002:a6b:5b02:: with SMTP id v2mr15968865ioh.161.1591999806019;
        Fri, 12 Jun 2020 15:10:06 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id n7sm3689656ile.76.2020.06.12.15.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 15:10:05 -0700 (PDT)
Received: (nullmailer pid 3902065 invoked by uid 1000);
        Fri, 12 Jun 2020 22:10:03 -0000
Date:   Fri, 12 Jun 2020 16:10:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        linux-media@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        sakari.ailus@iki.fi,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v10 1/4] dt-bindings: media: i2c: Add bindings for Maxim
 Integrated MAX9286
Message-ID: <20200612221003.GA3901624@bogus>
References: <20200612144713.502006-1-kieran.bingham+renesas@ideasonboard.com>
 <20200612144713.502006-2-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200612144713.502006-2-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 12 Jun 2020 15:47:10 +0100, Kieran Bingham wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> The MAX9286 deserializes video data received on up to 4 Gigabit
> Multimedia Serial Links (GMSL) and outputs them on a CSI-2 port using up
> to 4 data lanes.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> 
> v7:
>  - Collect Rob's RB tag
>  - Remove redundant maxItems from remote-endpoints
>  - Fix SPDX licence tag
> 
> v10:
> [Jacopo]
>  - Fix dt-validation
>  - Fix dt-binding examples with 2 reg entries
> 
> [Kieran]
>  - Correctly match the hex camera node reg
>  - Add (required) GPIO controller support
> 
>  .../bindings/media/i2c/maxim,max9286.yaml     | 366 ++++++++++++++++++
>  1 file changed, 366 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/maxim,max9286.example.dt.yaml: example-0: i2c@e66d8000:reg:0: [0, 3865935872, 0, 64] is too long


See https://patchwork.ozlabs.org/patch/1308280

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

