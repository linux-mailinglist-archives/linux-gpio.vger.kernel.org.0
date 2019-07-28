Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C083C781EF
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 00:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbfG1WHG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 18:07:06 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36896 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbfG1WHF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 18:07:05 -0400
Received: by mail-lf1-f66.google.com with SMTP id c9so40610257lfh.4
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 15:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xm9bHOXPQA1Ng74FJTMs5cJcbc08V9GPb6VgTlOpIwo=;
        b=mmPZOQWmUeiv36jRDabUN5ry8vmxMnA/dXCrZW9XqYyk/C6vomf5pHi2FGwcVJsdBm
         GFRZRelqpMGC2xXRQl2Ddsbrmr9if+OtZkQpWr12XondqKdQUdh+uECHGjmc3MuUof/1
         sJ/bPJfKEMOu8GacDJmOP/enWiungCIExTORaRLWwM01XizOuru759xtcuLHWQJ5Gqy6
         gtdKWMWXUDCk0XXLNSgKfqv/f1eYFmN4TD8OxBy9LJBr2AGpM4duKhB00LwHgMDD8BpU
         E1h9I6E+FiXpQo2lMCVzBQxwxC4IoR+npXC4uKZQJbGXOb2rtZg7Vdr19nxUouYcy2rG
         zncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xm9bHOXPQA1Ng74FJTMs5cJcbc08V9GPb6VgTlOpIwo=;
        b=ZStgqdncNqeeg2vgHRogagDbZw0EzV70Vp+8+osc/1x0qnw1FubieqQxhvIwdFWOtu
         7Z3wF7ClJyaOo2jgqIrcsn9d+zk0uOrNoQsIJwRnskwYdtopg1ygfKsbeCMR+fm6Hrui
         fOLI3eliq7sC1bxifgymh+RrJ6LNRsdZTmtst4kABE65j7iH5OLXZQbEuNOhVYDtr306
         NpDYoPOh99UzqzNSNfW50QiSPjIAdm5DMbEU5HjVnoplYGzoruZub1GNpF/2zLSHbJLP
         cQfU98YctHMCXMdEUhPrJBfg2RGzTwv/sWsmFVvqEWYM9oEWL9o1hQHuyrnMsmNq/VTO
         +3yQ==
X-Gm-Message-State: APjAAAUIIAm9+Qd7Etu/eXYxyZU4MaMp1Epi7vNaAnZp9G4YLDNyDzCs
        K2kpjHrMISukxetDq7qqpiZq+uvhxSkyEPfKPc+wG+kt
X-Google-Smtp-Source: APXvYqwx+ffo3W/GgsKQ5dyqWgLkZ2Jxr3H/9hS9dHlZNb6i+Z1jBt+7jVQjxfDgmNdczbUkm4tfpRTwXZ+btk+8JZ4=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr39335555lfp.61.1564351623141;
 Sun, 28 Jul 2019 15:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190703145615.74768-1-andriy.shevchenko@linux.intel.com>
 <20190703163630.GY2640@lahna.fi.intel.com> <20190723155132.GO9224@smile.fi.intel.com>
In-Reply-To: <20190723155132.GO9224@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 00:06:52 +0200
Message-ID: <CACRpkdbb+efsEZeOViKyr+a-NXzJ1vBXx9dEnFzpeK3g9Qz+BQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] pinctrl: baytrail: Use devm_platform_ioremap_resource()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 23, 2019 at 5:51 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Pushed to my review and testing queue, thanks!

I take it I can get a pull request with all the Intel pinctrl changes?
They all look good to me.

Yours,
Linus Walleij
