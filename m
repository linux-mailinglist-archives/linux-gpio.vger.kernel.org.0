Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 554C764154C
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Dec 2022 10:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiLCJeI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Dec 2022 04:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiLCJeD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Dec 2022 04:34:03 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0710A186D7
        for <linux-gpio@vger.kernel.org>; Sat,  3 Dec 2022 01:34:02 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-3bf4ade3364so71692237b3.3
        for <linux-gpio@vger.kernel.org>; Sat, 03 Dec 2022 01:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fkGQMlu6wKeISp0zA+NNxO3uj0UvahfyytXWgxy5oAU=;
        b=arD8BDwE7ELF18ggu6/9RjwoeoBeB7H0+DwUtSejo+QUHEQbiDhl5V0CuZ0vTGpe6p
         hviivVCkjZoYd3PiKOH/6ZWghRadFalG22ZeSIyVKijrgJxiqaGrN05NEYSUvql2pOl0
         7yJk+iIsmF5I8snfE7ZDtQLoM66T+V9rLh4cBo4Vf2vy4oe0KhJxNVTiQirmga+YYWcd
         l64TvE0bmLdeg8gW04V8XaSzDtQBPmfj8MOuaV9XfDJLH4uykJI/wSQeThYIGP+dyk8a
         WGYau/0LOh43OvwlcTY38Jv4f0H72w4JzqpWEG5PUkxI8YTmF/rAxnMxkxJKf6PY1n5Z
         yjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkGQMlu6wKeISp0zA+NNxO3uj0UvahfyytXWgxy5oAU=;
        b=sA0jnYvBL5XYzWnof37e5VnuyJ6tRjR49mrOA46kilyWQ10fieU5rbykKFgxjZTrq4
         cAbQU97fuDZNVWeoovxvBGszHrkxuVR1lFcpGch8Xl9cV6ygp7mplKhy+V3d7rNsubhB
         p/F0nqARb7iABlINmFN22P3+TmEvU8WgwyIBfsS2nQg3uUfuAHKWLj8Ix9YvgNCOd5IL
         /RjuR60girlENGNp2EsMBeFnHmGop+1/BjqxygVuLVSkqHnk3ul6UwoPrbsWG+C1A8hB
         fhfJBVSO5qdZFrjdRehCD2oqEfJMd2ehMJKGUzn22gVKOO1Mi7Qjylug2X+jYyHIHVfh
         dfdg==
X-Gm-Message-State: ANoB5pne0VCgAKyOxPNUkD+3HWb8ESD8WmDqARtpzH+0ye3cM6Zrpi2Y
        ckQ5exSKUiq+ldPLla/+Mje6VGURSdSslfzwzVL2vw==
X-Google-Smtp-Source: AA0mqf5rx5euZ8EgLbXLgUOq9u5gJklMo7bbGhLHT4FySZEtgNpgveMbe3VSrDmx8xMO3lU2qWmHQ5iT6VRng/f7FGc=
X-Received: by 2002:a81:5748:0:b0:3b1:eee3:32a with SMTP id
 l69-20020a815748000000b003b1eee3032amr43455788ywb.325.1670060041225; Sat, 03
 Dec 2022 01:34:01 -0800 (PST)
MIME-Version: 1.0
References: <20221130155519.20362-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221130155519.20362-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Dec 2022 10:33:50 +0100
Message-ID: <CACRpkdYVU2KJMw=FRxCLXbpWY+42RGheHvnqzg2bo2=JjTRCOw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] Documentation: gpio: Input mode is not true Hi-Z
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 30, 2022 at 4:55 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The true Hi-Z (a.k.a. high impedance) mode is when pin is completely
> disconnected from the chip. This includes input buffer as well.
> Nevertheless, some hardware may not support that mode and they are
> considering input only as Hi-Z, but more precisely it is an equivalent
> to that, in electronics it's basically "an antenna mode".
>
> Sligthly correct documentation to take the above into consideration.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
