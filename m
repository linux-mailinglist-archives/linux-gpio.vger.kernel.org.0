Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1CE249F7F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 13:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729799AbfFRLpu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 07:45:50 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39174 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729681AbfFRLpu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 07:45:50 -0400
Received: by mail-lj1-f195.google.com with SMTP id v18so12788568ljh.6
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2019 04:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1rf7AWCdhvsdlYX1vGjLsRXGhLZLWagUfJ8IC6/ih9w=;
        b=MOX+o7dc4nQUgrPXR6SRipHOnIbKnt2HYcx98CNXdoUAzFYWxUGdJl/ymQZ9NYJfDQ
         vK0hCpbN99vUYn3KKtcTG3n1TKJAOZCXpHZqGKPkgIUW56guOXNso6T9zbOB41sDRzss
         tjg5jghf/SW2jj1/7XwnC2j/bOfOnwmmB1ur5Vf3gb7u6fTeZyMD8D253oDxFioawO9S
         wPckepNRqm8LrMIZtu769hBpiuNYjvEi3x+8nIyLtRgrMrXpZ7DcgX1n5KU6ps7U6Rxd
         YOTGk3mXkdVYJetD23pE6UwfBo72YqI3Dae/v4aC3yLOCOTAWUJFGUd2nhqPEwI8DXA+
         dqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1rf7AWCdhvsdlYX1vGjLsRXGhLZLWagUfJ8IC6/ih9w=;
        b=nJGXErgqiKKT+xCJcu/qWyNQQWC4egC6qKSl/aNA9NY2/Mii66cMzoZyumtARm5Ksp
         Uvtud+isWlCWdero0VaeGecwJRHPUa9i8kuaR37hIe/i8WiX3Tds8FnWvfu9i9SDmmXJ
         RrLp0F2/YQbtdB1MRHDIi6JYP2tIcDVk8Egb6FwOYN8n510yUH1DzOQNqxgY2dwlhdr2
         MMg/7QJcDXKoDlJiSS9lnaoJnCfaO1UTJL7zloK7aOr2EV7akJeYUuK2Yfh4ezq2GEeN
         OEhjpl31OAzppvOTIB1N2T74loFzgCvNVAKWYX9Yemo29BUUuSaL8jro2zxdSYx2mHsn
         +ZOw==
X-Gm-Message-State: APjAAAWv32BF+vy+NvuEWImPSWDNQT1nvHYmst0p6DKYqJ1hBR0TYf+H
        Il5At58fHq6CyHF7Y4jSISXizXX7EfumFGG/8a6UALNk
X-Google-Smtp-Source: APXvYqxAK85u3378CbhOlOqgXBCoow4rwfeShnZdq8Wf/4Fq6yXWqFZNGGIR47IzFf/o7qxQ6z9tbWZ4onX27LCn+ss=
X-Received: by 2002:a2e:650a:: with SMTP id z10mr22560572ljb.28.1560858348452;
 Tue, 18 Jun 2019 04:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190613015532.19685-1-yamada.masahiro@socionext.com> <20190613015532.19685-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190613015532.19685-2-yamada.masahiro@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 Jun 2019 13:45:36 +0200
Message-ID: <CACRpkdaHrKh3Ai1FyiJd0cZU=48R5XnfJ_oVdJWGQ4bQsWQgxw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: make pinconf.h self-contained
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 13, 2019 at 3:55 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This header uses 'bool', but it does not include any header by itself.
>
> So, it could cause unknown type name error, depending on the header
> include order, although probably <linux/types.h> has been included by
> someone else.
>
> Include <linux/types.h> to make it self-contained.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
