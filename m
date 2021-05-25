Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE0138FC63
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 10:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbhEYIPI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 04:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232115AbhEYIOq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 04:14:46 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294DEC061360
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 01:01:44 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id q67so5924362pfb.4
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 01:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5+65tswV0l2w/yAwoAZbx060HkSMsB+SDFwiQTeZIRQ=;
        b=W5j8e0m0xAafz+SnLAxP7MeKRSxZC4yakn7EpyZlnQGNCEdbUKR/qiB47t1VSKPlgc
         vF8kjuiQKocahCPa+jGbxDe0Kg0twJssZDeILXJthppNCHFQsAqD2hgDw/qAKZQXIjQP
         GcaYZouMT1ve9wVWBufGFzj1Os4OsR27fHvk6v9sJhQ4nhufcvwoGC3kt/5d2jdnLVL5
         4PQXAq+nmtiSApYtVRfb+VKvfvYSKQAJXzgBEoBrxvN84TA7bw7LkRPT4aqaAdyYcsxp
         T8JcxvKI3euteVa6IKdj/UP8/NMVWeR1hWqXxic32o8Xqpq+wV3GSxH8d/x38gMf/j4/
         HtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5+65tswV0l2w/yAwoAZbx060HkSMsB+SDFwiQTeZIRQ=;
        b=UllDl8QkTAIacIa9q5BrqYM4JD3t6RLFOGLVbHNG516pKN6K2IdXHozU2+Xnd2wNLv
         HxSuFsnWrvC//uTBn8ztbuglRvshAaK976LODDCycb/SjZrm3uRWCLtxIEk7WBsJKr42
         Z2sT0C4QXILj38VVyDajATFuTQ1HlB04rypVO8N3M4P6Qx7mec2A2GLmh9Gcgc+FgF4U
         mqg1Jq6Grnl0FMhfTUBB+gswdaSmA3JFF3u2sXxu/xXVLOU2cSHkMVWG6VNWl3dkH/5G
         PPrJQuwYmZ5pXbHYAKIUjTMvusmrOyUQoRcLZGL6tuHsvsR5Eu3td5TCykY7pKgxscjE
         q+hA==
X-Gm-Message-State: AOAM531MvdMsdVX5p3kKzc2qUElb3dHlRgtnGyBCm5/O+MMqFxykop/1
        xhLf+apt0TWOiaRuza+LZbhxwoIXhKcoa0W+nqE=
X-Google-Smtp-Source: ABdhPJyfv66yoK5knXo57y1FNpZ5/hcTCdFKrwCksdpujaShuU25QtdpAaVPhu34HkPUAuFstihnVrBV/CF0ZRVS1sk=
X-Received: by 2002:a05:6a00:1591:b029:2d9:369a:b846 with SMTP id
 u17-20020a056a001591b02902d9369ab846mr29136587pfk.40.1621929704035; Tue, 25
 May 2021 01:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210525054149.1792-1-kunyang_fan@asus.com>
In-Reply-To: <20210525054149.1792-1-kunyang_fan@asus.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 25 May 2021 11:01:28 +0300
Message-ID: <CAHp75VfuZNPVi4Oy_JxQB-uu0RNkvMb1sK2bz4-aG_QipNsRKw@mail.gmail.com>
Subject: Re: [PATCH 1/5] mfd: Add support for IO functions of AAEON devices
To:     aaeon.asus@gmail.com, Hans de Goede <hdegoede@redhat.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        AceLan Kao <acelan.kao@canonical.com>,
        Kunyang_Fan <kunyang_fan@asus.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Cc: Hans (dunno if it's something you would like to be informed of)

On Tue, May 25, 2021 at 8:42 AM <aaeon.asus@gmail.com> wrote:
>
> From: Kunyang_Fan <kunyang_fan@asus.com>
>
> This adds the supports for multiple IO functions of the
> AAEON x86 devices and makes use of the WMI interface to
> control the these IO devices including:
>
> - GPIO
> - LED
> - Watchdog
> - HWMON
>
> It also adds the mfd child device drivers to support
> the above IO functions.

Do I miss the cover letter?

...

> +config MFD_AAEON
> +       tristate "AAEON WMI MFD devices"
> +       depends on ASUS_WMI
> +       help
> +         Say yes here to support mltiple IO devices on Single Board Computers

multiple

> +         produced by AAEON.
> +
> +         This driver leverages the ASUS WMI interface to access device
> +         resources.

I'm wondering should it be some kind of WMI framework part to bridge
WMI parts to MFD or so?

...

> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

Please, drop all these duplications in all files. SPDX is enough.

...

> +static int aaeon_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +       struct aaeon_wmi_priv *priv;

       struct aaeon_wmi_priv *priv = context;

> +       if (!wmi_has_guid(AAEON_WMI_MGMT_GUID)) {
> +               dev_info(&wdev->dev, "AAEON Management GUID not found\n");
> +               return -ENODEV;
> +       }

Dead code?

> +       priv = (struct aaeon_wmi_priv *)context;

See above.

> +       dev_set_drvdata(&wdev->dev, priv);
> +
> +       return devm_mfd_add_devices(&wdev->dev, 0, priv->cells,
> +                                   priv->ncells, NULL, 0, NULL);
> +}

...

> +static struct wmi_driver aaeon_wmi_driver = {
> +       .driver = {
> +               .name = "mfd-aaeon",
> +       },
> +       .id_table = aaeon_wmi_id_table,
> +       .probe = aaeon_wmi_probe,
> +};

> +

Redundant blank line.

> +module_wmi_driver(aaeon_wmi_driver);

-- 
With Best Regards,
Andy Shevchenko
