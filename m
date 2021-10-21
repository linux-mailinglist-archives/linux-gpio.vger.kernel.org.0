Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C09C435EA6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 12:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbhJUKK2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 06:10:28 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:43747 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbhJUKK2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 06:10:28 -0400
Received: by mail-ua1-f53.google.com with SMTP id i22so68710ual.10;
        Thu, 21 Oct 2021 03:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ADPxfUc1FVZXmyLUeY8JY2J11U9rKWLSgyyZ2T7U9lA=;
        b=DZ6F6PVPeIvAUtbeujrAAOp1rIzB/8Y5C5eLqWdCxFZjkEbD8uQqeGk314/8l7OguK
         MRIxf9WcBCSVjlq7xO8B8+38exD9NInWxWsfXzX5/6FDVJ/qmLJfV/7ffzMLHi+J9emp
         3xm2WBtvyyCVTVC2/UuDanGRtQRC/tsgchzTRpH2m30v98RqocdTU2zlz+fqHlVjDKak
         XyRbAnCvn5djnHWu6BFmhGahzxwp8ejusKPJQ9jdXJvsNnWoOnIQYloLf7O/lA+MyYUE
         50i60Ry4kkkd3C+GeUugiZzPOUWj7hduX223xUgiijSG6UBIQftR3C1gdpM/QHuCKJJl
         pFtA==
X-Gm-Message-State: AOAM533XaHixOGwMfJopn1ft5rXbP2l/Kz6KZtw+3YOXMor4JuuAcgfI
        GsIVFgtNqwnFYYxogwVFmk638fhMjwl8ag==
X-Google-Smtp-Source: ABdhPJx/z+h65uaGA4ofme4ndzd3E4aaowqSDlZgIwI/W155d0CbLNLQ6NWJ7y5cmdhvUr08Ld4h2A==
X-Received: by 2002:a67:e998:: with SMTP id b24mr5288014vso.58.1634810892068;
        Thu, 21 Oct 2021 03:08:12 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id o18sm2870582vkb.21.2021.10.21.03.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 03:08:10 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id f3so104378uap.6;
        Thu, 21 Oct 2021 03:08:10 -0700 (PDT)
X-Received: by 2002:ab0:3d9a:: with SMTP id l26mr5172072uac.114.1634810890004;
 Thu, 21 Oct 2021 03:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <8ca87330fd348fc5199ad08904ec90cc6a91a1bf.1634723848.git.viresh.kumar@linaro.org>
 <CAHp75Vctj-v8W+LgdVpYgRVL3fLdcFnOFRFg74LeCc=xLD+w4w@mail.gmail.com>
 <20211021043443.snhqpac5ofmxfb7k@vireshk-i7> <CAHp75VdKn7Sze9HxN0gBgbuQS2K6oB+SQsufw576Rkfg4-osOw@mail.gmail.com>
 <20211021095229.lqeb7dtxv4ix2vc5@vireshk-i7>
In-Reply-To: <20211021095229.lqeb7dtxv4ix2vc5@vireshk-i7>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Oct 2021 12:07:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDRGmxt55vvRTnyu5SwXCDtkcOLmKA87cd4SSa8S+Z=Q@mail.gmail.com>
Message-ID: <CAMuHMdWDRGmxt55vvRTnyu5SwXCDtkcOLmKA87cd4SSa8S+Z=Q@mail.gmail.com>
Subject: Re: [PATCH V6] gpio: virtio: Add IRQ support
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        "stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Viresh,

On Thu, Oct 21, 2021 at 11:52 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> The structure will get aligned to the size of largest element and each
> element will be aligned to itself. I don't see how this will break
> even in case of 32/64 bit communication.

Structures are not aligned to the size of the largest element, but
to the largest alignment needed for each member.
This can be smaller than the size of the largest element.
E.g. alignof(long long) might be 4, not 8.  And m68k aligns to
two bytes at most.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
