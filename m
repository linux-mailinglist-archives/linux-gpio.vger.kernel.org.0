Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 340C95A1035
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Aug 2022 14:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240607AbiHYMUG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Aug 2022 08:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239176AbiHYMUE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Aug 2022 08:20:04 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE9C4C63D
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 05:20:03 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id bj12so22128511ejb.13
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 05:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=xJ7IEV+n3O7/viRmViy9mdA/hgnsuCosJW1S1CyV5fA=;
        b=QAVqKLfqac7dra/Hzx3cihnFU/AtqGuhjHVeWTEs4Z1eKZVyq52D1IVE0vT0VErjNz
         A4wWrboJrNMPLEMwR9Yk5aqNOFdiE8PZg0oFxro9o4grM1iRa7HmLhKn3IFaLkkzAhlX
         SSyw+Kwl/B4mK3s+aMGu8o4ix6hQrWbfU9/t7hi72+VbTXSdrNUuNKoRMBC071ouPZXl
         L2KIFCYvVFFnsAG89cC3YMU+Xk/riAvPL7klOhrByNywbHK49CdEhiNIOClHN+fvvzFf
         v9wROchb9Dt/Rq/Ua1hSd4h5hktQVtL0Gfxfd4UYB7ymGnyM/hXdbR2g80QsoGov8HPv
         U/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=xJ7IEV+n3O7/viRmViy9mdA/hgnsuCosJW1S1CyV5fA=;
        b=bC1zaQlK6bTalAsDf1ZWArSVsHVucWmAM506AQbXyU1LZa/ZPKENtB5WHuqEGQOsch
         2l1cyhfIWwun8k6wKsFFwBRrG4B88W0ViUo7waG3ohX4BWRQ9H9FKUDSsuiUeeIz1Y4/
         F8pe+PWKZiW0rT8RRe7H4wP3y3VdjZdP45HIZkWFa8hBHvXf/kcwUkdxOEEqfhboVOvM
         +BpjgINXTwMO+h6CFFzSfGM3Yyrqj0X2iiTe4Lk85GGf542Yhp2ytCYjKe3IJOISQWVy
         J4Bt/jNrJSixOzjGqWIvWCxNhRFR5eGcXZBdmyFoQmqLwBG5IVdhHcVh11QL9LlGRJbN
         jhAw==
X-Gm-Message-State: ACgBeo0KnoJnBDWyDSrA3fp8UMP92b51NFnhBM3jrA9wmSx7SW2Y5MUj
        lpuKJuXGL4BATr0Ztz0KjPCvsdrckdjz0d66eioHog==
X-Google-Smtp-Source: AA6agR7FRlRMWvTUZCXgFt0Dsqhp3i6aXtdIwL7/mk38LWcIgZN+iz0ptZgOb5fSj5hDPkbRU3NyVjQ5iwnuAq/EB+I=
X-Received: by 2002:a17:907:6d93:b0:73d:8593:9608 with SMTP id
 sb19-20020a1709076d9300b0073d85939608mr2380952ejc.203.1661430002346; Thu, 25
 Aug 2022 05:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220816090903.19558-1-Will.Shiu@mediatek.com>
 <CACRpkdYX4xjG-UfuZ05KpOJJudVuuw+A_TB0U=zRP2+e7ZwndQ@mail.gmail.com> <CAHp75Vf20piKwGTwCN2xbvvFZqzA60a7QWqWTEw=fgrS-5Nv_w@mail.gmail.com>
In-Reply-To: <CAHp75Vf20piKwGTwCN2xbvvFZqzA60a7QWqWTEw=fgrS-5Nv_w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Aug 2022 14:19:51 +0200
Message-ID: <CACRpkdaSv9Haar1jfkZKKxwO+pwNkttSrhN9y_Nn5ODOthBF2Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] Pinctrl: Add in zero check
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Will Shiu <Will.Shiu@mediatek.com>, stanley.chu@mediatek.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 25, 2022 at 2:18 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Aug 25, 2022 at 3:07 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Aug 16, 2022 at 11:09 AM Will Shiu <Will.Shiu@mediatek.com> wrote:
> >
> > > add in check of buffer offset to avoid the exception when input 0 size.
> > >
> > > Signed-off-by: Will Shiu <Will.Shiu@mediatek.com>
> >
> > Looks good to me, patch applied!
>
> Sorry, but it seems the author didn't pay much attention and didn't
> really work on it. What does the < 0 comparison mean here?
>
> I would ask if there is _real_ issue with the code? What is the use
> case and why is this check needed?

Dropped this until Andy's question is answered.

Yours,
Linus Walleij
