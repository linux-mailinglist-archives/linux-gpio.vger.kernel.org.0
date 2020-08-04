Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2D0D23C03F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Aug 2020 21:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgHDTng (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Aug 2020 15:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbgHDTnf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2020 15:43:35 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11DCDC06174A
        for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2020 12:43:35 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id v22so25978840qtq.8
        for <linux-gpio@vger.kernel.org>; Tue, 04 Aug 2020 12:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dSlSO2Zd9jkm/qIiBUSX2pIA2UBSkdUFM49R5g/2fa4=;
        b=CwKotEeFTnw1upnSHoKsi58txKyhF+rlF0h+eBu8/NituD1yNVhftmi4SR920UYDbC
         KJAgfxS5HRaUsfa1d34Ako9v8rtlOtEJl6Uv0x3ad83vS9v7+zwKXit+3jTL7J4duQ2G
         xjJBKjC3ygeHZ2ice7rStZ93Og4+zZ0aZ5y5pozO6ElaO9FcV2OH+4geH1Y1IuUj3hNi
         nJY/nSk7PtZQ4Aky5znOBvUpnnIKuGjpV/hI5oYRfuza+Ij1fx9ZVz4V0MtSIj6K4sEK
         d38vT+shF+dwY0CSpULHY0lSvbbH/PPrwVDUsaOOrtr8luAYLCQKqhQyFEKVW1phBiBP
         TprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dSlSO2Zd9jkm/qIiBUSX2pIA2UBSkdUFM49R5g/2fa4=;
        b=qVii8f1zGxAn4SIwYkCyPIkPtVABgCl0SETOff9Cz2uHxZx9vML2gsXzo6CfnktkK2
         yr6uIPPvzdAwWdah4RoJacNu1MVJ/XwPjK/JAlGL0jw4Nyk6bBR2AIYwcCZINpiP+aWA
         j6ymyLE0e/ECLZVwl+tNK4YcSLvhjtp6Q4RRVMHqb80xVpjEgV9YHX5DvsgoOZ1DMQoT
         d59AKxxHJ6JSakyVr0PcnDgL4xnw6MIgKGoG/4A1gRMhyw+QexJwZvEaqj2ebDFM4siH
         5QPt/XZ7uXSbxpW8mh9YvFvEK0hmahOJEBMX4PTPGQNGVPc3IyUs0k9N3SsPscqhA4UN
         Twlw==
X-Gm-Message-State: AOAM530mDGRQh0aWBdPk+ePN3a5o51sPl/1T6QMhn4E5u2Fe5c3l5FQj
        +woHMXLWwA6MdWbMAR8paT+ZEaHevkK4d/gF9ac/NA==
X-Google-Smtp-Source: ABdhPJxVqXW3ZVO66KO5J3TnDbxKqwRHMNOEAEk7QFIVPH7VkPHUXzlIy2UvpTCm5rAnxEp/mDaP80nAnL+h67NDFrs=
X-Received: by 2002:ac8:4e39:: with SMTP id d25mr9122163qtw.208.1596570214100;
 Tue, 04 Aug 2020 12:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200725041955.9985-1-warthog618@gmail.com> <20200725041955.9985-12-warthog618@gmail.com>
In-Reply-To: <20200725041955.9985-12-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 4 Aug 2020 21:43:23 +0200
Message-ID: <CAMpxmJX1z2=E4zao_pRR_Qkp8LFLixTk5V1uHH4q3=EA6rChug@mail.gmail.com>
Subject: Re: [PATCH v2 11/18] gpio: uapi: document uAPI v1 as deprecated
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 25, 2020 at 6:22 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Update uAPI documentation to deprecate v1 structs and ioctls.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  include/uapi/linux/gpio.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index 3f6db33014f0..92a74c245534 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -278,6 +278,9 @@ struct gpioline_event {
>
>  /*
>   *  ABI v1
> + *
> + * This version of the ABI is deprecated and will be removed in the future.
> + * Use the latest version if the ABI, defined above, instead.

typo: of the ABI

>   */
>
>  /* Informational flags */
> @@ -301,6 +304,9 @@ struct gpioline_event {
>   * @consumer: a functional name for the consumer of this GPIO line as set by
>   * whatever is using it, will be empty if there is no current user but may
>   * also be empty if the consumer doesn't set this up
> + *
> + * This struct part of ABI v1 and is deprecated.

"This struct is part of ABI (...)"

> + * Use struct gpioline_info_v2 instead.
>   */
>  struct gpioline_info {
>         __u32 line_offset;
> @@ -325,6 +331,9 @@ struct gpioline_info {
>   * guarantee there are no implicit holes between it and subsequent members.
>   * The 20-byte padding at the end makes sure we don't add any implicit padding
>   * at the end of the structure on 64-bit architectures.
> + *
> + * This struct part of ABI v1 and is deprecated.

Same as above and same below.

Bart

> + * Use struct gpioline_info_changed_v2 instead.
>   */
>  struct gpioline_info_changed {
>         struct gpioline_info info;
> @@ -364,6 +373,9 @@ struct gpioline_info_changed {
>   * @fd: if successful this field will contain a valid anonymous file handle
>   * after a GPIO_GET_LINEHANDLE_IOCTL operation, zero or negative value
>   * means error
> + *
> + * This struct part of ABI v1 and is deprecated.
> + * Use struct gpioline_request instead.
>   */
>  struct gpiohandle_request {
>         __u32 lineoffsets[GPIOHANDLES_MAX];
> @@ -383,6 +395,9 @@ struct gpiohandle_request {
>   * this specifies the default output value, should be 0 (low) or
>   * 1 (high), anything else than 0 or 1 will be interpreted as 1 (high)
>   * @padding: reserved for future use and should be zero filled
> + *
> + * This struct part of ABI v1 and is deprecated.
> + * Use struct gpioline_config instead.
>   */
>  struct gpiohandle_config {
>         __u32 flags;
> @@ -395,6 +410,9 @@ struct gpiohandle_config {
>   * @values: when getting the state of lines this contains the current
>   * state of a line, when setting the state of lines these should contain
>   * the desired target state
> + *
> + * This struct part of ABI v1 and is deprecated.
> + * Use struct gpioline_values instead.
>   */
>  struct gpiohandle_data {
>         __u8 values[GPIOHANDLES_MAX];
> @@ -418,6 +436,9 @@ struct gpiohandle_data {
>   * @fd: if successful this field will contain a valid anonymous file handle
>   * after a GPIO_GET_LINEEVENT_IOCTL operation, zero or negative value
>   * means error
> + *
> + * This struct part of ABI v1 and is deprecated.
> + * Use struct gpioline_request instead.
>   */
>  struct gpioevent_request {
>         __u32 lineoffset;
> @@ -437,6 +458,9 @@ struct gpioevent_request {
>   * struct gpioevent_data - The actual event being pushed to userspace
>   * @timestamp: best estimate of time of event occurrence, in nanoseconds
>   * @id: event identifier
> + *
> + * This struct part of ABI v1 and is deprecated.
> + * Use struct gpioline_event instead.
>   */
>  struct gpioevent_data {
>         __u64 timestamp;
> @@ -461,6 +485,8 @@ struct gpioevent_data {
>
>  /*
>   * v1 ioctl()s
> + *
> + * These ioctl()s are deprecated.  Use the v2 equivalent instead.
>   */
>  #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
>  #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
> --
> 2.27.0
>
