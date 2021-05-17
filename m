Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1D4386CC6
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 00:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238349AbhEQWPM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 18:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234563AbhEQWPL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 18:15:11 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBD92C061573
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 15:13:46 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id b9-20020a17090a9909b029015cf9effaeaso385455pjp.5
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 15:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9nkes+7je4/CgFuKfX3S6PTZeGuUNJXutzMU6gtvMZM=;
        b=tkpR4KeT1MErkkeRPj9smQOPw8XIv98ro9W2tLtfn9TNiodgFH758pS+ocwxMCYq8T
         x207PAYePtAkpyRf+/IvdgNqRvDLnDfeY8dt34Sp03lK1mpjGs57M6TbkFF6Ic+I3nNa
         pAW4SqUJUiCM8rUv1U7ZMlfymn7qkrGX5gP1A7Ca92ls5jZy+7PWeYydPVmpTTUxj6/X
         WDJlW8pD5s0s+AAUYhoYmgmJ8wwtk/l5reqCWBRG46JBv1hvBjRoR6YRxfmb3jEIvKOV
         Kk3xXE8bUE4am2+fr3tozs/JIJE/zeBxB8dwEt8Sl3fhZDT6TQQWhwyCiGYi/867VCum
         z8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9nkes+7je4/CgFuKfX3S6PTZeGuUNJXutzMU6gtvMZM=;
        b=T5/cdk62KOGAJda17x3rtuUVMCZiXH+CLhb91qi9W2MRDtupCl8o9AbHobwSbKUgbt
         ydHiBirskHa/3m5V2aSN7y6pPrOlAjLLlKT/du1UlPl7tE5jRw9rVgNeVDs3TW7tSSdD
         sQhOAYPlBDD1mH2KBYTmBycA9ZOSFn4mwyk+23JdH6DVgRtmWMmn0YuoAmhDF+z9TBP1
         sJ2EdBjdHUmmYM+sRLY/UQmdnXqDwx5GXmh3N7JjKC/UUTHWvmuyWWsdby2cPhkb08ht
         6r3UA/Bx2YfYe7Oyngiv7gUK5exiCiVmErfOkBjv91Gtrop2hPN1TfhamrzbS4aoNHCp
         7IaQ==
X-Gm-Message-State: AOAM5321UEe1qalcLowlmyhAijREFlHbvukct/DshrbdiHRYwkzV9V4t
        AQqGdYu2A/a1kzFMrgmoaeXLcw==
X-Google-Smtp-Source: ABdhPJxZw4sBD+Ll1ihn9gQ+NIvgpZUiUsnDv8m2RDbSOGtyLKnf3rXvXy8qO22+d6wxwlN1+obOCQ==
X-Received: by 2002:a17:902:7144:b029:f0:d8e7:95a3 with SMTP id u4-20020a1709027144b02900f0d8e795a3mr716705plm.52.1621289626023;
        Mon, 17 May 2021 15:13:46 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:aa60:5ddf:388a:f8f7])
        by smtp.gmail.com with ESMTPSA id g202sm3814538pfb.54.2021.05.17.15.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:13:45 -0700 (PDT)
Date:   Mon, 17 May 2021 15:13:43 -0700
From:   Drew Fustini <drew@beagleboard.org>
To:     Mauri Sandberg <sandberg@mailfence.com>
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 0/2] gpio: add generic gpio input multiplexer
Message-ID: <20210517221343.GA2936462@x1>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210517165847.206316-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517165847.206316-1-sandberg@mailfence.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 17, 2021 at 07:58:45PM +0300, Mauri Sandberg wrote:
> Hello all!
> 
> This patch set is closely related to another thread at [4], which I abandoned
> against better judgement and created this one.
> 
> Here I am sending revised versions of the patches. It builds on v2 and adopts 
> managed device resources as suggested by Andy on the thread mentioned
> above [5].
> 
> I have tested the functionality on a NXP 74HC153 dual 4-way muxer. Drew, did
> you find the time to have a go with this [6] and if so, did it work as expected?

I ordered the parts but did not get around to trying it.  I will try it
out tomorrow with this patch series.

Thanks,
Drew

