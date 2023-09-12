Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76A4379C999
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 10:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbjILIRD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 04:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231868AbjILIRC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 04:17:02 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D85D7E78
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 01:16:58 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d7e387c33f3so4626493276.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 01:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694506618; x=1695111418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6RGfYRFPXOdj912iVMfEgfkufAW2hfFKbw8063QGj8=;
        b=XMesouPHqx0GDPIbSkl+Ff8EcJYB4IWw+90vgbqSa5Re2CyzcZJun47XBvDy6aZykb
         L7tJhoBEbSrTrs3u8qpX3QLyImFip8fyRue2rjj3qpGXhTatySnlWZpLBrougTmVo+Jt
         NsruI2tcjKbURBHA6MWpwCh9bPqFqc5K/CPz6zHzqiRjmYNbmT179F0UwuCr3PeY+/KM
         Hf0uprT6NqCKfg0b2JMcr+0GGZm1AJtoYXPZZyLNiz7FW4ziB2UUMf7OcvcVLpXcAWbB
         iUKCTfLzGn9Tt30N7qbqDZSHfC+R8q9SwxAbvP+M7LayhXKH3gON46/j01MIOurwKMCJ
         KDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694506618; x=1695111418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6RGfYRFPXOdj912iVMfEgfkufAW2hfFKbw8063QGj8=;
        b=tcY6Z7vM/ZEMMn+hsryI6mSIrqBVOtjuPaZbVsvst7BbDzAd+iXUnO0dpMXtCLAQHU
         lxQKJMskYGepYvKur/blk7okProOfZaFbZNO4y/u1kEJvjTkcQ4QCQBo8N182LepTS7Z
         dXZ6GiWpPfiU/xDNueaAWWDmpSTSMa66tC6d7orpLF5jsBfHCCGg2a+0JgrrsOz367Fg
         2E6walPAvBiNXQsOWHb4YEzYR0N+JbJe/m5OWOzPMjRa6qUWkAe4yES0+kwwjmlNpfdw
         mgFD4Muf3iiRSZ5AjGgvKrFQT4s49mPmjkTYMxwhDXNQjELwbnq5uQI6+kBLuoIsfp6/
         ZKqA==
X-Gm-Message-State: AOJu0YzPSr2HMGn/3UtYsY30d7wrHjOksUnRDbkwL19ispeu7CSDIUlC
        Ufnf5V70Tf5/JXNkaFito+ut9e2inobjsLUWTGenH2ay3T/uER6b
X-Google-Smtp-Source: AGHT+IGjg7IAksfDlRe/Cye9RRC/1cK8ZBAaKvMgb15gIkeFfbf1pX+zTtOYhhJVTPUcDjSH5LyQ/Bse3k0BXF00j5s=
X-Received: by 2002:a25:d697:0:b0:d47:8db3:8bcf with SMTP id
 n145-20020a25d697000000b00d478db38bcfmr11703010ybg.49.1694506618096; Tue, 12
 Sep 2023 01:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230909063613.2867-1-jernej.skrabec@gmail.com> <20230909063613.2867-2-jernej.skrabec@gmail.com>
In-Reply-To: <20230909063613.2867-2-jernej.skrabec@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 Sep 2023 10:16:47 +0200
Message-ID: <CACRpkdbaSza1KjbeM3X4103xcWZx+4cwAnMiG9eaLF4JVZv0JA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: pinmux: Remove duplicate error message in pin_request()
To:     Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 9, 2023 at 8:36=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmail=
.com> wrote:

> Detailed error message is already printed at the end of the function, so
> drop redundant one a few lines earlier.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Patch applied!

Yours,
Linus Walleij
