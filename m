Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27E617437EC
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 11:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbjF3JIQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 05:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231315AbjF3JIO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 05:08:14 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7427D10D5
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 02:08:13 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-668709767b1so1079092b3a.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 02:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688116093; x=1690708093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pb9hroM4XzjCWVRxVfHJDaXbF7nLF/hYElfqw6/m0yY=;
        b=gtQ7ta+EgH0G4kHZBlN79gI/PTzYsuspWPHPZgredCScTGzTDLvBmhD9/CCLlG8Avv
         5P6TXQN0UBQs51gxIA2wZEqZme9LB5jwGUshZ1eVkpdizRxWutrACPaKbtrzH0w38uzh
         1I2gnI+dVhlJWhqjQWmFKGx7JLWYT+24Zz7zTKpU0nf7DqQxMT2lPFlbPRKeQik9UQpV
         GgYYO2Dc0cVGpSz9ahh+0ysJekbLX9WNvza8Tcy74sJkB3aesiDP6MIvkkYoF6RIVFla
         +cdgEpnTLrqsNZERciYGsF/haRol81AA30DLbkpNTNILjNBM8OvkpObgvDBo++3Ri4rr
         C3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688116093; x=1690708093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pb9hroM4XzjCWVRxVfHJDaXbF7nLF/hYElfqw6/m0yY=;
        b=NrRlQ5WEd1EAgIxnEVPmc/Oqqvwhgtz7TpmGHN0VNJXeevDVkgRZZRkPA8Z0I8Ydmz
         Y/NfJnETZzHo448ejceSdQjB4O2AQ8IJHnh28IKnTDTT1rNG40faX/LmKWpykqGvoDtu
         O3TSGl/6r5/tHRFc+/2J7MxsKq0fnfEs0iKPNmZfgrBXKO3T4saNLni6r/T0q/Ym0v+v
         emNqckJB+L7/WBIGhyfkeRBbwG4SYCQAIOSjr5iPESscLqAP11ckjIhVRCx6s6WzCDU/
         OVNJT13v1hd9U8qrq2+AIuxPCHV3AzYOvkiQFy5JoNK1oADot6H86GOAK7MVV1qXGpby
         LGiQ==
X-Gm-Message-State: ABy/qLZDHyPGGZ9QvGm9QBsXlK8iXBgq0tKTFhMxS00312tQDKKIodBH
        8Wq8tpWYgtMSWlBD2Txh0zUxe3c+PGY=
X-Google-Smtp-Source: APBJJlE1lMmwRlr6ajb/78a6FCQ/sizl0LhxcaqIUGbAplzQCv2vYudA5MBrVMaEAbgAPjRH7xyWQA==
X-Received: by 2002:a05:6a00:3983:b0:64f:aea5:7b49 with SMTP id fi3-20020a056a00398300b0064faea57b49mr2300227pfb.17.1688116092648;
        Fri, 30 Jun 2023 02:08:12 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id t18-20020aa79392000000b0067e985d2526sm5085789pfe.149.2023.06.30.02.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 02:08:12 -0700 (PDT)
Date:   Fri, 30 Jun 2023 17:08:07 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH libgpiod 4/4] bindings: rust: clippy: silence
 false-positive on iterator
Message-ID: <ZJ6bd8+oDbyX06rp@sol>
References: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
 <20230629-clippy-v1-4-9ff088713c54@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629-clippy-v1-4-9ff088713c54@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


For future reference, the subject line should be "[libgpiod][PATCH...",
as per the README.
Makes it easier to filter visually, if nothing else.

On Thu, Jun 29, 2023 at 01:09:02PM +0200, Erik Schilling wrote:
> This was fixed, but it is not in stable yet.
> 

This is not a good checkin comment.
State what the problem is and how the patch addresses it.

Same applies to other patches in the series - but I have other comments
on this one, so raising it here.

> Tested build on x86_64, armv7hf, aarch64.
> 

When you say "Tested build", do you mean just compile/clippy, or have you
actually run tests?

Either way, not sure if this should go in the checkin comment - it is
generally implied by the Signed-off that you've tested it to your
satisfaction.
No problem with a more detailed description of how you've tested in
the cover letter.

> Reported-by: Kent Gibson <warthog618@gmail.com>
> Link: https://lore.kernel.org/r/20230612154055.56556-1-warthog618@gmail.com
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
>  bindings/rust/libgpiod/src/event_buffer.rs | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
> index b79e9ea..2e4bfd3 100644
> --- a/bindings/rust/libgpiod/src/event_buffer.rs
> +++ b/bindings/rust/libgpiod/src/event_buffer.rs
> @@ -54,6 +54,9 @@ impl<'a> Iterator for Events<'a> {
>      }
>  
>      fn next(&mut self) -> Option<Self::Item> {
> +        // clippy false-positive, fixed in next clippy release:
> +        // https://github.com/rust-lang/rust-clippy/issues/9820
> +        #[allow(clippy::iter_nth_zero)]
>          self.nth(0)
>      }
>  }
> 

Specify the release in absolute terms, not "next clippy release".

Other than those nits, I'm good with the actual changes in the series
(checked with clippy and running tests on a variety of 32 and 64bit
platforms and compiler versions back to 1.60)

(I am seeing this one test failure on arm32, but that doesn't seem to be related
to this patch:
---- request_config::verify::default stdout ----
thread 'main' panicked at 'assertion failed: `(left == right)`
  left: `OperationFailed(RequestConfigGetConsumer, Errno { code: 2, description: Some("No such file or directory") })`,
 right: `OperationFailed(RequestConfigGetConsumer, Errno { code: 0, description: Some("Success") })`', libgpiod/tests/request_config.rs:18:13
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace

Not sure if that is a genuine bug or something funky in my build.)

Cheers,
Kent.
