Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94FEA120ED8
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 17:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfLPQKT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 11:10:19 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46946 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbfLPQKT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 11:10:19 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so7909450wrl.13
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 08:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wBlvcCO8Ml/H3509NAX+qSULZon7Go2sxTKRNZ2ctvE=;
        b=cXv6nwlv5pmdDWI5Y7fvYBC08HVao0ujeoZ+7ojLX6RoCDn8hreHedCs3lAgk0Gk/1
         UHW3JvpWt+pi/gzHwcOvv05kCPRivGFMzcHyMcYP0x35zcal9iIdwDatmGkcF5fcQ6Xs
         VBY8rQawpt+crj27oTb9ERdm/cu8IMc5iKJWzLYMu/ROqZaWhXSo/iSTzLK5L6+T7kz5
         vzU8CftoZwUEP4SDSneANgLgQ8v1+lwSWYMjy/hIOtryfimxrX1odtPyTx0+4bqQNFEa
         2eJkifCe0okcSE/VE71ZqbBTpPzP8FFPc+tXIK6kL8zAPr47XlZAkzPidGzT3wtnFD9/
         D4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wBlvcCO8Ml/H3509NAX+qSULZon7Go2sxTKRNZ2ctvE=;
        b=kXujGEYl1/CJ4UpyjRKARQj7hLDXnvl0mwSKTf2PdA0d4di3sbKCP+8pVzNw0h51PG
         OPex/A1D6CjJLisWrfNGXSlF1CUYhZZftfbTijM6eagOOx7npD4a3WI1OMLOfLh7FM8r
         0f4MwkLxbkvUnC7dIaQ3l+zT/xXJVhyhyPP1MoyhlJ19lI0U0J8EY9Mis5E2wwsgc0A5
         eF59UoEDW4sOSn3bXl+ns7wc390VPYLOeHzcndqBFllwjuURINSmOBq5M8s/39Upgs0u
         GLvRGkhmJOHdwsdMWzO2PizZxLb2NOrM9T/kwaaT2KPICh4MFA6q+lFz5urGdPPGHqP1
         rwRw==
X-Gm-Message-State: APjAAAWe9zTxF+qcTv9UvIu3EnTO2mbjyleV4lM5Bh+T4ZnUDmHG/9mr
        jcS6eLtY7FlAP5VkK6Rdb7uAIg==
X-Google-Smtp-Source: APXvYqx5XSE4BmIOlkRofxhble/1rYpcYC58fzYcnPbCJdxQ+lw+Sz3KW8autUMHTKtkQigKTBxOnQ==
X-Received: by 2002:adf:ebc3:: with SMTP id v3mr30755356wrn.280.1576512617135;
        Mon, 16 Dec 2019 08:10:17 -0800 (PST)
Received: from dell ([185.17.149.202])
        by smtp.gmail.com with ESMTPSA id f1sm21916406wro.85.2019.12.16.08.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 08:10:16 -0800 (PST)
Date:   Mon, 16 Dec 2019 16:10:15 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/5] drm/i915/dsi: Control panel and backlight enable
 GPIOs from VBT
Message-ID: <20191216161015.GM2369@dell>
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191216121840.GS32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191216121840.GS32742@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 16 Dec 2019, Andy Shevchenko wrote:

> On Sun, Dec 15, 2019 at 05:38:05PM +0100, Hans de Goede wrote:
> > Hi All,
> > 
> > This is a new (completely rewritten) version of my patches to make the
> > i915 code control the SoC panel- and backlight-enable GPIOs on Bay Trail
> > devices when the VBT indicates that the SoC should be used for backlight
> > control. This fixes the panel not lighting up on various devices when
> > booted with a HDMI monitor connected, in which case the firmware skips
> > initializing the panel as it inits the HDMI instead.
> > 
> > This series has been tested on; and fixes this issue on; the following models:
> > 
> > Peaq C1010
> > Point of View MOBII TAB-P800W
> > Point of View MOBII TAB-P1005W
> > Terra Pad 1061
> > Thundersoft TST178
> > Yours Y8W81
> > 
> > Linus, this series starts with the already discussed pinctrl change to
> > export the function to unregister a pinctrl-map. We can either merge this
> > through drm-intel, or you could pick it up and then provide an immutable
> > branch with it for merging into drm-intel-next. Which option do you prefer?
> > 
> > Lee, I know you don't like this, but unfortunately this series introcudes
> > some (other) changes to drivers/mfd/intel_soc_pmic_core.c. The GPIO subsys
> > allows only one mapping-table per consumer, so in hindsight adding the code
> > which adds the mapping for the PMIC panel-enable pin to the PMIC mfd driver
> > was a mistake, as the PMIC code is a provider where as mapping-tables are
> > per consumer. The 4th patch fixes this by moving the mapping-table to the
> > i915 code, so that we can also add mappings for some of the pins on the SoC
> > itself. Since this whole series makes change to the i915 code I plan to
> > merge this mfd change to the drm-intel tree.
> 
> FWIW, Lee, I believe there will be no (significant) changes in the driver Hans
> touched. For the record it seems only Hans is touching drivers for old Intel
> platforms (such as Baytrail and Cherryview).

More exceptions, yay!

Again, in *this* case, it's probably fine.  What I want to know is;
what happens when it's not fine?  What happens when you or someone
else starts changing MFD and DRM on more active files?  Then I will
have to insist on an immutable branch.  So it would be better for the
DRM tree to be able to handle that use-case sooner rather than later,
regardless of who has the most churn.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
