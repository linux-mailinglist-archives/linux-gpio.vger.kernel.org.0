Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22E053A3A57
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 05:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhFKDl3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 23:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbhFKDl3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 23:41:29 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B426C061574
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 20:39:32 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id 11so2124759plk.12
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 20:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SxxbAF3jaVNlurlddu+dUL7InQzwoLHvI2QS6L1ZxjQ=;
        b=BpsBGYsc3slgoB7ffao6X7asqYsjp6NuzRTK9sRNfRDGAbKOJwOk07koFr9cSJgJ1C
         zS8/elLhYZqjTn0hueib/5CkQFqxhqrPifwrvceCqxnNzhyBJEiHX3W7ygy81esbwu5s
         376cXmfHLiodod8ml8ifkYZOjjUdjM40YhDqma+KYO8E+xQri7K0gPITGNhSAm3NzsNi
         8fCJZQhCwz7zmobOpFIGlF74GGeYtPKcp58AG0VXzkLrXtTYAdbCtB/Xwldi2L+WI9Wg
         50QyhP5Nenm9EFuqhKd+Ah5wMUf4Hzf2o/iiCGHwr3AgeHXvgqqNqbO+A9DDZfBiHpu2
         uUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SxxbAF3jaVNlurlddu+dUL7InQzwoLHvI2QS6L1ZxjQ=;
        b=eZAjxierVGWCUDMwcHUkOW2N1uiHd85W3r5hDlYtNvzxQlJ0id1q6iR2lVO9N8ND6s
         NnW35lNyjWLL7hH/c6YGMKOKE7HMSPAZAFkkbwUpywfOP9fzK32oqEMtioLCiOojSQl1
         6mbR62MVYgmO+E0JiCbipJXnS+Ks1hloqKvO4VQhQaRerfh0Hv2Oq+oSufo4mHP3fbcb
         jwwfhHsppJyRPv8tBaI3SRtWuphX9TmlkVwFQfZALjq/jZiYUgPJwFEAdOlGxNJ2kLZz
         Q7RDBguHCc6XH64Qogx+fzLUnP9prUvBgOH6atRXVdJC/Vv8hKrFL75aBsBIkztIh+zt
         y4kg==
X-Gm-Message-State: AOAM531dbBeszlRBQM9Og/xFMA2uK18m20MVNDp3PJ/QdwQUSJzRygdv
        /5kpKoY5ZTr8ALA7+Nu2DuxnVCpZ4iY8kQ==
X-Google-Smtp-Source: ABdhPJyAC6rOPaOUyj6eu7wayFUFCspO1bzWLoCbHm6Ga4Glw+eFx85c6mzvlktHCLQ6inn1YqD6Dw==
X-Received: by 2002:a17:902:8e88:b029:ee:b947:d7df with SMTP id bg8-20020a1709028e88b02900eeb947d7dfmr1954566plb.48.1623382771923;
        Thu, 10 Jun 2021 20:39:31 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id p11sm1342742pjj.43.2021.06.10.20.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 20:39:31 -0700 (PDT)
Date:   Fri, 11 Jun 2021 09:09:29 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
Message-ID: <20210611033929.ifnafw2gznjklnq2@vireshk-i7>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <01000179f5da7763-2ea817c6-e176-423a-952e-de02443f71e2-000000@email.amazonses.com>
 <YMJOk6RWuztRNBXO@myrica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMJOk6RWuztRNBXO@myrica>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10-06-21, 19:40, Jean-Philippe Brucker wrote:
> On Thu, Jun 10, 2021 at 12:16:46PM +0000, Viresh Kumar via Stratos-dev wrote:

Fixed everything else you suggested.

> > +struct virtio_gpio_config {
> > +	char name[32];
> > +	__u16 ngpio;
> > +	__u16 padding;
> > +	__u32 gpio_names_size;
> > +	char gpio_names[0];
> 
> A variable-size array here will make it very difficult to append new
> fields to virtio_gpio_config, when adding new features to the device. (New
> fields cannot be inserted in between, since older drivers will expect
> existing fields at a specific offset.)

Yes, I thought about that earlier and though maybe we will be able to
play with that using the virtio-features, I mean a different layout of
config structure if we really need to add a field in config, based on
the feature flag.

> You could replace it with a reference to the string array, for example
> "__u16 gpio_names_offset" declaring the offset between the beginning of
> device-specific config and the string array.

But, I like this idea more and it does make it very flexible. Will
adapt to it.

> The 'name' field could also be indirect to avoid setting a fixed
> 32-char size, but that's not as important.

Yeah, 32 bytes is really enough. One won't be able to make any sense
out of a bigger name anyway :)

> > +} __packed;
> 
> No need for __packed, because the fields are naturally aligned (as
> required by the virtio spec)

Yeah, I know, but I tend to add that for structures which aren't very
simple (like the request/response ones), just to avoid human errors
and hours of debugging someone need to go through. __packed won't harm
at least :)

-- 
viresh
