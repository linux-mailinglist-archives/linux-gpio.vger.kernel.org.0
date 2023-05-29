Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2EEB7149DE
	for <lists+linux-gpio@lfdr.de>; Mon, 29 May 2023 15:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjE2NIX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 May 2023 09:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjE2NIW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2023 09:08:22 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ABB9DC
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2023 06:08:20 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-566586b180fso14874577b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2023 06:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685365700; x=1687957700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcfiTZPtP7etMoAj5rhVwzR0pkqULNXNoi7SCQr5KE0=;
        b=wL2X1XUedYKAd4rGQNtr4By8DJg85sKNz9BG6Cldss3B4Tp724vYkNEZrTf+qnq0hk
         NdcIgHYJVqFt7R1aaBgIayRJHQqi4oKZ5h0zbye6JScY08ldwvEGCjggyFbuf5ZeCBwu
         4CGRTWVsAio16mWesayxZY2ShBn2v+o1MV6VlyLywRjIFG6o3UJGRX1YM8O3WXZfK5lc
         ZzsUwerwdbFuVQbgwkfXlMf8ldoKlAHk6NZRvjpYmSZGkvK+auNMPWd4SvxaWTPE3RTz
         2/ZwDpPtWEHGPl7A1XotbNRDgCl8iFazVLurtvZcCAljGAt6yGNSvWmclMVSZkYuS7xt
         /NeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685365700; x=1687957700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcfiTZPtP7etMoAj5rhVwzR0pkqULNXNoi7SCQr5KE0=;
        b=KbLdoYcW6Iac0qpF/majSTOpeBdpSgxNRXkwP2QsZJDRlNBXojCzsRwUQJQeuU6UgR
         I84wWi0TCQDKoRkYlMZRkaJSRJxxg8G/VgcTfKvxJDzw46FoTWjniHEd/TqdqEuasDpa
         rrCRAKBx43QN3v2CC3VIOG195cvbTrs8WatDG7mGa8/GWbxOp9h3xoU/I+8OiGygYG6G
         afx1dS9HWwlHBMj7TmjaIeOKlb9Aelmsf7VUTokl7zn4uTLsHncSyqT+R1B3RVGzxZry
         DTDeayKNSfNG/EGxwrzh/8SkuMkRDNLNVVDFhDJiZldAMwxVxx8J6KiqgErPoEdfJ8yh
         LYbQ==
X-Gm-Message-State: AC+VfDz1faFtOhgNxkRUOpFYhsCjTNJ4bnzV1dK7zwTq9qRkuHjd97i/
        UEY6x79IosvvaIdlI90e9quqYLdIzmmTaYLEwebeCA==
X-Google-Smtp-Source: ACHHUZ6iJl12DOewm365BK23X0xc3YAPULN7ZD2nNthz7A31iNZGRaRnKXpLRXbV9PE7NYBop5T+OPIXZSisxhdUeiQ=
X-Received: by 2002:a0d:eac8:0:b0:565:9ff5:5be9 with SMTP id
 t191-20020a0deac8000000b005659ff55be9mr11317320ywe.0.1685365699613; Mon, 29
 May 2023 06:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230519170716.3459-1-sensor1010@163.com>
In-Reply-To: <20230519170716.3459-1-sensor1010@163.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 May 2023 15:08:08 +0200
Message-ID: <CACRpkdam7DgxNp19MY7KY+JTV6ENVYhz90xBkDPrfLLNtGhNWQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/pinctrl.c : Remove redundant clearing of IRQ_TYPE_SENSE_MASK
To:     Lizhe <sensor1010@163.com>
Cc:     lars.povlsen@microchip.com, Steen.Hegelund@microchip.com,
        daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 19, 2023 at 7:08=E2=80=AFPM Lizhe <sensor1010@163.com> wrote:

> Before executing microchip_sgpio_irq_set_type(),
> type has already been cleared IRQ_TYPE_SENSE_MASK, see __irq_set_trigger(=
).
>
> Signed-off-by: Lizhe <sensor1010@163.com>

Looks correct to me so patch applied.

Yours,
Linus Walleij
