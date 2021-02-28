Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0969326FB7
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Feb 2021 01:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhB1ATE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Feb 2021 19:19:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbhB1ATD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Feb 2021 19:19:03 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF86C061756
        for <linux-gpio@vger.kernel.org>; Sat, 27 Feb 2021 16:18:23 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id i11so1578190ood.6
        for <linux-gpio@vger.kernel.org>; Sat, 27 Feb 2021 16:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NhLpIka0l+DtQFwtRx94mGt+L2X3B8MlJkoRIBCnKqI=;
        b=QOqtQjGU26d2NAUtBWHPknrvTdZ1ylgRr+M2MUBtjDDP6MnIYXeAt5FD11Xf2jA4N+
         aejWHbxIE/kzqp3Lsn/UqZ//gVIwTtihPf2EilEIJkMtbVElBdIetmdzYEPnBVXA9vLG
         sm9lQzP1+gMZ7qhx26iVtW0NQCoWQrDr/eodBpEoUDwlSjdqwqBzn7J7UDciQr05wrt4
         z0kawfn1MVermx00h555cbyowYJdKWMhMlSKilntlYi40TfF+V8JHTrmI/6cLOwclJHd
         TFHdoW4OXTBMj7N/fLoB2KCFfdcb60hPjiXgaew58p71/LfqGMabgPbWWuj6ghgyTaZn
         aB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NhLpIka0l+DtQFwtRx94mGt+L2X3B8MlJkoRIBCnKqI=;
        b=pmlsOj673bfh5F1YTCBIUbHdLKVbaWTrXa/EAFd36Ha1c/JDqFD0dxOAdGalSe8EtN
         DbpSYKXhj+twM5Ab9QuyKuDXSScXtwrBhBPnQYz7vZb60gT6BQgaC7mUoAxzIXKIuBu7
         WbfP5KjXUz8W+z4PNWAnmDurltGySqMCsVP1ZNu9TJuPPY4cfZHWrajKpF0Xyp5CLk+T
         7FV99Ijl11DUA3Y8FhMndkDdPoqEOl5a47Fd67HhuPj+8ztDP8DkxJmMJFnZQ21BRpZo
         +5n1saepzxinbohSFlYQoWlyvLDS0y3QYHPxkecwR2N+QJS7vBAXxU6Ht9DUKDh50sP4
         2TEw==
X-Gm-Message-State: AOAM533lzRwf18USZ35WiF31aIHdrth+rY0N6FVrw7LKhikrrx6l3sMl
        ytLdsi2IRyljGXnXvkyMPE7Jpho3rvuNMPUAyJSM
X-Google-Smtp-Source: ABdhPJw/2qEE4T0GbsPjQnvhTu2B66k0NmG+hhEKuH+cliA0hP4hzMtaxjvZAsfFJlL5/xdYOd3pwOHIxdVMHZIFmdA=
X-Received: by 2002:a4a:98a3:: with SMTP id a32mr7334179ooj.51.1614471502634;
 Sat, 27 Feb 2021 16:18:22 -0800 (PST)
MIME-Version: 1.0
References: <1613131643-60062-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1613131643-60062-2-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
In-Reply-To: <1613131643-60062-2-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Sun, 28 Feb 2021 09:17:56 +0900
Message-ID: <CABMQnVJ+hQ_sdXMdLzhv2Y65QW8Vi01VAjV=SCeOei-zOZ5dwQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] firmware: xilinx: Add pinctrl support
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        git@xilinx.com, saikrishna12468@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

2021=E5=B9=B42=E6=9C=8812=E6=97=A5(=E9=87=91) 21:10 Sai Krishna Potthuri
<lakshmi.sai.krishna.potthuri@xilinx.com>:
>
> Adding pinctrl support to query platform specific information (pins)
> from firmware.
>
> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.=
com>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---
>  drivers/firmware/xilinx/zynqmp.c     | 114 +++++++++++++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h |  90 +++++++++++++++++++++
>  2 files changed, 204 insertions(+)
>
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/z=
ynqmp.c
> index efb8a66efc68..299c3d5a9ebd 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -784,6 +784,120 @@ int zynqmp_pm_fpga_get_status(u32 *value)
>  }
>  EXPORT_SYMBOL_GPL(zynqmp_pm_fpga_get_status);
>

<snip>

> @@ -125,6 +131,12 @@ enum pm_query_id {
>         PM_QID_CLOCK_GET_FIXEDFACTOR_PARAMS,
>         PM_QID_CLOCK_GET_PARENTS,
>         PM_QID_CLOCK_GET_ATTRIBUTES,
> +       PM_QID_PINCTRL_GET_NUM_PINS =3D 6,
> +       PM_QID_PINCTRL_GET_NUM_FUNCTIONS =3D 7,
> +       PM_QID_PINCTRL_GET_NUM_FUNCTION_GROUPS =3D 8,
> +       PM_QID_PINCTRL_GET_FUNCTION_NAME =3D 9,
> +       PM_QID_PINCTRL_GET_FUNCTION_GROUPS =3D 10,
> +       PM_QID_PINCTRL_GET_PIN_GROUPS =3D 11,

These do not have to have values, Because PM_QID_INVALID is 0.

>         PM_QID_CLOCK_GET_NUM_CLOCKS =3D 12,

And you can drop value from this.

>         PM_QID_CLOCK_GET_MAX_DIVISOR,
>  };
> @@ -288,6 +300,44 @@ enum dll_reset_type {
>         PM_DLL_RESET_PULSE,
>  };
>
> +enum pm_pinctrl_config_param {
> +       PM_PINCTRL_CONFIG_SLEW_RATE =3D 0,
> +       PM_PINCTRL_CONFIG_BIAS_STATUS =3D 1,
> +       PM_PINCTRL_CONFIG_PULL_CTRL =3D 2,
> +       PM_PINCTRL_CONFIG_SCHMITT_CMOS =3D 3,
> +       PM_PINCTRL_CONFIG_DRIVE_STRENGTH =3D 4,
> +       PM_PINCTRL_CONFIG_VOLTAGE_STATUS =3D 5,
> +       PM_PINCTRL_CONFIG_TRI_STATE =3D 6,
> +       PM_PINCTRL_CONFIG_MAX =3D 7,
> +};

Same as above.

> +
> +enum pm_pinctrl_slew_rate {
> +       PM_PINCTRL_SLEW_RATE_FAST =3D 0,
> +       PM_PINCTRL_SLEW_RATE_SLOW =3D 1,
> +};

Same as above. Others are also specified.

> +
> +enum pm_pinctrl_bias_status {
> +       PM_PINCTRL_BIAS_DISABLE =3D 0,
> +       PM_PINCTRL_BIAS_ENABLE =3D 1,
> +};

Best regards,
  Nobuhiro
--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6
