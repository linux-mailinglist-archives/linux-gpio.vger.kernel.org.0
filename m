Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6324C6CB0C1
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Mar 2023 23:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbjC0Vfg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Mar 2023 17:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232390AbjC0Vfe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2023 17:35:34 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8342703
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 14:35:32 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id k17so12555475ybm.11
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 14:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679952931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFrjOiyw9NOJrCSELCRF57j8yyvcTUmmRYnuJvEzIrM=;
        b=UL7ZgfxSqK1ZVr5QxWWxSlIbYG5Zcsz0bLJV+X6mz8FkUneICpW4a+FfqnapXhkZxm
         kb3DeNSBC4TgbjscjYhPQahw/OZiLfk4SvYOF4RQVodvE7mM1SrgUSouhVfZrQGooIcm
         +6ZzpGReDSUxyRsB3nJTG+Fd0C0hwiFpg+d/bWENPCrrFgj/mxw0rjKfzO+Y7FAx5cDT
         TRfe8kzW/9zGnyJdSs8MXsst2L1dgisdSQKk2cxxKq0sV3n4ehKPPcppq1d13cUO0mT4
         lCdvh+pFClRdmQ62l784Ii1kWulyRhugxuXLsNGVn1b2A6iDdZRTLhG+VBPWjS/NYzea
         3CcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679952931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFrjOiyw9NOJrCSELCRF57j8yyvcTUmmRYnuJvEzIrM=;
        b=3xAY8j61GWRA1zsA/4F3yU5oObLPyM1ashqxUAwGxRXe1A5OyUbGGAB8PuoN8ciKyd
         U2VQxqsK4woAncysyx9DcdtJAEa4E5t3Uj/poySIa9iO5xZLxAPV2gkdic1BI+uGtno1
         3YrsKNedfN7uj3cI/2xf8UbPtnKApiMhAJ+kDo2P4S5ALtxK3uP+NzEt4+rgrJh/YZix
         pbl+Qw/jLA9mceWyxwvX/6n2GjFifX4CH1UPWNYacuUVfW+Uq9KtaGYvHsNLoLD7k2GY
         4+X/+bqBEjgpGR8XW5mk0oIxrdqVgcsIqQBJtocycDK6cw9P6KRkwpDhEFKOhM3HMUIu
         qOkQ==
X-Gm-Message-State: AAQBX9cS6YUMU53jMS3Y2G+kQ+wMasQ9/AX+Kje2VuH+gSPmeYZANeCS
        tP55MtbQl9BwVWMGDeOMi+WpPm1OizfvYL1+l8isE+P0BaV8wJph
X-Google-Smtp-Source: AKy350YwCN7aEsQ4PXJbvf3lkx+vF+xXWizPiHiEaONkOLg4Wr85I8hFqVdUbKX8IEbw3PzQq5FuqpOCUFqGKlbHlbg=
X-Received: by 2002:a05:6902:1145:b0:b09:6f3d:ea1f with SMTP id
 p5-20020a056902114500b00b096f3dea1fmr8142319ybu.4.1679952931656; Mon, 27 Mar
 2023 14:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230327062754.3326-1-clin@suse.com> <20230327062754.3326-3-clin@suse.com>
In-Reply-To: <20230327062754.3326-3-clin@suse.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Mar 2023 23:35:20 +0200
Message-ID: <CACRpkdat=069ZyPL=w1_z6cNZ4EbVvG==SLcnT-pmsH6zhqtpQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] pinctrl: s32cc: refactor pin config parsing
To:     Chester Lin <clin@suse.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        NXP S32 Linux Team <s32@nxp.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>,
        Andrei Stefanescu <andrei.stefanescu@nxp.com>,
        Radu Pirea <radu-nicolae.pirea@nxp.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Matthias Brugger <mbrugger@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 27, 2023 at 8:28=E2=80=AFAM Chester Lin <clin@suse.com> wrote:

> Move common codes into smaller inline functions and remove argument check=
s
> that are not actually used by pull up/down bits in the S32 MSCR register.
>
> Signed-off-by: Chester Lin <clin@suse.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Patch applied!

Yours,
Linus Walleij
