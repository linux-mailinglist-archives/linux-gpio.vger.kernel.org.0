Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CB61B2A05
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 16:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729003AbgDUOeo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Apr 2020 10:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728884AbgDUOeo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Apr 2020 10:34:44 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D3FC061A10;
        Tue, 21 Apr 2020 07:34:44 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k18so5303787pll.6;
        Tue, 21 Apr 2020 07:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zq9Rc02OpG34TOhlty/dIpBCWMI3R3IYAzvpFb7L/0s=;
        b=tLk1gJX35GlvoIa/Xe6AMS2xhthM6FYWHJ3voPV5yh97aLD7f45gMcoyxgb8wmx7+X
         yR0EymyBRUErFfdo8YAUuBpeCAOUGgjPVz1K/qbbgYsIL/QEtBSLw4T/SAwffU4UItXf
         okQHHgdy0qiO/oVBVnXFKW9DB6g2M9EompBRycV6zEy/1F8aa2U37X2ry6IQeYhmPcXh
         /ieTHz6wgoxGLvkae7Lf/VS6KhaWSl8srWGbmyWOboEFS/AOBmZ+h3MDZNYzovOTDq06
         jxeywBRitu6C/666/ebdbQ/2H6JFpUCZWiIe205kPChdcZg1EAFJOtpv1IY3rQoyuJNU
         QsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zq9Rc02OpG34TOhlty/dIpBCWMI3R3IYAzvpFb7L/0s=;
        b=syRrEy8TEbmYRRfnUPKIHF6tUgYzk0w+ZaQ99pC/W6lwPFCmXjJrElqx8/lj1TwSjP
         xWTDtQnLDjlhdLxnGgHEETQhxfJ5Re+UvRuV86xxNQihd0jGK/rEH4KYq7273PxSrsy1
         HfJoFrZ8UvoWyKE3Kn3pL4nsccmdKPdW2nezGM4OI+BmKlwRiBUa8dJ3+r0EC2Fae3Um
         8+V27YOi/M4grz0uT2F3toCjaKC5tVV+KK+e03Gt6GQKWPSpT7xw9ZwzLTHx9G/p3u4v
         Ny2fRGxHOwJMZ1pIEkQSj2Ngb/yFCWjAt7sVAg1H/mvY6np76buhSwnvwdbZy7xVebp2
         XhAg==
X-Gm-Message-State: AGi0PuaStPrrl6t/MiW2Ck/A0zGOV7q7Ch5YwdRG8zahwtdFbR0iL6OY
        atkDQEEHNgVhINlAxYhOjpU=
X-Google-Smtp-Source: APiQypJ8EXwXe4ktFM9Rku6oLkjtfKkl3MYdvdW6wmw27A6j0XO4zh1LottWdophDgQs3HXCUpNlnw==
X-Received: by 2002:a17:90a:2602:: with SMTP id l2mr6280579pje.110.1587479683563;
        Tue, 21 Apr 2020 07:34:43 -0700 (PDT)
Received: from localhost ([89.208.244.140])
        by smtp.gmail.com with ESMTPSA id h13sm2687822pfk.86.2020.04.21.07.34.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 07:34:43 -0700 (PDT)
Date:   Tue, 21 Apr 2020 22:34:38 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Joe Perches <joe@perches.com>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, geert+renesas@glider.be,
        thierry.reding@gmail.com, jonathanh@nvidia.com, jun.nie@linaro.org,
        stephan@gerhold.net, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1] pinctrl: fix several typos
Message-ID: <20200421143438.GA9613@nuc8i5>
References: <20200419164956.3484-1-zhengdejin5@gmail.com>
 <f54d6f0a6c31ab3911c2b35caef49df340ab1196.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f54d6f0a6c31ab3911c2b35caef49df340ab1196.camel@perches.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 20, 2020 at 09:41:09AM -0700, Joe Perches wrote:
> On Mon, 2020-04-20 at 00:49 +0800, Dejin Zheng wrote:
> > use codespell to fix lots of typos over frontends.
> []
> > diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
> []
> > @@ -418,7 +418,7 @@ static const unsigned lcdvsi1_a_1_pins[] = { DB8500_PIN_E2 };
> >  static const unsigned lcd_d0_d7_a_1_pins[] = {
> >  	DB8500_PIN_G5, DB8500_PIN_G4, DB8500_PIN_H4, DB8500_PIN_H3,
> >  	DB8500_PIN_J3, DB8500_PIN_H2, DB8500_PIN_J2, DB8500_PIN_H1 };
> > -/* D8 thru D11 often used as TVOUT lines */
> > +/* D8 through D11 often used as TVOUT lines */
> 
> thru is _really_ common and a generally accepted informal
> for through so I suggest this not be changed.
> 
> https://www.dictionary.com/browse/thru
> preposition, adverb, adjective
> an informal, simplified spelling of through.
> 
> https://www.merriam-webster.com/dictionary/thru
> While never extremely common, tho and thru have a long history of
> occasional use as spelling variants of though and through.
> 
> Their greatest popularity occurred in the late 19th and early 20th 
> centuries, when their adoption was advocated by spelling reformers. 
> Their current use occurs chiefly in informal writing (as in personal 
> letters) and in some technical journals.
>
Joe, Thanks!
