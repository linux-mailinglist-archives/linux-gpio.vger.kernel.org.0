Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 462D54F48F
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Jun 2019 11:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfFVJB5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Jun 2019 05:01:57 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46442 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbfFVJB5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 22 Jun 2019 05:01:57 -0400
Received: by mail-ot1-f67.google.com with SMTP id z23so8639845ote.13;
        Sat, 22 Jun 2019 02:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Am4zNsdjshHM90JZDzFjZuL0ON4HFAuYzga2LSkhurU=;
        b=UBIW+RBcEg0qQ1QY+1EPmrh2kYSmClrFI2v2mHHyxEyEDYfTyD7myhbjX45SFAFWEr
         5g1KBLUsXQWgec+1OJNbNlWVN05icc0Xe+VfSTi1A91jlmz8GOZHSzkNbVIZjM6X47GB
         3qI9S7yXxbb0A7tWYK1xpEcgIX1JUIEngLXTFzhenTL4szhQo7ABAQTzfnJvT3mHJdk2
         exweCgqiz7i2RLEVs7dwaQCXPJhF6w7tNk9otlflP+Yfqr/TLl6DNF8IId+/I2lDhnyD
         TuWvkeYrDLUp4HIfqlwxr/ff0fDo/YR8qsudJtcPBNdEgHqIXKUxYlZw5tqwqkNkoitw
         X5iQ==
X-Gm-Message-State: APjAAAVjMVfP1FD8ybcU9hovrfU/cvBowka5GdyN+fA/Y8sBOM+txM6o
        0X21H3q3lXJs7k+lPsg6GUn/jyH8bogD0ZUFtCE=
X-Google-Smtp-Source: APXvYqwdxb7u3LZKydtaWtFS50RQkYKAv2KRBoAKm2g76GJd1iOJ+Trs5tf78028BvvvjXrT7G0dVz7TZ/OOLIi/h68=
X-Received: by 2002:a9d:5d15:: with SMTP id b21mr14204964oti.262.1561194115936;
 Sat, 22 Jun 2019 02:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190621151725.20414-1-thierry.reding@gmail.com>
In-Reply-To: <20190621151725.20414-1-thierry.reding@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Sat, 22 Jun 2019 11:01:44 +0200
Message-ID: <CAJZ5v0iZ9Y3eAMe-kODqiXYzycb7MtxtzMbs_qgwcjhYUJ2geQ@mail.gmail.com>
Subject: Re: [PATCH v3] driver: core: Allow subsystems to continue deferring probe
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 21, 2019 at 5:17 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Some subsystems, such as pinctrl, allow continuing to defer probe
> indefinitely. This is useful for devices that depend on resources
> provided by devices that are only probed after the init stage.
>
> One example of this can be seen on Tegra, where the DPAUX hardware
> contains pinmuxing controls for pins that it shares with an I2C
> controller. The I2C controller is typically used for communication
> with a monitor over HDMI (DDC). However, other instances of the I2C
> controller are used to access system critical components, such as a
> PMIC. The I2C controller driver will therefore usually be a builtin
> driver, whereas the DPAUX driver is part of the display driver that
> is loaded from a module to avoid bloating the kernel image with all
> of the DRM/KMS subsystem.
>
> In this particular case the pins used by this I2C/DDC controller
> become accessible very late in the boot process. However, since the
> controller is only used in conjunction with display, that's not an
> issue.
>
> Unfortunately the driver core currently outputs a warning message
> when a device fails to get the pinctrl before the end of the init
> stage. That can be confusing for the user because it may sound like
> an unwanted error occurred, whereas it's really an expected and
> harmless situation.
>
> In order to eliminate this warning, this patch allows callers of the
> driver_deferred_probe_check_state() helper to specify that they want
> to continue deferring probe, regardless of whether we're past the
> init stage or not. All of the callers of that function are updated
> for the new signature, but only the pinctrl subsystem passes a true
> value in the new persist parameter if appropriate.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Overall

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

with one nit below.

> ---
> Changes in v3:
> - add new function rather than extend the existing function with flags
>
> Changes in v2:
> - pass persist flag via flags parameter to make the function call easier
>   to understand
>
>  drivers/base/dd.c            | 55 ++++++++++++++++++++++++++++++------
>  drivers/pinctrl/devicetree.c |  7 ++---
>  include/linux/device.h       |  1 +
>  3 files changed, 51 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 0df9b4461766..994a90747420 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -235,6 +235,19 @@ static int __init deferred_probe_timeout_setup(char *str)
>  }
>  __setup("deferred_probe_timeout=", deferred_probe_timeout_setup);
>
> +static int __driver_deferred_probe_check_state(struct device *dev)
> +{
> +       if (!initcalls_done)
> +               return -EPROBE_DEFER;
> +
> +       if (!deferred_probe_timeout) {
> +               dev_WARN(dev, "deferred probe timeout, ignoring dependency");
> +               return -ETIMEDOUT;
> +       }
> +
> +       return 0;
> +}
> +
>  /**
>   * driver_deferred_probe_check_state() - Check deferred probe state
>   * @dev: device to check
> @@ -248,14 +261,40 @@ __setup("deferred_probe_timeout=", deferred_probe_timeout_setup);
>   */
>  int driver_deferred_probe_check_state(struct device *dev)
>  {
> -       if (initcalls_done) {
> -               if (!deferred_probe_timeout) {
> -                       dev_WARN(dev, "deferred probe timeout, ignoring dependency");
> -                       return -ETIMEDOUT;
> -               }
> -               dev_warn(dev, "ignoring dependency for device, assuming no driver");
> -               return -ENODEV;
> -       }
> +       int ret;
> +
> +       ret = __driver_deferred_probe_check_state(dev);
> +       if (ret < 0)

The function returning this valie doesn't return positive numbers, so
it "if (ret)" would be sufficient here (and below).

> +               return ret;
> +
> +       dev_warn(dev, "ignoring dependency for device, assuming no driver");
> +
> +       return -ENODEV;
> +}
> +
> +/**
> + * driver_deferred_probe_check_state_continue() - check deferred probe state
> + * @dev: device to check
> + *
> + * Returns -ETIMEDOUT if deferred probe debug timeout has expired, or
> + * -EPROBE_DEFER otherwise.
> + *
> + * Drivers or subsystems can opt-in to calling this function instead of
> + * directly returning -EPROBE_DEFER.
> + *
> + * This is similar to driver_deferred_probe_check_state(), but it allows the
> + * subsystem to keep deferring probe after built-in drivers have had a chance
> + * to probe. One scenario where that is useful is if built-in drivers rely on
> + * resources that are provided by modular drivers.
> + */
> +int driver_deferred_probe_check_state_continue(struct device *dev)
> +{
> +       int ret;
> +
> +       ret = __driver_deferred_probe_check_state(dev);
> +       if (ret < 0)
> +               return ret;
> +
>         return -EPROBE_DEFER;
>  }
