Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEC302909A1
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 18:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410077AbgJPQYb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 12:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410075AbgJPQYa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 12:24:30 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AA5C061755;
        Fri, 16 Oct 2020 09:24:29 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z2so3706633lfr.1;
        Fri, 16 Oct 2020 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xde38+/8cu+9P7gw/FeWyr6Nhg09GB4d0Up3Y+zxXko=;
        b=po7wJFb8l9GKeJPWH/0FKEIhxfE0LW9gU2OHxicgFTGo5fPZV/a6gHJr1qPkX5wz3c
         pQrwJ59UrqQxNBB5uoTJEfqjPtiThSzMWrBzKZPiQqInK4JDF2hRwaoIWP3xxe2n1otL
         nRZ9MomoNh/CH/5Q0oQnfjzdgMseNy0BSBZVjShiNXcSgvQyEQ4zagbDDA9RPGPN0Wpd
         UVvDtX5t/rzEUlO/gHy4Btw8WfuPgGbdibB2gJqRxr9z9hzlWCgWrlNsm4wztvXjAq3o
         UlSl8KnoYdtBxF95VtmIfTLEdg3mJHvBv4cmkyKxkSMONVBDO9ocd0G4HKk7XVVRbRDB
         IcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xde38+/8cu+9P7gw/FeWyr6Nhg09GB4d0Up3Y+zxXko=;
        b=M/+Ub3zvx9QCTim9KRKdONuWSd/oD2gcCRU9ZVk04ZFWEIz52qyKRwUofaAygpieTq
         PmcbMMIhgP9QCUTr36dDjWMgd1U8ZHbFY2FprUCMhis4Oxlpn16+PU/P2ViHd2jYoJXi
         c+sVNvSnk09k3h1GCPCb+4uDBS3lbb+6uO1eCOTt9Vi+GzTA4dWCMy9TP/72sSXPyIwQ
         Jnr1xjDeFgxiD0699usOEvV9/3MS8l9K0aaA+QjR7ANOaPP5V+spq5LkM9Z22tU6eeky
         8LXSsmyYhNZ4GK0mgEwamn00ml9kC9iKEYasXDMAXqONdAGWlGpzTbvXgj8BPYrtKfpu
         hjgA==
X-Gm-Message-State: AOAM532/M4iFUd4uiyVOO8NyOT/5QhL8f0vp6WTeXhmG+kxxH8sreICf
        xaal8Z8NNsmsZCTAbfpqhV0=
X-Google-Smtp-Source: ABdhPJwh/paWLYSsZYjN85ac0bcVly5lDZ9kTtcGvgPQY94pfv5X4ZBgNg+YQayDbnBxpmFXz3PhlQ==
X-Received: by 2002:a19:cc49:: with SMTP id c70mr1870015lfg.552.1602865467595;
        Fri, 16 Oct 2020 09:24:27 -0700 (PDT)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id m29sm960084lfj.144.2020.10.16.09.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 09:24:26 -0700 (PDT)
Date:   Fri, 16 Oct 2020 19:24:19 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 8/8] dt-bindings: gpio: dw-apb: remove never-used
 "snps,dw-apb-gpio-port"
Message-ID: <20201016162419.qupop7qf5edjagxc@mobilestation>
References: <20201015115524.24e3c36b@xhacker.debian>
 <20201015115903.2a782f78@xhacker.debian>
 <20201015120457.qaooft5y5dzl4z7s@mobilestation>
 <CAHp75Vf2GZ_kQT3cdr2hRtGqe8vA8as4EP7qH0_9uCkrk5PP2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf2GZ_kQT3cdr2hRtGqe8vA8as4EP7qH0_9uCkrk5PP2A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 16, 2020 at 05:43:08PM +0300, Andy Shevchenko wrote:
> On Thu, Oct 15, 2020 at 3:33 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > On Thu, Oct 15, 2020 at 11:59:03AM +0800, Jisheng Zhang wrote:
> > > The compatible string is never used.
> >
> > Before sending v2 could you run "make dt_binding_check" for the DT schema
> > modified in this patch? Like this:
> >
> > make -j8 ARCH=mips CROSS_COMPILE=mipsel-baikal-linux- dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
> 

> Do you really need to install all cross compilation tools for that?
> I think it should simple work as
> 
> % make dt_binding_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml

Of course you don't. I just cited my normal command. Your version should be
enough to perform the bindings file validation. Note that there are host
tools/libs requirements, which need to be satisfied to make that command
working. See the next file for details:
Documentation/devicetree/writing-schema.rst

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
