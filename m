Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C52C3675FB
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 02:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343813AbhDVABV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 20:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234886AbhDVABU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 20:01:20 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90EC6C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 17:00:46 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id u25so11409439ljg.7
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 17:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vP82rZfUtsib5WAxJoWL80HDlGBtl+Yr06vR/s2yI1A=;
        b=b8KEuQwfbdeJskL9p/vOI78uX4NjwjHug3dN5Ue7OmHjsvKYodnvrpqZrePOxEjpE5
         v1whTg/4eYEPGolNo+qE8yOy3s01g40WqTbzYlOyCKKsMGtKdMekTlOwg2dkUDzToeJy
         9tarCQ9Eq7tyAWygFSBzJktoHU7tYcCWBJybY+JRrJ727yzKHnsDMQ/R9dwnEYuKqCFm
         7iYwGvRxgKCGt8CAC1yhT54syIFkK8doun/ZWKVjg0wTYpFDR0d1iHyUCu2cJuy4U54k
         mfedzddMQzJqtSLcQbk7KJjEFskhOKq2ddl+T4ZPJbVOE8sIFuTEBlluag5/0U6fKHKB
         +VIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vP82rZfUtsib5WAxJoWL80HDlGBtl+Yr06vR/s2yI1A=;
        b=IKlvbiExZwABDcvQvEt4du2QsJ36UXPdO2fX3sXoG8YAu1e+UaEGRgqa9YY/UiwlaE
         4jE2MYUgDxI9tA4+cdPg/lsHBEotQzY3ZxF9pJd+JVu1/yi50n/uRirpdo3C+gpyMLAs
         yTWo2mxQwn/RrnErXK+HJiUdxXsYvNjtyHHbADwCwi7/wbtCuDCPUeHAU/Bcp4bxO62J
         s/rAaSfFSyqJlt/lDpDIQHHRE6pJ1ycL8hrZ4A/6Z7EPzEGNxnYQq3zEPS9HRcJ/hJAR
         IjUMLXZikpzXpsb703AtdWAnxm+oIqPXhC2b5eUGsMe777eFMTE+oVgY9XYwSS6XahTD
         S0Rg==
X-Gm-Message-State: AOAM532/4trVQKyrbIU93n78SDCWBE23MoGJOJgsTuwwGhQxRzR0egI7
        yhPbG1VD9J+kZCnGhs9+8vWiw52LPf3rRXUDi5jWzA==
X-Google-Smtp-Source: ABdhPJyukDxnvl+KqgkeR2DwdKiQpsKRoXappdMdqijpppQIzbKoCm6kCuY2SoJuGKoITL7V7AoVQFVljVqGIng7XnA=
X-Received: by 2002:a2e:555:: with SMTP id 82mr542235ljf.200.1619049645095;
 Wed, 21 Apr 2021 17:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <1618485193-5403-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
In-Reply-To: <1618485193-5403-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 22 Apr 2021 02:00:34 +0200
Message-ID: <CACRpkdZie6KTqhRJTr14R5KA7hUXUqjiwgO2Am5-gZHN+Je-Gw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add ZynqMP pinctrl driver
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>, saikrishna12468@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 15, 2021 at 1:15 PM Sai Krishna Potthuri
<lakshmi.sai.krishna.potthuri@xilinx.com> wrote:

> Add support for Xilinx ZynqMP pinctrl driver and also update
> the Xilinx firmware driver to support pinctrl functionality.
> This driver queries the pin information from the firmware and
> allow configuring the pins as per the request.
>
> changes in v5:

v5 looks fine but does not apply to my tree, I applied patch 2
(the DT binding) as that is pretty much stand-alone though,
why not.

Please rebase the code on my "devel" branch in the pinctrl
tree:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel
and resend.

Yours,
Linus Walleij
