Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00A4620F1F9
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 11:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgF3Jx5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 05:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729017AbgF3Jx4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 05:53:56 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45062C061755;
        Tue, 30 Jun 2020 02:53:56 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id e8so9721886pgc.5;
        Tue, 30 Jun 2020 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pu+8c4pxZP7VDPcWMX3cvDqtPoM2Z/4+ORSQBZa9fP8=;
        b=iOZTw5p3PhrLlB33oX3iHhPUa7AtOUAPU4fvtIi61vf7UYm4i+g1ybpyU0fH6irrMM
         wr/HuNGd0XsNfcKV+dxU90wRk/Zp6TC81oWimDnGh1DHx/WD+EG9VpnKOqWe4a6nSB4P
         CHGg/xLxDxTZ7ruZdr3kZNElBjD7Q58olV9nDKEArc/jJSdfa/GQ24jduQIdBSH/60pb
         k4zLDdY/ZG925UKIPnx3XklzXTanzkM/ZK70pASTgju0rAdzkrRoSeF1BPhWN9lSPKdb
         Bl1HiMs72X7BPylrygLupbmuXou6Tt0haGCEeljJZJiig+gyS9rvkvpvwVfnzjK2mb5s
         nWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pu+8c4pxZP7VDPcWMX3cvDqtPoM2Z/4+ORSQBZa9fP8=;
        b=K9FbcUp9/9k6LrmN4jmAquxnif9ZpupnISVFmwZpfSEWiU+fpVR8zTnTDGKBQX1BCt
         npDMjeiyKiIYuSRaF8xuUyoXMBaTLD98lLX7RRDnb+EWSTnlyTM9BjnRRJwpyWb9NLEv
         MDNG1+Rj+T1zkaN+lE3mlIdRSdiodZx5Iq7ZynlkeKlIDmNPRuZYfKwa6n4i0Vj4RlLC
         RwASo+cHn7daNsKObamwuRAMSLNON6bo8q9x5TqEdY5zTs956Y+GZSdAcmdXm4B9TYaF
         6//K+Rnl1/cXh9EA4R6VdUSON84p9X/786KSosn3ftiEbHV7gjz3Ingohm+TlKA0EoK1
         E8XA==
X-Gm-Message-State: AOAM533Y/vJBB8UD1US0p2GeLxL/HXVBD8N+kwpmICrI788uI+wiQ7Us
        utuW/w4hsTBx7aUvCM+KcHHE7M/TsgdtIl62ktQ=
X-Google-Smtp-Source: ABdhPJzlE4kn4dGUwstGhu5m4jND3oHLT5GOH9/tz0SCDE/5Gq8P4XHxl8f6dclTHmHCeJcHoxAKreSrwL9AqmUTKKE=
X-Received: by 2002:a63:ff52:: with SMTP id s18mr14592506pgk.203.1593510835663;
 Tue, 30 Jun 2020 02:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200625075805.363918-1-mans0n@gorani.run> <CAMpxmJXDHX-U-HWR8093orBU1ZxEeWp_r2Xar+k5FMoZ1pS78Q@mail.gmail.com>
In-Reply-To: <CAMpxmJXDHX-U-HWR8093orBU1ZxEeWp_r2Xar+k5FMoZ1pS78Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 Jun 2020 12:53:42 +0300
Message-ID: <CAHp75VdNh8nFNqZxSD0g7ADD8GvY+Dmbfg8xc6LW94hw_Brwew@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: add GPO driver for PCA9570
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Sungbo Eo <mans0n@gorani.run>,
        Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 12:28 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Thu, Jun 25, 2020 at 9:58 AM Sungbo Eo <mans0n@gorani.run> wrote:

> > +static const struct of_device_id pca9570_of_match_table[] = {
> > +       { .compatible = "nxp,pca9570" },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, pca9570_of_match_table);
>
> If you're not using it in probe than maybe move it next to the I2C device table?

(Side note)
...and even if so it can be assessed via a struct device pointer:
dev->driver->id_table (don't remember by heart, but you have an idea).

-- 
With Best Regards,
Andy Shevchenko
