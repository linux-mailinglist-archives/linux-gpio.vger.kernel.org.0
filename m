Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D846173819D
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jun 2023 13:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbjFUJic (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jun 2023 05:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbjFUJiT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jun 2023 05:38:19 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58E6199B
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jun 2023 02:36:32 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-668730696a4so2001059b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jun 2023 02:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687340172; x=1689932172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZshoKXSmKzXZxxIwGO9WrxWWDyNMJS5KEfgheWVKB2w=;
        b=W5iFE+xbg6Cw/MlKsXbVvUFayEK8njtDZ4wG5acYzkM3KqrIdTTPiBX1niRIFFk4uZ
         8baWQyT+lqE3lzei0ZsEUeeAUte88Tohye7pIbsebdoQBakrEMdst7LM0oGMJpHQUstA
         XAr6CO/Bduvm9sx2/AcbXdxZVelTdYEyNnKg6JtZNssqDvpBevL21EY5yRHX+4oUYlMC
         B8/3b0mSqHqYrMkIfeCXv3G4u7jfAG0qf0/hi16NCceu53qiWtH9UMMvXzF/j7OuKTIP
         0Coa9RTfDr0aOaPNRJnQQ/tU3S0sR5UP4lZVj6ZyzHjlVVKNOIwtYaUYiWUibpxcGXoF
         OOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687340172; x=1689932172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZshoKXSmKzXZxxIwGO9WrxWWDyNMJS5KEfgheWVKB2w=;
        b=Jpt4GL308QXv6hcodGgvaDHkmk2enyWSSaZMvmi2qsdK1wehmS6tI8aHTiMGELQfF2
         duVjx0XkU3sLL0+wXTggLGrkEzJ0LO7/xm8wCIAeBqHUQwGW/h0E9mhoEbY6QYBp9Gq1
         ISSjGXDjaFFuizVLRAlxGm/41qULclEq4c7sN09SNRBUyZxCq7/VKuA1wElenkVZ0ck+
         eWg6L4z5ujux27eyMlDv9HGPFBvfIuIY3lKLTOHYYestvXWzfbIfn76Xxnws/q+1ffpd
         0LCC2iVORSWr+jwYPOwPLReGvPfArM94Su0VaY5Zbria2Jf0Gl0KkovmG1QdxtRFLLsd
         s4Fg==
X-Gm-Message-State: AC+VfDzIJ8H/pz+AKqoM9pUFmZmi6QY8QP9kdb3bIN1GJ+toXUkb+YrH
        psN4GIPK8pkQEm6SZaYR4ekRHeK8JtY=
X-Google-Smtp-Source: ACHHUZ4zhyb5CpfJpeECI/OJGRiUe0Y265nXA8ln5WQElTH6KzSZeCBRxbtWwT5uUctyKFmW2Qev0g==
X-Received: by 2002:a05:6a20:5493:b0:122:9af9:67c with SMTP id i19-20020a056a20549300b001229af9067cmr3996884pzk.23.1687340172082;
        Wed, 21 Jun 2023 02:36:12 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id x3-20020a170902fe8300b001b56012be2csm3037133plm.231.2023.06.21.02.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 02:36:11 -0700 (PDT)
Date:   Wed, 21 Jun 2023 17:36:06 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Joe Slater <joe.slater@windriver.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 2/2] tools: tests: port tests to shunit2
Message-ID: <ZJLEhrhn8KCH4IxW@sol>
References: <20230621084835.114473-1-brgl@bgdev.pl>
 <20230621084835.114473-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621084835.114473-3-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 21, 2023 at 10:48:35AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> +
>  # Save the PID of coprocess - otherwise we won't be able to wait for it
>  # once it exits as the COPROC_PID will be cleared.
>  DUT_PID=""
>  
> -# mappings from local name to system chip name, path, dev name

Minor nit - I would keep the line above - only removing the -g comment.

> -# -g required for the associative arrays, cos BATS...
> -declare -g -A GPIOSIM_CHIP_NAME
> -declare -g -A GPIOSIM_CHIP_PATH

Either way, for the series, 

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
