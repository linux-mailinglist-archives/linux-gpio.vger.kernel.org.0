Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F451BD166
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 02:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgD2Aul (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 20:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726377AbgD2Aul (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 20:50:41 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0FC3C03C1AD
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 17:50:39 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id y10so285767uao.8
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 17:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6u3sVYzO/Ci5rYvWAGcPeyuh2kJ6IDPGvpL5WgquApI=;
        b=cK2TC6oquRyuDEIZ1S6rIu8b3VOBFMwrJQubosXZZog80NmR+y/OlKbMCRaYQhZhpm
         sWdEbha+b9pOy8AmCfTklC2xUV8b1e0VwH2uu5DoFuI05bntFwhljyerZYyRnK32Ze1Z
         pmka47TcDe2giuk2cFnHmM+QKkaEQD1W78IU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6u3sVYzO/Ci5rYvWAGcPeyuh2kJ6IDPGvpL5WgquApI=;
        b=TadTsgYmKv4E8FHYKpXQPsltwevVpk9J4oQq2zCQdklDvnykmalBPMl7ZV7zDzlg++
         vPzO1yFc0UMmR9ZzdDNurMxwHodTNoW1pYC04lwTB95dnlgpe0L9gp/vMMfj/nHOBF7G
         v7TATZveE9goyZU+Dht4tv4AI7reXdN0NDPR9DNWfDaY+eMcwf3TWfrFoTfhFddn+TbC
         BhR/MVjXi4YP78F1ySAE0WJf7t2pEYimFrP0cnEGOhWBhy/SuCbrPElxu9KvHQpVbyOa
         U4/hztXWE3srisPb5EYAAuhF8pjoPXzXnDVqKt74lIH6DcjtCz9f9MynJSfWdn4muaZE
         Wigw==
X-Gm-Message-State: AGi0PuZpXcptVRqYtrljinhmsN/urAPCinE2atjZAozFkwjQc16fNwvP
        dQ8DW1RdSItPDS1ua13phQZsECe8qFs=
X-Google-Smtp-Source: APiQypKH50fGjkW/oyWlXdqjF5oWJMBExqjB9OxE+F1PDO9+v8J+Jau9gRyRHLxGgusl3PDH/kSalw==
X-Received: by 2002:ab0:6893:: with SMTP id t19mr11699645uar.37.1588121439062;
        Tue, 28 Apr 2020 17:50:39 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id v64sm5364546vkb.2.2020.04.28.17.50.38
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 17:50:38 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id s5so311145uad.4
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 17:50:38 -0700 (PDT)
X-Received: by 2002:ab0:375a:: with SMTP id i26mr1184039uat.120.1588121438064;
 Tue, 28 Apr 2020 17:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200428172322.1.I396f351e364f3c09df7c7606e79abefb8682c092@changeid>
 <20200428172322.2.Iacb3c8152c3cf9015a91308678155a578b0cc050@changeid> <a23b7a97f349e6f74b993a4e127564ad3f7d6929.camel@perches.com>
In-Reply-To: <a23b7a97f349e6f74b993a4e127564ad3f7d6929.camel@perches.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 28 Apr 2020 17:50:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Us6LyfgeXvxnqq+KhHN1djok1y+W_xzSb-KGFy2wgEMg@mail.gmail.com>
Message-ID: <CAD=FV=Us6LyfgeXvxnqq+KhHN1djok1y+W_xzSb-KGFy2wgEMg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Make "offset" and "unsigned int", not just "unsigned"
To:     Joe Perches <joe@perches.com>
Cc:     LinusW <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, Apr 28, 2020 at 5:38 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2020-04-28 at 17:23 -0700, Douglas Anderson wrote:
> > When I copied the function prototypes from the GPIO header file into
> > my own driver, checkpatch yelled at me saying that I shouldn't use use
> > "unsigned" but instead should say "unsigned int".  Let's make the
> > header file use "unsigned int" so others who copy like I did won't get
> > yelled at.
>
> There are a few other unsigned declarations in the file.

There are?  I swear I looked for them before I sent my patch and I
couldn't find them.  Then I looked again upon seeing your reply and I
still can't find them.  My eyes are bad, though.  Maybe you can give
me specifics?


> Maybe do all of them (and remove the unnecessary externs)?

You mean just remove the word "extern" everywhere in this file?  Sure,
I can if you want.


> trivial reformatting of the function pointer block too

Wow, I must be totally out of it.  Maybe it's the gin and tonic I just
had.  I don't understand this comment either.  Can you clarify?


-Doug
