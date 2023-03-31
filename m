Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB2036D2029
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Mar 2023 14:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbjCaMZD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Mar 2023 08:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbjCaMYw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 08:24:52 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E9A1A474
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 05:24:35 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id i6so27183552ybu.8
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 05:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680265474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXFJEpQ4XHmA2YSoBH/MUjVigw2iWnosi2S1nnemWkQ=;
        b=pXNQV82uYxsIbav/3DvbycIekmnwuZ3rvTcqj8VXpmWo7DIIpGha4v4PS5TWGkHS2E
         rsYy+MQLaPn0FxerV8LD40fBXp6pHY4uX8kkRYioyk0OOKicsAbE3RWXmZ31OzCK8p1g
         xjh8db24kK+JB+cufGCfz8IigeAQWnIvqOacEa/Hbz/fJsNQvMU4oX+RwIt+1rAjh86C
         jRq0ZDVwN3IytbRuY7X4xv20DP1DFNJlpekH90r0JJF7Bm3GH9oon1yYkUtAFs6zK2zU
         TAME/qfK2scMkrUE70+Itql2GuJMjxcS1uuT1Y5uaOiLPsyA2Yiqreyc9JWM9rPzcJJP
         Q7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680265474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXFJEpQ4XHmA2YSoBH/MUjVigw2iWnosi2S1nnemWkQ=;
        b=Ium/ujDREVud9qiKRgym6A8RoKHrI6XqyeqI5d8MLuLBJdVaRZzz4dGcBo3GwSw7LY
         HnumMBeumSJhMv5JtO+B/9euurxExCnI0AyPtVULYp1nZwUwJNhlGEVNG3PSCFVYDM24
         cOOD1KGOHDmdzUa/Uz+9lSucYhfI22mjygALQgaigRRe836LwYweYLGGg35qhwVROm4t
         21dbM4wB4Dvumv/Pn5JEfpfzu4cHOE3GbMzP+y3svCKB532qI9ja9cO/L3a7iEkD4QVV
         lV05thP0fR6qIxVU3s/9FU0cZe+iW7Lqv+cujhyUcqHsse0VHGz8oWB3uZjYyJaEYWCK
         WK3w==
X-Gm-Message-State: AAQBX9fPuxjr1UttBftO0xCd+Pbj/c7bkm4dYq+nAsHrky0KRDD/CK5e
        R0Xh3aA+bhcXjaIg0ZGlANQVv459nqVYx2JKoSkb2A==
X-Google-Smtp-Source: AKy350aE91H/6QW4fgrlaypZVf8/ibhExISeAYu4i38CNTK+JgANOp/slZSzTYYJYDz0EHiQh+XjiaOWn8sImADlBJI=
X-Received: by 2002:a05:6902:1006:b0:b78:4b00:775f with SMTP id
 w6-20020a056902100600b00b784b00775fmr12968348ybt.4.1680265474658; Fri, 31 Mar
 2023 05:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230328174231.8924-1-mario.limonciello@amd.com> <20230328174231.8924-2-mario.limonciello@amd.com>
In-Reply-To: <20230328174231.8924-2-mario.limonciello@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 31 Mar 2023 14:24:23 +0200
Message-ID: <CACRpkdYiNTMq6YfGi+i1_k+92_1QShFrX_WFtV4eLFOQLAGD-A@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: amd: Adjust debugfs output
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Natikar Basavaraj <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Mar 28, 2023 at 7:43=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> More fields are to be added, so to keep the display from being
> too busy, adjust it.
>
> 1) Add a header to all columns
> 2) Except for interrupt, when fields have no data show empty
> 3) Remove otherwise blank whitespace
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Patches applied!

Yours,
Linus Walleij
