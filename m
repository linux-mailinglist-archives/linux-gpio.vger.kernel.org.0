Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0587F728FC2
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 08:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237178AbjFIGSX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 02:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjFIGSV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 02:18:21 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B80330F7
        for <linux-gpio@vger.kernel.org>; Thu,  8 Jun 2023 23:18:15 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-53202149ae2so360981a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jun 2023 23:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686291495; x=1688883495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cPyPtX45IdhXHhvn2BMftDRQKfyNxiSGLtuQgSdjY4I=;
        b=F/Cueo03G9WNWdViURG3gr2Iuo1yzt/KCFKtZWQmIsrucJqt4YhpE3aKTlpPBuoKnQ
         GtrFDFPMC8zEwk9dXurYlwPMKBqIfN5U07fwSZzhujBV4GBZZzkHyzoeIKP77mEU5V7g
         OR1qxTuVUMp9d/wxO5zIDnu0x2NB/t7mabWJt0j9+17+Z8T9BJJlNunAYotV4FwUODvN
         ZCEO6C8vgNrw2x469ZzdI/75zhJ0jK58GUoXsXChHVU1bzLID/YJmDfciyC00Fc6Pp8G
         quK5OTdP1MONz89bk4PrwG3p/9E6knDIc5y4KtzO/lX+ceqZTpysnXFRC47BfkG0dR0a
         /cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686291495; x=1688883495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPyPtX45IdhXHhvn2BMftDRQKfyNxiSGLtuQgSdjY4I=;
        b=X3jK9VDEDW3gGgLNy/+BJJJSyD1FcmArSHcpejaGqmaFmZF2Er7Dm8D4CpTl6I5UMo
         699kV/foNS0FcrSQLJS9yT+VaAx5cWEsddIhfgCwyyXdmn4QCMu7FiyMGaeTJTYwtJKA
         f1B3jnopYNPrUtY9byvZWPn5koRlXKv9xVsqRdREaWsA5we4zPI7wf8Z0EWDHlVCvxJt
         a11Q/TsxwgpCAofhKUmFMyeRTmz+dXpE6IxMtXbq1IGMcxj3lsADFKHW/VZsw475EWUh
         VydkJUZGBzgFTQs2Vkg4cYAoA014fqBvx4z8Qzlh8HQQMSrPzHYtZUAjOwr6lBbTKfoj
         URMg==
X-Gm-Message-State: AC+VfDxRevEDM/gnXzvYryEAqXUbe7oK5ptuKWvBngsWFWhOoNaGgeb7
        tvWKz2iOoOf1WGGlr+h46TBYRtrmMpXZDXrfNJU=
X-Google-Smtp-Source: ACHHUZ5MRFOSMNcNCKYwlXkWuwntwHnqjREgJzknvYFm+YkCV6mZqaFELARuxfiKVVjqkkMQEoALHA==
X-Received: by 2002:a05:6a20:1611:b0:114:7637:3451 with SMTP id l17-20020a056a20161100b0011476373451mr252620pzj.37.1686291494920;
        Thu, 08 Jun 2023 23:18:14 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902e9c400b001b04a6707d3sm2404789plk.141.2023.06.08.23.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 23:18:14 -0700 (PDT)
Date:   Fri, 9 Jun 2023 11:48:12 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        erik.schilling@linaro.org
Subject: Re: [libgpiod][bug] building rust bindings requires clang headers
Message-ID: <20230609061812.4haoqdyinsp47zet@vireshk-i7>
References: <ZIKQVol59uXI5PyI@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIKQVol59uXI5PyI@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09-06-23, 10:37, Kent Gibson wrote:
> 
> When trying to build the libgpiod rust bindings on my Debian bullseye VM I get:
> 
>    Compiling gpiosim-sys v0.1.0 (/home/dev/libgpiod/bindings/rust/gpiosim-sys)
> error: failed to run custom build command for `gpiosim-sys v0.1.0 (/home/dev/libgpiod/bindings/rust/gpiosim-sys)`
> 
> Caused by:
>   process didn't exit successfully: `/home/dev/libgpiod/bindings/rust/target/release/build/gpiosim-sys-dfa257ecee3f0e2e/build-script-build` (exit status: 101)
>   --- stdout
>   cargo:rerun-if-changed=../../../tests/gpiosim/gpiosim.h
> 
>   --- stderr
>   ../../../tests/gpiosim/gpiosim.h:7:10: fatal error: 'stdbool.h' file not found
>   thread 'main' panicked at 'Unable to generate bindings: ClangDiagnostic("../../../tests/gpiosim/gpiosim.h:7:10: fatal error: 'stdbool.h' file not found\n")', gpiosim-sys/build.rs:27:10
>   note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
> 
> The source of the error appears to be bindgen using libclang to parse
> the gpiosim header, and that failing if the requisite headers are not
> installed.
> 
> If I install them:
> 
> apt install libclang-common-11-dev
> 
> the build passes.
> 
> Can a dependency be added to the autotools configuration to check for
> the availability of those headers if building the rust bindings?

I am not very experienced with autotools, but won't something like this help ?

AC_CHECK_HEADERS([stdbool.h], [], [HEADER_NOT_FOUND_LIB([stdbool.h])])

> I would add it myself, but I'm not sure how - or if there is some better
> solution.
> The configure.ac already has a AC_HEADER_STDBOOL, but that checks for
> the gcc headers, not clang.

-- 
viresh
