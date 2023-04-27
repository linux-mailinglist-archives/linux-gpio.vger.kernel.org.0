Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1865B6F02A8
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Apr 2023 10:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243155AbjD0Iig (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Apr 2023 04:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243082AbjD0Iif (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Apr 2023 04:38:35 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3084ECD
        for <linux-gpio@vger.kernel.org>; Thu, 27 Apr 2023 01:38:33 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-77aad9ad986so2439519241.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Apr 2023 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1682584712; x=1685176712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqsET4zZE92O9asPYXWFg0J1C3KphyLvZyDM+XSJoTU=;
        b=HX5QdcVxP+EhLRHgdSwr67eJVSh3k1mphJR6wUwkvwCMfUOo6nkOIZATktzB4X3r4g
         7iq/iut2YrUzFr/FvebSvTFPM4nSYpoXJV2aGSFZSx/py9IRMrGw50RgiKVJV3n2IDSx
         q5GrYSpfka4eB+VCNviLw6lVh2sJ1zKv5qaP25AJ6/DcRv5j1NQMDrmC880RU0nYLueO
         aIAXqFQ4ccyRpxHYYI6BdsVAbYZEra01wHDIfeHFMUXkOqdB8bV9rvsPF1HeX2aJlfTq
         ZGM/Zh3TTE6SdXRF6paNqf8VH6gym+L1NUv+9B0lSQlJhzEb6u7afEvaN1Cj+xRZcQeQ
         KiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682584712; x=1685176712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqsET4zZE92O9asPYXWFg0J1C3KphyLvZyDM+XSJoTU=;
        b=NaNVul+kk+q35xJuVT9HgjSFpS4szDSwx6CedEjdJ3ibX6Vmr8USwy2Cb2JYnohN1x
         lK7xz6vLackp+1b5fPrfyM8X/Wjnam8/pq47aDV3vBP+VxCYkr6ElUM8GYqMGDdZ23ft
         +j6EIM8sAFUpoD7DR3IxmyxM/+w1EUUP7TbsrlI4xZg9Sq3NqdBqdRbBOWfl69MSVkiW
         nW6tFDMXdVPf9oSb1i5zZW+krUAMm5xg76tEa14H+jXEERRyYlzso0RY2fOdVhiUi9Vr
         q1Kl7ablgQqJ3mTzILavmtZHbENPYL560NjfA3EDZLJRiZs1ngYjmARxzTp0+CE5NAiN
         zs9A==
X-Gm-Message-State: AC+VfDx0gx3LnukzUK2U6lWUrnOHlVMTTO0/qcNyl1VgVnVlzwbowBEd
        xQyTEWvRzIPuZXsieLjHY+aYFZKoX6TtoFMu/PJVgg==
X-Google-Smtp-Source: ACHHUZ7SX2J2Gw9Ezi+kIGhcXgELovpEBqq/4LTA3HcpFtSI9TGaSZUGgZOzrFkjyWf0BJw55MpAOcwfkIHHIGVMwfU=
X-Received: by 2002:a1f:df87:0:b0:440:4946:fac with SMTP id
 w129-20020a1fdf87000000b0044049460facmr345248vkg.4.1682584712697; Thu, 27 Apr
 2023 01:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230425173241.GF444508@darkstar.musicnaut.iki.fi>
 <20230425201117.457f224c@aktux> <20230425183857.GG444508@darkstar.musicnaut.iki.fi>
 <20230425212040.5a4d5b09@aktux> <20230425193637.GH444508@darkstar.musicnaut.iki.fi>
 <20230425215848.247a936a@aktux> <20230426071910.GE14287@atomide.com>
 <CACRpkdb7a32Ny=JR7=pAW_QRMj-S5QuhcSN8U6_f4PhAXj5pRA@mail.gmail.com> <20230427070307.GF14287@atomide.com>
In-Reply-To: <20230427070307.GF14287@atomide.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 27 Apr 2023 10:38:21 +0200
Message-ID: <CAMRc=MdvvHxOqtO=HMyya1bwHGS8rSGuPG1vmRqswL--=-r_Sg@mail.gmail.com>
Subject: Re: [BISECTED REGRESSION] OMAP1 GPIO breakage
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 27, 2023 at 9:03=E2=80=AFAM Tony Lindgren <tony@atomide.com> wr=
ote:
>
> * Linus Walleij <linus.walleij@linaro.org> [230426 20:36]:
> > On Wed, Apr 26, 2023 at 9:19=E2=80=AFAM Tony Lindgren <tony@atomide.com=
> wrote:
> >
> > > Not sure what the best way to fix this might be, adding Linus W to Cc=
 too.
> > > Maybe using gpio line names in the legacy platform data instead of nu=
mbers?
> >
> > I sent a fat invasive fix which, if it works, will fix the problem once=
 and
> > for all on OSK1.
> >
> > If it works, I can write the same fix for Nokia 770 or whatever.
> >
> > I think it is best to just get rid of the static GPIO numbers from thes=
e
> > boards so I took a stab at that.
>
> OK makes sense to me thanks!
>
> Tony

Sorry, I'm late to the party, I was busy at Linaro Connect. Thanks
Linus for taking care of this.

Bartosz
