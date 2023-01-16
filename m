Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1159F66C068
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 14:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbjAPN5u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 08:57:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbjAPN5d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 08:57:33 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DCB223C48
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 05:54:31 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id q125so17327142vsb.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 05:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IOeVAscnY79zooqT8J9GeuLJs7b3J/NcbOTq95mnde4=;
        b=8EGoqx8l+EVjI53U8DcwGDuZrzBLyTwgkk/swGVmHgs9i7X/VkR4SP9KjPwI4yVMGE
         zQy18XODzF+ls3JybFvV1iJDR6M4MaMEGtSKJkrSphkBkP+R1iTlsKg03ebJiBDdGbYM
         6FEOhaA6q0c4YCLQlU4tGh/nHemONGkgQBf7wUdgDj/kOcV4BH1mZ/24AJMJWe7QRjs1
         yzHIEDmXhMDuPq2MjMheMoPlrzjlt0/Sea9Jc1ne/5bHXtiVkdOdS+llwEiBZBGppofD
         LSglw7NpODnbkrmHZf1RQLtojyqDSzcLpmQi2zdSPjF07Gs6NGEi0wV5gvGUCEwcsNTQ
         FfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOeVAscnY79zooqT8J9GeuLJs7b3J/NcbOTq95mnde4=;
        b=FFFt1PcWsaSuozOIU0EQHkyp2rCETtx1F+Rl1YOZShW83Ysfro07gIlpuDcAs3orCx
         gag/IwSfNst2eszgKJZv/KlWZpgnF202pp0tJsGZM8cqk5BmKfmlJi3zCUuwE4XOHasj
         UEMbHn1Wg8Tfsrtz2eRf+Hko5XERB91fYzr4OrAtz736eM1o5dcAafqObNjwaP54xoCg
         mwH+CTgi/KKtOeZ97xADJ2xjdbEctoNt15t08+XmmhtPxiAV4mKz9VVQ79YskRNY/PFy
         NmKzg8UkAB/9vuOoGJE0TbHLOJjsqY1rupRx6cWnNGwJYhv/3POR0YVO7A8OH7QxL6o5
         IGAA==
X-Gm-Message-State: AFqh2kqLn0o/+rOUbLy9rfBYh3w4SdthPbGrQ12R1UauliquXA3UTq0f
        VIr4pF6T9pB/uOrb2wsXOH/MGGiJ7hxI1e6CRTc6iw==
X-Google-Smtp-Source: AMrXdXvfXhPMow/yfzjsa1/Q3bcNXh9UZPviH2+wMlDboS7zXU8tJhEWI4ozuyzxf6uPfjHmN/BAh/7JlH2Q6ILV8HQ=
X-Received: by 2002:a67:df8c:0:b0:3c5:1ac1:bf38 with SMTP id
 x12-20020a67df8c000000b003c51ac1bf38mr13191934vsk.78.1673877270357; Mon, 16
 Jan 2023 05:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20230116125144.36858-1-warthog618@gmail.com>
In-Reply-To: <20230116125144.36858-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Jan 2023 14:54:19 +0100
Message-ID: <CAMRc=Men+UifM8sfQ03TeUW2QGrRNPZ7ddHBqi=zU2J7Zi_m9A@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2] bindings: rust: fix documentation of
 line_request set_values
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 16, 2023 at 1:51 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> Replace "Get" with "Set".
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
> Changes v1 -> v2:
>  - rebase on current master
>
>  bindings/rust/libgpiod/src/line_request.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
> index c16ec9f..d9e041c 100644
> --- a/bindings/rust/libgpiod/src/line_request.rs
> +++ b/bindings/rust/libgpiod/src/line_request.rs
> @@ -106,7 +106,7 @@ impl Request {
>          }
>      }
>
> -    /// Get values of a subset of lines associated with the request.
> +    /// Set values of a subset of lines associated with the request.
>      pub fn set_values_subset(&self, map: ValueMap) -> Result<()> {
>          let mut offsets = Vec::new();
>          let mut values = Vec::new();
> @@ -136,7 +136,7 @@ impl Request {
>          }
>      }
>
> -    /// Get values of all lines associated with the request.
> +    /// Set values of all lines associated with the request.
>      pub fn set_values(&self, values: &[Value]) -> Result<()> {
>          if values.len() != self.num_lines() as usize {
>              return Err(Error::InvalidArguments);
> --
> 2.39.0
>

Applied, thanks!

Bartosz
