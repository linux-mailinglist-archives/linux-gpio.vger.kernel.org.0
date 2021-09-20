Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFEDD411704
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Sep 2021 16:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240451AbhITObR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Sep 2021 10:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240448AbhITObQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Sep 2021 10:31:16 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D3EC061574
        for <linux-gpio@vger.kernel.org>; Mon, 20 Sep 2021 07:29:49 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id co2so15654085edb.8
        for <linux-gpio@vger.kernel.org>; Mon, 20 Sep 2021 07:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UjlbVJ4H822uyXqqkmVXF1+fUl0IXpYvHo7dMUQbKLY=;
        b=hs9wqU8YbEstsxMRNitvMKw2GBBg3YcUKk3NvzbDpHxw7QTgryqe8QMZ5F6qwXU4c9
         bz4XrTU04wSY8wz0p0IWoy3g0iyCGT5lHhDuB1geio29/v7qBV+EFGD4v6Fv7AbL0HWO
         9Yn5mEFVh5fflXmoV5lFXdiIC8Vl/AGZFsMMrkQDFbqsYHG98FPRNTOzVn8blETDT1QO
         bFXmLV0vFaqr0EhrrP5UtEDzZGeR/QmrWm52z9TaKBvysLYOsiLHasspGPJpcs49EpH8
         IDfU48apai4C2lcLB/+0c9BAKcYsf6NYEUi7Hbyn+xyebK4XhrLh8p8D+4A/3ZRODkYf
         Ak9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UjlbVJ4H822uyXqqkmVXF1+fUl0IXpYvHo7dMUQbKLY=;
        b=bTN4futn912rDcRkegCLzVn+9uURxUffIrO4sH9Kzj0L7vEf8TC/u2FpJHN8owxr7H
         h+fxGq3e88m1xLsAqaXwoLtGbyBlz0P6SASpZph7TzUhmstq9DKy0pDEZCZCSwPKmhBr
         OA2rx2mMSMgi0JdIaOOtJA9JQVyNb8DW8Ppetx2xtBW9RvguPg2hcc1nnynYciBr37q+
         3l5CLw3Lst2coy6EmvnoH8T5OgWRdCpuDpijurcaieban+inlw7uAr/nphY2CvQYioj8
         dsXl7vQHvdi9vIzGlht+uq3h08AVozE0IKzvgBJGVcdaza9QRiceA5Enlmq33k2GwnOV
         mJNw==
X-Gm-Message-State: AOAM533P3LXtss1DOtS9kBLyHGAI+kLBue3tElsAlFaW+3ByMIoqif5z
        +u2FBixv9QAXj2ruCJycnJFBXRbkXVRa/v3/1mjsrJFCLgI=
X-Google-Smtp-Source: ABdhPJytiIdccF6zl4zClq4X+0n3W9zE4mgvSw8uL/JiUMjbhxj1gbAIC90leV6HcH+JnzN3dp7AePCM/H3Sz4NrlfM=
X-Received: by 2002:a50:e0c3:: with SMTP id j3mr3847083edl.60.1632148143690;
 Mon, 20 Sep 2021 07:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210728234640.GD14442@cephalopod>
In-Reply-To: <20210728234640.GD14442@cephalopod>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 20 Sep 2021 16:28:53 +0200
Message-ID: <CAMRc=MeiWTBSx1S4Ez_pr-fJaq1NsyPE=Dp0uoyz--kDVzNjHw@mail.gmail.com>
Subject: Re: [PATCH libgpiod-v2] gpiomon: Add option to set debounce period
To:     Ben Hutchings <ben.hutchings@mind.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 29, 2021 at 1:46 AM Ben Hutchings <ben.hutchings@mind.be> wrote:
>
> With the v2 API it's now possible to enable debouncing of an input.
> Add an option to enable debouncing with a specific period.
>
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> ---
>  tools/gpiomon.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> index df86a46..074af6d 100644
> --- a/tools/gpiomon.c
> +++ b/tools/gpiomon.c
> @@ -22,6 +22,7 @@ static const struct option longopts[] = {
>         { "version",            no_argument,            NULL,   'v' },
>         { "active-low",         no_argument,            NULL,   'l' },
>         { "bias",               required_argument,      NULL,   'B' },
> +       { "debounce",           required_argument,      NULL,   'd' },
>         { "num-events",         required_argument,      NULL,   'n' },
>         { "silent",             no_argument,            NULL,   's' },
>         { "rising-edge",        no_argument,            NULL,   'r' },
> @@ -31,7 +32,7 @@ static const struct option longopts[] = {
>         { GETOPT_NULL_LONGOPT },
>  };
>
> -static const char *const shortopts = "+hvlB:n:srfbF:";
> +static const char *const shortopts = "+hvlB:d:n:srfbF:";
>
>  static void print_help(void)
>  {
> @@ -46,6 +47,7 @@ static void print_help(void)
>         printf("  -l, --active-low:\tset the line active state to low\n");
>         printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
>         printf("                set the line bias\n");
> +       printf("  -d, --debounce=PERIOD: enable debouncing with period in microseconds\n");
>         printf("  -n, --num-events=NUM:\texit after processing NUM events\n");
>         printf("  -s, --silent:\t\tdon't print event info\n");
>         printf("  -r, --rising-edge:\tonly process rising edge events\n");
> @@ -157,6 +159,7 @@ int main(int argc, char **argv)
>         unsigned int offsets[64], num_lines = 0, offset, events_wanted = 0,
>                      events_done = 0;
>         bool watch_rising = false, watch_falling = false, active_low = false;
> +       unsigned long debounce_period = 0;
>         struct gpiod_edge_event_buffer *event_buffer;
>         int optc, opti, ret, i, edge, bias = 0;
>         uint64_t timeout = 10 * 1000000000LLU;
> @@ -195,6 +198,11 @@ int main(int argc, char **argv)
>                 case 'B':
>                         bias = parse_bias(optarg);
>                         break;
> +               case 'd':
> +                       debounce_period = strtoul(optarg, &end, 10);
> +                       if (*end != '\0')
> +                               die("invalid number: %s", optarg);
> +                       break;
>                 case 'n':
>                         events_wanted = strtoul(optarg, &end, 10);
>                         if (*end != '\0')
> @@ -263,6 +271,8 @@ int main(int argc, char **argv)
>         if (active_low)
>                 gpiod_line_config_set_active_low(line_cfg);
>         gpiod_line_config_set_edge_detection(line_cfg, edge);
> +       if (debounce_period)
> +               gpiod_line_config_set_debounce_period(line_cfg, debounce_period);
>
>         req_cfg = gpiod_request_config_new();
>         if (!req_cfg)
> --
> 2.20.1

Queued for post libgpiod v2.

Bart
