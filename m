Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3795E30020C
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 12:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbhAVLyQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 06:54:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727723AbhAVLx5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 06:53:57 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C98C061788
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 03:53:16 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id hs11so7291475ejc.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 03:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JI8WLVbmTizf9gTslSutB/gV1a/YA//GFzXlgB2oB7E=;
        b=oCPusnLDZ1GFf67rgHfmnbKLh+PChkBrgKOTG8sqNFuDl0/TsMm3u37AqTy0h+cqO8
         vo6M5TujMabCxkpWsYOK1fMlTtdfd697cf74nlCg/C7dnFFfN+xgVrwdROsY6y8wnErv
         ArByyPUktA0kYQ84c7Dp59thGX82SnDzTNi2VhGjNpkGdBKvd9DOnSSGi9jUP1arNIQb
         SavkOW5VDQIuN+Qu0u/I2FuCPtqsec3PMMNWYmEf/95uQ6Zhzu6G10HYw3vjvxleqaPV
         E9ITAn5SOl4RJW3TRnPfgCHhewmSQ/68mJPxMWsYSdTIsv/gqg+/cHy7hnz7JDuyFubC
         Matg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JI8WLVbmTizf9gTslSutB/gV1a/YA//GFzXlgB2oB7E=;
        b=aQpEC4vw7YE8ZQET9xF0hV9Zj27hiTrTWUE2M4iZqetoICqir0I1rx5oriBLLV3hP+
         BJaq0U8By1CkuQgTywnFhiyvLRcZfyN85dYU1flg0clU0RId65krQ9eM+8BMidplKSMH
         Q6G4cszkSeum5HnKWj507m/apVQIAHJqwXXSitsc6awZzGIOHuijuusN5bgnhEXv7G9c
         6udCSBbA0NQ3e0l20qcLRoEygm7wv29aP7AHF2VlDVKvITOx8rHKA5zOnvL+k3VwKt4B
         cHE182GoB9fYu4gKHc1fRCGMUqCLZ2IXSs/YkCTVNorKVhdjKZa/jMbr6LUl7BQmp7Uz
         9CSw==
X-Gm-Message-State: AOAM531gwzGPOnRG6IArciZuPezoYFbgKnP04qRYEunQbIMODgYO6PwG
        5dVtOkNF7LGis8274O9WpEtnznsemQ+Wx4a5S/z4/Q==
X-Google-Smtp-Source: ABdhPJwpXAHlvIudY/PzJhYC6GZ4zseMiiZNvSTQBAdAxIJDPQFnyQBOSXvJgQqYMjN6/NzK6L1vwB6w8Q4hX0pZqcY=
X-Received: by 2002:a17:906:6846:: with SMTP id a6mr2698616ejs.470.1611316395273;
 Fri, 22 Jan 2021 03:53:15 -0800 (PST)
MIME-Version: 1.0
References: <20210113194952.104734-1-u.kleine-koenig@pengutronix.de>
 <20210113194952.104734-2-u.kleine-koenig@pengutronix.de> <CACRpkdbVKzE_pe0mPb4H2c0RVJGxEtiFEfMpTCoEO+7qdVBHFQ@mail.gmail.com>
 <20210118145721.6puoqfd6jx3x76jh@pengutronix.de> <CACRpkdY03=pawFPJqxwfdxL=dUUDOVvcpt+s+qTHfa9Wg6-eiA@mail.gmail.com>
In-Reply-To: <CACRpkdY03=pawFPJqxwfdxL=dUUDOVvcpt+s+qTHfa9Wg6-eiA@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Jan 2021 12:53:04 +0100
Message-ID: <CAMpxmJUjFyyuqHseyfs+sTivPdx17u-XJt53nUWp0zuW7Uwhpw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: gpio: pca953x: increase allowed length
 for gpio-line-names
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 22, 2021 at 10:50 AM Linus Walleij <linus.walleij@linaro.org> w=
rote:
>
> On Mon, Jan 18, 2021 at 3:57 PM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
>
> > Who will pick up this series (preferable v2 instead of this (implicit)
> > v1)? Will they notice this Reviewed-by?
>
> Bartosz is collecting GPIO patches to Torvalds for this merge
> window.
>
> Yours,
> Linus Walleij

I already have v2 of this series in my tree.

Bartosz
