Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1B02704F67
	for <lists+linux-gpio@lfdr.de>; Tue, 16 May 2023 15:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbjEPNfv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 May 2023 09:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233070AbjEPNfv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 May 2023 09:35:51 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1089410DA
        for <linux-gpio@vger.kernel.org>; Tue, 16 May 2023 06:35:50 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-55a20a56a01so243528557b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 May 2023 06:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684244149; x=1686836149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1yAAOloDNM7X0iqPZL9223AhWrL8SIh2nCxErMOL2w=;
        b=q3UJKqo3MBw4y1jWGgtncTa0nyxwIRafjaR57UdmvvJXYCe5uC27Q6y6H8u64nRjrR
         lmNvxzgE9FGjNnPUEAyHFjC8L3TvTOvvYDJxWwrlIALzzlreRxDvouIulSLua7pDzmvj
         HmCPc6vkal6BjaUgxKXv/YYm2oD+53V8IXfbhlNYvlqi7zeaVn+dPo72wKxvaPxNvwUp
         V9Mu2yoQS5BJZK6vxPcSe4gztq6hOWupyZ/moFEVd1FxHN5TjM0QqCHyuX4TfkaXkC2b
         09bcMri9IFaww/9VK6BO9cQH1WP93kCKSlME9g6N6WUaYIjJYdP7BwGjJJUU7sIQV8Uf
         swJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684244149; x=1686836149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1yAAOloDNM7X0iqPZL9223AhWrL8SIh2nCxErMOL2w=;
        b=ZordvWmZwb7FnHUl5p2KjoOKKpzwz+r5EcIlIg5kUZhboPjGDilj0eemWXFECnz7e/
         +kvb+/+HyToArTY44saQNt1Fdw8Icx7xvqQENybf/E4bql6oD6C3abl5fBXJ1heqOEfC
         mHs6RuBb/GSM5NacRvhVWzjJ0qR+FbH5tGnDMPi/j6eT8RU2Ezrf+CNdK3zJN/iXHZ+O
         k/VqtIwieR+vDfVC9PRdaLkLQ4O/S1R+Ff32aRXHFN3EREpPE0NvNUclexZqhuwHpAAw
         aLVpz5uulLYdOrL20+W9KLXjszIITIoyPKRNrR9Yf4OOEdtHUHGcgy45Wm1fb6dmsrnn
         zpCA==
X-Gm-Message-State: AC+VfDz0tdh7i8tw8a9F0FQ/ulrQA7H3XaGsPV/yi1PyR71jT9J5nkbe
        HyXlZECmo6xfg1jpAUqf8gd5Cyw67nYcmYIu8XMHDA==
X-Google-Smtp-Source: ACHHUZ4uHc9B+/Qvhk9soY/Pz4CS9+qWx3ZmruZUsWf9Gwv88ZJ9L3AXfS9fMw3ZH3rfangkqNcoojQNltq36qBuOA0=
X-Received: by 2002:a0d:db93:0:b0:55a:2fbb:4790 with SMTP id
 d141-20020a0ddb93000000b0055a2fbb4790mr32697225ywe.12.1684244149273; Tue, 16
 May 2023 06:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230515174026.494496-1-afd@ti.com>
In-Reply-To: <20230515174026.494496-1-afd@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 May 2023 15:35:38 +0200
Message-ID: <CACRpkdbb3jub08rPGaX0orY9tRf738ba029Qw5aVT-HyNLz2SQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: twl4030: Use devm_gpiochip_add_data() to
 simplify remove path
To:     Andrew Davis <afd@ti.com>
Cc:     Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 15, 2023 at 7:40=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:

> Use devm version of gpiochip add function to handle removal for us.
>
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
