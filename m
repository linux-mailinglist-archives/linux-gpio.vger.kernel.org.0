Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAD5666B9DA
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 10:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbjAPJIA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 04:08:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232494AbjAPJHd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 04:07:33 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83EF91BE5
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 01:05:54 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id i185so28394647vsc.6
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 01:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JqCTaUX1A+/BBCo2/5PxG3P7Os7VnYxnxIU+5ELIX/Q=;
        b=fg00MI0Ob2qziqF88SxRah3V66hZ6TbZvxHmHjPV0RPWq8z0rK2PHZ5wHv95LPMjPl
         FlzqpkHtLspPiU70Mf/kLejbgbycc3YTmgAN2RK7BZRIJ7/kUJ8Pz/HI6bcTW5wE1Pjk
         tvGplfI1v0wkU4w8VUUnxl6x6sjGvOKqrSjLUG3SpbPLjm1Safeu6OAcdbqmujRcuVPJ
         l1TDqMCugBikx07hdYCEuIcztwyj5ucVV4ENQ78I4WvBnKRes71ii/H2WxL2sCfdR33t
         06lZfRO2JYx33yVftK6BpTXFv/aGF8sgGuOEF9E2UAuLq/31s103un/HTs5hBS+jk6QK
         x2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqCTaUX1A+/BBCo2/5PxG3P7Os7VnYxnxIU+5ELIX/Q=;
        b=abY6W2THOxbVuHY1lyM+qV1mPpogyhY+3HIkmWARxzmHwiUrVKVwIrO28h0ASrlIu5
         8OCj7UrsSHb/KWEYwsuDPs90HHc89hn/pmaT1l4xRqEYcDGYFyimt1VC7XVAqrHO6NwW
         YNmSdKL4t0Rxd4+0krRcO/qG/znbEma5njwEfsNlM0ur1nbAgPqzmTuXBf17qVlbBPnA
         hKOakspS80IkpAUVtIetU48tVupnEGZIpclVndgZN+ukoiyGuf3vpBGOaj/KjdaRI3Q2
         hfF/uQ5UI7DucwdjIQq/wlhBob/8Z4mRlfHLF9Qmz+o/WgZVPdAiFJgb8CSIDYFWAGW/
         i0lw==
X-Gm-Message-State: AFqh2kpNiInmQHbM96eNDhSd9qVagKY/oGOcgW1WnWN5dCL3lS/bLLEL
        arsXBivRli9p2Ti1l3LHJSz+F505jM3v5igO5w32rbXdZCZlIg==
X-Google-Smtp-Source: AMrXdXvayKXDpj7ksK/jrU75LF5kABCQRCIlZfZjutB4X13RTBlX+SO1kfvhNF75A2nnFDICmu7bvV1UB2Vs5qP5Opg=
X-Received: by 2002:a67:df09:0:b0:3ce:88b3:d7da with SMTP id
 s9-20020a67df09000000b003ce88b3d7damr8038589vsk.62.1673859953634; Mon, 16 Jan
 2023 01:05:53 -0800 (PST)
MIME-Version: 1.0
References: <20230116003606.11998-1-warthog618@gmail.com>
In-Reply-To: <20230116003606.11998-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Jan 2023 10:05:43 +0100
Message-ID: <CAMRc=MdHUV5vS5cWn+s-owEPFVCzoi8=hA0XF5V1cPPLcATx6Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: rust: fix documentation of
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

On Mon, Jan 16, 2023 at 1:36 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Replace "Get" with "Set".
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  bindings/rust/libgpiod/src/line_request.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
> index 2816cc1..35f07b3 100644
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
>          if values.len() != self.num_lines() {
>              return Err(Error::InvalidArguments);
> --
> 2.39.0
>

What commit is this patch's parent? It doesn't apply on top of master.

Bart
