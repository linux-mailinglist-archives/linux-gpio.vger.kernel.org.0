Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A61C26DCD4E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 00:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjDJWNf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Apr 2023 18:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjDJWNe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Apr 2023 18:13:34 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F541BCF
        for <linux-gpio@vger.kernel.org>; Mon, 10 Apr 2023 15:13:32 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id f188so37924533ybb.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Apr 2023 15:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681164811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emJXX1tWaFzEtlDfswfF2P0R3+dXu3v3TR+PG0ckaR4=;
        b=irEsiTCQL1z/ZrlkuvbYltSjPuSv0cEn9s/tlAidxlxHKhdtR4MI3gJMHThyvFiMzZ
         10J23MWpxEiOaeFUhoXhBBTFGWdlHjJnHCoEhTsCzvsFo9jQY4VtNQjXTCgJLZJHsiEa
         Mc/J9E5ww8HLWCPZRlfpgHg/Xx62Bu2pf95vsQ/L71ia60anP+xdO3SpHoD1tPDp8xoy
         Vz4nxNFLGMeaQkaasO4wgQS1qtJcb5bm+fs5/fzMAvArvD6EGPA4vA2LU9p0AfsJbPC0
         QlLg7NOkcXfDPq7LZFHMLhcN4PE9gz72uTrOiM+hKd4RL1JHEXonVmmR7y6g5Pf4i3MT
         1geA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681164811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emJXX1tWaFzEtlDfswfF2P0R3+dXu3v3TR+PG0ckaR4=;
        b=tT5GoseJKQJNECbePlz1ppt0cdiLZPggC+QwBe1+jIz7JWR58Ps3eQcsYjwqozOt6X
         O1gS9dkLJcq/QCsaCvvKwO75PiqDwwDkSKiwDIt+VTPd1BDr9XSFGX3rc6nETCd7aXp3
         y29GzfVSLoogGgqvTOrPC1Leju1p25/Ty+xhjf75kfsdIdxJHoEoUmOdW19SJvXaRUPI
         N6N5yvqeiVTzVUXSzi14zT97n/17xvcZgUz1O5H3XGjhWsaViEbQRQCR8fsEdriwixLm
         /tXhJgWxiRI/kjAsztao6b7l1MuT3o1xsDlIW/7KgXvwf4FZqTZQ8VGCcg4e3aIlhPOL
         FxIQ==
X-Gm-Message-State: AAQBX9dqnHTXaUHlJzEHKliV33iqyOGXsPf6AWBKq195SiytrdxEjKiJ
        utF+Kw45snaU5R51JShrhLkdt+M5dJoVOPmTECpC4w==
X-Google-Smtp-Source: AKy350adMvcP5fh7YH7iAuPRCjpj2UN11sndlgPZfxBGcCytrueCQltV4rvwNVQ3w6r9LjMg4xdfJQOwja237vL9p2Q=
X-Received: by 2002:a25:cac5:0:b0:b8e:d126:c64 with SMTP id
 a188-20020a25cac5000000b00b8ed1260c64mr187298ybg.4.1681164811332; Mon, 10 Apr
 2023 15:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680708357.git.william.gray@linaro.org>
In-Reply-To: <cover.1680708357.git.william.gray@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 11 Apr 2023 00:13:20 +0200
Message-ID: <CACRpkdZA7BUv0EeGjjEQ=Xk=WiDUSeTm4pgpxknN9qzNgc+19w@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Migrate the PCIe-IDIO-24 and WS16C48 GPIO drivers
 to the regmap API
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>, techsupport@winsystems.com,
        pdemetrotion@winsystems.com, quarium@gmail.com,
        jhentges@accesio.com, jay.dolan@accesio.com
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

On Wed, Apr 5, 2023 at 5:45=E2=80=AFPM William Breathitt Gray
<william.gray@linaro.org> wrote:

> Changes in v6:

Excellent and persevere work,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
