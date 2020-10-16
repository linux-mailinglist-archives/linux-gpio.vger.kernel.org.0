Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49602901D9
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 11:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395257AbgJPJ3P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 05:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395037AbgJPJ3O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 05:29:14 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3569C061755
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2020 02:29:14 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id r4so2981347ioh.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2020 02:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kX2RZKIYQcCX3YfXE2GoP/GQ7ec/Iro+3ntpFMdrKsw=;
        b=tbzzuqGFjVKzIcZUeBswJ1KPnrm3CCGyb9PJlpgqjECOLszlTNgZObe413X7cF57Lw
         yhWTjZqVT8JhmnXYhEF9C9bFmlQu6hZIU+zLlKNhgb1Kis7es9n3ug7XHqpOO/lbtpCu
         4pDZo4zOilW7EAMobpbtXjhWUptnY0wdR1Ml4w06/EuQbWIg3DZoQNI+1d75g+6G3xRP
         j0VSuYZjAZTbMAGEsFLjZGWUsvT0g2jHFKJ63sguwJnIsZVfGg2HCbAYtxREEk191k+Y
         uXWHPA5W2hnLv9equNHKyGi7WGDve+khb0i0lTMdcDBFXwI3NCbQGDYSCmVTt4kyXx68
         hsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kX2RZKIYQcCX3YfXE2GoP/GQ7ec/Iro+3ntpFMdrKsw=;
        b=lBRfc9Yu1X8OM3rOhrweZXKE4Ij6rkK8ptZn6VsmiCyyEJ8pNRfxB8KxKB39+ol9BS
         7SbXgba9HA79AOWfrDPr+xMat520U/mepKqt93TZzF66NkQ9UZuDKq/W0D3yMnKGbocW
         PwFuRurxupTrsJYNjEK4JWyrdw/X9crGtOkMNMRegfli41v8hR1pM/KF8At1cIk4TrFX
         Ojw1WSKqAvBET9H39Wi0koY07MpyxMKCfnLQizw40zS5GBFrh+vWc+SCSJqO1rjvqB11
         y4GU9QKHTwbUGG29J0xw6vBAc2dRfcjYmsB35xOy3Omf1Ufl3ssKgzU3bDNkEqfGKvb7
         Ew7A==
X-Gm-Message-State: AOAM532t9IkGzMeU2CoSHi1UmiLpDX/GH2E9bcDehaE/qOi3kVjDPxWK
        WNSjnFiRB/CXzHQiyoegeJ4UqGoQrcc8N75ywNjKCg+0u9epHw==
X-Google-Smtp-Source: ABdhPJwBKsvaaXBPOCBm26YJ8BzUB52x6Ou29oYxnOimfL4YreklIk8rd0f3z61Cx8bEgqrwGDpmqmfXc2wQxUyrTA4=
X-Received: by 2002:a05:6602:2b90:: with SMTP id r16mr1722535iov.31.1602840554090;
 Fri, 16 Oct 2020 02:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201015175235.1054316-1-marc.ferland@gmail.com>
In-Reply-To: <20201015175235.1054316-1-marc.ferland@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 16 Oct 2020 11:29:03 +0200
Message-ID: <CAMRc=MeetMufvATVrL=N=vPu1+QyV-7zEF+awYV_CUseycPS2g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] doc: fix typo
To:     marc.ferland@gmail.com
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 15, 2020 at 7:52 PM <marc.ferland@gmail.com> wrote:
>
> From: Marc Ferland <marc.ferland@gmail.com>
>
> Signed-off-by: Marc Ferland <marc.ferland@gmail.com>
> ---
>  include/gpiod.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/gpiod.h b/include/gpiod.h
> index e684ab1..8b7c619 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -1057,7 +1057,7 @@ int gpiod_line_request_both_edges_events_flags(struct gpiod_line *line,
>   * @param config Request options.
>   * @param default_vals Initial line values - only relevant if we're setting
>   *                     the direction to output.
> - * @return 0 if the all lines were properly requested. In case of an error
> + * @return 0 if all lines were properly requested. In case of an error
>   *         this routine returns -1 and sets the last error number.
>   *
>   * If this routine succeeds, the caller takes ownership of the GPIO lines
> --
> 2.25.1
>

Applied, thanks!

Bartosz
