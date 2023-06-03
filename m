Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAF3720D11
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Jun 2023 03:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237074AbjFCBxY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 21:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236585AbjFCBxX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 21:53:23 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289F9E47
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 18:53:22 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-397f13944f2so2400653b6e.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jun 2023 18:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685757201; x=1688349201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9V7bFMo+NajZ0K93yj3O60DwmkzQsSHIczxZp61YGwY=;
        b=Fl+8JdMSgJU7G6cSVPE9kerWgQlMrGiwgTkeZZ+6hFcmuJmf+62FMSSGeXn9WtuWnc
         ZccGpPsI9ZYzUvXSHAF7N8wMX3kiXB8j1aX/UxUlJEfgTIN/7eTAyebDEamAGrTmwyvb
         CQ+RMCZSSAX/LrV120JjXyMZZPoLmQOL3AswXV/op7NoyASF4ckqIQFuDJtHs4l6N0V/
         ogpgnvXumMAFVFWqR312rlZUkmpBAPEeP4IwQwB4NvqzBPRMlNAIAAKha9aEfpeiK6CS
         z9z0DIh29Hv4ZALvITZ9lkkeRNg3I6TKc83p6v60yxEEpeq1aRfsPO78s/AkBymcs7Dm
         ThKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685757201; x=1688349201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9V7bFMo+NajZ0K93yj3O60DwmkzQsSHIczxZp61YGwY=;
        b=ErQbrRyfuCvUYAN6eU/smGYYJXNYzmBfJkITg+LBHwlIHpZ7djWdDoTacukinUzKDX
         OJLN8tLZ42U1SohvmmiPKvuKFnt1zcAojbjbKWiMaoO+Xxkjyc2Om4CqE/TQkh4DQriq
         BSNisSEwax6W3nE0fysHV/xOZw3HSds7Lolz9GpoMBP1NRdSypahuAtkLiF53hPUee6Y
         rb8Ymznf8ykK4wz9v9Kgmh7e67Jn54xva4AKhW7Dso2ortFLl1VE+chJHdtXyIgLhs0K
         2aLzLEQifHJ/X9fce6PKFCqoyEfLd0TJCJySWTEmiB7wjXg1zpR97MxbqOrGGHr0VauW
         B/SQ==
X-Gm-Message-State: AC+VfDyXUtO2KAjrvLBCcwQsIupWl5buxERAyvso8n3waiP6/TMdv2tA
        wJ3ODMms2G6ztFFwEPriJFcAev2yh4w=
X-Google-Smtp-Source: ACHHUZ4VyGpdeWtRZsMe2XKVYtdjOQoBxE54jeiwOB/G3YctkxGgCzWTGiTidFUXXqo9wCF1n681Qw==
X-Received: by 2002:a54:4408:0:b0:39a:609c:1f7 with SMTP id k8-20020a544408000000b0039a609c01f7mr1759359oiw.20.1685757201195;
        Fri, 02 Jun 2023 18:53:21 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id y12-20020a170903010c00b001aaea39043dsm2015723plc.41.2023.06.02.18.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 18:53:20 -0700 (PDT)
Date:   Sat, 3 Jun 2023 09:53:15 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: tests: replace egrep with grep -E
Message-ID: <ZHqdC9gItqqOEoLK@sol>
References: <20230601140950.779453-1-brgl@bgdev.pl>
 <ZHirBqDkd99qWGX8@sol>
 <ZHjONQW0qVMseySZ@smile.fi.intel.com>
 <ZHlQT5KeU+7GkYba@sol>
 <ZHnFxdcZJEd1ta0R@sol>
 <CAMRc=MeC=H+Qvew3jrwPR6MMa=rO1Ds_5dN_tZZGS_C1zMz+FQ@mail.gmail.com>
 <ZHnuCjd5gDPDoDjq@sol>
 <CAMRc=MdRiJUURRZxqwm87b7H=DEFuyW5OOqKrqXjrveVNw7BPw@mail.gmail.com>
 <ZHoTzKbuCykRREbS@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHoTzKbuCykRREbS@sol>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 03, 2023 at 12:07:40AM +0800, Kent Gibson wrote:
> 
> One other thing - is it necessary for gpio-sim to log hogs?
> 
> For the long running cases this results in a lot of logging, which could
> be causing issues in itself, and further muddying the waters.
> 

Ah, I've been looking at bisecting the problem the wrong way.
I should've been bisecting the trigger condition.
If I remove the hogs from the basic_sim then the test doesn't fail.

It also explains why I haven't been seeing this more often - most of my
tests don't include hogs. Only the info tests use hogs, the rest just
use bare sims with no named lines or hogs (aka simpletons).

Does that help isolate the root cause?

Cheers,
Kent.
