Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19AC22686F0
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 10:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgININK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 04:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgINIMp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 04:12:45 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB0FC06174A
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 01:12:44 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id gr14so21952259ejb.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 01:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xyX9YH+foI370Pr3Pw1CsJy8z4MLVV/9uEf/eBEvSlE=;
        b=blLntvHXewjeBBTvp+O8pC+3tao+Cs8IsaTzquYtIFhxFns1NTWbvyESXmKHEGNVU9
         M0Be+2tmk8AAmMXiSvH0oqxQq7+BQ8n/qlvsfrlPeisUaeH9n3nlENCtcPeM9VuvSqDS
         X/hzus2qUSuOuaww03AouYHCj+5xrMiGAGsbIlDyJ9XTFtlSyl431I9bzw6u61x11wtR
         i6456jKa9HtoTL8+5ed8DMIO7OGyma9CevwJF9oI3PutQzCpdwRQ81vldn/v7TpM+Y5Z
         pA88LjDMDn8KshU4JTvcQyWnfti8439oMcyr1RffNWaPRDEv1BiH/WZCLKvxlB4VFqPH
         Av2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xyX9YH+foI370Pr3Pw1CsJy8z4MLVV/9uEf/eBEvSlE=;
        b=cdvr68JxM7TzJTygY6I8T9sPjwo/HJFPtnR5WZ723pStv/H15swgeI5tJKvJs0rroH
         Lf4NNpwfcrFowNF9UW9JKJ7WYsxvHtggKjipsb4IUlqwHFLHAZmaUs+t1dV95ookoOgU
         9e980qCi03pONFAlKPk2drZlPBySmiSeGd9PI72XBh//xjSvkFOvdJ47yq71xrinI06Z
         g7MAd3/IkE31akBEOWw1+isaWZUNHkyuofbgEpZB+vMxmc7v0c/ystt2j7DcVU57F+IQ
         V7IqQpiGCkohxdREjtxu4PFvooXnKVfVyni1IAbI//G3MyiY9oxh0qkbUK+2CLwuHFp4
         opaQ==
X-Gm-Message-State: AOAM53237dlbTmvPLfVWYM2NqvYKkF5HOEv63jxp6li4Ovpr1uIaPx/U
        mryZuNRHHHQ82QE4Hst2AFffnW0RNN0jSOx/4N7SdGMXPYc=
X-Google-Smtp-Source: ABdhPJwBEN5koIgsqIiiSmI/OShTZsWEiIqAnGNBN7FnelbEgROGtj1/uxRa1AnjKx2KsVXV0f5dD122ewHH8mtC0LM=
X-Received: by 2002:a17:906:11d2:: with SMTP id o18mr13177665eja.420.1600071163335;
 Mon, 14 Sep 2020 01:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200912081105.1615496-1-warthog618@gmail.com> <20200912081105.1615496-3-warthog618@gmail.com>
In-Reply-To: <20200912081105.1615496-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 14 Sep 2020 10:12:32 +0200
Message-ID: <CAMpxmJWM4UZ2iDO047-H7sMeCR0BD2exmiMFo3=eF1UmYJZkQA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 2/2] core: fix reading subset of available events
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 12, 2020 at 10:11 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Only read the requested number of events from the kernel rather than
> reading up to 16 and quietly discarding any surplus.
>
> The previous behavour is particularly bad for reading single events as
> userspace must read the events as quickly as they arrive, effectively
> negating the presence of the kernel event kfifo.
>
> Fixes: 44921ecc9a00 (core: provide functions for reading multiple
> line events at once)
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  lib/core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/lib/core.c b/lib/core.c
> index ad76051..b964272 100644
> --- a/lib/core.c
> +++ b/lib/core.c
> @@ -1090,7 +1090,10 @@ int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
>
>         memset(evdata, 0, sizeof(evdata));
>
> -       rd = read(fd, evdata, sizeof(evdata));
> +       if (num_events > 16)
> +               num_events = 16;
> +
> +       rd = read(fd, evdata, num_events * sizeof(*evdata));
>         if (rd < 0) {
>                 return -1;
>         } else if ((unsigned int)rd < sizeof(*evdata)) {
> --
> 2.28.0
>

Wow this is a bad one, thanks for catching this!

Will apply shortly and backport it to stable branches too.

Thanks!
Bartosz
