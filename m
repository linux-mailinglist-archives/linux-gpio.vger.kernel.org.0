Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4A248F9D2
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 00:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233910AbiAOX7i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jan 2022 18:59:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233908AbiAOX7i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Jan 2022 18:59:38 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A673C06161C
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 15:59:38 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id y14so17975063oia.9
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 15:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BY0t3wChnwPpABJAzUPI2uRQxasjitbf0zoLnLuzNmM=;
        b=xELVyXalO+/z52bs31zIMVRomNZNMvebNU/EH0nbs+9Y845YgY/qW6U4CzW8ijlaYP
         mg9DCeggvHBxQ5UinnwOo8phB/k5lWUORlqCYh4uGXWHU6A+fctnXEh87NwBtWnxY+nJ
         F97BcU1laAUD6j2u/tIhTMpDO93qF/J+/sOspsgvrStamqciVxBHV5D2FjUtLmvYr4dn
         shlDqcN9uNaPVFkxImqHkD9tn5rs+yvN5dDp6TqcNabCBhIkFcUHax7vYm0bfSn2R8Ji
         HZfrCzHENBfchX1EA3yQD9iW3KRhZTlVfTTOrg7RzyRsFDonfYBVV2up1BAsDETjo+6l
         KaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BY0t3wChnwPpABJAzUPI2uRQxasjitbf0zoLnLuzNmM=;
        b=dGVNnicmADofcFPMILF6dPI8GPKIUhh9ovQFZJClhE3vMjlCIZlxYQw8fbE7REp3VY
         Qf/5yMbg4acJdgLQVzrG1+z/kRONgYoHzjHiJYer7ZYEmtDFkUGVkETOM0xyu8n/DNGq
         a/UzBTxYKSJHto5YRQXXwlN/1HupL4YZhYXa1swOIE0EN3OAIiYOwK7xQSz9lNQR42jB
         7QwKFuSIPvT2t+TmafUPeadPJgxZYF/35BSvuzIPLCqkqE8I8gcKY5JbzBKjvLqIu4At
         dvsWKQ+Q4GYLhF8s71Zzk3Dn9Zn+BGxliePP+84H/PdBaJPh0aRywnF2fLIXSBXi6oXc
         CCgQ==
X-Gm-Message-State: AOAM5324IezZr2YEYUweRKmNKdciiLVB34WxuCx95Jv4f5O2nS2yR6ZU
        w9s0MwMQffrC53EAQJlXCgcquEPBV4s/63bIg67YUw==
X-Google-Smtp-Source: ABdhPJy/oexnFc8hU3ysnUaLWHcbDN0ylAfYaUb2qiC7xMh3/+4Bu0iKtmkB9eeU2Rgz97bTHlGyDz6kcjZ52JUrjGQ=
X-Received: by 2002:aca:5a87:: with SMTP id o129mr13134949oib.114.1642291177322;
 Sat, 15 Jan 2022 15:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 00:59:26 +0100
Message-ID: <CACRpkdZhxEc0iFYkUJmPVc1ydDVtRd6-gqwcELyLb1ZRLe5STA@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: mediatek: pinctrl-moore: Simplify with dev_err_probe()
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sean.wang@kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 3, 2022 at 11:19 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> Use the dev_err_probe() helper to simplify error handling during probe.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

This patch set seems in nice shape, sadly we missed the v5.17 merge
window but please resend it as v2 once v5.17-rc1 is out with Chen-Yu's
review tags and minor fixes folded in.

Thanks!
Linus Walleij
