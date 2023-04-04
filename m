Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E72456D64CA
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Apr 2023 16:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235522AbjDDOJf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Apr 2023 10:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235558AbjDDOJb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Apr 2023 10:09:31 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D69352D79
        for <linux-gpio@vger.kernel.org>; Tue,  4 Apr 2023 07:09:29 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5456249756bso615635107b3.5
        for <linux-gpio@vger.kernel.org>; Tue, 04 Apr 2023 07:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680617369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnWzTfCBouLvNFIttgdZiBeapl1jQzHQOa2b0uZW+Yw=;
        b=KMcOqCDLEz4aCPi34/DOPsImPsfw5ZeY0wTsPwjTfIBU/l8v/gfv0G0ZJWuJFgp33K
         CnCFkpUWUid4/EqWu0KpzJp+ofxgiC3yfhwMGkRWrKSwHMCo8Sht4RuLq2QKsImi27po
         bmLfnmR3tU2a8TrgFXHh0jEVeqHtp8jzeFZ8KjQJnFuZGaet0e3zNlqXcLLyGlug3HfB
         5kXM58LW/rqMa+R3QQrJyvjcdlZe21cOub/Rgop8wFGNfXn5lj83IxKTtH42SwuzKLPk
         mKljKuqg7i64XLV7v0JJ31P/xzsGAWbjF+KGl3neksq1QdFpll7etMjjVsEXE1Yd44zg
         gy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680617369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnWzTfCBouLvNFIttgdZiBeapl1jQzHQOa2b0uZW+Yw=;
        b=J0WPXyswA748fiAowqkmpKKIqL67+BmgnDXACPy38GWhfdGS9tkJGuMxKktTdu5G/s
         aZG46zjvXyAY0K0E5WeTdocjLMX+G57Q+8qUxh6AfENodVyQEwAn+fJmRLTJ/l5NWyX5
         QuTVKS0BCtE1eQIr+Ue99sJf0nqGluN0WrxbR9l5+TCndQ/7tK1FQJ7rR/9bIS9Pjkwb
         qH/j4M6kaWvSJqtj2XGPkuy8W3rBPkFYzExqjm+OyXf1zEEGbDxFRnEPGmAwuatiJzGd
         hQkkVvqNoLqOBAiiCDxMmLfdMD8/xDzuet+D9yY6fNXXSZ0Jx4su2d+WFiKnRJZtkbg6
         ydqA==
X-Gm-Message-State: AAQBX9f4lEIJuBvbAhzjOB+/zY3OWQAkkW1tFc3GPdP9Zr+0RHJRrOVa
        NwTUpKBJfumqAfO2PgTTSNzuvwZ5lFVlIiNUaaVOYg==
X-Google-Smtp-Source: AKy350bjb0MQOtgKMwAdbyWuoYyDolSgx0NlXbHfkdfgHkYhgyRMawgx1pSPNraaVqhXKvD+86RrDJqLZvi3m6+Ja20=
X-Received: by 2002:a81:a88a:0:b0:549:17fe:17c5 with SMTP id
 f132-20020a81a88a000000b0054917fe17c5mr1525744ywh.9.1680617368899; Tue, 04
 Apr 2023 07:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230404004501.1913144-1-trix@redhat.com>
In-Reply-To: <20230404004501.1913144-1-trix@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Apr 2023 16:09:17 +0200
Message-ID: <CACRpkdZh_+TfGZVpj57Y91KXuw=c8xNV1zfONMxYsKuTZKjxVA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mlxbf3: set varaiable mlxbf3_pmx_funcs
 storage-class-specifier to static
To:     Tom Rix <trix@redhat.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Apr 4, 2023 at 2:45=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:

> smatch reports
> drivers/pinctrl/pinctrl-mlxbf3.c:162:20: warning: symbol
>   'mlxbf3_pmx_funcs' was not declared. Should it be static?
>
> This variable is only used in one file so it should be static.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Obviously correct so patch applied.

Yours,
Linus Walleij
