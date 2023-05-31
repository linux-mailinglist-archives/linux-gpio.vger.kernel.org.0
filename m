Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF167172C1
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 02:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbjEaAzl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 20:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbjEaAzk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 20:55:40 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE836F3;
        Tue, 30 May 2023 17:55:39 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-557d1360112so1345584eaf.3;
        Tue, 30 May 2023 17:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685494539; x=1688086539;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xvplO8LxGVSbTiU4TdPJpjay1ivlsolFTql3/bTEI28=;
        b=nVJZKRBJWwxYtMuGJR8XdZ8cqM83PRFYhZox9tt7r9z8TvL+ROhBn3ghLOA/FcjkwM
         pdymG267PcCPe/1ErzqK/oI9SNTsMmSEH5Pb6fICdFY1yZm1VskyZQgo4S5gvRfwKCLN
         RXpdXCclT+PiMa6th0HtsKX+S7PedaNdn4YagF5xsUTV/nRLfIBYTmrXKwa1WKX7MbEX
         SReO+g/9/IpqEYkUXdLaGMCy9kyTH/TAjqGQSQdoND+LPeL/dDyNJr1O2rM7TPgSrHdw
         aaSTiAWAOp3SanQ832mTW4DUD+bblQ/7WNvwmLc69UKK9PBMmYOrzwOSA+VSVqvqjkP4
         kiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685494539; x=1688086539;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xvplO8LxGVSbTiU4TdPJpjay1ivlsolFTql3/bTEI28=;
        b=XRfEbBh3hhoGqWXWBkCygPq3IKikfCCXVpimSa5nQhSLw+OLYAsF0bYQNDrE3sB0DU
         CjvCI4X9YHI3Al59pbvs2tA20+en7fTDk9TB+n0RFDANSfHjzf4sDYn5Pr2wYDTtObm7
         K6mI83AQpegOKzc/uP3ePS8iTw2twH0u3Vh84LA2u+xkKqe/dPeOk5v6I6rXQa15oFsj
         drcbN+xx/MKQgfzuf8hRCyc07/zfc1qUNKi+jlGrnEEP0LFvvJZswan17Ia9Ktv9ilkm
         RoU7gzZriPvo4GT7ZotThNjaLs+mCGnlT1RQDV/hYt/4gzFic5Vqg4kTeqlx0CdeV1BJ
         pk3g==
X-Gm-Message-State: AC+VfDwysj0CjxLxpe4zpeL6xWviEfOG96mDhr+hj11K/IsOv/3RbyMk
        kSvCqJ/1KwdgKJb0MFYemjs=
X-Google-Smtp-Source: ACHHUZ65SJck6SCJBGnLKc3eddxSo8Wo+3ORqBE6B9Xe5CoywlRPjjq4u68TvKGKiMd9xwmZzKXdqQ==
X-Received: by 2002:a05:6808:4091:b0:398:4098:33e4 with SMTP id db17-20020a056808409100b00398409833e4mr2097072oib.29.1685494538931;
        Tue, 30 May 2023 17:55:38 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902dac500b001b050df0a93sm2970721plx.93.2023.05.30.17.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 17:55:38 -0700 (PDT)
Date:   Wed, 31 May 2023 08:55:32 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: introduce hog properties with less ambiguity
Message-ID: <ZHabBOFfTBLOREgS@sol>
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
 <ZHYbnDHgc9ZMc7rj@sol>
 <CAMRc=Md3wCLuiS0tt2_v8Q1peqP+AkSrUNj1jg_8aZfDnj+2SQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md3wCLuiS0tt2_v8Q1peqP+AkSrUNj1jg_8aZfDnj+2SQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 30, 2023 at 09:15:55PM +0200, Bartosz Golaszewski wrote:
> On Tue, May 30, 2023 at 5:52 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, May 30, 2023 at 05:19:44PM +0200, Uwe Kleine-König wrote:
> > > Hello,
> > >
> > > this is another approach after
> > > https://lore.kernel.org/linux-gpio/20210503210526.43455-1-u.kleine-koenig@pengutronix.de
> > > two years ago. I switched back to "active" and "inactive" from
> > > "asserted" and "deasserted". The poll about the naming is ambigous, but
> > > I think with a slight preference of active/inactive over
> > > asserted/deasserted (with my unbiased self preferring active/inactive,
> > > too :-)
> > >
> >
> > FWIW, this makes sense to me too - the active/inactive naming is used in
> > both the GPIO uAPI and libgpiod v2, so it would be consistent with that,
> > if nothing else.
> >
> > Bart, just wondering if gpio-sim should support the aliases as well?
> > I realise they don't support active-low, so polarity isn't an issue, and
> > it could even be confusing to support the alias, but just throwing it
> > out there...
> >
> 
> I'm not sure what you need aliases for? Value is only shown, never
> stored (where you'd need "active", "inactive" strings).
> 

I was thinking wrt the definition in DT - to  allow the switch to
output-active etc throughout.  And I suppose also for configuring the
hogs in configfs, but mainly the DT.

Cheers,
Kent.
