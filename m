Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 237BC411616
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Sep 2021 15:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234347AbhITNyV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Sep 2021 09:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233679AbhITNyU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Sep 2021 09:54:20 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B8FC061574
        for <linux-gpio@vger.kernel.org>; Mon, 20 Sep 2021 06:52:53 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id g8so61829930edt.7
        for <linux-gpio@vger.kernel.org>; Mon, 20 Sep 2021 06:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=obVRoftcDuhZYho01Pyjw8RFLVPn5ohhUmNKObu2Jrc=;
        b=AmbSH11TcK6t8VKvEiW1KxtlaiPigIO0Pmm0IDZ+zPCcxqgzQFL17DrbVwyWxMzSCa
         z5mgZUg9E+IGmAyFnIM56oefLS7KAF7WXoyeIIc5Hl7VZRVDHPn6IxuyYTLG0oiPV7s1
         n6sElmcCWvWb6J4rWZCnKxD27Wdzu37+PQV2HlV9ETa74rDUMvFP1DSAZdBd9NbY7P6A
         w9W30uT2oZAksy8Fx0YCIHTdiHSJ9vNNb+LmGp0vxPQAIed4GFfkbGSIRunKHWfwHO2l
         SBGOud2nEFHDzzUJC4DGq4xf7BtTgTWj8vsArIKuH+7+KvyeXdgoliK637+oaIyADeR7
         u57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=obVRoftcDuhZYho01Pyjw8RFLVPn5ohhUmNKObu2Jrc=;
        b=xGTmfrwU6RXsm1XwQ4bggD5bXr5mi9zLLuAN2XagV+mv7ntZpsv1ZSrktNxD4d5aR5
         wfSqsa92TcjGPCjEpLy7IGEL8Ez7BuLZnGmucMbllJQxNY/DYHIu6UZIzrTSjkpDcYkg
         DCPpp6oJHZ0Xqco5HGUAcXOCOv9uQHajTMxbX9K2VAYqTyoeGP9t3cIhS7F4426IMWKv
         jVub2zViFTX6aIq9R/R3RApv7WEZVLSeXfCA+HoOQWdNyadFG8SAhGxGR205Ttk0Nv94
         xPfVJlDWOQaJP89TpxfRU5d8ahQsF0lEBV5bQZNVrqhxNbu36qLBgboNnVPeTwTa8Tj9
         FxTg==
X-Gm-Message-State: AOAM531f56guRbQyTUDV+u1TUIIYuVovGmarBTUORRumBjJraBWMYXOV
        Y7ec78qa9ne7V6t5WsCt5QUfskF2O92NTS1Eh07P0J3YPtk=
X-Google-Smtp-Source: ABdhPJx4rns+7tZ6nBirC2bpuqFnz44QpOL5H9jNC3ZuV/RaPk8+MBkie9oaJ8jfxbwn4nh3fM09ZrGda8qiY6xyHew=
X-Received: by 2002:a17:906:9401:: with SMTP id q1mr28989865ejx.313.1632145947669;
 Mon, 20 Sep 2021 06:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210728234607.GC14442@cephalopod>
In-Reply-To: <20210728234607.GC14442@cephalopod>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 20 Sep 2021 15:52:17 +0200
Message-ID: <CAMRc=Me_UsY8b2wJx3CopJ2eX1Qb=fdSRqq_sRyR2vGXVULTbg@mail.gmail.com>
Subject: Re: [PATCH libgpiod-v2] gpioinfo: Show edge detection and debounce
 period if enabled
To:     Ben Hutchings <ben.hutchings@mind.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 29, 2021 at 1:46 AM Ben Hutchings <ben.hutchings@mind.be> wrote:
>
> gpioinfo shows most settings for each GPIO line, but currently misses
> edge detection and debouncing.
>
> * If edge detection is enabled, report it as an additional flag
> * If debouncing is enabled, report the duration
>
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> ---
>  tools/gpioinfo.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
> index cd2b9e4..ed0018c 100644
> --- a/tools/gpioinfo.c
> +++ b/tools/gpioinfo.c
> @@ -44,6 +44,21 @@ static bool line_drive_is_open_source(struct gpiod_line_info *info)
>         return gpiod_line_info_get_drive(info) == GPIOD_LINE_DRIVE_OPEN_SOURCE;
>  }
>
> +static bool edge_detection_is_rising(struct gpiod_line_info *info)
> +{
> +       return gpiod_line_info_get_edge_detection(info) == GPIOD_LINE_EDGE_RISING;
> +}
> +
> +static bool edge_detection_is_falling(struct gpiod_line_info *info)
> +{
> +       return gpiod_line_info_get_edge_detection(info) == GPIOD_LINE_EDGE_FALLING;
> +}
> +
> +static bool edge_detection_is_both(struct gpiod_line_info *info)
> +{
> +       return gpiod_line_info_get_edge_detection(info) == GPIOD_LINE_EDGE_BOTH;
> +}
> +
>  static const struct flag flags[] = {
>         {
>                 .name = "used",
> @@ -69,6 +84,18 @@ static const struct flag flags[] = {
>                 .name = "bias-disabled",
>                 .is_set = line_bias_is_disabled,
>         },
> +       {
> +               .name = "edge-rising",
> +               .is_set = edge_detection_is_rising,
> +       },
> +       {
> +               .name = "edge-failling",
> +               .is_set = edge_detection_is_falling,
> +       },
> +       {
> +               .name = "edge-both",
> +               .is_set = edge_detection_is_both,
> +       },
>  };
>
>  static const struct option longopts[] = {
> @@ -129,6 +156,7 @@ static void list_lines(struct gpiod_chip *chip)
>         const char *name, *consumer;
>         unsigned int i, offset;
>         int direction;
> +       unsigned long debounce_period;
>
>         printf("%s - %u lines:\n",
>                gpiod_chip_get_name(chip), gpiod_chip_get_num_lines(chip));
> @@ -142,6 +170,8 @@ static void list_lines(struct gpiod_chip *chip)
>                 consumer = gpiod_line_info_get_consumer(info);
>                 direction = gpiod_line_info_get_direction(info);
>                 active_low = gpiod_line_info_is_active_low(info);
> +               debounce_period = gpiod_line_info_is_debounced(info) ?
> +                       gpiod_line_info_get_debounce_period(info) : 0;
>
>                 of = false;
>
> @@ -166,6 +196,9 @@ static void list_lines(struct gpiod_chip *chip)
>                 prinfo(&of, 13, "%s ",
>                        active_low ? "active-low" : "active-high");
>
> +               if (debounce_period)
> +                       printf("debounce=%lu ", debounce_period);

You should use prinfo here for formatting. But it would be even better
if this became a flag - like the bias, drive etc settings and be shown
inside the [] brackets at the end of the line - something like:
"[pull-up, used, debounce-period=1000us]".

Bart

> +
>                 flag_printed = false;
>                 for (i = 0; i < ARRAY_SIZE(flags); i++) {
>                         if (flags[i].is_set(info)) {
> --
> 2.20.1
