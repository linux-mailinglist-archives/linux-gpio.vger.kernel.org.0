Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 153447B7E19
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 13:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbjJDLXK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 07:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232725AbjJDLXK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 07:23:10 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0878AA1
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 04:23:07 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-49d8dd34f7bso837401e0c.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 04:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696418586; x=1697023386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNSr4uUzvU4MNz4eGxkBb/9CRiRhSPfMWihy0N/efZ8=;
        b=oH7EgfHwAjnDqdPLiaUpxdBxwRRPZJaKZdwawlemVmdi0G4Wvd9tuz1IM5ASDi/vHN
         sD6rh6gZRMLsTA/N4KsPLAO7rzXCoEilVK6mqZRbdSvjdES1/+Bl9EzPS87d989ivC7x
         gwLU3KCCCGA/h0X8oCJE9WZPj+OJzgUC7XeYZy9TuXp6dzID2GcMP2Ceq7oCc2sSA8vR
         kpng6gUNrNPW6GXQ/t+bCRfus0xUHGMlx1ihfn/VcQCAbVlNNQpbD2ArwPVADwqnkPwN
         gMuK/dWTZzMYklDjnbRh0LQ2Y7sxOtTllxyKxVnzDTOjC3jT8aPTc6kBYr/eIZvDIm4T
         OkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696418586; x=1697023386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNSr4uUzvU4MNz4eGxkBb/9CRiRhSPfMWihy0N/efZ8=;
        b=vkhFjHsl9VTGk7HJLVUMeNuuB5YuU1P33bVOmaoekqrBp61yMSt/K4RbAdmQA9u3h/
         5L3NvWW0mkKCDZIM6QCvLAblBj1tetAnd9htKPO4AWQx0QmzxYN44r1+Y6PHDJ/1NpM4
         LLwi/eufrSrQcHhkAIJ3iRY2RvhRlS2nzlSMrPy+v2UjnX8uqCmFIzn6QkYyE0CuzPRB
         YPA/OUd5GodtIRuP+x+RrCs3AsT0+lYN2ubPDRJzSe5R9CuMcGuMytY4XoYCdVqPj1Ck
         gTqUCctkhyoGezaUmA/IBoD7gXrU1VOaHywqMgXyZ9PxENSAW/qv2FSGfk+GfsEYUPik
         99Jw==
X-Gm-Message-State: AOJu0Yx3tfOtunwpKChahRKDeff15bxtAABba4l28L5l8qYkp0bGu9/p
        H35AUv1yEoqoJ14Pwwn+lBg2a5ejyyjoXsbLI7ZV3Q==
X-Google-Smtp-Source: AGHT+IFNuRAWvozGCreo9YEJkH0hGscARxymF6CBcp+HpdviDDD5NmWP9cKJyQTerkEp/lb8yGaX9qRXfI7xx7DnaVU=
X-Received: by 2002:a05:6122:1790:b0:49a:c339:11b9 with SMTP id
 o16-20020a056122179000b0049ac33911b9mr2112713vkf.11.1696418586036; Wed, 04
 Oct 2023 04:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231003-rust-line-info-soundness-v3-0-555ba21b4632@linaro.org> <20231003-rust-line-info-soundness-v3-1-555ba21b4632@linaro.org>
In-Reply-To: <20231003-rust-line-info-soundness-v3-1-555ba21b4632@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Oct 2023 13:22:55 +0200
Message-ID: <CAMRc=MeNXei9oadz7kwzbB4Du2wdcGA+i6ojfRHPUVuc93Yy_g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3 1/3] bindings: rust: fix soundness of
 line_info modeling
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 3, 2023 at 11:40=E2=80=AFAM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> While attention was provided to prevent freeing in non-owned use-cases,
> the lifetime of these object was not properly modeled.
>
> The line_info from an event may only be used for as long as the event
> exists.
>
> This allowed us to write unsafe-free Rust code that causes a
> use-after-free:
>
>   let event =3D chip.read_info_event().unwrap();
>   let line_info =3D event.line_info().unwrap();
>   drop(event);
>   dbg!(line_info.name().unwrap());
>
> Which makes the AddressSanitizer scream:
>
>   =3D=3D90154=3D=3DERROR: AddressSanitizer: heap-use-after-free on addres=
s 0x50b000005dc4 at pc 0x55a4f883a009 bp 0x7f60ac8fbbc0 sp 0x7f60ac8fb388
>   READ of size 2 at 0x50b000005dc4 thread T2
>       [...]
>       #3 0x55a4f8c3d5f3 in libgpiod::line_info::Info::name::h5ba0bfd360ec=
b405 libgpiod/bindings/rust/libgpiod/src/line_info.rs:70:18
>         [...]
>
>   0x50b000005dc4 is located 4 bytes inside of 112-byte region [0x50b00000=
5dc0,0x50b000005e30)
>   freed by thread T2 here:
>       [...]
>       #1 0x7f60b07f7e31 in gpiod_info_event_free libgpiod/lib/info-event.=
c:61:2
>       [...]
>
>   previously allocated by thread T2 here:
>       #0 0x55a4f88b04be in malloc /rustc/llvm/src/llvm-project/compiler-r=
t/lib/asan/asan_malloc_linux.cpp:69:3
>       #1 0x7f60b07f8ff0 in gpiod_line_info_from_uapi libgpiod/lib/line-in=
fo.c:144:9
>
> The fix is to distinguish between the owned and non-owned variants and
> assigning lifetimes to non-owned variants.
>
> For modeling the non-owned type there are a couple of options. The ideal
> solution would be using extern_types [1]. But that is still unstable.
> Instead, we are defining a #[repr(transparent)] wrapper around the opaque
> gpiod_line_info struct and cast the pointer to a reference.
>
> This was recommended on the Rust Discord server as good practise.
> (Thanks to Kyuuhachi, shepmaster, pie_flavor and ilyvion! Also thanks to
> @epilys for a brainstorming on this on #linaro-virtualization IRC).
>
> Of course, determining the lifetimes and casting across the types
> requires some care. So this adds a couple of SAFETY comments that would
> probably also have helped the existing code.
>
> [1] https://github.com/rust-lang/rfcs/blob/master/text/1861-extern-types.=
md
>
> Fixes: 91f9373 ("bindings: rust: Add libgpiod crate")
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---

Applied, thanks!

Bart
