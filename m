Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538833419D7
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 11:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbhCSKX3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 06:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbhCSKX2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Mar 2021 06:23:28 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E275C06174A;
        Fri, 19 Mar 2021 03:23:28 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id v186so3365846pgv.7;
        Fri, 19 Mar 2021 03:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DPz82Wih6gqZ8VSaJqcSMCc8Ras1gd2Q3uZAvSXbqQ8=;
        b=BKyol9P0QpnZtp/9cLwAm1HP2rD8CnTYHP8ZU9MkyhxCloORjNF+RxqzbyxWJe01UM
         LvacZtig/VNN2Vaz+FDw+KGU04X8CsSFzwvY5hyv/7+uJLMhClsM1S07lOLt3DqKaMfa
         i+pkvvg1Fh0LF596kcDEl/DcxlHuOBfWTh8yGdn6tcu00B9aP5u9y26Qaomp4YGLnixq
         SGvbCmW6ToDC9St2+EePh/8yqHZQEnlNbPnRCwmjEhMnLQe+QDWe+U9h1SqFFI2vJTco
         yDQiFBx3ebcreehHY7GDMYblDWnOICu3FXSKcZS51Xr1UyXMDfTucO6EyKS9lguDgR/S
         j4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DPz82Wih6gqZ8VSaJqcSMCc8Ras1gd2Q3uZAvSXbqQ8=;
        b=cTGImwSVzx6it+jGzd7oi9emGzkCS/iZqEERxKZDkrcV7+L13A617chJqOkHHZCJ4y
         IXHvbgzLY5/EYROkrmaZJD8sVeoAFH7ouaI8IJ+qpI5naY97+SvmCdsHoRsqk2Dmn6sW
         TKa83p3aX15EBXP2RivlayGsjPQU/ueE0JNN9ivDVoIcdHg5Wz1su980sR9nHOYCxlFZ
         Xe/BWQJB8OVsTIKz4kfR2dSwVV0fRO8n/ZCLdz+lin2diSj8ufRrbksHbaOYltcQe0N+
         yLfeOil2kMiWaxTu8NHJUSOnqbXI5nkTZWsyxdpw9Qlj5PYwPQcK2Cg8Uc2SJTOG2Whs
         X0KQ==
X-Gm-Message-State: AOAM532P36aSjTiNPG13fNMQC5jlnNQFVZm6qjmz3lamU/rnGIu917lP
        uxbk2BFrmywYwVvT8ouU8gJBvud5GbP6RXFHBIc=
X-Google-Smtp-Source: ABdhPJwu38Bc10kWbxryKsn/pGkq14M0/lvN1feRCzg0Q7THgJoMD8lOOOT4hx67A6MYRi9z59lcNpPJxuVLBNJTzw4=
X-Received: by 2002:a65:4bc5:: with SMTP id p5mr10651822pgr.74.1616149407766;
 Fri, 19 Mar 2021 03:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <1615969516-87663-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1615969516-87663-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VehkqzDPQp87JL=hnCi_b4y0d3htpxRKBJ2q73AAAbBXA@mail.gmail.com> <SN6PR02MB3917DC23268D35870E85F37DBD699@SN6PR02MB3917.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB3917DC23268D35870E85F37DBD699@SN6PR02MB3917.namprd02.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 19 Mar 2021 12:23:11 +0200
Message-ID: <CAHp75VcbxvVsQRP_0J0mXb5vPhBor7=cq-4nqMNb-+D_+O1cdA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
To:     Sai Krishna Potthuri <lakshmis@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 18, 2021 at 4:42 PM Sai Krishna Potthuri
<lakshmis@xilinx.com> wrote:
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Wednesday, March 17, 2021 6:26 PM
> > On Wed, Mar 17, 2021 at 10:27 AM Sai Krishna Potthuri
> > <lakshmi.sai.krishna.potthuri@xilinx.com> wrote:

...

> > > +config PINCTRL_ZYNQMP
> > > +       bool "Pinctrl driver for Xilinx ZynqMP"
> >
> > Why not module?
> As most of the Xilinx drivers depending on the pin controller driver for
> configuring the MIO pins, we are not supporting to build this driver as
> a module.

OK.

> > > +       depends on ARCH_ZYNQMP
> > > +       select PINMUX
> > > +       select GENERIC_PINCONF

...

> > > +#include <linux/init.h>
> > > +#include <linux/of_address.h>
> >
> > > +#include <linux/pinctrl/pinmux.h>
> > > +#include <linux/pinctrl/pinconf-generic.h>
> >
> > Can you move this group of headers after linux/* ?
> >
> > > +#include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
> >
> > Can it be moved outside of these headers
> >
> > > +#include <linux/platform_device.h>
> > > +#include <linux/firmware/xlnx-zynqmp.h>
> >
> > Ordering (for all groups of headers)?
> Ok, I will order the headers in the below order
> #include <linux/*>
> #include <linux/firmware/xlnx-zynqmp.h>

+ blank line

> #include <linux/pinctrl/*>

+ blank line

> #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>

Looking into other drivers with similar includes, shouldn't it go
first in the file before any other linux/* asm/* etc?

> > > +#include "core.h"
> > > +#include "pinctrl-utils.h"

...

> > > +       PIN_CONFIG_IOSTANDARD = PIN_CONFIG_END + 1, };
> >
> > I'm lost here. What is IO standard exactly? Why it can't be in generic
> > headers?
> It represents LVCMOS 3.3 volts/ LVCMOS 1.8 volts.
> Since this is specific to Xilinx ZynqMP platform, considered to be added in
> the driver file.

So, why can't we create a couple of bits to represent this voltages in
the generic header and gain usability for others as well?

Linus?

...

> > > +       ret = zynqmp_pm_pinctrl_request(pin);
> > > +       if (ret) {
> > > +               dev_err(pctldev->dev, "request failed for pin %u\n",
> > > + pin);
> >
> > > +               return -EIO;
> >
> > Why shadowing error code?

So, any comments on the initial Q?

>>  Since it's the only possible error, why is it not
> > reflected in the kernel doc?
> I will update the kernel doc with the error value for such cases.
> >
> > > +       }

...

> > > +               default:
> > > +                       /* Invalid drive strength */
> > > +                       dev_warn(pctldev->dev,
> > > +                                "Invalid drive strength for pin %d\n",
> > > +                                pin);
> > > +                       return -EINVAL;
> > > +               }
> > > +               break;
> > > +       default:
> > > +               ret = -EOPNOTSUPP;
> > > +               break;
> > > +       }
> > > +
> > > +       param = pinconf_to_config_param(*config);
> > > +       *config = pinconf_to_config_packed(param, arg);
> > > +
> > > +       return ret;
> >
> > This is wrong. You have to return the error codes directly and do not touch
> > *config as long as error happens.
> I will update the *config and param under if (!ret) condition.

Simpler and better just to return errors immediately from the
switch-case entries.

...

> > > +       fgroups = devm_kzalloc(dev, sizeof(*fgroups) * func->ngroups,
> > > +                              GFP_KERNEL);
> >
> > One line
> With single line it is crossing 80 line bar and getting the checkpatch warning,
> hence split into two lines.

No, you may not get a checkpatch warning. Are you working on v5.4
kernels or earlier?

> > > +       if (!fgroups)
> > > +               return -ENOMEM;

...

> > > +static int zynqmp_pinctrl_prepare_group_pins(struct device *dev,
> > > +                                            struct zynqmp_pctrl_group *groups,
> > > +                                            unsigned int ngroups) {
> > > +       unsigned int pin;
> > > +       int ret = 0;
> >
> > Redundant assignment.
> Static analyzer tool will throw warning as it expects the variable to be
> Initialized in all possible paths.

Because you need to explicitly return 0 at the end of the function.
Don't follow static analyzers or other tools blindly. Think about all aspects.

> I will cross check on this and remove if it is not the case.
> >
> > > +       for (pin = 0; pin < zynqmp_desc.npins; pin++) {
> > > +               ret = zynqmp_pinctrl_create_pin_groups(dev, groups, pin);
> > > +               if (ret)
> > > +                       return ret;
> > > +       }
> > > +
> > > +       return ret;
> > > +}

...

> > > +       groups = devm_kzalloc(dev, sizeof(*groups) * pctrl->ngroups,
> > > +                             GFP_KERNEL);
> >
> > One line.
> It will cross 80 line mark if we make it to a single line.

I don't think it's a problem in this case.

> > > +       if (!groups)
> > > +               return -ENOMEM;

--
With Best Regards,
Andy Shevchenko
