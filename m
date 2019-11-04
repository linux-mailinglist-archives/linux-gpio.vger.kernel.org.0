Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF7BEE340
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbfKDPLa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:11:30 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39248 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728014AbfKDPL3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:11:29 -0500
Received: by mail-lf1-f66.google.com with SMTP id 195so12498101lfj.6
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oEvOTt1jAa9fKgvvMO6vxhPoOdXXbGBW5hdJveX33Ls=;
        b=L2pOmn+AT8tNWsMvHb5h2yhSI34SRTVIexcoIH46SR/K0d3RJtDArCIGYRZfU6K39W
         YpQbBGzMpTIJ3RmIrZ0GJKDG1WCPtZPJu2CiimFQl0q9ppGxO85lGZLXrRVTszvByHQM
         ZFpPQNlh35Lb8KWt+WbQOuKb0kGHpx0Uolpjhf/ISUfOEtbgm35lZO2YB+vqAARClGqS
         MLEWgtRIma8cdGDIrUERFn6AnbW2TMF1h0MsaHBITG1sZUibatO8DeyKPA7S5YZ96M7K
         XN1NP+UE+u1qMQQ7Xm50z+QygdynIjQXY78HLvBSSaK6g1FYu8UvGkHdmkUCwMYsQQi5
         k8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oEvOTt1jAa9fKgvvMO6vxhPoOdXXbGBW5hdJveX33Ls=;
        b=n7tiOyZwDQHHgQbJYlpNsPqRp/PVo2IUd/9B/8wAhpEQn3i1zNdNL5lcXXIJvpAluC
         sl967Wlu6DRe14UC/4ue/mtH+FqJkyoEgp7j62IAD7jASnQz6Mgm21JvZKVmFMJZtANS
         tjplZo41A4PY5h6LiBJ/r2s/LlPuvwrvTlQVL+ZXZ4NjbZQBJf5wrSLauGxHk0RFeLqr
         22PJkIj/0Wpo5uTr4Cex5ZOCHyi/oJwwAcMC/5/dp4VFOrU9LVRqIEzkAH//wwy4IF4w
         T090OWgLw2DFmdaQHclcwWZph2SmUZTV/R6Xm29OdR75ASwT/sGV36L4s80cNvywlU3n
         GIDQ==
X-Gm-Message-State: APjAAAWxGTpIPXxJfs7jV+yqoiLUkhL53FhFE1Tx4/kExqtNEtHc/Why
        GT+rVoDfJehSGqc5oMEzSD94mERCrLdjhMJyZvBsxw==
X-Google-Smtp-Source: APXvYqw4DowZ2YPMeBlhQo9FcaYGCDWDEx//lCvgSwo4D1s/KcX19/t4dD0Fey5IWRInZYLMWGPNChDYUU3cACpq+Jg=
X-Received: by 2002:a19:651b:: with SMTP id z27mr16913522lfb.117.1572880287473;
 Mon, 04 Nov 2019 07:11:27 -0800 (PST)
MIME-Version: 1.0
References: <20191024122224.11776-1-geert+renesas@glider.be> <20191024122224.11776-3-geert+renesas@glider.be>
In-Reply-To: <20191024122224.11776-3-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:11:16 +0100
Message-ID: <CACRpkdahztuJ6VyxO-ctBF+Ec3L1259SCvJJJ50LRiUG_hrbFw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: rcar: Use proper irq_chip name
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 24, 2019 at 2:22 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The irq_chip .name field should contain the device's class name, not the
> instance's name.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
