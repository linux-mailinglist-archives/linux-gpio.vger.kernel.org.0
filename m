Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26C065BBF67
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Sep 2022 20:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiIRSzh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 18 Sep 2022 14:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiIRSzd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Sep 2022 14:55:33 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0660A1180A
        for <linux-gpio@vger.kernel.org>; Sun, 18 Sep 2022 11:55:32 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id r18so59901992eja.11
        for <linux-gpio@vger.kernel.org>; Sun, 18 Sep 2022 11:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=SfoXTVxC4EenSCtmX5pFzmMrp9jLghlQkoL0i7o7jcM=;
        b=lOsz6GX2zXk+Gho0sHZjUC+lGDv+NZdLxlI1PTl0ZvljmUtcb0PlWLz1v8wp7Sshdm
         HaFiKLCzqLdOEhrIra7TuA6/3zbgcrqk/sehwHta40jUdlwshXZ8xylPzAi1ZLvnP/s1
         0T6GTnuRgfhSJQwSdivlk/Odsh9Yw8oLh4QL2bYI/U+3yKSe6Xz18UQO4WLXHSui8a8I
         IJMxYVHbBlHtdfxkb5+iEs0ZBzwBVQvTmPqpOutSh13Lipo6ypG7Gvv9A1x8jkN43vHQ
         gNi185k2ptqcWJv7D8vM44ImVFk40Qo3ys8ZCXGoqnXwfyZDGdFpaXhwwyd2M8uBWxRo
         2a1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=SfoXTVxC4EenSCtmX5pFzmMrp9jLghlQkoL0i7o7jcM=;
        b=A/t/nE17hchq96EaOKmQwpzzAhoso7Wu4xxGikAozKqN/zUxGknEZ+wHs0Sa/LxLgr
         nMnIsQeyu4hNer+Q7SB3KGsylnA1/tPYFCbTu9eogctHeyPft9aDG203K2eIfGOPIvBB
         taJFZShx9FIDzR4/5Vy0oqksOzFaebrQC6yugpVC5WDqDhxC8resyjsGiX69eARAN82l
         yMcNqwDns75PPr/rtRBOFPkQ3tkmlgPUjmVWbKwbFMDpbOmms389o/k5rU3dOaK6jTON
         ef1yQqahx2U27TaZMT5imjqOboRgfqz50h5irwHX4J8hAhVJGjd72/0z53f2/yoRgLq+
         ItHQ==
X-Gm-Message-State: ACrzQf0OnHDsn1JTvf0pp4wyVAfNZYs021gn1buQhb1wx1HUQNPCaOto
        imW/IoynMFlVzmlR1Bci1Zo3t3qAP9uRP4kG7u7TgQ==
X-Google-Smtp-Source: AMsMyM4SrZG8tMpvowE8J1LWuUAJI6HsKBJo/gru9NLIE4s9M67T2rIR0KXP3f27waT/zo3HFB7DquTQyo5s9XiTFjY=
X-Received: by 2002:a17:907:7e94:b0:77a:c48b:c80 with SMTP id
 qb20-20020a1709077e9400b0077ac48b0c80mr9866127ejc.690.1663527330494; Sun, 18
 Sep 2022 11:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220909145942.844102-1-horatiu.vultur@microchip.com>
 <CACRpkdYWP4ASoO4wWSEgdCPbNLsx8fuHn_-oqnD+ff1TU84ieQ@mail.gmail.com> <20220915112247.fin7bb45plnr7cme@soft-dev3-1.localhost>
In-Reply-To: <20220915112247.fin7bb45plnr7cme@soft-dev3-1.localhost>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 18 Sep 2022 20:55:18 +0200
Message-ID: <CACRpkdasNECTqew4=5mNK8SRd8SiLFw=BwMKBGoNhu=8A7jJZQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: ocelot: Fix interrupt controller
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com, UNGLinuxDriver@microchip.com
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

On Thu, Sep 15, 2022 at 1:18 PM Horatiu Vultur
<horatiu.vultur@microchip.com> wrote:

> It would be great to go also in stable. I have tried to apply it on
> 5.19, 5.15, 5.10, 5.4, 4.19 but it failed on all of them because of
> merge conflicts.
> Should I send separate patch for each stable tree?

You should indicate to the stable maintainers that it should go into
stable (option 2), then prepare backports IIUC. See:
https://www.kernel.org/doc/html/v6.0-rc5/process/stable-kernel-rules.html

Yours,
Linus Walleij
