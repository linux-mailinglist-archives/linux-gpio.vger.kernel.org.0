Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4182270ED83
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 08:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239535AbjEXGDt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 02:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbjEXGDs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 02:03:48 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB19186
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 23:03:45 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d293746e0so526138b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 23:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684908224; x=1687500224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w2w35PmbXTvK0kpAcKNNiTQN5D/o5v8hLFgQkAj+LXk=;
        b=rQR4c5HD+/A7NtCSObbZtZDYJ40EhApdPeqqtsGSfgJa257uZT//8hPIfiuGMUhxuJ
         Y1iDyYG0VIGhRpE2jjzmBdrVFzFFGe6obYujevkBkh6CJKH2nNJFp6u1DhPEA6juv34+
         YDRBzlN8UsAN9VAdqZwaZWKv982XD97MIVZvEgqj17QLan2jGSIs8+3H1Qr1rDhroqxC
         9XiWiJcjlEaPkdGj7qm7V/EAIBKY6x/23sY9RQZy4haUusQT1I6PwOBwBEZ1LYcSeU+W
         OfNzcpWIREERSKgeQq/W5kKOEo1pO8fdMkitdwm6IIecNDNthLl4ZOtmiUFQ3piREbRj
         dX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684908224; x=1687500224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2w35PmbXTvK0kpAcKNNiTQN5D/o5v8hLFgQkAj+LXk=;
        b=OGAPeUaIZA7dIQpcJjlTYkkIbPcT+oJ7NvGZfI6bmtbJVHXVkxNVubJ0DHCjAS/Av8
         jOPMONPHt94XECi7dK4Om5LH6pZ4OuwAH5gCqcaR1IZl2P21/iBFrl5ZwtaGXSQPE7TG
         Je52gVlZYqXK9DjyFkQzWDEyQd1CAXr9gxOTwJY8GZ2/vbUiN4wJcND0/j4oDECdnvKU
         UGIHqjaFeGLuMj6hErMfUU72cmQib/tkG0BJLv9H2ebclAtG58RF88nc/MbAKU3e6z0c
         bVbvSS23COi8NKITbCI7Z8bu7HV54QdVCg6/ETAoAbsUeEPuBrLbIxvLG5hrH8lN4pRD
         7a4g==
X-Gm-Message-State: AC+VfDyOIEzNbATUhcWWbpKSCeeyIlg2IVvZJxbyvecadQEjgCci5Nnc
        wbn3dvvMUKqSx+D4SIt1oJOfDA==
X-Google-Smtp-Source: ACHHUZ4xpopW1t7aygLMOQZsGhcROObYhGMRKiCfniWudkRUTdalLjXIEasO9IMrfodAolNsEf9nmw==
X-Received: by 2002:a05:6a21:796:b0:10d:b160:3d4f with SMTP id mg22-20020a056a21079600b0010db1603d4fmr279848pzb.38.1684908224555;
        Tue, 23 May 2023 23:03:44 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id 63-20020a17090a0fc500b0024e149fe03dsm588534pjz.25.2023.05.23.23.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 23:03:43 -0700 (PDT)
Date:   Wed, 24 May 2023 11:33:41 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH libgpiod RFC 0/3] bindings: rust: allow packaging of
 libgpiod-sys
Message-ID: <20230524060341.khmsd2lw32u3jxsc@vireshk-i7>
References: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23-05-23, 13:25, Erik Schilling wrote:
> As of now, the Rust bindings are only consumable as git dependencies
> (and even then come with some restrictions when wanting to control
> the build and linkage behaviour).
> 
> This series does some (hopefully) cleanup and then proposes a change
> in how the Rust bindings are built and linked.
> 
> Since the changes may require people hacking on the bindings to set some
> additional environment variables (at least if they want to avoid running
> make install), I am sending this as an RFC in order
> to hear opinions.
> 
> For gpiosim-sys the situation is slightly more complex. Right now,
> libgpiosim installs without a pkg-config. If it is desireable to add
> one, that could be done and the same mechanism could be used. Otherwise,
> if packaging that lib is desirable (it looks like it?), we could either
> still query for libgpiod (and hope that the linker and include paths are
> matching) or need some other way to acquire the linker and include paths
> (and flags).
> 
> So... The open questions:
> - Is this OK at all? Are people depending on this building against
>   relative paths?

Not sure if the build of the libgpiod git repo depends on that relative path,
did you try to do `make` in the libgpiod directory ? Like:

$ ./autogen.sh --enable-tools=yes --enable-bindings-rust --enable-examples --enable-tests; make

> - What to do with gpiosim-sys (see above)?

The only user for the cargo tests for libgpiod stuff is for the vhost-device
crate with the help of rust-vmm containers. I am installing libgpiod there
currently and so it works, not sure of how it may be required to be used later
on though.

> - Is there interest into getting this published on crates.io after
>   packaging is fixed?

Yes.

-- 
viresh
