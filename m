Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D89327A97
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 10:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbhCAJT6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 04:19:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233836AbhCAJT5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Mar 2021 04:19:57 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42EA8C061756
        for <linux-gpio@vger.kernel.org>; Mon,  1 Mar 2021 01:19:17 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id m22so24314550lfg.5
        for <linux-gpio@vger.kernel.org>; Mon, 01 Mar 2021 01:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tACmQpZqJbPVbrp6VhKqN/6XRGZrHClEhqKE2HVBdfg=;
        b=opsBlPquhp9ku3v6FhnXXhIlTleSnTTbxfQEpfPjkSRwStpTRV1ptxI2WO8jE9XclJ
         XpTIft0pxOEWXzAzTEN1YwlodgCUpQld8M4QqLyzFU4GSAZh804fQKpQUKEGYlDiZUXH
         nRwM9IZfr6VqS55oLHbzTDJgPZ4DqY2FGirB7ml74lO7vavhIm/nmqRJ4Z+3dHcsK22f
         llXZk6W2uS5bi3sUKVoujd0nz5OECf0lhOYspbTulnQwF6r7vCM8QSjjycf5Icwjchij
         OmiWFE/8ZS/xfjVD6fnZ3kqHBIp5p5HDWOjFrcRHzdSHji7RmCQ0JbSNy4NtCsX3l0gV
         SHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tACmQpZqJbPVbrp6VhKqN/6XRGZrHClEhqKE2HVBdfg=;
        b=YWGSyFd5NPBMSJrABBgWp6dNDr7wsPXEPNwppMyfzfpDfgpZFyTjpraOajbrNQrNak
         dp0MWmRzoEG68/avPtnjbUkDqxV7QhbihvOPDPbTyu2u8jhieLbhRF2X5t+EcyUmlCSk
         igbIVxOg9sT51/Pliw7csHWR3PWsu8BbSqDcKlmDq6zxX4OR4ZNJuO06L8wjIJrhb/4S
         OY+zh2fHKT8ro6KtD+yYUhNq70tc2n6V4IjLTH/fc9hDYbj4Z8hN4qW+Qxi4KUnhXEdz
         q7t4nC7SuZ00SNnv32ByZBRNjHVUPrT6staxoAUThEOQ5qYx3w+dy8/5IL0YAvUFPZJf
         O0Vg==
X-Gm-Message-State: AOAM532XkSD/s1DhSUpwBxg5AreUY/v/zMhgfaZNSpr47WjvFLSaWgxS
        Yks5d5xds+lL0VeZFmU9m1tQeHeN9CNzx8StROwizsug1cY=
X-Google-Smtp-Source: ABdhPJzy2r3weDzNAYM/z+Ke1adpfXf0ceGI1xwHJ3MyTdEL/jEWXBZ0VDU6pmGkYMCP2JR0G2W6HwtndcKJHQUWt/k=
X-Received: by 2002:ac2:5d21:: with SMTP id i1mr8597506lfb.649.1614590355682;
 Mon, 01 Mar 2021 01:19:15 -0800 (PST)
MIME-Version: 1.0
References: <63d610ba-5f63-2be1-6215-f44bd88d94d2@xilinx.com>
In-Reply-To: <63d610ba-5f63-2be1-6215-f44bd88d94d2@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 1 Mar 2021 10:19:04 +0100
Message-ID: <CACRpkdZEYqPU6Zr+a6fivZiz-hKx6-KVdYVR7j--y+k2KXZaPw@mail.gmail.com>
Subject: Re: DT overlay applied via pinctrl description
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 16, 2021 at 4:35 PM Michal Simek <michal.simek@xilinx.com> wrote:

> I have a question about expectations when pinctrl setting is applied. In
> DTS all nodes are described in the order available in DT.
>
> uart-default {
>         mux {
>                 ...
>         };
>
>         conf {
>                 ...
>         };
> };
>
> I don't know if this standard description or not. I definitely see other
> pinctrl drivers which are using different structure.
>
> Anyway when overlay is applied the order has changed to
> uart-default {
>         conf {
>                 ...
>         };
>
>         mux {
>                 ...
>         };
> };
>
> which is causing issue because pin is configured first via conf node
> before it is requested via mux. This is something what firmware is
> checking and error out.

As Frank says the DT ordering has no semantic meaning, it is essentially
a functional language, describes object relations not sequences.

The Linux kernel applies the mux and conf in that order because of how
the code is implemented (this order also makes a lot of sense for the
hardware). I would recommend to trace the execution of an overlay
being applied and try to find the reason conf goes before mux and fix
the bug there. I think it is a bug in how pinctrl handles DT overlays.

Yours,
Linus Walleij
