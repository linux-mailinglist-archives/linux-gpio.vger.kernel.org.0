Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F03B348C08
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 10:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhCYJAe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 05:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbhCYJAU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 05:00:20 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB11C061760
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 02:00:19 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id b4so1386717lfi.6
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9hVRMkQ0tHL9uVXvm233X7lLnnZ2hno7sFzdBZfFdOI=;
        b=Kc1IpBZxWVTOYw66WGTB1QyddKnYREmW1xtY3GcCADOywwhEb8Z3AFFd+id2LunKuy
         33cR2Qoh205LF926p5IOG4T7etcLoiDHisk4rtvgDkiC6rkf7rYYQroi9PGiM66UPmRL
         IhkMDH3h+u7Ph+RpUvZciDY5/n4bhiV8AtDigdjW5hdZnENDceYmQZytQJEPjTyWi/UJ
         qNAmMBPTGJt+BVFUvU0fbwPciqtkv2oE/JE5648hLqsKC3RXAdzBot4Gtv5IObVrGHZe
         tsoC6JsHDJL6A3HjA8Hw4DgoJHdvTdMC+ob8r0MzFgQkuZsF3ptYkyTk+IZtZCUh/vRr
         dmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9hVRMkQ0tHL9uVXvm233X7lLnnZ2hno7sFzdBZfFdOI=;
        b=EQ2VVXksQSxorgE9hx3Ba2SmOmxhlKIYn/0h49QSD9Ruq8T+p1Tv0+ktHxfFdXMdfc
         nMtckCKGSXoRX38nRbFUkVh1LiT2fKHu1YCYsTaTXC6hXiLP63g6jJxXH6+6Jc8D7tP2
         MHria5FF8K58yihN1+nmlN5MMQ3PcST9I0LcdfUCyhUZ5r809bvH1PwhzagFuEgHxE5k
         AlUN260ZDY5EGNj86D6jdj6UK4LSKxVs3NF6tc23XlKR9MB4ck794rZUHRKxWufUmtax
         UZ4er/f51KimF73FV8tmwcXz4/7b+xeipZbKrn+qp56JGFy5oOA+qhJBx6E/kUJZAHUP
         xViA==
X-Gm-Message-State: AOAM530YiUU8iUYabR1IvTJ1/9DxPzE3nMbLMp7Gaot7ZWQAGdZdQxuJ
        N3rWk0npCls7bc2++Kk0Z8IrWF42WIzdQrJtib8I8A==
X-Google-Smtp-Source: ABdhPJwaQP4N7d6gaupRLo89RKDhrzwRsCXYPYHFvTrbyAYIZ4AwHthQskkvtSOpJPpQUNbeNE169N/PfjYTs7sQF/w=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr4510008lfo.529.1616662817810;
 Thu, 25 Mar 2021 02:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <1615969516-87663-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1615969516-87663-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
In-Reply-To: <1615969516-87663-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 10:00:06 +0100
Message-ID: <CACRpkdaWrhEY1izoEm4=Hsysh3RWgNdLVpjDCt=ybd-qZProfA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: pinctrl: Add binding for ZynqMP
 pinctrl driver
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>, saikrishna12468@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 17, 2021 at 9:26 AM Sai Krishna Potthuri
<lakshmi.sai.krishna.potthuri@xilinx.com> wrote:

> +          io-standard:
> +            description:
> +              Selects the IO standard for MIO pins, this is driver specific.
> +            $ref: "/schemas/types.yaml#/definitions/uint32"
> +            enum: [0, 1]

As concluded from driver review, replace this with
power-source  which is already defined in
Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml

Yours,
Linus Walleij
