Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37ABA71FF7A
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 12:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234831AbjFBKhL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 06:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234586AbjFBKgz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 06:36:55 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A2610F0
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 03:35:23 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b041cceb16so16553385ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jun 2023 03:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685702091; x=1688294091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rRbHYrNKV9O8eagsUyLQSEkHGVc7GJN/wxCclBGL+8o=;
        b=lV375HmWaK36+BVEoIvaIbLdfCvlTWhFRmvoksmI/8jfTbynjIUO5u8ST2DZkKvhTj
         6XOYZf1tIlmchHZUp4kxIwN7GyKmMuA6KJO5Jw/yCwWZ+/YmqVown9wW68NuVZqPEMod
         HiDKWMwURtwxlgk0B2TdtVy1erdr8XLHsAqrv8/1srkPY+Flq9rWHdWcXqNRhUg4zNO6
         5h7cItxLTNZ5//y8QGaFaCul5WBSfp3HFebWMwuXkZ7k2hJMrb61AY9tv9aAxja1G3h/
         V+uyrW8NPsj/PALDRkT9WyxCQ1a0pd/2S8TIQeRhdHAo8Ef4FRWoejRWdc2Y1+IhBthi
         L41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685702091; x=1688294091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRbHYrNKV9O8eagsUyLQSEkHGVc7GJN/wxCclBGL+8o=;
        b=Asj9wRHBxfZPvjXsX5J6uzYm67uMAt0+/kZ7xkmN0DG+R9Yuo/2dQE0sYDqiwbRNSs
         k0TrKPDBlAPGVClzFFy1pyCRl2UGRH7oJ/jHPU4KrDpY92dA2eFTlCg4fZOm9BEV9X9O
         ncHOUZedlfs2R6eBccDzUwy9Rk49Raaz1C8OnLAveLu5lQI+VQc1JdSdC0rjN0Fr1lKo
         sKoNaZpodsrb3ZsqiKh+eMAQMzIUAUXL/y6eatoPjwNnfvocGemJgnAMQA+weT9MhbNI
         TGTtUBje1XqUFw9juIJh5nqbEOjRz/A6v3dYrjIs2hNOLldG8Sm07+f8Z7JDLsOYg69E
         JVcw==
X-Gm-Message-State: AC+VfDwW5IRXSLZdK3tVDV75+C0hyT4Typ7wAOfjvUyZi16fV4XCkSwz
        BIPM3FnmyZyRwpNu4CbOvooReU3cIBY=
X-Google-Smtp-Source: ACHHUZ5/X7pws1+DLzpAs0qtgWAA/5Oj2sn1IcRKdUDhjcznFchwEPbyb07nUlwiY/eXd5upaHj8yQ==
X-Received: by 2002:a17:902:8f8c:b0:1b0:3224:e53a with SMTP id z12-20020a1709028f8c00b001b03224e53amr1860134plo.20.1685702091094;
        Fri, 02 Jun 2023 03:34:51 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id i17-20020a17090332d100b001afba6edc8esm1025314plr.166.2023.06.02.03.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 03:34:50 -0700 (PDT)
Date:   Fri, 2 Jun 2023 18:34:45 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: tests: replace egrep with grep -E
Message-ID: <ZHnFxdcZJEd1ta0R@sol>
References: <20230601140950.779453-1-brgl@bgdev.pl>
 <ZHirBqDkd99qWGX8@sol>
 <ZHjONQW0qVMseySZ@smile.fi.intel.com>
 <ZHlQT5KeU+7GkYba@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHlQT5KeU+7GkYba@sol>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 02, 2023 at 10:13:35AM +0800, Kent Gibson wrote:
> 
> On a related(??) note, I'm occasionally seeing Oopses when testing this
> - when creating a basic sim with a shell script, not when deleting it.
> In one case after a fresh reboot and on creating the first sim, so it
> looks to be purely the construction.  Yay :-(.
> 

I had thought it would be difficult to reproduce this and so difficult
to bisect.  Fortunately(??) not.  If I run my setup and cleanup scripts[1]
in a tight loop it occurs very readily.  Haven't bisected it yet, but did
test it on 6.1-rc1 and it Oopsed there too, so I would need to go back
further.  What was the initial release containing gpio-sim?

The sim setp is pretty simple - a couple of banks each with a few lines
and hogs.

Could you confirm that you can repeat the problem?
Otherwise I might start thinking there is something broken in my test
environment.

Btw, the loop script is:

#!/bin/env bash
for (( ; ; ))
do
	echo "create sim..."
	./basic_sim.sh
	echo "destroy sim..."
	./clean_sims.sh
done

Cheers,
Kent.
[1] https://github.com/warthog618/gpiosim-rs

