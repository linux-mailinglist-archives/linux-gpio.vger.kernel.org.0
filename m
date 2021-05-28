Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9030393EA8
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 10:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236103AbhE1IXD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 04:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235754AbhE1IXD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 04:23:03 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A85C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 01:21:29 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id f12so4212455ljp.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 01:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2u/8jjSh0h6hsJsw7KV4nyPwb2BObLFOoIj8G9tctSE=;
        b=ec64qKIGugZR3K1gdSNeJiIIo10gQmn2+bYXnBj1LlgRMau/c0maRDCidkxICjU1Ie
         lf7EJbEYxqfv6dKOK090ggquJmSI3vIiJkc5rX/uOdJUtjJ4jZdgVk3QGg/HwoarQOLd
         L7cND6RhprMHIvOI2AC/b0dIBQtEGeKr57JO/BGsdTfxfaCyxfdO5v9omUp+67uD9Ffv
         XBJlvp5IQD3DussiXZwA4g1xrpbNQ5r3ExLOIxDUpbUiw2zyrWQxN4Ag9D31J2wTvRXl
         AiqtVGIpC8tyyBfPGc0QqctZ8iq1vxg+oeqqB3UDMgWKevtzY8h8vuRZRPLK/MynSNl2
         vvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2u/8jjSh0h6hsJsw7KV4nyPwb2BObLFOoIj8G9tctSE=;
        b=JWGMDeleXCY8oX6RRVWDTZAfSG6J1ReVqPEhbkpsRtBujfKpA1ka+37GOVbY5dQj7v
         +yzRubihN0PLV4AHdXrKuXVNQbNpJUv/fZqfqLhF0YsK0dZg5f13MypYSnXia2YSVxLa
         ZWU4TfYFesmEoX3KC07+dPw/VvE4tIq3cdheluDdpj0wVtFgEOYzxX1+UOZ4SSYNsOPb
         ln3e8Gq4WErl1CU3s4ZxY9MWDyTZ/AbyN8mXW78oPJ4qDDGEmq6l7t2kvaMYN7G3MYTl
         fVSwsitc/DhGUogoO7NcuCNyV1PGzE5T1ToqvcnHFCOt311UR/e1ChHnd0v0R5TLkfI4
         Cx/A==
X-Gm-Message-State: AOAM531UBWg17ZIe7ncQNo5ohakPV409NgBYMlkJUL0TjwnkZUSwolbm
        JGkMiSh1fT0PHCigS/CAlVeRJr00fhiXAdA2K2nTmQ==
X-Google-Smtp-Source: ABdhPJyViXlwDvpqC0Pz71VCm7nKodY+/l0OZFIP9Xrzj/5oWYchfLRaAW4jfL08eclsRXuBV/onnGsI0NusUu2DmVQ=
X-Received: by 2002:a2e:1319:: with SMTP id 25mr5611966ljt.200.1622190087290;
 Fri, 28 May 2021 01:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210524092605.734-1-lakshmi.sowjanya.d@intel.com>
 <20210524092605.734-3-lakshmi.sowjanya.d@intel.com> <CACRpkdbJPSuNexLE6m-H+=ztaxHRAWT06wwMg95c17O-hR_Cdg@mail.gmail.com>
 <BL3PR11MB5699EF2B085A9A387199179FC4239@BL3PR11MB5699.namprd11.prod.outlook.com>
In-Reply-To: <BL3PR11MB5699EF2B085A9A387199179FC4239@BL3PR11MB5699.namprd11.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 May 2021 10:21:15 +0200
Message-ID: <CACRpkdaWLaX4vA+9GFrxBNvbnMP8t++_9LOBpzL8S-ti6avJpg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Add Intel Keem Bay pinctrl driver
To:     "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 27, 2021 at 4:44 PM D, Lakshmi Sowjanya
<lakshmi.sowjanya.d@intel.com> wrote:
> From: Linus Walleij <linus.walleij@linaro.org>

> > > +       val |= FIELD_PREP(KEEMBAY_GPIO_MODE_INV_MASK, KEEMBAY_GPIO_MODE_INV_VAL);
> > > +       keembay_write_reg(val, kpc->base1 + KEEMBAY_GPIO_MODE, pin); }
>
> > Why would you want to invert? OK I guess I read and see..
>
> The IP doesn't support the falling edge and low level interrupt trigger. Hence
> the invert API is used to mimic the falling edge and low level support.

That is a clever hack.

Write some comments about that here or at the call sites so it is
clear what is going on and why you are doing this, so readers
of the code understand.

Yours,
Linus Walleij
