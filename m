Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 208358E5CB
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2019 09:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730562AbfHOH4S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 03:56:18 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42532 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729988AbfHOH4S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 03:56:18 -0400
Received: by mail-lj1-f193.google.com with SMTP id l14so1471951ljj.9
        for <linux-gpio@vger.kernel.org>; Thu, 15 Aug 2019 00:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Y8XmEhYmB7olti/32E4GL8RTIPvUT5BJ4/7gBL/k7E=;
        b=MuI+QRa16rAPa94UUX5TMFL97UA6EOrvPzBDPQM3ULhXawhThhoXO7bX07rluEbBf8
         iU7Etgq5v/ojKhJ9yVRGAu2qzgtSLrttxfJrskLHwqqpF2ILc9rJDDsi2S2o7fM2pJLc
         jMeAXkF6r0BXQW5HnqSoUnPJG2sRbGtuCzMi1lDShXLKTyMWP1AaJXRWT36YmueMC0qq
         sdskN1PgUlDooFjY5R2VgqaXVMBY4M42aXksVElKTQEkFU0R/F6vRGxB+/icbZ41Fhhv
         F7lqnwoS8ZjB/F8dzgsnfe2DgTattQIyz/qTCbcOwMlowWNd5vK4PIu7KroNntt2EFMb
         CK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Y8XmEhYmB7olti/32E4GL8RTIPvUT5BJ4/7gBL/k7E=;
        b=Nx3FD8Duspu0S8hZ+FYCVkMBdraVxL6ZMffjU/V+V2z24mrCpoABZNdyHKnusHDfpW
         UEw+37TN3T7wN0uYVS9vGViKfh8lhk4lOUVdk7UUqgKXfIsx2iMJ3N/7aw94c73BF67m
         VWpn8/mWEyCbHsIWdyh/V+5w34jxKQykwMI89tgmH83cse+OoQbY5dHRCX+x722Gqcgw
         bTZ5/C690Om2/xNDHH3ogjjP7RIw+9y2up46/Dhi0ebcPxoAObVjRFQ+mose2XY68OFG
         YD/fqa3jd0ozcJhsaz4PIdUXmpqj8UjhXSpojeeDayO/M1KCg9LRa17CSgvvts4V2zIy
         9Ncw==
X-Gm-Message-State: APjAAAWXdF6Na7joLZAXPHLnh8xHV2IfLa+5gKF0jhpA0S/HW1YQomk4
        GUOlv6txgRKG9PMBoMtcKyurykDfHI9dccjug0YSMZQBnDQ=
X-Google-Smtp-Source: APXvYqxU5Zk2X4LGKzicaeM99lNrFkIsbcQQ5k3ifl6q3UpYYxti6lLHCtSGd4Mafp92uMU7QnqCestPMmtqa8io5EQ=
X-Received: by 2002:a2e:9903:: with SMTP id v3mr431621lji.37.1565855775292;
 Thu, 15 Aug 2019 00:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190809135119.6946-1-linus.walleij@linaro.org>
In-Reply-To: <20190809135119.6946-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Aug 2019 09:56:03 +0200
Message-ID: <CACRpkdaKzqsUTsNAJfHxXYxGiHj==L7_Brk0tcoH+9VFtvJpKA@mail.gmail.com>
Subject: Re: [PATCH] gpio: xlp: Pass irqchip when adding gpiochip
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 9, 2019 at 3:51 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
>
> For chained irqchips this is a pretty straight-forward
> conversion.
>
> Cc: Jayachandran C <jnair@caviumnetworks.com>
> Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

All maintainers mail addresses are bouncing so I just
applied the patch.

Yours,
Linus Walleij
