Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4B9179B8E
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 23:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388941AbfG2VxS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 17:53:18 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42545 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388888AbfG2VxS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 17:53:18 -0400
Received: by mail-lf1-f66.google.com with SMTP id s19so43142505lfb.9
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2019 14:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hr9lqY2qIqoidNcb1If245IBNP+0DnlTQyMBCAdK+Ik=;
        b=HyKoqtCfFxuQVsAb5+vFCCMS0YilOQ1m3ow3QG9i/222LTjAwb0dTsHGlPD+wgv5xz
         yxGmG2uQ+GXy8aVfTb8iVnwyvC/tFZrzdYTE/IZ4sxhoD+JyDgZyLo7es1i3GvdlHBsQ
         9KgXU0BH2XWgII/r1JW3XwxEm3xlRUdaD2PMugZ8eAgETdmbyqtgWltBwZADfZ/JOgK8
         KGO+bVSe18/XMctvQdt5o+uFkTKAodeWoduSv9MReky4YEXExt/yAYz8vY8G82yiywnH
         zQxG63/KMWFy9NT3upE0a37RA41t81MOhYrxs1P+JPFnQ5o1xJWIKRx+3guc5NFy4d/Y
         LVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hr9lqY2qIqoidNcb1If245IBNP+0DnlTQyMBCAdK+Ik=;
        b=hUsdB+v0UtICHFODEq6Ys+qgLDJ7IdoGU1oIkdFzS+AThoXZtM80LchtU7NGfmkdSs
         4W+P/k7C6MsOPwc/UvcOM0akPaPvFZQKFlEE8dlk9bxuY3URXg4UW+QVg7DQ4duGNFmB
         1BXvwuxVzBR3dxSBl0DC4apC+T194rFxWzJ5AXc+4PkeXMwupVbV9DZkE7rqmCDONVMi
         emMgXWIJA7OKMEVMrjrAlW8b29k87I3U9YK39BiZtWOzlF/FLsSvUfCq3MXQn4Gt4IL0
         j0ayO3ovyJ5ok9apkDDsPaH7hfevbc5/Ih3paf1VUd5zA9nyinFcpIuhCvdbqJOTO/ad
         tXVw==
X-Gm-Message-State: APjAAAVJnE0Raiu3Obip0ynrS0Knv1AurKnd4qUsdmTVGbJhJXS2qsvU
        TWiBpui5p3QzBrVIBjmOxfRFF4docVzh6FnHL/y8HQ==
X-Google-Smtp-Source: APXvYqxrcwQ2xt2eOrJdooqGsibkSjjLkGu0LUS1zOLSFKz3m+Xi0j4+Rh01BXuTGe2jOXpQKVloomM4o+1wiK44pnk=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr42403912lfp.61.1564437196737;
 Mon, 29 Jul 2019 14:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190724081313.12934-1-andrew@aj.id.au>
In-Reply-To: <20190724081313.12934-1-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 23:53:04 +0200
Message-ID: <CACRpkdapypySGPrLgSMSNy1fzkca2BfMUGzf3koFWQZ-M5VOvg@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: Deprecate g[45]-style compatibles
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 24, 2019 at 10:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> It's probably best if we push the three patches all through one tree rather
> than fragmenting. Is everyone happy if Joel applies them to the aspeed tree?

If you are sure it will not collide with parallell work in the
pinctrl tree, yes.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

(If it does collide I'd prefer to take the pinctrl patches and fix the
conflicts in my tree.)

Yours,
Linus Walleij
