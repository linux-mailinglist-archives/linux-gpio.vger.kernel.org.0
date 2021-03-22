Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4786344A00
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 17:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhCVP7n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 11:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbhCVP7i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 11:59:38 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27460C061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 08:59:38 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so11450893wml.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 08:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=viDZfFbh21Aem2yBx4DgBC8S/pgSxRyO6yayHGA/6tE=;
        b=NNFqJUo1t8uWjd023+ThGn3q2m3v9fUxmiQwEpM+ZvH32LutwNIJp5O5aq0J+lbnWw
         71gIRbmYEoh9JBBYyl1O7e4ex/wxlloW0/eTH2SuZ6hJ5scAkvUbuoHnCxZLwiNYW7cT
         Egb7Qvcq9GS/qICVA3264hgpyGdzACVGP7fo/7E4S3CzIOjf9PkeEUqLdQbfWPxb1g43
         lBP7kjM4H0F/FDYy3Cdc1Fu8t9T42hVpkmbixsQIIVxUX8TiuDH4frGLyQwZdjCb4N9H
         wdkWl4/QJIkxfV4EISuo6HedvN/YBrUi751i7WvCmmBNnpy7J26eFkDsf+iEhwRpYMRO
         8Xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=viDZfFbh21Aem2yBx4DgBC8S/pgSxRyO6yayHGA/6tE=;
        b=RcGsO1SgM8p1/38RJ9eO/MuMC0/aUTOMZvvyyVjNZdn905ZAOJzFCfLvR6L7MMOPBQ
         KnSs+Qk6GBJbCZnbCOcA1hbH+TQ/O0HNJk4utiUcTJfaMpVX9SYJOqg2iww/1umUqqzo
         YBv6KpfP+Ncrr8RKFJ6KJL/Heo9PrDfJG47fBYxJKHx5WtMEixKAiViMrSrVPPRKbdz4
         hZkbM8tPBL3EoB1WiTWp7hhI+r6ICv/F1hkXJ+jNbTV8w9RWa1J3rvFD9y/Mgy80xhnA
         +fIXW2fXoiHri4l23h/1ZObt0g7OnmXoNeGeq/A5k8JRTiSQ9Yo+SN/EWUx4wjj+ZJIq
         /t+w==
X-Gm-Message-State: AOAM5330QvfzAwkazU0uBewKu/hSDOFNBztQCiR6utrR2xRqbdHzEJ5I
        HYjj4ZilOa54vvkgNZbBFK0=
X-Google-Smtp-Source: ABdhPJzSDYDZKZFKPKYWytcxKYlh6TnF5hmw09hWuPSOMJRvTmttthAfiugvRh/TrChUc0WMo5jHog==
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr495775wmj.104.1616428776934;
        Mon, 22 Mar 2021 08:59:36 -0700 (PDT)
Received: from [192.168.1.21] ([195.245.23.48])
        by smtp.gmail.com with ESMTPSA id k4sm26240845wrd.9.2021.03.22.08.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 08:59:36 -0700 (PDT)
Message-ID: <01b4dedd0f7efba749ebf598925886a6a69d5b41.camel@gmail.com>
Subject: Re: RFC Need advice on reworking gpio-ep93xx.c to DT support
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Hartley Sweeten <HartleyS@visionengravers.com>,
        "nikita.shubin@maquefel.me" <nikita.shubin@maquefel.me>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Date:   Mon, 22 Mar 2021 16:59:35 +0100
In-Reply-To: <BYAPR01MB5621E8956FDBF8F194ABB598D0659@BYAPR01MB5621.prod.exchangelabs.com>
References: <1042421616413081@mail.yandex.ru>
         <BYAPR01MB5621E8956FDBF8F194ABB598D0659@BYAPR01MB5621.prod.exchangelabs.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Hartley,

On Mon, 2021-03-22 at 15:43 +0000, Hartley Sweeten wrote:
> > Showing only ports A, F and no interrupt capable C:
> 
> Are you just going to drop the other GPIO ports?
> 
> The EP93xx has eight 8-bit ports total (Ports A-H). Only 3 port support interrupts: A B and F. Posts A and B share a single interrupt and port F has an interrupt for each pin.
> 
> Depending on the chip type  (01, 02, 07, 12, or 15) not all the GPIOs are pinned out due to the chip pin count. But the registers exist so the current GPIO support always registers all the ports.
> 
> Note that the GPIO banks are registered a bit goofy, Ports C and F are not in order. They have been that way since the original Cirrus "crater" code base. If I remember correctly this was somewhere
> back in the 2.6.x kernel. Please make sure the GPIO numbers stay the same so that any userspace code does not break.

I'm sceptical about this DT convertion.
Not only will it make the kernel bigger (back then is was a concern),
but they also do not guarantee any order of GPIOs with DT:


https://patchwork.kernel.org/comment/24009887/

-- 
Alexander Sverdlin.


