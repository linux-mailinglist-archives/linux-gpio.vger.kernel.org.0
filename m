Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFC4767F074
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 22:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjA0Vfj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 16:35:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjA0Vfi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 16:35:38 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 020C25A351
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 13:35:38 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id n2so4171316pfo.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 13:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ct9ck9vkM14O2ZHT6Pqc9iBFx3XHxaDWOS1C2RoVEAU=;
        b=YcZG93rCx580JM+/kJQjqJNGa6Jgb6/qZiN5/YfvP4kIVBbWkUzJ8hwxXNlx8Ewpwo
         LqnLq1rlR7zfYs9S4f0XcmnwRYZDOvhEUroawwmqv2wyiiIIaIK8TvTrrGC/9Q5a4i7o
         /H9LS2x4jHEq2tldPYhckGPvwPm/D6ztPdWkLVVNLbhVASfIVLJ7VdQvtLLDOtAbpZDl
         mOQv0isg2ZCsQdiIbaXX0WC3KR9suV8MFrv41WyqGXwMi55LYe1tgFvcvKD6WR3wetWZ
         itqs0kGWR9UYPR5om9kTa4s6pQeQceN/FpGWkJJLYK96iPp3ebtI0ncdPp7Y4tYKAGB9
         WMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ct9ck9vkM14O2ZHT6Pqc9iBFx3XHxaDWOS1C2RoVEAU=;
        b=pnEMrS/zB8VkJSAy1nNfwr8h9lfu95q7hNIAgZrDrIA4UV5q1tBEoolq4fEY2o0m02
         2WAADm2N0kWkMidNBJQ/FtQuujbIKbZTuCuvVm1ys2OtYAIXPzMnRlMgeGDzdnIxq5Vy
         3186MU0qC5juK7JXKnblAnh5Jm9z+dI+9aLFPytNN8yU2zbPH6/o5T/l1c9Wvwv7UnJJ
         Y5xE8p7ItNhs+YaFil9Xcu200yhMvrp2IwkQ851FOjTXPJQmlKH458e09sNXcF+HlK1/
         vMXMFMUF5/LsgWejFEi1f6xmy7BLRz1m5cBoEbK3IC6FE+Ypzu78sCOxyPu5DrNgx3NC
         l2Pw==
X-Gm-Message-State: AO0yUKU5tFfKmssnfCJA+io6aarU56MD6LlInh7rUk5xx4NpIGDOfaSP
        KDfZ/9h466SqtuXNZaCwdVnNUKrTJGZR44PSka/NCw==
X-Google-Smtp-Source: AK7set8A87a1b6gwb4OnNq2XRUc7qhsa9qKHiaWo49QwN+9e+0qsFtowQYDUOK06dTepf46OknaZKx06adJ0S04TZoY=
X-Received: by 2002:aa7:91d3:0:b0:592:61cc:5aeb with SMTP id
 z19-20020aa791d3000000b0059261cc5aebmr608421pfa.59.1674855336983; Fri, 27 Jan
 2023 13:35:36 -0800 (PST)
MIME-Version: 1.0
References: <20230127001141.407071-1-saravanak@google.com> <Y9Q0culPHGNZkQz9@euler>
In-Reply-To: <Y9Q0culPHGNZkQz9@euler>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 27 Jan 2023 13:35:00 -0800
Message-ID: <CAGETcx9oohQ0SeHGQNsbVpitG-freYhbTUm34TbzMQAeLGjSfw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] fw_devlink improvements
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        John Stultz <jstultz@google.com>,
        Doug Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxim Kiselev <bigunclemax@gmail.com>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Jean-Philippe Brucker <jpb@kernel.org>,
        kernel-team@android.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 27, 2023 at 12:30 PM Colin Foster
<colin.foster@in-advantage.com> wrote:
>
> On Thu, Jan 26, 2023 at 04:11:27PM -0800, Saravana Kannan wrote:
> > Dmitry, Maxim(s), Miquel, Luca, Doug, Colin, Martin, Jean-Philippe,
> >
> > I've Cc-ed you because I had pointed you to v1 of this series + the
> > patches in that thread at one point or another as a fix to some issue
> > you were facing. It'd appreciate it if you can test this series and
> > report any issues, or things it fixed and give Tested-bys.
>
> I applied this on my working net-next/main development branch and can
> confirm I am able to successfully boot the Beaglebone Black.
>
> Tested-by: Colin Foster <colin.foster@in-advantage.com>

Thanks!

-Saravana
