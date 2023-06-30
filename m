Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 620E9743BC1
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 14:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232650AbjF3MQf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 08:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232342AbjF3MQe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 08:16:34 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A44130
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 05:16:33 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-7943bfaed0dso664055241.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 05:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688127392; x=1690719392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeMgCrpN/we7UPAHvpo0KkuimuBDi2UdATuMSMjbRmM=;
        b=g5Xfeuh70b0Y9URvUiEdoM+h7mi8zDc5+t5jsFU7+iuYvh20597wOpfoVSvEtAGcs5
         NUGi2c2BmEw6jIeAprzN+Ztx39Ct8cYeLC+Q25u0omO21xOm6jz51Kf7c8y9ELyJWIbw
         g2xC0tsLrXImwG56bdHtRlq7XOnBb06OLGS1rwNqxWRyd/zlrrJwfNyzeRqWSN1RKPUL
         iKYxOp0DRJ+lg6m5af8OlNJD3brHIouqEJY9k9Zob2zbXSBvA2TQ5VPsdMAOFqFOfIKE
         Bjj7or12Dbl3+kHH4Ix9UIkCGXy4TXThKYJIS2Y+ikm3U3HlCTsE+6J/5z5AmxNwqtAZ
         sDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688127392; x=1690719392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eeMgCrpN/we7UPAHvpo0KkuimuBDi2UdATuMSMjbRmM=;
        b=NtjtEL0XXfYDOqGTs2q7pQSqG2ztsQ1XL0C0Et+FE5+HblrW4s/iMonpDZ6zEpPeI9
         4b9T8SrzTIUv1Kd6JtRboC6lrSe7dho8HTCT8AbC+EExwOTCZvjiHDD9L3MaiPFCoVoo
         3Z/57Rwd8DVhvDJMhYGIT20dge70RiX2X5mZ5TzIvcZUOFJNjzQx7/FYwKIg8vmBitsB
         PBwAGQiYS5TpNYNRRLzLxhvaLQkRpKoQhyJG3s3SJXbLAnW3mJP3ISoBKQSdOOpNxAfL
         XibHZJeLwM9qCuH3dA7fQlI7d4A3HmgRfap4pQEfWE7iyFBxc6rKpKAR3Rg6AEk6E6OR
         nUow==
X-Gm-Message-State: ABy/qLa/06I3e3S1tzqaj1IubF47ar5qnSN1IpwzsTPznkRT3XOgmN3D
        4DkWpnyMwHiUTa60gy0FccwO35xc4FWZkO4ZEYj/l2jWD5LcGlkH
X-Google-Smtp-Source: APBJJlEe5DXUaOsEB31bR7xIEt07mxomx6me52BMLfSYyX3xAAiBhOhz+/QHLCrLtvyEhgk4anjZwDwfj18GiraurAY=
X-Received: by 2002:a67:f4cb:0:b0:443:8ca0:87a1 with SMTP id
 s11-20020a67f4cb000000b004438ca087a1mr1708999vsn.6.1688127392305; Fri, 30 Jun
 2023 05:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230630090858.37485-1-warthog618@gmail.com>
In-Reply-To: <20230630090858.37485-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 30 Jun 2023 14:16:21 +0200
Message-ID: <CAMRc=Mce6u+vUGPfGO73e8992X2m-ukfa633nmFX3dc95aQHzQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] core: examples: fix warning for u64 formatting
 on 32bit
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 30, 2023 at 11:09=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> The watch_line_info example prints the u64 timestamps using "%ld" which
> produces a warning for 32bit.  Replace it with PRIu64.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  examples/watch_line_info.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/examples/watch_line_info.c b/examples/watch_line_info.c
> index 1879a62..9df3121 100644
> --- a/examples/watch_line_info.c
> +++ b/examples/watch_line_info.c
> @@ -5,6 +5,7 @@
>
>  #include <errno.h>
>  #include <gpiod.h>
> +#include <inttypes.h>
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
> @@ -63,7 +64,7 @@ int main(void)
>
>                 info =3D gpiod_info_event_get_line_info(event);
>                 timestamp_ns =3D gpiod_info_event_get_timestamp_ns(event)=
;
> -               printf("line %3d: %-9s %ld.%ld\n",
> +               printf("line %3d: %-9s %" PRIu64 ".%" PRIu64 "\n",
>                        gpiod_line_info_get_offset(info), event_type(event=
),
>                        timestamp_ns / 1000000000, timestamp_ns % 10000000=
00);
>
> --
> 2.41.0
>

Applied, thanks!

Bart
