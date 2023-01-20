Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03DD9674DFB
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 08:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbjATHY0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 02:24:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbjATHYU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 02:24:20 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21AA879E90
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2023 23:24:13 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-4c131bede4bso60779897b3.5
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2023 23:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BP/4oQSI0HWid8DUM0fDqxmgNWE8Na1enwT1UmU4jpE=;
        b=KaCoM3liBHtwu146zO8uavA381ipgXY0uzjXg2XKksGT9rDaaRMtWEqD9O/jzIzdak
         gmG5Sqw1pDAApYwpr4zXD8RWY0v0WYH3OxSqAdgk9COf+6V8ubA5sPVcdr2BOHqHY1Dn
         +fnzpj6LexK+W95gY7fbzQ6LApp2M9ik5TOCCesw29+KH090rqXL+LOo8w9gQlGZAEH3
         ws6pQlaA+HtT2K3M8Ndekfa1c0QBdOR59zIjP0D0XPI+kh6WSiy+sXaK3wXcnILDBx1q
         DYZ0jUPHw1CMBZepOtKxjnaJehkch6wDqyrVXGV0Ty0tkcuONQY9n3iYBdsyxy+n29g4
         5IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BP/4oQSI0HWid8DUM0fDqxmgNWE8Na1enwT1UmU4jpE=;
        b=0hY/ItyhrZEIosG4dle6/7dGv29Jsq2bEtNJJooMdGxomIHeMVaAGMPrljcP7XLuUm
         Wx6HcW3Q9Hg2N08qQh0RWSqgR5kiC2ZxnK/l+JeM+CnuhniLE4BP3vMWriznOofodYTD
         yfLTMuu2U9OrxvMrwqC/8OzqMIzUFCruwzj39ngokqOEO38kFocE/9M8s8hF/Y2xncMy
         456qQ5tbb5JImCBzv1EyU5uuC7sMBrK4Pc6w2Uyumb2TKPEAY2EoG6Ordzw7eScV6Oe9
         IMTYJOBU63W9ki6ofdcxzjycfLDwx93Fq6MRk+5/I+QH1hdrIKlyBH6oApMs36zTheQQ
         XANQ==
X-Gm-Message-State: AFqh2krRiZK17cbyfeItAkejyR0hbmJP7jZdELAEc1c5vrdQAZjzfBbs
        wmuBXeabWpGacCjewfRnDpf8SEaln/kuCvwlZ3uLow==
X-Google-Smtp-Source: AMrXdXv3cETX80ZlfudJZ3usdoOGqhqv3yEQwywQWIrjTcZDjAwcTdk1BPanKEUmsmWr2/66G8WQSvOsvDXra05ExDY=
X-Received: by 2002:a81:4e54:0:b0:4e1:a40a:af7a with SMTP id
 c81-20020a814e54000000b004e1a40aaf7amr1803574ywb.273.1674199452692; Thu, 19
 Jan 2023 23:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com> <20230119130053.111344-3-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-3-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 20 Jan 2023 08:24:01 +0100
Message-ID: <CACRpkdYCEnjjDmukA4qzgjyxuR=BHuqVKKAe-uTHcMPoQy37ug@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] leds: led-class: Add led_module_get() helper
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 19, 2023 at 2:01 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Split out part of of_led_get() into a generic led_module_get() helper
> function.
>
> This is a preparation patch for adding a generic (non devicetree specific)
> led_get() function.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v4:
> - Rename helper from __led_get() to led_module_get()

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
