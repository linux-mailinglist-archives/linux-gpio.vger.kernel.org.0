Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2607E2C18D2
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Nov 2020 23:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732791AbgKWWtf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 17:49:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:50402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731246AbgKWWtf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Nov 2020 17:49:35 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BF24920717;
        Mon, 23 Nov 2020 22:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606171774;
        bh=zkxKu9PcpJgd6jwfM1hllUs+2mvAxQUlzi3adzf37Ak=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H4zx9L/QxsmyFNH7iAzPRMM2gBptIej0CtAKhLKhnCcF1qsl5Z4sNTtIWvTdRKCek
         OoiMRzQjMjAs732SholWRTGimL+4lMccUp44OOJcoTJQ8aJ4gNC2vKWOxpDElcREDh
         oO+oyaGTqHnWQXTM5s538VX/PI0t1849QjIraAL8=
Date:   Mon, 23 Nov 2020 16:49:48 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 049/141] pinctrl: Fix fall-through warnings for Clang
Message-ID: <20201123224948.GM21644@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <da20103af0c22424c5d08a12f7107771bf4c01c5.1605896059.git.gustavoars@kernel.org>
 <CAMuHMdWcooXsRULUVwZR35z=2fUN=5pJoV9arAK+baWCz8ECjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWcooXsRULUVwZR35z=2fUN=5pJoV9arAK+baWCz8ECjg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 20, 2020 at 08:04:42PM +0100, Geert Uytterhoeven wrote:
> On Fri, Nov 20, 2020 at 7:31 PM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
> > In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> > by explicitly adding a break statement instead of letting the code fall
> > through to the next case.
> >
> > Link: https://github.com/KSPP/linux/issues/115
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl-for-v5.11.

Thanks, Geert.
--
Gustavo
