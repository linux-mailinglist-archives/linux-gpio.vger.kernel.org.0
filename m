Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3DF4F4337
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Apr 2022 23:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234522AbiDEURE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Apr 2022 16:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1391995AbiDEPfe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2022 11:35:34 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22187644DA
        for <linux-gpio@vger.kernel.org>; Tue,  5 Apr 2022 06:44:32 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id fu5so6227483pjb.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Apr 2022 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z/Qd7keKI8YlwHEX7iDWimNuVR+4ISjsuTlC48VavJQ=;
        b=WBiGf3Il9wK5mABqI8Vuo6ER4ssaQXR3DjOaf8X+qeCeAmNU/1Ega+7kATaDiVVYL1
         EpK+ZaqtQuIWOtIyZSslkJO2oQpB5ZJnumGnwupT/z4NcYnRijZ8cuXSqkBsLbpXuqsl
         ySVqnWtfCPN4rBNJeSoOQsEDxrU4Salk74HJu29dt//1+sh/uUH9k2zeA7pwmZaffptM
         ItuscdLLls8XPvzHGrG//ghZg1twtY4pCEwXGo9TQdWvwh5IJG4O/as7u71CKR3b16G2
         xMPoUR52lNGupiZxa5fWTds2sX8CR0PUJkq1Q05K6Q+ct2e+PQhonLw4NJl0jD2q7czy
         QMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z/Qd7keKI8YlwHEX7iDWimNuVR+4ISjsuTlC48VavJQ=;
        b=wSN5gLJePx7o7I2zW2195t9TKm/zVVlgswpsTTXVuTS0GbdzoOw8LepLF/2Lz0I/mG
         xxwOTAcIJwm6d3eOFNG7NVf9/Q+S4d0PoaWOZAR/aGPVrQwF02Izwr0SODS2Tq7IoTkz
         690oPRFJt8FqnrqkGNbPD954qgBggmgjrMCYCdJ0JQoSInbG4d1necLtEha9dzVpBefO
         Fi3OA3lz9EJbbYp+uxEMLH/y2SHM1Gesv2sPZkAX+eVsryU2qWp0BVck+jqOXriVS9kR
         P0nAM22k+zBntYZOyR6KhiCyhYOSI4d1CUmkiBt1uMexdH46eAFCH78mjphYdAdMW7gU
         mJog==
X-Gm-Message-State: AOAM531gK4zm+5rgcKM+n0RFhhOb5GO1h6XElkMNQGs11K4lxMmXTgWV
        JHusaYenJQpCq0/fopiNgvGO0OV8SoaVUw==
X-Google-Smtp-Source: ABdhPJxN5V9ns7lQoF6jUseKzuEpndXOvQSkip30E2JTAEiZ95mZBBqwNQs0oRQe+KM4Ae8tqyysuQ==
X-Received: by 2002:a17:90b:4a06:b0:1c7:2020:b5b9 with SMTP id kk6-20020a17090b4a0600b001c72020b5b9mr4184097pjb.58.1649166271413;
        Tue, 05 Apr 2022 06:44:31 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id y12-20020a17090a784c00b001c6bdafc995sm2100840pjl.3.2022.04.05.06.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 06:44:30 -0700 (PDT)
Date:   Tue, 5 Apr 2022 21:44:24 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] API: rename gpiod_chip_find_line()
Message-ID: <20220405134424.GA29756@sol>
References: <20220405132158.33433-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405132158.33433-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 05, 2022 at 03:21:58PM +0200, Bartosz Golaszewski wrote:
> The name "find_line" is quite ambigous. We should indicate that the
> purpose of this routine is to map the line name to its HW offset.
> Kent suggested get_line_get_offset_from_name() which is hard to beat
> when it comes to being explicit.
> 

My suggestion was actually gpiod_chip_line_offset_from_name().
But gpiod_chip_get_line_offset_from_name() is even more explicit.
And both make more sense than your misquote above ;-).

So that works for me - assuming you fix the quote.

Cheers,
Kent.

> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  include/gpiod.h    |  3 ++-
>  lib/chip.c         |  3 ++-
>  tests/tests-chip.c | 10 +++++++---
>  tools/gpiofind.c   |  2 +-
>  4 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/include/gpiod.h b/include/gpiod.h
> index c605da8..344a8fc 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -158,7 +158,8 @@ struct gpiod_info_event *gpiod_chip_read_info_event(struct gpiod_chip *chip);
>   * @note If a line with given name is not exposed by the chip, the function
>   *       sets errno to ENOENT.
>   */
> -int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name);
> +int gpiod_chip_get_line_offset_from_name(struct gpiod_chip *chip,
> +					 const char *name);
>  
>  /**
>   * @brief Request a set of lines for exclusive usage.
> diff --git a/lib/chip.c b/lib/chip.c
> index edb2dfd..eef3be2 100644
> --- a/lib/chip.c
> +++ b/lib/chip.c
> @@ -156,7 +156,8 @@ gpiod_chip_read_info_event(struct gpiod_chip *chip)
>  	return gpiod_info_event_read_fd(chip->fd);
>  }
>  
> -GPIOD_API int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
> +GPIOD_API int gpiod_chip_get_line_offset_from_name(struct gpiod_chip *chip,
> +						   const char *name)
>  {
>  	struct gpio_v2_line_info linfo;
>  	struct gpiochip_info chinfo;
> diff --git a/tests/tests-chip.c b/tests/tests-chip.c
> index 3fad16d..efb4f74 100644
> --- a/tests/tests-chip.c
> +++ b/tests/tests-chip.c
> @@ -88,7 +88,9 @@ GPIOD_TEST_CASE(find_line_bad)
>  
>  	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
>  
> -	g_assert_cmpint(gpiod_chip_find_line(chip, "nonexistent"), ==, -1);
> +	g_assert_cmpint(
> +		gpiod_chip_get_line_offset_from_name(chip,
> +						     "nonexistent"), ==, -1);
>  	gpiod_test_expect_errno(ENOENT);
>  }
>  
> @@ -112,7 +114,8 @@ GPIOD_TEST_CASE(find_line_good)
>  
>  	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
>  
> -	g_assert_cmpint(gpiod_chip_find_line(chip, "baz"), ==, 4);
> +	g_assert_cmpint(gpiod_chip_get_line_offset_from_name(chip, "baz"),
> +			==, 4);
>  }
>  
>  /* Verify that for duplicated line names, the first one is returned. */
> @@ -136,5 +139,6 @@ GPIOD_TEST_CASE(find_line_duplicate)
>  
>  	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
>  
> -	g_assert_cmpint(gpiod_chip_find_line(chip, "baz"), ==, 2);
> +	g_assert_cmpint(gpiod_chip_get_line_offset_from_name(chip, "baz"),
> +			==, 2);
>  }
> diff --git a/tools/gpiofind.c b/tools/gpiofind.c
> index 36eba86..03b15c9 100644
> --- a/tools/gpiofind.c
> +++ b/tools/gpiofind.c
> @@ -75,7 +75,7 @@ int main(int argc, char **argv)
>  			die_perror("unable to open %s", entries[i]->d_name);
>  		}
>  
> -		offset = gpiod_chip_find_line(chip, argv[0]);
> +		offset = gpiod_chip_get_line_offset_from_name(chip, argv[0]);
>  		if (offset >= 0) {
>  			info = gpiod_chip_get_info(chip);
>  			if (!info)
> -- 
> 2.32.0
> 
