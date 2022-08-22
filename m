Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94A5059BA59
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Aug 2022 09:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbiHVHes (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 03:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233054AbiHVHek (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 03:34:40 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53042A70F
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 00:34:36 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id q2so10568592edb.6
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 00:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=fvkePfg5Z8AnsJW6Rn1zQN/6W0czuYEMlAwXL/SrWCY=;
        b=bdId3XI84qnkcKGGTKuhProlLYOZVfduzc3fqlENp1/aFUvi4yMsMuJSYWf26gVYlA
         /v70xiLuELPgYk8KbJb9lHYCeYyaJukkGRTjgq2Fi4Wcd09juKk/9d11QnNaDbHtmZ+r
         TADxbAlwxu/5TrvBGnHT+8U7GQVH7o9U22ICWq2FR3lHaRm7uY2LYGM9+4XF3f4y0xkc
         awvAZGIkJlAQFeS9CliUk40f2WZmPRh+NALahRhwOShkUizuXEI5/fao1iONwjEjUi+N
         vJgAXEwbgmZmiBJxiK9Cfs3MxZM8Lrs+5wzPfMBGIo0H8rhQIsSINewaU+hpItjKOwv/
         x0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=fvkePfg5Z8AnsJW6Rn1zQN/6W0czuYEMlAwXL/SrWCY=;
        b=EamSKx8077tDTv6BtSrGkFgG5mWWwHkMqkM+U4l8mDq/bV2Ss2/yG3zrLS6sajtwwe
         i52riuPAsx42TQ2G6+EPjzx24oSDvrqggu+OlnReQoKcrN56nllYud9hI1GDuLKmAhTU
         k3rPOuS+5zzMOx5zJ32VKaLyx4cmMNVbJXMkEFAoDnkf8rSbgqibmVd/X/cvwOFBPvhA
         FCbWZ4e6pQyaXt1R19drrOqAe2gV4JeUvppVk1KRDLHeqNdnd8DAZ4FyrtsnTQMizw3j
         hoNHeeiwwyvIjOUmWcpT09v8vZUlOLBoRFnAk8pN+5hQMJntqcaFpcQXmD1On8ZjhwXU
         bkwg==
X-Gm-Message-State: ACgBeo34I9JjgeEij93uRJ4yUbZCGey1v2Lfp2x4MuGzd4GlZEDHR7z8
        mkYUWOIBWvhWuDl5h4RbkthfnIRPS2rNuN89lhwDLg==
X-Google-Smtp-Source: AA6agR7IwFI7TfNPRzy6OF68L+fzZeyk3K7k+1iY3N0yW4o8A63hB96eZqIFGzxxfgPvmtdXfUffCWfu3UIPJ3D5UME=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr15184590edb.133.1661153674981; Mon, 22
 Aug 2022 00:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220728155652.29516-1-henning.schild@siemens.com>
In-Reply-To: <20220728155652.29516-1-henning.schild@siemens.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Aug 2022 09:34:23 +0200
Message-ID: <CACRpkdZub6cSNSEsZt+L9BVusiJYRvb961XDs4tcNDc8pcggog@mail.gmail.com>
Subject: Re: [PATCH 0/4] add support for another simatic board
To:     Henning Schild <henning.schild@siemens.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Tasanakorn Phaipool <tasanakorn@gmail.com>,
        Sheng-Yuan Huang <syhuang3@nuvoton.com>,
        Kuan-Wei Ho <cwho@nuvoton.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 28, 2022 at 5:57 PM Henning Schild
<henning.schild@siemens.com> wrote:

> In another step the individual banks receive a label to tell them apart,
> a step which potentially changes an interface to legacy users that might
> rely on all banks having the same label, or an exact label. But since a
> later patch wants to use GPIO_LOOKUP unique labels are needed and i
> decided to assign them for all supported chips.

Since it is all in-kernel users, any "legacy users" should be in the
kernel tree and you should then fix them in the patch.

If they are not in the kernel tree, they are out-of-tree drivers and
them we do not care, we can't fix the whole world.

Yours,
Linus Walleij
