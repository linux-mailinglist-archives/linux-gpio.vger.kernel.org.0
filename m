Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D821272CED6
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 20:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237397AbjFLS61 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 14:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236888AbjFLS6Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 14:58:25 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9016F11B
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 11:58:21 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-7870821d9a1so120574241.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 11:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686596300; x=1689188300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdQsPEv+w7G5ZisB7HtQdHauL9jfw1bgHjHj9mlXIwc=;
        b=vLnDYWRzk8fV45xgoNyeVo5EHen2Jmhzmk0Ur4MjdxNa6YY66GzeIpI7hW8HavNIg1
         K1edsaAcrQxHm7UAyOORg2Qi2aloK1kIEY8oNuV7P3DWb5HIiiMqAfGGsxE60zQDY14J
         PA7ZHCgkKunm0drchOIFerFBrXQTTy8tVtKwTnZZgXQafIfySvJqk5Q0O8oy9LcVmaDZ
         O3g1kl/iyUhUpw4tnLBSCXafktd8eq5jJx5Kt/vzl/TUNVNUNl2MtInsTHOy00FD9iOy
         GC0LRQc3w2pfebnG8F173IkM+4fHDRuuWz0aTptiOu6Ht4KIjZQH3qMOdR5h2RfEiyzQ
         h5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686596300; x=1689188300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdQsPEv+w7G5ZisB7HtQdHauL9jfw1bgHjHj9mlXIwc=;
        b=M4K+SQI1d6dQvSIgAyM93w6EfKuZDFo51Pm1tA3TFAyUX+egZKFOCgLCJFwduhW8YW
         Z02shPORCGCUu3+IFSslGtBOAPA0KvG/utbGVIXM1atJnX7gdasiLuuFMOoAiKtRaj1g
         4RSpjNTjI4CNzS6Gr9fE2fk6K/VL4mWm8h3horBLLKNRFa918921CTOsVvveFmfkAmaT
         1T55QdkB72y6nACfDLoN7hirWYGdKMHmcHHHUzPahIQ2bhyvDz9H5fXeKr6TmqRlum1M
         NfF618X57kger7q1FFEiDZXDuykGkr6mST31/H36V371n9q43q5ytPuIjUBAmAx2ZuxS
         hDAQ==
X-Gm-Message-State: AC+VfDzFBhGZsR+jhO1Yrq+3X6IPIzgwVfsOBnKWer9dcstJrLIaaiNn
        ylvaOqGoDJjbLpLnjt8Iii4GsTWd6yYNq/GwtJo2Tw==
X-Google-Smtp-Source: ACHHUZ5PVvXANSG/YY15RXC3Pvs+GVN/nBgeM5pagzu9/j2KNY1BZzEtdGXI4cPSJfXNAqy8kxF8nuHGoJIXkqltfcY=
X-Received: by 2002:a05:6102:c53:b0:434:8540:377 with SMTP id
 y19-20020a0561020c5300b0043485400377mr6044968vss.17.1686596300671; Mon, 12
 Jun 2023 11:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230612025642.11554-1-warthog618@gmail.com> <20230612025642.11554-4-warthog618@gmail.com>
In-Reply-To: <20230612025642.11554-4-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 12 Jun 2023 20:58:09 +0200
Message-ID: <CAMRc=MdypMBAoWNj6Q4A7y2j2619vceGf_EmnstZa3HMszZ6eA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 3/3] tools: tests: force bats to use tap output
 format to remove indirect dependency on ncurses
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

On Mon, Jun 12, 2023 at 4:57=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> bats has an implicit depencency on ncurses, as I found when trying to
> run the tests on a minimal install that lacked ncurses.
> Rather than make the dependency explicit, force the output formatting to
> use the TAP format which does not require ncurses.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  tools/gpio-tools-test | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/gpio-tools-test b/tools/gpio-tools-test
> index ed39ed5..441ec66 100755
> --- a/tools/gpio-tools-test
> +++ b/tools/gpio-tools-test
> @@ -54,4 +54,4 @@ modprobe gpio-sim || die "unable to load the gpio-sim m=
odule"
>  mountpoint /sys/kernel/config/ > /dev/null 2> /dev/null || \
>         die "configfs not mounted at /sys/kernel/config/"
>
> -exec $BATS_PATH $SOURCE_DIR/$BATS_SCRIPT ${1+"$@"}
> +exec $BATS_PATH -F tap $SOURCE_DIR/$BATS_SCRIPT ${1+"$@"}
> --
> 2.40.1
>

That's interesting. I will backport it as this affects the recipe in
meta-openembedded an every distro that wants to package it with
run-time dependencies satisfied.

Thanks. I applied all three patches.

Bart
