Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6654D673B40
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 15:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbjASOGq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 09:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbjASOGH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 09:06:07 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257FD7ED4D;
        Thu, 19 Jan 2023 06:05:25 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id z9so1596286qtv.5;
        Thu, 19 Jan 2023 06:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ft7thjbRH4LJ4g7+2BJEIJ9urL8mlxCTfapdcA4PqOw=;
        b=HyN2Alg0QrsNjLNYPsCofmAJLoKDcGujNS5jA9XNFa368CIhjpDmx5yU+7YVKsTkeO
         sxR+g9sRZ9sW2TBq1IGxcRHAw8lAklG/uUD9Ihb5LIWyNe130ZvJy8KKT+i8UHFm8DAg
         HkSbdaFxhxSN2/AAAMtDl9ry9D8nNgmn+7q+uQHlBWL1fUOjwf+5j9G/MM7tmnNvN1s2
         hrjeqiqUC/T04jz7Uffvqdi5ODIqyey8LgPTtrYNzVreUfBkjmeFkXhSknfEXY20C6d0
         0qO2myc1jCpfZffpLK13Avo/hoDL0sBe6RgvoYA6LvEA9SY3YNo6yXNzmSrSJGYsFLHX
         1cyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ft7thjbRH4LJ4g7+2BJEIJ9urL8mlxCTfapdcA4PqOw=;
        b=28L7jkL74pP8S0JL60birJVgdFVj2x8Y562VraUW88CqKn9QOCORfZUak4RiYJn4QA
         p9GgY53ClyYugrCAEjM7zVKfebSDZ6bb2P/+ezz0jQmBi/lQKr8DOsv+IqDokjjXOqbG
         lIS+8xKKMrB3gzPZmbM7fqvD35LXDrA0PIJDo03Tcg+Pf2r1kvz7swqWUGlayHIqiCUB
         khGC+IHm7b5uT0W5qC8rar+wIjHOR1Yf8SK2A0HKn82tQehaLXuvd0YGj8RtZQ5VTM/q
         jTToD4MYIuv5faTLEGPGN+S6J6J9oQ5Pkb8VF8u5HjiZ7uJN2yr4ilHMq0sM36HRCs7F
         gHEQ==
X-Gm-Message-State: AFqh2koETem6UaSta7i07a5OQ08w4BiHoeGQo/ZQ4XM6rXD2yLnq9STM
        JiZpi9PZwygTIoopfRrv7lETpCDtb59riE86R9VrvzpKVOAjRw==
X-Google-Smtp-Source: AMrXdXtpdkaiJY+9UQssHRSKf8fV67Umulvs+fCQ/+/WV37TboW6oXmuyl49po/RcLfB4bPlBhIwo2sdLJTkXqdAV3U=
X-Received: by 2002:a05:622a:5c8c:b0:3b6:30c5:6d26 with SMTP id
 ge12-20020a05622a5c8c00b003b630c56d26mr529704qtb.429.1674137124390; Thu, 19
 Jan 2023 06:05:24 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com> <20230119130053.111344-5-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-5-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 19 Jan 2023 16:04:48 +0200
Message-ID: <CAHp75VcCEJVx71H9MqNqPP+KAMDzgpx5v1P9h_h375ejeMa2+g@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] leds: led-class: Add generic [devm_]led_get()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
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
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 19, 2023 at 3:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Add a generic [devm_]led_get() method which can be used on both devicetree
> and non devicetree platforms to get a LED classdev associated with
> a specific function on a specific device, e.g. the privacy LED associated
> with a specific camera sensor.
>
> Note unlike of_led_get() this takes a string describing the function
> rather then an index. This is done because e.g. camera sensors might

than

> have a privacy LED, or a flash LED, or both and using an index
> approach leaves it unclear what the function of index 0 is if there is
> only 1 LED.
>
> This uses a lookup-table mechanism for non devicetree platforms.
> This allows the platform code to map specific LED class_dev-s to a specific
> device,function combinations this way.
>
> For devicetree platforms getting the LED by function-name could be made
> to work using the standard devicetree pattern of adding a -names string
> array to map names to the indexes.

...

> +/*
> + * This is used to tell led_get() device which led_classdev to return for
> + * a specific consumer device-name, function pair on non devicetree platforms.
> + * Note all strings must be set.
> + */
> +struct led_lookup_data {
> +       struct list_head list;
> +       const char *led_name;
> +       const char *consumer_dev_name;
> +       const char *consumer_function;
> +};

I'm wondering if it would be better to have something like

struct led_function_map {
       const char *name;
       const char *function;
};

struct led_lookup_data {
       struct list_head list;
       const char *dev_name;
       const struct led_function_map map[];
};

as you may have more than one LED per the device and it would be a
more compressed list in this case. I'm basically referring to the GPIO
lookup table.

-- 
With Best Regards,
Andy Shevchenko
