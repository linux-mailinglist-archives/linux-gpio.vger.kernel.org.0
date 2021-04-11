Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBDC35B46C
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Apr 2021 15:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235535AbhDKNAW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Apr 2021 09:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235483AbhDKNAW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Apr 2021 09:00:22 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC665C061574
        for <linux-gpio@vger.kernel.org>; Sun, 11 Apr 2021 06:00:05 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 65so11917071ybc.4
        for <linux-gpio@vger.kernel.org>; Sun, 11 Apr 2021 06:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1D/NZaQrODriWdgxS69yUjmJHum4ME8GOKo/lbq9TW8=;
        b=cQtAvEYn9OCsL1LW5CtDebiXiJDG1PVTKA9AwlWGDvaor3jmb3843CZq5Basm78XG7
         G52PXeJWQ4pVtfws/W15yR/gjIxW/mgOQyrIdYlVzOAs4lee8dsV6hoJQ7RkgAYmqUum
         OkmtLYXFF5wvSRihO/wYBr2jzgjN0TfLUupmOSJcWVsrUUaoMxzIXHGE2bGFAX1OF6Zd
         vJLE3pmyNTae4Hj1gUG2DgzEy5eEU3KZnNGLnq21Xok0ElsDR31F8sxDEGDkNbufKQkC
         /vgn0kR6vV7++OmQlTqHn4o4dUfNeNtI7bG78hwRMI65I5arH47M6tWZKWuuoVTwVnUa
         Sqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1D/NZaQrODriWdgxS69yUjmJHum4ME8GOKo/lbq9TW8=;
        b=IXD2MtMhSPQrpTY4av8ASofwXeI6Kb8aJEG5RhEuNLeaQuLuhu7L3+tJPOQHdc2I47
         LQ/USp69F4j+Z/5onznFk2laLhHidOBhqft2QW4FEY475eSG93sxtdvtrne2UEHCoRmx
         wqtyuGjl0BlGPBDhJsoKFoZEGauK9FCfjzdgSm5c+s4yggaPL+mjri6PP9u6cdN3hS14
         i+0Xidd0OGX110TbbI5pNVpDV6vbXrHdd6JfMruyBR3N9wt4U5wdo70UZSoyyFcgzDoC
         aYto7p30KS3OtfN+PvN2+F4HUrAdFD01x8MgegRlbGf7VDyCUnRhmyxQrFlBElFWzej1
         4AEg==
X-Gm-Message-State: AOAM530goaegsfQvSd30JK/5YjdgazKqjuVoFJopXN4yoaeaplMsS5FL
        Rn+6ZRWF0IJASHkxymhbOK05Iaqf3ovycMFSShorlA==
X-Google-Smtp-Source: ABdhPJye5Ty8OxuNQMJRe6h1haYpe3oaYdKnacC4pzD9MpxefH1BO3fhBxS3hdokzIfZsMAw12tUuj+ql0FQ05mrvGI=
X-Received: by 2002:a25:d152:: with SMTP id i79mr6159519ybg.469.1618146004958;
 Sun, 11 Apr 2021 06:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <df145e77bd124721f28cbc58fb3c58c138f13d86.1617365710.git.geert+renesas@glider.be>
In-Reply-To: <df145e77bd124721f28cbc58fb3c58c138f13d86.1617365710.git.geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 11 Apr 2021 14:59:53 +0200
Message-ID: <CAMpxmJWNK+30EkHoYo40XdNuLqyRS+sRMy9RvC9T40N58S8wMg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: fairchild,74hc595: Convert to json-schema
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 2, 2021 at 2:20 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Convert the Generic 8-bit shift register Device Tree binding
> documentation to json-schema.
>
> Rename from gpio-74x164 to fairchild,74hc595, as the former refers to
> the Linux driver, and not to a hardware name.
> Add the missing hog description.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Patch applied, thanks!

Bartosz
