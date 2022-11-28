Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF6E63B312
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Nov 2022 21:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234056AbiK1U0R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 15:26:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234049AbiK1U0N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 15:26:13 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E552A716
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 12:26:12 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id i131so14808016ybc.9
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 12:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ivfgzL6QAyoGf+nvGpGi0Jl3H4DiP0TYwu/zQ8mY04o=;
        b=FPoDnMp6zZagOTvNcUIQ2Wj1i9mvB7GYBcEouQVU6fBKpc5x8leZ9Lpuyx43jKBY4X
         CaBoi4F3zq07hA2evud5BgRMxxjpA6jtuwyfxcwdxF9TKRBiSY4cg2YcRmrCs1ov0cpw
         ZzDtZ55K5nHgJahbE2GXGOYNDe/xO6D9AsYqXQez1LSwYfr92PGOxgC1C3hrknhYdIHh
         SFISOyjDQInXcO05QM+mXpa1VcDhzEK/Oj7mLzZgJN4+4i5tl0X4AhT2BspMLXjQsi9f
         J21aVQNt7JrbWNh4oS1P31R8cySgt1/QLjQVFkIFeZKeG/gF7BnJFr55SmjYQVZES4oM
         1Bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivfgzL6QAyoGf+nvGpGi0Jl3H4DiP0TYwu/zQ8mY04o=;
        b=XXm/BY67CJNpuZAXDO5wuWDAL+9bHMaWT9JVDXVqcVKCxEznVBMjen4pss4L0Iy2r8
         1qO0QaZgbSth2dK7IMrBZr8QDHWj2jZIMSdGhpODvmVMqZvkROsU7Ynq/HGSQMYKkMMK
         q9+2vQNluuJsdsPiNc2LYHulJAgF0WAvlX8W+dDysprC9BZ8myb84bQu+9CmGV0a5V0m
         BZYDQpQYZKGXa8BAp8qpR1eMLcHtXajUfzLS0/KYDPWAP0rPfsiWH2vtO3pA1sr6/vuZ
         Ko2svckfmpb1rwZbAZ+UbQiXqFtFgWbNra4/PTwK5ag5SFxihG4Uw44NEPoskC5ST2em
         XISg==
X-Gm-Message-State: ANoB5pmyueZtih3l/Kb+ZOtbQkh0huZFSJzvcBW7UYpiWpJA4MTgggOG
        UadXW285vT9s3fbNMQec/WPHUP9rEy1lAPNUu9zfHQ==
X-Google-Smtp-Source: AA0mqf4m3bZBPdUjmfh8mmuq9HBWU57kZ/4H4ELfwEO3SuMb1bX2yLfOFege2KuRLkQYvMj5XEljlE5dM0DlrXEhsbk=
X-Received: by 2002:a25:d8d4:0:b0:6f0:36e2:5fc2 with SMTP id
 p203-20020a25d8d4000000b006f036e25fc2mr25779316ybg.52.1669667164793; Mon, 28
 Nov 2022 12:26:04 -0800 (PST)
MIME-Version: 1.0
References: <202211221631577017318@zte.com.cn>
In-Reply-To: <202211221631577017318@zte.com.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 28 Nov 2022 21:25:53 +0100
Message-ID: <CACRpkdYQvquRysUcwOWhbsi6uELHCAToUHoSo=eHLtkN6KYXvg@mail.gmail.com>
Subject: Re: [PATCH linux-next] pinctrl: qcom: remove duplicate included
 header files
To:     ye.xingchen@zte.com.cn
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 22, 2022 at 9:32 AM <ye.xingchen@zte.com.cn> wrote:

> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> linux/seq_file.h is included more than once.
>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Patch applied.

Yours,
Linus Walleij
