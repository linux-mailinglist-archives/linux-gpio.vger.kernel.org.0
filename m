Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A686E4A32ED
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jan 2022 01:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353608AbiA3AqX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jan 2022 19:46:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353595AbiA3AqW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jan 2022 19:46:22 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FF7FC061714
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 16:46:21 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id v186so29716407ybg.1
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 16:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5CkGE9Ok32toHn0F3ILw6NYE0JtPX1pPXi5Uwmz6i/E=;
        b=CyU4byVCy2zP7rLS3aAb+Gpyn1UzN3hst7qvRNGEhOqDefWNCL04SQZesw4CRgRD6X
         61N2DWtykRl1OJJvVZz+5PAPGJ2iwEm1lN8xX/p6t6nkjymmfTMeX6rXjap2fzt9lUrq
         yUlnYyXckP7xumLSMnsyRUb1Xvd5xAa+8EW/KbxvzHYd5wLKqRDUo1Cm+TQfFSncxJRN
         Vu4kWqsXIpl10WECsTCRDAXQ+FEfWS+svoRk3x/RhBwMj/9nllXUIFFVj1FwC3n0w2JU
         uVb9ZQiLCUblH3S41y+XovOjQoS10o67rJpLngNbP7ht7F8sAMNPUYgX6S2W71vbOxRl
         T2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5CkGE9Ok32toHn0F3ILw6NYE0JtPX1pPXi5Uwmz6i/E=;
        b=x57G2vo3aDbQ8+NQaza1I6y+XnUCsatLcMp18TZzrjdEw2ILWddwfej/fOmW0lj5rt
         siawbxEWIJq2DGMuPW9V2FWcuLMTDbF8liC45QNikT5BSDe2HkWUTNRMmxEPb5aUmtjf
         TCQPUBn41piLy1259h4mFG80xpygAOckp/4hLLyS7EqRaWnWT3sT2gG17RbxDlvcQYEH
         F6RPcDX0wfAPQ7DeE93e6wMew3uRmtrPqoJfmIbN5zO/lVlHhEbHKiAPP9VSmOnD1Ex+
         5s4rPkbrj2MhTHc9alSmayehO9XCLa38PtDf6n3SDJyuw8MWaSQE3vEQVDj4NjjWirda
         RdCQ==
X-Gm-Message-State: AOAM5311dxmrr2qKc7Zsh+vl2DTga84EinyT86a2MZhSM/RNBiL8KGqq
        DZpBeKp0UWQieIJTvTdAac9JjIqf3O4NPu39PrVnKQ==
X-Google-Smtp-Source: ABdhPJxBBbvxiS1E9vs8QRFfJybGryxP5F1pejpBuS7PwfZtqKt4WfyDm6NBmgEeNSTPVT4THEVvoRYsy2lA+HhDHi0=
X-Received: by 2002:a25:2451:: with SMTP id k78mr20790628ybk.511.1643503580791;
 Sat, 29 Jan 2022 16:46:20 -0800 (PST)
MIME-Version: 1.0
References: <20220120150024.646714-1-paul.kocialkowski@bootlin.com> <20220120150024.646714-3-paul.kocialkowski@bootlin.com>
In-Reply-To: <20220120150024.646714-3-paul.kocialkowski@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 30 Jan 2022 01:46:09 +0100
Message-ID: <CACRpkdbnEKeDNmFCuUCLaySs6AtD9MPtxV+9JDxKuXvTs9iMVQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/6] dt-bindings: gpio: logicvc: Add a compatible with
 major version only
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 20, 2022 at 4:00 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> There are lots of different versions of the logicvc block and it
> makes little sense to list them all in compatibles since all versions
> with the same major are found to be register-compatible.

The reason we try to be precise is because sometime, long after the driver
has been merged and maintained for a few years, a bug is discovered
in a specific version of the silicon.

What happens is that a fix is applied on all silicon whether it is needed
or not.

If you have the precise silicon compatible, you can avoid this and target
only a specific version.

Yours,
Linus Walleij
