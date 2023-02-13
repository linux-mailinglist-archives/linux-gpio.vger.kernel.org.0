Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E004694DB1
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Feb 2023 18:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbjBMRGh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Feb 2023 12:06:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbjBMRGf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Feb 2023 12:06:35 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524AD1EFFF
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 09:06:32 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bp15so19760801lfb.13
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 09:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i/n1VzIpjuUedXOfI3QLDNuih13WOod4KM2WM+q/V6I=;
        b=GOJfWNcI1ZLdOBCkKzJF+1HkfegOheFdmo5J+bx+MNHMNVyiOxjBnlcvj7m74kVrp0
         /5a5cvjwXPaBn0pwEtAII/uASNSRWP32CfNT3jhTX2Z1uH7YpBmeJUcSi/k7lZCbffwv
         wWljY27vfm2U4e9rujYDKvkXE2OWCC8CrDrX/Y6ltl+/3AQeS4QwEb+/LrWVXsX7Jisv
         XfJB3s9gU9ZtbGyTZ20EcIoqWH8N5Nhz5Mz1zF9y2L0qEO9+REg6LhVokbSZJ5jZqXMP
         kc4z8DXsSwEN2tXFIOkoYIkU8YBzgydgs9F94etEfXzrsm/xdCkaApXr0RoKZ/7KhR1w
         aMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/n1VzIpjuUedXOfI3QLDNuih13WOod4KM2WM+q/V6I=;
        b=zE7LMqZtT0sNFd4v4g7YZ0Hq1+7Xzi0xqRRcJhgGWw667eYByASg+Z4Y0CI5y5Hya2
         DbZFM1ahV1rhlZuLBXCmQsxWbbOACZhBb3sYarkMH6e+WDVlBuRVS4LTOQJDOaI9MBO4
         u0gy6y2r90GGyiFBjfBpuNkAGETKw6OyC8WaBmQ5ioagYcZVNw8hT/79WDqorM6A6oea
         6kVylosTQxiNoQl13q/Nyy1jEwYAnlX+kJtqozWuH5lNbXRMQbyLHEpwwhKx93EU5LaT
         VRqYLk9ZdH+eb9GsD5dI9o7+kRGppN7OEfvbNjbntc/UT27+M4ZvYrjW1l0DeGrQWCVS
         2RQw==
X-Gm-Message-State: AO0yUKU8nlPR/rw6fFa9hgISzu0cjR8AQFi0ir79pjvD1F5yrp50UoTz
        IcnSghlpmOK9WafrllGvP6Za8i6g307RyCywL6fsoB+pnI8=
X-Google-Smtp-Source: AK7set/anX5lzcMiCMdmBcc/F0FW7HFJMZ+5arjEdKbrDRTwVmFee56qquMRPxSpFSmZ0yleuUBEDdrE1xF6P4DFFlQ=
X-Received: by 2002:ac2:597b:0:b0:4cc:8a9c:3b14 with SMTP id
 h27-20020ac2597b000000b004cc8a9c3b14mr3981488lfp.14.1676307990388; Mon, 13
 Feb 2023 09:06:30 -0800 (PST)
MIME-Version: 1.0
References: <20230213170504.360265-1-brgl@bgdev.pl>
In-Reply-To: <20230213170504.360265-1-brgl@bgdev.pl>
From:   Peter Robinson <pbrobinson@gmail.com>
Date:   Mon, 13 Feb 2023 17:06:19 +0000
Message-ID: <CALeDE9MyrHTNF9Gpr04KAB0P+gn-cSpxQoFgWBUYR5niBzeUkg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: pass DESTDIR to setup.py
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Mon, Feb 13, 2023 at 5:05 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> As per automake docs:
>
> The DESTDIR variable can be used to perform a staged installation. The
> package should be configured as if it was going to be installed in its
> final location (e.g., --prefix /usr), but when running make install, the
> DESTDIR should be set to the absolute name of a directory into which the
> installation will be diverted. From this directory it is easy to review
> which files are being installed where, and finally copy them to their
> final location by some means.
>
> Prefix $(prefix) with $(DESTDIR) when calling setup.py.
>
> Reported-by: Peter Robinson <pbrobinson@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Peter Robinson <pbrobinson@gmail.com>
Tested-by: Peter Robinson <pbrobinson@gmail.com>

Fixes the build for Fedora, thanks.
> ---
>  bindings/python/Makefile.am | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
> index 9fb2e95..75ce53b 100644
> --- a/bindings/python/Makefile.am
> +++ b/bindings/python/Makefile.am
> @@ -18,7 +18,7 @@ all-local:
>
>  install-exec-local:
>         GPIOD_WITH_TESTS= \
> -       $(PYTHON) $(srcdir)/setup.py install --prefix=$(prefix)
> +       $(PYTHON) $(srcdir)/setup.py install --prefix=$(DESTDIR)$(prefix)
>
>  SUBDIRS = gpiod
>
> --
> 2.37.2
>
