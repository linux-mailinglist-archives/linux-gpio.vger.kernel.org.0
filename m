Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF0C4A32F1
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jan 2022 01:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353616AbiA3Aq7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jan 2022 19:46:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353615AbiA3Aq5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jan 2022 19:46:57 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 037AFC061741
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 16:46:57 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id j2so16367847ybu.0
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 16:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KAfmV2XPrbcMqVhndkzGzY+w8H1ibzDYb+Ml7huAryE=;
        b=NaWg7ApeC09EQY/CJ/W25ZLJZoNitSiYuPfGysObv/UTGU9NUNdCXb1DdSbEZodzye
         IH9OGfSiUYJWivIhzwf/P0P0pqKMXrrtBUTsAwI9HQZW8hUxoSZj3j18sLTfxl5iZjxh
         o84foTOSgqeFWKqUfUSoKSAosOYXr/Al9fUg3IDcM7+pIgrhM6cJ+t8ogReqnXeIf8vR
         2/a+8UcnpzyZ0reNAfhX/opnTfQEXw+5IQ/FztUpOP0HA+bgwBHru9uRagVYZTEs3L3C
         uW4fdpqSBf0N0Yp7TzqcAB+sRrSlp21Zsi90wtzXJtXRJ8+oWx5NkXiMSQmWDsgTREtx
         hD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KAfmV2XPrbcMqVhndkzGzY+w8H1ibzDYb+Ml7huAryE=;
        b=QIwKB2LIVhlJaaIkvjWDDncr6UtJyxDDzHl73iJCs8pKYuznukQyj+bx7R4en/qlER
         bedduI5yKGiF5BWQYY1cmljtNqlcR5YbdTznhau8gQ56zzik2pIg+0FgyLqJrRJgDVUd
         7Bh7tTVibIni5PbURIlErbpTbRP2rzxw8gthb+2Ie4Kckrll2bjNtLPokGop4O6RVl0S
         9sBhJxTGCLFlAICT2tPJ6i/bo2x2ftVP4U8iNZeoT36FAlcrJzSNiI8ZtoyYSwKep6dC
         +JnQVza7+ikG4dz9jvD4vEHJD5MP/e88rBjy21F9HA01M7YDEUSOFq22FNMt2/4aHAW/
         PMJA==
X-Gm-Message-State: AOAM533XF6kRNdXUpJiaoAFlJSDWSVZMYyMjC3U+cyvQhf1uhhbSt2dy
        p1V0ebKNqJKwoqU9xuNHgNhPiTT3Kuc8AbUSyRC7gQ==
X-Google-Smtp-Source: ABdhPJxgbS1t2Nwj6sfn6p8sKTS1bE8L273N6tr+1TJqhugSlRrkIMo99/GZ+xiBo52oNvQ4sJbVps16o+lrp2z1cBE=
X-Received: by 2002:a25:5143:: with SMTP id f64mr23512899ybb.520.1643503616244;
 Sat, 29 Jan 2022 16:46:56 -0800 (PST)
MIME-Version: 1.0
References: <20220120150024.646714-1-paul.kocialkowski@bootlin.com> <20220120150024.646714-5-paul.kocialkowski@bootlin.com>
In-Reply-To: <20220120150024.646714-5-paul.kocialkowski@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 30 Jan 2022 01:46:44 +0100
Message-ID: <CACRpkdYNCpPUpJmbXNteEJ3kPkLQCMCcBezj8oYhwRZvmA-Vqg@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] dt-bindings: display: Add compatibles with major
 versions only
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 20, 2022 at 4:00 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> There are lots of different versions of the logicvc block and it
> makes little sense to list them all in compatibles since all versions
> with the same major are found to be register-compatible.
>
> Add common compatibles that only list the major version instead.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Same comment as the other binding patch.

Yours,
Linus Walleij
