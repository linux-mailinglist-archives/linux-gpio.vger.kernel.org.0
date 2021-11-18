Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18A2F455D21
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 14:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbhKROBY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 09:01:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbhKROBX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 09:01:23 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315AAC061570;
        Thu, 18 Nov 2021 05:58:23 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id x15so27479756edv.1;
        Thu, 18 Nov 2021 05:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=y0vx4+ixiovzO4f0kfRSDoq7ClYK1YfOauC6IXWLlsQ=;
        b=YoAESI9WTSsXndwjO7IJ419ufrwwnscyO87g9A3dWLokrhVbAYTTTytt1lS2Nk84e0
         QdsvvzIiAjeT9sDxjVWGT3HIqrqTYtdtcfUoHDCD8dePjCcDwCLUsBBSyK+zyfJdVdk6
         oaB42TV3s138U5VDDYFtE/zCQEgJeSixD0hqrQoilYYHKHZW+dJ6yGsIcfgvKUGY0OSb
         2Lm3H8qOM7T58AvnWwbTzhchB4VEPTNeiwku0qQWD1EuIMkjPIyecPTbvzZFrwVuOJJS
         oAxf+z9DbmKh4CfRvR7S7gBdLQkfJ3Sx/bSJH3kWHMNXo+tDvD+8NHSKco2CouBOUKCC
         NcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=y0vx4+ixiovzO4f0kfRSDoq7ClYK1YfOauC6IXWLlsQ=;
        b=r7ALSA3PywvpMTCCITx0qCotNjPVT3xUcnr7aII12oAMtz1X0RIY2+EfSJDQ6bJO6t
         9WqxBYfXnwNIapWEFz2UXcsDEDLgjhChSAGmvgfL2DBS/+7flP8ggImZUMMPtChiSOon
         2GzdmgC7o/7XW3L33TBTH2EK1Dfo4vcXpZ/Y0n36AVLaNDZTN9523w8dLjploXA7ce0k
         Rd/omS5t/7znFBRRFEC1XFzF4jEnYHDM6kHUd/UByKJb7u5BjOH92ezjPoix8EQWIOub
         pIPKAuXft75LHdquki+i4lJXJc6lKcC6I1koSBpS9zUTO3MD/gbeKKURI+E+hho1eEFF
         5KHQ==
X-Gm-Message-State: AOAM5302vFWuTpuMvEGS9iEL188mXrpJXwKT851hunHAZ+8G9Kaa6XaH
        IiEtB0RVUqeOHPJIp9kp6E8TVIiYZJKXrKpp0RFFlzj+wDg=
X-Google-Smtp-Source: ABdhPJxV1YDDh2iUG4vnQ4DfSEu6WyVLtMWTuFwFN1VtyxlOocauQAXMSdQqwMHjHarxAUny7lvDTHzgu+tpvhKvxvs=
X-Received: by 2002:a17:907:9196:: with SMTP id bp22mr32871449ejb.69.1637243901828;
 Thu, 18 Nov 2021 05:58:21 -0800 (PST)
MIME-Version: 1.0
References: <20211118132152.15722-1-zajec5@gmail.com> <20211118132152.15722-4-zajec5@gmail.com>
In-Reply-To: <20211118132152.15722-4-zajec5@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 Nov 2021 15:57:41 +0200
Message-ID: <CAHp75VebQKsSJYxK9Fi0wEhGfpR=1HZfDsVuqV8BCG-UrZDtVg@mail.gmail.com>
Subject: Re: [PATCH 3/5] pinctrl: add helpers reading pins, groups & functions
 from DT
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 3:22 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:

...

> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c

> +#include <linux/of.h>

I don't like this. This shows not thought through the design of the series.

What I rather expect is a proper interfacing layer that you fill with
options that can be provided by corresponding underlying
implementation, e.g. DT.

Moreover, before doing this you probably would need to refactor the
pin control core to get rid of DT specifics, i.e. abstract them away
first.

--=20
With Best Regards,
Andy Shevchenko
