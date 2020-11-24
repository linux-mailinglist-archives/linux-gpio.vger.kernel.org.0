Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628192C2038
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 09:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730736AbgKXIko (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 03:40:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730735AbgKXIkn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 03:40:43 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54397C0613D6
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:40:43 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id u19so27733461lfr.7
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fZZ8f+vcTbXX17RytzeIZCFFJIrA9Nh0Gm+ruQ//k0k=;
        b=fIbNuHGlb2d+s/+JSsS7jUKosx5QUxc7C77UNyZTA/s+tqMyYJKnaqKbRGv4fF1jgP
         3yNby0AANnjpRYQ6LV5iTNCYQUf22MpP3JK4nbXzbLykNyNu8yr8hppObevC3qPD9N0A
         zwE7HYUl21zeQdtHRWX/lw7sww7u9f7DOFY79uz7lGp/lVYglVGPTK9h50Qxt60Qz9H3
         diheIgaaQnv/ygEBi38QC0M/knSDEcuurdErGnGftOcLGnacoX7uUmC0HARPgYR8EXTi
         1WBKtMM71n7wiQRfxDFVvYirUh+osCH98rixTtNrUX3qX5rzXzjL9w/sc9FMslwTqVMj
         6L+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fZZ8f+vcTbXX17RytzeIZCFFJIrA9Nh0Gm+ruQ//k0k=;
        b=nwU6L8Ua/d1bqjGwJ1EjTk/SpQIZNupvm+QQDn9xtv7zoYpXZCPtJIcyDajlU3oSCy
         ew+CtRghmDIlNalyjZA5G/CyWymKJedEkqwScmUyBkR35C7MDTD5gTZnjpTTyvK68wWE
         fbrJ++DvHLSU0w0uwjbReisTfoff9Q/QjySellF9bkAdWm7wFYKot2BxWfqjRq4chEqH
         RtOFcBYbKtjloyCaZaEAT4/5s++F82cH9MA4ei22+S6HmahQUKyM4lCuXtg0mZg9moIb
         /uebwRXugJK5S32UNacp+lF6xpsqj0VueW2WBD4oELiLCLfJ9eHpIn5r+KzumDzMi9cv
         WYTA==
X-Gm-Message-State: AOAM532rm1yzE5hMA1iRg1mQFS4V9WkXpgxa1Rzu4gJy5Hwi+iBC7AbE
        b30i7QZq8DM5OtYio/aBlMErmvmDOOwfHt72wPgjPQ==
X-Google-Smtp-Source: ABdhPJwNkSDZXLOQfs2Jyn1mrZ2ZkhxO6DJbc3QBwD7p7UL7WlmV7igDmBlc/TAEEwTLPdxo9OUar9ZcG/WmIHjreIo=
X-Received: by 2002:a19:8d8:: with SMTP id 207mr1221121lfi.441.1606207241846;
 Tue, 24 Nov 2020 00:40:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604988979.git.frank@allwinnertech.com> <9db51667bf9065be55beafd56e5c319e3bbe8310.1604988979.git.frank@allwinnertech.com>
In-Reply-To: <9db51667bf9065be55beafd56e5c319e3bbe8310.1604988979.git.frank@allwinnertech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 Nov 2020 09:40:30 +0100
Message-ID: <CACRpkdYudoTaQfx9jB57xyWkO8a15OCbb8js0X7=3_AJWArUKw@mail.gmail.com>
Subject: Re: [RESEND PATCH 01/19] pinctrl: sunxi: fix irq bank map for the
 Allwinner A100 pin controller
To:     Frank Lee <frank@allwinnertech.com>
Cc:     Frank Lee <tiny.windzz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 7:23 AM Frank Lee <frank@allwinnertech.com> wrote:

> From: Yangtao Li <frank@allwinnertech.com>
>
> A100's pin starts with PB, so it should start with 1.
>
> Fixes: 473436e7647d6 ("pinctrl: sunxi: add support for the Allwinner A100 pin controller")
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>

No response from maintainers for 14 days so patch applied.

Yours,
Linus Walleij
