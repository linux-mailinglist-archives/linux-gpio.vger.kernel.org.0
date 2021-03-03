Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2496F32C7E6
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355714AbhCDAdI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:33:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239705AbhCCP3b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 10:29:31 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F60C061761
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 07:27:58 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id z11so37664420lfb.9
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 07:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=B7e8ps8+6KgtwjvkMtXtTUb/RUWQBqnIoQ/7yrVtwxM=;
        b=T3smYZREz3wZWOrOSabPyhBR1Ae/LDRY6AZCilnUYUMM5nMBXkOAhVBhw42fX5HQKP
         HhkbLxIvWgFs6YOQC+ZdY2/X2zs5Z+NfwmjNQceUwTVUXN7cJ6mk0kCf9ZguGvQoBH5x
         Ae/DKwVkOz1w8Uu0dg67GrEFQvegQ4wdvkdL7gmrBLyLSS9nt7j3K7AzKPCvW4ucVWEM
         kvYxd1lOv9fT/PQADKysIpq/+1xniWBx+88T8HXNSDCLNva7WKKLWnQKYV4hSR7Y5l0V
         FguLvQybJDffzc496glALtZFHwt74u/lZttgBD+EtgrzIJpxtsin0Gy495PcfYtytwFW
         WTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=B7e8ps8+6KgtwjvkMtXtTUb/RUWQBqnIoQ/7yrVtwxM=;
        b=DUbjCGgKiht8Igxyo9PBgh9nrOYZ1iUb3p4kAkVrsMN7vT8BVw/eScE3hAd1fZCF8F
         sn6hCQkVAK8JhWQx4Qg4bVmfpqGmbHlKLqxezhgSlVirUMdidWErXDEQ4EWRW30z5pZp
         B7pn9+BBIxHTj/v2bKU7ue1ZaohH5aVQFAWYyLRFbd4i6K5ENgfOitPyDdO20sj0FPNq
         d1NmH9MIGAeSO6qAFtvZRZv3pA1CRotpeDK1pe4xa3S3+KbF7iDwln6KaEkNpJxuOTQF
         KYnAr77oa0N17QsWDzl0OI+kvTWlMItskLPb8cGgi8u+aCj0tDoWDMmqZIsFd63t2mWL
         hncw==
X-Gm-Message-State: AOAM533FGbr15+QkVYjZW6AJ3XdCct2z9hg16msnNhEm2cBSGk81MINq
        mZaz2FPA1BV1eWomxcDcsl1Xo4IkM1cER5+CXNFuTA==
X-Google-Smtp-Source: ABdhPJxwSZfkYhtJWwEjy73tyu94P/P5s2En+mmWPKHZ4Ff70sGNABOhy3vBB9KOx8oiJgQnlsb7bBHfgb4lHbxSFgA=
X-Received: by 2002:a19:4c08:: with SMTP id z8mr14810793lfa.157.1614785276573;
 Wed, 03 Mar 2021 07:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20210303142310.6371-1-noltari@gmail.com> <20210303142310.6371-2-noltari@gmail.com>
In-Reply-To: <20210303142310.6371-2-noltari@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Mar 2021 16:27:45 +0100
Message-ID: <CACRpkdb56dB+f89Neuix=KKtAsYSTHKuCifhmmzN7jy2LuUbdQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] gpio: regmap: set gpio_chip of_node
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 3, 2021 at 3:23 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:

> This is needed for properly registering gpio regmap as a child of a regma=
p
> pin controller.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>  v3: introduce patch needed for properly parsing gpio-ranges.

Oops a little bug. I suggest that I merge this into the pinctrl tree
together with the rest of the patches when we are done with review.

Yours.
Linus Walleij
