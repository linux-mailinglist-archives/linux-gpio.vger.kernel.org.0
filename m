Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D994731C30
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jun 2023 17:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjFOPKt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jun 2023 11:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236166AbjFOPKs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jun 2023 11:10:48 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 943E62946
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jun 2023 08:10:45 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6664e4d8fb4so1517750b3a.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jun 2023 08:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686841845; x=1689433845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq0rXvRXD89P+fJf8HGkMBIJWaX+qZYWeNDtnQb/zWI=;
        b=Ex3qYUDyZE9QASEPoANTQw9G16rWNmCnI6fHZyq2OlV+MYz8IuNZn/7E23tD5DObDt
         94rChQqHBjXecEc6HaT7i9DbAJ4pgeUpN/OUV2fnGn3BSNTBa7tvkLn37VrKQNBLJ6zn
         fm3OSvXHG34UR4Q3EjDYq5I/0aYIQty4xQ+62W/kdlGLzeoNGRr7LP2WRjhp83Ky7cq2
         tbRJknK9GIoYPzxyyb0n7Z62B4aq+pQ/p/BEeXm5U8wDvbTUfex2y+ruXjoEZJN1zgG8
         IAZAnXhjJIVM9HSwySzeLLginNh3AJSG7A5KILZK8nwp+YSGWQ5MLPk2z72L8vHwtwlC
         E7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686841845; x=1689433845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq0rXvRXD89P+fJf8HGkMBIJWaX+qZYWeNDtnQb/zWI=;
        b=iBfxozhZqdJDJx1lU2gP+FBGdLNV2xxxBMi/jb/brQTUZm69Q+eFLlNctP5r5zk3no
         00G7vatgfOZBmcrH9nLnvl4GHSNx7PHXjUYdmNRK6vJTyP6QWaD2EW4NZZ9rs485qPca
         +d7GEMJdmPJsZ1LiDH2jvkZ1qKN+N33+OiS9v3UZyxhHIlY3cuqsnz8ylddHwbyavvBA
         3+c20Redgj8N96tu6X9SblIdeaTDrUqF+hxhKRCNjH3eS1UyW9LNhSsxABtf/LQziOdW
         n5hpgsxHsOljwtQb5Qfp3b1s0y46ozUEvbJAV5dVP1NJjizxkq8TjhIO62fYf9pI03NP
         u5tA==
X-Gm-Message-State: AC+VfDwDp5U0z0gIOtvwoDSJDGayE+PK5d/0HiHxqfNyJ87P1SP1Ti+B
        SE6uJhnwJnaeP3lo+WIKjtk=
X-Google-Smtp-Source: ACHHUZ7gtY2sswHLB6qnupI1pg4yJ1Bi2Px7zRCpNJfJnQq63ORtt2rLfpGmVw/BCzZbz5KEDBoEUQ==
X-Received: by 2002:a05:6a20:1584:b0:10b:e54f:1c00 with SMTP id h4-20020a056a20158400b0010be54f1c00mr5024464pzj.57.1686841844921;
        Thu, 15 Jun 2023 08:10:44 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id w5-20020a1709029a8500b001ab0a30c895sm14175758plp.202.2023.06.15.08.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 08:10:44 -0700 (PDT)
Date:   Thu, 15 Jun 2023 23:10:37 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Joe Slater <joe.slater@windriver.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][RFC/RFT PATCH] tools: tests: port tests to shunit2
Message-ID: <ZIsp7SU8RotOPvB+@sol>
References: <20230615143810.225755-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615143810.225755-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 15, 2023 at 04:38:10PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> BATS seems to run pretty slowly. Part of it may be the n+1 time parsing
> the test files mentioned in the BATS docs.
> 
> This is a quick and dirty port of test cases to shunit2 - a different
> testing framework for shell scripts. It sped up test execution for me
> by ~40%.
> 

That is a lot faster for me too:

Ran 165 tests.

OK

real	0m41.300s
user	0m10.122s
sys	0m22.926s

while it is > 2m30 with bats, so ~75% speedup.

Though I get these errors on some tests:

test_gpiodetect_all_chips
./gpio-tools-test.bash: line 40: assertContains: command not found
./gpio-tools-test.bash: line 40: assertContains: command not found
./gpio-tools-test.bash: line 40: assertContains: command not found
test_gpiodetect_a_chip

and the overall test suite still passed, which is a bit of a worry.

Hmmm, seems assertContains was added in 2.1.8 and I'm still on 2.1.6.
I'll have to update.

Overall looks promising.

Cheers,
Kent.
