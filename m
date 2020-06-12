Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6C91F7EC9
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2020 00:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgFLWLH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 18:11:07 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:45581 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFLWLH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jun 2020 18:11:07 -0400
Received: by mail-il1-f196.google.com with SMTP id 9so10152942ilg.12;
        Fri, 12 Jun 2020 15:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jpvSUDf0/nkQwsjRoUmLSe2QQX32OCv3LjO7DJXzG5w=;
        b=JRHBGaf+rvkFE9HNrLugAOKjL1aX8uzs/r3leQzfMbaty3UhlbbOFsHm542/K1G5qK
         vwFGlhORu3S7+ghzfL+iGd8cQr+VP0POU0OALAVi8JfCXUdYeFs1Hp5FZBzOywhedOVJ
         H7A47O+bucp9ldp/RENABWWWxPi0BnDZ+odeavSkFfDPQYts/7xsd+aIxQ/Lwue/RZZx
         BsX0ubqB3LlPirtL0m/TJrQuzTm4von/PCk/QLyLl8jnWjorrrPHrBW4nS6UKkCP5dnj
         hBT5bJKnjtd9i+aJkOqGTK0ALkUnGsPBLBjryQ4Dh8Vq+njyt6VHlasGynFxALA481cK
         Icjw==
X-Gm-Message-State: AOAM530qsfyfR7TF/DosXObb90OxCY/OvMQmygikg45T7lhF3SjLq8bu
        GExkSvNywVqqDEoZeYV0GA==
X-Google-Smtp-Source: ABdhPJzVQ3CvvaInomzBLMgI0cF9hNEtCmQT2cZsfVUg9eb57JrurneemlctD9bij5LEyLYkZepnig==
X-Received: by 2002:a92:4948:: with SMTP id w69mr13848326ila.15.1591999865751;
        Fri, 12 Jun 2020 15:11:05 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id b29sm3692399ioc.32.2020.06.12.15.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 15:11:05 -0700 (PDT)
Received: (nullmailer pid 3903476 invoked by uid 1000);
        Fri, 12 Jun 2020 22:11:03 -0000
Date:   Fri, 12 Jun 2020 16:11:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Hyun Kwon <hyunk@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        sakari.ailus@iki.fi, linux-media@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v10 3/4] dt-bindings: media: i2c: Add bindings for IMI
 RDACM2x
Message-ID: <20200612221103.GA3902762@bogus>
References: <20200612144713.502006-1-kieran.bingham+renesas@ideasonboard.com>
 <20200612144713.502006-4-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612144713.502006-4-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 12 Jun 2020 15:47:12 +0100, Kieran Bingham wrote:
> From: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> The IMI RDACM20 and IMI RDACM21 are Gigabit Multimedia Serial Link
> (GMSL) camera capable of transmitting video and I2C control messages on
> a coax cable physical link for automotive applications.
> 
> Document their device tree bindings.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> v2:
>  - Provide imi vendor prefix
>  - Fix minor spelling
> 
> v3:
>  - update binding descriptions
> 
> v4:
>  - No change
> 
> v5:
>  - Specify optional third reg address for the MCU
> 
> v7:
>  [Jacopo]
>  - Rename to imi,rdacm2x-gmsl.yaml
>  - Exand bindings to describe RDACM21
> 
> v9:
>   [Jacopo]
>   - Rework 'compatible' property as suggested by Rob
>   - Re-order vendor prefixes ('g' comes before 'i' ... )
>   - Add Rob's tag
> 
>  .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml  | 159 ++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  2 files changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.example.dt.yaml: example-0: i2c@e66d8000:reg:0: [0, 3865935872, 0, 64] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.example.dt.yaml: example-1: i2c@e66d8000:reg:0: [0, 3865935872, 0, 64] is too long


See https://patchwork.ozlabs.org/patch/1308279

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

