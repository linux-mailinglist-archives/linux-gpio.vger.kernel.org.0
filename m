Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76BC23BA05D
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 14:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbhGBM2H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 08:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232026AbhGBM2G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jul 2021 08:28:06 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44D7BC061762;
        Fri,  2 Jul 2021 05:25:33 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso9835575otu.10;
        Fri, 02 Jul 2021 05:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=DRbuw8rgidMGROAoVpm9Itgso1lyGyNfopMsnkcsBPU=;
        b=EFj8i/CJ44B2EHoHlAFWg/28irZh9yUSYw9v0AifOS/RmSPhcCZALimw0WXy8WRYSD
         tDiV+uA3pCBrshAom/EBAq5OWrbBZrPCDjfQ4yRB3xPanpPnGmk7sDUX4YjCOfZkQbGG
         orDctSCA/l2l3PVvTo6BPheH85hdnqvVQeFxZfoIaOVATiV48mzaMY402vpEHNeBLRXA
         a5ncZtlanLRrhXOXMeScN5sYySlzXMN+zHIukVvO2ML0g5QRLAslEM6efeFN/WrefBB5
         H8LG7rWnYv0O0bm9gE2BWOpqtyY2ohYwXv8fE172LMifvRjt4muiTZCMEobutobEoJH/
         zDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=DRbuw8rgidMGROAoVpm9Itgso1lyGyNfopMsnkcsBPU=;
        b=ZvHM66cPHtvtB0wv4JYdg6c2eoLPKSOj8NxPYvKjHwycBHWV4m++m50dGei4d8rlI2
         xN5bTMllnmjghj5aI9d8+sO6OOUoA9eSKEtZ7YYYbC7uMMi8Y8LYuylxkAHUqoY64EOr
         bjwm7dhUAqbkI/vaaRqTjHF2P7CpKdfBnnhHPTrbzfn9O+ngNrxNx4H5I+YPj1jIdPTd
         UQwdF6EqyTDPG612vfvNRBU8MFgFBE2zgwGAucKVEKaLu6tmBFMKF2vBhUl8X9YVSjHJ
         E16VQlsPSCF5yVyCf8b9zPqF8t3HlDQxR6powpxly7whuxeQKD4eeWDqk9+9jwtD9XKn
         whvQ==
X-Gm-Message-State: AOAM5320NBHqtAORrcdGFr236LZ+/hPmmOlxJuCSrYd7SnP35AlbU1CH
        RADRko6/KGzLMQ/48UcmM9Os2GBdx/iUw/ANsvU=
X-Google-Smtp-Source: ABdhPJwG/qZB8ofuIUJqrkB85SqVb0LGBHT8T2D3DbOLFrW65X5zHusopxEa5F4YoV4zzg5cMuzZJISQyFa0KpK4evU=
X-Received: by 2002:a05:6830:1af4:: with SMTP id c20mr4126329otd.262.1625228732551;
 Fri, 02 Jul 2021 05:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210607233535.4198-1-chrisrblake93@gmail.com>
In-Reply-To: <20210607233535.4198-1-chrisrblake93@gmail.com>
From:   Chris <chrisrblake93@gmail.com>
Date:   Fri, 2 Jul 2021 07:25:21 -0500
Message-ID: <CALpBJjqfgQ2HfbF2qzGBjoGkq-TiK5rKUvs=cMwaUL7NtkoRrw@mail.gmail.com>
Subject: Re: [PATCH v3] mfd: lpc_ich: Enable GPIO driver for DH89xxCC
To:     ptyser@xes-inc.com, Lee Jones <lee.jones@linaro.org>,
        linux-kernel@vger.kernel.org,
        Christian Lamparter <chunkeey@gmail.com>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 7, 2021 at 6:35 PM Chris Blake <chrisrblake93@gmail.com> wrote:
>
> Based on the Intel Datasheet for the DH89xxCC PCH, the GPIO driver
> is the same as ICH_v5_GPIO, minus the fact the DH89xxCC also has
> blink support. However, blink support isn't supported by the GPIO
> driver so we should use ICH_v5_GPIO. Tested and working on a Meraki
> MX100-HW.
>
> Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
> Co-developed-by: Christian Lamparter <chunkeey@gmail.com>
> ---
>
> Changelog:
> V3: Update commit message format and update contributor message.
> V2: Updated commit message, and added Christian Lamparter as a
> contributor.
> V1: Initial Patch
>
>  drivers/mfd/lpc_ich.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
> index 3bbb29a7e7a5..f10e53187f67 100644
> --- a/drivers/mfd/lpc_ich.c
> +++ b/drivers/mfd/lpc_ich.c
> @@ -489,6 +489,7 @@ static struct lpc_ich_info lpc_chipset_info[] = {
>         [LPC_DH89XXCC] = {
>                 .name = "DH89xxCC",
>                 .iTCO_version = 2,
> +               .gpio_version = ICH_V5_GPIO,
>         },
>         [LPC_PPT] = {
>                 .name = "Panther Point",
> --
> 2.25.1
>

Hello,

Just curious if there's anything I can do to help get this reviewed
for merge, thanks.

Regards,
Chris B
