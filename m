Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70622243E6E
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 19:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgHMRjn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 13:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbgHMRjn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 13:39:43 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C78C061757
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2020 10:39:42 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id b17so8153358ion.7
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2020 10:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fJOS1TrZWwQOW3YvXUS2j4PHmoPObrPaWXzHVyJn528=;
        b=rv+fnuBnhVlCiggDFQjlmXYdMWcRtVrpOwpGhiDXAWEYGK82VSg7S3MH0RtHH7ykqD
         e435RrfYXT7wmSuJqgPKGcsqjxLif9zDddpYdLL3dMt//04r6wkuvh92XCODFAQWFGj4
         0yipJDnpaBgifbyAqsjOQq8cLRmWm9xhVeCROwu4U0ngrxTFlqEubi6RBoEETFz4FhRZ
         f0Jb6l5P7g2Nv+AlDHvNQZ1OcJNO1p+la823j51HfduYN42YZvcMjwaU6/DfKjk8GDZv
         J4XpzfTkQhh+56XauEABiEsZOs5uLdVdC18Q9ItdCJzoLkzYNdkFV3L5AJQYhzElkCzr
         POGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fJOS1TrZWwQOW3YvXUS2j4PHmoPObrPaWXzHVyJn528=;
        b=O5CqanseT/Ac0Tc6CDoO/x7aZwmKdpUnoQgZGC5IVHHh0Dr7Wv+cD0JSvG8fbwSw83
         K/IzZTiS0xNMs+t2Ie2SEUAC0pWVuHSGCfzmbEi6TZW50jchlGeWaAD4I1vnmHulR5DM
         VN/B3kr4oY8fRfs+5AHifaWTulOT4ENs30pyF/yA/+gQIbTHtKn66Ojav/POAbyYNScR
         AXUI7WP8Qt7Vx40QnvdhYRdR7oSuu+oSZOguSCZimHsBVbSXQqw3nAznAYWxfmVH9l4p
         P60hAJXinjBDN+INH7LToWIgBu86TAwV0rJ8378oI8156hKItk/zvgnCwwfzmve1LAiT
         adoQ==
X-Gm-Message-State: AOAM530Eym7lXblzzDCji6gkHCREDh+xvdTc5/NaaW812yasGlxmzCHZ
        RmOiRKC3jz4omyCgdLhx6rg=
X-Google-Smtp-Source: ABdhPJz3vvGF5/UDyzOMmNtL9g95ltK3uY24vnvvjrJLZEd5h5LAsRQP1wi4weNdjUwa/0kFfX1krg==
X-Received: by 2002:a05:6638:1b5:: with SMTP id b21mr6397685jaq.125.1597340382193;
        Thu, 13 Aug 2020 10:39:42 -0700 (PDT)
Received: from ola-jn9phv2.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id t5sm3033170ilp.15.2020.08.13.10.39.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 10:39:42 -0700 (PDT)
Date:   Thu, 13 Aug 2020 12:39:39 -0500
From:   Andrew Halaney <ajhalaney@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: nomadik: Fix pull direction debug info
Message-ID: <20200813173938.GA6229@ola-jn9phv2.ad.garmin.com>
References: <20200806155322.GA25523@ola-jn9phv2.ad.garmin.com>
 <CACRpkdaiMCgHt8obPV4g7pnMcXWvWKf+KJdQjYp7qKOObQ5McQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaiMCgHt8obPV4g7pnMcXWvWKf+KJdQjYp7qKOObQ5McQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 13, 2020 at 10:06:55AM +0200, Linus Walleij wrote:
> Patch applied. It's clearly better like this. A plain bug.
Thanks!

> Do you think we can fix it properly by reading both the
> DATS and DATC registers  to do the inverse of what
> __nmk_gpio_set_pull() does and give a proper readout
> of pull up/down?
Sadly I don't think this will work. Both the DATS and DATC registers
return the contents of the DAT register on a read, so we'd be back
to where we are without the patch I posted. To me it seems like this
pin controller just doesn't support any method to probe the hardware
for the current pull state. I had considered seeing if this state
was stored in software anywhere, but decided against it since there's
a good chance a bootloader setup some pin configurations as well,
and that would cause the output to not match up with
the actual hardware state.

> Out of curiosity: what hardware are you testing this on?
I have access to an Accordo5 (sta1295 - not upstreamed).

Thanks,
Andrew
