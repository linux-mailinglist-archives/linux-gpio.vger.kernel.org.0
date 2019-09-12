Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B700CB0B0E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 11:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730458AbfILJR2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 05:17:28 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38383 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730397AbfILJR2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 05:17:28 -0400
Received: by mail-lj1-f195.google.com with SMTP id y23so22528325ljn.5
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 02:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=szvOgaSKQHuR91dwCdpTxKgQS8xunWLLdcGGO0krnL4=;
        b=sA7zUsLieMzsUVFjX2+urBr0+1oZ9bvhGRHA4G0cboyuuO3Y0mq+djLeDOwM0jAPY4
         /QNlB9igugVuoWRXJRNqk4JkA9GyMlt0oRVwCZo+/fm0cn6IFuMcU30YnHCJLopTFQqP
         EW8b1fGL078UUPetpRD6ZnYfylArrpW1c6mqvxdiMyE+k1g1tk6KPkC11hwPTtzJ9WsU
         Cg9K08Wep9/wMuKC5cmgo0iE0qOqEnvACztRLP90QbET4V/YHOZeiJvgxXL+TDeQYoHd
         C/sGr9e//liFGE+rDfKNa0KlqNI808auphGPLR8RhaQFbgU3KGv8Yv+BC1uVses4g8xU
         t7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=szvOgaSKQHuR91dwCdpTxKgQS8xunWLLdcGGO0krnL4=;
        b=Rn2svLyght0e8DGdP4GcjpdvTpgj6MbcCPHc9JghfHsT0LCh1GxJ5NDQej46/MMq5M
         fIC2S5pIsFjVjqzaecPOoIKpJH2jUfQpZvs4+yFq2nj2g/RN7KL9RmvCb4wohy02JhyQ
         NpXVpizh6iibM0QCKaWNI08X1WZVl+sR0Ee/TqY8dIM2CKTAxryYAX5MAPIf+5St+APi
         ar9TuYpPd2QdoeJdK5zpx4izWr8CJlI3mnhCjSPdTi1q8WymXORb2NtS6PBsm2ZecZv4
         zgrkFJsWUGZCj80H3OexyzAe9vFSATz+9KQNOvkD9RN32phl+vdC93dJmuZpGFZYYIRk
         Yt2w==
X-Gm-Message-State: APjAAAX2ufaM3ZLiZ3x/8R/1i9To6WoYQHOXeTzW5NLADL4SqTzS/3vc
        6piW1RMHvUK87RKQPwL5XH+7TE4TDJrWYfV4hcSTuw==
X-Google-Smtp-Source: APXvYqxL+8XFoDpn8Dd9sc3WWzP6/eBNJgZM935Fj7SoXm0Pq+8cYMp8gFoV2ij+afLEJn83FenUjyZivw8vujXDIuM=
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr22302607ljj.108.1568279846715;
 Thu, 12 Sep 2019 02:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com> <20190910152855.111588-3-paul.kocialkowski@bootlin.com>
In-Reply-To: <20190910152855.111588-3-paul.kocialkowski@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 10:17:15 +0100
Message-ID: <CACRpkdY40PZc9R-yFwooR4-WMgn3LH7K+yTx00ZNxyq6OOnw6A@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: syscon: Add support for the Xylon LogiCVC GPIOs
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 10, 2019 at 4:29 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> The LogiCVC display hardware block comes with GPIO capabilities
> that must be exposed separately from the main driver (as GPIOs) for
> use with regulators and panels. A syscon is used to share the same
> regmap across the two drivers.
>
> Since the GPIO capabilities are pretty simple, add them to the syscon
> GPIO driver.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

I'm fine with this for now, but the gpio-syscon driver is now growing
big and when you use it you are getting support for a whole bunch
of systems you're not running on included in your binary.

We need to think about possibly creating drivers/gpio/syscon
and split subdrivers into separate files and config options
so that people can slim down to what they actually need.

> +       *bit = 1 << offset;

Please do this:

#include <linux/bits.h>

*bit = BIT(offset);

Yours,
Linus Walleij
