Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 331F11F1883
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 14:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729666AbgFHMJn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 08:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729620AbgFHMJn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 08:09:43 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA0D5C08C5C2
        for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2020 05:09:42 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id n23so20147450ljh.7
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2020 05:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Csn8KyDxlJnuN8p2QHdR8JXGYy4Wt0VYt2wzsa2XpmM=;
        b=vfMDaX2zzlrSnow55/RVFfgZNvOQQIOlg0+UADwTfo8NoD4IcmMyMQETnO6jCYVH5P
         SIkK9gILG10+4Bo1Y8ZAraKkA7SBM818PZN7Nog3zHnz4wVaUFMpU8VlEpN68CfGac92
         NauAcX9ToavwhBOKNACj4SnUqWT1nMvI42llswTwsX+iEVUWjDoQ7zSbveBxVnGhdOxh
         oLaGn9rm5RYSFOgofUz0Geg4ejiSRgXg6f7vCaKwD+JSy0AM85Bn/82oonnqwweMAy5h
         Rdmj0/l0e3y0nucJdtRe3YoB6lvVGhQ1th8te9rvdbv7juBxxiHZ55PoRmpailYdihRJ
         DqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Csn8KyDxlJnuN8p2QHdR8JXGYy4Wt0VYt2wzsa2XpmM=;
        b=gr5ln6MoWwgc8kMSaP/XlnwTUW+G0mH0WjDF/r2QCuo9JA8koC9dTHZQyMQ3qkZIX3
         cScd04qr9aN08KD3nDj74Pxke/uNZBr2DizMWkAb/KYOXeWN9P6UxKsZs1Cd4l1tgqdL
         CKimEDBwDB59tvsI6gvUR5BQI+ubYfkWGjHy1wJC+jszRX+wyo3l3A7VYIcbKqZ+SmSa
         iE6edpxJQEjPNuQuCPHE/abvaG0N1nNM5a3xrOgsB0bq0vHH8KoFFOkxLjp4zCXXsWiE
         adaUuXvldRqWIp6ShIgHaVC4ar1B8KHOEiSYVpNbZpoRKCuBW3Mj+Z/GMdKmre6g8F1h
         zADw==
X-Gm-Message-State: AOAM533OAsRckRj3KYTy8bTgzxi45bZvJZ8Tmv7O0S9o5E9ilEQpPOMP
        y9PLV2iKHnIRdYgdXTrnXXNXvhrUmzbM9y/8QPWziApZ
X-Google-Smtp-Source: ABdhPJxygKDGdQRQPGBYKTQqKJCd6k5YRc6rzNmwz77L6cJGWdHonWxHMEo58eZaVq/HyScv9iBfqeevK9kAW96xKxo=
X-Received: by 2002:a2e:5304:: with SMTP id h4mr5424716ljb.293.1591618181290;
 Mon, 08 Jun 2020 05:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200526122133.GA1454440@x1> <20200529175544.GA3766151@x1> <20200531001709.GA168774@x1>
In-Reply-To: <20200531001709.GA168774@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 8 Jun 2020 14:09:30 +0200
Message-ID: <CACRpkdYox64qGhxu2ycd-18Q08cKjt=Z019qVfdFEdRdTxxq3g@mail.gmail.com>
Subject: Re: pinctrl-single: num_maps in generic pinconf support?
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 31, 2020 at 2:17 AM Drew Fustini <drew@beagleboard.org> wrote:

> Does this appear to be a reasonable solution?
>
> I would appreciate any comments.

Looks reasonable to me. I suggest you send a proper patch. Tony?

Yours,
Linus Walleij
