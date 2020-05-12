Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2B51CEFE0
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 10:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729241AbgELI7e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 04:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726067AbgELI7d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 04:59:33 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA1BC061A0E
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 01:59:27 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id d22so3844030lfm.11
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 01:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FtTPdGUOTolZ1ZLFUQTSg7EYpfQ8425FVj9aTYf/Yu8=;
        b=MqEzPru7satdnTw4/7xDfRXbz6Jk0vGgsATTZxQc8EEv9xqS1n4RiuwTVNjeDWrZwt
         fmDIpGEm6Z2rswJ5D5F2nZU+0S3NNAl1YRYlum/bKi2fxyZFm8xCfXBRpc4x9Am1pnqT
         1BzCzopxt1ykc4rrprgeriuXXpN7uaYdAC9x5+y3W6ZzY/XFI8OGTddNPQCeaOHxKHTi
         Ey6sJziXMaz2MMk+lxxq70wpLJdxFfxWYCUe+GInbrfFVc0SPJDdt86hNpDOBJZm0+/p
         lRK+hDXTXbsJtDIP5Pe33T82nz8SLVWloYW7qgNNGBLDH966uEquC26p1wUe9DaN9bgl
         LmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FtTPdGUOTolZ1ZLFUQTSg7EYpfQ8425FVj9aTYf/Yu8=;
        b=VWP5qplSrgRkLT/ZmhBcZywEb7FmUeniZ4KjSwWM3hHc01pDmHnXcb+07/dP6nnr8H
         fdSATNHKildeuvrV4PSfkvO1Reqa0JmTlVNySJjoL20jnpuo01vWShXl7pBtB0MfX2yz
         X0XAEaaFwplT4Ss4P2v2TKCL8pvBKiZKnzQvw0hTa3TCxJCva6lxxu46FqFDqjqlSPSv
         Qfl1dWin+UrY+p4ouGU2NWyoiirhRoKbSYYziAmt+Cvbx8VzcrKCFbQeW96Au6HJwS4l
         7F9JWb9TssRxR08J3g8uS/TyZaL1C+VVKBNtpVTS3l5q0BvGxn8JCoWsy2NrBdlTT3t8
         A9wA==
X-Gm-Message-State: AOAM5301yVs6L+gdNs/G4OE7lyMLYLlJ2btpmWJIoNkDSfOlI/Y2i6of
        EPgVsVjbfyr7KetjlEx0l51nLWyhmeloy0Wf2Jil7g==
X-Google-Smtp-Source: ABdhPJxSFhDR275G/NDbPfJQvsucBzf/u54hkaewZOa8qR3685f4JC5VadgrZkHgN/ddRrcZHMZHedHvoJkYT7zQSIc=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr13830411lfi.21.1589273964850;
 Tue, 12 May 2020 01:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200511143512.GA11655@black.fi.intel.com>
In-Reply-To: <20200511143512.GA11655@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 May 2020 10:59:13 +0200
Message-ID: <CACRpkdYy5csmByjVVGPYO7dae8GgjMWuhMb232y2F4K+2neABA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.8-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 11, 2020 at 4:35 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Intel GPIO fixes and cleanups so far for v5.8-rc1. I don't expect something
> coming soon into that cycle.

Pulled in!

Thanks for excellent work as usual.

Yours,
Linus Walleij
