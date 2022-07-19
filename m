Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27A0F57964E
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 11:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236751AbiGSJ2a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jul 2022 05:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236028AbiGSJ2O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jul 2022 05:28:14 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7310320BC7
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 02:28:13 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id z23so26031859eju.8
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 02:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i/7HApH+PR8w0pEKdojac5KuzIqTwfUj9SQA/gmxyxw=;
        b=LefLhYBL4JrgNX/sxY+bupgnXlOeBrf+m4khsZIhHuM9DKD1RmZgkRKT+Okgnkfru9
         Fw0iMIFjf1EW8AZKXKxcZvUY2k2cY3eq8C7+zsI6nYDWU1UihioGbvhrn1BpVrHfqWzw
         ayRUuW2K5JqS7bBvO/xRt78vo4h03NpvhM0QP+imEtPp1KeOD8iHmfLmdlMjvGonPlAa
         mJvhTpU5eXL6azKktPK/h24xLcS7Awi+oVwP0JU57SSVz/DlQk6zobFPhsSapmJzwXMv
         snsDopgIsWajuhuU26eOqpUEd//FraZhBWoWAMxhJ1Ky2BgeqGQ0TmbCcGh6Yupj3F6u
         Kb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i/7HApH+PR8w0pEKdojac5KuzIqTwfUj9SQA/gmxyxw=;
        b=nB14YnRN3MUvjCNn1/T86aSQb+8ZCYplHKFAmvFVf1Cpv+kOZ3eBxIfZnPUC2r38vl
         HJdYuhSlG5hgsm3TTO8F1jW4/3+ivWFl9cKvDgFYuAZ4mTSXEkgwcjnEExEg0g9guU37
         bEc+T33nxVetvs+emC5JQTY/sLKoa9kdV3CxnU+DdjxpNFhKufSF9R7Kx7X0dFyUa0a7
         JwBpd3ATxwuAeW08OKOo+/s4gd8gmJ+s6L3ZFMSp1uD/GAPMy0IRCGDKITJq5dxH/fJv
         W0rclX6CMiR+GRGLUWKcJRidmburGGYSW1+Ym6DKNqc82sIXJLCbreJZ3sVa6Us8cq+9
         kBZA==
X-Gm-Message-State: AJIora9FdZFC8yZdeK8Lrx7g0moVuh8gUMWY+JEK9ESjmOAvuU80Sjhn
        IuvjrBddR44ed+RjA4aPAP36M/5veqsXnXC0o/6vfA==
X-Google-Smtp-Source: AGRyM1uH3ecF4yDXkTHFnhirA/GVW6kvv65cnSZoUrbF7rWVUblE1QLvmtGbS+T3SGIxq2unxBX6nR90kOGotNmUuuk=
X-Received: by 2002:a17:906:98c8:b0:72b:408f:f499 with SMTP id
 zd8-20020a17090698c800b0072b408ff499mr29608720ejb.736.1658222892051; Tue, 19
 Jul 2022 02:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220715140729.136234-1-tsbogend@alpha.franken.de> <CAHp75VeCpUt1HVGnr1C3aKKgRFyo5qzW1aTiPyxSCdzFL=2EoA@mail.gmail.com>
In-Reply-To: <CAHp75VeCpUt1HVGnr1C3aKKgRFyo5qzW1aTiPyxSCdzFL=2EoA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 19 Jul 2022 11:28:01 +0200
Message-ID: <CAMRc=Mfyz9f5hxt7Pb-9wzDqOYvrV6icuuH=KdW9oAvV-POQrg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: remove VR41XX related gpio driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 15, 2022 at 9:06 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Jul 15, 2022 at 4:22 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > Commit d3164e2f3b0a ("MIPS: Remove VR41xx support") removed support
> > for MIPS VR41xx platform, so remove exclusive drivers for this
> > platform, too.
>
> Removing code? This is always the best change ever!
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> (Also may be applied to the v3 of this patch)
>
> --
> With Best Regards,
> Andy Shevchenko

For some reason I don't have v3 in my inbox but fetched it from patchwork.

Bart
