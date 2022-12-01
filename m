Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3059C63E780
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Dec 2022 03:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiLACJd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 21:09:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiLACJa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 21:09:30 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC8219D830
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 18:09:29 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id jn7so229030plb.13
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 18:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mGxMFejB5CmzpDGPnnSB8fx8fxEZ4ln6smWmFoDYpoA=;
        b=Hqsb2x+f5puUkXKjcZeOJut6y4/9N5sA3GZpeFzf+3KSRBsfQ6daDys4Sv4PLAv8fZ
         Ul+s6CE0Pqj+f+izIBMvBoexUkK59B9Jnao58ze0R9ijLBYkOMIxRuOhMLrxLnoedSQp
         9YjJWzmczlNCt1D1iJq6QOs+ILsfz3Zn1BgY0aURvFZByJacyqeyYSVdBqzqVee9OuBW
         CMObLs7I0HJJDpBXOyOYzaBUUbFYe6P4AN0tNptFwlsuHYHM2SimpeH0PKcseLLN0ev6
         qj9GLvbeFH3CXd7RnDFc0rVpiI0yMPKGqtWKcydcnghYz7KHcUN+p/JLZuP0UpKOfe9o
         KaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGxMFejB5CmzpDGPnnSB8fx8fxEZ4ln6smWmFoDYpoA=;
        b=ydQ4T57VB+voeleaGxVLAP25s7Q8gEtW2rKM+MhKMvDxvap+CKmsYBav5D2HSKqKFK
         BywTMbc9lnAMKLLFsT2ur5VR6/JEUE58ljUlBdjGVoFXIk8+SNr+FXGBW6TW5yOqmDeQ
         k/kZG7rLOeZnq48qIkhxAcZ7AoZSW+4+rzF1XsZ9yO1wlaPe6hlo0+6ICKkJWC1DQJho
         MwstjRNDzr4PoQXnw6pWydee21MZTMtqvM9wvseEd/47cwMEEUtwFIcgdGURDP6zCyyM
         yi0olxDJ6wIqUo/9ULfq6Ipn465R1hOa9MgHKVrj7JvXrPhIfvfdKkJLbQgjvDEUTTzP
         czag==
X-Gm-Message-State: ANoB5pmWN1lG4cVfqB1anOj/K7gScW0XmKm5E8r3od8EV6M4CgG5MSUu
        FAxvpUmAG6XI3o+up9JzTktjNw==
X-Google-Smtp-Source: AA0mqf6yhm6HxCa4SLCKL+Qgn9+HasAqPfaje0ANbFlN72KW3eCek3PsiDvGQD3BpcQBvtJToloIaw==
X-Received: by 2002:a17:902:8b84:b0:189:b0a3:cf59 with SMTP id ay4-20020a1709028b8400b00189b0a3cf59mr2201461plb.42.1669860569462;
        Wed, 30 Nov 2022 18:09:29 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id x3-20020aa79ac3000000b00575c5ae50cdsm2082476pfp.142.2022.11.30.18.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 18:09:28 -0800 (PST)
Date:   Thu, 1 Dec 2022 07:39:25 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 04/11] treewide: rename EVENT_CLOCK to CLOCK
Message-ID: <20221201020925.ojhuhguhmxvnbd47@vireshk-i7>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
 <20221130124231.1054001-5-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130124231.1054001-5-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30-11-22, 13:42, Bartosz Golaszewski wrote:
>  bindings/rust/libgpiod/src/lib.rs         | 22 ++++++++++-----------

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
