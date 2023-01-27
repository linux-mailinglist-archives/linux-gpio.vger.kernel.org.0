Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F177467E6D8
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 14:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234798AbjA0NgC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 08:36:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233969AbjA0NgB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 08:36:01 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B547B783
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:35:59 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id c124so5949726ybb.13
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e4oFi6GR9CTLUrV5CHMl42z5mIKCPPEmeaNVyp/QHM4=;
        b=i0RpOSyZA4exS95MmcKnDP8qEMRgJtuUYNcrJOvPuNrLDr1GKJNlGyEa+NZWr9vlsi
         oF0NO/BlO+PP5NH0wpzo0pSIxpZT/VIQ06KljihxbzkDevIUW49A4kkIG8t5yx0yJvYk
         x2nRbGtgvjZqcgbEQULfk4yuXO0r4k5BIhs/hkY560Gb1CzqkxvrM2pcRrTcONpLBzLj
         4hChtgy9J3nuVoxazAhrONVtToxS9EMH/QKJltwOZAyXMV6q/g24663pe9+y58G8KM5+
         eAPIptqqrSBMktlabXAKqpm+xjahQvFHSfYL33ZMblslaCDjlqBjA8jHuCC5diZ0A/7o
         VxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4oFi6GR9CTLUrV5CHMl42z5mIKCPPEmeaNVyp/QHM4=;
        b=OKUhMx13vGpvDf32xzSVrefjke9eKlyaonW58Fi87oFf7TlPkTSJvWMvEKYrzNMV5e
         JdzioEbb+aVfKp6Z+aeeq1vKwScGIcs7+P9LxNT9F1qHxxC8tk2xhL5avFbdJRMI5T9d
         3dSwktqj9aoLzZb0D1hd4jZfkmkI7T/0qeLyzIBfBp/uYCB+ittc8iv8AlYFyvH/h1jZ
         4tG/XwLqoWw5RzY7umk++0Pwg71pMZxP/e3DQs5sO8VKOAulSbVT0WBMqb69rGssf6a4
         +PfE49oR9SM+XVoKF0cntNHYlfjjwF6Of8paqhmUqUpKWyQZWJjJZgVi6YgqU/Oaf2lY
         EsXg==
X-Gm-Message-State: AO0yUKWLzeNSfpmST6qtZN+7t1FVk+blDi7K6A8VWuPIBDsuv8c7BT/w
        JG1FaFvEHV1m/bM1kBrQ6oUlwnAhHlH9S1ZefvsSpg==
X-Google-Smtp-Source: AK7set9zuzETPV93oELM5VqaLRMLHJEm1IVTmICv9xmhfyROT8hY4qwFZc/DvYLQwkyO6Ag1OaPISVbLjwEzJ/IjnRk=
X-Received: by 2002:a25:d1d1:0:b0:80b:4d84:b25 with SMTP id
 i200-20020a25d1d1000000b0080b4d840b25mr1327925ybg.584.1674826558839; Fri, 27
 Jan 2023 05:35:58 -0800 (PST)
MIME-Version: 1.0
References: <20230127101149.3475929-1-arnd@kernel.org> <20230127101149.3475929-5-arnd@kernel.org>
In-Reply-To: <20230127101149.3475929-5-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 14:35:47 +0100
Message-ID: <CACRpkda4aF8_veseycZFm+QRgzzz2ybRBudB2za=wjGBn6vYAw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] gpiolib: remove gpio_set_debounce
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
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

On Fri, Jan 27, 2023 at 11:12 AM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> gpio_set_debounce() only has a single user, which is trivially
> converted to gpiod_set_debounce().
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
