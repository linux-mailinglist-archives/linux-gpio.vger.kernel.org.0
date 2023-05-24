Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 518F070ECCE
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 07:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239088AbjEXFBf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 01:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjEXFBe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 01:01:34 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146A013E
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 22:01:31 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f6127a476bso3124855e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 22:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684904489; x=1687496489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=efBp8CVo6Amn5nNkyj2qNsRPsoXYkVk1hMpizP8xT7Y=;
        b=yE1muD8cBG1JDfPJCHzFNl1df/LLcmHdJPqrG4Zl8XxefqqUtlWAwGMyWdfV7P3SHS
         0bN83TWm+jWk+3DIbrabHaYyyhFHXHZMv3KNeRN8crxWrOJrmP+s8+swGdZ3ik/gzFub
         gv/9TzqE9JW/i1buyDZPPkv+z7ER7/4oULefWjPU2ROlejVP+fK/k8sqATQNICh/D4w0
         9Qv1CzMgoAePYGpF47h/Qw21QrjD8fhv7aaDw4tAXtmKJpyxJx8ml6ZgOKpGevC9EY+v
         16PUurS05qOB/WoF6yJSfLaGUpT6ljzWAqsBJQMyGqbsa4AggbCVwaWudStNejMx8w6A
         n97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684904489; x=1687496489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=efBp8CVo6Amn5nNkyj2qNsRPsoXYkVk1hMpizP8xT7Y=;
        b=MhTIKElwoFM8WIi8mOSGOZLmrXHeK90UlDtkX6WE+2beTbXO+x04tn64notrVzMjeX
         9IlHJWWZuYrJjKTt9MSEOWOg4IXft0cisky4T9JpTMd8ZEIkOlgOhva8eKqjc2mkzoqs
         3pEX79mIt4ce3webJZ+TVlf36sKpJ5HMpDimbo3k6C5mYxSdSK35sX/Prqfi85lEIoA7
         qF8GsyCnB1vS9grzCCa1Gdn2vo0UOX0JDhtbeB0z91UDO5hMjDXc0o4LcGXWxVRMmZKT
         ulfUeo1iztBhdAdyismXTe3PkCMRaKtX+QihhRgWozlvw3stu7Yv6iW7SHOcvYT6udvh
         QJRw==
X-Gm-Message-State: AC+VfDzLAecJekT8PL+QMw0/nYX4KsUccEMvt9veEmP01SAzBz0Gd168
        /tNdLueNIF3xhB3SoR19Z1q75l4XgtSUIZaXsD0=
X-Google-Smtp-Source: ACHHUZ6oTbo+0Ru+tH6WujmB0MIkdeKqLBnhLAq34Ojbe0/ZG3zSi9deu/+bKpDaDxkAkHdcGfuYog==
X-Received: by 2002:a7b:cb0d:0:b0:3f6:a16:4010 with SMTP id u13-20020a7bcb0d000000b003f60a164010mr3419021wmj.1.1684904489455;
        Tue, 23 May 2023 22:01:29 -0700 (PDT)
Received: from [192.168.1.149] (i5C7404E8.versanet.de. [92.116.4.232])
        by smtp.gmail.com with ESMTPSA id f8-20020a7bcd08000000b003f17848673fsm893847wmj.27.2023.05.23.22.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 22:01:29 -0700 (PDT)
Message-ID: <880592b3-a83d-00d5-e980-fc4758797cf1@linaro.org>
Date:   Wed, 24 May 2023 07:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH libgpiod RFC 3/3] bindings: rust: build against pkg-config
 info
Content-Language: en-US
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
 <20230522-crates-io-v1-3-42eeee775eb6@linaro.org>
From:   Erik Schilling <erik.schilling@linaro.org>
In-Reply-To: <20230522-crates-io-v1-3-42eeee775eb6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 5/23/23 13:25, Erik Schilling wrote:
> This change replaces building against "bundled" headers by always
> building agains system headers (while following standard conventions to
> allow users to specify the version to build against).
> 
> Reasoning:
> 
> Previously, the code generated the bindings based on the headers, but
> then links against `-lgpiod` without further specifying where that is
> coming from.
> 
> This results in some challenges and problems:
> 
> 1. Packaging a Rust crate with `cargo package` requires the folder
>     containing the Cargo.toml to be self-contained. Essentially, a tar
>     ball with all the sources of that folder is created. Building against
>     that tar ball fails, since the headers files passed to bindgen are
>     a relative path pointing outside of that folder.
> 
> 2. While, for example, the cxx bindings are built AND linked against
>     the build results, the packaging situation for C++ libraries is a
>     bit different compared to Rust libs. The C++ libs will likely get
>     built as part of the larger libgpiod build and published together
>     with the C variant.
> 
>     In Rust, the vast majority of people will want to build the glue-code
>     during the compilation of the applications that consume this lib.
> 
>     This may lead to inconsistencies between the bundled headers and the
>     libraries shipped by the user's distro. While ABI should hopefully
>     be forward-compatible within the same MAJOR number of the .so,
>     using too new headers will likely quickly lead to mismatches with
>     symbols defined in the lib.
> 
> 3. Trying to build the core lib as part of the Rust build quickly runs
>     into similar packaging issues as the existing solution. The source
>     code of the C lib would need to become part of some package
>     (often people opt to pull it in as a submodule under their -sys crate
>     or even create a separate -src package [1]). This clearly does not
>     work well with the current setup...
> 
> Since building against system libs is probably? what 90%+ of the people
> want, this change hopefully addresses the problems above. The
> system-deps dependency honors pkg-config conventions, but also allows
> users flexible ways to override the defaults [2]. Overall, this keeps
> things simple while still allowing maximum flexibility.
> 
> Since the pkg-config interface is just telling us which include paths to
> use, we switch back to a wrapper.h file that includes the real gpiod.h.
> 
> Once Rust bindings require a lower version floor, the version metadata
> can also be updated to help telling users that their system library is
> too old.
> 
> Drawback:
> 
> People hacking on the Rust bindings, need to either have a reasonably
> up-to-date system lib, previously install the lib to some folder and
> specify PKG_CONFIG_PATH or set the relevant SYSTEM_DEPS_* environment
> variables. Instructions for developers are documented in the README.
> 
> [1] https://github.com/alexcrichton/openssl-src-rs
> [2] https://docs.rs/system-deps/latest/system_deps/#overriding-build-flags
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
>   README                                | 13 +++++++++++-
>   bindings/rust/libgpiod-sys/Cargo.toml |  4 ++++
>   bindings/rust/libgpiod-sys/build.rs   | 40 +++++++++++++++++++++++------------
>   3 files changed, 42 insertions(+), 15 deletions(-)

Viresh told me on IRC that I forgot the wrapper.h:

diff --git a/bindings/rust/libgpiod-sys/wrapper.h 
b/bindings/rust/libgpiod-sys/wrapper.h
new file mode 100644
index 0000000..8a8bd41
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/wrapper.h
@@ -0,0 +1 @@
+#include <gpiod.h>
