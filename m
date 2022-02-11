Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E37994B1A40
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Feb 2022 01:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346215AbiBKAPi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 19:15:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346212AbiBKAPh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 19:15:37 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C81272E
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 16:15:37 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id g14so20274573ybs.8
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 16:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E7OoL04aP+MZeQy8gEUASlkgu2toqHuHNgEWJOzWKkI=;
        b=STyD92iMRI0ITMeRrZZIgrsOTqWv1OtmvKboQgkN8aHCeb6qmGBZytZN5kIu8+b5AB
         FM95HInfiaDAapUiv/80ZCTLvpJgeTC/hvl1gCpJ08wK35dPxUz2ctLpohgB7m3nIj0Y
         WmO+83UiTjZSSEygrYn1m1c2lMnsa1k7yzX57aoMAgU82rQg1S9T46OlWV3M8urvhhGD
         7okaYEU+fobCrAf3l6IwhUznoZR4ZQdjP7Z8hsI0Nar2PJGrmalR7C581w0B/kPRqvQ7
         k8tgqGsGgyRu+J7ohCT3R4zi1SdWCWAyUAolivGpxAaxiG376F6K5TYtIjaM4xR+ZN9c
         SAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E7OoL04aP+MZeQy8gEUASlkgu2toqHuHNgEWJOzWKkI=;
        b=h9UrELe2IBtyEnAnA8N4c7nxaTRFfRLnImsVPVqAPwKLRLEHKWtz6mahFNdM1t8o8i
         /3b/oymo8A85d116nODI7YPGDOqr2UFQ2KLKwNmNNS37TM10InSQd8/intfZhprTeITp
         FQMfK7INTf8BwbbD4MPwVkPjjsFK/182ixzwgmyXp6XGLtZTT3FiAtwhbonqI/+YvXbi
         598BufjwMFiRHy5YIWP7Hn+HlPfEifoYuEmmdSZx/swD/VRjsIjIDHTZ7s8cNj5WLwpb
         LbxN3psZ0hMO3XePh+/I7ZeQZ7WV3cwpYFFrykWFRtZDiuXAVTQNBejzKIfLi/4TLRl1
         3woA==
X-Gm-Message-State: AOAM530PZoDbm5Z8lUnYfGX0vbLvtrAwwhWfrhymJjTtFJh9kpZVSbhd
        7fLI2oq+OZfQC8efkDF1O7H4aTlFlpEsja/2VfxTZw==
X-Google-Smtp-Source: ABdhPJy/Q5Zr/NTFpZq1apn9uDiuLsg2WFOhJqeZ3lViKWsIgjSwTxtM1oZy17C+JIqGLVdKS7iawzFxAzRAsAjiNVk=
X-Received: by 2002:a25:103:: with SMTP id 3mr9355820ybb.110.1644538537279;
 Thu, 10 Feb 2022 16:15:37 -0800 (PST)
MIME-Version: 1.0
References: <20220209162607.1118325-1-maz@kernel.org> <20220209162607.1118325-11-maz@kernel.org>
 <CANBLGcwKeLn7Q1Ra8pCw=cXy=kJeEFRmBjOxjds10+k70LvzXA@mail.gmail.com> <87zgmz3xbf.wl-maz@kernel.org>
In-Reply-To: <87zgmz3xbf.wl-maz@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Feb 2022 01:15:25 +0100
Message-ID: <CACRpkdbo4seF6t6iFgKhaTZ_PKMdCt+2gSmdCaM+vDeHGZfHcQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] pinctrl: starfive: Switch to dynamic chip name output
To:     Marc Zyngier <maz@kernel.org>
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 10, 2022 at 10:06 AM Marc Zyngier <maz@kernel.org> wrote:
> On Wed, 09 Feb 2022 23:30:55 +0000,
> Emil Renner Berthing <kernel@esmil.dk> wrote:

> > The gpio framework seems to fill in default handlers in the struct
> > above, so unfortunately it can't yet be made const. Is this something
> > you intend to fix in the future?
>
> This is next on my list of things to address. The whole 'let's copy a
> whole irqchip structure and hijack random pointers' should not have
> happened, and it certainly is going to be an interesting ride.

Sorry about that... Probably my bad idea. The only upside is that the
things that are ugly are centralized to one spot.

Yours,
Linus Walleij
