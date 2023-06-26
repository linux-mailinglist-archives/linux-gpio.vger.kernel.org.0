Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8EDD73E240
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jun 2023 16:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjFZOhL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jun 2023 10:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjFZOhL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jun 2023 10:37:11 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8369D
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 07:37:09 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-440b66adc81so964585137.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 07:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687790229; x=1690382229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAjtDfv9EBK6sYKtVMZC4HQ0lv/X80w5cp6eph8fC7o=;
        b=s6qkNLckJ5Ij2sLa1IkBgNZm0rn0OFyvsUVXiyneMAVNRcCdnGO/ZdNuHbeu5eAT9J
         A7BgV4F8WQbMjJY85YoLF8cA8uQWgY3EarViC73BK2RNHjsYyuwWg1MZ+SAF+zqJPzpJ
         YKM7uPglUiVqKvUhg0DLLz+ayM67GRgGqUAkTbboAqB5d8glebPzyauJ83X0FsBg1giJ
         jMDcAptWv+1A9Kh/2XR/6uekin/ddnwFfYSgDxVaRBDkB+9y1G8ANfK5/vHCjnl/EdcT
         Hn5/2JTN40tyLe1Z4SKkVZCrLomwqhWHHP5lRyi7XTBGn1DDZ1QWgt39z61bs6i48VeI
         F50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687790229; x=1690382229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAjtDfv9EBK6sYKtVMZC4HQ0lv/X80w5cp6eph8fC7o=;
        b=lRTYicEY27JN0TeCOYXka54NKnp7HEnRQRrNoy50fEqSMiKlkTDcv9bH1KMvvC7JGb
         RrmCWE/zBUGJdbZgaiiF0VfhcuUegqfzijPjS8Mc+MgdbG79XeulxxXgxzRcGLifbL6C
         EFfmjqlqZPgdr/twVDKVeYvLXCUcYs3VmnjD3K0JenSo5BvvXKhLEs55umeFC2aEOquo
         pI8z2ZGLTktqp0zkR4VOYF7cakY/VNUWEoWcJN6POTHxUhd77OB0W4iDKqJygQs1nxgW
         Rjn9w/GEQsW/mRKgmt4uHwnN9nQMRFcB+DuAT2JSRbkHVYASBlANRSwoBHfn8vleF45d
         zu9w==
X-Gm-Message-State: AC+VfDyLyAEIEduPYdtD834RQJ4ucjKX0xBHfcQyzxES3k20Vl7p8+yo
        PxXemwDiYVDaI49WPHa4LYofYIY9qO+O//YaZvhEpf8oubFIMykO
X-Google-Smtp-Source: ACHHUZ6cQ5xQXbTZZ1BO7xa4IQ4idFoQXBYmp/BiU25akKWtK41G95EB1jid0pwfUzMbpYGpiDKhxTkAyLJ9Ljw9SAg=
X-Received: by 2002:a05:6102:282a:b0:440:a79f:3b14 with SMTP id
 ba10-20020a056102282a00b00440a79f3b14mr11228707vsb.6.1687790228930; Mon, 26
 Jun 2023 07:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230626-datarace-v1-1-b78e2abb493b@linaro.org>
In-Reply-To: <20230626-datarace-v1-1-b78e2abb493b@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 26 Jun 2023 16:36:58 +0200
Message-ID: <CAMRc=Mcn9N2+nQKCW6_Yu_urHuTtEcGzdeJyRbTa9YYTFKx_gQ@mail.gmail.com>
Subject: Re: [PATCH libgpiod] gpiosim: fix data race that corrupts heap
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Mon, Jun 26, 2023 at 3:15=E2=80=AFPM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> Hit this while seeing some heap corruptions when running cargo test on
> the Rust bindings.
>
> Took a bit to track down since I first used address sanitizers, but with
> the thread sanitizer it becomes obvious immediately (output simplified):
>
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     WARNING: ThreadSanitizer: data race (pid=3D288119)
>       Write of size 8 at 0x0000018f1e78 by thread T6:
>         #0 id_free /libgpiod/tests/gpiosim/gpiosim.c:141:17
>         #1 dev_release /libgpiod/tests/gpiosim/gpiosim.c:600:2
>         #2 refcount_dec /libgpiod/tests/gpiosim/gpiosim.c:176:3
>         #3 gpiosim_dev_unref /libgpiod/tests/gpiosim/gpiosim.c:671:2
>         #4 bank_release /libgpiod/tests/gpiosim/gpiosim.c:873:2
>         #5 refcount_dec /libgpiod/tests/gpiosim/gpiosim.c:176:3
>         #6 gpiosim_bank_unref /libgpiod/tests/gpiosim/gpiosim.c:941:2
>         [...]
>
>       Previous write of size 8 at 0x0000018f1e78 by thread T1:
>         #0 id_free /libgpiod/tests/gpiosim/gpiosim.c:141:17
>         #1 bank_release /libgpiod/tests/gpiosim/gpiosim.c:878:2
>         #2 refcount_dec /libgpiod/tests/gpiosim/gpiosim.c:176:3
>         #3 gpiosim_bank_unref /libgpiod/tests/gpiosim/gpiosim.c:941:2
>         [...]
>
>       Location is global 'id_del_ctx' of size 16 at 0x0000018f1e70
>
>       Thread T6 'chip::verify::f' (tid=3D288126, running) created by main=
 thread at:
>         #7 test::run_tests::hd53a07a011bd771f /.rustup/toolchains/nightly=
-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/test/src/lib.rs:407:=
21
>         [...]
>
>       Thread T1 'chip::open::gpi' (tid=3D288121, finished) created by mai=
n thread at:
>         #7 test::run_tests::hd53a07a011bd771f /.rustup/toolchains/nightly=
-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/test/src/lib.rs:407:=
21
>         [...]
>
>     SUMMARY: ThreadSanitizer: data race /libgpiod/tests/gpiosim/gpiosim.c=
:141:17 in id_free
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> This eventually can either lead to leaks or double free's that corrupt
> the heap and lead to crashes.
>
> The issue got introduced when a previously local variable that did not
> require protection was turned into a global variable.
>
> Fixes: 5e111df2fca56d57193a1825e45e78dd8b76c0f1
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  tests/gpiosim/gpiosim.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
> index b49a61a..fca6b7f 100644
> --- a/tests/gpiosim/gpiosim.c
> +++ b/tests/gpiosim/gpiosim.c
> @@ -137,11 +137,11 @@ static int id_alloc(void)
>
>  static void id_free(int id)
>  {
> +       pthread_mutex_lock(&id_lock);
> +
>         id_del_ctx.id =3D id;
>         id_del_ctx.idp =3D NULL;
>
> -       pthread_mutex_lock(&id_lock);
> -
>         twalk(id_root, id_del);
>         if (id_del_ctx.idp) {
>                 tdelete(id_del_ctx.idp, &id_root, id_compare);
>
> ---
> base-commit: d04639ddd11ed7d02c630e693bf07d97f53e17d3
> change-id: 20230626-datarace-e62e9bcfa3ee
>
> Best regards,
> --
> Erik Schilling <erik.schilling@linaro.org>
>

Nice catch, thanks! I applied it and just changed the Fixes tag to
conform to the kernel style.

I actually saw some issues when running rust tests some time ago but
couldn't reproduce reliably, I suspect this was it.

Bart
