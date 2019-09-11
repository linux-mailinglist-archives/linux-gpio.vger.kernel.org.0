Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 153F6AFA0E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 12:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbfIKKM3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 06:12:29 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35523 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbfIKKM3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 06:12:29 -0400
Received: by mail-lj1-f194.google.com with SMTP id q22so14841870ljj.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 03:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3M63LrG7x4EL82UFdpWrP/9mQ7ENkTmec+0FbO71I3U=;
        b=anZV1hGsHQ0z1I7A96aJmqJ9C+jSf5S0WZzmj5riq0TO4C4XTdh61XfESCOdVK7/HG
         ZcTZZMCmwGzHPy5ca0/pD2rQcHMIabGHMDDjeILV3sHF1ZLht/o0tdV8knjUIh4joiLw
         m3FrJZldDwYb1O8mcZRFFIXGvaGsfVCE6YENAm0fSjYHk7QyrQPTqsBvX56MG6kpaGKk
         OkHG31ufBamCooV1exe8XXHIX+PLLKnYXIALwiNdE7gjhUggrNU5LAhZqnARlj8naLfQ
         rHUphgQfJU2v6QXgckORHG3H4aH8VQiYhBGjvyOjG4T/L38EwZktvb0+eeqZTAm3D/1z
         tXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3M63LrG7x4EL82UFdpWrP/9mQ7ENkTmec+0FbO71I3U=;
        b=d7eQTL+CmF7FIhGWor73NHUQiCMv1NgifbFhSHIUodjZvwWBZR8bOhHB6Vd0WKWXYe
         IlDsSAVutMjxejNz6PNmV8lstg/hGNIUFat9mh7++n7jhmMJYxcgl9XF4L45iMO4rx5A
         5UEvmFQ70L+oNbAHr2BXBqpw3WxPKKnKQaPevBg0GJ/iSbT1VmGR8qv9QmEjq2Lgd+sl
         n7QZCjjhq7X3wNgT1eW8K6uimS7W8HVutONVgGxZySCPcs3GgxM8qNMKx3BlkklkysSm
         IC1SHE2Y15VmhPM9fyxnEW9M6N7Yz/gVsLA8zLR3kNrXFL1wSU8h7mJ6eTR0eTxx+EhM
         s71A==
X-Gm-Message-State: APjAAAVupUwwC391snCf/CrlHBwb5SsSRqWhyaUHkK6SLGnjR/+Tf8Or
        WKjD/YAz3oRodUiU30msjT28tqK0fG6qAUoEVy7Pvg==
X-Google-Smtp-Source: APXvYqwTtRm0wqQ33imjK5cfMhNwbKoP0HS+Yel+sv1lad66NjfwlsknxBwRjBLiSYx4GLneZb/79nnkLvotk3xijGU=
X-Received: by 2002:a05:651c:1108:: with SMTP id d8mr14938226ljo.180.1568196747444;
 Wed, 11 Sep 2019 03:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190906062727.13521-1-rashmica.g@gmail.com>
In-Reply-To: <20190906062727.13521-1-rashmica.g@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 11:12:15 +0100
Message-ID: <CACRpkdYbyHtC_gQqvc5cwYGqUPt1cYTW0cQVxPDah4XrdYB8Kw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] gpios: Use ngpio property from device tree if available
To:     Rashmica Gupta <rashmica.g@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 6, 2019 at 7:27 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:

> Use the ngpio property from the device tree if it exists. If it doesn't
> then fallback to the hardcoded value in the config.
>
> This is in preparation for adding ast2600 support. The ast2600 SoC has
> two GPIO controllers and so requires two instances of the GPIO driver.
> We use the ngpio property to different between them as they have
> different numbers of GPIOs.
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

Patch applied with some fuzzing.

Yours,
Linus Walleij
