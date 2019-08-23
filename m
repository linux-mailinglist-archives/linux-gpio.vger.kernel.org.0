Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 758E09A927
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 09:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391065AbfHWHuy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 03:50:54 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36276 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732838AbfHWHuw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 03:50:52 -0400
Received: by mail-lf1-f68.google.com with SMTP id r5so956620lfc.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 00:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AROq8DpxBavGw3rOZlBsIIIgdgdRJheHWzoZIaKAbGU=;
        b=eZXrBT737nM6L8Pa5XlEQuC0rQBRrzfTsrl7Tw0vIf6llspePcFP3Z99vwe48Xo+q+
         xOKOeB2kfRG07WTIk/J/GStBuxjjfJKMkzmaTv+HZxcu+unxdyhXqKmAcj8A6lXg4nll
         Wh5bMJd1ogfOrPxcDidGKUBQ9eIYg8/0B5MHQGTrHe/GPKG/Ds+nI4dND4hFOoU+Mdgs
         nuA64AWazxNszt2zSzknLq2Go1nWPLVQW2G+zpe8aY/JKdzYSFUXNP4Zweqq/FTXRHef
         Gx6CccrR4hrMSojSHJjv1mmNtPTOQ5L/PyeCjpMZX9KG+V+MXVOELXgnFpiPNT0xvQjA
         UKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AROq8DpxBavGw3rOZlBsIIIgdgdRJheHWzoZIaKAbGU=;
        b=b5UwK2A6WwisiWIQPbfjjHnM/I/f4u0dHh2Ztvfpft2rpbOd01HYnwuX77/xg6wUVj
         40r7pJshmOfmxFdk+2DxUB511Y+GkfYkdvm5SRIdqyUCKacZC0+m+j5VUhZKP5g549Gm
         ND8B8QSuw4j9wIefElfBxpbWzXj4iWnlIRNVwwkym73LbxZEyvxX7xWve0TpG/8CX6Rd
         8r6J1j16l3mAPnqu+eInl8Ki3r4x60DUXoVTujZKZfaJnYrQy+DmJb0bv28n7FJKKu2a
         02XCsMgn+aq/Dzppm3xIiCW33QXhAXXuQ6Nw+FHKbKbJUU59VkliztiwgzGmUXWkYHpG
         dXwg==
X-Gm-Message-State: APjAAAWGA97XVRUK4kt7Y9Ej+WPR6+n22qezDpY1bweOKIS0FjeTIMGj
        k/0L+0uaQBx3PGWGxZrhIe1BnjllkFgd1Xzju4tjnQ==
X-Google-Smtp-Source: APXvYqy4LEAB6weVbikWw4omf6hTp96l46dy0piklsM9lAxP3u3RWDVFhgst2bdXR83kAe94+v5z+0MY4UWyNN2QLmo=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr1990286lfp.61.1566546650115;
 Fri, 23 Aug 2019 00:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <1565686400-5711-1-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1565686400-5711-1-git-send-email-light.hsieh@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 09:50:38 +0200
Message-ID: <CACRpkdY0+eQXknPPj2vz9-Zo9cQHJQafbUC97mOQvEuzbX-qtw@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Improve MediaTek pinctrl v2 and make backward
 compatible to smartphone mass production usage
To:     Light Hsieh <light.hsieh@mediatek.com>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sean Wang <sean.wang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 13, 2019 at 10:53 AM Light Hsieh <light.hsieh@mediatek.com> wrote:

> This patch improves MediaTek pinctrl v2 and makes backward compatible to
> current smartphone mass production usage by:
> 1.Check gpio pin number and use binary search in control address lookup
> 2.Supporting driving setting without mapping current to register value
> 3.Correct usage of PIN_CONFIG get/set implementation

I rely on Sean to review and get this in shape.

> 4.Backward compatible to previous Mediatek's bias-pull usage

This is fine as long as the new style of using explicit pull
setting also works. It's nice to be compatible.

> 5.Add support for pin configuration dump via sysfs

Do you mean debugfs? You should use debugfs for debug.
sysfs is subject to ABI rules.

Yours,
Linus Walleij
