Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4E92074B
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2019 14:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbfEPMwR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 May 2019 08:52:17 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33968 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727015AbfEPMwR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 May 2019 08:52:17 -0400
Received: by mail-lj1-f196.google.com with SMTP id j24so3028079ljg.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 May 2019 05:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M8dIMMLTGG86thIxs/mRUU5bsghAX7RRvWXWnrAvMAs=;
        b=iC9xJc/LqP5wzVxXoivXXOnuzTrrgFiN2GtZrWRT5bsmasTGCrg1mUFbsRM8/yJ8lE
         Chia4VkQR8GHzZ1wp3SftBAPhcf0/0id8JlaHJajgdxXO4Fo/NfHfxfwZJhaYduFdKPz
         oX39O8pOX2C1YCZdt6Z1yL8eTySL64PduJAGls98JcKwJ8XtPpYNUuaPXVGg3C+bqQ0v
         G+dFQh2qz/jUZKW5/q6RWlhrG4KOpDKiBtPFLz8HkLYufM8kTyzHmC0u8Gzu6hbq2W2n
         RnAB8XpXl17EpT/Wkex+RjpHiNP90Y5JpsNjFtK5hVwJ2oSDKVetXxS0UvIQ5qd2tovw
         qhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M8dIMMLTGG86thIxs/mRUU5bsghAX7RRvWXWnrAvMAs=;
        b=eDww/c9QX8rtnguaNE3kRRN/tfrGBc+Nosyklvucr2nXgdFkcNgqYtx+mkoBm8t/sI
         i31yt3QWufdF2pCfqre5WSdr9udxhJwtCe/6hRHsWhwyNwH7S0HuMs+6UEnHODgZ0Z8g
         iIVWRfqAu+W0j6czIrwBgL6rYzyGpXKSvukP+JKkzhFn1wVB1xE2SXqaEVKuy405+QXe
         HQuMHg1HnZihY2rc0Ua6IBAjUkGr4ASopAZR/4qVtb2jCFBE3GTRBxlxohucFXlY/TfP
         x8q1j+7mg71EUz/nANIsrS9zQ5l4EmQBGmqUPzkKel3M0rM0m7MI3D3X4OYXH9cchacu
         UIVQ==
X-Gm-Message-State: APjAAAVX2tmjicLU/FaDLY0O2ox+szZ6nRoPeo6Hf0EVe3/cQCKyz/R7
        QIyQf7HGY33X+V2rhTf7MVxUx/MgVIjREHlDip3sJXmM
X-Google-Smtp-Source: APXvYqyKQvo32z2nDVQNlGDeWm4ClSjw2DAn7P89XY+RzmdqMHft5SDvxQb/j4IO5PU3+gOiYdzXt4I8x6QxAuXOZMU=
X-Received: by 2002:a2e:731a:: with SMTP id o26mr21431284ljc.105.1558011134949;
 Thu, 16 May 2019 05:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190514082652.20686-1-glaroque@baylibre.com>
In-Reply-To: <20190514082652.20686-1-glaroque@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 May 2019 14:52:03 +0200
Message-ID: <CACRpkdZ+p-J5Em3rzZcUwpA-a+CVOY91CgLqoRm_QVZP6E4Osw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] Add drive-strength in Meson pinctrl driver
To:     Guillaume La Roque <glaroque@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 14, 2019 at 10:26 AM Guillaume La Roque
<glaroque@baylibre.com> wrote:

> The purpose of this patchset is to add drive-strength support in meson pinconf
> driver. This is a new feature that was added on the g12a. It is critical for us
> to support this since many functions are failing with default pad drive-strength.
>
> The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> 'drive-strength' is expressed in mA.
> So this patch add another generic property "drive-strength-microamp". The change to do so
> would be minimal and could be benefit to other platforms later on.
>
> Cheers
> Guillaume
>
> Changes since v5:
> - restore Tested-by/Reviewed-by/Ack-by tags

All 6 patches applied for v5.3.

They will appear in the tree once v5.2-rc1 is out.

Yours,
Linus Walleij
