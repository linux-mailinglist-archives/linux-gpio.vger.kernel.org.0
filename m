Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFE0728FDC
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 08:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237322AbjFIGVm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 02:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjFIGVd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 02:21:33 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FBD13589
        for <linux-gpio@vger.kernel.org>; Thu,  8 Jun 2023 23:21:23 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-394c7ba4cb5so316943b6e.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jun 2023 23:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686291681; x=1688883681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cy+27P55xRA0obic6vPUant/7/HkPGfFf59TKuo+Eas=;
        b=MT6J2iWXOWCQ+/2XMptoeq9SNJ3MRMZnJP5Pct4dfrd/ummjFE7fpFuFwtAXT/pAA/
         aKJK27LHMI+L3uKjHukS3DYDmwNcHQsgwVU4vkFHT8Btm9i1wxWfs43/F1MKpXRD3rNF
         3s74zeJ4TaBQpr7el0XyemywVAI8zfarp5UEI+Z2HJpgW0eAaqZ0vYyJZy/1VoP9RpUB
         TgtnVGHwLYRsafbm3RxDumkLArmx2+bj/2EUYdYIuLkIYMW9tEyaNVfs+hYv4RCnDKH8
         vjsbML5BipZUNHGkZSX8uPgfnGKiw+zEFhbo78/hXWzxNGG/DVmFbn1Xwylupp1P1Avb
         945Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686291681; x=1688883681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cy+27P55xRA0obic6vPUant/7/HkPGfFf59TKuo+Eas=;
        b=M/SzyMjlzaDspNET+vkGOEbP78kk2k+4mBPfBYAXq3kS3qBlkfxcRAoDAXsl54PY2K
         NEOY+bRYTfWvXV5C6cJlN0xP6ip+8Dl7gvFyIXPWNPOsSVYP4n91ZdavwKeM10e29TXQ
         Yu9KdMJJ2DmUijR+PYup8jwnKhCKYNFh0OTJy8U7GNGg2cWCVxiDYfyTt78/LKtOnECR
         16USMgPhXaUsYiogv8VHb8kshT9EU76sI5WVVLNCURZA9u3TZLjnGloU8rsXI/nMSc0/
         GwvBnN7QnLQXog1Ppj2DNYxm5eo3xX6mBWFQMIEpk5CkzGnHOdZSDj6cmL05RCxCBb+M
         Y3yw==
X-Gm-Message-State: AC+VfDxjSHmBV6pFgwV4pBJL8vOWQjnfDTRVkJRF0MXSLvhXA384a5oe
        BGHQpDlu9rPNmvbSDBMy3TE=
X-Google-Smtp-Source: ACHHUZ6ueNscKSeWMlhkCGFSxlG+iW8lZtEdWtLfOUeQopQhBWDZxm6c0UGKEbac9Ky9BGY7Tb+26w==
X-Received: by 2002:a54:4604:0:b0:397:fbe7:a111 with SMTP id p4-20020a544604000000b00397fbe7a111mr618946oip.58.1686291680989;
        Thu, 08 Jun 2023 23:21:20 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id h126-20020a636c84000000b0050be8e0b94csm2134711pgc.90.2023.06.08.23.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 23:21:20 -0700 (PDT)
Date:   Fri, 9 Jun 2023 14:21:15 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        erik.schilling@linaro.org
Subject: Re: [libgpiod][bug] building rust bindings requires clang headers
Message-ID: <ZILE258m92XrBvNP@sol>
References: <ZIKQVol59uXI5PyI@sol>
 <20230609061812.4haoqdyinsp47zet@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609061812.4haoqdyinsp47zet@vireshk-i7>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 09, 2023 at 11:48:12AM +0530, Viresh Kumar wrote:
> On 09-06-23, 10:37, Kent Gibson wrote:
> > 
> > When trying to build the libgpiod rust bindings on my Debian bullseye VM I get:
> > 
> >    Compiling gpiosim-sys v0.1.0 (/home/dev/libgpiod/bindings/rust/gpiosim-sys)
> > error: failed to run custom build command for `gpiosim-sys v0.1.0 (/home/dev/libgpiod/bindings/rust/gpiosim-sys)`
> > 
> > Caused by:
> >   process didn't exit successfully: `/home/dev/libgpiod/bindings/rust/target/release/build/gpiosim-sys-dfa257ecee3f0e2e/build-script-build` (exit status: 101)
> >   --- stdout
> >   cargo:rerun-if-changed=../../../tests/gpiosim/gpiosim.h
> > 
> >   --- stderr
> >   ../../../tests/gpiosim/gpiosim.h:7:10: fatal error: 'stdbool.h' file not found
> >   thread 'main' panicked at 'Unable to generate bindings: ClangDiagnostic("../../../tests/gpiosim/gpiosim.h:7:10: fatal error: 'stdbool.h' file not found\n")', gpiosim-sys/build.rs:27:10
> >   note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
> > 
> > The source of the error appears to be bindgen using libclang to parse
> > the gpiosim header, and that failing if the requisite headers are not
> > installed.
> > 
> > If I install them:
> > 
> > apt install libclang-common-11-dev
> > 
> > the build passes.
> > 
> > Can a dependency be added to the autotools configuration to check for
> > the availability of those headers if building the rust bindings?
> 
> I am not very experienced with autotools, but won't something like this help ?
> 
> AC_CHECK_HEADERS([stdbool.h], [], [HEADER_NOT_FOUND_LIB([stdbool.h])])
> 

I think that is what the AC_HEADER_STDBOOL already does - but that
detects the gcc header, and the additional check needs to be for the clang
header.

Unless you can convince clang to use the gcc headers?

Cheers,
Kent.

> > I would add it myself, but I'm not sure how - or if there is some better
> > solution.
> > The configure.ac already has a AC_HEADER_STDBOOL, but that checks for
> > the gcc headers, not clang.
> 
> -- 
> viresh
