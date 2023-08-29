Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 057F578CD8D
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Aug 2023 22:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbjH2U3n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Aug 2023 16:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240558AbjH2U3d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Aug 2023 16:29:33 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB17AFC
        for <linux-gpio@vger.kernel.org>; Tue, 29 Aug 2023 13:29:30 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99c1c66876aso624505766b.2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Aug 2023 13:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693340969; x=1693945769; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c4hYKlpw10RBDGcFQ+pNFTV1sFojiOV4eZlWuNv1UaE=;
        b=SNcHHTWfALy73lTOFIgEsqev3uYhucJ3xORQAOWM4mrOBis467U3qoPWe3WGdFWjVr
         9Xc79U6UoLfpsTQelG9TJiD1HDVUyVh0W7mb7QArdP3PZhwd7nrk01xC4RSjNQs8hSXV
         fye7k2vN+Ahla7ILAr2G3jlyEtYpXXR6e1GCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693340969; x=1693945769;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4hYKlpw10RBDGcFQ+pNFTV1sFojiOV4eZlWuNv1UaE=;
        b=VxtdHaa6CxxA+NeZT1hSDtZcveWnJmXM0AJkIS0ktTeG2J49jO/lffq1S/EMM8sEob
         Ho5FJdSeCaIvaBeO88VWOvK2tar2/cqPmW4d00oNvzroZ12xfSSPwK89t5T9mtpS2OFh
         rfhLxschIbpzuv4Saxbh1AuWXjDJvuyUbKICWzwZeTZBI87OGab2fhCRMQewFfSGMCuQ
         yHxITmHDyagxwhICe9V5kP1z4sfsUWBCo6C2eevSx/sa7kqgC86acTjSZtoAI+ntGUMc
         Ji7tuUk5v1EH0qRIdgY4w9wAs6vH+5dJqlYvv4eV8WkARaKKJN8JizwvP3G4a665STAg
         44+Q==
X-Gm-Message-State: AOJu0Yy1nZIHI7caH4GSmGBoMZxHvpLEDPyycNaQfP1hw0iiYNtrl1/I
        V2sjNhglL9ulpCLOzayE5OdD3kP4mX4H1lpk+khjlV0k
X-Google-Smtp-Source: AGHT+IFrGT2u6VTcCneOwb12dPmigR8W+hrL8gVPiqMP+PvXJ+1JDVepdKssqsX8eOWdTWNnho8f2g==
X-Received: by 2002:a17:906:5303:b0:99d:f2dc:97e3 with SMTP id h3-20020a170906530300b0099df2dc97e3mr87001ejo.20.1693340969156;
        Tue, 29 Aug 2023 13:29:29 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id c11-20020a170906924b00b0099297c99314sm6380582ejx.113.2023.08.29.13.29.28
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 13:29:28 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so6310254a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Aug 2023 13:29:28 -0700 (PDT)
X-Received: by 2002:a17:906:5347:b0:99e:112e:7708 with SMTP id
 j7-20020a170906534700b0099e112e7708mr62717ejo.76.1693340968340; Tue, 29 Aug
 2023 13:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230829114301.10450-1-brgl@bgdev.pl>
In-Reply-To: <20230829114301.10450-1-brgl@bgdev.pl>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 29 Aug 2023 13:29:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wigZt6kVkY0HU1j_LJ5H1KzwPiYnwwk6CbqXqT=sGenjg@mail.gmail.com>
Message-ID: <CAHk-=wigZt6kVkY0HU1j_LJ5H1KzwPiYnwwk6CbqXqT=sGenjg@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v6.6
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 29 Aug 2023 at 04:43, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Driver improvements:
> - use autopointers and guards from cleanup.h in gpio-sim

So I've pulled this, but I'm not entirely convinced some of this was a cleanup.

That gpio_sim_config_make_device_group() change is "interesting". Doing

        return &no_free_ptr(dev)->group;

looks a bit crazy. My first reaction to it was 'that can't be right".
It _is_ right, but I'm not convinced that getting rid of one kfree()
call in the error path above it is worth that kind of semantic
complexity.

I guess we'll get more used to this - and it will look a bit less
crazy in the process - but I did want to just note that I'm not
entirely convinced we should encourage things like this.

              Linus
