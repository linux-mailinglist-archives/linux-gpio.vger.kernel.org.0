Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA96422618E
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 16:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbgGTOFe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 10:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgGTOFd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 10:05:33 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9231CC0619D2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 07:05:33 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id h22so20367206lji.9
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 07:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bdUe0ZPVosL7Z4WJYy/0J3RKrsJsZRzmUChTLrXGltA=;
        b=B+lyXPAPcJEGlKO6a8Jog7GPdTUGPIyIGEwfQSUPh1vUrYwjCvqP+RYm6xyhHkFJqf
         6DzsMS8XMIW/cXmQeeKCr+nowdpwHbgzHZ8sU0ubiVrHbDJjddA7m9D5ynKmoahqNp8n
         ArZ7l3/E3DxkhUlDtGsSA8J55b5iWSMibz8qJ/V/nalShSB4VUqNN6RZUMGbMh9Pabms
         vaJcdRa5xLqCxqf+mnZRNu/UGyQVT13CSoA2QeklJQ5IGO1TfGV+1WD9igeLU29QNXLY
         53DouSIWzkRm4a1pIt9ShzxhLuhih50eONVPlZn5eGrmBjZiljZ9jfolUKkmjggr2QbY
         TzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bdUe0ZPVosL7Z4WJYy/0J3RKrsJsZRzmUChTLrXGltA=;
        b=P5R88/TywIpSt3mQU1pVN+X3HaMbjVdgOEV4FZmoEgUKARO/WjKrF5sR+1z4XiV7HH
         ueBLEExLztgxE58rGfMeRTaZnx/aSBv+GbbephT40Q2KLp8ketQOVz4/KnqeWGRiTAKu
         pgzXFKeR0VO9x1xMBVS6+WynUTBJcrXCMGFnTi3gEidaRZJGGkfi0M3w5aiO4Zk/vDCd
         fJCLwfGs1MpWz/qTTwBsuXN49LtlPKJiIKQ3SagViUAw9xhvvqAx98m4egGljFmG3+Qh
         bopUwWEBF2ZUepENF8O3OSSE0hB7cVHjf6fr07iNU+xh9p8U5o9B459miyAbjJ402U7v
         L1Hg==
X-Gm-Message-State: AOAM5322QZpRujMiLzTDuR+TQvu35WYQs2bE4NWZaH+7YK6Og0dJD3Sl
        coaYkkmi/S0PzopN01rFaKgUKuBY5pw+Shclf/MDqg==
X-Google-Smtp-Source: ABdhPJwlxLkDNR9YPaaSHjCmjPSd1/6njPLm9AlnI7yvRmTCzkh9tqcIVMbnPI+PsHQ0pWClZfQEbRBp1gKwEuG5GNU=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr9730976lji.338.1595253931811;
 Mon, 20 Jul 2020 07:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200715213738.1640030-1-drew@beagleboard.org>
 <CAHp75VfYXuZgtkUvrm0VGX7CcyZoC2mzC_x4mVhzVCeTjZpiJg@mail.gmail.com>
 <CAPgEAj4gJsZLWDEkjfF+THcD92y6HL8T00NWzpECLDdXQYLVfA@mail.gmail.com> <20200717194246.GA1775009@x1>
In-Reply-To: <20200717194246.GA1775009@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Jul 2020 16:05:20 +0200
Message-ID: <CACRpkdZqARhG7ZtmhL5RJ1HOBYHDufzbYu_u-sH3RKUGF6=-ew@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: omap: handle pin config bias flags
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 9:42 PM Drew Fustini <drew@beagleboard.org> wrote:

> Sorry for the noise.  I failed to realize that I had already sent v2
> (regarding the handling of the return value).  I have now submitted v3
> patch [0] to fix the braces formatting that Andy pointed out.

Oh, OK I applied the v3 instead. To the GPIO tree.

Yours,
Linus Walleij
