Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98C6B570423
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 15:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiGKNXc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 09:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbiGKNXa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 09:23:30 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E408645073
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 06:23:26 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id h62so6042393ybb.11
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 06:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9D1dLV9xMKJuNyRP9AmUgHsdCNcAhz68J5kZZK5reNE=;
        b=wuVTilc/TusAMwlR8S2I3Yd1JntpcizLN47ye33n5UpnVWXGoZduwE4m9mha27zWcD
         WsaY2zM7r+s3v4mmSEh1jYWkcJiFpMNNCm1oPRgUTQbp+W125XSXLA9S3NdRqVjRRp2b
         xsgpb64iXM8hrEXdMXm5jUMdCwyw5J7eLhMfqBocgjjqk7e5P7m5ZyaPAgmFaCDPQUUq
         oAgJ13zZSLBeyZeMk04bNGNwYlBXNc2zyr1fIpqME08X2wDam+RlfrVFXH92s5qewoGp
         vmG029/fQ2+WdV7t5hcxY3COtePc3ZPY32+nbSMJ7wa8lAha7vrT6shjOCWp0ZrYVFPf
         SnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9D1dLV9xMKJuNyRP9AmUgHsdCNcAhz68J5kZZK5reNE=;
        b=bXRmMNAcJg+A1SSpRZzh3/BsoQNP0FT4v5WvU70UODYNsO3N9T19hE3w2712X8wrkL
         Vid53QstNW0Q5Ov4c/ybizerQYP0VV8tnd9VzXKT0NdXkz3DnjHgfKmb6GrXMvVOYxGM
         +8j/JIvHMyO4Dap4WJCPXt15w0R/oaGSwZhlofOKq4syziCAu/sETNI7wWvqb1YCOAcB
         G60xKVttZ/PDXzhn7NRlNpUjl39aLLviTNDN0jUm+J6Vz6cdN7aPoGDfrfBLVwoL7zz3
         I7sG5fkEF2CEud66n6bYZP/x866e60ew6bR22Ycnq0Yp6DLpNFKPIEw1YpZ4kyExR/bw
         Z8/Q==
X-Gm-Message-State: AJIora/8p2A0NsenQz+KlmsJQq6jzEigMg14nuuKoHy3EgwMbb0dRJ0f
        Yora7ICCWFDxHToFpyuryleDQgNSLDan2I67e0nEomMyaDc=
X-Google-Smtp-Source: AGRyM1tp2XKb8aMFJASghBSshjmimhCLgizt4wgYYiU1FElqXfmCoLQdhf43raWxOOa0cKek5Se18hH7ydMZPpmLA1U=
X-Received: by 2002:a05:6902:150a:b0:66f:8a6:be47 with SMTP id
 q10-20020a056902150a00b0066f08a6be47mr9395596ybu.291.1657545806147; Mon, 11
 Jul 2022 06:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220711125238.360962-1-windhl@126.com>
In-Reply-To: <20220711125238.360962-1-windhl@126.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Jul 2022 15:23:15 +0200
Message-ID: <CACRpkdZJBT86um5VM0e2mnMEv=cVrg7PmZNGbZ0GwxC-1nXbBQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: gpiolib-of: Fix refcount bugs in of_mm_gpiochip_add_data()
To:     Liang He <windhl@126.com>
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 11, 2022 at 2:52 PM Liang He <windhl@126.com> wrote:

> We should use of_node_get() when a new reference of device_node
> is created. It is noted that the old reference stored in
> 'mm_gc->gc.of_node' should also be decreased.
>
> This patch is based on the fact that there is a call site in function
> 'qe_add_gpiochips()' of src file 'drivers\soc\fsl\qe\gpio.c'. In this
> function, of_mm_gpiochip_add_data() is contained in an iteration of
> for_each_compatible_node() which will automatically increase and
> decrease the refcount. So we need additional of_node_get() for the
> reference escape in of_mm_gpiochip_add_data().
>
> Fixes: a19e3da5bc5f ("of/gpio: Kill of_gpio_chip and add members directly to gpio_chip")
> Signed-off-by: Liang He <windhl@126.com>

Patch applied for next as nonurgent fix!

Yours,
Linus Walleij
