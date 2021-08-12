Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09E623EA1C5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 11:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234587AbhHLJST (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 05:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234224AbhHLJSS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Aug 2021 05:18:18 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6C03C061765
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 02:17:53 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id r9so2784647lfn.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 02:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vlnCjZjx1dq/H2qB63RqlDicLcJRpH3K8WfM9ayn2uY=;
        b=EphcxfV2jMbb4CHVOqy3ezGW28YDwekOHaZ77TrbNfDikUWohM+aH+V2xCkggA2tRJ
         6QmtuDQGjMgmgpSfVhhljhqz0e/bP4/EPKEAm/FJjoP4//hSVjZIpXxKt+kYgclkZH4S
         0+OaWQVe9m1s3gvCiX3KL5E1rUNnjxpL6HEyiQ7uKd0Ve8ctjaigfJGYtdNG0E/h+HeI
         B/e36bSwX05jzgu66ae4g71KDlQDti9VemRedfgUe4kpDYw5lCoxqXaqp15oOiWqb4kY
         HoX9NAMX/jseubevEFuaP2Y1hI0cjX5ZqQ2qOnhIDjjwANZrqBADROPh3pP6iFn+42r5
         oQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vlnCjZjx1dq/H2qB63RqlDicLcJRpH3K8WfM9ayn2uY=;
        b=UUahrGnGOwA7UWRIN6t5KvWHtLBwTkF0vRtlZDEGjlFOKst/gWgVwvX/brp7P6pwZz
         +Z5a+11XFjfEQ4Evp0GpMpb14ydc+ftrK84oubhWe3IvFqyOtSL7C+r131mvsk/ipXJv
         nZIcyH4TUn3fbakg98FdD/K0jp6+om94GlF7ats1/hGjTK/x07B+QLudT0dP/z5K0VaV
         Vr+O3THXQlWqaea2EeEJk/1R5snx21paBO4GA5N6depwQLLSFrPefGljtDAaO28qaoYW
         v1I67SoQr9Hi3/qFgSh+2qnwtVot/VyliPb5I0K+/RBSgBGiKqT8HFfHFyK1T+2RnSTO
         feeg==
X-Gm-Message-State: AOAM532SvY0BhIH5Zl01O5OufbySLwylO6/k1Ud2rAD1/EHEYKPFxEb7
        X5TusUXjQa7Wd2zipcy1Jov7ZeSjXMVfUutfiWpXjQ==
X-Google-Smtp-Source: ABdhPJy5J/bkEHHotUgSklMelctUg5orqWwIVjsNVyLt2OpPUcZYHiaTzeAbTeNPshUHqLcdFRkQL/VKcn4CGp4bqY8=
X-Received: by 2002:a05:6512:3250:: with SMTP id c16mr1814844lfr.465.1628759871726;
 Thu, 12 Aug 2021 02:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210809201513.12367-1-mario.limonciello@amd.com>
In-Reply-To: <20210809201513.12367-1-mario.limonciello@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Aug 2021 11:17:40 +0200
Message-ID: <CACRpkdY10DoJdaLnGSwT4icPQRR23vhaDYiY9aShaBs4oU91NQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Fix an issue with shutdown when system set
 to s0ix
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Raul E Rangel <rrangel@chromium.org>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Gabriel C <nix.or.die@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 9, 2021 at 10:15 PM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> IRQs are getting armed on shutdown causing the system to immediately
> wake back up.
>
> Link: https://lkml.org/lkml/2021/8/2/1114
> Reported-by: nix.or.die@googlemail.com
> CC: Raul E Rangel <rrangel@chromium.org>
> Fixes: d62bd5ce12d7 ("pinctrl: amd: Implement irq_set_wake")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Patch is applied.

Yours,
Linus Walleij
