Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6267679C03A
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 02:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240114AbjIKU4N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235511AbjIKIt5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 04:49:57 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65DF1A2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 01:49:53 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d7b89ae27d3so3601700276.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 01:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694422193; x=1695026993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XeVTw6l9wEw/TS4Pji090kAEBOAUIe1JhBKyS65/GM=;
        b=WAEgihlJWBXiKO4E9FJQd/opFTODCuvfqZwsk95t66AAG5UTQH14iOItVj1gSd4/fH
         i8wRJIUALpWNmrI2Vs9eaJuwZYHACV3YzMyys+0EMVqBcfgRKARCRw9cLOxcBaP9tqH9
         p+wwVwQgJ3LNECtByxxVWZZDaTmLNdyGReIrDHiadQTdxkmfvRqGLEyjBiqKarLZ1t5L
         oQfR/gTUnJvz5/5Kt8SCuz9lQZ1z/TNbwbKcaXQq5i3bwuAW10sJMaS4NKUQAhWOi6gf
         q+JdWkNxX84MAwV6DZjdikzIdniOXDFP8xGVEO9kXI+1euKRQyHBGCaQ/pt+T7gkpOxv
         gBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694422193; x=1695026993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1XeVTw6l9wEw/TS4Pji090kAEBOAUIe1JhBKyS65/GM=;
        b=DwWVE+w4G5LOsgYBF5xN7I0hIkVSmVdVYyccZbDgIA0pa5g0vk77x+PpW+mkZlviz7
         sP/XgHzf13xCQ368AAYfNHn4K3tLmb7JqKuJF6KC0kzi/BrYrCnUmeldtcjDZ7WSMsMH
         YUnUlo8vmluIi94v6vEzrrD5KroEk+UAhLLEON4RGM5cWjcLFedTXC+8C2r6Up/B8gnc
         3kja2p8DEwEqQnCHzg74d4tS68SF4xsGl/s+sBxybARfUN6BQcggyCC+/hdZvumuyrpp
         /YTmerJtGYg4ofrJtOSF4ThIGyDJCaf7ndItVVcrJzTQMep+Ot7ItlHsxqy9+a90Eszh
         l+yw==
X-Gm-Message-State: AOJu0YwuCDuNwK+LgI/fmZX3I3nDDUAUK8srq7DbgynPSExjeRtXFa/F
        Rfmpnl0Idw5uXurSz2Yn7Ox3EXKmn01pTXH6o+scgw==
X-Google-Smtp-Source: AGHT+IGbpV2m4yKh+I0fgDw24ZWEJ6x0/MOD946fI6agF+0cD3UaHguS6LgmwKLsHoRPmftj975mmYdj+r++S5ll+V8=
X-Received: by 2002:a25:d695:0:b0:d62:6514:45b7 with SMTP id
 n143-20020a25d695000000b00d62651445b7mr7997320ybg.37.1694422192875; Mon, 11
 Sep 2023 01:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230824064508.968142-1-masahiroy@kernel.org>
In-Reply-To: <20230824064508.968142-1-masahiroy@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Sep 2023 10:49:41 +0200
Message-ID: <CACRpkdbu8eYYTwpVr2-AS7qxGRPkXp9gVgBzkcoDvxV7o4p6MA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: remove get rid of __maybe_unused
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 24, 2023 at 8:45=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:

> These are always used in pcs_probe().
>
> While I was here, I also changed 'unsigned' in the same line to
> 'unsigned int' to address the checkpatch warnings:
>
>   WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Patch applied.

Yours,
Linus Walleij
