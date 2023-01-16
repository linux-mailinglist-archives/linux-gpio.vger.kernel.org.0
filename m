Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 195E766C08A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 15:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231510AbjAPOCP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 09:02:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbjAPOCE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 09:02:04 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970966A62
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 06:02:02 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-4d19b2686a9so254178167b3.6
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 06:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jBN0qqZmEO6agxFx6shL5YuCyHbnFiNITxRT6RYpaio=;
        b=kp2JJXWO6Ibamd0ggGyKVGdOk2rZmq4Wu0OtMY7qeNePoqDUGvIwZ1LWbqtNPCMrOC
         8qlY8ydzFTrHMyZYUK5/yD6v2R12kNmEqKfLD29QORzNDCszAh5yCg3hkYjybf0G7urh
         BOcj3aUn3y5MLitr4hSpJlRIXsAGRFz197kRW0SYrSdzgYlCAnKglVQYBUI0X9o8nuna
         y9CDsfdD9KyIclsNpoEx+uKQ+G/mZxAopGzWL+0+td8OfrRRJuK+O8Zr+xdQxp6V9a5t
         DEWYGX47hDH5BaEWqNzlSfPoDmvTjfYMIgPw55Q9KBpwB81IR5vSmt+jS6QK25FZese3
         xU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBN0qqZmEO6agxFx6shL5YuCyHbnFiNITxRT6RYpaio=;
        b=Vfqal46E2bvN8HON26/1iLjaW1EQw8r4UolcJyOcmQe30yTxkTYlYt9mHsYHeRei2c
         LGx1e6ZabG2txSkTwH0/iVPE6V+HRBBr4X51gaMjzaaTbHBwDw/o74UR5QuAprF576p0
         idecqPvxKRuwc4Vcb9pwHe/D0NTswDAuG3koMwXM/sMY5LhH4ELKzsiJHVU97n7vgcy1
         hE9K1QroKTTxDyuhz4tLYgfdsfoJe3xaV10avuYzVORyJ06KoR5qUtB8/gY+aOYhFmhQ
         mxOei6nvCvX+zj1hO69YLf0Nsq/v9PU/pTh0f6sBiEPGX19uYdLUj9LlWFrV3ICzuUoE
         ohPA==
X-Gm-Message-State: AFqh2kpMGxLGFTdcHkxtDVVUUls9zPzWY92FlThW77aX597aefQe6eGs
        6nJnIhC+fLoSn1fmFfzKVuk2DQhanTzCYER7KTYvZQ==
X-Google-Smtp-Source: AMrXdXvqmQ9+o9+EmKo29Tdj/UF8drW+qhhsKA0DVKdhHYftt4XJGXYrx6cN1uqDe3lZutSwUFsAQIvfvGxWnQLxkBk=
X-Received: by 2002:a81:484c:0:b0:36a:de9d:825e with SMTP id
 v73-20020a81484c000000b0036ade9d825emr4536130ywa.477.1673877721776; Mon, 16
 Jan 2023 06:02:01 -0800 (PST)
MIME-Version: 1.0
References: <20230112184340.79606-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230112184340.79606-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Jan 2023 15:01:50 +0100
Message-ID: <CACRpkdb4ziKT7vSNre4bsfkG3EEc0b_VaxJ=8XLqqCDad=jXSA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: mediatek: Remove duplicate assignment of of_gpio_n_cells
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Sam Shih <sam.shih@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 12, 2023 at 7:43 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The of_gpio_n_cells default is 2 when ->of_xlate() callback is
> not defined. No need to assign it explicitly in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
