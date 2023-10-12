Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97C8B7C68F6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 11:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235493AbjJLJDo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 05:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235457AbjJLJDa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 05:03:30 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E327310C
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 02:03:14 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-57de6e502fcso396265eaf.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 02:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697101394; x=1697706194; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PBOrf3o70reLViQWMTOFz5hCd8+8NRmJnUQ+IRtShBw=;
        b=ImPrCI+W2eEboYSD9lglrKeuZ5G809+EuJ/zk8QWUYb0bKf9GzMhH6XQ62l4507InO
         +TX4cJ2qIInkidF/+SXJ/6r7RcBblCjuVNHHQsLOQP4RueBAdU2bs2MHQ2DRF++XWtzo
         Ly2qSlq1tCympE78Mjo83Q+7CRXOluLHqERiKgsfAg3eniC60JkiqFsAMnfjGWwy07Fm
         3YOndQKn2B1/Wh3ZHITZiLJf/VUatdmMP/Eatvi+wbjScHP8asNVqeyLviGlRv/yeuzV
         U6/3AWQMUEKcWNVeEf67E0xONa79noGdh8Y53jYsvp2bKV+My3PKFm30T21sEQ1qFyBJ
         69OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697101394; x=1697706194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBOrf3o70reLViQWMTOFz5hCd8+8NRmJnUQ+IRtShBw=;
        b=xB4eguLsCF4DiRHnfjNmsi6p4h4FBAg/+Rfo6kOITS2H1eft77mfXqe4UdPXIgyecw
         MN7xfPHvx3UBZuxNxwPsRqvcSApCHL4s0wYgEXBCkEo1MK1rXbiMZ3qWwRsUv+HVAVnJ
         3G0x0UKaztRHNxqicyK2BdeR3zmVx0pbm9zA9MzTEXCfagqs09b5zd3oM4wdYYlYBThI
         615eOH8mwf1G7tue0aXn9hQrGmiN78u35BZuztXG//mvHqySAr4QpvL4y13XQFj5ksfD
         ZwN6TnDu95czK87EycrV1KTmqnPx9IRI0qQfc5F3kEBKMdidRTjr5gXr+1Dwf8YXRB7/
         ToMg==
X-Gm-Message-State: AOJu0YyQWeZLaEDvb+m3fgeDFMCnEvFfRWHQ8gMzwmJTiGUxl0cd4SIi
        ZK5kGiV9/TdBll9kozOASUQmdF5ubncY8e/b3ww6NA==
X-Google-Smtp-Source: AGHT+IFQngSDmPteCi3pOo1G0APEEl0tNZH0k7PYpllNKrCL0LOoay2Ila7nYSI9UBmqtEZ2ooRpP7cpdOF6fgcTrpw=
X-Received: by 2002:a05:6870:588c:b0:1d0:f5bd:6d2 with SMTP id
 be12-20020a056870588c00b001d0f5bd06d2mr27811789oab.38.1697101394194; Thu, 12
 Oct 2023 02:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231011121246.9467-1-phil@gadgetoid.com> <20231011121246.9467-2-phil@gadgetoid.com>
 <ZSbXNQ1sx+lDl7JV@smile.fi.intel.com>
In-Reply-To: <ZSbXNQ1sx+lDl7JV@smile.fi.intel.com>
From:   Phil Howard <phil@gadgetoid.com>
Date:   Thu, 12 Oct 2023 10:03:03 +0100
Message-ID: <CA+kSVo-YKOzSmk73jkmg0Cn0r95dXFw14SPjBZBBvW09Ca-r3g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/3] bindings: python: optionally include module
 in sdist
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 11 Oct 2023 at 18:11, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Oct 11, 2023 at 01:12:44PM +0100, Phil Howard wrote:
> > Build gpiod into Python module.
> >
> > Optional environment var USE_SYSTEM_GPIO=1 to
> > generate a module that depends upon system gpiod.
>
> ...

*sigh*

>
> > --- /dev/null
> > +++ b/bindings/python/include
> > @@ -0,0 +1 @@
> > +../../include
>
> > \ No newline at end of file
>
> These lines are bothering me, why the new line can't be added to all affected files?

Is it convention for symlinks to include a newline, is it even possible?

I'm not super sure about the symlink approach, actually.

It's the path of least complexity but after some research into the
usage of "shutil.copytree"
to copy dependent and packaged files at build time I'm starting to
wonder if a more complex
setup.py isn't necessarily a bad idea.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>


-- 
Philip Howard
Technology & Lifestyle Writer
gadgetoid.com

Gadgetoid gadg-et-oid [gaj-it-oid]

                                     -adjective

1. having the characteristics or form of a gadget; resembling a
mechanical contrivance or device.
