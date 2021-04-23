Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE54836966E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Apr 2021 17:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243089AbhDWPyw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Apr 2021 11:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbhDWPyw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Apr 2021 11:54:52 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD63C06174A;
        Fri, 23 Apr 2021 08:54:15 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id gq23-20020a17090b1057b0290151869af68bso1408404pjb.4;
        Fri, 23 Apr 2021 08:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RliIAXFCU9asMSBrZ8w3BSRXx3maI5qdZESjLk6dJ0E=;
        b=a4QyjaKpyaPXe1EWmHlGOPWHdP7jGyhgo5N079g99Y6rnwUzjDCMnHIy04+rKHla+1
         iMPpmA0VnND06euz7iCw25WKMHiTyBc1APsu1Ykof5Nr2WQHzdZAeOa9gk0KZUb1hSaI
         qOAzklGuQ70wZuoBbjJJPNVQT41Aa9+eT2vBOrLnkxAfc8GL9wLtGso++JRoAAFHvyY2
         nfAwnFnQjFKhDWCyB9uuNC+BxM93p78vuCj/R6pYNTh0rPLXMDO9adtdZMUpq+aNFtw6
         UkY+O9rx7y5HIYhgKeQ7C4IT+es/hsfHBjU94uFzTbgiWFUcm2IhZAJjWFWIZE/wYEY3
         pPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RliIAXFCU9asMSBrZ8w3BSRXx3maI5qdZESjLk6dJ0E=;
        b=GHjLZCXCOwHoCvVd1+z3Qikz9q032CTcB2KVl1u/maVI2+EPpmerzXxaZQkI3brVDN
         eowonHpLeYet4gPCucSV/mscNHk0p0C5PjD3wfedMOvg5JLifu3SN67pQRCPOC63fp5h
         JekY3gmw1hu3ruto1P65BCqi9vzadpZizZGhTDuaMev8XZU6f9S8Pf0w+8kozoDTjSBe
         OLMEmi3mPnm6DXL9lJe0LElBq0MnEdpd5yuFOa38yRpNc/EXgDIInplNZO7RJPozPRyL
         Fiw2ciwtQGD5ZB1zCaqFr3HKKMmkFWQ//HER46W4eLbVrVLWmOoX4GV71QnaSMJHZAhU
         yZfA==
X-Gm-Message-State: AOAM530a0emccHc/VLtlVF7c40jXJTAiMtefn6fGGEK+6SyPSKJLn8CJ
        SLm0ixHs+WXyZEZpSGDn3Q5dE+TgmUVSrPjwEsOomPHTPrU=
X-Google-Smtp-Source: ABdhPJxRCmdPoAuqjKESpPNTps/Dmo/gjmnFeFGA61bNP3hse1uW5GFs672AASu6tRHG8PyFZ60K9buGFwzU6aCI9Q8=
X-Received: by 2002:a17:90b:1c0f:: with SMTP id oc15mr5337369pjb.228.1619193254802;
 Fri, 23 Apr 2021 08:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1619080202-31924-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
In-Reply-To: <1619080202-31924-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 23 Apr 2021 18:53:58 +0300
Message-ID: <CAHp75VfCbbnN-TBJiYFb=6Rhf30jA-Hz1p1UORsubF7UG6-ATw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>, saikrishna12468@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 22, 2021 at 11:31 AM Sai Krishna Potthuri
<lakshmi.sai.krishna.potthuri@xilinx.com> wrote:
>
> Adding pinctrl driver for Xilinx ZynqMP platform.
> This driver queries pin information from firmware and registers
> pin control accordingly.
>
> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>

You may reduce the number of LOCs by joining some lines. See below.

...

> +config PINCTRL_ZYNQMP
> +       tristate "Pinctrl driver for Xilinx ZynqMP"
> +       depends on ZYNQMP_FIRMWARE
> +       select PINMUX
> +       select GENERIC_PINCONF
> +       default ZYNQMP_FIRMWARE
> +       help
> +         This selects the pinctrl driver for Xilinx ZynqMP platform.
> +         This driver will query the pin information from the firmware
> +         and allow configuring the pins.
> +         Configuration can include the mux function to select on those
> +         pin(s)/group(s), and various pin configuration parameters
> +         such as pull-up, slew rate, etc.

Missed module name.

...

> +/*
> + * ZynqMP pin controller
> + *
> + * Copyright (C) 2020 Xilinx, Inc.

2021?

> + *
> + * Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> + * Rajan Vaja <rajan.vaja@xilinx.com>
> + */

...

> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/firmware/xlnx-zynqmp.h>

...

> +static int zynqmp_pinconf_cfg_get(struct pinctrl_dev *pctldev,
> +                                 unsigned int pin,
> +                                 unsigned long *config)
> +{
> +       unsigned int arg, param = pinconf_to_config_param(*config);
> +       int ret;

> +       if (pin >= zynqmp_desc.npins)
> +               return -EOPNOTSUPP;

Is it possible?

> +       switch (param) {
> +       case PIN_CONFIG_SLEW_RATE:
> +               param = PM_PINCTRL_CONFIG_SLEW_RATE;
> +               ret = zynqmp_pm_pinctrl_get_config(pin, param, &arg);
> +               break;
> +       case PIN_CONFIG_BIAS_PULL_UP:
> +               param = PM_PINCTRL_CONFIG_PULL_CTRL;

> +               ret = zynqmp_pm_pinctrl_get_config(pin, param, &arg);
> +               if (arg != PM_PINCTRL_BIAS_PULL_UP)
> +                       return -EINVAL;

Error code being shadowed. Instead check it here properly.

> +               arg = 1;
> +               break;
> +       case PIN_CONFIG_BIAS_PULL_DOWN:
> +               param = PM_PINCTRL_CONFIG_PULL_CTRL;
> +               ret = zynqmp_pm_pinctrl_get_config(pin, param, &arg);
> +               if (arg != PM_PINCTRL_BIAS_PULL_DOWN)
> +                       return -EINVAL;

Ditto.

> +               arg = 1;
> +               break;
> +       case PIN_CONFIG_BIAS_DISABLE:
> +               param = PM_PINCTRL_CONFIG_BIAS_STATUS;
> +               ret = zynqmp_pm_pinctrl_get_config(pin, param, &arg);
> +               if (arg != PM_PINCTRL_BIAS_DISABLE)
> +                       return -EINVAL;

Ditto.

> +               arg = 1;
> +               break;
> +       case PIN_CONFIG_POWER_SOURCE:
> +               param = PM_PINCTRL_CONFIG_VOLTAGE_STATUS;
> +               ret = zynqmp_pm_pinctrl_get_config(pin, param, &arg);
> +               break;
> +       case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +               param = PM_PINCTRL_CONFIG_SCHMITT_CMOS;
> +               ret = zynqmp_pm_pinctrl_get_config(pin, param, &arg);
> +               break;
> +       case PIN_CONFIG_DRIVE_STRENGTH:
> +               param = PM_PINCTRL_CONFIG_DRIVE_STRENGTH;
> +               ret = zynqmp_pm_pinctrl_get_config(pin, param, &arg);
> +               switch (arg) {
> +               case PM_PINCTRL_DRIVE_STRENGTH_2MA:
> +                       arg = DRIVE_STRENGTH_2MA;
> +                       break;
> +               case PM_PINCTRL_DRIVE_STRENGTH_4MA:
> +                       arg = DRIVE_STRENGTH_4MA;
> +                       break;
> +               case PM_PINCTRL_DRIVE_STRENGTH_8MA:
> +                       arg = DRIVE_STRENGTH_8MA;
> +                       break;
> +               case PM_PINCTRL_DRIVE_STRENGTH_12MA:
> +                       arg = DRIVE_STRENGTH_12MA;
> +                       break;
> +               default:
> +                       /* Invalid drive strength */
> +                       dev_warn(pctldev->dev,
> +                                "Invalid drive strength for pin %d\n",
> +                                pin);
> +                       return -EINVAL;
> +               }
> +               break;
> +       default:
> +               ret = -EOPNOTSUPP;
> +               break;
> +       }
> +
> +       if (ret)
> +               return ret;
> +
> +       param = pinconf_to_config_param(*config);
> +       *config = pinconf_to_config_packed(param, arg);
> +
> +       return 0;
> +}

...

> +                       ret = -EOPNOTSUPP;

Isn't it ENOTSUP for all cases here?

...

> +       ret = zynqmp_pm_query_data(qdata, payload);
> +       if (ret)
> +               return ret;
> +
> +       *ngroups = payload[1];
> +

> +       return ret;

return 0;

...

> + * Query firmware to get group IDs for each function. Firmware returns
> + * group IDs. Based on group index for the function, group names in

on the group

> + * the function are stored. For example, the first group in "eth0" function
> + * is named as "eth0_0" and second group as "eth0_1" and so on.

and the second

> + *
> + * Based on the group ID received from the firmware, function stores name of
> + * the group for that group ID. For example, if "eth0" first group ID
> + * is x, groups[x] name will be stored as "eth0_0".
> + *
> + * Once done for each function, each function would have its group names
> + * and each groups would also have their names.

each group

...

> +done:
> +       func->groups = fgroups;
> +
> +       return ret;

return 0; ?

...

> +       *nfuncs = payload[1];
> +
> +       return ret;

Ditto.

...

> +       ret = zynqmp_pm_query_data(qdata, payload);
> +       if (ret)
> +               return ret;
> +
> +       memcpy(groups, &payload[1], PINCTRL_GET_PIN_GROUPS_RESP_LEN);
> +
> +       return ret;

Ditto.

...

> + * Query firmware to get groups available for the given pin.
> + * Based on the firmware response(group IDs for the pin), add
> + * pin number to the respective group's pin array.
> + *
> + * Once all pins are queries, each groups would have its number

each group

> + * of pins and pin numbers data.

...

> +       return ret;

return 0;

...

> + * Query number of functions and number of function groups (number
> + * of groups in given function) to allocate required memory buffers

in the given

> + * for functions and groups. Once buffers are allocated to store
> + * functions and groups data, query and store required information
> + * (number of groups and group names for each function, number of
> + * pins and pin numbers for each group).

...

> +       pctrl->funcs = funcs;
> +       pctrl->groups = groups;
> +
> +       return ret;

return 0;

...

> +       *npins = payload[1];
> +
> +       return ret;

Ditto.

...

> +               dev_err(&pdev->dev, "pin desc prepare fail with %d\n",
> +                       ret);

One line.

...

> +               dev_err(&pdev->dev, "function info prepare fail with %d\n",
> +                       ret);

Ditto.

...

> +       pctrl->pctrl = pinctrl_register(&zynqmp_desc, &pdev->dev, pctrl);

devm_pinctrl_register()

> +       if (IS_ERR(pctrl->pctrl))
> +               return PTR_ERR(pctrl->pctrl);

...

> +};

> +

Extra blank line.

> +MODULE_DEVICE_TABLE(of, zynqmp_pinctrl_of_match);

...

> +};

> +

Ditto.

> +module_platform_driver(zynqmp_pinctrl_driver);

-- 
With Best Regards,
Andy Shevchenko
