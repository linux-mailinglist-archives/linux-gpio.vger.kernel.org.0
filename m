Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFCF5815BD
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 11:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbfHEJnJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 05:43:09 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37715 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727340AbfHEJnI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 05:43:08 -0400
Received: by mail-lf1-f66.google.com with SMTP id c9so57344839lfh.4
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 02:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r7GWnzw8LLVSbBo+yy3iG6e6CAQ2PpDK741XOujQ55U=;
        b=JCurn0xM9V+8ojDDgzNt8zdaWur2Q413FUzkqsynzHpf/EKsMXQQ+CoBYNEb03IRLF
         12NjQl2y/YC5hsT8AE5R9/E2PK2cCn4OUsxf/R6vvBMhp36BK+G8KL6/H9MFrk2XhACe
         ksxNi0EbJUicit1LhKKpyqmg9TS9wuWBscHQ42kCZA8/NohbvlDJSv8GAtrDQub9Dnot
         SWQwoTg0Ab3CTCy9werdkEwdVus0EM8Ma8vPnKiRT7i6tZBWrtG0SVbL2mBO9Y6atHxI
         zPak/0DHYphR8fev2p3+n2lphIzC4V2Vr0dS1yw7QzHZsCXDfEXns9Kl2oNLLZ0LFyHa
         UvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r7GWnzw8LLVSbBo+yy3iG6e6CAQ2PpDK741XOujQ55U=;
        b=eQ5/OLN6sv8gecp9blcS39w+lzZLt1kHjjVqkHme9iHywHF1JjFoC0I83kCSzTh+y1
         lb3HFY5G8Z6+Dv8glAKGRNUM0uR5R3aMZ2hzZZh0oCJLrnnV0oXQMxuh1x9zOUdJeZDq
         KYkC0U2yWLOOvkxfvh80QcabTlb+dmOGDnhODy0VQaSqObMUgYM83oM0hFJLkyj56+Z7
         oLb5rtmkndr9bO13pC+YzAZLYonbY2RhY016KWvb9KWrzWh3Aoyk750EpC5TGB21ZJym
         8r1Fey43WAmFtpjSo8ecAYltgUU7ZaRd9MKBkbgnmi/BnLaeGuVRgqa7THCwZ3fSr3pt
         CpkQ==
X-Gm-Message-State: APjAAAUGTWhVYUZbNDxb0RooR5DxAhQCfJsnLuOVyXtsHkJuXhaOSxTA
        rKjkmQ8FRFiU+9MGfFLIurd6zo/16qxajwYNLzcPuw==
X-Google-Smtp-Source: APXvYqxu3OFyma+Q5Ju3NIC0ci/K8GTjPSl7PaVzPIEiiV6xv0AC6zBDmeudwcb14x3U+GIiQP3mPQQ3OuVOqbsWyD8=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr68682648lfh.92.1564998186659;
 Mon, 05 Aug 2019 02:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190722090748.20807-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20190722090748.20807-1-ckeepax@opensource.cirrus.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:42:54 +0200
Message-ID: <CACRpkdbK=GCh6-4NoYHug6or-hBw-NFJGXgS1EBLbrUZSxn5JQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio: arizona: Use local copy of pdata
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 22, 2019 at 11:07 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> A local copy of the pdata exists and it should be used rather than
> pulling a fresh copy.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Patch applied.

Yours,
Linus Walleij
