Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 294ED4D9144
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 01:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343699AbiCOA0S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 20:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343720AbiCOA0R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 20:26:17 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BAA3D1CB
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 17:25:06 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-2dbc48104beso184375297b3.5
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 17:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oFgUmsFBeWhrxAgbRx3ZPlrcD+KJ/QlZxjkaKnGs9TY=;
        b=U7BU/Xssmkct3SmrFNOmZc48Y326bcvWjc/Kj51H02n428e9Ssa/UnCwQTE4QEWa72
         p1BTkRORUCrJsLmxr0hQDhtMCTX4FHsh/t2bJDJYkRRPpCg2snsBt70TxAh7hoHPENfY
         CsGSw0XE6KxdW50EbOC3tnd59Gn02/T5UXFFHhkrYY/cgWXKm2dYPUxoa8CJPChrwFa0
         DBuc7XhISM5ScloWZpsrNbSueK9qdEPS8TsGFoufnJxf08O+gXn3qT+w0yjp7ry4xXss
         Eru4fR862ITRufKr2Fqrld9GO4aWzdEKd6p5v1M/Z6D9tCdcBpSxYheZyII22Yg6b2+K
         XRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oFgUmsFBeWhrxAgbRx3ZPlrcD+KJ/QlZxjkaKnGs9TY=;
        b=Mx5a8E/fE0Rte34r67qoo+qLxlFyra+LqQsdh5FMOnFGghRF/l3Cb8JSFIRelUS0hC
         sIf9y0jVr8mNkC5MdPYGuJHaR43bwAi8fzAz5vtUDCfh2Gkxz+XdbUq3tJRdQdp70Czn
         6W0krI264FMA6zbRuJpuSgOSHeeQl2oVxz+IzeL89rAis7JcP5R6x7fd2iMPDbI8pk04
         PZu1JAwAHRQZuDM9hgRHehkGF0xDpJhl18Cx2eaZdZfLIRaQE8r1QsNx+bizWFqz+0ba
         tzyWUyJTY+8xcBthlCxTk5Yxx8rWEQOAKbuQHvB8wXGQfE2JRwKA7ryxBz49vjllrE63
         kTwg==
X-Gm-Message-State: AOAM530A2UgzxgOaGJcmanO+UR5RASyE6m7GgYvW6ptyHxGlPO+Ha2nJ
        dQdssBVaj7XApBcNsk6zgQ64Gu+cAlTgn6ZMkYKbTA==
X-Google-Smtp-Source: ABdhPJzwtMCaE9ZRlsN3LeSRTwUp00anevncQ/91Tm+zkgQlFy1tqheROahl6k8549XVjqvJrx86WPykj8B75gOmj5o=
X-Received: by 2002:a81:9c47:0:b0:2db:9e18:6e75 with SMTP id
 n7-20020a819c47000000b002db9e186e75mr21608351ywa.437.1647303905492; Mon, 14
 Mar 2022 17:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220308100956.2750295-1-wenst@chromium.org>
In-Reply-To: <20220308100956.2750295-1-wenst@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Mar 2022 01:24:54 +0100
Message-ID: <CACRpkdb1cVxDgG_96v=bLXaEOscrCqejUDKdEGZGEp2NMsSHqw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] pinctrl: mediatek: Fixes and minor improvements
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 8, 2022 at 11:10 AM Chen-Yu Tsai <wenst@chromium.org> wrote:

> Here are some fixes and minor improvements to generic pinconf and the
> Mediatek Paris pinctrl driver.

Nobody seems to be against so I just applied all patches for v5.18.

Yours,
Linus Walleij
