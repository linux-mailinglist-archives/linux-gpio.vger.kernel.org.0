Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB29E60C5EF
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Oct 2022 09:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbiJYH7O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Oct 2022 03:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiJYH7N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2022 03:59:13 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CC2169133
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2022 00:59:12 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id c31so1271101uae.10
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2022 00:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=POiVnTiHc9X7N8hVY0cMXv0XUMTtBCC7disU+JLan4o=;
        b=sS4vNS0n1ObcoSX1KrgOv7kqsWOP8qqKvvcpDhyYdEp8fLnwQk2BxRvLpU7gzmmSc+
         hZx14gwuF+DjP2BfMkdMPQC9FctQS/E4a4QpvWHtf7zSpLZRzE0bgkdYb+BPSRUfimrO
         0Lnwf9q7gRvDNwoB7G6D6Zd2To+IEwG4bskYtTweJe7o8faaXQ+eVuzMFrApoZnomtVi
         EcDbaMXi+5Erhwfz8VraQR1rt8UqUFqVWNtWn2hEqkkAC6ORUA+YGkJL29PpDNCaen49
         CDc8Snlr9b+9GgPoqvgvdbTni7Z370zMJGbzZOV52Ej5GC3M+aMywQzU1pWXKfRl71TB
         6kdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POiVnTiHc9X7N8hVY0cMXv0XUMTtBCC7disU+JLan4o=;
        b=2sLC+CuhO4WJlZggoLA6g4DZt727ABOX9MlSpnanNYUAGn/xfeZs7Cu2l5KXs3cqdU
         aiJK8S53aPgL4mVoOR4v4A7yLoV1SHb7QbdEiv1iv/d7XeSVzUYUWFlodVof+U3pdLF/
         tJA4R2E3YW3gS5fyCzg69HAjiCArh2vdQnuW2BIqZ+duYOGqSsEV2LwwkZKYOikBPwW2
         MG7DKbERUn86ZLDuWkv0APuB9Hl73rw+nBeXEshOLRRNA3sNXOGi09IQn39JH39QPkqq
         gBjFXKT7e0r2Rl6PsqPNPR3okTM4utIkOY6kYx7Q47aN2IsRDPQdE+LVADLlficIcmc/
         6oqA==
X-Gm-Message-State: ACrzQf0YhYhHJLpL4z4/6pFKd56n3TI5c+utOjxxpEayBF5TkhF2hl11
        65LFx7y6hVYFLDntLrPkkuOO2oDXD5lQxIHUgiiX5g==
X-Google-Smtp-Source: AMsMyM5WwZ0JIsztOelDmz8zAJdIn11gPe0cVi3leN/2y6zZsXO+tB7iaGPpdgiVrkADj0KBOSHP8A6BaA12AQ+FvzA=
X-Received: by 2002:ab0:2155:0:b0:3e2:bdc:cfa5 with SMTP id
 t21-20020ab02155000000b003e20bdccfa5mr21311272ual.119.1666684751678; Tue, 25
 Oct 2022 00:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1663519546.git.william.gray@linaro.org> <80c7fa6ca523b8a62f70aae8758fdf89771b742e.1663519546.git.william.gray@linaro.org>
In-Reply-To: <80c7fa6ca523b8a62f70aae8758fdf89771b742e.1663519546.git.william.gray@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 25 Oct 2022 09:59:00 +0200
Message-ID: <CAMRc=Mc-8W3gW-sXu1NwJ6+QqnbgEDH8Cwf56U3RRmrfZSLfVw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpio: idio-16: Introduce the ACCES IDIO-16 GPIO
 library module
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@intel.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 18, 2022 at 9:54 PM William Breathitt Gray
<william.gray@linaro.org> wrote:
>
> Exposes consumer library functions to facilitate communication with
> devices within the ACCES IDIO-16 family such as the 104-IDIO-16 and
> the PCI-IDIO-16.
>
> A CONFIG_GPIO_IDIO_16 Kconfig option is introduced by this patch.
> Modules wanting access to these idio-16 library functions should select
> this Kconfig option and import the GPIO_IDIO_16 symbol namespace.
>
> Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
> ---

Queued, thanks!

Bart
