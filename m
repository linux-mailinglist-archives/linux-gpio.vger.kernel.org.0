Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D242554C9F2
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jun 2022 15:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348211AbiFONhX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 09:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237047AbiFONhW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 09:37:22 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0263D37A93
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 06:37:22 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id u99so20525529ybi.11
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SL+XKfrPcmFDGzMqXUP0Q3zOFZcervm0TfCcjIhWQCY=;
        b=HvrE0RNwz0Z1wNvSLjY0xUgVFD8r9bY8WnOqtNtQFPsvOO1TKPTv+hNq0n+57E8EcP
         1TNDG+DcSZ7Ya3HpqnT9Vh/5xLaOXbwJUelZn0/uzEHqeGAzFll2A1E1npkNKmfueQQp
         3WKcUw2PL1jGttMfJRX8t0wJ7p75saKNPiG7qlErK2LNPjEXm/kLJ1lY9T5c6b5zu+Tt
         zIB5Us3aFtpoFzv/P55KAcPHWnKJNu1W3Zd1AYP8FKZ3sbSd+j7dhtrbxqFEtFK6bZee
         BSmz/NzRpBBq6T6xpxESqsW+gzkY2EDr4r7QjPst4UyfZEpCavb8PPuicjBx1sLh3x8Q
         WcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SL+XKfrPcmFDGzMqXUP0Q3zOFZcervm0TfCcjIhWQCY=;
        b=wCI1c3TyI6egL076hmv3WPpTvUn1wFuQo6u/sj9Js9UKw+sCt+eY63yKq/Rxl78tgz
         vj7nEbnBKV59jSBkM9xT+LZWVc1hup/5VYwcQqn61kjtEJgQGYLQWGt7kxs09mmIN+jb
         OKDsMmzTfGxtFmXdoWYAy34yZioLbJZyzEfhSi+ih5Jmbn1O3Wy08eRBEq8wocIS48LH
         QIIfzMrjOSuNIZdLq9cXux4+Nl4c0JRL2ZBj72xeH825hKAJXDLSfKG6QSLG0x744uF2
         LlQP/gNjmjLqXCMYwGheJsAGm1eQ5q/Gy8xH1Y36GNuF0LkwgMjKb1dAI1nRHpTIaBeo
         PgeA==
X-Gm-Message-State: AJIora/ZeN8vWQXbqerN2fuvTI0skSfeZOKX31AyTFYr7h4IxgQ7MWiJ
        o5f183vcZFyM+IKaJLaVHlIodad4E/TKX8lSb6U+hw==
X-Google-Smtp-Source: AGRyM1t5GTQaSAsb8kPCZS4HSqUG7JLk/fClxGAAcjUAuLdTPHhQiaQrYoJ6yQe4/5dwsNo/UElIAkS80RoUUJqMXfY=
X-Received: by 2002:a25:2642:0:b0:664:c89e:b059 with SMTP id
 m63-20020a252642000000b00664c89eb059mr10714589ybm.369.1655300241180; Wed, 15
 Jun 2022 06:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220602073033.8385-1-ruc_gongyuanjun@163.com>
In-Reply-To: <20220602073033.8385-1-ruc_gongyuanjun@163.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jun 2022 15:37:09 +0200
Message-ID: <CACRpkdZXdeSUWbD3vyp9W9i-qMqZzFrwXcxoJRerbqTimKvZjw@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl/ar91: fix a memleak in at91_dt_node_to_map
To:     Yuanjun Gong <ruc_gongyuanjun@163.com>
Cc:     linux-gpio@vger.kernel.org
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

On Thu, Jun 2, 2022 at 9:31 AM Yuanjun Gong <ruc_gongyuanjun@163.com> wrote:

> A new_map is allocated in at91_dt_node_to_map but it is not
> freed in at91_dt_free_map, causing a memory leak.
>
> Fix it by using kcalloc to allocate new_map and free it in
> at91_dt_free_map
>
> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>

So why isn't devres refcounting working in this case?

Yours,
Linus Walleij
