Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 131C1430AF5
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Oct 2021 18:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344295AbhJQQ4y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Oct 2021 12:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344281AbhJQQ4y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Oct 2021 12:56:54 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D44C061765
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 09:54:44 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id w12-20020a056830410c00b0054e7ceecd88so1664074ott.2
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 09:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gY3rallikDiau7aiF6+jpysaSoqtW+qfGcmxJJQx5hQ=;
        b=vMUy3AL2sISFYzrzjUUydCTdZT2oQ8HbaYXwtg3/aWj6WfsU64PluL0QexcfOXELLg
         Z9y/2f6htqqUn8hEdQlb6IKuaHvYuVj10zcf0u8KD7nR+uxLXP5cxy5VV9HFWpwY+fTa
         xKJcc5T1jRYTOWxdqpEQv8LSXZiX65+sgrXUK6dBPR+EWXhf0FFut8bSDnHa7eXSuUdH
         u47YGdyODhwJNeU81RSvgcZwQ+u5aK0S+FQp7EpOaLPOr2oHvVMXqNvFzBd6eGddJzKd
         DjluLwgxvLy6cibG3q2/w4CDd/l4M5lRJfgx9YTGeLA4FFqwQncu8Qa8nFs6UEF3acBL
         6QHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gY3rallikDiau7aiF6+jpysaSoqtW+qfGcmxJJQx5hQ=;
        b=PVydoykjANzJZwgJcF6NEevnqJKBPleP6RkQFEwMsrPfPMMTVR7jYy60capl+mvNtU
         Rf1KwvxXDMKU0s7v0VswqeM7KV/USnUF/6zv/9Xskl6K4FqD2Pdb362zR9Wp2m2iPSfY
         fMSvytoqSSebvR5mEd7PORw1YfMuSzDzCwC9KRYlLURyPQwu+XOujOHDq65qDuxDi4uf
         if62i+RNBTTejEfWrMO6jBM6bu9fuaYoZH7q4h2CciOcJ58Oexy8GsNHOTe9+ArTXTlT
         hCsZaQAGk5Y37S2E54WaTHCYnch2MmfSd40J7OzeRKVDzCHNustzxchEN8VVOiSlpskB
         h06w==
X-Gm-Message-State: AOAM533pvaBqCRoNhRKYzYudLXi3Qe8Q0HR9NSe3v0sSKzNTHh+OzA/L
        Va3oZFqQWJj3Kf7K2a0BAacC7A==
X-Google-Smtp-Source: ABdhPJw/HYKUuY1Sdv4s1rXx/XpAVx5d4Kt6InEVU3Fr4HgzyguYkgHqKWvdj7bPKGog6tV4/pU1lQ==
X-Received: by 2002:a05:6830:4428:: with SMTP id q40mr17119597otv.184.1634489683866;
        Sun, 17 Oct 2021 09:54:43 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id t24sm2547856otk.58.2021.10.17.09.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:54:43 -0700 (PDT)
Date:   Sun, 17 Oct 2021 11:54:41 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Subject: Re:
Message-ID: <YWxVUd8eZOvZkJIy@builder.lan>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
 <CACRpkda_hW7vbvC1jizRa05ZdgeL-FkU3_zF+rvCfRBuRB3+VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkda_hW7vbvC1jizRa05ZdgeL-FkU3_zF+rvCfRBuRB3+VQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 12 Oct 18:59 CDT 2021, Linus Walleij wrote:

> On Fri, Oct 8, 2021 at 3:25 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> 
> > In 2019 (in kernel 5.4) spmi-gpio and ssbi-gpio drivers were converted
> > to hierarchical IRQ helpers, however MPP drivers were not converted at
> > that moment. Complete this by converting MPP drivers.
> >
> > Changes since v2:
> >  - Add patches fixing/updating mpps nodes in the existing device trees
> 
> Thanks a *lot* for being thorough and fixing all this properly!
> 
> I am happy to apply the pinctrl portions to the pinctrl tree, I'm
> uncertain about Rob's syntax checker robot here, are there real
> problems? Sometimes it complains about things being changed
> in the DTS files at the same time.
> 
> I could apply all of this (including DTS changes) to an immutable
> branch and offer to Bjorn if he is fine with the patches and
> the general approach.
> 

I like the driver changes and I'm wrapping up a second pull for the dts
pieces in the coming few days. So if you're happy to take the driver
patches I'll include the DT changes for 5.16 as well.

Thanks,
Bjorn
