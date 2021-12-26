Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 306E647F500
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Dec 2021 04:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbhLZDWz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Dec 2021 22:22:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhLZDWz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Dec 2021 22:22:55 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F39C061401
        for <linux-gpio@vger.kernel.org>; Sat, 25 Dec 2021 19:22:54 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bq20so27141480lfb.4
        for <linux-gpio@vger.kernel.org>; Sat, 25 Dec 2021 19:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=I8AJayi9PGQ3WZvoNgfo1/Nc9kFUTQh1SW9tNJODLyY=;
        b=evrbI8saLXCo5GQpunQE/mmMgIUEoIF7Lk9V6MKQymlxbDJDSLmcttzaZWf8mQe/WW
         lgcC3geeFEdBH+3Fic9dBRBER+7vRgS9w57osrjM2Bt3X9uXXxs7OHAjQxopiqKU7FLx
         41iCZsCvmhjVRWyid2tetSD4HiUnkHFnzbsybakfdAoTT7VEkQoQk8zoHf9V11M/h5k+
         R1t/LkEkiNkH25dmOPy2hJPMQEmCUaMo9BEz+jvqyG+W2gqlS6eciFFmTKFJs6RjaP5t
         SQ4+Bta0/uHtcZ6qQVUIga3IrtRcfj1dZ9wjh+uUHjNskV6k1fB8uYs0yI/ZXhDKRyzv
         qt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=I8AJayi9PGQ3WZvoNgfo1/Nc9kFUTQh1SW9tNJODLyY=;
        b=32ZAhf6lC7aDngdNCGkjhT6Fu7bWgLtFDCGFm25oRa3z8a6iCZ2LfIW79Nb3WPxVjk
         e+i1F+MSHEZAtshbCM0QTKUxl/z5OWNbykpJ+xYsXL68c6z/dtBBBgqzz0iYiegDQfWR
         02f4g4u5YPwLqG9uRayJKCUI9Y+SR8V4LMFyqKd9+cUuBbN7BrCjnogUEq+atSKXf4ha
         BUj7V0qhoSIHa1wDIfDmkLcjdXr7OJe+9wvI6T3afx7yujQ8ceJMv1cMMW3FXTVq1tXC
         MkWcVw+uP13vKkWixsUfsYU/8SbNuK815MldEd6WWdJ5L+IkJZKfQl1V+/Y60xLhIYLN
         ZLQQ==
X-Gm-Message-State: AOAM531y6fsV8AahRTO7CiqKeawq9CAtzK6G1MmI+6XElzzZBv4kptCS
        kRSdid40zZYNDdBhhXE6b0JD5CZ7wRVnRowO1mh2Ag==
X-Google-Smtp-Source: ABdhPJyUSVqIfwJw9lj1hQWCye9vKRuzrfKncMGGtXyo481HJs+ex3Z7K2NAVOYBGwSvGyR6CdFjyGVNl20LrtfyniE=
X-Received: by 2002:a05:6512:2601:: with SMTP id bt1mr10424143lfb.400.1640488972568;
 Sat, 25 Dec 2021 19:22:52 -0800 (PST)
MIME-Version: 1.0
References: <20211117130840.975-1-zajec5@gmail.com> <20211222064344.14624-1-zajec5@gmail.com>
In-Reply-To: <20211222064344.14624-1-zajec5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Dec 2021 04:22:41 +0100
Message-ID: <CACRpkdZc0yLQ7vz9C-SdQWf+=_7Ty3cXdQMRu40XRcm166zTLQ@mail.gmail.com>
Subject: Re: [PATCH V3] pinctrl: bcm: ns: use generic groups & functions helpers
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 22, 2021 at 7:43 AM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> This simplifies ns driver and gets rid of ~70 lines of code.
>
> "const" had to be dropped from "struct ns_pinctrl_group" @pins to match
> "struct group_desc" @pins and pinctrl_generic_add_group(). Otherwise it
> would cause:
>
> drivers/pinctrl/bcm/pinctrl-ns.c: In function 'ns_pinctrl_probe':
> drivers/pinctrl/bcm/pinctrl-ns.c:277:13: warning: passing argument 3 of '=
pinctrl_generic_add_group' discards 'const' qualifier from pointer target t=
ype [-Wdiscarded-qualifiers]
>   277 |        group->pins, group->num_pins, NULL);
>       |        ~~~~~^~~~~~
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

This v3 version applied, nice work!

Yours,
Linus Walleij
