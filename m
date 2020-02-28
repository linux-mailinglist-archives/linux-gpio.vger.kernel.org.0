Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D69C1742F5
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Feb 2020 00:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgB1XWy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 18:22:54 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41681 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgB1XWy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 18:22:54 -0500
Received: by mail-lj1-f195.google.com with SMTP id u26so5008450ljd.8
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2020 15:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2eqxeoYIrVLOIQ7hh1SkaHG4jTSn1JrLp5pMhF228gg=;
        b=fa//2cfD9xxk9b6pZ6Yw33KdAqjyxP/fqbFuCPrtvpvcXafVEnloRfDXvaBe0dN0Qa
         fINSDiTXoEkKpAHbZR0/CdQGXzw4BkWxKqFbvTTlF2t30WImNasawyhoby7EbJk0v4sP
         eFf8Y1wTo/G2c4D/JkpUKxEmXnYI5Cv+VsODpIJdCdKwfbE8trfou+O6r4JHKG9284Qv
         VKRG+jTEXuy0aWblF9Jkk49FRn1B4uyIvX52L5y2JhQ/ZLISwAnuVEoiuN976mSXrGfs
         khNSj9gFNkG3O9Qxt+VkpLOxS+pBmxH+KEZlYmCfeNRuyviRcA4DHcXPIw388fNvkykP
         RL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2eqxeoYIrVLOIQ7hh1SkaHG4jTSn1JrLp5pMhF228gg=;
        b=gphaDjWSTPiWYKBwU0TFbsi1wNxikIOXV4qqXttQxZTWT1n1xwy78izY54SxGaTWS/
         a9WyDk3AKcS+t+QtEHZahCMl66DXri4UXj3jMprkJQ8Bep4dMIyt5rpY3gqaS81ycO/y
         yUbjdIpXtF9xN4oSt+RWRHu8yoEXYnB2Gg9DnShkngwOLp8skTdSIOsRmYrD2d3Mi0eZ
         cwuaiWvRD/VLhxZpTPiugso9bYTyeBrgjHPXq8iLXgM6KUYa8FsguR2IjgkKT4M8d17H
         POgN/R9T2RN+nLbZmThhfvTDavaR9jP4dcXSMML9i4f7jU9+kuF31zdGztGQEi3b+Xya
         nWOA==
X-Gm-Message-State: ANhLgQ0MeNj+ONXUwjeoJ9C/NamK94nqaPAD+QPAIsTKCyjGi5KlLV7Y
        xkUvm36d3uk49GCe6A8riLXgK/bd9CakGey4HEPJrA==
X-Google-Smtp-Source: ADFU+vv4jorIIrhlu3IkFg1e8VzFI1djLIzV0XhA4c7hYwnb2v6uJwaQ90o8fQbNN3FP42H3eq2tJ/643zwjgaSocV8=
X-Received: by 2002:a05:651c:2c7:: with SMTP id f7mr4238077ljo.125.1582932172096;
 Fri, 28 Feb 2020 15:22:52 -0800 (PST)
MIME-Version: 1.0
References: <20200222060435.971-1-yamada.masahiro@socionext.com> <20200222060435.971-3-yamada.masahiro@socionext.com>
In-Reply-To: <20200222060435.971-3-yamada.masahiro@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 29 Feb 2020 00:22:41 +0100
Message-ID: <CACRpkdaj8jiABWU8Nj1p8=8HbDoi3zh4yMedVQ9C9BppqMT65w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bingings: pinctrl: Convert UniPhier pin
 controller to json-schema
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 22, 2020 at 7:05 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Convert the UniPhier pin controller binding to DT schema format.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I see this was applied, I had some comments on the previous
version but they can be addressed with follow-up patches.

Yours,
Linus Walleij
