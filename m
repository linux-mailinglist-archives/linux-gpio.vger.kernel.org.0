Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBB9910537E
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 14:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbfKUNrv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 08:47:51 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38019 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbfKUNrt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 08:47:49 -0500
Received: by mail-lf1-f68.google.com with SMTP id q28so2696956lfa.5
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 05:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=caR6qyLZA2YX7N7il9mca3/oNrJ97AvufKAxX/7X/t8=;
        b=VIOo/PijKlmTSU7k0uUlEiwuwGggZG8iMvFBgbHGqH3hmFkbc7hcNTpuA2Yt6Cn4Ad
         /lfSamtVILY6w7FdAeX0LJi3VKe0umgThLTkOJhBUEMxgI7AgmPV61OKo+0mS//DXmCh
         u9UnjJeDzQhddnd97dgJpVt9Z0YM7OEqiF7miH5p/LiPTrOS/czCCvaH/F1Y4NsmWsCq
         GpIg4Y0/44ndROWiiTsCfDKF2VAYDV248vAzZ3GJ3DIzDQo/H1DXLF8JYL/pE/UsjdZD
         VXfiOSZRONiaBM5yymz7ZzHrtf1sN3F1W+SpvLbJWMqPG565b9wKefLTwAM2HuZAuqpB
         jeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=caR6qyLZA2YX7N7il9mca3/oNrJ97AvufKAxX/7X/t8=;
        b=AxcqxZE80wnMUkrXs5ULjySaWMj398SvKT1BT+0aW55b7hyOPTLrmrrMYtB+DjPOzC
         q0q5ONwEuuinQ6LpsA74IN3RBfyCsNn9Bm/3ZLKV7fBhae/H/ZYla4bjGkOXan57TjC5
         C1PlaVlJEzO6sUFwkkORTuQEWfNXzL4qXOl/GgtKkl0igZR9RD9gZtiG4JF3SV3alaqd
         e1bXTB7XFs24qneNMcl015SU9FVCnfECEB49qTDmOzoVXzCC8xDT2If8m/222kH6XW5e
         GrcM23cdiqgtIxd8VTCce+OATqtktIQnI95MQ/CSPODxOh2kZySASsu7KzTTNEcS3Zmm
         ZMWA==
X-Gm-Message-State: APjAAAVZeLc7boHQGBoF0MnztBtf9de5iqWB+pEcsjfkAzfGeICQnsz7
        /b4ej391eh0a33vUhjeFA7Mk8Z1zgPysbhJ7LHPTzg==
X-Google-Smtp-Source: APXvYqwmI6/VvWRaqBNjK+cmiCSG+6Hkt0rYjH/6YkTQW3OXM2cQ1jv6rZofTokHslVnUliyq+XhtrmS88hodfLf9eU=
X-Received: by 2002:ac2:5b86:: with SMTP id o6mr7754208lfn.44.1574344067468;
 Thu, 21 Nov 2019 05:47:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573797249.git.rahul.tanwar@linux.intel.com> <33e649758b70490f01724a887c490d5008c7656d.1573797249.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <33e649758b70490f01724a887c490d5008c7656d.1573797249.git.rahul.tanwar@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 14:47:36 +0100
Message-ID: <CACRpkdaoiYvcMVCyJJTSyvSZUMAj6QsCcGG3=s4or31r08=hdg@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] pinctrl: Add pinmux & GPIO controller driver for a
 new SoC
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rahul,

On Fri, Nov 15, 2019 at 10:25 AM Rahul Tanwar
<rahul.tanwar@linux.intel.com> wrote:

> Intel Lightning Mountain SoC has a pinmux controller & GPIO controller IP which
> controls pin multiplexing & configuration including GPIO functions selection &
> GPIO attributes configuration.
>
> This IP is not based on & does not have anything in common with Chassis
> specification. The pinctrl drivers under pinctrl/intel/* are all based upon
> Chassis spec compliant pinctrl IPs. So this driver doesn't fit & can not use
> pinctrl framework under pinctrl/intel/* and it requires a separate new driver.
>
> Add a new GPIO & pin control framework based driver for this IP.
>
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>

Thanks a lot for quick iterations and hard work on getting this
driver in such a nice shape in such a short time!

Patch applied for kernel v5.5.

If there are any remaining issues I am sure we can fix them up
in-tree.

Yours,
Linus Walleij
