Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7881F63E77D
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Dec 2022 03:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbiLACIa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 21:08:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbiLACI2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 21:08:28 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89DE457B4E
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 18:08:26 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id a9so249049pld.7
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 18:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hPm+Q8I25I5QQQv+e3xgKB6n0VDhSCSyy5TXhIgBYwc=;
        b=AjBe4sr7okFIfHEFgPn4zVYWkBynCkTIm6RBZls8wrU9dzQ/+rb3UVGNnSB+gYiW6v
         8Cux4qehYAGVBFHS6+T0UlH4ZascpdRz9ZQ8Gu7XbhwdMg5vSaPNOmYC5kLQR83DxgQ4
         /SMh5pZW+5XhZ06pOC4ZSmAuYe120T9Dfr7PCAFKoylKLFfPCWKmU2HyK/iOrM+JJYv9
         qwLs0CGp2bWGaP6+8POkbM7RlFDaqIuifMDqILnjgiU+VxzylTYciPvxMVleh5dT7i2t
         wNKs3fTCZxnZbXfiUXh3NEmJdBazLCsq1s1O7D65lI++hzsd3iT4PEZOc2DrwXBXf1sk
         W2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPm+Q8I25I5QQQv+e3xgKB6n0VDhSCSyy5TXhIgBYwc=;
        b=Ee4wqFTewC90htLYwyoXSRQYIg0ONHUmYxK366+PZt/OX2fM4u2mPukLneokuA6w/Z
         wRPmARLbTqZ9r/K04E8vvO6H0Rz/iBtJDBOfRMFaPdzEUVtPLfJRtOYMvLBIAVox4a9H
         p5sz91aDNNNYiuPCqD4518LK7uIrt6LMzt97wC7RcrRaeQBs3Hxg0eW2ouZbVNYVRUbL
         VvX0IXvq7a1l2frI4G1Y8a+7MA2edOqFdmrB6PSvGo1buOhMJ389ygzngt2005FBYNS8
         xdsCrFJ8VdmSihS1K33jRUh26t7o57ye6Z86CAzAK4SXBTL87EeBkPhaqGS5nZXdGlCe
         2Qig==
X-Gm-Message-State: ANoB5pkEksLpJAOUOfS+HnUCok0rNrdDFgmKtKkm1VuXLmUceECj1i1s
        Dz5G265nQYsU+EDBJPSbOpkn9w==
X-Google-Smtp-Source: AA0mqf70hkphRclPZYx4UAJqNovSJV7MCcHBR+QSZfr102EP76VQLb3GSnRmulXYTtebaNek9RUApQ==
X-Received: by 2002:a17:90a:5d15:b0:213:e74b:b691 with SMTP id s21-20020a17090a5d1500b00213e74bb691mr74126092pji.81.1669860506047;
        Wed, 30 Nov 2022 18:08:26 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id m5-20020a634c45000000b0047744510d6bsm1558886pgl.5.2022.11.30.18.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 18:08:25 -0800 (PST)
Date:   Thu, 1 Dec 2022 07:38:21 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 03/11] treewide: use plural 'events' in
 read_edge_event() functions
Message-ID: <20221201020821.tw222cddfjukz5np@vireshk-i7>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
 <20221130124231.1054001-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130124231.1054001-4-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30-11-22, 13:42, Bartosz Golaszewski wrote:
>  .../rust/libgpiod/examples/gpio_events.rs     |  2 +-
>  bindings/rust/libgpiod/examples/gpiomon.rs    |  2 +-
>  bindings/rust/libgpiod/src/event_buffer.rs    |  2 +-
>  bindings/rust/libgpiod/src/line_request.rs    |  4 +-
>  bindings/rust/libgpiod/tests/edge_event.rs    | 24 ++++----
>  bindings/rust/libgpiod/tests/line_request.rs  |  2 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
