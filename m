Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A12F411D0FC
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 16:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728869AbfLLP2G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 10:28:06 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43210 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728939AbfLLP2G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 10:28:06 -0500
Received: by mail-lf1-f68.google.com with SMTP id 9so1990394lfq.10
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 07:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a3HoIlbnDsQ+bG9LL9JaGOgzii63aNDgW55yKpCip9Q=;
        b=iKPEiMkKQgBQ4g2yPLGxQjeGhMyleGCLknPgXerp//TZbCetjQRPk0GwMRD1WJWWh+
         nrTwHEIOkBB34TYXuOi9YObv2wC3fdH8p08IfQLU9LUXhNp1ObJACUNQryh4iw/iN7/J
         oCIvUcHOAR6nY3v4xCJEPkm5FKaOWK5fGZEvnN8WVIqtXw48XWCRpddOiN/OlQ2aRqgo
         6ZhVx6Nlt4upYgtta0Yyos1/+smXER5q20OgjRzSWGBMxYavvyZjdM+H5G9HKjXJvlBE
         OBVTQb3i0yF0Ljjqvd5Rt/U8xxg8LDV0m91fNszkUwKDKlVtlWupOQ9+ZvGmKAdeg7Cp
         //Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a3HoIlbnDsQ+bG9LL9JaGOgzii63aNDgW55yKpCip9Q=;
        b=HEy7WAinpcWYo98lm6gImGdwDVrp33MgXa227Rs2eVLkTl5cP7/Z/Qc8jALRMsXLF+
         0Sk+Voe6CJoyeMA+g8W/vcLZj0RgX6qfqhMiWPZOnWtXeRAtt3O5zBliluvwFXksBDgE
         gA069UQcVTM1k8MAnNW0XfWju/UTu37/PJ2vYoDoNqu6vAcgR6Ue5cdrICYVjQzBdWIr
         httLxg6c/3jAc1D3aL3DuTevGOE+c2Hg6BLnXxWYcdcL2LFPvl6qD92pXoQCkWnvQFg6
         ohy0aP0u5GUYHVhInM567D9aGDrRdfWDwRNeyVMxgZyt7/Lv5IJodPH/GdupoYkBQYgn
         om8Q==
X-Gm-Message-State: APjAAAXclG/bpWzTRB+H3c1gVkDXS47YK/yhbGbSyaWxoG8BbPEWDhh1
        o9DPvnKgPA3aLJRZds6XXD2MYxkQ+PN4EFHl/IHc4Q==
X-Google-Smtp-Source: APXvYqxiy9bV88GGh0k1LLBojYnrA1fLF0F8FrE5iWdwSwTFvk+H0DElw5XdBSrCzUI8nlHvxA8+NcTHLRbEJpbUXLc=
X-Received: by 2002:a19:2389:: with SMTP id j131mr5789532lfj.86.1576164484490;
 Thu, 12 Dec 2019 07:28:04 -0800 (PST)
MIME-Version: 1.0
References: <20191202050110.15340-1-andrew@aj.id.au>
In-Reply-To: <20191202050110.15340-1-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Dec 2019 16:27:52 +0100
Message-ID: <CACRpkdaHXYdHOtCE=_e549rP5DpzP0ayOR4nJmq055Ftiorr-A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed-g6: Fix LPC/eSPI mux configuration
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 2, 2019 at 5:59 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Early revisions of the AST2600 datasheet are conflicted about the state
> of the LPC/eSPI strapping bit (SCU510[6]). Conversations with ASPEED
> determined that the reference pinmux configuration tables were in error
> and the SCU documentation contained the correct configuration. Update
> the driver to reflect the state described in the SCU documentation.
>
> Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied for fixes.

Yours,
Linus Walleij
