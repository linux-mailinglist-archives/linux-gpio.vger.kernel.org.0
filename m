Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E72D5FD823
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Oct 2022 13:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbiJMLM2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Oct 2022 07:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbiJMLMZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Oct 2022 07:12:25 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910C211E440
        for <linux-gpio@vger.kernel.org>; Thu, 13 Oct 2022 04:12:24 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id z20so1478820plb.10
        for <linux-gpio@vger.kernel.org>; Thu, 13 Oct 2022 04:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mp0GdiQu6Qt9VW3XMHTggSdAlO+pPNgus3zTOaMyL4M=;
        b=R6IS05EQ+hFrCqHzSnkU/C6fU1YrNlliYiQQk2Gmi2SGE2C2V04Uz0xW4ojmnJpNMY
         4i3OX23REHg1PHTpaastBXTMbLt3XdfrH99+thIvpiUG0yOv56DsxbYTfgV5R0oWk9fW
         77RCXyUxQUkiwwO0Sv6kMFavwjDfaAragohpJHG4xPXixWq6PWwpBptZuTwfwTNXwREx
         mFn9u1WhAJZ+fiYNOtTWeR4Wnp8sXfcKWTaaF3zPhtOKUxu+0+dSUJNW7YYsQa6gsVb4
         zUlULi+sjVaTkdlneKKIBwTQbyAR153RYbevg0SP/m+sLkueoO7Hs/2h9g0EYvcfsbHj
         Eeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mp0GdiQu6Qt9VW3XMHTggSdAlO+pPNgus3zTOaMyL4M=;
        b=Rzq3aNk5xyVvvzixmnZxDPFw2EtadLhiQpx1yHpMjPoSvRhu4eY4RVNMCzElqg1+p1
         /60MbzLRJ0liuzfUFAuVbP8IvOnV1PU+WDGklT8K00U52Oxu1NBfYLWuskssMhbgnPfs
         3Uq4ADv1qUz9XltTDjCthBrh0P8JEDzohCoFJTJnttf8PLZZXLpoJWDrXDUkU5V7IHOG
         uq5i6EaE+jDMebHbmOdyPaOpsQGnRUioouMy6AOvC+Oys9HohXp8q5m1BZge7/CUVQBF
         TChw7vgAxr080vS7QWCDf9aRf6Q7sIfUF6I0kzGgkYLfotAuMIKbTSYVGdjfQFxKcwUz
         LTZg==
X-Gm-Message-State: ACrzQf2MhevWX3lHIyJ58vga4q2p4ksTHPnBLE2s+N+iBbiubPvEOHr7
        QajcOR4RL64Tr4VOpHZK1FU=
X-Google-Smtp-Source: AMsMyM7axkiXzDV/WoM6NyMMspM5dd55hvA9ZafcR/RwZgLLBlyQ4NtQulVo3Vum6b57pyVayYSUMg==
X-Received: by 2002:a17:902:da86:b0:183:e2a9:63e6 with SMTP id j6-20020a170902da8600b00183e2a963e6mr12550553plx.105.1665659544043;
        Thu, 13 Oct 2022 04:12:24 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id p17-20020a17090adf9100b002001c9bf22esm2965382pjv.8.2022.10.13.04.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 04:12:23 -0700 (PDT)
Date:   Thu, 13 Oct 2022 19:12:19 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 4/4] bindings: python: implement python
 bindings for libgpiod v2
Message-ID: <Y0fyk8t47E2rNZb/@sol>
References: <20221007145521.329614-1-brgl@bgdev.pl>
 <20221007145521.329614-5-brgl@bgdev.pl>
 <Y0eBonEvVclIBQS8@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0eBonEvVclIBQS8@sol>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 13, 2022 at 11:10:26AM +0800, Kent Gibson wrote:
> On Fri, Oct 07, 2022 at 04:55:21PM +0200, Bartosz Golaszewski wrote:
> > This adds python bindings for libgpiod v2. As opposed to v1, they are
> > mostly written in python with just low-level elements written in C and
> > interfacing with libgpiod.so.
> > 
> > We've also added setup.py which will allow to use pip for managing the
> > bindings and split them into a separate meta-openembedded recipe.
> > 
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> 
> <snipping out files with no probs>
> 
> Other than the couple of PyArg_ParseTupleAndKeywords issues, 
> the other few minor bugs, and my obvious preference for using list
> comprehensions to build lists, the big sticking point for me is thread
> safety.
> I'm not convinced your current approach is thread safe, so convince me,
> either by proving me wrong or providing another solution.
> Hopefully I'm wrong.
> 

But it isn't expected to be MT-safe, is it?

Cheers,
Kent.
