Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFE4743B30
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 13:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbjF3Lyu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 07:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232858AbjF3Lyr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 07:54:47 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC391EE
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:54:42 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b801e6ce85so11497685ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688126082; x=1690718082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7x9ANTj/Kaoj2qB8QPhHY0TQ1r2cHsLxVGC+nvMhijs=;
        b=nlLmHxZnm1w3r+qSN0kBPy9JdyWlSdxDUM5PJxYh4Ykc9MiaOuRJTq1Ut68T4ClxpJ
         1UtGBMrTrNycrZqCYlXP8CNWGjvRffWUfe5u0Ji8kshettU9ehmJoTkSOuHzaiBFis8k
         lpKtCjU6gTktR1rVBr9Z4ElpgnKd+nnVLCrstpSf8we+4pJJI/1nOzu+TNrzOOmgx5Tk
         R5MhaeOy/qTMX0m8XZLFUb8jvQ42oQBRJzg7bs8nqfbUU+d/7GqeRoK7dvKn071wpPXy
         JS7QYhszNtVwqCs1/7QSEyiXkf99t7WFNnmZgm9IrM1PW4Pa6ta+4jssr0oPyR1287H4
         4bFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688126082; x=1690718082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7x9ANTj/Kaoj2qB8QPhHY0TQ1r2cHsLxVGC+nvMhijs=;
        b=keJBy0cL1/AevSJJdtD5HFNtHjdNRu27wbMhTT0lBGC027UBdlKnuRWYWo2gjO9H6l
         cKSZx+qwNMxxfctLeRkSg6r6w8n+8xOOZ4IuSEnAY75LNbIFYgimPYI5VyDc+rYAt8EF
         Hi2EylxpMPbNaZyWksB5HeVLYspaq695cUep7FLF7w8ZixwlmTJjdJpNoT8sE6qjPFwa
         O45xpenuoEdlljFPC3tJYOPB1qgNCWL6kI8CUOvmIkGLq48LZ7ZFY7kPlFdbsShcIKb9
         cgtqUXObbK+LkiY9c4KM/TAr9Mh9x9J+w3mvv/3XfokWbFHCWRV2wLZK42N5HvVDL5xT
         9IYg==
X-Gm-Message-State: AC+VfDyakwuqOFsnpKfevZfFYzPlfTrj4bXTGS0JAF4fKUr/p4lbGwZw
        I9YGfKYSh1hNHPbWMccmXqD1vW6OKAs=
X-Google-Smtp-Source: ACHHUZ7nFFQYcHRzBiSaEcMCYRUwNjSg+IPnje/mrjAywEPNlJ+Luzdx2QNIlCWPUxw0xas3xBP0OQ==
X-Received: by 2002:a17:903:2308:b0:1b8:1636:b26 with SMTP id d8-20020a170903230800b001b816360b26mr10471308plh.3.1688126082099;
        Fri, 30 Jun 2023 04:54:42 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id f13-20020a170902ce8d00b001b80de83b10sm7697216plg.301.2023.06.30.04.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 04:54:41 -0700 (PDT)
Date:   Fri, 30 Jun 2023 19:54:37 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod][PATCH v2 0/4] bindings: rust: clippy: fix warnings
Message-ID: <ZJ7CfaI4n3zeVNyW@sol>
References: <20230630-clippy-v2-0-f44447925ad6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630-clippy-v2-0-f44447925ad6@linaro.org>
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

On Fri, Jun 30, 2023 at 01:18:43PM +0200, Erik Schilling wrote:
> This follows up on my promise on Kent's series [1] to look into whether
> these casts are needed or not. Most are not, a few are false-positives.
> 
> I also explored some shunit2 based test-script to automate the testing,
> but that became ugly with linking issue and needs me to revisit it
> another time. So this only sends the clippy fixes for now.
> 
> Tested the build (lib + examples + test) and clippy report on:
> - Fedora 38 x86_64
> - Fedora 38 aarch64
> - Debian 12 armv7hf
> 
> Test execution (cargo test) was tested on:
> - Fedora 38 x86_64
> - Fedora 38 aarch64
> 
> Could not execute tests on armv7hf due to lack of suitable test
> environment.
> 
> [1] https://lore.kernel.org/r/20230612154055.56556-1-warthog618@gmail.com
> 
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Kent Gibson <warthog618@gmail.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> 

Reviewed-by: Kent Gibson <warthog618@gmail.com>

for the series.

> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>

Not sure you need to sign-off the cover letter.
e.g. `git format-patch --cover-letter -s` only signs off the patches,
not the cover letter.
Not that it matters - just for future reference.

Good to see the end all those clippy warnings.

Cheers,
Kent.

> ---
> Changes in v2:
> - Changed cover letter title to active language
> - Improved commit messages (hopefully)
> - Elaborated what was built and tested
> - Resent with hacked b4 for proper [libgpiod] tag
> - Link to v1: https://lore.kernel.org/r/20230629-clippy-v1-0-9ff088713c54@linaro.org
> 
> ---
> Erik Schilling (4):
>       bindings: rust: clippy: drop unnecessary casts
>       bindings: rust: clippy: silence false-positives on casts
>       bindings: rust: clippy: drop unneeded conversions
>       bindings: rust: clippy: silence false-positive on iterator
> 
>  bindings/rust/gpiosim-sys/src/lib.rs         | 2 +-
>  bindings/rust/gpiosim-sys/src/sim.rs         | 4 ++--
>  bindings/rust/libgpiod/src/chip.rs           | 2 +-
>  bindings/rust/libgpiod/src/edge_event.rs     | 2 +-
>  bindings/rust/libgpiod/src/event_buffer.rs   | 7 +++++--
>  bindings/rust/libgpiod/src/info_event.rs     | 2 +-
>  bindings/rust/libgpiod/src/lib.rs            | 2 +-
>  bindings/rust/libgpiod/src/line_config.rs    | 4 ++--
>  bindings/rust/libgpiod/src/line_info.rs      | 3 +++
>  bindings/rust/libgpiod/src/line_request.rs   | 8 ++++----
>  bindings/rust/libgpiod/src/line_settings.rs  | 5 ++++-
>  bindings/rust/libgpiod/src/request_config.rs | 2 +-
>  bindings/rust/libgpiod/tests/chip.rs         | 2 +-
>  13 files changed, 27 insertions(+), 18 deletions(-)
> ---
> base-commit: 4510231c95a087f58a155cf74164e403e1e0584f
> change-id: 20230629-clippy-890c541c6d09
> 
> Best regards,
> -- 
> Erik Schilling <erik.schilling@linaro.org>
> 
