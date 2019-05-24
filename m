Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 667E129726
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 13:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390861AbfEXL1o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 07:27:44 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:45904 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390701AbfEXL1o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 07:27:44 -0400
Received: by mail-qk1-f196.google.com with SMTP id j1so6910165qkk.12
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 04:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BjYcnQFmVjebl5i0cXPxIGxnyaXnU2JY+brSml/1DDA=;
        b=wGoUtIoO0xz1EQhdjt87mJBjfAHd7Ze0qgWrdLO3iyLU463hhfssDEWbk1Ei9Z18zD
         MzH1H0jYXc1FdtERUsP1TKuCRpAT1DJC+kGD7/6qUtElGHuy418CvUscrLkU/4gqu1TZ
         j05FNLrxUQCBUTfGoaPwzMuxLUedlu2x/ExF1zPVYt+Ce26ouQwv6MO3sZA8TRdeCURJ
         /AaGaj1MziyxFXmubqdVhkewE0SkemPgilorVvo10rANGoC294M0WlmnuMEI9OXQGmqu
         +ShnV6T6oumzk3r3twukFvr8i3d/6MGzzQ0MHXz5ssSfVnMySSixwiCRxCJQsh/5Ij09
         QExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BjYcnQFmVjebl5i0cXPxIGxnyaXnU2JY+brSml/1DDA=;
        b=Dm0y3OoYEJHS72kxOnf7QnUVXiQ9d7ii9sRgoniQ1KAtbB45og/A3ixHlDN2DW8s2T
         e3JAmZ/We9/k6K6TQTWxe+4k8qoGqcpt0yFoWCt3VKIvb8ooVF8lKQFYmntj3DvZPZOS
         UmOPnK1p/2dbaSYwRwqjWJwHmLaQTMsBFxAoMmjp/aOGKZqVe38zWWp4qNyrsnIhGMC7
         QSA3e47l6EBAlHHe0BcBb6CSprBugyiU58XEO0i2z+8BpTpBYcCxiuu6Lh7CZsFa08yT
         7AaDylua9PyAeIqL0O6WCmgNdSsHUdmmora3/rVYFGtcgwP/QjN8svGQs/N/NlIbyAqo
         FYyQ==
X-Gm-Message-State: APjAAAV00J1ZMSx9qFCaKNyJHpseUqbhTNKbrO5gfXxzItDRUFkVxuch
        q+Or/uWfn6R6V30+ggzE8UKQ+cj7SrB2awdQ67gU/w==
X-Google-Smtp-Source: APXvYqxf7/9bFgNldoDEakk0wvrkUDY2w+3N/zeuVyi+hiSEB2HQNspS+Lvdr8CIJFtRT4V11GagahDvrbloBFIO5qU=
X-Received: by 2002:ad4:45ab:: with SMTP id y11mr82554975qvu.137.1558697263652;
 Fri, 24 May 2019 04:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190510090339.17211-1-luca@lucaceresoli.net>
In-Reply-To: <20190510090339.17211-1-luca@lucaceresoli.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 13:27:31 +0200
Message-ID: <CACRpkda5afsF+2WwMg4_L7uDexFR0UExgmHQ-+JajXmPCpzU3g@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: remove duplicated lines
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 10, 2019 at 11:03 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:

> The 'default (active high)' lines are repeated twice. Avoid people stare at
> their screens looking for differences.
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Patch applied with Bartosz's ACK.

Yours,
Linus Walleij
